@interface CPSAuthenticationServiceInterface
+ (NSXPCInterface)clientInterface;
+ (NSXPCInterface)daemonInterface;
@end

@implementation CPSAuthenticationServiceInterface

+ (NSXPCInterface)clientInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FE2F218];
  v3 = (void *)MEMORY[0x263EFFA08];
  v4 = self;
  v5 = [v3 setWithObject:v4];
  [v2 setClasses:v5 forSelector:sel_authenticationSessionDeviceTappedNotification_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x263EFFA08];
  v7 = self;
  v8 = [v6 setWithObject:v7];
  [v2 setClasses:v8 forSelector:sel_authenticationSessionDeviceStartedAuthentication_ argumentIndex:0 ofReply:0];

  v9 = (void *)MEMORY[0x263EFFA08];
  v10 = self;
  v11 = self;
  v12 = self;
  v13 = self;
  v14 = self;
  v15 = self;
  v16 = self;
  v17 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, v15, v16, 0);

  [v2 setClasses:v17 forSelector:sel_authenticationSessionDidFinishWithResponse_ argumentIndex:0 ofReply:0];
  v18 = (void *)MEMORY[0x263EFFA08];
  v19 = self;
  v20 = [v18 setWithObject:v19];
  [v2 setClasses:v20 forSelector:sel_authenticationSessionDidFailWithError_ argumentIndex:0 ofReply:0];

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)daemonInterface
{
  v34 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FE309B8];
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = self;
  v4 = self;
  v5 = self;
  v6 = self;
  v7 = self;
  v8 = self;
  v9 = self;
  v10 = self;
  v11 = self;
  v12 = v2;
  v13 = (void *)v3;
  v14 = objc_msgSend(v12, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, v11, 0);

  [v34 setClasses:v14 forSelector:sel_startAuthenticationSessionWithRequest_completionHandler_ argumentIndex:0 ofReply:0];
  v15 = (void *)MEMORY[0x263EFFA08];
  v16 = self;
  v17 = [v15 setWithObject:v16];
  [v34 setClasses:v17 forSelector:sel_startAuthenticationSessionWithRequest_completionHandler_ argumentIndex:0 ofReply:1];

  v18 = (void *)MEMORY[0x263EFFA08];
  v19 = self;
  v20 = [v18 setWithObject:v19];
  [v34 setClasses:v20 forSelector:sel_fetchDaemonStatusWithCompletionHandler_ argumentIndex:0 ofReply:1];

  v21 = (void *)MEMORY[0x263EFFA08];
  v22 = self;
  v23 = [v21 setWithObject:v22];
  [v34 setClasses:v23 forSelector:sel_fetchDaemonStatusWithCompletionHandler_ argumentIndex:1 ofReply:1];

  v24 = (void *)MEMORY[0x263EFFA08];
  getAMSDelegatePurchaseRequestClass();
  v25 = self;
  v26 = [v24 setWithObject:v25];
  [v34 setClasses:v26 forSelector:sel_performAMSDelegatePurchaseWithRequest_isSandboxPurchase_completionHandler_ argumentIndex:0 ofReply:0];

  v27 = (void *)MEMORY[0x263EFFA08];
  getAMSDelegatePurchaseResultClass();
  v28 = self;
  v29 = [v27 setWithObject:v28];
  [v34 setClasses:v29 forSelector:sel_performAMSDelegatePurchaseWithRequest_isSandboxPurchase_completionHandler_ argumentIndex:0 ofReply:1];

  v30 = (void *)MEMORY[0x263EFFA08];
  v31 = self;
  v32 = [v30 setWithObject:v31];
  [v34 setClasses:v32 forSelector:sel_performAMSDelegatePurchaseWithRequest_isSandboxPurchase_completionHandler_ argumentIndex:1 ofReply:1];

  return (NSXPCInterface *)v34;
}

@end