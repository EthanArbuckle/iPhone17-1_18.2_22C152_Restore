@interface CPLCloudKitGetStreamingURLTask
- ($2E74481F85386E1F5426A8C22E405656)timeRange;
- (BOOL)shouldRequestEncryptedStream;
- (CPLCloudKitGetStreamingURLTask)initWithController:(id)a3 resource:(id)a4 hints:(id)a5 timeRange:(id *)a6 target:(id)a7 transportScopeMapping:(id)a8 cache:(id)a9 completionHandler:(id)a10;
- (CPLCloudKitSimpleCache)cache;
- (CPLResource)resource;
- (NSDictionary)hints;
- (id)_streamOperationForKey:(id)a3 operationType:(int64_t)a4 completionHandler:(id)a5;
- (id)completionHandler;
- (void)_fetchStreamingURL;
- (void)runOperations;
@end

@implementation CPLCloudKitGetStreamingURLTask

- (CPLCloudKitGetStreamingURLTask)initWithController:(id)a3 resource:(id)a4 hints:(id)a5 timeRange:(id *)a6 target:(id)a7 transportScopeMapping:(id)a8 cache:(id)a9 completionHandler:(id)a10
{
  id v34 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v35.receiver = self;
  v35.super_class = (Class)CPLCloudKitGetStreamingURLTask;
  v22 = [(CPLCloudKitTransportTask *)&v35 initWithController:a3];
  if (v22)
  {
    id v23 = [v21 copy];
    v24 = (void *)*((void *)v22 + 38);
    *((void *)v22 + 38) = v23;

    objc_storeStrong((id *)v22 + 37, a9);
    objc_storeStrong((id *)v22 + 35, a4);
    id v25 = [v17 copy];
    v26 = (void *)*((void *)v22 + 36);
    *((void *)v22 + 36) = v25;

    long long v28 = *(_OWORD *)&a6->var0.var3;
    long long v27 = *(_OWORD *)&a6->var1.var1;
    *(_OWORD *)(v22 + 312) = *(_OWORD *)&a6->var0.var0;
    *(_OWORD *)(v22 + 328) = v28;
    *(_OWORD *)(v22 + 344) = v27;
    id v29 = objc_alloc_init((Class)CPLRecordTargetMapping);
    v30 = (void *)*((void *)v22 + 34);
    *((void *)v22 + 34) = v29;

    v31 = (void *)*((void *)v22 + 34);
    v32 = [v18 scopedIdentifier];
    [v31 setTarget:v18 forRecordWithScopedIdentifier:v32];

    [v22 setTransportScopeMapping:v19];
  }

  return (CPLCloudKitGetStreamingURLTask *)v22;
}

- (id)_streamOperationForKey:(id)a3 operationType:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(CPLCloudKitGetStreamingURLTask *)self shouldRequestEncryptedStream])
  {
    if (!_CPLSilentLogging)
    {
      v10 = sub_1000AA278();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [v8 recordID];
        v12 = [v8 filename];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting encrypted video stream for %@/%@", buf, 0x16u);
      }
    }
    uint64_t v13 = 2;
  }
  else
  {
    if (CPLCloudKitUseGateKeeperForOperationType(a4))
    {
      v14 = [v8 recordID];
      v15 = [v8 resourceKey];
      uint64_t v16 = CPLCloudKitGateKeeperDefaultDownloadType;
      id v17 = [v8 filename];
      p_timeRange = &self->_timeRange;
      hints = self->_hints;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1000AA1D8;
      v38[3] = &unk_10027A4D0;
      id v39 = v9;
      long long v20 = *(_OWORD *)&p_timeRange->start.epoch;
      *(_OWORD *)buf = *(_OWORD *)&p_timeRange->start.value;
      *(_OWORD *)&buf[16] = v20;
      long long v44 = *(_OWORD *)&p_timeRange->duration.timescale;
      id v21 = +[CPLCKResourceDownloadOperation streamOperationForRecordID:v14 key:v15 downloadType:v16 filename:v17 timeRange:buf mediaRequestHints:hints completionBlock:v38];

      goto LABEL_11;
    }
    uint64_t v13 = 1;
  }
  id v22 = objc_alloc((Class)CKPublishAssetsOperation);
  id v23 = [v8 recordID];
  v42 = v23;
  v24 = +[NSArray arrayWithObjects:&v42 count:1];
  id v21 = [v22 initWithRecordIDs:v24];

  [v21 setURLOptions:v13];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  buf[24] = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000AA2CC;
  v34[3] = &unk_10027A4F8;
  v37 = buf;
  id v25 = v9;
  id v36 = v25;
  id v26 = v8;
  id v35 = v26;
  [v21 setAssetPublishedBlock:v34];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000AA560;
  v31[3] = &unk_10027A520;
  v33 = buf;
  id v32 = v25;
  [v21 setPublishAssetCompletionBlock:v31];
  long long v27 = [v26 resourceKey];
  v40 = v27;
  long long v28 = [v26 filename];
  v41 = v28;
  id v29 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];

  [v21 setFileNamesByAssetFieldNames:v29];
  _Block_object_dispose(buf, 8);
LABEL_11:

  return v21;
}

- (BOOL)shouldRequestEncryptedStream
{
  v2 = [(NSDictionary *)self->_hints objectForKeyedSubscript:CPLLibraryManagerStreamingHintShouldRequestEncryptedStream];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)runOperations
{
  targetMapping = self->_targetMapping;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000AA6F4;
  v3[3] = &unk_100276328;
  v3[4] = self;
  [(CPLCloudKitTransportTask *)self fetchUnknownTargetsInMapping:targetMapping completionHandler:v3];
}

- (void)_fetchStreamingURL
{
  id v59 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v59];
  id v4 = v59;
  if (v3)
  {
    if (+[CPLCloudKitFakeDynamicDerivatives isFakeDerivative:self->_resource])
    {
      id completionHandler = self->_completionHandler;
      v6 = +[CPLErrors cplErrorWithCode:255 description:@"Streaming fake derivatives is not supported"];
      (*((void (**)(id, void, void, void, void, void *))completionHandler + 2))(completionHandler, 0, 0, 0, 0, v6);
    }
    else
    {
      v54 = [(CPLResource *)self->_resource itemScopedIdentifier];
      if (v54)
      {
        v7 = sub_1000961D8((uint64_t)CPLCloudKitResourceKeys, (uint64_t)[(CPLResource *)self->_resource resourceType]);
        id v8 = sub_1000967A4((uint64_t)v7);

        if (v8)
        {
          v52 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v54];
          id v9 = [v52 resourceScopedIdentifier];
          v10 = [v9 scopeIdentifier];
          v11 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v10];

          if (v11)
          {
            v50 = v9;
            v12 = [v9 identifier];
            v51 = v11;
            uint64_t v47 = [v11 recordIDWithRecordName:v12];

            -[CPLCloudKitTransportTask setAllowsCellular:](self, "setAllowsCellular:", objc_msgSend((id)objc_opt_class(), "allowsCellularForDownloadOperationOfResource:isForeground:isHighPriority:", self->_resource, -[CPLCloudKitTransportTask foreground](self, "foreground"), 1));
            uint64_t v13 = [(CPLResource *)self->_resource identity];
            v14 = [v13 fileURL];
            uint64_t v15 = [v14 lastPathComponent];

            if (!v15)
            {
              uint64_t v16 = [(CPLResource *)self->_resource itemScopedIdentifier];
              id v17 = [v16 safeFilename];
              uint64_t v15 = +[NSString stringWithFormat:@"%@_%@", v17, v8];
            }
            id v18 = [CPLCloudKitStreamingKey alloc];
            v49 = v13;
            id v19 = [v13 fingerPrint];
            long long v20 = [(CPLCloudKitTransportTask *)self operationGroup];
            id v21 = [v20 name];
            unsigned __int8 v22 = [(CPLCloudKitGetStreamingURLTask *)self shouldRequestEncryptedStream];
            long long v23 = *(_OWORD *)&self->_timeRange.start.epoch;
            *(_OWORD *)buf = *(_OWORD *)&self->_timeRange.start.value;
            long long v61 = v23;
            long long v62 = *(_OWORD *)&self->_timeRange.duration.timescale;
            LOBYTE(v46) = v22;
            v24 = (void *)v47;
            v48 = (void *)v15;
            id v25 = [(CPLCloudKitStreamingKey *)v18 initWithRecordID:v47 resourceKey:v8 fingerPrint:v19 filename:v15 groupName:v21 timeRange:buf useEncryptedStream:v46];

            cache = self->_cache;
            long long v27 = +[NSDate date];
            id v58 = 0;
            long long v28 = [(CPLCloudKitSimpleCache *)cache objectForKey:v25 date:v27 expirationDate:&v58];
            id v29 = v58;

            if (v28)
            {
              id v30 = self->_completionHandler;
              v31 = [v28 streamingURL];
              id v32 = [v28 mediaItemMakerData];
              (*((void (**)(id, void *, void *, id, void, void))v30 + 2))(v30, v31, v32, v29, 0, 0);

              v24 = (void *)v47;
              id v33 = self->_completionHandler;
              self->_id completionHandler = 0;
              id v34 = v49;
            }
            else
            {
              id v57 = 0;
              unsigned __int8 v42 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v57];
              id v33 = v57;
              if (v42)
              {
                uint64_t v43 = CPLCloudKitOperationTypeForScope(v51);
                v55[0] = _NSConcreteStackBlock;
                v55[1] = 3221225472;
                v55[2] = sub_1000AAE64;
                v55[3] = &unk_10027A570;
                v55[4] = self;
                v56 = v25;
                long long v44 = [(CPLCloudKitGetStreamingURLTask *)self _streamOperationForKey:v56 operationType:v43 completionHandler:v55];
                [(CPLCloudKitTransportTask *)self launchOperation:v44 type:v43 withContext:0];

                v24 = (void *)v47;
                id v45 = v56;
              }
              else
              {
                (*((void (**)(void))self->_completionHandler + 2))();
                id v45 = self->_completionHandler;
                self->_id completionHandler = 0;
              }

              id v34 = v49;
            }

            id v9 = v50;
            v11 = v51;
          }
          else
          {
            id v41 = self->_completionHandler;
            v24 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required zone"];
            (*((void (**)(id, void, void, void, void, void *))v41 + 2))(v41, 0, 0, 0, 0, v24);
          }
        }
        else
        {
          if (!_CPLSilentLogging)
          {
            v38 = sub_1000AA278();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              resource = self->_resource;
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = resource;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Tried to publish an unsupported resource type in memory: %@", buf, 0xCu);
            }
          }
          id v40 = self->_completionHandler;
          v53 = +[CPLErrors incorrectParametersErrorForParameter:@"resourceType"];
          (*((void (**)(id, void, void, void, void))v40 + 2))(v40, 0, 0, 0, 0);
        }
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          id v35 = sub_1000AA278();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            id v36 = self->_resource;
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v36;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Tried to get a streaming URL for a resource with no item identifier: %@", buf, 0xCu);
          }
        }
        id v37 = self->_completionHandler;
        id v8 = +[CPLErrors incorrectParametersErrorForParameter:@"itemScopedIdentifier"];
        (*((void (**)(id, void, void, void, void, void *))v37 + 2))(v37, 0, 0, 0, 0, v8);
      }
    }
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (CPLResource)resource
{
  return self->_resource;
}

- (NSDictionary)hints
{
  return self->_hints;
}

- ($2E74481F85386E1F5426A8C22E405656)timeRange
{
  long long v3 = *(_OWORD *)&self[6].var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[6].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[7].var0.var1;
  return self;
}

- (CPLCloudKitSimpleCache)cache
{
  return self->_cache;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_hints, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_targetMapping, 0);
}

@end