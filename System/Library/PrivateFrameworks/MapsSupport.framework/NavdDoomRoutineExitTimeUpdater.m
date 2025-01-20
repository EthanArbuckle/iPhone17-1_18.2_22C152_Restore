@interface NavdDoomRoutineExitTimeUpdater
- (BOOL)updateExitTimeForLocation:(id)a3 time:(id)a4 completionHandler:(id)a5;
- (NSString)uniqueName;
- (NavdDoomRoutineExitTimeUpdater)initWithRoutine:(id)a3;
@end

@implementation NavdDoomRoutineExitTimeUpdater

- (NavdDoomRoutineExitTimeUpdater)initWithRoutine:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)NavdDoomRoutineExitTimeUpdater;
    v6 = [(NavdDoomRoutineExitTimeUpdater *)&v13 init];
    if (v6)
    {
      v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v8 = dispatch_queue_create("NavdDoomQueue", v7);
      queue = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v8;

      objc_storeStrong((id *)&v6->_routine, a3);
    }
    self = v6;
    v10 = self;
  }
  else
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomRoutineExitTimeUpdater.m";
      __int16 v16 = 1024;
      int v17 = 33;
      __int16 v18 = 2082;
      v19 = "-[NavdDoomRoutineExitTimeUpdater initWithRoutine:]";
      __int16 v20 = 2082;
      v21 = "nil == (routine)";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a reference to \"One Routine\"", buf, 0x26u);
    }

    v10 = 0;
  }

  return v10;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (BOOL)updateExitTimeForLocation:(id)a3 time:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v9)
  {
    v24 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v36 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomRoutineExitTimeUpdater.m";
      __int16 v37 = 1024;
      *(_DWORD *)v38 = 52;
      *(_WORD *)&v38[4] = 2082;
      *(void *)&v38[6] = "-[NavdDoomRoutineExitTimeUpdater updateExitTimeForLocation:time:completionHandler:]";
      __int16 v39 = 2082;
      v40 = "nil == (time)";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time", buf, 0x26u);
    }

    goto LABEL_15;
  }
  BOOL v12 = v10 == 0;
  objc_super v13 = GEOFindOrCreateLog();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v36 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomRoutineExitTimeUpdater.m";
      __int16 v37 = 1024;
      *(_DWORD *)v38 = 53;
      *(_WORD *)&v38[4] = 2082;
      *(void *)&v38[6] = "-[NavdDoomRoutineExitTimeUpdater updateExitTimeForLocation:time:completionHandler:]";
      __int16 v39 = 2082;
      v40 = "NULL == completionHandler";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

LABEL_15:
    BOOL v25 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = [(NavdDoomRoutineExitTimeUpdater *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v36 = v15;
    __int16 v37 = 2080;
    *(void *)v38 = "updateExitTimeForLocation";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  __int16 v16 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateExitTimeForLocation", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  int v17 = GEOConfigGetString();
  queue = self->_queue;
  if (v17)
  {
    v19 = (id *)v31;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10000F83C;
    v31[3] = &unk_100089378;
    __int16 v20 = &v34;
    objc_copyWeak(&v34, (id *)buf);
    v31[4] = v8;
    v21 = &v33;
    id v33 = v11;
    v22 = (id *)&v32;
    v23 = v17;
  }
  else
  {
    v19 = (id *)v27;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000FC78;
    v27[3] = &unk_100089378;
    __int16 v20 = &v30;
    objc_copyWeak(&v30, (id *)buf);
    v27[4] = v8;
    v21 = &v28;
    id v28 = v9;
    v22 = (id *)&v29;
    v23 = v11;
  }
  id *v22 = v23;
  dispatch_async(queue, v19);

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)buf);
  BOOL v25 = 1;
LABEL_18:

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routine, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end