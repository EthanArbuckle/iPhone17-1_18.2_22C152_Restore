@interface GKTurnBasedServiceInterface
+ (id)interfaceProtocol;
+ (void)configureInterface:(id)a3;
@end

@implementation GKTurnBasedServiceInterface

+ (id)interfaceProtocol
{
  return &unk_1F1EAF438;
}

+ (void)configureInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  [v4 setClasses:v6 forSelector:sel_getTurnBasedMatchesAndCompatibleBundleID_handler_ argumentIndex:0 ofReply:1];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v4 setClasses:v9 forSelector:sel_getDetailsForTurnBasedMatchIDs_includeGameData_handler_ argumentIndex:0 ofReply:1];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v4 setClasses:v12 forSelector:sel_completeTurnBasedMatch_scores_achievements_handler_ argumentIndex:1 ofReply:0];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v15 forSelector:sel_completeTurnBasedMatch_scores_achievements_handler_ argumentIndex:2 ofReply:0];
}

@end