@interface GKChallengeServiceInterface
+ (id)interfaceProtocol;
+ (void)configureInterface:(id)a3;
@end

@implementation GKChallengeServiceInterface

+ (id)interfaceProtocol
{
  return &unk_1F1EAEE88;
}

+ (void)configureInterface:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  [v4 setClasses:v6 forSelector:sel_getChallengesForGameDescriptor_handler_ argumentIndex:0 ofReply:1];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v4 setClasses:v9 forSelector:sel_getChallengeDetailsForChallengeIDs_handler_ argumentIndex:0 ofReply:1];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v4 setClasses:v12 forSelector:sel_getChallengeDetailsForChallengeIDs_receiverID_handler_ argumentIndex:0 ofReply:1];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v15 = [v13 setWithArray:v14];
  [v4 setClasses:v15 forSelector:sel_abortChallenges_handler_ argumentIndex:0 ofReply:0];

  v16 = (void *)MEMORY[0x1E4F1CAD0];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v18 = [v16 setWithArray:v17];
  [v4 setClasses:v18 forSelector:sel_issueChallenge_toPlayers_handler_ argumentIndex:1 ofReply:0];
}

@end