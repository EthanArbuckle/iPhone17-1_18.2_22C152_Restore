@interface INCExtensionRequest
+ (void)initialize;
- (BOOL)requiresTCC;
- (BOOL)requiresTrustCheck;
- (INCExtensionRequest)initWithIdentifier:(id)a3;
- (NSArray)extensionInputItems;
- (NSError)_error;
- (NSExtension)_extension;
- (NSString)identifier;
- (id)_extensionContextHost;
- (id)_requestOperationQueue;
- (void)_resetContextTimer;
- (void)_resetExtensionContextHostWithCompletion:(id)a3;
- (void)_scheduleContextTimer;
- (void)_setError:(id)a3;
- (void)_setExtension:(id)a3;
- (void)reset;
- (void)setExtensionInputItems:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRequiresTCC:(BOOL)a3;
- (void)setRequiresTrustCheck:(BOOL)a3;
- (void)startRequestForIntent:(id)a3 completion:(id)a4;
@end

@implementation INCExtensionRequest

- (INCExtensionRequest)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INCExtensionRequest;
  v6 = [(INCExtensionRequest *)&v11 init];
  if (v6)
  {
    INLogInitIfNeeded();
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v8 = dispatch_queue_create("INCExtensionRequestQueue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_identifier, a3);
    *(_WORD *)&v6->_requiresTCC = 257;
  }
  return v6;
}

- (NSArray)extensionInputItems
{
  return self->_extensionInputItems;
}

- (void)setExtensionInputItems:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__INCExtensionRequest_setExtensionInputItems___block_invoke;
  v7[3] = &unk_1E62BB2D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startRequestForIntent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke;
    block[3] = &unk_1E62BBC18;
    block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(queue, block);
  }
}

uint64_t __46__INCExtensionRequest_setExtensionInputItems___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  return [v2 _resetExtensionContextHostWithCompletion:0];
}

- (void)_resetExtensionContextHostWithCompletion:(id)a3
{
  id v4 = a3;
  [(INCExtensionRequest *)self _resetContextTimer];
  id v5 = [(INCExtensionRequest *)self _extensionContextHost];
  id v6 = [v5 _auxiliaryConnection];
  id v8 = [v6 remoteObjectProxy];

  if (v4) {
    id v7 = v4;
  }
  else {
    id v7 = &__block_literal_global;
  }
  [v8 completeTransactionWithIntentIdentifier:self->_identifier completion:v7];
}

- (void)_resetContextTimer
{
  [(INWatchdogTimer *)self->_contextTimer cancel];
  contextTimer = self->_contextTimer;
  self->_contextTimer = 0;
}

- (id)_extensionContextHost
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  extension = self->_extension;
  if (extension && self->_requestIdentifier)
  {
    id v4 = -[NSExtension _extensionContextForUUID:](extension, "_extensionContextForUUID:");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_8;
    }
    id v5 = (void *)*MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      id v7 = v5;
      id v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      int v10 = 136315394;
      id v11 = "-[INCExtensionRequest _extensionContextHost]";
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_error_impl(&dword_1BC57D000, v7, OS_LOG_TYPE_ERROR, "%s Unexpected extension context class %@", (uint8_t *)&v10, 0x16u);
    }
  }
  id v4 = 0;
LABEL_8:
  return v4;
}

void __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke(id *a1)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_2;
  v12[3] = &unk_1E62BBC18;
  v12[4] = a1[4];
  id v14 = a1[6];
  id v13 = a1[5];
  v2 = (void (**)(void))MEMORY[0x1C1872DC0](v12);
  v3 = [a1[4] _extensionContextHost];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 _auxiliaryConnection];
    id v6 = [v5 remoteObjectProxy];
    if (v6)
    {
      id v7 = (void (**)(id, void *, void *, void))a1[6];
      id v8 = [a1[4] _extension];
      v7[2](v7, v8, v4, 0);

      [a1[4] _scheduleContextTimer];
    }
    else
    {
      id v9 = a1[4];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_6;
      v10[3] = &unk_1E62BBAB0;
      id v11 = v2;
      [v9 _resetExtensionContextHostWithCompletion:v10];
    }
  }
  else
  {
    v2[2](v2);
  }
}

void __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _requestOperationQueue];
  [v2 setSuspended:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_3;
  v10[3] = &unk_1E62BBB28;
  id v3 = *(id *)(a1 + 48);
  void v10[4] = *(void *)(a1 + 32);
  id v11 = v3;
  [v2 addOperationWithBlock:v10];
  if ((unint64_t)[v2 operationCount] <= 1)
  {
    id v4 = +[INCExtensionManager sharedManager];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) extensionInputItems];
    uint64_t v7 = [*(id *)(a1 + 32) requiresTCC];
    uint64_t v8 = [*(id *)(a1 + 32) requiresTrustCheck];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_4;
    v9[3] = &unk_1E62BB078;
    v9[4] = *(void *)(a1 + 32);
    [v4 fetchExtensionForIntent:v5 extensionInputItems:v6 requiresTCC:v7 requiresTrustCheck:v8 completion:v9];
  }
}

- (id)_requestOperationQueue
{
  requestOperationQueue = self->_requestOperationQueue;
  if (!requestOperationQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    uint64_t v5 = self->_requestOperationQueue;
    self->_requestOperationQueue = v4;

    [(NSOperationQueue *)self->_requestOperationQueue setMaxConcurrentOperationCount:1];
    requestOperationQueue = self->_requestOperationQueue;
  }
  return requestOperationQueue;
}

- (BOOL)requiresTCC
{
  return self->_requiresTCC;
}

void __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = *(void **)(a1 + 32);
  id v10 = a4;
  [v9 _setExtension:v7];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a3);
  [*(id *)(a1 + 32) _setError:v10];

  id v11 = [*(id *)(a1 + 32) _extensionContextHost];
  if (v11)
  {
    __int16 v12 = [v7 _extensionBundle];
    [v11 setExtensionBundle:v12];

    [*(id *)(a1 + 32) _scheduleContextTimer];
  }
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(NSObject **)(v13 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_5;
  block[3] = &unk_1E62BB3E8;
  block[4] = v13;
  dispatch_async(v14, block);
}

- (void)_setExtension:(id)a3
{
}

- (void)_setError:(id)a3
{
}

- (void)_scheduleContextTimer
{
  [(INCExtensionRequest *)self _resetContextTimer];
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F30840]);
  queue = self->_queue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __44__INCExtensionRequest__scheduleContextTimer__block_invoke;
  id v10 = &unk_1E62BB480;
  objc_copyWeak(&v11, &location);
  uint64_t v5 = (INWatchdogTimer *)[v3 initWithTimeoutInterval:queue onQueue:&v7 timeoutHandler:120.0];
  contextTimer = self->_contextTimer;
  self->_contextTimer = v5;

  [(INWatchdogTimer *)self->_contextTimer start];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _requestOperationQueue];
  [v1 setSuspended:0];
}

void __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) _extension];
  id v3 = [*(id *)(a1 + 32) _extensionContextHost];
  id v4 = [*(id *)(a1 + 32) _error];
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);
}

- (NSExtension)_extension
{
  return self->_extension;
}

- (NSError)_error
{
  return self->_error;
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__INCExtensionRequest_reset__block_invoke;
  block[3] = &unk_1E62BB3E8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __28__INCExtensionRequest_reset__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[INCExtensionRequest reset]_block_invoke";
    _os_log_impl(&dword_1BC57D000, v2, OS_LOG_TYPE_INFO, "%s Reset extension request", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _resetExtensionContextHostWithCompletion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionInputItems, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_requestOperationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_contextTimer, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

- (void)setRequiresTrustCheck:(BOOL)a3
{
  self->_requiresTrustCheck = a3;
}

- (BOOL)requiresTrustCheck
{
  return self->_requiresTrustCheck;
}

- (void)setRequiresTCC:(BOOL)a3
{
  self->_requiresTCC = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

void __44__INCExtensionRequest__scheduleContextTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _extensionContextHost];
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 _auxiliaryConnection];
    int v4 = [v3 remoteObjectProxy];

    id v5 = [WeakRetained identifier];
    [v4 cancelTransactionDueToTimeoutWithIntentIdentifier:v5 completion:&__block_literal_global_8];
  }
}

uint64_t __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    INLogInitIfNeeded();
  }
}

@end