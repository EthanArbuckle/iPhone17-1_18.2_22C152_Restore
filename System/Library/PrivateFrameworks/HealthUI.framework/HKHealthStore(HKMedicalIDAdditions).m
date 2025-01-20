@interface HKHealthStore(HKMedicalIDAdditions)
- (id)createMedicalIDData;
@end

@implementation HKHealthStore(HKMedicalIDAdditions)

- (id)createMedicalIDData
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__HKHealthStore_HKMedicalIDAdditions__createMedicalIDData__block_invoke;
  v9[3] = &unk_1E6D53598;
  v11 = &v12;
  v3 = v2;
  v10 = v3;
  [a1 fetchMedicalIDDataCreateIfNecessary:1 withCompletion:v9];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = (void *)v13[5];
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F2B920]);
    v6 = (void *)v13[5];
    v13[5] = (uint64_t)v5;

    v4 = (void *)v13[5];
  }
  id v7 = v4;

  _Block_object_dispose(&v12, 8);
  return v7;
}

@end