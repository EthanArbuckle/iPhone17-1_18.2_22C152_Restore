@interface DKExtensionRequest
+ (id)requestWithExtensionAttributes:(id)a3;
- (BOOL)_extensionContext:(id)a3 hasEntitlement:(id)a4;
- (BOOL)isAllowListed;
- (BOOL)isCanceled;
- (BOOL)isCompleted;
- (BOOL)isInterrupted;
- (DKExtensionAttributes)extensionAttributes;
- (DKExtensionHostAdapter)hostAdapter;
- (DKExtensionRequest)initWithExtensionAttributes:(id)a3;
- (DKRequestDelegate)delegate;
- (NSCopying)extensionRequestIdentifier;
- (NSCopying)requestIdentifier;
- (NSString)allowListContactMessage;
- (NSString)description;
- (OS_dispatch_semaphore)connectSemaphore;
- (RBSAssertion)rbprocessAssertion;
- (UIViewController)remoteViewController;
- (id)connectWithError:(id *)a3;
- (id)context;
- (id)hostServicesDelegate;
- (id)payload;
- (void)_cancelTimedOutWithInfo:(id)a3;
- (void)_finishWithResult:(id)a3 error:(id)a4;
- (void)beginWithPayload:(id)a3;
- (void)cancel;
- (void)cancelExtensionRequest;
- (void)cancelWithError:(id)a3;
- (void)complete;
- (void)completeWithPayload:(id)a3 completion:(id)a4;
- (void)dismissViewControllerWithCompletion:(id)a3;
- (void)interrupt;
- (void)setAllowListContactMessage:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setConnectSemaphore:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtensionAttributes:(id)a3;
- (void)setExtensionRequestIdentifier:(id)a3;
- (void)setHostAdapter:(id)a3;
- (void)setHostServicesDelegate:(id)a3;
- (void)setInterrupted:(BOOL)a3;
- (void)setIsAllowListed:(BOOL)a3;
- (void)setNotAllowListedWithContactMessage:(id)a3;
- (void)setPayload:(id)a3;
- (void)setRbprocessAssertion:(id)a3;
- (void)setRemoteViewController:(id)a3;
@end

@implementation DKExtensionRequest

+ (id)requestWithExtensionAttributes:(id)a3
{
  id v3 = a3;
  v4 = [[DKExtensionRequest alloc] initWithExtensionAttributes:v3];

  return v4;
}

- (DKExtensionRequest)initWithExtensionAttributes:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DKExtensionRequest;
  v6 = [(DKExtensionRequest *)&v13 init];
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_storeStrong((id *)&v6->_extensionAttributes, a3);
      *(_WORD *)&v7->_canceled = 0;
      v7->_interrupted = 0;
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      connectSemaphore = v7->_connectSemaphore;
      v7->_connectSemaphore = (OS_dispatch_semaphore *)v8;

      uint64_t v10 = [MEMORY[0x263F08C38] UUID];
      requestIdentifier = v7->_requestIdentifier;
      v7->_requestIdentifier = (NSCopying *)v10;

      v7->_isAllowListed = 1;
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (id)connectWithError:(id *)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__2;
  v60 = __Block_byref_object_dispose__2;
  id v61 = 0;
  id v5 = [(DKExtensionRequest *)self extensionRequestIdentifier];
  BOOL v6 = v5 == 0;

  if (v6)
  {
    if (CheckerBoardServicesLibraryCore_0())
    {
      *(void *)&long long v68 = 0;
      *((void *)&v68 + 1) = &v68;
      uint64_t v69 = 0x2050000000;
      v7 = (void *)getCBSUtilitiesClass_softClass_0;
      uint64_t v70 = getCBSUtilitiesClass_softClass_0;
      if (!getCBSUtilitiesClass_softClass_0)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCBSUtilitiesClass_block_invoke_0;
        v72 = &unk_264E86770;
        v73 = &v68;
        __getCBSUtilitiesClass_block_invoke_0((uint64_t)buf);
        v7 = *(void **)(*((void *)&v68 + 1) + 24);
      }
      id v8 = v7;
      _Block_object_dispose(&v68, 8);
      if ([v8 isCheckerBoardActive])
      {
        v9 = [MEMORY[0x263F08AB0] processInfo];
        uint64_t v10 = [v9 environment];

        v11 = DiagnosticsKitLogHandleForCategory(1);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = [(DKExtensionRequest *)self requestIdentifier];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v10;
          _os_log_impl(&dword_23D039000, v11, OS_LOG_TYPE_DEFAULT, "[RID: %@] My environment: %@", buf, 0x16u);
        }
        objc_super v13 = [v10 dictionaryWithValuesForKeys:&unk_26F0DBB28];
        v14 = DiagnosticsKitLogHandleForCategory(1);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = [(DKExtensionRequest *)self requestIdentifier];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v13;
          _os_log_impl(&dword_23D039000, v14, OS_LOG_TYPE_DEFAULT, "[RID: %@] Setting extension environment to: %@", buf, 0x16u);
        }
        v16 = [(DKExtensionRequest *)self extensionAttributes];
        v17 = [v16 extension];
        v18 = [v17 _plugIn];

        [v18 setEnvironment:v13];
      }
    }
    v19 = [(DKExtensionRequest *)self extensionAttributes];
    int v20 = [v19 isHeadless];

    if (v20)
    {
      v21 = DiagnosticsKitLogHandleForCategory(1);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [(DKExtensionRequest *)self requestIdentifier];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v22;
        _os_log_impl(&dword_23D039000, v21, OS_LOG_TYPE_DEFAULT, "[RID: %@] Connecting to extension without UI", buf, 0xCu);
      }
      v23 = [(DKExtensionRequest *)self extensionAttributes];
      v24 = [v23 extension];
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __39__DKExtensionRequest_connectWithError___block_invoke;
      v55[3] = &unk_264E86AF0;
      v55[4] = self;
      v55[5] = &v56;
      [v24 beginExtensionRequestWithOptions:1 inputItems:MEMORY[0x263EFFA68] completion:v55];
    }
    else
    {
      if (!UIKitLibraryCore_frameworkLibrary)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __UIKitLibraryCore_block_invoke;
        v72 = &__block_descriptor_40_e5_v8__0l;
        v73 = 0;
        long long v68 = xmmword_264E86B78;
        uint64_t v69 = 0;
        UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
      }
      if (UIKitLibraryCore_frameworkLibrary)
      {
        v25 = DiagnosticsKitLogHandleForCategory(1);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = [(DKExtensionRequest *)self requestIdentifier];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v26;
          _os_log_impl(&dword_23D039000, v25, OS_LOG_TYPE_DEFAULT, "[RID: %@] Connecting to extension with UI", buf, 0xCu);
        }
        v27 = [(DKExtensionRequest *)self extensionAttributes];
        v28 = [v27 extension];
        v54[0] = MEMORY[0x263EF8330];
        v54[1] = 3221225472;
        v54[2] = __39__DKExtensionRequest_connectWithError___block_invoke_16;
        v54[3] = &unk_264E86B18;
        v54[4] = self;
        v54[5] = &v56;
        [v28 instantiateViewControllerWithInputItems:MEMORY[0x263EFFA68] connectionHandler:v54];
      }
      else
      {
        v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v66 = *MEMORY[0x263F08320];
        v30 = DKErrorLocalizedDescriptionForCode(-1001);
        v67 = v30;
        v31 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        uint64_t v32 = [v29 errorWithDomain:@"DKErrorDomain" code:-1001 userInfo:v31];
        v33 = (void *)v57[5];
        v57[5] = v32;

        v34 = [(DKExtensionRequest *)self connectSemaphore];
        dispatch_semaphore_signal(v34);
      }
    }
    v35 = [(DKExtensionRequest *)self connectSemaphore];
    dispatch_time_t v36 = dispatch_time(0, 5000000000);
    intptr_t v37 = dispatch_semaphore_wait(v35, v36);

    v38 = [(DKExtensionRequest *)self extensionRequestIdentifier];
    if (!v38 || (BOOL v39 = [(DKExtensionRequest *)self isInterrupted], v38, v39))
    {
      if ([(DKExtensionRequest *)self isInterrupted])
      {
        v40 = DiagnosticsKitLogHandleForCategory(1);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v41 = [(DKExtensionRequest *)self requestIdentifier];
          [(DKExtensionRequest *)v41 connectWithError:v40];
        }

        v42 = (void *)MEMORY[0x263F087E8];
        uint64_t v64 = *MEMORY[0x263F08320];
        v43 = DKErrorLocalizedDescriptionForCode(-1002);
        v65 = v43;
        v44 = [NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        uint64_t v45 = [v42 errorWithDomain:@"DKErrorDomain" code:-1001 userInfo:v44];
      }
      else
      {
        if (v37)
        {
          v46 = DiagnosticsKitLogHandleForCategory(1);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v47 = [(DKExtensionRequest *)self requestIdentifier];
            [(DKExtensionRequest *)v47 connectWithError:v46];
          }
        }
        else
        {
          v46 = DiagnosticsKitLogHandleForCategory(1);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v48 = [(DKExtensionRequest *)self requestIdentifier];
            [(DKExtensionRequest *)v48 connectWithError:v46];
          }
        }

        v49 = (void *)MEMORY[0x263F087E8];
        uint64_t v62 = *MEMORY[0x263F08320];
        v43 = DKErrorLocalizedDescriptionForCode(-1001);
        v63 = v43;
        v44 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        uint64_t v45 = [v49 errorWithDomain:@"DKErrorDomain" code:-1001 userInfo:v44];
      }
      v50 = (void *)v57[5];
      v57[5] = v45;

      v51 = [(DKExtensionRequest *)self payload];
      [(DKExtensionRequest *)self _finishWithResult:v51 error:v57[5]];
    }
    if (a3) {
      *a3 = (id) v57[5];
    }
  }
  v52 = [(DKExtensionRequest *)self extensionRequestIdentifier];
  _Block_object_dispose(&v56, 8);

  return v52;
}

void __39__DKExtensionRequest_connectWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) requestIdentifier];
    uint64_t v9 = *(void *)(a1 + 32);
    int v12 = 138413058;
    objc_super v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_23D039000, v7, OS_LOG_TYPE_DEFAULT, "[RID: %@] [ERID: %@] Extension connected: %@, error: %@", (uint8_t *)&v12, 0x2Au);
  }
  id v10 = *(id *)(a1 + 32);
  objc_sync_enter(v10);
  if (([*(id *)(a1 + 32) isInterrupted] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    [*(id *)(a1 + 32) setExtensionRequestIdentifier:v5];
    v11 = [*(id *)(a1 + 32) connectSemaphore];
    dispatch_semaphore_signal(v11);
  }
  objc_sync_exit(v10);
}

void __39__DKExtensionRequest_connectWithError___block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [*(id *)(a1 + 32) requestIdentifier];
    uint64_t v12 = *(void *)(a1 + 32);
    int v15 = 138413058;
    __int16 v16 = v11;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_23D039000, v10, OS_LOG_TYPE_DEFAULT, "[RID: %@] [ERID: %@] Extension connected: %@, error: %@", (uint8_t *)&v15, 0x2Au);
  }
  id v13 = *(id *)(a1 + 32);
  objc_sync_enter(v13);
  if (([*(id *)(a1 + 32) isInterrupted] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
    [*(id *)(a1 + 32) setExtensionRequestIdentifier:v7];
    [*(id *)(a1 + 32) setRemoteViewController:v8];
    __int16 v14 = [*(id *)(a1 + 32) connectSemaphore];
    dispatch_semaphore_signal(v14);
  }
  objc_sync_exit(v13);
}

- (void)cancel
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(DKExtensionRequest *)self requestIdentifier];
    *(_DWORD *)buf = 138412290;
    __int16 v19 = v4;
    _os_log_impl(&dword_23D039000, v3, OS_LOG_TYPE_DEFAULT, "[RID: %@] Cancel requested for extension.", buf, 0xCu);
  }
  id v5 = self;
  objc_sync_enter(v5);
  [(DKExtensionRequest *)v5 setCanceled:1];
  objc_sync_exit(v5);

  id v6 = [(DKExtensionRequest *)v5 hostAdapter];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263EFFA20];
    id v8 = [(DKExtensionRequest *)v5 extensionRequestIdentifier];
    id v9 = [v7 scheduledTimerWithTimeInterval:v5 target:sel__cancelTimedOutWithInfo_ selector:v8 userInfo:0 repeats:5.0];

    id v10 = [MEMORY[0x263F08A48] currentQueue];
    v11 = [(DKExtensionRequest *)v5 hostAdapter];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __28__DKExtensionRequest_cancel__block_invoke;
    v15[3] = &unk_264E867B0;
    id v16 = v10;
    id v17 = v9;
    id v12 = v9;
    id v13 = v10;
    [v11 cancelWithCompletion:v15];
  }
  else
  {
    id v13 = DiagnosticsKitLogHandleForCategory(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = [(DKExtensionRequest *)v5 requestIdentifier];
      *(_DWORD *)buf = 138412290;
      __int16 v19 = v14;
      _os_log_impl(&dword_23D039000, v13, OS_LOG_TYPE_DEFAULT, "[RID: %@] Premature cancel; scheduled for after setup is complete.",
        buf,
        0xCu);
    }
  }
}

void __28__DKExtensionRequest_cancel__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __28__DKExtensionRequest_cancel__block_invoke_2;
  v2[3] = &unk_264E86710;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 addOperationWithBlock:v2];
}

uint64_t __28__DKExtensionRequest_cancel__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)setNotAllowListedWithContactMessage:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "Called setNotAllowListedWithContactMessage: %@", (uint8_t *)&v8, 0xCu);
  }

  [(DKExtensionRequest *)self setIsAllowListed:0];
  [(DKExtensionRequest *)self setAllowListContactMessage:v4];
  id v6 = [(DKExtensionRequest *)self hostAdapter];

  if (v6)
  {
    id v7 = [(DKExtensionRequest *)self hostAdapter];
    [v7 setNotAllowListedWithContactMessage:v4];
  }
}

- (void)beginWithPayload:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DKExtensionRequest *)self extensionAttributes];
  id v6 = [v5 extension];
  id v7 = [(DKExtensionRequest *)self extensionRequestIdentifier];
  int v8 = [v6 _extensionContextForUUID:v7];

  id v9 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(DKExtensionRequest *)self requestIdentifier];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_23D039000, v9, OS_LOG_TYPE_DEFAULT, "[RID: %@] Calling startWithPayload on the remote object proxy.", (uint8_t *)&buf, 0xCu);
  }
  if ([v8 conformsToProtocol:&unk_26F0E6340]
    && [(DKExtensionRequest *)self _extensionContext:v8 hasEntitlement:@"com.apple.DiagnosticsKit.extension"])
  {
    [(DKExtensionRequest *)self setHostAdapter:v8];
    v11 = [(DKExtensionRequest *)self hostAdapter];
    [v11 setDelegate:self];

    if (RunningBoardServicesLibraryCore())
    {
      uint64_t v35 = 0;
      dispatch_time_t v36 = &v35;
      uint64_t v37 = 0x2050000000;
      id v12 = (void *)getRBSTargetClass_softClass;
      uint64_t v38 = getRBSTargetClass_softClass;
      if (!getRBSTargetClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v43 = __getRBSTargetClass_block_invoke;
        v44 = &unk_264E86770;
        uint64_t v45 = &v35;
        __getRBSTargetClass_block_invoke((uint64_t)&buf);
        id v12 = (void *)v36[3];
      }
      id v13 = v12;
      _Block_object_dispose(&v35, 8);
      __int16 v14 = [v8 _auxiliaryConnection];
      int v15 = objc_msgSend(v13, "targetWithPid:", objc_msgSend(v14, "processIdentifier"));

      uint64_t v35 = 0;
      dispatch_time_t v36 = &v35;
      uint64_t v37 = 0x2050000000;
      id v16 = (void *)getRBSDomainAttributeClass_softClass;
      uint64_t v38 = getRBSDomainAttributeClass_softClass;
      if (!getRBSDomainAttributeClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v43 = __getRBSDomainAttributeClass_block_invoke;
        v44 = &unk_264E86770;
        uint64_t v45 = &v35;
        __getRBSDomainAttributeClass_block_invoke((uint64_t)&buf);
        id v16 = (void *)v36[3];
      }
      id v17 = v16;
      _Block_object_dispose(&v35, 8);
      id v18 = [v17 attributeWithDomain:@"com.apple.common" name:@"FinishTaskUninterruptable"];
      uint64_t v35 = 0;
      dispatch_time_t v36 = &v35;
      uint64_t v37 = 0x2050000000;
      __int16 v19 = (void *)getRBSAssertionClass_softClass;
      uint64_t v38 = getRBSAssertionClass_softClass;
      if (!getRBSAssertionClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v43 = __getRBSAssertionClass_block_invoke;
        v44 = &unk_264E86770;
        uint64_t v45 = &v35;
        __getRBSAssertionClass_block_invoke((uint64_t)&buf);
        __int16 v19 = (void *)v36[3];
      }
      uint64_t v20 = v19;
      _Block_object_dispose(&v35, 8);
      id v21 = [v20 alloc];
      v41 = v18;
      id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
      uint64_t v23 = (void *)[v21 initWithExplanation:@"Diagnostics App Requested Task Assertion" target:v15 attributes:v22];
      [(DKExtensionRequest *)self setRbprocessAssertion:v23];

      v24 = [(DKExtensionRequest *)self rbprocessAssertion];
      [v24 acquireWithError:0];
    }
    if (![(DKExtensionRequest *)self isAllowListed])
    {
      v25 = [(DKExtensionRequest *)self hostAdapter];
      v26 = [(DKExtensionRequest *)self allowListContactMessage];
      [v25 setNotAllowListedWithContactMessage:v26];
    }
    v27 = [(DKExtensionRequest *)self hostAdapter];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __39__DKExtensionRequest_beginWithPayload___block_invoke;
    v34[3] = &unk_264E86B40;
    v34[4] = self;
    [v27 startWithPayload:v4 completion:v34];
  }
  else
  {
    v28 = DiagnosticsKitLogHandleForCategory(1);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[DKExtensionRequest beginWithPayload:](self, v28);
    }

    v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    v30 = DKErrorLocalizedDescriptionForCode(-1006);
    v40 = v30;
    v31 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    uint64_t v32 = [v29 errorWithDomain:@"DKErrorDomain" code:-1006 userInfo:v31];

    v33 = [(DKExtensionRequest *)self delegate];
    [v33 request:self didCompleteWithPayload:0 error:v32];
  }
}

void __39__DKExtensionRequest_beginWithPayload___block_invoke(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) requestIdentifier];
    *(_DWORD *)long long buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_23D039000, v4, OS_LOG_TYPE_DEFAULT, "[RID: %@] Got completion from startWithPayload from the remote object proxy.", buf, 0xCu);
  }
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if ([*(id *)(a1 + 32) isCanceled]) {
    [*(id *)(a1 + 32) cancel];
  }
  objc_sync_exit(v6);

  if ([*(id *)(a1 + 32) isCanceled]) {
    goto LABEL_10;
  }
  id v7 = [*(id *)(a1 + 32) remoteViewController];
  if (!v7) {
    a2 = 0;
  }

  if (!a2)
  {
LABEL_10:
    [*(id *)(a1 + 32) setRemoteViewController:0];
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) hostAdapter];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __39__DKExtensionRequest_beginWithPayload___block_invoke_93;
    v9[3] = &unk_264E86B40;
    v9[4] = *(void *)(a1 + 32);
    [v8 checkShouldShowViewController:v9];
  }
}

void __39__DKExtensionRequest_beginWithPayload___block_invoke_93(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) hostServicesDelegate];
    int v4 = [v3 conformsToProtocol:&unk_26F0E8920];

    if (v4)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __39__DKExtensionRequest_beginWithPayload___block_invoke_2;
      block[3] = &unk_264E86710;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __39__DKExtensionRequest_beginWithPayload___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) hostServicesDelegate];
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 remoteViewController];
  [v4 request:v2 presentViewController:v3 completion:&__block_literal_global_12];
}

- (void)interrupt
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(DKExtensionRequest *)self requestIdentifier];
    *(_DWORD *)long long buf = 138412546;
    __int16 v14 = v4;
    __int16 v15 = 2112;
    id v16 = self;
    _os_log_impl(&dword_23D039000, v3, OS_LOG_TYPE_DEFAULT, "[RID: %@] interrupt: %@", buf, 0x16u);
  }
  id v5 = self;
  objc_sync_enter(v5);
  [(DKExtensionRequest *)v5 setInterrupted:1];
  id v6 = [(DKExtensionRequest *)v5 connectSemaphore];
  dispatch_semaphore_signal(v6);

  objc_sync_exit(v5);
  id v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F08320];
  int v8 = DKErrorLocalizedDescriptionForCode(-1002);
  uint64_t v12 = v8;
  id v9 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  uint64_t v10 = objc_msgSend(v7, "errorWithDomain:code:userInfo:", @"DKErrorDomain", -1002, v9, v11);

  [(DKExtensionRequest *)v5 _finishWithResult:0 error:v10];
}

- (void)cancelWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(DKExtensionRequest *)self requestIdentifier];
    *(_DWORD *)long long buf = 138412546;
    __int16 v14 = v6;
    __int16 v15 = 2112;
    id v16 = self;
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "[RID: %@] cancelWithError: %@", buf, 0x16u);
  }
  id v7 = (void *)MEMORY[0x263F087E8];
  v11[0] = *MEMORY[0x263F08320];
  int v8 = DKErrorLocalizedDescriptionForCode(-1003);
  v11[1] = *MEMORY[0x263F08608];
  v12[0] = v8;
  v12[1] = v4;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v10 = objc_msgSend(v7, "errorWithDomain:code:userInfo:", @"DKErrorDomain", -1003, v9, v11[0]);

  [(DKExtensionRequest *)self _finishWithResult:0 error:v10];
}

- (void)complete
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(DKExtensionRequest *)self requestIdentifier];
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_23D039000, v3, OS_LOG_TYPE_DEFAULT, "[RID: %@] complete: %@", (uint8_t *)&v6, 0x16u);
  }
  id v5 = [(DKExtensionRequest *)self payload];
  [(DKExtensionRequest *)self _finishWithResult:v5 error:0];
}

- (void)cancelExtensionRequest
{
  id v3 = [(DKExtensionRequest *)self extensionRequestIdentifier];

  if (v3)
  {
    id v6 = [(DKExtensionRequest *)self extensionAttributes];
    id v4 = [v6 extension];
    id v5 = [(DKExtensionRequest *)self extensionRequestIdentifier];
    [v4 cancelExtensionRequestWithIdentifier:v5];
  }
}

- (void)completeWithPayload:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(DKExtensionRequest *)self requestIdentifier];
    int v10 = 138412546;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "[RID: %@] completeWithPayload: %@", (uint8_t *)&v10, 0x16u);
  }
  [(DKExtensionRequest *)self setPayload:v6];
  [(DKExtensionRequest *)self dismissViewControllerWithCompletion:v7];
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(DKExtensionRequest *)self requestIdentifier];
  id v7 = [(DKExtensionRequest *)self extensionRequestIdentifier];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; [RID: %@] [ERID: %@] canceled: %d, completed: %d, interrupted: %d>",
    v5,
    self,
    v6,
    v7,
    [(DKExtensionRequest *)self isCanceled],
    [(DKExtensionRequest *)self isCompleted],
  __int16 v8 = [(DKExtensionRequest *)self isInterrupted]);

  return (NSString *)v8;
}

- (void)_cancelTimedOutWithInfo:(id)a3
{
  id v4 = a3;
  id v6 = [(DKExtensionRequest *)self extensionAttributes];
  id v5 = [v6 extension];
  [v5 cancelExtensionRequestWithIdentifier:v4];
}

- (void)dismissViewControllerWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [(DKExtensionRequest *)self remoteViewController];
  if (v5
    && (id v6 = (void *)v5,
        [(DKExtensionRequest *)self hostServicesDelegate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 conformsToProtocol:&unk_26F0E8920],
        v7,
        v6,
        v8))
  {
    id v9 = [(DKExtensionRequest *)self remoteViewController];
    [(DKExtensionRequest *)self setRemoteViewController:0];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__DKExtensionRequest_dismissViewControllerWithCompletion___block_invoke;
    block[3] = &unk_264E86898;
    id v12 = v9;
    id v13 = self;
    uint64_t v14 = v4;
    id v10 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v4[2](v4);
  }
}

void __58__DKExtensionRequest_dismissViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentingViewController];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 40) hostServicesDelegate];
    [v4 request:*(void *)(a1 + 40) dismissViewController:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
}

- (void)_finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![(DKExtensionRequest *)self isCompleted])
  {
    [(DKExtensionRequest *)self setCompleted:1];
    int v8 = DiagnosticsKitLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(DKExtensionRequest *)self requestIdentifier];
      *(_DWORD *)long long buf = 138413058;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = self;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "[RID: %@] Finishing %@ with result: %@, error: %@", buf, 0x2Au);
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __46__DKExtensionRequest__finishWithResult_error___block_invoke;
    v10[3] = &unk_264E86A20;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(DKExtensionRequest *)self dismissViewControllerWithCompletion:v10];
  }
}

uint64_t __46__DKExtensionRequest__finishWithResult_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 request:*(void *)(a1 + 32) didCompleteWithPayload:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];

  id v3 = [*(id *)(a1 + 32) rbprocessAssertion];
  [v3 invalidate];

  id v4 = *(void **)(a1 + 32);
  return [v4 setRbprocessAssertion:0];
}

- (BOOL)_extensionContext:(id)a3 hasEntitlement:(id)a4
{
  id v5 = a4;
  id v6 = [a3 _auxiliaryConnection];
  id v7 = [v6 valueForEntitlement:v5];

  LOBYTE(v6) = [v7 BOOLValue];
  return (char)v6;
}

- (DKRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DKRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)hostServicesDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_hostServicesDelegate);
  return WeakRetained;
}

- (void)setHostServicesDelegate:(id)a3
{
}

- (NSCopying)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSCopying)extensionRequestIdentifier
{
  return self->_extensionRequestIdentifier;
}

- (void)setExtensionRequestIdentifier:(id)a3
{
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (DKExtensionAttributes)extensionAttributes
{
  return self->_extensionAttributes;
}

- (void)setExtensionAttributes:(id)a3
{
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (UIViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (DKExtensionHostAdapter)hostAdapter
{
  return self->_hostAdapter;
}

- (void)setHostAdapter:(id)a3
{
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (id)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (OS_dispatch_semaphore)connectSemaphore
{
  return self->_connectSemaphore;
}

- (void)setConnectSemaphore:(id)a3
{
}

- (BOOL)isInterrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (RBSAssertion)rbprocessAssertion
{
  return self->_rbprocessAssertion;
}

- (void)setRbprocessAssertion:(id)a3
{
}

- (BOOL)isAllowListed
{
  return self->_isAllowListed;
}

- (void)setIsAllowListed:(BOOL)a3
{
  self->_isAllowListed = a3;
}

- (NSString)allowListContactMessage
{
  return self->_allowListContactMessage;
}

- (void)setAllowListContactMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowListContactMessage, 0);
  objc_storeStrong((id *)&self->_rbprocessAssertion, 0);
  objc_storeStrong((id *)&self->_connectSemaphore, 0);
  objc_storeStrong(&self->_payload, 0);
  objc_storeStrong((id *)&self->_hostAdapter, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_extensionAttributes, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_destroyWeak(&self->_hostServicesDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)connectWithError:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_23D039000, a2, a3, "[RID: %@] Connect interrupted", (uint8_t *)a2);
}

- (void)connectWithError:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_23D039000, a2, a3, "[RID: %@] Connect failed", (uint8_t *)a2);
}

- (void)connectWithError:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_23D039000, a2, a3, "[RID: %@] Connect timed out", (uint8_t *)a2);
}

- (void)beginWithPayload:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 requestIdentifier];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_23D039000, a2, OS_LOG_TYPE_ERROR, "[RID: %@] Cannot start extension. Entitlement is missing.", (uint8_t *)&v4, 0xCu);
}

@end