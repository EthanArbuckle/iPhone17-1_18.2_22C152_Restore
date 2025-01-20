@interface WBBacklightController
+ (id)sharedInstance;
- (WBBacklightController)init;
- (unint64_t)currentFactor;
- (void)_addAssertion:(id)a3;
- (void)_reevaluateBacklight;
- (void)_removeAssertion:(id)a3;
@end

@implementation WBBacklightController

+ (id)sharedInstance
{
  if (qword_100180FA8 != -1) {
    dispatch_once(&qword_100180FA8, &stru_10015BE90);
  }
  v2 = (void *)qword_100180FA0;

  return v2;
}

- (WBBacklightController)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBBacklightController;
  v2 = [(WBBacklightController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableSet set];
    assertions = v2->_assertions;
    v2->_assertions = (NSMutableSet *)v3;

    v2->_currentFactor = 0;
    v2->_screenBlanked = 1;
  }
  return v2;
}

- (void)_reevaluateBacklight
{
  BSDispatchQueueAssertMain();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = self->_assertions;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v4)
  {

    self->_currentFactor = 0;
LABEL_14:
    BKSHIDServicesSetBacklightFactorWithFadeDurationAsync();
    dispatch_time_t v11 = dispatch_time(0, 350000005);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005770;
    block[3] = &unk_10015BEB8;
    block[4] = self;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);
    return;
  }
  id v5 = v4;
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)v15;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v3);
      }
      id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) factor];
      if (v6 <= (unint64_t)v9) {
        unint64_t v6 = (unint64_t)v9;
      }
    }
    id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v5);

  self->_currentFactor = v6;
  if (!v6) {
    goto LABEL_14;
  }
  if (self->_screenBlanked)
  {
    self->_screenBlanked = 0;
    v10 = +[FBSystemService sharedInstance];
    [v10 setSystemIdleSleepDisabled:1 forReason:@"backlight"];

    BKSDisplayServicesWillUnblank();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100005800;
    v12[3] = &unk_10015BEB8;
    v12[4] = self;
    +[CATransaction bs_performAfterSynchronizedCommit:v12];
  }
  else
  {
    BKSHIDServicesSetBacklightFactorWithFadeDurationAsync();
  }
}

- (void)_addAssertion:(id)a3
{
  [(NSMutableSet *)self->_assertions addObject:a3];

  [(WBBacklightController *)self _reevaluateBacklight];
}

- (void)_removeAssertion:(id)a3
{
  [(NSMutableSet *)self->_assertions removeObject:a3];

  [(WBBacklightController *)self _reevaluateBacklight];
}

- (unint64_t)currentFactor
{
  return self->_currentFactor;
}

- (void).cxx_destruct
{
}

@end