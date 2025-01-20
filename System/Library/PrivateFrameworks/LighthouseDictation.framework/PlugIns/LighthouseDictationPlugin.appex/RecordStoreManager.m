@interface RecordStoreManager
- (RecordStoreManager)init;
- (void)fetchRecordSetForBundleId:(id)a3 completion:(id)a4;
- (void)fetchSavedRecordInfoForBundleId:(id)a3 completion:(id)a4;
@end

@implementation RecordStoreManager

- (RecordStoreManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)RecordStoreManager;
  v2 = [(RecordStoreManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("DESRecordStoreManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)fetchRecordSetForBundleId:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __59__RecordStoreManager_fetchRecordSetForBundleId_completion___block_invoke;
  v8[3] = &unk_100014688;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(RecordStoreManager *)self fetchSavedRecordInfoForBundleId:v7 completion:v8];
}

void __59__RecordStoreManager_fetchRecordSetForBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = [v7 description];
    NSLog(@"Successfully fetched records: %@", v9);

    id v10 = [[RecordSet alloc] initWithNativeRecords:v11 nativeRecordInfo:v7];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    NSLog(@"Fail to fetch records for %@", *(void *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchSavedRecordInfoForBundleId:(id)a3 completion:(id)a4
{
  dispatch_queue_t v4 = (void (**)(id, id, id, void *))a4;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = 0;
  id v7 = AddRecordsForType(@"com.apple.siri.speech-dictation-personalization", v5, @"1", &v10);
  id v8 = v10;
  id v9 = v8;
  if (v7) {
    [v6 setObject:v7 forKey:@"com.apple.siri.speech-dictation-personalization"];
  }
  else {
    NSLog(@"Could not read records for %@: %@", @"com.apple.siri.speech-dictation-personalization", v8);
  }
  v4[2](v4, v6, v5, v9);
}

- (void).cxx_destruct
{
}

@end