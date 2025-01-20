@interface _EXExtensionIdentity(Configuration)
- (BOOL)requiresUIKitSceneHosting;
- (void)connectionHandlerClass;
@end

@implementation _EXExtensionIdentity(Configuration)

- (BOOL)requiresUIKitSceneHosting
{
  if (![(_EXExtensionIdentity *)self targetsSystemExtensionPoint]) {
    return 1;
  }
  v3 = [(_EXExtensionIdentity *)self extensionPointConfiguration];
  char v4 = objc_msgSend(v3, "_EX_BOOLForKey:", @"EXRequiresUIKitSceneHosting");

  return v4;
}

- (void)connectionHandlerClass
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = NSStringFromProtocol((Protocol *)&unk_1EE2E56C0);
  int v3 = 138543362;
  char v4 = v2;
  _os_log_error_impl(&dword_191F29000, a1, OS_LOG_TYPE_ERROR, "EXConnectionHandlerClass must conform to %{public}@.", (uint8_t *)&v3, 0xCu);
}

@end