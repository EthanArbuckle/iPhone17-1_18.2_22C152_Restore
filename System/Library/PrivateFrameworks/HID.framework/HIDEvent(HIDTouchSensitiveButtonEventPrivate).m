@interface HIDEvent(HIDTouchSensitiveButtonEventPrivate)
- (BOOL)touchSensitiveButtonTouch;
- (uint64_t)setTouchSensitiveButtonEventMask:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonMajorRadius:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonMinorRadius:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonNormalizedPositionDeltaX:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonNormalizedPositionDeltaY:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonNormalizedPositionX:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonNormalizedPositionY:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonTouch:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonUsage:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonUsagePage:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)touchSensitiveButtonEventMask;
- (uint64_t)touchSensitiveButtonMajorRadius;
- (uint64_t)touchSensitiveButtonMinorRadius;
- (uint64_t)touchSensitiveButtonNormalizedPositionDeltaX;
- (uint64_t)touchSensitiveButtonNormalizedPositionDeltaY;
- (uint64_t)touchSensitiveButtonNormalizedPositionX;
- (uint64_t)touchSensitiveButtonNormalizedPositionY;
- (uint64_t)touchSensitiveButtonUsage;
- (uint64_t)touchSensitiveButtonUsagePage;
@end

@implementation HIDEvent(HIDTouchSensitiveButtonEventPrivate)

- (uint64_t)touchSensitiveButtonEventMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setTouchSensitiveButtonEventMask:()HIDTouchSensitiveButtonEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2752517);
}

- (uint64_t)touchSensitiveButtonMajorRadius
{
  return MEMORY[0x1F40E89F8](a1, 2752520);
}

- (uint64_t)setTouchSensitiveButtonMajorRadius:()HIDTouchSensitiveButtonEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2752520);
}

- (uint64_t)touchSensitiveButtonMinorRadius
{
  return MEMORY[0x1F40E89F8](a1, 2752521);
}

- (uint64_t)setTouchSensitiveButtonMinorRadius:()HIDTouchSensitiveButtonEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2752521);
}

- (uint64_t)touchSensitiveButtonNormalizedPositionDeltaX
{
  return MEMORY[0x1F40E89F8](a1, 2752519);
}

- (uint64_t)setTouchSensitiveButtonNormalizedPositionDeltaX:()HIDTouchSensitiveButtonEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2752519);
}

- (uint64_t)touchSensitiveButtonNormalizedPositionDeltaY
{
  return MEMORY[0x1F40E89F8](a1, 2752515);
}

- (uint64_t)setTouchSensitiveButtonNormalizedPositionDeltaY:()HIDTouchSensitiveButtonEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2752515);
}

- (uint64_t)touchSensitiveButtonNormalizedPositionX
{
  return MEMORY[0x1F40E89F8](a1, 2752518);
}

- (uint64_t)setTouchSensitiveButtonNormalizedPositionX:()HIDTouchSensitiveButtonEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2752518);
}

- (uint64_t)touchSensitiveButtonNormalizedPositionY
{
  return MEMORY[0x1F40E89F8](a1, 2752514);
}

- (uint64_t)setTouchSensitiveButtonNormalizedPositionY:()HIDTouchSensitiveButtonEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2752514);
}

- (BOOL)touchSensitiveButtonTouch
{
  return IOHIDEventGetIntegerValue() != 0;
}

- (uint64_t)setTouchSensitiveButtonTouch:()HIDTouchSensitiveButtonEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2752516);
}

- (uint64_t)touchSensitiveButtonUsage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setTouchSensitiveButtonUsage:()HIDTouchSensitiveButtonEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2752512);
}

- (uint64_t)touchSensitiveButtonUsagePage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setTouchSensitiveButtonUsagePage:()HIDTouchSensitiveButtonEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2752513);
}

@end