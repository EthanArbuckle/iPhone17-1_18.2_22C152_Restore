@interface GKScopedIdManager
+ (void)gameCenterEnabledGameInstalled:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation GKScopedIdManager

+ (void)gameCenterEnabledGameInstalled:(id)a3 withCompletionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  v8 = os_log_GKCache;
  if (os_log_type_enabled((os_log_t)os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    +[GKScopedIdManager gameCenterEnabledGameInstalled:withCompletionHandler:]((uint64_t)v5, v8);
  }
  v9 = +[GKDaemonProxy daemonProxy];
  v10 = [v9 gameService];
  v12[0] = v5;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v10 storeGameForBundleIDs:v11 completion:v6];
}

+ (void)gameCenterEnabledGameInstalled:(uint64_t)a1 withCompletionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_DEBUG, "Game install notification for title: %@", (uint8_t *)&v2, 0xCu);
}

@end