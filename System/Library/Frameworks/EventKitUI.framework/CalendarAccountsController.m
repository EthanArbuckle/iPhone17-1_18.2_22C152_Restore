@interface CalendarAccountsController
+ (id)sharedInstance;
- (CalendarAccountsController)initWithController:(id)a3;
- (int)sortOrderForSource:(id)a3;
@end

@implementation CalendarAccountsController

+ (id)sharedInstance
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedRefreshControllerLock);
  v2 = (void *)_sharedRefreshController;
  if (!_sharedRefreshController)
  {
    v3 = [CalendarAccountsController alloc];
    v4 = [MEMORY[0x1E4F57B18] sharedInstance];
    uint64_t v5 = [(CalendarAccountsController *)v3 initWithController:v4];
    v6 = (void *)_sharedRefreshController;
    _sharedRefreshController = v5;

    v2 = (void *)_sharedRefreshController;
  }
  id v7 = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedRefreshControllerLock);

  return v7;
}

- (CalendarAccountsController)initWithController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalendarAccountsController;
  v6 = [(CalendarAccountsController *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_controller, a3);
  }

  return v7;
}

- (int)sortOrderForSource:(id)a3
{
  return [(CUIKAccountsController *)self->_controller sortOrderForSource:a3];
}

- (void).cxx_destruct
{
}

@end