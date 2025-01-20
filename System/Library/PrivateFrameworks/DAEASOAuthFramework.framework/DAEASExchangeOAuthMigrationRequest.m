@interface DAEASExchangeOAuthMigrationRequest
+ (id)urlRequestForOAuthTokenFromUsername:(id)a3 tokenRequestURI:(id)a4 password:(id)a5 scope:(id)a6;
@end

@implementation DAEASExchangeOAuthMigrationRequest

+ (id)urlRequestForOAuthTokenFromUsername:(id)a3 tokenRequestURI:(id)a4 password:(id)a5 scope:(id)a6
{
  v9 = NSURL;
  id v10 = a6;
  id v41 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v9 URLWithString:v11];
  v14 = [v13 path];
  v15 = [v13 path];
  v16 = @"/common";
  char v17 = [v15 hasPrefix:@"/common"];

  if ((v17 & 1) != 0
    || ([v13 path],
        v18 = objc_claimAutoreleasedReturnValue(),
        v16 = @"/consumers",
        int v19 = [v18 hasPrefix:@"/consumers"],
        v18,
        v19))
  {
    uint64_t v20 = [v14 rangeOfString:v16];
    uint64_t v22 = objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", v20, v21, @"/organizations");

    v14 = (void *)v22;
  }
  v23 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithString:v11];

  [v23 setPath:v14];
  id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
  v25 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"response_type" value:@"code"];
  [v24 addObject:v25];

  id v26 = objc_alloc(MEMORY[0x263F08BD0]);
  v27 = +[DAEASOAuthClient clientIDForOAuthType:1];
  v28 = (void *)[v26 initWithName:@"client_id" value:v27];
  [v24 addObject:v28];

  v29 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"grant_type" value:@"password"];
  [v24 addObject:v29];

  id v30 = objc_alloc(MEMORY[0x263F08BD0]);
  v31 = [v10 componentsJoinedByString:@" "];

  v32 = (void *)[v30 initWithName:@"scope" value:v31];
  [v24 addObject:v32];

  v33 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"username" value:v12];
  [v24 addObject:v33];

  v34 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"password" value:v41];
  [v24 addObject:v34];

  [v23 setQueryItems:v24];
  v35 = (void *)MEMORY[0x263F089E0];
  v36 = [v23 URL];
  v37 = [v35 requestWithURL:v36];

  v38 = [v23 percentEncodedQuery];
  v39 = [v38 dataUsingEncoding:4];
  [v37 setHTTPBody:v39];

  [v37 setCachePolicy:1];
  [v37 setHTTPMethod:@"POST"];
  [v37 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

  return v37;
}

@end