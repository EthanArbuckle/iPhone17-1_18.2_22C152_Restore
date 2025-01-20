@interface GEOUtilityService
+ (GEOUtilityService)sharedService;
- (id)_getPathSynchronous:(const char *)a3;
- (id)getGeoServicesCacheDirectoryPath;
- (id)getHomeDirectoryPath;
- (void)getCurrentGeoServicesState:(id)a3 callback:(id)a4;
- (void)sendHeartbeat;
@end

@implementation GEOUtilityService

void __34__GEOUtilityService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(GEOUtilityService);
  v1 = (void *)_MergedGlobals_221;
  _MergedGlobals_221 = (uint64_t)v0;
}

- (void)sendHeartbeat
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[GEOXPCConnection createServerConnectionFor:18 debugIdentifier:@"Utilities" eventHandler:0];
  v4 = @"message";
  v5[0] = @"utility.heartbeat";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 sendDictionary:v3];
}

+ (GEOUtilityService)sharedService
{
  if (qword_1EB29F920 != -1) {
    dispatch_once(&qword_1EB29F920, &__block_literal_global_62);
  }
  v2 = (void *)_MergedGlobals_221;

  return (GEOUtilityService *)v2;
}

- (id)_getPathSynchronous:(const char *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v4 = +[GEOXPCConnection createServerConnectionFor:18 debugIdentifier:@"Utilities" eventHandler:0];
  v11 = @"message";
  v5 = [NSString stringWithUTF8String:a3];
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v7 = [v4 sendDictionaryWithReplySync:v6 error:0];
  v8 = [v7 objectForKeyedSubscript:@"userInfo"];
  v9 = [v8 objectForKeyedSubscript:@"path"];

  return v9;
}

- (id)getHomeDirectoryPath
{
  return [(GEOUtilityService *)self _getPathSynchronous:"utility.getHomeDirectory"];
}

- (id)getGeoServicesCacheDirectoryPath
{
  return [(GEOUtilityService *)self _getPathSynchronous:"utility.getGeoServicesCacheDirectory"];
}

- (void)getCurrentGeoServicesState:(id)a3 callback:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[GEOXPCConnection createServerConnectionFor:18 debugIdentifier:@"Utilities" eventHandler:0];
  v15 = @"message";
  v16[0] = @"utility.currentServicesState";
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  global_queue = (void *)geo_get_global_queue();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __57__GEOUtilityService_getCurrentGeoServicesState_callback___block_invoke;
  v12[3] = &unk_1E53E0CE8;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  [v7 sendDictionary:v8 withReply:global_queue handler:v12];
}

void __57__GEOUtilityService_getCurrentGeoServicesState_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    v7 = [a2 objectForKeyedSubscript:@"userInfo"];
    v8 = [v7 objectForKeyedSubscript:@"state"];

    if ([v8 length]) {
      id v6 = [[GEOServicesState alloc] initWithData:v8];
    }
    else {
      id v6 = 0;
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__GEOUtilityService_getCurrentGeoServicesState_callback___block_invoke_2;
  block[3] = &unk_1E53D95B8;
  v9 = *(NSObject **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v15 = v5;
  id v16 = v10;
  id v14 = v6;
  id v11 = v5;
  v12 = v6;
  dispatch_async(v9, block);
}

uint64_t __57__GEOUtilityService_getCurrentGeoServicesState_callback___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end