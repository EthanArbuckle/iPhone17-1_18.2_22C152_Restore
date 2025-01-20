@interface CURangingSample
- (NSData)deviceAddress;
- (NSString)deviceModel;
- (id)description;
- (int)channel;
- (int)rawRSSI;
- (void)setChannel:(int)a3;
- (void)setDeviceAddress:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setRawRSSI:(int)a3;
@end

@implementation CURangingSample

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
}

- (void)setRawRSSI:(int)a3
{
  self->_rawRSSI = a3;
}

- (int)rawRSSI
{
  return self->_rawRSSI;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceAddress:(id)a3
{
}

- (NSData)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setChannel:(int)a3
{
  self->_channel = a3;
}

- (int)channel
{
  return self->_channel;
}

- (id)description
{
  return NSPrintF((uint64_t)"DA %@, Md %@, RSSI %d, Ch %d", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_deviceAddress);
}

@end