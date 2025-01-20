@interface HUDContextUpdater
+ (id)sharedInstance;
- (BOOL)cleanUpExpiredHUDContents;
- (BOOL)isNoTaskPending;
- (HUDContextUpdater)init;
- (NSMutableDictionary)clearHUDRequestDictionary;
- (NSMutableDictionary)hudContentDictionary;
- (NSTimer)updateTimer;
- (id)hudUpdateHandler;
- (void)HandleUpdateAndClear;
- (void)addHUDContents:(id)a3;
- (void)kickOffUpdater;
- (void)saveClearHUDRequest;
- (void)setHudUpdateHandler:(id)a3;
- (void)setUpdateTimer:(id)a3;
- (void)stopUpdater;
@end

@implementation HUDContextUpdater

- (HUDContextUpdater)init
{
  v11.receiver = self;
  v11.super_class = (Class)HUDContextUpdater;
  v2 = [(HUDContextUpdater *)&v11 init];
  v3 = v2;
  if (v2)
  {
    id hudUpdateHandler = v2->_hudUpdateHandler;
    v2->_id hudUpdateHandler = 0;

    *(void *)&v3->_hudContenDictLock._os_unfair_lock_opaque = 0;
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    hudContentDictionary = v3->_hudContentDictionary;
    v3->_hudContentDictionary = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clearHUDRequestDictionary = v3->_clearHUDRequestDictionary;
    v3->_clearHUDRequestDictionary = v7;

    updateTimer = v3->_updateTimer;
    v3->_updateTimer = 0;
  }
  return v3;
}

- (void)addHUDContents:(id)a3
{
  p_hudContenDictLock = &self->_hudContenDictLock;
  id v5 = a3;
  os_unfair_lock_lock(p_hudContenDictLock);
  [(NSMutableDictionary *)self->_hudContentDictionary addEntriesFromDictionary:v5];

  os_unfair_lock_unlock(p_hudContenDictLock);
  id v6 = +[HUDRenderServer sharedInstance];
  [v6 prepareHUDContextIfNeeded];
}

- (void)saveClearHUDRequest
{
  v3 = [HTHangHUDInfo alloc];
  LOBYTE(v7) = 1;
  v4 = [(HTHangHUDInfo *)v3 initWithHangStartTime:0 hangEndTime:0 receivedTimestamp:0 hangDurationMS:off_10003E638 hudString:off_10003E638 shortenedBundle:off_10003E638 bundleId:0.0 timedOut:v7];
  os_unfair_lock_lock(&self->_clearHUDRequestDictLock);
  [(NSMutableDictionary *)self->_clearHUDRequestDictionary setObject:v4 forKey:off_10003E638];
  os_unfair_lock_unlock(&self->_clearHUDRequestDictLock);
  id v5 = sub_10000E760();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    clearHUDRequestDictionary = self->_clearHUDRequestDictionary;
    *(_DWORD *)buf = 138412290;
    v9 = clearHUDRequestDictionary;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, " - clear HUD dict: %@", buf, 0xCu);
  }
}

- (BOOL)cleanUpExpiredHUDContents
{
  os_unfair_lock_t lock = &self->_hudContenDictLock;
  os_unfair_lock_lock(&self->_hudContenDictLock);
  [(NSMutableDictionary *)self->_hudContentDictionary allKeys];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v3 = long long v32 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v4)
  {
    id v5 = v4;
    char v28 = 0;
    uint64_t v6 = *(void *)v30;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v9 = [(NSMutableDictionary *)self->_hudContentDictionary objectForKeyedSubscript:v8];
        uint64_t v10 = mach_absolute_time();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_22;
          }
          id v18 = v9;
          v13 = +[HUDContext displayNameForHangInfo:v18];
          double v19 = sub_10001B3C0(v10 - (void)[v18 receivedTimestamp]);
          if (v19 <= 5000.0)
          {
            v14 = sub_10000E760();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              double v24 = sub_10001B3C0(v10);
              double v25 = sub_10001B3C0((unint64_t)[v18 receivedTimestamp]);
              *(_DWORD *)buf = 138413314;
              v34 = v13;
              __int16 v35 = 2048;
              double v36 = v19;
              __int16 v37 = 1024;
              *(_DWORD *)v38 = 5000;
              *(_WORD *)&v38[4] = 2048;
              *(double *)&v38[6] = v24;
              __int16 v39 = 2048;
              double v40 = v25;
              _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "  ==> keeping hangInfo item %@ since durationToKeepRendering: %f ms < threshold: %i ms where current_time: %fms, receivedTimestamp: %f", buf, 0x30u);
            }
          }
          else
          {
            [(NSMutableDictionary *)self->_hudContentDictionary removeObjectForKey:v8];
            v14 = sub_10000E760();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = [v18 hangStartTime];
              *(_DWORD *)buf = 138413058;
              v34 = v13;
              __int16 v35 = 2048;
              double v36 = *(double *)&v20;
              __int16 v37 = 2048;
              *(double *)v38 = v19;
              *(_WORD *)&v38[8] = 1024;
              *(_DWORD *)&v38[10] = 5000;
              v16 = v14;
              v17 = "  ==> removing hangInfo with process name %@ and hangStartTime: %llu since durationToKeepRendering: "
                    "%f ms > threshold: %i ms";
LABEL_14:
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0x26u);
            }
          }

          goto LABEL_21;
        }
        id v11 = v9;
        double v12 = sub_10001B3C0(v10 - (void)[v11 requestedToRenderTimestamp]);
        if (v12 <= 5000.0)
        {
          v13 = sub_10000E760();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v21 = [v11 processName];
            double v22 = sub_10001B3C0(v10);
            double v23 = sub_10001B3C0((unint64_t)[v11 exitTimestamp]);
            *(_DWORD *)buf = 138413314;
            v34 = v21;
            __int16 v35 = 2048;
            double v36 = v12;
            __int16 v37 = 1024;
            *(_DWORD *)v38 = 5000;
            *(_WORD *)&v38[4] = 2048;
            *(double *)&v38[6] = v22;
            __int16 v39 = 2048;
            double v40 = v23;
            _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "  ==> keeping ProcExit item %@ since durationToKeepRendering: %f ms < threshold: %i where current_time: %f ms, exitTimestamp: %f", buf, 0x30u);
          }
          char v28 = 1;
          goto LABEL_21;
        }
        [(NSMutableDictionary *)self->_hudContentDictionary removeObjectForKey:v8];
        v13 = sub_10000E760();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = [v11 processName];
          id v15 = [v11 exitTimestamp];
          *(_DWORD *)buf = 138413058;
          v34 = v14;
          __int16 v35 = 2048;
          double v36 = *(double *)&v15;
          __int16 v37 = 2048;
          *(double *)v38 = v12;
          *(_WORD *)&v38[8] = 1024;
          *(_DWORD *)&v38[10] = 5000;
          v16 = v13;
          v17 = "  ==> removing ProcExit item %@ and exit timestamp %llu since durationToKeepRendering: %f ms > theshold: %i ms";
          goto LABEL_14;
        }
LABEL_21:

LABEL_22:
      }
      id v5 = [v3 countByEnumeratingWithState:&v29 objects:v41 count:16];
      if (!v5) {
        goto LABEL_26;
      }
    }
  }
  char v28 = 0;
LABEL_26:
  os_unfair_lock_unlock(lock);

  return v28 & 1;
}

+ (id)sharedInstance
{
  if (qword_10003E970 != -1) {
    dispatch_once(&qword_10003E970, &stru_100030A00);
  }
  v2 = (void *)qword_10003E968;

  return v2;
}

- (void)kickOffUpdater
{
  if (!self->_updateTimer)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100009CAC;
    v6[3] = &unk_100030A28;
    v6[4] = self;
    v3 = +[NSTimer timerWithTimeInterval:1 repeats:v6 block:0.05];
    updateTimer = self->_updateTimer;
    self->_updateTimer = v3;

    id v5 = +[NSRunLoop mainRunLoop];
    [v5 addTimer:self->_updateTimer forMode:NSDefaultRunLoopMode];

    [(NSTimer *)self->_updateTimer fire];
  }
}

- (void)stopUpdater
{
  [(NSTimer *)self->_updateTimer invalidate];
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;
}

- (BOOL)isNoTaskPending
{
  return ![(NSMutableDictionary *)self->_hudContentDictionary count]
      && [(NSMutableDictionary *)self->_clearHUDRequestDictionary count] == 0;
}

- (void)HandleUpdateAndClear
{
  id hudUpdateHandler = (void (**)(id, NSMutableDictionary *))self->_hudUpdateHandler;
  if (hudUpdateHandler)
  {
    hudUpdateHandler[2](hudUpdateHandler, self->_hudContentDictionary);
    unsigned __int8 v4 = [(HUDContextUpdater *)self cleanUpExpiredHUDContents];
    if ([(NSMutableDictionary *)self->_clearHUDRequestDictionary count] && (v4 & 1) == 0)
    {
      (*((void (**)(void))self->_hudUpdateHandler + 2))();
      os_unfair_lock_lock(&self->_clearHUDRequestDictLock);
      [(NSMutableDictionary *)self->_clearHUDRequestDictionary removeAllObjects];
      os_unfair_lock_unlock(&self->_clearHUDRequestDictLock);
    }
    if (![(NSMutableDictionary *)self->_hudContentDictionary count] && (byte_10003E978 & 1) == 0)
    {
      id v5 = sub_10000E760();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_10001C4E4(v5, v6, v7, v8, v9, v10, v11, v12);
      }

      v13 = +[HUDContextUpdater sharedInstance];
      [v13 saveClearHUDRequest];

      byte_10003E978 = 1;
    }
    if ([(NSMutableDictionary *)self->_hudContentDictionary count]) {
      byte_10003E978 = 0;
    }
  }
}

- (id)hudUpdateHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setHudUpdateHandler:(id)a3
{
}

- (NSMutableDictionary)hudContentDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)clearHUDRequestDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSTimer)updateTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUpdateTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_clearHUDRequestDictionary, 0);
  objc_storeStrong((id *)&self->_hudContentDictionary, 0);

  objc_storeStrong(&self->_hudUpdateHandler, 0);
}

@end