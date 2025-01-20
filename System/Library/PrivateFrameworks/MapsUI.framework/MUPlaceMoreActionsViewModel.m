@interface MUPlaceMoreActionsViewModel
- (BOOL)isEnabled;
- (MUPlaceMoreActionsViewModel)initWithGroupedExternalActions:(id)a3 promotedSystemActionTypes:(id)a4 excludedSystemActionTypes:(id)a5 menuActionProvider:(id)a6 amsResultProvider:(id)a7 iconCache:(id)a8 externalActionHandler:(id)a9 analyticsHandler:(id)a10;
- (id)_allExternalActionMenuRevealButtons;
- (id)accessibilityIdentifier;
- (id)analyticsButtonValues;
- (id)buildMenuWithPresentationOptions:(id)a3;
- (id)symbolName;
- (id)titleText;
@end

@implementation MUPlaceMoreActionsViewModel

- (id)symbolName
{
  return @"ellipsis";
}

- (id)titleText
{
  return _MULocalizedStringFromThisBundle(@"More [Place card]");
}

- (MUPlaceMoreActionsViewModel)initWithGroupedExternalActions:(id)a3 promotedSystemActionTypes:(id)a4 excludedSystemActionTypes:(id)a5 menuActionProvider:(id)a6 amsResultProvider:(id)a7 iconCache:(id)a8 externalActionHandler:(id)a9 analyticsHandler:(id)a10
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v47 = a7;
  id v46 = a8;
  id v20 = a9;
  id v21 = a10;
  v52.receiver = self;
  v52.super_class = (Class)MUPlaceMoreActionsViewModel;
  v22 = [(MUActionRowItemViewModel *)&v52 init];
  v23 = v22;
  if (v22)
  {
    id v43 = v19;
    objc_storeWeak((id *)&v22->_menuProvider, v19);
    id v44 = v17;
    uint64_t v24 = [v17 copy];
    promotedSystemActionTypes = v23->_promotedSystemActionTypes;
    v23->_promotedSystemActionTypes = (NSArray *)v24;

    uint64_t v26 = [v18 copy];
    excludedSystemActionTypes = v23->_excludedSystemActionTypes;
    v42 = v23;
    v23->_excludedSystemActionTypes = (NSArray *)v26;

    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v29 = v16;
    id v30 = v28;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v45 = v29;
    id v31 = v29;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v49 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if (objc_msgSend(v36, "possiblyHasSupportedIntegrations", v42))
          {
            v37 = [[MUGroupedExternalActionController alloc] initWithGroupedExternalAction:v36 amsResultProvider:v47 supportsMultipleVendorSelection:1 actionHandler:v20 analyticsHandler:v21];
            [(MUGroupedExternalActionController *)v37 setMultipleVendorAnalyticsTarget:56];
            [(MUGroupedExternalActionController *)v37 setSingleVendorAnalyticsTarget:30];
            [(MUGroupedExternalActionController *)v37 setAnalyticsModuleType:4];
            [(MUGroupedExternalActionController *)v37 setSource:10];
            v38 = [[MUPlaceExternalActionMenuHelper alloc] initWithExternalActionController:v37 iconCache:v46];
            [(MUPlaceExternalActionMenuHelper *)v38 setIsQuickAction:1];
            [v30 addObject:v38];
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v33);
    }

    uint64_t v39 = [v30 copy];
    v23 = v42;
    externalActionMenuHelpers = v42->_externalActionMenuHelpers;
    v42->_externalActionMenuHelpers = (NSArray *)v39;

    id v17 = v44;
    id v16 = v45;
    id v19 = v43;
  }

  return v23;
}

- (id)buildMenuWithPresentationOptions:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v26 = self;
  obj = self->_externalActionMenuHelpers;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v10 = [v9 actionController];
        v11 = [v10 externalAction];
        v12 = [v11 actionProviders];
        uint64_t v13 = [v12 count];

        if (v13 == 1)
        {
          v14 = [v9 buildMenuElementsWithPresentationOptions:v4];
          [v28 addObjectsFromArray:v14];
        }
        else
        {
          v14 = [v9 symbolName];
          v15 = [MEMORY[0x1E4FB1818] _systemImageNamed:v14 shape:0 fill:0];
          if (!v15)
          {
            v15 = [MEMORY[0x1E4FB1818] systemImageNamed:v14];
          }
          id v16 = (void *)MEMORY[0x1E4FB1970];
          id v17 = [v9 actionName];
          id v18 = [v9 actionName];
          id v19 = [v9 buildMenuElementsWithPresentationOptions:v4];
          id v20 = [v16 menuWithTitle:v17 image:v15 identifier:v18 options:0 children:v19];

          [v28 addObject:v20];
        }
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v6);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&v26->_menuProvider);
  v22 = [WeakRetained createHeaderButtonsMenuWithPromotedSystemActionTypes:v26->_promotedSystemActionTypes excludedSystemActionTypes:v26->_excludedSystemActionTypes presentationOptions:v4];

  v23 = [v22 children];
  [v28 addObjectsFromArray:v23];

  uint64_t v24 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EE3BF360 image:0 identifier:@"Parent" options:1 children:v28];

  return v24;
}

- (BOOL)isEnabled
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return (id)[@"ActionRowItemType" stringByAppendingString:@"More"];
}

- (id)analyticsButtonValues
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(MUPlaceMoreActionsViewModel *)self _allExternalActionMenuRevealButtons];
  objc_msgSend(v3, "_mapsui_addObjectsFromArrayIfNotNil:", v4);
  uint64_t v5 = MUMap(self->_promotedSystemActionTypes, &__block_literal_global_23);
  objc_msgSend(v3, "_mapsui_addObjectsFromArrayIfNotNil:", v5);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "setIsGroup:", 1, (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v11 = (void *)[v6 copy];
  return v11;
}

uint64_t __52__MUPlaceMoreActionsViewModel_analyticsButtonValues__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = MURevealedButtonModuleTypeForActionType([a2 integerValue]);
  id v3 = (void *)MEMORY[0x1E4F64950];
  return [v3 moduleButtonForType:v2];
}

- (id)_allExternalActionMenuRevealButtons
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = self->_externalActionMenuHelpers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v23 + 1) + 8 * i) actionController];
        v10 = [v9 externalAction];
        v11 = MUExternalActionRevealedAnalyticsModuleButtonsForAction(v10);

        if ((unint64_t)[v11 count] >= 2)
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                [*(id *)(*((void *)&v19 + 1) + 8 * j) setIsGroup:1];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v14);
          }
        }
        objc_msgSend(v3, "_mapsui_addObjectsFromArrayIfNotNil:", v11);
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }

  id v17 = (void *)[v3 copy];
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedSystemActionTypes, 0);
  objc_storeStrong((id *)&self->_promotedSystemActionTypes, 0);
  objc_storeStrong((id *)&self->_menuElement, 0);
  objc_storeStrong((id *)&self->_externalActionMenuHelpers, 0);
  objc_destroyWeak((id *)&self->_menuProvider);
}

@end