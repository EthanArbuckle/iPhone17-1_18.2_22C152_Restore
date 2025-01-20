@interface HKDeviceKeyValueStorageGroup
+ (BOOL)supportsSecureCoding;
- (HKDeviceContext)deviceContext;
- (HKDeviceKeyValueStorageGroup)initWithCoder:(id)a3;
- (HKDeviceKeyValueStorageGroup)initWithDeviceContext:(id)a3 storageEntries:(id)a4;
- (NSArray)storageEntries;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKDeviceKeyValueStorageGroup

- (HKDeviceKeyValueStorageGroup)initWithDeviceContext:(id)a3 storageEntries:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKDeviceKeyValueStorageGroup;
  v9 = [(HKDeviceKeyValueStorageGroup *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceContext, a3);
    uint64_t v11 = [v8 copy];
    storageEntries = v10->_storageEntries;
    v10->_storageEntries = (NSArray *)v11;
  }
  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p context:%@ entries:%@", objc_opt_class(), self, self->_deviceContext, self->_storageEntries];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HKDeviceKeyValueStorageGroup allocWithZone:a3];
  deviceContext = self->_deviceContext;
  storageEntries = self->_storageEntries;

  return [(HKDeviceKeyValueStorageGroup *)v4 initWithDeviceContext:deviceContext storageEntries:storageEntries];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  deviceContext = self->_deviceContext;
  id v5 = a3;
  [v5 encodeObject:deviceContext forKey:@"DeviceContext"];
  [v5 encodeObject:self->_storageEntries forKey:@"StorageEntries"];
}

- (HKDeviceKeyValueStorageGroup)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceContext"];
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v8 = (void *)[v6 initWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"StorageEntries"];

  v10 = 0;
  if (v5 && v9)
  {
    self = [(HKDeviceKeyValueStorageGroup *)self initWithDeviceContext:v5 storageEntries:v9];
    v10 = self;
  }

  return v10;
}

- (HKDeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (NSArray)storageEntries
{
  return self->_storageEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageEntries, 0);

  objc_storeStrong((id *)&self->_deviceContext, 0);
}

@end