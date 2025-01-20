@interface BKSMousePointerPerDisplayInfo
- (BSCompoundAssertion)globalEventsAssertion;
- (BSCompoundAssertion)pointerSuppressionAssertion;
- (NSSet)previouslyRoutedContextIDs;
- (void)setGlobalEventsAssertion:(id)a3;
- (void)setPointerSuppressionAssertion:(id)a3;
- (void)setPreviouslyRoutedContextIDs:(id)a3;
@end

@implementation BKSMousePointerPerDisplayInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyRoutedContextIDs, 0);
  objc_storeStrong((id *)&self->_globalEventsAssertion, 0);
  objc_storeStrong((id *)&self->_pointerSuppressionAssertion, 0);
}

- (void)setPreviouslyRoutedContextIDs:(id)a3
{
}

- (NSSet)previouslyRoutedContextIDs
{
  return self->_previouslyRoutedContextIDs;
}

- (void)setGlobalEventsAssertion:(id)a3
{
}

- (BSCompoundAssertion)globalEventsAssertion
{
  return self->_globalEventsAssertion;
}

- (void)setPointerSuppressionAssertion:(id)a3
{
}

- (BSCompoundAssertion)pointerSuppressionAssertion
{
  return self->_pointerSuppressionAssertion;
}

@end