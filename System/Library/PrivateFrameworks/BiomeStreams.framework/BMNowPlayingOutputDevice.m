@interface BMNowPlayingOutputDevice
- (BMNowPlayingOutputDevice)initWithDeviceType:(unint64_t)a3 deviceSubType:(unint64_t)a4 deviceId:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)deviceId;
- (id)proto;
- (unint64_t)deviceSubType;
- (unint64_t)deviceType;
- (unint64_t)hash;
- (void)proto;
@end

@implementation BMNowPlayingOutputDevice

- (BMNowPlayingOutputDevice)initWithDeviceType:(unint64_t)a3 deviceSubType:(unint64_t)a4 deviceId:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMNowPlayingOutputDevice;
  v9 = [(BMNowPlayingOutputDevice *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_deviceType = a3;
    v9->_deviceSubType = a4;
    uint64_t v11 = [v8 copy];
    deviceId = v10->_deviceId;
    v10->_deviceId = (NSString *)v11;
  }
  return v10;
}

- (id)proto
{
  v3 = objc_opt_new();
  unint64_t deviceType = self->_deviceType;
  uint64_t v5 = 0;
  int v6 = 1;
  switch(deviceType)
  {
    case 0uLL:
      break;
    case 1uLL:
      uint64_t v5 = 1;
      break;
    case 2uLL:
      uint64_t v5 = 2;
      break;
    case 3uLL:
      uint64_t v5 = 3;
      break;
    case 4uLL:
      uint64_t v5 = 4;
      break;
    case 5uLL:
      uint64_t v5 = 5;
      break;
    default:
      v7 = __biome_log_for_category();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[BMNowPlayingOutputDevice proto](deviceType);
      }

      int v6 = 0;
      uint64_t v5 = 0xFFFFFFFFLL;
      break;
  }
  unint64_t deviceSubType = self->_deviceSubType;
  if (deviceSubType >= 0x15)
  {
    v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[BMNowPlayingOutputDevice proto](deviceSubType);
    }
  }
  else if (v6)
  {
    [v3 setOutputDeviceType:v5];
    [v3 setOutputDeviceSubType:deviceSubType];
    [v3 setOutputDeviceId:self->_deviceId];
    id v9 = v3;
    goto LABEL_17;
  }
  id v9 = 0;
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_deviceSubType - self->_deviceType + 32 * self->_deviceType;
  return [(NSString *)self->_deviceId hash] - v2 + 32 * v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t deviceType = self->_deviceType;
    if (deviceType == [v5 deviceType]
      && (unint64_t deviceSubType = (void *)self->_deviceSubType, deviceSubType == (void *)[v5 deviceSubType]))
    {
      deviceId = self->_deviceId;
      id v9 = deviceId;
      if (!deviceId)
      {
        unint64_t deviceSubType = [v5 deviceId];
        if (!deviceSubType)
        {
          char v11 = 1;
LABEL_14:

          goto LABEL_11;
        }
        id v9 = self->_deviceId;
      }
      v10 = [v5 deviceId];
      char v11 = [(NSString *)v9 isEqual:v10];

      if (!deviceId) {
        goto LABEL_14;
      }
    }
    else
    {
      char v11 = 0;
    }
LABEL_11:

    goto LABEL_12;
  }
  char v11 = 0;
LABEL_12:

  return v11;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (unint64_t)deviceSubType
{
  return self->_deviceSubType;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void).cxx_destruct
{
}

- (void)proto
{
  v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMNowPlayingEvent: unable to convert BMNowPlayingAVOutputDeviceType enum value: %@", v4, v5, v6, v7, v8);
}

@end