@interface EDiCloudAliasSupport
+ (OS_os_log)log;
- (ACAccount)appleAccount;
- (EDiCloudAliasSupport)initWithAppleAccount:(id)a3;
- (NSString)aliasAuthorizationHeader;
- (NSString)aliasUserAgent;
- (NSURL)aliasLookupURL;
- (id)_prepareAliasDataForEmailAddresses:(id)a3 defaultEmailAddress:(id)a4;
- (id)anisetteDataWithError:(id *)a3;
- (void)pushUpdateForAliasDataWithEmailAddresses:(id)a3 defaultEmailAddress:(id)a4;
@end

@implementation EDiCloudAliasSupport

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__EDiCloudAliasSupport_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_37 != -1) {
    dispatch_once(&log_onceToken_37, block);
  }
  v2 = (void *)log_log_37;

  return (OS_os_log *)v2;
}

void __27__EDiCloudAliasSupport_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_37;
  log_log_37 = (uint64_t)v1;
}

- (EDiCloudAliasSupport)initWithAppleAccount:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EDiCloudAliasSupport;
  v5 = [(EDiCloudAliasSupport *)&v10 init];
  if (v5)
  {
    v6 = [v4 parentAccount];
    if (v6)
    {
      v7 = [v4 parentAccount];
    }
    else
    {
      v7 = (ACAccount *)v4;
    }
    appleAccount = v5->_appleAccount;
    v5->_appleAccount = v7;
  }
  return v5;
}

- (NSURL)aliasLookupURL
{
  v2 = [(EDiCloudAliasSupport *)self appleAccount];
  id v3 = [v2 propertiesForDataclass:*MEMORY[0x1E4F17AD8]];
  id v4 = [v3 objectForKey:@"sendFromAddressJSONURL"];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  }
  else
  {
    v5 = 0;
  }

  return (NSURL *)v5;
}

- (NSString)aliasUserAgent
{
  id v2 = [NSString alloc];
  id v3 = EFProductName();
  id v4 = EFSystemBuildVersion();
  v5 = (void *)[v2 initWithFormat:@"%@ (%@)", v3, v4];

  return (NSString *)v5;
}

- (NSString)aliasAuthorizationHeader
{
  id v2 = [(EDiCloudAliasSupport *)self appleAccount];
  id v3 = NSString;
  id v4 = objc_msgSend(v2, "aa_personID");
  v5 = objc_msgSend(v2, "aa_authToken");
  v6 = [v3 stringWithFormat:@"%@:%@", v4, v5];

  v7 = [v6 dataUsingEncoding:1];
  v8 = [v7 base64EncodedStringWithOptions:0];
  v9 = [NSString stringWithFormat:@"X-MobileMe-AuthToken %@", v8];

  return (NSString *)v9;
}

- (id)anisetteDataWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (anisetteDataWithError__onceToken != -1) {
    dispatch_once(&anisetteDataWithError__onceToken, &__block_literal_global_24);
  }
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__11;
  v26 = __Block_byref_object_dispose__11;
  id v27 = 0;
  uint64_t v19 = 0;
  v20[0] = &v19;
  v20[1] = 0x3032000000;
  v20[2] = __Block_byref_object_copy__11;
  v20[3] = __Block_byref_object_dispose__11;
  id v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v15 = __46__EDiCloudAliasSupport_anisetteDataWithError___block_invoke_61;
  v16 = &unk_1E6C01438;
  v17 = &v22;
  v18 = &v19;
  id v4 = v14;
  uint64_t v5 = mach_absolute_time();
  v15((uint64_t)v4);
  uint64_t v6 = mach_absolute_time();
  if (EFGetElapsedTimeSinceAbsoluteTime_onceToken != -1) {
    dispatch_once(&EFGetElapsedTimeSinceAbsoluteTime_onceToken, &__block_literal_global_184);
  }
  uint64_t v8 = EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo;
  unint64_t v7 = *(unsigned int *)algn_1EB5F6FC4;

  if (*(void *)(v20[0] + 40))
  {
    v9 = +[EDiCloudAliasSupport log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(EDiCloudAliasSupport *)(uint64_t)v20 anisetteDataWithError:(double)((v6 - v5) * v8 / v7) / 1000000000.0];
    }

    if (a3) {
      *a3 = *(id *)(v20[0] + 40);
    }
  }
  else
  {
    objc_super v10 = +[EDiCloudAliasSupport log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v23[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v11;
      __int16 v30 = 2048;
      double v31 = (double)((v6 - v5) * v8 / v7) / 1000000000.0;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "anisetteDataWithError success: %@ (%.3f sec)", buf, 0x16u);
    }
  }
  id v12 = (id)v23[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v22, 8);

  return v12;
}

void __46__EDiCloudAliasSupport_anisetteDataWithError___block_invoke()
{
  id v0 = objc_alloc_init((Class)getAKAnisetteProvisioningControllerClass());
  os_log_t v1 = (void *)anisetteDataWithError__anisetteProvisioningController;
  anisetteDataWithError__anisetteProvisioningController = (uint64_t)v0;
}

void __46__EDiCloudAliasSupport_anisetteDataWithError___block_invoke_61(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v2 + 40);
  uint64_t v3 = [(id)anisetteDataWithError__anisetteProvisioningController anisetteDataWithError:&obj];
  objc_storeStrong((id *)(v2 + 40), obj);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)pushUpdateForAliasDataWithEmailAddresses:(id)a3 defaultEmailAddress:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v30 = a4;
  uint64_t v6 = +[EDiCloudAliasSupport log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v34) = [v31 count];
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Pushing update for alias data. Count = %d", buf, 8u);
  }

  unint64_t v7 = [(EDiCloudAliasSupport *)self aliasLookupURL];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28E88] requestWithURL:v7];
    [v8 setHTTPMethod:@"POST"];
    v9 = [(EDiCloudAliasSupport *)self aliasAuthorizationHeader];
    [v8 setValue:v9 forHTTPHeaderField:@"Authorization"];

    objc_super v10 = [(EDiCloudAliasSupport *)self aliasUserAgent];
    [v8 setValue:v10 forHTTPHeaderField:*MEMORY[0x1E4F60748]];

    -[NSObject setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", @"application/json-rpc; charset=UTF-8",
      *MEMORY[0x1E4F60698]);
    [v8 ak_addDeviceUDIDHeader];
    [v8 ak_addClientInfoHeader];
    id v32 = 0;
    uint64_t v11 = [(EDiCloudAliasSupport *)self anisetteDataWithError:&v32];
    id v29 = v32;
    if (v11)
    {
      id v12 = [v11 machineID];
      [v8 setValue:v12 forHTTPHeaderField:@"X-Apple-I-MD-M"];

      v13 = [v11 oneTimePassword];
      [v8 setValue:v13 forHTTPHeaderField:@"X-Apple-I-MD"];

      v14 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v11, "routingInfo"));
      [v8 setValue:v14 forHTTPHeaderField:@"X-Apple-I-MD-RINFO"];
    }
    else
    {
      v14 = +[EDiCloudAliasSupport log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = [(EDiCloudAliasSupport *)self appleAccount];
        v16 = objc_msgSend(v29, "ef_publicDescription");
        [(EDiCloudAliasSupport *)v15 pushUpdateForAliasDataWithEmailAddresses:v41 defaultEmailAddress:v14];
      }
    }

    v17 = [(EDiCloudAliasSupport *)self _prepareAliasDataForEmailAddresses:v31 defaultEmailAddress:v30];
    v18 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v17 options:0 error:0];
    [v8 setHTTPBody:v18];
    uint64_t v19 = (void *)EFCopyResponseDataForURLRequest();
    id v20 = 0;
    id v28 = 0;
    uint64_t v21 = [v20 statusCode];
    if (v21 == 200 && v19)
    {
      uint64_t v22 = +[EDiCloudAliasSupport log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = (id)[[NSString alloc] initWithData:v19 encoding:4];
        uint64_t v24 = (void *)[[NSString alloc] initWithData:v18 encoding:4];
        *(_DWORD *)buf = 138412546;
        id v34 = v23;
        __int16 v35 = 2112;
        uint64_t v36 = (uint64_t)v24;
        _os_log_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEFAULT, "response: %@.\nJSON: %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v22 = +[EDiCloudAliasSupport log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v25 = objc_msgSend(v28, "ef_publicDescription");
        uint64_t v26 = [[NSString alloc] initWithData:v18 encoding:4];
        *(_DWORD *)buf = 138413058;
        id v34 = v7;
        __int16 v35 = 2048;
        uint64_t v36 = v21;
        __int16 v37 = 2114;
        v38 = v25;
        __int16 v39 = 2112;
        id v27 = (void *)v26;
        uint64_t v40 = v26;
        _os_log_error_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_ERROR, "Unable to push new alias data to server %@. Received response code %lu, with error %{public}@.\nJSON:%@", buf, 0x2Au);
      }
    }
  }
  else
  {
    uint64_t v8 = +[EDiCloudAliasSupport log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[EDiCloudAliasSupport pushUpdateForAliasDataWithEmailAddresses:defaultEmailAddress:](v8);
    }
  }
}

- (id)_prepareAliasDataForEmailAddresses:(id)a3 defaultEmailAddress:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v28 = a4;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"2.0", @"jsonrpc", @"update", @"method", 0);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  id v27 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v29)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v29, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = v29;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_super v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v34[0] = @"address";
          id v11 = v10;
          id v12 = [v11 emailAddressValue];
          v13 = [v12 simpleAddress];
          v14 = v13;
          if (v13)
          {
            id v15 = v13;
          }
          else
          {
            id v15 = [v11 stringValue];
          }
          v16 = v15;

          v34[1] = @"canSendFrom";
          v35[0] = v16;
          v17 = [v6 objectForKeyedSubscript:v11];
          v35[1] = v17;
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
          [v5 addObject:v18];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v7);
    }

    [v27 setValue:v5 forKey:@"email"];
  }
  if (v28)
  {
    id v19 = v28;
    id v20 = [v19 emailAddressValue];
    uint64_t v21 = [v20 simpleAddress];
    uint64_t v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      id v23 = [v19 stringValue];
    }
    uint64_t v24 = v23;

    [v27 setValue:v24 forKey:@"defaultAddress"];
  }
  [v26 setValue:v27 forKey:@"params"];

  return v26;
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void).cxx_destruct
{
}

- (void)anisetteDataWithError:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a3;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "anisetteDataWithError failure: %@ (%.3f sec)", (uint8_t *)&v4, 0x16u);
}

- (void)pushUpdateForAliasDataWithEmailAddresses:(os_log_t)log defaultEmailAddress:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "No Alias Lookup URL", v1, 2u);
}

- (void)pushUpdateForAliasDataWithEmailAddresses:(uint8_t *)buf defaultEmailAddress:(os_log_t)log .cold.2(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "AnisetteData not found for account: %{public}@ error: %{public}@", buf, 0x16u);
}

@end