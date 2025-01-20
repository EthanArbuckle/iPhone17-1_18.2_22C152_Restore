@interface BKUIIndicatorWindow
+ (id)instanceWithWindowScene:(id)a3;
- (BKUIIndicatorViewController)indicatorController;
- (BOOL)shouldShow;
- (id)backgroundColor;
- (void)setIndicatorController:(id)a3;
- (void)setShouldShow:(BOOL)a3;
@end

@implementation BKUIIndicatorWindow

+ (id)instanceWithWindowScene:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(BKUIIndicatorWindow);
  [(BKUIIndicatorWindow *)v4 setWindowLevel:*MEMORY[0x1E4F43F18]];
  [(BKUIIndicatorWindow *)v4 setWindowScene:v3];

  v5 = [MEMORY[0x1E4F428B8] clearColor];
  [(BKUIIndicatorWindow *)v4 setBackgroundColor:v5];

  v6 = [(BKUIIndicatorWindow *)v4 indicatorController];
  [(BKUIIndicatorWindow *)v4 setRootViewController:v6];

  [(BKUIIndicatorWindow *)v4 makeKeyAndVisible];
  [(BKUIIndicatorWindow *)v4 setUserInteractionEnabled:0];

  return v4;
}

- (BKUIIndicatorViewController)indicatorController
{
  indicatorController = self->_indicatorController;
  if (!indicatorController)
  {
    v4 = objc_alloc_init(BKUIIndicatorViewController);
    v5 = self->_indicatorController;
    self->_indicatorController = v4;

    indicatorController = self->_indicatorController;
  }

  return indicatorController;
}

- (id)backgroundColor
{
  return (id)[MEMORY[0x1E4F428B8] clearColor];
}

- (void)setShouldShow:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(BKUIIndicatorWindow *)self indicatorController];
  [v5 setShouldShow:v3];

  [(BKUIIndicatorWindow *)self layoutIfNeeded];
}

- (void)setIndicatorController:(id)a3
{
}

- (BOOL)shouldShow
{
  return self->_shouldShow;
}

- (void).cxx_destruct
{
}

@end