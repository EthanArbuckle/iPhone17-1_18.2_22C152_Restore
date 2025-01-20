@interface CMAccelerometerData
- (BOOL)sr_prefersUTF8StringRepresentation;
- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3;
@end

@implementation CMAccelerometerData

- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3
{
  [(CMAccelerometerData *)self acceleration];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CMAccelerometerData *)self timestamp];
  LODWORD(result) = snprintf_l(byte_100016C6F, 0x8AuLL, 0, "{\"acceleration\": {\"x\": %0.*g, \"y\": %0.*g, \"z\": %0.*g}, \"timestamp\": %ld}", 17, v6, 17, v8, 17, v10, (uint64_t)v11);
  if ((int)result <= 0) {
    return (int)result;
  }

  return (int64_t)[a3 write:byte_100016C6F maxLength:result];
}

- (BOOL)sr_prefersUTF8StringRepresentation
{
  return 1;
}

@end