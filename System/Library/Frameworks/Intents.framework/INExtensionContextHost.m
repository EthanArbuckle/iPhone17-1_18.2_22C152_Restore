@interface INExtensionContextHost
+ (id)_allowedItemPayloadClasses;
+ (id)_extensionAuxiliaryHostProtocol;
- (NSBundle)extensionBundle;
- (void)setExtensionBundle:(id)a3;
@end

@implementation INExtensionContextHost

+ (id)_allowedItemPayloadClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDBDAAE8];
}

- (void).cxx_destruct
{
}

- (void)setExtensionBundle:(id)a3
{
}

- (NSBundle)extensionBundle
{
  return self->_extensionBundle;
}

@end