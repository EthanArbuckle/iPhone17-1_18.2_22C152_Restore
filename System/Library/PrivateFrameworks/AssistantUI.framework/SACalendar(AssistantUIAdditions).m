@interface SACalendar(AssistantUIAdditions)
- (id)afui_timeZone;
@end

@implementation SACalendar(AssistantUIAdditions)

- (id)afui_timeZone
{
  v1 = (void *)MEMORY[0x263EFFA18];
  v2 = [a1 timeZoneId];
  v3 = [v1 timeZoneWithName:v2];

  return v3;
}

@end