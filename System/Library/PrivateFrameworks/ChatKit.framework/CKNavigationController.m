@interface CKNavigationController
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutorotate;
- (id)preferredFocusEnvironments;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation CKNavigationController

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CKNavigationController;
  [(CKNavigationController *)&v7 viewDidLayoutSubviews];
  v3 = [(CKNavigationController *)self visibleViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(CKNavigationController *)self visibleViewController];
    v6 = [v5 view];
    [v6 setNeedsLayout];
  }
}

- (BOOL)prefersStatusBarHidden
{
  v3 = [(CKNavigationController *)self visibleViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    unsigned __int8 v4 = [v3 prefersStatusBarHidden];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKNavigationController;
    unsigned __int8 v4 = [(CKNavigationController *)&v7 prefersStatusBarHidden];
  }
  BOOL v5 = v4;

  return v5;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    objc_super v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v10 = self;
      __int16 v11 = 2112;
      id v12 = v6;
      __int16 v13 = 1024;
      BOOL v14 = v4;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "navigationController: %@, setting view controllers: %@, animated: %{BOOL}d", buf, 0x1Cu);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)CKNavigationController;
  [(CKNavigationController *)&v8 setViewControllers:v6 animated:v4];
}

- (BOOL)shouldAutorotate
{
  v2 = [(CKNavigationController *)self visibleViewController];
  char v3 = [v2 shouldAutorotate];

  return v3;
}

- (id)preferredFocusEnvironments
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

@end