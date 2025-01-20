@interface WFFindHealthSamplesAction
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (NSString)readableSampleType;
- (id)configurationData;
- (id)disallowedVariableTypesForTableTemplate;
- (id)generatedResourceNodes;
- (id)parameterDefinitions;
- (id)query;
- (void)finishRunningWithError:(id)a3;
- (void)finishRunningWithNoSamples;
- (void)initializeParameters;
- (void)resourceAvailabilityChanged;
- (void)updateParameterVisibility;
- (void)updateSourcesForSampleType:(id)a3;
- (void)wasAddedToWorkflow:(id)a3;
- (void)wasRemovedFromWorkflow:(id)a3;
@end

@implementation WFFindHealthSamplesAction

- (void)finishRunningWithNoSamples
{
  v3 = objc_opt_new();
  v4 = WFLocalizedString(@"No Samples Found");
  [v3 setTitle:v4];

  v5 = NSString;
  v6 = WFLocalizedString(@"There are either no %@ samples logged or you need to give Shortcuts access to the samples in the Health app.");
  v7 = [(WFFindHealthSamplesAction *)self readableSampleType];
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
  [v3 setMessage:v8];

  v9 = (void *)MEMORY[0x263F336F0];
  v10 = WFLocalizedString(@"OK");
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__WFFindHealthSamplesAction_finishRunningWithNoSamples__block_invoke;
  v17[3] = &unk_264E5EE70;
  v17[4] = self;
  v11 = [v9 buttonWithTitle:v10 style:1 handler:v17];
  [v3 addButton:v11];

  v12 = (void *)MEMORY[0x263F336F0];
  v13 = WFLocalizedString(@"Open Health");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__WFFindHealthSamplesAction_finishRunningWithNoSamples__block_invoke_2;
  v16[3] = &unk_264E5EE70;
  v16[4] = self;
  v14 = [v12 buttonWithTitle:v13 style:0 handler:v16];
  [v3 addButton:v14];

  v15 = [(WFFindHealthSamplesAction *)self userInterface];
  [v15 presentAlert:v3];
}

id __55__WFFindHealthSamplesAction_finishRunningWithNoSamples__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)WFFindHealthSamplesAction;
  return objc_msgSendSuper2(&v2, sel_finishRunningWithError_, 0);
}

id __55__WFFindHealthSamplesAction_finishRunningWithNoSamples__block_invoke_2(uint64_t a1)
{
  objc_super v2 = [MEMORY[0x263F33718] sharedContext];
  v3 = [NSURL URLWithString:@"x-apple-health://"];
  [v2 openURL:v3 withBundleIdentifier:@"com.apple.Health" userInterface:0 completionHandler:0];

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)WFFindHealthSamplesAction;
  return objc_msgSendSuper2(&v5, sel_finishRunningWithError_, 0);
}

- (void)finishRunningWithError:(id)a3
{
  if (a3)
  {
    v26.receiver = self;
    v26.super_class = (Class)WFFindHealthSamplesAction;
    -[WFFindHealthSamplesAction finishRunningWithError:](&v26, sel_finishRunningWithError_);
  }
  else
  {
    v4 = [(WFFindHealthSamplesAction *)self output];
    id v25 = 0;
    objc_super v5 = [v4 collectionByFilteringToItemClass:objc_opt_class() excludedItems:&v25];
    id v6 = v25;

    v7 = [(WFFindHealthSamplesAction *)self readableSampleType];
    v8 = +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:v7];

    uint64_t v9 = [MEMORY[0x263F0A598] categoryTypeForIdentifier:v8];
    uint64_t v10 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:v8];
    if (!(v9 | v10))
    {
      v11 = [(WFFindHealthSamplesAction *)self readableSampleType];
      NSLog(&cfstr_Wffindhealthsa_1.isa, v11, v8);
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke;
    aBlock[3] = &unk_264E5D660;
    aBlock[4] = self;
    v12 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    if (v9)
    {
      if ([v5 numberOfItems])
      {
        v23.receiver = self;
        v23.super_class = (Class)WFFindHealthSamplesAction;
        [(WFFindHealthSamplesAction *)&v23 finishRunningWithError:0];
      }
      else
      {
        v12[2](v12, v9);
      }
    }
    else
    {
      v13 = [(WFFindHealthSamplesAction *)self parameterValueForKey:@"WFHKSampleFilteringGroupBy" ofClass:objc_opt_class()];
      v14 = [(WFFindHealthSamplesAction *)self parameterValueForKey:@"WFHKSampleFilteringFillMissing" ofClass:objc_opt_class()];
      char v15 = [v14 BOOLValue];

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_3;
      v17[3] = &unk_264E5D6B0;
      v17[4] = self;
      v21 = v12;
      id v18 = (id)v10;
      id v19 = v13;
      char v22 = v15;
      id v20 = v6;
      id v16 = v13;
      [v5 getObjectRepresentations:v17 forClass:objc_opt_class()];
    }
  }
}

uint64_t __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_2;
    v4[3] = &unk_264E5D638;
    v4[4] = *(void *)(a1 + 32);
    return +[WFHealthKitHelper sourcesForSampleType:a2 completion:v4];
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    return [v3 finishRunningWithNoSamples];
  }
}

void __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 count])
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_4;
    aBlock[3] = &unk_264E5D688;
    id v8 = v6;
    id v20 = v8;
    id v21 = *(id *)(a1 + 48);
    id v9 = v7;
    uint64_t v10 = *(void *)(a1 + 32);
    id v22 = v9;
    uint64_t v23 = v10;
    char v25 = *(unsigned char *)(a1 + 72);
    id v24 = *(id *)(a1 + 56);
    v11 = (void (**)(void *, void *))_Block_copy(aBlock);
    v12 = [*(id *)(a1 + 32) parameterValueForKey:@"WFHKSampleFilteringUnit" ofClass:objc_opt_class()];
    if (v12)
    {
      v11[2](v11, v12);
    }
    else
    {
      v13 = [v8 firstObject];
      v14 = [v13 quantitySample];
      char v15 = [v14 quantityType];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_6;
      v17[3] = &unk_264E5DDE8;
      id v16 = v11;
      v17[4] = *(void *)(a1 + 32);
      id v18 = v16;
      +[WFHealthKitHelper validUnitsForQuantityType:v15 completion:v17];
    }
  }
  else if (v7)
  {
    v26.receiver = *(id *)(a1 + 32);
    v26.super_class = (Class)WFFindHealthSamplesAction;
    objc_msgSendSuper2(&v26, sel_finishRunningWithError_, v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v109 objects:v126 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v110 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v109 + 1) + 8 * i) setUnit:v3];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v109 objects:v126 count:16];
    }
    while (v6);
  }

  if (*(void *)(a1 + 40))
  {
    id v9 = [*(id *)(a1 + 56) query];
    uint64_t v10 = +[WFHealthKitHelper extractHKDataFromContentQuery:v9];

    v11 = objc_alloc_init(WFHKGroupingConfiguration);
    id v12 = *(id *)(a1 + 40);
    if ([v12 isEqualToString:@"Minute"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"Hour"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"Day"])
    {
      uint64_t v13 = 3;
    }
    else if ([v12 isEqualToString:@"Week"])
    {
      uint64_t v13 = 4;
    }
    else if ([v12 isEqualToString:@"Month"])
    {
      uint64_t v13 = 5;
    }
    else if ([v12 isEqualToString:@"3 Months"])
    {
      uint64_t v13 = 6;
    }
    else if ([v12 isEqualToString:@"Year"])
    {
      uint64_t v13 = 7;
    }
    else
    {
      uint64_t v13 = 0;
    }

    [(WFHKGroupingConfiguration *)v11 setGroupingOption:v13];
    [(WFHKGroupingConfiguration *)v11 setFillMissing:*(unsigned __int8 *)(a1 + 72)];
    char v15 = [v10 startDate];
    [(WFHKGroupingConfiguration *)v11 setQueryStartDate:v15];

    v93 = v10;
    id v16 = [v10 endDate];
    [(WFHKGroupingConfiguration *)v11 setQueryEndDate:v16];

    v17 = *(void **)(a1 + 56);
    id v18 = *(id *)(a1 + 32);
    id v19 = v11;
    id v99 = v17;
    v97 = v19;
    if ([(WFHKGroupingConfiguration *)v19 groupingOption])
    {
      uint64_t v89 = a1;
      v100 = [[WFHKGroupingIndexPathTransformer alloc] initWithGroupingOption:[(WFHKGroupingConfiguration *)v19 groupingOption]];
      id v20 = objc_opt_new();
      long long v121 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      id v88 = v18;
      id v21 = v18;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v121 objects:v129 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v122;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v122 != v24) {
              objc_enumerationMutation(v21);
            }
            objc_super v26 = *(void **)(*((void *)&v121 + 1) + 8 * j);
            v27 = [v26 quantitySample];
            v28 = [v27 startDate];
            v29 = [(WFHKGroupingIndexPathTransformer *)v100 transformedValue:v28];

            v30 = [v20 objectForKeyedSubscript:v29];
            if (!v30)
            {
              v30 = objc_opt_new();
              [v20 setObject:v30 forKeyedSubscript:v29];
            }
            [v30 addObject:v26];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v121 objects:v129 count:16];
        }
        while (v23);
      }

      if ([v99 isRunning])
      {
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __WFHKGroupedSampleContainers_block_invoke;
        aBlock[3] = &unk_264E5D6D8;
        id v31 = v20;
        id v120 = v31;
        v32 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
        v33 = v32[2](v32, 1);
        id v19 = v97;
        a1 = v89;
        if (-[WFHKGroupingConfiguration fillMissing](v97, "fillMissing") && [v31 count])
        {
          v83 = (char *)(v32 + 2);
          v85 = v33;
          v86 = v32;
          v34 = WFHKInterpolateMissingGroups(v33, v97, v99);
          v35 = [v31 allKeys];
          uint64_t v36 = [v35 firstObject];

          v91 = v31;
          v84 = (void *)v36;
          v37 = [v31 objectForKeyedSubscript:v36];
          v38 = [v37 firstObject];

          v39 = (void *)MEMORY[0x263F0A630];
          v40 = [v38 unit];
          v94 = [v39 quantityWithUnit:v40 doubleValue:0.0];

          v95 = v38;
          v96 = [v38 quantitySample];
          long long v115 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          id v41 = v34;
          uint64_t v92 = [v41 countByEnumeratingWithState:&v115 objects:v128 count:16];
          if (v92)
          {
            uint64_t v90 = *(void *)v116;
            obuint64_t j = v41;
            while (2)
            {
              for (uint64_t k = 0; k != v92; ++k)
              {
                if (*(void *)v116 != v90) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v43 = *(void *)(*((void *)&v115 + 1) + 8 * k);
                v44 = (void *)MEMORY[0x23ECE6170]();
                if (![v99 isRunning])
                {
                  v63 = obj;

                  id v62 = 0;
                  a1 = v89;
                  v33 = v85;
                  v32 = v86;
                  id v19 = v97;
                  goto LABEL_56;
                }
                v45 = [(WFHKGroupingIndexPathTransformer *)v100 reverseTransformedValue:v43];
                v46 = (void *)[v45 copy];
                v47 = [v96 quantityType];
                int v48 = [v47 isMinimumDurationRestricted];

                context = v44;
                if (v48)
                {
                  v49 = [v96 quantityType];
                  [v49 minimumAllowedDuration];
                  v50 = objc_msgSend(v45, "dateByAddingTimeInterval:");
                }
                else
                {
                  v50 = v46;
                }
                v51 = (void *)MEMORY[0x263F0A648];
                v52 = objc_msgSend(v96, "quantityType", v83);
                v53 = [v96 metadata];
                v54 = [v51 quantitySampleWithType:v52 quantity:v94 startDate:v45 endDate:v50 metadata:v53];

                v55 = [WFHKQuantitySampleContainer alloc];
                v56 = [v95 unit];
                v57 = [(WFHKQuantitySampleContainer *)v55 initWithSample:v54 unit:v56];

                v127 = v57;
                v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v127 count:1];
                v59 = (void *)[v58 mutableCopy];
                [v91 setObject:v59 forKeyedSubscript:v43];
              }
              id v41 = obj;
              uint64_t v92 = [obj countByEnumeratingWithState:&v115 objects:v128 count:16];
              if (v92) {
                continue;
              }
              break;
            }
          }

          a1 = v89;
          v33 = v85;
          v32 = v86;
          id v31 = v91;
          id v19 = v97;
        }
        if (objc_msgSend(v99, "isRunning", v83))
        {
          v60 = v32[2](v32, 1);

          v113[0] = MEMORY[0x263EF8330];
          v113[1] = 3221225472;
          v113[2] = __WFHKGroupedSampleContainers_block_invoke_2;
          v113[3] = &unk_264E5D700;
          id v114 = v31;
          v61 = objc_msgSend(v60, "if_map:", v113);
          objc_msgSend(v61, "if_map:", &__block_literal_global_456);
          id v62 = (id)objc_claimAutoreleasedReturnValue();

          v63 = v114;
          v33 = v60;
LABEL_56:
        }
        else
        {
          id v62 = 0;
        }
      }
      else
      {
        id v62 = 0;
        a1 = v89;
        id v19 = v97;
      }

      v64 = v88;
    }
    else
    {
      v64 = v18;
      id v62 = v18;
    }

    v65 = objc_opt_new();
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v66 = v62;
    uint64_t v67 = [v66 countByEnumeratingWithState:&v104 objects:v125 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v105;
      do
      {
        for (uint64_t m = 0; m != v68; ++m)
        {
          if (*(void *)v105 != v69) {
            objc_enumerationMutation(v66);
          }
          v71 = objc_msgSend(MEMORY[0x263F337C8], "itemWithObject:", *(void *)(*((void *)&v104 + 1) + 8 * m), v83);
          [v65 addObject:v71];
        }
        uint64_t v68 = [v66 countByEnumeratingWithState:&v104 objects:v125 count:16];
      }
      while (v68);
    }

    v72 = [*(id *)(a1 + 56) query];
    id v73 = objc_alloc(MEMORY[0x263F33810]);
    v74 = [MEMORY[0x263F337F8] truePredicate];
    v75 = (void *)[v73 initWithPredicate:v74];

    v76 = [v72 sortDescriptors];
    [v75 setSortDescriptors:v76];

    uint64_t v77 = [v72 slice];
    objc_msgSend(v75, "setSlice:", v77, v78);
    v79 = (void *)MEMORY[0x263F337C8];
    v80 = [*(id *)(a1 + 56) contentPermissionRequestor];
    v101[0] = MEMORY[0x263EF8330];
    v101[1] = 3221225472;
    v101[2] = __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_5;
    v101[3] = &unk_264E5DB20;
    id v81 = *(id *)(a1 + 64);
    uint64_t v82 = *(void *)(a1 + 56);
    id v102 = v81;
    uint64_t v103 = v82;
    [v79 runQuery:v75 withItems:v65 permissionRequestor:v80 completionHandler:v101];
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 48);
    v108.receiver = *(id *)(a1 + 56);
    v108.super_class = (Class)WFFindHealthSamplesAction;
    objc_msgSendSuper2(&v108, sel_finishRunningWithError_, v14);
  }
}

void __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_6(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [v3 firstObject];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08320];
    v11[0] = @"No unit";
    id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v9 = [v7 errorWithDomain:@"WFFindHealthSamplesActionErrorDomain" code:100 userInfo:v8];
    [v6 finishRunningWithError:v9];
  }
}

void __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 32) addItem:*(void *)(*((void *)&v12 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  [*(id *)(a1 + 40) setOutput:*(void *)(a1 + 32)];
  v11.receiver = *(id *)(a1 + 40);
  v11.super_class = (Class)WFFindHealthSamplesAction;
  objc_msgSendSuper2(&v11, sel_finishRunningWithError_, v6);
}

void __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 count])
  {
    v6.receiver = *(id *)(a1 + 32);
    v6.super_class = (Class)WFFindHealthSamplesAction;
    objc_msgSendSuper2(&v6, sel_finishRunningWithError_, v5);
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithNoSamples];
  }
}

- (id)query
{
  v11.receiver = self;
  v11.super_class = (Class)WFFindHealthSamplesAction;
  id v3 = [(WFContentItemFilterAction *)&v11 query];
  uint64_t v4 = [v3 userInfo];
  id v5 = (void *)[v4 mutableCopy];
  objc_super v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  uint64_t v8 = v7;

  uint64_t v9 = [(WFFindHealthSamplesAction *)self parameterValueForKey:@"WFHKSampleFilteringUnit" ofClass:objc_opt_class()];
  if (v9) {
    [v8 setValue:v9 forKey:@"WFHKSampleContentItemQueryUnit"];
  }
  [v3 setUserInfo:v8];

  return v3;
}

- (void)updateSourcesForSampleType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(WFContentItemFilterAction *)self rowForContentPropertyName:@"Source"];
    objc_super v6 = v5;
    if (v5)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __56__WFFindHealthSamplesAction_updateSourcesForSampleType___block_invoke;
      v7[3] = &unk_264E5D608;
      id v8 = v5;
      uint64_t v9 = self;
      +[WFHealthKitHelper sourcesForSampleType:v4 completion:v7];
    }
  }
}

void __56__WFFindHealthSamplesAction_updateSourcesForSampleType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 allObjects];
  id v4 = objc_msgSend(v3, "if_compactMap:", &__block_literal_global_369_50518);

  id v5 = [MEMORY[0x263EFFA08] setWithArray:v4];
  objc_super v6 = [v5 allObjects];

  id v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_373_50520];
  id v8 = [*(id *)(a1 + 32) contentProperty];
  [v8 setPossibleValues:v7];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__WFFindHealthSamplesAction_updateSourcesForSampleType___block_invoke_4;
  block[3] = &unk_264E5EE70;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __56__WFFindHealthSamplesAction_updateSourcesForSampleType___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) parameterForKey:*MEMORY[0x263F87180]];
  [v1 attributesDidChange];
}

uint64_t __56__WFFindHealthSamplesAction_updateSourcesForSampleType___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompare:");
}

id __56__WFFindHealthSamplesAction_updateSourcesForSampleType___block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v2 = [a2 name];
  id v3 = [v2 stringByReplacingOccurrencesOfString:@" " withString:@" "];

  return v3;
}

- (void)updateParameterVisibility
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(WFFindHealthSamplesAction *)self readableSampleType];
  if ([v3 length])
  {
    id v4 = +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:v3];
    id v5 = [MEMORY[0x263F0A6E8] categoryTypeForIdentifier:v4];
    BOOL v6 = v5 != 0;

    id v7 = [(WFFindHealthSamplesAction *)self parameterForKey:@"WFHKSampleFilteringGroupBy"];
    [v7 setHidden:v6];

    id v8 = [(WFFindHealthSamplesAction *)self parameterForKey:@"WFHKSampleFilteringFillMissing"];
    [v8 setHidden:v6];

    uint64_t v9 = [(WFFindHealthSamplesAction *)self parameterForKey:@"WFHKSampleFilteringUnit"];
    [v9 setHidden:v6];
  }
  else
  {
    uint64_t v10 = getWFGeneralLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315138;
      long long v12 = "-[WFFindHealthSamplesAction updateParameterVisibility]";
      _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_FAULT, "%s Find health samples action is missing a sample type, which is required", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFFindHealthSamplesAction;
  BOOL v7 = [(WFContentItemFilterAction *)&v13 setParameterState:a3 forKey:v6];
  if (v7 && [v6 isEqualToString:*MEMORY[0x263F87180]])
  {
    id v8 = [(WFFindHealthSamplesAction *)self configurationData];
    uint64_t v9 = [(WFFindHealthSamplesAction *)self parameterForKey:@"WFHKSampleFilteringUnit"];
    uint64_t v10 = [v8 quantityType];
    [v9 setQuantityType:v10];

    [(WFFindHealthSamplesAction *)self recreateResourcesIfNeeded];
    int v11 = [v8 sampleType];
    [(WFFindHealthSamplesAction *)self updateSourcesForSampleType:v11];

    [(WFFindHealthSamplesAction *)self updateParameterVisibility];
  }

  return v7;
}

- (id)parameterDefinitions
{
  v63[7] = *MEMORY[0x263EF8340];
  v48.receiver = self;
  v48.super_class = (Class)WFFindHealthSamplesAction;
  objc_super v2 = [(WFContentItemFilterAction *)&v48 parameterDefinitions];
  v45 = (void *)[v2 mutableCopy];

  v63[0] = @"Minute";
  v63[1] = @"Hour";
  v63[2] = @"Day";
  v63[3] = @"Week";
  v63[4] = @"Month";
  v63[5] = @"3 Months";
  v63[6] = @"Year";
  v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:7];
  id v3 = WFLocalizedStringResourceWithKey(@"Minute (WFHKSampleFilteringGroupBy)", @"Minute");
  v62[0] = v3;
  id v4 = WFLocalizedStringResourceWithKey(@"Hour (WFHKSampleFilteringGroupBy)", @"Hour");
  v62[1] = v4;
  id v5 = WFLocalizedStringResourceWithKey(@"Day (WFHKSampleFilteringGroupBy)", @"Day");
  v62[2] = v5;
  id v6 = WFLocalizedStringResourceWithKey(@"Week (WFHKSampleFilteringGroupBy)", @"Week");
  v62[3] = v6;
  BOOL v7 = WFLocalizedStringResourceWithKey(@"Month (WFHKSampleFilteringGroupBy)", @"Month");
  v62[4] = v7;
  id v8 = WFLocalizedStringResourceWithKey(@"3 Months (WFHKSampleFilteringGroupBy)", @"3 Months");
  v62[5] = v8;
  uint64_t v9 = WFLocalizedStringResourceWithKey(@"Year (WFHKSampleFilteringGroupBy)", @"Year");
  v62[6] = v9;
  v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:7];

  id v10 = objc_alloc(MEMORY[0x263F86D68]);
  uint64_t v56 = *MEMORY[0x263F872D8];
  uint64_t v44 = v56;
  int v11 = (objc_class *)objc_opt_class();
  long long v12 = NSStringFromClass(v11);
  v61[0] = v12;
  uint64_t v57 = *MEMORY[0x263F87360];
  uint64_t v13 = v57;
  long long v14 = WFLocalizedStringResourceWithKey(@"Unit (WFHKSampleFilteringUnit)", @"Unit");
  v61[1] = v14;
  uint64_t v58 = *MEMORY[0x263F872E8];
  uint64_t v42 = v58;
  long long v15 = WFLocalizedStringResourceWithKey(@"The unit to use for the returned results", @"The unit to use for the returned results");
  uint64_t v16 = *MEMORY[0x263F87350];
  v61[2] = v15;
  v61[3] = @"WFHKSampleFilteringUnit";
  uint64_t v17 = *MEMORY[0x263F87380];
  uint64_t v59 = v16;
  uint64_t v60 = v17;
  uint64_t v43 = v16;
  id v18 = WFLocalizedStringResourceWithKey(@"None", @"None");
  v61[4] = v18;
  id v19 = [NSDictionary dictionaryWithObjects:v61 forKeys:&v56 count:5];
  id v20 = (void *)[v10 initWithDictionary:v19];
  [v45 insertObject:v20 atIndex:1];

  id v21 = objc_alloc(MEMORY[0x263F86D68]);
  v54[0] = v44;
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  v55[0] = v23;
  v54[1] = v13;
  uint64_t v24 = WFLocalizedStringResourceWithKey(@"Group by (WFHKSampleFilteringGroupBy)", @"Group by");
  v55[1] = v24;
  v54[2] = v42;
  char v25 = WFLocalizedStringResourceWithKey(@"The time period to group results by. For example, grouping by day gives you only the daily totals.", @"The time period to group results by. For example, grouping by day gives you only the daily totals.");
  v55[2] = v25;
  v55[3] = @"WFHKSampleFilteringGroupBy";
  v54[3] = v16;
  v54[4] = v17;
  objc_super v26 = WFLocalizedStringResourceWithKey(@"None", @"None");
  uint64_t v27 = *MEMORY[0x263F87318];
  v55[4] = v26;
  v55[5] = v46;
  uint64_t v28 = *MEMORY[0x263F87310];
  v54[5] = v27;
  v54[6] = v28;
  v55[6] = v47;
  v29 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:7];
  v30 = (void *)[v21 initWithDictionary:v29];
  [v45 insertObject:v30 atIndex:2];

  id v31 = objc_alloc(MEMORY[0x263F86D68]);
  v52[0] = v44;
  v32 = (objc_class *)objc_opt_class();
  v33 = NSStringFromClass(v32);
  v53[0] = v33;
  v52[1] = v13;
  v34 = WFLocalizedStringResourceWithKey(@"Fill Missing (WFHKSampleFilteringFillMissing)", @"Fill Missing");
  v53[1] = v34;
  v52[2] = v42;
  v35 = WFLocalizedStringResourceWithKey(@"Whether or not to fill in empty groups with zero values. This is useful to turn off when averaging over a longer period of time.", @"Whether or not to fill in empty groups with zero values. This is useful to turn off when averaging over a longer period of time.");
  v53[2] = v35;
  v53[3] = @"WFHKSampleFilteringFillMissing";
  uint64_t v36 = *MEMORY[0x263F872E0];
  v52[3] = v43;
  v52[4] = v36;
  v53[4] = MEMORY[0x263EFFA88];
  v52[5] = *MEMORY[0x263F873B8];
  v49[0] = @"WFResourceClass";
  v49[1] = @"WFParameterKey";
  v50[0] = @"WFParameterRelationResource";
  v50[1] = @"WFHKSampleFilteringGroupBy";
  v49[2] = @"WFParameterValues";
  v50[2] = v46;
  v37 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3];
  v51 = v37;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
  v53[5] = v38;
  v39 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:6];
  v40 = (void *)[v31 initWithDictionary:v39];
  [v45 insertObject:v40 atIndex:3];

  return v45;
}

- (void)resourceAvailabilityChanged
{
  id v5 = [(WFFindHealthSamplesAction *)self configurationData];
  id v3 = [(WFFindHealthSamplesAction *)self parameterForKey:@"WFHKSampleFilteringUnit"];
  [v3 updatePossibleStates];
  id v4 = [v5 sampleType];
  [(WFFindHealthSamplesAction *)self updateSourcesForSampleType:v4];
}

- (id)configurationData
{
  objc_super v2 = [(WFFindHealthSamplesAction *)self readableSampleType];
  if (v2)
  {
    id v3 = +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:v2];
    id v4 = objc_alloc_init(WFHKContentQueryData);
    if (v3)
    {
      id v5 = [MEMORY[0x263F0A6E8] quantityTypeForIdentifier:v3];
      [(WFHKContentQueryData *)v4 setQuantityType:v5];

      id v6 = [MEMORY[0x263F0A6E8] categoryTypeForIdentifier:v3];
      [(WFHKContentQueryData *)v4 setCategoryType:v6];

      goto LABEL_6;
    }
  }
  else
  {
    id v4 = objc_alloc_init(WFHKContentQueryData);
  }
  [(WFHKContentQueryData *)v4 setQuantityType:0];
  [(WFHKContentQueryData *)v4 setCategoryType:0];
LABEL_6:

  return v4;
}

- (NSString)readableSampleType
{
  objc_super v2 = [(WFContentItemFilterAction *)self rowForContentPropertyName:@"Type"];
  id v3 = [v2 enumerationValue];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)wasRemovedFromWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFFindHealthSamplesAction;
  [(WFContentItemFilterAction *)&v5 wasRemovedFromWorkflow:a3];
  id v4 = [(WFFindHealthSamplesAction *)self resourceManager];
  [v4 removeTarget:self selector:sel_resourceAvailabilityChanged];
}

- (void)wasAddedToWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFFindHealthSamplesAction;
  [(WFContentItemFilterAction *)&v5 wasAddedToWorkflow:a3];
  id v4 = [(WFFindHealthSamplesAction *)self resourceManager];
  [v4 addTarget:self selector:sel_resourceAvailabilityChanged];
}

- (id)generatedResourceNodes
{
  v29[1] = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)WFFindHealthSamplesAction;
  id v3 = [(WFFindHealthSamplesAction *)&v26 generatedResourceNodes];
  id v4 = (void *)[v3 mutableCopy];

  objc_super v5 = [(WFFindHealthSamplesAction *)self valueForKeyPath:@"readableSampleType"];
  id v6 = +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:v5];
  uint64_t v7 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:v6];
  uint64_t v8 = [MEMORY[0x263F0A598] categoryTypeForIdentifier:v6];
  uint64_t v9 = (void *)v8;
  if (v7 | v8)
  {
    if (v7) {
      id v10 = (void *)v7;
    }
    else {
      id v10 = (void *)v8;
    }
    if (v7) {
      int v11 = WFHKReadableObjectTypeQuantity;
    }
    else {
      int v11 = WFHKReadableObjectTypeCategory;
    }
    id v25 = v10;
    long long v12 = *v11;
    uint64_t v13 = [WFHealthKitAccessResource alloc];
    v27[0] = *MEMORY[0x263F873F8];
    long long v14 = (objc_class *)objc_opt_class();
    long long v15 = NSStringFromClass(v14);
    v28[0] = v15;
    v28[1] = @"Read";
    v27[1] = @"AccessType";
    v27[2] = @"ReadableType";
    v27[3] = @"ObjectType";
    v28[2] = v12;
    v28[3] = v25;
    [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];
    uint64_t v16 = v5;
    id v18 = v17 = v4;
    id v19 = [(WFHealthKitAccessResource *)v13 initWithDefinition:v18];
    v29[0] = v19;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];

    id v4 = v17;
    objc_super v5 = v16;

    id v21 = objc_msgSend(v20, "if_map:", &__block_literal_global_50625);
    [v4 addObjectsFromArray:v21];
    id v22 = v4;

    uint64_t v23 = v25;
  }
  else
  {
    uint64_t v23 = 0;
    long long v12 = 0;
    id v22 = (id)MEMORY[0x263EFFA68];
  }

  return v22;
}

id __51__WFFindHealthSamplesAction_generatedResourceNodes__block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = (objc_class *)MEMORY[0x263F86E30];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithResource:v3];

  return v4;
}

- (id)disallowedVariableTypesForTableTemplate
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F87518];
  v5[0] = *MEMORY[0x263F874E8];
  v5[1] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  return v3;
}

- (void)initializeParameters
{
  v7.receiver = self;
  v7.super_class = (Class)WFFindHealthSamplesAction;
  [(WFContentItemFilterAction *)&v7 initializeParameters];
  id v3 = [(WFFindHealthSamplesAction *)self configurationData];
  id v4 = [(WFFindHealthSamplesAction *)self parameterForKey:@"WFHKSampleFilteringUnit"];
  objc_super v5 = [v3 quantityType];
  [v4 setQuantityType:v5];

  id v6 = [v3 sampleType];
  [(WFFindHealthSamplesAction *)self updateSourcesForSampleType:v6];

  [(WFFindHealthSamplesAction *)self updateParameterVisibility];
}

@end