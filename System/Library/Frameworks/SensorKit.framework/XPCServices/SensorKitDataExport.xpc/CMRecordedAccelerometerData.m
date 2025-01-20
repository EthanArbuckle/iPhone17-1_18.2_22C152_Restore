@interface CMRecordedAccelerometerData
- (BOOL)sr_prefersUTF8StringRepresentation;
- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3;
@end

@implementation CMRecordedAccelerometerData

- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3
{
  [(CMRecordedAccelerometerData *)self acceleration];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(NSDate *)[(CMRecordedAccelerometerData *)self startDate] timeIntervalSinceReferenceDate];
  double v12 = v11;
  [(CMRecordedAccelerometerData *)self timestamp];
  LODWORD(result) = snprintf_l(byte_100016BA8, 0xC7uLL, 0, "{\"acceleration\": {\"x\": %0.*g, \"y\": %0.*g, \"z\": %0.*g}, \"start\": %0.*g, \"timestamp\": %0.*g, \"identifier\": %llu}", 17, v6, 17, v8, 17, v10, 17, v12, 17, v13, [(CMRecordedAccelerometerData *)self identifier]);
  if ((int)result <= 0) {
    return (int)result;
  }

  return (int64_t)[a3 write:byte_100016BA8 maxLength:result];
}

- (BOOL)sr_prefersUTF8StringRepresentation
{
  return 1;
}

@end