@interface GEONanoInfo
+ (id)sharedInfo;
- (id)deviceIsAltAcct;
- (id)deviceIsAltAcctIfAvailable;
- (id)deviceOsVersionIfAvailable;
- (id)deviceProductType;
- (id)deviceProductTypeIfAvailable;
- (id)deviceSystemBuildVersion;
- (id)deviceSystemBuildVersionIfAvailable;
- (id)deviceSystemVersion;
- (id)deviceSystemVersionIfAvailable;
- (id)hasPairedDevice;
- (id)hasPairedDeviceIfAvailable;
@end

@implementation GEONanoInfo

+ (id)sharedInfo
{
  return 0;
}

- (id)hasPairedDevice
{
  return (id)MEMORY[0x263EFFA80];
}

- (id)hasPairedDeviceIfAvailable
{
  return (id)MEMORY[0x263EFFA80];
}

- (id)deviceSystemVersion
{
  return 0;
}

- (id)deviceSystemVersionIfAvailable
{
  return 0;
}

- (id)deviceSystemBuildVersion
{
  return 0;
}

- (id)deviceSystemBuildVersionIfAvailable
{
  return 0;
}

- (id)deviceProductType
{
  return 0;
}

- (id)deviceProductTypeIfAvailable
{
  return 0;
}

- (id)deviceIsAltAcct
{
  return (id)MEMORY[0x263EFFA80];
}

- (id)deviceIsAltAcctIfAvailable
{
  return (id)MEMORY[0x263EFFA80];
}

- (id)deviceOsVersionIfAvailable
{
  v3 = [(GEONanoInfo *)self deviceSystemVersionIfAvailable];
  if (v3)
  {
    v4 = [(GEONanoInfo *)self deviceSystemBuildVersionIfAvailable];
    if (v4)
    {
      v5 = [NSString stringWithFormat:@"%@.%@", v3, v4];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end