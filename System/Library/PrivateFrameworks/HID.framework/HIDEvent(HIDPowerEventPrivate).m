@interface HIDEvent(HIDPowerEventPrivate)
- (uint64_t)powerMeasurement;
- (uint64_t)powerSubType;
- (uint64_t)powerType;
- (uint64_t)setPowerMeasurement:()HIDPowerEventPrivate;
- (uint64_t)setPowerSubType:()HIDPowerEventPrivate;
- (uint64_t)setPowerType:()HIDPowerEventPrivate;
@end

@implementation HIDEvent(HIDPowerEventPrivate)

- (uint64_t)powerMeasurement
{
  return MEMORY[0x1F40E89F8](a1, 1638400);
}

- (uint64_t)setPowerMeasurement:()HIDPowerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 1638400);
}

- (uint64_t)powerSubType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setPowerSubType:()HIDPowerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1638402);
}

- (uint64_t)powerType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setPowerType:()HIDPowerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1638401);
}

@end