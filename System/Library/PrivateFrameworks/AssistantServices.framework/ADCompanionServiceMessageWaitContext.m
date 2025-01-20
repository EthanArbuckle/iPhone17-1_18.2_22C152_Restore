@interface ADCompanionServiceMessageWaitContext
- (AFWatchdogTimer)timer;
- (NSMutableArray)seenMessageIDs;
- (NSMutableSet)waitingOnMessageIDs;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setSeenMessageIDs:(id)a3;
- (void)setTimer:(id)a3;
- (void)setWaitingOnMessageIDs:(id)a3;
@end

@implementation ADCompanionServiceMessageWaitContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_waitingOnMessageIDs, 0);
  objc_storeStrong((id *)&self->_seenMessageIDs, 0);
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setTimer:(id)a3
{
}

- (AFWatchdogTimer)timer
{
  return self->_timer;
}

- (void)setWaitingOnMessageIDs:(id)a3
{
}

- (NSMutableSet)waitingOnMessageIDs
{
  return self->_waitingOnMessageIDs;
}

- (void)setSeenMessageIDs:(id)a3
{
}

- (NSMutableArray)seenMessageIDs
{
  return self->_seenMessageIDs;
}

@end