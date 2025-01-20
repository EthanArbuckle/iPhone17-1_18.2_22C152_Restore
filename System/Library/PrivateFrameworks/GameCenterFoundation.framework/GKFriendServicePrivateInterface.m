@interface GKFriendServicePrivateInterface
+ (id)interfaceProtocol;
+ (void)configureInterface:(id)a3;
@end

@implementation GKFriendServicePrivateInterface

+ (id)interfaceProtocol
{
  return &unk_1F1EB31C0;
}

+ (void)configureInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  [v4 setClasses:v6 forSelector:sel_getCommonFriendsForPlayer_handler_ argumentIndex:0 ofReply:1];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v4 setClasses:v9 forSelector:sel_getFriendsForPlayer_withFilter_handler_ argumentIndex:0 ofReply:1];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v4 setClasses:v12 forSelector:sel_getConcernsForPlayer_handler_ argumentIndex:0 ofReply:1];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  [v4 setClasses:v15 forSelector:sel_removeMessageInboxEntries_handler_ argumentIndex:0 ofReply:0];

  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  [v4 setClasses:v18 forSelector:sel_getMessageInboxEntries_ argumentIndex:0 ofReply:1];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  [v4 setClasses:v21 forSelector:sel_getFriendCodeDetailWithIdentifiers_handler_ argumentIndex:0 ofReply:0];

  v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  [v4 setClasses:v24 forSelector:sel_getFriendCodeDetailWithIdentifiers_handler_ argumentIndex:0 ofReply:1];

  v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  [v4 setClasses:v27 forSelector:sel_getActiveFriendRequests_ argumentIndex:0 ofReply:1];

  v28 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v29 = objc_opt_class();
  v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
  [v4 setClasses:v30 forSelector:sel_getPlayerActivityFeed_bundleID_continuation_gameCategoryFilter_handler_ argumentIndex:0 ofReply:1];

  v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v32 = objc_opt_class();
  v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  [v4 setClasses:v33 forSelector:sel_getPlayerActivityFeed_bundleID_continuation_handler_ argumentIndex:0 ofReply:1];

  v34 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v35 = objc_opt_class();
  v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  [v4 setClasses:v36 forSelector:sel_getPlayerActivityFeed_gameID_continuation_handler_ argumentIndex:0 ofReply:1];

  v37 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v38 = objc_opt_class();
  v39 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
  [v4 setClasses:v39 forSelector:sel_getFriendsForPlayer_fetchOptions_handler_ argumentIndex:0 ofReply:1];

  v40 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v41 = objc_opt_class();
  v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
  [v4 setClasses:v42 forSelector:sel_getFriendsForPlayer_fetchOptions_withFilter_handler_ argumentIndex:0 ofReply:1];

  v43 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v43 forSelector:sel_getChallengableFriendsForPlayer_fetchOptions_completion_ argumentIndex:0 ofReply:0];

  v44 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v45 = objc_opt_class();
  v46 = objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
  [v4 setClasses:v46 forSelector:sel_getChallengableFriendsForPlayer_fetchOptions_completion_ argumentIndex:0 ofReply:1];

  v47 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v48 = objc_opt_class();
  v49 = objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
  [v4 setClasses:v49 forSelector:sel_getCombinedFriendInvitationListWithCompletion_ argumentIndex:0 ofReply:1];

  v50 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v51 = objc_opt_class();
  v52 = objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
  [v4 setClasses:v52 forSelector:sel_getFriendsLatestActivityWithCompletion_ argumentIndex:0 ofReply:1];

  v53 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v54 = objc_opt_class();
  objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
  id v55 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v55 forSelector:sel_getFriendRequestsBannerDataWithCompletion_ argumentIndex:0 ofReply:1];
}

@end