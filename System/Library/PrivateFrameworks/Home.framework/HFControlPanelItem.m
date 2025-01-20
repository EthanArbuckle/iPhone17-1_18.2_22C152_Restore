@interface HFControlPanelItem
+ (NAIdentity)na_identity;
+ (id)_controlPanelItemRules;
+ (id)standardControlPanelItemsForControlItems:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HFControlPanelItem)init;
- (HFControlPanelItem)initWithControlItems:(id)a3 displayResults:(id)a4;
- (NSDictionary)UUIDsByControlItemPointer;
- (NSDictionary)controlItemsByUUID;
- (NSDictionary)displayResults;
- (NSSet)controlItems;
- (NSString)uniqueIdentifier;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)controlItemForIdentifier:(id)a3;
- (id)identifierForControlItem:(id)a3;
- (int64_t)sortPriority;
- (unint64_t)hash;
@end

@implementation HFControlPanelItem

- (HFControlPanelItem)initWithControlItems:(id)a3 displayResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HFControlPanelItem;
  v8 = [(HFControlPanelItem *)&v27 init];
  if (v8)
  {
    v9 = [MEMORY[0x263F08C38] UUID];
    uint64_t v10 = [v9 UUIDString];
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v10;

    uint64_t v12 = [v7 copy];
    v13 = (void *)v12;
    if (v12) {
      v14 = (void *)v12;
    }
    else {
      v14 = (void *)MEMORY[0x263EFFA78];
    }
    objc_storeStrong((id *)&v8->_displayResults, v14);

    uint64_t v15 = [v6 copy];
    controlItems = v8->_controlItems;
    v8->_controlItems = (NSSet *)v15;

    v17 = [v6 allObjects];
    uint64_t v18 = objc_msgSend(v17, "na_dictionaryWithKeyGenerator:", &__block_literal_global_92);
    controlItemsByUUID = v8->_controlItemsByUUID;
    v8->_controlItemsByUUID = (NSDictionary *)v18;

    v20 = [(NSDictionary *)v8->_controlItemsByUUID allKeys];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __58__HFControlPanelItem_initWithControlItems_displayResults___block_invoke_2;
    v25[3] = &unk_2640946B0;
    v21 = v8;
    v26 = v21;
    uint64_t v22 = objc_msgSend(v20, "na_dictionaryWithKeyGenerator:", v25);
    UUIDsByControlItemPointer = v21->_UUIDsByControlItemPointer;
    v21->_UUIDsByControlItemPointer = (NSDictionary *)v22;
  }
  return v8;
}

id __58__HFControlPanelItem_initWithControlItems_displayResults___block_invoke()
{
  v0 = [MEMORY[0x263F08C38] UUID];
  v1 = [v0 UUIDString];

  return v1;
}

id __58__HFControlPanelItem_initWithControlItems_displayResults___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = (void *)MEMORY[0x263F08D40];
  v3 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:a2];
  v4 = [v2 valueWithPointer:v3];

  return v4;
}

- (HFControlPanelItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithControlItems_displayResults_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFControlPanelItem.m", 48, @"%s is unavailable; use %@ instead",
    "-[HFControlPanelItem init]",
    v5);

  return 0;
}

- (id)identifierForControlItem:(id)a3
{
  id v4 = a3;
  v5 = [(HFControlPanelItem *)self UUIDsByControlItemPointer];
  id v6 = [MEMORY[0x263F08D40] valueWithPointer:v4];

  id v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (id)controlItemForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(HFControlPanelItem *)self controlItemsByUUID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = [(HFControlPanelItem *)self displayResults];
  v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x263EFFA78];
  }
  id v6 = (void *)[v4 mutableCopy];

  id v7 = [(HFControlPanelItem *)self controlItems];
  [v6 setObject:v7 forKeyedSubscript:@"childItems"];

  v8 = (void *)MEMORY[0x263F58190];
  v9 = +[HFItemUpdateOutcome outcomeWithResults:v6];
  uint64_t v10 = [v8 futureWithResult:v9];

  return v10;
}

+ (NAIdentity)na_identity
{
  if (qword_26AB2E738 != -1) {
    dispatch_once(&qword_26AB2E738, &__block_literal_global_14_4);
  }
  v2 = (void *)_MergedGlobals_1_0;
  return (NAIdentity *)v2;
}

void __33__HFControlPanelItem_na_identity__block_invoke()
{
  id v4 = [MEMORY[0x263F58198] builder];
  id v0 = (id)[v4 appendCharacteristic:&__block_literal_global_18_1 withRole:3 comparatorBlock:0 hashBlock:&__block_literal_global_21_1];
  id v1 = (id)[v4 appendCharacteristic:&__block_literal_global_25_4 withRole:3 comparatorBlock:0 hashBlock:&__block_literal_global_27_4];
  uint64_t v2 = [v4 build];
  v3 = (void *)_MergedGlobals_1_0;
  _MergedGlobals_1_0 = v2;
}

uint64_t __33__HFControlPanelItem_na_identity__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 controlItems];
}

uint64_t __33__HFControlPanelItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (!v4) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v4;
  if (!v5)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];

LABEL_7:
    id v6 = 0;
  }

  uint64_t v9 = [v6 computeHashFromContents];
  return v9;
}

uint64_t __33__HFControlPanelItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 displayResults];
}

uint64_t __33__HFControlPanelItem_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (!v4) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v4;
  if (!v5)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];

LABEL_7:
    id v6 = 0;
  }

  uint64_t v9 = [v6 computeHashFromContents];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (int64_t)sortPriority
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(HFControlPanelItem *)self controlItems];
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
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) sortPriority];
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

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSSet)controlItems
{
  return self->_controlItems;
}

- (NSDictionary)displayResults
{
  return self->_displayResults;
}

- (NSDictionary)controlItemsByUUID
{
  return self->_controlItemsByUUID;
}

- (NSDictionary)UUIDsByControlItemPointer
{
  return self->_UUIDsByControlItemPointer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUIDsByControlItemPointer, 0);
  objc_storeStrong((id *)&self->_controlItemsByUUID, 0);
  objc_storeStrong((id *)&self->_displayResults, 0);
  objc_storeStrong((id *)&self->_controlItems, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

+ (id)_controlPanelItemRules
{
  if (qword_26AB2F858 != -1) {
    dispatch_once(&qword_26AB2F858, &__block_literal_global_148);
  }
  id v2 = (void *)_MergedGlobals_283;
  return v2;
}

void __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke()
{
  v13[11] = *MEMORY[0x263EF8340];
  long long v12 = [[HFControlPanelItemSingleControlRule alloc] initWithFilter:&__block_literal_global_66_4 displayResultsGenerator:&__block_literal_global_71_1];
  v13[0] = v12;
  id v0 = [[HFControlPanelItemSingleControlRule alloc] initWithFilter:&__block_literal_global_76_2 displayResultsGenerator:&__block_literal_global_78];
  v13[1] = v0;
  id v1 = [[HFControlPanelItemSingleControlRule alloc] initWithFilter:&__block_literal_global_83_1 displayResultsGenerator:&__block_literal_global_85];
  v13[2] = v1;
  id v2 = [[HFControlPanelItemSingleControlRule alloc] initWithFilter:&__block_literal_global_90_0 displayResultsGenerator:&__block_literal_global_92_0];
  v13[3] = v2;
  uint64_t v3 = [[HFControlPanelItemSingleControlRule alloc] initWithFilter:&__block_literal_global_97_2 displayResultsGenerator:&__block_literal_global_100_2];
  v13[4] = v3;
  uint64_t v4 = [[HFControlPanelItemSingleControlRule alloc] initWithFilter:&__block_literal_global_105_0 displayResultsGenerator:&__block_literal_global_108_0];
  v13[5] = v4;
  uint64_t v5 = [[HFControlPanelItemSingleControlRule alloc] initWithFilter:&__block_literal_global_113_1 displayResultsGenerator:&__block_literal_global_115_0];
  v13[6] = v5;
  int64_t v6 = [[HFControlPanelItemSingleControlRule alloc] initWithFilter:&__block_literal_global_120_1 displayResultsGenerator:&__block_literal_global_122_1];
  v13[7] = v6;
  id v7 = [[HFControlPanelItemSingleControlRule alloc] initWithFilter:&__block_literal_global_127_2 displayResultsGenerator:&__block_literal_global_129_0];
  v13[8] = v7;
  uint64_t v8 = [[HFControlPanelItemSingleControlRule alloc] initWithFilter:&__block_literal_global_134_0 displayResultsGenerator:&__block_literal_global_136];
  v13[9] = v8;
  uint64_t v9 = [[HFControlPanelItemSingleControlRule alloc] initWithFilter:&__block_literal_global_151_0 displayResultsGenerator:&__block_literal_global_153_1];
  v13[10] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:11];
  long long v11 = (void *)_MergedGlobals_283;
  _MergedGlobals_283 = v10;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristicOptions];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26C0F6F00];
  uint64_t v4 = [v3 containsObject:*MEMORY[0x263F0C530]];

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_68()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"title";
  id v0 = _HFLocalizedStringWithDefaultValue(@"HFServiceThermostatHumidityTitle", @"HFServiceThermostatHumidityTitle", 1);
  v4[0] = v0;
  id v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_2_74(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristicOptions];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26C0F6F00];
  uint64_t v4 = [v3 containsObject:*MEMORY[0x263F0C578]];

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_3()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"title";
  id v0 = _HFLocalizedStringWithDefaultValue(@"HFServiceThermostatDisplayUnitsTitle", @"HFServiceThermostatDisplayUnitsTitle", 1);
  v4[0] = v0;
  id v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristicOptions];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26C0F6F00];
  uint64_t v4 = [v3 containsObject:*MEMORY[0x263F0C4E8]];

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_5()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"title";
  id v0 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicGroupTitleHorizontalTilt", @"HFCharacteristicGroupTitleHorizontalTilt", 1);
  v4[0] = v0;
  id v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristicOptions];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26C0F6F00];
  uint64_t v4 = [v3 containsObject:*MEMORY[0x263F0C568]];

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_7()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"title";
  id v0 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicGroupTitleVerticalTilt", @"HFCharacteristicGroupTitleVerticalTilt", 1);
  v4[0] = v0;
  id v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 characteristicOptions];
    uint64_t v4 = [v3 objectForKeyedSubscript:&unk_26C0F6F00];
    uint64_t v5 = [v4 containsObject:*MEMORY[0x263F0C4B8]];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_9()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"title";
  id v0 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicGroupTitleFanMode", @"HFCharacteristicGroupTitleFanMode", 1);
  v4[0] = v0;
  id v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 characteristicOptions];
    uint64_t v4 = [v3 objectForKeyedSubscript:&unk_26C0F6F00];
    uint64_t v5 = [v4 containsObject:*MEMORY[0x263F0C378]];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_11()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"title";
  id v0 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicGroupTitleFanSpeed", @"HFCharacteristicGroupTitleFanSpeed", 1);
  v4[0] = v0;
  id v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristicOptions];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26C0F6F00];
  uint64_t v4 = [v3 containsObject:*MEMORY[0x263F0C488]];

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_13()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"title";
  id v0 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicGroupTitleSwingMode", @"HFCharacteristicGroupTitleSwingMode", 1);
  v4[0] = v0;
  id v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristicOptions];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26C0F6F00];
  uint64_t v4 = [v3 containsObject:*MEMORY[0x263F0C260]];

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_15()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"title";
  id v0 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicGroupTitleLockPhysicalControls", @"HFCharacteristicGroupTitleLockPhysicalControls", 1);
  v4[0] = v0;
  id v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristicOptions];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26C0F6F00];
  uint64_t v4 = [v3 containsObject:*MEMORY[0x263F0C498]];

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_17()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"title";
  id v0 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicGroupTitleAirPurifierState", @"HFCharacteristicGroupTitleAirPurifierState", 1);
  v4[0] = v0;
  id v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristicOptions];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26C0F6F00];
  uint64_t v4 = [v3 containsObject:*MEMORY[0x263F0C218]];

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_19(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263EFF9A0];
  id v3 = a2;
  uint64_t v4 = [v2 dictionaryWithCapacity:1];
  uint64_t v5 = [v3 valueSource];

  int64_t v6 = [v5 primaryServiceDescriptor];
  id v7 = [v6 serviceSubtype];

  if ([v7 isEqualToString:*MEMORY[0x263F0D5C0]])
  {
    uint64_t v8 = @"HFCharacteristicGroupTitleIsConfiguredIrrigation";
  }
  else if ([v7 isEqualToString:*MEMORY[0x263F0D5D8]])
  {
    uint64_t v8 = @"HFCharacteristicGroupTitleIsConfiguredShowerHead";
  }
  else if ([v7 isEqualToString:*MEMORY[0x263F0D5F0]])
  {
    uint64_t v8 = @"HFCharacteristicGroupTitleIsConfiguredFaucet";
  }
  else
  {
    if (![v7 isEqualToString:*MEMORY[0x263F0D5B8]]) {
      goto LABEL_10;
    }
    uint64_t v8 = @"HFCharacteristicGroupTitleIsConfiguredGeneric";
  }
  uint64_t v9 = _HFLocalizedStringWithDefaultValue(v8, v8, 1);
  [v4 setObject:v9 forKeyedSubscript:@"title"];

LABEL_10:
  return v4;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristicOptions];
  id v3 = [v2 objectForKeyedSubscript:&unk_26C0F6F00];
  uint64_t v4 = [v3 containsObject:*MEMORY[0x263F0C3D0]];

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_21()
{
  v4[1] = *MEMORY[0x263EF8340];
  id v3 = @"title";
  id v0 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicGroupTitleSetDuration", @"HFCharacteristicGroupTitleSetDuration", 1);
  v4[0] = v0;
  id v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

+ (id)standardControlPanelItemsForControlItems:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(a3, "na_filter:", &__block_literal_global_159);
  uint64_t v4 = [MEMORY[0x263EFF9C0] set];
  uint64_t v5 = (void *)[v3 mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int64_t v6 = objc_msgSend((id)objc_opt_class(), "_controlPanelItemRules", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = 0;
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        do
        {
          long long v13 = v11;
          long long v11 = [v12 controlPanelItemForControlItems:v5];

          if (!v11) {
            break;
          }
          [v4 addObject:v11];
          v14 = [v11 controlItems];
          [v5 minusSet:v14];
        }
        while ([v5 count]);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v4;
}

BOOL __75__HFControlPanelItem_Generating__standardControlPanelItemsForControlItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"controlItemPurpose"];

  if (v3) {
    BOOL v4 = ([v3 integerValue] & 6) == 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

@end