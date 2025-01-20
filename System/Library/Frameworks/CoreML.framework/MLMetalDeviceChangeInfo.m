@interface MLMetalDeviceChangeInfo
- (MLMetalDeviceChangeInfo)initWithMetalDevice:(id)a3 changeType:(int64_t)a4;
- (MTLDevice)metalDevice;
- (int64_t)changeType;
@end

@implementation MLMetalDeviceChangeInfo

- (void).cxx_destruct
{
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (MTLDevice)metalDevice
{
  return self->_metalDevice;
}

- (MLMetalDeviceChangeInfo)initWithMetalDevice:(id)a3 changeType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLMetalDeviceChangeInfo;
  v8 = [(MLMetalDeviceChangeInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_metalDevice, a3);
    v9->_changeType = a4;
  }

  return v9;
}

@end