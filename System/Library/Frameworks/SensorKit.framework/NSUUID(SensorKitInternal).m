@interface NSUUID(SensorKitInternal)
+ (id)sr_UUIDWithUint32_t:()SensorKitInternal;
@end

@implementation NSUUID(SensorKitInternal)

+ (id)sr_UUIDWithUint32_t:()SensorKitInternal
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v6 = 0;
  uint64_t v5 = 0;
  int v4 = a3;
  return (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v4];
}

@end