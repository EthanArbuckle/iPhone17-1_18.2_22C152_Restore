@interface CDPExtensionHostContext
@end

@implementation CDPExtensionHostContext

void __54___CDPExtensionHostContext__allowedItemPayloadClasses__block_invoke()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v3 = (void *)_allowedItemPayloadClasses_classes;
  _allowedItemPayloadClasses_classes = v2;
}

@end