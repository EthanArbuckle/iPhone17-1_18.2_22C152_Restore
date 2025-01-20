@interface UIAccessibilityNotificationCustomAction
- (id)control;
- (void)setControl:(id)a3;
@end

@implementation UIAccessibilityNotificationCustomAction

- (id)control
{
  id WeakRetained = objc_loadWeakRetained(&self->_control);

  return WeakRetained;
}

- (void)setControl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end