@interface CRDRecentContactsLibraryInterface
+ (id)XPCInterface;
+ (id)_xpcInterface;
@end

@implementation CRDRecentContactsLibraryInterface

id __49__CRDRecentContactsLibraryInterface_XPCInterface__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _xpcInterface];
  XPCInterface_sInterface = (uint64_t)result;
  return result;
}

+ (id)_xpcInterface
{
  v2 = (void *)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD84B00];
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", objc_opt_class()), sel_searchRecentsUsingQuery_completion_, 0, 0);
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0), sel_searchRecentsUsingQuery_completion_, 0, 1);
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0), sel_searchRecentsUsingQuery_completion_, 1, 1);
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), sel_restorePreviouslyDeletedRecentContacts_completion_, 0, 0);
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0), sel_restorePreviouslyDeletedRecentContacts_completion_, 0, 1);
  return v2;
}

+ (id)XPCInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CRDRecentContactsLibraryInterface_XPCInterface__block_invoke;
  block[3] = &unk_1E5CFBBE8;
  block[4] = a1;
  if (XPCInterface_onceToken != -1) {
    dispatch_once(&XPCInterface_onceToken, block);
  }
  return (id)XPCInterface_sInterface;
}

@end