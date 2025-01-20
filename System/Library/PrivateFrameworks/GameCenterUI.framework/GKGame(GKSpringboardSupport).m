@interface GKGame(GKSpringboardSupport)
+ (void)removeHistoryForGameWithBundleIdentifier:()GKSpringboardSupport completionHandler:;
@end

@implementation GKGame(GKSpringboardSupport)

+ (void)removeHistoryForGameWithBundleIdentifier:()GKSpringboardSupport completionHandler:
{
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F636C8];
  id v7 = a3;
  v8 = [v6 proxyForLocalPlayer];
  v9 = [v8 gameServicePrivate];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__GKGame_GKSpringboardSupport__removeHistoryForGameWithBundleIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_1E5F639B0;
  id v12 = v5;
  id v10 = v5;
  [v9 removeGameForBundleID:v7 handler:v11];
}

@end