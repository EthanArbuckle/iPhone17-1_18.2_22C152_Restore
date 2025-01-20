@interface LSDRebuildService
@end

@implementation LSDRebuildService

void __34___LSDRebuildService_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ECB56AD0];
  v3 = (void *)+[_LSDRebuildService XPCInterface]::result;
  +[_LSDRebuildService XPCInterface]::result = v2;

  v4 = (void *)+[_LSDRebuildService XPCInterface]::result;
  if (+[_LSDRebuildService XPCInterface]::result
    || ([MEMORY[0x1E4F28B00] currentHandler],
        v12 = objc_claimAutoreleasedReturnValue(),
        [v12 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"LSDRebuildService.mm" lineNumber:44 description:@"Failed to create XPC interface object."], v12, (v4 = (void *)+[_LSDRebuildService XPCInterface]::result) != 0))
  {
    v5 = XNSGetPropertyListClasses();
    [v4 setClasses:v5 forSelector:sel_performRebuildRegistration_personaUniqueStrings_reply_ argumentIndex:0 ofReply:0];

    v6 = (void *)+[_LSDRebuildService XPCInterface]::result;
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    [v6 setClasses:v9 forSelector:sel_performRebuildRegistration_personaUniqueStrings_reply_ argumentIndex:1 ofReply:0];

    [(id)+[_LSDRebuildService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performRebuildRegistration_personaUniqueStrings_reply_ argumentIndex:0 ofReply:1];
    v10 = (void *)+[_LSDRebuildService XPCInterface]::result;
    uint64_t v11 = objc_opt_class();
    [v10 setClass:v11 forSelector:sel_noteMigratorRunningWithReply_ argumentIndex:0 ofReply:1];
  }
}

@end