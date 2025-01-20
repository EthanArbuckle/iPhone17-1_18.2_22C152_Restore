@interface IKScriptsEvaluator
- (BOOL)isJingleRequest;
- (IKAppContext)appContext;
- (IKScriptsEvaluator)initWithScripts:(id)a3 withContext:(id)a4 callback:(id)a5 jingleRequest:(BOOL)a6;
- (JSManagedValue)callback;
- (NSArray)scripts;
- (NSMutableArray)records;
- (NSString)identifier;
- (void)_operation:(id)a3 finishedWithResult:(id)a4 error:(id)a5;
- (void)_sendCallback:(id)a3 inContext:(id)a4 success:(BOOL)a5;
- (void)evaluate;
- (void)evaluateScripts;
- (void)handleScirptLoadFailure;
- (void)operation:(id)a3 failedWithError:(id)a4;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
- (void)parseScriptData:(id)a3 successPredicate:(id)a4 completion:(id)a5;
- (void)scriptDidLoadWithID:(id)a3 data:(id)a4 error:(id)a5;
- (void)setAppContext:(id)a3;
- (void)setCallback:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsJingleRequest:(BOOL)a3;
- (void)setRecords:(id)a3;
- (void)setScripts:(id)a3;
@end

@implementation IKScriptsEvaluator

- (IKScriptsEvaluator)initWithScripts:(id)a3 withContext:(id)a4 callback:(id)a5 jingleRequest:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v27.receiver = self;
  v27.super_class = (Class)IKScriptsEvaluator;
  v14 = [(IKScriptsEvaluator *)&v27 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_scripts, a3);
    objc_storeWeak((id *)&v15->_appContext, v12);
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    records = v15->_records;
    v15->_records = v16;

    v15->_isJingleRequest = a6;
    v18 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v19 = [v18 UUIDString];
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v19;

    objc_setAssociatedObject(v12, v15->_identifier, v15, (void *)0x301);
    if (v13)
    {
      v21 = [MEMORY[0x1E4F30928] managedValueWithValue:v13];
      v22 = [v12 jsContext];
      v23 = [v22 virtualMachine];
      v24 = [v12 jsContext];
      v25 = [v24 objectForKeyedSubscript:@"Device"];
      [v23 addManagedReference:v21 withOwner:v25];

      [(IKScriptsEvaluator *)v15 setCallback:v21];
    }
  }

  return v15;
}

- (void)evaluate
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v3 = [(IKScriptsEvaluator *)self scripts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v52 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if ([v7 length])
        {
          v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
          if (v8)
          {
            v9 = objc_alloc_init(IKLoadRecord);
            [(IKLoadRecord *)v9 setURL:v8];
            v10 = [(IKScriptsEvaluator *)self records];
            [v10 addObject:v9];
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v4);
  }

  id v11 = [(IKScriptsEvaluator *)self scripts];
  uint64_t v12 = [v11 count];
  id v13 = [(IKScriptsEvaluator *)self records];
  LOBYTE(v12) = v12 == [v13 count];

  if (v12)
  {
    BOOL v14 = +[IKPreference ignoreHTTPCache];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = [(IKScriptsEvaluator *)self records];
    uint64_t v38 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (!v38) {
      goto LABEL_32;
    }
    BOOL v39 = v14;
    v35 = v43;
    uint64_t v37 = *(void *)v47;
    while (1)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v47 != v37) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v46 + 1) + 8 * v15);
        v17 = objc_opt_new();
        v18 = v17;
        if (v39) {
          objc_msgSend(v17, "setCachePolicy:", v39, v35);
        }
        uint64_t v19 = objc_msgSend(v16, "URL", v35);
        [v18 setURL:v19];

        [v18 setAllowedRetryCount:0];
        [v18 setTimeoutInterval:30.0];
        v20 = [(IKScriptsEvaluator *)self appContext];
        v21 = [v20 delegate];
        if (objc_opt_respondsToSelector())
        {
          v22 = [v21 sourceApplicationBundleIdentifierForContext:v20];
          [v18 setClientAuditBundleIdentifier:v22];
        }
        if (objc_opt_respondsToSelector())
        {
          v23 = [v21 sourceApplicationAuditTokenDataForContext:v20];
          [v18 setClientAuditTokenData:v23];
        }
        if (self->_isJingleRequest)
        {
          +[IKJSITunesStore setITunesStoreHeaders:v18];
          id v24 = objc_alloc_init(MEMORY[0x1E4FB8858]);
          [v24 setNeedsURLBag:0];
          [v24 setUrlKnownToBeTrusted:1];
LABEL_27:
          [v24 setDelegate:self];
          objc_super v27 = objc_opt_new();
          [v24 setDataProvider:v27];

          [v24 setRequestProperties:v18];
          objc_initWeak(&location, v24);
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __30__IKScriptsEvaluator_evaluate__block_invoke_3;
          v40[3] = &unk_1E6DE4158;
          v40[4] = self;
          objc_copyWeak(&v41, &location);
          [v24 setCompletionBlock:v40];
          [v16 setOpertaion:v24];
          v28 = [MEMORY[0x1E4FB8838] mainQueue];
          [v28 addOperation:v24];

          objc_destroyWeak(&v41);
          objc_destroyWeak(&location);
          goto LABEL_28;
        }
        v25 = [v20 app];
        int v26 = [v25 appIsTrusted];

        if (v26)
        {
          id v24 = objc_alloc_init(MEMORY[0x1E4FB8868]);
          [v24 _setUsesPrivateCookieStore:0];
          goto LABEL_27;
        }
        v29 = [MEMORY[0x1E4F29128] UUID];
        [v16 setRequestID:v29];

        id v24 = [MEMORY[0x1E4F290E0] sharedSession];
        objc_initWeak(&location, self);
        v30 = [v18 URL];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v43[0] = __30__IKScriptsEvaluator_evaluate__block_invoke_2;
        v43[1] = &unk_1E6DE4130;
        objc_copyWeak(&v44, &location);
        v43[2] = v16;
        v31 = [v24 dataTaskWithURL:v30 completionHandler:v42];

        [v16 setDataTask:v31];
        [v31 resume];

        objc_destroyWeak(&v44);
        objc_destroyWeak(&location);
LABEL_28:

        ++v15;
      }
      while (v38 != v15);
      uint64_t v32 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
      uint64_t v38 = v32;
      if (!v32)
      {
LABEL_32:

        return;
      }
    }
  }
  v33 = [(IKScriptsEvaluator *)self callback];

  if (v33)
  {
    v34 = [(IKScriptsEvaluator *)self appContext];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __30__IKScriptsEvaluator_evaluate__block_invoke;
    v50[3] = &unk_1E6DE4108;
    v50[4] = self;
    [v34 addPostEvaluateBlock:v50];
  }
}

void __30__IKScriptsEvaluator_evaluate__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 callback];
  [v2 _sendCallback:v4 inContext:v3 success:0];
}

void __30__IKScriptsEvaluator_evaluate__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v6 = (id *)(a1 + 40);
  id v7 = a4;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  v9 = [*(id *)(a1 + 32) requestID];
  [WeakRetained scriptDidLoadWithID:v9 data:v8 error:v7];
}

void __30__IKScriptsEvaluator_evaluate__block_invoke_3(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ITMLKitErrorDomain" code:101 userInfo:0];
  v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v2 _operation:WeakRetained finishedWithResult:0 error:v4];
}

- (void)parseScriptData:(id)a3 successPredicate:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (unsigned int (**)(id, void *))a4;
  v10 = (void (**)(id, uint64_t, void *))a5;
  id obj = self;
  objc_sync_enter(obj);
  if ([v8 length]) {
    id v11 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
  }
  else {
    id v11 = 0;
  }
  if ([v11 length])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = [(IKScriptsEvaluator *)obj records];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v22;
      char v15 = 1;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          char v18 = [v17 loadCompleted];
          if (v9) {
            char v19 = v18;
          }
          else {
            char v19 = 1;
          }
          if (v19)
          {
            v15 &= v18;
          }
          else if (v9[2](v9, v17))
          {
            [v17 setLoadCompleted:1];
            [v17 setScriptStr:v11];
            if (v10) {
              v10[2](v10, 1, v17);
            }
          }
          else
          {
            char v15 = 0;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);

      if ((v15 & 1) == 0) {
        goto LABEL_27;
      }
    }
    else
    {
    }
    [(IKScriptsEvaluator *)obj evaluateScripts];
    goto LABEL_27;
  }
  [(IKScriptsEvaluator *)obj handleScirptLoadFailure];
  if (v10) {
    v10[2](v10, 0, 0);
  }
LABEL_27:

  objc_sync_exit(obj);
}

- (void)scriptDidLoadWithID:(id)a3 data:(id)a4 error:(id)a5
{
  id v7 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__IKScriptsEvaluator_scriptDidLoadWithID_data_error___block_invoke;
  v10[3] = &unk_1E6DE4180;
  id v11 = v7;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__IKScriptsEvaluator_scriptDidLoadWithID_data_error___block_invoke_2;
  v9[3] = &unk_1E6DE41A8;
  v9[4] = self;
  id v8 = v7;
  [(IKScriptsEvaluator *)self parseScriptData:a4 successPredicate:v10 completion:v9];
}

uint64_t __53__IKScriptsEvaluator_scriptDidLoadWithID_data_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 requestID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __53__IKScriptsEvaluator_scriptDidLoadWithID_data_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    [a3 setDataTask:0];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = objc_msgSend(*(id *)(a1 + 32), "records", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * i) dataTask];
          [v8 cancel];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (void)handleScirptLoadFailure
{
  if (self->_callback)
  {
    objc_initWeak(&location, self);
    id v3 = [(IKScriptsEvaluator *)self appContext];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __45__IKScriptsEvaluator_handleScirptLoadFailure__block_invoke;
    v4[3] = &unk_1E6DE3DE0;
    objc_copyWeak(&v5, &location);
    [v3 evaluate:v4 completionBlock:0];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __45__IKScriptsEvaluator_handleScirptLoadFailure__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained[4];
    if (v5) {
      [WeakRetained _sendCallback:v5 inContext:v6 success:0];
    }
  }
}

- (void)evaluateScripts
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = [(IKScriptsEvaluator *)self records];
  uint64_t v5 = [v3 arrayWithArray:v4];

  objc_initWeak(&location, self);
  id v6 = [(IKScriptsEvaluator *)self appContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__IKScriptsEvaluator_evaluateScripts__block_invoke;
  v8[3] = &unk_1E6DE41D0;
  id v7 = v5;
  id v9 = v7;
  objc_copyWeak(&v10, &location);
  [v6 evaluate:v8 completionBlock:0];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __37__IKScriptsEvaluator_evaluateScripts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v22 = a1;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    char v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v11 = (const OpaqueJSContext *)[v3 JSGlobalContextRef];
        JSStringRef v12 = JSStringCreateWithCFString((CFStringRef)[v10 scriptStr]);
        if (v12)
        {
          uint64_t v13 = v12;
          JSValueRef exception = 0;
          uint64_t v14 = [v10 URL];
          char v15 = JSStringCreateWithCFString((CFStringRef)[v14 absoluteString]);

          if (!JSEvaluateScript(v11, v13, 0, v15, 1, &exception))
          {
            v16 = [MEMORY[0x1E4F30938] valueWithJSValueRef:exception inContext:v3];
            v17 = ITMLKitGetLogObject(0);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              char v18 = [v16 toDictionary];
              *(_DWORD *)buf = 138412546;
              v29 = v16;
              __int16 v30 = 2112;
              v31 = v18;
              _os_log_error_impl(&dword_1E2ACE000, v17, OS_LOG_TYPE_ERROR, "Failed to evaluate Script: %@...%@", buf, 0x16u);
            }
            char v8 = 0;
          }
          JSStringRelease(v15);
          JSStringRelease(v13);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v6);
  }
  else
  {
    char v8 = 1;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(v22 + 40));
  v20 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v21 = WeakRetained[4];
    if (v21) {
      [WeakRetained _sendCallback:v21 inContext:v3 success:v8 & 1];
    }
  }
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1C9B8] data];
  }
  [(IKScriptsEvaluator *)self _operation:v7 finishedWithResult:v6 error:0];
}

- (void)_operation:(id)a3 finishedWithResult:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1C9B8] data];
  }
  id v10 = v9;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  char v19 = __58__IKScriptsEvaluator__operation_finishedWithResult_error___block_invoke;
  v20 = &unk_1E6DE4180;
  id v21 = v7;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __58__IKScriptsEvaluator__operation_finishedWithResult_error___block_invoke_2;
  char v15 = &unk_1E6DE41A8;
  v16 = self;
  id v11 = v7;
  [(IKScriptsEvaluator *)self parseScriptData:v10 successPredicate:&v17 completion:&v12];
  objc_msgSend(v11, "setDelegate:", 0, v12, v13, v14, v15, v16, v17, v18, v19, v20);
  [v11 setCompletionBlock:0];
}

BOOL __58__IKScriptsEvaluator__operation_finishedWithResult_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 opertaion];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __58__IKScriptsEvaluator__operation_finishedWithResult_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    [a3 setOpertaion:0];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = objc_msgSend(*(id *)(a1 + 32), "records", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          id v9 = [v8 opertaion];
          [v9 setDelegate:0];

          id v10 = [v8 opertaion];
          [v10 setCompletionBlock:0];

          id v11 = [v8 opertaion];
          [v11 cancel];

          [v8 setOpertaion:0];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
}

- (void)_sendCallback:(id)a3 inContext:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = [v8 value];
    id v11 = [NSNumber numberWithBool:v5];
    v18[0] = v11;
    long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v13 = (id)[v10 callWithArguments:v12];

    long long v14 = [v9 virtualMachine];
    long long v15 = [v9 objectForKeyedSubscript:@"Device"];
    [v14 removeManagedReference:v8 withOwner:v15];
  }
  v16 = +[IKAppContext currentAppContext];
  if (v16)
  {
    uint64_t v17 = [(IKScriptsEvaluator *)self identifier];
    objc_setAssociatedObject(v16, v17, 0, (void *)0x301);
  }
}

- (BOOL)isJingleRequest
{
  return self->_isJingleRequest;
}

- (void)setIsJingleRequest:(BOOL)a3
{
  self->_isJingleRequest = a3;
}

- (NSArray)scripts
{
  return self->_scripts;
}

- (void)setScripts:(id)a3
{
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (void)setAppContext:(id)a3
{
}

- (JSManagedValue)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_callback, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_scripts, 0);
}

@end