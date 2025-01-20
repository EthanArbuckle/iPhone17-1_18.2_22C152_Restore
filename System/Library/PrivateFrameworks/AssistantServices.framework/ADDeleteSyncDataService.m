@interface ADDeleteSyncDataService
- (ADDeleteSyncDataService)init;
- (void)beginSyncForInfo:(id)a3 chunkHandler:(id)a4;
@end

@implementation ADDeleteSyncDataService

- (void)beginSyncForInfo:(id)a3 chunkHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if ((uint64_t)[v5 count] < 1)
    {
      v10 = 0;
      v11 = 0;
    }
    else
    {
      v7 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v8 = v7;
        v9 = [v5 key];
        *(_DWORD *)buf = 136315394;
        v15 = "-[ADDeleteSyncDataService beginSyncForInfo:chunkHandler:]";
        __int16 v16 = 2112;
        v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Clearing sync data of type %@", buf, 0x16u);
      }
      v10 = objc_alloc_init(ADSyncChunkInfo);
      [(ADSyncChunkInfo *)v10 setValidity:@"DeleteSyncDataServiceValidity"];
      [(ADSyncChunkInfo *)v10 setToAdd:&__NSArray0__struct];
      [(ADSyncChunkInfo *)v10 setToRemove:&__NSArray0__struct];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100256B10;
      v12[3] = &unk_10050E250;
      id v13 = v6;
      v11 = objc_retainBlock(v12);
    }
    (*((void (**)(id, ADSyncChunkInfo *, void, void *))v6 + 2))(v6, v10, 0, v11);
  }
}

- (ADDeleteSyncDataService)init
{
  v5.receiver = self;
  v5.super_class = (Class)ADDeleteSyncDataService;
  v2 = [(ADDeleteSyncDataService *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ADService *)v2 setIdentifier:@"com.apple.siri.sync.DisabledSyncDataToBeDeleted"];
  }
  return v3;
}

@end