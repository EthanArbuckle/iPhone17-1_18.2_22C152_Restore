@interface HFCharacteristicGroup
+ (id)_currentTargetStateCharacteristicTypeMap;
+ (id)_targetCurrentStateCharacteristicGroups;
+ (id)_targetCurrentStateCharacteristicTypeMap;
+ (id)allCharacteristicGroups;
+ (id)characteristicGroupForCharacteristicType:(id)a3;
+ (id)characteristicGroupForIdentifier:(id)a3;
+ (id)groupedTitleForCharacteristicType:(id)a3;
- (HFCharacteristicGroup)init;
- (HFCharacteristicGroup)initWithID:(id)a3 title:(id)a4 characteristicTypes:(id)a5;
- (NSSet)characteristicTypes;
- (NSString)identifier;
- (NSString)title;
- (int64_t)groupSortPriority;
@end

@implementation HFCharacteristicGroup

+ (id)_targetCurrentStateCharacteristicTypeMap
{
  if (qword_26AB2FBF8 != -1) {
    dispatch_once(&qword_26AB2FBF8, &__block_literal_global_201);
  }
  v2 = (void *)_MergedGlobals_307;
  return v2;
}

void __65__HFCharacteristicGroup__targetCurrentStateCharacteristicTypeMap__block_invoke()
{
  v15[9] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0C110];
  uint64_t v1 = *MEMORY[0x263F0C4D8];
  v14[0] = *MEMORY[0x263F0C550];
  v14[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0C068];
  v15[0] = v0;
  v15[1] = v2;
  uint64_t v3 = *MEMORY[0x263F0C0E0];
  uint64_t v4 = *MEMORY[0x263F0C4A8];
  v14[2] = *MEMORY[0x263F0C530];
  v14[3] = v4;
  uint64_t v5 = *MEMORY[0x263F0C040];
  v15[2] = v3;
  v15[3] = v5;
  uint64_t v6 = *MEMORY[0x263F0C0B0];
  uint64_t v7 = *MEMORY[0x263F0C4E8];
  v14[4] = *MEMORY[0x263F0C510];
  v14[5] = v7;
  uint64_t v8 = *MEMORY[0x263F0C080];
  v15[4] = v6;
  v15[5] = v8;
  uint64_t v9 = *MEMORY[0x263F0C0D0];
  uint64_t v10 = *MEMORY[0x263F0C548];
  v14[6] = *MEMORY[0x263F0C520];
  v14[7] = v10;
  uint64_t v11 = *MEMORY[0x263F0C0E8];
  v15[6] = v9;
  v15[7] = v11;
  v14[8] = *MEMORY[0x263F0C568];
  v15[8] = *MEMORY[0x263F0C128];
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:9];
  v13 = (void *)_MergedGlobals_307;
  _MergedGlobals_307 = v12;
}

+ (id)_currentTargetStateCharacteristicTypeMap
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__HFCharacteristicGroup__currentTargetStateCharacteristicTypeMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26AB2FC08 != -1) {
    dispatch_once(&qword_26AB2FC08, block);
  }
  uint64_t v2 = (void *)qword_26AB2FC00;
  return v2;
}

void __65__HFCharacteristicGroup__currentTargetStateCharacteristicTypeMap__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [*(id *)(a1 + 32) _targetCurrentStateCharacteristicTypeMap];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__HFCharacteristicGroup__currentTargetStateCharacteristicTypeMap__block_invoke_2;
  v7[3] = &unk_26409A8B0;
  id v4 = v2;
  id v8 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  uint64_t v5 = (void *)qword_26AB2FC00;
  qword_26AB2FC00 = (uint64_t)v4;
  id v6 = v4;
}

uint64_t __65__HFCharacteristicGroup__currentTargetStateCharacteristicTypeMap__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

+ (id)_targetCurrentStateCharacteristicGroups
{
  if (qword_26AB2FC18 != -1) {
    dispatch_once(&qword_26AB2FC18, &__block_literal_global_4_14);
  }
  uint64_t v2 = (void *)qword_26AB2FC10;
  return v2;
}

void __64__HFCharacteristicGroup__targetCurrentStateCharacteristicGroups__block_invoke()
{
  v13[9] = *MEMORY[0x263EF8340];
  uint64_t v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v0 = HFNewTargetCurrentGroup(@"DoorState", @"HFCharacteristicGroupTitleDoorState", (void *)*MEMORY[0x263F0C4A8]);
  v13[0] = v0;
  uint64_t v1 = HFNewTargetCurrentGroup(@"HeatingCooling", @"HFCharacteristicGroupTitleHeatingCooling", (void *)*MEMORY[0x263F0C4D8]);
  v13[1] = v1;
  uint64_t v2 = HFNewTargetCurrentGroup(@"LockMechanismState", @"HFCharacteristicGroupTitleLockMechanismState", (void *)*MEMORY[0x263F0C510]);
  v13[2] = v2;
  uint64_t v3 = HFNewTargetCurrentGroup(@"HorizontalTilt", @"HFCharacteristicGroupTitleHorizontalTilt", (void *)*MEMORY[0x263F0C4E8]);
  v13[3] = v3;
  id v4 = HFNewTargetCurrentGroup(@"Position", @"HFCharacteristicGroupTitlePosition", (void *)*MEMORY[0x263F0C520]);
  v13[4] = v4;
  uint64_t v5 = HFNewTargetCurrentGroup(@"RelativeHumidity", @"HFCharacteristicGroupTitleRelativeHumidity", (void *)*MEMORY[0x263F0C530]);
  v13[5] = v5;
  id v6 = HFNewTargetCurrentGroup(@"SecuritySystemState", @"HFCharacteristicGroupTitleSecuritySystemState", (void *)*MEMORY[0x263F0C548]);
  v13[6] = v6;
  uint64_t v7 = HFNewTargetCurrentGroup(@"Temperature", @"HFCharacteristicGroupTitleTemperature", (void *)*MEMORY[0x263F0C550]);
  v13[7] = v7;
  id v8 = HFNewTargetCurrentGroup(@"VerticalTilt", @"HFCharacteristicGroupTitleVerticalTilt", (void *)*MEMORY[0x263F0C568]);
  v13[8] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:9];
  uint64_t v10 = [v12 setWithArray:v9];
  uint64_t v11 = (void *)qword_26AB2FC10;
  qword_26AB2FC10 = v10;
}

+ (id)allCharacteristicGroups
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__HFCharacteristicGroup_allCharacteristicGroups__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26AB2FC28 != -1) {
    dispatch_once(&qword_26AB2FC28, block);
  }
  uint64_t v2 = (void *)qword_26AB2FC20;
  return v2;
}

void __48__HFCharacteristicGroup_allCharacteristicGroups__block_invoke(uint64_t a1)
{
  v63[7] = *MEMORY[0x263EF8340];
  v54 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0BF18];
  v62[0] = *MEMORY[0x263F0BF40];
  v62[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0C2F0];
  v62[2] = *MEMORY[0x263F0BF30];
  v62[3] = v2;
  uint64_t v3 = *MEMORY[0x263F0C448];
  v62[4] = *MEMORY[0x263F0C2B0];
  v62[5] = v3;
  uint64_t v4 = *MEMORY[0x263F0C300];
  v62[6] = *MEMORY[0x263F0C318];
  v62[7] = v4;
  v62[8] = *MEMORY[0x263F0C598];
  id v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:9];
  uint64_t v5 = [HFCharacteristicGroup alloc];
  id v6 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicGroupTitleAirQuality", @"HFCharacteristicGroupTitleAirQuality", 1);
  uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:v53];

  v52 = [(HFCharacteristicGroup *)v5 initWithID:@"AirQuality" title:v6 characteristicTypes:v7];
  v63[0] = v52;
  uint64_t v8 = *MEMORY[0x263F0BFC0];
  v61[0] = *MEMORY[0x263F0BFB0];
  v61[1] = v8;
  v61[2] = *MEMORY[0x263F0BFD0];
  id v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:3];
  uint64_t v9 = [HFCharacteristicGroup alloc];
  uint64_t v10 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicGroupTitleCarbonMonoxide", @"HFCharacteristicGroupTitleCarbonMonoxide", 1);
  uint64_t v11 = [MEMORY[0x263EFFA08] setWithArray:v51];

  v50 = [(HFCharacteristicGroup *)v9 initWithID:@"CarbonMonoxide" title:v10 characteristicTypes:v11];
  v63[1] = v50;
  uint64_t v12 = *MEMORY[0x263F0BF90];
  v60[0] = *MEMORY[0x263F0BF80];
  v60[1] = v12;
  v60[2] = *MEMORY[0x263F0BFA0];
  id v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:3];
  v13 = [HFCharacteristicGroup alloc];
  v14 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicGroupTitleCarbonDioxide", @"HFCharacteristicGroupTitleCarbonDioxide", 1);
  v15 = [MEMORY[0x263EFFA08] setWithArray:v49];

  v48 = [(HFCharacteristicGroup *)v13 initWithID:@"CarbonDioxide" title:v14 characteristicTypes:v15];
  v63[2] = v48;
  uint64_t v16 = *MEMORY[0x263F0BF58];
  v59[0] = *MEMORY[0x263F0C430];
  v59[1] = v16;
  uint64_t v17 = *MEMORY[0x263F0C408];
  v59[2] = *MEMORY[0x263F0BFE8];
  v59[3] = v17;
  uint64_t v18 = *MEMORY[0x263F0C438];
  v59[4] = *MEMORY[0x263F0C418];
  v59[5] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:6];
  v20 = [HFCharacteristicGroup alloc];
  v21 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicGroupTitleSensorStatus", @"HFCharacteristicGroupTitleSensorStatus", 1);
  v22 = [MEMORY[0x263EFFA08] setWithArray:v19];

  v47 = [(HFCharacteristicGroup *)v20 initWithID:@"SensorStatus" title:v21 characteristicTypes:v22];
  v63[3] = v47;
  uint64_t v23 = *MEMORY[0x263F0C178];
  v58[0] = *MEMORY[0x263F0C168];
  v58[1] = v23;
  id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:2];
  v25 = [HFCharacteristicGroup alloc];
  v26 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicGroupTitleFilterStatus", @"HFCharacteristicGroupTitleFilterStatus", 1);
  v27 = [MEMORY[0x263EFFA08] setWithArray:v24];

  v28 = [(HFCharacteristicGroup *)v25 initWithID:@"FilterStatus" title:v26 characteristicTypes:v27];
  v63[4] = v28;
  uint64_t v57 = *MEMORY[0x263F0C218];
  id v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
  v30 = [HFCharacteristicGroup alloc];
  v31 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicGroupTitleIsConfigured", @"HFCharacteristicGroupTitleIsConfigured", 1);
  v32 = [MEMORY[0x263EFFA08] setWithArray:v29];

  v33 = [(HFCharacteristicGroup *)v30 initWithID:@"ConfiguredValve" title:v31 characteristicTypes:v32];
  v63[5] = v33;
  uint64_t v34 = *MEMORY[0x263F0C350];
  v56[0] = *MEMORY[0x263F0C3D0];
  v56[1] = v34;
  id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
  v36 = [HFCharacteristicGroup alloc];
  v37 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicGroupTitleSetDuration", @"HFCharacteristicGroupTitleSetDuration", 1);
  v38 = [MEMORY[0x263EFFA08] setWithArray:v35];

  v39 = [(HFCharacteristicGroup *)v36 initWithID:@"Duration" title:v37 characteristicTypes:v38];
  v63[6] = v39;
  v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:7];
  uint64_t v41 = [v54 setWithArray:v40];
  v42 = (void *)qword_26AB2FC20;
  qword_26AB2FC20 = v41;

  v43 = (void *)qword_26AB2FC20;
  v44 = [*(id *)(a1 + 32) _targetCurrentStateCharacteristicGroups];
  uint64_t v45 = [v43 setByAddingObjectsFromSet:v44];
  v46 = (void *)qword_26AB2FC20;
  qword_26AB2FC20 = v45;
}

+ (id)groupedTitleForCharacteristicType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _currentTargetStateCharacteristicTypeMap];
  id v6 = [v5 allKeys];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    uint64_t v8 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicStateGroupedCurrentTitle", @"HFCharacteristicStateGroupedCurrentTitle", 1);
  }
  else
  {
    if (qword_26AB2FC38 != -1) {
      dispatch_once(&qword_26AB2FC38, &__block_literal_global_105_1);
    }
    uint64_t v9 = [(id)qword_26AB2FC30 objectForKeyedSubscript:v4];
    uint64_t v10 = v9;
    if (v9)
    {
      uint64_t v8 = _HFLocalizedStringWithDefaultValue(v9, v9, 1);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  return v8;
}

void __59__HFCharacteristicGroup_groupedTitleForCharacteristicType___block_invoke()
{
  v10[14] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0BF80];
  v9[0] = *MEMORY[0x263F0BF58];
  v9[1] = v0;
  v10[0] = @"HFCharacteristicStateGroupedTitleBatteryLevel";
  v10[1] = @"HFCharacteristicStateGroupedTitleCarbonDioxideDetected";
  uint64_t v1 = *MEMORY[0x263F0BFA0];
  v9[2] = *MEMORY[0x263F0BF90];
  v9[3] = v1;
  v10[2] = @"HFCharacteristicStateGroupedTitleCarbonDioxideLevel";
  v10[3] = @"HFCharacteristicStateGroupedTitleCarbonDioxidePeakLevel";
  uint64_t v2 = *MEMORY[0x263F0BFC0];
  v9[4] = *MEMORY[0x263F0BFB0];
  v9[5] = v2;
  v10[4] = @"HFCharacteristicStateGroupedTitleCarbonMonoxideDetected";
  v10[5] = @"HFCharacteristicStateGroupedTitleCarbonMonoxideLevel";
  uint64_t v3 = *MEMORY[0x263F0BFE8];
  v9[6] = *MEMORY[0x263F0BFD0];
  v9[7] = v3;
  v10[6] = @"HFCharacteristicStateGroupedTitleCarbonMonoxidePeakLevel";
  v10[7] = @"HFCharacteristicStateGroupedTitleBatteryCharging";
  uint64_t v4 = *MEMORY[0x263F0C418];
  v9[8] = *MEMORY[0x263F0C408];
  v9[9] = v4;
  v10[8] = @"HFCharacteristicStateGroupedTitleStatusActive";
  v10[9] = @"HFCharacteristicStateGroupedTitleStatusFault";
  uint64_t v5 = *MEMORY[0x263F0C438];
  v9[10] = *MEMORY[0x263F0C430];
  v9[11] = v5;
  v10[10] = @"HFCharacteristicStateGroupedTitleStatusLowBattery";
  v10[11] = @"HFCharacteristicStateGroupedTitleStatusTampered";
  uint64_t v6 = *MEMORY[0x263F0C178];
  v9[12] = *MEMORY[0x263F0C168];
  v9[13] = v6;
  v10[12] = @"HFCharacteristicStateGroupedTitleFilterCondition";
  v10[13] = @"HFCharacteristicStateGroupedTitleFilterLife";
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:14];
  uint64_t v8 = (void *)qword_26AB2FC30;
  qword_26AB2FC30 = v7;
}

+ (id)characteristicGroupForCharacteristicType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 allCharacteristicGroups];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__HFCharacteristicGroup_characteristicGroupForCharacteristicType___block_invoke;
  v9[3] = &unk_26409A8D8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __66__HFCharacteristicGroup_characteristicGroupForCharacteristicType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 characteristicTypes];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

+ (id)characteristicGroupForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 allCharacteristicGroups];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__HFCharacteristicGroup_characteristicGroupForIdentifier___block_invoke;
  v9[3] = &unk_26409A8D8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __58__HFCharacteristicGroup_characteristicGroupForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (HFCharacteristicGroup)initWithID:(id)a3 title:(id)a4 characteristicTypes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFCharacteristicGroup;
  uint64_t v12 = [(HFCharacteristicGroup *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_title, a4);
    objc_storeStrong((id *)&v13->_characteristicTypes, a5);
  }

  return v13;
}

- (HFCharacteristicGroup)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = NSStringFromSelector(sel_initWithID_title_characteristicTypes_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFCharacteristicGroup.m", 221, @"%s is unavailable; use %@ instead",
    "-[HFCharacteristicGroup init]",
    v5);

  return 0;
}

- (int64_t)groupSortPriority
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(HFCharacteristicGroup *)self characteristicTypes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    int64_t v6 = -1000;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = objc_msgSend(MEMORY[0x263F0E248], "hf_sortPriorityForCharacteristicType:", *(void *)(*((void *)&v10 + 1) + 8 * i));
        if (v6 <= v8) {
          int64_t v6 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v6 = -1000;
  }

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSSet)characteristicTypes
{
  return self->_characteristicTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicTypes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end