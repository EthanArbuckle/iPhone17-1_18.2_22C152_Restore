@interface HFPowerStateTargetValueTuple
+ (NAIdentity)na_identity;
+ (id)fanStateTargetValueTuple;
- (BOOL)isEqual:(id)a3;
- (HFPowerStateTargetValueTuple)init;
- (HFPowerStateTargetValueTuple)initWithCharacteristicType:(id)a3 onTargetValue:(id)a4 offTargetValue:(id)a5;
- (NSNumber)offTargetValue;
- (NSNumber)onTargetValue;
- (NSString)characteristicType;
- (id)targetValueForPrimaryState:(int64_t)a3;
- (int64_t)primaryStateForTargetValue:(id)a3;
- (unint64_t)hash;
@end

@implementation HFPowerStateTargetValueTuple

void __43__HFPowerStateTargetValueTuple_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  v1 = [v0 appendCharacteristic:&__block_literal_global_17];
  v2 = [v1 appendCharacteristic:&__block_literal_global_20];
  id v3 = (id)[v2 appendCharacteristic:&__block_literal_global_22];

  uint64_t v4 = [v0 build];

  v5 = (void *)qword_2676B69E8;
  qword_2676B69E8 = v4;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_6_0 != -1) {
    dispatch_once(&_MergedGlobals_6_0, &__block_literal_global_10);
  }
  v2 = (void *)qword_2676B69E8;
  return (NAIdentity *)v2;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (int64_t)primaryStateForTargetValue:(id)a3
{
  id v4 = a3;
  v5 = [(HFPowerStateTargetValueTuple *)self onTargetValue];
  int v6 = [v4 isEqual:v5];

  if (v6) {
    int64_t v7 = 2;
  }
  else {
    int64_t v7 = 1;
  }

  return v7;
}

- (NSNumber)onTargetValue
{
  return self->_onTargetValue;
}

uint64_t __43__HFPowerStateTargetValueTuple_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 offTargetValue];
}

uint64_t __43__HFPowerStateTargetValueTuple_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 onTargetValue];
}

uint64_t __43__HFPowerStateTargetValueTuple_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 characteristicType];
}

- (NSNumber)offTargetValue
{
  return self->_offTargetValue;
}

- (HFPowerStateTargetValueTuple)initWithCharacteristicType:(id)a3 onTargetValue:(id)a4 offTargetValue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFPowerStateTargetValueTuple;
  v12 = [(HFPowerStateTargetValueTuple *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_characteristicType, a3);
    objc_storeStrong((id *)&v13->_onTargetValue, a4);
    objc_storeStrong((id *)&v13->_offTargetValue, a5);
  }

  return v13;
}

+ (id)fanStateTargetValueTuple
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCharacteristicType:*MEMORY[0x263F0C4B8] onTargetValue:&unk_26C0F5F70 offTargetValue:0];
  return v2;
}

- (HFPowerStateTargetValueTuple)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithCharacteristicType_onTargetValue_offTargetValue_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFPowerStateControlItem.m", 34, @"%s is unavailable; use %@ instead",
    "-[HFPowerStateTargetValueTuple init]",
    v5);

  return 0;
}

- (id)targetValueForPrimaryState:(int64_t)a3
{
  if (a3 == 2) {
    [(HFPowerStateTargetValueTuple *)self onTargetValue];
  }
  else {
  id v3 = [(HFPowerStateTargetValueTuple *)self offTargetValue];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offTargetValue, 0);
  objc_storeStrong((id *)&self->_onTargetValue, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

@end