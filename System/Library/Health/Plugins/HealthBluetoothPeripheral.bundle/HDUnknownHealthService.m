@interface HDUnknownHealthService
+ (id)serviceUUID;
+ (int64_t)serviceType;
@end

@implementation HDUnknownHealthService

+ (int64_t)serviceType
{
  return -3;
}

+ (id)serviceUUID
{
  return +[CBUUID UUIDWithString:kHDUnknownHealthService];
}

@end