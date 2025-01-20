@interface NavdAvocadoNavigationSessionTrigger
- (BOOL)isTrue;
- (NavdAvocadoNavigationSessionTrigger)init;
- (void)didNavigationStateChange;
@end

@implementation NavdAvocadoNavigationSessionTrigger

- (NavdAvocadoNavigationSessionTrigger)init
{
  v3.receiver = self;
  v3.super_class = (Class)NavdAvocadoNavigationSessionTrigger;
  return [(NavdBaseNavigationSessionTrigger *)&v3 initWithName:@"NavdAvocadoNavigationSessionTrigger"];
}

- (BOOL)isTrue
{
  v2 = +[MNNavdStateUpdater sharedUpdater];
  char v3 = [v2 isNavigatingWithETA] ^ 1;

  return v3;
}

- (void)didNavigationStateChange
{
  unsigned int v3 = ![(NavdAvocadoNavigationSessionTrigger *)self isTrue];
  if (self->_isNavigating != v3)
  {
    self->_isNavigating = v3;
    [(NavdAvocadoNavigationSessionTrigger *)self triggerMyObservers];
  }
}

@end