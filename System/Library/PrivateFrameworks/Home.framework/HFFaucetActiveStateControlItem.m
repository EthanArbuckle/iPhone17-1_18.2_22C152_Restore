@interface HFFaucetActiveStateControlItem
+ (id)na_identity;
- (HFFaucetActiveStateControlItem)initWithValueSource:(id)a3 auxiliaryTargetValueTuples:(id)a4 additionalCharacteristicOptions:(id)a5 displayResults:(id)a6;
- (HFFaucetActiveStateControlItem)initWithValueSource:(id)a3 valveControlMode:(unint64_t)a4 displayResults:(id)a5;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)resultsForBatchReadResponse:(id)a3;
- (id)servicePredicateForCharacteristicType:(id)a3 withUsage:(unint64_t)a4;
- (unint64_t)valveControlMode;
@end

@implementation HFFaucetActiveStateControlItem

- (HFFaucetActiveStateControlItem)initWithValueSource:(id)a3 valveControlMode:(unint64_t)a4 displayResults:(id)a5
{
  v22[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 primaryServiceDescriptor];
  v11 = +[HFServiceState stateClassForServiceDescriptor:v10];

  v12 = [(objc_class *)v11 requiredCharacteristicTypes];
  v13 = [(objc_class *)v11 optionalCharacteristicTypes];
  v14 = [HFControlItemCharacteristicOptions alloc];
  v21[0] = &unk_26C0F7230;
  v21[1] = &unk_26C0F7248;
  v22[0] = v12;
  v22[1] = v13;
  v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v16 = [(HFControlItemCharacteristicOptions *)v14 initWithCharacteristicTypesByUsage:v15];

  v17 = [MEMORY[0x263EFFA08] set];
  v20.receiver = self;
  v20.super_class = (Class)HFFaucetActiveStateControlItem;
  v18 = [(HFPowerStateControlItem *)&v20 initWithValueSource:v9 auxiliaryTargetValueTuples:v17 additionalCharacteristicOptions:v16 displayResults:v8];

  if (v18) {
    v18->_valveControlMode = a4;
  }

  return v18;
}

- (HFFaucetActiveStateControlItem)initWithValueSource:(id)a3 auxiliaryTargetValueTuples:(id)a4 additionalCharacteristicOptions:(id)a5 displayResults:(id)a6
{
  id v8 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5, a6);
  id v9 = NSStringFromSelector(sel_initWithValueSource_valveControlMode_displayResults_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFFaucetActiveStateControlItem.m", 39, @"%s is unavailable; use %@ instead",
    "-[HFFaucetActiveStateControlItem initWithValueSource:auxiliaryTargetValueTuples:additionalCharacteristicOptions:displayResults:]",
    v9);

  return 0;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)objc_opt_class());
  unint64_t v7 = [(HFFaucetActiveStateControlItem *)self valveControlMode];
  id v8 = [(HFControlItem *)self displayResults];
  id v9 = (void *)[v6 initWithValueSource:v5 valveControlMode:v7 displayResults:v8];

  [v9 copyLatestResultsFromItem:self];
  return v9;
}

- (id)servicePredicateForCharacteristicType:(id)a3 withUsage:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 isEqualToString:*MEMORY[0x263F0BEF8]])
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __82__HFFaucetActiveStateControlItem_servicePredicateForCharacteristicType_withUsage___block_invoke;
    v13[3] = &unk_264097E60;
    v13[4] = self;
    unint64_t v7 = __82__HFFaucetActiveStateControlItem_servicePredicateForCharacteristicType_withUsage___block_invoke((uint64_t)v13);
    id v8 = [HFServiceTreeCompoundPredicate alloc];
    id v9 = +[HFServiceTreeTypePredicate predicateWithServiceType:*MEMORY[0x263F0D6D8]];
    v10 = [(HFServiceTreeCompoundPredicate *)v8 initWithRootServicePredicate:v9 childServicePredicates:v7];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HFFaucetActiveStateControlItem;
    v10 = [(HFControlItem *)&v12 servicePredicateForCharacteristicType:v6 withUsage:a4];
  }

  return v10;
}

id __82__HFFaucetActiveStateControlItem_servicePredicateForCharacteristicType_withUsage___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = +[HFServiceTreeTypePredicate predicateWithServiceType:*MEMORY[0x263F0D708]];
  if ([*(id *)(a1 + 32) valveControlMode] == 1)
  {
    v7[0] = v2;
    v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    v4 = +[HFServiceTreeTypePredicate predicateWithServiceType:*MEMORY[0x263F0D880]];
    v6[0] = v2;
    v6[1] = v4;
    v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  }
  return v3;
}

- (id)resultsForBatchReadResponse:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HFFaucetActiveStateControlItem;
  id v4 = a3;
  id v5 = [(HFControlItem *)&v13 resultsForBatchReadResponse:v4];
  id v6 = objc_msgSend(v5, "mutableCopy", v13.receiver, v13.super_class);

  unint64_t v7 = [(HFControlItem *)self valueSource];
  id v8 = [v7 primaryServiceDescriptor];
  id v9 = +[HFServiceState stateForServiceDescriptor:v8 withBatchReadResponse:v4];

  if (v9)
  {
    v10 = objc_alloc_init(HFServiceStateDescriptionFormatter);
    [(HFServiceStateDescriptionFormatter *)v10 setDescriptionContext:1];
    v11 = [(HFServiceStateDescriptionFormatter *)v10 stringForObjectValue:v9];
    [v6 setObject:v11 forKeyedSubscript:@"description"];
  }
  return v6;
}

+ (id)na_identity
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__HFFaucetActiveStateControlItem_na_identity__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __45__HFFaucetActiveStateControlItem_na_identity__block_invoke((uint64_t)v4);
  return v2;
}

id __45__HFFaucetActiveStateControlItem_na_identity__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__HFFaucetActiveStateControlItem_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (_MergedGlobals_287 != -1) {
    dispatch_once(&_MergedGlobals_287, block);
  }
  v1 = (void *)qword_26AB2F8D8;
  return v1;
}

void __45__HFFaucetActiveStateControlItem_na_identity__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__HFFaucetActiveStateControlItem_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = __45__HFFaucetActiveStateControlItem_na_identity__block_invoke_3((uint64_t)v3);
  v2 = (void *)qword_26AB2F8D8;
  qword_26AB2F8D8 = v1;
}

id __45__HFFaucetActiveStateControlItem_na_identity__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F58198];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___HFFaucetActiveStateControlItem;
  v2 = objc_msgSendSuper2(&v7, sel_na_identity);
  v3 = [v1 builderWithIdentity:v2];

  id v4 = (id)[v3 appendCharacteristic:&__block_literal_global_156];
  id v5 = [v3 build];

  return v5;
}

uint64_t __45__HFFaucetActiveStateControlItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 valveControlMode];
  return [v2 numberWithUnsignedInteger:v3];
}

- (unint64_t)valveControlMode
{
  return self->_valveControlMode;
}

@end