@interface GKGameActivityHandler
+ (void)fetchAndEmitMostRecentGameActivity;
@end

@implementation GKGameActivityHandler

+ (void)fetchAndEmitMostRecentGameActivity
{
  id v5 = +[GKDaemonProxy proxyForLocalPlayer];
  v2 = [v5 gameService];
  v3 = +[GKGame currentGame];
  v4 = [v3 bundleIdentifier];
  [v2 fetchMostRecentGameActivityForBundleID:v4 handler:&__block_literal_global_38];
}

void __59__GKGameActivityHandler_fetchAndEmitMostRecentGameActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = os_log_GKGeneral;
  if (v2)
  {
    if (!os_log_GKGeneral)
    {
      id v4 = GKOSLoggers();
      v3 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v2;
      _os_log_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_INFO, "Found most recent game activityInternal: %@", buf, 0xCu);
    }
    id v5 = [[GKGameActivity alloc] initWithInternalRepresentation:v2];
    v6 = +[GKLocalPlayer localPlayer];
    v7 = [v6 eventEmitter];
    char v8 = [v7 listenerRegisteredForSelector:sel_player_wantsToPlayGameActivity_completionHandler_];

    if ((v8 & 1) == 0)
    {
      if (!os_log_GKGeneral) {
        id v9 = GKOSLoggers();
      }
      v10 = os_log_GKDeveloper;
      if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
        __59__GKGameActivityHandler_fetchAndEmitMostRecentGameActivity__block_invoke_cold_1(v10);
      }
    }
    v11 = [v6 eventEmitter];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__GKGameActivityHandler_fetchAndEmitMostRecentGameActivity__block_invoke_4;
    v14[3] = &unk_1E646DA18;
    v15 = v5;
    v12 = v5;
    [v11 player:v6 wantsToPlayGameActivity:v12 completionHandler:v14];
  }
  else
  {
    if (!os_log_GKGeneral)
    {
      id v13 = GKOSLoggers();
      v3 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_INFO, "Found no most recent game activity.", buf, 2u);
    }
  }
}

void __59__GKGameActivityHandler_fetchAndEmitMostRecentGameActivity__block_invoke_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v3 = GKOSLoggers();
    id v2 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1C2D22000, v2, OS_LOG_TYPE_INFO, "Done notifying developers about game activity: %@", (uint8_t *)&v5, 0xCu);
  }
}

void __59__GKGameActivityHandler_fetchAndEmitMostRecentGameActivity__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "<Warning>: listener not registered for: player:wantsToPlayGameActivity:completionHandler: defined in GKGameActivityListener. Please register listener correctly for the local player", v1, 2u);
}

@end