@interface NavdVenueNavigationSessionTrigger
- (BOOL)isTrue;
- (NavdVenueNavigationSessionTrigger)init;
- (void)didNavigationStateChange;
@end

@implementation NavdVenueNavigationSessionTrigger

- (NavdVenueNavigationSessionTrigger)init
{
  v5.receiver = self;
  v5.super_class = (Class)NavdVenueNavigationSessionTrigger;
  v2 = [(NavdBaseNavigationSessionTrigger *)&v5 initWithName:@"NavdVenueNavigationSessionTrigger"];
  v3 = v2;
  if (v2) {
    v2->_previousShouldRun = [(NavdVenueNavigationSessionTrigger *)v2 isTrue];
  }
  return v3;
}

- (BOOL)isTrue
{
  v2 = +[MNNavdStateUpdater sharedUpdater];
  char v3 = [v2 isNavigatingOrPredictingDestination] ^ 1;

  return v3;
}

- (void)didNavigationStateChange
{
  BOOL v3 = [(NavdVenueNavigationSessionTrigger *)self isTrue];
  if (self->_previousShouldRun != v3)
  {
    self->_previousShouldRun = v3;
    if (v3)
    {
      [(NavdVenueNavigationSessionTrigger *)self triggerMyObservers];
    }
  }
}

@end