@interface HIDEvent(HIDHumidityEventPrivate)
- (uint64_t)humidityRH;
- (uint64_t)humiditySequence;
- (uint64_t)setHumidityRH:()HIDHumidityEventPrivate;
- (uint64_t)setHumiditySequence:()HIDHumidityEventPrivate;
@end

@implementation HIDEvent(HIDHumidityEventPrivate)

- (uint64_t)humidityRH
{
  return MEMORY[0x1F40E89F8](a1, 2359296);
}

- (uint64_t)setHumidityRH:()HIDHumidityEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2359296);
}

- (uint64_t)humiditySequence
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setHumiditySequence:()HIDHumidityEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2359297);
}

@end