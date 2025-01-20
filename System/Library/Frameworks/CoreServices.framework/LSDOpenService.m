@interface LSDOpenService
@end

@implementation LSDOpenService

void __31___LSDOpenService_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ECB581E0];
  v3 = (void *)+[_LSDOpenService XPCInterface]::result;
  +[_LSDOpenService XPCInterface]::result = v2;

  if (+[_LSDOpenService XPCInterface]::result
    || ([MEMORY[0x1E4F28B00] currentHandler],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        [v12 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"LSDOpenService.mm" lineNumber:59 description:@"Failed to create XPC interface object."], v12, +[_LSDOpenService XPCInterface]::result))
  {
    _LSGetFrontBoardOptionsDictionaryClasses();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_ argumentIndex:2 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_ argumentIndex:3 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClasses:v11 forSelector:sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_ argumentIndex:6 ofReply:0];
    v4 = [v11 setByAddingObject:objc_opt_class()];
    [(id)+[_LSDOpenService XPCInterface]::result setClasses:v4 forSelector:sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_ argumentIndex:7 ofReply:0];
    v5 = (void *)+[_LSDOpenService XPCInterface]::result;
    v6 = _LSOpenResourceOperationDelegateGetXPCInterface();
    [v5 setInterface:v6 forSelector:sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_ argumentIndex:8 ofReply:0];

    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_openApplicationWithIdentifier_options_useClientProcessHandle_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClasses:v11 forSelector:sel_openApplicationWithIdentifier_options_useClientProcessHandle_completionHandler_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_openApplicationWithIdentifier_options_useClientProcessHandle_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_openURL_fileHandle_options_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_openURL_fileHandle_options_completionHandler_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClasses:v11 forSelector:sel_openURL_fileHandle_options_completionHandler_ argumentIndex:2 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_openURL_fileHandle_options_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_openUserActivityWithUniqueIdentifier_activityData_activityType_bundleIdentifier_options_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_openUserActivityWithUniqueIdentifier_activityData_activityType_bundleIdentifier_options_completionHandler_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_openUserActivityWithUniqueIdentifier_activityData_activityType_bundleIdentifier_options_completionHandler_ argumentIndex:2 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_openUserActivityWithUniqueIdentifier_activityData_activityType_bundleIdentifier_options_completionHandler_ argumentIndex:3 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClasses:v11 forSelector:sel_openUserActivityWithUniqueIdentifier_activityData_activityType_bundleIdentifier_options_completionHandler_ argumentIndex:4 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_openUserActivityWithUniqueIdentifier_activityData_activityType_bundleIdentifier_options_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_canOpenURL_publicSchemes_privateSchemes_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_canOpenURL_publicSchemes_privateSchemes_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getURLOverrideForURL_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getURLOverrideForURL_completionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getURLOverrideForURL_completionHandler_ argumentIndex:1 ofReply:1];
    v7 = (void *)+[_LSDOpenService XPCInterface]::result;
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    [v7 setClasses:v10 forSelector:sel_getiCloudHostNamesWithCompletionHandler_ argumentIndex:0 ofReply:1];

    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_openAppLink_state_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_openAppLink_state_completionHandler_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_openAppLink_state_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_failedToOpenApplication_withURL_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_failedToOpenApplication_withURL_completionHandler_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_failedToOpenApplication_withURL_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDOpenService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_updateRestrictionKnowledgeWithCompletionHandler_ argumentIndex:1 ofReply:1];
  }
}

id __39___LSDOpenService_initWithXPCListener___block_invoke()
{
  return +[LSOpenStagingDirectoryManager sharedServerInstance];
}

@end