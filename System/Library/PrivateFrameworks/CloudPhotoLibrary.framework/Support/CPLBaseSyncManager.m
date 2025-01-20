@interface CPLBaseSyncManager
- (BOOL)_shouldShowIndicator;
- (CPLBaseSyncManager)initWithAbstractObject:(id)a3;
- (int64_t)_baseProgressForState:(unint64_t)a3 totalUnits:(int64_t *)a4;
- (void)_actuallyStartShowingIndicatorLocked;
- (void)_actuallyStopShowingIndicatorLocked;
- (void)_emitActivityStateLog;
- (void)_startShowingIndicator:(id)a3;
- (void)_stopShowingIndicator:(id)a3;
- (void)_updateOverridingForeground;
- (void)didFinishSyncSession;
- (void)didMoveToState:(unint64_t)a3;
- (void)didProgress:(float)a3 userInfo:(id)a4 forState:(unint64_t)a5;
- (void)prepareForClose;
- (void)setSyncSessionShouldBeForeground:(BOOL)a3;
- (void)syncSessionDidFailWithError:(id)a3;
- (void)syncSessionDidSucceed;
- (void)willStartSyncSession;
@end

@implementation CPLBaseSyncManager

- (CPLBaseSyncManager)initWithAbstractObject:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CPLBaseSyncManager;
  v3 = [(CPLBaseSyncManager *)&v10 initWithAbstractObject:a3];
  if (v3)
  {
    v4 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.cpl.syncindicator", v4);
    indicatorQueue = v3->_indicatorQueue;
    v3->_indicatorQueue = (OS_dispatch_queue *)v5;

    v7 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    activities = v3->_activities;
    v3->_activities = v7;

    v3->_currentState = 14;
  }
  return v3;
}

- (void)_updateOverridingForeground
{
  if (self->_closed || !self->_foreground || self->_currentState - 1 > 0xB)
  {
    if (self->_overridingForeground)
    {
      v3 = [(CPLBaseSyncManager *)self abstractObject];
      v4 = [v3 engineLibrary];
      dispatch_queue_t v5 = [v4 systemMonitor];
      [v5 stopOverridingSystemBudgets:8 reason:2];

      self->_overridingForeground = 0;
    }
  }
  else if (!self->_overridingForeground)
  {
    v6 = [(CPLBaseSyncManager *)self abstractObject];
    v7 = [v6 engineLibrary];
    v8 = [v7 systemMonitor];
    [v8 startOverridingSystemBudgets:8 reason:2];

    self->_overridingForeground = 1;
  }
}

- (BOOL)_shouldShowIndicator
{
  return 1;
}

- (void)_actuallyStartShowingIndicatorLocked
{
  if (self->_startShowingIndicatorTime == 0.0
    && [(CPLBaseSyncManager *)self _shouldShowIndicator])
  {
    if (!_CPLSilentLogging)
    {
      v3 = sub_1001854B8();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        int v4 = 138412290;
        dispatch_queue_t v5 = self;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@ start showing sync indicator", (uint8_t *)&v4, 0xCu);
      }
    }
    +[CPLSyncIndicator showSyncIndicator];
    self->_startShowingIndicatorTime = CFAbsoluteTimeGetCurrent();
  }
  ++self->_indicatorAge;
}

- (void)_actuallyStopShowingIndicatorLocked
{
  if (self->_startShowingIndicatorTime != 0.0)
  {
    double v3 = CFAbsoluteTimeGetCurrent() - self->_startShowingIndicatorTime;
    if (v3 >= 1.0)
    {
      self->_startShowingIndicatorTime = 0.0;
      if (!_CPLSilentLogging)
      {
        v7 = sub_1001854B8();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          objc_super v10 = self;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ stop showing sync indicator", buf, 0xCu);
        }
      }
      +[CPLSyncIndicator hideSyncIndicator];
    }
    else
    {
      unint64_t indicatorAge = self->_indicatorAge;
      dispatch_time_t v5 = dispatch_walltime(0, (uint64_t)((1.0 - v3) * 1000000000.0));
      indicatorQueue = self->_indicatorQueue;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100185684;
      v8[3] = &unk_100275EC8;
      v8[4] = self;
      v8[5] = indicatorAge;
      dispatch_after(v5, (dispatch_queue_t)indicatorQueue, v8);
    }
  }
}

- (void)_emitActivityStateLog
{
  if ([(NSCountedSet *)self->_activities count])
  {
    if (_CPLSilentLogging) {
      return;
    }
    double v3 = sub_1001854B8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = [(NSCountedSet *)self->_activities allObjects];
      dispatch_time_t v5 = [v4 componentsJoinedByString:@", "];
      int v6 = 138412290;
      v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Showing sync indicator for %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (_CPLSilentLogging) {
      return;
    }
    double v3 = sub_1001854B8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v6) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "No current activity. Not showing sync indicator.", (uint8_t *)&v6, 2u);
    }
  }
}

- (void)_startShowingIndicator:(id)a3
{
  id v4 = a3;
  indicatorQueue = self->_indicatorQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001859DC;
  v10[3] = &unk_100276018;
  v10[4] = self;
  id v11 = v4;
  int v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100186D7C;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  v7 = indicatorQueue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)_stopShowingIndicator:(id)a3
{
  id v5 = a3;
  indicatorQueue = self->_indicatorQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100185B64;
  v11[3] = &unk_100277218;
  v11[4] = self;
  id v12 = v5;
  SEL v13 = a2;
  v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100186D7C;
  block[3] = &unk_100275DF8;
  id v15 = v7;
  id v8 = indicatorQueue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)setSyncSessionShouldBeForeground:(BOOL)a3
{
  self->_foreground = a3;
  -[_CPLProgress setForeground:](self->_progress, "setForeground:");
  [(CPLBaseSyncManager *)self _updateOverridingForeground];
}

- (void)willStartSyncSession
{
  if (!self->_closed && !self->_didStartSyncSession)
  {
    if (!_CPLSilentLogging)
    {
      double v3 = sub_100185F08();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        if (self->_foreground) {
          id v4 = " (foreground)";
        }
        else {
          id v4 = "";
        }
        *(_DWORD *)v16 = 136315138;
        *(void *)&v16[4] = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Sync session is starting%s", v16, 0xCu);
      }
    }
    [(CPLBaseSyncManager *)self _startShowingIndicator:@"sync session"];
    [(CPLBaseSyncManager *)self beginClientWork:@"sync session"];
    progress = self->_progress;
    if (progress)
    {
      if (!_CPLSilentLogging)
      {
        int v6 = sub_100185F08();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Previous progress has not been unpublished", v16, 2u);
        }

        progress = self->_progress;
      }
      [(_CPLProgress *)progress unpublish];
      v7 = self->_progress;
      self->_progress = 0;
    }
    id v8 = [_CPLProgress alloc];
    id v9 = [(CPLBaseSyncManager *)self abstractObject];
    dispatch_block_t v10 = [v9 engineLibrary];
    id v11 = [v10 libraryIdentifier];
    id v12 = [(_CPLProgress *)v8 initWithIdentifier:v11 firstSyncOfMainLibrary:0];
    SEL v13 = self->_progress;
    self->_progress = v12;

    if (qword_1002DBFA0 != -1) {
      dispatch_once(&qword_1002DBFA0, &stru_10027F058);
    }
    [(_CPLProgress *)self->_progress setTotalUnitCount:1000 * qword_1002DBE98];
    if (self->_currentState > 0xD)
    {
      id v15 = self->_progress;
      int64_t v14 = 0;
    }
    else
    {
      int64_t v14 = -[CPLBaseSyncManager _baseProgressForState:totalUnits:](self, "_baseProgressForState:totalUnits:", 0);
      id v15 = self->_progress;
    }
    [(_CPLProgress *)v15 setCompletedUnitCount:v14];
    [(_CPLProgress *)self->_progress setForeground:self->_foreground];
    [(_CPLProgress *)self->_progress publish];
    [(CPLBaseSyncManager *)self _updateOverridingForeground];
    self->_didStartSyncSession = 1;
  }
}

- (void)didFinishSyncSession
{
  if (self->_didStartSyncSession)
  {
    if (!_CPLSilentLogging)
    {
      double v3 = sub_100185F08();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        if (self->_foreground) {
          id v4 = " (foreground)";
        }
        else {
          id v4 = "";
        }
        int v8 = 136315138;
        id v9 = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Sync session did finish%s", (uint8_t *)&v8, 0xCu);
      }
    }
    [(CPLBaseSyncManager *)self _stopShowingIndicator:@"sync session"];
    [(CPLBaseSyncManager *)self endClientWork:@"sync session"];
    self->_currentState = 14;
    [(_CPLProgress *)self->_progress unpublish];
    progress = self->_progress;
    self->_progress = 0;

    self->_didStartSyncSession = 0;
  }
  [(CPLBaseSyncManager *)self _updateOverridingForeground];
  int v6 = [(CPLBaseSyncManager *)self abstractObject];
  v7 = [v6 engineLibrary];
  [v7 reportQuarantineCountIfNecessary];
}

- (void)syncSessionDidFailWithError:(id)a3
{
  id v4 = a3;
  if ([v4 isCPLOperationCancelledError])
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_100185F08();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sync session has been cancelled and finished", (uint8_t *)&v14, 2u);
      }
LABEL_17:
    }
  }
  else
  {
    if (![v4 isCPLErrorWithCode:10000])
    {
      v7 = [(CPLBaseSyncManager *)self abstractObject];
      int v8 = [v7 engineLibrary];
      id v5 = [v8 transport];

      id v9 = [v4 userInfo];
      dispatch_block_t v10 = [v9 objectForKey:NSUnderlyingErrorKey];

      if (!_CPLSilentLogging)
      {
        id v11 = sub_100185F08();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          if (self->_foreground) {
            id v12 = " (foreground)";
          }
          else {
            id v12 = "";
          }
          SEL v13 = [v5 bestErrorForUnderlyingError:v10];
          int v14 = 136315650;
          id v15 = v12;
          __int16 v16 = 2112;
          id v17 = v4;
          __int16 v18 = 2112;
          v19 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Sync session did fail with error%s: %@, underlying error: %@", (uint8_t *)&v14, 0x20u);
        }
      }

      goto LABEL_17;
    }
    if (!_CPLSilentLogging)
    {
      id v5 = sub_100185F08();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = [v4 localizedDescription];
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sync session has to be retried: %@", (uint8_t *)&v14, 0xCu);
      }
      goto LABEL_17;
    }
  }
}

- (void)syncSessionDidSucceed
{
  if (!_CPLSilentLogging)
  {
    double v3 = sub_100185F08();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      if (self->_foreground) {
        id v4 = " (foreground)";
      }
      else {
        id v4 = "";
      }
      int v5 = 136315138;
      int v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Sync session did succeed%s", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (int64_t)_baseProgressForState:(unint64_t)a3 totalUnits:(int64_t *)a4
{
  if (a3 < 0xE)
  {
    if (a3)
    {
      unint64_t v5 = 8 * a3 - 8;
      *a4 = *(void *)((char *)&unk_1002DBEA0 + v5);
      return *(void *)((char *)&unk_1002DBF10 + v5);
    }
    else
    {
      int64_t result = 0;
      *a4 = 0;
    }
  }
  else
  {
    *a4 = 0;
    return qword_1002DBE98;
  }
  return result;
}

- (void)didMoveToState:(unint64_t)a3
{
  self->_currentState = a3;
  if (a3)
  {
    if (!_CPLSilentLogging)
    {
      unint64_t v5 = sub_100185F08();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = +[CPLEngineSyncManager shortDescriptionForState:a3];
        v7 = (void *)v6;
        if (self->_foreground) {
          int v8 = " (foreground)";
        }
        else {
          int v8 = "";
        }
        *(_DWORD *)dispatch_block_t v10 = 138412546;
        *(void *)&v10[4] = v6;
        __int16 v11 = 2080;
        id v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Sync session moved to %@%s", v10, 0x16u);
      }
    }
    if (self->_progress)
    {
      *(void *)dispatch_block_t v10 = 0;
      int64_t v9 = [(CPLBaseSyncManager *)self _baseProgressForState:self->_currentState totalUnits:v10];
      if (a3 <= 0xB && ((0x631u >> (a3 - 1)) & 1) != 0) {
        [(_CPLProgress *)self->_progress setUserInfoObject:off_10027F078[a3 - 1] forKey:CPLSyncProgressStateKey];
      }
      [(_CPLProgress *)self->_progress setCompletedUnitCount:v9];
    }
  }
  [(CPLBaseSyncManager *)self _updateOverridingForeground];
}

- (void)didProgress:(float)a3 userInfo:(id)a4 forState:(unint64_t)a5
{
  id v8 = a4;
  self->_unint64_t currentState = a5;
  unint64_t currentState = a5;
  if (!_CPLSilentLogging)
  {
    dispatch_block_t v10 = sub_100185F08();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      __int16 v11 = +[CPLEngineSyncManager shortDescriptionForState:a5];
      BOOL foreground = self->_foreground;
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v11;
      if (foreground) {
        SEL v13 = " (foreground)";
      }
      else {
        SEL v13 = "";
      }
      __int16 v21 = 2048;
      unint64_t v22 = (unint64_t)(float)(a3 * 100.0);
      __int16 v23 = 2080;
      v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Sync session progress: %@/%lu%%%s", buf, 0x20u);
    }
    unint64_t currentState = self->_currentState;
  }
  *(void *)buf = 0;
  int64_t v14 = [(CPLBaseSyncManager *)self _baseProgressForState:currentState totalUnits:buf];
  uint64_t v15 = 0;
  if (a5 - 3 <= 0xA) {
    uint64_t v15 = qword_100251700[a5 - 3];
  }
  int64_t v16 = v14 + (uint64_t)(float)((float)*(uint64_t *)buf * a3);
  progress = self->_progress;
  __int16 v18 = +[NSNumber numberWithUnsignedInteger:v15];
  [(_CPLProgress *)progress setUserInfoObject:v18 forKey:CPLSyncProgressStateKey];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100186828;
  v19[3] = &unk_10027EFF8;
  v19[4] = self;
  [v8 enumerateKeysAndObjectsUsingBlock:v19];
  [(_CPLProgress *)self->_progress setCompletedUnitCount:v16];
}

- (void)prepareForClose
{
  self->_closed = 1;
  progress = self->_progress;
  if (progress)
  {
    [(_CPLProgress *)progress unpublish];
    id v4 = self->_progress;
    self->_progress = 0;
  }
  [(CPLBaseSyncManager *)self _updateOverridingForeground];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_indicatorQueue, 0);
  objc_storeStrong((id *)&self->_activities, 0);
}

@end