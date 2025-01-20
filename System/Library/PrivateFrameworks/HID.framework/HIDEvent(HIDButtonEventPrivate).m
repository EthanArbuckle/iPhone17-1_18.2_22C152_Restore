@interface HIDEvent(HIDButtonEventPrivate)
- (uint64_t)buttonClickCount;
- (uint64_t)buttonMask;
- (uint64_t)buttonNumber;
- (uint64_t)buttonPressure;
- (uint64_t)buttonState;
- (uint64_t)setButtonClickCount:()HIDButtonEventPrivate;
- (uint64_t)setButtonMask:()HIDButtonEventPrivate;
- (uint64_t)setButtonNumber:()HIDButtonEventPrivate;
- (uint64_t)setButtonPressure:()HIDButtonEventPrivate;
- (uint64_t)setButtonState:()HIDButtonEventPrivate;
@end

@implementation HIDEvent(HIDButtonEventPrivate)

- (uint64_t)buttonClickCount
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setButtonClickCount:()HIDButtonEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 131074);
}

- (uint64_t)buttonMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setButtonMask:()HIDButtonEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 0x20000);
}

- (uint64_t)buttonNumber
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setButtonNumber:()HIDButtonEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 131073);
}

- (uint64_t)buttonPressure
{
  return MEMORY[0x1F40E89F8](a1, 131075);
}

- (uint64_t)setButtonPressure:()HIDButtonEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 131075);
}

- (uint64_t)buttonState
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setButtonState:()HIDButtonEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 131076);
}

@end