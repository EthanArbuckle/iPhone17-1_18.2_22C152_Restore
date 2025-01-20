@interface HFServiceAccessoryType
+ (id)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFServiceAccessoryType)initWithServiceType:(id)a3 subtype:(id)a4;
- (NSString)serviceType;
- (NSString)subtype;
- (id)debugDescription;
- (id)description;
@end

@implementation HFServiceAccessoryType

uint64_t __37__HFServiceAccessoryType_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serviceType];
}

uint64_t __37__HFServiceAccessoryType_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 subtype];
}

void __37__HFServiceAccessoryType_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_311];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_313];
  uint64_t v3 = [v0 build];

  v4 = (void *)qword_26AB2E9B8;
  qword_26AB2E9B8 = v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HFServiceAccessoryType;
  if ([(HFAccessoryType *)&v7 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [v4 isEqual:self];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

+ (id)na_identity
{
  if (qword_26AB2E9B0 != -1) {
    dispatch_once(&qword_26AB2E9B0, &__block_literal_global_304);
  }
  id v2 = (void *)qword_26AB2E9B8;
  return v2;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)subtype
{
  return self->_subtype;
}

- (HFServiceAccessoryType)initWithServiceType:(id)a3 subtype:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFServiceAccessoryType;
  v9 = [(HFAccessoryType *)&v12 _init];
  v10 = (HFServiceAccessoryType *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong((id *)&v10->_subtype, a4);
  }

  return v10;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (void *)MEMORY[0x263F0E708];
  char v5 = [(HFServiceAccessoryType *)self serviceType];
  v6 = [v4 localizedDescriptionForServiceType:v5];
  id v7 = [(HFServiceAccessoryType *)self serviceType];
  id v8 = [v3 stringWithFormat:@"serviceType: %@ (%@)", v6, v7];

  return v8;
}

- (id)debugDescription
{
  uint64_t v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = (void *)MEMORY[0x263F0E708];
  char v5 = [(HFServiceAccessoryType *)self serviceType];
  v6 = [v4 localizedDescriptionForServiceType:v5];
  id v7 = [(HFServiceAccessoryType *)self serviceType];
  id v8 = [v6 stringByAppendingFormat:@" (%@)", v7];
  [v3 appendString:v8 withName:@"serviceType"];

  v9 = [(HFServiceAccessoryType *)self subtype];

  if (v9)
  {
    v10 = [(HFServiceAccessoryType *)self subtype];
    [v3 appendString:v10 withName:@"subtype"];
  }
  v11 = [v3 build];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
}

@end