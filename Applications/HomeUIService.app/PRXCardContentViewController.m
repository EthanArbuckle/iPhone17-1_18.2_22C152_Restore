@interface PRXCardContentViewController
- (id)_addButtonWithLocalizedTitle:(id)a3 style:(int64_t)a4 target:(id)a5 futureSelector:(SEL)a6;
- (id)_addButtonWithTitleKey:(id)a3 style:(int64_t)a4 target:(id)a5 futureSelector:(SEL)a6;
- (id)addOptionalButtonWithLocalizedTitle:(id)a3 target:(id)a4 futureSelector:(SEL)a5;
- (id)addOptionalButtonWithTitleKey:(id)a3 target:(id)a4 futureSelector:(SEL)a5;
- (id)addOptionalDismissButtonWithLocalizedTitleKey:(id)a3;
- (id)addProminentButtonWithLocalizedTitle:(id)a3 target:(id)a4 futureSelector:(SEL)a5;
- (id)addProminentButtonWithTitleKey:(id)a3 target:(id)a4 futureSelector:(SEL)a5;
- (id)addProminentDismissButtonWithTitleKey:(id)a3;
- (id)dismissFuture;
- (id)futureReturningDirectiveFromTarget:(id)a3 selector:(SEL)a4;
- (void)addDismissButtonWithCoordinator:(id)a3;
- (void)addDismissButtonWithCoordinator:(id)a3 dismissAfterExecuting:(id)a4;
- (void)addIdentifyButtonWithCoordinator:(id)a3;
- (void)handleButtonDirectiveFuture:(id)a3;
- (void)handleButtonDirectiveFuture:(id)a3 target:(id)a4;
- (void)performPRXLayoutPass;
@end

@implementation PRXCardContentViewController

- (id)addProminentButtonWithTitleKey:(id)a3 target:(id)a4 futureSelector:(SEL)a5
{
  return [(PRXCardContentViewController *)self _addButtonWithTitleKey:a3 style:0 target:a4 futureSelector:a5];
}

- (id)addProminentButtonWithLocalizedTitle:(id)a3 target:(id)a4 futureSelector:(SEL)a5
{
  return [(PRXCardContentViewController *)self _addButtonWithLocalizedTitle:a3 style:0 target:a4 futureSelector:a5];
}

- (id)addProminentDismissButtonWithTitleKey:(id)a3
{
  id v5 = a3;
  if (([(PRXCardContentViewController *)self conformsToProtocol:&OBJC_PROTOCOL___HSProxCardConfigurable] & 1) == 0)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PRXCardContentViewController+HSAdditions.m", 31, @"Invalid parameter not satisfying: %@", @"[self conformsToProtocol:@protocol(HSProxCardConfigurable)]" object file lineNumber description];
  }
  if ([(PRXCardContentViewController *)self conformsToProtocol:&OBJC_PROTOCOL___HSProxCardConfigurable])v6 = self; {
  else
  }
    v6 = 0;
  v7 = [(PRXCardContentViewController *)self addProminentButtonWithTitleKey:v5 target:v6 futureSelector:"dismissFuture"];

  return v7;
}

- (id)addOptionalButtonWithTitleKey:(id)a3 target:(id)a4 futureSelector:(SEL)a5
{
  return [(PRXCardContentViewController *)self _addButtonWithTitleKey:a3 style:1 target:a4 futureSelector:a5];
}

- (id)addOptionalButtonWithLocalizedTitle:(id)a3 target:(id)a4 futureSelector:(SEL)a5
{
  return [(PRXCardContentViewController *)self _addButtonWithLocalizedTitle:a3 style:1 target:a4 futureSelector:a5];
}

- (id)addOptionalDismissButtonWithLocalizedTitleKey:(id)a3
{
  id v5 = a3;
  if (([(PRXCardContentViewController *)self conformsToProtocol:&OBJC_PROTOCOL___HSProxCardConfigurable] & 1) == 0)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PRXCardContentViewController+HSAdditions.m", 48, @"Invalid parameter not satisfying: %@", @"[self conformsToProtocol:@protocol(HSProxCardConfigurable)]" object file lineNumber description];
  }
  if ([(PRXCardContentViewController *)self conformsToProtocol:&OBJC_PROTOCOL___HSProxCardConfigurable])v6 = self; {
  else
  }
    v6 = 0;
  v7 = [(PRXCardContentViewController *)self addOptionalButtonWithTitleKey:v5 target:v6 futureSelector:"dismissFuture"];

  return v7;
}

- (void)addIdentifyButtonWithCoordinator:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = HULocalizedString();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002C6F0;
  v9[3] = &unk_1000AA138;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  v7 = +[PRXAction actionWithTitle:v5 style:1 handler:v9];
  id v8 = [(PRXCardContentViewController *)self addAction:v7];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)addDismissButtonWithCoordinator:(id)a3
{
}

- (void)addDismissButtonWithCoordinator:(id)a3 dismissAfterExecuting:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PRXCardContentViewController *)self setDismissalType:(unint64_t)[(PRXCardContentViewController *)self dismissalType] | 1];
  if (![v6 requiresDismissalConfirmation])
  {
    objc_initWeak(&location, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002D27C;
    v20[3] = &unk_1000AA1D8;
    objc_copyWeak(&v22, &location);
    id v21 = v7;
    v13 = +[PRXAction actionWithTitle:&stru_1000ABBA8 style:0 handler:v20];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    goto LABEL_19;
  }
  id v8 = [v6 topAccessoryTuple];
  v9 = [v8 accessory];

  unsigned int v10 = [v6 isInSetupContext];
  unsigned int v11 = v10;
  if (!v9)
  {
    char v12 = 0;
    if (v10) {
      goto LABEL_13;
    }
LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  if (([v9 isBridged] & 1) == 0)
  {
    v14 = [v9 hf_bridgedAccessories];
    id v15 = [v14 count];

    if (v15) {
      char v12 = 0;
    }
    else {
      char v12 = v11;
    }
    if (v11) {
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  char v12 = 0;
  if ((v11 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_13:
  v16 = HULocalizedString();
LABEL_15:
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002CBC4;
  v24[3] = &unk_1000AA1B0;
  char v30 = v12;
  if ([v6 launchReason] == (id)1) {
    uint64_t v17 = 29;
  }
  else {
    uint64_t v17 = 28;
  }
  id v25 = v16;
  v26 = self;
  id v27 = v9;
  id v28 = v7;
  uint64_t v29 = v17;
  id v18 = v9;
  id v19 = v16;
  v13 = +[PRXAction actionWithTitle:&stru_1000ABBA8 style:0 handler:v24];

LABEL_19:
  [(PRXCardContentViewController *)self setDismissButtonAction:v13];
}

- (id)dismissFuture
{
  return +[NAFuture futureWithResult:&off_1000B0268];
}

- (id)_addButtonWithTitleKey:(id)a3 style:(int64_t)a4 target:(id)a5 futureSelector:(SEL)a6
{
  id v10 = a3;
  id v11 = a5;
  char v12 = sub_100060D74(v10);
  HULocalizedStringWithDefaultValue();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13) {
    id v13 = v10;
  }
  v14 = [(PRXCardContentViewController *)self _addButtonWithLocalizedTitle:v13 style:a4 target:v11 futureSelector:a6];

  return v14;
}

- (id)_addButtonWithLocalizedTitle:(id)a3 style:(int64_t)a4 target:(id)a5 futureSelector:(SEL)a6
{
  id v10 = a3;
  id v11 = a5;
  objc_initWeak(&location, self);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_10002D52C;
  id v19 = &unk_1000AA200;
  objc_copyWeak(v21, &location);
  id v12 = v11;
  id v20 = v12;
  v21[1] = (id)a6;
  id v13 = +[PRXAction actionWithTitle:v10 style:a4 handler:&v16];
  id v14 = -[PRXCardContentViewController addAction:](self, "addAction:", v13, v16, v17, v18, v19);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  return v13;
}

- (void)handleButtonDirectiveFuture:(id)a3
{
  id v7 = a3;
  if (([(PRXCardContentViewController *)self conformsToProtocol:&OBJC_PROTOCOL___HSProxCardConfigurable] & 1) == 0)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PRXCardContentViewController+HSAdditions.m", 220, @"Invalid parameter not satisfying: %@", @"[self conformsToProtocol:@protocol(HSProxCardConfigurable)]" object file lineNumber description];
  }
  if ([(PRXCardContentViewController *)self conformsToProtocol:&OBJC_PROTOCOL___HSProxCardConfigurable])id v5 = self; {
  else
  }
    id v5 = 0;
  [(PRXCardContentViewController *)self handleButtonDirectiveFuture:v7 target:v5];
}

- (void)handleButtonDirectiveFuture:(id)a3 target:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PRXCardContentViewController *)self performSelector:"coordinator"];
  [(PRXCardContentViewController *)self showActivityIndicatorWithStatus:&stru_1000ABBA8];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002D818;
  v15[3] = &unk_1000AA228;
  id v9 = v8;
  id v16 = v9;
  id v10 = v7;
  id v17 = v10;
  id v18 = self;
  id v11 = [v6 flatMap:v15];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002D8E8;
  v13[3] = &unk_1000A91F0;
  objc_copyWeak(&v14, &location);
  id v12 = [v11 addCompletionBlock:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)futureReturningDirectiveFromTarget:(id)a3 selector:(SEL)a4
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v6 = (void (*)(id, SEL))[v5 methodForSelector:a4];
    objc_opt_class();
    id v7 = v6(v5, a4);
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      uint64_t v10 = [v9 flatMap:&stru_1000AA248];
    }
    else
    {
      id v14 = NSStringFromSelector(a4);
      NSLog(@"Did not receive a future.  target (%@) action %@", v5, v14);

      id v15 = HFLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000672D8((int)v5, a4);
      }

      uint64_t v10 = +[NAFuture futureWithResult:&off_1000B0268];
    }
    id v13 = (void *)v10;
  }
  else
  {
    id v11 = NSStringFromSelector(a4);
    NSLog(@"target (%@) does not respond to selector (%@)", v5, v11);

    id v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100067374((int)v5, a4);
    }

    id v13 = +[NAFuture futureWithResult:&off_1000B0268];
  }

  return v13;
}

- (void)performPRXLayoutPass
{
  v3 = [(PRXCardContentViewController *)self performSelector:"contentVC"];
  if (!v3)
  {
    NSLog(&CFSTR("Performing a PRX layout pass only makes sense in the context of a nested child VC that needs to request relay"
                 "out.  Check why is self.contentVC nil").isa);
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100067448(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  id v12 = [v3 view];
  [v12 layoutIfNeeded];

  id v13 = [(PRXCardContentViewController *)self contentView];
  [v13 setNeedsUpdateConstraints];

  id v14 = [(PRXCardContentViewController *)self view];
  [v14 bounds];
  [(PRXCardContentViewController *)self updatePreferredContentSizeForCardWidth:v15];
}

@end