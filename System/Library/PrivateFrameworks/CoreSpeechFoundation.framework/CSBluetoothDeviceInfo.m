@interface CSBluetoothDeviceInfo
- (BOOL)isTemporaryPairedNotInContacts;
- (BOOL)supportDoAP;
- (BOOL)supportMph;
- (NSString)address;
- (NSString)deviceIdentifier;
- (void)setAddress:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setIsTemporaryPairedNotInContacts:(BOOL)a3;
- (void)setSupportDoAP:(BOOL)a3;
- (void)setSupportMph:(BOOL)a3;
@end

@implementation CSBluetoothDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (NSString)address
{
  return self->_address;
}

- (BOOL)supportDoAP
{
  return self->_supportDoAP;
}

- (void)setIsTemporaryPairedNotInContacts:(BOOL)a3
{
  self->_isTemporaryPairedNotInContacts = a3;
}

- (BOOL)isTemporaryPairedNotInContacts
{
  return self->_isTemporaryPairedNotInContacts;
}

- (void)setSupportMph:(BOOL)a3
{
  self->_supportMph = a3;
}

- (BOOL)supportMph
{
  return self->_supportMph;
}

- (void)setSupportDoAP:(BOOL)a3
{
  self->_supportDoAP = a3;
}

- (void)setAddress:(id)a3
{
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

@end