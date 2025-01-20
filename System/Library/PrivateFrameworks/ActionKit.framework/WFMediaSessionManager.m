@interface WFMediaSessionManager
- (AMSBag)bag;
- (AMSMediaTask)task;
- (NSString)clientIdentifier;
- (NSString)clientVersion;
- (WFMediaSessionManager)init;
- (WFMediaSessionManager)initWithClientIdentifier:(id)a3 clientVersion:(id)a4;
- (void)lookupMediaType:(int64_t)a3 withIdentifiers:(id)a4 withCompletion:(id)a5;
@end

@implementation WFMediaSessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (AMSMediaTask)task
{
  return self->_task;
}

- (void)lookupMediaType:(int64_t)a3 withIdentifiers:(id)a4 withCompletion:(id)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc(MEMORY[0x263F27D18]);
  v11 = [(WFMediaSessionManager *)self clientIdentifier];
  v12 = [(WFMediaSessionManager *)self clientVersion];
  v13 = [(WFMediaSessionManager *)self bag];
  v14 = (AMSMediaTask *)[v10 initWithType:a3 clientIdentifier:v11 clientVersion:v12 bag:v13];
  task = self->_task;
  self->_task = v14;

  if (a3 == 300)
  {
    v21[0] = @"episodes";
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    [(AMSMediaTask *)self->_task setIncludedResultKeys:v16];
  }
  [(AMSMediaTask *)self->_task setItemIdentifiers:v8];
  v17 = [(AMSMediaTask *)self->_task perform];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __72__WFMediaSessionManager_lookupMediaType_withIdentifiers_withCompletion___block_invoke;
  v19[3] = &unk_264E56358;
  id v20 = v9;
  id v18 = v9;
  [v17 addFinishBlock:v19];
}

void __72__WFMediaSessionManager_lookupMediaType_withIdentifiers_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v5);
    }
  }
  else
  {
    v7 = [v10 object];
    id v8 = [v7 objectForKey:@"data"];

    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v8, 0);
    }
  }
}

- (WFMediaSessionManager)initWithClientIdentifier:(id)a3 clientVersion:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)WFMediaSessionManager;
  v4 = [(WFMediaSessionManager *)&v19 init];
  if (v4)
  {
    uint64_t v5 = [@"com.apple.shortcuts" copy];
    clientIdentifier = v4->_clientIdentifier;
    v4->_clientIdentifier = (NSString *)v5;

    uint64_t v7 = [@"1" copy];
    clientVersion = v4->_clientVersion;
    v4->_clientVersion = (NSString *)v7;

    uint64_t v9 = [MEMORY[0x263F27D18] bagSubProfile];
    id v10 = [MEMORY[0x263F27D18] bagSubProfileVersion];
    v11 = [MEMORY[0x263F27D18] bagKeySet];
    v12 = (void *)[v11 mutableCopy];

    v13 = [NSURL URLWithString:@"amp-api.podcasts.apple.com"];
    [v12 addBagKey:@"podcasts-media-api-host" valueType:5 defaultValue:v13];

    [v12 addBagKey:@"countryCode" valueType:4 defaultValue:@"us"];
    v14 = [NSURL URLWithString:@"https://sf-api-token-service.itunes.apple.com/apiToken/"];
    [v12 addBagKey:@"sf-api-token-service-url" valueType:5 defaultValue:v14];

    [MEMORY[0x263F27B40] registerBagKeySet:v12 forProfile:v9 profileVersion:v10];
    uint64_t v15 = [MEMORY[0x263F27B28] bagForProfile:v9 profileVersion:v10];
    bag = v4->_bag;
    v4->_bag = (AMSBag *)v15;

    v17 = v4;
  }

  return v4;
}

- (WFMediaSessionManager)init
{
  return [(WFMediaSessionManager *)self initWithClientIdentifier:@"com.apple.shortcuts" clientVersion:@"1"];
}

@end