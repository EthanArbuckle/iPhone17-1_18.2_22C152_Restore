@interface WFTrelloAccount
+ (id)accountWithToken:(id)a3;
+ (id)localizedServiceName;
+ (id)serviceID;
+ (id)serviceName;
- (BOOL)isValid;
- (NSString)email;
- (NSString)token;
- (void)refreshWithCompletionHandler:(id)a3;
- (void)setEmail:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation WFTrelloAccount

+ (id)localizedServiceName
{
  return WFLocalizedString(@"Trello");
}

+ (id)serviceName
{
  return @"Trello";
}

+ (id)serviceID
{
  return @"is.workflow.my.app.trello";
}

+ (id)accountWithToken:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setToken:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

- (void)setEmail:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setToken:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (void)refreshWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(WFTrelloSessionManager);
  v6 = [(WFTrelloAccount *)self token];
  [(WFTrelloSessionManager *)v5 setToken:v6];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__WFTrelloAccount_refreshWithCompletionHandler___block_invoke;
  v8[3] = &unk_264E56478;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(WFTrelloSessionManager *)v5 getUserWithCompletionHandler:v8];
}

void __48__WFTrelloAccount_refreshWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    v6 = [*(id *)(a1 + 32) email];
    id v7 = [v11 email];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = [v11 email];
      [*(id *)(a1 + 32) setEmail:v9];

      +[WFAccount saveAccount:*(void *)(a1 + 32)];
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v5);
  }
}

- (BOOL)isValid
{
  v2 = [(WFTrelloAccount *)self token];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

@end