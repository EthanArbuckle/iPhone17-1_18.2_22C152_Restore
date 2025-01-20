@interface FSKitConstants
+ (NSSet)errorTypes;
+ (NSSet)extensionItemTypes;
+ (NSSet)plistAndValueTypes;
+ (NSSet)plistTypes;
+ (NSXPCInterface)FSAgentHostXPCProtocol;
+ (NSXPCInterface)FSAgentXPCProtocol;
+ (NSXPCInterface)FSAllClientXPCProtocols;
+ (NSXPCInterface)FSClientHostXPCProtocol;
+ (NSXPCInterface)FSClientXPCProtocol;
+ (NSXPCInterface)FSKitHelperProtocol;
+ (NSXPCInterface)FSModuleExtensionHostXPCProtocol;
+ (NSXPCInterface)FSModuleExtensionXPCProtocol;
+ (NSXPCInterface)FSTaskMessageOperations;
+ (NSXPCInterface)FSTaskOperations;
+ (NSXPCInterface)FSTaskProgressXPCProtocol;
+ (NSXPCInterface)FSVolumeXPCProtocol;
+ (void)setArgumentsForFSClientXPC:(id)a3;
@end

@implementation FSKitConstants

+ (NSXPCInterface)FSModuleExtensionXPCProtocol
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FFFD0B0];
  if (v2)
  {
    v3 = (void *)MEMORY[0x263EFFA08];
    uint64_t v4 = objc_opt_class();
    v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
    [v2 setClasses:v5 forSelector:sel_loadResource_options_replyHandler_ argumentIndex:0 ofReply:1];

    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    [v2 setClasses:v10 forSelector:sel_activateVolume_resource_options_replyHandler_ argumentIndex:0 ofReply:1];
  }
  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)FSModuleExtensionHostXPCProtocol
{
  return (NSXPCInterface *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270005EC8];
}

+ (void)setArgumentsForFSClientXPC:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  [v4 setClasses:v6 forSelector:sel_installedExtensions_ argumentIndex:0 ofReply:1];

  uint64_t v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v4 setClasses:v9 forSelector:sel_currentTasks_ argumentIndex:0 ofReply:1];

  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v4 setClasses:v12 forSelector:sel_currentResourceIDs_ argumentIndex:0 ofReply:1];

  v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  [v4 setClasses:v15 forSelector:sel_loadResource_usingBundle_options_replyHandler_ argumentIndex:0 ofReply:1];

  v16 = (void *)MEMORY[0x263EFFA08];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  [v4 setClasses:v18 forSelector:sel_loadResource_shortName_options_replyHandler_ argumentIndex:0 ofReply:1];

  v19 = (void *)MEMORY[0x263EFFA08];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, v21, v22, v23, v24, v25, objc_opt_class(), 0);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v26 forSelector:sel_currentContainers_ argumentIndex:0 ofReply:1];
}

+ (NSXPCInterface)FSClientXPCProtocol
{
  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270003F68];
  if (v3) {
    [a1 setArgumentsForFSClientXPC:v3];
  }
  return (NSXPCInterface *)v3;
}

+ (NSXPCInterface)FSClientHostXPCProtocol
{
  return (NSXPCInterface *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2700006E8];
}

+ (NSXPCInterface)FSAllClientXPCProtocols
{
  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270005F28];
  if (v3)
  {
    [a1 setArgumentsForFSClientXPC:v3];
    id v4 = (void *)MEMORY[0x263EFFA08];
    uint64_t v5 = objc_opt_class();
    v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
    [v3 setClasses:v6 forSelector:sel_installedExtensionsForAuditToken_replyHandler_ argumentIndex:0 ofReply:1];

    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    [v3 setClasses:v9 forSelector:sel_currentTasksForAuditToken_replyHandler_ argumentIndex:0 ofReply:1];

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    [v3 setClasses:v12 forSelector:sel_currentResourceIDsForAuditToken_replyHandler_ argumentIndex:0 ofReply:1];

    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, v18, objc_opt_class(), 0);
    [v3 setClasses:v19 forSelector:sel_currentContainersForAuditToken_replyHandler_ argumentIndex:0 ofReply:1];

    uint64_t v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    [v3 setClasses:v22 forSelector:sel_loadResource_usingBundle_options_auditToken_replyHandler_ argumentIndex:0 ofReply:1];
  }
  return (NSXPCInterface *)v3;
}

+ (NSXPCInterface)FSTaskMessageOperations
{
  return (NSXPCInterface *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FFFB6C0];
}

+ (NSXPCInterface)FSTaskOperations
{
  return (NSXPCInterface *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FFFB798];
}

+ (NSXPCInterface)FSTaskProgressXPCProtocol
{
  return (NSXPCInterface *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FFFD898];
}

+ (NSXPCInterface)FSKitHelperProtocol
{
  return (NSXPCInterface *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270005F88];
}

+ (NSXPCInterface)FSVolumeXPCProtocol
{
  return (NSXPCInterface *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270002528];
}

+ (NSXPCInterface)FSAgentXPCProtocol
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270005FE8];
  if (v2)
  {
    v3 = (void *)MEMORY[0x263EFFA08];
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
    [v2 setClasses:v6 forSelector:sel_installedExtensions_ argumentIndex:0 ofReply:1];

    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    [v2 setClasses:v9 forSelector:sel_installedExtensions_ argumentIndex:1 ofReply:1];
  }
  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)FSAgentHostXPCProtocol
{
  return (NSXPCInterface *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FFFEB80];
}

+ (NSSet)errorTypes
{
  if (errorTypes_onceToken != -1) {
    dispatch_once(&errorTypes_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)errorTypes_errorTypes;
  return (NSSet *)v2;
}

void __37__FSKitConstants_project__errorTypes__block_invoke()
{
  v4[8] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:8];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)errorTypes_errorTypes;
  errorTypes_errorTypes = v2;
}

+ (NSSet)plistTypes
{
  if (plistTypes_onceToken != -1) {
    dispatch_once(&plistTypes_onceToken, &__block_literal_global_314);
  }
  uint64_t v2 = (void *)plistTypes_plistTypes;
  return (NSSet *)v2;
}

void __37__FSKitConstants_project__plistTypes__block_invoke()
{
  v4[10] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  void v4[9] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:10];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)plistTypes_plistTypes;
  plistTypes_plistTypes = v2;
}

+ (NSSet)plistAndValueTypes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__FSKitConstants_project__plistAndValueTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (plistAndValueTypes_onceToken != -1) {
    dispatch_once(&plistAndValueTypes_onceToken, block);
  }
  uint64_t v2 = (void *)plistAndValueTypes_types;
  return (NSSet *)v2;
}

void __45__FSKitConstants_project__plistAndValueTypes__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) plistTypes];
  uint64_t v1 = [v3 setByAddingObject:objc_opt_class()];
  uint64_t v2 = (void *)plistAndValueTypes_types;
  plistAndValueTypes_types = v1;
}

+ (NSSet)extensionItemTypes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__FSKitConstants_project__extensionItemTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (extensionItemTypes_onceToken != -1) {
    dispatch_once(&extensionItemTypes_onceToken, block);
  }
  uint64_t v2 = (void *)extensionItemTypes_types;
  return (NSSet *)v2;
}

void __45__FSKitConstants_project__extensionItemTypes__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFF9C0];
  id v3 = [*(id *)(a1 + 32) plistTypes];
  uint64_t v4 = [v2 setWithSet:v3];

  uint64_t v5 = [*(id *)(a1 + 32) errorTypes];
  [v4 unionSet:v5];

  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:5];
  objc_msgSend(v4, "addObjectsFromArray:", v6, v9, v10, v11, v12);

  uint64_t v7 = [v4 copy];
  uint64_t v8 = (void *)extensionItemTypes_types;
  extensionItemTypes_types = v7;
}

@end