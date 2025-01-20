@interface HUQuickControlNonInteractiveInteractionCoordinator
- (BOOL)isUserInteractionActive;
- (HUQuickControlNonInteractiveInteractionCoordinator)init;
- (id)value;
@end

@implementation HUQuickControlNonInteractiveInteractionCoordinator

- (HUQuickControlNonInteractiveInteractionCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlNonInteractiveInteractionCoordinator;
  return [(HUQuickControlNonInteractiveInteractionCoordinator *)&v3 init];
}

- (BOOL)isUserInteractionActive
{
  return 0;
}

- (id)value
{
  return 0;
}

@end