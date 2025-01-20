@interface NSMutableURLRequest(WFOAuth2)
- (void)wfo_setAuthorizationWithCredential:()WFOAuth2;
- (void)wfo_setAuthorizationWithUsername:()WFOAuth2 password:;
- (void)wfo_setBodyWithQueryItems:()WFOAuth2;
@end

@implementation NSMutableURLRequest(WFOAuth2)

- (void)wfo_setBodyWithQueryItems:()WFOAuth2
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [a1 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
  id v5 = v4;
  if ([v5 count])
  {
    v19 = a1;
    v6 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v18 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v13 = [v12 name];
          v14 = WFHTTPFormEncodedString(v13);
          v15 = [v12 value];
          v16 = WFHTTPFormEncodedString(v15);
          [v6 appendFormat:@"%@=%@&", v14, v16];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);
    v17 = [v6 dataUsingEncoding:4];

    id v5 = v18;
    a1 = v19;
  }
  else
  {
    v17 = objc_opt_new();
  }

  [a1 setHTTPBody:v17];
}

- (void)wfo_setAuthorizationWithUsername:()WFOAuth2 password:
{
  id v16 = a3;
  id v7 = a4;
  id v8 = v16;
  uint64_t v9 = v7;
  if (!v16)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"NSMutableURLRequest+WFOAuth2.m", 51, @"Invalid parameter not satisfying: %@", @"username" object file lineNumber description];

    id v8 = 0;
  }
  uint64_t v10 = &stru_26F008428;
  if (v9) {
    uint64_t v10 = v9;
  }
  v11 = [NSString stringWithFormat:@"%@:%@", v8, v10];
  v12 = [v11 dataUsingEncoding:4];
  v13 = [v12 base64EncodedStringWithOptions:0];

  v14 = [@"Basic " stringByAppendingString:v13];
  [a1 setValue:v14 forHTTPHeaderField:@"Authorization"];
}

- (void)wfo_setAuthorizationWithCredential:()WFOAuth2
{
  id v8 = a3;
  if ([v8 isValid]
    && ([v8 tokenType],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 compare:@"bearer" options:1],
        v4,
        !v5))
  {
    v6 = [v8 accessToken];
    id v7 = [@"Bearer " stringByAppendingString:v6];
    [a1 setValue:v7 forHTTPHeaderField:@"Authorization"];
  }
  else
  {
    [a1 setValue:0 forHTTPHeaderField:@"Authorization"];
  }
}

@end