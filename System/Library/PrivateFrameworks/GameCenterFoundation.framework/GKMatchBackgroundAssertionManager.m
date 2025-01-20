@interface GKMatchBackgroundAssertionManager
+ (GKMatchBackgroundAssertionManager)shared;
- (GKMatchBackgroundAssertionManager)init;
- (RBSAssertion)activeAssertion;
- (void)acquire;
- (void)assertionWillInvalidate:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setActiveAssertion:(id)a3;
@end

@implementation GKMatchBackgroundAssertionManager

+ (GKMatchBackgroundAssertionManager)shared
{
  id matched = static MatchBackgroundAssertionManager.shared.getter();

  return (GKMatchBackgroundAssertionManager *)matched;
}

- (RBSAssertion)activeAssertion
{
  id matched = MatchBackgroundAssertionManager.activeAssertion.getter();

  return (RBSAssertion *)matched;
}

- (void)setActiveAssertion:(id)a3
{
  id v5 = a3;
  v6 = self;
  MatchBackgroundAssertionManager.activeAssertion.setter(a3);
}

- (GKMatchBackgroundAssertionManager)init
{
  return (GKMatchBackgroundAssertionManager *)sub_1C2E4800C();
}

- (void)dealloc
{
  v2 = self;
  MatchBackgroundAssertionManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
}

- (void)acquire
{
  v2 = self;
  MatchBackgroundAssertionManager.acquire()();
}

- (void)assertionWillInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MatchBackgroundAssertionManager.assertionWillInvalidate(_:)(v4);
}

- (void)invalidate
{
  v2 = self;
  MatchBackgroundAssertionManager.invalidate()();
}

@end