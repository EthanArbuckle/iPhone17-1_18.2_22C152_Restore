@interface DBFocusMovementManager
+ (BOOL)isMovementAllowedForHeading:(unint64_t)a3 direction:(unint64_t)a4 isRTL:(BOOL)a5 isLeftHandDrive:(BOOL)a6 statusBarEdge:(unint64_t)a7;
+ (BOOL)isOEMToiOSHeadingToStatusBar:(unint64_t)a3 isLeftHandDrive:(BOOL)a4 statusBarEdge:(unint64_t)a5;
+ (CGRect)convertRect:(CGRect)a3 fromView:(id)a4 toScreen:(id)a5;
+ (CGRect)convertRect:(CGRect)a3 toView:(id)a4 fromScreen:(id)a5;
- (DBEnvironmentConfiguration)environmentConfiguration;
- (DBFocusMovementManager)initWithEnvironmentConfiguration:(id)a3;
- (void)performHapticFeedbackForSenderID:(unint64_t)a3;
- (void)setEnvironmentConfiguration:(id)a3;
@end

@implementation DBFocusMovementManager

- (DBFocusMovementManager)initWithEnvironmentConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DBFocusMovementManager;
  v5 = [(DBFocusMovementManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_environmentConfiguration, v4);
  }

  return v6;
}

+ (BOOL)isMovementAllowedForHeading:(unint64_t)a3 direction:(unint64_t)a4 isRTL:(BOOL)a5 isLeftHandDrive:(BOOL)a6 statusBarEdge:(unint64_t)a7
{
  uint64_t v7 = 32;
  if (a5) {
    uint64_t v8 = 16;
  }
  else {
    uint64_t v8 = 32;
  }
  if (!a5) {
    uint64_t v7 = 16;
  }
  if (a4 == 1)
  {
    switch(a7)
    {
      case 0uLL:
      case 2uLL:
        uint64_t v10 = v8 | 4;
        uint64_t v11 = v7 | 8;
        if (a6) {
          uint64_t v10 = v11;
        }
        break;
      case 1uLL:
        uint64_t v10 = 17;
        break;
      case 3uLL:
        uint64_t v10 = 18;
        break;
      default:
        goto LABEL_16;
    }
  }
  else if (a4)
  {
LABEL_16:
    uint64_t v10 = 0;
  }
  else
  {
    switch(a7)
    {
      case 0uLL:
      case 2uLL:
        uint64_t v9 = v7 | 8;
        uint64_t v10 = v8 | 4;
        if (!a6) {
          uint64_t v10 = v9;
        }
        break;
      case 1uLL:
        uint64_t v10 = 34;
        break;
      case 3uLL:
        uint64_t v10 = 33;
        break;
      default:
        goto LABEL_16;
    }
  }
  return (v10 & a3) != 0;
}

+ (BOOL)isOEMToiOSHeadingToStatusBar:(unint64_t)a3 isLeftHandDrive:(BOOL)a4 statusBarEdge:(unint64_t)a5
{
  if (a3 == 8 && a5 == 2 && a4 || a3 == 4 && a5 == 2 && !a4) {
    return 1;
  }
  return a3 == 1 && a5 == 1;
}

+ (CGRect)convertRect:(CGRect)a3 fromView:(id)a4 toScreen:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  id v11 = a4;
  [v10 scale];
  CGFloat v13 = v12;
  v14 = [v10 fixedCoordinateSpace];

  objc_msgSend(v11, "convertRect:toCoordinateSpace:", v14, x, y, width, height);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  CGAffineTransformMakeScale(&v23, v13, v13);
  v24.origin.double x = v16;
  v24.origin.double y = v18;
  v24.size.double width = v20;
  v24.size.double height = v22;
  return CGRectApplyAffineTransform(v24, &v23);
}

+ (CGRect)convertRect:(CGRect)a3 toView:(id)a4 fromScreen:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a5;
  id v11 = a4;
  [v10 scale];
  CGAffineTransformMakeScale(&v30, 1.0 / v12, 1.0 / v12);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGRect v32 = CGRectApplyAffineTransform(v31, &v30);
  double v13 = v32.origin.x;
  double v14 = v32.origin.y;
  double v15 = v32.size.width;
  double v16 = v32.size.height;
  double v17 = [v10 fixedCoordinateSpace];

  objc_msgSend(v11, "convertRect:fromCoordinateSpace:", v17, v13, v14, v15, v16);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (void)performHapticFeedbackForSenderID:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v3 = a3;
    if (self->_currentSenderID != a3)
    {
      v5 = [(DBFocusMovementManager *)self environmentConfiguration];
      v6 = [v5 session];

      uint64_t v7 = [v6 inputDeviceManager];
      uint64_t v8 = [v7 touchpadWithSenderID:v3];

      if ([v8 feedbackSupported])
      {
        uint64_t v9 = v8;
      }
      else
      {
        uint64_t v9 = 0;
        unint64_t v3 = 0;
      }
      currentTouchpad = self->_currentTouchpad;
      self->_currentTouchpad = v9;

      self->_currentSenderID = v3;
    }
    id v11 = self->_currentTouchpad;
    [(CARInputDeviceTouchpad *)v11 performFeedbackOfType:1];
  }
}

- (DBEnvironmentConfiguration)environmentConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environmentConfiguration);
  return (DBEnvironmentConfiguration *)WeakRetained;
}

- (void)setEnvironmentConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environmentConfiguration);
  objc_storeStrong((id *)&self->_currentTouchpad, 0);
}

@end