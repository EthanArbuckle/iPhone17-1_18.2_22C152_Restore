@interface HFStatusItem
+ (id)_associatedServiceTypeToServiceTypeMap;
+ (id)_criticalServiceTypes;
+ (id)_serviceTypeToAssociatedServiceTypesMap;
+ (id)characteristicTypesForServiceType:(id)a3 includingAssociatedTypes:(BOOL)a4;
- (BOOL)_shouldForceVisibleForService:(id)a3;
- (BOOL)canRepresentAbnormalAndNormalHomeKitObjectsTogether;
- (BOOL)canScheduleInvalidation;
- (BOOL)isInvalidationPending;
- (BOOL)isTransitioning;
- (BOOL)needsInvalidation;
- (BOOL)supportsInvalidation;
- (HFCharacteristicValueSource)valueSource;
- (HFStatusItem)init;
- (HFStatusItem)initWithHome:(id)a3 room:(id)a4;
- (HFStatusItem)initWithHome:(id)a3 room:(id)a4 valueSource:(id)a5;
- (HFStatusItemUpdate)statusItemUpdate;
- (HMHome)home;
- (HMRoom)room;
- (NSDate)invalidationDate;
- (double)invalidationTimeout;
- (id)_filteredServicesOfTypes:(id)a3 containingCharacteristicTypes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3;
- (id)displayNameForHomeKitObject:(id)a3;
- (id)filteredServices;
- (id)filteredServicesOfTypes:(id)a3;
- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3;
- (id)itemUpdateFromLatestResults;
- (id)shortTitleForFormat:(id)a3;
- (id)standardResultsForBatchReadResponse:(id)a3 serviceTypes:(id)a4;
- (void)_updateInvalidationDate;
- (void)scheduleInvalidation;
- (void)setInvalidationDate:(id)a3;
- (void)setNeedsInvalidation:(BOOL)a3;
- (void)setStatusItemUpdate:(id)a3;
@end

@implementation HFStatusItem

uint64_t __71__HFStatusItem__filteredServicesOfTypes_containingCharacteristicTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 associatedServiceType];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 serviceType];
  }
  v7 = v6;

  v8 = *(void **)(a1 + 32);
  if (v8 && ![v8 containsObject:v7]) {
    goto LABEL_14;
  }
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71__HFStatusItem__filteredServicesOfTypes_containingCharacteristicTypes___block_invoke_2;
    v19[3] = &unk_26408D210;
    id v20 = v3;
    int v10 = objc_msgSend(v9, "na_any:", v19);

    if (!v10)
    {
LABEL_14:
      uint64_t v14 = 0;
      goto LABEL_15;
    }
  }
  if (*(void *)(a1 + 32) && (objc_msgSend(v3, "hf_supportsHomeStatus") & 1) == 0)
  {
    v16 = *(void **)(a1 + 32);
    v17 = [v3 serviceType];
    uint64_t v14 = [v16 containsObject:v17];

    if (!v14) {
      goto LABEL_15;
    }
    v18 = objc_msgSend(v3, "hf_prettyDescription");
    NSLog(&cfstr_AttemptingToEx_0.isa, v18);
    uint64_t v14 = 0;
LABEL_19:

    goto LABEL_15;
  }
  v11 = [(id)objc_opt_class() _criticalServiceTypes];
  v12 = [v3 serviceType];
  char v13 = [v11 containsObject:v12];

  if ((v13 & 1) == 0
    && objc_msgSend(v3, "hf_hasSetVisibleInHomeStatus")
    && (objc_msgSend(v3, "hf_isVisibleInHomeStatus") & 1) == 0)
  {
    v18 = [*(id *)(a1 + 48) room];
    uint64_t v14 = v18 != 0;
    goto LABEL_19;
  }
  uint64_t v14 = 1;
LABEL_15:

  return v14;
}

+ (id)_criticalServiceTypes
{
  if (_MergedGlobals_7 != -1) {
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_27_11);
  }
  v2 = (void *)qword_26AB2EA88;
  return v2;
}

uint64_t __75__HFStatusItem_characteristicTypesForServiceType_includingAssociatedTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x263F0E708], "hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:", a2);
}

uint64_t __65__HFStatusItem_standardResultsForBatchReadResponse_serviceTypes___block_invoke(uint64_t a1, void *a2)
{
  id v21 = a2;
  if ((objc_msgSend(v21, "hf_isChildService") & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) batchResponseForService:v21 includeChildServices:1];
    if ([*(id *)(a1 + 40) _shouldForceVisibleForService:v21]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    if (!v3) {
      goto LABEL_32;
    }
    v4 = +[HFCharacteristicValueDisplayMetadata displayMetadataForService:v21 characteristicReadResponse:v3];
    v5 = [v4 error];

    if (v5)
    {
LABEL_31:

LABEL_32:
      goto LABEL_33;
    }
    if (![v4 primaryState]) {
      goto LABEL_22;
    }
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v6 == 1)
    {
      if ([v4 primaryState] == 2)
      {
LABEL_12:
        uint64_t v7 = 2;
LABEL_17:
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;
        if ([v4 primaryState] == 1)
        {
          uint64_t v9 = *(void *)(a1 + 64);
        }
        else
        {
          if ([v4 primaryState] != 2) {
            goto LABEL_22;
          }
          uint64_t v9 = *(void *)(a1 + 72);
        }
        [*(id *)(*(void *)(v9 + 8) + 40) addObject:v21];
LABEL_22:
        if ([v4 transitioningPrimaryState])
        {
          uint64_t v10 = [v4 transitioningPrimaryState];
          if (v10 != [v4 primaryState]) {
            [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObject:v21];
          }
        }
        uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
        uint64_t v12 = [v4 priority];
        if (v11 <= v12) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = v11;
        }
        *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v13;
        uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
        if (!v14
          || ([v4 sortKey],
              v15 = objc_claimAutoreleasedReturnValue(),
              uint64_t v16 = [v14 localizedStandardCompare:v15],
              v15,
              v16 == 1))
        {
          uint64_t v17 = [v4 sortKey];
          uint64_t v18 = *(void *)(*(void *)(a1 + 96) + 8);
          v19 = *(void **)(v18 + 40);
          *(void *)(v18 + 40) = v17;
        }
        goto LABEL_31;
      }
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
    if (v6 == 2)
    {
      if ([v4 primaryState] == 1) {
        goto LABEL_12;
      }
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
    uint64_t v8 = [v4 primaryState];
    if (v6 <= v8) {
      uint64_t v7 = v8;
    }
    else {
      uint64_t v7 = v6;
    }
    goto LABEL_17;
  }
LABEL_33:
  return MEMORY[0x270F9A758]();
}

- (BOOL)_shouldForceVisibleForService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFStatusItem *)self room];
  if (v5 && (uint64_t v6 = (void *)v5, v7 = objc_msgSend(v4, "hf_isSensorService"), v6, (v7 & 1) != 0)
    || ([v4 serviceType],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isEqual:*MEMORY[0x263F0D7D8]],
        v8,
        (v9 & 1) != 0))
  {
    char v10 = 1;
  }
  else if (objc_msgSend(v4, "hf_isSensorService"))
  {
    uint64_t v11 = [v4 accessory];
    if (objc_msgSend(v11, "hf_isHomePod"))
    {
      uint64_t v12 = [v4 serviceType];
      if ([v12 isEqual:*MEMORY[0x263F0D730]])
      {
        char v10 = 1;
      }
      else
      {
        uint64_t v13 = [v4 serviceType];
        char v10 = [v13 isEqual:*MEMORY[0x263F0D858]];
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)_filteredServicesOfTypes:(id)a3 containingCharacteristicTypes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    char v9 = [MEMORY[0x263EFFA08] setWithArray:v7];
    char v10 = objc_msgSend(MEMORY[0x263F0E708], "hf_standardServiceTypes");
    char v11 = [v9 isSubsetOfSet:v10];

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"HFStatusItem.m", 279, @"Asked to filter services to include unsupported types: %@", v7 object file lineNumber description];
    }
  }
  uint64_t v13 = [(HFStatusItem *)self room];
  if (v13) {
    [(HFStatusItem *)self room];
  }
  else {
  uint64_t v14 = [(HFStatusItem *)self home];
  }
  v15 = objc_msgSend(v14, "hf_allVisibleServices");

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __71__HFStatusItem__filteredServicesOfTypes_containingCharacteristicTypes___block_invoke;
  v20[3] = &unk_2640999D8;
  id v21 = v7;
  id v22 = v8;
  v23 = self;
  id v16 = v8;
  id v17 = v7;
  uint64_t v18 = objc_msgSend(v15, "na_filter:", v20);

  return v18;
}

- (HMHome)home
{
  return self->_home;
}

- (HMRoom)room
{
  return self->_room;
}

id __65__HFStatusItem_standardResultsForBatchReadResponse_serviceTypes___block_invoke_75(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)objc_opt_class() _associatedServiceTypeToServiceTypeMap];
  id v4 = [v3 objectForKey:v2];

  uint64_t v5 = [MEMORY[0x263EFFA08] setWithArray:v4];

  return v5;
}

+ (id)characteristicTypesForServiceType:(id)a3 includingAssociatedTypes:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(MEMORY[0x263F0E708], "hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:", v6);
  id v8 = v7;
  if (a4)
  {
    char v9 = [a1 _associatedServiceTypeToServiceTypeMap];
    char v10 = [v9 objectForKey:v6];

    if (v10)
    {
      char v11 = [MEMORY[0x263EFFA08] setWithArray:v10];
      uint64_t v12 = objc_msgSend(v11, "na_flatMap:", &__block_literal_global_44_1);

      id v13 = [v8 setByAddingObjectsFromSet:v12];
    }
    else
    {
      id v13 = v8;
    }
  }
  else
  {
    id v13 = v7;
  }

  return v13;
}

+ (id)_associatedServiceTypeToServiceTypeMap
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  id v2 = __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke((uint64_t)v4);
  return v2;
}

id __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (qword_26AB2EAA0 != -1) {
    dispatch_once(&qword_26AB2EAA0, block);
  }
  v1 = (void *)qword_26AB2EAA8;
  return v1;
}

BOOL __71__HFStatusItem__filteredServicesOfTypes_containingCharacteristicTypes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "hf_characteristicOfType:", a2);
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)filteredServicesOfTypes:(id)a3
{
  return [(HFStatusItem *)self _filteredServicesOfTypes:a3 containingCharacteristicTypes:0];
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (HFStatusItem)initWithHome:(id)a3 room:(id)a4 valueSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFStatusItem;
  uint64_t v12 = [(HFStatusItem *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_room, a4);
    objc_storeStrong((id *)&v13->_home, a3);
    objc_storeStrong((id *)&v13->_valueSource, a5);
  }

  return v13;
}

void __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_5;
  v7[3] = &unk_264099920;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  objc_msgSend(a3, "na_each:", v7);
}

- (id)standardResultsForBatchReadResponse:(id)a3 serviceTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  uint64_t v80 = -1;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__22;
  v75 = __Block_byref_object_dispose__22;
  id v76 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__22;
  v69 = __Block_byref_object_dispose__22;
  id v70 = [MEMORY[0x263EFF9C0] set];
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__22;
  v63 = __Block_byref_object_dispose__22;
  id v64 = [MEMORY[0x263EFF9C0] set];
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__22;
  v57 = __Block_byref_object_dispose__22;
  id v58 = [MEMORY[0x263EFF9C0] set];
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  if ([(HFStatusItem *)self isInvalidationPending])
  {
    id v8 = [(HFItem *)self latestResults];
    id v9 = [v8 objectForKeyedSubscript:@"priority"];

    if (v9)
    {
      uint64_t v10 = (int)[v9 intValue];
      id v11 = v78;
    }
    else
    {
      id v11 = v78;
      uint64_t v10 = v78[3];
    }
    v11[3] = v10;
  }
  uint64_t v12 = [v6 allServices];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __65__HFStatusItem_standardResultsForBatchReadResponse_serviceTypes___block_invoke;
  v39[3] = &unk_264099A00;
  id v37 = v6;
  id v40 = v37;
  v41 = self;
  v42 = &v49;
  v43 = &v81;
  v44 = &v65;
  v45 = &v59;
  v46 = &v53;
  v47 = &v77;
  v48 = &v71;
  objc_msgSend(v12, "na_each:", v39);

  id v13 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v14 = v13;
  if (*((unsigned char *)v50 + 24)
    || (!v82[3] || v78[3] < 0)
    && ([v13 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"], *((unsigned char *)v50 + 24)))
  {
    id v15 = [v37 allServices];
    goto LABEL_8;
  }
  if (![(HFStatusItem *)self canRepresentAbnormalAndNormalHomeKitObjectsTogether])
  {
    if ([(id)v60[5] count] || objc_msgSend((id)v54[5], "count"))
    {
      id v15 = [(id)v60[5] setByAddingObjectsFromSet:v54[5]];
    }
    else
    {
      if ([(HFStatusItem *)self isInvalidationPending])
      {
        v25 = [(HFItem *)self latestResults];
        uint64_t v26 = [v25 objectForKeyedSubscript:@"representedHomeKitObjects"];
        goto LABEL_23;
      }
      id v15 = (id)v66[5];
    }
LABEL_8:
    id v16 = v15;
    goto LABEL_9;
  }
  v25 = [(id)v66[5] setByAddingObjectsFromSet:v60[5]];
  uint64_t v26 = [v25 setByAddingObjectsFromSet:v54[5]];
LABEL_23:
  id v16 = (void *)v26;

LABEL_9:
  [v14 setObject:v16 forKeyedSubscript:@"representedHomeKitObjects"];
  [v14 setObject:&unk_26C0F77B8 forKeyedSubscript:@"statusItemCategory"];
  if ([v16 count])
  {
    id v17 = [(HFStatusItem *)self defaultTitleForRepresentedHomeKitObjects:v16];
    [v14 setObject:v17 forKeyedSubscript:@"title"];
  }
  if ([(id)v60[5] isEqualToSet:v54[5]])
  {
    uint64_t v18 = &unk_26C0F77D0;
LABEL_13:
    [v14 setObject:v18 forKeyedSubscript:@"transitioningState"];
    goto LABEL_15;
  }
  if (![(id)v60[5] count] && objc_msgSend((id)v54[5], "count"))
  {
    uint64_t v18 = &unk_26C0F77E8;
    goto LABEL_13;
  }
LABEL_15:
  v19 = [(HFStatusItem *)self iconDescriptorForRepresentedHomeKitObjects:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v7;
    id v21 = [v19 packageIdentifier];
    id v22 = [v14 objectForKeyedSubscript:@"transitioningState"];
    if (v22)
    {
      v23 = [v14 objectForKeyedSubscript:@"transitioningState"];
      uint64_t v24 = [v23 integerValue];
    }
    else
    {
      uint64_t v24 = v82[3];
    }

    v27 = [HFCAPackageIconDescriptor alloc];
    v28 = &HFCAPackageStateOn;
    if (v24 != 2) {
      v28 = &HFCAPackageStateOff;
    }
    v29 = *v28;
    uint64_t v30 = [(HFCAPackageIconDescriptor *)v27 initWithPackageIdentifier:v21 state:v29];

    v19 = (void *)v30;
    id v7 = v20;
  }
  [v14 setObject:v19 forKeyedSubscript:@"icon"];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __65__HFStatusItem_standardResultsForBatchReadResponse_serviceTypes___block_invoke_75;
  v38[3] = &unk_26408CEC0;
  v38[4] = self;
  v31 = objc_msgSend(v7, "na_flatMap:", v38);
  v32 = [v7 setByAddingObjectsFromSet:v31];

  v33 = [NSNumber numberWithInteger:v82[3]];
  [v14 setObject:v33 forKeyedSubscript:@"state"];

  v34 = [NSNumber numberWithInteger:v78[3]];
  [v14 setObject:v34 forKeyedSubscript:@"priority"];

  [v14 setObject:v72[5] forKeyedSubscript:@"sortKey"];
  v35 = [v37 allCharacteristics];
  [v14 setObject:v35 forKeyedSubscript:@"dependentHomeKitObjects"];

  [v14 setObject:v32 forKeyedSubscript:@"dependentServiceTypes"];
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);

  return v14;
}

- (BOOL)isInvalidationPending
{
  BOOL v3 = [(HFStatusItem *)self supportsInvalidation];
  if (v3)
  {
    LOBYTE(v3) = [(HFStatusItem *)self needsInvalidation];
  }
  return v3;
}

- (BOOL)supportsInvalidation
{
  return 0;
}

- (BOOL)canRepresentAbnormalAndNormalHomeKitObjectsTogether
{
  return 0;
}

- (BOOL)needsInvalidation
{
  return self->_needsInvalidation;
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [MEMORY[0x263EFF9C0] set];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__HFStatusItem_iconDescriptorForRepresentedHomeKitObjects___block_invoke;
    v12[3] = &unk_2640999B0;
    id v6 = v5;
    id v13 = v6;
    id v7 = objc_msgSend(v4, "na_map:", v12);
    if ([v7 count] == 1)
    {
      id v8 = [v7 anyObject];
      id v9 = v7;
    }
    else
    {
      id v9 = objc_msgSend(v6, "na_map:", &__block_literal_global_57_1);

      id v8 = [v9 anyObject];
      if ((unint64_t)[v9 count] >= 2)
      {
        uint64_t v10 = HFLogForCategory(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          id v15 = self;
          __int16 v16 = 2112;
          id v17 = v9;
          __int16 v18 = 2112;
          id v19 = v6;
          __int16 v20 = 2112;
          id v21 = v8;
          _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "%@ Invalid number of icon descriptors: %@ for service types: %@. Defaulting to %@.", buf, 0x2Au);
        }
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)displayNameForHomeKitObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_4:
    objc_msgSend(v4, "hf_serviceNameComponents");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    id v6 = [(HFStatusItem *)self room];
    if (v6) {
      [v5 serviceName];
    }
    else {
    id v7 = [v5 composedString];
    }

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSLog(&cfstr_UnhandledHomek.isa, self, v4);
      id v5 = 0;
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  id v5 = v4;
  id v9 = objc_msgSend(v5, "hf_linkedAccessory");
  uint64_t v10 = objc_msgSend(v9, "hf_serviceNameComponents");

  if (v10)
  {

    id v5 = (id)v10;
    goto LABEL_5;
  }
  id v7 = objc_msgSend(v5, "hf_displayName");
LABEL_9:

  return v7;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return 0;
}

id __59__HFStatusItem_iconDescriptorForRepresentedHomeKitObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 associatedServiceType];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [v4 serviceType];
    }
    id v9 = v7;

    [*(id *)(a1 + 32) addObject:v9];
    id v8 = objc_msgSend(v4, "hf_iconDescriptor");
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = +[HFServiceIconFactory iconDescriptorForAccessory:v3];
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

void __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = (void *)v5;
  id v7 = (void *)MEMORY[0x263EFFA68];
  if (v5) {
    id v7 = (void *)v5;
  }
  id v8 = v7;

  id v9 = [v8 arrayByAddingObject:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v4];
}

- (id)filteredServices
{
  return [(HFStatusItem *)self _filteredServicesOfTypes:0 containingCharacteristicTypes:0];
}

void __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_3;
  v3[3] = &__block_descriptor_40_e26___NSMutableDictionary_8__0l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_3((uint64_t)v3);
  id v2 = (void *)qword_26AB2EAA8;
  qword_26AB2EAA8 = v1;
}

id __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _serviceTypeToAssociatedServiceTypesMap];
  id v2 = [MEMORY[0x263EFF9A0] dictionary];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_4;
  v5[3] = &unk_264099948;
  id v3 = v2;
  id v6 = v3;
  [v1 enumerateKeysAndObjectsUsingBlock:v5];

  return v3;
}

+ (id)_serviceTypeToAssociatedServiceTypesMap
{
  if (qword_26AB2EA90 != -1) {
    dispatch_once(&qword_26AB2EA90, &__block_literal_global_32_5);
  }
  id v2 = (void *)qword_26AB2EA98;
  return v2;
}

void __37__HFStatusItem__criticalServiceTypes__block_invoke_2()
{
  objc_msgSend(MEMORY[0x263F0E708], "hf_alarmSensorServiceTypes");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 setByAddingObject:*MEMORY[0x263F0D7D8]];
  uint64_t v1 = (void *)qword_26AB2EA88;
  qword_26AB2EA88 = v0;
}

void __55__HFStatusItem__serviceTypeToAssociatedServiceTypesMap__block_invoke_2()
{
  v13[3] = *MEMORY[0x263EF8340];
  v12[0] = *MEMORY[0x263F0D698];
  uint64_t v0 = *MEMORY[0x263F0D6F8];
  v11[0] = *MEMORY[0x263F0D6A8];
  v11[1] = v0;
  uint64_t v1 = *MEMORY[0x263F0D8B8];
  v11[2] = *MEMORY[0x263F0D8A8];
  v11[3] = v1;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];
  v13[0] = v2;
  v12[1] = *MEMORY[0x263F0D7D0];
  uint64_t v4 = *MEMORY[0x263F0D780];
  v10[0] = *MEMORY[0x263F0D6C8];
  uint64_t v3 = v10[0];
  v10[1] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  v13[1] = v5;
  v12[2] = *MEMORY[0x263F0D828];
  v9[0] = v3;
  v9[1] = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  v13[2] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  id v8 = (void *)qword_26AB2EA98;
  qword_26AB2EA98 = v7;
}

- (HFStatusItem)initWithHome:(id)a3 room:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(v7, "hf_characteristicValueManager");
  id v9 = [(HFStatusItem *)self initWithHome:v7 room:v6 valueSource:v8];

  return v9;
}

- (HFStatusItem)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = NSStringFromSelector(sel_initWithHome_room_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFStatusItem.m", 58, @"%s is unavailable; use %@ instead",
    "-[HFStatusItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(HFStatusItem *)self home];
  id v6 = [(HFStatusItem *)self room];
  id v7 = [(HFStatusItem *)self valueSource];
  id v8 = (void *)[v4 initWithHome:v5 room:v6 valueSource:v7];

  id v9 = [(HFStatusItem *)self invalidationDate];
  [v8 setInvalidationDate:v9];

  [v8 copyLatestResultsFromItem:self];
  return v8;
}

id __59__HFStatusItem_iconDescriptorForRepresentedHomeKitObjects___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HFServiceIconFactory defaultIconDescriptorForServiceType:a2 serviceSubtype:0];
}

- (double)invalidationTimeout
{
  return 8.0;
}

- (id)itemUpdateFromLatestResults
{
  uint64_t v3 = [(HFItem *)self latestResults];
  id v4 = [v3 objectForKeyedSubscript:@"title"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"description"];
  id v6 = [v3 objectForKeyedSubscript:@"icon"];
  id v7 = [(HFStatusItem *)self statusItemUpdate];

  if (v7)
  {
    id v8 = [(HFStatusItem *)self statusItemUpdate];
    [v8 setTitle:v4];

    id v9 = [(HFStatusItem *)self statusItemUpdate];
    [v9 setSecondaryText:v5];

    uint64_t v10 = [(HFStatusItem *)self statusItemUpdate];
    [(HFStatusItemUpdate *)v10 setIconDescriptor:v6];
  }
  else
  {
    uint64_t v10 = [[HFStatusItemUpdate alloc] initWithTitle:v4 secondaryText:v5 iconDescriptor:v6];
    [(HFStatusItem *)self setStatusItemUpdate:v10];
  }

  id v11 = [v3 objectForKeyedSubscript:@"statusCurrentValue"];
  uint64_t v12 = [(HFStatusItem *)self statusItemUpdate];
  [v12 setCurrentValue:v11];

  id v13 = [v3 objectForKeyedSubscript:@"statusPossibleValues"];
  uint64_t v14 = [(HFStatusItem *)self statusItemUpdate];
  [v14 setPossibleValues:v13];

  id v15 = [(HFStatusItem *)self statusItemUpdate];

  return v15;
}

- (BOOL)isTransitioning
{
  uint64_t v3 = [(HFItem *)self latestResults];
  id v4 = [v3 objectForKeyedSubscript:@"state"];
  uint64_t v5 = [v4 integerValue];

  id v6 = [(HFItem *)self latestResults];
  id v7 = [v6 objectForKeyedSubscript:@"transitioningState"];
  uint64_t v8 = [v7 integerValue];

  if (v8) {
    BOOL v9 = v5 == v8;
  }
  else {
    BOOL v9 = 1;
  }
  return !v9;
}

- (BOOL)canScheduleInvalidation
{
  if ([(HFStatusItem *)self supportsInvalidation])
  {
    uint64_t v3 = [(HFItem *)self latestResults];
    id v4 = [v3 objectForKeyedSubscript:@"state"];
    if ([v4 integerValue] == 1) {
      BOOL v5 = ![(HFStatusItem *)self isTransitioning];
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setNeedsInvalidation:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(HFStatusItem *)self supportsInvalidation]) {
    NSLog(&cfstr_AskedToUpdateN.isa);
  }
  if ([(HFStatusItem *)self supportsInvalidation] && self->_needsInvalidation != v3)
  {
    self->_needsInvalidation = v3;
    [(HFStatusItem *)self _updateInvalidationDate];
  }
}

- (void)scheduleInvalidation
{
  if (![(HFStatusItem *)self supportsInvalidation]) {
    NSLog(&cfstr_AskedToSchedul.isa);
  }
  [(HFStatusItem *)self _updateInvalidationDate];
}

- (void)_updateInvalidationDate
{
  if ([(HFStatusItem *)self needsInvalidation]
    && [(HFStatusItem *)self canScheduleInvalidation])
  {
    BOOL v3 = (void *)MEMORY[0x263EFF910];
    [(HFStatusItem *)self invalidationTimeout];
    objc_msgSend(v3, "dateWithTimeIntervalSinceNow:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(HFStatusItem *)self setInvalidationDate:v4];
  }
  else if (![(HFStatusItem *)self needsInvalidation])
  {
    [(HFStatusItem *)self setInvalidationDate:0];
  }
}

- (id)shortTitleForFormat:(id)a3
{
  id v3 = a3;
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"%@" withString:&stru_26C081158];
  BOOL v5 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  if ([v3 hasSuffix:v6])
  {
    if ([v3 isEqual:v6]) {
      id v7 = 0;
    }
    else {
      id v7 = v6;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (NSDate)invalidationDate
{
  return self->_invalidationDate;
}

- (void)setInvalidationDate:(id)a3
{
}

- (HFStatusItemUpdate)statusItemUpdate
{
  return self->_statusItemUpdate;
}

- (void)setStatusItemUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusItemUpdate, 0);
  objc_storeStrong((id *)&self->_invalidationDate, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_room, 0);
}

@end