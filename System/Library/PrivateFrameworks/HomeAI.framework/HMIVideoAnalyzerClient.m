@interface HMIVideoAnalyzerClient
- (BOOL)hasFailed;
- (BOOL)sessionCreationAttempted;
- (HMIVideoAnalyzerClient)initWithConfiguration:(id)a3 identifier:(id)a4;
- (VCPHomeKitAnalysisSession)session;
- (id)ensureSession;
- (void)_didFailWithError:(id)a3;
- (void)_sendMessage:(SEL)a3 arguments:(id)a4 asynchronous:(BOOL)a5;
- (void)_sendMessage:(SEL)a3 arguments:(id)a4 asynchronous:(BOOL)a5 completionHandler:(id)a6;
- (void)_sendMessageWithOptions:(id)a3 asynchronous:(BOOL)a4 completionHandler:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)finishWithCompletionHandler:(id)a3;
- (void)flush;
- (void)flushAsync;
- (void)handleAssetData:(id)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)handleMessageWithOptions:(id)a3 completionHandler:(id)a4;
- (void)setAnalysisFPS:(double)a3;
- (void)setEncode:(BOOL)a3;
- (void)setHasFailed:(BOOL)a3;
- (void)setMonitored:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setSessionCreationAttempted:(BOOL)a3;
@end

@implementation HMIVideoAnalyzerClient

- (HMIVideoAnalyzerClient)initWithConfiguration:(id)a3 identifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HMIVideoAnalyzerClient;
  v4 = [(HMIVideoAnalyzer *)&v10 initWithConfiguration:a3 identifier:a4];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("HMIVideoAnalyzerClient", v5);
    workQueue = v4->_workQueue;
    v4->_workQueue = (OS_dispatch_queue *)v6;

    session = v4->_session;
    v4->_session = 0;

    v4->_sessionCreationAttempted = 0;
    v4->_hasFailed = 0;
  }
  return v4;
}

- (id)ensureSession
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = [(HMIVideoAnalyzerClient *)self session];
  if (v3)
  {

LABEL_4:
    v4 = [(HMIVideoAnalyzerClient *)self session];
    goto LABEL_5;
  }
  if ([(HMIVideoAnalyzerClient *)self sessionCreationAttempted]) {
    goto LABEL_4;
  }
  dispatch_queue_t v6 = (void *)MEMORY[0x22A641C70]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v9;
    _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Creating Remote Session", buf, 0xCu);
  }
  objc_initWeak(&location, v7);
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  objc_super v10 = (void *)getVCPHomeKitAnalysisSessionClass_softClass;
  uint64_t v31 = getVCPHomeKitAnalysisSessionClass_softClass;
  if (!getVCPHomeKitAnalysisSessionClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getVCPHomeKitAnalysisSessionClass_block_invoke;
    v35 = &unk_26477B968;
    v36 = &v28;
    __getVCPHomeKitAnalysisSessionClass_block_invoke((uint64_t)buf);
    objc_super v10 = (void *)v29[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v28, 8);
  v32[0] = @"configuration";
  v12 = [(HMIVideoAnalyzer *)v7 configuration];
  v32[1] = @"identifier";
  v33[0] = v12;
  v13 = [(HMIVideoAnalyzer *)v7 identifier];
  v33[1] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __39__HMIVideoAnalyzerClient_ensureSession__block_invoke;
  v25[3] = &unk_26477EC50;
  objc_copyWeak(&v26, &location);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __39__HMIVideoAnalyzerClient_ensureSession__block_invoke_217;
  v23[3] = &unk_26477EC78;
  objc_copyWeak(&v24, &location);
  v15 = [v11 sessionWithProperties:v14 withResultsHandler:v25 andInterruptionHandler:v23];
  [(HMIVideoAnalyzerClient *)v7 setSession:v15];

  v16 = [(HMIVideoAnalyzerClient *)v7 session];
  LODWORD(v12) = v16 == 0;

  if (v12)
  {
    v17 = [MEMORY[0x263F087E8] hmiErrorWithCode:-1 description:@"VCPHomeKitAnalysisSession connection failed."];
    [(HMIVideoAnalyzerClient *)v7 _didFailWithError:v17];
  }
  v18 = (void *)MEMORY[0x22A641C70]();
  v19 = v7;
  HMFGetOSLogHandle();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = [(HMIVideoAnalyzerClient *)v19 session];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v22;
    _os_log_impl(&dword_225DC6000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Created Remote Session %@", buf, 0x16u);
  }
  [(HMIVideoAnalyzerClient *)v19 setSessionCreationAttempted:1];
  v4 = [(HMIVideoAnalyzerClient *)v19 session];
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
LABEL_5:
  return v4;
}

void __39__HMIVideoAnalyzerClient_ensureSession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = WeakRetained;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    int v19 = 138543618;
    v20 = v8;
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Received Result: %@", (uint8_t *)&v19, 0x16u);
  }
  v9 = [v6 delegate];
  objc_super v10 = [v3 objectForKeyedSubscript:@"selector"];
  id v11 = (char *)NSSelectorFromString(v10);
  if (v11 == sel_analyzer_didAnalyzeFrameWithResult_)
  {
    v12 = [v3 objectForKeyedSubscript:@"arguments"];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_22;
    }
    v13 = [v12 objectAtIndexedSubscript:0];
    [v9 analyzer:v6 didAnalyzeFrameWithResult:v13];
LABEL_21:

    goto LABEL_22;
  }
  if (v11 == sel_analyzer_didAnalyzeFragmentWithResult_)
  {
    v12 = [v3 objectForKeyedSubscript:@"arguments"];
    v16 = [v12 objectAtIndexedSubscript:0];
    v17 = [v6 homePersonManager];
    v18 = [v6 analysisStateManager];
    v13 = [v6 finalizeFragmentResult:v16 homePersonManager:v17 analysisStateManager:v18];

    if (objc_opt_respondsToSelector()) {
      [v9 analyzer:v6 didAnalyzeFragmentWithResult:v13];
    }
    goto LABEL_21;
  }
  if (v11 == sel_analyzer_didFailWithError_)
  {
    v12 = [v3 objectForKeyedSubscript:@"arguments"];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_22;
    }
    v13 = [v12 objectAtIndexedSubscript:0];
    [v9 analyzer:v6 didFailWithError:v13];
    goto LABEL_21;
  }
  if (v11 == sel_analyzer_didCreateTimelapseFragment_)
  {
    v12 = [v3 objectForKeyedSubscript:@"arguments"];
    if (objc_opt_respondsToSelector())
    {
      v13 = [v12 objectAtIndexedSubscript:0];
      [v9 analyzer:v6 didCreateTimelapseFragment:v13];
      goto LABEL_21;
    }
LABEL_22:

    goto LABEL_23;
  }
  if (v11 == sel_analyzer_didProduceAnalysisStateUpdate_)
  {
    v12 = [v3 objectForKeyedSubscript:@"arguments"];
    v13 = [v12 objectAtIndexedSubscript:0];
    v14 = [v6 analysisStateManager];

    if (v14 && v13)
    {
      v15 = [v6 analysisStateManager];
      [v15 publishLocalState:v13];
    }
    if (objc_opt_respondsToSelector()) {
      [v9 analyzer:v6 didProduceAnalysisStateUpdate:v13];
    }
    goto LABEL_21;
  }
LABEL_23:
}

void __39__HMIVideoAnalyzerClient_ensureSession__block_invoke_217(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x263F087E8] hmiErrorWithCode:-1 description:@"VCPHomeKitAnalysisSession connection was invalidated / interrupted."];
  [WeakRetained _didFailWithError:v1];
}

- (void)_didFailWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMIVideoAnalyzerClient *)self hasFailed])
  {
    v5 = (void *)MEMORY[0x22A641C70]();
    id v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v8;
      _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Analyzer has already failed.", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    HMIErrorLog(self, v4);
    v9 = [(HMIVideoAnalyzer *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v9 analyzer:self didFailWithError:v4];
    }
    [(HMIVideoAnalyzerClient *)self setHasFailed:1];
  }
}

- (void)_sendMessageWithOptions:(id)a3 asynchronous:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v10 = (void *)MEMORY[0x22A641C70]();
  id v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v27 = v13;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Sending Message: %@", buf, 0x16u);
  }
  v14 = [(HMIVideoAnalyzerClient *)v11 ensureSession];
  v15 = v14;
  if (v14)
  {
    workQueue = v11->_workQueue;
    if (v6)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke;
      block[3] = &unk_26477B630;
      id v23 = v14;
      id v24 = v8;
      id v25 = v9;
      dispatch_async(workQueue, block);

      v17 = v23;
    }
    else
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke_3;
      v18[3] = &unk_26477B630;
      id v19 = v14;
      id v20 = v8;
      id v21 = v9;
      dispatch_sync(workQueue, v18);

      v17 = v19;
    }
  }
  else
  {
    v17 = [MEMORY[0x263F087E8] hmiErrorWithCode:-1 description:@"VCPHomeKitAnalysisSession is not available."];
    if (v9) {
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v17);
    }
  }
}

void __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke_2;
  v3[3] = &unk_26477CF18;
  id v4 = *(id *)(a1 + 48);
  [v1 processMessageWithOptions:v2 andCompletionHandler:v3];
}

uint64_t __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke_3(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke_4;
  v7[3] = &unk_26477ECA0;
  id v5 = *(id *)(a1 + 48);
  dispatch_semaphore_t v8 = v2;
  id v9 = v5;
  BOOL v6 = v2;
  [v3 processMessageWithOptions:v4 andCompletionHandler:v7];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __81__HMIVideoAnalyzerClient__sendMessageWithOptions_asynchronous_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v3);
}

- (void)_sendMessage:(SEL)a3 arguments:(id)a4 asynchronous:(BOOL)a5
{
}

- (void)_sendMessage:(SEL)a3 arguments:(id)a4 asynchronous:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  v16[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  v15 = @"selector";
  uint64_t v12 = NSStringFromSelector(a3);
  v16[0] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v14 = (void *)[v13 mutableCopy];

  if (v10) {
    [v14 setObject:v10 forKey:@"arguments"];
  }
  [(HMIVideoAnalyzerClient *)self _sendMessageWithOptions:v14 asynchronous:v7 completionHandler:v11];
}

- (void)handleAssetData:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  v14[2] = *MEMORY[0x263EF8340];
  v14[0] = a3;
  v14[1] = a4;
  id v9 = (void *)MEMORY[0x263EFF8C0];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v9 arrayWithObjects:v14 count:2];

  [(HMIVideoAnalyzerClient *)self _sendMessage:a2 arguments:v13 asynchronous:0 completionHandler:v10];
}

- (void)handleMessageWithOptions:(id)a3 completionHandler:(id)a4
{
}

- (void)flush
{
}

- (void)flushAsync
{
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HMIVideoAnalyzerClient_finishWithCompletionHandler___block_invoke;
  v7[3] = &unk_26477CF18;
  id v8 = v5;
  id v6 = v5;
  [(HMIVideoAnalyzerClient *)self _sendMessage:a2 arguments:0 asynchronous:1 completionHandler:v7];
}

uint64_t __54__HMIVideoAnalyzerClient_finishWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancel
{
}

- (void)setAnalysisFPS:(double)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v5 = [NSNumber numberWithDouble:a3];
  v7[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [(HMIVideoAnalyzerClient *)self _sendMessage:a2 arguments:v6 asynchronous:0];
}

- (void)setMonitored:(BOOL)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v5 = [NSNumber numberWithBool:a3];
  v7[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [(HMIVideoAnalyzerClient *)self _sendMessage:a2 arguments:v6 asynchronous:0];
}

- (void)setEncode:(BOOL)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v5 = [NSNumber numberWithBool:a3];
  v7[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [(HMIVideoAnalyzerClient *)self _sendMessage:a2 arguments:v6 asynchronous:0];
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x22A641C70](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v11 = v6;
    _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Invalidating XPC Connection", buf, 0xCu);
  }
  BOOL v7 = [(HMIVideoAnalyzerClient *)v4 session];

  if (v7)
  {
    id v8 = [(HMIVideoAnalyzerClient *)v4 session];
    [v8 invalidate];
  }
  v9.receiver = v4;
  v9.super_class = (Class)HMIVideoAnalyzerClient;
  [(HMIVideoAnalyzer *)&v9 dealloc];
}

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void)setHasFailed:(BOOL)a3
{
  self->_hasFailed = a3;
}

- (BOOL)sessionCreationAttempted
{
  return self->_sessionCreationAttempted;
}

- (void)setSessionCreationAttempted:(BOOL)a3
{
  self->_sessionCreationAttempted = a3;
}

- (VCPHomeKitAnalysisSession)session
{
  return (VCPHomeKitAnalysisSession *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end