@interface SHMediaItemDaemonConnection
+ (id)serverConnection;
+ (void)fetchHapticsWithMediaItems:(id)a3 completionHandler:(id)a4;
+ (void)fetchMediaItemWithShazamID:(id)a3 completionHandler:(id)a4;
+ (void)fetchMediaItemsWithShazamIDs:(id)a3 completionHandler:(id)a4;
+ (void)isHapticTrackAvailableForMediaItem:(id)a3 completionHandler:(id)a4;
@end

@implementation SHMediaItemDaemonConnection

+ (id)serverConnection
{
  if (serverConnection_onceToken != -1) {
    dispatch_once(&serverConnection_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)serverConnection_serverConnection;

  return v2;
}

void __47__SHMediaItemDaemonConnection_serverConnection__block_invoke()
{
  v0 = [SHShazamKitServiceConnection alloc];
  id v3 = (id)objc_opt_new();
  uint64_t v1 = [(SHShazamKitServiceConnection *)v0 initWithConnectionProvider:v3];
  v2 = (void *)serverConnection_serverConnection;
  serverConnection_serverConnection = v1;
}

+ (void)fetchMediaItemWithShazamID:(id)a3 completionHandler:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [[SHShazamKey alloc] initWithKey:v6];
  v9 = v8;
  if (v8)
  {
    v10 = [(SHShazamKey *)v8 validatedKey];
    v18 = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __76__SHMediaItemDaemonConnection_fetchMediaItemWithShazamID_completionHandler___block_invoke;
    v15[3] = &unk_2646EF8D0;
    v16 = v9;
    id v17 = v7;
    [a1 fetchMediaItemsWithShazamIDs:v11 completionHandler:v15];

    v12 = v16;
  }
  else
  {
    uint64_t v19 = *MEMORY[0x263F07F80];
    v13 = [NSString stringWithFormat:@"%@ is not a valid shazamID", v6];
    v20[0] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v12 = +[SHError errorWithCode:600 underlyingError:0 keyOverrides:v14];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

void __76__SHMediaItemDaemonConnection_fetchMediaItemWithShazamID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = [v5 firstObject];
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
  }
  else
  {
    uint64_t v13 = *MEMORY[0x263F07F80];
    v9 = NSString;
    v10 = [*(id *)(a1 + 32) validatedKey];
    v11 = [v9 stringWithFormat:@"shazamID %@ not found", v10];
    v14[0] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v8 = +[SHError errorWithCode:600 underlyingError:v6 keyOverrides:v12];

    (*(void (**)(void, void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v8);
  }
}

+ (void)fetchMediaItemsWithShazamIDs:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [a1 serverConnection];
    [v8 mediaItemsForShazamIDs:v7 completionHandler:v6];
  }
}

+ (void)fetchHapticsWithMediaItems:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [a1 serverConnection];
    [v8 hapticsForMediaItems:v7 completionHandler:v6];
  }
}

+ (void)isHapticTrackAvailableForMediaItem:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [a1 serverConnection];
    [v8 isHapticTrackAvailableForMediaItem:v7 completionHandler:v6];
  }
}

@end