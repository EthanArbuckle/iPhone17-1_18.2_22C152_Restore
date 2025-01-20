@interface VOTUserEventManager
+ (id)sharedInstance;
- (VOTUserEventManager)init;
- (double)lastEventOccurred;
- (void)userEventOccurred;
@end

@implementation VOTUserEventManager

+ (id)sharedInstance
{
  if (qword_1001EBA50 != -1) {
    dispatch_once(&qword_1001EBA50, &stru_1001B6118);
  }
  v2 = (void *)qword_1001EBA48;

  return v2;
}

- (VOTUserEventManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)VOTUserEventManager;
  return [(VOTUserEventManager *)&v3 init];
}

- (void)userEventOccurred
{
  objc_super v3 = +[AXUserEventTimer sharedInstance];
  [v3 userEventOccurred];

  self->_lastEventOccurred = CFAbsoluteTimeGetCurrent();
}

- (double)lastEventOccurred
{
  return self->_lastEventOccurred;
}

@end