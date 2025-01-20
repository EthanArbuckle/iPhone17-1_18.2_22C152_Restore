@interface ASCredentialProviderExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)cancelRequestWithError:(NSError *)error;
- (void)completeAssertionRequestWithSelectedPasskeyCredential:(ASPasskeyAssertionCredential *)credential completionHandler:(void *)completionHandler;
- (void)completeExtensionConfigurationRequest;
- (void)completeOneTimeCodeRequestWithSelectedCredential:(id)a3 completionHandler:(id)a4;
- (void)completeRegistrationRequestWithSelectedPasskeyCredential:(ASPasskeyRegistrationCredential *)credential completionHandler:(void *)completionHandler;
- (void)completeRequestWithSelectedCredential:(ASPasswordCredential *)credential completionHandler:(void *)completionHandler;
- (void)completeRequestWithTextToInsert:(id)a3 completionHandler:(id)a4;
- (void)performPasskeyRegistrationWithoutUserInteractionIfPossible:(id)a3;
- (void)prepareCredentialListForServiceIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)prepareCredentialListForServiceIdentifiers:(id)a3 requestParameters:(id)a4 completionHandler:(id)a5;
- (void)prepareInterfaceForExtensionConfiguration;
- (void)prepareInterfaceForPasskeyRegistration:(id)a3 completionHandler:(id)a4;
- (void)prepareInterfaceForUserChoosingTextToInsert;
- (void)prepareInterfaceToProvideCredentialForIdentity:(id)a3 completionHandler:(id)a4;
- (void)prepareInterfaceToProvideCredentialForRequest:(id)a3 completionHandler:(id)a4;
- (void)prepareOneTimeCodeCredentialListForServiceIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)provideCredentialWithoutUserInteractionForIdentity:(id)a3;
- (void)provideCredentialWithoutUserInteractionForRequest:(id)a3;
@end

@implementation ASCredentialProviderExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "_as_credentialProviderHostInterface");
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "_as_credentialProviderExtensionInterface");
}

- (void)completeRequestWithSelectedCredential:(ASPasswordCredential *)credential completionHandler:(void *)completionHandler
{
  v6 = completionHandler;
  v7 = credential;
  v8 = [(ASCredentialProviderExtensionContext *)self _auxiliaryConnection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __96__ASCredentialProviderExtensionContext_completeRequestWithSelectedCredential_completionHandler___block_invoke;
  v14[3] = &unk_264396918;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __96__ASCredentialProviderExtensionContext_completeRequestWithSelectedCredential_completionHandler___block_invoke_2;
  v12[3] = &unk_264395D78;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 prepareToCompleteRequestWithSelectedCredential:v7 completion:v12];
}

uint64_t __96__ASCredentialProviderExtensionContext_completeRequestWithSelectedCredential_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ASCredentialProviderExtensionContext;
  objc_msgSendSuper2(&v4, sel_cancelRequestWithError_, a2);
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

id __96__ASCredentialProviderExtensionContext_completeRequestWithSelectedCredential_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_completeRequestReturningItems_completionHandler_, MEMORY[0x263EFFA68], v1);
}

- (void)completeAssertionRequestWithSelectedPasskeyCredential:(ASPasskeyAssertionCredential *)credential completionHandler:(void *)completionHandler
{
  v6 = completionHandler;
  v7 = credential;
  v8 = [(ASCredentialProviderExtensionContext *)self _auxiliaryConnection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __112__ASCredentialProviderExtensionContext_completeAssertionRequestWithSelectedPasskeyCredential_completionHandler___block_invoke;
  v14[3] = &unk_264396918;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __112__ASCredentialProviderExtensionContext_completeAssertionRequestWithSelectedPasskeyCredential_completionHandler___block_invoke_2;
  v12[3] = &unk_264395D78;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 prepareToCompleteAssertionRequestWithSelectedPasskeyCredential:v7 completion:v12];
}

uint64_t __112__ASCredentialProviderExtensionContext_completeAssertionRequestWithSelectedPasskeyCredential_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ASCredentialProviderExtensionContext;
  objc_msgSendSuper2(&v4, sel_cancelRequestWithError_, a2);
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

id __112__ASCredentialProviderExtensionContext_completeAssertionRequestWithSelectedPasskeyCredential_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_completeRequestReturningItems_completionHandler_, MEMORY[0x263EFFA68], v1);
}

- (void)completeRegistrationRequestWithSelectedPasskeyCredential:(ASPasskeyRegistrationCredential *)credential completionHandler:(void *)completionHandler
{
  v6 = completionHandler;
  v7 = credential;
  v8 = [(ASCredentialProviderExtensionContext *)self _auxiliaryConnection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __115__ASCredentialProviderExtensionContext_completeRegistrationRequestWithSelectedPasskeyCredential_completionHandler___block_invoke;
  v14[3] = &unk_264396918;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __115__ASCredentialProviderExtensionContext_completeRegistrationRequestWithSelectedPasskeyCredential_completionHandler___block_invoke_2;
  v12[3] = &unk_264395D78;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 prepareToCompleteRegistrationRequestWithSelectedPasskeyCredential:v7 completion:v12];
}

uint64_t __115__ASCredentialProviderExtensionContext_completeRegistrationRequestWithSelectedPasskeyCredential_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ASCredentialProviderExtensionContext;
  objc_msgSendSuper2(&v4, sel_cancelRequestWithError_, a2);
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

id __115__ASCredentialProviderExtensionContext_completeRegistrationRequestWithSelectedPasskeyCredential_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_completeRequestReturningItems_completionHandler_, MEMORY[0x263EFFA68], v1);
}

- (void)completeOneTimeCodeRequestWithSelectedCredential:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ASCredentialProviderExtensionContext *)self _auxiliaryConnection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __107__ASCredentialProviderExtensionContext_completeOneTimeCodeRequestWithSelectedCredential_completionHandler___block_invoke;
  v14[3] = &unk_264396918;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __107__ASCredentialProviderExtensionContext_completeOneTimeCodeRequestWithSelectedCredential_completionHandler___block_invoke_2;
  v12[3] = &unk_264395D78;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 prepareToCompleteOneTimeCodeRequestWithSelectedCredential:v7 completion:v12];
}

uint64_t __107__ASCredentialProviderExtensionContext_completeOneTimeCodeRequestWithSelectedCredential_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ASCredentialProviderExtensionContext;
  objc_msgSendSuper2(&v4, sel_cancelRequestWithError_, a2);
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

id __107__ASCredentialProviderExtensionContext_completeOneTimeCodeRequestWithSelectedCredential_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_completeRequestReturningItems_completionHandler_, MEMORY[0x263EFFA68], v1);
}

- (void)completeRequestWithTextToInsert:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ASCredentialProviderExtensionContext *)self _auxiliaryConnection];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __90__ASCredentialProviderExtensionContext_completeRequestWithTextToInsert_completionHandler___block_invoke;
  v19[3] = &unk_264396918;
  v19[4] = self;
  id v9 = v7;
  id v20 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v19];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__ASCredentialProviderExtensionContext_completeRequestWithTextToInsert_completionHandler___block_invoke_2;
  v14[3] = &unk_2643955A8;
  id v15 = v10;
  id v16 = v6;
  v17 = self;
  id v18 = v9;
  id v11 = v9;
  id v12 = v6;
  id v13 = v10;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

uint64_t __90__ASCredentialProviderExtensionContext_completeRequestWithTextToInsert_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ASCredentialProviderExtensionContext;
  objc_msgSendSuper2(&v4, sel_cancelRequestWithError_, a2);
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void __90__ASCredentialProviderExtensionContext_completeRequestWithTextToInsert_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __90__ASCredentialProviderExtensionContext_completeRequestWithTextToInsert_completionHandler___block_invoke_3;
  v5[3] = &unk_264395D78;
  id v4 = *(id *)(a1 + 56);
  v5[4] = *(void *)(a1 + 48);
  id v6 = v4;
  [v2 prepareToCompleteRequestWithSelectedText:v3 completion:v5];
}

id __90__ASCredentialProviderExtensionContext_completeRequestWithTextToInsert_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_completeRequestReturningItems_completionHandler_, MEMORY[0x263EFFA68], v1);
}

- (void)cancelRequestWithError:(NSError *)error
{
  id v4 = error;
  v5 = [(ASCredentialProviderExtensionContext *)self _auxiliaryConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__ASCredentialProviderExtensionContext_cancelRequestWithError___block_invoke;
  v11[3] = &unk_2643961F0;
  v11[4] = self;
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v11];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__ASCredentialProviderExtensionContext_cancelRequestWithError___block_invoke_2;
  v8[3] = &unk_264395428;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  [v6 prepareToCancelRequestWithError:v7 completion:v8];
}

id __63__ASCredentialProviderExtensionContext_cancelRequestWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_cancelRequestWithError_, a2);
}

id __63__ASCredentialProviderExtensionContext_cancelRequestWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_cancelRequestWithError_, v1);
}

- (void)completeExtensionConfigurationRequest
{
  objc_super v3 = [(ASCredentialProviderExtensionContext *)self _auxiliaryConnection];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__ASCredentialProviderExtensionContext_completeExtensionConfigurationRequest__block_invoke;
  v6[3] = &unk_2643961F0;
  v6[4] = self;
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __77__ASCredentialProviderExtensionContext_completeExtensionConfigurationRequest__block_invoke_2;
  v5[3] = &unk_264395388;
  v5[4] = self;
  [v4 prepareToCompleteExtensionConfigurationRequestWithCompletion:v5];
}

id __77__ASCredentialProviderExtensionContext_completeExtensionConfigurationRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v3, sel_cancelRequestWithError_, a2);
}

id __77__ASCredentialProviderExtensionContext_completeExtensionConfigurationRequest__block_invoke_2(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)ASCredentialProviderExtensionContext;
  return objc_msgSendSuper2(&v2, sel_completeRequestReturningItems_completionHandler_, MEMORY[0x263EFFA68], 0);
}

- (void)prepareCredentialListForServiceIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ASCredentialProviderExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __101__ASCredentialProviderExtensionContext_prepareCredentialListForServiceIdentifiers_completionHandler___block_invoke;
    block[3] = &unk_2643954E0;
    id v10 = v8;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t __101__ASCredentialProviderExtensionContext_prepareCredentialListForServiceIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareCredentialListForServiceIdentifiers:*(void *)(a1 + 40)];
  objc_super v2 = (void *)MEMORY[0x263F158F8];
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 addCommitHandler:v3 forPhase:2];
}

- (void)prepareCredentialListForServiceIdentifiers:(id)a3 requestParameters:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ASCredentialProviderExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __119__ASCredentialProviderExtensionContext_prepareCredentialListForServiceIdentifiers_requestParameters_completionHandler___block_invoke;
    v12[3] = &unk_264395530;
    id v13 = v11;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
  else
  {
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

uint64_t __119__ASCredentialProviderExtensionContext_prepareCredentialListForServiceIdentifiers_requestParameters_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareCredentialListForServiceIdentifiers:*(void *)(a1 + 40) requestParameters:*(void *)(a1 + 48)];
  objc_super v2 = (void *)MEMORY[0x263F158F8];
  uint64_t v3 = *(void *)(a1 + 56);

  return [v2 addCommitHandler:v3 forPhase:2];
}

- (void)prepareOneTimeCodeCredentialListForServiceIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASCredentialProviderExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __112__ASCredentialProviderExtensionContext_prepareOneTimeCodeCredentialListForServiceIdentifiers_completionHandler___block_invoke;
    block[3] = &unk_2643954E0;
    id v10 = v8;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t __112__ASCredentialProviderExtensionContext_prepareOneTimeCodeCredentialListForServiceIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareOneTimeCodeCredentialListForServiceIdentifiers:*(void *)(a1 + 40)];
  objc_super v2 = (void *)MEMORY[0x263F158F8];
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 addCommitHandler:v3 forPhase:2];
}

- (void)prepareInterfaceForUserChoosingTextToInsert
{
  objc_super v2 = [(ASCredentialProviderExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__ASCredentialProviderExtensionContext_prepareInterfaceForUserChoosingTextToInsert__block_invoke;
    block[3] = &unk_264395388;
    id v4 = v2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __83__ASCredentialProviderExtensionContext_prepareInterfaceForUserChoosingTextToInsert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareInterfaceForUserChoosingTextToInsert];
}

- (void)provideCredentialWithoutUserInteractionForIdentity:(id)a3
{
  id v4 = +[ASPasswordCredentialRequest requestWithCredentialIdentity:a3];
  [(ASCredentialProviderExtensionContext *)self provideCredentialWithoutUserInteractionForRequest:v4];
}

- (void)provideCredentialWithoutUserInteractionForRequest:(id)a3
{
  id v4 = a3;
  v5 = [(ASCredentialProviderExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __90__ASCredentialProviderExtensionContext_provideCredentialWithoutUserInteractionForRequest___block_invoke;
    v6[3] = &unk_264395428;
    id v7 = v5;
    id v8 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

uint64_t __90__ASCredentialProviderExtensionContext_provideCredentialWithoutUserInteractionForRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) provideCredentialWithoutUserInteractionForRequest:*(void *)(a1 + 40)];
}

- (void)prepareInterfaceToProvideCredentialForIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[ASPasswordCredentialRequest requestWithCredentialIdentity:a3];
  [(ASCredentialProviderExtensionContext *)self prepareInterfaceToProvideCredentialForRequest:v7 completionHandler:v6];
}

- (void)prepareInterfaceToProvideCredentialForRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASCredentialProviderExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__ASCredentialProviderExtensionContext_prepareInterfaceToProvideCredentialForRequest_completionHandler___block_invoke;
    block[3] = &unk_2643954E0;
    id v10 = v8;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t __104__ASCredentialProviderExtensionContext_prepareInterfaceToProvideCredentialForRequest_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareInterfaceToProvideCredentialForRequest:*(void *)(a1 + 40)];
  objc_super v2 = (void *)MEMORY[0x263F158F8];
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 addCommitHandler:v3 forPhase:2];
}

- (void)prepareInterfaceForPasskeyRegistration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASCredentialProviderExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__ASCredentialProviderExtensionContext_prepareInterfaceForPasskeyRegistration_completionHandler___block_invoke;
    block[3] = &unk_2643954E0;
    id v10 = v8;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t __97__ASCredentialProviderExtensionContext_prepareInterfaceForPasskeyRegistration_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareInterfaceForPasskeyRegistration:*(void *)(a1 + 40)];
  objc_super v2 = (void *)MEMORY[0x263F158F8];
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 addCommitHandler:v3 forPhase:2];
}

- (void)prepareInterfaceForExtensionConfiguration
{
  objc_super v2 = [(ASCredentialProviderExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__ASCredentialProviderExtensionContext_prepareInterfaceForExtensionConfiguration__block_invoke;
    block[3] = &unk_264395388;
    id v4 = v2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __81__ASCredentialProviderExtensionContext_prepareInterfaceForExtensionConfiguration__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareInterfaceForExtensionConfiguration];
}

- (void)performPasskeyRegistrationWithoutUserInteractionIfPossible:(id)a3
{
  id v4 = a3;
  v5 = [(ASCredentialProviderExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __99__ASCredentialProviderExtensionContext_performPasskeyRegistrationWithoutUserInteractionIfPossible___block_invoke;
    v7[3] = &unk_264395428;
    id v8 = v5;
    id v9 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
  else
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ASCredentialProviderExtensionContext performPasskeyRegistrationWithoutUserInteractionIfPossible:](v6);
    }
  }
}

uint64_t __99__ASCredentialProviderExtensionContext_performPasskeyRegistrationWithoutUserInteractionIfPossible___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performPasskeyRegistrationWithoutUserInteractionIfPossible:*(void *)(a1 + 40)];
}

- (void)performPasskeyRegistrationWithoutUserInteractionIfPossible:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1;
  objc_super v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_21918F000, v1, OS_LOG_TYPE_ERROR, "Found principal object of unexpected class %{public}@", (uint8_t *)&v4, 0xCu);
}

@end