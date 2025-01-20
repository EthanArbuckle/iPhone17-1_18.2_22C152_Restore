@interface NSKeyedUnarchiver(HealthKit)
+ (id)hk_unarchivedObjectOfClass:()HealthKit forKey:data:error:;
+ (id)hk_unarchivedObjectOfClasses:()HealthKit forKey:data:error:;
+ (uint64_t)_hk_performUnarchivingWithData:()HealthKit error:handler:;
@end

@implementation NSKeyedUnarchiver(HealthKit)

+ (id)hk_unarchivedObjectOfClass:()HealthKit forKey:data:error:
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__13;
  v24 = __Block_byref_object_dispose__13;
  id v25 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__NSKeyedUnarchiver_HealthKit__hk_unarchivedObjectOfClass_forKey_data_error___block_invoke;
  v16[3] = &unk_1E58C0818;
  v18 = &v20;
  uint64_t v19 = a3;
  id v12 = v10;
  id v17 = v12;
  if (objc_msgSend(a1, "_hk_performUnarchivingWithData:error:handler:", v11, a6, v16)) {
    v13 = (void *)v21[5];
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  _Block_object_dispose(&v20, 8);

  return v14;
}

+ (id)hk_unarchivedObjectOfClasses:()HealthKit forKey:data:error:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__13;
  v26 = __Block_byref_object_dispose__13;
  id v27 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__NSKeyedUnarchiver_HealthKit__hk_unarchivedObjectOfClasses_forKey_data_error___block_invoke;
  v18[3] = &unk_1E58C0840;
  v21 = &v22;
  id v13 = v10;
  id v19 = v13;
  id v14 = v11;
  id v20 = v14;
  if (objc_msgSend(a1, "_hk_performUnarchivingWithData:error:handler:", v12, a6, v18)) {
    v15 = (void *)v23[5];
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  _Block_object_dispose(&v22, 8);

  return v16;
}

+ (uint64_t)_hk_performUnarchivingWithData:()HealthKit error:handler:
{
  v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v9 = a3;
  id v10 = (void *)[[v8 alloc] initForReadingFromData:v9 error:a4];

  if (!v10)
  {
LABEL_9:
    uint64_t v14 = 0;
    goto LABEL_10;
  }
  v7[2](v7, v10);
  [v10 finishDecoding];
  id v11 = [v10 error];

  if (v11)
  {
    id v12 = [v10 error];
    id v13 = v12;
    if (v12)
    {
      if (a4) {
        *a4 = v12;
      }
      else {
        _HKLogDroppedError(v12);
      }
    }

    goto LABEL_9;
  }
  uint64_t v14 = 1;
LABEL_10:

  return v14;
}

@end