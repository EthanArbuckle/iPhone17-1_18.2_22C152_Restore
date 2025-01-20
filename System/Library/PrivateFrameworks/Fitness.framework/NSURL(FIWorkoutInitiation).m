@interface NSURL(FIWorkoutInitiation)
+ (id)_launchURLWithHostname:()FIWorkoutInitiation workoutIdentifier:date:source:;
+ (id)fi_startBackdatedWorkoutURLWithDate:()FIWorkoutInitiation workoutIdentifier:workoutType:isIndoor:swimmingLocationType:showPicker:;
+ (uint64_t)_launchURLWithHostname:()FIWorkoutInitiation workoutIdentifier:;
+ (uint64_t)fi_endWorkoutURLWithIdentifier:()FIWorkoutInitiation;
+ (uint64_t)fi_pauseWorkoutURLWithIdentifier:()FIWorkoutInitiation;
+ (uint64_t)fi_resumeWorkoutURLWithIdentifier:()FIWorkoutInitiation date:source:;
@end

@implementation NSURL(FIWorkoutInitiation)

+ (id)fi_startBackdatedWorkoutURLWithDate:()FIWorkoutInitiation workoutIdentifier:workoutType:isIndoor:swimmingLocationType:showPicker:
{
  v11 = (objc_class *)MEMORY[0x263F08BA0];
  id v47 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(v11);
  [v13 setScheme:@"SessionTrackerApp"];
  [v13 setHost:@"startbackdatedworkout"];
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  v15 = (void *)MEMORY[0x263F08BD0];
  v16 = NSNumber;
  [v12 timeIntervalSinceReferenceDate];
  double v18 = v17;

  v19 = [v16 numberWithDouble:v18];
  v20 = [v19 stringValue];
  v45 = [v15 queryItemWithName:@"overrideActivityBeginTime" value:v20];

  [v14 addObject:v45];
  v21 = (void *)MEMORY[0x263F08BD0];
  v22 = [NSNumber numberWithUnsignedInteger:a5];
  v23 = [v22 stringValue];
  v43 = [v21 queryItemWithName:@"activityType" value:v23];

  [v14 addObject:v43];
  v24 = (void *)MEMORY[0x263F08BD0];
  v25 = [NSNumber numberWithUnsignedInteger:a5];
  v26 = [v25 stringValue];
  v27 = [v24 queryItemWithName:@"auxiliaryActivityType" value:v26];

  [v14 addObject:v27];
  v28 = (void *)MEMORY[0x263F08BD0];
  v29 = [NSNumber numberWithInteger:a7];
  v30 = [v29 stringValue];
  v31 = [v28 queryItemWithName:@"swimmingLocationType" value:v30];

  [v14 addObject:v31];
  v32 = (void *)MEMORY[0x263F08BD0];
  v33 = [NSNumber numberWithBool:a6];
  v34 = [v33 stringValue];
  v35 = [v32 queryItemWithName:@"location" value:v34];

  [v14 addObject:v35];
  v36 = (void *)MEMORY[0x263F08BD0];
  v37 = [NSNumber numberWithBool:a8];
  v38 = [v37 stringValue];
  v39 = [v36 queryItemWithName:@"presentpicker" value:v38];

  [v14 addObject:v39];
  v40 = [MEMORY[0x263F08BD0] queryItemWithName:@"workoutidentifier" value:v47];

  [v14 addObject:v40];
  [v13 setQueryItems:v14];
  v41 = [v13 URL];

  return v41;
}

+ (uint64_t)fi_endWorkoutURLWithIdentifier:()FIWorkoutInitiation
{
  return [a1 _launchURLWithHostname:@"endworkout" workoutIdentifier:a3];
}

+ (uint64_t)fi_pauseWorkoutURLWithIdentifier:()FIWorkoutInitiation
{
  return [a1 _launchURLWithHostname:@"pauseworkout" workoutIdentifier:a3];
}

+ (uint64_t)fi_resumeWorkoutURLWithIdentifier:()FIWorkoutInitiation date:source:
{
  return [a1 _launchURLWithHostname:@"resumeworkout" workoutIdentifier:a3 date:a4 source:a5];
}

+ (id)_launchURLWithHostname:()FIWorkoutInitiation workoutIdentifier:date:source:
{
  id v9 = a5;
  id v10 = a6;
  v11 = (objc_class *)MEMORY[0x263F08BA0];
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v11);
  [v14 setScheme:@"SessionTrackerApp"];
  [v14 setHost:v13];

  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  v16 = [MEMORY[0x263F08BD0] queryItemWithName:@"workoutidentifier" value:v12];

  [v15 addObject:v16];
  if (v9)
  {
    double v17 = NSString;
    [v9 timeIntervalSince1970];
    v19 = objc_msgSend(v17, "stringWithFormat:", @"%f", v18);
    v20 = [MEMORY[0x263F08BD0] queryItemWithName:@"date" value:v19];
    [v15 addObject:v20];
  }
  if (v10)
  {
    v21 = [MEMORY[0x263F08BD0] queryItemWithName:@"source" value:v10];
    [v15 addObject:v21];
  }
  [v14 setQueryItems:v15];
  v22 = [v14 URL];

  return v22;
}

+ (uint64_t)_launchURLWithHostname:()FIWorkoutInitiation workoutIdentifier:
{
  return [a1 _launchURLWithHostname:a3 workoutIdentifier:a4 date:0 source:0];
}

@end