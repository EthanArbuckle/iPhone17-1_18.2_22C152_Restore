@interface CNDonationAgentXPCAdapter
+ (id)newXPCConnection;
+ (void)changeFromAccount:(id)a3 toAccount:(id)a4 scope:(id)a5;
+ (void)donateMeCardValues:(id)a3 scope:(id)a4;
+ (void)fetchDonatedMeCardWithScope:(id)a3;
+ (void)meCardDonationsWithScope:(id)a3;
+ (void)rejectValueWithDonationIdentifier:(id)a3 scope:(id)a4;
+ (void)rejectValuesWithClusterIdentifier:(id)a3 scope:(id)a4;
+ (void)removeAllRejectionsWithScope:(id)a3;
+ (void)removeDonatedMeCardValuesForIdentifiers:(id)a3 scope:(id)a4;
- (id)changeFromAccount:(id)a3 toAccount:(id)a4;
- (id)donateMeCardValues:(id)a3;
- (id)donatedMeCardEither;
- (id)fetchDonatedMeCard;
- (id)meCardDonations;
- (id)rejectValueWithDonationIdentifier:(id)a3;
- (id)rejectValuesWithClusterIdentifier:(id)a3;
- (id)removeAllRejections;
- (id)removeDonatedMeCardValuesForIdentifiers:(id)a3;
@end

@implementation CNDonationAgentXPCAdapter

- (id)donateMeCardValues:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  [(id)objc_opt_class() donateMeCardValues:v3 scope:v4];

  v5 = [(_CNDonationAgentXPCMethodScope *)v4 promise];
  v6 = [v5 future];

  return v6;
}

+ (void)donateMeCardValues:(id)a3 scope:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v9 = [v5 proxy];
  v7 = [v5 promise];

  v8 = [v7 errorOnlyCompletionHandlerAdapter];
  [v9 donateMeCardValues:v6 completionHandler:v8];
}

- (id)removeDonatedMeCardValuesForIdentifiers:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  [(id)objc_opt_class() removeDonatedMeCardValuesForIdentifiers:v3 scope:v4];

  id v5 = [(_CNDonationAgentXPCMethodScope *)v4 promise];
  id v6 = [v5 future];

  return v6;
}

+ (void)removeDonatedMeCardValuesForIdentifiers:(id)a3 scope:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 proxy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__CNDonationAgentXPCAdapter_removeDonatedMeCardValuesForIdentifiers_scope___block_invoke;
  v9[3] = &unk_2641FC428;
  id v10 = v5;
  id v8 = v5;
  [v7 removeDonatedMeCardValuesForIdentifiers:v6 completionHandler:v9];
}

void __75__CNDonationAgentXPCAdapter_removeDonatedMeCardValuesForIdentifiers_scope___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  id v5 = [*(id *)(a1 + 32) promise];
  id v6 = v5;
  if (a2)
  {
    v7 = [MEMORY[0x263EFF9D0] null];
    [v6 finishWithResult:v7];
  }
  else
  {
    [v5 finishWithError:v8];
  }
}

- (id)fetchDonatedMeCard
{
  v2 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  [(id)objc_opt_class() fetchDonatedMeCardWithScope:v2];
  id v3 = [(_CNDonationAgentXPCMethodScope *)v2 promise];
  v4 = [v3 future];

  return v4;
}

+ (void)fetchDonatedMeCardWithScope:(id)a3
{
  id v3 = a3;
  id v6 = [v3 proxy];
  v4 = [v3 promise];

  id v5 = [v4 completionHandlerAdapter];
  [v6 fetchDonatedMeCard:v5];
}

- (id)meCardDonations
{
  v2 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  [(id)objc_opt_class() meCardDonationsWithScope:v2];
  id v3 = [(_CNDonationAgentXPCMethodScope *)v2 promise];
  v4 = [v3 future];

  return v4;
}

+ (void)meCardDonationsWithScope:(id)a3
{
  id v3 = a3;
  id v6 = [v3 proxy];
  v4 = [v3 promise];

  id v5 = [v4 completionHandlerAdapter];
  [v6 meCardDonations:v5];
}

- (id)rejectValueWithDonationIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  [(id)objc_opt_class() rejectValueWithDonationIdentifier:v3 scope:v4];

  id v5 = [(_CNDonationAgentXPCMethodScope *)v4 promise];
  id v6 = [v5 future];

  return v6;
}

+ (void)changeFromAccount:(id)a3 toAccount:(id)a4 scope:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v12 = [v7 proxy];
  id v10 = [v7 promise];

  v11 = [v10 errorOnlyCompletionHandlerAdapter];
  [v12 changeFromAccount:v9 toAccount:v8 completionHandler:v11];
}

- (id)changeFromAccount:(id)a3 toAccount:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  [(id)objc_opt_class() changeFromAccount:v6 toAccount:v5 scope:v7];

  id v8 = [(_CNDonationAgentXPCMethodScope *)v7 promise];
  id v9 = [v8 future];

  return v9;
}

+ (void)rejectValueWithDonationIdentifier:(id)a3 scope:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v9 = [v5 proxy];
  id v7 = [v5 promise];

  id v8 = [v7 errorOnlyCompletionHandlerAdapter];
  [v9 rejectValueWithDonationIdentifier:v6 completionHandler:v8];
}

- (id)rejectValuesWithClusterIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  [(id)objc_opt_class() rejectValuesWithClusterIdentifier:v3 scope:v4];

  id v5 = [(_CNDonationAgentXPCMethodScope *)v4 promise];
  id v6 = [v5 future];

  return v6;
}

+ (void)rejectValuesWithClusterIdentifier:(id)a3 scope:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v9 = [v5 proxy];
  id v7 = [v5 promise];

  id v8 = [v7 errorOnlyCompletionHandlerAdapter];
  [v9 rejectValuesWithClusterIdentifier:v6 completionHandler:v8];
}

- (id)removeAllRejections
{
  v2 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  [(id)objc_opt_class() removeAllRejectionsWithScope:v2];
  id v3 = [(_CNDonationAgentXPCMethodScope *)v2 promise];
  v4 = [v3 future];

  return v4;
}

- (id)donatedMeCardEither
{
  v25[4] = *MEMORY[0x263EF8340];
  id v2 = +[CNDonationAgentXPCAdapter newXPCConnection];
  id v3 = (void *)MEMORY[0x263F336A8];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v25[3] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
  id v5 = [v2 remoteObjectInterface];
  [v3 addAllowedClasses:v4 toInterface:v5 forSelector:sel_synchronousDonatedMeCard_ argumentIndex:0 ofReply:1];

  [v2 resume];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __48__CNDonationAgentXPCAdapter_donatedMeCardEither__block_invoke;
  v18[3] = &unk_2641FC450;
  v18[4] = &v19;
  id v6 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__CNDonationAgentXPCAdapter_donatedMeCardEither__block_invoke_2;
  v11[3] = &unk_2641FC478;
  v11[4] = &v12;
  [v6 synchronousDonatedMeCard:v11];
  [v2 invalidate];
  id v7 = (void *)v13[5];
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [MEMORY[0x263F335B0] eitherWithRight:v20[5]];
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

uint64_t __48__CNDonationAgentXPCAdapter_donatedMeCardEither__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];

  return MEMORY[0x270F9A758]();
}

void __48__CNDonationAgentXPCAdapter_donatedMeCardEither__block_invoke_2(uint64_t a1, void *a2)
{
}

+ (void)removeAllRejectionsWithScope:(id)a3
{
  id v3 = a3;
  id v6 = [v3 proxy];
  v4 = [v3 promise];

  id v5 = [v4 errorOnlyCompletionHandlerAdapter];
  [v6 removeAllRejectionsWithCompletionHandler:v5];
}

+ (id)newXPCConnection
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.contacts.donation.agent" options:0];
  id v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C4FF6D8];
  [v2 setRemoteObjectInterface:v3];

  return v2;
}

@end