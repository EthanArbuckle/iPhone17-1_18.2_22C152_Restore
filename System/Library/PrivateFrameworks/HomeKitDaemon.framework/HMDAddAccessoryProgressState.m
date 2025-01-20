@interface HMDAddAccessoryProgressState
- (HMAccessoryCategory)category;
- (HMDAddAccessoryProgressState)initWithUUID:(id)a3 accessoryName:(id)a4 manufacturerName:(id)a5 category:(id)a6 certificationStatus:(unint64_t)a7 productData:(id)a8;
- (NSString)accessoryName;
- (NSString)manufacturerName;
- (NSString)productData;
- (NSUUID)accessoryUUID;
- (id)description;
- (unint64_t)certificationStatus;
@end

@implementation HMDAddAccessoryProgressState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (NSString)productData
{
  return self->_productData;
}

- (unint64_t)certificationStatus
{
  return self->_certificationStatus;
}

- (HMAccessoryCategory)category
{
  return self->_category;
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDAddAccessoryProgressState *)self accessoryUUID];
  v5 = [(HMDAddAccessoryProgressState *)self accessoryName];
  v6 = [(HMDAddAccessoryProgressState *)self manufacturerName];
  v7 = [v3 stringWithFormat:@"HMDAddAccessoryProgressState - uuid: %@, name: %@, mfg: %@", v4, v5, v6];

  return v7;
}

- (HMDAddAccessoryProgressState)initWithUUID:(id)a3 accessoryName:(id)a4 manufacturerName:(id)a5 category:(id)a6 certificationStatus:(unint64_t)a7 productData:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDAddAccessoryProgressState;
  v18 = [(HMDAddAccessoryProgressState *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accessoryUUID, a3);
    objc_storeStrong((id *)&v19->_accessoryName, a4);
    objc_storeStrong((id *)&v19->_manufacturerName, a5);
    objc_storeStrong((id *)&v19->_category, a6);
    v19->_certificationStatus = a7;
    objc_storeStrong((id *)&v19->_productData, a8);
  }

  return v19;
}

@end