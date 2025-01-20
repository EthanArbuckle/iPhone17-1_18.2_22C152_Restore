@interface AMSOpenActionResult
- (AMSURLAction)action;
- (BOOL)engagementPresented;
- (BOOL)interruptionResult;
- (void)setAction:(id)a3;
- (void)setEngagementPresented:(BOOL)a3;
- (void)setInterruptionResult:(BOOL)a3;
@end

@implementation AMSOpenActionResult

- (AMSURLAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (BOOL)engagementPresented
{
  return self->_engagementPresented;
}

- (void)setEngagementPresented:(BOOL)a3
{
  self->_engagementPresented = a3;
}

- (BOOL)interruptionResult
{
  return self->_interruptionResult;
}

- (void)setInterruptionResult:(BOOL)a3
{
  self->_interruptionResult = a3;
}

- (void).cxx_destruct
{
}

@end