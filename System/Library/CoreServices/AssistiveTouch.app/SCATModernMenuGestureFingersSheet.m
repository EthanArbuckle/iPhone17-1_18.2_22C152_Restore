@interface SCATModernMenuGestureFingersSheet
- (SCATMenuFingerItemsViewDelegate)delegate;
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SCATModernMenuGestureFingersSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = +[NSMutableArray array];
  v4 = AXFormatInteger();
  v5 = +[SCATModernMenuItem itemWithIdentifier:@"gestures_fingers1" delegate:self title:v4 imageName:0 activateBehavior:2];
  [v3 addObject:v5];

  v6 = AXFormatInteger();
  v7 = +[SCATModernMenuItem itemWithIdentifier:@"gestures_fingers2" delegate:self title:v6 imageName:0 activateBehavior:2];
  [v3 addObject:v7];

  v8 = AXFormatInteger();
  v9 = +[SCATModernMenuItem itemWithIdentifier:@"gestures_fingers3" delegate:self title:v8 imageName:0 activateBehavior:2];
  [v3 addObject:v9];

  v10 = AXFormatInteger();
  v11 = +[SCATModernMenuItem itemWithIdentifier:@"gestures_fingers4" delegate:self title:v10 imageName:0 activateBehavior:2];
  [v3 addObject:v11];

  v12 = AXFormatInteger();
  v13 = +[SCATModernMenuItem itemWithIdentifier:@"gestures_fingers5" delegate:self title:v12 imageName:0 activateBehavior:2];
  [v3 addObject:v13];

  return v3;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if ([v5 isEqualToString:@"gestures_fingers1"])
  {
    uint64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"gestures_fingers2"])
  {
    uint64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"gestures_fingers3"])
  {
    uint64_t v6 = 3;
  }
  else if ([v5 isEqualToString:@"gestures_fingers4"])
  {
    uint64_t v6 = 4;
  }
  else
  {
    if (![v5 isEqualToString:@"gestures_fingers5"])
    {
      v8.receiver = self;
      v8.super_class = (Class)SCATModernMenuGestureFingersSheet;
      [(SCATModernMenuSheet *)&v8 menuItemWasActivated:v4];
      goto LABEL_12;
    }
    uint64_t v6 = 5;
  }
  v7 = [(SCATModernMenuGestureFingersSheet *)self delegate];
  [v7 fingerItemsViewController:self didChooseNumberOfFingers:v6];

LABEL_12:
}

- (SCATMenuFingerItemsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATMenuFingerItemsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end