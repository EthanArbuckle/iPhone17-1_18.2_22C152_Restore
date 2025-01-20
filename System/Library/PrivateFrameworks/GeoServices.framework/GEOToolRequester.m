@interface GEOToolRequester
+ (id)sharedRequester;
- (BOOL)flushPurgeableOfflineData;
- (BOOL)isProactiveTileDownloadEnabled;
- (BOOL)notifyNetworkDefaultsChanged;
- (id)getDefault:(id)a3 source:(int64_t *)a4;
- (id)listFilePathsLocal;
- (id)listFilePathsRemote;
- (id)ping;
- (id)pingOverIDS;
- (unint64_t)calculatePurgableSpaceForUrgency:(int)a3;
- (unint64_t)freePurgableSpace:(unint64_t)a3 forUrgency:(int)a4;
- (void)fetchOfflineMetadataWithCompletionHandler:(id)a3;
- (void)forceProactiveTileDownloaderRun;
- (void)invalidateTileCache;
- (void)lockDBs;
- (void)unlockDBs;
@end

@implementation GEOToolRequester

+ (id)sharedRequester
{
  if (qword_1EB29FBD8 != -1) {
    dispatch_once(&qword_1EB29FBD8, &__block_literal_global_90);
  }
  v2 = (void *)_MergedGlobals_239;

  return v2;
}

void __35__GEOToolRequester_sharedRequester__block_invoke()
{
  v0 = objc_alloc_init(GEOToolRequester);
  v1 = (void *)_MergedGlobals_239;
  _MergedGlobals_239 = (uint64_t)v0;
}

- (id)ping
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = +[GEOXPCConnection createServerConnectionFor:6 debugIdentifier:@"GEOTool" eventHandler:0];
  v8 = @"message";
  v9[0] = @"geotool.ping";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v4 = [v2 sendDictionaryWithReplySync:v3 error:0];
  v5 = [v4 objectForKeyedSubscript:@"userInfo"];
  v6 = [v5 objectForKeyedSubscript:@"ping"];

  return v6;
}

- (void)unlockDBs
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[GEOXPCConnection createServerConnectionFor:6 debugIdentifier:@"GEOTool" eventHandler:0];
  v4 = @"message";
  v5[0] = @"geotool.unlockDBs";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 sendDictionarySync:v3];
}

- (void)lockDBs
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[GEOXPCConnection createServerConnectionFor:6 debugIdentifier:@"GEOTool" eventHandler:0];
  v4 = @"message";
  v5[0] = @"geotool.lockDBs";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 sendDictionarySync:v3];
}

- (id)getDefault:(id)a3 source:(int64_t *)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[GEOXPCConnection createServerConnectionFor:6 debugIdentifier:@"GEOTool" eventHandler:0];
  id v18 = v5;
  v19[0] = @"message";
  v19[1] = @"userInfo";
  v20[0] = @"geotool.getDefault";
  v17 = @"key";
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v20[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  v9 = [v6 sendDictionaryWithReplySync:v8 error:0];
  v10 = v9;
  if (a4)
  {
    v11 = [v9 objectForKeyedSubscript:@"userInfo"];
    v12 = [v11 objectForKeyedSubscript:@"source"];

    if (v12) {
      int64_t v13 = [v12 unsignedIntegerValue];
    }
    else {
      int64_t v13 = 0;
    }
    *a4 = v13;
  }
  v14 = [v10 objectForKeyedSubscript:@"userInfo"];
  v15 = [v14 objectForKeyedSubscript:@"value"];

  return v15;
}

- (unint64_t)calculatePurgableSpaceForUrgency:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v16[2] = *MEMORY[0x1E4F143B8];
  v4 = +[GEOXPCConnection createServerConnectionFor:6 debugIdentifier:@"GEOTool" eventHandler:0];
  v15[0] = @"message";
  v15[1] = @"userInfo";
  v16[0] = @"geotool.calculatePurgableSpace";
  int64_t v13 = @"urgency";
  id v5 = [NSNumber numberWithInt:v3];
  v14 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v16[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  v8 = [v4 sendDictionaryWithReplySync:v7 error:0];
  v9 = [v8 objectForKeyedSubscript:@"userInfo"];
  v10 = [v9 objectForKeyedSubscript:@"bytes"];
  unint64_t v11 = [v10 unsignedLongLongValue];

  return v11;
}

- (unint64_t)freePurgableSpace:(unint64_t)a3 forUrgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  void v19[2] = *MEMORY[0x1E4F143B8];
  v6 = +[GEOXPCConnection createServerConnectionFor:6 debugIdentifier:@"GEOTool" eventHandler:0];
  v18[0] = @"message";
  v18[1] = @"userInfo";
  v19[0] = @"geotool.freePurgableSpace";
  v16[0] = @"urgency";
  v7 = [NSNumber numberWithInt:v4];
  v16[1] = @"bytes";
  v17[0] = v7;
  v8 = [NSNumber numberWithUnsignedLongLong:a3];
  v17[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v19[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  unint64_t v11 = [v6 sendDictionaryWithReplySync:v10 error:0];
  v12 = [v11 objectForKeyedSubscript:@"userInfo"];
  int64_t v13 = [v12 objectForKeyedSubscript:@"bytes"];
  unint64_t v14 = [v13 unsignedLongLongValue];

  return v14;
}

- (void)invalidateTileCache
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[GEOXPCConnection createServerConnectionFor:6 debugIdentifier:@"GEOTool" eventHandler:0];
  uint64_t v4 = @"message";
  v5[0] = @"geotool.invalidateTileCache";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 sendDictionarySync:v3];
}

- (BOOL)notifyNetworkDefaultsChanged
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = +[GEOXPCConnection createServerConnectionFor:6 debugIdentifier:@"GEOTool" eventHandler:0];
  v9 = @"message";
  v10[0] = @"geotool.notifyNetworkDefaultsChanged";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v4 = [v2 sendDictionaryWithReplySync:v3 error:0];
  id v5 = [v4 objectForKeyedSubscript:@"userInfo"];
  v6 = [v5 objectForKeyedSubscript:@"status"];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)forceProactiveTileDownloaderRun
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[GEOXPCConnection createServerConnectionFor:6 debugIdentifier:@"GEOTool" eventHandler:0];
  uint64_t v4 = @"message";
  v5[0] = @"geotool.forceProactiveTileDownloaderRun";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 sendDictionarySync:v3];
}

- (BOOL)isProactiveTileDownloadEnabled
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = +[GEOXPCConnection createServerConnectionFor:6 debugIdentifier:@"GEOTool" eventHandler:0];
  v9 = @"message";
  v10[0] = @"geotool.checkProactiveTileDownloadPolicyEnabled";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v4 = [v2 sendDictionaryWithReplySync:v3 error:0];
  id v5 = [v4 objectForKeyedSubscript:@"userInfo"];
  v6 = [v5 objectForKeyedSubscript:@"enabled"];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (id)listFilePathsRemote
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = +[GEOXPCConnection createServerConnectionFor:6 debugIdentifier:@"GEOTool" eventHandler:0];
  char v7 = @"message";
  v8[0] = @"geotool.listFilePaths";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v4 = [v2 sendDictionaryWithReplySync:v3 error:0];
  id v5 = [v4 objectForKeyedSubscript:@"userInfo"];

  return v5;
}

- (id)listFilePathsLocal
{
  return +[GEOFilePaths dictionaryRepresentation];
}

- (void)fetchOfflineMetadataWithCompletionHandler:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[GEOXPCConnection createServerConnectionFor:6 debugIdentifier:@"GEOTool" eventHandler:0];
  v10 = @"message";
  v11[0] = @"geotool.fetchOfflineMetadata";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  global_queue = (void *)geo_get_global_queue();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __62__GEOToolRequester_fetchOfflineMetadataWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E53DA250;
  id v9 = v3;
  id v7 = v3;
  [v4 sendDictionary:v5 withReply:global_queue handler:v8];
}

void __62__GEOToolRequester_fetchOfflineMetadataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (v3)
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"userInfo"];
    id v5 = [v4 objectForKeyedSubscript:@"activeVersions"];

    v6 = [v12 objectForKeyedSubscript:@"userInfo"];
    id v7 = [v6 objectForKeyedSubscript:@"updated"];
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E4F1C9C8];
      id v9 = [v12 objectForKeyedSubscript:@"userInfo"];
      v10 = [v9 objectForKeyedSubscript:@"updated"];
      [v10 doubleValue];
      unint64_t v11 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      unint64_t v11 = 0;
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (BOOL)flushPurgeableOfflineData
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = +[GEOXPCConnection createServerConnectionFor:6 debugIdentifier:@"GEOTool" eventHandler:0];
  id v9 = @"message";
  v10[0] = @"geotool.flushPurgeableOfflineData";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v4 = [v2 sendDictionaryWithReplySync:v3 error:0];
  id v5 = [v4 objectForKeyedSubscript:@"userInfo"];
  v6 = [v5 objectForKeyedSubscript:@"success"];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (id)pingOverIDS
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = +[GEOXPCConnection createServerConnectionFor:6 debugIdentifier:@"GEOTool" eventHandler:0];
  v8 = @"message";
  v9[0] = @"geotool.pingOverIDS";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v4 = [v2 sendDictionaryWithReplySync:v3 error:0];
  id v5 = [v4 objectForKeyedSubscript:@"userInfo"];
  v6 = [v5 objectForKeyedSubscript:@"ping"];

  return v6;
}

@end