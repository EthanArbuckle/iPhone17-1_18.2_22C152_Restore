@interface HFPowerStateControlItem
+ (Class)valueClass;
+ (id)_powerStateTargetValues;
+ (id)na_identity;
- (BOOL)canCopyWithCharacteristicOptions:(id)a3;
- (BOOL)supportsItemRepresentingServices:(id)a3;
- (HFPowerStateControlItem)initWithValueSource:(id)a3 auxiliaryTargetValueTuples:(id)a4 additionalCharacteristicOptions:(id)a5 displayResults:(id)a6;
- (HFPowerStateControlItem)initWithValueSource:(id)a3 auxiliaryTargetValueTuples:(id)a4 displayResults:(id)a5;
- (HFPowerStateControlItem)initWithValueSource:(id)a3 characteristicTypes:(id)a4 displayResults:(id)a5;
- (HFPowerStateControlItem)initWithValueSource:(id)a3 displayResults:(id)a4;
- (NSSet)allTargetValues;
- (NSSet)auxiliaryTargetValueTuples;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)readValueAndPopulateStandardResults;
- (id)toggleValue;
- (id)valueForCharacteristicValues:(id)a3;
- (id)writePrimaryState:(int64_t)a3;
@end

@implementation HFPowerStateControlItem

uint64_t __38__HFPowerStateControlItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 auxiliaryTargetValueTuples];
}

uint64_t __121__HFPowerStateControlItem_initWithValueSource_auxiliaryTargetValueTuples_additionalCharacteristicOptions_displayResults___block_invoke(uint64_t a1, void *a2)
{
  return [a2 characteristicType];
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)readValueAndPopulateStandardResults
{
  v5.receiver = self;
  v5.super_class = (Class)HFPowerStateControlItem;
  v2 = [(HFControlItem *)&v5 readValueAndPopulateStandardResults];
  v3 = [v2 flatMap:&__block_literal_global_115];

  return v3;
}

+ (id)na_identity
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__HFPowerStateControlItem_na_identity__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __38__HFPowerStateControlItem_na_identity__block_invoke((uint64_t)v4);
  return v2;
}

id __38__HFPowerStateControlItem_na_identity__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HFPowerStateControlItem_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (qword_2676B6A00 != -1) {
    dispatch_once(&qword_2676B6A00, block);
  }
  v1 = (void *)qword_2676B6A08;
  return v1;
}

BOOL __121__HFPowerStateControlItem_initWithValueSource_auxiliaryTargetValueTuples_additionalCharacteristicOptions_displayResults___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) allCharacteristicsForCharacteristicType:a2];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

uint64_t __38__HFPowerStateControlItem_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (!v4) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    objc_super v5 = v4;
  }
  else {
    objc_super v5 = 0;
  }
  v6 = v4;
  if (!v5)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];

LABEL_7:
    v6 = 0;
  }

  uint64_t v9 = [v6 computeHashFromContents];
  return v9;
}

uint64_t __60__HFPowerStateControlItem_supportsItemRepresentingServices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "_powerStateTargetValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) characteristicType];
        v8 = objc_msgSend(v2, "hf_characteristicOfType:", v7);

        if (v8)
        {
          uint64_t v4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

BOOL __56__HFPowerStateControlItem_valueForCharacteristicValues___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 characteristicType];
  v6 = [v4 objectForKeyedSubscript:v5];
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v3 primaryStateForTargetValue:v8];
  return v9 == 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allTargetValues, 0);
  objc_storeStrong((id *)&self->_auxiliaryTargetValueTuples, 0);
}

- (HFPowerStateControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 set];
  long long v10 = [(HFPowerStateControlItem *)self initWithValueSource:v8 auxiliaryTargetValueTuples:v9 displayResults:v7];

  return v10;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)objc_opt_class());
  id v7 = [(HFPowerStateControlItem *)self auxiliaryTargetValueTuples];
  id v8 = [(HFControlItem *)self displayResults];
  uint64_t v9 = (void *)[v6 initWithValueSource:v5 auxiliaryTargetValueTuples:v7 displayResults:v8];

  [v9 copyLatestResultsFromItem:self];
  return v9;
}

- (NSSet)auxiliaryTargetValueTuples
{
  return self->_auxiliaryTargetValueTuples;
}

- (HFPowerStateControlItem)initWithValueSource:(id)a3 auxiliaryTargetValueTuples:(id)a4 displayResults:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = objc_alloc_init(HFControlItemCharacteristicOptions);
  long long v12 = [(HFPowerStateControlItem *)self initWithValueSource:v10 auxiliaryTargetValueTuples:v9 additionalCharacteristicOptions:v11 displayResults:v8];

  return v12;
}

- (HFPowerStateControlItem)initWithValueSource:(id)a3 auxiliaryTargetValueTuples:(id)a4 additionalCharacteristicOptions:(id)a5 displayResults:(id)a6
{
  v30[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  v14 = [(id)objc_opt_class() _powerStateTargetValues];
  uint64_t v15 = [v14 setByAddingObjectsFromSet:v11];
  allTargetValues = self->_allTargetValues;
  self->_allTargetValues = v15;

  v17 = [(NSSet *)self->_allTargetValues na_map:&__block_literal_global_100_0];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __121__HFPowerStateControlItem_initWithValueSource_auxiliaryTargetValueTuples_additionalCharacteristicOptions_displayResults___block_invoke_2;
  v27[3] = &unk_26408D210;
  id v18 = v10;
  id v28 = v18;
  v19 = objc_msgSend(v17, "na_filter:", v27);

  v20 = [HFControlItemCharacteristicOptions alloc];
  v29 = &unk_26C0F5F88;
  v30[0] = v19;
  v21 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
  v22 = [(HFControlItemCharacteristicOptions *)v20 initWithCharacteristicTypesByUsage:v21];

  v23 = [(HFControlItemCharacteristicOptions *)v22 optionsByAddingCharacteristicOptions:v13];

  v26.receiver = self;
  v26.super_class = (Class)HFPowerStateControlItem;
  v24 = [(HFPrimaryStateControlItem *)&v26 initWithValueSource:v18 characteristicOptions:v23 displayResults:v12];

  if (v24) {
    objc_storeStrong((id *)&v24->_auxiliaryTargetValueTuples, a4);
  }

  return v24;
}

+ (id)_powerStateTargetValues
{
  if (qword_2676B69F0 != -1) {
    dispatch_once(&qword_2676B69F0, &__block_literal_global_133);
  }
  id v2 = (void *)qword_2676B69F8;
  return v2;
}

- (BOOL)canCopyWithCharacteristicOptions:(id)a3
{
  return 1;
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() _powerStateTargetValues];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__HFPowerStateControlItem_valueForCharacteristicValues___block_invoke;
  v9[3] = &unk_26408E0C0;
  id v10 = v3;
  id v5 = v3;
  if (objc_msgSend(v4, "na_any:", v9)) {
    id v6 = &unk_26C0F5FA0;
  }
  else {
    id v6 = &unk_26C0F5F70;
  }
  id v7 = v6;

  return v7;
}

- (BOOL)supportsItemRepresentingServices:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__HFPowerStateControlItem_supportsItemRepresentingServices___block_invoke;
  v4[3] = &unk_26408E0E8;
  v4[4] = self;
  return objc_msgSend(a3, "na_any:", v4);
}

id __62__HFPowerStateControlItem_readValueAndPopulateStandardResults__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 objectForKeyedSubscript:@"suspendedState"];
  uint64_t v4 = [v3 unsignedIntegerValue];

  id v5 = [v2 objectForKeyedSubscript:@"value"];
  if (v5)
  {
  }
  else if (objc_msgSend(MEMORY[0x263F0DF00], "hf_isSuspendedStateSupported:", v4))
  {
    id v6 = (void *)[v2 mutableCopy];
    [v6 setObject:&unk_26C0F5F70 forKeyedSubscript:@"value"];
    id v7 = [MEMORY[0x263F58190] futureWithResult:v6];

    goto LABEL_6;
  }
  id v7 = [MEMORY[0x263F58190] futureWithResult:v2];
LABEL_6:

  return v7;
}

void __50__HFPowerStateControlItem__powerStateTargetValues__block_invoke_2()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  v1 = [HFPowerStateTargetValueTuple alloc];
  id v6 = [(HFPowerStateTargetValueTuple *)v1 initWithCharacteristicType:*MEMORY[0x263F0C328] onTargetValue:&unk_26C0F5FB8 offTargetValue:&unk_26C0F5FD0];
  id v2 = [HFPowerStateTargetValueTuple alloc];
  id v3 = [(HFPowerStateTargetValueTuple *)v2 initWithCharacteristicType:*MEMORY[0x263F0BEF8] onTargetValue:&unk_26C0F5FB8 offTargetValue:&unk_26C0F5FD0];
  uint64_t v4 = objc_msgSend(v0, "setWithObjects:", v6, v3, 0);
  id v5 = (void *)qword_2676B69F8;
  qword_2676B69F8 = v4;
}

void __38__HFPowerStateControlItem_na_identity__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__HFPowerStateControlItem_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = __38__HFPowerStateControlItem_na_identity__block_invoke_3((uint64_t)v3);
  id v2 = (void *)qword_2676B6A08;
  qword_2676B6A08 = v1;
}

id __38__HFPowerStateControlItem_na_identity__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F58198];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___HFPowerStateControlItem;
  id v2 = objc_msgSendSuper2(&v7, sel_na_identity);
  id v3 = [v1 builderWithIdentity:v2];

  id v4 = (id)[v3 appendCharacteristic:&__block_literal_global_144 withRole:3 comparatorBlock:0 hashBlock:&__block_literal_global_147];
  id v5 = [v3 build];

  return v5;
}

- (HFPowerStateControlItem)initWithValueSource:(id)a3 characteristicTypes:(id)a4 displayResults:(id)a5
{
  objc_super v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  id v8 = NSStringFromSelector(sel_initWithValueSource_displayResults_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFPowerStateControlItem.m", 123, @"%s is unavailable; use %@ instead",
    "-[HFPowerStateControlItem initWithValueSource:characteristicTypes:displayResults:]",
    v8);

  return 0;
}

- (id)writePrimaryState:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(HFPrimaryStateControlItem *)self writeValue:v4];

  return v5;
}

- (id)toggleValue
{
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 homeManager];
  [v4 hasOptedToHH2];
  id v5 = objc_opt_new();

  id v6 = [(HFControlItem *)self valueSource];
  [v6 beginTransactionWithReason:@"HFPowerStateControlItem-Toggle" readPolicy:v5 logger:0];

  objc_super v7 = [(HFPowerStateControlItem *)self readValueAndPopulateStandardResults];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__HFPowerStateControlItem_toggleValue__block_invoke;
  v11[3] = &unk_26408E098;
  v11[4] = self;
  id v8 = [v7 flatMap:v11];

  id v9 = [(HFControlItem *)self valueSource];
  [v9 commitTransactionWithReason:@"HFPowerStateControlItem-Toggle"];

  return v8;
}

id __38__HFPowerStateControlItem_toggleValue__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"value"];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 integerValue];
    if (v5 == 2) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2 * (v5 == 1);
    }
    objc_super v7 = [*(id *)(a1 + 32) writePrimaryState:v6];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263F58190];
    id v9 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 35);
    objc_super v7 = [v8 futureWithError:v9];
  }
  return v7;
}

- (id)characteristicValuesForValue:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    objc_super v7 = v6;
  }
  else {
    objc_super v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v8 integerValue];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [(HFPowerStateControlItem *)self allTargetValues];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v16 = [v15 targetValueForPrimaryState:v9];
        if (v16)
        {
          v17 = [v15 characteristicType];
          [v5 setObject:v16 forKeyedSubscript:v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  id v18 = [(HFControlItem *)self normalizedCharacteristicValuesForValues:v5];

  return v18;
}

- (NSSet)allTargetValues
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

@end