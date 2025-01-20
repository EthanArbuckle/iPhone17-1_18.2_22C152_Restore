@interface _CPLCloudKitDownloadGroup
- (BOOL)addDownloadTask:(id)a3;
- (BOOL)cancelDownloadTask:(id)a3;
- (BOOL)hasDownloadTasks;
- (BOOL)isHighPriority;
- (BOOL)shouldBoostPriority;
- (CPLFingerprintContext)fingerprintContext;
- (NSArray)allSourceBundleIdentifiers;
- (NSArray)recordScopedIdentifiers;
- (NSString)defaultSourceBundleIdentifier;
- (NSString)mainSourceBundleIdentifier;
- (NSString)resourceTypeDescription;
- (_CPLCloudKitDownloadGroup)initWithResourceType:(unint64_t)a3 defaultSourceBundleIdentifier:(id)a4 fingerprintContext:(id)a5;
- (double)downloadProgress;
- (id)cloudResourceForRecordWithScopedIdentifier:(id)a3;
- (id)description;
- (id)propertyKeys;
- (unint64_t)countOfDownloadTasks;
- (unint64_t)downloadSize;
- (unint64_t)resourceType;
- (void)allDownloadsDidFailWithError:(id)a3;
- (void)allDownloadsDidStartWithOperationID:(id)a3;
- (void)enumerateRecordScopedIdentifiersAndTasksWithBlock:(id)a3;
- (void)resourceWithRecordScopedIdentifier:(id)a3 didDownloadCKAsset:(id)a4 withOperationType:(int64_t)a5 transcoderVersion:(int64_t)a6 withFingerPrint:(id)a7 andFileUTI:(id)a8;
- (void)resourceWithRecordScopedIdentifier:(id)a3 didFailToDownloadWithError:(id)a4;
- (void)resourceWithRecordScopedIdentifier:(id)a3 didProgress:(double)a4;
- (void)resourceWithRecordScopedIdentifierDidStart:(id)a3 operationID:(id)a4;
@end

@implementation _CPLCloudKitDownloadGroup

- (_CPLCloudKitDownloadGroup)initWithResourceType:(unint64_t)a3 defaultSourceBundleIdentifier:(id)a4 fingerprintContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_CPLCloudKitDownloadGroup;
  v10 = [(_CPLCloudKitDownloadGroup *)&v22 init];
  if (v10)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    tasks = v10->_tasks;
    v10->_tasks = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    resourceSizes = v10->_resourceSizes;
    v10->_resourceSizes = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    downloadedSizes = v10->_downloadedSizes;
    v10->_downloadedSizes = v15;

    v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    sourceBundleIdentifiers = v10->_sourceBundleIdentifiers;
    v10->_sourceBundleIdentifiers = v17;

    v10->_resourceType = a3;
    v19 = (NSString *)[v8 copy];
    defaultSourceBundleIdentifier = v10->_defaultSourceBundleIdentifier;
    v10->_defaultSourceBundleIdentifier = v19;

    objc_storeStrong((id *)&v10->_fingerprintContext, a5);
    v10->_maxDownloadSize = (unint64_t)+[CPLEngineResourceDownloadTask maximumResourceDownloadSizeForResourceType:v10->_resourceType];
  }

  return v10;
}

- (BOOL)addDownloadTask:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 cloudResource];
  if (!v6) {
    sub_1001CD2A8(v5, (uint64_t)a2, (uint64_t)self);
  }
  v7 = (void *)v6;
  if (+[CPLCloudKitFakeDynamicDerivatives realResourceTypeForResource:v6] == self->_resourceType)
  {
    id v8 = [v7 itemScopedIdentifier];
    id v9 = [(NSMutableDictionary *)self->_tasks objectForKeyedSubscript:v8];
    if (v9)
    {
      id v10 = v9;
      [v9 addObject:v5];
    }
    else
    {
      id v12 = [v7 estimatedResourceSize];
      id v13 = v12;
      unint64_t downloadSize = self->_downloadSize;
      unint64_t maxDownloadSize = self->_maxDownloadSize;
      BOOL v16 = maxDownloadSize > downloadSize;
      unint64_t v17 = maxDownloadSize - downloadSize;
      if ((!v16 || v17 < (unint64_t)v12) && [(NSMutableDictionary *)self->_tasks count])
      {
        BOOL v11 = 0;
LABEL_23:

        goto LABEL_24;
      }
      id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v5, 0);
      [(NSMutableDictionary *)self->_tasks setObject:v10 forKeyedSubscript:v8];
      v18 = +[NSNumber numberWithUnsignedLongLong:v13];
      [(NSMutableDictionary *)self->_resourceSizes setObject:v18 forKeyedSubscript:v8];

      self->_downloadSize += (unint64_t)v13;
    }
    v19 = [v5 clientBundleID];
    if (!v19) {
      v19 = self->_defaultSourceBundleIdentifier;
    }
    if (!self->_mainBundleIdentifierIsDefault)
    {
      if ([(NSString *)v19 isEqualToString:self->_defaultSourceBundleIdentifier])
      {
        objc_storeStrong((id *)&self->_mainSourceBundleIdentifier, self->_defaultSourceBundleIdentifier);
        self->_mainBundleIdentifierIsDefault = 1;
      }
      else if (!self->_mainSourceBundleIdentifier)
      {
        objc_storeStrong((id *)&self->_mainSourceBundleIdentifier, v19);
      }
    }
    [(NSMutableSet *)self->_sourceBundleIdentifiers addObject:v19];
    if (self->_highPriority) {
      unsigned __int8 v20 = 1;
    }
    else {
      unsigned __int8 v20 = [v5 isHighPriority];
    }
    self->_highPriority = v20;

    BOOL v11 = 1;
    goto LABEL_23;
  }
  BOOL v11 = 0;
LABEL_24:

  return v11;
}

- (void)allDownloadsDidStartWithOperationID:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_tasks;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[_CPLCloudKitDownloadGroup resourceWithRecordScopedIdentifierDidStart:operationID:](self, "resourceWithRecordScopedIdentifierDidStart:operationID:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), v4, (void)v10);
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)resourceWithRecordScopedIdentifierDidStart:(id)a3 operationID:(id)a4
{
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_tasks objectForKeyedSubscript:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v12 setTransportIdentifier:v6];
        uint64_t v13 = [v12 didStartHandler];
        v14 = (void *)v13;
        if (v13) {
          (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v12);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)resourceWithRecordScopedIdentifier:(id)a3 didProgress:(double)a4
{
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_tasks objectForKeyedSubscript:v6];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = [v13 progressHandler];
        long long v15 = (void *)v14;
        if (v14)
        {
          float v11 = a4;
          (*(void (**)(uint64_t, void *, float))(v14 + 16))(v14, v13, v11);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  long long v16 = [(NSMutableDictionary *)self->_resourceSizes objectForKeyedSubscript:v6];
  [v16 doubleValue];
  if ((unint64_t)(v17 * a4))
  {
    long long v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    [(NSMutableDictionary *)self->_downloadedSizes setObject:v18 forKeyedSubscript:v6];
  }
  else
  {
    [(NSMutableDictionary *)self->_downloadedSizes removeObjectForKey:v6];
  }
}

- (void)resourceWithRecordScopedIdentifier:(id)a3 didDownloadCKAsset:(id)a4 withOperationType:(int64_t)a5 transcoderVersion:(int64_t)a6 withFingerPrint:(id)a7 andFileUTI:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a8;
  v71 = v14;
  if (v14)
  {
    v75 = [v13 fileURL];
    if (v75)
    {
      long long v16 = [(NSMutableDictionary *)self->_tasks objectForKeyedSubscript:v12];
      v74 = +[NSFileManager defaultManager];
      v77 = [v16 lastObject];
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v17 = v16;
      id v79 = [v17 countByEnumeratingWithState:&v84 objects:v96 count:16];
      if (v79)
      {
        v72 = self;
        v68 = v13;
        id v67 = v12;
        char v69 = 0;
        uint64_t v78 = *(void *)v85;
        long long v18 = &OBJC_METACLASS___CPLCKUnsharePlan;
        id v70 = v15;
        long long v19 = v75;
        id v76 = v17;
        while (1)
        {
          for (i = 0; i != v79; i = (char *)i + 1)
          {
            if (*(void *)v85 != v78) {
              objc_enumerationMutation(v17);
            }
            long long v21 = *(void **)(*((void *)&v84 + 1) + 8 * i);
            long long v22 = [v21 cloudResource];
            v23 = [v22 identity];
            v24 = [v21 completionHandler];
            v25 = [v23 fileURL];
            if (!v25)
            {
              uint64_t v28 = +[CPLErrors incorrectParametersErrorForParameter:@"fileURL"];
              ((void (**)(void, void *, uint64_t))v24)[2](v24, v21, v28);
              goto LABEL_49;
            }
            if ([&v18[55] isFakeDerivative:v22])
            {
              id v83 = 0;
              unsigned int v26 = [&v18[55] transformFromURL:v19 fileType:v15 toTargetURL:v25 matchingResource:v22 error:&v83];
              id v27 = v83;
              uint64_t v28 = (uint64_t)v27;
              if (v26) {
                id v29 = 0;
              }
              else {
                id v29 = v27;
              }
              ((void (**)(void, void *, id))v24)[2](v24, v21, v29);
              if (v21 == v77)
              {
                [v74 removeItemAtURL:v19 error:0];
                char v69 = 1;
              }
              goto LABEL_23;
            }
            if ((CPLCloudKitUseGateKeeperForOperationType(a5) & 1) == 0)
            {
              uint64_t v28 = [v23 fingerPrint];
              id v30 = v71;
              if (v28 && ([(id)v28 isEqual:v30] & 1) != 0) {
                v31 = 0;
              }
              else {
                v31 = v30;
              }

              id v32 = v31;
              if (v32)
              {
LABEL_22:
                v33 = [(_CPLCloudKitDownloadGroup *)v72 resourceTypeDescription];
                v34 = +[CPLErrors cplErrorWithCode:27, @"Resource %@ in the cloud is stale (fingerprint is %@ vs. expected %@)", v33, v32, v28 description];
                ((void (**)(void, void *, void *))v24)[2](v24, v21, v34);

                id v15 = v70;
                long long v19 = v75;
LABEL_23:
                id v17 = v76;
                goto LABEL_49;
              }
              fingerprintContext = v72->_fingerprintContext;
              v36 = [v68 signature];
              v37 = [(CPLFingerprintContext *)fingerprintContext fingerprintSchemeForSignature:v36];
              unsigned int v38 = [v37 canMatchSignatureToFingerprint];

              if (v38)
              {
                uint64_t v39 = [v68 cplFingerPrint];
                id v40 = (id)v28;
                v41 = v40;
                if (v28 && v39)
                {
                  unsigned __int8 v42 = [v40 isEqual:v39];

                  v43 = (void *)v39;
                  if ((v42 & 1) == 0) {
                    goto LABEL_31;
                  }
LABEL_30:
                  v43 = 0;
                }
                else
                {

                  v43 = (void *)v39;
                  if (!(v28 | v39)) {
                    goto LABEL_30;
                  }
                }
LABEL_31:
                id v32 = v43;

                if (v32) {
                  goto LABEL_22;
                }
              }

              id v15 = v70;
              long long v19 = v75;
              id v17 = v76;
            }
            if (v21 == v77)
            {
              id v82 = 0;
              unsigned __int8 v47 = [v74 cplMoveItemAtURL:v19 toURL:v25 error:&v82];
              uint64_t v28 = (uint64_t)v82;
              if (v47)
              {
                CPLMarkDownloadedResourceWithDynamicVersion();
                uint64_t v48 = 0;
                char v69 = 1;
              }
              else
              {
                if (!_CPLSilentLogging)
                {
                  v51 = sub_10009202C();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                  {
                    v52 = [(_CPLCloudKitDownloadGroup *)v72 resourceTypeDescription];
                    *(_DWORD *)buf = 138413058;
                    v89 = v52;
                    __int16 v90 = 2112;
                    id v91 = v75;
                    __int16 v92 = 2112;
                    id v93 = v25;
                    __int16 v94 = 2112;
                    uint64_t v95 = v28;
                    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Failed to move downloaded asset %@ from %@ to %@: %@", buf, 0x2Au);

                    long long v19 = v75;
                  }
                }
                uint64_t v48 = v28;
              }
              ((void (**)(void, void *, uint64_t))v24)[2](v24, v77, v48);
            }
            else
            {
              id v81 = 0;
              unsigned __int8 v44 = [v74 cplCopyItemAtURL:v19 toURL:v25 error:&v81];
              id v45 = v81;
              uint64_t v28 = (uint64_t)v45;
              if (v44)
              {
                CPLMarkDownloadedResourceWithDynamicVersion();
                uint64_t v46 = 0;
                long long v19 = v75;
              }
              else
              {
                uint64_t v46 = (uint64_t)v45;
                long long v19 = v75;
                if (!_CPLSilentLogging)
                {
                  v49 = sub_10009202C();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    v50 = [(_CPLCloudKitDownloadGroup *)v72 resourceTypeDescription];
                    *(_DWORD *)buf = 138413058;
                    v89 = v50;
                    __int16 v90 = 2112;
                    id v91 = v75;
                    __int16 v92 = 2112;
                    id v93 = v25;
                    __int16 v94 = 2112;
                    uint64_t v95 = v28;
                    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Failed to copy downloaded asset %@ from %@ to %@: %@", buf, 0x2Au);

                    long long v19 = v75;
                  }

                  uint64_t v46 = v28;
                  id v17 = v76;
                }
              }
              ((void (**)(void, void *, uint64_t))v24)[2](v24, v21, v46);
            }
LABEL_49:

            long long v18 = &OBJC_METACLASS___CPLCKUnsharePlan;
          }
          id v79 = [v17 countByEnumeratingWithState:&v84 objects:v96 count:16];
          if (!v79)
          {

            id v12 = v67;
            id v13 = v68;
            self = v72;
            if (v69) {
              goto LABEL_66;
            }
            goto LABEL_56;
          }
        }
      }

LABEL_56:
      if (!_CPLSilentLogging)
      {
        v61 = sub_10009202C();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          v62 = [(_CPLCloudKitDownloadGroup *)self resourceTypeDescription];
          *(_DWORD *)buf = 138412802;
          v89 = v75;
          __int16 v90 = 2112;
          id v91 = v62;
          __int16 v92 = 2112;
          id v93 = v12;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "No download task moved %@ (resource %@ for %@) away from CloudKit. Removing now", buf, 0x20u);
        }
      }
      id v80 = 0;
      unsigned __int8 v63 = [v74 removeItemAtURL:v75 error:&v80];
      id v64 = v80;
      if ((v63 & 1) == 0 && !_CPLSilentLogging)
      {
        v65 = sub_10009202C();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v89 = v75;
          __int16 v90 = 2112;
          id v91 = v64;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", buf, 0x16u);
        }
      }
LABEL_66:
      [(NSMutableDictionary *)self->_tasks removeObjectForKey:v12];
      v66 = [(NSMutableDictionary *)self->_resourceSizes objectForKeyedSubscript:v12];
      [(NSMutableDictionary *)self->_downloadedSizes setObject:v66 forKeyedSubscript:v12];
    }
    else
    {
      v57 = [(_CPLCloudKitDownloadGroup *)self propertyKeys];
      v58 = sub_1000967A4((uint64_t)v57);
      v59 = [(_CPLCloudKitDownloadGroup *)self resourceTypeDescription];
      v60 = +[CPLErrors cplErrorWithCode:27, @"Fetching %@ (%@) for %@ succeeded but did not return the resource", v58, v59, v12 description];

      [(_CPLCloudKitDownloadGroup *)self resourceWithRecordScopedIdentifier:v12 didFailToDownloadWithError:v60];
    }
  }
  else
  {
    v53 = [(_CPLCloudKitDownloadGroup *)self propertyKeys];
    v54 = sub_100096768((uint64_t)v53);
    v55 = [(_CPLCloudKitDownloadGroup *)self resourceTypeDescription];
    v56 = +[CPLErrors cplErrorWithCode:26, @"Fetching %@ (%@) for %@ succeeded but did not return the fingerprint", v54, v55, v12 description];

    [(_CPLCloudKitDownloadGroup *)self resourceWithRecordScopedIdentifier:v12 didFailToDownloadWithError:v56];
  }
}

- (void)resourceWithRecordScopedIdentifier:(id)a3 didFailToDownloadWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_tasks objectForKeyedSubscript:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v14 = [v13 completionHandler];
        ((void (**)(void, void *, id))v14)[2](v14, v13, v7);
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  [(NSMutableDictionary *)self->_tasks removeObjectForKey:v6];
  id v15 = [(NSMutableDictionary *)self->_resourceSizes objectForKeyedSubscript:v6];
  [(NSMutableDictionary *)self->_downloadedSizes setObject:v15 forKeyedSubscript:v6];
}

- (void)allDownloadsDidFailWithError:(id)a3
{
  id v4 = a3;
  tasks = self->_tasks;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100095A98;
  v7[3] = &unk_100279D00;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)tasks enumerateKeysAndObjectsUsingBlock:v7];
  [(NSMutableDictionary *)self->_tasks removeAllObjects];
}

- (BOOL)cancelDownloadTask:(id)a3
{
  id v5 = a3;
  id v6 = [v5 cloudResource];
  if (!v6) {
    sub_1001CD3C4(v5, (uint64_t)a2, (uint64_t)self);
  }
  id v7 = v6;
  if ([v6 resourceType] == self->_resourceType)
  {
    id v8 = [v7 itemScopedIdentifier];
    id v9 = [(NSMutableDictionary *)self->_tasks objectForKeyedSubscript:v8];
    unsigned int v10 = [v9 containsObject:v5];
    if (v10)
    {
      uint64_t v11 = [v5 completionHandler];
      id v12 = +[CPLErrors operationCancelledError];
      ((void (**)(void, id, void *))v11)[2](v11, v5, v12);

      if ([v9 count] == (id)1) {
        [(NSMutableDictionary *)self->_tasks removeObjectForKey:v8];
      }
      else {
        [v9 removeObject:v5];
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)hasDownloadTasks
{
  return [(NSMutableDictionary *)self->_tasks count] != 0;
}

- (unint64_t)countOfDownloadTasks
{
  return (unint64_t)[(NSMutableDictionary *)self->_tasks count];
}

- (NSArray)allSourceBundleIdentifiers
{
  return (NSArray *)[(NSMutableSet *)self->_sourceBundleIdentifiers allObjects];
}

- (double)downloadProgress
{
  if (!self->_downloadSize) {
    return 0.0;
  }
  uint64_t v7 = 0;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  downloadedSizes = self->_downloadedSizes;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100095E00;
  v6[3] = &unk_100279D28;
  v6[4] = &v7;
  [(NSMutableDictionary *)downloadedSizes enumerateKeysAndObjectsUsingBlock:v6];
  double v4 = v8[3] / (double)self->_downloadSize;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)shouldBoostPriority
{
  if (self->_highPriority) {
    return +[CPLResource hasPriorityBoostForResourceType:self->_resourceType];
  }
  else {
    return 0;
  }
}

- (NSArray)recordScopedIdentifiers
{
  return (NSArray *)[(NSMutableDictionary *)self->_tasks allKeys];
}

- (void)enumerateRecordScopedIdentifiersAndTasksWithBlock:(id)a3
{
  id v4 = a3;
  tasks = self->_tasks;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100095F00;
  v7[3] = &unk_100279D50;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)tasks enumerateKeysAndObjectsUsingBlock:v7];
}

- (id)cloudResourceForRecordWithScopedIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_tasks objectForKeyedSubscript:a3];
  id v4 = [v3 firstObject];
  id v5 = [v4 cloudResource];

  return v5;
}

- (id)propertyKeys
{
  return sub_1000961D8((uint64_t)CPLCloudKitResourceKeys, self->_resourceType);
}

- (NSString)resourceTypeDescription
{
  return (NSString *)+[CPLResource shortDescriptionForResourceType:self->_resourceType];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(_CPLCloudKitDownloadGroup *)self resourceTypeDescription];
  id v5 = +[NSByteCountFormatter stringFromByteCount:self->_downloadSize countStyle:3];
  id v6 = [(NSMutableDictionary *)self->_tasks allKeys];
  uint64_t v7 = [v6 componentsJoinedByString:@", "];
  id v8 = +[NSString stringWithFormat:@"<%@ %@ %@ %@>", v3, v4, v5, v7];

  return v8;
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (NSString)defaultSourceBundleIdentifier
{
  return self->_defaultSourceBundleIdentifier;
}

- (CPLFingerprintContext)fingerprintContext
{
  return self->_fingerprintContext;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (NSString)mainSourceBundleIdentifier
{
  return self->_mainSourceBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainSourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_fingerprintContext, 0);
  objc_storeStrong((id *)&self->_defaultSourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_downloadedSizes, 0);
  objc_storeStrong((id *)&self->_resourceSizes, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
}

@end