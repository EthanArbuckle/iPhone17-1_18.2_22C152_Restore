@interface HMDCoreDataTransformerHMCameraActivityZoneSet
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDCoreDataTransformerHMCameraActivityZoneSet

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

  if (v7)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__52624;
    v22 = __Block_byref_object_dispose__52625;
    id v23 = 0;
    v8 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v7, "count"));
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __70__HMDCoreDataTransformerHMCameraActivityZoneSet_valueFromOPACK_error___block_invoke;
    v15[3] = &unk_264A1AAC0;
    v17 = &v18;
    id v9 = v8;
    id v16 = v9;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);
    v10 = (void *)v19[5];
    if (v10)
    {
      v11 = 0;
      if (a4) {
        *a4 = v10;
      }
    }
    else
    {
      v11 = (void *)[v9 copy];
    }

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    if (a4)
    {
      v12 = (void *)MEMORY[0x263F087E8];
      v13 = [NSString stringWithFormat:@"Expected NSArray value to create NSSet<HMCameraActivityZone>: %@", v5];
      *a4 = [v12 hmfErrorWithCode:3 reason:v13];
    }
    v11 = 0;
  }

  return v11;
}

void __70__HMDCoreDataTransformerHMCameraActivityZoneSet_valueFromOPACK_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  v8 = +[HMDCoreDataTransformerHMCameraActivityZone valueFromOPACK:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    [*(id *)(a1 + 32) addObject:v8];
  }
  else
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v9 = (void *)MEMORY[0x263F087E8];
      v10 = [NSString stringWithFormat:@"Failed to create HMCameraActivityZone: %@", v6];
      uint64_t v11 = [v9 hmfErrorWithCode:15 reason:v10];
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    *a4 = 1;
  }
}

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__52624;
  v21 = __Block_byref_object_dispose__52625;
  id v22 = 0;
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __70__HMDCoreDataTransformerHMCameraActivityZoneSet_OPACKFromValue_error___block_invoke;
  v14 = &unk_264A1AA98;
  id v16 = &v17;
  id v7 = v6;
  id v15 = v7;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v11);
  v8 = (void *)v18[5];
  if (v8)
  {
    id v9 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    id v9 = objc_msgSend(v7, "copy", v11, v12, v13, v14);
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __70__HMDCoreDataTransformerHMCameraActivityZoneSet_OPACKFromValue_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = +[HMDCoreDataTransformerHMCameraActivityZone OPACKFromValue:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    [*(id *)(a1 + 32) addObject:v7];
  }
  else
  {
    v8 = (void *)MEMORY[0x263F087E8];
    id v9 = [NSString stringWithFormat:@"Failed to opack HMCameraActivityZone: %@", v5];
    uint64_t v10 = [v8 hmfErrorWithCode:15 reason:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a3 = 1;
  }
}

@end