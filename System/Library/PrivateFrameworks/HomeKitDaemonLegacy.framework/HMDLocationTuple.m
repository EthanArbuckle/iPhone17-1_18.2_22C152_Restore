@interface HMDLocationTuple
- (CLLocation)location;
- (HMDLocationTuple)initWithLocation:(id)a3 reachableIPAccessoryCount:(unint64_t)a4 reachableBTLEAccessoryCount:(unint64_t)a5 reachableMediaAccessoryCount:(unint64_t)a6;
- (id)attributeDescriptions;
- (unint64_t)reachableBTLEAccessoryCount;
- (unint64_t)reachableIPAccessoryCount;
- (unint64_t)reachableMediaAccessoryCount;
@end

@implementation HMDLocationTuple

- (void).cxx_destruct
{
}

- (unint64_t)reachableMediaAccessoryCount
{
  return self->_reachableMediaAccessoryCount;
}

- (unint64_t)reachableBTLEAccessoryCount
{
  return self->_reachableBTLEAccessoryCount;
}

- (unint64_t)reachableIPAccessoryCount
{
  return self->_reachableIPAccessoryCount;
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDLocationTuple *)self location];
  v5 = locationAsString(v4);
  v6 = (void *)[v3 initWithName:@"Location" value:v5];
  v18[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDLocationTuple reachableIPAccessoryCount](self, "reachableIPAccessoryCount"));
  v9 = (void *)[v7 initWithName:@"Reachable IP Accessory Count" value:v8];
  v18[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDLocationTuple reachableBTLEAccessoryCount](self, "reachableBTLEAccessoryCount"));
  v12 = (void *)[v10 initWithName:@"Reachable BTLE Accessory Count" value:v11];
  v18[2] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDLocationTuple reachableMediaAccessoryCount](self, "reachableMediaAccessoryCount"));
  v15 = (void *)[v13 initWithName:@"Reachable Media Accessory Count" value:v14];
  v18[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];

  return v16;
}

- (HMDLocationTuple)initWithLocation:(id)a3 reachableIPAccessoryCount:(unint64_t)a4 reachableBTLEAccessoryCount:(unint64_t)a5 reachableMediaAccessoryCount:(unint64_t)a6
{
  id v11 = a3;
  if (v11)
  {
    v12 = v11;
    v18.receiver = self;
    v18.super_class = (Class)HMDLocationTuple;
    id v13 = [(HMDLocationTuple *)&v18 init];
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_location, a3);
      v14->_reachableIPAccessoryCount = a4;
      v14->_reachableBTLEAccessoryCount = a5;
      v14->_reachableMediaAccessoryCount = a6;
    }

    return v14;
  }
  else
  {
    v16 = (HMDAccessorySettingsMetadata *)_HMFPreconditionFailure();
    [(HMDAccessorySettingsMetadata *)v16 .cxx_destruct];
  }
  return result;
}

@end