@interface RetrievingDialog
- (RetrievingDialog)init;
- (RetrievingDialogDelegate)delegate;
- (__CFUserNotification)retrievingNotification;
- (const)stateName;
- (int64_t)state;
- (void)_dismiss;
- (void)_display;
- (void)_displayIfRequired;
- (void)_schedule;
- (void)_timeoutMinPeriod;
- (void)abort;
- (void)dealloc;
- (void)dismissDialog:(id)a3;
- (void)schedule;
- (void)setDelegate:(id)a3;
- (void)setRetrievingNotification:(__CFUserNotification *)a3;
- (void)setState:(int64_t)a3;
@end

@implementation RetrievingDialog

- (RetrievingDialog)init
{
  v3.receiver = self;
  v3.super_class = (Class)RetrievingDialog;
  result = [(RetrievingDialog *)&v3 init];
  if (result) {
    result->_state = 0;
  }
  return result;
}

- (const)stateName
{
  return (&off_1000246E0)[[(RetrievingDialog *)self state]];
}

- (void)_dismiss
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_super v3 = [(RetrievingDialog *)self retrievingNotification];
  if (v3)
  {
    CFUserNotificationCancel(v3);
    [(RetrievingDialog *)self setRetrievingNotification:0];
  }

  [(RetrievingDialog *)self setState:5];
}

- (void)setRetrievingNotification:(__CFUserNotification *)a3
{
  retrievingNotification = self->_retrievingNotification;
  if (retrievingNotification != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      retrievingNotification = self->_retrievingNotification;
    }
    self->_retrievingNotification = a3;
    if (retrievingNotification)
    {
      CFRelease(retrievingNotification);
    }
  }
}

- (void)abort
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000030B0;
  block[3] = &unk_100024670;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_timeoutMinPeriod
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  switch([(RetrievingDialog *)self state])
  {
    case 0:
    case 1:
    case 4:
      id v4 = +[NSAssertionHandler currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"RetrievingDialog.m" lineNumber:151 description:@"Invalid state when retrieving dialog min display timeout happened: %s" -[RetrievingDialog stateName](self, "stateName")];

      break;
    case 2:
      [(RetrievingDialog *)self setState:4];
      break;
    case 3:
      [(RetrievingDialog *)self _dismiss];
      break;
    default:
      return;
  }
}

- (void)_display
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(RetrievingDialog *)self setState:2];
  v16[0] = kCFUserNotificationAlertHeaderKey;
  objc_super v3 = CKLocalizedString();
  v17[0] = v3;
  v16[1] = kCFUserNotificationDefaultButtonTitleKey;
  id v4 = CKLocalizedString();
  v17[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  CFDictionaryRef v6 = +[CKVettingAlerts platformSpecificAlertOptionsWithOptions:v5 bundleIdentifier:0];

  CFUserNotificationRef v7 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v6);
  [(RetrievingDialog *)self setRetrievingNotification:v7];
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100003548;
  v13[3] = &unk_100024698;
  objc_copyWeak(&v14, &location);
  +[CKUserNotificationUtilities showUserNotification:v7 withCompletionBlock:v13];
  CFRelease(v7);
  v8 = +[CKBehaviorOptions sharedOptions];
  [v8 shareAcceptorRetrievingDialogMinPeriod];
  double v10 = v9;

  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003684;
  v12[3] = &unk_100024670;
  v12[4] = self;
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)dismissDialog:(id)a3
{
  [(RetrievingDialog *)self _dismiss];
  id v4 = [(RetrievingDialog *)self delegate];
  [v4 retrievingDialogCancelled];
}

- (void)_displayIfRequired
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  switch([(RetrievingDialog *)self state])
  {
    case 0:
    case 2:
    case 3:
    case 4:
      id v8 = +[NSAssertionHandler currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"RetrievingDialog.m" lineNumber:239 description:@"Invalid state when considering displaying retrieving dialog: %s" -[RetrievingDialog stateName](self, "stateName")];

      break;
    case 1:
      id v4 = [(RetrievingDialog *)self delegate];
      unsigned int v5 = [v4 retrievingDialogShouldDisplay];

      if (v5)
      {
        [(RetrievingDialog *)self _display];
      }
      else
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        CFDictionaryRef v6 = ck_log_facility_ck;
        if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          double v10 = self;
          CFUserNotificationRef v7 = "Not displaying the retrieving dialog: %p as the delegate didn't want it";
          goto LABEL_17;
        }
      }
      break;
    case 5:
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      CFDictionaryRef v6 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v10 = self;
        CFUserNotificationRef v7 = "Not displaying the retrieving dialog: %p as it got aborted";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, buf, 0xCu);
      }
      break;
    default:
      return;
  }
}

- (void)_schedule
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v4 = +[CKBehaviorOptions sharedOptions];
  [v4 shareAcceptorRetrievingDialogDelay];
  double v6 = v5;

  if ([(RetrievingDialog *)self state])
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"RetrievingDialog.m" lineNumber:248 description:@"Unexpected state in retrieving dialog schedule: %s" -[RetrievingDialog stateName](self, "stateName")];
  }
  [(RetrievingDialog *)self setState:1];
  objc_initWeak(&location, self);
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003AE0;
  block[3] = &unk_1000246C0;
  objc_copyWeak(&v10, &location);
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)schedule
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100003BC4;
  v2[3] = &unk_1000246C0;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  int64_t state = self->_state;
  if ((unint64_t)(state - 2) <= 2)
  {
    double v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"RetrievingDialog.m" lineNumber:270 description:@"Retrieving dialog currently displayed and then abandoned. Current state: %s" (&off_1000246E0)[state]];
  }
  retrievingNotification = self->_retrievingNotification;
  if (retrievingNotification)
  {
    CFRelease(retrievingNotification);
    self->_retrievingNotification = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)RetrievingDialog;
  [(RetrievingDialog *)&v7 dealloc];
}

- (RetrievingDialogDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RetrievingDialogDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (__CFUserNotification)retrievingNotification
{
  return self->_retrievingNotification;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (void).cxx_destruct
{
}

@end