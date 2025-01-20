@interface WFSearchiTunesAction
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (id)defaultSerializedRepresentationForEnumeration:(id)a3;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)mediaType;
- (id)possibleStatesForEnumeration:(id)a3;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)updateParameterVisibility;
@end

@implementation WFSearchiTunesAction

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 key];
  int v9 = [v8 isEqualToString:@"WFMediaType"];

  if (v9)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v10 = WFAllPossibleMediaTypes();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v57;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v57 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v16 = WFSerializedNameForMediaType(v15);
          v17 = [v7 value];
          char v18 = [v16 isEqualToString:v17];

          if (v18)
          {
            uint64_t v32 = WFLocalizedNameForMediaType(v15);
            goto LABEL_38;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v56 objects:v62 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    uint64_t v19 = WFLocalizedNameForMediaType((void *)*MEMORY[0x263F876D8]);
    goto LABEL_36;
  }
  v20 = [v6 key];
  int v21 = [v20 isEqualToString:@"WFEntity"];

  if (v21)
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v22 = [(WFSearchiTunesAction *)self mediaType];
    v10 = WFEntityTypesForMediaType(v22);

    uint64_t v23 = [v10 countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v53;
      while (2)
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v53 != v25) {
            objc_enumerationMutation(v10);
          }
          v27 = *(void **)(*((void *)&v52 + 1) + 8 * j);
          v28 = WFSerializedNameForEntityType(v27);
          v29 = [v7 value];
          char v30 = [v28 isEqualToString:v29];

          if (v30)
          {
            uint64_t v32 = WFLocalizedNameForEntityType(v27);
            goto LABEL_38;
          }
        }
        uint64_t v24 = [v10 countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    v10 = [v7 value];
    v31 = WFLocalizedNameForEntityType(v10);
  }
  else
  {
    v33 = [v6 key];
    int v34 = [v33 isEqualToString:@"WFAttribute"];

    if (!v34)
    {
      uint64_t v19 = [v7 value];
LABEL_36:
      v46 = (void *)v19;
      goto LABEL_42;
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v35 = [(WFSearchiTunesAction *)self mediaType];
    v10 = WFAttributesForMediaType(v35);

    uint64_t v36 = [v10 countByEnumeratingWithState:&v48 objects:v60 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v49;
      while (2)
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v49 != v38) {
            objc_enumerationMutation(v10);
          }
          v40 = *(void **)(*((void *)&v48 + 1) + 8 * k);
          v41 = WFSerializedNameForAttribute(v40);
          v42 = [v7 value];
          char v43 = [v41 isEqualToString:v42];

          if (v43)
          {
            uint64_t v32 = WFLocalizedNameForAttribute(v40);
LABEL_38:
            v46 = (void *)v32;
            goto LABEL_41;
          }
        }
        uint64_t v37 = [v10 countByEnumeratingWithState:&v48 objects:v60 count:16];
        if (v37) {
          continue;
        }
        break;
      }
    }

    v10 = [v7 value];
    v31 = WFLocalizedNameForAttribute(v10);
  }
  v44 = v31;
  if (v31)
  {
    id v45 = v31;
  }
  else
  {
    id v45 = [v7 value];
  }
  v46 = v45;

LABEL_41:
LABEL_42:

  return v46;
}

- (id)possibleStatesForEnumeration:(id)a3
{
  id v4 = a3;
  v5 = [v4 key];
  int v6 = [v5 isEqualToString:@"WFMediaType"];

  if (v6)
  {
    id v7 = WFAllPossibleMediaTypes();
    v8 = objc_msgSend(v7, "if_compactMap:", &__block_literal_global_44038);
    goto LABEL_9;
  }
  id v7 = [(WFSearchiTunesAction *)self mediaType];
  int v9 = [v4 key];
  int v10 = [v9 isEqualToString:@"WFEntity"];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x263EFF9D8];
    uint64_t v12 = WFEntityTypesForMediaType(v7);
    uint64_t v13 = objc_msgSend(v12, "if_compactMap:", &__block_literal_global_206);
    v14 = [v11 orderedSetWithArray:v13];
    v8 = [v14 array];

LABEL_7:
    goto LABEL_9;
  }
  v15 = [v4 key];
  int v16 = [v15 isEqualToString:@"WFAttribute"];

  if (v16)
  {
    v17 = (void *)MEMORY[0x263EFF9B0];
    char v18 = WFAttributesForMediaType(v7);
    uint64_t v19 = objc_msgSend(v18, "if_compactMap:", &__block_literal_global_210);
    uint64_t v12 = [v17 orderedSetWithArray:v19];

    v20 = (void *)[objc_alloc(MEMORY[0x263F86F00]) initWithValue:@"All"];
    [v12 insertObject:v20 atIndex:0];

    v8 = [v12 array];
    goto LABEL_7;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

id __53__WFSearchiTunesAction_possibleStatesForEnumeration___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = WFSerializedNameForAttribute(v3);

  int v6 = (void *)[v4 initWithValue:v5];
  return v6;
}

id __53__WFSearchiTunesAction_possibleStatesForEnumeration___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = WFSerializedNameForEntityType(v3);

  int v6 = (void *)[v4 initWithValue:v5];
  return v6;
}

id __53__WFSearchiTunesAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEqualToString:*MEMORY[0x263F87710]])
  {
    id v3 = 0;
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263F86F00]);
    v5 = WFSerializedNameForMediaType(v2);
    id v3 = (void *)[v4 initWithValue:v5];
  }
  return v3;
}

- (id)defaultSerializedRepresentationForEnumeration:(id)a3
{
  id v4 = a3;
  v5 = [v4 key];
  int v6 = [v5 isEqualToString:@"WFMediaType"];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F86F00];
    v8 = WFSerializedNameForMediaType((void *)*MEMORY[0x263F876F0]);
    int v9 = [v7 serializedRepresentationFromValue:v8];
LABEL_5:

    goto LABEL_6;
  }
  int v10 = [v4 key];
  int v11 = [v10 isEqualToString:@"WFEntity"];

  if (v11)
  {
    v8 = [(WFSearchiTunesAction *)self possibleStatesForEnumeration:v4];
    uint64_t v12 = [v8 firstObject];
    int v9 = [v12 serializedRepresentation];

    goto LABEL_5;
  }
  v14 = [v4 key];
  int v15 = [v14 isEqualToString:@"WFAttribute"];

  if (v15)
  {
    int v9 = [MEMORY[0x263F86F00] serializedRepresentationFromValue:@"All"];
  }
  else
  {
    int v9 = 0;
  }
LABEL_6:

  return v9;
}

- (id)mediaType
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(WFSearchiTunesAction *)self definition];
  id v4 = [v3 objectForKey:@"Storefront"];

  if ([v4 isEqualToString:@"Podcasts"])
  {
    id v5 = (id)*MEMORY[0x263F87700];
  }
  else
  {
    int v6 = [(WFSearchiTunesAction *)self parameterStateForKey:@"WFMediaType"];
    id v7 = [v6 value];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v8 = WFAllPossibleMediaTypes();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v14 = WFSerializedNameForMediaType(v13);
          char v15 = objc_msgSend(v14, "isEqualToString:", v7, (void)v19);

          if (v15)
          {
            id v5 = v13;

            goto LABEL_16;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    int v16 = [(WFSearchiTunesAction *)self parameterForKey:@"WFMediaType"];

    if (v16) {
      v17 = (id *)MEMORY[0x263F876D8];
    }
    else {
      v17 = (id *)MEMORY[0x263F87710];
    }
    id v5 = *v17;
LABEL_16:
  }
  return v5;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WFSearchiTunesAction;
  BOOL v7 = [(WFSearchiTunesAction *)&v11 setParameterState:a3 forKey:v6];
  if (v7)
  {
    if ([v6 isEqualToString:@"WFMediaType"])
    {
      v8 = [(WFSearchiTunesAction *)self parameterForKey:@"WFEntity"];
      [v8 reloadPossibleStates];
      [v8 defaultSerializedRepresentationDidChange];
      uint64_t v9 = [(WFSearchiTunesAction *)self parameterForKey:@"WFAttribute"];
      [v9 reloadPossibleStates];
    }
    else if ([v6 isEqualToString:@"WFAttribute"])
    {
      [(WFSearchiTunesAction *)self updateParameterVisibility];
    }
  }

  return v7;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v4 = [(WFSearchiTunesAction *)self mediaType];
  uint64_t v36 = self;
  uint64_t v37 = [(WFSearchiTunesAction *)self parameterValueForKey:@"WFAttribute" ofClass:objc_opt_class()];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v5 = WFAttributesForMediaType(v4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v5);
        }
        objc_super v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v12 = WFSerializedNameForAttribute(v11);
        int v13 = [v12 isEqualToString:v37];

        if (v13)
        {
          id v14 = v11;

          v8 = v14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  char v15 = [(WFSearchiTunesAction *)v36 parameterValueForKey:@"WFEntity" ofClass:objc_opt_class()];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  int v34 = v4;
  int v16 = WFEntityTypesForMediaType(v4);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    long long v19 = 0;
    uint64_t v20 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(v16);
        }
        long long v22 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        uint64_t v23 = WFSerializedNameForEntityType(v22);
        int v24 = [v23 isEqualToString:v15];

        if (v24)
        {
          id v25 = v22;

          long long v19 = v25;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v18);
  }
  else
  {
    long long v19 = 0;
  }

  v26 = [(WFSearchiTunesAction *)v36 parameterValueForKey:@"WFSearchTerm" ofClass:objc_opt_class()];
  if (v26)
  {
    v27 = [(WFSearchiTunesAction *)v36 parameterValueForKey:@"WFCountry" ofClass:objc_opt_class()];
    v28 = [(WFSearchiTunesAction *)v36 parameterValueForKey:@"WFItemLimit" ofClass:objc_opt_class()];
    uint64_t v29 = [v28 unsignedIntegerValue];

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__WFSearchiTunesAction_runAsynchronouslyWithInput___block_invoke;
    aBlock[3] = &unk_264E5EEE8;
    aBlock[4] = v36;
    char v30 = _Block_copy(aBlock);
    v31 = objc_opt_new();
    uint64_t v32 = v34;
    if ([v8 isEqualToString:@"productID"])
    {
      v47 = v26;
      v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
      [v31 lookupMediaWithIdentifiers:v33 countryCode:v27 completion:v30];
    }
    else
    {
      [v31 searchForMediaOfType:v34 limitedToEntityType:v19 withTerm:v26 forAttribute:v8 countryCode:v27 limit:v29 completion:v30];
    }
  }
  else
  {
    [(WFSearchiTunesAction *)v36 finishRunningWithError:0];
    uint64_t v32 = v34;
  }
}

void __51__WFSearchiTunesAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        uint64_t v12 = [*(id *)(a1 + 32) output];
        [v12 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

- (void)updateParameterVisibility
{
  id v8 = [(WFSearchiTunesAction *)self parameterStateForKey:@"WFAttribute"];
  id v3 = [v8 value];
  id v4 = WFSerializedNameForAttribute(@"productID");
  uint64_t v5 = [v3 isEqualToString:v4];

  id v6 = [(WFSearchiTunesAction *)self parameterForKey:@"WFEntity"];
  [v6 setHidden:v5];

  uint64_t v7 = [(WFSearchiTunesAction *)self parameterForKey:@"WFItemLimit"];
  [v7 setHidden:v5];
}

- (void)initializeParameters
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)WFSearchiTunesAction;
  [(WFSearchiTunesAction *)&v13 initializeParameters];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v14[0] = @"WFMediaType";
  v14[1] = @"WFEntity";
  v14[2] = @"WFAttribute";
  id v3 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v14, 3, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [(WFSearchiTunesAction *)self parameterForKey:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        [v8 setDataSource:self];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v5);
  }

  [(WFSearchiTunesAction *)self updateParameterVisibility];
}

@end