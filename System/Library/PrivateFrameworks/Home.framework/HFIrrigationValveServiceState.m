@interface HFIrrigationValveServiceState
+ (id)requiredCharacteristicTypes;
+ (id)stateClassIdentifier;
+ (unint64_t)_typeForSystemActiveState:(BOOL)a3 usageState:(int64_t)a4;
- (BOOL)isTransitioning;
- (HFIrrigationValveServiceState)initWithBatchReadResponse:(id)a3;
- (id)stateTypeIdentifier;
- (int64_t)primaryState;
- (int64_t)priority;
- (unint64_t)type;
@end

@implementation HFIrrigationValveServiceState

+ (id)stateClassIdentifier
{
  return @"IrrigationValve";
}

+ (id)requiredCharacteristicTypes
{
  if (qword_26AB2E840 != -1) {
    dispatch_once(&qword_26AB2E840, &__block_literal_global_170_1);
  }
  v2 = (void *)qword_26AB2E848;
  return v2;
}

void __60__HFIrrigationValveServiceState_requiredCharacteristicTypes__block_invoke_2()
{
  v5[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0C200];
  v5[0] = *MEMORY[0x263F0BEF8];
  v5[1] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  v4 = (void *)qword_26AB2E848;
  qword_26AB2E848 = v3;
}

+ (unint64_t)_typeForSystemActiveState:(BOOL)a3 usageState:(int64_t)a4
{
  unint64_t v4 = 2;
  if (a3) {
    unint64_t v4 = 3;
  }
  unint64_t v5 = a3;
  if (a4) {
    unint64_t v5 = v4;
  }
  if (a4 == 1) {
    return v4;
  }
  else {
    return v5;
  }
}

- (HFIrrigationValveServiceState)initWithBatchReadResponse:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 allServices];
  int v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_172_0);

  v7 = (void *)MEMORY[0x263F0D880];
  if (v6) {
    v7 = (void *)MEMORY[0x263F0D740];
  }
  uint64_t v8 = *MEMORY[0x263F0BEF8];
  v9 = [MEMORY[0x263EFFA08] setWithObject:*v7];
  v10 = [v4 responseForCharacteristicType:v8 inServicesOfTypes:v9];
  v11 = [v10 valueWithExpectedClass:objc_opt_class()];

  v12 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C200]];

  v13 = [v12 valueWithExpectedClass:objc_opt_class()];

  if (v11) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    v15 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)HFIrrigationValveServiceState;
    v16 = [(HFIrrigationValveServiceState *)&v19 init];
    v17 = v16;
    if (v16) {
      v16->_type = objc_msgSend((id)objc_opt_class(), "_typeForSystemActiveState:usageState:", objc_msgSend(v11, "BOOLValue"), objc_msgSend(v13, "unsignedIntegerValue"));
    }
    self = v17;
    v15 = self;
  }

  return v15;
}

uint64_t __59__HFIrrigationValveServiceState_initWithBatchReadResponse___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D740]];

  return v3;
}

- (id)stateTypeIdentifier
{
  unint64_t v2 = [(HFIrrigationValveServiceState *)self type];
  if (v2 - 1 > 2) {
    return @"Off";
  }
  else {
    return off_264098A60[v2 - 1];
  }
}

- (int64_t)primaryState
{
  if ([(HFIrrigationValveServiceState *)self type]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)priority
{
  if ([(HFIrrigationValveServiceState *)self type]) {
    return 0;
  }
  else {
    return -1;
  }
}

- (BOOL)isTransitioning
{
  return [(HFIrrigationValveServiceState *)self type] == 2;
}

- (unint64_t)type
{
  return self->_type;
}

@end