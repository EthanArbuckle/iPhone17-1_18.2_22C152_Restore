@interface HFFaucetValveServiceState
+ (id)optionalCharacteristicTypes;
+ (id)requiredCharacteristicTypes;
+ (id)stateClassIdentifier;
+ (unint64_t)_typeForSystemActiveState:(BOOL)a3 heaterCoolerActiveState:(id)a4 usageState:(int64_t)a5 currentHeaterCoolerState:(id)a6;
- (BOOL)isTransitioning;
- (HFFaucetValveServiceState)initWithBatchReadResponse:(id)a3;
- (id)stateTypeIdentifier;
- (int64_t)primaryState;
- (int64_t)priority;
- (unint64_t)type;
@end

@implementation HFFaucetValveServiceState

+ (id)requiredCharacteristicTypes
{
  if (qword_26AB2E800 != -1) {
    dispatch_once(&qword_26AB2E800, &__block_literal_global_113_2);
  }
  v2 = (void *)qword_26AB2E808;
  return v2;
}

void __56__HFFaucetValveServiceState_requiredCharacteristicTypes__block_invoke_2()
{
  v5[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0C200];
  v5[0] = *MEMORY[0x263F0BEF8];
  v5[1] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  v4 = (void *)qword_26AB2E808;
  qword_26AB2E808 = v3;
}

+ (id)stateClassIdentifier
{
  return @"FaucetValve";
}

+ (id)optionalCharacteristicTypes
{
  if (qword_26AB2E810 != -1) {
    dispatch_once(&qword_26AB2E810, &__block_literal_global_118_1);
  }
  v2 = (void *)qword_26AB2E818;
  return v2;
}

void __56__HFFaucetValveServiceState_optionalCharacteristicTypes__block_invoke_2()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = *MEMORY[0x263F0C058];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)qword_26AB2E818;
  qword_26AB2E818 = v2;
}

+ (unint64_t)_typeForSystemActiveState:(BOOL)a3 heaterCoolerActiveState:(id)a4 usageState:(int64_t)a5 currentHeaterCoolerState:(id)a6
{
  BOOL v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (a5 == 1)
  {
    if (v9) {
      unint64_t v6 = 5;
    }
    else {
      unint64_t v6 = 4;
    }
  }
  else if (!a5)
  {
    if (v9)
    {
      unint64_t v6 = 3;
    }
    else if (v10 && [v10 BOOLValue])
    {
      if (v11 && [v11 unsignedIntegerValue] == 2) {
        unint64_t v6 = 1;
      }
      else {
        unint64_t v6 = 2;
      }
    }
    else
    {
      unint64_t v6 = 0;
    }
  }

  return v6;
}

- (HFFaucetValveServiceState)initWithBatchReadResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 allServices];
  int v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_121_3);

  v7 = (void *)MEMORY[0x263F0D880];
  if (v6) {
    v7 = (void *)MEMORY[0x263F0D6D8];
  }
  uint64_t v8 = *MEMORY[0x263F0BEF8];
  BOOL v9 = [MEMORY[0x263EFFA08] setWithObject:*v7];
  id v10 = [v4 responseForCharacteristicType:v8 inServicesOfTypes:v9];
  id v11 = [v10 valueWithExpectedClass:objc_opt_class()];

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
    if (qword_26AB2E820 != -1) {
      dispatch_once(&qword_26AB2E820, &__block_literal_global_126);
    }
    id v16 = (id)qword_26AB2E828;
    v17 = [v4 responseForCharacteristicType:v8 inServicesOfTypes:v16];
    v18 = [v17 valueWithExpectedClass:objc_opt_class()];

    uint64_t v19 = *MEMORY[0x263F0C058];
    if (qword_26AB2E830 != -1) {
      dispatch_once(&qword_26AB2E830, &__block_literal_global_130_1);
    }
    id v20 = (id)qword_26AB2E838;
    v21 = [v4 responseForCharacteristicType:v19 inServicesOfTypes:v20];
    v22 = [v21 valueWithExpectedClass:objc_opt_class()];

    v25.receiver = self;
    v25.super_class = (Class)HFFaucetValveServiceState;
    v23 = [(HFFaucetValveServiceState *)&v25 init];
    if (v23) {
      v23->_type = objc_msgSend((id)objc_opt_class(), "_typeForSystemActiveState:heaterCoolerActiveState:usageState:currentHeaterCoolerState:", objc_msgSend(v11, "BOOLValue"), v18, objc_msgSend(v13, "unsignedIntegerValue"), v22);
    }
    self = v23;

    v15 = self;
  }

  return v15;
}

uint64_t __55__HFFaucetValveServiceState_initWithBatchReadResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D6D8]];

  return v3;
}

void __55__HFFaucetValveServiceState_initWithBatchReadResponse___block_invoke_3()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = *MEMORY[0x263F0D708];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)qword_26AB2E828;
  qword_26AB2E828 = v2;
}

void __55__HFFaucetValveServiceState_initWithBatchReadResponse___block_invoke_5()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = *MEMORY[0x263F0D708];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)qword_26AB2E838;
  qword_26AB2E838 = v2;
}

- (id)stateTypeIdentifier
{
  unint64_t v2 = [(HFFaucetValveServiceState *)self type];
  if (v2 - 1 > 4) {
    return @"Off";
  }
  else {
    return off_264098A38[v2 - 1];
  }
}

- (int64_t)primaryState
{
  unint64_t v2 = [(HFFaucetValveServiceState *)self type];
  if (v2 == 3 || v2 == 0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (int64_t)priority
{
  if ([(HFFaucetValveServiceState *)self type]) {
    return 0;
  }
  else {
    return -1;
  }
}

- (BOOL)isTransitioning
{
  return [(HFFaucetValveServiceState *)self type] == 4 || [(HFFaucetValveServiceState *)self type] == 3;
}

- (unint64_t)type
{
  return self->_type;
}

@end