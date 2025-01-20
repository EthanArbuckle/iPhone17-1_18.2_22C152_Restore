@interface DESRecordStore
+ (void)_getServiceProxyWithErrorHandler:(id)a3 block:(id)a4;
- (BOOL)isPermitted;
- (BOOL)shouldMakeRecord;
- (BOOL)shouldMakeRecordWithFrequency:(unint64_t)a3;
- (DESRecordStore)initWithBundleIdentifier:(id)a3;
- (void)deleteAllSavedRecordsWithCompletion:(id)a3;
- (void)deleteSavedRecordWithIdentfier:(id)a3 completion:(id)a4;
- (void)fetchNativeRecordDataForRecordUUID:(id)a3 completion:(id)a4;
- (void)fetchSavedRecordInfoWithCompletion:(id)a3;
- (void)saveCoreDuetEvent:(id)a3 completion:(id)a4;
- (void)saveRecordWithData:(id)a3 recordInfo:(id)a4 completion:(id)a5;
@end

@implementation DESRecordStore

- (DESRecordStore)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DESRecordStore;
  v5 = [(DESRecordStore *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isPermitted
{
  id v2 = DESLogAndReturnSunsetError();
  return 0;
}

- (BOOL)shouldMakeRecord
{
  id v2 = DESLogAndReturnSunsetError();
  return 0;
}

- (BOOL)shouldMakeRecordWithFrequency:(unint64_t)a3
{
  id v3 = DESLogAndReturnSunsetError();
  return 0;
}

+ (void)_getServiceProxyWithErrorHandler:(id)a3 block:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F29268];
  v7 = a4;
  v8 = (void *)[[v6 alloc] initWithServiceName:@"com.apple.siri-distributed-evaluation"];
  objc_super v9 = DESServiceGetXPCInterface(0);
  [v8 setRemoteObjectInterface:v9];

  [v8 resume];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__DESRecordStore__getServiceProxyWithErrorHandler_block___block_invoke;
  v17[3] = &unk_1E63C1C58;
  id v10 = v8;
  id v18 = v10;
  id v19 = v5;
  id v11 = v5;
  v12 = [v10 remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__DESRecordStore__getServiceProxyWithErrorHandler_block___block_invoke_2;
  v15[3] = &unk_1E63C1938;
  id v16 = v10;
  v13 = (void (*)(void *, void *, void *))v7[2];
  id v14 = v10;
  v13(v7, v12, v15);
}

void __57__DESRecordStore__getServiceProxyWithErrorHandler_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __57__DESRecordStore__getServiceProxyWithErrorHandler_block___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)saveRecordWithData:(id)a3 recordInfo:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v6 = a5;
    DESLogAndReturnSunsetError();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a5 + 2))(v6, 0, v7);
  }
}

- (void)fetchSavedRecordInfoWithCompletion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    DESLogAndReturnSunsetError();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a3 + 2))(v4, 0, v5);
  }
}

- (void)deleteAllSavedRecordsWithCompletion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    DESLogAndReturnSunsetError();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v4, v5);
  }
}

- (void)deleteSavedRecordWithIdentfier:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    DESLogAndReturnSunsetError();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a4 + 2))(v5, v6);
  }
}

- (void)saveCoreDuetEvent:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    DESLogAndReturnSunsetError();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
  }
}

- (void)fetchNativeRecordDataForRecordUUID:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    DESLogAndReturnSunsetError();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
  }
}

- (void).cxx_destruct
{
}

@end