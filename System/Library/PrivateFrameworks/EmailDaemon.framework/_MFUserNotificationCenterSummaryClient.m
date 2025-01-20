@interface _MFUserNotificationCenterSummaryClient
- (BOOL)wantsContentsOfType:(int64_t)a3;
- (MFUserNotificationCenterController)observer;
- (NSString)description;
- (NSString)ef_publicDescription;
- (_MFUserNotificationCenterSummaryClient)initWithObserver:(id)a3 message:(id)a4;
- (double)ordering;
- (id)message;
- (int64_t)_calculatePriority;
- (int64_t)priority;
- (unint64_t)_calculateOrdering;
- (void)notifyContentsAvailable:(id)a3 forMessage:(id)a4;
- (void)notifyContentsUnavailableForMessage:(id)a3 error:(id)a4;
- (void)setObserver:(id)a3;
@end

@implementation _MFUserNotificationCenterSummaryClient

- (_MFUserNotificationCenterSummaryClient)initWithObserver:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_MFUserNotificationCenterSummaryClient;
  v8 = [(_MFUserNotificationCenterSummaryClient *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_storeStrong((id *)&v9->_message, a4);
    v9->_priority = [(_MFUserNotificationCenterSummaryClient *)v9 _calculatePriority];
    v9->_ordering = (double)[(_MFUserNotificationCenterSummaryClient *)v9 _calculateOrdering];
    v10 = v9;
  }

  return v9;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@: %p :: message=%@>", objc_opt_class(), self, self->_message];
}

- (NSString)ef_publicDescription
{
  uint64_t v3 = objc_opt_class();
  v4 = [(MFLibraryMessage *)self->_message ef_publicDescription];
  v5 = +[NSString stringWithFormat:@"<%@: %p :: message=%@, attempts=%lu, priority=%ld>", v3, self, v4, self->_attempts, self->_priority];

  return (NSString *)v5;
}

- (int64_t)_calculatePriority
{
  return ((uint64_t)((void)[(MFLibraryMessage *)self->_message messageFlags] << 39) >> 63) & 0x64;
}

- (unint64_t)_calculateOrdering
{
  [(MFLibraryMessage *)self->_message dateReceivedAsTimeIntervalSince1970];
  return (unint64_t)(v3 + (float)((float)self->_attempts * -60.0));
}

- (int64_t)priority
{
  return self->_priority;
}

- (double)ordering
{
  return self->_ordering;
}

- (id)message
{
  return self->_message;
}

- (BOOL)wantsContentsOfType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)notifyContentsAvailable:(id)a3 forMessage:(id)a4
{
  id v7 = (__CFString *)a3;
  v8 = (MFLibraryMessage *)a4;
  if (self->_message != v8)
  {
    objc_super v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MFUserNotificationCenterController.m" lineNumber:1367 description:@"Invalid message"];
  }
  if (!v7) {
    id v7 = &stru_10013ED08;
  }
  v9 = MSUserNotificationsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = [(MFLibraryMessage *)v8 ef_publicDescription];
    sub_1000C274C(v10, (int)[(__CFString *)v7 length], v13, v9);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [WeakRetained updateMessage:self->_message withSummary:v7];
}

- (void)notifyContentsUnavailableForMessage:(id)a3 error:(id)a4
{
  id v7 = (MFLibraryMessage *)a3;
  id v8 = a4;
  if (self->_message != v7)
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MFUserNotificationCenterController.m" lineNumber:1380 description:@"Invalid message"];
  }
  v9 = [(_MFUserNotificationCenterSummaryClient *)self observer];
  if (v9)
  {
    v10 = MSUserNotificationsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [(MFLibraryMessage *)v7 ef_publicDescription];
      sub_1000C280C(v11, v23, v10);
    }

    unint64_t v12 = self->_attempts + 1;
    self->_attempts = v12;
    if (v12 > 2)
    {
      v15 = MSUserNotificationsLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = [(MFLibraryMessage *)v7 ef_publicDescription];
        sub_1000C27B4(v16, buf, v15);
      }

      [v9 updateMessage:self->_message withSummary:&stru_10013ED08];
    }
    else
    {
      self->_ordering = (double)[(_MFUserNotificationCenterSummaryClient *)self _calculateOrdering];
      self->_priority = [(_MFUserNotificationCenterSummaryClient *)self _calculatePriority];
      dispatch_time_t v13 = dispatch_time(0, 5000000000);
      v14 = [v9 queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000A7710;
      block[3] = &unk_10013ABC8;
      v19 = v7;
      v20 = self;
      id v21 = v9;
      dispatch_after(v13, v14, block);
    }
  }
}

- (MFUserNotificationCenterController)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (MFUserNotificationCenterController *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);

  objc_storeStrong((id *)&self->_message, 0);
}

@end