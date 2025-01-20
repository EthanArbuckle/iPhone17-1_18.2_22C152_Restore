@interface HIDEvent(HIDTemperatureEventPrivate)
- (uint64_t)setTemperatureLevel:()HIDTemperatureEventPrivate;
- (uint64_t)temperatureLevel;
@end

@implementation HIDEvent(HIDTemperatureEventPrivate)

- (uint64_t)temperatureLevel
{
  return MEMORY[0x1F40E89F8](a1, 983040);
}

- (uint64_t)setTemperatureLevel:()HIDTemperatureEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 983040);
}

@end