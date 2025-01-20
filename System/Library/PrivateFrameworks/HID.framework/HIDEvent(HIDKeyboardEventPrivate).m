@interface HIDEvent(HIDKeyboardEventPrivate)
- (uint64_t)keyboardClickSpeed;
- (uint64_t)keyboardDown;
- (uint64_t)keyboardLongPress;
- (uint64_t)keyboardMouseKeyToggle;
- (uint64_t)keyboardPressCount;
- (uint64_t)keyboardRepeat;
- (uint64_t)keyboardSlowKeyPhase;
- (uint64_t)keyboardStickyKeyPhase;
- (uint64_t)keyboardStickyKeyToggle;
- (uint64_t)keyboardUsage;
- (uint64_t)keyboardUsagePage;
- (uint64_t)setKeyboardClickSpeed:()HIDKeyboardEventPrivate;
- (uint64_t)setKeyboardDown:()HIDKeyboardEventPrivate;
- (uint64_t)setKeyboardLongPress:()HIDKeyboardEventPrivate;
- (uint64_t)setKeyboardMouseKeyToggle:()HIDKeyboardEventPrivate;
- (uint64_t)setKeyboardPressCount:()HIDKeyboardEventPrivate;
- (uint64_t)setKeyboardRepeat:()HIDKeyboardEventPrivate;
- (uint64_t)setKeyboardSlowKeyPhase:()HIDKeyboardEventPrivate;
- (uint64_t)setKeyboardStickyKeyPhase:()HIDKeyboardEventPrivate;
- (uint64_t)setKeyboardStickyKeyToggle:()HIDKeyboardEventPrivate;
- (uint64_t)setKeyboardUsage:()HIDKeyboardEventPrivate;
- (uint64_t)setKeyboardUsagePage:()HIDKeyboardEventPrivate;
@end

@implementation HIDEvent(HIDKeyboardEventPrivate)

- (uint64_t)keyboardClickSpeed
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardClickSpeed:()HIDKeyboardEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 196614);
}

- (uint64_t)keyboardDown
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardDown:()HIDKeyboardEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 196610);
}

- (uint64_t)keyboardLongPress
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardLongPress:()HIDKeyboardEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 196613);
}

- (uint64_t)keyboardMouseKeyToggle
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardMouseKeyToggle:()HIDKeyboardEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 196616);
}

- (uint64_t)keyboardPressCount
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardPressCount:()HIDKeyboardEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 196612);
}

- (uint64_t)keyboardRepeat
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardRepeat:()HIDKeyboardEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 196611);
}

- (uint64_t)keyboardSlowKeyPhase
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardSlowKeyPhase:()HIDKeyboardEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 196615);
}

- (uint64_t)keyboardStickyKeyPhase
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardStickyKeyPhase:()HIDKeyboardEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 196617);
}

- (uint64_t)keyboardStickyKeyToggle
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardStickyKeyToggle:()HIDKeyboardEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 196618);
}

- (uint64_t)keyboardUsage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardUsage:()HIDKeyboardEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 196609);
}

- (uint64_t)keyboardUsagePage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardUsagePage:()HIDKeyboardEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 196608);
}

@end