@interface IDSDuetInterface
+ (id)sharedInstance;
- (BOOL)initialSyncInProgress;
- (BOOL)reunionSyncInProgress;
- (IDSDuetInterface)init;
- (IDSDuetInterfaceDelegate)delegate;
- (NSMutableDictionary)allowedBundleIDs;
- (NSMutableSet)initialSyncClientIDs;
- (NSMutableSet)reunionSyncClientIDs;
- (_DASPairedSystemContext)pairedSystemContext;
- (_opaque_pthread_mutex_t)allowedBundleIDsLock;
- (_opaque_pthread_mutex_t)initialSyncInProgressLock;
- (_opaque_pthread_mutex_t)reunionSyncInProgressLock;
- (id)_newKeyForValues:(id)a3 priority:(int64_t)a4;
- (void)_checkAvailabilityForValues:(id)a3 priority:(int64_t)a4 logString:(id)a5 fromQueue:(id)a6 withCompletionBlock:(id)a7;
- (void)_resourceAvailabilityChangedForIdentifiers:(id)a3;
- (void)_setupPairedSystemContext;
- (void)checkAvailabilityForValues:(id)a3 priority:(int64_t)a4 logString:(id)a5 fromQueue:(id)a6 withCompletionBlock:(id)a7;
- (void)clearAdmissionCheckCache;
- (void)dealloc;
- (void)forceCheckAvailabilityForValues:(id)a3 priority:(int64_t)a4 logString:(id)a5 fromQueue:(id)a6 withCompletionBlock:(id)a7;
- (void)setAllowedBundleIDs:(id)a3;
- (void)setAllowedBundleIDsLock:(_opaque_pthread_mutex_t *)a3;
- (void)setDelegate:(id)a3;
- (void)setInitialSyncClientIDs:(id)a3;
- (void)setInitialSyncInProgress:(BOOL)a3 forClientID:(id)a4;
- (void)setInitialSyncInProgressLock:(_opaque_pthread_mutex_t *)a3;
- (void)setPairedSystemContext:(id)a3;
- (void)setReunionSyncClientIDs:(id)a3;
- (void)setReunionSyncInProgress:(BOOL)a3 forClientID:(id)a4;
- (void)setReunionSyncInProgressLock:(_opaque_pthread_mutex_t *)a3;
@end

@implementation IDSDuetInterface

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C2B8;
  block[3] = &unk_10097EA18;
  block[4] = a1;
  if (qword_100A4A258 != -1) {
    dispatch_once(&qword_100A4A258, block);
  }
  v2 = (void *)qword_100A4A250;

  return v2;
}

- (void)_setupPairedSystemContext
{
  if (!self->_pairedSystemContext)
  {
    v3 = (void *)IMWeakLinkClass();
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v4 = im_primary_queue();
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002C484;
    v9[3] = &unk_10097EA40;
    objc_copyWeak(&v10, &location);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002C630;
    v7[3] = &unk_10097EA68;
    objc_copyWeak(&v8, &location);
    v5 = [v3 contextWithClientIdentifier:@"com.apple.ids.trafficAdmissionCheck" callbackQueue:v4 systemConditionChangeCallback:v9 trafficCancelationHandler:v7];
    pairedSystemContext = self->_pairedSystemContext;
    self->_pairedSystemContext = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (IDSDuetInterface)init
{
  v11.receiver = self;
  v11.super_class = (Class)IDSDuetInterface;
  v2 = [(IDSDuetInterface *)&v11 init];
  if (v2)
  {
    v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v13 = v2;
      __int16 v14 = 2080;
      v15 = "-[IDSDuetInterface init]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%p %s", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v9 = v2;
      id v10 = "-[IDSDuetInterface init]";
      _IDSLogV();
    }
    pthread_mutex_init(&v2->_allowedBundleIDsLock, 0);
    pthread_mutex_init(&v2->_initialSyncInProgressLock, 0);
    pthread_mutex_init(&v2->_reunionSyncInProgressLock, 0);
    if (!v2->_initialSyncClientIDs)
    {
      v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      initialSyncClientIDs = v2->_initialSyncClientIDs;
      v2->_initialSyncClientIDs = v4;
    }
    if (!v2->_reunionSyncClientIDs)
    {
      v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      reunionSyncClientIDs = v2->_reunionSyncClientIDs;
      v2->_reunionSyncClientIDs = v6;
    }
    [(IDSDuetInterface *)v2 _setupPairedSystemContext];
  }
  return v2;
}

- (void)dealloc
{
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v6 = self;
    __int16 v7 = 2080;
    id v8 = "-[IDSDuetInterface dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%p %s", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  pthread_mutex_destroy(&self->_allowedBundleIDsLock);
  pthread_mutex_destroy(&self->_initialSyncInProgressLock);
  pthread_mutex_destroy(&self->_reunionSyncInProgressLock);
  v4.receiver = self;
  v4.super_class = (Class)IDSDuetInterface;
  [(IDSDuetInterface *)&v4 dealloc];
}

- (void)_resourceAvailabilityChangedForIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = +[IDSQuickSwitchHelper sharedInstance];
  unsigned __int8 v6 = [v5 isQuickSwitchingToAnotherDevice];

  if (v6)
  {
    __int16 v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Ignoring resource changed during QuickSwitch", v9, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained duetInterface:self resourceAvailabilityChangedForIdentifiers:v4];
  }
}

- (void)setInitialSyncInProgress:(BOOL)a3 forClientID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  p_initialSyncInProgressLock = &self->_initialSyncInProgressLock;
  pthread_mutex_lock(&self->_initialSyncInProgressLock);
  unsigned int v8 = [(NSMutableSet *)self->_initialSyncClientIDs containsObject:v6];
  if (v4)
  {
    if ((v8 & 1) == 0)
    {
      [(NSMutableSet *)self->_initialSyncClientIDs addObject:v6];
      v9 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412802;
        CFStringRef v17 = @"YES";
        __int16 v18 = 2112;
        id v19 = v6;
        __int16 v20 = 2112;
        v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting initialSyncInProgress to %@. Callstack %@ clientID %@", buf, 0x20u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          __int16 v14 = +[NSThread callStackSymbols];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            objc_super v11 = +[NSThread callStackSymbols];
            _IDSLogV();
LABEL_16:
          }
        }
      }
    }
  }
  else if (v8)
  {
    [(NSMutableSet *)self->_initialSyncClientIDs removeObject:v6];
    v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412802;
      CFStringRef v17 = @"NO";
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting initialSyncInProgress to %@. Callstack %@ for clientID %@", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v15 = +[NSThread callStackSymbols];
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          objc_super v11 = +[NSThread callStackSymbols];
          _IDSLogV();
          goto LABEL_16;
        }
      }
    }
  }
  pthread_mutex_unlock(p_initialSyncInProgressLock);
}

- (BOOL)initialSyncInProgress
{
  v2 = self;
  p_initialSyncInProgressLock = &self->_initialSyncInProgressLock;
  pthread_mutex_lock(&self->_initialSyncInProgressLock);
  LOBYTE(v2) = [(NSMutableSet *)v2->_initialSyncClientIDs count] != 0;
  pthread_mutex_unlock(p_initialSyncInProgressLock);
  return (char)v2;
}

- (void)setReunionSyncInProgress:(BOOL)a3 forClientID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  p_reunionSyncInProgressLock = &self->_reunionSyncInProgressLock;
  pthread_mutex_lock(&self->_reunionSyncInProgressLock);
  unsigned int v8 = [(NSMutableSet *)self->_reunionSyncClientIDs containsObject:v6];
  if (v4)
  {
    if ((v8 & 1) == 0)
    {
      [(NSMutableSet *)self->_reunionSyncClientIDs addObject:v6];
      v9 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412802;
        CFStringRef v17 = @"YES";
        __int16 v18 = 2112;
        id v19 = v6;
        __int16 v20 = 2112;
        v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting reunionSyncInProgress to %@. Callstack %@ clientID %@", buf, 0x20u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          __int16 v14 = +[NSThread callStackSymbols];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            objc_super v11 = +[NSThread callStackSymbols];
            _IDSLogV();
LABEL_16:
          }
        }
      }
    }
  }
  else if (v8)
  {
    [(NSMutableSet *)self->_reunionSyncClientIDs removeObject:v6];
    v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412802;
      CFStringRef v17 = @"NO";
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting reunionSyncInProgress to %@. Callstack %@ for clientID %@", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v15 = +[NSThread callStackSymbols];
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          objc_super v11 = +[NSThread callStackSymbols];
          _IDSLogV();
          goto LABEL_16;
        }
      }
    }
  }
  pthread_mutex_unlock(p_reunionSyncInProgressLock);
}

- (BOOL)reunionSyncInProgress
{
  v2 = self;
  p_reunionSyncInProgressLock = &self->_reunionSyncInProgressLock;
  pthread_mutex_lock(&self->_reunionSyncInProgressLock);
  LOBYTE(v2) = [(NSMutableSet *)v2->_reunionSyncClientIDs count] != 0;
  pthread_mutex_unlock(p_reunionSyncInProgressLock);
  return (char)v2;
}

- (id)_newKeyForValues:(id)a3 priority:(int64_t)a4
{
  id v5 = a3;
  objc_super v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_10002D3DC;
  __int16 v14 = &unk_10097EA90;
  id v6 = objc_alloc_init((Class)NSMutableString);
  id v15 = v6;
  [v5 enumerateObjectsUsingBlock:&v11];

  id v7 = objc_alloc((Class)NSString);
  id v8 = objc_msgSend(v7, "initWithFormat:", @"%d", a4, v11, v12, v13, v14);
  [v6 appendString:v8];
  id v9 = v6;

  return v9;
}

- (void)_checkAvailabilityForValues:(id)a3 priority:(int64_t)a4 logString:(id)a5 fromQueue:(id)a6 withCompletionBlock:(id)a7
{
  uint64_t v12 = (__CFString *)a3;
  v13 = (__CFString *)a5;
  __int16 v14 = a6;
  id v15 = (void (**)(id, uint64_t))a7;
  dispatch_assert_queue_V2(v14);
  uint64_t v17 = 50;
  if (a4 == 300) {
    uint64_t v17 = 90;
  }
  if (a4 == 100) {
    uint64_t v18 = 10;
  }
  else {
    uint64_t v18 = v17;
  }
  BOOL v19 = [(IDSDuetInterface *)self initialSyncInProgress];
  if (v19)
  {
    __int16 v20 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Tagging admission check with InitialSync", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
  if ([(IDSDuetInterface *)self reunionSyncInProgress])
  {
    v21 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Tagging admission check with ReunionSync", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    BOOL v19 = 1;
  }
  v22 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v44 = v12;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Performing duet check for values %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v39 = v12;
    _IDSLogV();
  }
  double v42 = 900.0;
  unsigned int v23 = -[_DASPairedSystemContext allowsSendingTrafficeForServiceIdentifiers:atPriorityLevel:isReunionOrInitialSync:responseValidityDuration:](self->_pairedSystemContext, "allowsSendingTrafficeForServiceIdentifiers:atPriorityLevel:isReunionOrInitialSync:responseValidityDuration:", v12, v18, v19, &v42, v39);
  v24 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v25 = @"NO";
    if (v23) {
      CFStringRef v25 = @"YES";
    }
    CFStringRef v26 = &stru_10099BE78;
    if (v13) {
      CFStringRef v26 = v13;
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v44 = v25;
    __int16 v45 = 2112;
    CFStringRef v46 = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Received duet response canSend? %@ %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    v27 = v23 ? @"YES" : @"NO";
    v28 = v13 ? v13 : &stru_10099BE78;
    v40 = v27;
    v41 = v28;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      v40 = v27;
      v41 = v28;
      _IDSLogV();
    }
  }
  if (v23)
  {
    id v29 = [(IDSDuetInterface *)self _newKeyForValues:v12 priority:a4];
    id v30 = objc_alloc((Class)NSDate);
    id v31 = [v30 initWithTimeIntervalSinceNow:v42];
    p_allowedBundleIDsLock = &self->_allowedBundleIDsLock;
    pthread_mutex_lock(&self->_allowedBundleIDsLock);
    allowedBundleIDs = self->_allowedBundleIDs;
    if (!allowedBundleIDs)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v36 = self->_allowedBundleIDs;
      p_allowedBundleIDs = &self->_allowedBundleIDs;
      *p_allowedBundleIDs = (NSMutableDictionary *)Mutable;

      allowedBundleIDs = *p_allowedBundleIDs;
    }
    -[NSMutableDictionary setObject:forKey:](allowedBundleIDs, "setObject:forKey:", v31, v29, v40, v41);
    pthread_mutex_unlock(p_allowedBundleIDsLock);

    goto LABEL_51;
  }
  if (a4 == 300)
  {
    v37 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "IDSDuet: Duet refused to send a high priority message, overriding! Please file a bug.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
LABEL_51:
    uint64_t v38 = 1;
    if (!v15) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  uint64_t v38 = 0;
  if (v15) {
LABEL_54:
  }
    v15[2](v15, v38);
LABEL_55:
}

- (void)forceCheckAvailabilityForValues:(id)a3 priority:(int64_t)a4 logString:(id)a5 fromQueue:(id)a6 withCompletionBlock:(id)a7
{
  uint64_t v12 = (_UNKNOWN **)a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (![v12 count])
  {
    v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No duet values specified, using a default value", v17, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }

    uint64_t v12 = &off_1009D2AA0;
  }
  [(IDSDuetInterface *)self _checkAvailabilityForValues:v12 priority:a4 logString:v13 fromQueue:v14 withCompletionBlock:v15];
}

- (void)checkAvailabilityForValues:(id)a3 priority:(int64_t)a4 logString:(id)a5 fromQueue:(id)a6 withCompletionBlock:(id)a7
{
  uint64_t v12 = (IDSDuetInterface *)a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, uint64_t))a7;
  if ([(IDSDuetInterface *)v12 count])
  {
    if ([(IDSDuetInterface *)v12 count] != (id)1)
    {
      char v17 = 0;
      goto LABEL_15;
    }
    v16 = [(IDSDuetInterface *)v12 firstObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(IDSDuetInterface *)v16 hasPrefix:@"com.apple.private.alloy"]
      && ([(IDSDuetInterface *)v16 isEqualToString:@"com.apple.private.alloy.proxiedcrashcopier"] & 1) == 0)
    {
      CFStringRef v26 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v16;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Service has not specified DuetIdentifiers! %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v27 = v16;
        _IDSLogV();
      }
      char v17 = 1;
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    uint64_t v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No duet values specified, using a default value", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    char v17 = 0;
    v16 = v12;
    uint64_t v12 = (IDSDuetInterface *)&off_1009D2AA0;
  }

LABEL_15:
  id v19 = -[IDSDuetInterface _newKeyForValues:priority:](self, "_newKeyForValues:priority:", v12, a4, v27);
  pthread_mutex_lock(&self->_allowedBundleIDsLock);
  __int16 v20 = [(NSMutableDictionary *)self->_allowedBundleIDs objectForKey:v19];
  v21 = v20;
  if ((v17 & 1) != 0 || ([v20 timeIntervalSinceNow], v22 > 0.0))
  {
    unsigned int v23 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v31 = self;
      __int16 v32 = 2080;
      v33 = "-[IDSDuetInterface checkAvailabilityForValues:priority:logString:fromQueue:withCompletionBlock:]";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%p %s Sending IDS message, already allowed by CoreDuet", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    pthread_mutex_unlock(&self->_allowedBundleIDsLock);
    if (v15) {
      v15[2](v15, 1);
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_allowedBundleIDs removeObjectForKey:v19];
    if (![(NSMutableDictionary *)self->_allowedBundleIDs count])
    {
      allowedBundleIDs = self->_allowedBundleIDs;
      self->_allowedBundleIDs = 0;
    }
    pthread_mutex_unlock(&self->_allowedBundleIDsLock);
    CFStringRef v25 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v31 = self;
      __int16 v32 = 2080;
      v33 = "-[IDSDuetInterface checkAvailabilityForValues:priority:logString:fromQueue:withCompletionBlock:]";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%p %s Sending IDS message, asking CoreDuet", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v28 = self;
      id v29 = "-[IDSDuetInterface checkAvailabilityForValues:priority:logString:fromQueue:withCompletionBlock:]";
      _IDSLogV();
    }
    -[IDSDuetInterface _checkAvailabilityForValues:priority:logString:fromQueue:withCompletionBlock:](self, "_checkAvailabilityForValues:priority:logString:fromQueue:withCompletionBlock:", v12, a4, v13, v14, v15, v28, v29);
  }
}

- (void)clearAdmissionCheckCache
{
  _IMLog();
  pthread_mutex_lock(&self->_allowedBundleIDsLock);
  -[NSMutableDictionary removeAllObjects](self->_allowedBundleIDs, "removeAllObjects", "-[IDSDuetInterface clearAdmissionCheckCache]");
  if (![(NSMutableDictionary *)self->_allowedBundleIDs count])
  {
    allowedBundleIDs = self->_allowedBundleIDs;
    self->_allowedBundleIDs = 0;
  }

  pthread_mutex_unlock(&self->_allowedBundleIDsLock);
}

- (IDSDuetInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSDuetInterfaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_DASPairedSystemContext)pairedSystemContext
{
  return self->_pairedSystemContext;
}

- (void)setPairedSystemContext:(id)a3
{
}

- (NSMutableDictionary)allowedBundleIDs
{
  return self->_allowedBundleIDs;
}

- (void)setAllowedBundleIDs:(id)a3
{
}

- (_opaque_pthread_mutex_t)allowedBundleIDsLock
{
  long long v3 = *(_OWORD *)&self[1].__sig;
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[40];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[1].__opaque[24];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[8];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setAllowedBundleIDsLock:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  long long v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_allowedBundleIDsLock.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_allowedBundleIDsLock.__opaque[40] = v5;
  *(_OWORD *)&self->_allowedBundleIDsLock.__sig = v3;
  *(_OWORD *)&self->_allowedBundleIDsLock.__opaque[8] = v4;
}

- (_opaque_pthread_mutex_t)initialSyncInProgressLock
{
  long long v3 = *(_OWORD *)&self[2].__sig;
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[1].__opaque[40];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[2].__opaque[24];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[2].__opaque[8];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setInitialSyncInProgressLock:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  long long v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_initialSyncInProgressLock.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_initialSyncInProgressLock.__opaque[40] = v5;
  *(_OWORD *)&self->_initialSyncInProgressLock.__sig = v3;
  *(_OWORD *)&self->_initialSyncInProgressLock.__opaque[8] = v4;
}

- (_opaque_pthread_mutex_t)reunionSyncInProgressLock
{
  long long v3 = *(_OWORD *)&self[3].__sig;
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[2].__opaque[40];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[3].__opaque[24];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[3].__opaque[8];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setReunionSyncInProgressLock:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  long long v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_reunionSyncInProgressLock.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_reunionSyncInProgressLock.__opaque[40] = v5;
  *(_OWORD *)&self->_reunionSyncInProgressLock.__sig = v3;
  *(_OWORD *)&self->_reunionSyncInProgressLock.__opaque[8] = v4;
}

- (NSMutableSet)initialSyncClientIDs
{
  return self->_initialSyncClientIDs;
}

- (void)setInitialSyncClientIDs:(id)a3
{
}

- (NSMutableSet)reunionSyncClientIDs
{
  return self->_reunionSyncClientIDs;
}

- (void)setReunionSyncClientIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reunionSyncClientIDs, 0);
  objc_storeStrong((id *)&self->_initialSyncClientIDs, 0);
  objc_storeStrong((id *)&self->_allowedBundleIDs, 0);
  objc_storeStrong((id *)&self->_pairedSystemContext, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end