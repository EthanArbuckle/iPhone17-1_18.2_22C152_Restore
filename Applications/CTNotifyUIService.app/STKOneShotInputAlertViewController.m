@interface STKOneShotInputAlertViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
@end

@implementation STKOneShotInputAlertViewController

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)STKOneShotInputAlertViewController;
  unsigned int v10 = -[STKBaseInputAlertViewController textField:shouldChangeCharactersInRange:replacementString:](&v14, "textField:shouldChangeCharactersInRange:replacementString:", a3, location, length, v9);
  BOOL v11 = v10;
  if (v9)
  {
    if (v10)
    {
      BOOL v11 = 1;
      if (!self->_sentResponse)
      {
        self->_sentResponse = 1;
        v12 = [(STKBaseAlertViewController *)self sessionAction];
        [v12 sendSuccessWithResponse:v9];

        [(STKBaseAlertViewController *)self dismiss];
        BOOL v11 = 0;
      }
    }
  }

  return v11;
}

@end