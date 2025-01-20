@interface HMDCoreDataTransformerHAPPairingIdentitySet
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDCoreDataTransformerHAPPairingIdentitySet

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
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__162337;
    v22 = __Block_byref_object_dispose__162338;
    id v23 = 0;
    v8 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v7, "count"));
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__HMDCoreDataTransformerHAPPairingIdentitySet_valueFromOPACK_error___block_invoke;
    v14[3] = &unk_264A22B50;
    v16 = &v18;
    v17 = &v24;
    id v9 = v8;
    id v15 = v9;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);
    if (*((unsigned char *)v25 + 24))
    {
      v10 = 0;
      if (a4) {
        *a4 = (id) v19[5];
      }
    }
    else
    {
      v10 = (void *)[v9 copy];
    }

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x263F087E8];
      v12 = [NSString stringWithFormat:@"Expected NSArray value to create NSSet<HAPPairingIdentity>: %@", v5];
      *a4 = [v11 hmfErrorWithCode:3 reason:v12];
    }
    v10 = 0;
  }

  return v10;
}

void __68__HMDCoreDataTransformerHAPPairingIdentitySet_valueFromOPACK_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = +[HMDCoreDataTransformerHAPPairingIdentity valueFromOPACK:a2 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    [*(id *)(a1 + 32) addObject:v7];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__162337;
  uint64_t v18 = __Block_byref_object_dispose__162338;
  id v19 = 0;
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__HMDCoreDataTransformerHAPPairingIdentitySet_OPACKFromValue_error___block_invoke;
  v10[3] = &unk_264A22B28;
  v12 = &v14;
  v13 = &v20;
  id v7 = v6;
  id v11 = v7;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);
  if (*((unsigned char *)v21 + 24))
  {
    v8 = 0;
    if (a4) {
      *a4 = (id) v15[5];
    }
  }
  else
  {
    v8 = (void *)[v7 copy];
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __68__HMDCoreDataTransformerHAPPairingIdentitySet_OPACKFromValue_error___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = +[HMDCoreDataTransformerHAPPairingIdentity OPACKFromValue:a2 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    [*(id *)(a1 + 32) addObject:v6];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
}

@end