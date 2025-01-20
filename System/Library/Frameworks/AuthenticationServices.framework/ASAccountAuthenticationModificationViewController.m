@interface ASAccountAuthenticationModificationViewController
- (ASAccountAuthenticationModificationExtensionContext)extensionContext;
- (void)cancelRequest;
- (void)changePasswordWithoutUserInteractionForServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier existingCredential:(ASPasswordCredential *)existingCredential newPassword:(NSString *)newPassword userInfo:(NSDictionary *)userInfo;
- (void)convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier existingCredential:(ASPasswordCredential *)existingCredential userInfo:(NSDictionary *)userInfo;
- (void)prepareInterfaceToChangePasswordForServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier existingCredential:(ASPasswordCredential *)existingCredential newPassword:(NSString *)newPassword userInfo:(NSDictionary *)userInfo;
- (void)prepareInterfaceToConvertAccountToSignInWithAppleForServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier existingCredential:(ASPasswordCredential *)existingCredential userInfo:(NSDictionary *)userInfo;
@end

@implementation ASAccountAuthenticationModificationViewController

- (ASAccountAuthenticationModificationExtensionContext)extensionContext
{
  v4.receiver = self;
  v4.super_class = (Class)ASAccountAuthenticationModificationViewController;
  v2 = [(ASAccountAuthenticationModificationViewController *)&v4 extensionContext];

  return (ASAccountAuthenticationModificationExtensionContext *)v2;
}

- (void)convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier existingCredential:(ASPasswordCredential *)existingCredential userInfo:(NSDictionary *)userInfo
{
  v7 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v7, a2);
  v9 = (objc_class *)objc_opt_class();
  IMP v10 = class_getMethodImplementation(v9, a2);
  object_getClassName(self);
  v11 = [(id)objc_opt_class() description];
  [v11 containsString:@"."];

  v12 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (MethodImplementation == v10)
  {
    if (v13) {
      -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:]();
    }
  }
  else if (v13)
  {
    -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:]();
  }
  v14 = [(ASAccountAuthenticationModificationViewController *)self extensionContext];
  v15 = [MEMORY[0x263F087E8] errorWithDomain:@"ASExtensionErrorDomain" code:1000 userInfo:0];
  [v14 cancelRequestWithError:v15];
}

- (void)prepareInterfaceToConvertAccountToSignInWithAppleForServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier existingCredential:(ASPasswordCredential *)existingCredential userInfo:(NSDictionary *)userInfo
{
  v7 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v7, a2);
  v9 = (objc_class *)objc_opt_class();
  IMP v10 = class_getMethodImplementation(v9, a2);
  object_getClassName(self);
  v11 = [(id)objc_opt_class() description];
  [v11 containsString:@"."];

  v12 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (MethodImplementation == v10)
  {
    if (v13) {
      -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:]();
    }
  }
  else if (v13)
  {
    -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:]();
  }
  v14 = [(ASAccountAuthenticationModificationViewController *)self extensionContext];
  v15 = [MEMORY[0x263F087E8] errorWithDomain:@"ASExtensionErrorDomain" code:1000 userInfo:0];
  [v14 cancelRequestWithError:v15];
}

- (void)changePasswordWithoutUserInteractionForServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier existingCredential:(ASPasswordCredential *)existingCredential newPassword:(NSString *)newPassword userInfo:(NSDictionary *)userInfo
{
  v8 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v8, a2);
  IMP v10 = (objc_class *)objc_opt_class();
  IMP v11 = class_getMethodImplementation(v10, a2);
  object_getClassName(self);
  v12 = [(id)objc_opt_class() description];
  [v12 containsString:@"."];

  BOOL v13 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
  if (MethodImplementation == v11)
  {
    if (v14) {
      -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:]();
    }
  }
  else if (v14)
  {
    -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:]();
  }
  v15 = [(ASAccountAuthenticationModificationViewController *)self extensionContext];
  v16 = [MEMORY[0x263F087E8] errorWithDomain:@"ASExtensionErrorDomain" code:1000 userInfo:0];
  [v15 cancelRequestWithError:v16];
}

- (void)prepareInterfaceToChangePasswordForServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier existingCredential:(ASPasswordCredential *)existingCredential newPassword:(NSString *)newPassword userInfo:(NSDictionary *)userInfo
{
  v8 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v8, a2);
  IMP v10 = (objc_class *)objc_opt_class();
  IMP v11 = class_getMethodImplementation(v10, a2);
  object_getClassName(self);
  v12 = [(id)objc_opt_class() description];
  [v12 containsString:@"."];

  BOOL v13 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
  if (MethodImplementation == v11)
  {
    if (v14) {
      -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:]();
    }
  }
  else if (v14)
  {
    -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:]();
  }
  v15 = [(ASAccountAuthenticationModificationViewController *)self extensionContext];
  v16 = [MEMORY[0x263F087E8] errorWithDomain:@"ASExtensionErrorDomain" code:1000 userInfo:0];
  [v15 cancelRequestWithError:v16];
}

- (void)cancelRequest
{
  id v3 = [(ASAccountAuthenticationModificationViewController *)self extensionContext];
  v2 = [MEMORY[0x263F087E8] errorWithDomain:@"ASExtensionErrorDomain" code:1 userInfo:0];
  [v3 cancelRequestWithError:v2];
}

- (void)convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_21918F000, v0, v1, "Class %{public}s must override %{public}s. Canceling extension request.");
}

- (void)convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_21918F000, v0, v1, "Class %{public}s's implementation of %{public}s should not call super. Canceling extension request.");
}

@end