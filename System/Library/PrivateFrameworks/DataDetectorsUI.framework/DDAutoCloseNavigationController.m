@interface DDAutoCloseNavigationController
- (DDFlightAction)target;
- (void)closePressed;
- (void)setTarget:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation DDAutoCloseNavigationController

- (void)closePressed
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(DDAutoCloseNavigationController *)self target];
  v6 = [v5 delegate];
  v7 = [(DDAutoCloseNavigationController *)self target];
  [v6 actionDidFinish:v7 shouldDismiss:0];

  v8.receiver = self;
  v8.super_class = (Class)DDAutoCloseNavigationController;
  [(DDAutoCloseNavigationController *)&v8 viewDidDisappear:v3];
}

- (DDFlightAction)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  return (DDFlightAction *)WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end