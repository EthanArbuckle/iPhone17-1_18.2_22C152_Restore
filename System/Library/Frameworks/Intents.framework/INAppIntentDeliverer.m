@interface INAppIntentDeliverer
- (INAppIntentDeliverer)initWithBundleIdentifier:(id)a3;
- (INAppIntentDeliverer)initWithBundleIdentifier:(id)a3 intentForwardingAction:(id)a4;
- (INIntentBackgroundHandlingAssertion)auxiliaryAssertion;
- (INIntentForwardingAction)intentForwardingAction;
- (INWatchdogTimer)requestTimer;
- (NSString)bundleIdentifier;
- (OS_dispatch_queue)queue;
- (RBSAssertion)processAssertion;
- (RBSProcessMonitor)processMonitor;
- (id)completionBlock;
- (void)_deliverIntentForwardingActionWithResponseHandler:(id)a3;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)completeWithIntentForwardingActionResponse:(id)a3;
- (void)dealloc;
- (void)deliverIntent:(id)a3 reply:(id)a4;
- (void)deliverIntentForwardingActionWithResponseHandler:(id)a3;
- (void)invalidateIntentDelivery;
- (void)setAuxiliaryAssertion:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setRequestTimer:(id)a3;
@end

@implementation INAppIntentDeliverer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryAssertion, 0);
  objc_storeStrong((id *)&self->_requestTimer, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_intentForwardingAction, 0);
}

- (void)setAuxiliaryAssertion:(id)a3
{
}

- (INIntentBackgroundHandlingAssertion)auxiliaryAssertion
{
  return self->_auxiliaryAssertion;
}

- (void)setRequestTimer:(id)a3
{
}

- (INWatchdogTimer)requestTimer
{
  return self->_requestTimer;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (RBSAssertion)processAssertion
{
  return self->_processAssertion;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (INIntentForwardingAction)intentForwardingAction
{
  return self->_intentForwardingAction;
}

- (void)completeWithIntentForwardingActionResponse:(id)a3
{
  id v4 = a3;
  v5 = [(INAppIntentDeliverer *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__INAppIntentDeliverer_completeWithIntentForwardingActionResponse___block_invoke;
  v7[3] = &unk_1E551F790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__INAppIntentDeliverer_completeWithIntentForwardingActionResponse___block_invoke(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) completionBlock];
  [*(id *)(a1 + 32) setCompletionBlock:0];
  v2 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
    v2 = (void *)v3;
  }
}

- (void)invalidateIntentDelivery
{
  uint64_t v3 = [(INAppIntentDeliverer *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__INAppIntentDeliverer_invalidateIntentDelivery__block_invoke;
  block[3] = &unk_1E55208F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __48__INAppIntentDeliverer_invalidateIntentDelivery__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) requestTimer];
  [v2 cancel];

  [*(id *)(a1 + 32) setRequestTimer:0];
  uint64_t v3 = [*(id *)(a1 + 32) auxiliaryAssertion];
  [v3 invalidate];

  [*(id *)(a1 + 32) setAuxiliaryAssertion:0];
  id v4 = [*(id *)(a1 + 32) processAssertion];
  id v5 = 0;
  if ([v4 isValid])
  {
    id v8 = 0;
    char v6 = [v4 invalidateWithError:&v8];
    id v5 = v8;
    if ((v6 & 1) == 0)
    {
      v7 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v10 = "-[INAppIntentDeliverer invalidateIntentDelivery]_block_invoke";
        __int16 v11 = 2114;
        id v12 = v5;
        _os_log_error_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_ERROR, "%s Failed to invalidate process assertion: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)_deliverIntentForwardingActionWithResponseHandler:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(INIntentForwardingAction *)self->_intentForwardingAction intent];
  objc_initWeak(&location, self);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke;
  v35[3] = &unk_1E5519320;
  objc_copyWeak(&v37, &location);
  id v6 = v4;
  id v36 = v6;
  [(INAppIntentDeliverer *)self setCompletionBlock:v35];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2050000000;
  v7 = (void *)getUISIntentForwardingActionClass_softClass;
  uint64_t v42 = getUISIntentForwardingActionClass_softClass;
  if (!getUISIntentForwardingActionClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getUISIntentForwardingActionClass_block_invoke;
    v45 = &unk_1E5520EB8;
    v46 = &v39;
    __getUISIntentForwardingActionClass_block_invoke((uint64_t)buf);
    v7 = (void *)v40[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v39, 8);
  id v9 = [v8 alloc];
  intentForwardingAction = self->_intentForwardingAction;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_3;
  v34[3] = &unk_1E5519348;
  v34[4] = self;
  __int16 v11 = (void *)[v9 initWithIntentForwardingAction:intentForwardingAction responseHandler:v34];
  id v12 = [(INAppIntentDeliverer *)self bundleIdentifier];
  id v33 = 0;
  uint64_t v13 = objc_msgSend(v5, "_intents_backgroundHandlingAssertionForBundleIdentifier:context:error:", v12, 0, &v33);
  id v14 = v33;
  [(INAppIntentDeliverer *)self setAuxiliaryAssertion:v13];

  if (v14)
  {
    v15 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "responseClass")), "initWithError:", v14);
    [(INAppIntentDeliverer *)self completeWithIntentForwardingActionResponse:v15];
  }
  else
  {
    INIssueSandboxExtensionsForFileURLEnumerable(v5);
    id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v43 = v11;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    v15 = objc_msgSend(v16, "initWithObjectsAndKeys:", v17, *MEMORY[0x1E4F625E0], 0);

    if (!-[INIntentForwardingAction allowsForegroundAppLaunch](self->_intentForwardingAction, "allowsForegroundAppLaunch")|| [v5 _type] != 2|| objc_msgSend(v5, "_type") == 2&& (objc_msgSend(v5, "_codableDescription"), v18 = objc_claimAutoreleasedReturnValue(), char v19 = objc_msgSend(v18, "isForeground"), v18, (v19 & 1) == 0))
    {
      [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F625F8]];
      id v20 = objc_alloc(MEMORY[0x1E4F223C8]);
      v21 = [(INAppIntentDeliverer *)self bundleIdentifier];
      id v32 = 0;
      v22 = (void *)[v20 initWithBundleIdentifier:v21 allowPlaceholder:0 error:&v32];
      id v23 = v32;

      if (v23)
      {
        v24 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[INAppIntentDeliverer _deliverIntentForwardingActionWithResponseHandler:]";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v23;
          _os_log_error_impl(&dword_18CB2F000, v24, OS_LOG_TYPE_ERROR, "%s Failed to get application record: %{public}@", buf, 0x16u);
        }
      }
      v25 = NSNumber;
      if ([v22 supportsMultiwindow]) {
        BOOL v26 = [(INIntentForwardingAction *)self->_intentForwardingAction allowsScenelessAppLaunch];
      }
      else {
        BOOL v26 = 0;
      }
      v27 = [v25 numberWithInt:v26];
      [v15 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4FA7120]];
    }
    v28 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
    v29 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v15];
    v30 = [(INAppIntentDeliverer *)self bundleIdentifier];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_28;
    v31[3] = &unk_1E5519398;
    v31[4] = self;
    [v28 openApplication:v30 withOptions:v29 completion:v31];
  }
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

void __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_time_t v5 = dispatch_time(0, 2000000000);
    id v6 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_2;
    block[3] = &unk_1E55208F8;
    id v8 = WeakRetained;
    dispatch_after(v5, v6, block);

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeWithIntentForwardingActionResponse:a2];
}

void __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_time_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = [*(id *)(a1 + 32) intentForwardingAction];
    v7 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "responseClass")), "initWithError:", v4);
    [v5 completeWithIntentForwardingActionResponse:v7];
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) processAssertion];
    id v16 = 0;
    char v9 = [v8 acquireWithError:&v16];
    id v10 = v16;

    if (v9)
    {
      __int16 v11 = [*(id *)(a1 + 32) queue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_29;
      v15[3] = &unk_1E55208F8;
      v15[4] = *(void *)(a1 + 32);
      dispatch_sync(v11, v15);
    }
    else
    {
      id v12 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[INAppIntentDeliverer _deliverIntentForwardingActionWithResponseHandler:]_block_invoke";
        __int16 v19 = 2114;
        id v20 = v10;
        _os_log_error_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_ERROR, "%s Failed to acquire assertion: %{public}@", buf, 0x16u);
      }
      uint64_t v13 = *(void **)(a1 + 32);
      __int16 v11 = [v13 intentForwardingAction];
      id v14 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "responseClass")), "initWithError:", v10);
      [v13 completeWithIntentForwardingActionResponse:v14];
    }
  }
}

void __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_29(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) requestTimeout];
  double v3 = v2;
  id v4 = [INWatchdogTimer alloc];
  dispatch_time_t v5 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_2_31;
  v7[3] = &unk_1E5519370;
  v7[4] = *(void *)(a1 + 32);
  *(double *)&void v7[5] = v3;
  id v6 = [(INWatchdogTimer *)v4 initWithTimeoutInterval:v5 onQueue:v7 timeoutHandler:v3];

  [*(id *)(a1 + 32) setRequestTimer:v6];
  [(INWatchdogTimer *)v6 start];
}

void __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_2_31(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v2 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v7 = *(void **)(a1 + 32);
    id v8 = v2;
    char v9 = [v7 bundleIdentifier];
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 136315650;
    id v12 = "-[INAppIntentDeliverer _deliverIntentForwardingActionWithResponseHandler:]_block_invoke_2";
    __int16 v13 = 2114;
    id v14 = v9;
    __int16 v15 = 2050;
    uint64_t v16 = v10;
    _os_log_error_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_ERROR, "%s Handle intent request for %{public}@ timed out after %{public}.2f seconds", (uint8_t *)&v11, 0x20u);
  }
  double v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IntentsErrorDomain" code:1314 userInfo:MEMORY[0x1E4F1CC08]];
  id v4 = *(void **)(a1 + 32);
  dispatch_time_t v5 = [v4 intentForwardingAction];
  id v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "responseClass")), "initWithError:", v3);
  [v4 completeWithIntentForwardingActionResponse:v6];
}

uint64_t __74__INAppIntentDeliverer__deliverIntentForwardingActionWithResponseHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateIntentDelivery];
}

- (void)deliverIntent:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(INAppIntentDeliverer *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__INAppIntentDeliverer_deliverIntent_reply___block_invoke;
  block[3] = &unk_1E551DEF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __44__INAppIntentDeliverer_deliverIntent_reply___block_invoke(uint64_t a1)
{
  double v2 = [(INIntentForwardingAction *)[INHandleIntentForwardingAction alloc] initWithIntent:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  dispatch_time_t v5 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__INAppIntentDeliverer_deliverIntent_reply___block_invoke_2;
  v6[3] = &unk_1E55192F8;
  id v7 = *(id *)(a1 + 48);
  [v5 _deliverIntentForwardingActionWithResponseHandler:v6];
}

void __44__INAppIntentDeliverer_deliverIntent_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 intentResponse];
  id v4 = [v3 error];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

- (void)deliverIntentForwardingActionWithResponseHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(INAppIntentDeliverer *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__INAppIntentDeliverer_deliverIntentForwardingActionWithResponseHandler___block_invoke;
  v7[3] = &unk_1E551F740;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __73__INAppIntentDeliverer_deliverIntentForwardingActionWithResponseHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deliverIntentForwardingActionWithResponseHandler:*(void *)(a1 + 40)];
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [(INAppIntentDeliverer *)self processMonitor];
  id v7 = [v6 states];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (!v8)
  {

LABEL_12:
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IntentsErrorDomain" code:1312 userInfo:MEMORY[0x1E4F1CC08]];
    uint64_t v16 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "responseClass")), "initWithError:", v14);
    [(INAppIntentDeliverer *)self completeWithIntentForwardingActionResponse:v16];

    uint64_t v17 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      __int16 v19 = [(INAppIntentDeliverer *)self bundleIdentifier];
      *(_DWORD *)buf = 136315650;
      v25 = "-[INAppIntentDeliverer assertion:didInvalidateWithError:]";
      __int16 v26 = 2114;
      v27 = v19;
      __int16 v28 = 2114;
      id v29 = v5;
      _os_log_error_impl(&dword_18CB2F000, v18, OS_LOG_TYPE_ERROR, "%s Intent delivery failed because %{public}@ appears to have crashed: %{public}@", buf, 0x20u);
    }
    goto LABEL_14;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v21;
  int v11 = 1;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(v7);
      }
      v11 &= [*(id *)(*((void *)&v20 + 1) + 8 * i) taskState];
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
  }
  while (v9);

  if (v11) {
    goto LABEL_12;
  }
  id v13 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    id v14 = v13;
    __int16 v15 = [(INAppIntentDeliverer *)self bundleIdentifier];
    *(_DWORD *)buf = 136315650;
    v25 = "-[INAppIntentDeliverer assertion:didInvalidateWithError:]";
    __int16 v26 = 2114;
    v27 = v15;
    __int16 v28 = 2114;
    id v29 = v5;
    _os_log_error_impl(&dword_18CB2F000, v14, OS_LOG_TYPE_ERROR, "%s Intent delivery assertion for %{public}@ was dropped after timeout: %{public}@", buf, 0x20u);

LABEL_14:
  }
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(RBSProcessMonitor *)self->_processMonitor invalidate];
  if ([(RBSAssertion *)self->_processAssertion isValid])
  {
    processAssertion = self->_processAssertion;
    id v8 = 0;
    char v4 = [(RBSAssertion *)processAssertion invalidateWithError:&v8];
    id v5 = v8;
    if ((v4 & 1) == 0)
    {
      id v6 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v10 = "-[INAppIntentDeliverer dealloc]";
        __int16 v11 = 2114;
        id v12 = v5;
        _os_log_error_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_ERROR, "%s Failed to invalidate process assertion: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  v7.receiver = self;
  v7.super_class = (Class)INAppIntentDeliverer;
  [(INAppIntentDeliverer *)&v7 dealloc];
}

- (INAppIntentDeliverer)initWithBundleIdentifier:(id)a3 intentForwardingAction:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)INAppIntentDeliverer;
  id v8 = [(INAppIntentDeliverer *)&v27 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_intentForwardingAction, a4);
    dispatch_queue_t v11 = dispatch_queue_create("INAppIntentDeliverer", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [MEMORY[0x1E4F96408] identityForEmbeddedApplicationIdentifier:v6];
    id v14 = [MEMORY[0x1E4F96478] targetWithProcessIdentity:v13];
    __int16 v15 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.siri" name:@"IntentStartupGrant"];
    v28[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F96318]) initWithExplanation:@"AppIntentDeliverer" target:v14 attributes:v16];
    processAssertion = v8->_processAssertion;
    v8->_processAssertion = (RBSAssertion *)v17;

    [(RBSAssertion *)v8->_processAssertion addObserver:v8];
    __int16 v19 = (void *)MEMORY[0x1E4F96418];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __72__INAppIntentDeliverer_initWithBundleIdentifier_intentForwardingAction___block_invoke;
    v25[3] = &unk_1E55192D0;
    id v26 = v14;
    id v20 = v14;
    uint64_t v21 = [v19 monitorWithConfiguration:v25];
    processMonitor = v8->_processMonitor;
    v8->_processMonitor = (RBSProcessMonitor *)v21;

    long long v23 = v8;
  }

  return v8;
}

void __72__INAppIntentDeliverer_initWithBundleIdentifier_intentForwardingAction___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F96430];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 predicateMatching:v3];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v4 setPredicates:v6];

  id v7 = [MEMORY[0x1E4F96448] descriptor];
  [v7 setValues:1];
  [v4 setStateDescriptor:v7];
}

- (INAppIntentDeliverer)initWithBundleIdentifier:(id)a3
{
  return [(INAppIntentDeliverer *)self initWithBundleIdentifier:a3 intentForwardingAction:0];
}

@end