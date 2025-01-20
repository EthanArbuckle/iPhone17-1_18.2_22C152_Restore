@interface WFTodoistAccount
+ (id)clientID;
+ (id)clientSecret;
+ (id)localizedServiceName;
+ (id)redirectURI;
+ (id)scopes;
+ (id)serviceID;
+ (id)serviceName;
+ (id)sessionManager;
@end

@implementation WFTodoistAccount

+ (id)redirectURI
{
  return (id)[NSURL URLWithString:@"https://workflow.is/api/todoist/callback"];
}

+ (id)scopes
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"data:read_write";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedServiceName
{
  return WFLocalizedString(@"Todoist");
}

+ (id)serviceName
{
  return @"Todoist";
}

+ (id)clientSecret
{
  return @"518d615e294341bdb44610392ce592be";
}

+ (id)clientID
{
  return @"0283303307f94fe6bb1f199b9916a3e6";
}

+ (id)sessionManager
{
  v3 = [WFTodoistOAuth2SessionManager alloc];
  v4 = [a1 clientID];
  v5 = [a1 clientSecret];
  v6 = [(WFTodoistOAuth2SessionManager *)v3 initWithClientID:v4 clientSecret:v5];

  return v6;
}

+ (id)serviceID
{
  return @"is.workflow.my.app.todoist";
}

@end