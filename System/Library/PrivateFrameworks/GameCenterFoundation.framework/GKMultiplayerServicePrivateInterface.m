@interface GKMultiplayerServicePrivateInterface
+ (id)interfaceProtocol;
+ (void)configureInterface:(id)a3;
@end

@implementation GKMultiplayerServicePrivateInterface

+ (id)interfaceProtocol
{
  return &unk_1F1EB33A0;
}

+ (void)configureInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v6 setClasses:v5 forSelector:sel_invitePlayersV2_toGame_handler_ argumentIndex:0 ofReply:0];

  [v6 setClass:objc_opt_class() forSelector:sel_invitePlayersV2_toGame_handler_ argumentIndex:1 ofReply:0];
}

@end