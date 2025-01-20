@interface HFPrimaryStateIconDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldForceLTR;
- (HFPrimaryStateIconDescriptor)initWithIdentifier:(id)a3 primaryState:(int64_t)a4;
- (NSString)identifier;
- (id)iconDescriptorByMergingWithIconDescriptor:(id)a3;
- (int64_t)compare:(id)a3;
- (int64_t)primaryState;
- (unint64_t)hash;
@end

@implementation HFPrimaryStateIconDescriptor

- (HFPrimaryStateIconDescriptor)initWithIdentifier:(id)a3 primaryState:(int64_t)a4
{
  v13[10] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFPrimaryStateIconDescriptor;
  v8 = [(HFPrimaryStateIconDescriptor *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_primaryState = a4;
    v13[0] = @"HFImageIconIdentifierAppleTVRegular";
    v13[1] = @"HFImageIconIdentifierAppleTVSmall";
    v13[2] = @"HFImageIconIdentifierServiceCarbonDioxideSensorOn";
    v13[3] = @"HFImageIconIdentifierServiceCarbonDioxideSensorOff";
    v13[4] = @"HFImageIconIdentifierServiceCarbonMonoxideSensorOn";
    v13[5] = @"HFImageIconIdentifierServiceCarbonMonoxideSensorOff";
    v13[6] = @"HFCAPackageIconIdentifierAirport";
    v13[7] = @"HFImageIconIdentifierGeneric";
    v13[8] = @"HFCAPackageIconIdentifierCarbonMonoxideSensor";
    v13[9] = @"HFCAPackageIconIdentifierCarbonDioxideSensor";
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:10];
    v9->_shouldForceLTR = [v10 containsObject:v7];
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 identifier];
    id v7 = [(HFPrimaryStateIconDescriptor *)self identifier];
    char v8 = [v6 isEqualToString:v7];

    uint64_t v9 = [v5 primaryState];
    if (v9 == [(HFPrimaryStateIconDescriptor *)self primaryState]) {
      BOOL v10 = v8;
    }
    else {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(HFPrimaryStateIconDescriptor *)self identifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(HFPrimaryStateIconDescriptor *)self primaryState] ^ v4;

  return v5;
}

- (id)iconDescriptorByMergingWithIconDescriptor:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 identifier],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [(HFPrimaryStateIconDescriptor *)self identifier],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqualToString:v6],
        v6,
        v5,
        v7))
  {
    int64_t v8 = [(HFPrimaryStateIconDescriptor *)self primaryState];
    if (v8 == [v4 primaryState]) {
      int64_t v9 = [(HFPrimaryStateIconDescriptor *)self primaryState];
    }
    else {
      int64_t v9 = 2;
    }
    id v11 = objc_alloc((Class)objc_opt_class());
    objc_super v12 = [(HFPrimaryStateIconDescriptor *)self identifier];
    BOOL v10 = (void *)[v11 initWithIdentifier:v12 primaryState:v9];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    int64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[HFPrimaryStateIconDescriptor primaryState](self, "primaryState"));
    int64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "primaryState"));
    int64_t v10 = [v8 compare:v9];
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)shouldForceLTR
{
  return self->_shouldForceLTR;
}

- (int64_t)primaryState
{
  return self->_primaryState;
}

- (void).cxx_destruct
{
}

@end