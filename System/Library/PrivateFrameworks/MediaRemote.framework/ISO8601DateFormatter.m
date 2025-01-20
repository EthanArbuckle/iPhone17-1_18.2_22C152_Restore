@interface ISO8601DateFormatter
@end

@implementation ISO8601DateFormatter

void ___ISO8601DateFormatter_block_invoke()
{
  id v1 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  v0 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v1 setTimeZone:v0];
}

@end