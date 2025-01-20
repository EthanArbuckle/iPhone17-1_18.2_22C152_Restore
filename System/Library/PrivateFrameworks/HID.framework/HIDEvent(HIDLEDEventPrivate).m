@interface HIDEvent(HIDLEDEventPrivate)
- (uint64_t)ledMask;
- (uint64_t)ledNumber;
- (uint64_t)ledState;
- (uint64_t)setLedMask:()HIDLEDEventPrivate;
- (uint64_t)setLedNumber:()HIDLEDEventPrivate;
- (uint64_t)setLedState:()HIDLEDEventPrivate;
@end

@implementation HIDEvent(HIDLEDEventPrivate)

- (uint64_t)ledMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setLedMask:()HIDLEDEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1703936);
}

- (uint64_t)ledNumber
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setLedNumber:()HIDLEDEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1703937);
}

- (uint64_t)ledState
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setLedState:()HIDLEDEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1703938);
}

@end