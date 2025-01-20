@interface HIDEvent(HIDAtmosphericPressureEventPrivate)
- (uint64_t)atmosphericPressureLevel;
- (uint64_t)atmosphericSequence;
- (uint64_t)setAtmosphericPressureLevel:()HIDAtmosphericPressureEventPrivate;
- (uint64_t)setAtmosphericSequence:()HIDAtmosphericPressureEventPrivate;
@end

@implementation HIDEvent(HIDAtmosphericPressureEventPrivate)

- (uint64_t)atmosphericPressureLevel
{
  return MEMORY[0x1F40E89F8](a1, 2031616);
}

- (uint64_t)setAtmosphericPressureLevel:()HIDAtmosphericPressureEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2031616);
}

- (uint64_t)atmosphericSequence
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAtmosphericSequence:()HIDAtmosphericPressureEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2031617);
}

@end