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
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__RecordStoreManager_fetchRecordSetForBundleId_completion___block_invoke;
  v10[3] = &unk_2653B3840;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(RecordStoreManager *)self fetchSavedRecordInfoForBundleId:v9 completion:v10];
}

void __59__RecordStoreManager_fetchRecordSetForBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = [v7 description];
    NSLog(&cfstr_SuccessfullyFe.isa, v9);

    v10 = [[RecordSet alloc] initWithNativeRecords:v11 nativeRecordInfo:v7];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    NSLog(&cfstr_FailToFetchRec.isa, *(void *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchSavedRecordInfoForBundleId:(id)a3 completion:(id)a4
{
  dispatch_queue_t v4 = (objc_class *)MEMORY[0x263EFF9A0];
  v5 = (void (**)(id, id, id, void *))a4;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v11 = 0;
  id v8 = AddRecordsForType(@"com.apple.siri.speech-dictation-personalization", v6, @"1", &v11);
  id v9 = v11;
  v10 = v9;
  if (v8) {
    [v7 setObject:v8 forKey:@"com.apple.siri.speech-dictation-personalization"];
  }
  else {
    NSLog(&cfstr_CouldNotReadRe.isa, @"com.apple.siri.speech-dictation-personalization", v9);
  }
  v5[2](v5, v7, v6, v10);
}

- (void).cxx_destruct
{
}

@end