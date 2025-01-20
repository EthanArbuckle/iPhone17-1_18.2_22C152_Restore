@interface HFCharacteristicReadResponse
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFCharacteristicReadResponse)initWithCharacteristic:(id)a3 readTraits:(id)a4 value:(id)a5 error:(id)a6;
- (HFCharacteristicReadResponse)initWithHomeKitResponse:(id)a3 value:(id)a4 readTraits:(id)a5;
- (HMCharacteristic)characteristic;
- (NSError)error;
- (NSSet)readTraits;
- (NSString)description;
- (id)value;
- (id)valueWithExpectedClass:(Class)a3;
- (unint64_t)hash;
@end

@implementation HFCharacteristicReadResponse

uint64_t __43__HFCharacteristicReadResponse_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 characteristic];
}

uint64_t __43__HFCharacteristicReadResponse_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 error];
}

uint64_t __43__HFCharacteristicReadResponse_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __43__HFCharacteristicReadResponse_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 readTraits];
}

- (id)valueWithExpectedClass:(Class)a3
{
  uint64_t v5 = [(HFCharacteristicReadResponse *)self value];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(HFCharacteristicReadResponse *)self value];
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v9 = [(HFCharacteristicReadResponse *)self value];
      v10 = [(HFCharacteristicReadResponse *)self value];
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = NSStringFromClass(a3);
      NSLog(&cfstr_ReadValueIsOfC.isa, v9, v12, v13);
    }
  }
  v14 = [(HFCharacteristicReadResponse *)self value];
  if (objc_opt_isKindOfClass())
  {
    v15 = [(HFCharacteristicReadResponse *)self value];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)value
{
  return self->_value;
}

- (NSError)error
{
  return self->_error;
}

- (NSSet)readTraits
{
  return self->_readTraits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_readTraits, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (HMCharacteristic)characteristic
{
  return self->_characteristic;
}

void __43__HFCharacteristicReadResponse_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_10_9];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_12_6];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_14_8];
  id v4 = (id)[v0 appendCharacteristic:&__block_literal_global_16_8];
  uint64_t v5 = [v0 build];

  v6 = (void *)qword_26AB2F978;
  qword_26AB2F978 = v5;
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

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_292 != -1) {
    dispatch_once(&_MergedGlobals_292, &__block_literal_global_4_12);
  }
  id v2 = (void *)qword_26AB2F978;
  return (NAIdentity *)v2;
}

- (HFCharacteristicReadResponse)initWithCharacteristic:(id)a3 readTraits:(id)a4 value:(id)a5 error:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HFCharacteristicReadResponse;
  v15 = [(HFCharacteristicReadResponse *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_characteristic, a3);
    objc_storeStrong((id *)&v16->_readTraits, a4);
    objc_storeStrong(&v16->_value, a5);
    objc_storeStrong((id *)&v16->_error, a6);
  }

  return v16;
}

- (HFCharacteristicReadResponse)initWithHomeKitResponse:(id)a3 value:(id)a4 readTraits:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 request];
  id v12 = [v11 characteristic];
  id v13 = [v10 error];

  id v14 = [(HFCharacteristicReadResponse *)self initWithCharacteristic:v12 readTraits:v8 value:v9 error:v13];
  return v14;
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F58188] builderWithObject:self];
  unint64_t v4 = [(HFCharacteristicReadResponse *)self characteristic];
  uint64_t v5 = objc_msgSend(v4, "hf_prettyDescription");
  id v6 = (id)[v3 appendObject:v5 withName:@"characteristic"];

  v7 = [(HFCharacteristicReadResponse *)self readTraits];
  if ([v7 count])
  {
    id v8 = [(HFCharacteristicReadResponse *)self readTraits];
    id v9 = [v8 allObjects];
    id v10 = [v9 sortedArrayUsingSelector:sel_compare_];
    id v11 = [v10 componentsJoinedByString:@", "];
  }
  else
  {
    id v11 = @"(none)";
  }

  id v12 = (id)[v3 appendObject:v11 withName:@"readTraits"];
  id v13 = [(HFCharacteristicReadResponse *)self value];
  id v14 = (id)[v3 appendObject:v13 withName:@"value" skipIfNil:1];

  v15 = [(HFCharacteristicReadResponse *)self error];
  id v16 = (id)[v3 appendObject:v15 withName:@"error" skipIfNil:1];

  v17 = [v3 build];

  return (NSString *)v17;
}

@end