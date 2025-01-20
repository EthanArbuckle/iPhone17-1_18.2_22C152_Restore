@interface DAEASOpenIDMetadataRequest
+ (id)openIDrequestURLFor:(id)a3;
@end

@implementation DAEASOpenIDMetadataRequest

+ (id)openIDrequestURLFor:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08BA0];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithString:v4];

  id v6 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v6 setScheme:@"https"];
  v7 = [v5 host];
  [v6 setHost:v7];

  [v6 setPath:@"/common/v2.0/.well-known/openid-configuration"];
  v8 = (void *)MEMORY[0x263F08BD8];
  v9 = [v6 URL];
  v10 = [v8 requestWithURL:v9];

  return v10;
}

@end