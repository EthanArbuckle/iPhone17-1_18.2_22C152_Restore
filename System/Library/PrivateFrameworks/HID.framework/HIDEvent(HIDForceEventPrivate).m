@interface HIDEvent(HIDForceEventPrivate)
- (uint64_t)forceBehavior;
- (uint64_t)forceProgress;
- (uint64_t)forceStage;
- (uint64_t)forceStagePressure;
- (uint64_t)setForceBehavior:()HIDForceEventPrivate;
- (uint64_t)setForceProgress:()HIDForceEventPrivate;
- (uint64_t)setForceStage:()HIDForceEventPrivate;
- (uint64_t)setForceStagePressure:()HIDForceEventPrivate;
@end

@implementation HIDEvent(HIDForceEventPrivate)

- (uint64_t)forceBehavior
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setForceBehavior:()HIDForceEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 0x200000);
}

- (uint64_t)forceProgress
{
  return MEMORY[0x1F40E89F8](a1, 2097153);
}

- (uint64_t)setForceProgress:()HIDForceEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2097153);
}

- (uint64_t)forceStage
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setForceStage:()HIDForceEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2097154);
}

- (uint64_t)forceStagePressure
{
  return MEMORY[0x1F40E89F8](a1, 2097155);
}

- (uint64_t)setForceStagePressure:()HIDForceEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2097155);
}

@end