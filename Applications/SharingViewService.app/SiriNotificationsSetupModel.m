@interface SiriNotificationsSetupModel
- (BOOL)deviceSupportsInEarDetection;
- (BOOL)isSiriAllowedWhileLocked;
- (BOOL)isUpsellFlow;
- (NSString)localizedDeviceName;
- (int64_t)viewType;
- (unsigned)deviceProductID;
- (void)setDeviceProductID:(unsigned int)a3;
- (void)setDeviceSupportsInEarDetection:(BOOL)a3;
- (void)setIsSiriAllowedWhileLocked:(BOOL)a3;
- (void)setIsUpsellFlow:(BOOL)a3;
- (void)setLocalizedDeviceName:(id)a3;
- (void)setViewType:(int64_t)a3;
@end

@implementation SiriNotificationsSetupModel

- (void).cxx_destruct
{
}

- (void)setViewType:(int64_t)a3
{
  self->_viewType = a3;
}

- (int64_t)viewType
{
  return self->_viewType;
}

- (void)setLocalizedDeviceName:(id)a3
{
}

- (NSString)localizedDeviceName
{
  return self->_localizedDeviceName;
}

- (void)setIsSiriAllowedWhileLocked:(BOOL)a3
{
  self->_isSiriAllowedWhileLocked = a3;
}

- (BOOL)isSiriAllowedWhileLocked
{
  return self->_isSiriAllowedWhileLocked;
}

- (void)setIsUpsellFlow:(BOOL)a3
{
  self->_isUpsellFlow = a3;
}

- (BOOL)isUpsellFlow
{
  return self->_isUpsellFlow;
}

- (void)setDeviceSupportsInEarDetection:(BOOL)a3
{
  self->_deviceSupportsInEarDetection = a3;
}

- (BOOL)deviceSupportsInEarDetection
{
  return self->_deviceSupportsInEarDetection;
}

- (void)setDeviceProductID:(unsigned int)a3
{
  self->_deviceProductID = a3;
}

- (unsigned)deviceProductID
{
  return self->_deviceProductID;
}

@end