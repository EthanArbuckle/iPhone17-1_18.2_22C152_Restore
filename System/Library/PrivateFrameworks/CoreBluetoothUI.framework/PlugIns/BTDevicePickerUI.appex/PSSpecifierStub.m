@interface PSSpecifierStub
- (BluetoothDevice)device;
- (id)userInfo;
- (void)setDevice:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation PSSpecifierStub

- (BluetoothDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end