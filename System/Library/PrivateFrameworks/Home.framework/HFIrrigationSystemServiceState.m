@interface HFIrrigationSystemServiceState
+ (id)requiredCharacteristicTypes;
+ (id)stateClassIdentifier;
+ (unint64_t)_typeForActiveState:(BOOL)a3 usageState:(int64_t)a4 programMode:(int64_t)a5;
- (HFIrrigationSystemServiceState)initWithBatchReadResponse:(id)a3;
- (id)stateTypeIdentifier;
- (int64_t)primaryState;
- (int64_t)priority;
- (unint64_t)type;
@end

@implementation HFIrrigationSystemServiceState

- (int64_t)priority
{
  if ([(HFIrrigationSystemServiceState *)self type]) {
    return 0;
  }
  else {
    return -1;
  }
}

- (id)stateTypeIdentifier
{
  unint64_t v2 = [(HFIrrigationSystemServiceState *)self type];
  if (v2 - 1 > 2) {
    return @"Off";
  }
  else {
    return off_264098A78[v2 - 1];
  }
}

- (int64_t)primaryState
{
  if ([(HFIrrigationSystemServiceState *)self type] < 2) {
    return 1;
  }
  else {
    return 2;
  }
}

- (unint64_t)type
{
  return self->_type;
}

+ (id)stateClassIdentifier
{
  return @"IrrigationSystem";
}

+ (id)requiredCharacteristicTypes
{
  if (qword_26AB2E850 != -1) {
    dispatch_once(&qword_26AB2E850, &__block_literal_global_189_2);
  }
  unint64_t v2 = (void *)qword_26AB2E858;
  return v2;
}

- (HFIrrigationSystemServiceState)initWithBatchReadResponse:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F0BEF8];
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = *MEMORY[0x263F0D740];
  id v7 = a3;
  v8 = [v5 setWithObject:v6];
  v9 = [v7 responseForCharacteristicType:v4 inServicesOfTypes:v8];
  v10 = [v9 valueWithExpectedClass:objc_opt_class()];

  uint64_t v11 = *MEMORY[0x263F0C340];
  v12 = [MEMORY[0x263EFFA08] setWithObject:v6];
  v13 = [v7 responseForCharacteristicType:v11 inServicesOfTypes:v12];
  v14 = [v13 valueWithExpectedClass:objc_opt_class()];

  uint64_t v15 = *MEMORY[0x263F0C200];
  if (qword_26AB2E860 != -1) {
    dispatch_once(&qword_26AB2E860, &__block_literal_global_193_1);
  }
  id v16 = (id)qword_26AB2E868;
  v17 = [v7 responseForCharacteristicType:v15 inServicesOfTypes:v16];

  v18 = [v17 valueWithExpectedClass:objc_opt_class()];

  v19 = 0;
  if (v10 && v18 && v14)
  {
    v22.receiver = self;
    v22.super_class = (Class)HFIrrigationSystemServiceState;
    v20 = [(HFIrrigationSystemServiceState *)&v22 init];
    if (v20) {
      v20->_type = objc_msgSend((id)objc_opt_class(), "_typeForActiveState:usageState:programMode:", objc_msgSend(v10, "BOOLValue"), objc_msgSend(v18, "unsignedIntegerValue"), objc_msgSend(v14, "unsignedIntegerValue"));
    }
    self = v20;
    v19 = self;
  }

  return v19;
}

+ (unint64_t)_typeForActiveState:(BOOL)a3 usageState:(int64_t)a4 programMode:(int64_t)a5
{
  if (!a4) {
    goto LABEL_6;
  }
  if (a4 != 1) {
    return result;
  }
  if ((unint64_t)a5 < 3) {
    return qword_20BD13908[a5];
  }
LABEL_6:
  if (a3) {
    return a5 != 0;
  }
  return 0;
}

void __60__HFIrrigationSystemServiceState_initWithBatchReadResponse___block_invoke_2()
{
  v5[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D880];
  v5[0] = *MEMORY[0x263F0D740];
  v5[1] = v1;
  unint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)qword_26AB2E868;
  qword_26AB2E868 = v3;
}

void __61__HFIrrigationSystemServiceState_requiredCharacteristicTypes__block_invoke_2()
{
  void v5[3] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0C200];
  v5[0] = *MEMORY[0x263F0BEF8];
  v5[1] = v1;
  v5[2] = *MEMORY[0x263F0C340];
  unint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)qword_26AB2E858;
  qword_26AB2E858 = v3;
}

@end