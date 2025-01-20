@interface NSString(Sanitization)
- (uint64_t)blt_sanitizeForURL;
@end

@implementation NSString(Sanitization)

- (uint64_t)blt_sanitizeForURL
{
  return [a1 stringByReplacingOccurrencesOfString:&stru_26D5EDA48 withString:@"_"];
}

@end