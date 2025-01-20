@interface GKLocalPlayer(GKSavedGame)
@end

@implementation GKLocalPlayer(GKSavedGame)

- (void)fetchSavedGamesWithCompletionHandler:()GKSavedGame .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "Saved Games API: fetchSavedGamesWithCompletionHandler called.", v2, v3, v4, v5, v6);
}

- (void)saveGameData:()GKSavedGame withName:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "Saved Games API: saveGameData:withName:completionHandler: called.", v2, v3, v4, v5, v6);
}

- (void)deleteSavedGamesWithName:()GKSavedGame completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "Saved Games API: deleteSavedGamesWithName:completionHandler:", v2, v3, v4, v5, v6);
}

- (void)resolveConflictingSavedGames:()GKSavedGame withData:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1C2D22000, v0, v1, "Saved Games API: resolveConflictingSavedGames:withData:completionHandler:", v2, v3, v4, v5, v6);
}

@end