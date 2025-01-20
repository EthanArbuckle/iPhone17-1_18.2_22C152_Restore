@interface SCATModernMenuConfirmGestureSheet
- (BOOL)allowsBackAction;
- (BOOL)allowsExitAction;
- (BOOL)shouldKeepScannerAwake;
- (CGRect)rectToClear;
- (SCATMenuGestureConfirmationItemsViewDelegate)delegate;
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SCATModernMenuConfirmGestureSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = +[NSMutableArray array];
  v4 = [(SCATModernMenuConfirmGestureSheet *)self delegate];
  v5 = [v4 nameForConfirmationButton:self];
  v6 = +[SCATModernMenuItem itemWithIdentifier:@"general_done" delegate:self title:v5 imageName:0 activateBehavior:0];
  [v3 addObject:v6];

  v7 = sub_100040EC8(@"REDO_LINE_GESTURE");
  v8 = +[SCATModernMenuItem itemWithIdentifier:@"general_redo" delegate:self title:v7 imageName:0 activateBehavior:0];
  [v3 addObject:v8];

  v9 = sub_100040EC8(@"CANCEL_LINE_GESTURE");
  v10 = +[SCATModernMenuItem itemWithIdentifier:@"general_cancel" delegate:self title:v9 imageName:0 activateBehavior:0];
  [v3 addObject:v10];

  return v3;
}

- (BOOL)allowsBackAction
{
  return 0;
}

- (BOOL)allowsExitAction
{
  return 0;
}

- (CGRect)rectToClear
{
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)shouldKeepScannerAwake
{
  return 1;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if ([v5 isEqualToString:@"general_done"])
  {
    v6 = [(SCATModernMenuConfirmGestureSheet *)self delegate];
    [v6 didConfirmGesture:self];
  }
  else if ([v5 isEqualToString:@"general_cancel"])
  {
    v6 = [(SCATModernMenuConfirmGestureSheet *)self delegate];
    [v6 didCancelGesture:self];
  }
  else
  {
    if (![v5 isEqualToString:@"general_redo"])
    {
      v7.receiver = self;
      v7.super_class = (Class)SCATModernMenuConfirmGestureSheet;
      [(SCATModernMenuSheet *)&v7 menuItemWasActivated:v4];
      goto LABEL_8;
    }
    v6 = [(SCATModernMenuConfirmGestureSheet *)self delegate];
    [v6 didRequestRedoGesture:self];
  }

LABEL_8:
}

- (SCATMenuGestureConfirmationItemsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATMenuGestureConfirmationItemsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end