@interface GKUtilityServicePrivateInterface
+ (id)interfaceProtocol;
+ (void)configureInterface:(id)a3;
@end

@implementation GKUtilityServicePrivateInterface

+ (id)interfaceProtocol
{
  return &unk_1F1EB3460;
}

+ (void)configureInterface:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  [v5 setClasses:v7 forSelector:sel_getCredentialInfoAndStoreBagValuesForKeys_handler_ argumentIndex:0 ofReply:0];

  v8 = [a1 plistClasses];
  [v5 setClasses:v8 forSelector:sel_getCredentialInfoAndStoreBagValuesForKeys_handler_ argumentIndex:4 ofReply:1];

  v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v5 setClasses:v9 forSelector:sel_currentNonGameCenterForegroundGameHandler_ argumentIndex:0 ofReply:1];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v5 setClasses:v12 forSelector:sel_getFriendSuggestionsWithHandler_ argumentIndex:0 ofReply:1];

  v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v5 setClasses:v13 forSelector:sel_denyContact_handler_ argumentIndex:0 ofReply:0];

  v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v5 setClasses:v14 forSelector:sel_denyContact_handler_ argumentIndex:0 ofReply:1];

  v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v5 setClasses:v15 forSelector:sel_suggestedContactsListWithLimit_handler_ argumentIndex:0 ofReply:0];

  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  [v5 setClasses:v18 forSelector:sel_suggestedContactsListWithLimit_handler_ argumentIndex:0 ofReply:1];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  [v5 setClasses:v21 forSelector:sel_getGameInviteFriendSuggestionsWithHandler_ argumentIndex:0 ofReply:1];

  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setClasses:v22 forSelector:sel_getHostGameWithHandler_ argumentIndex:0 ofReply:1];
}

@end