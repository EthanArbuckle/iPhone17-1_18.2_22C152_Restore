@interface CoachingFeedbackFilter
- (BOOL)isFinished;
- (CoachingFeedbackFilter)initWithDelegate:(id)a3 feedbackSet:(id)a4 feedbackDuration:(double)a5 iconDuration:(double)a6;
- (LARemoteUI)delegate;
- (NSSet)feedbackSet;
- (double)_timeoutForFeedback:(int64_t)a3;
- (double)feedbackDuration;
- (double)iconDuration;
- (void)_dispatchPendingBlocks;
- (void)_doneWaiting;
- (void)_sendFeedback:(int64_t)a3;
- (void)dispatchNowOrWhenFeedbackDurationAchieved:(BOOL)a3 finish:(BOOL)a4 block:(id)a5;
- (void)scheduleFeedback:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CoachingFeedbackFilter

- (CoachingFeedbackFilter)initWithDelegate:(id)a3 feedbackSet:(id)a4 feedbackDuration:(double)a5 iconDuration:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CoachingFeedbackFilter;
  v12 = [(CoachingFeedbackFilter *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeStrong((id *)&v13->_feedbackSet, a4);
    v13->_feedbackDuration = a5;
    v13->_iconDuration = a6;
    uint64_t v14 = objc_opt_new();
    pendingBlocks = v13->_pendingBlocks;
    v13->_pendingBlocks = (NSMutableArray *)v14;
  }
  return v13;
}

- (void)scheduleFeedback:(int64_t)a3
{
  v5 = sub_100007ABC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000272CC(a3, v5, v6);
  }

  if (self->_finished)
  {
    v7 = sub_100007ABC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ignoring feedback (already finished)", v16, 2u);
    }
LABEL_10:

    return;
  }
  feedbackSet = self->_feedbackSet;
  v9 = +[NSNumber numberWithInteger:a3];
  LODWORD(feedbackSet) = [(NSSet *)feedbackSet containsObject:v9];

  if (!feedbackSet) {
    return;
  }
  lastFeedback = self->_lastFeedback;
  id v11 = +[NSNumber numberWithInteger:a3];
  LODWORD(lastFeedback) = [(NSNumber *)lastFeedback isEqualToNumber:v11];

  if (lastFeedback)
  {
    v7 = sub_100007ABC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100027228();
    }
    goto LABEL_10;
  }
  v12 = +[NSNumber numberWithInteger:a3];
  v13 = self->_lastFeedback;
  self->_lastFeedback = v12;

  if (self->_waiting)
  {
    uint64_t v14 = sub_100007ABC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10002725C(a3, v14, v15);
    }
  }
  else
  {
    [(CoachingFeedbackFilter *)self _sendFeedback:[(NSNumber *)self->_lastFeedback integerValue]];
  }
}

- (double)_timeoutForFeedback:(int64_t)a3
{
  double result = dbl_10002C7F0[a3 == 8];
  if (a3 == 1) {
    return 0.0;
  }
  return result;
}

- (void)_sendFeedback:(int64_t)a3
{
  self->_waiting = 1;
  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  lastSentFeedback = self->_lastSentFeedback;
  self->_lastSentFeedback = v5;

  [(CoachingFeedbackFilter *)self _timeoutForFeedback:a3];
  double v8 = v7;
  v9 = sub_100007ABC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v22 = a3;
    __int16 v23 = 2048;
    double v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "sending feedback: %d, will wait %.2f sec", buf, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v19 = &off_10003A168;
  id v11 = +[NSNumber numberWithInteger:a3];
  v20 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  [WeakRetained noResponseEventWithParams:v12];

  id v13 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v14 = +[NSNumber numberWithInteger:a3];
  [v13 mechanismEvent:14 value:v14 reply:&stru_1000387E8];

  dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  v16 = +[DaemonUtils sharedInstance];
  objc_super v17 = [v16 serverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007D88;
  block[3] = &unk_100038810;
  block[4] = self;
  dispatch_after(v15, v17, block);
}

- (void)_doneWaiting
{
  p_lastFeedback = &self->_lastFeedback;
  unsigned __int8 v4 = [(NSNumber *)self->_lastFeedback isEqualToNumber:self->_lastSentFeedback];
  v5 = sub_100007ABC();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6) {
      sub_10002733C();
    }

    self->_waiting = 0;
    [(CoachingFeedbackFilter *)self _dispatchPendingBlocks];
  }
  else
  {
    if (v6) {
      sub_100027370((id *)p_lastFeedback, v5);
    }

    [(CoachingFeedbackFilter *)self _sendFeedback:[(NSNumber *)self->_lastFeedback integerValue]];
  }
}

- (void)dispatchNowOrWhenFeedbackDurationAchieved:(BOOL)a3 finish:(BOOL)a4 block:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  double v8 = (void (**)(void))a5;
  v9 = sub_100007ABC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315906;
    objc_super v17 = "-[CoachingFeedbackFilter dispatchNowOrWhenFeedbackDurationAchieved:finish:block:]";
    __int16 v18 = 1024;
    BOOL v19 = v6;
    __int16 v20 = 1024;
    BOOL v21 = v5;
    __int16 v22 = 2112;
    __int16 v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s %d, %d on %@", (uint8_t *)&v16, 0x22u);
  }

  if (self->_finished)
  {
    id v10 = sub_100007ABC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "won't dispatch, already finished", (uint8_t *)&v16, 2u);
    }

    goto LABEL_19;
  }
  if (!v6 && self->_waiting)
  {
    id v11 = sub_100007ABC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100027460((uint64_t)self, v11);
    }

    pendingBlocks = self->_pendingBlocks;
    id v13 = objc_retainBlock(v8);
    [(NSMutableArray *)pendingBlocks addObject:v13];

    if (!v5) {
      goto LABEL_19;
    }
LABEL_16:
    dispatch_time_t v15 = sub_100007ABC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1000273F8();
    }

    self->_finished = v5;
    goto LABEL_19;
  }
  uint64_t v14 = sub_100007ABC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10002742C();
  }

  v8[2](v8);
  if (v5) {
    goto LABEL_16;
  }
LABEL_19:
}

- (void)_dispatchPendingBlocks
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_pendingBlocks;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        v9 = sub_100007ABC();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          int v16 = v5;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "scheduling pending block[%d]", buf, 8u);
          ++v5;
        }

        (*(void (**)(uint64_t))(v8 + 16))(v8);
        double v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v4);
  }

  [(NSMutableArray *)self->_pendingBlocks removeAllObjects];
}

- (NSSet)feedbackSet
{
  return self->_feedbackSet;
}

- (double)feedbackDuration
{
  return self->_feedbackDuration;
}

- (double)iconDuration
{
  return self->_iconDuration;
}

- (LARemoteUI)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LARemoteUI *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feedbackSet, 0);
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_lastSentFeedback, 0);

  objc_storeStrong((id *)&self->_lastFeedback, 0);
}

@end