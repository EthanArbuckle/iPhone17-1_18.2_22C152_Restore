@interface GKChallengeServicePrivateInterface
+ (id)interfaceProtocol;
+ (void)configureInterface:(id)a3;
@end

@implementation GKChallengeServicePrivateInterface

+ (id)interfaceProtocol
{
  return &unk_1F1EB3340;
}

+ (void)configureInterface:(id)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  v6 = [v3 setWithArray:v5];
  [v4 setClasses:v6 forSelector:sel_getActiveLeaderboardChallengeDetailsForPlayerID_bundleID_allowStaleChallengeDetailsData_completionHandler_ argumentIndex:0 ofReply:1];
}

@end