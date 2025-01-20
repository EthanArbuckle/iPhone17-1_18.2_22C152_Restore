@interface FIUICelebrationAssetLoader
+ (id)_movieNameForAchievementIdentifier:(id)a3 variantNumber:(unint64_t)a4;
+ (id)_movieNameForGoalType:(int64_t)a3 variantNumber:(unint64_t)a4;
+ (id)celebrationMovieURLForAchievementIdentifer:(id)a3;
+ (id)celebrationMovieURLForGoalType:(int64_t)a3;
+ (unint64_t)_variantCountForGoalType:(int64_t)a3;
@end

@implementation FIUICelebrationAssetLoader

+ (id)celebrationMovieURLForGoalType:(int64_t)a3
{
  v3 = [(id)objc_opt_class() _movieNameForGoalType:a3 variantNumber:1];
  v4 = FIUIAssetsBundle();
  v5 = [v4 URLForResource:v3 withExtension:@"mov" subdirectory:@"GoalCompletionMovies"];

  return v5;
}

+ (id)celebrationMovieURLForAchievementIdentifer:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _movieNameForAchievementIdentifier:v3 variantNumber:1];

  v5 = FIUIAssetsBundle();
  v6 = [v5 URLForResource:v4 withExtension:@"mov" subdirectory:@"GoalCompletionMovies"];

  return v6;
}

+ (unint64_t)_variantCountForGoalType:(int64_t)a3
{
  return 1;
}

+ (id)_movieNameForGoalType:(int64_t)a3 variantNumber:(unint64_t)a4
{
  if ((unint64_t)(a3 - 1) > 3) {
    v4 = 0;
  }
  else {
    v4 = off_2644A8120[a3 - 1];
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

@end