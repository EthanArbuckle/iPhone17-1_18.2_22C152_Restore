@interface ADUnavailableTimerStore
- (id)_createUnavailableError;
- (void)dismissTimersWithURLs:(id)a3 completionHandler:(id)a4;
- (void)getTimerWithCompletionHandler:(id)a3;
- (void)setTimer:(id)a3 completionHandler:(id)a4;
@end

@implementation ADUnavailableTimerStore

- (void)dismissTimersWithURLs:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = [(ADUnavailableTimerStore *)self _createUnavailableError];
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }
}

- (void)setTimer:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = [(ADUnavailableTimerStore *)self _createUnavailableError];
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }
}

- (void)getTimerWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(ADUnavailableTimerStore *)self _createUnavailableError];
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (id)_createUnavailableError
{
  return +[NSError _ad_timerStoreErrorWithCode:100];
}

@end