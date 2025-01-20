@interface HIDEvent(HIDProximityEventPrivate)
- (uint64_t)probabilityLevel;
- (uint64_t)proximityDetectionMask;
- (uint64_t)proximityLevel;
- (uint64_t)proximityProximityType;
- (uint64_t)setProbabilityLevel:()HIDProximityEventPrivate;
- (uint64_t)setProximityDetectionMask:()HIDProximityEventPrivate;
- (uint64_t)setProximityLevel:()HIDProximityEventPrivate;
- (uint64_t)setProximityProximityType:()HIDProximityEventPrivate;
@end

@implementation HIDEvent(HIDProximityEventPrivate)

- (uint64_t)probabilityLevel
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setProbabilityLevel:()HIDProximityEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 917507);
}

- (uint64_t)proximityDetectionMask
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setProximityDetectionMask:()HIDProximityEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 917504);
}

- (uint64_t)proximityLevel
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setProximityLevel:()HIDProximityEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 917505);
}

- (uint64_t)proximityProximityType
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setProximityProximityType:()HIDProximityEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 917506);
}

@end