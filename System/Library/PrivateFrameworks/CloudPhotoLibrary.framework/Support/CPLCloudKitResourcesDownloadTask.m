@interface CPLCloudKitResourcesDownloadTask
- (CPLCloudKitResourcesDownloadTask)initWithController:(id)a3 completionHandler:(id)a4;
- (NSArray)downloadTasks;
- (id)_cloudKitScopeForTask:(id)a3;
- (id)_downloadOperationWithRecordIDsAndTasks:(id)a3 keys:(id)a4 perRecordProgressBlock:(id)a5 perRecordCompletionBlock:(id)a6 completionBlock:(id)a7;
- (id)_recordIDForResourcesWithItemScopedIdentifier:(id)a3;
- (id)completionHandler;
- (void)_downloadCurrentGroup;
- (void)_downloadNextGroup;
- (void)_downloadNextOperationType;
- (void)_finishRemainingTasksWithError:(id)a3;
- (void)cancelDownloadTask:(id)a3;
- (void)runOperations;
- (void)setDownloadTasks:(id)a3;
@end

@implementation CPLCloudKitResourcesDownloadTask

- (CPLCloudKitResourcesDownloadTask)initWithController:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPLCloudKitResourcesDownloadTask;
  v7 = [(CPLCloudKitTransportTask *)&v11 initWithController:a3];
  if (v7)
  {
    id v8 = [v6 copy];
    id completionHandler = v7->_completionHandler;
    v7->_id completionHandler = v8;

    [(CPLCloudKitTransportTask *)v7 setIsMetadata:0];
    [(CPLCloudKitTransportTask *)v7 setBoostable:0];
  }

  return v7;
}

- (void)setDownloadTasks:(id)a3
{
  id v4 = a3;
  v5 = (NSArray *)[v4 copy];
  downloadTasks = self->_downloadTasks;
  self->_downloadTasks = v5;

  v7 = (CPLRecordTargetMapping *)objc_alloc_init((Class)CPLRecordTargetMapping);
  targetMapping = self->_targetMapping;
  v35 = self;
  self->_targetMapping = v7;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v36 objects:v48 count:16];
  id obj = v9;
  if (v10)
  {
    id v11 = v10;
    v34 = 0;
    v12 = 0;
    uint64_t v13 = *(void *)v37;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v16 = [v15 transportScopeMapping];
        v17 = (void *)v16;
        if (v12)
        {
          [v12 updateWithTransportScopeMapping:v16];
        }
        else
        {
          v12 = (void *)v16;
        }
        v18 = v35->_targetMapping;
        v19 = [v15 target];
        v20 = [v15 cloudResource];
        v21 = [v20 itemScopedIdentifier];
        [(CPLRecordTargetMapping *)v18 setTarget:v19 forRecordWithScopedIdentifier:v21];

        v22 = [v15 cloudRecord];

        if (!v22)
        {
          v23 = [v15 cloudResource];
          v24 = [v23 identity];
          v25 = [v24 fingerPrint];

          id v26 = v34;
          if (!v34) {
            id v26 = objc_alloc_init((Class)NSMutableSet);
          }
          v27 = [v15 cloudResource];
          v28 = [v27 itemScopedIdentifier];
          v34 = v26;
          [v26 addObject:v28];
        }
      }
      id v9 = obj;
      id v11 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v11);

    if (v12) {
      [(CPLCloudKitTransportTask *)v35 setTransportScopeMapping:v12];
    }
  }
  else
  {

    v12 = 0;
    v34 = 0;
  }
  if (!_CPLSilentLogging)
  {
    v29 = sub_10009202C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [v9 count];
      id v31 = [v34 count];
      v32 = [(CPLRecordTargetMapping *)v35->_targetMapping targetDescriptions];
      *(_DWORD *)buf = 134218754;
      id v41 = v30;
      __int16 v42 = 2048;
      id v43 = v31;
      __int16 v44 = 2112;
      v45 = v32;
      __int16 v46 = 2112;
      v47 = v12;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Will download %lu tasks (%lu missing placeholders) using:\n%@\nand:\n%@", buf, 0x2Au);

      id v9 = obj;
    }
  }
}

- (void)cancelDownloadTask:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100092114;
  v4[3] = &unk_100276018;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(CPLCloudKitTransportTask *)v5 dispatchAsync:v4];
}

- (void)_finishRemainingTasksWithError:(id)a3
{
  id v5 = a3;
  if (!v5) {
    sub_1001CCFC0((uint64_t)a2, (uint64_t)self);
  }
  remainingTasksPerOperationType = self->_remainingTasksPerOperationType;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009234C;
  v8[3] = &unk_100279BC0;
  id v9 = v5;
  id v7 = v5;
  [(NSMutableDictionary *)remainingTasksPerOperationType enumerateKeysAndObjectsUsingBlock:v8];
  (*((void (**)(void))self->_completionHandler + 2))();
}

- (id)_downloadOperationWithRecordIDsAndTasks:(id)a3 keys:(id)a4 perRecordProgressBlock:(id)a5 perRecordCompletionBlock:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (CPLCloudKitUseGateKeeperForOperationType(self->_currentOperationType))
  {
    uint64_t v17 = CPLCloudKitGateKeeperDefaultDownloadType;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100092864;
    v43[3] = &unk_100279BE8;
    id v44 = v15;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100092934;
    v41[3] = &unk_100276D38;
    id v42 = v16;
    id v18 = v16;
    id v19 = v15;
    id v20 = +[CPLCKResourceDownloadOperation downloadOperationWithRecordIDsAndTasks:v12 keys:v13 downloadType:v17 perRecordProgressBlock:v14 perRecordCompletionBlock:v43 completionBlock:v41];

    id v21 = v44;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      v22 = sub_10009202C();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [v12 allKeys];
        *(_DWORD *)buf = 138412546;
        v47 = v23;
        __int16 v48 = 2112;
        id v49 = v13;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Will use legacy downloads for %@ (%@)", buf, 0x16u);
      }
    }
    id v24 = objc_alloc((Class)CKFetchRecordsOperation);
    v25 = [v12 allKeys];
    id v20 = [v24 initWithRecordIDs:v25];

    id v26 = sub_1000967A4((uint64_t)v13);
    v27 = sub_100096768((uint64_t)v13);
    v28 = sub_100096744((uint64_t)v13);
    v45[0] = v27;
    v45[1] = v26;
    v45[2] = v28;
    v29 = +[NSArray arrayWithObjects:v45 count:3];
    [v20 setDesiredKeys:v29];

    [v20 setShouldFetchAssetContent:1];
    [v20 setPerRecordProgressBlock:v14];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10009299C;
    v36[3] = &unk_100279C10;
    id v37 = v26;
    id v38 = v27;
    id v39 = v28;
    id v40 = v15;
    id v30 = v28;
    id v21 = v27;
    id v18 = v26;
    id v31 = v15;
    [v20 setPerRecordCompletionBlock:v36];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100092A84;
    v34[3] = &unk_100276E00;
    id v35 = v16;
    id v32 = v16;
    [v20 setFetchRecordsCompletionBlock:v34];
  }
  return v20;
}

- (id)_cloudKitScopeForTask:(id)a3
{
  id v5 = a3;
  id v6 = [v5 cloudResource];
  id v7 = [v6 itemScopedIdentifier];

  id v8 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v7];
  id v9 = [v8 resourceScopedIdentifier];
  id v10 = [v9 scopeIdentifier];
  id v11 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v10];

  if (!v11)
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_10009202C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = [v8 resourceScopedIdentifier];
        id v15 = [v5 cloudResource];
        *(_DWORD *)buf = 138412546;
        id v21 = v14;
        __int16 v22 = 2112;
        v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Impossible to find cloudkit scope for %@ (%@)", buf, 0x16u);
      }
    }
    id v16 = +[NSAssertionHandler currentHandler];
    uint64_t v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCloudKitResourcesDownloadTask.m"];
    id v18 = [v8 resourceScopedIdentifier];
    id v19 = [v5 cloudResource];
    [v16 handleFailureInMethod:a2, self, v17, 204, @"Impossible to find cloudkit scope for %@ (%@)", v18, v19 object file lineNumber description];

    abort();
  }

  return v11;
}

- (id)_recordIDForResourcesWithItemScopedIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v5];
  id v7 = [v6 resourceScopedIdentifier];
  id v8 = [v7 scopeIdentifier];
  id v9 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v8];

  if (!v9)
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_10009202C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v7;
        __int16 v18 = 2112;
        id v19 = v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Impossible to find cloudkit scope for %@ (%@)", buf, 0x16u);
      }
    }
    id v14 = +[NSAssertionHandler currentHandler];
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCloudKitResourcesDownloadTask.m"];
    [v14 handleFailureInMethod:a2, self, v15, 212, @"Impossible to find cloudkit scope for %@ (%@)", v7, v5 object file lineNumber description];

    abort();
  }
  id v10 = [v7 identifier];
  id v11 = [v9 recordIDWithRecordName:v10];

  return v11;
}

- (void)_downloadCurrentGroup
{
  id v49 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v49];
  id v4 = v49;
  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_10009202C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        downloadGroup = self->_downloadGroup;
        *(_DWORD *)buf = 138412290;
        v51 = downloadGroup;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will download %@", buf, 0xCu);
      }
    }
    id v7 = [(_CPLCloudKitDownloadGroup *)self->_downloadGroup propertyKeys];
    id v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[_CPLCloudKitDownloadGroup countOfDownloadTasks](self->_downloadGroup, "countOfDownloadTasks"));
    id v9 = [[CPLCloudKitDownloadResourcesOperationContext alloc] initWithResourceType:[(_CPLCloudKitDownloadGroup *)self->_downloadGroup resourceType]];
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    id v11 = self->_downloadGroup;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100093490;
    v43[3] = &unk_100279C38;
    id v12 = v9;
    id v44 = v12;
    v45 = self;
    id v13 = v10;
    id v46 = v13;
    id v14 = v8;
    id v47 = v14;
    id v15 = v7;
    id v48 = v15;
    [(_CPLCloudKitDownloadGroup *)v11 enumerateRecordScopedIdentifiersAndTasksWithBlock:v43];
    id v16 = objc_alloc_init(CPLCloudKitDownloadMetric);
    -[CPLCloudKitDownloadMetric setRequestedItemCount:](v16, "setRequestedItemCount:", [v14 count]);
    [(CPLCloudKitDownloadMetric *)v16 setExpectedSize:[(_CPLCloudKitDownloadGroup *)self->_downloadGroup downloadSize]];
    [(CPLCloudKitTransportTask *)self associateMetric:v16];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10009367C;
    v40[3] = &unk_100279C60;
    v40[4] = self;
    id v41 = v13;
    id v42 = v12;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10009387C;
    v36[3] = &unk_100279CB0;
    void v36[4] = self;
    id v33 = v41;
    id v37 = v33;
    uint64_t v17 = v42;
    id v38 = v17;
    id v39 = v16;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100093CA0;
    v34[3] = &unk_100276128;
    void v34[4] = self;
    __int16 v18 = v39;
    id v35 = v18;
    id v19 = [(CPLCloudKitResourcesDownloadTask *)self _downloadOperationWithRecordIDsAndTasks:v14 keys:v15 perRecordProgressBlock:v40 perRecordCompletionBlock:v36 completionBlock:v34];
    if ([(CPLCloudKitTransportTask *)self foreground]
      && [(_CPLCloudKitDownloadGroup *)self->_downloadGroup shouldBoostPriority])
    {
      [v19 setQueuePriority:4];
    }
    id v20 = objc_msgSend((id)objc_opt_class(), "allowsCellularForDownloadOperationOfSize:isForeground:isHighPriority:", -[_CPLCloudKitDownloadGroup downloadSize](self->_downloadGroup, "downloadSize"), -[CPLCloudKitTransportTask foreground](self, "foreground"), -[_CPLCloudKitDownloadGroup isHighPriority](self->_downloadGroup, "isHighPriority"));
    if (v20 && !_CPLSilentLogging)
    {
      id v21 = sub_10009202C();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        +[NSByteCountFormatter stringFromByteCount:[(_CPLCloudKitDownloadGroup *)self->_downloadGroup downloadSize] countStyle:1];
        id v32 = v18;
        __int16 v22 = (_CPLCloudKitDownloadGroup *)objc_claimAutoreleasedReturnValue();
        id v23 = v15;
        if ([(CPLCloudKitTransportTask *)self foreground]) {
          CFStringRef v24 = @" in foreground";
        }
        else {
          CFStringRef v24 = &stru_10027FEB8;
        }
        unsigned int v25 = [(_CPLCloudKitDownloadGroup *)self->_downloadGroup isHighPriority];
        CFStringRef v26 = @" high priority";
        *(_DWORD *)buf = 138412802;
        v51 = v22;
        if (!v25) {
          CFStringRef v26 = &stru_10027FEB8;
        }
        __int16 v52 = 2112;
        CFStringRef v53 = v24;
        id v15 = v23;
        __int16 v54 = 2112;
        CFStringRef v55 = v26;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Allowing cellular access for resources download for %@%@%@", buf, 0x20u);

        __int16 v18 = v32;
      }
    }
    [(CPLCloudKitTransportTask *)self setAllowsCellular:v20];
    v27 = [(_CPLCloudKitDownloadGroup *)self->_downloadGroup mainSourceBundleIdentifier];
    [(CPLCloudKitTransportTask *)self setSourceBundleIdentifier:v27];

    v28 = self->_downloadGroup;
    v29 = [v19 operationID];
    [(_CPLCloudKitDownloadGroup *)v28 allDownloadsDidStartWithOperationID:v29];

    int64_t currentOperationType = self->_currentOperationType;
    id v31 = [(_CPLCloudKitDownloadGroup *)self->_downloadGroup allSourceBundleIdentifiers];
    [(CPLCloudKitTransportTask *)self launchOperation:v19 type:currentOperationType withContext:v17 sourceBundleIdentifiers:v31];
  }
  else
  {
    [(_CPLCloudKitDownloadGroup *)self->_downloadGroup allDownloadsDidFailWithError:v4];
    [(CPLCloudKitResourcesDownloadTask *)self _finishRemainingTasksWithError:v4];
  }
}

- (void)_downloadNextOperationType
{
  if ([(NSMutableDictionary *)self->_remainingTasksPerOperationType count])
  {
    unsigned __int8 v3 = [(NSMutableDictionary *)self->_remainingTasksPerOperationType allKeys];
    id v7 = [v3 firstObject];

    self->_int64_t currentOperationType = (int64_t)[v7 integerValue];
    id v4 = [(NSMutableDictionary *)self->_remainingTasksPerOperationType objectForKeyedSubscript:v7];
    currentRemainingTasks = self->_currentRemainingTasks;
    self->_currentRemainingTasks = v4;

    [(CPLCloudKitResourcesDownloadTask *)self _downloadNextGroup];
  }
  else
  {
    id v6 = (void (*)(void))*((void *)self->_completionHandler + 2);
    v6();
  }
}

- (void)_downloadNextGroup
{
  id v38 = 0;
  unsigned __int8 v4 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v38];
  id v5 = v38;
  if (v4)
  {
    if ([(NSMutableArray *)self->_currentRemainingTasks count])
    {
      SEL v32 = a2;
      uint64_t v6 = [(NSMutableArray *)self->_currentRemainingTasks firstObject];
      if (v6)
      {
        id v7 = (void *)v6;
        while (1)
        {
          id v33 = [v7 cloudResource];
          unint64_t v8 = +[CPLCloudKitFakeDynamicDerivatives realResourceTypeForResource:](CPLCloudKitFakeDynamicDerivatives, "realResourceTypeForResource:");
          id v9 = [_CPLCloudKitDownloadGroup alloc];
          id v10 = [(CPLCloudKitTransportTask *)self controller];
          id v11 = [v10 defaultSourceBundleIdentifier];
          id v12 = [(CPLCloudKitTransportTask *)self fingerprintContext];
          id v13 = [(_CPLCloudKitDownloadGroup *)v9 initWithResourceType:v8 defaultSourceBundleIdentifier:v11 fingerprintContext:v12];
          downloadGroup = self->_downloadGroup;
          self->_downloadGroup = v13;

          id v15 = [objc_alloc((Class)NSMutableIndexSet) initWithIndex:0];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v16 = self->_currentRemainingTasks;
          id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v34 objects:v41 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = 0;
            uint64_t v20 = *(void *)v35;
            do
            {
              for (i = 0; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v35 != v20) {
                  objc_enumerationMutation(v16);
                }
                __int16 v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                unsigned int v23 = [(_CPLCloudKitDownloadGroup *)self->_downloadGroup addDownloadTask:v22];
                if (v22 == v7 && (v23 & 1) == 0) {
                  sub_1001CD130((uint64_t)v32, (uint64_t)self);
                }
                if (v23) {
                  [v15 addIndex:(char *)i + v19];
                }
              }
              id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v34 objects:v41 count:16];
              v19 += (uint64_t)i;
            }
            while (v18);
          }

          [(NSMutableArray *)self->_currentRemainingTasks removeObjectsAtIndexes:v15];
          CFStringRef v24 = [(_CPLCloudKitDownloadGroup *)self->_downloadGroup propertyKeys];
          if (v24) {
            break;
          }
          if (!_CPLSilentLogging)
          {
            unsigned int v25 = sub_10009202C();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              CFStringRef v26 = self->_downloadGroup;
              *(_DWORD *)buf = 138412290;
              id v40 = v26;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Asked to download unsupported resources: %@", buf, 0xCu);
            }
          }
          v27 = self->_downloadGroup;
          v28 = +[CPLErrors incorrectParametersErrorForParameter:@"resourceType"];
          [(_CPLCloudKitDownloadGroup *)v27 allDownloadsDidFailWithError:v28];

          v29 = self->_downloadGroup;
          self->_downloadGroup = 0;

          id v7 = [(NSMutableArray *)self->_currentRemainingTasks firstObject];
          if (!v7) {
            goto LABEL_22;
          }
        }
      }
LABEL_22:
      if (self->_downloadGroup)
      {
        [(CPLCloudKitResourcesDownloadTask *)self _downloadCurrentGroup];
      }
      else
      {
        if ([(NSMutableArray *)self->_currentRemainingTasks count]) {
          sub_1001CD078((uint64_t)v32, (uint64_t)self);
        }
        [(CPLCloudKitResourcesDownloadTask *)self _downloadNextGroup];
      }
    }
    else
    {
      remainingTasksPerOperationType = self->_remainingTasksPerOperationType;
      id v31 = +[NSNumber numberWithInteger:self->_currentOperationType];
      [(NSMutableDictionary *)remainingTasksPerOperationType removeObjectForKey:v31];

      [(CPLCloudKitResourcesDownloadTask *)self _downloadNextOperationType];
    }
  }
  else
  {
    [(CPLCloudKitResourcesDownloadTask *)self _finishRemainingTasksWithError:v5];
  }
}

- (void)runOperations
{
  if (self->_scopedIdentifiersNeedingPlaceholderRecords) {
    scopedIdentifiersNeedingPlaceholderRecords = self->_scopedIdentifiersNeedingPlaceholderRecords;
  }
  else {
    scopedIdentifiersNeedingPlaceholderRecords = (NSArray *)&__NSArray0__struct;
  }
  targetMapping = self->_targetMapping;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009442C;
  v4[3] = &unk_100279CD8;
  void v4[4] = self;
  v4[5] = a2;
  [(CPLCloudKitTransportTask *)self fetchPlaceholderRecordsForScopedIdentifiers:scopedIdentifiersNeedingPlaceholderRecords targetMapping:targetMapping completionHandler:v4];
}

- (NSArray)downloadTasks
{
  return self->_downloadTasks;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_downloadTasks, 0);
  objc_storeStrong((id *)&self->_additionalPlaceholderRecords, 0);
  objc_storeStrong((id *)&self->_scopedIdentifiersNeedingPlaceholderRecords, 0);
  objc_storeStrong((id *)&self->_targetMapping, 0);
  objc_storeStrong((id *)&self->_currentRemainingTasks, 0);
  objc_storeStrong((id *)&self->_remainingTasksPerOperationType, 0);
  objc_storeStrong((id *)&self->_downloadGroup, 0);
}

@end