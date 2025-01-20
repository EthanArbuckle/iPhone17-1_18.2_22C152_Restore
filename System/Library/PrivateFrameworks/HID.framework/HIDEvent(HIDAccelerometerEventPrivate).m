@interface HIDEvent(HIDAccelerometerEventPrivate)
- (uint64_t)accelerometerSequence;
- (uint64_t)accelerometerSubType;
- (uint64_t)accelerometerType;
- (uint64_t)accelerometerX;
- (uint64_t)accelerometerY;
- (uint64_t)accelerometerZ;
- (uint64_t)setAccelerometerSequence:()HIDAccelerometerEventPrivate;
- (uint64_t)setAccelerometerSubType:()HIDAccelerometerEventPrivate;
- (uint64_t)setAccelerometerType:()HIDAccelerometerEventPrivate;
- (uint64_t)setAccelerometerX:()HIDAccelerometerEventPrivate;
- (uint64_t)setAccelerometerY:()HIDAccelerometerEventPrivate;
- (uint64_t)setAccelerometerZ:()HIDAccelerometerEventPrivate;
@end

@implementation HIDEvent(HIDAccelerometerEventPrivate)

- (uint64_t)accelerometerSequence
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAccelerometerSequence:()HIDAccelerometerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 851973);
}

- (uint64_t)accelerometerSubType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAccelerometerSubType:()HIDAccelerometerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 851972);
}

- (uint64_t)accelerometerType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAccelerometerType:()HIDAccelerometerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 851971);
}

- (uint64_t)accelerometerX
{
  return MEMORY[0x1F40E89F8](a1, 851968);
}

- (uint64_t)setAccelerometerX:()HIDAccelerometerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 851968);
}

- (uint64_t)accelerometerY
{
  return MEMORY[0x1F40E89F8](a1, 851969);
}

- (uint64_t)setAccelerometerY:()HIDAccelerometerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 851969);
}

- (uint64_t)accelerometerZ
{
  return MEMORY[0x1F40E89F8](a1, 851970);
}

- (uint64_t)setAccelerometerZ:()HIDAccelerometerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 851970);
}

@end