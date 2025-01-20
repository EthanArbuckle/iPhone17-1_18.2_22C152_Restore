@interface VolumeUSBLocalStorageClient
+ (id)sharedLocalStorageClient;
@end

@implementation VolumeUSBLocalStorageClient

+ (id)sharedLocalStorageClient
{
  pthread_mutex_lock(&stru_10003CC40);
  if (qword_10003CDF8)
  {
    v2 = (char *)(id)qword_10003CDF8;
    pthread_mutex_unlock(&stru_10003CC40);
  }
  else
  {
    v3 = (char *)+[VolumeUSBLocalStorageClient newConnectionForService:@"machp://com.apple.filesystems.localLiveFiles"];
    if (!v3)
    {
      v8 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100026844(v8);
      }

      exit(0);
    }
    v2 = v3;
    [*(id *)&v3[OBJC_IVAR___LiveFSClient_conn] setInterruptionHandler:&stru_100035A28];
    [*(id *)&v2[OBJC_IVAR___LiveFSClient_conn] setInvalidationHandler:&stru_100035A48];
    objc_storeStrong((id *)&qword_10003CDF8, v2);
    pthread_mutex_unlock(&stru_10003CC40);
    v4 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      v10 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "client: %@", (uint8_t *)&v9, 0xCu);
    }

    v5 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [v2 volumes:0];
      int v9 = 138412290;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "volumes: %@", (uint8_t *)&v9, 0xCu);
    }
  }

  return v2;
}

@end