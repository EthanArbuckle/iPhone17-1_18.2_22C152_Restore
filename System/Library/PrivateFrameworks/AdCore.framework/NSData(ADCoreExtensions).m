@interface NSData(ADCoreExtensions)
- (uint64_t)AD_dataStringForJSON;
@end

@implementation NSData(ADCoreExtensions)

- (uint64_t)AD_dataStringForJSON
{
  uint64_t v1 = [a1 length];
  return [NSString stringWithFormat:@"Binary data, %ld bytes, ...", v1];
}

@end