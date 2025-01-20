@interface HIDEvent(HIDCompassEventPrivate)
- (uint64_t)compassSequence;
- (uint64_t)compassSubType;
- (uint64_t)compassType;
- (uint64_t)compassX;
- (uint64_t)compassY;
- (uint64_t)compassZ;
- (uint64_t)setCompassSequence:()HIDCompassEventPrivate;
- (uint64_t)setCompassSubType:()HIDCompassEventPrivate;
- (uint64_t)setCompassType:()HIDCompassEventPrivate;
- (uint64_t)setCompassX:()HIDCompassEventPrivate;
- (uint64_t)setCompassY:()HIDCompassEventPrivate;
- (uint64_t)setCompassZ:()HIDCompassEventPrivate;
@end

@implementation HIDEvent(HIDCompassEventPrivate)

- (uint64_t)compassSequence
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setCompassSequence:()HIDCompassEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1376261);
}

- (uint64_t)compassSubType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setCompassSubType:()HIDCompassEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1376260);
}

- (uint64_t)compassType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setCompassType:()HIDCompassEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1376259);
}

- (uint64_t)compassX
{
  return MEMORY[0x1F40E89F8](a1, 1376256);
}

- (uint64_t)setCompassX:()HIDCompassEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 1376256);
}

- (uint64_t)compassY
{
  return MEMORY[0x1F40E89F8](a1, 1376257);
}

- (uint64_t)setCompassY:()HIDCompassEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 1376257);
}

- (uint64_t)compassZ
{
  return MEMORY[0x1F40E89F8](a1, 1376258);
}

- (uint64_t)setCompassZ:()HIDCompassEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 1376258);
}

@end