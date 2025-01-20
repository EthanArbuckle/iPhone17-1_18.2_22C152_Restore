@interface HFRoomItem
- (HFRoomItem)init;
- (HFRoomItem)initWithHome:(id)a3 room:(id)a4;
- (HMHome)home;
- (HMRoom)room;
- (NSString)description;
- (NSString)uuidString;
- (id)_reorderableListsForAccessoryTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)togglePowerState;
@end

@implementation HFRoomItem

- (HFRoomItem)initWithHome:(id)a3 room:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HFRoomItem;
  v9 = [(HFRoomItem *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_room, a4);
    v11 = [(HFRoomItem *)v10 room];
    v12 = [v11 uniqueIdentifier];
    uint64_t v13 = [v12 UUIDString];
    uuidString = v10->_uuidString;
    v10->_uuidString = (NSString *)v13;
  }
  return v10;
}

- (HFRoomItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HFRoomItem.m" lineNumber:47 description:@"Use -initWithHome:room:"];

  return 0;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HFRoomItem *)self room];
  id v7 = objc_msgSend(v6, "hf_prettyDescription");
  id v8 = [(HFItem *)self latestResults];
  v9 = [v3 stringWithFormat:@"<%@: %p, %@ %@>", v5, self, v7, v8];

  return (NSString *)v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = [(HFRoomItem *)self room];

  if (!v4) {
    NSLog(&cfstr_RoomMustBeSetO.isa);
  }
  v5 = [(HFRoomItem *)self room];

  v6 = (void *)MEMORY[0x263F58190];
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F58190]);
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
    v9 = [(HFRoomItem *)self room];
    v10 = [v9 name];
    [v8 setObject:v10 forKeyedSubscript:@"title"];

    v11 = [(HFRoomItem *)self room];
    v12 = [v11 uniqueIdentifier];
    [v8 setObject:v12 forKeyedSubscript:@"roomIdentifier"];

    uint64_t v13 = [(HFRoomItem *)self room];
    v14 = objc_msgSend(v13, "hf_reorderableServicesList");
    [v8 setObject:v14 forKeyedSubscript:@"reorderableServiceItemList"];

    v15 = [HFReorderableHomeKitItemList alloc];
    objc_super v16 = [(HFRoomItem *)self room];
    v17 = [(HFReorderableHomeKitItemList *)v15 initWithApplicationDataContainer:v16 category:@"roomActionSets"];
    [v8 setObject:v17 forKeyedSubscript:@"reorderableActionSetItemList"];

    v18 = [HFReorderableHomeKitItemList alloc];
    v19 = [(HFRoomItem *)self room];
    v20 = [(HFReorderableHomeKitItemList *)v18 initWithApplicationDataContainer:v19 category:@"roomCameras"];
    [v8 setObject:v20 forKeyedSubscript:@"reorderableCameraItemList"];

    v21 = [(HFRoomItem *)self _reorderableListsForAccessoryTypes];
    [v8 setObject:v21 forKeyedSubscript:@"reorderableServicesByTypeList"];

    v22 = NSNumber;
    v23 = [(HFRoomItem *)self room];
    v24 = [v23 home];
    v25 = objc_msgSend(v22, "numberWithBool:", objc_msgSend(v24, "hf_currentUserIsAdministrator"));
    [v8 setObject:v25 forKeyedSubscript:@"administrator"];

    v26 = [(HFRoomItem *)self room];
    v27 = [v26 name];
    [v8 setObject:v27 forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];

    v28 = +[HFItemUpdateOutcome outcomeWithResults:v8];
    [v7 finishWithResult:v28];
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    id v7 = [v6 futureWithError:v8];
  }

  return v7;
}

- (id)_reorderableListsForAccessoryTypes
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = +[HFAccessoryListUtilities sortedAccessoryTypeGroups];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) uniqueIdentifier];
        v10 = [v9 UUIDString];

        v11 = [@"roomServicesGroupedByType-" stringByAppendingString:v10];
        v12 = [HFReorderableHomeKitItemList alloc];
        uint64_t v13 = [(HFRoomItem *)self room];
        v14 = [(HFReorderableHomeKitItemList *)v12 initWithApplicationDataContainer:v13 category:v11];

        [v4 setValue:v14 forKey:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)togglePowerState
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  v3 = [(HFRoomItem *)self room];

  if (!v3) {
    NSLog(&cfstr_RoomMustBeSetO_0.isa);
  }
  id v4 = [(HFRoomItem *)self room];
  if (v4)
  {
    v32 = self;
    uint64_t v5 = [(HFRoomItem *)self home];
    uint64_t v6 = objc_msgSend(v5, "hf_characteristicValueManager");

    uint64_t v7 = [v4 accessories];
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __30__HFRoomItem_togglePowerState__block_invoke;
    v59[3] = &unk_26408D968;
    id v33 = v6;
    id v60 = v33;
    unsigned int v44 = objc_msgSend(v7, "na_all:", v59);

    id v34 = objc_alloc_init(MEMORY[0x263F58190]);
    id v8 = objc_alloc_init(HFCharacteristicValueSet);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v35 = v4;
    id obj = [v4 accessories];
    uint64_t v38 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v38)
    {
      uint64_t v37 = *(void *)v56;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v56 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v39 = v9;
          v10 = *(void **)(*((void *)&v55 + 1) + 8 * v9);
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id v40 = [v10 services];
          uint64_t v42 = [v40 countByEnumeratingWithState:&v51 objects:v62 count:16];
          if (v42)
          {
            uint64_t v41 = *(void *)v52;
            do
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v52 != v41) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v43 = v11;
                v12 = *(void **)(*((void *)&v51 + 1) + 8 * v11);
                long long v47 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                long long v50 = 0u;
                uint64_t v13 = [v12 characteristics];
                uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v61 count:16];
                if (v14)
                {
                  uint64_t v15 = v14;
                  uint64_t v16 = *(void *)v48;
                  do
                  {
                    for (uint64_t i = 0; i != v15; ++i)
                    {
                      if (*(void *)v48 != v16) {
                        objc_enumerationMutation(v13);
                      }
                      long long v18 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                      long long v19 = objc_msgSend(MEMORY[0x263F0E248], "hf_powerStateCharacteristicTypes");
                      long long v20 = [v18 characteristicType];
                      int v21 = [v19 containsObject:v20];

                      if (v21)
                      {
                        uint64_t v22 = [NSNumber numberWithBool:v44];
                        [(HFCharacteristicValueSet *)v8 setValue:v22 forCharacteristic:v18];
                      }
                    }
                    uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v61 count:16];
                  }
                  while (v15);
                }

                uint64_t v11 = v43 + 1;
              }
              while (v43 + 1 != v42);
              uint64_t v42 = [v40 countByEnumeratingWithState:&v51 objects:v62 count:16];
            }
            while (v42);
          }

          uint64_t v9 = v39 + 1;
        }
        while (v39 + 1 != v38);
        uint64_t v38 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
      }
      while (v38);
    }

    v23 = [(HFCharacteristicValueSet *)v8 allCharacteristics];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      v25 = [(HFRoomItem *)v32 home];
      v26 = objc_msgSend(v25, "hf_characteristicValueManager");

      [v26 beginTransactionWithReason:@"HFRoomItemTransactionReasonTogglePowerState"];
      v27 = [v26 writeValuesForCharacteristics:v8];
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __30__HFRoomItem_togglePowerState__block_invoke_4;
      v45[3] = &unk_26408E7F0;
      v28 = v34;
      id v46 = v34;
      id v29 = (id)[v27 addCompletionBlock:v45];

      [v26 commitTransactionWithReason:@"HFRoomItemTransactionReasonTogglePowerState"];
      v30 = v46;
    }
    else
    {
      v30 = NAEmptyResult();
      v28 = v34;
      [v34 finishWithResult:v30];
      v26 = v33;
    }

    id v4 = v35;
  }
  else
  {
    v28 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v28;
}

uint64_t __30__HFRoomItem_togglePowerState__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 services];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__HFRoomItem_togglePowerState__block_invoke_2;
  v6[3] = &unk_26408E0E8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_all:", v6);

  return v4;
}

uint64_t __30__HFRoomItem_togglePowerState__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 characteristics];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__HFRoomItem_togglePowerState__block_invoke_3;
  v6[3] = &unk_2640903A0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_all:", v6);

  return v4;
}

uint64_t __30__HFRoomItem_togglePowerState__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(MEMORY[0x263F0E248], "hf_powerStateCharacteristicTypes");
  uint64_t v5 = [v3 characteristicType];
  int v6 = [v4 containsObject:v5];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) cachedValueForCharacteristic:v3];
    id v8 = v7;
    if (v7) {
      uint64_t v9 = [v7 isEqual:MEMORY[0x263EFFA80]];
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t __30__HFRoomItem_togglePowerState__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (HMRoom)room
{
  return self->_room;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
}

@end