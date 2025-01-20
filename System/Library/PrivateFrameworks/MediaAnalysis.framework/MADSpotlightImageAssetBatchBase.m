@interface MADSpotlightImageAssetBatchBase
- (MADSpotlightImageAssetBatchBase)initWithCancelBlock:(id)a3;
- (NSArray)assetEntries;
- (NSString)logPrefix;
- (NSString)queueName;
- (int)prepare;
- (int)process;
- (int)publish;
- (unint64_t)count;
- (void)addAssetEntry:(id)a3;
@end

@implementation MADSpotlightImageAssetBatchBase

- (MADSpotlightImageAssetBatchBase)initWithCancelBlock:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MADSpotlightImageAssetBatchBase;
  v5 = [(MADSpotlightImageAssetBatchBase *)&v34 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = +[NSMutableArray array];
  assetEntries = v5->_assetEntries;
  v5->_assetEntries = (NSMutableArray *)v6;

  id v8 = objc_retainBlock(v4);
  id cancelBlock = v5->_cancelBlock;
  v5->_id cancelBlock = v8;

  id v10 = objc_alloc((Class)SCMLHandler);
  uint64_t v41 = SCMLUseAnyAvailableDevice;
  v42 = &__kCFBooleanTrue;
  v11 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  id v33 = 0;
  v12 = (SCMLHandler *)[v10 initWithOptions:v11 error:&v33];
  id v13 = v33;
  commSafetyHandler = v5->_commSafetyHandler;
  v5->_commSafetyHandler = v12;

  if (v5->_commSafetyHandler && !v13)
  {
    v15 = [(MADSpotlightImageAssetBatchBase *)v5 queueName];
    v16 = +[NSString stringWithFormat:@"%@.compute", v15];

    v17 = [(MADSpotlightImageAssetBatchBase *)v5 queueName];
    v18 = +[NSString stringWithFormat:@"%@.request", v17];

    dispatch_group_t v19 = dispatch_group_create();
    computeGroup = v5->_computeGroup;
    v5->_computeGroup = (OS_dispatch_group *)v19;

    id v21 = v16;
    dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], 0);
    computeQueue = v5->_computeQueue;
    v5->_computeQueue = (OS_dispatch_queue *)v22;

    id v24 = v18;
    dispatch_queue_t v25 = dispatch_queue_create((const char *)[v24 UTF8String], 0);
    requestQueue = v5->_requestQueue;
    v5->_requestQueue = (OS_dispatch_queue *)v25;

LABEL_5:
    v27 = v5;
    goto LABEL_9;
  }
  v28 = VCPLogInstance();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
  {
    v30 = [(MADSpotlightImageAssetBatchBase *)v5 logPrefix];
    id v31 = (id)objc_opt_class();
    v32 = [v13 description];
    *(_DWORD *)buf = 138412802;
    v36 = v30;
    __int16 v37 = 2112;
    id v38 = v31;
    __int16 v39 = 2112;
    v40 = v32;
    _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "[%@] Failed to create %@: %@", buf, 0x20u);
  }
  v27 = 0;
LABEL_9:

  return v27;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_assetEntries count];
}

- (NSString)logPrefix
{
  return 0;
}

- (NSString)queueName
{
  return 0;
}

- (void)addAssetEntry:(id)a3
{
}

- (int)prepare
{
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v3, v4))
    {
      v5 = [(MADSpotlightImageAssetBatchBase *)self logPrefix];
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@][Prepare] prepare() should be implemented in sub-class", (uint8_t *)&v7, 0xCu);
    }
  }
  return -4;
}

- (int)process
{
  v3 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v3);

  os_log_type_t v4 = VCPSignPostLog();
  v5 = v4;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADFilesystemAssetEntry_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = [(MADSpotlightImageAssetBatchBase *)self logPrefix];
      unsigned int v9 = [(NSMutableArray *)self->_assetEntries count];
      qos_class_t v10 = qos_class_self();
      v11 = VCPMAQoSDescription(v10);
      *(_DWORD *)buf = 138412802;
      __int16 v39 = v8;
      __int16 v40 = 1024;
      LODWORD(v41[0]) = v9;
      WORD2(v41[0]) = 2112;
      *(void *)((char *)v41 + 6) = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@][Process] Processing %d assets (QoS: %@)", buf, 0x1Cu);
    }
  }
  v12 = +[VCPWatchdog sharedWatchdog];
  [v12 pet];

  if ([(NSMutableArray *)self->_assetEntries count])
  {
    unint64_t v13 = 0;
    os_log_type_t v14 = VCPLogToOSLogType[4];
    do
    {
      v16 = [(NSMutableArray *)self->_assetEntries objectAtIndexedSubscript:v13];
      v17 = [v16 filePath];
      if (!v17) {
        goto LABEL_13;
      }
      v18 = +[NSFileManager defaultManager];
      dispatch_group_t v19 = [v16 filePath];
      unsigned int v20 = [v18 fileExistsAtPath:v19];

      if (v20)
      {
        computeGroup = self->_computeGroup;
        computeQueue = self->_computeQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000FC450;
        block[3] = &unk_100219D70;
        id v36 = v16;
        __int16 v37 = self;
        dispatch_group_async(computeGroup, computeQueue, block);
      }
      else
      {
LABEL_13:
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v23 = VCPLogInstance();
          if (os_log_type_enabled(v23, v14))
          {
            id v24 = [(MADSpotlightImageAssetBatchBase *)self logPrefix];
            dispatch_queue_t v25 = [v16 uniqueIdentifier];
            *(_DWORD *)buf = 138412546;
            __int16 v39 = v24;
            __int16 v40 = 2112;
            v41[0] = v25;
            _os_log_impl((void *)&_mh_execute_header, v23, v14, "[%@][Process][%@] File path does not exist.", buf, 0x16u);
          }
        }
        [v16 setStatus:4294967278];
      }

      ++v13;
    }
    while (v13 < (unint64_t)[(NSMutableArray *)self->_assetEntries count]);
  }
  if ((int)MediaAnalysisLogLevel() > 5)
  {
    v26 = VCPLogInstance();
    os_log_type_t v27 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v26, v27))
    {
      v28 = [(MADSpotlightImageAssetBatchBase *)self logPrefix];
      *(_DWORD *)buf = 138412290;
      __int16 v39 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "[%@][Process] Waiting for compute to complete", buf, 0xCu);
    }
  }
  dispatch_group_wait((dispatch_group_t)self->_computeGroup, 0xFFFFFFFFFFFFFFFFLL);
  v29 = VCPSignPostLog();
  v30 = v29;
  if (v33 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADFilesystemAssetEntry_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  id cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
  if (cancelBlock && (cancelBlock[2]() & 1) != 0) {
    return -128;
  }
  else {
    return 0;
  }
}

- (int)publish
{
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v3, v4))
    {
      v5 = [(MADSpotlightImageAssetBatchBase *)self logPrefix];
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@][Publish] publish() should be implemented in sub-class", (uint8_t *)&v7, 0xCu);
    }
  }
  return -4;
}

- (NSArray)assetEntries
{
  return &self->_assetEntries->super;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_commSafetyHandler, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_computeQueue, 0);
  objc_storeStrong((id *)&self->_computeGroup, 0);
  objc_storeStrong((id *)&self->_assetEntries, 0);
  objc_storeStrong((id *)&self->_imageBackboneAnalyzer, 0);
}

@end