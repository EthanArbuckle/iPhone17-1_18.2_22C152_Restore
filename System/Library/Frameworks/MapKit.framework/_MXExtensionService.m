@interface _MXExtensionService
+ (id)extensionCompletionQueue;
- (NSExtension)realExtension;
- (NSUUID)connectionIdentifier;
- (NSUUID)serviceIdentifier;
- (UIViewController)remoteViewController;
- (_MXExtension)extensionProxy;
- (_MXExtensionService)init;
- (_MXExtensionService)initWithExtensionProxy:(id)a3;
- (_MXExtensionURLHandling)URLHandlingDelegate;
- (id)_errorForIntent:(id)a3;
- (id)_errorForIntentResponse:(id)a3 withExpectResponseClass:(Class)a4;
- (id)_errorForIntentVendorContext:(id)a3;
- (id)_handleOrConfirmIntent:(id)a3 expectResponseClass:(Class)a4 isHandle:(BOOL)a5 withCompletion:(id)a6;
- (id)confirmIntent:(id)a3 expectResponseClass:(Class)a4 withCompletion:(id)a5;
- (id)context;
- (id)description;
- (id)handleIntent:(id)a3 expectResponseClass:(Class)a4 withCompletion:(id)a5;
- (id)handleRequest:(id)a3 requestDispatcher:(id)a4 completion:(id)a5;
- (id)intentResponseObserverProxy;
- (id)resolveIntentSlot:(id)a3 forIntent:(id)a4 completionBlock:(id)a5;
- (id)startSendingUpdatesForIntent:(id)a3 toObserver:(id)a4;
- (id)startSendingUpdatesForRequest:(id)a3 requestDispatcher:(id)a4 toObserver:(id)a5;
- (id)vendorContextWithErrorHandler:(id)a3;
- (int)processIdentifier;
- (unint64_t)state;
- (void)_completeOrCancelTransaction:(BOOL)a3 withIntentIdentifier:(id)a4 completion:(id)a5;
- (void)_connectExtensionWithRemoteViewControllerNeeded:(BOOL)a3 Handler:(id)a4;
- (void)cancelTransactionDueToTimeoutWithIntentIdentifier:(id)a3 completion:(id)a4;
- (void)completeTransactionWithIntentIdentifier:(id)a3 completion:(id)a4;
- (void)connectExtensionWithHandler:(id)a3;
- (void)connectExtensionWithRemoteViewControllerNeeded:(BOOL)a3 Handler:(id)a4;
- (void)connectUIExtensionWithHandler:(id)a3;
- (void)dealloc;
- (void)disconnectExtension;
- (void)handleIntent:(id)a3 expectResponseClass:(Class)a4 completion:(id)a5;
- (void)setConnectionIdentifier:(id)a3;
- (void)setIntentResponseObserverProxy:(id)a3;
- (void)setRealExtension:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setURLHandlingDelegate:(id)a3;
- (void)stopSendingUpdatesForIntent:(id)a3;
- (void)stopSendingUpdatesForRequest:(id)a3 requestDispatcher:(id)a4;
@end

@implementation _MXExtensionService

+ (id)extensionCompletionQueue
{
  if (_MergedGlobals_141 != -1) {
    dispatch_once(&_MergedGlobals_141, &__block_literal_global_31);
  }
  v2 = (void *)qword_1EB315D70;

  return v2;
}

- (_MXExtensionService)init
{
  return 0;
}

- (void)dealloc
{
  if (self->_state == 2) {
    [(NSExtension *)self->_realExtension cancelExtensionRequestWithIdentifier:self->_connectionIdentifier];
  }
  v3.receiver = self;
  v3.super_class = (Class)_MXExtensionService;
  [(_MXExtensionService *)&v3 dealloc];
}

- (_MXExtensionService)initWithExtensionProxy:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MXExtensionService;
  v6 = [(_MXExtensionService *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionProxy, a3);
    v8 = objc_alloc_init(_MXSerialQueue);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = v8;
  }
  return v7;
}

- (void)setURLHandlingDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_URLHandlingDelegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_URLHandlingDelegate, obj);
    unint64_t v6 = [(_MXExtensionService *)self state];
    id v5 = obj;
    if (v6 == 2)
    {
      v7 = [(_MXExtensionService *)self realExtension];
      v8 = [(_MXExtensionService *)self connectionIdentifier];
      v9 = [v7 _extensionContextForUUID:v8];

      if ([v9 conformsToProtocol:&unk_1ED9B66D0]) {
        [v9 setURLHandlingDelegate:obj];
      }

      id v5 = obj;
    }
  }
}

- (void)setConnectionIdentifier:(id)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(NSUUID *)self->_connectionIdentifier isEqual:v4] & 1) == 0)
  {
    v7[0] = 0;
    v7[1] = 0;
    [v4 getUUIDBytes:v7];
    id v5 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v7];
    connectionIdentifier = self->_connectionIdentifier;
    self->_connectionIdentifier = v5;
  }
}

- (void)connectExtensionWithHandler:(id)a3
{
}

- (void)connectUIExtensionWithHandler:(id)a3
{
}

- (void)connectExtensionWithRemoteViewControllerNeeded:(BOOL)a3 Handler:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78___MXExtensionService_connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke;
  v9[3] = &unk_1E54B9B70;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  BOOL v12 = a3;
  [(_MXSerialQueue *)serialQueue addTask:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_connectExtensionWithRemoteViewControllerNeeded:(BOOL)a3 Handler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, _MXExtensionService *, NSExtension *))a4;
  unint64_t v7 = [(_MXExtensionService *)self state];
  if (v7)
  {
    if (v7 != 2)
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_MXExtensionServiceErrorDomain" code:16 userInfo:0];
      v6[2](v6, self, v8);
      goto LABEL_18;
    }
    id v8 = [(_MXExtension *)self->_extensionProxy extension];
    if (v4)
    {
      v9 = [(_MXExtensionService *)self remoteViewController];

      if (!v9)
      {
        uint64_t v13 = [MEMORY[0x1E4F28C58] _errorWithExtensionServiceError:17];
        goto LABEL_17;
      }
    }
    if (v8 == self->_realExtension)
    {
      v6[2](v6, self, 0);
      goto LABEL_18;
    }
  }
  id v10 = [(_MXExtensionService *)self extensionProxy];
  id v8 = [v10 extension];

  if (([(NSExtension *)v8 optedIn] & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_MXExtensionServiceErrorDomain" code:5 userInfo:0];
LABEL_17:
    v14 = (void *)v13;
    v6[2](v6, self, (NSExtension *)v13);

    goto LABEL_18;
  }
  [(_MXExtensionService *)self setState:1];
  [(_MXExtensionService *)self setRealExtension:v8];
  id v11 = [(_MXExtensionService *)self realExtension];
  if (v4)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79___MXExtensionService__connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke_2;
    v15[3] = &unk_1E54B9BC0;
    v15[4] = self;
    v16 = v6;
    [v11 instantiateViewControllerWithInputItems:0 connectionHandler:v15];

    BOOL v12 = v16;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __79___MXExtensionService__connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke;
    v17[3] = &unk_1E54B9B98;
    v17[4] = self;
    v18 = v6;
    [v11 beginExtensionRequestWithInputItems:0 completion:v17];

    BOOL v12 = v18;
  }

LABEL_18:
}

- (void)disconnectExtension
{
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42___MXExtensionService_disconnectExtension__block_invoke;
  v4[3] = &unk_1E54B9BE8;
  objc_copyWeak(&v5, &location);
  [(_MXSerialQueue *)serialQueue addTask:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)handleRequest:(id)a3 requestDispatcher:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__9;
  v30[4] = __Block_byref_object_dispose__9;
  id v31 = (id)MEMORY[0x18C139AE0]();
  id v11 = [(id)objc_opt_class() extensionCompletionQueue];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke;
  v27[3] = &unk_1E54B9C38;
  id v12 = v11;
  id v28 = v12;
  v29 = v30;
  uint64_t v13 = (void *)MEMORY[0x18C139AE0](v27);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_3;
  v23[3] = &unk_1E54B9C88;
  id v14 = v13;
  id v26 = v14;
  id v15 = v8;
  id v24 = v15;
  id v16 = v9;
  id v25 = v16;
  [(_MXExtensionService *)self connectExtensionWithHandler:v23];
  v17 = [_MXExtensionRequestReceipt alloc];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_5;
  v21[3] = &unk_1E54B82E8;
  id v18 = v14;
  id v22 = v18;
  v19 = [(_MXExtensionRequestReceipt *)v17 initWithCompletion:v21];

  _Block_object_dispose(v30, 8);

  return v19;
}

- (id)startSendingUpdatesForRequest:(id)a3 requestDispatcher:(id)a4 toObserver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke;
  v36[3] = &unk_1E54B9CD8;
  id v11 = v10;
  id v37 = v11;
  id v12 = v8;
  id v38 = v12;
  id v13 = v9;
  id v39 = v13;
  [(_MXExtensionService *)self connectExtensionWithHandler:v36];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__9;
  v34[4] = __Block_byref_object_dispose__9;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_3;
  v29[3] = &unk_1E54B9D00;
  id v14 = v11;
  id v30 = v14;
  id v31 = self;
  id v15 = v12;
  id v32 = v15;
  id v16 = v13;
  id v33 = v16;
  id v35 = (id)MEMORY[0x18C139AE0](v29);
  v17 = [(id)objc_opt_class() extensionCompletionQueue];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_4;
  v26[3] = &unk_1E54B8310;
  id v18 = v17;
  id v27 = v18;
  id v28 = v34;
  v19 = (void *)MEMORY[0x18C139AE0](v26);
  v20 = [_MXExtensionRequestReceipt alloc];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_6;
  v24[3] = &unk_1E54B82E8;
  id v21 = v19;
  id v25 = v21;
  id v22 = [(_MXExtensionRequestReceipt *)v20 initWithCompletion:v24];

  _Block_object_dispose(v34, 8);

  return v22;
}

- (void)stopSendingUpdatesForRequest:(id)a3 requestDispatcher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70___MXExtensionService_stopSendingUpdatesForRequest_requestDispatcher___block_invoke;
  v10[3] = &unk_1E54B9D28;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_MXExtensionService *)self connectExtensionWithHandler:v10];
}

- (id)vendorContextWithErrorHandler:(id)a3
{
  id v4 = a3;
  if ([(_MXExtensionService *)self state] == 2)
  {
    id v5 = [(_MXExtensionService *)self realExtension];
    id v6 = [(_MXExtensionService *)self connectionIdentifier];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53___MXExtensionService_vendorContextWithErrorHandler___block_invoke;
    v10[3] = &unk_1E54B9D50;
    void v10[4] = self;
    id v11 = v4;
    id v7 = [v5 _extensionVendorContextForUUID:v6 withErrorHandler:v10];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28C58] _errorWithExtensionServiceError:18];
    (*((void (**)(id, void *))v4 + 2))(v4, v8);

    id v7 = 0;
  }

  return v7;
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = [(NSExtension *)self->_realExtension identifier];
  id v5 = [v3 stringWithFormat:@"<_MXExtensionService:%p extension=%@ connectionIdentiifer=%@>", self, v4, self->_connectionIdentifier];

  return v5;
}

- (int)processIdentifier
{
  if ([(_MXExtensionService *)self state] != 2 || !self->_connectionIdentifier) {
    return 0;
  }
  objc_super v3 = [(_MXExtensionService *)self realExtension];
  int v4 = [v3 pidForRequestIdentifier:self->_connectionIdentifier];

  return v4;
}

- (NSUUID)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (NSExtension)realExtension
{
  return self->_realExtension;
}

- (void)setRealExtension:(id)a3
{
}

- (_MXExtension)extensionProxy
{
  return self->_extensionProxy;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (_MXExtensionURLHandling)URLHandlingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_URLHandlingDelegate);

  return (_MXExtensionURLHandling *)WeakRetained;
}

- (UIViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_destroyWeak((id *)&self->_URLHandlingDelegate);
  objc_storeStrong((id *)&self->_extensionProxy, 0);
  objc_storeStrong((id *)&self->_realExtension, 0);
  objc_storeStrong((id *)&self->_connectionIdentifier, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (id)context
{
  objc_super v3 = [(_MXExtensionService *)self extensionProxy];
  int v4 = [v3 extension];
  id v5 = [(_MXExtensionService *)self connectionIdentifier];
  id v6 = [v4 _extensionContextForUUID:v5];

  return v6;
}

- (NSUUID)serviceIdentifier
{
  v2 = [(_MXExtensionService *)self connectionIdentifier];
  objc_super v3 = (void *)[v2 copy];

  return (NSUUID *)v3;
}

- (id)resolveIntentSlot:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = [(_MXExtensionService *)self _errorForIntent:v9];
  if (v11)
  {
    v10[2](v10, 0, v11);
    id v12 = 0;
  }
  else
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__19;
    void v29[4] = __Block_byref_object_dispose__19;
    id v30 = (id)MEMORY[0x18C139AE0](v10);
    id v13 = [(id)objc_opt_class() extensionCompletionQueue];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke;
    v26[3] = &unk_1E54BC0C0;
    id v14 = v13;
    id v27 = v14;
    id v28 = v29;
    id v15 = (void *)MEMORY[0x18C139AE0](v26);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_3;
    v22[3] = &unk_1E54B9C88;
    id v16 = v15;
    id v25 = v16;
    id v23 = v9;
    id v24 = v8;
    [(_MXExtensionService *)self connectExtensionWithHandler:v22];
    v17 = [_MXExtensionRequestReceipt alloc];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_7;
    v20[3] = &unk_1E54B82E8;
    id v18 = v16;
    id v21 = v18;
    id v12 = [(_MXExtensionRequestReceipt *)v17 initWithCompletion:v20];

    _Block_object_dispose(v29, 8);
  }

  return v12;
}

- (id)confirmIntent:(id)a3 expectResponseClass:(Class)a4 withCompletion:(id)a5
{
  return [(_MXExtensionService *)self _handleOrConfirmIntent:a3 expectResponseClass:a4 isHandle:0 withCompletion:a5];
}

- (id)handleIntent:(id)a3 expectResponseClass:(Class)a4 withCompletion:(id)a5
{
  return [(_MXExtensionService *)self _handleOrConfirmIntent:a3 expectResponseClass:a4 isHandle:1 withCompletion:a5];
}

- (id)_handleOrConfirmIntent:(id)a3 expectResponseClass:(Class)a4 isHandle:(BOOL)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(_MXExtensionService *)self _errorForIntent:v10];
  if (v12)
  {
    (*((void (**)(id, void, void, void, void *))v11 + 2))(v11, 0, 0, 0, v12);
    id v13 = 0;
  }
  else
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__19;
    v31[4] = __Block_byref_object_dispose__19;
    id v32 = (id)MEMORY[0x18C139AE0](v11);
    id v14 = [(id)objc_opt_class() extensionCompletionQueue];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke;
    v28[3] = &unk_1E54BC138;
    id v15 = v14;
    id v29 = v15;
    id v30 = v31;
    id v16 = (void *)MEMORY[0x18C139AE0](v28);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_3;
    v23[3] = &unk_1E54BC1B0;
    id v17 = v16;
    id v25 = v17;
    Class v26 = a4;
    id v24 = v10;
    BOOL v27 = a5;
    [(_MXExtensionService *)self connectExtensionWithHandler:v23];
    id v18 = [_MXExtensionRequestReceipt alloc];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_7;
    v21[3] = &unk_1E54B82E8;
    id v19 = v17;
    id v22 = v19;
    id v13 = [(_MXExtensionRequestReceipt *)v18 initWithCompletion:v21];

    _Block_object_dispose(v31, 8);
  }

  return v13;
}

- (void)completeTransactionWithIntentIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84___MXExtensionService_INIntent__completeTransactionWithIntentIdentifier_completion___block_invoke;
  v8[3] = &unk_1E54B82E8;
  id v9 = v6;
  id v7 = v6;
  [(_MXExtensionService *)self _completeOrCancelTransaction:1 withIntentIdentifier:a3 completion:v8];
}

- (void)cancelTransactionDueToTimeoutWithIntentIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94___MXExtensionService_INIntent__cancelTransactionDueToTimeoutWithIntentIdentifier_completion___block_invoke;
  v8[3] = &unk_1E54B82E8;
  id v9 = v6;
  id v7 = v6;
  [(_MXExtensionService *)self _completeOrCancelTransaction:0 withIntentIdentifier:a3 completion:v8];
}

- (void)_completeOrCancelTransaction:(BOOL)a3 withIntentIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94___MXExtensionService_INIntent___completeOrCancelTransaction_withIntentIdentifier_completion___block_invoke;
  v12[3] = &unk_1E54BC1D8;
  BOOL v15 = a3;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(_MXExtensionService *)self connectExtensionWithHandler:v12];
}

- (id)startSendingUpdatesForIntent:(id)a3 toObserver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[_MXIntentResponseObserverProxy alloc] initWithObserver:v7];

  id v9 = [(_MXExtensionService *)self _errorForIntent:v6];
  if (v9)
  {
    [(_MXIntentResponseObserverProxy *)v8 didReceiveError:v9];
    id v10 = 0;
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73___MXExtensionService_INIntent__startSendingUpdatesForIntent_toObserver___block_invoke;
    v19[3] = &unk_1E54B9D28;
    id v11 = v8;
    v20 = v11;
    id v12 = v6;
    id v21 = v12;
    [(_MXExtensionService *)self connectExtensionWithHandler:v19];
    id v13 = [_MXExtensionRequestReceipt alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73___MXExtensionService_INIntent__startSendingUpdatesForIntent_toObserver___block_invoke_3;
    v15[3] = &unk_1E54B8270;
    id v16 = v11;
    id v17 = self;
    id v18 = v12;
    id v10 = [(_MXExtensionRequestReceipt *)v13 initWithCompletion:v15];
  }

  return v10;
}

- (void)stopSendingUpdatesForIntent:(id)a3
{
  id v4 = a3;
  id v5 = [(_MXExtensionService *)self intentResponseObserverProxy];
  [v5 stopObserving];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61___MXExtensionService_INIntent__stopSendingUpdatesForIntent___block_invoke;
  void v7[3] = &unk_1E54BC228;
  id v8 = v4;
  id v6 = v4;
  [(_MXExtensionService *)self connectExtensionWithHandler:v7];
}

- (void)setIntentResponseObserverProxy:(id)a3
{
  id value = a3;
  id v4 = [(_MXExtensionService *)self intentResponseObserverProxy];

  id v5 = value;
  if (v4 != value)
  {
    objc_setAssociatedObject(self, (const void *)kIntentResponseObserverProxyKey, value, (void *)1);
    id v5 = value;
  }
}

- (id)intentResponseObserverProxy
{
  return objc_getAssociatedObject(self, (const void *)kIntentResponseObserverProxyKey);
}

- (id)_errorForIntent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_MXExtensionService *)self extensionProxy];
  id v6 = [(id)v5 extension];

  LOBYTE(v5) = [v6 _canSupportIntent:v4];
  if (v5)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_MXExtensionServiceErrorDomain" code:7 userInfo:0];
  }

  return v7;
}

- (id)_errorForIntentVendorContext:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 conformsToProtocol:&unk_1EDA43558] & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] _errorWithExtensionServiceError:7];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_errorForIntentResponse:(id)a3 withExpectResponseClass:(Class)a4
{
  uint64_t v5 = 0;
  if (a3 && a4)
  {
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F28C58] _errorWithExtensionServiceError:9];
    }
    uint64_t v4 = vars8;
  }
  return v5;
}

- (void)handleIntent:(id)a3 expectResponseClass:(Class)a4 completion:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __99___MXExtensionService_INIntent_willBeDepreicatedSoon__handleIntent_expectResponseClass_completion___block_invoke;
  v11[3] = &unk_1E54BC250;
  id v12 = v8;
  id v9 = v8;
  id v10 = [(_MXExtensionService *)self handleIntent:a3 expectResponseClass:a4 withCompletion:v11];
}

@end