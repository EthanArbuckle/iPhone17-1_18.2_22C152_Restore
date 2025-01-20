@interface BuddyMockEmergencyExecutor
- (BOOL)kappaTriggersEmergencySOS;
- (void)setKappaTriggersEmergencySOS:(BOOL)a3;
@end

@implementation BuddyMockEmergencyExecutor

- (BOOL)kappaTriggersEmergencySOS
{
  return self->_kappaTriggersEmergencySOS;
}

- (void)setKappaTriggersEmergencySOS:(BOOL)a3
{
  self->_kappaTriggersEmergencySOS = a3;
}

@end