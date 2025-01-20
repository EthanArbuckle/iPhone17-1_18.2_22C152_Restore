@interface NSXPCInterface
@end

@implementation NSXPCInterface

uint64_t __51__NSXPCInterface_IL__il_messageFilterHostInterface__block_invoke()
{
  il_messageFilterHostInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CE70E50];

  return MEMORY[0x270F9A758]();
}

uint64_t __69__NSXPCInterface_IL_Internal__il_messageFilterExtensionHostInterface__block_invoke()
{
  il_messageFilterExtensionHostInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CE6DC00];

  return MEMORY[0x270F9A758]();
}

uint64_t __71__NSXPCInterface_IL_Internal__il_messageFilterExtensionVendorInterface__block_invoke()
{
  il_messageFilterExtensionVendorInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CE6E618];

  return MEMORY[0x270F9A758]();
}

uint64_t __72__NSXPCInterface_IL_Internal__il_classificationUIExtensionHostInterface__block_invoke()
{
  il_classificationUIExtensionHostInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CE70EB0];

  return MEMORY[0x270F9A758]();
}

void __74__NSXPCInterface_IL_Internal__il_classificationUIExtensionVendorInterface__block_invoke()
{
  v16[6] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CE70F10];
  v1 = (void *)il_classificationUIExtensionVendorInterface_interface;
  il_classificationUIExtensionVendorInterface_interface = v0;

  v2 = (void *)il_classificationUIExtensionVendorInterface_interface;
  v3 = (void *)MEMORY[0x263EFFA08];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v16[2] = objc_opt_class();
  v16[3] = objc_opt_class();
  v16[4] = objc_opt_class();
  v16[5] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:6];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_classificationResponseForRequest_completion_ argumentIndex:0 ofReply:0];

  v6 = (void *)il_classificationUIExtensionVendorInterface_interface;
  v7 = (void *)MEMORY[0x263EFFA08];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v15[2] = objc_opt_class();
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
  v9 = [v7 setWithArray:v8];
  [v6 setClasses:v9 forSelector:sel_classificationResponseForRequest_completion_ argumentIndex:0 ofReply:1];

  v10 = (void *)il_classificationUIExtensionVendorInterface_interface;
  v11 = (void *)MEMORY[0x263EFFA08];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  v14[4] = objc_opt_class();
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:5];
  v13 = [v11 setWithArray:v12];
  [v10 setClasses:v13 forSelector:sel_prepareForClassificationRequest_ argumentIndex:0 ofReply:0];
}

@end