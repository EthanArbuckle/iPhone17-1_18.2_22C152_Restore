@interface IDSOTRController
+ (IDSOTRController)sharedInstance;
- (BOOL)hasMessagableOTRSessionForToken:(id)a3;
- (BOOL)isSessionNegotiating:(id)a3;
- (BOOL)isSessionReady:(id)a3;
- (BOOL)serializeSession:(_SecOTRSession *)a3 token:(id)a4;
- (IDSOTRController)init;
- (_SecMPPublicIdentity)copyPairedDevicePublicIdentityWithDataProtectionClass:(unsigned int)a3;
- (_SecOTRSession)_cachedSessionForToken:(id)a3;
- (_SecOTRSession)copySessionForToken:(id)a3;
- (double)sessionStartTimeWithToken:(id)a3;
- (id)copyOTRTestBlock:(id)a3;
- (id)copySessionObjectForToken:(id)a3;
- (unsigned)sessionNegotiationCount:(id)a3;
- (void)_cacheSession:(_SecOTRSession *)a3 token:(id)a4;
- (void)_kickoffOTRNegotiationWithDevice:(id)a3 token:(id)a4 negotiationData:(id)a5;
- (void)_onQueueStartOTRNegotiationWithDeviceIfNeeded:(id)a3 token:(id)a4 reset:(BOOL)a5 errorHandler:(id)a6;
- (void)_reportOTRTestResult:(id)a3 setupTime:(double)a4 result:(unsigned __int8)a5;
- (void)addOTRSessionBlock:(unsigned __int8)a3 sessionBlock:(id)a4 key:(id)a5;
- (void)performOTRSessionBlock:(unsigned __int8)a3 token:(id)a4;
- (void)processNegotiationData:(id)a3 deviceUniqueID:(id)a4 token:(id)a5 negotiationCount:(unsigned int)a6;
- (void)removeAllCachedSessionsFromMainQueue;
- (void)resetAllSessions;
- (void)resumeSessionNegotiation;
- (void)setOTRTestBlockFromCompletionBlock:(id)a3 token:(id)a4;
- (void)setSessionNegotiationComplete:(id)a3;
- (void)setSessionNegotiationStart:(id)a3;
- (void)setSessionReady:(id)a3;
- (void)setupNewSessionInfoWithToken:(id)a3;
- (void)startOTRNegotiationWithDeviceIfNeeded:(id)a3 token:(id)a4 reset:(BOOL)a5 errorHandler:(id)a6;
- (void)suspendSessionNegotiation:(id)a3 askedByPairedDevice:(BOOL)a4;
@end

@implementation IDSOTRController

+ (IDSOTRController)sharedInstance
{
  if (qword_100A4C490 != -1) {
    dispatch_once(&qword_100A4C490, &stru_1009878E0);
  }
  v2 = (void *)qword_100A4C498;

  return (IDSOTRController *)v2;
}

- (IDSOTRController)init
{
  v7.receiver = self;
  v7.super_class = (Class)IDSOTRController;
  v2 = [(IDSOTRController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_lock, 0);
    v4 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    storageLock = v3->_storageLock;
    v3->_storageLock = v4;
  }
  return v3;
}

- (void)addOTRSessionBlock:(unsigned __int8)a3 sessionBlock:(id)a4 key:(id)a5
{
  int v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8) {
    goto LABEL_37;
  }
  pthread_mutex_lock(&self->_lock);
  if (v6 == 2)
  {
    priorityToTimeoutBlocks = self->_priorityToTimeoutBlocks;
    if (!priorityToTimeoutBlocks)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v18 = self->_priorityToTimeoutBlocks;
      self->_priorityToTimeoutBlocks = Mutable;

      priorityToTimeoutBlocks = self->_priorityToTimeoutBlocks;
    }
    id v19 = [v8 copy];
    [(NSMutableDictionary *)priorityToTimeoutBlocks setObject:v19 forKey:v9];

    v20 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (NSMutableDictionary *)objc_retainBlock(v8);
      *(_DWORD *)buf = 134218242;
      v31 = v21;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "add OTR timeout block %p key %@.", buf, 0x16u);
    }
    if (!os_log_shim_legacy_logging_enabled()) {
      goto LABEL_24;
    }
    if (!_IDSShouldLogTransport()) {
      goto LABEL_24;
    }
    id v29 = objc_retainBlock(v8);
    _IDSLogTransport();

    if (!_IDSShouldLog()) {
      goto LABEL_24;
    }
LABEL_11:
    id v28 = objc_retainBlock(v8);
    _IDSLogV();

    goto LABEL_24;
  }
  if (v6 != 1)
  {
    v22 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v31) = v6;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "addOTRSessionBlock: invalid sessionBlock type %d.", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    goto LABEL_24;
  }
  priorityToCompletionBlocks = self->_priorityToCompletionBlocks;
  if (!priorityToCompletionBlocks)
  {
    v11 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v12 = self->_priorityToCompletionBlocks;
    self->_priorityToCompletionBlocks = v11;

    priorityToCompletionBlocks = self->_priorityToCompletionBlocks;
  }
  id v13 = [v8 copy];
  [(NSMutableDictionary *)priorityToCompletionBlocks setObject:v13 forKey:v9];

  v14 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (NSMutableDictionary *)objc_retainBlock(v8);
    *(_DWORD *)buf = 134218242;
    v31 = v15;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "add OTR completion block %p key %@.", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v27 = objc_retainBlock(v8);
      _IDSLogTransport();

      if (_IDSShouldLog()) {
        goto LABEL_11;
      }
    }
  }
LABEL_24:
  v23 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = self->_priorityToCompletionBlocks;
    *(_DWORD *)buf = 138412290;
    v31 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "_priorityToCompletionBlocks after ADD %@", buf, 0xCu);
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
  v25 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = self->_priorityToTimeoutBlocks;
    *(_DWORD *)buf = 138412290;
    v31 = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "_priorityToTimeoutBlocks after ADD %@", buf, 0xCu);
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
  pthread_mutex_unlock(&self->_lock);
LABEL_37:
}

- (void)performOTRSessionBlock:(unsigned __int8)a3 token:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  uint64_t v7 = sub_10028C4AC(v6);
  id v8 = (NSMutableDictionary *)v6;
  id v9 = [(NSMutableDictionary *)v8 componentsSeparatedByString:@"-"];
  if ((unint64_t)[v9 count] > 3)
  {
    id v12 = objc_alloc((Class)NSString);
    id v13 = [v9 objectAtIndex:3];
    v11 = (__CFString *)[v12 initWithString:v13];

    if ((unint64_t)[v9 count] >= 5)
    {
      unint64_t v14 = 4;
      do
      {
        v15 = [(__CFString *)v11 stringByAppendingString:@"_"];

        v16 = [v9 objectAtIndex:v14];
        v11 = [v15 stringByAppendingString:v16];

        ++v14;
      }
      while ((unint64_t)[v9 count] > v14);
    }
  }
  else
  {
    v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "_connectionIDFromToken: invalid OTR token %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      id v33 = v8;
      _IDSLogTransport();
    }
    v11 = &stru_10099BE78;
  }

  if ([(__CFString *)v11 length])
  {
    v17 = v11;
  }
  else
  {
    v17 = +[NSNumber numberWithInteger:v7];
  }
  v18 = (NSMutableDictionary *)v17;
  id v19 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Key to find blocks %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v33 = v18;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v33 = v18;
        _IDSLogV();
      }
    }
  }
  v20 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    priorityToCompletionBlocks = self->_priorityToCompletionBlocks;
    *(_DWORD *)buf = 138412290;
    v44 = priorityToCompletionBlocks;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "_priorityToCompletionBlocks after PERFORM %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v33 = self->_priorityToCompletionBlocks;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v33 = self->_priorityToCompletionBlocks;
        _IDSLogV();
      }
    }
  }
  v22 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    priorityToTimeoutBlocks = self->_priorityToTimeoutBlocks;
    *(_DWORD *)buf = 138412290;
    v44 = priorityToTimeoutBlocks;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "_priorityToTimeoutBlocks after PERFORM %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v33 = self->_priorityToTimeoutBlocks;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v33 = self->_priorityToTimeoutBlocks;
        _IDSLogV();
      }
    }
  }
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (v4 == 1)
  {
    uint64_t v25 = 96;
  }
  else
  {
    if (v4 != 2) {
      goto LABEL_46;
    }
    uint64_t v25 = 104;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v25), "objectForKey:", v18, v33);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    id v27 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v44 = v8;
      __int16 v45 = 1024;
      int v46 = v4;
      __int16 v47 = 2048;
      uint64_t v48 = v7;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "performOTRSessionBlock for %@ (blockType:%d priority:%ld).", buf, 0x1Cu);
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
    switch(v7)
    {
      case 100:
        v30 = +[IDSDaemonPriorityQueueController sharedInstance];
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_10028DAB4;
        v34[3] = &unk_10097E818;
        id v26 = v26;
        id v36 = v26;
        v35 = v8;
        [v30 performBlockSyncPriority:v34];

        break;
      case 200:
        v31 = +[IDSDaemonPriorityQueueController sharedInstance];
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_10028DAA0;
        v37[3] = &unk_10097E818;
        id v26 = v26;
        id v39 = v26;
        v38 = v8;
        [v31 performBlockDefaultPriority:v37];

        break;
      case 300:
        id v28 = +[IDSDaemonPriorityQueueController sharedInstance];
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_10028DA8C;
        v40[3] = &unk_10097E818;
        id v26 = v26;
        id v42 = v26;
        v41 = v8;
        [v28 performBlockUrgentPriority:v40];

        break;
      default:
        __int16 v32 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v8;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "performOTRSessionBlock found no block for %@ due to invalid priority.", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          _IDSLogTransport();
        }
        break;
    }
    goto LABEL_51;
  }
LABEL_46:
  id v29 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v44 = v8;
    __int16 v45 = 1024;
    int v46 = v4;
    __int16 v47 = 2048;
    uint64_t v48 = v7;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "performOTRSessionBlock found no block for %@ (blockType:%u, Priority:%ld).", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    _IDSWarnV();
    _IDSLogV();
    _IDSLogTransport();
  }
  id v26 = 0;
LABEL_51:
  pthread_mutex_unlock(p_lock);
}

- (void)setupNewSessionInfoWithToken:(id)a3
{
  id v9 = a3;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v6 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }
  uint64_t v7 = [(NSMutableDictionary *)sessionInfoToToken objectForKey:v9];
  if (v7)
  {
    id v8 = v7;
    [(IDSOTRSessionInfo *)v7 setIsNegotiating:0];
    [(IDSOTRSessionInfo *)v8 setIsReady:0];
    [(IDSOTRSessionInfo *)v8 setLastStartTime:0.0];
    [(IDSOTRSessionInfo *)v8 removeNegotiationTimer];
  }
  else
  {
    id v8 = [[IDSOTRSessionInfo alloc] initWithToken:v9];
    [(NSMutableDictionary *)self->_sessionInfoToToken setObject:v8 forKey:v9];
  }
  pthread_mutex_unlock(&self->_lock);
}

- (void)setSessionReady:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }
  id v9 = [(NSMutableDictionary *)sessionInfoToToken objectForKey:v4];
  v10 = v9;
  if (v9)
  {
    if (![(IDSOTRSessionInfo *)v9 isNegotiating] && ![(IDSOTRSessionInfo *)v10 isReady])
    {
      [(IDSOTRSessionInfo *)v10 setIsReady:1];
      v11 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Enable OTR session for %@.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
LABEL_15:
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
    }
  }
  else
  {
    v10 = [[IDSOTRSessionInfo alloc] initWithToken:v4];
    [(IDSOTRSessionInfo *)v10 setIsReady:1];
    [(NSMutableDictionary *)self->_sessionInfoToToken setObject:v10 forKey:v4];
    id v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Enable OTR session for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport()) {
      goto LABEL_15;
    }
  }
  pthread_mutex_unlock(p_lock);
}

- (double)sessionStartTimeWithToken:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }
  id v9 = [(NSMutableDictionary *)sessionInfoToToken objectForKey:v4];
  v10 = v9;
  if (v9)
  {
    [v9 lastStartTime];
    double v12 = v11;
  }
  else
  {
    double v12 = 0.0;
  }
  pthread_mutex_unlock(p_lock);

  return v12;
}

- (void)setSessionNegotiationStart:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }
  id v9 = [(NSMutableDictionary *)sessionInfoToToken objectForKey:v4];
  v10 = v9;
  if (v9)
  {
    if (([v9 isNegotiating] & 1) == 0)
    {
      [v10 lastStartTime];
      if (v11 == 0.0)
      {
        unsigned int v12 = [v10 negotiationCount];
        if (v12 == 0x7FFFFFFF) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = v12 + 1;
        }
        id v14 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v20 = v4;
          __int16 v21 = 1024;
          int v22 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "### OTR session negotiation started for %@, count:%08x.", buf, 0x12u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            id v16 = v4;
            uint64_t v18 = v13;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              id v16 = v4;
              uint64_t v18 = v13;
              _IDSLogV();
            }
          }
        }
        objc_msgSend(v10, "setIsNegotiating:", 1, v16, v18);
        if ([v10 isReady])
        {
          [v10 setIsReady:0];
          v15 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v20 = v4;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Disable OTR session for %@.", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              id v17 = v4;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                id v17 = v4;
                _IDSLogV();
              }
            }
          }
        }
        objc_msgSend(v10, "setIsSuspended:", 0, v17);
        ids_monotonic_time();
        objc_msgSend(v10, "setLastStartTime:");
        [v10 setNegotiationTimer];
        [v10 setNegotiationCount:v13];
      }
    }
  }
  pthread_mutex_unlock(p_lock);
}

- (void)setSessionNegotiationComplete:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v7 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }
  id v8 = [(NSMutableDictionary *)sessionInfoToToken objectForKey:v4];
  id v9 = v8;
  if (!v8)
  {
    unsigned int v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "### Resume OTR session for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v13 = v4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v13 = v4;
          _IDSLogV();
        }
      }
    }
    pthread_mutex_unlock(&self->_lock);
    goto LABEL_19;
  }
  [v8 setIsNegotiating:0];
  unsigned __int8 v10 = [v9 isReady];
  [v9 setIsSuspended:0];
  [v9 setLastStartTime:0.0];
  [v9 removeNegotiationTimer];
  double v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "### OTR session negotiation finished for %@.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v13 = v4;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v13 = v4;
        _IDSLogV();
      }
    }
  }
  pthread_mutex_unlock(&self->_lock);
  if ((v10 & 1) == 0) {
LABEL_19:
  }
    -[IDSOTRController performOTRSessionBlock:token:](self, "performOTRSessionBlock:token:", 1, v4, v13);
}

- (void)suspendSessionNegotiation:(id)a3 askedByPairedDevice:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Suspend OTR session negotiation", buf, 2u);
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
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    unsigned int v12 = self->_sessionInfoToToken;
    p_sessionInfoToToken = &self->_sessionInfoToToken;
    *p_sessionInfoToToken = (NSMutableDictionary *)Mutable;

    sessionInfoToToken = *p_sessionInfoToToken;
  }
  id v13 = [(NSMutableDictionary *)sessionInfoToToken objectForKey:v6];
  id v14 = v13;
  if (v13)
  {
    [v13 setIsNegotiating:0];
    [v14 setIsReady:0];
    [v14 setIsSuspended:1];
    [v14 setLastStartTime:0.0];
    [v14 removeNegotiationTimer];
    id v15 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "### OTR session negotiation suspended for %@.", buf, 0xCu);
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
  pthread_mutex_unlock(p_lock);
  if (!a4)
  {
    id v16 = +[IDSUTunController sharedInstance];
    [v16 sendSuspendOTRNegotiationMessage:v6];
  }
}

- (void)resumeSessionNegotiation
{
  v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resume suspended OTR session negotiation", buf, 2u);
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
  pthread_mutex_lock(&self->_lock);
  id v4 = [(NSMutableDictionary *)self->_sessionInfoToToken allValues];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10028E91C;
  v5[3] = &unk_10097FE80;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
  pthread_mutex_unlock(&self->_lock);
}

- (void)resetAllSessions
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  id v4 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "=== Reset All OTR Sessions === ", v6, 2u);
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
  sessionInfoToToken = self->_sessionInfoToToken;
  self->_sessionInfoToToken = 0;

  pthread_mutex_unlock(p_lock);
}

- (BOOL)isSessionNegotiating:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }
  id v9 = [(NSMutableDictionary *)sessionInfoToToken objectForKey:v4];
  unsigned __int8 v10 = [v9 isNegotiating];
  pthread_mutex_unlock(p_lock);

  return v10;
}

- (BOOL)isSessionReady:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }
  id v9 = [(NSMutableDictionary *)sessionInfoToToken objectForKey:v4];
  unsigned __int8 v10 = [v9 isReady];
  pthread_mutex_unlock(p_lock);

  return v10;
}

- (unsigned)sessionNegotiationCount:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }
  id v9 = [(NSMutableDictionary *)sessionInfoToToken objectForKey:v4];
  unsigned int v10 = [v9 negotiationCount];
  pthread_mutex_unlock(p_lock);

  return v10;
}

- (_SecOTRSession)copySessionForToken:(id)a3
{
  id v4 = (_SecOTRSession *)a3;
  if (v4)
  {
    [(NSRecursiveLock *)self->_storageLock lock];
    v5 = [(IDSOTRController *)self _cachedSessionForToken:v4];
    if (v5)
    {
      id v6 = v5;
      CFRetain(v5);
      [(NSRecursiveLock *)self->_storageLock unlock];
    }
    else
    {
      uint64_t v7 = +[IDSOTRKeyStorage sharedInstance];
      id v8 = [v7 sessionKeyForToken:v4];

      if (v8)
      {
        id v6 = (_SecOTRSession *)SecOTRSessionCreateFromData();
        if (v6)
        {
          id v9 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            id v16 = v6;
            __int16 v17 = 2112;
            id v18 = v4;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Created new session %p using cached key for %@.", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              id v13 = v6;
              id v14 = v4;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                id v13 = v6;
                id v14 = v4;
                _IDSLogV();
              }
            }
          }
          -[IDSOTRController setupNewSessionInfoWithToken:](self, "setupNewSessionInfoWithToken:", v4, v13, v14);
        }
        else
        {
          unsigned int v10 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v16 = v4;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SecOTRSessionCreateFromData failed, remove session key for %@.", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              id v13 = v4;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                id v13 = v4;
                _IDSLogV();
              }
            }
          }
          double v11 = +[IDSOTRKeyStorage sharedInstance];
          [v11 removeSessionKeyForToken:v4];
        }
        [(IDSOTRController *)self _cacheSession:v6 token:v4];
        [(NSRecursiveLock *)self->_storageLock unlock];
      }
      else
      {
        [(NSRecursiveLock *)self->_storageLock unlock];
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (_SecOTRSession)_cachedSessionForToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (_SecOTRSession *)[(NSMutableDictionary *)self->_sessionStorage objectForKey:v4];
    if (v5)
    {
      id v6 = +[IDSFoundationLog OTRController];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v8 = 134218498;
        id v9 = v5;
        __int16 v10 = 2112;
        double v11 = v5;
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Found cached session %p: %@ for %@", (uint8_t *)&v8, 0x20u);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_cacheSession:(_SecOTRSession *)a3 token:(id)a4
{
  id v6 = (_SecOTRSession *)a4;
  if (v6)
  {
    [(NSRecursiveLock *)self->_storageLock lock];
    if (!self->_sessionStorage)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      sessionStorage = self->_sessionStorage;
      self->_sessionStorage = Mutable;
    }
    id v9 = self->_sessionStorage;
    if (a3)
    {
      [(NSMutableDictionary *)v9 setObject:a3 forKey:v6];
      __int16 v10 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        id v16 = a3;
        __int16 v17 = 2112;
        id v18 = a3;
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Storing cached session %p (%@) for %@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        _IDSLogV();
        [(NSRecursiveLock *)self->_storageLock unlock];
        goto LABEL_16;
      }
    }
    else
    {
      [(NSMutableDictionary *)v9 removeObjectForKey:v6];
      double v11 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        id v16 = 0;
        __int16 v17 = 2112;
        id v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing cached session %p for %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v12 = 0;
        id v13 = v6;
        _IDSLogV();
      }
    }
    [(NSRecursiveLock *)self->_storageLock unlock];
  }
LABEL_16:
}

- (BOOL)serializeSession:(_SecOTRSession *)a3 token:(id)a4
{
  id v6 = (_SecOTRSession *)a4;
  if (v6)
  {
    if (a3)
    {
      id v7 = objc_alloc_init((Class)NSMutableData);
      int v8 = SecOTRSAppendSerialization();
      BOOL v9 = v8 == 0;
      if (v8)
      {
        [(IDSOTRController *)self _cacheSession:0 token:v6];
        __int16 v10 = +[IDSOTRKeyStorage sharedInstance];
        [v10 removeSessionKeyForToken:v6];

        double v11 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "serializeSession - failed to serialize data for session", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          _IDSLogTransport();
        }
      }
      else
      {
        id v15 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "serializeSession - updating session key in store", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        [(IDSOTRController *)self _cacheSession:a3 token:v6];
        id v16 = +[IDSOTRKeyStorage sharedInstance];
        [v16 storeSessionKey:v7 token:v6];
      }
    }
    else
    {
      id v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "serializeSession - NULL session for token %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        id v18 = v6;
        _IDSLogTransport();
      }
      -[IDSOTRController _cacheSession:token:](self, "_cacheSession:token:", 0, v6, v18);
      uint64_t v14 = +[IDSOTRKeyStorage sharedInstance];
      [v14 removeSessionKeyForToken:v6];

      BOOL v9 = 1;
    }
  }
  else
  {
    uint64_t v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "serializeSession - token nil for session %p.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (id)copySessionObjectForToken:(id)a3
{
  v3 = [(IDSOTRController *)self copySessionForToken:a3];
  id v4 = [[IDSSecOTRSession alloc] initWithSecOTRSessionRef:v3];
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (void)removeAllCachedSessionsFromMainQueue
{
  [(NSRecursiveLock *)self->_storageLock lock];
  [(NSMutableDictionary *)self->_sessionStorage removeAllObjects];
  storageLock = self->_storageLock;

  [(NSRecursiveLock *)storageLock unlock];
}

- (void)setOTRTestBlockFromCompletionBlock:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[IDSEncryptionController sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10028F9A0;
  v11[3] = &unk_1009800E8;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 performAsyncBlock:v11 priority:sub_10028C4AC(v10)];
}

- (id)copyOTRTestBlock:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_sessionInfoToToken objectForKey:v5];

  id v7 = [v6 otrTestBlock];
  id v8 = [v7 copy];

  pthread_mutex_unlock(p_lock);
  id v9 = objc_retainBlock(v8);

  return v9;
}

- (void)_reportOTRTestResult:(id)a3 setupTime:(double)a4 result:(unsigned __int8)a5
{
  int v5 = a5;
  id v12 = a3;
  -[IDSOTRController copyOTRTestBlock:](self, "copyOTRTestBlock:");
  id v8 = (void (**)(void, void, void, double))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v5 == 3)
    {
      id v9 = +[NSDictionary dictionaryWithObject:@"No public key found for remote device" forKey:NSLocalizedDescriptionKey];
      uint64_t v10 = 1;
    }
    else
    {
      if (v5 != 2)
      {
        double v11 = 0;
        goto LABEL_8;
      }
      id v9 = +[NSDictionary dictionaryWithObject:@"Unable to create session from session data" forKey:NSLocalizedDescriptionKey];
      uint64_t v10 = 0;
    }
    double v11 = +[NSError errorWithDomain:@"IDSOTR" code:v10 userInfo:v9];

LABEL_8:
    ((void (**)(void, id, void *, double))v8)[2](v8, v12, v11, a4);
  }
}

- (void)processNegotiationData:(id)a3 deviceUniqueID:(id)a4 token:(id)a5 negotiationCount:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[IDSEncryptionController sharedInstance];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10028FD7C;
  v17[3] = &unk_100986858;
  v17[4] = self;
  id v18 = v12;
  unsigned int v21 = a6;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  [v13 performAsyncBlock:v17 priority:sub_10028C4AC(v16)];
}

- (BOOL)hasMessagableOTRSessionForToken:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  int v5 = +[IDSEncryptionController sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100291794;
  v8[3] = &unk_100987908;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [v5 performSyncBlock:v8 priority:sub_10028C4AC(v6)];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

- (_SecMPPublicIdentity)copyPairedDevicePublicIdentityWithDataProtectionClass:(unsigned int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v3 = +[IDSPairingManager sharedInstance];
      [v3 pairedDevicePublicClassAKey];
    }
    else
    {
      v3 = +[IDSPairingManager sharedInstance];
      [v3 pairedDevicePublicKey];
    uint64_t v4 = };
  }
  else
  {
    v3 = +[IDSPairingManager sharedInstance];
    uint64_t v4 = [v3 pairedDevicePublicClassCKey];
  }
  int v5 = (void *)v4;

  if (!v5)
  {
    id v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = IDSDataProtectionClassStringFromDataProtectionClass();
      *(_DWORD *)buf = 138412290;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "copyPairedDevicePublicIdentityWithDataProtectionClass failed to get public key for data protection class %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v13 = IDSDataProtectionClassStringFromDataProtectionClass();
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          char v14 = IDSDataProtectionClassStringFromDataProtectionClass();
          _IDSLogV();
        }
      }
    }
    goto LABEL_26;
  }
  CFTypeRef cf = 0;
  if (qword_100A4C4A8 != -1) {
    dispatch_once(&qword_100A4C4A8, &stru_100987928);
  }
  if (!off_100A4C4A0)
  {
LABEL_26:
    id v6 = 0;
    goto LABEL_27;
  }
  id v6 = (_SecMPPublicIdentity *)off_100A4C4A0(0, v5, &cf);
  if (cf)
  {
    id v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFTypeRef v8 = cf;
      id v9 = IDSDataProtectionClassStringFromDataProtectionClass();
      *(_DWORD *)buf = 138412802;
      id v19 = v5;
      __int16 v20 = 2112;
      CFTypeRef v21 = v8;
      __int16 v22 = 2112;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed creating public identity from data: %@  (Error: %@) (DataProtectionClass: %@)", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v15 = IDSDataProtectionClassStringFromDataProtectionClass();
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          id v16 = IDSDataProtectionClassStringFromDataProtectionClass();
          _IDSLogV();
        }
      }
    }
    if (cf) {
      CFRelease(cf);
    }
  }
LABEL_27:

  return v6;
}

- (void)_kickoffOTRNegotiationWithDevice:(id)a3 token:(id)a4 negotiationData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(IDSOTRController *)self setSessionNegotiationStart:v9];
  uint64_t v11 = [(IDSOTRController *)self sessionNegotiationCount:v9] | 0x80000000;
  id v12 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v19 = [v10 length];
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 1024;
    int v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "  => will, send out OTR negotiation data %luB for %@, count:%08x.", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v16 = v9;
      uint64_t v17 = v11;
      id v15 = [v10 length];
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v13 = objc_msgSend(v10, "length", v15, v9, v11);
        id v16 = v9;
        uint64_t v17 = v11;
        id v15 = v13;
        _IDSLogV();
      }
    }
  }
  char v14 = +[IDSUTunController sharedInstance];
  [v14 sendOTRNegotiationMessage:v9 negotiationCount:v11 negotiationData:v10];
}

- (void)startOTRNegotiationWithDeviceIfNeeded:(id)a3 token:(id)a4 reset:(BOOL)a5 errorHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = +[IDSEncryptionController sharedInstance];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100292140;
  v17[3] = &unk_100980C98;
  v17[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [v13 performAsyncBlock:v17 priority:sub_10028C4AC(v15)];
}

- (void)_onQueueStartOTRNegotiationWithDeviceIfNeeded:(id)a3 token:(id)a4 reset:(BOOL)a5 errorHandler:(id)a6
{
  id v10 = (_SecOTRSession *)a3;
  id v11 = (_SecOTRSession *)a4;
  v65 = (void (**)(id, uint64_t))a6;
  id v12 = sub_10028C320(v11);
  if (![v12 isEqualToString:@"idsotr"])
  {
    id v15 = +[IDSDServiceController sharedInstance];
    id v16 = [v15 serviceWithPushTopic:v12];

    if (!v16)
    {
      __int16 v22 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v11;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Failed to find service for token %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            goto LABEL_8;
          }
        }
      }
      goto LABEL_112;
    }
    id v13 = [v16 dataProtectionClass];

LABEL_11:
    uint64_t v17 = +[IDSRegistrationKeyManager sharedInstance];
    id v18 = [v17 latestCopyMessageProtectionIdentityForDataProtectionClass:v13];

    CFTypeRef cf = v18;
    if (!v18)
    {
      id v20 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        IDSDataProtectionClassStringFromDataProtectionClass();
        BOOL v21 = (_SecOTRSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v67 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Failed to get MP Identity for data protection class %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v58 = IDSDataProtectionClassStringFromDataProtectionClass();
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            v58 = IDSDataProtectionClassStringFromDataProtectionClass();
            _IDSLogV();
          }
        }
      }
      -[IDSOTRController setupNewSessionInfoWithToken:](self, "setupNewSessionInfoWithToken:", v11, v58);
      [(IDSOTRController *)self suspendSessionNegotiation:v11 askedByPairedDevice:0];
      goto LABEL_112;
    }
    v63 = [(IDSOTRController *)self copyPairedDevicePublicIdentityWithDataProtectionClass:v13];
    if (!v63)
    {
      int v23 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v10;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "We have no public key for remote device %@, can't start OTR negotiation!", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v58 = v10;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            v58 = v10;
            _IDSLogV();
          }
        }
      }
      -[IDSOTRController setupNewSessionInfoWithToken:](self, "setupNewSessionInfoWithToken:", v11, v58);
      [(IDSOTRController *)self suspendSessionNegotiation:v11 askedByPairedDevice:0];
      CFRelease(v18);
      goto LABEL_112;
    }
    v62 = [(IDSOTRController *)self copySessionForToken:v11];
    if (v62) {
      int IsReadyForMessages = SecOTRSGetIsReadyForMessages();
    }
    else {
      int IsReadyForMessages = 0;
    }
    v24 = +[IDSOTRKeyStorage sharedInstance];
    uint64_t v25 = [v24 sessionKeyForToken:v11];

    id v26 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v27 = @"NO";
      *(_DWORD *)buf = 138413058;
      v67 = v10;
      if (IsReadyForMessages) {
        CFStringRef v28 = @"YES";
      }
      else {
        CFStringRef v28 = @"NO";
      }
      if (v25) {
        CFStringRef v27 = @"YES";
      }
      __int16 v68 = 2112;
      id v69 = v63;
      __int16 v70 = 2112;
      CFStringRef v71 = v28;
      __int16 v72 = 2112;
      CFStringRef v73 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Peer: %@    public key: %@    has OTR session: %@    has session key: %@", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      id v29 = IsReadyForMessages ? @"YES" : @"NO";
      v30 = v25 ? @"YES" : @"NO";
      v60 = v29;
      v61 = v30;
      v58 = v10;
      id v59 = v63;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        v60 = v29;
        v61 = v30;
        v58 = v10;
        id v59 = v63;
        _IDSLogV();
      }
    }
    if (v25) {
      char v31 = 1;
    }
    else {
      char v31 = IsReadyForMessages;
    }
    if (v31)
    {
      if ([(IDSOTRController *)self isSessionNegotiating:v11])
      {
        __int16 v32 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v11;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "OTR negotiation for %@ in progress.", buf, 0xCu);
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
        CFRelease(cf);
        CFRelease(v63);
        if (!v62) {
          goto LABEL_112;
        }
        goto LABEL_111;
      }
      if (!a5 && ((IsReadyForMessages ^ 1) & 1) == 0)
      {
        v37 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v11;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "OTR session for %@ is ready.", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v58 = v11;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              v58 = v11;
              _IDSLogV();
            }
          }
        }
        -[IDSOTRController performOTRSessionBlock:token:](self, "performOTRSessionBlock:token:", 1, v11, v58, v59, v60, v61);
        CFRelease(cf);
        CFRelease(v63);
        if (!v62) {
          goto LABEL_112;
        }
LABEL_111:
        CFRelease(v62);
        goto LABEL_112;
      }
      v40 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v11;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Kick off OTR session re-negotiation for %@.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v58 = v11;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            v58 = v11;
            _IDSLogV();
          }
        }
      }
      if (v62)
      {
        id v41 = objc_alloc_init((Class)NSMutableData);
        reuint64_t started = SecOTRSAppendRestartPacket();
        if (restarted)
        {
          v43 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v67 = v11;
            __int16 v68 = 1024;
            LODWORD(v69) = restarted;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "SecOTRSAppendRestartPacket failed for %@, with result %d, removing session key. Kick off re-negotiation.", buf, 0x12u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            _IDSWarnV();
            _IDSLogV();
            v58 = v11;
            id v59 = (id)restarted;
            _IDSLogTransport();
          }
          -[IDSOTRController _cacheSession:token:](self, "_cacheSession:token:", 0, v11, v58, v59, v60, v61);
          v44 = +[IDSOTRKeyStorage sharedInstance];
          [v44 removeSessionKeyForToken:v11];

          goto LABEL_109;
        }
        v53 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v67 = v62;
          __int16 v68 = 2112;
          id v69 = v11;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Restarted OTR session %p for %@.", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v58 = v62;
            id v59 = v11;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              v58 = v62;
              id v59 = v11;
              _IDSLogV();
            }
          }
        }
        -[IDSOTRController serializeSession:token:](self, "serializeSession:token:", v62, v11, v58, v59, v60, v61);
        [(IDSOTRController *)self _kickoffOTRNegotiationWithDevice:v10 token:v11 negotiationData:v41];

        goto LABEL_110;
      }
      if (v13 != 1)
      {
        v54 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v11;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Failed to find OTR session for token %@, this should never happen.", buf, 0xCu);
        }

        if (!os_log_shim_legacy_logging_enabled()) {
          goto LABEL_110;
        }
        if (!_IDSShouldLogTransport()) {
          goto LABEL_110;
        }
        _IDSLogTransport();
        if (!_IDSShouldLog()) {
          goto LABEL_110;
        }
LABEL_134:
        _IDSLogV();
        goto LABEL_110;
      }
      int v46 = +[IDSOTRKeyStorage sharedInstance];
      [v46 lock];

      __int16 v47 = +[IDSOTRKeyStorage sharedInstance];
      unsigned int v48 = [v47 isUnderLock];

      v49 = +[IDSOTRKeyStorage sharedInstance];
      v50 = [v49 sessionKeyForToken:v11];

      v51 = +[IDSOTRKeyStorage sharedInstance];
      [v51 unlock];

      if ((v48 & (v50 == 0)) == 1)
      {
        v52 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v11;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Failed to find OTR session for token %@, we're under first lock.", buf, 0xCu);
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
        v65[2](v65, 1);
        goto LABEL_110;
      }
      v55 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v56 = @"NO";
        if (v48) {
          CFStringRef v57 = @"YES";
        }
        else {
          CFStringRef v57 = @"NO";
        }
        *(_DWORD *)buf = 138412802;
        v67 = v11;
        id v69 = (id)v57;
        __int16 v68 = 2112;
        if (v50) {
          CFStringRef v56 = @"YES";
        }
        __int16 v70 = 2112;
        CFStringRef v71 = v56;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Failed to find OTR session for token %@, this should never happen (underLock %@) (hasSessionKey %@)", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            goto LABEL_134;
          }
        }
      }
    }
    else
    {
      id v33 = objc_alloc_init((Class)NSMutableData);
      OTRSessionWithFlags = (_SecOTRSession *)SecMPFullIdentityCreateOTRSessionWithFlags();
      if (!OTRSessionWithFlags)
      {
        v38 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v67 = v11;
          __int16 v68 = 2112;
          id v69 = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "SecMPFullIdentityCreateOTRSessionWithFlags failed for %@ with error %@. Kick off re-negotiation.", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          v58 = v11;
          id v59 = 0;
          _IDSLogTransport();
        }

        goto LABEL_109;
      }
      uint64_t started = SecOTRSAppendStartPacket();
      if (started)
      {
        id v36 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v67 = v11;
          __int16 v68 = 1024;
          LODWORD(v69) = started;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "SecOTRSAppendStartPacket failed for %@ with error %d. Kick off re-negotiation.", buf, 0x12u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          v58 = v11;
          id v59 = (id)started;
          _IDSLogTransport();
        }
        char v39 = 1;
      }
      else
      {
        __int16 v45 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v67 = OTRSessionWithFlags;
          __int16 v68 = 2112;
          id v69 = v11;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Created new OTR session %p for %@.", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v58 = OTRSessionWithFlags;
            id v59 = v11;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              v58 = OTRSessionWithFlags;
              id v59 = v11;
              _IDSLogV();
            }
          }
        }
        -[IDSOTRController serializeSession:token:](self, "serializeSession:token:", OTRSessionWithFlags, v11, v58, v59, v60, v61);
        [(IDSOTRController *)self setupNewSessionInfoWithToken:v11];
        [(IDSOTRController *)self _kickoffOTRNegotiationWithDevice:v10 token:v11 negotiationData:v33];
        char v39 = 0;
      }
      CFRelease(OTRSessionWithFlags);

      if (v39) {
LABEL_109:
      }
        -[IDSOTRController startOTRNegotiationWithDeviceIfNeeded:token:reset:errorHandler:](self, "startOTRNegotiationWithDeviceIfNeeded:token:reset:errorHandler:", v10, v11, 1, 0, v58, v59);
    }
LABEL_110:
    CFRelease(cf);
    CFRelease(v63);
    if (!v62) {
      goto LABEL_112;
    }
    goto LABEL_111;
  }
  id v13 = (id)sub_100291500(v11);
  if (v13 < 3) {
    goto LABEL_11;
  }
  id v14 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Invalid data protection class for token %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
LABEL_8:
      }
        _IDSLogV();
    }
  }
LABEL_112:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityToTimeoutBlocks, 0);
  objc_storeStrong((id *)&self->_priorityToCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_sessionInfoToToken, 0);
  objc_storeStrong((id *)&self->_sessionStorage, 0);

  objc_storeStrong((id *)&self->_storageLock, 0);
}

@end