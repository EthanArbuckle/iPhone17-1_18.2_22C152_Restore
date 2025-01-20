@interface GKAchievementLeaderboardScoreRangeRequest
+ (id)requestForRankRange:(_NSRange)a3;
@end

@implementation GKAchievementLeaderboardScoreRangeRequest

+ (id)requestForRankRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = objc_alloc_init(GKAchievementLeaderboardScoreRangeRequest);
  [(GKLeaderboardScoreRequest *)v5 setIdentifier:@"com.apple.gamecenter.achievement.points"];
  [(GKLeaderboardScoreRequest *)v5 setTimeScope:2];
  -[GKLeaderboardScoreRangeRequest setRange:](v5, "setRange:", location, length);

  return v5;
}

@end