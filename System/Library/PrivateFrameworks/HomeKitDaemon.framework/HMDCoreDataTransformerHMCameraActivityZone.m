@interface HMDCoreDataTransformerHMCameraActivityZone
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDCoreDataTransformerHMCameraActivityZone

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  v8 = v7;
  if (v7)
  {
    if ((unint64_t)[v7 count] > 5)
    {
      if (([v8 count] & 1) == 0)
      {
        v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", (unint64_t)objc_msgSend(v8, "count") >> 1);
        if ([v8 count])
        {
          unint64_t v11 = 0;
          do
          {
            v12 = [v8 objectAtIndexedSubscript:v11];
            [v12 floatValue];
            double v14 = v13;
            v15 = [v8 objectAtIndexedSubscript:v11 + 1];
            [v15 floatValue];
            double v17 = v16;

            v18 = objc_msgSend(objc_alloc(MEMORY[0x263F0E660]), "initWithPoint:", v14, v17);
            [v10 addObject:v18];

            v11 += 2;
          }
          while (v11 < [v8 count]);
        }
        v19 = (void *)[objc_alloc(MEMORY[0x263F0E178]) initWithPoints:v10];
        goto LABEL_18;
      }
      if (a4)
      {
        v9 = (void *)MEMORY[0x263F087E8];
        [NSString stringWithFormat:@"Expected NSArray of even length to create HMCameraActivityZone: %@", v5];
        goto LABEL_17;
      }
    }
    else if (a4)
    {
      v9 = (void *)MEMORY[0x263F087E8];
      [NSString stringWithFormat:@"Expected NSArray of at least 6 elements to create HMCameraActivityZone: %@", v5];
      v10 = LABEL_17:;
      [v9 hmfErrorWithCode:3 reason:v10];
      v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

      goto LABEL_20;
    }
  }
  else if (a4)
  {
    v9 = (void *)MEMORY[0x263F087E8];
    [NSString stringWithFormat:@"Expected NSArray value to create HMCameraActivityZone: %@", v5];
    goto LABEL_17;
  }
  v19 = 0;
LABEL_20:

  return v19;
}

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 points];
  v8 = objc_msgSend(v6, "initWithCapacity:", 2 * objc_msgSend(v7, "count"));

  v9 = [v5 points];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__HMDCoreDataTransformerHMCameraActivityZone_OPACKFromValue_error___block_invoke;
  v13[3] = &unk_264A1AA70;
  id v14 = v8;
  id v10 = v8;
  objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);

  unint64_t v11 = (void *)[v10 copy];
  return v11;
}

void __67__HMDCoreDataTransformerHMCameraActivityZone_OPACKFromValue_error___block_invoke(uint64_t a1, void *a2)
{
  [a2 point];
  double v4 = v3;
  id v5 = *(void **)(a1 + 32);
  *(float *)&double v6 = v6;
  id v7 = [NSNumber numberWithFloat:v6];
  [v5 addObject:v7];

  v8 = *(void **)(a1 + 32);
  *(float *)&double v9 = v4;
  id v10 = [NSNumber numberWithFloat:v9];
  [v8 addObject:v10];
}

@end