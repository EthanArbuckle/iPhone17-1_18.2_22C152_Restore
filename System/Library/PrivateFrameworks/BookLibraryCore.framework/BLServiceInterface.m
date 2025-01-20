@interface BLServiceInterface
+ (NSXPCInterface)mainInterface;
+ (NSXPCInterface)progressInterface;
@end

@implementation BLServiceInterface

+ (NSXPCInterface)mainInterface
{
  v3 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], a2, (uint64_t)&unk_26CEEA330, v2);
  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v9 = objc_msgSend_setWithObjects_(v4, v7, v5, v8, v6, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v3, v10, (uint64_t)v9, (uint64_t)sel_fetchDownloadListWithReply_, 0, 1);
  v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v16 = objc_msgSend_setWithObjects_(v11, v14, v12, v15, v13, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v3, v17, (uint64_t)v16, (uint64_t)sel_requestDownloadsWithRestoreContentRequestItems_reply_, 0, 0);
  v18 = (void *)MEMORY[0x263EFFA08];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  v23 = objc_msgSend_setWithObjects_(v18, v21, v19, v22, v20, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v3, v24, (uint64_t)v23, (uint64_t)sel_requestDownloadsWithRestoreContentRequestItems_reply_, 0, 1);
  v25 = (void *)MEMORY[0x263EFFA08];
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  v30 = objc_msgSend_setWithObjects_(v25, v28, v26, v29, v27, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v3, v31, (uint64_t)v30, (uint64_t)sel_migrationInfosWithStoreIDs_withReply_, 0, 1);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v3, v32, (uint64_t)v30, (uint64_t)sel_migrationInfosWithStates_withReply_, 0, 1);
  v35 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v33, (uint64_t)&unk_26CEEC9D0, v34);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v3, v36, (uint64_t)v35, (uint64_t)sel_purchaseWithRequest_uiHostProxy_reply_, 1, 0);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v3, v37, (uint64_t)v35, (uint64_t)sel_requestDownloadsWithManifestRequest_uiHostProxy_reply_, 1, 0);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v3, v38, (uint64_t)v35, (uint64_t)sel_setAutomaticDownloadEnabled_uiHostProxy_reply_, 1, 0);

  return (NSXPCInterface *)v3;
}

+ (NSXPCInterface)progressInterface
{
  return (NSXPCInterface *)objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], a2, (uint64_t)&unk_26CEEA868, v2);
}

@end