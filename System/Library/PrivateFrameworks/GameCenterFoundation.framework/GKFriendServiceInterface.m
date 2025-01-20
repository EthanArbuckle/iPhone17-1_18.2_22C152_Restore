@interface GKFriendServiceInterface
+ (id)interfaceProtocol;
+ (void)configureInterface:(id)a3;
@end

@implementation GKFriendServiceInterface

+ (id)interfaceProtocol
{
  return &unk_1F1EAC3B8;
}

+ (void)configureInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  [v4 setClasses:v6 forSelector:sel_getFriendsForPlayer_handler_ argumentIndex:0 ofReply:0];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v4 setClasses:v9 forSelector:sel_getFriendsForPlayer_handler_ argumentIndex:0 ofReply:1];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v12 forSelector:sel_getChallengableFriendsForPlayer_handler_ argumentIndex:0 ofReply:1];
}

@end