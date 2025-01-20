@interface HIDEvent(HIDOrientationEventPrivate)
- (uint64_t)orientationAltitude;
- (uint64_t)orientationAzimuth;
- (uint64_t)orientationDeviceOrientationUsage;
- (uint64_t)orientationOrientationType;
- (uint64_t)orientationQuatW;
- (uint64_t)orientationQuatX;
- (uint64_t)orientationQuatY;
- (uint64_t)orientationQuatZ;
- (uint64_t)orientationRadius;
- (uint64_t)orientationTiltX;
- (uint64_t)orientationTiltY;
- (uint64_t)orientationTiltZ;
- (uint64_t)setOrientationAltitude:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationAzimuth:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationDeviceOrientationUsage:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationQuatW:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationQuatX:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationQuatY:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationQuatZ:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationRadius:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationTiltX:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationTiltY:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationTiltZ:()HIDOrientationEventPrivate;
@end

@implementation HIDEvent(HIDOrientationEventPrivate)

- (uint64_t)orientationAltitude
{
  return MEMORY[0x1F40E89F8](a1, 655362);
}

- (uint64_t)setOrientationAltitude:()HIDOrientationEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 655362);
}

- (uint64_t)orientationAzimuth
{
  return MEMORY[0x1F40E89F8](a1, 655361);
}

- (uint64_t)setOrientationAzimuth:()HIDOrientationEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 655361);
}

- (uint64_t)orientationDeviceOrientationUsage
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setOrientationDeviceOrientationUsage:()HIDOrientationEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 655364);
}

- (uint64_t)orientationOrientationType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)orientationQuatW
{
  return MEMORY[0x1F40E89F8](a1, 655368);
}

- (uint64_t)setOrientationQuatW:()HIDOrientationEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 655368);
}

- (uint64_t)orientationQuatX
{
  return MEMORY[0x1F40E89F8](a1, 655369);
}

- (uint64_t)setOrientationQuatX:()HIDOrientationEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 655369);
}

- (uint64_t)orientationQuatY
{
  return MEMORY[0x1F40E89F8](a1, 655370);
}

- (uint64_t)setOrientationQuatY:()HIDOrientationEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 655370);
}

- (uint64_t)orientationQuatZ
{
  return MEMORY[0x1F40E89F8](a1, 655371);
}

- (uint64_t)setOrientationQuatZ:()HIDOrientationEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 655371);
}

- (uint64_t)orientationRadius
{
  return MEMORY[0x1F40E89F8](a1, 655360);
}

- (uint64_t)setOrientationRadius:()HIDOrientationEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 655360);
}

- (uint64_t)orientationTiltX
{
  return MEMORY[0x1F40E89F8](a1, 655365);
}

- (uint64_t)setOrientationTiltX:()HIDOrientationEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 655365);
}

- (uint64_t)orientationTiltY
{
  return MEMORY[0x1F40E89F8](a1, 655366);
}

- (uint64_t)setOrientationTiltY:()HIDOrientationEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 655366);
}

- (uint64_t)orientationTiltZ
{
  return MEMORY[0x1F40E89F8](a1, 655367);
}

- (uint64_t)setOrientationTiltZ:()HIDOrientationEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 655367);
}

@end