@interface ADCloudKitSharedZoneUpdater
- (ADCloudKitRecordZoneInfo)sharedZone;
- (ADCloudKitSharedZoneUpdater)initWithQueue:(id)a3 container:(id)a4 sharedZone:(id)a5 zoneOwner:(BOOL)a6 delegate:(id)a7;
- (void)_notifyFailure:(id)a3;
- (void)_retryRecordSave;
- (void)_startRetryTimer;
- (void)addDictionaryToSharedStore:(id)a3 completion:(id)a4;
- (void)addDictionaryToSharedStore:(id)a3 recordKeysForDeletion:(id)a4 completion:(id)a5;
- (void)addKeyToSharedStore:(id)a3 value:(id)a4;
- (void)addKeyToSharedStore:(id)a3 value:(id)a4 completion:(id)a5;
- (void)clearUnsavedRecords;
- (void)dealloc;
- (void)fetchValueForKeyFromSharedStore:(id)a3 completion:(id)a4;
- (void)fetchValueForKeyFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5;
- (void)fetchValuesForKeysFromSharedStore:(id)a3 completion:(id)a4;
- (void)fetchValuesForKeysFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5;
- (void)setSharedZone:(id)a3;
@end

@implementation ADCloudKitSharedZoneUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedZone, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_unsavedRecords, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setSharedZone:(id)a3
{
}

- (ADCloudKitRecordZoneInfo)sharedZone
{
  return self->_sharedZone;
}

- (void)_notifyFailure:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 adCloudKitSharedZoneUpdater:self didEncounterError:v6];
  }
}

- (void)_retryRecordSave
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableDictionary *)self->_unsavedRecords count])
  {
    objc_initWeak(&location, self);
    v3 = [(NSMutableDictionary *)self->_unsavedRecords allValues];
    container = self->_container;
    BOOL isOwner = self->_isOwner;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10021BFE0;
    v6[3] = &unk_100507318;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    sub_10010B6C8(v3, 0, 17, container, isOwner, 0, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_startRetryTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_retryTimer)
  {
    v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    dispatch_time_t v4 = dispatch_time(0, 240000000000);
    dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10021C3DC;
    handler[3] = &unk_10050E138;
    handler[4] = self;
    dispatch_source_set_event_handler(v3, handler);
    retryTimer = self->_retryTimer;
    self->_retryTimer = (OS_dispatch_source *)v3;
    id v6 = v3;

    dispatch_resume((dispatch_object_t)self->_retryTimer);
  }
}

- (void)fetchValuesForKeysFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10021C4F0;
    v11[3] = &unk_10050C278;
    id v12 = v8;
    v13 = self;
    id v14 = v9;
    int64_t v15 = a4;
    dispatch_async(queue, v11);
  }
}

- (void)fetchValuesForKeysFromSharedStore:(id)a3 completion:(id)a4
{
}

- (void)clearUnsavedRecords
{
}

- (void)fetchValueForKeyFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (v9)
  {
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10021CBE4;
    v12[3] = &unk_10050C278;
    v12[4] = self;
    id v14 = v9;
    id v13 = v8;
    int64_t v15 = a4;
    dispatch_async(queue, v12);
  }
}

- (void)fetchValueForKeyFromSharedStore:(id)a3 completion:(id)a4
{
}

- (void)addDictionaryToSharedStore:(id)a3 recordKeysForDeletion:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10021D1BC;
  v15[3] = &unk_10050E228;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)addDictionaryToSharedStore:(id)a3 completion:(id)a4
{
}

- (void)addKeyToSharedStore:(id)a3 value:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10021D86C;
  v15[3] = &unk_10050E228;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)addKeyToSharedStore:(id)a3 value:(id)a4
{
}

- (void)dealloc
{
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    dispatch_time_t v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v7 = "-[ADCloudKitSharedZoneUpdater dealloc]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Cancelling timer", buf, 0xCu);
      retryTimer = self->_retryTimer;
    }
    dispatch_source_cancel(retryTimer);
  }
  v5.receiver = self;
  v5.super_class = (Class)ADCloudKitSharedZoneUpdater;
  [(ADCloudKitSharedZoneUpdater *)&v5 dealloc];
}

- (ADCloudKitSharedZoneUpdater)initWithQueue:(id)a3 container:(id)a4 sharedZone:(id)a5 zoneOwner:(BOOL)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ADCloudKitSharedZoneUpdater;
  id v17 = [(ADCloudKitSharedZoneUpdater *)&v22 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a3);
    v18->_BOOL isOwner = a6;
    objc_storeStrong((id *)&v18->_container, a4);
    objc_storeStrong((id *)&v18->_sharedZone, a5);
    objc_storeWeak((id *)&v18->_delegate, v16);
    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    unsavedRecords = v18->_unsavedRecords;
    v18->_unsavedRecords = v19;
  }
  return v18;
}

@end