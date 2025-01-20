@interface ASOctaneServer
+ (id)shared;
- (ASOctaneServer)init;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_synchronousRemoteObjectProxy:(id *)a3;
- (id)buyProductWithID:(id)a3 bundleID:(id)a4;
- (id)cancelTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4;
- (id)changeAutoRenewStatus:(BOOL)a3 transactionID:(unint64_t)a4 bundleID:(id)a5;
- (id)clearOverridesForBundleID:(id)a3;
- (id)completeAskToBuyRequestWithResponse:(BOOL)a3 transactionID:(unint64_t)a4 forBundleID:(id)a5;
- (id)completePriceConsentRequestWithResponse:(BOOL)a3 transactionIdentifier:(unint64_t)a4 forBundleID:(id)a5;
- (id)deleteAllTransactionsForBundleID:(id)a3;
- (id)deleteTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4;
- (id)expireOrRenewSubscriptionWithIdentifier:(id)a3 expire:(BOOL)a4 forBundleID:(id)a5;
- (id)generateSKANPostbackSignature:(id)a3;
- (id)getStorefrontForBundleID:(id)a3;
- (id)getStringValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4;
- (id)getTransactionDataForBundleID:(id)a3;
- (id)messageForBundleID:(id)a3;
- (id)messageOfTypeForBundleID:(id)a3 messageReason:(id)a4;
- (id)refundTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4;
- (id)registerForEventOfType:(int64_t)a3 withFilterData:(id)a4;
- (id)resolveIssueForTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4;
- (id)setIntegerValue:(int64_t)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5;
- (id)setStorefront:(id)a3 forBundleID:(id)a4;
- (id)setStringValue:(id)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5;
- (id)startPriceIncreaseForTransactionID:(unint64_t)a3 bundleID:(id)a4 needsConsent:(BOOL)a5;
- (id)validateSKAdNetworkSignature:(id)a3 withPublicKey:(id)a4 source:(int64_t)a5 andParameters:(id)a6 forBundleID:(id)a7;
- (int64_t)activePort;
- (int64_t)getIntegerValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4;
- (int64_t)storeKitErrorForCategory:(int64_t)a3 bundleID:(id)a4;
- (void)appRemovedWithBundleID:(id)a3;
- (void)buyProductWithConfiguration:(id)a3 withReply:(id)a4;
- (void)getIntegerValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)setStoreKitError:(int64_t)a3 forCategory:(int64_t)a4 bundleID:(id)a5;
- (void)unregisterForEventWithIdentifier:(id)a3;
- (void)useConfigurationDirectory:(id)a3 forBundleID:(id)a4;
@end

@implementation ASOctaneServer

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global);
  }
  v2 = (void *)shared_octaneServer;
  return v2;
}

uint64_t __24__ASOctaneServer_shared__block_invoke()
{
  shared_octaneServer = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (ASOctaneServer)init
{
  v17.receiver = self;
  v17.super_class = (Class)ASOctaneServer;
  v2 = [(ASOctaneServer *)&v17 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.ASOctaneSupportXPCService"];
    connectionToService = v2->_connectionToService;
    v2->_connectionToService = (NSXPCConnection *)v3;

    v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F40244A0];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    [v5 setClasses:v10 forSelector:sel_messageOfTypeForBundleID_messageReason_withReply_ argumentIndex:0 ofReply:1];

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
    [v5 setClasses:v15 forSelector:sel_messageForBundleID_withReply_ argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)v2->_connectionToService setRemoteObjectInterface:v5];
    [(NSXPCConnection *)v2->_connectionToService resume];
  }
  return v2;
}

- (int64_t)activePort
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__ASOctaneServer_activePort__block_invoke;
  v5[3] = &unk_1E6E6FAC0;
  v5[4] = &v6;
  [v2 getPortWithReply:v5];

  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__ASOctaneServer_activePort__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)appRemovedWithBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  [v5 appRemovedWithBundleID:v4 withReply:&__block_literal_global_120];
}

- (void)buyProductWithConfiguration:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__ASOctaneServer_buyProductWithConfiguration_withReply___block_invoke;
  v10[3] = &unk_1E6E6FAE8;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(ASOctaneServer *)self _remoteObjectProxyWithErrorHandler:v10];
  [v9 buyProductWithConfiguration:v8 withReply:v7];
}

uint64_t __56__ASOctaneServer_buyProductWithConfiguration_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)buyProductWithID:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  objc_super v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id obj = 0;
  id v8 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v18, obj);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__ASOctaneServer_buyProductWithID_bundleID___block_invoke;
  v11[3] = &unk_1E6E6FB10;
  v11[4] = &v13;
  [v8 buyProductWithID:v6 bundleID:v7 withReply:v11];

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __44__ASOctaneServer_buyProductWithID_bundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)cancelTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4
{
  id v6 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id obj = 0;
  id v7 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v17, obj);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__ASOctaneServer_cancelTransactionWithIdentifier_forBundleID___block_invoke;
  v10[3] = &unk_1E6E6FB10;
  void v10[4] = &v12;
  [v7 cancelTransactionWithIdentifier:a3 forBundleID:v6 withReply:v10];

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __62__ASOctaneServer_cancelTransactionWithIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)changeAutoRenewStatus:(BOOL)a3 transactionID:(unint64_t)a4 bundleID:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  id obj = 0;
  id v9 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v19, obj);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__ASOctaneServer_changeAutoRenewStatus_transactionID_bundleID___block_invoke;
  v12[3] = &unk_1E6E6FB10;
  v12[4] = &v14;
  [v9 changeAutoRenewStatus:v6 transactionID:a4 bundleID:v8 withReply:v12];

  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __63__ASOctaneServer_changeAutoRenewStatus_transactionID_bundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)clearOverridesForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id obj = 0;
  id v5 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v15, obj);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__ASOctaneServer_clearOverridesForBundleID___block_invoke;
  v8[3] = &unk_1E6E6FB10;
  v8[4] = &v10;
  [v5 clearOverridesForBundleID:v4 withReply:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __44__ASOctaneServer_clearOverridesForBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)completeAskToBuyRequestWithResponse:(BOOL)a3 transactionID:(unint64_t)a4 forBundleID:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  id obj = 0;
  id v9 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v19, obj);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__ASOctaneServer_completeAskToBuyRequestWithResponse_transactionID_forBundleID___block_invoke;
  v12[3] = &unk_1E6E6FB10;
  v12[4] = &v14;
  [v9 completeAskToBuyRequestWithResponse:v6 transactionIdentifier:a4 forBundleID:v8 withReply:v12];

  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __80__ASOctaneServer_completeAskToBuyRequestWithResponse_transactionID_forBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)deleteAllTransactionsForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id obj = 0;
  id v5 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v15, obj);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__ASOctaneServer_deleteAllTransactionsForBundleID___block_invoke;
  v8[3] = &unk_1E6E6FB10;
  v8[4] = &v10;
  [v5 deleteAllTransactionsForBundleID:v4 withRelpy:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __51__ASOctaneServer_deleteAllTransactionsForBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)deleteTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4
{
  id v6 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id obj = 0;
  id v7 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v17, obj);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__ASOctaneServer_deleteTransactionWithIdentifier_forBundleID___block_invoke;
  v10[3] = &unk_1E6E6FB10;
  void v10[4] = &v12;
  [v7 deleteTransactionWithIdentifier:a3 forBundleID:v6 withReply:v10];

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __62__ASOctaneServer_deleteTransactionWithIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)expireOrRenewSubscriptionWithIdentifier:(id)a3 expire:(BOOL)a4 forBundleID:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id obj = 0;
  uint64_t v10 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v20, obj);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__ASOctaneServer_expireOrRenewSubscriptionWithIdentifier_expire_forBundleID___block_invoke;
  v13[3] = &unk_1E6E6FB10;
  v13[4] = &v15;
  [v10 expireOrRenewSubscriptionWithIdentifier:v8 expire:v6 forBundleID:v9 withReply:v13];

  id v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __77__ASOctaneServer_expireOrRenewSubscriptionWithIdentifier_expire_forBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)getStorefrontForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  id v5 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__ASOctaneServer_getStorefrontForBundleID___block_invoke;
  v8[3] = &unk_1E6E6FB38;
  v8[4] = &v9;
  [v5 getStorefrontForBundleID:v4 withReply:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __43__ASOctaneServer_getStorefrontForBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)getTransactionDataForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  id v5 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__ASOctaneServer_getTransactionDataForBundleID___block_invoke;
  v8[3] = &unk_1E6E6FB60;
  v8[4] = &v9;
  [v5 getTransactionDataForBundleID:v4 withReply:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __48__ASOctaneServer_getTransactionDataForBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)refundTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4
{
  id v6 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id obj = 0;
  id v7 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v17, obj);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__ASOctaneServer_refundTransactionWithIdentifier_forBundleID___block_invoke;
  v10[3] = &unk_1E6E6FB10;
  void v10[4] = &v12;
  [v7 refundTransactionWithIdentifier:a3 forBundleID:v6 withReply:v10];

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __62__ASOctaneServer_refundTransactionWithIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)resolveIssueForTransactionWithIdentifier:(unint64_t)a3 forBundleID:(id)a4
{
  id v6 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id obj = 0;
  id v7 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v17, obj);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__ASOctaneServer_resolveIssueForTransactionWithIdentifier_forBundleID___block_invoke;
  v10[3] = &unk_1E6E6FB10;
  void v10[4] = &v12;
  [v7 resolveIssueForTransactionWithIdentifier:a3 forBundleID:v6 withReply:v10];

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __71__ASOctaneServer_resolveIssueForTransactionWithIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)setStorefront:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id obj = 0;
  id v8 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v18, obj);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__ASOctaneServer_setStorefront_forBundleID___block_invoke;
  v11[3] = &unk_1E6E6FB10;
  v11[4] = &v13;
  [v8 setStorefront:v6 forBundleID:v7 withReply:v11];

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __44__ASOctaneServer_setStorefront_forBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (void)useConfigurationDirectory:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__ASOctaneServer_useConfigurationDirectory_forBundleID___block_invoke;
  v11[3] = &unk_1E6E6FB88;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 startServingConfiguration:v10 forBundleID:v9 withReply:v11];
}

void __56__ASOctaneServer_useConfigurationDirectory_forBundleID___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_ErrorSettingCo.isa, *(void *)(a1 + 32), *(void *)(a1 + 40), a2);
  }
}

- (id)registerForEventOfType:(int64_t)a3 withFilterData:(id)a4
{
  id v6 = a4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  id v7 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__ASOctaneServer_registerForEventOfType_withFilterData___block_invoke;
  v10[3] = &unk_1E6E6FBB0;
  void v10[4] = &v11;
  [v7 registerForEventOfType:a3 filterData:v6 withReply:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __56__ASOctaneServer_registerForEventOfType_withFilterData___block_invoke(uint64_t a1, void *a2)
{
}

- (void)unregisterForEventWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  [v5 unregisterForEventWithIdentifier:v4];
}

- (id)messageForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  id v5 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__ASOctaneServer_messageForBundleID___block_invoke;
  v8[3] = &unk_1E6E6FB38;
  v8[4] = &v9;
  [v5 messageForBundleID:v4 withReply:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __37__ASOctaneServer_messageForBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)messageOfTypeForBundleID:(id)a3 messageReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v8 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__ASOctaneServer_messageOfTypeForBundleID_messageReason___block_invoke;
  v11[3] = &unk_1E6E6FB38;
  void v11[4] = &v12;
  [v8 messageOfTypeForBundleID:v6 messageReason:v7 withReply:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __57__ASOctaneServer_messageOfTypeForBundleID_messageReason___block_invoke(uint64_t a1, void *a2)
{
}

- (id)startPriceIncreaseForTransactionID:(unint64_t)a3 bundleID:(id)a4 needsConsent:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v9 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__ASOctaneServer_startPriceIncreaseForTransactionID_bundleID_needsConsent___block_invoke;
  v12[3] = &unk_1E6E6FB10;
  v12[4] = &v13;
  [v9 startPriceIncreaseForTransactionID:a3 bundleID:v8 needsConsent:v5 withReply:v12];

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __75__ASOctaneServer_startPriceIncreaseForTransactionID_bundleID_needsConsent___block_invoke(uint64_t a1, void *a2)
{
}

- (id)completePriceConsentRequestWithResponse:(BOOL)a3 transactionIdentifier:(unint64_t)a4 forBundleID:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v9 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__ASOctaneServer_completePriceConsentRequestWithResponse_transactionIdentifier_forBundleID___block_invoke;
  v12[3] = &unk_1E6E6FB10;
  v12[4] = &v13;
  [v9 completePriceConsentRequestWithResponse:v6 transactionIdentifier:a4 forBundleID:v8 withReply:v12];

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __92__ASOctaneServer_completePriceConsentRequestWithResponse_transactionIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)validateSKAdNetworkSignature:(id)a3 withPublicKey:(id)a4 source:(int64_t)a5 andParameters:(id)a6 forBundleID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  id v16 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__ASOctaneServer_validateSKAdNetworkSignature_withPublicKey_source_andParameters_forBundleID___block_invoke;
  v20[3] = &unk_1E6E6FBD8;
  id v17 = v15;
  id v21 = v17;
  v22 = &v23;
  [v16 validateSKAdNetworkSignature:v12 withPublicKey:v13 source:a5 andParameters:v14 forBundleID:v17 withReply:v20];

  id v18 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v18;
}

void __94__ASOctaneServer_validateSKAdNetworkSignature_withPublicKey_source_andParameters_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    NSLog(&cfstr_ErrorValidatin.isa, *(void *)(a1 + 32), v3);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)generateSKANPostbackSignature:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy_;
  id v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  uint64_t v5 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__ASOctaneServer_generateSKANPostbackSignature___block_invoke;
  v8[3] = &unk_1E6E6FC00;
  v8[4] = &v9;
  [v5 generateSKANPostbackSignature:v4 withReply:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __48__ASOctaneServer_generateSKANPostbackSignature___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    NSLog(&cfstr_ErrorGeneratin.isa);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (int64_t)storeKitErrorForCategory:(int64_t)a3 bundleID:(id)a4
{
  id v6 = a4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v7 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__ASOctaneServer_storeKitErrorForCategory_bundleID___block_invoke;
  v10[3] = &unk_1E6E6FAC0;
  void v10[4] = &v11;
  [v7 storeKitErrorForCategory:a3 bundleID:v6 withReply:v10];

  int64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __52__ASOctaneServer_storeKitErrorForCategory_bundleID___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setStoreKitError:(int64_t)a3 forCategory:(int64_t)a4 bundleID:(id)a5
{
  id v8 = a5;
  id v9 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  [v9 setStoreKitError:a3 forCategory:a4 bundleID:v8 withReply:&__block_literal_global_136];
}

- (int64_t)getIntegerValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4
{
  id v6 = a4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  id v7 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__ASOctaneServer_getIntegerValueForIdentifier_forBundleID___block_invoke;
  v10[3] = &unk_1E6E6FAC0;
  void v10[4] = &v11;
  [v7 getIntegerValueForIdentifier:a3 forBundleID:v6 withReply:v10];

  int64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __59__ASOctaneServer_getIntegerValueForIdentifier_forBundleID___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)getIntegerValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__ASOctaneServer_getIntegerValueForIdentifier_forBundleID_completion___block_invoke;
  v15[3] = &unk_1E6E6FAE8;
  id v9 = v8;
  id v16 = v9;
  id v10 = a4;
  uint64_t v11 = [(ASOctaneServer *)self _remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__ASOctaneServer_getIntegerValueForIdentifier_forBundleID_completion___block_invoke_2;
  v13[3] = &unk_1E6E6FC28;
  id v14 = v9;
  id v12 = v9;
  [v11 getIntegerValueForIdentifier:a3 forBundleID:v10 withReply:v13];
}

uint64_t __70__ASOctaneServer_getIntegerValueForIdentifier_forBundleID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(&cfstr_ErrorConnectin.isa, a2);
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

uint64_t __70__ASOctaneServer_getIntegerValueForIdentifier_forBundleID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)setIntegerValue:(int64_t)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5
{
  id v8 = a5;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  id obj = 0;
  id v9 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v19, obj);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__ASOctaneServer_setIntegerValue_forIdentifier_forBundleID___block_invoke;
  v12[3] = &unk_1E6E6FB10;
  v12[4] = &v14;
  [v9 setIntegerValue:a3 forIdentifier:a4 forBundleID:v8 withReply:v12];

  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __60__ASOctaneServer_setIntegerValue_forIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)getStringValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4
{
  id v6 = a4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  id v7 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__ASOctaneServer_getStringValueForIdentifier_forBundleID___block_invoke;
  v10[3] = &unk_1E6E6FC00;
  void v10[4] = &v11;
  [v7 getStringValueForIdentifier:a3 forBundleID:v6 withReply:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __58__ASOctaneServer_getStringValueForIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)setStringValue:(id)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id obj = 0;
  id v10 = [(ASOctaneServer *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v20, obj);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__ASOctaneServer_setStringValue_forIdentifier_forBundleID___block_invoke;
  v13[3] = &unk_1E6E6FB10;
  void v13[4] = &v15;
  [v10 setStringValue:v8 forIdentifier:a4 forBundleID:v9 withReply:v13];

  id v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __59__ASOctaneServer_setStringValue_forIdentifier_forBundleID___block_invoke(uint64_t a1, void *a2)
{
}

- (id)_synchronousRemoteObjectProxy:(id *)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  connectionToService = self->_connectionToService;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__ASOctaneServer__synchronousRemoteObjectProxy___block_invoke;
  v8[3] = &unk_1E6E6FB10;
  v8[4] = &v9;
  uint64_t v5 = [(NSXPCConnection *)connectionToService synchronousRemoteObjectProxyWithErrorHandler:v8];
  if (a3)
  {
    id v6 = (void *)v10[5];
    if (v6) {
      *a3 = v6;
    }
  }
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __48__ASOctaneServer__synchronousRemoteObjectProxy___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_ErrorConnectin.isa, v3);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  connectionToService = self->_connectionToService;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__ASOctaneServer__remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_1E6E6FAE8;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSXPCConnection *)connectionToService remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

uint64_t __53__ASOctaneServer__remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end