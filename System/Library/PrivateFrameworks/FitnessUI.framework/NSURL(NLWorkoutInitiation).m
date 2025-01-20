@interface NSURL(NLWorkoutInitiation)
+ (id)_launchURLWithHostname:()NLWorkoutInitiation workoutIdentifier:;
+ (id)fiui_workoutInitiationURLWithWorkout:()NLWorkoutInitiation presentConfiguration:skipCountdown:;
+ (id)fiui_workoutPickerURL;
+ (id)fiui_workoutPickerURLComponents;
+ (uint64_t)fiui_URLDistanceUnit;
+ (uint64_t)fiui_URLEnergyUnit;
+ (uint64_t)fiui_URLTimeUnit;
@end

@implementation NSURL(NLWorkoutInitiation)

+ (uint64_t)fiui_URLTimeUnit
{
  return [MEMORY[0x263F0A830] secondUnit];
}

+ (uint64_t)fiui_URLDistanceUnit
{
  return [MEMORY[0x263F0A830] meterUnit];
}

+ (uint64_t)fiui_URLEnergyUnit
{
  return [MEMORY[0x263F0A830] kilocalorieUnit];
}

+ (id)fiui_workoutInitiationURLWithWorkout:()NLWorkoutInitiation presentConfiguration:skipCountdown:
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v6 setScheme:*MEMORY[0x263F3D200]];
  [v6 setHost:*MEMORY[0x263F3D1E0]];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8 = [v5 metadata];
  uint64_t v9 = *MEMORY[0x263F09AA0];
  v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F09AA0]];
  uint64_t v11 = [v10 BOOLValue];

  v12 = (void *)MEMORY[0x263F08BD0];
  uint64_t v13 = *MEMORY[0x263F3D1E8];
  v14 = [NSNumber numberWithBool:v11];
  v15 = [v14 stringValue];
  uint64_t v16 = [v12 queryItemWithName:v13 value:v15];

  v72 = (void *)v16;
  [v7 addObject:v16];
  v17 = [FIUIWorkoutActivityType alloc];
  uint64_t v18 = [v5 workoutActivityType];
  v19 = [v5 metadata];
  v20 = [v19 objectForKeyedSubscript:v9];
  uint64_t v21 = [v20 BOOLValue];

  v22 = [(FIUIWorkoutActivityType *)v17 initWithActivityTypeIdentifier:v18 isIndoor:v21];
  v23 = (void *)MEMORY[0x263F08BD0];
  uint64_t v24 = *MEMORY[0x263F3D1C0];
  v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FIUIWorkoutActivityType identifier](v22, "identifier"));
  v26 = [v25 stringValue];
  uint64_t v27 = [v23 queryItemWithName:v24 value:v26];

  v70 = (void *)v27;
  [v7 addObject:v27];
  uint64_t v28 = [(FIUIWorkoutActivityType *)v22 auxiliaryTypeIdentifier];
  if (v28 != *MEMORY[0x263F0AC20])
  {
    v29 = (void *)MEMORY[0x263F08BD0];
    uint64_t v30 = *MEMORY[0x263F3D1C8];
    v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FIUIWorkoutActivityType auxiliaryTypeIdentifier](v22, "auxiliaryTypeIdentifier"));
    v32 = [v31 stringValue];
    v33 = [v29 queryItemWithName:v30 value:v32];

    [v7 addObject:v33];
  }
  uint64_t v34 = [v5 _goalType];
  v35 = (void *)MEMORY[0x263F08BD0];
  uint64_t v36 = *MEMORY[0x263F3D1D0];
  v37 = [NSNumber numberWithUnsignedInteger:v34];
  v38 = [v37 stringValue];
  uint64_t v39 = [v35 queryItemWithName:v36 value:v38];

  v69 = (void *)v39;
  [v7 addObject:v39];
  switch(v34)
  {
    case 1:
      v40 = [v5 _goal];
      uint64_t v41 = objc_msgSend(NSURL, "fiui_URLDistanceUnit");
      break;
    case 3:
      v40 = [v5 _goal];
      uint64_t v41 = objc_msgSend(NSURL, "fiui_URLEnergyUnit");
      break;
    case 2:
      v40 = [v5 _goal];
      uint64_t v41 = objc_msgSend(NSURL, "fiui_URLTimeUnit");
      break;
    default:
      goto LABEL_11;
  }
  v42 = (void *)v41;
  [v40 doubleValueForUnit:v41];
  double v44 = v43;

  v45 = (void *)MEMORY[0x263F08BD0];
  uint64_t v46 = *MEMORY[0x263F3D1D8];
  v47 = [NSNumber numberWithDouble:v44];
  v48 = [v47 stringValue];
  v49 = [v45 queryItemWithName:v46 value:v48];

  if (v49)
  {
    [v7 addObject:v49];
  }
LABEL_11:
  v50 = (void *)MEMORY[0x263F08BD0];
  uint64_t v51 = *MEMORY[0x263F3D1B8];
  v52 = NSNumber;
  v53 = [v5 startDate];
  [v53 timeIntervalSinceReferenceDate];
  v54 = objc_msgSend(v52, "numberWithDouble:");
  v55 = [v54 stringValue];
  v56 = [v50 queryItemWithName:v51 value:v55];

  [v7 addObject:v56];
  if (a4)
  {
    v57 = (void *)MEMORY[0x263F08BD0];
    uint64_t v58 = *MEMORY[0x263F3D1F0];
    v59 = [NSNumber numberWithBool:1];
    v60 = [v59 stringValue];
    v61 = [v57 queryItemWithName:v58 value:v60];

    [v7 addObject:v61];
  }
  if (a5)
  {
    v62 = (void *)MEMORY[0x263F08BD0];
    uint64_t v63 = *MEMORY[0x263F3D208];
    v64 = [NSNumber numberWithBool:1];
    v65 = [v64 stringValue];
    v66 = [v62 queryItemWithName:v63 value:v65];

    [v7 addObject:v66];
  }
  [v6 setQueryItems:v7];
  v67 = [v6 URL];

  return v67;
}

+ (id)_launchURLWithHostname:()NLWorkoutInitiation workoutIdentifier:
{
  id v5 = (objc_class *)MEMORY[0x263F08BA0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setScheme:*MEMORY[0x263F3D200]];
  [v8 setHost:v7];

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  v10 = [MEMORY[0x263F08BD0] queryItemWithName:*MEMORY[0x263F3D218] value:v6];

  [v9 addObject:v10];
  [v8 setQueryItems:v9];
  uint64_t v11 = [v8 URL];

  return v11;
}

+ (id)fiui_workoutPickerURLComponents
{
  id v0 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v0 setScheme:*MEMORY[0x263F3D200]];
  [v0 setHost:*MEMORY[0x263F3D1F8]];
  return v0;
}

+ (id)fiui_workoutPickerURL
{
  id v0 = objc_msgSend((id)objc_opt_class(), "fiui_workoutPickerURLComponents");
  v1 = [v0 URL];

  return v1;
}

@end