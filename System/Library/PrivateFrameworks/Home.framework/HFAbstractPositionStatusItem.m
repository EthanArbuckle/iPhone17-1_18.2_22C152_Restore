@interface HFAbstractPositionStatusItem
- (id)_characteristicsToReadForCharacteristicTypes:(id)a3 inServices:(id)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3;
- (id)multipleClosedServicesDescriptionString;
- (id)multipleClosingServicesDescriptionString;
- (id)multipleObstructedServicesDescriptionString;
- (id)multipleOpenServicesDescriptionString;
- (id)multipleOpeningServicesDescriptionString;
- (id)multipleServiceTitleFormatString;
- (id)oneClosedServiceDescriptionString;
- (id)oneClosingServiceDescriptionString;
- (id)oneObstructedServiceDescriptionString;
- (id)oneOpenServiceDescriptionString;
- (id)oneOpeningServiceDescriptionString;
- (id)oneServiceTitleString;
@end

@implementation HFAbstractPositionStatusItem

void __60__HFAbstractPositionStatusItem__subclass_updateWithOptions___block_invoke_2(id *a1, void *a2)
{
  id v12 = a2;
  v3 = [a1[4] batchResponseForService:v12 includeChildServices:1];
  v4 = +[HFCharacteristicValueDisplayMetadata displayMetadataForService:v12 characteristicReadResponse:v3];
  v5 = [v3 responseForCharacteristicType:*MEMORY[0x263F0C2B8]];
  v6 = [v5 valueWithExpectedClass:objc_opt_class()];

  if ([v6 BOOLValue]) {
    [a1[5] addObject:v12];
  }
  v7 = [v3 responseForCharacteristicType:*MEMORY[0x263F0C0B0]];
  v8 = [v7 valueWithExpectedClass:objc_opt_class()];

  if (v8)
  {
    if ([v8 integerValue] == 2)
    {
      [a1[5] addObject:v12];
    }
    else if ([v8 integerValue] == 3)
    {
      v9 = a1 + 6;
      goto LABEL_15;
    }
  }
  if ([v4 primaryState] == 2)
  {
    BOOL v10 = [v4 transitioningPrimaryState] == 1;
    v9 = a1 + 8;
    v11 = a1 + 7;
  }
  else
  {
    if ([v4 primaryState] != 1) {
      goto LABEL_16;
    }
    BOOL v10 = [v4 transitioningPrimaryState] == 2;
    v9 = a1 + 10;
    v11 = a1 + 9;
  }
  if (v10) {
    v9 = v11;
  }
LABEL_15:
  [*v9 addObject:v12];
LABEL_16:
}

id __88__HFAbstractPositionStatusItem__characteristicsToReadForCharacteristicTypes_inServices___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x263EFF9C0] set];
  v5 = objc_msgSend(v3, "hf_characteristicOfType:", *(void *)(a1 + 32));
  objc_msgSend(v4, "na_safeAddObject:", v5);

  if (([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F0BEF8]] & 1) == 0)
  {
    v6 = objc_msgSend(v3, "hf_childServices");
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __88__HFAbstractPositionStatusItem__characteristicsToReadForCharacteristicTypes_inServices___block_invoke_3;
    v8[3] = &unk_264098B98;
    id v9 = v4;
    id v10 = *(id *)(a1 + 32);
    objc_msgSend(v6, "na_each:", v8);
  }
  return v4;
}

id __88__HFAbstractPositionStatusItem__characteristicsToReadForCharacteristicTypes_inServices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __88__HFAbstractPositionStatusItem__characteristicsToReadForCharacteristicTypes_inServices___block_invoke_2;
  v8[3] = &unk_264098BC0;
  id v9 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "na_flatMap:", v8);

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  v6 = [(id)objc_opt_class() serviceTypes];
  v7 = [v6 anyObject];
  v8 = [v5 characteristicTypesForServiceType:v7 includingAssociatedTypes:1];

  id v9 = [(id)objc_opt_class() serviceTypes];
  id v10 = [v9 allObjects];
  v11 = [v8 allObjects];
  id v12 = [(HFStatusItem *)self filteredServicesOfTypes:v10 containingCharacteristicTypes:v11];

  v13 = [(HFAbstractPositionStatusItem *)self _characteristicsToReadForCharacteristicTypes:v8 inServices:v12];
  objc_initWeak(&location, self);
  v14 = [(HFStatusItem *)self valueSource];
  v15 = [v14 readValuesForCharacteristics:v13];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__HFAbstractPositionStatusItem__subclass_updateWithOptions___block_invoke;
  v18[3] = &unk_2640919E0;
  objc_copyWeak(&v19, &location);
  v16 = [v15 flatMap:v18];
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
  return v16;
}

- (id)_characteristicsToReadForCharacteristicTypes:(id)a3 inServices:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __88__HFAbstractPositionStatusItem__characteristicsToReadForCharacteristicTypes_inServices___block_invoke;
  v9[3] = &unk_26408CEC0;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a3, "na_flatMap:", v9);

  return v7;
}

id __60__HFAbstractPositionStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v54[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    id v9 = (void *)MEMORY[0x263F58190];
    v53 = @"hidden";
    v54[0] = MEMORY[0x263EFFA88];
    v7 = [NSDictionary dictionaryWithObjects:v54 forKeys:&v53 count:1];
    goto LABEL_5;
  }
  id v5 = [(id)objc_opt_class() serviceTypes];
  id v6 = [WeakRetained standardResultsForBatchReadResponse:v3 serviceTypes:v5];
  v7 = (void *)[v6 mutableCopy];

  v8 = [v7 objectForKeyedSubscript:@"hidden"];
  LODWORD(v6) = [v8 BOOLValue];

  if (v6)
  {
    id v9 = (void *)MEMORY[0x263F58190];
LABEL_5:
    id v10 = +[HFItemUpdateOutcome outcomeWithResults:v7];
    v11 = [v9 futureWithResult:v10];

    goto LABEL_59;
  }
  id v12 = [MEMORY[0x263EFF9C0] set];
  v13 = [MEMORY[0x263EFF9C0] set];
  v14 = [MEMORY[0x263EFF9C0] set];
  v15 = [MEMORY[0x263EFF9C0] set];
  v16 = [MEMORY[0x263EFF9C0] set];
  v17 = [MEMORY[0x263EFF9C0] set];
  v18 = [v7 objectForKeyedSubscript:@"representedHomeKitObjects"];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __60__HFAbstractPositionStatusItem__subclass_updateWithOptions___block_invoke_2;
  v45[3] = &unk_264098B70;
  id v46 = v3;
  id v19 = v12;
  id v47 = v19;
  id v44 = v17;
  id v48 = v44;
  id v20 = v15;
  id v49 = v20;
  id v21 = v13;
  id v50 = v21;
  id v22 = v14;
  id v51 = v22;
  id v23 = v16;
  id v52 = v23;
  v43 = v18;
  objc_msgSend(v18, "na_each:", v45);
  if ([v21 count])
  {
    [v21 unionSet:v22];
    [v21 unionSet:v20];
  }
  if ([v19 count])
  {
    if ([v19 count] == 1) {
      [WeakRetained oneServiceTitleString];
    }
    else {
    v24 = [WeakRetained multipleServiceTitleFormatString];
    }
    if ([v19 count] == 1) {
      [WeakRetained oneObstructedServiceDescriptionString];
    }
    else {
    uint64_t v40 = [WeakRetained multipleObstructedServicesDescriptionString];
    }
    v25 = v19;
  }
  else if ([v21 count])
  {
    if ([v21 count] == 1) {
      [WeakRetained oneServiceTitleString];
    }
    else {
    v24 = [WeakRetained multipleServiceTitleFormatString];
    }
    if ([v21 count] == 1) {
      [WeakRetained oneOpenServiceDescriptionString];
    }
    else {
    uint64_t v40 = [WeakRetained multipleOpenServicesDescriptionString];
    }
    v25 = v21;
  }
  else if ([v22 count])
  {
    if ([v22 count] == 1) {
      [WeakRetained oneServiceTitleString];
    }
    else {
    v24 = [WeakRetained multipleServiceTitleFormatString];
    }
    if ([v22 count] == 1) {
      [WeakRetained oneOpeningServiceDescriptionString];
    }
    else {
    uint64_t v40 = [WeakRetained multipleOpeningServicesDescriptionString];
    }
    v25 = v22;
  }
  else if ([v20 count])
  {
    if ([v20 count] == 1) {
      [WeakRetained oneServiceTitleString];
    }
    else {
    v24 = [WeakRetained multipleServiceTitleFormatString];
    }
    if ([v20 count] == 1) {
      [WeakRetained oneClosingServiceDescriptionString];
    }
    else {
    uint64_t v40 = [WeakRetained multipleClosingServicesDescriptionString];
    }
    v25 = v20;
  }
  else
  {
    if (![v23 count])
    {
      v24 = 0;
      id v26 = 0;
      uint64_t v40 = 0;
      goto LABEL_50;
    }
    if ([v23 count] == 1) {
      [WeakRetained oneServiceTitleString];
    }
    else {
    v24 = [WeakRetained multipleServiceTitleFormatString];
    }
    if ([v23 count] == 1) {
      [WeakRetained oneClosedServiceDescriptionString];
    }
    else {
    uint64_t v40 = [WeakRetained multipleClosedServicesDescriptionString];
    }
    v25 = v23;
  }
  id v26 = v25;
LABEL_50:
  [v7 setObject:v19 forKeyedSubscript:@"obstructedServices"];
  [v7 setObject:v21 forKeyedSubscript:@"openServices"];
  [v7 setObject:v22 forKeyedSubscript:@"openingServices"];
  [v7 setObject:v20 forKeyedSubscript:@"closingServices"];
  [v7 setObject:v23 forKeyedSubscript:@"closedServices"];
  [v7 setObject:v44 forKeyedSubscript:@"unknownServices"];
  v41 = v19;
  v42 = v22;
  id v39 = v3;
  if (v24)
  {
    v27 = v23;
    v28 = v20;
    if ([v26 count] == 1)
    {
      [v7 setObject:v24 forKeyedSubscript:@"title"];
    }
    else
    {
      v35 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v24, @"%lu", 0, objc_msgSend(v26, "count"));
      [v7 setObject:v35 forKeyedSubscript:@"title"];
    }
    v34 = @"description";
    v33 = v7;
    v31 = (void *)v40;
    uint64_t v32 = v40;
    goto LABEL_57;
  }
  v27 = v23;
  v28 = v20;
  v29 = [v7 objectForKeyedSubscript:@"statusItemCategory"];
  uint64_t v30 = [v29 integerValue];

  v31 = (void *)v40;
  if (v30 == 3)
  {
    uint64_t v32 = MEMORY[0x263EFFA88];
    v33 = v7;
    v34 = @"hidden";
LABEL_57:
    [v33 setObject:v32 forKeyedSubscript:v34];
  }
  v36 = (void *)MEMORY[0x263F58190];
  v37 = +[HFItemUpdateOutcome outcomeWithResults:v7];
  v11 = [v36 futureWithResult:v37];

  id v3 = v39;
LABEL_59:

  return v11;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    id v5 = [v4 anyObject];
    id v6 = [(HFStatusItem *)self displayNameForHomeKitObject:v5];
LABEL_6:

    goto LABEL_8;
  }
  if ((unint64_t)[v4 count] >= 2)
  {
    v7 = NSString;
    v8 = [(HFAbstractPositionStatusItem *)self multipleServiceTitleFormatString];
    id v10 = 0;
    id v6 = objc_msgSend(v7, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, @"%lu", &v10, objc_msgSend(v4, "count"));
    id v5 = v10;

    if (!v6) {
      NSLog(&cfstr_CouldnTLocaliz_1.isa, v5);
    }
    goto LABEL_6;
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (id)oneServiceTitleString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractPositionStatusItem.m", 164, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractPositionStatusItem oneServiceTitleString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)multipleServiceTitleFormatString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractPositionStatusItem.m", 170, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractPositionStatusItem multipleServiceTitleFormatString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)oneObstructedServiceDescriptionString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractPositionStatusItem.m", 176, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractPositionStatusItem oneObstructedServiceDescriptionString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)multipleObstructedServicesDescriptionString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractPositionStatusItem.m", 182, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractPositionStatusItem multipleObstructedServicesDescriptionString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)oneOpenServiceDescriptionString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractPositionStatusItem.m", 188, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractPositionStatusItem oneOpenServiceDescriptionString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)multipleOpenServicesDescriptionString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractPositionStatusItem.m", 194, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractPositionStatusItem multipleOpenServicesDescriptionString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)oneOpeningServiceDescriptionString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractPositionStatusItem.m", 200, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractPositionStatusItem oneOpeningServiceDescriptionString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)multipleOpeningServicesDescriptionString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractPositionStatusItem.m", 206, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractPositionStatusItem multipleOpeningServicesDescriptionString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)oneClosingServiceDescriptionString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractPositionStatusItem.m", 212, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractPositionStatusItem oneClosingServiceDescriptionString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)multipleClosingServicesDescriptionString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractPositionStatusItem.m", 218, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractPositionStatusItem multipleClosingServicesDescriptionString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)oneClosedServiceDescriptionString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractPositionStatusItem.m", 224, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractPositionStatusItem oneClosedServiceDescriptionString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)multipleClosedServicesDescriptionString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractPositionStatusItem.m", 230, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractPositionStatusItem multipleClosedServicesDescriptionString]", objc_opt_class() object file lineNumber description];

  return 0;
}

void __88__HFAbstractPositionStatusItem__characteristicsToReadForCharacteristicTypes_inServices___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hf_characteristicOfType:", *(void *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObject:", v3);
}

@end