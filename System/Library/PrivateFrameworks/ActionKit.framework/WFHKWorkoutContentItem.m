@interface WFHKWorkoutContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)itemWithWorkout:(id)a3;
+ (id)itemWithWorkout:(id)a3 distanceUnit:(id)a4 caloriesUnit:(id)a5;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (id)readableActivityType;
- (id)sourceName;
- (id)workout;
- (id)workoutContainer;
- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5;
@end

@implementation WFHKWorkoutContentItem

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v41 = a3;
  v7 = objc_opt_new();
  if ((Class)objc_opt_class() == a5)
  {
    v10 = [(WFHKWorkoutContentItem *)self workout];
    v8 = [v10 startDate];

    v11 = [(WFHKWorkoutContentItem *)self workout];
    v12 = [v11 endDate];

    if ([v8 isEqualToDate:v12])
    {
      v13 = (void *)MEMORY[0x263F33908];
      v14 = @"Workout Date";
      v15 = v8;
    }
    else
    {
      if (v8)
      {
        v38 = [MEMORY[0x263F33908] object:v8 named:@"Sample Start Date"];
        [v7 addObject:v38];
      }
      if (!v12) {
        goto LABEL_17;
      }
      v13 = (void *)MEMORY[0x263F33908];
      v14 = @"Sample End Date";
      v15 = v12;
    }
    v39 = [v13 object:v15 named:v14];
    [v7 addObject:v39];

LABEL_17:
    v40 = (void *)[v7 copy];
    (*((void (**)(id, void *, void))v41 + 2))(v41, v40, 0);

    goto LABEL_18;
  }
  if ((Class)objc_opt_class() == a5)
  {
    v16 = (void *)MEMORY[0x263F33908];
    v17 = NSNumber;
    v18 = [(WFHKWorkoutContentItem *)self workoutContainer];
    v19 = [v18 workout];
    [v19 duration];
    v20 = objc_msgSend(v17, "numberWithDouble:");
    v21 = [v16 object:v20 named:@"Duration"];
    [v7 addObject:v21];

    v22 = [(WFHKWorkoutContentItem *)self workoutContainer];
    v23 = [v22 workout];
    v24 = [v23 totalEnergyBurned];

    if (v24)
    {
      v25 = (void *)MEMORY[0x263F33908];
      v26 = NSNumber;
      v27 = [(WFHKWorkoutContentItem *)self workoutContainer];
      [v27 caloriesValue];
      v28 = objc_msgSend(v26, "numberWithDouble:");
      v29 = [v25 object:v28 named:@"Calories Value"];
      [v7 addObject:v29];
    }
    v30 = [(WFHKWorkoutContentItem *)self workoutContainer];
    v31 = [v30 workout];
    v32 = [v31 totalDistance];

    if (v32)
    {
      v33 = (void *)MEMORY[0x263F33908];
      v34 = NSNumber;
      v35 = [(WFHKWorkoutContentItem *)self workoutContainer];
      [v35 distanceValue];
      v36 = objc_msgSend(v34, "numberWithDouble:");
      v37 = [v33 object:v36 named:@"Distance Value"];
      [v7 addObject:v37];
    }
    v8 = (void *)[v7 copy];
    v9 = (void (*)(void))*((void *)v41 + 2);
  }
  else
  {
    v8 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
    v9 = (void (*)(void))*((void *)v41 + 2);
  }
  v9();
LABEL_18:
}

- (id)sourceName
{
  v2 = [(WFHKWorkoutContentItem *)self workout];
  v3 = [v2 sourceRevision];
  v4 = [v3 source];

  v5 = [v4 name];
  v6 = [v5 stringByReplacingOccurrencesOfString:@" " withString:@" "];

  return v6;
}

- (id)workoutContainer
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFHKWorkoutContentItem *)self objectForClass:v3];
}

- (id)workout
{
  v2 = [(WFHKWorkoutContentItem *)self workoutContainer];
  uint64_t v3 = [v2 workout];

  return v3;
}

- (id)readableActivityType
{
  v2 = [(WFHKWorkoutContentItem *)self workout];
  uint64_t v3 = +[WFHealthKitHelper readableWorkoutActivityTypeFromWorkoutActivityType:](WFHealthKitHelper, "readableWorkoutActivityTypeFromWorkoutActivityType:", [v2 workoutActivityType]);

  return v3;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  uint64_t v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  uint64_t v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Workout samples");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Workout samples", @"Workout samples");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Workout sample", @"Workout sample");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)propertyBuilders
{
  v32[8] = *MEMORY[0x263EF8340];
  v30 = +[WFHealthKitHelper readableWorkoutActivityTypes];
  v2 = (void *)MEMORY[0x263F33808];
  v31 = WFLocalizedContentPropertyNameMarker(@"Activity Type");
  v29 = [v2 keyPath:@"readableActivityType" name:v31 class:objc_opt_class()];
  v28 = [v29 primary:1];
  v27 = [v28 possibleValues:v30];
  v32[0] = v27;
  id v3 = (void *)MEMORY[0x263F33808];
  v26 = WFLocalizedContentPropertyNameMarker(@"Calories");
  v25 = [v3 keyPath:@"workoutContainer.caloriesValue" name:v26 class:objc_opt_class()];
  v32[1] = v25;
  v4 = (void *)MEMORY[0x263F33808];
  v24 = WFLocalizedContentPropertyNameMarker(@"Distance");
  v23 = [v4 keyPath:@"workoutContainer.distanceValue" name:v24 class:objc_opt_class()];
  v32[2] = v23;
  v5 = (void *)MEMORY[0x263F33808];
  v22 = WFLocalizedContentPropertyNameMarker(@"Calories Unit");
  v21 = [v5 keyPath:@"workoutContainer.caloriesUnit.unitString" name:v22 class:objc_opt_class()];
  v32[3] = v21;
  v6 = (void *)MEMORY[0x263F33808];
  v7 = WFLocalizedContentPropertyNameMarker(@"Distance Unit");
  v8 = [v6 keyPath:@"workoutContainer.distanceUnit.unitString" name:v7 class:objc_opt_class()];
  v32[4] = v8;
  v9 = (void *)MEMORY[0x263F33808];
  v10 = WFLocalizedContentPropertyNameMarker(@"Start Date");
  v11 = [v9 keyPath:@"workout.startDate" name:v10 class:objc_opt_class()];
  v32[5] = v11;
  v12 = (void *)MEMORY[0x263F33808];
  v13 = WFLocalizedContentPropertyNameMarker(@"End Date");
  v14 = [v12 keyPath:@"workout.endDate" name:v13 class:objc_opt_class()];
  v32[6] = v14;
  v15 = (void *)MEMORY[0x263F33808];
  v16 = WFLocalizedContentPropertyNameMarker(@"Source");
  v17 = [v15 keyPath:@"sourceName" name:v16 class:objc_opt_class()];
  v18 = [v17 possibleValues:MEMORY[0x263EFFA68]];
  v32[7] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:8];

  return v19;
}

+ (id)itemWithWorkout:(id)a3 distanceUnit:(id)a4 caloriesUnit:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[WFHKWorkoutContainer alloc] initWithWorkout:v9 distanceUnit:v8 caloriesUnit:v7];

  v11 = +[WFContentItem itemWithObject:v10];

  return v11;
}

+ (id)itemWithWorkout:(id)a3
{
  return (id)[a1 itemWithWorkout:a3 distanceUnit:0 caloriesUnit:0];
}

@end