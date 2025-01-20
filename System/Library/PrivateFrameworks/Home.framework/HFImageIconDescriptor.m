@interface HFImageIconDescriptor
- (BOOL)isDemoModeDescriptor;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemImage;
- (BOOL)shouldForceLTR;
- (HFImageIconDescriptor)imageIconDescriptorWithUpdatedImageSymbolConfiguration:(id)a3;
- (HFImageIconDescriptor)initWithDemoModeImageIdentifier:(id)a3;
- (HFImageIconDescriptor)initWithImageIdentifier:(id)a3;
- (HFImageIconDescriptor)initWithSymbolIconConfiguration:(id)a3;
- (HFImageIconDescriptor)initWithSystemImageNamed:(id)a3;
- (HFImageIconDescriptor)initWithSystemImageNamed:(id)a3 configuration:(id)a4;
- (NSString)description;
- (NSString)imageIdentifier;
- (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (id)iconDescriptorByMergingWithIconDescriptor:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)setIsDemoModeDescriptor:(BOOL)a3;
@end

@implementation HFImageIconDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
}

- (NSString)description
{
  BOOL isSystemImage = self->_isSystemImage;
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  uint64_t v7 = [(HFImageIconDescriptor *)self imageIdentifier];
  v8 = (void *)v7;
  if (isSystemImage)
  {
    v9 = [(HFImageIconDescriptor *)self imageSymbolConfiguration];
    v10 = [v4 stringWithFormat:@"<%@: %p, \"%@\", %@>", v6, self, v8, v9];
  }
  else
  {
    v10 = [v4 stringWithFormat:@"<%@: %p, \"%@\">", v6, self, v7];
  }

  return (NSString *)v10;
}

- (HFImageIconDescriptor)imageIconDescriptorWithUpdatedImageSymbolConfiguration:(id)a3
{
  id v4 = a3;
  if (![(HFImageIconDescriptor *)self isSystemImage]) {
    NSLog(&cfstr_CallWithSystem.isa);
  }
  if ([(HFImageIconDescriptor *)self isSystemImage])
  {
    id v5 = objc_alloc((Class)objc_opt_class());
    v6 = [(HFImageIconDescriptor *)self imageIdentifier];
    uint64_t v7 = (void *)[v5 initWithSystemImageNamed:v6 configuration:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (HFImageIconDescriptor *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HFImageIconDescriptor *)a3;
  if (v5 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      uint64_t v7 = [(HFImageIconDescriptor *)self imageIdentifier];
      v8 = [(HFImageIconDescriptor *)v6 imageIdentifier];
      if (![v7 isEqualToString:v8]
        || (BOOL v9 = [(HFImageIconDescriptor *)self isSystemImage],
            v9 != [(HFImageIconDescriptor *)v6 isSystemImage]))
      {
        char v10 = 0;
LABEL_15:

        goto LABEL_16;
      }
      v11 = [(HFImageIconDescriptor *)self imageSymbolConfiguration];
      if (v11
        || ([(HFImageIconDescriptor *)v6 imageSymbolConfiguration],
            (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v12 = [(HFImageIconDescriptor *)self imageSymbolConfiguration];
        v13 = [(HFImageIconDescriptor *)v6 imageSymbolConfiguration];
        char v10 = [v12 isEqualToConfiguration:v13];

        if (v11)
        {
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
        char v10 = 1;
      }

      goto LABEL_14;
    }
    char v10 = 0;
  }
LABEL_16:

  return v10;
}

- (BOOL)isSystemImage
{
  return self->_isSystemImage;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (NSString)imageIdentifier
{
  return self->_imageIdentifier;
}

- (HFImageIconDescriptor)initWithSystemImageNamed:(id)a3
{
  return [(HFImageIconDescriptor *)self initWithSystemImageNamed:a3 configuration:0];
}

- (HFImageIconDescriptor)initWithSymbolIconConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 systemImageName];
  v6 = [v4 configuration];

  uint64_t v7 = [(HFImageIconDescriptor *)self initWithSystemImageNamed:v5 configuration:v6];
  return v7;
}

- (HFImageIconDescriptor)initWithSystemImageNamed:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFImageIconDescriptor;
  BOOL v9 = [(HFImageIconDescriptor *)&v12 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageIdentifier, a3);
    v10->_BOOL isSystemImage = 1;
    objc_storeStrong((id *)&v10->_imageSymbolConfiguration, a4);
  }

  return v10;
}

- (BOOL)isDemoModeDescriptor
{
  return self->_isDemoModeDescriptor;
}

- (HFImageIconDescriptor)initWithImageIdentifier:(id)a3
{
  v10[10] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFImageIconDescriptor;
  v6 = [(HFImageIconDescriptor *)&v9 init];
  if (v6)
  {
    v10[0] = @"HFImageIconIdentifierAppleTVRegular";
    v10[1] = @"HFImageIconIdentifierAppleTVSmall";
    v10[2] = @"HFImageIconIdentifierServiceCarbonDioxideSensorOn";
    v10[3] = @"HFImageIconIdentifierServiceCarbonDioxideSensorOff";
    v10[4] = @"HFImageIconIdentifierServiceCarbonMonoxideSensorOn";
    v10[5] = @"HFImageIconIdentifierServiceCarbonMonoxideSensorOff";
    v10[6] = @"HFCAPackageIconIdentifierAirport";
    v10[7] = @"HFImageIconIdentifierGeneric";
    v10[8] = @"HFCAPackageIconIdentifierCarbonMonoxideSensor";
    v10[9] = @"HFCAPackageIconIdentifierCarbonDioxideSensor";
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:10];
    v6->_shouldForceLTR = [v7 containsObject:v5];

    objc_storeStrong((id *)&v6->_imageIdentifier, a3);
  }

  return v6;
}

- (HFImageIconDescriptor)initWithDemoModeImageIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFImageIconDescriptor;
  v6 = [(HFImageIconDescriptor *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imageIdentifier, a3);
    v7->_isDemoModeDescriptor = 1;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HFImageIconDescriptor *)self imageIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)iconDescriptorByMergingWithIconDescriptor:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 identifier];
    v6 = [(HFImageIconDescriptor *)self identifier];
    if ([v5 isEqualToString:v6]) {
      id v7 = self;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  return 0;
}

- (BOOL)shouldForceLTR
{
  return self->_shouldForceLTR;
}

- (void)setIsDemoModeDescriptor:(BOOL)a3
{
  self->_isDemoModeDescriptor = a3;
}

@end