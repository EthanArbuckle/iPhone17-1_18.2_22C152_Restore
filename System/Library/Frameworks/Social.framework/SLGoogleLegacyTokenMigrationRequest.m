@interface SLGoogleLegacyTokenMigrationRequest
+ (id)urlRequestForAuthCodeFromAuthToken:(id)a3 clientID:(id)a4 scope:(id)a5;
+ (id)urlRequestForAuthTokenFromLegacyClientToken:(id)a3 username:(id)a4 password:(id)a5;
@end

@implementation SLGoogleLegacyTokenMigrationRequest

+ (id)urlRequestForAuthTokenFromLegacyClientToken:(id)a3 username:(id)a4 password:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v37[0] = @"accountType";
  v37[1] = @"Email";
  v38 = @"HOSTED_OR_GOOGLE";
  id v39 = a4;
  id v28 = a5;
  v29 = v39;
  v37[2] = @"Passwd";
  v37[3] = @"service";
  id v40 = v28;
  v41 = @"lso";
  v37[4] = @"source";
  v37[5] = @"clientidtoken";
  v42 = @"AppleBootstrap";
  id v43 = v7;
  v30 = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:v37 count:6];
  v9 = (void *)MEMORY[0x1E4F28E88];
  v10 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://accounts.google.com/accounts/ClientLogin"];
  v27 = [v9 requestWithURL:v10];

  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v12 = v8;
  id obj = [v8 allKeys];
  uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v18 = [v12 objectForKeyedSubscript:v17];
        v19 = NSString;
        v20 = [v17 stringByAddingPercentEscapesUsingEncoding:4];
        v21 = [v18 stringByAddingPercentEscapesUsingEncoding:4];
        v22 = [v19 stringWithFormat:@"%@=%@", v20, v21];

        [v11 addObject:v22];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v14);
  }

  v23 = [v11 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  v24 = [v23 componentsJoinedByString:@"&"];
  v25 = [v24 dataUsingEncoding:4];
  [v27 setHTTPBody:v25];

  [v27 setCachePolicy:1];
  [v27 setHTTPMethod:@"POST"];
  [v27 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

  return v27;
}

+ (id)urlRequestForAuthCodeFromAuthToken:(id)a3 clientID:(id)a4 scope:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [a5 componentsJoinedByString:@" "];
  v10 = [v9 stringByAddingPercentEscapesUsingEncoding:4];

  v11 = [v7 stringByAddingPercentEscapesUsingEncoding:4];

  v12 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v13 = [NSString stringWithFormat:@"%@?scope=%@&client_id=%@", @"https://accounts.google.com/o/oauth2/programmatic_auth", v10, v11];
  uint64_t v14 = [v12 URLWithString:v13];

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v14];
  v16 = [NSString stringWithFormat:@"GoogleLogin auth=%@", v8];

  [v15 setValue:v16 forHTTPHeaderField:@"Authorization"];

  return v15;
}

@end