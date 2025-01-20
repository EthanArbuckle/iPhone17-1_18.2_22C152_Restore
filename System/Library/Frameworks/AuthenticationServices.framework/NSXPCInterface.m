@interface NSXPCInterface
@end

@implementation NSXPCInterface

void __83__NSXPCInterface_AuthenticationServicesExtras___as_credentialProviderHostInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CABA770];
  v1 = (void *)_as_credentialProviderHostInterface_interface;
  _as_credentialProviderHostInterface_interface = v0;

  v2 = (void *)_as_credentialProviderHostInterface_interface;
  v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_prepareToCompleteRequestWithSelectedCredential_completion_ argumentIndex:0 ofReply:0];

  v4 = (void *)_as_credentialProviderHostInterface_interface;
  v5 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v4 setClasses:v5 forSelector:sel_prepareToCompleteAssertionRequestWithSelectedPasskeyCredential_completion_ argumentIndex:0 ofReply:0];

  v6 = (void *)_as_credentialProviderHostInterface_interface;
  id v7 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v6 setClasses:v7 forSelector:sel_prepareToCompleteRegistrationRequestWithSelectedPasskeyCredential_completion_ argumentIndex:0 ofReply:0];
}

void __88__NSXPCInterface_AuthenticationServicesExtras___as_credentialProviderExtensionInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CACB9A0];
  v1 = (void *)_as_credentialProviderExtensionInterface_interface;
  _as_credentialProviderExtensionInterface_interface = v0;

  v2 = (void *)_as_credentialProviderExtensionInterface_interface;
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_prepareCredentialListForServiceIdentifiers_completionHandler_ argumentIndex:0 ofReply:0];

  v6 = (void *)_as_credentialProviderExtensionInterface_interface;
  id v7 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v6 setClasses:v7 forSelector:sel_provideCredentialWithoutUserInteractionForIdentity_ argumentIndex:0 ofReply:0];

  v8 = (void *)_as_credentialProviderExtensionInterface_interface;
  v9 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v8 setClasses:v9 forSelector:sel_prepareInterfaceToProvideCredentialForIdentity_completionHandler_ argumentIndex:0 ofReply:0];

  v10 = (void *)_as_credentialProviderExtensionInterface_interface;
  v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  [v10 setClasses:v13 forSelector:sel_prepareCredentialListForServiceIdentifiers_requestParameters_completionHandler_ argumentIndex:0 ofReply:0];

  v14 = (void *)_as_credentialProviderExtensionInterface_interface;
  v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v14 setClasses:v15 forSelector:sel_prepareCredentialListForServiceIdentifiers_requestParameters_completionHandler_ argumentIndex:1 ofReply:0];

  v16 = (void *)_as_credentialProviderExtensionInterface_interface;
  v17 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v16 setClasses:v17 forSelector:sel_prepareInterfaceForPasskeyRegistration_completionHandler_ argumentIndex:0 ofReply:0];

  v18 = (void *)MEMORY[0x263EFFA08];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  [(id)_as_credentialProviderExtensionInterface_interface setClasses:v21 forSelector:sel_provideCredentialWithoutUserInteractionForRequest_ argumentIndex:0 ofReply:0];
  [(id)_as_credentialProviderExtensionInterface_interface setClasses:v21 forSelector:sel_prepareInterfaceToProvideCredentialForRequest_completionHandler_ argumentIndex:0 ofReply:0];
}

uint64_t __84__NSXPCInterface_AuthenticationServicesExtras___as_accountModificationHostInterface__block_invoke()
{
  _as_accountModificationHostInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CAA6CC8];

  return MEMORY[0x270F9A758]();
}

uint64_t __89__NSXPCInterface_AuthenticationServicesExtras___as_accountModificationExtensionInterface__block_invoke()
{
  _as_accountModificationExtensionInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CABCC00];

  return MEMORY[0x270F9A758]();
}

@end