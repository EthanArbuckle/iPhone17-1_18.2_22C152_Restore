@interface HMDLocationClusterGroup
- (CLLocation)center;
- (HMDLocationClusterGroup)initWithCenter:(id)a3;
- (NSMutableArray)locations;
- (id)attributeDescriptions;
@end

@implementation HMDLocationClusterGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_center, 0);
}

- (NSMutableArray)locations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (CLLocation)center
{
  return (CLLocation *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDLocationClusterGroup *)self center];
  v5 = locationAsString(v4);
  v6 = (void *)[v3 initWithName:@"Center" value:v5];
  v12[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMDLocationClusterGroup *)self locations];
  v9 = (void *)[v7 initWithName:@"Locations" value:v8];
  v12[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  return v10;
}

- (HMDLocationClusterGroup)initWithCenter:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v15.receiver = self;
    v15.super_class = (Class)HMDLocationClusterGroup;
    id v7 = [(HMDLocationClusterGroup *)&v15 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_center, a3);
      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
      locations = v8->_locations;
      v8->_locations = (NSMutableArray *)v9;
    }
    return v8;
  }
  else
  {
    v12 = (HMDLocationCluster *)_HMFPreconditionFailure();
    return (HMDLocationClusterGroup *)[(HMDLocationCluster *)v12 clusterWithGroups:v14];
  }
}

@end