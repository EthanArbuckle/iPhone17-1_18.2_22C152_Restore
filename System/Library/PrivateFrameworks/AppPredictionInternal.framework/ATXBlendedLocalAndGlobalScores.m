@interface ATXBlendedLocalAndGlobalScores
+ (id)blendedGlobalAndLocalScoresForGlobalScores:(id)a3 LOITypeLaunches:(id)a4 lastAppLaunches:(id)a5 timeOfDayLaunches:(id)a6 dayOfWeekLaunches:(id)a7 forApps:(id)a8;
@end

@implementation ATXBlendedLocalAndGlobalScores

+ (id)blendedGlobalAndLocalScoresForGlobalScores:(id)a3 LOITypeLaunches:(id)a4 lastAppLaunches:(id)a5 timeOfDayLaunches:(id)a6 dayOfWeekLaunches:(id)a7 forApps:(id)a8
{
  v29[8] = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = +[ATXDirichletDistribution sharedInstance];
  v28[0] = @"LOIType";
  v27 = [v17 getBlendedLocalAndGlobalScoresWithLocalCounts:v15 andGlobalScores:v16 withSamplingEnabled:0];
  v29[0] = v27;
  v28[1] = @"LastApp";
  v18 = [v17 getBlendedLocalAndGlobalScoresWithLocalCounts:v14 andGlobalScores:v16 withSamplingEnabled:0];
  v29[1] = v18;
  v28[2] = @"TimeOfDay";
  v19 = [v17 getBlendedLocalAndGlobalScoresWithLocalCounts:v13 andGlobalScores:v16 withSamplingEnabled:0];
  v29[2] = v19;
  v28[3] = @"DayOfWeek";
  v20 = [v17 getBlendedLocalAndGlobalScoresWithLocalCounts:v12 andGlobalScores:v16 withSamplingEnabled:0];
  v29[3] = v20;
  v28[4] = @"LOIType_sampled";
  v21 = [v17 getBlendedLocalAndGlobalScoresWithLocalCounts:v15 andGlobalScores:v16 withSamplingEnabled:1];

  v29[4] = v21;
  v28[5] = @"LastApp_sampled";
  v22 = [v17 getBlendedLocalAndGlobalScoresWithLocalCounts:v14 andGlobalScores:v16 withSamplingEnabled:1];

  v29[5] = v22;
  v28[6] = @"TimeOfDay_sampled";
  v23 = [v17 getBlendedLocalAndGlobalScoresWithLocalCounts:v13 andGlobalScores:v16 withSamplingEnabled:1];

  v29[6] = v23;
  v28[7] = @"DayOfWeek_sampled";
  v24 = [v17 getBlendedLocalAndGlobalScoresWithLocalCounts:v12 andGlobalScores:v16 withSamplingEnabled:1];

  v29[7] = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:8];

  return v25;
}

@end