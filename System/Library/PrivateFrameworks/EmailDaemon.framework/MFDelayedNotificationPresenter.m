@interface MFDelayedNotificationPresenter
- (MFDelayedNotificationPresenter)init;
- (MFDelayedNotificationsPresenterDelegate)delegate;
- (double)postingDelay;
- (void)_delegateProcessMessages:(id)a3;
- (void)_processSufficientlyDelayedMessages;
- (void)_removeProcessedMessages;
- (void)_scheduleNextFireEvent;
- (void)clearPendingMessages;
- (void)dealloc;
- (void)immediatelyProcessPendingMessagesWithIdentifiers:(id)a3;
- (void)removePendingMessagesWithAccountIdentifiers:(id)a3;
- (void)removePendingMessagesWithIdentifiers:(id)a3;
- (void)schedulePendingNotificationMessage:(id)a3 identifier:(id)a4 context:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setPostingDelay:(double)a3;
@end

@implementation MFDelayedNotificationPresenter

- (MFDelayedNotificationPresenter)init
{
  v18.receiver = self;
  v18.super_class = (Class)MFDelayedNotificationPresenter;
  v2 = [(MFDelayedNotificationPresenter *)&v18 init];
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"com.apple.mobilemail.notificationcenter.delayedpresenter.%p", v2];
    v4 = (const char *)[v3 UTF8String];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = [v3 stringByAppendingString:@".delegate"];

    id v9 = v8;
    v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create(v10, v12);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v13;

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingMessages = v2->_pendingMessages;
    v2->_pendingMessages = v15;
  }
  return v2;
}

- (void)dealloc
{
  fireSource = self->_fireSource;
  if (fireSource) {
    dispatch_source_cancel(fireSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)MFDelayedNotificationPresenter;
  [(MFDelayedNotificationPresenter *)&v4 dealloc];
}

- (void)setPostingDelay:(double)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100059BC8;
  v4[3] = &unk_100139BA8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (double)postingDelay
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = -1;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100059D48;
  v5[3] = &unk_10013B160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)clearPendingMessages
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059DD0;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)removePendingMessagesWithIdentifiers:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100059EE8;
  v7[3] = &unk_100139C20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removePendingMessagesWithAccountIdentifiers:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005A1E0;
  v7[3] = &unk_100139C20;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)schedulePendingNotificationMessage:(id)a3 identifier:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  +[NSDate timeIntervalSinceReferenceDate];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A74C;
  block[3] = &unk_10013BAC0;
  block[4] = self;
  id v17 = v9;
  uint64_t v20 = v12;
  id v18 = v8;
  id v19 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(queue, block);
}

- (void)immediatelyProcessPendingMessagesWithIdentifiers:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005AA8C;
  v7[3] = &unk_100139C20;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_scheduleNextFireEvent
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_fireSource)
  {
    double v3 = MSUserNotificationsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      fireSource = self->_fireSource;
      *(_DWORD *)buf = 138412290;
      double v26 = *(double *)&fireSource;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "cancelling existing fire source %@", buf, 0xCu);
    }

    dispatch_source_cancel((dispatch_source_t)self->_fireSource);
    v5 = self->_fireSource;
    self->_fireSource = 0;
  }
  if ([(NSMutableArray *)self->_pendingMessages count])
  {
    id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    v7 = self->_fireSource;
    self->_fireSource = v6;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v8 = self->_fireSource;
    id v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_10005AF90;
    v22 = &unk_10013A038;
    objc_copyWeak(&v23, &location);
    dispatch_source_set_event_handler(v8, &v19);
    id v9 = -[NSMutableArray ef_firstObjectPassingTest:](self->_pendingMessages, "ef_firstObjectPassingTest:", &stru_10013BB00, v19, v20, v21, v22);
    [v9 submissionDate];
    double v11 = v10;
    double postingDelay = self->_postingDelay;
    +[NSDate timeIntervalSinceReferenceDate];
    double v14 = fmax(v11 + postingDelay - v13, 0.0);
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)self->_fireSource, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
    v16 = MSUserNotificationsLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v9 identifier];
      id v18 = self->_fireSource;
      *(_DWORD *)buf = 134218498;
      double v26 = v14;
      __int16 v27 = 2112;
      v28 = v17;
      __int16 v29 = 2112;
      v30 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "scheduling next delayed dequeue in %gs for '%@' (%@)", buf, 0x20u);
    }
    dispatch_resume((dispatch_object_t)self->_fireSource);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

- (void)_processSufficientlyDelayedMessages
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = v3 - self->_postingDelay;
  pendingMessages = self->_pendingMessages;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005B1A0;
  v10[3] = &unk_10013BB20;
  *(double *)&v10[4] = v4;
  id v6 = [(NSMutableArray *)pendingMessages ef_objectsPassingTest:v10];
  [v6 makeObjectsPerformSelector:"process"];
  v7 = MSUserNotificationsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 count];
    id v9 = [(NSMutableArray *)self->_pendingMessages count];
    *(_DWORD *)buf = 134218240;
    id v12 = v8;
    __int16 v13 = 2048;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "found %lu sufficiently delayed messages (out of %lu)", buf, 0x16u);
  }

  if ([v6 count]) {
    [(MFDelayedNotificationPresenter *)self _delegateProcessMessages:v6];
  }
}

- (void)_delegateProcessMessages:(id)a3
{
  id v4 = a3;
  v5 = MSUserNotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 count];
    v7 = [v4 valueForKey:@"identifier"];
    id v8 = [v7 componentsJoinedByString:@"', '"];
    *(_DWORD *)buf = 134218242;
    id v14 = v6;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "processing %lu messages {'%@'}", buf, 0x16u);
  }
  delegateQueue = self->_delegateQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005B3C0;
  v11[3] = &unk_100139C20;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(delegateQueue, v11);
}

- (void)_removeProcessedMessages
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v3 = MSUserNotificationsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "removing all processed messages", v5, 2u);
  }

  id v4 = [(NSMutableArray *)self->_pendingMessages indexesOfObjectsPassingTest:&stru_10013BB60];
  [(NSMutableArray *)self->_pendingMessages removeObjectsAtIndexes:v4];
  [(MFDelayedNotificationPresenter *)self _scheduleNextFireEvent];
}

- (MFDelayedNotificationsPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFDelayedNotificationsPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_fireSource, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end