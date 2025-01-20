@interface NavdNavigationStartedTrigger
- (BOOL)isTrue;
- (NavdNavigationStartedTrigger)init;
- (void)didNavigationStateChange;
@end

@implementation NavdNavigationStartedTrigger

- (NavdNavigationStartedTrigger)init
{
  v3.receiver = self;
  v3.super_class = (Class)NavdNavigationStartedTrigger;
  return [(NavdBaseNavigationSessionTrigger *)&v3 initWithName:@"NavdNavigationStartedTrigger"];
}

- (BOOL)isTrue
{
  v2 = +[MNNavdStateUpdater sharedUpdater];
  unsigned __int8 v3 = [v2 isNavigatingOrPredictingDestination];

  return v3;
}

- (void)didNavigationStateChange
{
  if ([(NavdNavigationStartedTrigger *)self isTrue])
  {
    [(NavdNavigationStartedTrigger *)self triggerMyObservers];
  }
}

@end