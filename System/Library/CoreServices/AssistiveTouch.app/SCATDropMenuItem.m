@interface SCATDropMenuItem
- (BOOL)handleActivateWithElement:(id)a3;
- (SCATDropMenuItem)initWithTitle:(id)a3 fixedSpaceScreenPoint:(CGPoint)a4 delegate:(id)a5 menu:(id)a6;
@end

@implementation SCATDropMenuItem

- (SCATDropMenuItem)initWithTitle:(id)a3 fixedSpaceScreenPoint:(CGPoint)a4 delegate:(id)a5 menu:(id)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v10.receiver = self;
  v10.super_class = (Class)SCATDropMenuItem;
  char v9 = 1;
  result = [(SCATModernMenuItem *)&v10 initWithIdentifier:@"kSCATDropMenuItemIdentifier" delegate:a5 title:a3 imageName:@"SCATIcon_gestures_drop" activateBehavior:2 allowedWithGuidedAccess:1 allowedWithAssistiveAccess:v9 activateHandler:&stru_1001AD5A0 updateHandler:0];
  if (result)
  {
    result->_fixedSpaceScreenPoint.CGFloat x = x;
    result->_fixedSpaceScreenPoint.CGFloat y = y;
  }
  return result;
}

- (BOOL)handleActivateWithElement:(id)a3
{
  id v4 = a3;
  v5 = +[SCATScannerManager sharedManager];
  objc_msgSend(v5, "moveDragSessionToFixedSpaceScreenPoint:", self->_fixedSpaceScreenPoint.x, self->_fixedSpaceScreenPoint.y);

  v7.receiver = self;
  v7.super_class = (Class)SCATDropMenuItem;
  LOBYTE(self) = [(SCATModernMenuItem *)&v7 handleActivateWithElement:v4];

  return (char)self;
}

@end