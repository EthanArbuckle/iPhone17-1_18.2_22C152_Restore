@interface AVClusterComponentOutputDeviceDescription
- (AVClusterComponentOutputDeviceDescription)initWithDeviceID:(id)a3 deviceName:(id)a4 deviceSubType:(int64_t)a5 isClusterLeader:(BOOL)a6 modelID:(id)a7;
- (BOOL)isClusterLeader;
- (NSString)deviceID;
- (NSString)deviceName;
- (NSString)modelID;
- (int64_t)deviceSubType;
- (int64_t)deviceType;
- (void)dealloc;
@end

@implementation AVClusterComponentOutputDeviceDescription

- (AVClusterComponentOutputDeviceDescription)initWithDeviceID:(id)a3 deviceName:(id)a4 deviceSubType:(int64_t)a5 isClusterLeader:(BOOL)a6 modelID:(id)a7
{
  v17.receiver = self;
  v17.super_class = (Class)AVClusterComponentOutputDeviceDescription;
  v12 = [(AVClusterComponentOutputDeviceDescription *)&v17 init];
  if (v12
    && (uint64_t v13 = [a3 copy], (v12->_deviceID = (NSString *)v13) != 0)
    && (uint64_t v14 = [a4 copy], (v12->_deviceName = (NSString *)v14) != 0))
  {
    v12->_modelID = (NSString *)[a7 copy];
    v12->_deviceType = 0;
    v12->_deviceSubType = a5;
    v12->_isClusterLeader = a6;
    v15 = v12;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVClusterComponentOutputDeviceDescription;
  [(AVClusterComponentOutputDeviceDescription *)&v3 dealloc];
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (int64_t)deviceSubType
{
  return self->_deviceSubType;
}

- (BOOL)isClusterLeader
{
  return self->_isClusterLeader;
}

- (NSString)modelID
{
  return self->_modelID;
}

@end