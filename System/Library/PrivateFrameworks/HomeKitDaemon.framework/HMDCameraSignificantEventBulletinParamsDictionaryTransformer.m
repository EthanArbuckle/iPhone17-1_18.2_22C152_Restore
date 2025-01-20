@interface HMDCameraSignificantEventBulletinParamsDictionaryTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDCameraSignificantEventBulletinParamsDictionaryTransformer

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "hmf_UUIDForKey:", @"HMDCSEBP.ck.UUID");
    if (v7)
    {
      v8 = [v6 valueForKey:@"HMDCSEBP.ck.reason"];
      v9 = v8;
      if (v8)
      {
        uint64_t v10 = [v8 unsignedIntegerValue];
        v11 = [v6 valueForKey:@"HMDCSEBP.ck.date"];
        if (v11)
        {
          v12 = [v6 valueForKey:@"HMDCSEBP.ck.confidenceLevel"];
          v13 = v12;
          if (v12)
          {
            uint64_t v14 = [v12 unsignedIntegerValue];
            v15 = objc_msgSend(v6, "hmf_UUIDForKey:", @"HMDCSEBP.ck.cameraProfileUUID");
            if (v15)
            {
              uint64_t v16 = [v6 valueForKey:@"HMDCSEBP.ck.faceClassifications"];
              v33 = (void *)v16;
              if (v16)
              {
                v17 = (void *)v16;
                uint64_t v28 = v14;
                v29 = v15;
                uint64_t v30 = v10;
                v31 = v13;
                v32 = v9;
                id v18 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                long long v34 = 0u;
                long long v35 = 0u;
                long long v36 = 0u;
                long long v37 = 0u;
                id v19 = v17;
                uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
                if (v20)
                {
                  uint64_t v21 = v20;
                  uint64_t v22 = *(void *)v35;
                  do
                  {
                    for (uint64_t i = 0; i != v21; ++i)
                    {
                      if (*(void *)v35 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      v24 = +[HMDCameraSignificantEventFaceClassificationDictionaryTransformer reverseTransformedValue:*(void *)(*((void *)&v34 + 1) + 8 * i) error:a4];
                      [v18 addObject:v24];
                    }
                    uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
                  }
                  while (v21);
                }

                v9 = v32;
                uint64_t v10 = v30;
                v13 = v31;
                uint64_t v25 = v28;
                v15 = v29;
              }
              else
              {
                uint64_t v25 = v14;
                id v18 = 0;
              }
              v26 = [[HMDCameraSignificantEventBulletinParams alloc] initWithUUID:v7 reason:v10 dateOfOccurrence:v11 confidenceLevel:v25 faceClassifications:v18 cameraProfileUUID:v15];
            }
            else
            {
              v26 = 0;
            }
          }
          else
          {
            v26 = 0;
          }
        }
        else
        {
          v26 = 0;
        }
      }
      else
      {
        v26 = 0;
      }
    }
    else
    {
      v26 = 0;
    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    v6 = [MEMORY[0x263EFF9A0] dictionary];
    v7 = [v5 UUID];
    v8 = [v7 UUIDString];
    [v6 setValue:v8 forKey:@"HMDCSEBP.ck.UUID"];

    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "reason"));
    [v6 setValue:v9 forKey:@"HMDCSEBP.ck.reason"];

    uint64_t v10 = [v5 dateOfOccurrence];
    [v6 setValue:v10 forKey:@"HMDCSEBP.ck.date"];

    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "confidenceLevel"));
    [v6 setValue:v11 forKey:@"HMDCSEBP.ck.confidenceLevel"];

    v12 = [v5 cameraProfileUUID];
    v13 = [v12 UUIDString];
    [v6 setValue:v13 forKey:@"HMDCSEBP.ck.cameraProfileUUID"];

    uint64_t v14 = [MEMORY[0x263EFF980] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v15 = objc_msgSend(v5, "faceClassifications", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = +[HMDCameraSignificantEventFaceClassificationDictionaryTransformer transformedValue:*(void *)(*((void *)&v24 + 1) + 8 * i) error:a4];
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }

    uint64_t v21 = (void *)[v14 copy];
    [v6 setValue:v21 forKey:@"HMDCSEBP.ck.faceClassifications"];

    uint64_t v22 = (void *)[v6 copy];
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end