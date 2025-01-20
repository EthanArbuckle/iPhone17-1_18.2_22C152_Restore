@interface GKGameServiceInterface
+ (id)interfaceProtocol;
+ (void)configureInterface:(id)a3;
@end

@implementation GKGameServiceInterface

+ (id)interfaceProtocol
{
  return &unk_1F1EAE748;
}

+ (void)configureInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  [v4 setClasses:v6 forSelector:sel_getArcadeHighlightForAdamID_count_handler_ argumentIndex:0 ofReply:0];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v4 setClasses:v9 forSelector:sel_getArcadeHighlightForAdamID_count_handler_ argumentIndex:0 ofReply:1];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v4 setClasses:v12 forSelector:sel_getPerGameSettingsForBundleID_handler_ argumentIndex:0 ofReply:0];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  [v4 setClasses:v15 forSelector:sel_getPerGameSettingsForBundleID_handler_ argumentIndex:0 ofReply:1];

  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  [v4 setClasses:v18 forSelector:sel_setPerGameSettings_handler_ argumentIndex:0 ofReply:0];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  [v4 setClasses:v21 forSelector:sel_getPerGameFriendsForBundleID_handler_ argumentIndex:0 ofReply:0];

  v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  [v4 setClasses:v24 forSelector:sel_getPerGameFriendsForBundleID_handler_ argumentIndex:0 ofReply:1];

  v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  [v4 setClasses:v27 forSelector:sel_storeGameForBundleIDs_completion_ argumentIndex:0 ofReply:1];

  [v4 setClass:objc_opt_class() forSelector:sel_fetchMostRecentGameActivityForBundleID_handler_ argumentIndex:0 ofReply:0];
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v28 forSelector:sel_fetchMostRecentGameActivityForBundleID_handler_ argumentIndex:0 ofReply:1];
}

@end