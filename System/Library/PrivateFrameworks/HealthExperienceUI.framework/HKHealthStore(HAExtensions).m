@interface HKHealthStore(HAExtensions)
- (void)averageQuantityForType:()HAExtensions unit:predicate:completion:;
- (void)calculateBMIWithCompletion:()HAExtensions;
- (void)mostRecentCategorySampleOfType:()HAExtensions predicate:completion:;
- (void)mostRecentQuantitySampleOfType:()HAExtensions predicate:completion:;
- (void)mostRecentSampleOfType:()HAExtensions predicate:completion:;
@end

@implementation HKHealthStore(HAExtensions)

- (void)mostRecentSampleOfType:()HAExtensions predicate:completion:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() queryForMostRecentSampleOfType:v10 predicate:v9 completion:v8];

  [a1 executeQuery:v11];
}

- (void)mostRecentQuantitySampleOfType:()HAExtensions predicate:completion:
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__HKHealthStore_HAExtensions__mostRecentQuantitySampleOfType_predicate_completion___block_invoke;
  v10[3] = &unk_1E5E7CD68;
  id v11 = v8;
  id v9 = v8;
  [a1 mostRecentSampleOfType:a3 predicate:a4 completion:v10];
}

- (void)mostRecentCategorySampleOfType:()HAExtensions predicate:completion:
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__HKHealthStore_HAExtensions__mostRecentCategorySampleOfType_predicate_completion___block_invoke;
  v10[3] = &unk_1E5E7CD68;
  id v11 = v8;
  id v9 = v8;
  [a1 mostRecentSampleOfType:a3 predicate:a4 completion:v10];
}

- (void)averageQuantityForType:()HAExtensions unit:predicate:completion:
{
  id v10 = a4;
  id v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E4F2B5D0];
  id v13 = a5;
  id v14 = a3;
  id v15 = [v12 alloc];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __80__HKHealthStore_HAExtensions__averageQuantityForType_unit_predicate_completion___block_invoke;
  v22 = &unk_1E5E7CD90;
  id v23 = v10;
  id v24 = v11;
  id v16 = v10;
  id v17 = v11;
  v18 = (void *)[v15 initWithQuantityType:v14 quantitySamplePredicate:v13 options:2 completionHandler:&v19];

  objc_msgSend(a1, "executeQuery:", v18, v19, v20, v21, v22);
}

- (void)calculateBMIWithCompletion:()HAExtensions
{
  id v4 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke;
  aBlock[3] = &unk_1E5E7CDB8;
  uint64_t v19 = v22;
  uint64_t v20 = v24;
  v21 = v23;
  id v5 = v4;
  id v18 = v5;
  v6 = _Block_copy(aBlock);
  v7 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A838]];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_2;
  v14[3] = &unk_1E5E7CE08;
  id v16 = v24;
  id v8 = v6;
  id v15 = v8;
  [a1 mostRecentQuantitySampleOfType:v7 predicate:0 completion:v14];

  id v9 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A630]];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_4;
  v11[3] = &unk_1E5E7CE08;
  id v13 = v23;
  id v10 = v8;
  id v12 = v10;
  [a1 mostRecentQuantitySampleOfType:v9 predicate:0 completion:v11];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
}

@end