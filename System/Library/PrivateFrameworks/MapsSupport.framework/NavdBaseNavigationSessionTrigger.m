@interface NavdBaseNavigationSessionTrigger
- (BOOL)isTrue;
- (NavdBaseNavigationSessionTrigger)initWithName:(id)a3;
- (id)objectForJSON;
- (void)didAddFirstObserver;
- (void)didNavigationStateChange;
- (void)didRemoveLastObserver;
@end

@implementation NavdBaseNavigationSessionTrigger

- (NavdBaseNavigationSessionTrigger)initWithName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NavdBaseNavigationSessionTrigger;
  return [(NavdBaseNavigationSessionTrigger *)&v4 initWithName:a3];
}

- (id)objectForJSON
{
  v2 = (MSg *)[(NavdBaseNavigationSessionTrigger *)self isTrue];

  return (id)MSg::jsonFor(v2, v3);
}

- (void)didAddFirstObserver
{
  id v3 = +[MNNavdStateUpdater sharedUpdater];
  [v3 registerObserver:self];
}

- (void)didRemoveLastObserver
{
  id v3 = +[MNNavdStateUpdater sharedUpdater];
  [v3 unregisterObserver:self];
}

- (BOOL)isTrue
{
  BOOL result = [(NavdBaseNavigationSessionTrigger *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (void)didNavigationStateChange
{
}

@end