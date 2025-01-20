@interface CMRecordedRotationRateData
- (BOOL)sr_prefersUTF8StringRepresentation;
- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3;
@end

@implementation CMRecordedRotationRateData

- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3
{
  [(CMRecordedRotationRateData *)self rotationRate];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(NSDate *)[(CMRecordedRotationRateData *)self startDate] timeIntervalSinceReferenceDate];
  double v12 = v11;
  [(CMRecordedRotationRateData *)self timestamp];
  LODWORD(result) = snprintf_l(byte_100016CF9, 0xB7uLL, 0, "{\"rotationRate\": {\"x\": %0.*g, \"y\": %0.*g, \"z\": %0.*g}, \"start\": %0.*g, \"timestamp\": %0.*g}", 17, v6, 17, v8, 17, v10, 17, v12, 17, v13);
  if ((int)result <= 0) {
    return (int)result;
  }

  return (int64_t)[a3 write:byte_100016CF9 maxLength:result];
}

- (BOOL)sr_prefersUTF8StringRepresentation
{
  return 1;
}

@end