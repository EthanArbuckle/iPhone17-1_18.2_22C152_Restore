@interface SCATHardwareAction
+ (id)actionForHardwareActionString:(id)a3;
+ (id)crownPress:(unint64_t)a3;
+ (id)crownRotationClockwise:(BOOL)a3;
+ (id)topButtonPress:(unint64_t)a3;
+ (void)_performPress:(unint64_t)a3 numberOfPresses:(unint64_t)a4;
- (BOOL)clockwise;
- (unint64_t)actionType;
- (unint64_t)numberOfPresses;
- (void)performAction;
- (void)setActionType:(unint64_t)a3;
- (void)setClockwise:(BOOL)a3;
- (void)setNumberOfPresses:(unint64_t)a3;
@end

@implementation SCATHardwareAction

+ (id)crownPress:(unint64_t)a3
{
  v4 = objc_alloc_init(SCATHardwareAction);
  [(SCATHardwareAction *)v4 setActionType:0];
  [(SCATHardwareAction *)v4 setNumberOfPresses:a3];

  return v4;
}

+ (id)crownRotationClockwise:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = objc_alloc_init(SCATHardwareAction);
  [(SCATHardwareAction *)v4 setActionType:1];
  [(SCATHardwareAction *)v4 setClockwise:v3];

  return v4;
}

+ (id)topButtonPress:(unint64_t)a3
{
  v4 = objc_alloc_init(SCATHardwareAction);
  [(SCATHardwareAction *)v4 setActionType:2];
  [(SCATHardwareAction *)v4 setNumberOfPresses:a3];

  return v4;
}

+ (id)actionForHardwareActionString:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"pressCrownToSetUpLater"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToSetUpManually"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToOpenHome"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToContinue"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToBegin"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToTryAgain"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToSelect"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToStart"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownToResume"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownAfterInsertsAttached"] & 1) != 0
    || ([v4 isEqualToString:@"pressCrownAfterInsertsRemoved"] & 1) != 0
    || [v4 isEqualToString:@"pressCrownForMoreOptions"])
  {
    id v5 = a1;
    uint64_t v6 = 1;
LABEL_14:
    uint64_t v7 = [v5 crownPress:v6];
LABEL_15:
    v8 = (void *)v7;
    goto LABEL_16;
  }
  if (([v4 isEqualToString:@"doublePressCrownToSetUpManually"] & 1) != 0
    || ([v4 isEqualToString:@"doublePressCrownToContinueWithoutLenses"] & 1) != 0
    || [v4 isEqualToString:@"doublePressCrownToCancel"])
  {
    id v5 = a1;
    uint64_t v6 = 2;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"pressTopButtonToReplayVideo"])
  {
    id v10 = a1;
    uint64_t v11 = 1;
LABEL_27:
    uint64_t v7 = [v10 topButtonPress:v11];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"triplePressLockToShowAccessibilityOptions"])
  {
    id v10 = a1;
    uint64_t v11 = 3;
    goto LABEL_27;
  }
  v8 = 0;
LABEL_16:

  return v8;
}

- (void)performAction
{
  unint64_t v3 = [(SCATHardwareAction *)self actionType];
  if (v3 == 2)
  {
LABEL_4:
    id v4 = objc_opt_class();
    unint64_t v5 = [(SCATHardwareAction *)self actionType];
    unint64_t v6 = [(SCATHardwareAction *)self numberOfPresses];
    _[v4 _performPress:v5 numberOfPresses:v6];
    return;
  }
  if (v3 != 1)
  {
    if (v3) {
      return;
    }
    goto LABEL_4;
  }
  id v8 = +[AXPISystemActionHelper sharedInstance];
  if ([(SCATHardwareAction *)self clockwise]) {
    uint64_t v7 = 40;
  }
  else {
    uint64_t v7 = -40;
  }
  [v8 turnDigitalCrown:v7];
}

+ (void)_performPress:(unint64_t)a3 numberOfPresses:(unint64_t)a4
{
  if (a3 == 2)
  {
    uint64_t v11 = +[AXPISystemActionHelper sharedInstance];
    [v11 pressLockButtonDown];

    v12 = +[AXPISystemActionHelper sharedInstance];
    [v12 liftLockButtonUp];

    if (a4 < 2) {
      return;
    }
    v9 = v13;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    id v10 = sub_100060DD0;
    goto LABEL_7;
  }
  if (!a3)
  {
    uint64_t v7 = +[AXPISystemActionHelper sharedInstance];
    [v7 pressHomeButtonDown];

    id v8 = +[AXPISystemActionHelper sharedInstance];
    [v8 liftHomeButtonUp];

    if (a4 >= 2)
    {
      v9 = v14;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      id v10 = sub_100060DBC;
LABEL_7:
      v9[2] = v10;
      v9[3] = &unk_1001ACA60;
      v9[4] = a1;
      v9[5] = a3;
      v9[6] = a4;
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
}

- (BOOL)clockwise
{
  return self->_clockwise;
}

- (void)setClockwise:(BOOL)a3
{
  self->_clockwise = a3;
}

- (unint64_t)numberOfPresses
{
  return self->_numberOfPresses;
}

- (void)setNumberOfPresses:(unint64_t)a3
{
  self->_numberOfPresses = a3;
}

@end