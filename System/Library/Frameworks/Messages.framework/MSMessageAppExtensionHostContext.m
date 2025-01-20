@interface MSMessageAppExtensionHostContext
@end

@implementation MSMessageAppExtensionHostContext

void __88___MSMessageAppExtensionHostContext__extensionContextHostProtocolAllowedClassesForItems__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS____MSMessageAppExtensionHostContext;
  v1 = objc_msgSendSuper2(&v7, sel__extensionContextHostProtocolAllowedClassesForItems);
  v2 = (void *)MEMORY[0x1E4F1CA80];
  v8[0] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v4 = [v2 setWithArray:v3];

  [v4 unionSet:v1];
  uint64_t v5 = [v4 copy];
  v6 = (void *)_extensionContextHostProtocolAllowedClassesForItems_allowedClasses_0;
  _extensionContextHostProtocolAllowedClassesForItems_allowedClasses_0 = v5;
}

@end