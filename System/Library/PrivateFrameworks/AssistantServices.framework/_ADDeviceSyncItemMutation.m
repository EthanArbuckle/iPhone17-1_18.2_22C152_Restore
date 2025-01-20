@interface _ADDeviceSyncItemMutation
- (BOOL)isDirty;
- (_ADDeviceSyncItemMutation)initWithBase:(id)a3;
- (id)getProperties;
- (id)getUUID;
- (void)setProperties:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation _ADDeviceSyncItemMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setProperties:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getProperties
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_properties;
  }
  else
  {
    v2 = [(ADDeviceSyncItem *)self->_base properties];
  }
  return v2;
}

- (void)setUUID:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getUUID
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_UUID;
  }
  else
  {
    v2 = [(ADDeviceSyncItem *)self->_base UUID];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADDeviceSyncItemMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADDeviceSyncItemMutation;
  v6 = [(_ADDeviceSyncItemMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end