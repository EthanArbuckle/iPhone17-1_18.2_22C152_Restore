@interface _AFBluetoothWirelessSplitterSessionInfoMutation
- (BOOL)isDirty;
- (_AFBluetoothWirelessSplitterSessionInfoMutation)initWithBase:(id)a3;
- (id)getDeviceAddresses;
- (int64_t)getState;
- (void)setDeviceAddresses:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation _AFBluetoothWirelessSplitterSessionInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAddresses, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setDeviceAddresses:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getDeviceAddresses
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_deviceAddresses;
  }
  else
  {
    v2 = [(AFBluetoothWirelessSplitterSessionInfo *)self->_base deviceAddresses];
  }
  return v2;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (int64_t)getState
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_state;
  }
  else {
    return [(AFBluetoothWirelessSplitterSessionInfo *)self->_base state];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFBluetoothWirelessSplitterSessionInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFBluetoothWirelessSplitterSessionInfoMutation;
  v6 = [(_AFBluetoothWirelessSplitterSessionInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end