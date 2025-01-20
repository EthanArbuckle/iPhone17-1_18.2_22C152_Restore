@interface AXDownloadTTSResourceTask
- (void)run:(id)a3;
@end

@implementation AXDownloadTTSResourceTask

- (void)run:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  v5 = AXLogAssetDaemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXDownloadTTSResourceTask: Task did begin", (uint8_t *)&v17, 2u);
  }

  v6 = [(AXSimpleAssetTaskBase *)self trigger];
  v7 = [v6 arguments];
  v8 = [v7 objectForKeyedSubscript:@"kAXVoiceId"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_10;
  }
  v10 = [(AXSimpleAssetTaskBase *)self trigger];
  v11 = [v10 arguments];
  v12 = [v11 objectForKeyedSubscript:@"kAXVoiceId"];

  if (v12)
  {
    v13 = AXLogAssetDaemon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "AXDownloadTTSResourceTask: Task did begin download for identifier %@", (uint8_t *)&v17, 0xCu);
    }

    v14 = +[TTSAXResourceManager sharedInstance];
    [v14 downloadResourceWithVoiceId:v12];

    v15 = AXLogAssetDaemon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "AXDownloadTTSResourceTask: Task did finish", (uint8_t *)&v17, 2u);
    }

    v4[2](v4, 1);
  }
  else
  {
LABEL_10:
    v16 = AXLogAssetDaemon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "AXDownloadTTSResourceTask: Task failed, no identifier given", (uint8_t *)&v17, 2u);
    }

    v4[2](v4, 2);
  }
}

@end