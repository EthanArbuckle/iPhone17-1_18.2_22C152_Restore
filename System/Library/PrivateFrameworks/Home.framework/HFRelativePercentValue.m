@interface HFRelativePercentValue
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFRelativePercentValue)initWithCharacteristicReadResponse:(id)a3;
- (HFRelativePercentValue)initWithValue:(id)a3 forCharacteristic:(id)a4;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (NSNumber)stepValue;
- (NSNumber)value;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setMaximumValue:(id)a3;
- (void)setMinimumValue:(id)a3;
- (void)setStepValue:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation HFRelativePercentValue

- (NSNumber)value
{
  return self->_value;
}

- (HFRelativePercentValue)initWithCharacteristicReadResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 valueWithExpectedClass:objc_opt_class()];
  v6 = [v4 characteristic];

  v7 = [(HFRelativePercentValue *)self initWithValue:v5 forCharacteristic:v6];
  return v7;
}

- (HFRelativePercentValue)initWithValue:(id)a3 forCharacteristic:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v25.receiver = self;
    v25.super_class = (Class)HFRelativePercentValue;
    v9 = [(HFRelativePercentValue *)&v25 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_value, a3);
      v11 = [v8 metadata];
      uint64_t v12 = [v11 minimumValue];
      v13 = (void *)v12;
      if (v12) {
        v14 = (void *)v12;
      }
      else {
        v14 = &unk_26C0F7F78;
      }
      objc_storeStrong(p_isa + 2, v14);

      v15 = [v8 metadata];
      uint64_t v16 = [v15 maximumValue];
      v17 = (void *)v16;
      if (v16) {
        v18 = (void *)v16;
      }
      else {
        v18 = &unk_26C0F7F88;
      }
      objc_storeStrong(p_isa + 3, v18);

      v19 = [v8 metadata];
      uint64_t v20 = [v19 stepValue];
      v21 = (void *)v20;
      if (v20) {
        v22 = (void *)v20;
      }
      else {
        v22 = &unk_26C0F7F98;
      }
      objc_storeStrong(p_isa + 4, v22);
    }
    self = p_isa;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(HFRelativePercentValue *)self value];
  [v4 setValue:v5];

  v6 = [(HFRelativePercentValue *)self minimumValue];
  [v4 setMinimumValue:v6];

  id v7 = [(HFRelativePercentValue *)self maximumValue];
  [v4 setMaximumValue:v7];

  id v8 = [(HFRelativePercentValue *)self stepValue];
  [v4 setStepValue:v8];

  return v4;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_241 != -1) {
    dispatch_once(&_MergedGlobals_241, &__block_literal_global_7_2);
  }
  v2 = (void *)qword_26AB2EFC8;
  return (NAIdentity *)v2;
}

void __37__HFRelativePercentValue_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_14_1];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_16_1];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_18];
  id v4 = (id)[v0 appendCharacteristic:&__block_literal_global_20_2];
  uint64_t v5 = [v0 build];

  v6 = (void *)qword_26AB2EFC8;
  qword_26AB2EFC8 = v5;
}

uint64_t __37__HFRelativePercentValue_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __37__HFRelativePercentValue_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 minimumValue];
}

uint64_t __37__HFRelativePercentValue_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 maximumValue];
}

uint64_t __37__HFRelativePercentValue_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 stepValue];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F58188] builderWithObject:self];
  unint64_t v4 = [(HFRelativePercentValue *)self value];
  id v5 = (id)[v3 appendObject:v4 withName:@"value"];

  v6 = [(HFRelativePercentValue *)self minimumValue];
  id v7 = (id)[v3 appendObject:v6 withName:@"min" skipIfNil:1];

  id v8 = [(HFRelativePercentValue *)self maximumValue];
  id v9 = (id)[v3 appendObject:v8 withName:@"max" skipIfNil:1];

  v10 = [(HFRelativePercentValue *)self stepValue];
  id v11 = (id)[v3 appendObject:v10 withName:@"step" skipIfNil:1];

  uint64_t v12 = [v3 build];

  return (NSString *)v12;
}

- (void)setValue:(id)a3
{
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(id)a3
{
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(id)a3
{
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (void)setStepValue:(id)a3
{
}

@end