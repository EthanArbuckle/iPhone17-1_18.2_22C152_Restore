@interface INCExtensionConnection
+ (void)initialize;
- (BOOL)_cancelRequestTimer;
- (BOOL)_shouldObserveLayout;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)requiresTCC;
- (BOOL)requiresTrustCheck;
- (INCAppProxy)appProxy;
- (INCExtensionConnection)initWithIntent:(id)a3;
- (INCExtensionConnection)initWithIntent:(id)a3 remoteProxyProvider:(id)a4;
- (INCExtensionConnection)initWithIntent:(id)a3 supportedExtensionTypes:(int64_t)a4 donateInteraction:(BOOL)a5 groupIdentifier:(id)a6 remoteProxyProvider:(id)a7;
- (INCExtensionConnection)initWithIntent:(id)a3 supportedExtensionTypes:(int64_t)a4 remoteProxyProvider:(id)a5;
- (INCExtensionTransaction)_transaction;
- (INIntent)intent;
- (NSArray)extensionInputItems;
- (NSXPCConnection)xpcConnection;
- (NSXPCInterface)xpcInterface;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)_queue;
- (double)_timeoutIntervalForTransactionState:(id)a3;
- (double)requestTimeoutInterval;
- (id)appHandler;
- (id)interruptionHandler;
- (id)remoteExtensionProxyProvider;
- (id)timeoutHandler;
- (id)xpcListenerEndpointWithInterface:(id)a3 object:(id)a4;
- (id)xpcObject;
- (int64_t)appProtectionPolicy;
- (int64_t)supportedExtensionTypes;
- (void)_invalidateAssertions;
- (void)_invalidateDisplayLayoutMonitor;
- (void)_invalidateInUseAssertion;
- (void)_invalidateRunningBoardAssertion;
- (void)_setShouldObserveLayout:(BOOL)a3;
- (void)_startRequestTimerWithExtensionProxy:(id)a3;
- (void)_takeAssertionsForIntent:(id)a3 extensionBundleIdentifier:(id)a4 processIdentifier:(int)a5;
- (void)_takeInUseAssertionForIntent:(id)a3 extensionBundleIdentifier:(id)a4;
- (void)_takeRunningBoardAssertionForProcessIdentifier:(int)a3;
- (void)dealloc;
- (void)reset;
- (void)resumeWithCompletionHandler:(id)a3;
- (void)setAppHandler:(id)a3;
- (void)setAppProtectionPolicy:(int64_t)a3;
- (void)setExtensionInputItems:(id)a3;
- (void)setIntent:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setRemoteExtensionProxyProvider:(id)a3;
- (void)setRequestTimeoutInterval:(double)a3;
- (void)setRequiresTCC:(BOOL)a3;
- (void)setRequiresTrustCheck:(BOOL)a3;
- (void)setTimeoutHandler:(id)a3;
- (void)setXPCConnection:(id)a3;
- (void)setXPCInterface:(id)a3;
- (void)setXPCObject:(id)a3;
@end

@implementation INCExtensionConnection

- (INCExtensionConnection)initWithIntent:(id)a3
{
  return [(INCExtensionConnection *)self initWithIntent:a3 supportedExtensionTypes:7 remoteProxyProvider:0];
}

- (INCExtensionConnection)initWithIntent:(id)a3 supportedExtensionTypes:(int64_t)a4 remoteProxyProvider:(id)a5
{
  return [(INCExtensionConnection *)self initWithIntent:a3 supportedExtensionTypes:a4 donateInteraction:1 groupIdentifier:0 remoteProxyProvider:a5];
}

- (INCExtensionConnection)initWithIntent:(id)a3 supportedExtensionTypes:(int64_t)a4 donateInteraction:(BOOL)a5 groupIdentifier:(id)a6 remoteProxyProvider:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v30.receiver = self;
  v30.super_class = (Class)INCExtensionConnection;
  v15 = [(INCExtensionConnection *)&v30 init];
  if (v15)
  {
    dispatch_queue_t v16 = dispatch_queue_create("INCExtensionConnectionQueue", 0);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    v18 = [[INCExtensionTransaction alloc] initWithIntent:v12 donateInteraction:v9 groupIdentifier:v13];
    transaction = v15->_transaction;
    v15->_transaction = v18;

    v15->_requestTimeoutInterval = 10.0;
    v20 = [[INCAppProxy alloc] _initWithConnection:v15];
    appProxy = v15->_appProxy;
    v15->_appProxy = v20;

    v15->_supportedExtensionTypes = a4;
    v15->_appProtectionPolicy = INThisProcessIsAssistantd();
    [(INCExtensionConnection *)v15 setRemoteExtensionProxyProvider:v14];
    unint64_t v22 = [v12 _executionContext];
    if (v22 <= 9 && ((1 << v22) & 0x304) != 0) {
      [(INCExtensionConnection *)v15 setRequiresTCC:0];
    }
    v23 = objc_alloc_init(INCDisplayLayoutMonitorObserver);
    layoutObserver = v15->_layoutObserver;
    v15->_layoutObserver = v23;

    objc_initWeak(&location, v15);
    v25 = v15->_layoutObserver;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __119__INCExtensionConnection_initWithIntent_supportedExtensionTypes_donateInteraction_groupIdentifier_remoteProxyProvider___block_invoke;
    v27[3] = &unk_1E62BB2A8;
    objc_copyWeak(&v28, &location);
    [(INCDisplayLayoutMonitorObserver *)v25 setHandler:v27];
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (void)setRemoteExtensionProxyProvider:(id)a3
{
}

- (void)resumeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E62BBB28;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v8);
  dispatch_async(queue, v7);
}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _transaction];
  v3 = [v2 request];

  id v4 = [v3 extensionInputItems];

  if (!v4)
  {
    v5 = [*(id *)(a1 + 32) extensionInputItems];
    [v3 setExtensionInputItems:v5];
  }
  id v6 = [*(id *)(a1 + 32) intent];
  dispatch_block_t v7 = (os_log_t *)MEMORY[0x1E4F30240];
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
    __int16 v51 = 2112;
    v52 = v6;
    _os_log_impl(&dword_1BC57D000, v8, OS_LOG_TYPE_INFO, "%s Resuming connection for intent: %@", buf, 0x16u);
  }
  id v9 = [*(id *)(a1 + 32) intent];
  v10 = [v9 extensionBundleId];

  if (([*(id *)(a1 + 32) supportedExtensionTypes] & 4) != 0)
  {
    id v12 = +[INCLocalExtensionRegistry sharedInstance];
    v11 = [v12 localExtensionForIdentifier:v10];
  }
  else
  {
    v11 = 0;
  }
  id v13 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
  {
    id v14 = @"YES";
    if (!v11) {
      id v14 = @"NO";
    }
    *(_DWORD *)buf = 136315394;
    v50 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
    __int16 v51 = 2112;
    v52 = v14;
    _os_log_impl(&dword_1BC57D000, v13, OS_LOG_TYPE_INFO, "%s Local extension: %@", buf, 0x16u);
  }
  if (!v11)
  {
    if (([*(id *)(a1 + 32) supportedExtensionTypes] & 2) != 0)
    {
      v21 = +[INCExtensionPlugInBundleManager sharedManager];
      unint64_t v22 = [*(id *)(a1 + 32) intent];
      v18 = [v21 extensionForIntent:v22];

      if (v18)
      {
        v23 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v50 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
          __int16 v51 = 2112;
          v52 = v18;
          __int16 v53 = 2112;
          v54 = v10;
          _os_log_impl(&dword_1BC57D000, v23, OS_LOG_TYPE_INFO, "%s Found plug in bundle extension extension %@ for identifier: %@", buf, 0x20u);
        }
        id v24 = objc_alloc(MEMORY[0x1E4F30850]);
        v25 = [v3 extensionInputItems];
        v20 = (__CFString *)[v24 initWithInputItems:v25 extension:v18];

        uint64_t v26 = *(void *)(a1 + 40);
        if (v26)
        {
          id v27 = [[INCExtensionProxy alloc] _initWithConnection:*(void *)(a1 + 32) extension:0 vendorRemote:v20 auditTokenValue:0];
          (*(void (**)(uint64_t, id, void))(v26 + 16))(v26, v27, 0);
        }
        goto LABEL_32;
      }
    }
    id v28 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1BC57D000, v28, OS_LOG_TYPE_INFO, "%s Checking if the app can handle intent using in-app intent handling", buf, 0xCu);
    }
    v29 = [MEMORY[0x1E4F302B0] appInfoWithIntent:v6];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_32;
    v43[3] = &unk_1E62BB370;
    v44 = v6;
    v18 = v29;
    v45 = v18;
    id v30 = *(id *)(a1 + 40);
    uint64_t v31 = *(void *)(a1 + 32);
    id v48 = v30;
    uint64_t v46 = v31;
    id v47 = v3;
    v32 = (void (**)(void))MEMORY[0x1C1872DC0](v43);
    if ([*(id *)(a1 + 32) appProtectionPolicy] != 1)
    {
      v33 = [*(id *)(a1 + 32) intent];
      char v34 = [v33 didAuthenticateAppProtection];

      if ((v34 & 1) == 0)
      {
        v35 = (void *)MEMORY[0x1E4F4B7E0];
        v36 = [(__CFString *)v18 applicationIdentifier];
        v37 = [v35 applicationWithBundleIdentifier:v36];

        if ([v37 isLocked])
        {
          v38 = [MEMORY[0x1E4F4B7E8] sharedGuard];
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_2_53;
          v40[3] = &unk_1E62BB3C0;
          v39 = *(void **)(a1 + 40);
          v40[4] = *(void *)(a1 + 32);
          id v41 = v39;
          v42 = v32;
          [v38 getIsChallengeCurrentlyRequiredForSubject:v37 completion:v40];

LABEL_31:
          v20 = v44;
          goto LABEL_32;
        }
      }
    }
    v32[2](v32);
    goto LABEL_31;
  }
  v15 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v50 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
    __int16 v51 = 2112;
    v52 = v11;
    __int16 v53 = 2112;
    v54 = v10;
    _os_log_impl(&dword_1BC57D000, v15, OS_LOG_TYPE_INFO, "%s Found local extension %@ for identifier: %@", buf, 0x20u);
  }
  id v16 = objc_alloc(MEMORY[0x1E4F30850]);
  v17 = [v3 extensionInputItems];
  v18 = (__CFString *)[v16 initWithInputItems:v17 privateIntentHandlerProvider:v11];

  uint64_t v19 = *(void *)(a1 + 40);
  if (v19)
  {
    v20 = [[INCExtensionProxy alloc] _initWithConnection:*(void *)(a1 + 32) extension:0 vendorRemote:v18 auditTokenValue:0];
    (*(void (**)(uint64_t, __CFString *, void))(v19 + 16))(v19, v20, 0);
LABEL_32:
  }
}

- (INCExtensionTransaction)_transaction
{
  return self->_transaction;
}

- (NSArray)extensionInputItems
{
  return self->_extensionInputItems;
}

- (INIntent)intent
{
  return [(INCExtensionTransaction *)self->_transaction currentIntent];
}

- (int64_t)supportedExtensionTypes
{
  return self->_supportedExtensionTypes;
}

- (OS_dispatch_queue)_queue
{
  return self->_queue;
}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    v11 = *(void **)(a1 + 40);
    if (v11)
    {
      id v12 = (NSObject **)MEMORY[0x1E4F30240];
      id v13 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        _os_log_impl(&dword_1BC57D000, v13, OS_LOG_TYPE_INFO, "%s Completed extension request with: %@", buf, 0x16u);
        v11 = *(void **)(a1 + 40);
      }
      v15 = [v11 _auxiliaryConnection];
      v5 = v15;
      memset(buf, 0, 32);
      if (v15) {
        [(_INCOptionalLocalExtension *)v15 auditToken];
      }
      v8 = [*(id *)(a1 + 72) _extensionBundle];
      id v16 = [v8 bundleIdentifier];
      v17 = *(void **)(a1 + 48);
      *(_OWORD *)uint64_t v46 = *(_OWORD *)buf;
      *(_OWORD *)&v46[16] = *(_OWORD *)&buf[16];
      [v17 trimDataAgainstTCCForAuditToken:v46 bundle:v8];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_37;
      v45[3] = &unk_1E62BBA60;
      v45[4] = *(void *)(a1 + 64);
      v18 = (void *)MEMORY[0x1C1872DC0](v45);
      uint64_t v19 = *v12;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = *(void *)(a1 + 72);
        *(_DWORD *)uint64_t v46 = 136315394;
        *(void *)&v46[4] = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke_3";
        *(_WORD *)&v46[12] = 2112;
        *(void *)&v46[14] = v20;
        _os_log_impl(&dword_1BC57D000, v19, OS_LOG_TYPE_INFO, "%s Getting vendor remote for extension: %@", v46, 0x16u);
      }
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_41;
      v42[3] = &unk_1E62BB2F8;
      id v21 = v16;
      id v43 = v21;
      id v22 = v18;
      id v44 = v22;
      v23 = [(_INCOptionalLocalExtension *)v5 remoteObjectProxyWithErrorHandler:v42];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_42;
      v39[3] = &unk_1E62BBB28;
      id v40 = v21;
      id v41 = v22;
      id v24 = v22;
      id v25 = v21;
      [(_INCOptionalLocalExtension *)v5 setInterruptionHandler:v39];
      objc_msgSend(*(id *)(a1 + 64), "_takeAssertionsForIntent:extensionBundleIdentifier:processIdentifier:", *(void *)(a1 + 48), v25, -[_INCOptionalLocalExtension processIdentifier](v5, "processIdentifier"));
      uint64_t v26 = [*(id *)(a1 + 64) _queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_43;
      block[3] = &unk_1E62BB320;
      id v27 = *(id *)(a1 + 80);
      uint64_t v28 = *(void *)(a1 + 64);
      v29 = *(void **)(a1 + 72);
      id v36 = v27;
      block[4] = v28;
      id v34 = v29;
      id v35 = v23;
      long long v37 = *(_OWORD *)buf;
      long long v38 = *(_OWORD *)&buf[16];
      id v30 = v23;
      dispatch_block_t v31 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
      dispatch_async(v26, v31);

      goto LABEL_16;
    }
  }
  if (!*(void *)(a1 + 80)) {
    return;
  }
  if ([*(id *)(a1 + 48) _type] == 2)
  {
    v2 = [*(id *)(a1 + 48) _codableDescription];
    int v3 = [v2 isEligibleForWidgets];

    if (v3)
    {
      id v4 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke_2";
        _os_log_impl(&dword_1BC57D000, v4, OS_LOG_TYPE_INFO, "%s Returning an optional local extension for the provided widget intent", buf, 0xCu);
      }
      v5 = objc_alloc_init(_INCOptionalLocalExtension);
      id v6 = objc_alloc(MEMORY[0x1E4F30850]);
      dispatch_block_t v7 = [*(id *)(a1 + 56) extensionInputItems];
      v8 = (void *)[v6 initWithInputItems:v7 privateIntentHandlerProvider:v5];

      uint64_t v9 = *(void *)(a1 + 80);
      id v10 = [[INCExtensionProxy alloc] _initWithConnection:*(void *)(a1 + 64) extension:0 vendorRemote:v8 auditTokenValue:0];
      (*(void (**)(uint64_t, id, void))(v9 + 16))(v9, v10, 0);

LABEL_16:
      return;
    }
  }
  v32 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
  v32();
}

- (void)_takeAssertionsForIntent:(id)a3 extensionBundleIdentifier:(id)a4 processIdentifier:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    [(INCExtensionConnection *)self _takeInUseAssertionForIntent:v8 extensionBundleIdentifier:v9];
    [(INCExtensionConnection *)self _takeRunningBoardAssertionForProcessIdentifier:v5];
  }
  else
  {
    id v10 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      id v12 = "-[INCExtensionConnection _takeAssertionsForIntent:extensionBundleIdentifier:processIdentifier:]";
      __int16 v13 = 2114;
      id v14 = v9;
    }
  }
}

- (void)_takeInUseAssertionForIntent:(id)a3 extensionBundleIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_backgroundHandlingAssertion)
  {
    id v9 = 0;
    objc_msgSend(a3, "_intents_backgroundHandlingAssertionForBundleIdentifier:context:error:", a4, 1, &v9);
    uint64_t v5 = (INIntentBackgroundHandlingAssertion *)objc_claimAutoreleasedReturnValue();
    id v6 = v9;
    backgroundHandlingAssertion = self->_backgroundHandlingAssertion;
    self->_backgroundHandlingAssertion = v5;

    if (v6)
    {
      id v8 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v11 = "-[INCExtensionConnection _takeInUseAssertionForIntent:extensionBundleIdentifier:]";
        __int16 v12 = 2114;
        id v13 = v6;
        _os_log_error_impl(&dword_1BC57D000, v8, OS_LOG_TYPE_ERROR, "%s Error acquiring background assertion: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)_takeRunningBoardAssertionForProcessIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v18[1] = *MEMORY[0x1E4F143B8];
  [(INCExtensionConnection *)self _invalidateRunningBoardAssertion];
  uint64_t v5 = [MEMORY[0x1E4F96478] targetWithPid:v3];
  uint64_t v6 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.siri" name:@"IntentStartupGrant"];
  v18[0] = v6;
  dispatch_block_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

  id v8 = (RBSAssertion *)[objc_alloc(MEMORY[0x1E4F96318]) initWithExplanation:@"Delivering an intent to an extension" target:v5 attributes:v7];
  processAssertion = self->_processAssertion;
  self->_processAssertion = v8;

  id v10 = self->_processAssertion;
  id v13 = 0;
  LOBYTE(v6) = [(RBSAssertion *)v10 acquireWithError:&v13];
  id v11 = v13;
  if ((v6 & 1) == 0)
  {
    __int16 v12 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "-[INCExtensionConnection _takeRunningBoardAssertionForProcessIdentifier:]";
      __int16 v16 = 2114;
      id v17 = v11;
      _os_log_error_impl(&dword_1BC57D000, v12, OS_LOG_TYPE_ERROR, "%s Failed to acquire assertion: %{public}@", buf, 0x16u);
    }
  }
}

- (void)_invalidateRunningBoardAssertion
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(RBSAssertion *)self->_processAssertion isValid])
  {
    processAssertion = self->_processAssertion;
    id v7 = 0;
    char v4 = [(RBSAssertion *)processAssertion invalidateWithError:&v7];
    id v5 = v7;
    if ((v4 & 1) == 0)
    {
      uint64_t v6 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v9 = "-[INCExtensionConnection _invalidateRunningBoardAssertion]";
        __int16 v10 = 2114;
        id v11 = v5;
        _os_log_error_impl(&dword_1BC57D000, v6, OS_LOG_TYPE_ERROR, "%s Failed to invalidate process assertion: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v5 = 0;
  }
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__INCExtensionConnection_reset__block_invoke;
  block[3] = &unk_1E62BB3E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __31__INCExtensionConnection_reset__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateDisplayLayoutMonitor];
  v2 = [*(id *)(a1 + 32) _transaction];
  id v3 = [v2 request];

  [v3 reset];
  [*(id *)(a1 + 32) _invalidateAssertions];
  [*(id *)(*(void *)(a1 + 32) + 24) cancel];
}

- (void)_invalidateDisplayLayoutMonitor
{
  [(FBSDisplayLayoutMonitor *)self->_displayLayoutMonitor invalidate];
  displayLayoutMonitor = self->_displayLayoutMonitor;
  self->_displayLayoutMonitor = 0;
}

- (void)_invalidateAssertions
{
  [(INCExtensionConnection *)self _invalidateInUseAssertion];
  [(INCExtensionConnection *)self _invalidateRunningBoardAssertion];
}

- (void)_invalidateInUseAssertion
{
  backgroundHandlingAssertion = self->_backgroundHandlingAssertion;
  if (backgroundHandlingAssertion)
  {
    [(INIntentBackgroundHandlingAssertion *)backgroundHandlingAssertion invalidate];
    char v4 = self->_backgroundHandlingAssertion;
    self->_backgroundHandlingAssertion = 0;
  }
}

- (void)dealloc
{
  [(INCExtensionConnection *)self _invalidateDisplayLayoutMonitor];
  [(INCExtensionConnection *)self _invalidateAssertions];
  v3.receiver = self;
  v3.super_class = (Class)INCExtensionConnection;
  [(INCExtensionConnection *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_xpcObject, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcInterface, 0);
  objc_storeStrong(&self->_remoteExtensionProxyProvider, 0);
  objc_storeStrong(&self->_appHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_extensionInputItems, 0);
  objc_storeStrong((id *)&self->_appProxy, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_backgroundHandlingAssertion, 0);
  objc_storeStrong((id *)&self->_requestTimer, 0);
  objc_storeStrong((id *)&self->_layoutObserver, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
}

- (void)setExtensionInputItems:(id)a3
{
}

- (void)setTimeoutHandler:(id)a3
{
}

- (void)setInterruptionHandler:(id)a3
{
}

- (void)_startRequestTimerWithExtensionProxy:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  requestTimer = self->_requestTimer;
  if (requestTimer)
  {
    if ([(INWatchdogTimer *)requestTimer cancelIfNotAlreadyCanceled])
    {
      uint64_t v6 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[INCExtensionConnection _startRequestTimerWithExtensionProxy:]";
        _os_log_impl(&dword_1BC57D000, v6, OS_LOG_TYPE_INFO, "%s Cancelling request timer from previous request", buf, 0xCu);
      }
    }
  }
  if ([v4 _isExtensionBeingDebugged])
  {
    id v7 = (void *)*MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      id v8 = v7;
      id v9 = [(INCExtensionConnection *)self intent];
      *(_DWORD *)buf = 136315394;
      v23 = "-[INCExtensionConnection _startRequestTimerWithExtensionProxy:]";
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_1BC57D000, v8, OS_LOG_TYPE_INFO, "%s Waiting indefinitely for intent: %@", buf, 0x16u);
    }
  }
  else
  {
    __int16 v10 = [(INCExtensionConnection *)self _transaction];
    id v11 = [v10 state];
    [(INCExtensionConnection *)self _timeoutIntervalForTransactionState:v11];
    double v13 = v12;

    objc_initWeak((id *)buf, self);
    id v14 = objc_alloc(MEMORY[0x1E4F30840]);
    queue = self->_queue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __63__INCExtensionConnection__startRequestTimerWithExtensionProxy___block_invoke;
    v18[3] = &unk_1E62BB458;
    objc_copyWeak(&v21, (id *)buf);
    id v19 = v4;
    uint64_t v20 = self;
    __int16 v16 = (INWatchdogTimer *)[v14 initWithTimeoutInterval:queue onQueue:v18 timeoutHandler:v13];
    id v17 = self->_requestTimer;
    self->_requestTimer = v16;

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  [(INWatchdogTimer *)self->_requestTimer start];
  [(INCExtensionConnection *)self _setShouldObserveLayout:1];
}

- (double)_timeoutIntervalForTransactionState:(id)a3
{
  id v4 = a3;
  double requestTimeoutInterval = self->_requestTimeoutInterval;
  uint64_t v6 = [v4 intent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v4 type];

    if (v7 == 4)
    {
      double requestTimeoutInterval = 60.0;
      goto LABEL_14;
    }
  }
  else
  {
  }
  id v8 = [v4 intent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v4 type];

    if (v9 == 4)
    {
      double requestTimeoutInterval = 300.0;
      goto LABEL_14;
    }
  }
  else
  {
  }
  __int16 v10 = [v4 intent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v4 type];

    if (v11 == 4) {
      double requestTimeoutInterval = 180.0;
    }
  }
  else
  {
  }
LABEL_14:

  return requestTimeoutInterval;
}

- (void)_setShouldObserveLayout:(BOOL)a3
{
  if (self->_shouldObserveLayout != a3)
  {
    self->_shouldObserveLayout = a3;
    [(INCExtensionConnection *)self _invalidateDisplayLayoutMonitor];
    if (self->_shouldObserveLayout)
    {
      id v4 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
      objc_initWeak(&location, self);
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      uint64_t v9 = __50__INCExtensionConnection__setShouldObserveLayout___block_invoke;
      __int16 v10 = &unk_1E62BB410;
      objc_copyWeak(&v11, &location);
      [v4 setTransitionHandler:&v7];
      objc_msgSend(MEMORY[0x1E4F62940], "monitorWithConfiguration:", v4, v7, v8, v9, v10);
      id v5 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
      displayLayoutMonitor = self->_displayLayoutMonitor;
      self->_displayLayoutMonitor = v5;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __50__INCExtensionConnection__setShouldObserveLayout___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[2] updateDisplayLayout:v6];
  }
}

- (double)requestTimeoutInterval
{
  return self->_requestTimeoutInterval;
}

- (BOOL)_cancelRequestTimer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  requestTimer = self->_requestTimer;
  if (requestTimer
    && ([(INWatchdogTimer *)requestTimer cancelIfNotAlreadyCanceled] & 1) == 0)
  {
    id v5 = (void *)*MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v5;
      uint64_t v9 = [(INCExtensionConnection *)self intent];
      int v10 = 136315394;
      id v11 = "-[INCExtensionConnection _cancelRequestTimer]";
      __int16 v12 = 2112;
      double v13 = v9;
      _os_log_error_impl(&dword_1BC57D000, v8, OS_LOG_TYPE_ERROR, "%s Intent handling already timed out, ignoring extension response for intent %@", (uint8_t *)&v10, 0x16u);
    }
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = 1;
  }
  id v6 = self->_requestTimer;
  self->_requestTimer = 0;

  [(INCExtensionConnection *)self _setShouldObserveLayout:0];
  return v4;
}

- (void)setXPCObject:(id)a3
{
}

- (id)xpcObject
{
  return self->_xpcObject;
}

- (void)setXPCConnection:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXPCInterface:(id)a3
{
}

- (NSXPCInterface)xpcInterface
{
  return self->_xpcInterface;
}

- (id)remoteExtensionProxyProvider
{
  return self->_remoteExtensionProxyProvider;
}

- (void)setAppHandler:(id)a3
{
}

- (id)appHandler
{
  return self->_appHandler;
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setRequestTimeoutInterval:(double)a3
{
  self->_double requestTimeoutInterval = a3;
}

- (void)setAppProtectionPolicy:(int64_t)a3
{
  self->_appProtectionPolicy = a3;
}

- (int64_t)appProtectionPolicy
{
  return self->_appProtectionPolicy;
}

- (INCAppProxy)appProxy
{
  return self->_appProxy;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (BOOL)_shouldObserveLayout
{
  return self->_shouldObserveLayout;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_xpcListener == v6 && self->_xpcInterface)
  {
    [(INCExtensionConnection *)self setXPCConnection:v7];
    objc_initWeak(&location, self);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    __int16 v12 = __61__INCExtensionConnection_listener_shouldAcceptNewConnection___block_invoke;
    double v13 = &unk_1E62BB480;
    objc_copyWeak(&v14, &location);
    [v7 setInvalidationHandler:&v10];
    objc_msgSend(v7, "setExportedInterface:", self->_xpcInterface, v10, v11, v12, v13);
    [v7 setExportedObject:self->_xpcObject];
    [v7 resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __61__INCExtensionConnection_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setXPCInterface:0];
}

void __63__INCExtensionConnection__startRequestTimerWithExtensionProxy___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v2 = [a1[4] _vendorRemote];
  objc_super v3 = [a1[5] intent];
  uint64_t v4 = [v3 identifier];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_1F162CFE8;
  }
  [v2 cancelTransactionDueToTimeoutWithIntentIdentifier:v6 completion:&__block_literal_global_455];

  id v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _invalidateAssertions];
    [WeakRetained _setShouldObserveLayout:0];
    BOOL v8 = WeakRetained;
    uint64_t v9 = WeakRetained[15];
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"INCExtensionErrorDomain" code:1307 userInfo:0];
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

      BOOL v8 = WeakRetained;
    }
    uint64_t v11 = (void *)v8[3];
    v8[3] = 0;

    id v7 = WeakRetained;
  }
}

- (id)xpcListenerEndpointWithInterface:(id)a3 object:(id)a4
{
  id v6 = a4;
  [(INCExtensionConnection *)self setXPCInterface:a3];
  [(INCExtensionConnection *)self setXPCObject:v6];

  xpcListener = self->_xpcListener;
  if (!xpcListener)
  {
    BOOL v8 = [MEMORY[0x1E4F29290] anonymousListener];
    uint64_t v9 = self->_xpcListener;
    self->_xpcListener = v8;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener resume];
    xpcListener = self->_xpcListener;
  }
  return [(NSXPCListener *)xpcListener endpoint];
}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_32(id *a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] _className];
  int v3 = [a1[5] supportsMultiwindow];
  int v4 = objc_msgSend(a1[4], "_intents_isExemptFromMulitWindowRequirementForInAppHandling");
  if (objc_msgSend(a1[4], "_intents_hasSystemIntentHandler"))
  {
    char v5 = 0;
  }
  else
  {
    id v6 = [a1[5] supportedIntentsByApp];
    char v7 = [v6 containsObject:v2];

    char v5 = v7 ^ 1;
  }
  int v8 = v3 | v4;
  uint64_t v9 = (os_log_t *)MEMORY[0x1E4F30240];
  uint64_t v10 = (void *)*MEMORY[0x1E4F30240];
  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO);
  if (v8 != 1 || (v5 & 1) != 0)
  {
    if (v11)
    {
      id v21 = a1[5];
      id v22 = v10;
      v23 = [v21 applicationIdentifier];
      *(_DWORD *)buf = 136315394;
      id v36 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
      __int16 v37 = 2112;
      long long v38 = v23;
      _os_log_impl(&dword_1BC57D000, v22, OS_LOG_TYPE_INFO, "%s The app %@ can NOT handle intent with in-app intent handling. Looking for an extension.", buf, 0x16u);
    }
    if (([a1[6] supportedExtensionTypes] & 1) == 0)
    {
      id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Unable to resume connection with an undefined extension type" userInfo:0];
      objc_exception_throw(v30);
    }
    __int16 v24 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      id v25 = a1[4];
      *(_DWORD *)buf = 136315394;
      id v36 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
      __int16 v37 = 2112;
      long long v38 = v25;
      _os_log_impl(&dword_1BC57D000, v24, OS_LOG_TYPE_INFO, "%s Starting extension request for intent: %@", buf, 0x16u);
    }
    id v26 = a1[4];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_35;
    v31[3] = &unk_1E62BB348;
    id v27 = a1[7];
    v31[4] = a1[6];
    id v34 = a1[8];
    id v32 = a1[4];
    id v33 = a1[7];
    [v27 startRequestForIntent:v26 completion:v31];
  }
  else
  {
    if (v11)
    {
      id v12 = a1[5];
      double v13 = v10;
      id v14 = [v12 applicationIdentifier];
      *(_DWORD *)buf = 136315394;
      id v36 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
      __int16 v37 = 2112;
      long long v38 = v14;
      _os_log_impl(&dword_1BC57D000, v13, OS_LOG_TYPE_INFO, "%s The app %@ can handle intent with in-app intent handling. Using it.", buf, 0x16u);
    }
    if (a1[8])
    {
      if ([a1[6] requiresTCC]
        && (uint64_t v15 = (void *)MEMORY[0x1E4F30868],
            [a1[5] applicationIdentifier],
            __int16 v16 = objc_claimAutoreleasedReturnValue(),
            uint64_t v17 = [v15 _siriAuthorizationStatusForAppID:v16],
            v16,
            v17 != 3))
      {
        uint64_t v28 = (void (**)(id, void, void *))a1[8];
        v29 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F300C0] code:3005 userInfo:0];
        v28[2](v28, 0, v29);
      }
      else
      {
        int v18 = [a1[5] isRequiresAppLaunchPreflight];
        id v19 = (void (**)(id, void, id))a1[8];
        if (v18)
        {
          id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F300C0] code:3006 userInfo:0];
          v19[2](v19, 0, v20);
        }
        else
        {
          id v20 = [[INCExtensionProxy alloc] _initWithConnection:a1[6] extension:0 vendorRemote:0 auditTokenValue:0];
          ((void (**)(id, id, id))v19)[2](v19, v20, 0);
        }
      }
    }
  }
}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_2_53(id *a1, void *a2)
{
  id v3 = a2;
  int v4 = [a1[4] _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E62BB398;
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v5 = v3;
  dispatch_async(v4, block);
}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) BOOLValue])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F300C0] code:1320 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v4);
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_35(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a1[4] _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E62BB888;
  id v17 = v9;
  id v18 = v8;
  id v23 = a1[7];
  id v19 = a1[5];
  id v11 = a1[6];
  id v12 = a1[4];
  id v20 = v11;
  id v21 = v12;
  id v22 = v7;
  id v13 = v7;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(v10, block);
}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_37(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _setShouldObserveLayout:0];
  id v4 = [*(id *)(a1 + 32) _queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_2_38;
  v6[3] = &unk_1E62BB2D0;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136315650;
      id v7 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_error_impl(&dword_1BC57D000, v4, OS_LOG_TYPE_ERROR, "%s Unable to get remote object proxy (%{public}@). XPC error: %{public}@", (uint8_t *)&v6, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_42(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315394;
    id v7 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
    __int16 v8 = 2114;
    uint64_t v9 = v5;
    _os_log_debug_impl(&dword_1BC57D000, v2, OS_LOG_TYPE_DEBUG, "%s Received an XPC connection interruption (%{public}@). The remote process exited or crashed.", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"INCExtensionErrorDomain" code:1306 userInfo:0];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_43(void *a1)
{
  uint64_t v1 = a1[7];
  if (v1)
  {
    uint64_t v3 = [INCExtensionProxy alloc];
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    [MEMORY[0x1E4F29238] value:a1 + 8 withObjCType:"{?=[8I]}"];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [(INCExtensionProxy *)v3 _initWithConnection:v4 extension:v5 vendorRemote:v6 auditTokenValue:v8];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v7, 0);
  }
}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_2_38(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateAssertions];
  [*(id *)(*(void *)(a1 + 32) + 24) cancel];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = [*(id *)(a1 + 32) interruptionHandler];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) interruptionHandler];
    v5[2](v5, *(void *)(a1 + 40));
  }
}

- (void)setRequiresTrustCheck:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(INCExtensionTransaction *)self->_transaction request];
  [v4 setRequiresTrustCheck:v3];
}

- (BOOL)requiresTrustCheck
{
  uint64_t v2 = [(INCExtensionTransaction *)self->_transaction request];
  char v3 = [v2 requiresTrustCheck];

  return v3;
}

- (void)setRequiresTCC:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(INCExtensionTransaction *)self->_transaction request];
  [v4 setRequiresTCC:v3];
}

- (BOOL)requiresTCC
{
  uint64_t v2 = [(INCExtensionTransaction *)self->_transaction request];
  char v3 = [v2 requiresTCC];

  return v3;
}

- (void)setIntent:(id)a3
{
  id v13 = a3;
  id v4 = [(INCExtensionTransaction *)self->_transaction currentIntent];
  objc_msgSend(v13, "_setExecutionContext:", objc_msgSend(v4, "_executionContext"));

  uint64_t v5 = [(INCExtensionTransaction *)self->_transaction state];
  uint64_t v6 = [(INCExtensionTransaction *)self->_transaction state];

  if (v6)
  {
    transaction = self->_transaction;
    id v8 = [INCExtensionTransactionState alloc];
    uint64_t v9 = [v5 type];
    uint64_t v10 = [v5 intentResponse];
    id v11 = [v5 userActivities];
    uint64_t v12 = [(INCExtensionTransactionState *)v8 initWithType:v9 intent:v13 intentResponse:v10 userActivities:v11];
    [(INCExtensionTransaction *)transaction setState:v12];
  }
}

void __119__INCExtensionConnection_initWithIntent_supportedExtensionTypes_donateInteraction_groupIdentifier_remoteProxyProvider___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained[7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __119__INCExtensionConnection_initWithIntent_supportedExtensionTypes_donateInteraction_groupIdentifier_remoteProxyProvider___block_invoke_2;
    v6[3] = &unk_1E62BB280;
    char v8 = a2;
    id v7 = WeakRetained;
    dispatch_async(v5, v6);
  }
}

uint64_t __119__INCExtensionConnection_initWithIntent_supportedExtensionTypes_donateInteraction_groupIdentifier_remoteProxyProvider___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  char v3 = *MEMORY[0x1E4F30240];
  BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 24);
      int v8 = 136315394;
      uint64_t v9 = "-[INCExtensionConnection initWithIntent:supportedExtensionTypes:donateInteraction:groupIdentifier:remoteProxy"
           "Provider:]_block_invoke_2";
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1BC57D000, v3, OS_LOG_TYPE_INFO, "%s Pausing request timer %@", (uint8_t *)&v8, 0x16u);
    }
    return [*(id *)(*(void *)(a1 + 32) + 24) stop];
  }
  else
  {
    if (v4)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 24);
      int v8 = 136315394;
      uint64_t v9 = "-[INCExtensionConnection initWithIntent:supportedExtensionTypes:donateInteraction:groupIdentifier:remoteProxy"
           "Provider:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1BC57D000, v3, OS_LOG_TYPE_INFO, "%s Resuming request timer %@", (uint8_t *)&v8, 0x16u);
    }
    return [*(id *)(*(void *)(a1 + 32) + 24) start];
  }
}

- (INCExtensionConnection)initWithIntent:(id)a3 remoteProxyProvider:(id)a4
{
  return [(INCExtensionConnection *)self initWithIntent:a3 supportedExtensionTypes:7 remoteProxyProvider:a4];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    INLogInitIfNeeded();
  }
}

@end