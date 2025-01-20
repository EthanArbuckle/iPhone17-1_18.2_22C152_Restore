@interface DKDaemonInterface
@end

@implementation DKDaemonInterface

void ___DKDaemonInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDE54058];
  v1 = (void *)_DKDaemonInterface_interface;
  _DKDaemonInterface_interface = v0;

  v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v24, v23, v22, v21, v20, v19, v18, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11,
    objc_opt_class(),
  v26 = 0);
  [(id)_DKDaemonInterface_interface setClasses:v26 forSelector:sel_saveObjects_reply_ argumentIndex:0 ofReply:0];
  [(id)_DKDaemonInterface_interface setClasses:v26 forSelector:sel_deleteObjects_reply_ argumentIndex:0 ofReply:0];
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
  [(id)_DKDaemonInterface_interface setClasses:v16 forSelector:sel_executeQuery_reply_ argumentIndex:0 ofReply:0];
  [(id)_DKDaemonInterface_interface setClasses:v26 forSelector:sel_executeQuery_reply_ argumentIndex:0 ofReply:1];
  [(id)_DKDaemonInterface_interface setClasses:v26 forSelector:sel_sourceDeviceIdentityWithReply_ argumentIndex:0 ofReply:1];
  [(id)_DKDaemonInterface_interface setClasses:v26 forSelector:sel_deviceUUIDWithReply_ argumentIndex:0 ofReply:1];
  v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [(id)_DKDaemonInterface_interface setClasses:v17 forSelector:sel_requestBiomeEndpoint_reply_ argumentIndex:0 ofReply:1];
}

@end