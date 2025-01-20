@interface IRReplayDeviceAttributes
- (NSString)deviceId;
- (NSString)deviceName;
- (NSString)modelId;
- (void)setDeviceId:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setModelId:(id)a3;
@end

@implementation IRReplayDeviceAttributes

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_modelId, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end