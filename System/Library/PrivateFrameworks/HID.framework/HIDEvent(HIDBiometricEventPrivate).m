@interface HIDEvent(HIDBiometricEventPrivate)
- (uint64_t)biometricEventType;
- (uint64_t)biometricLevel;
- (uint64_t)biometricTapCount;
- (uint64_t)biometricUsage;
- (uint64_t)biometricUsagePage;
- (uint64_t)setBiometricEventType:()HIDBiometricEventPrivate;
- (uint64_t)setBiometricLevel:()HIDBiometricEventPrivate;
- (uint64_t)setBiometricTapCount:()HIDBiometricEventPrivate;
- (uint64_t)setBiometricUsage:()HIDBiometricEventPrivate;
- (uint64_t)setBiometricUsagePage:()HIDBiometricEventPrivate;
@end

@implementation HIDEvent(HIDBiometricEventPrivate)

- (uint64_t)biometricEventType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setBiometricEventType:()HIDBiometricEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1900544);
}

- (uint64_t)biometricLevel
{
  return MEMORY[0x1F40E89F8](a1, 1900545);
}

- (uint64_t)setBiometricLevel:()HIDBiometricEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 1900545);
}

- (uint64_t)biometricTapCount
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setBiometricTapCount:()HIDBiometricEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1900548);
}

- (uint64_t)biometricUsage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setBiometricUsage:()HIDBiometricEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1900547);
}

- (uint64_t)biometricUsagePage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setBiometricUsagePage:()HIDBiometricEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 1900546);
}

@end