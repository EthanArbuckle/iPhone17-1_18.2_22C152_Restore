@interface IUIRTIInputView
- (BOOL)shouldShowDockView;
- (void)setShouldShowDockView:(BOOL)a3;
@end

@implementation IUIRTIInputView

- (BOOL)shouldShowDockView
{
  return self->_shouldShowDockView;
}

- (void)setShouldShowDockView:(BOOL)a3
{
  self->_shouldShowDockView = a3;
}

@end