@interface NSData(CDMJSONSerialization)
- (uint64_t)_cdm_safeJSONString;
@end

@implementation NSData(CDMJSONSerialization)

- (uint64_t)_cdm_safeJSONString
{
  return [a1 base64EncodedStringWithOptions:0];
}

@end