@interface HFIncrementalStateIconDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldForceLTR;
- (HFIncrementalStateIconDescriptor)initWithIdentifier:(id)a3 incrementalState:(id)a4;
- (NSNumber)incrementalState;
- (NSString)identifier;
- (id)iconDescriptorByMergingWithIconDescriptor:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
@end

@implementation HFIncrementalStateIconDescriptor

- (HFIncrementalStateIconDescriptor)initWithIdentifier:(id)a3 incrementalState:(id)a4
{
  v14[10] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HFIncrementalStateIconDescriptor;
  v9 = [(HFIncrementalStateIconDescriptor *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_incrementalState, a4);
    v14[0] = @"HFImageIconIdentifierAppleTVRegular";
    v14[1] = @"HFImageIconIdentifierAppleTVSmall";
    v14[2] = @"HFImageIconIdentifierServiceCarbonDioxideSensorOn";
    v14[3] = @"HFImageIconIdentifierServiceCarbonDioxideSensorOff";
    v14[4] = @"HFImageIconIdentifierServiceCarbonMonoxideSensorOn";
    v14[5] = @"HFImageIconIdentifierServiceCarbonMonoxideSensorOff";
    v14[6] = @"HFCAPackageIconIdentifierAirport";
    v14[7] = @"HFImageIconIdentifierGeneric";
    v14[8] = @"HFCAPackageIconIdentifierCarbonMonoxideSensor";
    v14[9] = @"HFCAPackageIconIdentifierCarbonDioxideSensor";
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:10];
    v10->_shouldForceLTR = [v11 containsObject:v7];
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 identifier];
    id v7 = [(HFIncrementalStateIconDescriptor *)self identifier];
    int v8 = [v6 isEqualToString:v7];

    v9 = [v5 incrementalState];
    v10 = [(HFIncrementalStateIconDescriptor *)self incrementalState];
    if (v9 != v10)
    {
      v11 = [(HFIncrementalStateIconDescriptor *)self incrementalState];
      if (v11)
      {
        v12 = [v5 incrementalState];
        objc_super v13 = [(HFIncrementalStateIconDescriptor *)self incrementalState];
        v8 &= [v12 isEqualToNumber:v13];
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(HFIncrementalStateIconDescriptor *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(HFIncrementalStateIconDescriptor *)self incrementalState];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)iconDescriptorByMergingWithIconDescriptor:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 identifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [(HFIncrementalStateIconDescriptor *)self identifier],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqualToString:v6],
        v6,
        v5,
        v7))
  {
    int v8 = (HFIncrementalStateIconDescriptor *)v4;
    uint64_t v9 = [(HFIncrementalStateIconDescriptor *)self incrementalState];
    v10 = (void *)v9;
    if (v9) {
      v11 = (void *)v9;
    }
    else {
      v11 = &unk_26C0F7F08;
    }
    uint64_t v12 = [(HFIncrementalStateIconDescriptor *)v8 incrementalState];
    objc_super v13 = (void *)v12;
    if (v12) {
      v14 = (void *)v12;
    }
    else {
      v14 = &unk_26C0F7F08;
    }
    if ([v11 compare:v14] == 1) {
      v15 = self;
    }
    else {
      v15 = v8;
    }
    v16 = [(HFIncrementalStateIconDescriptor *)v15 incrementalState];

    if ([v16 isEqual:&unk_26C0F7F08])
    {

      v16 = 0;
    }
    id v17 = objc_alloc((Class)objc_opt_class());
    v18 = [(HFIncrementalStateIconDescriptor *)self identifier];
    v19 = (void *)[v17 initWithIdentifier:v18 incrementalState:v16];
  }
  else
  {
    v19 = 0;
  }

  return v19;
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
    int v8 = [(HFIncrementalStateIconDescriptor *)self incrementalState];
    uint64_t v9 = [v7 incrementalState];
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

- (NSNumber)incrementalState
{
  return self->_incrementalState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incrementalState, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end