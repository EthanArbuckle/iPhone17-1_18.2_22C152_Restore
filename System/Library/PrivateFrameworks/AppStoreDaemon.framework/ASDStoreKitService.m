@interface ASDStoreKitService
+ (BOOL)shouldProcessStoreKitPurchase:(id)a3;
+ (id)_serviceConnection;
+ (id)_storeKitClientInterface;
+ (id)_storeKitServiceInterface;
+ (id)storeKitServiceWithErrorHandler:(id)a3;
+ (void)_serviceConnectionInvalidated;
+ (void)handleNewTokenFamily:(id)a3 bundleID:(id)a4 withReply:(id)a5;
+ (void)processStoreKitPurchase:(id)a3 withResultHandler:(id)a4;
- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4;
- (void)shouldContinueTransaction:(id)a3 withNewStorefront:(id)a4 replyBlock:(id)a5;
@end

@implementation ASDStoreKitService

- (void)shouldContinueTransaction:(id)a3 withNewStorefront:(id)a4 replyBlock:(id)a5
{
}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v5 = a4;
  ASDErrorWithUnderlyingErrorAndDescription(0, @"ASDErrorDomain", 1060, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  id v5 = a4;
  ASDErrorWithUnderlyingErrorAndDescription(0, @"ASDErrorDomain", 1060, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4
{
  id v5 = a4;
  ASDErrorWithUnderlyingErrorAndDescription(0, @"ASDErrorDomain", 1060, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

+ (BOOL)shouldProcessStoreKitPurchase:(id)a3
{
  id v3 = a3;
  v4 = [v3 buyParameters];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F4DC00];
    v7 = [v3 buyParameters];
    v8 = [v6 buyParamsWithString:v7];

    v9 = [v8 parameterForKey:@"productType"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      char v10 = [v9 isEqualToString:@"A"];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (void)processStoreKitPurchase:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __64__ASDStoreKitService_processStoreKitPurchase_withResultHandler___block_invoke;
  v25[3] = &unk_1E58B3BB8;
  id v27 = a1;
  id v8 = v7;
  id v26 = v8;
  v9 = +[ASDStoreKitService storeKitServiceWithErrorHandler:v25];
  char v10 = (void *)MEMORY[0x1E4F4DC00];
  v11 = [v6 buyParameters];
  v12 = [v10 buyParamsWithString:v11];

  v13 = [v6 vendorName];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    v15 = [v6 vendorName];
    [v12 setObject:v15 forKeyedSubscript:@"vendorName"];
  }
  v16 = [v12 parameterForKey:@"bid"];
  if (![v16 length])
  {
    v17 = [v6 bundleID];
    uint64_t v18 = [v17 length];

    if (v18)
    {
      v19 = [v6 bundleID];
      [v12 setParameter:v19 forKey:@"bid"];
    }
  }
  v20 = [v12 stringValue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __64__ASDStoreKitService_processStoreKitPurchase_withResultHandler___block_invoke_16;
  v22[3] = &unk_1E58B3BE0;
  id v23 = v8;
  id v24 = a1;
  id v21 = v8;
  [v9 processPaymentWithBuyParamsString:v20 reply:v22];
}

void __64__ASDStoreKitService_processStoreKitPurchase_withResultHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2112;
    id v10 = v3;
    id v6 = v8;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Error in StoreKit service - %@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void, void, id, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, v3, v5);
}

void __64__ASDStoreKitService_processStoreKitPurchase_withResultHandler___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(13);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v13 = 138543618;
      *(void *)&v13[4] = objc_opt_class();
      *(_WORD *)&v13[12] = 2112;
      *(void *)&v13[14] = v4;
      id v12 = *(id *)&v13[4];
      _os_log_error_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_ERROR, "[%{public}@]: Error processing ASDPurchase with StoreKit service - %@", v13, 0x16u);
    }
    int v7 = [ASDPurchaseResult alloc];
    uint64_t v8 = 0;
    id v9 = v4;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v13 = 138543362;
      *(void *)&v13[4] = objc_opt_class();
      id v10 = *(id *)&v13[4];
      _os_log_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: StoreKit service finished processing ASDPurchase", v13, 0xCu);
    }
    int v7 = [ASDPurchaseResult alloc];
    uint64_t v8 = 1;
    id v9 = 0;
  }
  uint64_t v11 = -[ASDPurchaseResult initWithSuccess:error:](v7, "initWithSuccess:error:", v8, v9, *(_OWORD *)v13, *(void *)&v13[16], v14);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)handleNewTokenFamily:(id)a3 bundleID:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__ASDStoreKitService_handleNewTokenFamily_bundleID_withReply___block_invoke;
  v17[3] = &unk_1E58B3BB8;
  id v19 = a1;
  id v9 = v8;
  id v18 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[ASDStoreKitService storeKitServiceWithErrorHandler:v17];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__ASDStoreKitService_handleNewTokenFamily_bundleID_withReply___block_invoke_19;
  v14[3] = &unk_1E58B3BB8;
  id v15 = v9;
  id v16 = a1;
  id v13 = v9;
  [v12 saveNewTokenFamily:v11 bundleID:v10 reply:v14];
}

void __62__ASDStoreKitService_handleNewTokenFamily_bundleID_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2112;
    id v11 = v3;
    id v7 = v9;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Error in StoreKit service - %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3, v5, v6);
}

void __62__ASDStoreKitService_handleNewTokenFamily_bundleID_withReply___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2112;
    id v11 = v3;
    id v7 = v9;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to save token family - %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3, v5, v6);
}

+ (id)storeKitServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _serviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__ASDStoreKitService_storeKitServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E58B2CB8;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

uint64_t __54__ASDStoreKitService_storeKitServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)_serviceConnection
{
  if (_MergedGlobals_31 != -1) {
    dispatch_once(&_MergedGlobals_31, &__block_literal_global_8);
  }
  [(id)qword_1EB4D64A0 lock];
  if (!qword_1EB4D64A8)
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.storekitd" options:0];
    id v3 = (void *)qword_1EB4D64A8;
    qword_1EB4D64A8 = v2;

    id v4 = +[ASDStoreKitService _storeKitServiceInterface];
    [(id)qword_1EB4D64A8 setRemoteObjectInterface:v4];

    uint64_t v5 = +[ASDStoreKitService _storeKitClientInterface];
    [(id)qword_1EB4D64A8 setExportedInterface:v5];

    id v6 = objc_alloc_init(ASDStoreKitService);
    [(id)qword_1EB4D64A8 setExportedObject:v6];

    [(id)qword_1EB4D64A8 setInterruptionHandler:&__block_literal_global_24];
    [(id)qword_1EB4D64A8 setInvalidationHandler:&__block_literal_global_26];
    [(id)qword_1EB4D64A8 resume];
  }
  [(id)qword_1EB4D64A0 unlock];
  id v7 = (void *)qword_1EB4D64A8;
  return v7;
}

uint64_t __40__ASDStoreKitService__serviceConnection__block_invoke()
{
  qword_1EB4D64A0 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28E08]);
  return MEMORY[0x1F41817F8]();
}

uint64_t __40__ASDStoreKitService__serviceConnection__block_invoke_2()
{
  return +[ASDStoreKitService _serviceConnectionInvalidated];
}

uint64_t __40__ASDStoreKitService__serviceConnection__block_invoke_3()
{
  return +[ASDStoreKitService _serviceConnectionInvalidated];
}

+ (void)_serviceConnectionInvalidated
{
  [(id)qword_1EB4D64A0 lock];
  uint64_t v2 = (void *)qword_1EB4D64A8;
  qword_1EB4D64A8 = 0;

  id v3 = (void *)qword_1EB4D64A0;
  [v3 unlock];
}

+ (id)_storeKitServiceInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C038];
}

+ (id)_storeKitClientInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC5C3F0];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:sel_downloadStatusChanged_ argumentIndex:0 ofReply:0];

  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  id v18 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
  [v2 setClasses:v18 forSelector:sel_updatedTransactions_ argumentIndex:0 ofReply:0];

  return v2;
}

@end