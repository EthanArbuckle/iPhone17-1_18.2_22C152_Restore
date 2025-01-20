@interface ACDelayedConfirmationViewController
- (BOOL)_executeTriggerBlock:(id)a3;
- (BOOL)_hasScheduledAutomaticConfirmation;
- (BOOL)triggerConfirmation;
- (BOOL)triggerDenial;
- (void)_automaticConfirmationTimerDidFire:(id)a3;
- (void)_cancelAutomaticConfirmation;
- (void)_removeFromTranscript;
- (void)_scheduleAutomaticConfirmation;
- (void)dealloc;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ACDelayedConfirmationViewController

- (void)dealloc
{
  [(ACDelayedConfirmationViewController *)self _cancelAutomaticConfirmation];
  v3.receiver = self;
  v3.super_class = (Class)ACDelayedConfirmationViewController;
  [(ACDelayedConfirmationViewController *)&v3 dealloc];
}

- (void)_cancelAutomaticConfirmation
{
  [*(id *)(&self->super + 1) invalidate];
  objc_super v3 = *(void **)(&self->super + 1);
  *(void *)(&self->super + 1) = 0;
}

- (void)_scheduleAutomaticConfirmation
{
  [(ACDelayedConfirmationViewController *)self _cancelAutomaticConfirmation];
  id v5 = [(ACDelayedConfirmationViewController *)self aceObject];
  uint64_t v3 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_automaticConfirmationTimerDidFire:", 0, 0, (double)(uint64_t)[v5 autoConfirmDelay]);
  v4 = *(void **)(&self->super + 1);
  *(void *)(&self->super + 1) = v3;
}

- (BOOL)_hasScheduledAutomaticConfirmation
{
  return *(void *)(&self->super + 1) != 0;
}

- (void)_automaticConfirmationTimerDidFire:(id)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ACDelayedConfirmationViewController;
  [(ACDelayedConfirmationViewController *)&v4 viewDidAppear:a3];
  if ([(ACDelayedConfirmationViewController *)self isVirgin])
  {
    if (![(ACDelayedConfirmationViewController *)self _hasScheduledAutomaticConfirmation])[(ACDelayedConfirmationViewController *)self _scheduleAutomaticConfirmation]; {
  }
    }
}

- (void)_removeFromTranscript
{
  id v3 = [(ACDelayedConfirmationViewController *)self _privateDelegate];
  [v3 removeSiriViewController:self];
}

- (BOOL)_executeTriggerBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (*((unsigned int (**)(id))v4 + 2))(v4))
  {
    [(ACDelayedConfirmationViewController *)self _removeFromTranscript];
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)triggerConfirmation
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2B98;
  v3[3] = &unk_184A0;
  v3[4] = self;
  return [(ACDelayedConfirmationViewController *)self _executeTriggerBlock:v3];
}

- (BOOL)triggerDenial
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2C40;
  v3[3] = &unk_184A0;
  v3[4] = self;
  return [(ACDelayedConfirmationViewController *)self _executeTriggerBlock:v3];
}

- (void).cxx_destruct
{
}

@end