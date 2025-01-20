@interface UIViewController(StatusBarState)
- (uint64_t)_gkSaveStatusBarStyle:()StatusBarState;
- (void)_gkRestoreStatusBarStyle:()StatusBarState;
- (void)_gkSaveStatusBarStyleAnimated:()StatusBarState setToStyle:;
@end

@implementation UIViewController(StatusBarState)

- (void)_gkSaveStatusBarStyleAnimated:()StatusBarState setToStyle:
{
  id v8 = [MEMORY[0x1E4FB1438] sharedApplication];
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "statusBarStyle"));
  objc_setAssociatedObject(a1, "_GKSavedStatusBarStyleKey", v7, (void *)0x301);

  [v8 setStatusBarStyle:a4 animated:a3];
}

- (uint64_t)_gkSaveStatusBarStyle:()StatusBarState
{
  return [a1 _gkSaveStatusBarStyleAnimated:a3 setToStyle:0];
}

- (void)_gkRestoreStatusBarStyle:()StatusBarState
{
  v5 = objc_getAssociatedObject(a1, "_GKSavedStatusBarStyleKey");
  if (v5)
  {
    v6 = [MEMORY[0x1E4FB1438] sharedApplication];
    objc_msgSend(v6, "setStatusBarStyle:animated:", (int)objc_msgSend(v5, "intValue"), a3);
    objc_setAssociatedObject(a1, "_GKSavedStatusBarStyleKey", 0, (void *)0x301);
  }
  else
  {
    v7 = (NSObject **)MEMORY[0x1E4F63860];
    id v8 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v9 = (id)GKOSLoggers();
      id v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[UIViewController(StatusBarState) _gkRestoreStatusBarStyle:](v8);
    }
  }
}

- (void)_gkRestoreStatusBarStyle:()StatusBarState .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AF250000, log, OS_LOG_TYPE_DEBUG, "yowza! restored status bar too many times!", v1, 2u);
}

@end