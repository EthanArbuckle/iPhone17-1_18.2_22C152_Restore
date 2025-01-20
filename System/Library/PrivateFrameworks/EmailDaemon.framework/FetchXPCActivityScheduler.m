@interface FetchXPCActivityScheduler
+ (const)_xpcActivityIdentifierForType:(int)a3;
+ (void)unregisterXPCActivityForType:(int)a3;
- (BOOL)isAutomatic;
- (FetchXPCActivityScheduler)initWithType:(int)a3 interval:(double)a4 delegate:(id)a5;
- (FetchXPCActivitySchedulerDelegate)delegate;
- (const)_xpcActivityIdentifier;
- (double)interval;
- (id)criteriaBuilder;
- (int)schedulerType;
- (int64_t)initialXPCActivityInterval;
- (int64_t)xpcActivityInterval;
- (void)_markFetchXPCActivityAsRunning:(id)a3;
- (void)_markXPCActivitiesAsDone;
- (void)_runForTimer;
- (void)_runXPCActivity:(id)a3;
- (void)_updateIntervalIfNeededForXPCActivity:(id)a3;
- (void)markAsDone;
- (void)schedule;
- (void)tearDown;
- (void)unregisterAndTearDown;
@end

@implementation FetchXPCActivityScheduler

+ (void)unregisterXPCActivityForType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = +[DaemonFetchController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unregistering XPC activity for type %d.", (uint8_t *)v6, 8u);
  }

  xpc_activity_unregister((const char *)[a1 _xpcActivityIdentifierForType:v3]);
}

- (FetchXPCActivityScheduler)initWithType:(int)a3 interval:(double)a4 delegate:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)FetchXPCActivityScheduler;
  v9 = [(FetchXPCActivityScheduler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_schedulerType = a3;
    v9->_interval = a4;
    objc_storeWeak((id *)&v9->_delegate, v8);
  }

  return v10;
}

- (void)schedule
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = !self->_didSchedule;
  self->_didSchedule = 1;
  os_unfair_lock_unlock(p_lock);
  v5 = +[DaemonFetchController log];
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [(FetchXPCActivityScheduler *)self schedulerType];
      [(FetchXPCActivityScheduler *)self interval];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v7;
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Scheduling fetch for type %d with interval %g seconds.", buf, 0x12u);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    [(FetchXPCActivityScheduler *)self _xpcActivityIdentifier];
    v9 = [(FetchXPCActivityScheduler *)self criteriaBuilder];
    objc_copyWeak(&v10, (id *)buf);
    ef_xpc_activity_register();

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000C0934(buf, [(FetchXPCActivityScheduler *)self schedulerType], v6);
    }
  }
}

- (void)unregisterAndTearDown
{
  uint64_t v3 = +[DaemonFetchController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = [(FetchXPCActivityScheduler *)self schedulerType];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unregistering XPC activity for type %d (and tearing down).", (uint8_t *)v4, 8u);
  }

  xpc_activity_unregister([(FetchXPCActivityScheduler *)self _xpcActivityIdentifier]);
  [(FetchXPCActivityScheduler *)self tearDown];
}

- (void)tearDown
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL tornDown = self->_tornDown;
  self->_BOOL tornDown = 1;
  objc_storeWeak((id *)&self->_delegate, 0);
  os_unfair_lock_unlock(p_lock);
  if (!tornDown)
  {
    v5 = +[DaemonFetchController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = [(FetchXPCActivityScheduler *)self schedulerType];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Tearing down fetch scheduler for type %d.", (uint8_t *)v6, 8u);
    }

    [(FetchXPCActivityScheduler *)self _markXPCActivitiesAsDone];
  }
}

- (void)_runXPCActivity:(id)a3
{
  id v4 = a3;
  v5 = +[DaemonFetchController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(FetchXPCActivityScheduler *)self schedulerType];
    [(FetchXPCActivityScheduler *)self interval];
    v25[0] = 67109376;
    v25[1] = v6;
    __int16 v26 = 2048;
    uint64_t v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "XPC activity triggered for fetch scheduler (type %d, interval %g seconds).", (uint8_t *)v25, 0x12u);
  }

  os_unfair_lock_lock(&self->_lock);
  BOOL tornDown = self->_tornDown;
  os_unfair_lock_unlock(&self->_lock);
  if (tornDown)
  {
    v9 = +[DaemonFetchController log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000C09B4(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    [(FetchXPCActivityScheduler *)self _updateIntervalIfNeededForXPCActivity:v4];
    v9 = [(FetchXPCActivityScheduler *)self delegate];
    if (v9)
    {
      [(FetchXPCActivityScheduler *)self _markFetchXPCActivityAsRunning:v4];
      [v9 fetchSchedulerDidTrigger:self];
    }
    else
    {
      v17 = +[DaemonFetchController log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000C097C(v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
  }
}

- (void)_runForTimer
{
  uint64_t v3 = +[DaemonFetchController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [(FetchXPCActivityScheduler *)self schedulerType];
    [(FetchXPCActivityScheduler *)self interval];
    v16[0] = 67109376;
    v16[1] = v4;
    __int16 v17 = 2048;
    uint64_t v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dispatch timer triggered for fetch scheduler (type %d, interval %g seconds).", (uint8_t *)v16, 0x12u);
  }

  unsigned int v6 = [(FetchXPCActivityScheduler *)self delegate];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 fetchSchedulerDidTrigger:self];
  }
  else
  {
    uint64_t v8 = +[DaemonFetchController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000C097C(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)markAsDone
{
  uint64_t v3 = +[DaemonFetchController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = [(FetchXPCActivityScheduler *)self schedulerType];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Marking fetch scheduler as done (type %d).", (uint8_t *)v4, 8u);
  }

  [(FetchXPCActivityScheduler *)self _markXPCActivitiesAsDone];
}

- (void)_markFetchXPCActivityAsRunning:(id)a3
{
  unsigned int v4 = (_xpc_activity_s *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if (xpc_activity_set_state(v4, 4))
    {
      unsigned int v6 = +[DaemonFetchController log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v12 = 134217984;
        uint64_t v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Marked XPC activity %p as continuing (async).", (uint8_t *)&v12, 0xCu);
      }

      os_unfair_lock_lock(&self->_lock);
      xpcActivities = self->_xpcActivities;
      if (xpcActivities)
      {
        [(NSMutableArray *)xpcActivities addObject:v5];
      }
      else
      {
        uint64_t v9 = +[NSMutableArray arrayWithObject:v5];
        uint64_t v10 = self->_xpcActivities;
        self->_xpcActivities = v9;
      }
      int v11 = [(NSMutableArray *)self->_xpcActivities count];
      os_unfair_lock_unlock(&self->_lock);
      uint64_t v8 = +[DaemonFetchController log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_1000C09EC(v11, v8);
      }
    }
    else
    {
      uint64_t v8 = +[DaemonFetchController log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000C0A64((uint64_t)v5, v8);
      }
    }
  }
}

- (void)_markXPCActivitiesAsDone
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v12 = self->_xpcActivities;
  xpcActivities = self->_xpcActivities;
  self->_xpcActivities = 0;

  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = +[DaemonFetchController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000C0ADC((int)[(NSMutableArray *)v12 count], v20, v5);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v6 = v12;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(_xpc_activity_s **)(*((void *)&v13 + 1) + 8 * i);
        if (xpc_activity_set_state(v10, 5))
        {
          int v11 = +[DaemonFetchController log];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v18 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Marked XPC activity %p as done.", buf, 0xCu);
          }
        }
        else
        {
          int v11 = +[DaemonFetchController log];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v18 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to mark XPC activity %p as done.", buf, 0xCu);
          }
        }
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)_updateIntervalIfNeededForXPCActivity:(id)a3
{
  activity = (_xpc_activity_s *)a3;
  int64_t v4 = [(FetchXPCActivityScheduler *)self xpcActivityInterval];
  xpc_object_t v5 = xpc_activity_copy_criteria(activity);
  if (xpc_dictionary_get_int64(v5, XPC_ACTIVITY_INTERVAL) != v4)
  {
    xpc_dictionary_set_int64(v5, XPC_ACTIVITY_INTERVAL, v4);
    xpc_activity_set_criteria(activity, v5);
  }
}

- (const)_xpcActivityIdentifier
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(FetchXPCActivityScheduler *)self schedulerType];

  return (const char *)[v3 _xpcActivityIdentifierForType:v4];
}

+ (const)_xpcActivityIdentifierForType:(int)a3
{
  if ((a3 - 1) >= 3) {
    sub_1000C0B24();
  }
  return (&off_10013AAB8)[a3 - 1];
}

- (id)criteriaBuilder
{
  int64_t v3 = [(FetchXPCActivityScheduler *)self initialXPCActivityInterval];
  unsigned int v4 = [(FetchXPCActivityScheduler *)self schedulerType];
  switch(v4)
  {
    case 1u:
      unsigned __int8 v6 = [(FetchXPCActivityScheduler *)self isAutomatic];
      xpc_object_t v5 = v10;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000299AC;
      v10[3] = &unk_10013AA58;
      v10[4] = v3;
      unsigned __int8 v11 = v6;
      break;
    case 3u:
      xpc_object_t v5 = v9;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100029AAC;
      v9[3] = &unk_10013AA78;
      v9[4] = v3;
      v9[5] = v3;
      break;
    case 2u:
      xpc_object_t v5 = v12;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100029910;
      v12[3] = &unk_10013AA38;
      v12[4] = v3;
      break;
    default:
      sub_1000C0B50();
  }
  id v7 = objc_retainBlock(v5);

  return v7;
}

- (int64_t)initialXPCActivityInterval
{
  unsigned int v3 = [(FetchXPCActivityScheduler *)self schedulerType];
  if (v3 != 1)
  {
    if (v3 == 2) {
      return 300;
    }
    if (v3 != 3) {
      sub_1000C0B7C();
    }
  }

  return [(FetchXPCActivityScheduler *)self xpcActivityInterval];
}

- (int64_t)xpcActivityInterval
{
  [(FetchXPCActivityScheduler *)self interval];
  if ((uint64_t)v2 >= 1) {
    return (uint64_t)v2;
  }
  else {
    return XPC_ACTIVITY_INTERVAL_1_HOUR;
  }
}

- (BOOL)isAutomatic
{
  [(FetchXPCActivityScheduler *)self interval];
  return v2 < 1.0;
}

- (int)schedulerType
{
  return self->_schedulerType;
}

- (double)interval
{
  return self->_interval;
}

- (FetchXPCActivitySchedulerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FetchXPCActivitySchedulerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_xpcActivities, 0);
}

@end