@interface NSString(AXAudit)
- (id)axAuditStringForLog;
- (uint64_t)axAuditStringIsHumanReadable;
@end

@implementation NSString(AXAudit)

- (id)axAuditStringForLog
{
  if ([a1 isEqualToString:@"\n"])
  {
    id v2 = a1;
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x263F08790]);
    [v3 setDateFormat:@"HH:mm:ss.SSS"];
    v4 = [MEMORY[0x263EFF910] date];
    v5 = [v3 stringFromDate:v4];
    id v2 = [NSString stringWithFormat:@"[%@] %@\n", v5, a1];
  }

  return v2;
}

- (uint64_t)axAuditStringIsHumanReadable
{
  id v2 = [a1 uppercaseString];
  if ([v2 isEqualToString:a1]) {
    int v3 = [a1 containsString:@"_"];
  }
  else {
    int v3 = 0;
  }

  v4 = [a1 stringByReplacingOccurrencesOfString:@" " withString:&stru_26FB6E0B0];
  if ([a1 isEqualToString:v4]) {
    int v5 = [a1 containsString:@"."];
  }
  else {
    int v5 = 0;
  }
  if ((unint64_t)[a1 length] < 5) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = (v3 | v5) ^ 1u;
  }

  return v6;
}

@end