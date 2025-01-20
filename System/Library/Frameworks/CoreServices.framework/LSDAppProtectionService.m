@interface LSDAppProtectionService
@end

@implementation LSDAppProtectionService

void __40___LSDAppProtectionService_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ECB545A0];
  v3 = (void *)+[_LSDAppProtectionService XPCInterface]::result;
  +[_LSDAppProtectionService XPCInterface]::result = v2;

  v4 = (void *)+[_LSDAppProtectionService XPCInterface]::result;
  if (+[_LSDAppProtectionService XPCInterface]::result
    || ([MEMORY[0x1E4F28B00] currentHandler],
        id v20 = (id)objc_claimAutoreleasedReturnValue(),
        [v20 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"LSDAppProtectionService.m" lineNumber:348 description:@"Failed to create XPC interface object."], v20, (v4 = (void *)+[_LSDAppProtectionService XPCInterface]::result) != 0))
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:");

    [(id)+[_LSDAppProtectionService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_setHiddenApplications_completion_ argumentIndex:0 ofReply:1];
    v7 = (void *)+[_LSDAppProtectionService XPCInterface]::result;
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:");

    [(id)+[_LSDAppProtectionService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_setLockedApplications_completion_ argumentIndex:0 ofReply:1];
    v10 = (void *)+[_LSDAppProtectionService XPCInterface]::result;
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:");

    v13 = (void *)+[_LSDAppProtectionService XPCInterface]::result;
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:");
  }
}

@end