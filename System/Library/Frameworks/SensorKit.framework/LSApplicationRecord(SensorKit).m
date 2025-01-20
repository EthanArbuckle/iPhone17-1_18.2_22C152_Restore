@interface LSApplicationRecord(SensorKit)
+ (uint64_t)sr_applicationRecordWithIdentifier:()SensorKit error:;
@end

@implementation LSApplicationRecord(SensorKit)

+ (uint64_t)sr_applicationRecordWithIdentifier:()SensorKit error:
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263F01878], "bundleRecordWithApplicationIdentifier:error:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v0;
  }
  else {
    return 0;
  }
}

@end