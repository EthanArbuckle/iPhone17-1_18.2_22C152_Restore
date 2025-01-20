@interface HKWorkout(HKMetadataDetail)
- (id)hk_additionalMetadataSectionsWithHealthStore:()HKMetadataDetail displayTypeController:unitController:subsampleDelegate:;
@end

@implementation HKWorkout(HKMetadataDetail)

- (id)hk_additionalMetadataSectionsWithHealthStore:()HKMetadataDetail displayTypeController:unitController:subsampleDelegate:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[HKDataMetadataWorkoutEventSection alloc] initWithSample:a1];
  v12 = [[HKDataMetadataWorkoutActivitySection alloc] initWithSample:a1 displayTypeController:v9 unitController:v8 healthStore:v10];

  if ((unint64_t)v11 | (unint64_t)v12)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v13 = v14;
    if (v12) {
      [v14 addObject:v12];
    }
    if (v11) {
      [v13 addObject:v11];
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

@end