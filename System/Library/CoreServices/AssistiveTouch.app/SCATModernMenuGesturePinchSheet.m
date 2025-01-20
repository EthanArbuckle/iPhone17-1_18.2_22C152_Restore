@interface SCATModernMenuGesturePinchSheet
- (CGRect)rectToClear;
- (SCATMenuPinchItemsViewDelegate)delegate;
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
- (void)setDelegate:(id)a3;
- (void)sheetWillAppear:(BOOL)a3;
- (void)sheetWillDisappear:(BOOL)a3;
@end

@implementation SCATModernMenuGesturePinchSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = +[NSMutableArray array];
  v4 = sub_100040EC8(@"PINCH_IN");
  v5 = +[SCATModernMenuItem itemWithIdentifier:@"gestures_pinchIn" delegate:self title:v4 imageName:0 activateBehavior:2];
  [v3 addObject:v5];

  v6 = sub_100040EC8(@"PINCH_OUT");
  v7 = +[SCATModernMenuItem itemWithIdentifier:@"gestures_pinchOut" delegate:self title:v6 imageName:0 activateBehavior:2];
  [v3 addObject:v7];

  v8 = sub_100040EC8(@"ROTATE_CLOCKWISE");
  v9 = +[SCATModernMenuItem itemWithIdentifier:@"gestures_rotateClockwise" delegate:self title:v8 imageName:0 activateBehavior:2];
  [v3 addObject:v9];

  v10 = sub_100040EC8(@"ROTATE_COUNTERCLOCKWISE");
  v11 = +[SCATModernMenuItem itemWithIdentifier:@"gestures_rotateCounterclockwise" delegate:self title:v10 imageName:0 activateBehavior:2];
  [v3 addObject:v11];

  return v3;
}

- (void)sheetWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCATModernMenuGesturePinchSheet;
  [(SCATModernMenuSheet *)&v5 sheetWillAppear:a3];
  self->_shouldStayInPinchModeDuringDisappearance = 0;
  v4 = [(SCATModernMenuGesturePinchSheet *)self delegate];
  [v4 didPushPinchItemsViewController:self];
}

- (void)sheetWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCATModernMenuGesturePinchSheet;
  [(SCATModernMenuSheet *)&v5 sheetWillDisappear:a3];
  if (!self->_shouldStayInPinchModeDuringDisappearance)
  {
    v4 = [(SCATModernMenuGesturePinchSheet *)self delegate];
    [v4 willPopPinchItemsViewController:self];
  }
}

- (CGRect)rectToClear
{
  v3 = [(SCATModernMenuGesturePinchSheet *)self delegate];
  [v3 rectToClearForPinchGesture:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  double v5 = [v4 identifier];
  if ([v5 isEqualToString:@"gestures_pinchIn"])
  {
    self->_shouldStayInPinchModeDuringDisappearance = 1;
    double v6 = [(SCATModernMenuGesturePinchSheet *)self delegate];
    [v6 didChoosePinchIn:self];
  }
  else if ([v5 isEqualToString:@"gestures_pinchOut"])
  {
    self->_shouldStayInPinchModeDuringDisappearance = 1;
    double v6 = [(SCATModernMenuGesturePinchSheet *)self delegate];
    [v6 didChoosePinchOut:self];
  }
  else if ([v5 isEqualToString:@"gestures_rotateClockwise"])
  {
    self->_shouldStayInPinchModeDuringDisappearance = 1;
    double v6 = [(SCATModernMenuGesturePinchSheet *)self delegate];
    [v6 didChooseRotateClockwise:self];
  }
  else
  {
    if (![v5 isEqualToString:@"gestures_rotateCounterclockwise"])
    {
      v7.receiver = self;
      v7.super_class = (Class)SCATModernMenuGesturePinchSheet;
      [(SCATModernMenuSheet *)&v7 menuItemWasActivated:v4];
      goto LABEL_10;
    }
    self->_shouldStayInPinchModeDuringDisappearance = 1;
    double v6 = [(SCATModernMenuGesturePinchSheet *)self delegate];
    [v6 didChooseRotateCounterclockwise:self];
  }

LABEL_10:
}

- (SCATMenuPinchItemsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATMenuPinchItemsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end