@interface NIBluetoothHostTimeSyncResponse
+ (BOOL)supportsSecureCoding;
- (NIBluetoothHostTimeSyncResponse)initWithCoder:(id)a3;
- (NIBluetoothHostTimeSyncResponse)initWithDeviceEventCount:(unint64_t)a3 uwbDeviceTimeUs:(unint64_t)a4 uwbDeviceTimeUncertainty:(unsigned __int8)a5 uwbClockSkewMeasurementAvailable:(unsigned __int8)a6 deviceMaxPpm:(unsigned __int16)a7 success:(unsigned __int8)a8 retryDelay:(unsigned __int16)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)deviceEventCount;
- (unint64_t)uwbDeviceTimeUs;
- (unsigned)deviceMaxPpm;
- (unsigned)retryDelay;
- (unsigned)success;
- (unsigned)uwbClockSkewMeasurementAvailable;
- (unsigned)uwbDeviceTimeUncertainty;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NIBluetoothHostTimeSyncResponse

- (NIBluetoothHostTimeSyncResponse)initWithDeviceEventCount:(unint64_t)a3 uwbDeviceTimeUs:(unint64_t)a4 uwbDeviceTimeUncertainty:(unsigned __int8)a5 uwbClockSkewMeasurementAvailable:(unsigned __int8)a6 deviceMaxPpm:(unsigned __int16)a7 success:(unsigned __int8)a8 retryDelay:(unsigned __int16)a9
{
  v16.receiver = self;
  v16.super_class = (Class)NIBluetoothHostTimeSyncResponse;
  result = [(NIBluetoothHostTimeSyncResponse *)&v16 init];
  if (result)
  {
    result->_deviceEventCount = a3;
    result->_uwbDeviceTimeUs = a4;
    result->_uwbDeviceTimeUncertainty = a5;
    result->_uwbClockSkewMeasurementAvailable = a6;
    result->_deviceMaxPpm = a7;
    result->_success = a8;
    result->_retryDelay = a9;
  }
  return result;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:\n", v5];

  objc_msgSend(v6, "appendFormat:", @"deviceEventCount:%llu\n", self->_deviceEventCount);
  objc_msgSend(v6, "appendFormat:", @"uwbDeviceTimeUs:%llu\n", self->_uwbDeviceTimeUs);
  objc_msgSend(v6, "appendFormat:", @"uwbDeviceTimeUncertainty:%u\n", self->_uwbDeviceTimeUncertainty);
  objc_msgSend(v6, "appendFormat:", @"uwbClockSkewMeasurementAvailable:%u\n", self->_uwbClockSkewMeasurementAvailable);
  objc_msgSend(v6, "appendFormat:", @"deviceMaxPpm:%u\n", self->_deviceMaxPpm);
  objc_msgSend(v6, "appendFormat:", @"success:%u\n", self->_success);
  objc_msgSend(v6, "appendFormat:", @"retryDelay:%u>", self->_retryDelay);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  LOWORD(v6) = self->_retryDelay;
  return (id)[v4 initWithDeviceEventCount:self->_deviceEventCount uwbDeviceTimeUs:self->_uwbDeviceTimeUs uwbDeviceTimeUncertainty:self->_uwbDeviceTimeUncertainty uwbClockSkewMeasurementAvailable:self->_uwbClockSkewMeasurementAvailable deviceMaxPpm:self->_deviceMaxPpm success:self->_success retryDelay:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_deviceEventCount forKey:@"deviceEventCount"];
  [v4 encodeInt64:self->_uwbDeviceTimeUs forKey:@"uwbDeviceTimeUs"];
  [v4 encodeInt:self->_uwbDeviceTimeUncertainty forKey:@"uwbDeviceTimeUncertainty"];
  [v4 encodeInt:self->_uwbClockSkewMeasurementAvailable forKey:@"uwbClockSkewMeasurementAvailable"];
  [v4 encodeInt:self->_deviceMaxPpm forKey:@"deviceMaxPpm"];
  [v4 encodeInt:self->_success forKey:@"success"];
  [v4 encodeInt:self->_retryDelay forKey:@"retryDelay"];
}

- (NIBluetoothHostTimeSyncResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self)
  {
    self->_deviceEventCount = [v4 decodeInt64ForKey:@"deviceEventCount"];
    self->_uwbDeviceTimeUs = [v5 decodeInt64ForKey:@"uwbDeviceTimeUs"];
    self->_uwbDeviceTimeUncertainty = [v5 decodeIntForKey:@"uwbDeviceTimeUncertainty"];
    self->_uwbClockSkewMeasurementAvailable = [v5 decodeIntForKey:@"uwbClockSkewMeasurementAvailable"];
    self->_deviceMaxPpm = [v5 decodeIntForKey:@"deviceMaxPpm"];
    self->_success = [v5 decodeIntForKey:@"success"];
    self->_retryDelay = [v5 decodeIntForKey:@"retryDelay"];
  }

  return self;
}

- (unint64_t)deviceEventCount
{
  return self->_deviceEventCount;
}

- (unint64_t)uwbDeviceTimeUs
{
  return self->_uwbDeviceTimeUs;
}

- (unsigned)uwbDeviceTimeUncertainty
{
  return self->_uwbDeviceTimeUncertainty;
}

- (unsigned)uwbClockSkewMeasurementAvailable
{
  return self->_uwbClockSkewMeasurementAvailable;
}

- (unsigned)deviceMaxPpm
{
  return self->_deviceMaxPpm;
}

- (unsigned)success
{
  return self->_success;
}

- (unsigned)retryDelay
{
  return self->_retryDelay;
}

@end