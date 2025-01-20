@interface ENAdvertisementMetadata
- (ENAdvertisementMetadata)initWithVersion:(int64_t)a3 txPower:(char)a4 calibrationConfidence:(unsigned __int8)a5;
- (NSString)versionString;
- (char)txPower;
- (int64_t)version;
- (unsigned)attenuationForRSSI:(char)a3 saturated:(BOOL)a4;
- (unsigned)calibrationConfidence;
@end

@implementation ENAdvertisementMetadata

- (ENAdvertisementMetadata)initWithVersion:(int64_t)a3 txPower:(char)a4 calibrationConfidence:(unsigned __int8)a5
{
  v9.receiver = self;
  v9.super_class = (Class)ENAdvertisementMetadata;
  result = [(ENAdvertisementMetadata *)&v9 init];
  if (result)
  {
    result->_version = a3;
    result->_txPower = a4;
    result->_calibrationConfidence = a5;
  }
  return result;
}

- (NSString)versionString
{
  int64_t version = self->_version;
  v3 = @"?";
  if (version == 2) {
    v3 = @"1.1";
  }
  if (version == 1) {
    return (NSString *)@"1.0";
  }
  else {
    return &v3->isa;
  }
}

- (unsigned)attenuationForRSSI:(char)a3 saturated:(BOOL)a4
{
  if (a3 == 127 && a4) {
    return 0;
  }
  else {
    return (self->_txPower - a3) & ~((self->_txPower - a3) >> 31);
  }
}

- (int64_t)version
{
  return self->_version;
}

- (char)txPower
{
  return self->_txPower;
}

- (unsigned)calibrationConfidence
{
  return self->_calibrationConfidence;
}

@end