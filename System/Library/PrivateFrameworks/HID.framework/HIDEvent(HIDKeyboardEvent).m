@interface HIDEvent(HIDKeyboardEvent)
+ (char)keyboardEvent:()HIDKeyboardEvent usagePage:usage:down:options:;
@end

@implementation HIDEvent(HIDKeyboardEvent)

+ (char)keyboardEvent:()HIDKeyboardEvent usagePage:usage:down:options:
{
  v9 = (char *)_IOHIDEventCreate();
  uint64_t v10 = *(void *)&v9[*MEMORY[0x1E4F2EEE0] + 96];
  *(_WORD *)(v10 + 16) = a4;
  *(_WORD *)(v10 + 18) = a5;
  *(_DWORD *)(v10 + 20) = a6;
  return v9;
}

@end