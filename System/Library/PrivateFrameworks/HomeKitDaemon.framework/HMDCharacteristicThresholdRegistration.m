@interface HMDCharacteristicThresholdRegistration
- (BOOL)isEqual:(id)a3;
- (HMDCharacteristicThresholdRegistration)initWithClientID:(id)a3 updateThreshold:(id)a4;
- (NSNumber)updateThreshold;
- (NSString)clientID;
- (unint64_t)hash;
@end

@implementation HMDCharacteristicThresholdRegistration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateThreshold, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

- (NSNumber)updateThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)clientID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(HMDCharacteristicThresholdRegistration *)self clientID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDCharacteristicThresholdRegistration *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMDCharacteristicThresholdRegistration *)self clientID];
      v8 = [(HMDCharacteristicThresholdRegistration *)v6 clientID];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (HMDCharacteristicThresholdRegistration)initWithClientID:(id)a3 updateThreshold:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCharacteristicThresholdRegistration;
  v8 = [(HMDCharacteristicThresholdRegistration *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    clientID = v8->_clientID;
    v8->_clientID = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    updateThreshold = v8->_updateThreshold;
    v8->_updateThreshold = (NSNumber *)v11;
  }
  return v8;
}

@end