@interface GKDashboardRequest
- (BOOL)isArcade;
- (BOOL)shouldShowPlayForChallenge;
- (BOOL)shouldShowPlayForTurnBasedMatch;
- (BOOL)shouldShowQuitForTurnBasedMatch;
- (GKAchievement)achievement;
- (GKGameRecord)gameRecord;
- (GKLeaderboard)leaderboard;
- (NSString)achievementID;
- (NSString)activityIdentifier;
- (NSString)gameBundleID;
- (NSString)launchContext;
- (NSString)leaderboardID;
- (NSString)leaderboardSetID;
- (NSString)leaderboardTitle;
- (NSString)playerAlias;
- (NSString)playerID;
- (int64_t)leaderboardPlayerScope;
- (int64_t)leaderboardTimeScope;
- (int64_t)state;
- (unint64_t)deepLinkDestination;
- (void)setAchievement:(id)a3;
- (void)setAchievementID:(id)a3;
- (void)setActivityIdentifier:(id)a3;
- (void)setDeepLinkDestination:(unint64_t)a3;
- (void)setGameBundleID:(id)a3;
- (void)setGameRecord:(id)a3;
- (void)setIsArcade:(BOOL)a3;
- (void)setLaunchContext:(id)a3;
- (void)setLeaderboard:(id)a3;
- (void)setLeaderboardID:(id)a3;
- (void)setLeaderboardPlayerScope:(int64_t)a3;
- (void)setLeaderboardSetID:(id)a3;
- (void)setLeaderboardTimeScope:(int64_t)a3;
- (void)setLeaderboardTitle:(id)a3;
- (void)setPlayerAlias:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setShouldShowPlayForChallenge:(BOOL)a3;
- (void)setShouldShowPlayForTurnBasedMatch:(BOOL)a3;
- (void)setShouldShowQuitForTurnBasedMatch:(BOOL)a3;
- (void)setState:(int64_t)a3;
@end

@implementation GKDashboardRequest

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)leaderboardID
{
  return self->_leaderboardID;
}

- (void)setLeaderboardID:(id)a3
{
}

- (NSString)leaderboardSetID
{
  return self->_leaderboardSetID;
}

- (void)setLeaderboardSetID:(id)a3
{
}

- (NSString)leaderboardTitle
{
  return self->_leaderboardTitle;
}

- (void)setLeaderboardTitle:(id)a3
{
}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (void)setLeaderboard:(id)a3
{
}

- (int64_t)leaderboardTimeScope
{
  return self->_leaderboardTimeScope;
}

- (void)setLeaderboardTimeScope:(int64_t)a3
{
  self->_leaderboardTimeScope = a3;
}

- (int64_t)leaderboardPlayerScope
{
  return self->_leaderboardPlayerScope;
}

- (void)setLeaderboardPlayerScope:(int64_t)a3
{
  self->_leaderboardPlayerScope = a3;
}

- (NSString)gameBundleID
{
  return self->_gameBundleID;
}

- (void)setGameBundleID:(id)a3
{
}

- (NSString)achievementID
{
  return self->_achievementID;
}

- (void)setAchievementID:(id)a3
{
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
}

- (NSString)playerAlias
{
  return self->_playerAlias;
}

- (void)setPlayerAlias:(id)a3
{
}

- (GKAchievement)achievement
{
  return self->_achievement;
}

- (void)setAchievement:(id)a3
{
}

- (GKGameRecord)gameRecord
{
  return self->_gameRecord;
}

- (void)setGameRecord:(id)a3
{
}

- (BOOL)isArcade
{
  return self->_isArcade;
}

- (void)setIsArcade:(BOOL)a3
{
  self->_isArcade = a3;
}

- (BOOL)shouldShowPlayForChallenge
{
  return self->_shouldShowPlayForChallenge;
}

- (void)setShouldShowPlayForChallenge:(BOOL)a3
{
  self->_shouldShowPlayForChallenge = a3;
}

- (BOOL)shouldShowPlayForTurnBasedMatch
{
  return self->_shouldShowPlayForTurnBasedMatch;
}

- (void)setShouldShowPlayForTurnBasedMatch:(BOOL)a3
{
  self->_shouldShowPlayForTurnBasedMatch = a3;
}

- (BOOL)shouldShowQuitForTurnBasedMatch
{
  return self->_shouldShowQuitForTurnBasedMatch;
}

- (void)setShouldShowQuitForTurnBasedMatch:(BOOL)a3
{
  self->_shouldShowQuitForTurnBasedMatch = a3;
}

- (NSString)launchContext
{
  return self->_launchContext;
}

- (void)setLaunchContext:(id)a3
{
}

- (unint64_t)deepLinkDestination
{
  return self->_deepLinkDestination;
}

- (void)setDeepLinkDestination:(unint64_t)a3
{
  self->_deepLinkDestination = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchContext, 0);
  objc_storeStrong((id *)&self->_gameRecord, 0);
  objc_storeStrong((id *)&self->_achievement, 0);
  objc_storeStrong((id *)&self->_playerAlias, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_achievementID, 0);
  objc_storeStrong((id *)&self->_gameBundleID, 0);
  objc_storeStrong((id *)&self->_leaderboard, 0);
  objc_storeStrong((id *)&self->_leaderboardTitle, 0);
  objc_storeStrong((id *)&self->_leaderboardSetID, 0);

  objc_storeStrong((id *)&self->_leaderboardID, 0);
}

@end