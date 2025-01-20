@interface SCATAssistiveTouchWorkspace
+ (id)sharedWorkspace;
- (SCATAssistiveTouchWorkspace)init;
- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5;
- (void)dealloc;
- (void)pointerController:(id)a3 didReceivePointerEvent:(id)a4;
@end

@implementation SCATAssistiveTouchWorkspace

+ (id)sharedWorkspace
{
  if (qword_1001F0BF0 != -1) {
    dispatch_once(&qword_1001F0BF0, &stru_1001AE3F0);
  }
  v2 = (void *)qword_1001F0BE8;

  return v2;
}

- (SCATAssistiveTouchWorkspace)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCATAssistiveTouchWorkspace;
  v2 = [(SCATAssistiveTouchWorkspace *)&v6 init];
  if (v2)
  {
    v3 = +[HNDAccessibilityManager sharedManager];
    [v3 addObserver:v2];

    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = +[HNDAccessibilityManager sharedManager];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SCATAssistiveTouchWorkspace;
  [(SCATAssistiveTouchWorkspace *)&v4 dealloc];
}

- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5
{
  id v11 = a3;
  id v7 = a5;
  if (a4 == 1)
  {
    if (!_AXSAutomationEnabled()) {
      goto LABEL_8;
    }
    v8 = +[NSDistributedNotificationCenter defaultCenter];
    v9 = v8;
    CFStringRef v10 = @"AssistiveTouchDidReceiveScreenChange";
    goto LABEL_7;
  }
  if (a4 == 3 && _AXSAutomationEnabled())
  {
    v8 = +[NSDistributedNotificationCenter defaultCenter];
    v9 = v8;
    CFStringRef v10 = @"AssistiveTouchDidReceiveLayoutChange";
LABEL_7:
    [v8 postNotificationName:@"AssistiveTouchEventOccurred" object:v10];
  }
LABEL_8:
}

- (void)pointerController:(id)a3 didReceivePointerEvent:(id)a4
{
  if (objc_msgSend(a4, "type", a3) == 3 && _AXSAutomationEnabled())
  {
    id v4 = +[NSDistributedNotificationCenter defaultCenter];
    [v4 postNotificationName:@"AssistiveTouchEventOccurred" object:@"AssistiveTouchDidReceivePointerMoved"];
  }
}

@end