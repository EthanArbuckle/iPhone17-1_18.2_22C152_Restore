@interface HDDeviceKeyValueStorageGroup
- (HDDeviceContext)deviceContext;
- (HDDeviceKeyValueStorageGroup)initWithDeviceContext:(id)a3 storageEntries:(id)a4;
- (NSArray)storageEntries;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HDDeviceKeyValueStorageGroup

- (HDDeviceKeyValueStorageGroup)initWithDeviceContext:(id)a3 storageEntries:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDDeviceKeyValueStorageGroup;
  v9 = [(HDDeviceKeyValueStorageGroup *)&v14 init];
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

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HDDeviceKeyValueStorageGroup allocWithZone:a3];
  deviceContext = self->_deviceContext;
  storageEntries = self->_storageEntries;

  return [(HDDeviceKeyValueStorageGroup *)v4 initWithDeviceContext:deviceContext storageEntries:storageEntries];
}

- (HDDeviceContext)deviceContext
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