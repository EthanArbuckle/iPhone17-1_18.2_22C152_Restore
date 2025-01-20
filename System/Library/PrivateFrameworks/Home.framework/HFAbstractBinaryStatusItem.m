@interface HFAbstractBinaryStatusItem
- (id)_shortTitleForTitle:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3;
- (id)multipleAbnormalServicesDescriptionString;
- (id)multipleAbnormalServicesFormatString;
- (id)multipleNormalServicesDescriptionString;
- (id)multipleNormalServicesFormatString;
- (id)multipleUnknownServicesFormatString;
- (id)oneAbnormalServiceDescriptionString;
- (id)oneAbnormalServiceFormatString;
- (id)oneNormalServiceDescriptionString;
- (id)oneNormalServiceFormatString;
- (id)oneUnknownServiceFormatString;
@end

@implementation HFAbstractBinaryStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() serviceTypes];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__HFAbstractBinaryStatusItem__subclass_updateWithOptions___block_invoke;
  v19[3] = &unk_26408CEC0;
  v19[4] = self;
  v6 = objc_msgSend(v5, "na_flatMap:", v19);
  v7 = [v5 allObjects];
  v8 = [v6 allObjects];
  v9 = [(HFStatusItem *)self filteredServicesOfTypes:v7 containingCharacteristicTypes:v8];

  objc_initWeak(&location, self);
  v10 = [(HFStatusItem *)self valueSource];
  v11 = [v10 readValuesForCharacteristicTypes:v6 inServices:v9];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__HFAbstractBinaryStatusItem__subclass_updateWithOptions___block_invoke_2;
  v15[3] = &unk_264090328;
  objc_copyWeak(&v17, &location);
  id v12 = v5;
  id v16 = v12;
  v13 = [v11 flatMap:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

id __58__HFAbstractBinaryStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(id)objc_opt_class() characteristicTypesForServiceType:v2 includingAssociatedTypes:1];

  return v3;
}

id __58__HFAbstractBinaryStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v29[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained)
  {
    v13 = (void *)MEMORY[0x263F58190];
    v28 = @"hidden";
    v29[0] = MEMORY[0x263EFFA88];
    v14 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v15 = +[HFItemUpdateOutcome outcomeWithResults:v14];
    id v12 = [v13 futureWithResult:v15];

    goto LABEL_20;
  }
  v6 = [WeakRetained standardResultsForBatchReadResponse:v3 serviceTypes:*(void *)(a1 + 32)];
  v7 = (void *)[v6 mutableCopy];

  v8 = [v7 objectForKeyedSubscript:@"hidden"];
  int v9 = [v8 BOOLValue];

  if (!v9)
  {
    v11 = [v7 objectForKeyedSubscript:@"representedHomeKitObjects"];
    id v16 = [v7 objectForKeyedSubscript:@"state"];
    uint64_t v17 = [v16 integerValue];

    if (v17 == 1)
    {
      if ([v11 count] == 1)
      {
        v18 = [v5 oneNormalServiceFormatString];
        [v5 oneNormalServiceDescriptionString];
      }
      else
      {
        v23 = NSString;
        v24 = [v5 multipleNormalServicesFormatString];
        v18 = objc_msgSend(v23, "stringWithValidatedFormat:validFormatSpecifiers:error:", v24, @"%lu", 0, objc_msgSend(v11, "count"));

        [v5 multipleNormalServicesDescriptionString];
      }
    }
    else
    {
      if (v17 != 2)
      {
        v20 = 0;
        goto LABEL_17;
      }
      if ([v11 count] == 1)
      {
        v18 = [v5 oneAbnormalServiceFormatString];
        [v5 oneAbnormalServiceDescriptionString];
      }
      else
      {
        v21 = NSString;
        v22 = [v5 multipleAbnormalServicesFormatString];
        v18 = objc_msgSend(v21, "stringWithValidatedFormat:validFormatSpecifiers:error:", v22, @"%lu", 0, objc_msgSend(v11, "count"));

        [v5 multipleAbnormalServicesDescriptionString];
      }
    uint64_t v19 = };
    v20 = (void *)v19;
    if (v18)
    {
      [v7 setObject:v18 forKeyedSubscript:@"title"];
      [v7 setObject:v20 forKeyedSubscript:@"description"];

LABEL_18:
      v25 = (void *)MEMORY[0x263F58190];
      v26 = +[HFItemUpdateOutcome outcomeWithResults:v7];
      id v12 = [v25 futureWithResult:v26];

      goto LABEL_19;
    }
LABEL_17:
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
    goto LABEL_18;
  }
  v10 = (void *)MEMORY[0x263F58190];
  v11 = +[HFItemUpdateOutcome outcomeWithResults:v7];
  id v12 = [v10 futureWithResult:v11];
LABEL_19:

LABEL_20:
  return v12;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    v5 = [(HFAbstractBinaryStatusItem *)self oneUnknownServiceFormatString];
  }
  else if ((unint64_t)[v4 count] >= 2 {
         && ([(HFAbstractBinaryStatusItem *)self multipleUnknownServicesFormatString], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  }
  {
    v7 = (void *)v6;
    id v11 = 0;
    v5 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, @"%lu", &v11, objc_msgSend(v4, "count"));
    id v8 = v11;
    int v9 = v8;
    if (!v5) {
      NSLog(&cfstr_CouldnTLocaliz_1.isa, v8);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)oneUnknownServiceFormatString
{
  return 0;
}

- (id)multipleUnknownServicesFormatString
{
  return 0;
}

- (id)oneAbnormalServiceFormatString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractBinaryStatusItem.m", 95, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractBinaryStatusItem oneAbnormalServiceFormatString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)oneNormalServiceFormatString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractBinaryStatusItem.m", 101, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractBinaryStatusItem oneNormalServiceFormatString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)multipleAbnormalServicesFormatString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractBinaryStatusItem.m", 107, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractBinaryStatusItem multipleAbnormalServicesFormatString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)multipleNormalServicesFormatString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractBinaryStatusItem.m", 113, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractBinaryStatusItem multipleNormalServicesFormatString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)oneAbnormalServiceDescriptionString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractBinaryStatusItem.m", 120, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractBinaryStatusItem oneAbnormalServiceDescriptionString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)oneNormalServiceDescriptionString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractBinaryStatusItem.m", 126, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractBinaryStatusItem oneNormalServiceDescriptionString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)multipleAbnormalServicesDescriptionString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractBinaryStatusItem.m", 132, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractBinaryStatusItem multipleAbnormalServicesDescriptionString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)multipleNormalServicesDescriptionString
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractBinaryStatusItem.m", 138, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractBinaryStatusItem multipleNormalServicesDescriptionString]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)_shortTitleForTitle:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@" "];
  id v4 = [v3 lastObject];

  return v4;
}

@end