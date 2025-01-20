@interface HMDHomeManagerHomeHandle
+ (BOOL)supportsSecureCoding;
- (HMDHomeManagerHomeHandle)initWithBackingStoreUUID:(id)a3 homeUUID:(id)a4;
- (HMDHomeManagerHomeHandle)initWithCoder:(id)a3;
- (NSUUID)backingStoreUUID;
- (NSUUID)homeUUID;
- (id)attributeDescriptions;
- (id)shortDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDHomeManagerHomeHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);

  objc_storeStrong((id *)&self->_backingStoreUUID, 0);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)backingStoreUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  id v3 = objc_alloc((Class)HMFAttributeDescription);
  v4 = [(HMDHomeManagerHomeHandle *)self homeUUID];
  id v5 = [v3 initWithName:@"homeUUID" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc((Class)HMFAttributeDescription);
  v7 = [(HMDHomeManagerHomeHandle *)self backingStoreUUID];
  id v8 = [v6 initWithName:@"backingStoreUUID" value:v7];
  v11[1] = v8;
  v9 = +[NSArray arrayWithObjects:v11 count:2];

  return v9;
}

- (id)shortDescription
{
  id v3 = [(id)objc_opt_class() shortDescription];
  v4 = [(HMDHomeManagerHomeHandle *)self homeUUID];
  id v5 = [(HMDHomeManagerHomeHandle *)self backingStoreUUID];
  id v6 = +[NSString stringWithFormat:@"%@ %@,%@", v3, v4, v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeManagerHomeHandle *)self backingStoreUUID];
  [v4 encodeObject:v5 forKey:@"HMHH.b"];

  id v6 = [(HMDHomeManagerHomeHandle *)self homeUUID];
  [v4 encodeObject:v6 forKey:@"HMHH.h"];
}

- (HMDHomeManagerHomeHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMHH.b"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMHH.h"];

  v7 = [(HMDHomeManagerHomeHandle *)self initWithBackingStoreUUID:v5 homeUUID:v6];
  return v7;
}

- (HMDHomeManagerHomeHandle)initWithBackingStoreUUID:(id)a3 homeUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHomeManagerHomeHandle;
  v9 = [(HMDHomeManagerHomeHandle *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingStoreUUID, a3);
    objc_storeStrong((id *)&v10->_homeUUID, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end