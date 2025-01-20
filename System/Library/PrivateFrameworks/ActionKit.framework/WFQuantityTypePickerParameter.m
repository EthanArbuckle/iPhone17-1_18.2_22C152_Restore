@interface WFQuantityTypePickerParameter
- (BOOL)preferParameterValuePicker;
- (Class)singleStateClass;
- (NSArray)possibleStates;
- (id)accessoryImageForPossibleState:(id)a3;
- (id)localizedLabelForPossibleState:(id)a3;
@end

@implementation WFQuantityTypePickerParameter

- (void).cxx_destruct
{
}

- (id)accessoryImageForPossibleState:(id)a3
{
  id v3 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v4 = (void *)getHKDisplayTypeControllerClass_softClass;
  uint64_t v24 = getHKDisplayTypeControllerClass_softClass;
  if (!getHKDisplayTypeControllerClass_softClass)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __getHKDisplayTypeControllerClass_block_invoke;
    v20[3] = &unk_264E5EC88;
    v20[4] = &v21;
    __getHKDisplayTypeControllerClass_block_invoke((uint64_t)v20);
    v4 = (void *)v22[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v21, 8);
  v6 = objc_msgSend(MEMORY[0x263F0A410], "wf_shortcutsAppHealthStore");
  v7 = [v5 sharedInstanceForHealthStore:v6];
  v8 = [v3 value];
  v9 = [v7 displayTypeForObjectTypeUnifyingBloodPressureTypes:v8];

  id v10 = objc_alloc(MEMORY[0x263F851A8]);
  v11 = [v9 displayCategory];
  v12 = [v11 color];
  v13 = (void *)[v10 initWithPlatformColor:v12];

  id v14 = objc_alloc(MEMORY[0x263F85308]);
  v15 = [v9 listIcon];
  v16 = (void *)[v14 initWithPlatformImage:v15];
  v17 = [v16 imageWithRenderingMode:2];
  v18 = [v17 imageWithTintColor:v13];

  return v18;
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3 = [a3 value];
  v4 = [v3 identifier];

  if (([v4 isEqualToString:*MEMORY[0x263F09C28]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x263F09C20]])
  {
    id v5 = WFLocalizedString(@"Blood Pressure");
  }
  else
  {
    v6 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:v4];
    if (v6)
    {
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v6, "hk_localizedName");
      }
      else {
      id v5 = +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:v4];
      }
    }
    else
    {
      v7 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:v4];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v7, "hk_localizedName");
      }
      else {
      id v5 = +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:v4];
      }
    }
  }

  return v5;
}

- (NSArray)possibleStates
{
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    v4 = WFHealthKitSampleTypeIdentifiers();
    id v5 = objc_msgSend(v4, "if_compactMap:", &__block_literal_global_2608);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __47__WFQuantityTypePickerParameter_possibleStates__block_invoke_2;
    v9[3] = &unk_264E55F08;
    v9[4] = self;
    v6 = [v5 sortedArrayUsingComparator:v9];
    v7 = self->_possibleStates;
    self->_possibleStates = v6;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

uint64_t __47__WFQuantityTypePickerParameter_possibleStates__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 localizedLabelForPossibleState:a2];
  v8 = [*(id *)(a1 + 32) localizedLabelForPossibleState:v6];

  uint64_t v9 = [v7 localizedStandardCompare:v8];
  return v9;
}

WFHKSampleTypeSubstitutableState *__47__WFQuantityTypePickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEqualToString:*MEMORY[0x263F09C20]])
  {
    id v3 = 0;
  }
  else
  {
    v4 = [MEMORY[0x263F0A598] _typeWithIdentifier:v2];
    if ([v4 sharingAuthorizationAllowed]
      && (([MEMORY[0x263F0A658] quantityTypeForIdentifier:v2],
           (id v5 = objc_claimAutoreleasedReturnValue()) != 0)
       || ([MEMORY[0x263F0A158] categoryTypeForIdentifier:v2],
           (id v5 = objc_claimAutoreleasedReturnValue()) != 0)))
    {
      id v3 = [(WFVariableSubstitutableParameterState *)[WFHKSampleTypeSubstitutableState alloc] initWithValue:v5];
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end