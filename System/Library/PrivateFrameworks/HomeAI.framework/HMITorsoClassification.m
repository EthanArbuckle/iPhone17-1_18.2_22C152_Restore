@interface HMITorsoClassification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMITorsoClassification)initWithCoder:(id)a3;
- (HMITorsoClassification)initWithPersonUUID:(id)a3 sourceUUID:(id)a4 confidence:(double)a5;
- (NSUUID)personUUID;
- (NSUUID)sourceUUID;
- (double)confidence;
- (id)attributeDescriptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMITorsoClassification

- (HMITorsoClassification)initWithPersonUUID:(id)a3 sourceUUID:(id)a4 confidence:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMITorsoClassification;
  v11 = [(HMITorsoClassification *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceUUID, a4);
    objc_storeStrong((id *)&v12->_personUUID, a3);
    v12->_confidence = a5;
  }

  return v12;
}

- (id)attributeDescriptions
{
  v16[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMITorsoClassification *)self personUUID];
  v5 = (void *)[v3 initWithName:@"Person UUID" value:v4];
  v16[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMITorsoClassification *)self sourceUUID];
  v8 = (void *)[v6 initWithName:@"Source UUID" value:v7];
  v16[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  id v10 = NSString;
  [(HMITorsoClassification *)self confidence];
  v12 = objc_msgSend(v10, "stringWithFormat:", @"%.4lf", v11);
  v13 = (void *)[v9 initWithName:@"Confidence" value:v12];
  v16[2] = v13;
  objc_super v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMITorsoClassification *)a3;
  if (v4 == self)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(HMITorsoClassification *)self sourceUUID];
      v7 = [(HMITorsoClassification *)v5 sourceUUID];
      int v8 = HMFEqualObjects();

      if (v8
        && ([(HMITorsoClassification *)self personUUID],
            id v9 = objc_claimAutoreleasedReturnValue(),
            [(HMITorsoClassification *)v5 personUUID],
            id v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = HMFEqualObjects(),
            v10,
            v9,
            v11))
      {
        [(HMITorsoClassification *)self confidence];
        double v13 = v12;
        [(HMITorsoClassification *)v5 confidence];
        BOOL v15 = vabdd_f64(v13, v14) < 2.22044605e-16;
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMITorsoClassification)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMITC.su"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMITC.pu"];
  [v4 decodeDoubleForKey:@"HMITC.conf"];
  double v8 = v7;

  id v9 = [(HMITorsoClassification *)self initWithPersonUUID:v6 sourceUUID:v5 confidence:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(HMITorsoClassification *)self sourceUUID];
  [v6 encodeObject:v4 forKey:@"HMITC.su"];

  v5 = [(HMITorsoClassification *)self personUUID];
  [v6 encodeObject:v5 forKey:@"HMITC.pu"];

  [(HMITorsoClassification *)self confidence];
  objc_msgSend(v6, "encodeDouble:forKey:", @"HMITC.conf");
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personUUID, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
}

@end