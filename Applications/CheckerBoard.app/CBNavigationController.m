@interface CBNavigationController
- (BOOL)_usesTransitionController;
- (id)_pushedViewControllerBackgroundColor;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation CBNavigationController

- (void)viewDidLoad
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Navigation Controller's view loaded", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)CBNavigationController;
  [(CBNavigationController *)&v4 viewDidLoad];
  [(CBNavigationController *)self setModalPresentationStyle:2];
}

- (BOOL)_usesTransitionController
{
  return 0;
}

- (id)_pushedViewControllerBackgroundColor
{
  return +[UIColor whiteColor];
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v6;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Pushed view controller: %@ with animation %d", buf, 0x12u);
  }

  v8 = [(CBNavigationController *)self _pushedViewControllerBackgroundColor];
  v9 = [v6 view];
  [v9 setBackgroundColor:v8];

  v10.receiver = self;
  v10.super_class = (Class)CBNavigationController;
  [(CBNavigationController *)&v10 pushViewController:v6 animated:v4];
}

@end