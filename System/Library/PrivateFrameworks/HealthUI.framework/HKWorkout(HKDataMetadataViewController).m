@interface HKWorkout(HKDataMetadataViewController)
- (void)fetchSubSampleTypesWithHealthStore:()HKDataMetadataViewController completion:;
@end

@implementation HKWorkout(HKDataMetadataViewController)

- (void)fetchSubSampleTypesWithHealthStore:()HKDataMetadataViewController completion:
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F2B3C0];
  id v8 = a3;
  v9 = [v7 predicateForObjectsFromWorkout:a1];
  id v10 = objc_alloc(MEMORY[0x1E4F2B968]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__HKWorkout_HKDataMetadataViewController__fetchSubSampleTypesWithHealthStore_completion___block_invoke;
  v13[3] = &unk_1E6D55E20;
  id v14 = v6;
  id v11 = v6;
  v12 = (void *)[v10 initWithPredicate:v9 resultsHandler:v13];
  [v8 executeQuery:v12];
}

@end