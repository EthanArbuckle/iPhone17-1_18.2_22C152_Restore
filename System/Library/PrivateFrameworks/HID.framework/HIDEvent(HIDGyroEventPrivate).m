@interface HIDEvent(HIDGyroEventPrivate)
- (uint64_t)gyroSequence;
- (uint64_t)gyroSubType;
- (uint64_t)gyroType;
- (uint64_t)gyroX;
- (uint64_t)gyroY;
- (uint64_t)gyroZ;
- (uint64_t)setGyroSequence:()HIDGyroEventPrivate;
- (uint64_t)setGyroSubType:()HIDGyroEventPrivate;
- (uint64_t)setGyroType:()HIDGyroEventPrivate;
- (uint64_t)setGyroX:()HIDGyroEventPrivate;
- (uint64_t)setGyroY:()HIDGyroEventPrivate;
- (uint64_t)setGyroZ:()HIDGyroEventPrivate;
@end

@implementation HIDEvent(HIDGyroEventPrivate)

- (uint64_t)gyroSequence
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setGyroSequence:()HIDGyroEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1310725);
}

- (uint64_t)gyroSubType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setGyroSubType:()HIDGyroEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1310724);
}

- (uint64_t)gyroType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setGyroType:()HIDGyroEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1310723);
}

- (uint64_t)gyroX
{
  return MEMORY[0x1F40E89F8](a1, 1310720);
}

- (uint64_t)setGyroX:()HIDGyroEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 1310720);
}

- (uint64_t)gyroY
{
  return MEMORY[0x1F40E89F8](a1, 1310721);
}

- (uint64_t)setGyroY:()HIDGyroEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 1310721);
}

- (uint64_t)gyroZ
{
  return MEMORY[0x1F40E89F8](a1, 1310722);
}

- (uint64_t)setGyroZ:()HIDGyroEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 1310722);
}

@end