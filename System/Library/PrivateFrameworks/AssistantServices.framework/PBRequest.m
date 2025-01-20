@interface PBRequest
+ (unsigned)_ADPBDeviceRequestType;
+ (unsigned)_ADPBLocationRequestType;
+ (unsigned)_ADPBProxyRequestType;
@end

@implementation PBRequest

+ (unsigned)_ADPBDeviceRequestType
{
  return 0;
}

+ (unsigned)_ADPBProxyRequestType
{
  return 0;
}

+ (unsigned)_ADPBLocationRequestType
{
  return 0;
}

@end