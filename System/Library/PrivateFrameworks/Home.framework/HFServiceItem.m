@interface HFServiceItem
+ (Class)itemClassForService:(id)a3;
+ (NSDictionary)_serviceTypeToServiceItemClassMap;
+ (NSSet)supportedServiceTypes;
+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4;
+ (id)serviceItemForService:(id)a3 valueSource:(id)a4;
- (BOOL)actionsMayRequireDeviceUnlock;
- (BOOL)containsActions;
- (HFCharacteristicValueSource)valueSource;
- (HFServiceItem)init;
- (HFServiceItem)initWithValueSource:(id)a3 service:(id)a4;
- (HMHome)home;
- (HMService)service;
- (NSSet)services;
- (NSString)debugDescription;
- (NSString)description;
- (id)_actionableCharacteristics;
- (id)_allRepresentedServices;
- (id)_augmentedStandardResultsForUpdateResponse:(id)a3 controlItems:(id)a4;
- (id)_descriptionBuilder;
- (id)_siriEndPointProfiles;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessories;
- (id)characteristicsToReadForCharacteristicTypes:(id)a3 controlItems:(id)a4;
- (id)characteristicsToReadWithCharacteristicTypes:(id)a3 options:(id)a4 controlItems:(id *)a5;
- (id)controlDescriptionForCharacteristic:(id)a3 withValue:(id)a4;
- (id)controlItemValueSourceForPrimaryService;
- (id)controlItemValueSourceForServices:(id)a3;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createControlItemsWithOptions:(id)a3;
- (id)currentStateActionBuildersForHome:(id)a3;
- (id)descriptionForCharacteristic:(id)a3 withValue:(id)a4;
- (id)incrementalStateIconDescriptorForPrimaryState:(int64_t)a3 incrementalValue:(id)a4;
- (id)namingComponentForHomeKitObject;
- (id)performStandardUpdateWithCharacteristicTypes:(id)a3 options:(id)a4;
- (id)serviceLikeBuilderInHome:(id)a3;
- (void)applyInflectionToDescriptions:(id)a3;
@end

@implementation HFServiceItem

- (HMService)service
{
  return self->_service;
}

uint64_t __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_characteristicOfType:", *(void *)(a1 + 32));
}

id __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 characteristicOptions];
  v5 = [v4 allCharacteristicTypes];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_4;
  v19[3] = &unk_26408CEC0;
  id v6 = v3;
  id v20 = v6;
  v7 = objc_msgSend(v5, "na_flatMap:", v19);
  v8 = (void *)[v7 mutableCopy];

  objc_opt_class();
  id v9 = v6;
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    v12 = [v11 childServiceFilter];
    v13 = [v11 parentService];
    v14 = [v12 filteredChildServicesForParentService:v13];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_5;
    v18[3] = &unk_264091C28;
    v18[4] = *(void *)(a1 + 32);
    v15 = objc_msgSend(v14, "na_map:", v18);
    v16 = objc_msgSend(v15, "na_flatMap:", &__block_literal_global_94_0);
    [v8 unionSet:v16];
  }
  return v8;
}

id __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 valueSource];
  v5 = [v4 allCharacteristicsForCharacteristicType:v3];

  return v5;
}

uint64_t __28__HFServiceItem_accessories__block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

- (id)controlDescriptionForCharacteristic:(id)a3 withValue:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionary];
  v10 = [(HFServiceItem *)self service];
  id v11 = [v10 serviceType];
  objc_msgSend(v9, "na_safeSetObject:forKey:", v11, @"serviceType");

  v12 = [(HFServiceItem *)self service];
  v13 = [v12 accessory];
  v14 = [v13 room];
  v15 = [v14 name];
  objc_msgSend(v9, "na_safeSetObject:forKey:", v15, @"roomName");

  v16 = objc_msgSend(MEMORY[0x263F08878], "hf_controlDescriptionFormatterForCharacteristic:options:", v8, v9);

  v17 = [v16 stringForObjectValue:v7];

  return v17;
}

uint64_t __50__HFServiceItem__serviceTypeToServiceItemClassMap__block_invoke_29(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:a2];
}

id __70__HFServiceItem_performStandardUpdateWithCharacteristicTypes_options___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  v5 = [v2 _augmentedStandardResultsForUpdateResponse:v4 controlItems:v3];
  id v6 = [HFServiceLikeItemUpdateResponse alloc];
  id v7 = [v4 displayMetadata];
  id v8 = [v4 readResponse];

  id v9 = [(HFServiceLikeItemUpdateResponse *)v6 initWithDisplayMetadata:v7 readResponse:v8 standardResults:v5];
  v10 = [MEMORY[0x263F58190] futureWithResult:v9];

  return v10;
}

- (id)_augmentedStandardResultsForUpdateResponse:(id)a3 controlItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 standardResults];
  id v9 = (void *)[v8 mutableCopy];

  v10 = [(HFServiceItem *)self service];
  id v11 = objc_msgSend(v10, "hf_serviceNameComponents");

  if (v11)
  {
    [v9 setObject:v11 forKeyedSubscript:@"serviceNameComponents"];
    v12 = [v11 composedString];
    if (v12) {
      [v9 setObject:v12 forKeyedSubscript:@"title"];
    }
  }
  v13 = [(HFServiceItem *)self service];
  v14 = objc_msgSend(v13, "hf_parentRoom");

  v44 = v14;
  uint64_t v15 = [v14 uniqueIdentifier];
  if (v15) {
    [v9 setObject:v15 forKeyedSubscript:@"roomIdentifier"];
  }
  v43 = (void *)v15;
  [v9 setObject:v7 forKeyedSubscript:@"childItems"];
  v16 = [v6 displayMetadata];
  v17 = [v16 serviceState];

  if (v17)
  {
    v18 = objc_alloc_init(HFServiceStateDescriptionFormatter);
    v19 = [v9 objectForKeyedSubscript:@"description"];

    if (!v19)
    {
      id v20 = [(HFServiceStateDescriptionFormatter *)v18 stringForObjectValue:v17];
      objc_msgSend(v9, "na_safeSetObject:forKey:", v20, @"description");
    }
    [(HFServiceStateDescriptionFormatter *)v18 setDescriptionContext:1];
    v21 = [(HFServiceStateDescriptionFormatter *)v18 stringForObjectValue:v17];
    objc_msgSend(v9, "na_safeSetObject:forKey:", v21, @"controlDescription");
  }
  v22 = [v6 displayMetadata];
  uint64_t v23 = [v22 transitioningPrimaryState];

  if (v23)
  {
    [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isInStateTransition"];
  }
  else
  {
    v24 = [v6 displayMetadata];
    uint64_t v23 = [v24 primaryState];
  }
  v25 = [(HFServiceItem *)self service];
  objc_msgSend(v25, "hf_iconDescriptor");
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v45 = v7;
  if (objc_opt_isKindOfClass())
  {
    v27 = &HFCAPackageStateOn;
    if (v23 != 2) {
      v27 = &HFCAPackageStateOff;
    }
    v28 = *v27;
    v29 = [(HFServiceItem *)self service];
    v30 = +[HFServiceIconFactory iconModifiersForService:v29];

    v31 = [HFCAPackageIconDescriptor alloc];
    v32 = [(__CFString *)v26 identifier];
    uint64_t v33 = [(HFCAPackageIconDescriptor *)v31 initWithPackageIdentifier:v32 state:v28 modifiers:v30];

    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v34 = [(__CFString *)v26 iconDescriptorForPrimaryState:v23];
    if (v34)
    {
      v28 = v34;

      v26 = v28;
    }
    else
    {
      v28 = 0;
    }
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v35 = [HFPrimaryStateIconDescriptor alloc];
    v28 = [(__CFString *)v26 identifier];
    uint64_t v33 = [(HFPrimaryStateIconDescriptor *)v35 initWithIdentifier:v28 primaryState:v23];

LABEL_23:
    v26 = (__CFString *)v33;
LABEL_24:

    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(HFServiceItem *)self incrementalStateIconDescriptorForPrimaryState:v23 incrementalValue:0];
    v28 = v26;
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
LABEL_25:
  objc_msgSend(v9, "na_safeSetObject:forKey:", v26, @"icon");
  v36 = [(HFServiceItem *)self service];
  v37 = objc_msgSend(v36, "hf_dateAdded");
  objc_msgSend(v9, "na_safeSetObject:forKey:", v37, @"dateAdded");

  v38 = [(HFServiceItem *)self service];
  LODWORD(v37) = objc_msgSend(v38, "hf_hasSetFavorite");

  if (v37)
  {
    v39 = NSNumber;
    v40 = [(HFServiceItem *)self service];
    v41 = objc_msgSend(v39, "numberWithBool:", objc_msgSend(v40, "hf_isFavorite"));
    [v9 setObject:v41 forKeyedSubscript:@"isFavorite"];
  }
  return v9;
}

- (id)descriptionForCharacteristic:(id)a3 withValue:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x263F08878];
  uint64_t v15 = @"serviceType";
  id v7 = a4;
  id v8 = a3;
  id v9 = [(HFServiceItem *)self service];
  v10 = [v9 serviceType];
  v16[0] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v12 = objc_msgSend(v6, "hf_valueFormatterForCharacteristic:options:", v8, v11);

  v13 = [v12 stringForObjectValue:v7];

  return v13;
}

- (void)applyInflectionToDescriptions:(id)a3
{
  id v22 = a3;
  id v4 = [(HFServiceItem *)self service];
  v5 = objc_msgSend(v4, "hf_serviceNameComponents");
  id v6 = [v5 serviceName];

  id v7 = [v22 objectForKeyedSubscript:@"description"];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x263F086A0];
    id v9 = [v22 objectForKeyedSubscript:@"description"];
    v10 = objc_msgSend(v8, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:", v9, v6);
    id v11 = [v10 string];
    [v22 setObject:v11 forKeyedSubscript:@"description"];
  }
  v12 = [v22 objectForKeyedSubscript:@"controlDescription"];

  if (v12)
  {
    v13 = (void *)MEMORY[0x263F086A0];
    v14 = [v22 objectForKeyedSubscript:@"controlDescription"];
    uint64_t v15 = objc_msgSend(v13, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:", v14, v6);
    v16 = [v15 string];
    [v22 setObject:v16 forKeyedSubscript:@"controlDescription"];
  }
  v17 = [v22 objectForKeyedSubscript:@"detailedControlDescription"];

  if (v17)
  {
    v18 = (void *)MEMORY[0x263F086A0];
    v19 = [v22 objectForKeyedSubscript:@"detailedControlDescription"];
    id v20 = objc_msgSend(v18, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:", v19, v6);
    v21 = [v20 string];
    [v22 setObject:v21 forKeyedSubscript:@"detailedControlDescription"];
  }
}

BOOL __38__HFServiceItem__siriEndPointProfiles__block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "hf_siriEndpointProfile");
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)performStandardUpdateWithCharacteristicTypes:(id)a3 options:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263EFFA08];
  id v9 = a3;
  v10 = [v8 set];
  id v26 = v10;
  id v11 = [(HFServiceItem *)self characteristicsToReadWithCharacteristicTypes:v9 options:v7 controlItems:&v26];

  id v12 = v26;
  v13 = [HFServiceLikeItemUpdateRequest alloc];
  v14 = [(HFServiceItem *)self service];
  uint64_t v15 = [(HFServiceItem *)self valueSource];
  v16 = [(HFServiceLikeItemUpdateRequest *)v13 initWithService:v14 valueSource:v15 characteristics:v11];

  if (v16)
  {
    v17 = [(HFServiceLikeItemUpdateRequest *)v16 updateWithOptions:v7];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __70__HFServiceItem_performStandardUpdateWithCharacteristicTypes_options___block_invoke;
    v24[3] = &unk_26408F700;
    v24[4] = self;
    id v25 = v12;
    v18 = [v17 flatMap:v24];
  }
  else
  {
    v19 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v22 = NSStringFromSelector(a2);
      uint64_t v23 = [(HFServiceItem *)self service];
      *(_DWORD *)buf = 138412802;
      v28 = self;
      __int16 v29 = 2112;
      v30 = v22;
      __int16 v31 = 2112;
      v32 = v23;
      _os_log_error_impl(&dword_20B986000, v19, OS_LOG_TYPE_ERROR, "%@:%@ Failed to create HFServiceLikeItemUpdateRequest. Service: %@ ", buf, 0x20u);
    }
    id v20 = (void *)MEMORY[0x263F58190];
    v17 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    v18 = [v20 futureWithError:v17];
  }

  return v18;
}

- (id)controlItemValueSourceForPrimaryService
{
  BOOL v3 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  id v4 = [(HFServiceItem *)self valueSource];
  v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = [(HFServiceItem *)self service];
  id v7 = [v6 characteristics];
  id v8 = [v5 setWithArray:v7];
  id v9 = [(HFServiceItem *)self service];
  v10 = objc_msgSend(v9, "hf_serviceDescriptor");
  id v11 = [(HFSimpleAggregatedCharacteristicValueSource *)v3 initWithValueSource:v4 characteristics:v8 primaryServiceDescriptor:v10];

  return v11;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (id)characteristicsToReadWithCharacteristicTypes:(id)a3 options:(id)a4 controlItems:(id *)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [(HFServiceItem *)self createControlItemsWithOptions:v9];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __83__HFServiceItem_characteristicsToReadWithCharacteristicTypes_options_controlItems___block_invoke;
  v56[3] = &unk_26409C468;
  v56[4] = self;
  uint64_t v11 = objc_msgSend(v10, "na_filter:", v56);

  v47 = (void *)v11;
  v50 = [MEMORY[0x263EFF9C0] setWithSet:v11];
  v48 = self;
  id v12 = [(HFServiceItem *)self service];
  LODWORD(self) = [v12 isPrimaryService];

  if (!self) {
    goto LABEL_20;
  }
  v44 = a5;
  id v45 = v9;
  id v46 = v8;
  [(HFServiceItem *)v48 _siriEndPointProfiles];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (!v13) {
    goto LABEL_19;
  }
  uint64_t v14 = v13;
  uint64_t v15 = &selRef__handleTimeout_;
  uint64_t v51 = *(void *)v53;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v53 != v51) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      v18 = v15[69];
      v19 = [v17 mediaProfile];
      if ([v19 conformsToProtocol:v18]) {
        id v20 = v19;
      }
      else {
        id v20 = 0;
      }
      id v21 = v20;

      id v22 = objc_msgSend(v21, "hf_mediaValueSource");
      if (v22)
      {
        uint64_t v23 = [[HFMediaControlItem alloc] initWithValueSource:v22 mediaProfileContainer:v21 mediaAccessoryItemType:6 displayResults:0];
        [v50 addObject:v23];
        if (_os_feature_enabled_impl())
        {
          v24 = v15;
          id v25 = +[HFHomeKitDispatcher sharedDispatcher];
          id v26 = [(HFHomePodAlarmControlItem *)v25 home];
          if (![(HFHomePodTimerControlItem *)v26 hf_currentUserIsAdministrator])goto LABEL_15; {
          v27 = objc_msgSend(v17, "hf_siriEndpointProfile");
          }
          int v28 = [v27 supportsOnboarding];

          uint64_t v15 = v24;
          if (v28)
          {
            id v25 = [[HFHomePodAlarmControlItem alloc] initWithMediaProfileContainer:v21 displayResults:0];
            [v50 addObject:v25];
            id v26 = [[HFHomePodTimerControlItem alloc] initWithMediaProfileContainer:v21 displayResults:0];
            [v50 addObject:v26];
LABEL_15:

            uint64_t v15 = v24;
          }
        }
      }
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  }
  while (v14);
LABEL_19:

  id v9 = v45;
  id v8 = v46;
  a5 = v44;
LABEL_20:
  __int16 v29 = (void *)[v50 copy];

  v30 = [v9 objectForKeyedSubscript:HFItemUpdateOptionPreviousResults];
  __int16 v31 = [v30 objectForKeyedSubscript:@"childItems"];
  v32 = v31;
  if (v31)
  {
    id v33 = v31;
  }
  else
  {
    id v33 = [MEMORY[0x263EFFA08] set];
  }
  v34 = v33;

  objc_msgSend(v34, "na_setByDiffingWithSet:", v29);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  v35 = [(HFServiceItem *)v48 service];
  v36 = objc_msgSend(v35, "hf_serviceDescriptor");
  v37 = +[HFServiceState stateClassForServiceDescriptor:v36];

  if (v37)
  {
    v38 = [(objc_class *)v37 requiredCharacteristicTypes];
    v39 = [(objc_class *)v37 optionalCharacteristicTypes];
    v40 = [v38 setByAddingObjectsFromSet:v39];

    uint64_t v41 = [v8 setByAddingObjectsFromSet:v40];

    id v8 = (id)v41;
  }
  v42 = [(HFServiceItem *)v48 characteristicsToReadForCharacteristicTypes:v8 controlItems:*a5];

  return v42;
}

- (id)characteristicsToReadForCharacteristicTypes:(id)a3 controlItems:(id)a4
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke;
  v12[3] = &unk_26408CEC0;
  v12[4] = self;
  id v6 = a4;
  id v7 = objc_msgSend(a3, "na_flatMap:", v12);
  id v8 = (void *)[v7 mutableCopy];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_3;
  v11[3] = &unk_26409C440;
  v11[4] = self;
  id v9 = objc_msgSend(v6, "na_flatMap:", v11);

  [v8 unionSet:v9];
  return v8;
}

- (id)_siriEndPointProfiles
{
  v2 = [(HFServiceItem *)self accessories];
  BOOL v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_88_0);

  return v3;
}

- (id)accessories
{
  v2 = [(HFServiceItem *)self services];
  BOOL v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_85_1);

  return v3;
}

- (NSSet)services
{
  BOOL v3 = [(HFServiceItem *)self service];
  id v4 = (void *)MEMORY[0x263EFFA08];
  if (v3)
  {
    v5 = [(HFServiceItem *)self service];
    id v6 = [v4 setWithObject:v5];
  }
  else
  {
    id v6 = [MEMORY[0x263EFFA08] set];
  }

  return (NSSet *)v6;
}

- (NSString)description
{
  v2 = [(HFServiceItem *)self _descriptionBuilder];
  BOOL v3 = [v2 build];

  return (NSString *)v3;
}

- (id)_descriptionBuilder
{
  BOOL v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFServiceItem *)self service];
  v5 = objc_msgSend(v4, "hf_prettyDescription");
  id v6 = (id)[v3 appendObject:v5 withName:@"service"];

  id v7 = [(HFServiceItem *)self service];
  id v8 = objc_msgSend(v7, "hf_childServices");
  id v9 = [v8 allObjects];
  [v3 appendArraySection:v9 withName:@"childServices" skipIfEmpty:1 objectTransformer:&__block_literal_global_49_3];

  return v3;
}

uint64_t __83__HFServiceItem_characteristicsToReadWithCharacteristicTypes_options_controlItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _allRepresentedServices];
  uint64_t v5 = [v3 supportsItemRepresentingServices:v4];

  return v5;
}

id __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) servicesToReadForCharacteristicType:v3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_2;
  v8[3] = &unk_264091C28;
  id v9 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "na_map:", v8);

  return v6;
}

- (id)_allRepresentedServices
{
  id v3 = [(HFServiceItem *)self service];
  id v4 = objc_msgSend(v3, "hf_childServices");
  id v5 = [(HFServiceItem *)self service];
  id v6 = [v4 setByAddingObject:v5];

  return v6;
}

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "hf_homeKitObject");

  id v10 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v10;
    if (v11) {
      goto LABEL_8;
    }
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v13 handleFailureInFunction:v14, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  id v12 = 0;
LABEL_8:

  uint64_t v15 = [a1 serviceItemForService:v12 valueSource:v6];

  return v15;
}

+ (id)serviceItemForService:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "itemClassForService:", v7)), "initWithValueSource:service:", v6, v7);

  return v8;
}

+ (Class)itemClassForService:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _serviceTypeToServiceItemClassMap];
  id v5 = [v3 serviceType];

  id v6 = [v4 objectForKeyedSubscript:v5];

  return (Class)v6;
}

+ (NSDictionary)_serviceTypeToServiceItemClassMap
{
  if (qword_26AB2E718 != -1) {
    dispatch_once(&qword_26AB2E718, &__block_literal_global_228);
  }
  v2 = (void *)_MergedGlobals_3_3;
  return (NSDictionary *)v2;
}

- (HFServiceItem)initWithValueSource:(id)a3 service:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(HFServiceItem *)self isMemberOfClass:objc_opt_class()])
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"HFServiceItem.m" lineNumber:119 description:@"HFServiceItem is an abstract base class. It must be instantiated using +serviceItemForService:valueSource: or using one of its concrete subclasses directly."];
  }
  v18.receiver = self;
  v18.super_class = (Class)HFServiceItem;
  id v9 = [(HFServiceItem *)&v18 init];
  if (v9)
  {
    id v10 = [HFOverrideCharacteristicValueSource alloc];
    uint64_t v11 = [v8 home];
    id v12 = objc_msgSend(v11, "hf_suspendedStateOverrideValueProvider");
    uint64_t v13 = [(HFOverrideCharacteristicValueSource *)v10 initWithOriginalValueSource:v7 overrideValueProvider:v12];

    valueSource = v9->_valueSource;
    v9->_valueSource = (HFCharacteristicValueSource *)v13;
    uint64_t v15 = v13;

    objc_storeStrong((id *)&v9->_service, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
}

void __50__HFServiceItem__serviceTypeToServiceItemClassMap__block_invoke()
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v1 = [v0 URLForResource:@"HFServiceItems" withExtension:@"plist"];

  v2 = [MEMORY[0x263F08850] defaultManager];
  id v3 = [v1 path];
  int v4 = [v2 fileExistsAtPath:v3];

  id v5 = HFLogForCategory(0);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = (uint64_t)v1;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Loading HFServiceItems.plist at URL %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v51 = (uint64_t)v1;
    _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Error finding HFServiceItems.plist at URL %@", buf, 0xCu);
  }

  uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v1];
  id v8 = HFLogForCategory(0);
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = v7;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Loaded HFServiceItems.plist data %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v51 = 0;
    _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "Error loading HFServiceItems.plist data %@", buf, 0xCu);
  }

  id v47 = 0;
  uint64_t v48 = 200;
  id v10 = [MEMORY[0x263F08AC0] propertyListWithData:v7 options:0 format:&v48 error:&v47];
  id v11 = v47;
  if (v11)
  {
    id v12 = HFLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = (uint64_t)v11;
      _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "Error deserializing HFServiceItems.plist %@", buf, 0xCu);
    }
  }
  v39 = v1;
  objc_opt_class();
  id v13 = v10;
  if (objc_opt_isKindOfClass()) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;
  v37 = v13;

  objc_opt_class();
  v36 = v15;
  v16 = [v15 objectForKeyedSubscript:@"ServiceItems"];
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  uint64_t v19 = [v18 count];
  id v20 = HFLogForCategory(0);
  id v21 = v20;
  v38 = (void *)v7;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, "Read services from HFServiceItems.plist", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20B986000, v21, OS_LOG_TYPE_ERROR, "Error reading services from HFServiceItems.plist", buf, 2u);
  }

  id v22 = (void *)[v18 mutableCopy];
  [v22 addObject:@"HFTelevisionServiceItem"];
  [v22 addObject:@"HFInputSourceServiceItem"];
  v35 = v22;
  uint64_t v23 = (void *)[v22 copy];

  v24 = [MEMORY[0x263EFF9A0] dictionary];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v25 = v23;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(v25);
        }
        Class v30 = NSClassFromString(*(NSString **)(*((void *)&v43 + 1) + 8 * i));
        if ([(objc_class *)v30 isSubclassOfClass:objc_opt_class()]) {
          BOOL v31 = v30 == 0;
        }
        else {
          BOOL v31 = 1;
        }
        if (!v31)
        {
          v32 = [(objc_class *)v30 supportedServiceTypes];
          v40[0] = MEMORY[0x263EF8330];
          v40[1] = 3221225472;
          v40[2] = __50__HFServiceItem__serviceTypeToServiceItemClassMap__block_invoke_29;
          v40[3] = &unk_26409C3F8;
          id v41 = v24;
          Class v42 = v30;
          [v32 enumerateObjectsUsingBlock:v40];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v27);
  }

  uint64_t v33 = [v24 copy];
  v34 = (void *)_MergedGlobals_3_3;
  _MergedGlobals_3_3 = v33;
}

+ (NSSet)supportedServiceTypes
{
  int v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFServiceItem.m", 48, @"%s is an abstract method that must be overriden by subclass %@", "+[HFServiceItem supportedServiceTypes]", objc_opt_class() object file lineNumber description];

  id v5 = (void *)MEMORY[0x263EFFA08];
  return (NSSet *)[v5 set];
}

- (HFServiceItem)init
{
  int v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithValueSource_service_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFServiceItem.m", 131, @"%s is unavailable; use %@ instead",
    "-[HFServiceItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = [(HFServiceItem *)self valueSource];
  id v5 = [(HFServiceItem *)self copyWithValueSource:v4];

  return v5;
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(HFServiceItem *)self service];
  uint64_t v7 = (void *)[v5 initWithValueSource:v4 service:v6];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

uint64_t __36__HFServiceItem__descriptionBuilder__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_prettyDescription");
}

- (NSString)debugDescription
{
  id v3 = [(HFServiceItem *)self _descriptionBuilder];
  id v4 = [(HFItem *)self latestResults];
  [v3 appendDictionarySection:v4 withName:@"results:" skipIfEmpty:0];

  id v5 = [v3 build];

  return (NSString *)v5;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v3 = (void *)MEMORY[0x263F58190];
  id v4 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 36);
  id v5 = [v3 futureWithError:v4];

  return v5;
}

- (id)createControlItemsWithOptions:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "set", a3);
}

- (id)controlItemValueSourceForServices:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HFServiceItem.m", 195, @"Invalid parameter not satisfying: %@", @"services.count > 0" object file lineNumber description];
  }
  id v6 = [(HFServiceItem *)self _allRepresentedServices];
  char v7 = [v5 isSubsetOfSet:v6];

  if ((v7 & 1) == 0)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    v16 = objc_msgSend(v5, "hf_prettyDescription");
    [v15 handleFailureInMethod:a2, self, @"HFServiceItem.m", 196, @"An HFServiceItem can only create a value source for its main service (self.service) and its child services (self.service.hf_childServices). But the client requested a value source for some other services: %@", v16 object file lineNumber description];
  }
  id v8 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  id v9 = [(HFServiceItem *)self valueSource];
  id v10 = [(HFServiceItem *)self service];
  id v11 = objc_msgSend(v10, "hf_serviceDescriptor");
  id v12 = [(HFSimpleAggregatedCharacteristicValueSource *)v8 initWithValueSource:v9 services:v5 primaryServiceDescriptor:v11];

  return v12;
}

- (id)_actionableCharacteristics
{
  v9[1] = *MEMORY[0x263EF8340];
  id v8 = HFItemUpdateOptionDisableOptionalData;
  v9[0] = MEMORY[0x263EFFA88];
  id v3 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v4 = [(HFServiceItem *)self createControlItemsWithOptions:v3];

  id v5 = objc_msgSend(v4, "na_flatMap:", &__block_literal_global_67_3);
  id v6 = objc_msgSend(v5, "na_filter:", &__block_literal_global_73_0);

  return v6;
}

id __43__HFServiceItem__actionableCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 characteristicOptions];
  id v4 = [v3 objectForKeyedSubscript:&unk_26C0F7D58];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__HFServiceItem__actionableCharacteristics__block_invoke_69;
  v8[3] = &unk_26408CEC0;
  id v9 = v2;
  id v5 = v2;
  id v6 = objc_msgSend(v4, "na_flatMap:", v8);

  return v6;
}

id __43__HFServiceItem__actionableCharacteristics__block_invoke_69(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 valueSource];
  id v5 = [v4 allCharacteristicsForCharacteristicType:v3];

  return v5;
}

uint64_t __43__HFServiceItem__actionableCharacteristics__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_shouldCaptureInActionSets");
}

- (BOOL)containsActions
{
  id v2 = [(HFServiceItem *)self _actionableCharacteristics];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)actionsMayRequireDeviceUnlock
{
  id v2 = [(HFServiceItem *)self _actionableCharacteristics];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_75_1);

  return v3;
}

uint64_t __46__HFServiceItem_actionsMayRequireDeviceUnlock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 requiresDeviceUnlock];
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HFServiceItem *)self service];

  if (!v5) {
    NSLog(&cfstr_CanTFindServic.isa);
  }
  id v6 = [(HFServiceItem *)self service];

  if (v6)
  {
    char v7 = [(HFServiceItem *)self _actionableCharacteristics];
    id v8 = [(HFServiceItem *)self valueSource];
    id v9 = [v8 readValuesForCharacteristics:v7];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __51__HFServiceItem_currentStateActionBuildersForHome___block_invoke;
    v13[3] = &unk_26408DAE8;
    id v14 = v7;
    id v15 = v4;
    id v10 = v7;
    id v11 = [v9 flatMap:v13];
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    id v11 = [MEMORY[0x263F58190] futureWithError:v8];
  }

  return v11;
}

id __51__HFServiceItem_currentStateActionBuildersForHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v29 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v29)
  {
    uint64_t v27 = 0;
    uint64_t v28 = *(void *)v31;
    id v26 = v5;
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v5);
        }
        char v7 = *(void **)(*((void *)&v30 + 1) + 8 * v6);
        id v8 = objc_msgSend(v7, "characteristicType", v26);
        id v9 = [v3 responseForCharacteristicType:v8];
        id v10 = [v9 value];

        if (v10
          || ([v7 value], (id v10 = objc_claimAutoreleasedReturnValue()) != 0)
          || (objc_msgSend(v7, "hf_defaultValue"), (id v10 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v11 = [(HFItemBuilder *)[HFCharacteristicWriteActionBuilder alloc] initWithHome:*(void *)(a1 + 40)];
          [(HFCharacteristicWriteActionBuilder *)v11 setCharacteristic:v7];
          [(HFCharacteristicWriteActionBuilder *)v11 setTargetValue:v10];
          [v4 addObject:v11];
          id v12 = objc_msgSend(MEMORY[0x263F0E248], "hf_powerStateCharacteristicTypes");
          id v13 = [v7 characteristicType];
          if (![v12 containsObject:v13] || objc_msgSend(v10, "BOOLValue"))
          {

            goto LABEL_12;
          }
          uint64_t v14 = a1;
          id v15 = v4;
          id v16 = v3;
          v17 = [v7 service];
          int v18 = objc_msgSend(v17, "hf_isVisible");

          if (v18)
          {
            id v12 = v27;
            uint64_t v27 = v11;
            id v3 = v16;
            id v4 = v15;
            a1 = v14;
            id v5 = v26;
LABEL_12:
          }
          else
          {
            id v3 = v16;
            id v4 = v15;
            a1 = v14;
            id v5 = v26;
          }
        }
        ++v6;
      }
      while (v29 != v6);
      uint64_t v19 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v29 = v19;
      if (!v19) {
        goto LABEL_22;
      }
    }
  }
  uint64_t v27 = 0;
LABEL_22:

  id v20 = objc_opt_new();
  id v21 = v20;
  if (v27)
  {
    [v20 addObject:v27];
    id v22 = v4;
  }
  else
  {
    [v4 allObjects];
    uint64_t v23 = v22 = v4;
    [v21 addObjectsFromArray:v23];
  }
  v24 = [MEMORY[0x263F58190] futureWithResult:v21];

  return v24;
}

- (HMHome)home
{
  id v2 = [(HFServiceItem *)self service];
  id v3 = [v2 home];

  return (HMHome *)v3;
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4 = a3;
  id v5 = [HFServiceBuilder alloc];
  uint64_t v6 = [(HFServiceItem *)self homeKitObject];
  char v7 = [(HFServiceBuilder *)v5 initWithExistingObject:v6 inHome:v4];

  return v7;
}

- (id)namingComponentForHomeKitObject
{
  id v2 = [(HFServiceItem *)self service];
  id v3 = +[HFNamingComponents namingComponentFromService:v2];

  return v3;
}

id __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 valueSource];
  id v5 = +[HFServiceItem serviceItemForService:v3 valueSource:v4];

  return v5;
}

id __74__HFServiceItem_characteristicsToReadForCharacteristicTypes_controlItems___block_invoke_6(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = a2;
  id v4 = [v2 set];
  id v9 = HFItemUpdateOptionDisableOptionalData;
  v10[0] = MEMORY[0x263EFFA88];
  id v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v6 = [v3 createControlItemsWithOptions:v5];
  char v7 = [v3 characteristicsToReadForCharacteristicTypes:v4 controlItems:v6];

  return v7;
}

- (id)incrementalStateIconDescriptorForPrimaryState:(int64_t)a3 incrementalValue:(id)a4
{
  id v6 = a4;
  char v7 = [(HFServiceItem *)self service];
  id v8 = objc_msgSend(v7, "hf_iconDescriptor");

  id v9 = v6;
  id v10 = v9;
  if (a3 == 2)
  {
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = &unk_26C0F8088;
    }
  }
  else
  {

    id v11 = 0;
  }
  id v12 = [HFIncrementalStateIconDescriptor alloc];
  id v13 = [v8 identifier];
  uint64_t v14 = [(HFIncrementalStateIconDescriptor *)v12 initWithIdentifier:v13 incrementalState:v11];

  return v14;
}

@end