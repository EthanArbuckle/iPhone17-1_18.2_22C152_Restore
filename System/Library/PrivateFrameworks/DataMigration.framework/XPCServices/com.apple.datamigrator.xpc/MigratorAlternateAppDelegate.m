@interface MigratorAlternateAppDelegate
- (MigratorAlternateAppDelegate)init;
- (OS_dispatch_semaphore)sema;
- (void)alternateSystemApp:(id)a3 didExitWithStatus:(int)a4;
- (void)alternateSystemApp:(id)a3 didFailToLaunchWithError:(id)a4;
- (void)alternateSystemApp:(id)a3 didTerminateWithSignal:(int)a4;
- (void)alternateSystemAppDidLaunch:(id)a3;
- (void)setSema:(id)a3;
- (void)waitUntilPreboardDidFinishUnlock;
@end

@implementation MigratorAlternateAppDelegate

- (MigratorAlternateAppDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)MigratorAlternateAppDelegate;
  v2 = [(MigratorAlternateAppDelegate *)&v6 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    sema = v2->_sema;
    v2->_sema = (OS_dispatch_semaphore *)v3;
  }
  return v2;
}

- (void)waitUntilPreboardDidFinishUnlock
{
  v2 = [(MigratorAlternateAppDelegate *)self sema];
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)alternateSystemAppDidLaunch:(id)a3
{
  _DMLogFunc();

  +[PUIProgressWindow setUsesPreBoardAppearance];
}

- (void)alternateSystemApp:(id)a3 didExitWithStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  if (v4)
  {
    v7 = +[NSNumber numberWithInt:v4];
    _DMLogFunc();

LABEL_3:
    objc_msgSend(v8, "activate", v7);
    goto LABEL_6;
  }
  if (!MKBDeviceUnlockedSinceBoot())
  {
    _DMLogFunc();
    goto LABEL_3;
  }
  objc_super v6 = [(MigratorAlternateAppDelegate *)self sema];
  dispatch_semaphore_signal(v6);

LABEL_6:
}

- (void)alternateSystemApp:(id)a3 didTerminateWithSignal:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v5 = +[NSNumber numberWithInt:v4];
  _DMLogFunc();

  objc_msgSend(v6, "activate", v5);
}

- (void)alternateSystemApp:(id)a3 didFailToLaunchWithError:(id)a4
{
}

- (OS_dispatch_semaphore)sema
{
  return self->_sema;
}

- (void)setSema:(id)a3
{
}

- (void).cxx_destruct
{
}

@end