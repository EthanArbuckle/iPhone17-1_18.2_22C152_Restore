@interface _INExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (void)initialize;
- (INIntentHandlerProvidingPrivate)_extensionHandler;
- (_INExtensionContext)initWithInputItems:(id)a3 extension:(id)a4;
- (_INExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (_INExtensionContext)initWithInputItems:(id)a3 privateIntentHandlerProvider:(id)a4;
- (id)_intentDelivererForIntent:(id)a3;
- (void)_beginTransactionWithIntentIdentifier:(id)a3 completion:(id)a4;
- (void)_cancelTransactionDueToTimeoutWithIntentIdentifier:(id)a3 completion:(id)a4;
- (void)_commonInit;
- (void)_completeTransactionWithIntentIdentifier:(id)a3 completion:(id)a4;
- (void)_validateExtension;
- (void)beginTransactionWithIntentIdentifier:(id)a3 completion:(id)a4;
- (void)cancelTransactionDueToTimeout;
- (void)cancelTransactionDueToTimeoutWithIntentIdentifier:(id)a3 completion:(id)a4;
- (void)completeTransaction;
- (void)completeTransactionWithIntentIdentifier:(id)a3 completion:(id)a4;
- (void)confirmIntent:(id)a3 withCompletion:(id)a4;
- (void)confirmationResponseForIntent:(id)a3 completion:(id)a4;
- (void)getIntentParameterDefaultValue:(id)a3 forIntent:(id)a4 completionBlock:(id)a5;
- (void)getIntentParameterOptions:(id)a3 forIntent:(id)a4 completionBlock:(id)a5;
- (void)getIntentParameterOptions:(id)a3 forIntent:(id)a4 searchTerm:(id)a5 completionBlock:(id)a6;
- (void)handleIntent:(id)a3 completion:(id)a4;
- (void)handleIntent:(id)a3 completionHandler:(id)a4;
- (void)handleIntent:(id)a3 withCompletion:(id)a4;
- (void)intentDeliverer:(id)a3 deliverIntent:(id)a4 withBlock:(id)a5;
- (void)resolveIntentSlot:(id)a3 forIntent:(id)a4 completionBlock:(id)a5;
- (void)resolveIntentSlots:(id)a3 forIntent:(id)a4 completionBlock:(id)a5;
- (void)startSendingUpdatesForIntent:(id)a3 toObserver:(id)a4;
- (void)stopSendingUpdatesForIntent:(id)a3;
@end

@implementation _INExtensionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionHandler, 0);
  objc_storeStrong((id *)&self->_intentDeliverer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_handlerForIntent, 0);
}

- (void)getIntentParameterOptions:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_INExtensionContext *)self _intentDelivererForIntent:v9];
  [v11 getIntentParameterOptions:v10 forIntent:v9 searchTerm:0 completionBlock:v8];
}

- (void)cancelTransactionDueToTimeout
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    v5 = "-[_INExtensionContext cancelTransactionDueToTimeout]";
    _os_log_error_impl(&dword_18CB2F000, v3, OS_LOG_TYPE_ERROR, "%s Deprecated method invoked: -[_INExtensionContext cancelTransactionDueToTimeout]", (uint8_t *)&v4, 0xCu);
  }
  [(_INExtensionContext *)self cancelTransactionDueToTimeoutWithIntentIdentifier:&stru_1EDA6DB28 completion:&__block_literal_global_22];
}

- (void)completeTransaction
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    v5 = "-[_INExtensionContext completeTransaction]";
    _os_log_error_impl(&dword_18CB2F000, v3, OS_LOG_TYPE_ERROR, "%s Deprecated method invoked: -[_INExtensionContext completeTransaction]", (uint8_t *)&v4, 0xCu);
  }
  [(_INExtensionContext *)self completeTransactionWithIntentIdentifier:&stru_1EDA6DB28 completion:&__block_literal_global_53940];
}

- (void)handleIntent:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54___INExtensionContext_handleIntent_completionHandler___block_invoke;
  v8[3] = &unk_1E551F7D0;
  id v9 = v6;
  id v7 = v6;
  [(_INExtensionContext *)self handleIntent:a3 withCompletion:v8];
}

- (void)handleIntent:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47___INExtensionContext_handleIntent_completion___block_invoke;
  v8[3] = &unk_1E551F7D0;
  id v9 = v6;
  id v7 = v6;
  [(_INExtensionContext *)self handleIntent:a3 withCompletion:v8];
}

- (void)confirmationResponseForIntent:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64___INExtensionContext_confirmationResponseForIntent_completion___block_invoke;
  v8[3] = &unk_1E551F7D0;
  id v9 = v6;
  id v7 = v6;
  [(_INExtensionContext *)self confirmIntent:a3 withCompletion:v8];
}

- (void)_cancelTransactionDueToTimeoutWithIntentIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = [(_INExtensionContext *)self _extensionHandler];
  if (objc_opt_respondsToSelector()) {
    [v7 transactionDidCompleteForIntentIdentifier:v10];
  }
  id handlerForIntent = self->_handlerForIntent;
  self->_id handlerForIntent = 0;

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IntentsErrorDomain" code:3001 userInfo:0];
  [(_INExtensionContext *)self cancelRequestWithError:v9];

  if (v6) {
    v6[2](v6);
  }
}

- (void)_completeTransactionWithIntentIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = [(_INExtensionContext *)self _extensionHandler];
  if (objc_opt_respondsToSelector()) {
    [v7 transactionDidCompleteForIntentIdentifier:v9];
  }
  id handlerForIntent = self->_handlerForIntent;
  self->_id handlerForIntent = 0;

  [(_INExtensionContext *)self completeRequestReturningItems:0 completionHandler:0];
  if (v6) {
    v6[2](v6);
  }
}

- (void)_beginTransactionWithIntentIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = [(_INExtensionContext *)self _extensionHandler];
  if (objc_opt_respondsToSelector()) {
    [v7 transactionWillBeginForIntentIdentifier:v8];
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)_validateExtension
{
  uint64_t v3 = [(_INExtensionContext *)self _extensionHandler];
  if (!v3)
  {
    v5 = NSString;
    id v6 = @"Extension's principal object should not be nil";
    goto LABEL_9;
  }
  uint64_t v4 = v3;
  if (!self->_isPrivateExtension)
  {
    uint64_t v9 = v3;
    uint64_t v3 = _INExtensionValidateClass((void *)v3);
    uint64_t v4 = v9;
    if ((v3 & 1) == 0)
    {
      v5 = NSString;
      uint64_t v8 = v9;
      id v6 = @"The extension's principal object %@ must be a subclass of INExtension";
LABEL_9:
      objc_msgSend(v5, "stringWithFormat:", v6, v8);
      id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v7);
    }
  }

  MEMORY[0x1F41817F8](v3, v4);
}

- (void)cancelTransactionDueToTimeoutWithIntentIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84___INExtensionContext_cancelTransactionDueToTimeoutWithIntentIdentifier_completion___block_invoke;
  block[3] = &unk_1E551DEF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)completeTransactionWithIntentIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74___INExtensionContext_completeTransactionWithIntentIdentifier_completion___block_invoke;
  block[3] = &unk_1E551DEF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)beginTransactionWithIntentIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71___INExtensionContext_beginTransactionWithIntentIdentifier_completion___block_invoke;
  block[3] = &unk_1E551DEF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)intentDeliverer:(id)a3 deliverIntent:(id)a4 withBlock:(id)a5
{
  id v11 = (void (**)(id, id))a5;
  id v7 = a4;
  [(_INExtensionContext *)self _validateExtension];
  uint64_t v8 = [(_INExtensionContext *)self _extensionHandler];
  id v9 = [v8 handlerForIntent:v7];

  id handlerForIntent = self->_handlerForIntent;
  self->_id handlerForIntent = v9;

  v11[2](v11, self->_handlerForIntent);
}

- (void)stopSendingUpdatesForIntent:(id)a3
{
  id v4 = a3;
  id v5 = [(_INExtensionContext *)self _intentDelivererForIntent:v4];
  [v5 stopSendingUpdatesForIntent:v4 completionHandler:0];
}

- (void)startSendingUpdatesForIntent:(id)a3 toObserver:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_INExtensionContext *)self _intentDelivererForIntent:v7];
  [v8 startSendingUpdatesForIntent:v7 toObserver:v6 completionHandler:0];
}

- (void)handleIntent:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_INExtensionContext *)self _intentDelivererForIntent:v7];
  [v8 handleIntent:v7 withCompletion:v6];
}

- (void)confirmIntent:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_INExtensionContext *)self _intentDelivererForIntent:v7];
  [v8 confirmIntent:v7 withCompletion:v6];
}

- (void)resolveIntentSlot:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_INExtensionContext *)self _intentDelivererForIntent:v9];
  [v11 resolveIntentParameter:v10 forIntent:v9 completionBlock:v8];
}

- (void)resolveIntentSlots:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_INExtensionContext *)self _intentDelivererForIntent:v9];
  [v11 resolveIntentParameters:v10 forIntent:v9 completionBlock:v8];
}

- (void)getIntentParameterDefaultValue:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_INExtensionContext *)self _intentDelivererForIntent:v9];
  [v11 getIntentParameterDefaultValue:v10 forIntent:v9 completionBlock:v8];
}

- (void)getIntentParameterOptions:(id)a3 forIntent:(id)a4 searchTerm:(id)a5 completionBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(_INExtensionContext *)self _intentDelivererForIntent:v12];
  [v14 getIntentParameterOptions:v13 forIntent:v12 searchTerm:v11 completionBlock:v10];
}

- (id)_intentDelivererForIntent:(id)a3
{
  intentDeliverer = self->_intentDeliverer;
  if (!intentDeliverer)
  {
    id v5 = [INIntentDeliverer alloc];
    queue = self->_queue;
    id v7 = [(_INExtensionContext *)self _auxiliaryConnection];
    id v8 = v7;
    if (v7) {
      [v7 auditToken];
    }
    else {
      memset(v12, 0, sizeof(v12));
    }
    id v9 = [(INIntentDeliverer *)v5 initWithQueue:queue auditToken:v12];
    id v10 = self->_intentDeliverer;
    self->_intentDeliverer = v9;

    [(INIntentDelivering *)self->_intentDeliverer setDelegate:self];
    intentDeliverer = self->_intentDeliverer;
  }

  return intentDeliverer;
}

- (INIntentHandlerProvidingPrivate)_extensionHandler
{
  extensionHandler = self->_extensionHandler;
  if (!extensionHandler)
  {
    id v4 = [(_INExtensionContext *)self _principalObject];
    id v5 = self->_extensionHandler;
    self->_extensionHandler = v4;

    extensionHandler = self->_extensionHandler;
  }

  return extensionHandler;
}

- (void)_commonInit
{
  uint64_t v3 = +[INPreferences sharedPreferences];
  [v3 _updateWithExtensionContext:self];

  id v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  id v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.siri.extension", v6);
  queue = self->_queue;
  self->_queue = v4;

  self->_isPrivateExtension = 0;
}

- (_INExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)_INExtensionContext;
  id v5 = [(_INExtensionContext *)&v8 initWithInputItems:a3 listenerEndpoint:a4 contextUUID:a5];
  id v6 = v5;
  if (v5) {
    [(_INExtensionContext *)v5 _commonInit];
  }
  return v6;
}

- (_INExtensionContext)initWithInputItems:(id)a3 extension:(id)a4
{
  result = [(_INExtensionContext *)self initWithInputItems:a3 privateIntentHandlerProvider:a4];
  if (result) {
    result->_isPrivateExtension = 0;
  }
  return result;
}

- (_INExtensionContext)initWithInputItems:(id)a3 privateIntentHandlerProvider:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_INExtensionContext;
  objc_super v8 = [(_INExtensionContext *)&v11 initWithInputItems:a3];
  id v9 = v8;
  if (v8)
  {
    [(_INExtensionContext *)v8 _commonInit];
    objc_storeStrong((id *)&v9->_extensionHandler, a4);
    v9->_isPrivateExtension = 1;
  }

  return v9;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDBDAAE8];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

@end