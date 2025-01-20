@interface GEOWiFiQualityServiceRemoteProxy
- (void)cancelRequestId:(id)a3;
- (void)submitWiFiQualityServiceRequest:(id)a3 requestId:(id)a4 auditToken:(id)a5 completionQueue:(id)a6 completion:(id)a7;
- (void)submitWiFiQualityTileLoadForKey:(id)a3 eTag:(id)a4 requestId:(id)a5 auditToken:(id)a6 completionQueue:(id)a7 completion:(id)a8;
@end

@implementation GEOWiFiQualityServiceRemoteProxy

- (void)submitWiFiQualityServiceRequest:(id)a3 requestId:(id)a4 auditToken:(id)a5 completionQueue:(id)a6 completion:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = a6;
  id v15 = a7;
  v16 = [v11 networkSearches];
  uint64_t v17 = [v16 count];

  int BOOL = GEOConfigGetBOOL(GeoServicesConfig_WiFiQualityNetworkDisabled, (uint64_t)off_1E9114998);
  if (v17
    && BOOL
    && ([MEMORY[0x1E4F28C58] GEOErrorWithCode:-6 reason:@"WiFiQualityService - Network lookup is administratively disabled"], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v20 = (void *)v19;
    v21 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOWiFiQualityService");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v20;
      _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "ticket submit failed with early out error : %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __116__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityServiceRequest_requestId_auditToken_completionQueue_completion___block_invoke;
    block[3] = &unk_1E53D7C50;
    id v33 = v20;
    id v34 = v15;
    id v22 = v20;
    id v23 = v15;
    dispatch_async(v14, block);

    v24 = v34;
  }
  else
  {
    id v23 = +[GEOXPCConnection createServerConnectionFor:19 debugIdentifier:@"GEOWiFiQualityService" eventHandler:0];
    v35[0] = @"wifireq";
    v25 = [v11 data];
    v35[1] = @"wifireqid";
    v36[0] = v25;
    v36[1] = v12;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];

    v24 = [MEMORY[0x1E4F1CA60] dictionary];
    [v24 setObject:@"wifiqualsvc.submit" forKeyedSubscript:@"message"];
    [v24 setObject:v22 forKeyedSubscript:@"userInfo"];
    v26 = [v13 proxiedBundleId];
    uint64_t v27 = [v26 length];

    if (v27)
    {
      v28 = [v13 proxiedBundleId];
      [v24 setObject:v28 forKeyedSubscript:@"proxiedBundleId"];
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __116__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityServiceRequest_requestId_auditToken_completionQueue_completion___block_invoke_2;
    v30[3] = &unk_1E53DA250;
    id v31 = v15;
    id v29 = v15;
    [v23 sendDictionary:v24 withReply:v14 handler:v30];
  }
}

- (void)submitWiFiQualityTileLoadForKey:(id)a3 eTag:(id)a4 requestId:(id)a5 auditToken:(id)a6 completionQueue:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = a7;
  id v18 = a8;
  if (GEOConfigGetBOOL(GeoServicesConfig_WiFiQualityTileDisabled, (uint64_t)off_1E91149A8))
  {
    uint64_t v19 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-6 reason:@"WiFiQualityService - Tile load is administratively disabled"];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityTileLoadForKey_eTag_requestId_auditToken_completionQueue_completion___block_invoke;
    block[3] = &unk_1E53D95B8;
    id v35 = v19;
    id v36 = v18;
    id v34 = v13;
    id v20 = v13;
    id v21 = v18;
    id v22 = v19;
    dispatch_async(v17, block);

    id v23 = v36;
  }
  else
  {
    id v22 = +[GEOXPCConnection createServerConnectionFor:19 debugIdentifier:@"GEOWiFiQualityService" eventHandler:0];
    id v21 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    [v21 setObject:v13 forKeyedSubscript:@"wifitk"];
    id v29 = v15;
    [v21 setObject:v15 forKeyedSubscript:@"wifireqid"];
    if (v14) {
      [v21 setObject:v14 forKeyedSubscript:@"wifiet"];
    }
    id v20 = [MEMORY[0x1E4F1CA60] dictionary];
    [v20 setObject:@"wifiqualsvc.tile" forKeyedSubscript:@"message"];
    v24 = (void *)[v21 copy];
    [v20 setObject:v24 forKeyedSubscript:@"userInfo"];

    v25 = [v16 proxiedBundleId];
    uint64_t v26 = [v25 length];

    if (v26)
    {
      uint64_t v27 = [v16 proxiedBundleId];
      [v20 setObject:v27 forKeyedSubscript:@"proxiedBundleId"];
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __121__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityTileLoadForKey_eTag_requestId_auditToken_completionQueue_completion___block_invoke_2;
    v30[3] = &unk_1E53DD310;
    id v31 = v13;
    id v32 = v18;
    id v28 = v13;
    id v23 = v18;
    [v22 sendDictionary:v20 withReply:v17 handler:v30];

    id v15 = v29;
  }
}

uint64_t __116__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityServiceRequest_requestId_auditToken_completionQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __116__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityServiceRequest_requestId_auditToken_completionQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOWiFiQualityService");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "ticket submit failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
    v7 = 0;
  }
  else
  {
    v6 = [a2 objectForKeyedSubscript:@"userInfo"];
    v8 = [v6 objectForKeyedSubscript:@"wifiresp"];
    v7 = [[GEOWiFiQualityServiceResponse alloc] initWithData:v8];
    v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOWiFiQualityService");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "ticket submit completed successfully", (uint8_t *)&v10, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __121__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityTileLoadForKey_eTag_requestId_auditToken_completionQueue_completion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5]);
}

void __121__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityTileLoadForKey_eTag_requestId_auditToken_completionQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOWiFiQualityService");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "ticket submit failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v6 = [a2 objectForKeyedSubscript:@"userInfo"];
    v8 = [v6 objectForKeyedSubscript:@"wifitd"];
    v7 = [v6 objectForKeyedSubscript:@"wifiet"];
    v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOWiFiQualityService");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "ticket submit completed successfully", (uint8_t *)&v10, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cancelRequestId:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[GEOXPCConnection createServerConnectionFor:19 debugIdentifier:@"GEOWiFiQualityService" eventHandler:0];
  int v10 = @"wifireqid";
  v11[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8[0] = @"message";
  v8[1] = @"userInfo";
  v9[0] = @"wifiqualsvc.cancel";
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v7 = +[GEOXPCConnection defaultXPCServerConnectionQueue];

  [v4 sendDictionary:v6 withReply:v7 handler:&__block_literal_global_35];
}

void __52__GEOWiFiQualityServiceRemoteProxy_cancelRequestId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOWiFiQualityService");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_ERROR, "ticket cancellation request failed with error: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

@end