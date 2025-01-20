@interface CLSEIEvent
- (NSTimeZone)timeZone;
@end

@implementation CLSEIEvent

- (NSTimeZone)timeZone
{
  uint64_t v2 = [(CLSEIEvent *)self timeZoneOffset];
  v3 = (void *)MEMORY[0x1E4F1CAF0];
  return (NSTimeZone *)[v3 timeZoneForSecondsFromGMT:v2];
}

@end