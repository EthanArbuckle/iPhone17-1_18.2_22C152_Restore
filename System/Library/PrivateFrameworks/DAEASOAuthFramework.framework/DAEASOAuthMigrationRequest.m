@interface DAEASOAuthMigrationRequest
+ (id)urlRequestForOAuthTokenFromUsername:(id)a3 password:(id)a4 scope:(id)a5;
@end

@implementation DAEASOAuthMigrationRequest

+ (id)urlRequestForOAuthTokenFromUsername:(id)a3 password:(id)a4 scope:(id)a5
{
  v26[6] = *MEMORY[0x263EF8340];
  v7 = NSURL;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v25 = [v7 URLWithString:@"https://login.live.com/oauth20_token.srf"];
  v11 = [MEMORY[0x263F089E0] requestWithURL:v25];
  v12 = [v8 componentsJoinedByString:@" "];

  v26[0] = @"response_type=code";
  v13 = NSString;
  v14 = +[DAEASOAuthClient clientIDForOAuthType:0];
  v15 = [v13 stringWithFormat:@"client_id=%@", v14];
  v26[1] = v15;
  v16 = [NSString stringWithFormat:@"grant_type=%@", @"password"];
  v26[2] = v16;
  v17 = [NSString stringWithFormat:@"scope=%@", v12];
  v26[3] = v17;
  v18 = [NSString stringWithFormat:@"username=%@", v10];

  v26[4] = v18;
  v19 = [NSString stringWithFormat:@"password=%@", v9];

  v26[5] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:6];

  v21 = [v20 componentsJoinedByString:@"&"];
  v22 = [v21 stringByAddingPercentEscapesUsingEncoding:4];

  v23 = [v22 dataUsingEncoding:4];
  [v11 setHTTPBody:v23];

  [v11 setCachePolicy:1];
  [v11 setHTTPMethod:@"POST"];
  [v11 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

  return v11;
}

@end