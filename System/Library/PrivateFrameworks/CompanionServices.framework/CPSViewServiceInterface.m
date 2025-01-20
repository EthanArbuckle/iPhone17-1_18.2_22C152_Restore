@interface CPSViewServiceInterface
+ (NSXPCInterface)presenterInterface;
+ (NSXPCInterface)presentingInterface;
@end

@implementation CPSViewServiceInterface

+ (NSXPCInterface)presenterInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FE308F8];
  v3 = (void *)MEMORY[0x263EFFA08];
  v4 = self;
  v5 = [v3 setWithObject:v4];
  [v2 setClasses:v5 forSelector:sel_deactivateWithError_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x263EFFA08];
  v7 = self;
  v8 = [v6 setWithObject:v7];
  [v2 setClasses:v8 forSelector:sel_webAuthenticationFinishedWithCallbackURL_ argumentIndex:0 ofReply:0];

  v9 = (void *)MEMORY[0x263EFFA08];
  v10 = self;
  v11 = [v9 setWithObject:v10];
  [v2 setClasses:v11 forSelector:sel_webAuthenticationFailedWithError_ argumentIndex:0 ofReply:0];

  v12 = (void *)MEMORY[0x263EFFA08];
  getAMSDelegateAuthenticateResultClass();
  v13 = self;
  v14 = [v12 setWithObject:v13];
  [v2 setClasses:v14 forSelector:sel_storeAuthenticationFinishedWithResult_ argumentIndex:0 ofReply:0];

  v15 = (void *)MEMORY[0x263EFFA08];
  v16 = self;
  v17 = [v15 setWithObject:v16];
  [v2 setClasses:v17 forSelector:sel_storeAuthenticationFailedWithError_ argumentIndex:0 ofReply:0];

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)presentingInterface
{
  return (NSXPCInterface *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FE30958];
}

@end