@interface HIDEvent(HIDScrollEventPrivate)
- (uint64_t)scrollIsPixels;
- (uint64_t)scrollX;
- (uint64_t)scrollY;
- (uint64_t)scrollZ;
- (uint64_t)setScrollIsPixels:()HIDScrollEventPrivate;
- (uint64_t)setScrollX:()HIDScrollEventPrivate;
- (uint64_t)setScrollY:()HIDScrollEventPrivate;
- (uint64_t)setScrollZ:()HIDScrollEventPrivate;
@end

@implementation HIDEvent(HIDScrollEventPrivate)

- (uint64_t)scrollIsPixels
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setScrollIsPixels:()HIDScrollEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 393219);
}

- (uint64_t)scrollX
{
  return MEMORY[0x1F40E89F8](a1, 393216);
}

- (uint64_t)setScrollX:()HIDScrollEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 393216);
}

- (uint64_t)scrollY
{
  return MEMORY[0x1F40E89F8](a1, 393217);
}

- (uint64_t)setScrollY:()HIDScrollEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 393217);
}

- (uint64_t)scrollZ
{
  return MEMORY[0x1F40E89F8](a1, 393218);
}

- (uint64_t)setScrollZ:()HIDScrollEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 393218);
}

@end