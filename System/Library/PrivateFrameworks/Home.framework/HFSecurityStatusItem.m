@interface HFSecurityStatusItem
+ (BOOL)_currentState:(int64_t)a3 matchesTargetState:(int64_t)a4;
+ (NSSet)serviceTypes;
+ (id)_shortDescriptionForSecuritySystemState:(int64_t)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3;
@end

@implementation HFSecurityStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (id)*MEMORY[0x263F0D7D8];
  v6 = [(id)objc_opt_class() characteristicTypesForServiceType:v5 includingAssociatedTypes:1];
  v17[0] = v5;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  v8 = [v6 allObjects];
  v9 = [(HFStatusItem *)self filteredServicesOfTypes:v7 containingCharacteristicTypes:v8];

  objc_initWeak(&location, self);
  v10 = [(HFStatusItem *)self valueSource];
  v11 = [v10 readValuesForCharacteristicTypes:v6 inServices:v9];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__HFSecurityStatusItem__subclass_updateWithOptions___block_invoke;
  v14[3] = &unk_2640919E0;
  objc_copyWeak(&v15, &location);
  v12 = [v11 flatMap:v14];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
  return v12;
}

id __52__HFSecurityStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v62[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    v9 = (void *)MEMORY[0x263F58190];
    v61 = @"hidden";
    v62[0] = MEMORY[0x263EFFA88];
    v7 = [NSDictionary dictionaryWithObjects:v62 forKeys:&v61 count:1];
    goto LABEL_5;
  }
  id v5 = [(id)objc_opt_class() serviceTypes];
  v6 = [WeakRetained standardResultsForBatchReadResponse:v3 serviceTypes:v5];
  v7 = (void *)[v6 mutableCopy];

  v8 = [v7 objectForKeyedSubscript:@"hidden"];
  LODWORD(v6) = [v8 BOOLValue];

  if (v6)
  {
    v9 = (void *)MEMORY[0x263F58190];
LABEL_5:
    v10 = +[HFItemUpdateOutcome outcomeWithResults:v7];
    v11 = [v9 futureWithResult:v10];

    goto LABEL_29;
  }
  v12 = v3;
  v13 = [MEMORY[0x263EFF9C0] set];
  v14 = [MEMORY[0x263EFF9C0] set];
  id v15 = [MEMORY[0x263EFF9C0] set];
  v16 = [MEMORY[0x263EFF9C0] set];
  v17 = [MEMORY[0x263EFF9C0] set];
  v18 = [MEMORY[0x263EFF9C0] set];
  v19 = objc_msgSend(v7, "objectForKeyedSubscript:");
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __52__HFSecurityStatusItem__subclass_updateWithOptions___block_invoke_2;
  v52[3] = &unk_264093230;
  v51 = v12;
  id v20 = v12;
  id v53 = v20;
  id v54 = WeakRetained;
  id v21 = v14;
  id v55 = v21;
  id v22 = v16;
  id v56 = v22;
  id v50 = v18;
  id v57 = v50;
  id v23 = v17;
  id v58 = v23;
  id v24 = v15;
  id v59 = v24;
  id v25 = v13;
  id v60 = v25;
  objc_msgSend(v19, "na_each:", v52);

  v49 = v23;
  if ([v21 count])
  {
    id v48 = v24;
    id v26 = v22;
    [v7 setObject:&unk_26C0F66F0 forKeyedSubscript:@"badge"];
    [v7 setObject:&unk_26C0F6708 forKeyedSubscript:@"statusItemCategory"];
    v27 = _HFLocalizedStringWithDefaultValue(@"HFStatusTitleSecuritySystem", @"HFStatusTitleSecuritySystem", 1);
    [v7 setObject:v27 forKeyedSubscript:@"title"];

    [v7 setObject:v21 forKeyedSubscript:@"statusRepresentedHomeKitObjects"];
    objc_opt_class();
    v28 = [v7 objectForKeyedSubscript:@"icon"];
    if (objc_opt_isKindOfClass()) {
      v29 = v28;
    }
    else {
      v29 = 0;
    }
    id v30 = v29;

    if (v30)
    {
      v31 = [HFCAPackageIconDescriptor alloc];
      v32 = [v30 packageIdentifier];
      v33 = [(HFCAPackageIconDescriptor *)v31 initWithPackageIdentifier:v32 state:HFCAPackageStateActivated];
      [v7 setObject:v33 forKeyedSubscript:@"icon"];
    }
    [v7 setObject:&unk_26C0F6720 forKeyedSubscript:@"state"];
    v34 = _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionSecuritySystem_Triggered", @"HFStatusDescriptionSecuritySystem_Triggered", 1);
    [v7 setObject:v34 forKeyedSubscript:@"description"];

    v35 = [(id)objc_opt_class() _shortDescriptionForSecuritySystemState:4];
    [v7 setObject:v35 forKeyedSubscript:@"shortDescription"];

    id v22 = v26;
    id v24 = v48;
    goto LABEL_28;
  }
  if ([v25 count])
  {
    [v7 setObject:&unk_26C0F6738 forKeyedSubscript:@"statusItemCategory"];
    if ([v22 count])
    {
      v36 = @"HFStatusTitleSecuritySystem_Arming";
    }
    else
    {
      if (![v23 count])
      {
        v37 = 0;
        goto LABEL_20;
      }
      v36 = @"HFStatusTitleSecuritySystem_Disarming";
    }
    v37 = _HFLocalizedStringWithDefaultValue(v36, v36, 1);
LABEL_20:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_26C0F6750, @"state", v22);
    v38 = _HFLocalizedStringWithDefaultValue(@"HFStatusTitleSecuritySystem", @"HFStatusTitleSecuritySystem", 1);
    [v7 setObject:v38 forKeyedSubscript:@"title"];

    if (v37) {
      [v7 setObject:v37 forKeyedSubscript:@"description"];
    }
    v39 = [v20 responseForCharacteristicType:*MEMORY[0x263F0C0E8] aggregationPolicy:0];
    if (v39)
    {
      v40 = v37;
      v41 = [v39 valueWithExpectedClass:objc_opt_class()];
      uint64_t v42 = [v41 integerValue];

      v43 = [(id)objc_opt_class() _shortDescriptionForSecuritySystemState:v42];
      [v7 setObject:v43 forKeyedSubscript:@"shortDescription"];
      [v7 setObject:v43 forKeyedSubscript:@"description"];
      if (v42 <= 2) {
        [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
      }

      v37 = v40;
    }
    else
    {
      [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
    }

    id v22 = v47;
    goto LABEL_28;
  }
  [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
LABEL_28:
  [v7 setObject:v25 forKeyedSubscript:@"representedHomeKitObjects"];
  v44 = (void *)MEMORY[0x263F58190];
  v45 = +[HFItemUpdateOutcome outcomeWithResults:v7];
  v11 = [v44 futureWithResult:v45];

  id v3 = v51;
LABEL_29:

  return v11;
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F1C6C8], "configurationWithPointSize:", a3, 24.0);
  id v4 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"light.beacon.min.fill" configuration:v3];

  return v4;
}

+ (NSSet)serviceTypes
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D7D8]];
}

void __52__HFSecurityStatusItem__subclass_updateWithOptions___block_invoke_2(id *a1, void *a2)
{
  id v16 = a2;
  id v3 = objc_msgSend(a1[4], "batchResponseForService:");
  id v4 = [v3 responseForCharacteristicType:*MEMORY[0x263F0C0E8]];
  id v5 = [v4 valueWithExpectedClass:objc_opt_class()];

  v6 = [v3 responseForCharacteristicType:*MEMORY[0x263F0C548]];
  v7 = [v6 valueWithExpectedClass:objc_opt_class()];

  if (v5) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    uint64_t v9 = [v5 integerValue];
    uint64_t v10 = [v7 integerValue];
    char v11 = [(id)objc_opt_class() _currentState:v9 matchesTargetState:v10];
    if (v9 == 4)
    {
      v12 = a1 + 6;
      id v13 = v16;
LABEL_18:
      [*v12 addObject:v13];
      [a1[11] addObject:v16];
      goto LABEL_19;
    }
    char v14 = v11;
    if (!objc_msgSend(v16, "hf_hasSetVisibleInHomeStatus")
      || (objc_msgSend(v16, "hf_isVisibleInHomeStatus") & 1) != 0
      || ([a1[5] room], id v15 = objc_claimAutoreleasedReturnValue(), v15, v15))
    {
      if (v9 == 3)
      {
        id v13 = v16;
        if (v14)
        {
          v12 = a1 + 8;
          goto LABEL_18;
        }
      }
      else
      {
        id v13 = v16;
        if (v10 == 3)
        {
          v12 = a1 + 9;
          goto LABEL_18;
        }
        if (v14)
        {
          v12 = a1 + 10;
          goto LABEL_18;
        }
      }
      v12 = a1 + 7;
      goto LABEL_18;
    }
  }
LABEL_19:
}

+ (id)_shortDescriptionForSecuritySystemState:(int64_t)a3
{
  if ((unint64_t)a3 <= 4)
  {
    _HFLocalizedStringWithDefaultValue(off_264093250[a3], off_264093250[a3], 1);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (BOOL)_currentState:(int64_t)a3 matchesTargetState:(int64_t)a4
{
  switch(a4)
  {
    case 0:
      BOOL v4 = a3 == 0;
      goto LABEL_7;
    case 1:
      BOOL v4 = a3 == 1;
      goto LABEL_7;
    case 2:
      BOOL v4 = a3 == 2;
      goto LABEL_7;
    case 3:
      BOOL v4 = a3 == 3;
LABEL_7:
      BOOL result = v4;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

@end