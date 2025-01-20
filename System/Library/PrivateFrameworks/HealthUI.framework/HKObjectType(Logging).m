@interface HKObjectType(Logging)
- (BOOL)requiresSensitiveHealthLogs;
- (id)sensitiveLoggingIdentifier;
- (uint64_t)isAbleToWriteHealthSensitiveLogs;
- (uint64_t)logPrivacyLevel;
@end

@implementation HKObjectType(Logging)

- (id)sensitiveLoggingIdentifier
{
  if ([a1 requiresSensitiveHealthLogs])
  {
    v2 = NSString;
    v3 = HKSensitiveLogItem();
    v4 = [v2 stringWithFormat:@"%@", v3];
  }
  else
  {
    v4 = [a1 identifier];
  }
  return v4;
}

- (uint64_t)isAbleToWriteHealthSensitiveLogs
{
  if (![a1 requiresSensitiveHealthLogs]) {
    return 1;
  }
  return MEMORY[0x1F40E7F30]();
}

- (BOOL)requiresSensitiveHealthLogs
{
  uint64_t v1 = [a1 code];
  BOOL result = 1;
  BOOL v3 = (unint64_t)(v1 - 262) > 0x34 || ((1 << (v1 - 6)) & 0x1800000000000FLL) == 0;
  if (v3 && ((unint64_t)(v1 - 191) > 0x34 || ((1 << (v1 + 65)) & 0x10000000000003) == 0)) {
    return (unint64_t)(v1 - 95) < 2;
  }
  return result;
}

- (uint64_t)logPrivacyLevel
{
  uint64_t v1 = [a1 code];
  uint64_t result = 3;
  BOOL v3 = (unint64_t)(v1 - 262) > 0x34 || ((1 << (v1 - 6)) & 0x1800000000000FLL) == 0;
  if (v3
    && ((unint64_t)(v1 - 191) > 0x34 || ((1 << (v1 + 65)) & 0x10000000000003) == 0)
    && (unint64_t)(v1 - 95) >= 2)
  {
    return 0;
  }
  return result;
}

@end