@interface HIDEvent(HIDPointerEventPrivate)
- (uint64_t)pointerButtonMask;
- (uint64_t)pointerX;
- (uint64_t)pointerY;
- (uint64_t)pointerZ;
- (uint64_t)setPointerButtonMask:()HIDPointerEventPrivate;
- (uint64_t)setPointerX:()HIDPointerEventPrivate;
- (uint64_t)setPointerY:()HIDPointerEventPrivate;
- (uint64_t)setPointerZ:()HIDPointerEventPrivate;
@end

@implementation HIDEvent(HIDPointerEventPrivate)

- (uint64_t)pointerButtonMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setPointerButtonMask:()HIDPointerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1114115);
}

- (uint64_t)pointerX
{
  return MEMORY[0x1F40E89F8](a1, 1114112);
}

- (uint64_t)setPointerX:()HIDPointerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 1114112);
}

- (uint64_t)pointerY
{
  return MEMORY[0x1F40E89F8](a1, 1114113);
}

- (uint64_t)setPointerY:()HIDPointerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 1114113);
}

- (uint64_t)pointerZ
{
  return MEMORY[0x1F40E89F8](a1, 1114114);
}

- (uint64_t)setPointerZ:()HIDPointerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 1114114);
}

@end