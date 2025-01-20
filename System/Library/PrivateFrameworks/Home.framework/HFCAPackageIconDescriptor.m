@interface HFCAPackageIconDescriptor
+ (BOOL)iconDescriptorShouldAlwaysAnimate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldForceLTR;
- (HFCAPackageIconDescriptor)initWithPackageIdentifier:(id)a3;
- (HFCAPackageIconDescriptor)initWithPackageIdentifier:(id)a3 state:(id)a4;
- (HFCAPackageIconDescriptor)initWithPackageIdentifier:(id)a3 state:(id)a4 modifiers:(id)a5;
- (NSDictionary)iconModifiers;
- (NSString)description;
- (NSString)packageIdentifier;
- (NSString)state;
- (id)iconDescriptorByMergingWithIconDescriptor:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
@end

@implementation HFCAPackageIconDescriptor

- (unint64_t)hash
{
  v3 = [(HFCAPackageIconDescriptor *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(HFCAPackageIconDescriptor *)self state];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v10 = [v5 identifier];
    unint64_t v6 = [(HFCAPackageIconDescriptor *)self identifier];
    int v7 = [v10 isEqualToString:v6];

    v8 = [v5 state];
    v9 = [(HFCAPackageIconDescriptor *)self state];

    LOBYTE(v10) = 0;
    if (v7 && v8 == v9)
    {
      v11 = [v5 iconModifiers];
      v12 = [v11 allKeys];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __37__HFCAPackageIconDescriptor_isEqual___block_invoke;
      v14[3] = &unk_26408C9D0;
      v14[4] = self;
      id v15 = v5;
      LODWORD(v10) = objc_msgSend(v12, "na_any:", v14) ^ 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (NSString)packageIdentifier
{
  return self->_packageIdentifier;
}

- (NSString)state
{
  return self->_state;
}

uint64_t __37__HFCAPackageIconDescriptor_isEqual___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 iconModifiers];
  unint64_t v6 = [v5 objectForKeyedSubscript:v4];
  int v7 = [*(id *)(a1 + 40) iconModifiers];
  v8 = [v7 objectForKeyedSubscript:v4];

  id v9 = v6;
  id v10 = v8;
  if (v9 == v10)
  {
    uint64_t v11 = 0;
  }
  else if (v9)
  {
    uint64_t v11 = [v9 isEqual:v10] ^ 1;
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

- (NSDictionary)iconModifiers
{
  return self->_iconModifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconModifiers, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_packageIdentifier, 0);
}

- (HFCAPackageIconDescriptor)initWithPackageIdentifier:(id)a3 state:(id)a4 modifiers:(id)a5
{
  v17[10] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HFCAPackageIconDescriptor;
  v12 = [(HFCAPackageIconDescriptor *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_packageIdentifier, a3);
    objc_storeStrong((id *)&v13->_state, a4);
    objc_storeStrong((id *)&v13->_iconModifiers, a5);
    v17[0] = @"HFImageIconIdentifierAppleTVRegular";
    v17[1] = @"HFImageIconIdentifierAppleTVSmall";
    v17[2] = @"HFImageIconIdentifierServiceCarbonDioxideSensorOn";
    v17[3] = @"HFImageIconIdentifierServiceCarbonDioxideSensorOff";
    v17[4] = @"HFImageIconIdentifierServiceCarbonMonoxideSensorOn";
    v17[5] = @"HFImageIconIdentifierServiceCarbonMonoxideSensorOff";
    v17[6] = @"HFCAPackageIconIdentifierAirport";
    v17[7] = @"HFImageIconIdentifierGeneric";
    v17[8] = @"HFCAPackageIconIdentifierCarbonMonoxideSensor";
    v17[9] = @"HFCAPackageIconIdentifierCarbonDioxideSensor";
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:10];
    v13->_shouldForceLTR = [v14 containsObject:v9];
  }
  return v13;
}

- (HFCAPackageIconDescriptor)initWithPackageIdentifier:(id)a3 state:(id)a4
{
  return [(HFCAPackageIconDescriptor *)self initWithPackageIdentifier:a3 state:a4 modifiers:0];
}

- (HFCAPackageIconDescriptor)initWithPackageIdentifier:(id)a3
{
  return [(HFCAPackageIconDescriptor *)self initWithPackageIdentifier:a3 state:HFCAPackageStateDisplay];
}

+ (BOOL)iconDescriptorShouldAlwaysAnimate:(id)a3
{
  id v3 = a3;
  id v4 = HFCAPackageIconIdentifierStatesWithContinuousAnimation();
  id v5 = [v3 packageIdentifier];
  unint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    int v7 = [v3 state];
    char v8 = [v6 containsObject:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unint64_t v6 = [(HFCAPackageIconDescriptor *)self packageIdentifier];
  int v7 = [v3 stringWithFormat:@"<%@: %p, \"%@\">", v5, self, v6];

  return (NSString *)v7;
}

- (id)iconDescriptorByMergingWithIconDescriptor:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7
    && ([v7 identifier],
        char v8 = objc_claimAutoreleasedReturnValue(),
        [(HFCAPackageIconDescriptor *)self identifier],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 isEqualToString:v9],
        v9,
        v8,
        v10))
  {
    id v11 = [(HFCAPackageIconDescriptor *)self state];
    v12 = [v7 state];
    if (v11 == v12)
    {
      v13 = [(HFCAPackageIconDescriptor *)self state];
    }
    else
    {
      v13 = HFCAPackageStateOn;
    }
    id v15 = v13;

    objc_super v16 = [v7 iconModifiers];
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __71__HFCAPackageIconDescriptor_iconDescriptorByMergingWithIconDescriptor___block_invoke;
    v24 = &unk_26408C9F8;
    v25 = self;
    id v26 = v7;
    v17 = objc_msgSend(v16, "na_filter:", &v21);

    id v18 = objc_alloc((Class)objc_opt_class());
    v19 = [(HFCAPackageIconDescriptor *)self identifier];
    v14 = (void *)[v18 initWithPackageIdentifier:v19 state:v15 modifiers:v17];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __71__HFCAPackageIconDescriptor_iconDescriptorByMergingWithIconDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 iconModifiers];
  unint64_t v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = [*(id *)(a1 + 40) iconModifiers];
  char v8 = [v7 objectForKeyedSubscript:v4];

  id v9 = v6;
  id v10 = v8;
  if (v9 == v10)
  {
    uint64_t v11 = 1;
  }
  else if (v9)
  {
    uint64_t v11 = [v9 isEqual:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    char v8 = [(HFCAPackageIconDescriptor *)self state];
    id v9 = [v7 state];
    int64_t v10 = [v8 compare:v9];
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (BOOL)shouldForceLTR
{
  return self->_shouldForceLTR;
}

@end