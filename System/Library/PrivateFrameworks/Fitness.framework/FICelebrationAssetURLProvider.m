@interface FICelebrationAssetURLProvider
+ (id)_celebrationMovieSubdirectory;
+ (id)_movieNameForAchievementIdentifier:(id)a3 variantNumber:(unint64_t)a4;
+ (id)_movieNameForGoalType:(int64_t)a3 variantNumber:(unint64_t)a4;
+ (id)celebrationMovieURLForAchievementIdentifer:(id)a3;
+ (id)celebrationMovieURLForGoalType:(int64_t)a3;
+ (unint64_t)_variantCountForGoalType:(int64_t)a3;
@end

@implementation FICelebrationAssetURLProvider

+ (id)celebrationMovieURLForGoalType:(int64_t)a3
{
  v4 = [(id)objc_opt_class() _movieNameForGoalType:a3 variantNumber:1];
  v5 = FIAssetsBundle();
  v6 = [a1 _celebrationMovieSubdirectory];
  v7 = [v5 URLForResource:v4 withExtension:@"mov" subdirectory:v6];

  return v7;
}

+ (id)celebrationMovieURLForAchievementIdentifer:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _movieNameForAchievementIdentifier:v4 variantNumber:1];

  v6 = FIAssetsBundle();
  v7 = [a1 _celebrationMovieSubdirectory];
  v8 = [v6 URLForResource:v5 withExtension:@"mov" subdirectory:v7];

  return v8;
}

+ (unint64_t)_variantCountForGoalType:(int64_t)a3
{
  return 1;
}

+ (id)_movieNameForGoalType:(int64_t)a3 variantNumber:(unint64_t)a4
{
  if ((unint64_t)(a3 - 1) > 3) {
    id v4 = 0;
  }
  else {
    id v4 = off_26441CA98[a3 - 1];
  }
  return (id)[NSString stringWithFormat:@"goal_complete_%@_%lu", v4, a4];
}

+ (id)_movieNameForAchievementIdentifier:(id)a3 variantNumber:(unint64_t)a4
{
  id v5 = a3;
  v6 = @"MonthlyChallenge";
  if (([v5 containsString:@"MonthlyChallenge"] & 1) == 0)
  {
    v6 = @"FirstWorkout";
    if (([v5 containsString:@"FirstWorkout"] & 1) == 0)
    {
      v6 = @"BestWorkout";
      if (([v5 containsString:@"BestWorkout"] & 1) == 0)
      {
        v6 = @"MoveGoals";
        if (([v5 containsString:@"MoveGoals"] & 1) == 0) {
          v6 = (__CFString *)v5;
        }
      }
    }
  }

  v7 = [NSString stringWithFormat:@"achievement_earned_%@_%lu", v6, a4];

  return v7;
}

+ (id)_celebrationMovieSubdirectory
{
  return @"PhoneGoalCompletionMovies";
}

@end