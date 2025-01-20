@interface HIDEvent(HIDForceStageEventPrivate)
- (uint64_t)forceStageNextThreshold;
- (uint64_t)forceStageNormalizedForce;
- (uint64_t)forceStageNormalizedForceVelocity;
- (uint64_t)forceStagePressedThreshold;
- (uint64_t)forceStageReleasedThreshold;
- (uint64_t)forceStageStage;
- (uint64_t)forceStageTransition;
- (uint64_t)setForceStageNextThreshold:()HIDForceStageEventPrivate;
- (uint64_t)setForceStageNormalizedForce:()HIDForceStageEventPrivate;
- (uint64_t)setForceStageNormalizedForceVelocity:()HIDForceStageEventPrivate;
- (uint64_t)setForceStagePressedThreshold:()HIDForceStageEventPrivate;
- (uint64_t)setForceStageReleasedThreshold:()HIDForceStageEventPrivate;
- (uint64_t)setForceStageStage:()HIDForceStageEventPrivate;
- (uint64_t)setForceStageTransition:()HIDForceStageEventPrivate;
@end

@implementation HIDEvent(HIDForceStageEventPrivate)

- (uint64_t)forceStageNextThreshold
{
  return MEMORY[0x1F40E89F8](a1, 2686978);
}

- (uint64_t)setForceStageNextThreshold:()HIDForceStageEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2686978);
}

- (uint64_t)forceStageNormalizedForce
{
  return MEMORY[0x1F40E89F8](a1, 2686981);
}

- (uint64_t)setForceStageNormalizedForce:()HIDForceStageEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2686981);
}

- (uint64_t)forceStageNormalizedForceVelocity
{
  return MEMORY[0x1F40E89F8](a1, 2686982);
}

- (uint64_t)setForceStageNormalizedForceVelocity:()HIDForceStageEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2686982);
}

- (uint64_t)forceStagePressedThreshold
{
  return MEMORY[0x1F40E89F8](a1, 2686979);
}

- (uint64_t)setForceStagePressedThreshold:()HIDForceStageEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2686979);
}

- (uint64_t)forceStageReleasedThreshold
{
  return MEMORY[0x1F40E89F8](a1, 2686980);
}

- (uint64_t)setForceStageReleasedThreshold:()HIDForceStageEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2686980);
}

- (uint64_t)forceStageStage
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setForceStageStage:()HIDForceStageEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2686976);
}

- (uint64_t)forceStageTransition
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setForceStageTransition:()HIDForceStageEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2686977);
}

@end