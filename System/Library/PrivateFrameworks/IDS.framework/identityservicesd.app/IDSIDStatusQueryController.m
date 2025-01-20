@interface IDSIDStatusQueryController
+ (id)sharedInstance;
- (BOOL)allowProxyQueries;
- (BOOL)hasValidStatusForURI:(id)a3 fromURI:(id)a4 fromService:(id)a5;
- (IDSIDStatusDependencyProvider)dependencyProvider;
- (IDSIDStatusQueryController)init;
- (IDSIDStatusQueryController)initWithShouldAllowProxyQueries:(BOOL)a3 peerIDManager:(id)a4 userDefaults:(id)a5 statusDepencencyProvider:(id)a6;
- (IDSPeerIDManager)peerIDManager;
- (IMUserDefaults)userDefaults;
- (NSString)plistCachePath;
- (id)_cachedResultsForURIs:(id)a3 fromURI:(id)a4 fromService:(id)a5;
- (id)_loadLegacyCache;
- (id)_lookupDateForURI:(id)a3 fromService:(id)a4;
- (id)_negativeTTLForURI:(id)a3 fromService:(id)a4;
- (id)_plistFilePath;
- (id)_validExpiryForURI:(id)a3 fromService:(id)a4;
- (id)currentCache;
- (id)currentCacheForService:(id)a3;
- (id)idStatusCacheForService:(id)a3;
- (id)idStatusCaches;
- (unsigned)_IDStatusForURI:(id)a3 fromService:(id)a4;
- (unsigned)cachedIDStatusForID:(id)a3 fromURI:(id)a4 fromService:(id)a5;
- (unsigned)cachedIDStatusForID:(id)a3 fromURI:(id)a4 fromService:(id)a5 respectExpiry:(BOOL)a6;
- (void)_flush;
- (void)_loadCache;
- (void)_loadIfNeeded;
- (void)_lookupIDStatusForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 forceQuery:(BOOL)a9 bypassLimit:(BOOL)a10 reason:(id)a11 completionBlock:(id)a12;
- (void)_pruneExpiredStatusUnknownEntries;
- (void)_purgeTimerFiredOnMain;
- (void)_saveCache;
- (void)_sendIDStatusChanges:(id)a3 forService:(id)a4 URI:(id)a5 success:(BOOL)a6 error:(id)a7;
- (void)_setPurgeTimer;
- (void)_updateCacheWithStatusUpdates:(id)a3 fromURI:(id)a4 fromService:(id)a5 success:(BOOL)a6 hadError:(BOOL)a7 negativeCacheHints:(id)a8;
- (void)_wipeLegacyCache;
- (void)addCompletionBlock:(id)a3 forUniqueIdentifier:(id)a4;
- (void)clearCache;
- (void)clearIDStatusCacheIfNeeded;
- (void)dealloc;
- (void)infoForIDs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 infoType:(unint64_t)a7 infoOptions:(id)a8 lightQuery:(BOOL)a9 allowQuery:(BOOL)a10 reason:(id)a11 completion:(id)a12;
- (void)noteIncomingID:(id)a3 fromService:(id)a4;
- (void)remoteDevicesForIDs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 reason:(id)a9 completionBlock:(id)a10;
- (void)removeCachedEntriesForService:(id)a3;
- (void)removeCachedIDStatusForURI:(id)a3 service:(id)a4;
- (void)removeCompletionBlockForUniqueIdentifier:(id)a3;
- (void)requestIDStatusForID:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 reason:(id)a9 completionBlock:(id)a10;
- (void)requestIDStatusForIDs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 forceQuery:(BOOL)a9 bypassLimit:(BOOL)a10 reason:(id)a11 completionBlock:(id)a12;
- (void)setAllowProxyQueries:(BOOL)a3;
- (void)setCachedIDStatus:(unsigned int)a3 ForID:(id)a4 fromURI:(id)a5 fromService:(id)a6;
- (void)setDependencyProvider:(id)a3;
- (void)setPeerIDManager:(id)a3;
- (void)setPlistCachePath:(id)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation IDSIDStatusQueryController

+ (id)sharedInstance
{
  if (qword_100A4C4F8 != -1) {
    dispatch_once(&qword_100A4C4F8, &stru_100987AC0);
  }
  v2 = (void *)qword_100A4C500;

  return v2;
}

- (IDSIDStatusQueryController)initWithShouldAllowProxyQueries:(BOOL)a3 peerIDManager:(id)a4 userDefaults:(id)a5 statusDepencencyProvider:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)IDSIDStatusQueryController;
  v14 = [(IDSIDStatusQueryController *)&v33 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_peerIDManager, a4);
    objc_storeStrong((id *)&v15->_userDefaults, a5);
    objc_storeStrong((id *)&v15->_dependencyProvider, a6);
    v15->_allowProxyQueries = a3;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v15);
    peerIDManager = v15->_peerIDManager;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10029CB24;
    v30[3] = &unk_100984430;
    objc_copyWeak(&v31, &location);
    [(IDSPeerIDManager *)peerIDManager addCompletionBlock:v30 forToken:@"IDSIDStatusQueryController"];
    v17 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    lock = v15->_lock;
    v15->_lock = v17;

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10029D098;
    v28[3] = &unk_100981000;
    objc_copyWeak(&v29, &location);
    id v19 = [v28 copy];
    id purgeCancelBlock = v15->_purgeCancelBlock;
    v15->_id purgeCancelBlock = v19;

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10029D0EC;
    v25[3] = &unk_100981968;
    objc_copyWeak(&v27, &location);
    v21 = v15;
    v26 = v21;
    id v22 = [v25 copy];
    id purgeEnqueueBlock = v21->_purgeEnqueueBlock;
    v21->_id purgeEnqueueBlock = v22;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (void)_purgeTimerFiredOnMain
{
  v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10029D244;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (IDSIDStatusQueryController)init
{
  v3 = +[IDSPeerIDManager sharedInstance];
  v4 = +[IMUserDefaults sharedDefaults];
  v5 = objc_alloc_init(IDSIDStatusDependencyProvider);
  v6 = [(IDSIDStatusQueryController *)self initWithShouldAllowProxyQueries:0 peerIDManager:v3 userDefaults:v4 statusDepencencyProvider:v5];

  return v6;
}

- (void)dealloc
{
  [(IDSPeerIDManager *)self->_peerIDManager removeCompletionBlockForToken:@"IDSIDStatusQueryController"];
  [(IDSPeerIDManager *)self->_peerIDManager removePurgeClientDataBlockForToken:@"IDSIDStatusQueryController"];
  v3.receiver = self;
  v3.super_class = (Class)IDSIDStatusQueryController;
  [(IDSIDStatusQueryController *)&v3 dealloc];
}

- (void)_updateCacheWithStatusUpdates:(id)a3 fromURI:(id)a4 fromService:(id)a5 success:(BOOL)a6 hadError:(BOOL)a7 negativeCacheHints:(id)a8
{
  id v11 = a3;
  id v12 = a4;
  id v75 = a5;
  id v68 = a8;
  v73 = v11;
  v76 = v12;
  if ([v11 count])
  {
    id v13 = [v12 prefixedURI];
    id v14 = [v13 length];

    if (v14)
    {
      if ([v75 length])
      {
        [(IDSIDStatusQueryController *)self _loadIfNeeded];
        [(NSRecursiveLock *)self->_lock lock];
        v64 = [(IDSIDStatusQueryController *)self idStatusCacheForService:v75];
        id v15 = objc_alloc((Class)NSMutableDictionary);
        v16 = [v64 objectForKey:v75];
        id v71 = [v15 initWithDictionary:v16];

        [(IDSIDStatusDependencyProvider *)self->_dependencyProvider currentTime];
        double v18 = v17;
        id v19 = v75;
        unsigned int v67 = [v75 isEqualToString:@"com.apple.madrid"];
        if (v67)
        {
          v20 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Will add valid expiry", buf, 2u);
          }

          id v19 = v75;
          if (os_log_shim_legacy_logging_enabled())
          {
            MarcoLogMadridLevel();
            IMLogString();
            id v19 = v75;
            if (_IMWillLog())
            {
              _IMAlwaysLog();
              id v19 = v75;
            }
          }
        }
        v21 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          id v86 = v11;
          __int16 v87 = 2048;
          double v88 = v18;
          __int16 v89 = 2112;
          id v90 = v12;
          __int16 v91 = 2112;
          id v92 = v19;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Caching ID query responses: %@   date: %f   from URI: %@   from Service: %@ addValidExpiry", buf, 0x2Au);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          MarcoLogMadridLevel();
          id v62 = v12;
          id v63 = v75;
          double v61 = v18;
          id v60 = v11;
          IMLogString();
          if (_IMWillLog())
          {
            id v62 = v12;
            id v63 = v75;
            double v61 = v18;
            id v60 = v11;
            _IMAlwaysLog();
          }
        }
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        objc_msgSend(v11, "allKeys", v60, *(void *)&v61, v62, v63);
        id obj = (id)objc_claimAutoreleasedReturnValue();
        id v74 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
        if (v74)
        {
          uint64_t v70 = *(void *)v80;
          do
          {
            for (i = 0; i != v74; i = (char *)i + 1)
            {
              if (*(void *)v80 != v70) {
                objc_enumerationMutation(obj);
              }
              v23 = *(void **)(*((void *)&v79 + 1) + 8 * i);
              v77 = [v73 objectForKey:v23];
              unsigned int v24 = [v77 unsignedIntValue];
              unsigned int v25 = [v23 isEqualToURI:v76];
              if (v24 == 2) {
                unsigned int v26 = v25;
              }
              else {
                unsigned int v26 = 0;
              }
              if (v26 == 1)
              {
                id v27 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Trying to cache Invalid for ourselves, ignoring...", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  MarcoLogMadridLevel();
                  IMLogString();
                  if (_IMWillLog()) {
                    _IMAlwaysLog();
                  }
                }
              }
              else
              {
                id v28 = objc_alloc((Class)NSMutableDictionary);
                id v29 = [v23 prefixedURI];
                v30 = [v71 objectForKey:v29];
                CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)[v28 initWithDictionary:v30];

                id v31 = +[NSNumber numberWithDouble:v18];
                [(__CFDictionary *)theDict setObject:v31 forKey:@"LookupDate"];

                uint64_t v32 = objc_opt_class();
                id v33 = v23;
                v34 = [v68 objectForKey:v33];
                if (objc_opt_isKindOfClass())
                {
                  id v35 = v34;
                }
                else
                {
                  if (v34)
                  {
                    v36 = +[IMRGLog registration];
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      id v86 = v33;
                      __int16 v87 = 2112;
                      double v88 = *(double *)&v32;
                      _os_log_fault_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
                    }
                  }
                  id v35 = 0;
                }

                if (v35) {
                  CFDictionarySetValue(theDict, @"NegativeTTL", v35);
                }

                v37 = [(IDSIDStatusQueryController *)self peerIDManager];
                id v83 = v33;
                v38 = +[NSArray arrayWithObjects:&v83 count:1];
                v39 = [v37 endpointsForURIs:v38 service:v75 fromURI:v76];
                v40 = [v39 objectForKey:v33];
                v41 = objc_msgSend(v40, "__imArrayByApplyingBlock:", &stru_100987B08);
                v42 = [v41 sortedArrayUsingComparator:&stru_100987B48];
                v43 = [v42 firstObject];

                if (v43) {
                  unsigned int v44 = v67;
                }
                else {
                  unsigned int v44 = 0;
                }
                if (v44 == 1)
                {
                  [v43 timeIntervalSinceNow];
                  v45 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                }
                else
                {
                  v45 = 0;
                }
                v46 = [(__CFDictionary *)theDict objectForKey:@"IDStatus"];
                id v47 = [v46 intValue];

                v48 = [(IDSIDStatusQueryController *)self peerIDManager];
                [v48 timeToCacheURI:v33 fromURI:v76 service:v75 forStatus:v47];
                double v50 = v49;

                +[IDSBagUtilities timeToCacheResultsForIDStatus:0 forService:v75];
                if (v24)
                {
                  if (v24 == 1)
                  {
                    v54 = +[NSNumber numberWithInt:1];
                    [(__CFDictionary *)theDict setObject:v54 forKey:@"IDStatus"];

                    if (v45) {
                      [(__CFDictionary *)theDict setObject:v45 forKey:@"ValidExpiry"];
                    }
                  }
                  else if (v24 == 2)
                  {
                    v52 = +[NSNumber numberWithInt:2];
                    [(__CFDictionary *)theDict setObject:v52 forKey:@"IDStatus"];
                  }
                }
                else
                {
                  v53 = +[NSNumber numberWithDouble:v18 + v51 - v50];
                  [(__CFDictionary *)theDict setObject:v53 forKey:@"LookupDate"];
                }
                v55 = [v33 prefixedURI];
                [v71 setObject:theDict forKey:v55];

                if (!v24 && !a6 && !a7)
                {
                  v56 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, " => Ignoring update to unknown, just updating the cache", buf, 2u);
                  }

                  if (os_log_shim_legacy_logging_enabled())
                  {
                    MarcoLogMadridLevel();
                    IMLogString();
                    if (_IMWillLog()) {
                      _IMAlwaysLog();
                    }
                  }
                }
              }
            }
            id v74 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
          }
          while (v74);
        }

        if ([v71 count]) {
          [v64 setObject:v71 forKey:v75];
        }
        else {
          [v64 removeObjectForKey:v75];
        }
        [(IDSIDStatusQueryController *)self clearIDStatusCacheIfNeeded];
        [(IDSIDStatusQueryController *)self _setPurgeTimer];
        [(NSRecursiveLock *)self->_lock unlock];

        goto LABEL_81;
      }
      v59 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "No fromService, ignoring...", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        IMLogString();
        if (_IMWillLog()) {
LABEL_78:
        }
          _IMAlwaysLog();
      }
    }
    else
    {
      v58 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "No fromURI, ignoring...", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        IMLogString();
        if (_IMWillLog()) {
          goto LABEL_78;
        }
      }
    }
  }
  else
  {
    v57 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "No updates, ignoring...", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        goto LABEL_78;
      }
    }
  }
LABEL_81:
}

- (unsigned)_IDStatusForURI:(id)a3 fromService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(IDSIDStatusQueryController *)self _loadIfNeeded];
  [(NSRecursiveLock *)self->_lock lock];
  if (sub_10029E170((unint64_t)[v6 FZIDType], v6))
  {
    v8 = [(IDSIDStatusQueryController *)self idStatusCacheForService:v7];
    v9 = [v8 objectForKey:v7];

    v10 = [v6 prefixedURI];
    id v11 = [v9 objectForKey:v10];

    id v12 = [v11 objectForKey:@"IDStatus"];
    unsigned int v13 = [v12 intValue];
  }
  else
  {
    unsigned int v13 = 2;
  }
  [(NSRecursiveLock *)self->_lock unlock];

  return v13;
}

- (void)removeCachedEntriesForService:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(IDSIDStatusQueryController *)self _loadIfNeeded];
    [(NSRecursiveLock *)self->_lock lock];
    v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing cached entries {service: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      id v7 = v4;
      IMLogString();
      if (_IMWillLog())
      {
        id v7 = v4;
        _IMAlwaysLog();
      }
    }
    id v6 = -[IDSIDStatusQueryController idStatusCacheForService:](self, "idStatusCacheForService:", v4, v7);
    [v6 removeObjectForKey:v4];

    [(NSRecursiveLock *)self->_lock unlock];
  }
}

- (void)removeCachedIDStatusForURI:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    [(IDSIDStatusQueryController *)self _loadIfNeeded];
    [(NSRecursiveLock *)self->_lock lock];
    id v9 = objc_alloc((Class)NSMutableDictionary);
    v10 = [(IDSIDStatusQueryController *)self idStatusCacheForService:v8];
    id v11 = [v10 objectForKey:v8];
    id v12 = [v9 initWithDictionary:v11];

    if (!v12 || ![v12 count])
    {
      unsigned int v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Found no idStatusCache for the service: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        v21 = v8;
        IMLogString();
        if (_IMWillLog())
        {
          v21 = v8;
          _IMAlwaysLog();
        }
      }
    }
    id v14 = objc_msgSend(v6, "prefixedURI", v21);
    id v15 = [v12 objectForKey:v14];

    if (v15)
    {
      v16 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v6;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Removing cached idStatus forURI: %@ service: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        id v22 = v6;
        v23 = v8;
        IMLogString();
        if (_IMWillLog())
        {
          id v22 = v6;
          v23 = v8;
          _IMAlwaysLog();
        }
      }
      double v17 = objc_msgSend(v6, "prefixedURI", v22, v23);
      [v12 removeObjectForKey:v17];
    }
    else
    {
      id v19 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v6;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No idStatus to remove forURI: %@ service: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        id v22 = v6;
        v23 = v8;
        IMLogString();
        if (_IMWillLog())
        {
          id v22 = v6;
          v23 = v8;
          _IMAlwaysLog();
        }
      }
    }
    v20 = -[IDSIDStatusQueryController idStatusCacheForService:](self, "idStatusCacheForService:", v8, v22, v23);
    [v20 setObject:v12 forKey:v8];

    [(NSRecursiveLock *)self->_lock unlock];
  }
  else
  {
    double v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "removeCachedIDStatusForURI needs a forURI and service -- returning", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
  }
}

- (void)noteIncomingID:(id)a3 fromService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(IDSIDStatusQueryController *)self _loadIfNeeded];
  if ([v7 length])
  {
    id v8 = [v6 FZIDType];
    if ([v7 length])
    {
      if (sub_10029E170((unint64_t)v8, v6))
      {
        [(NSRecursiveLock *)self->_lock lock];
        if ([(IDSIDStatusQueryController *)self _IDStatusForURI:v6 fromService:v7] == 2)
        {
          id v9 = objc_alloc((Class)NSMutableDictionary);
          v10 = [(IDSIDStatusQueryController *)self idStatusCacheForService:v7];
          id v11 = [v10 objectForKey:v7];
          id v12 = [v9 initWithDictionary:v11];

          unsigned int v13 = [v6 prefixedURI];
          [v12 removeObjectForKey:v13];

          id v14 = [(IDSIDStatusQueryController *)self idStatusCacheForService:v7];
          [v14 setObject:v12 forKey:v7];
        }
        [(NSRecursiveLock *)self->_lock unlock];
        goto LABEL_27;
      }
      double v18 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, " => Bogus ID query for: %@   ignoring this", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        IMLogString();
        if (_IMWillLog()) {
LABEL_26:
        }
          _IMAlwaysLog();
      }
    }
    else
    {
      v16 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, " => Bogus ID query for: %@   ignoring this", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        IMLogString();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
      double v17 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, " => From Service: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        IMLogString();
        if (_IMWillLog()) {
          goto LABEL_26;
        }
      }
    }
  }
  else
  {
    id v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No fromService, ignoring...", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        goto LABEL_26;
      }
    }
  }
LABEL_27:
}

- (id)_cachedResultsForURIs:(id)a3 fromURI:(id)a4 fromService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v19 = objc_alloc_init((Class)NSMutableDictionary);
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        double v17 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[IDSIDStatusQueryController cachedIDStatusForID:fromURI:fromService:](self, "cachedIDStatusForID:fromURI:fromService:", v16, v9, v10, v19));
        [v11 setObject:v17 forKey:v16];
      }
      id v13 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  [v19 setObject:v11 forKey:v10];

  return v19;
}

- (id)_lookupDateForURI:(id)a3 fromService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(IDSIDStatusQueryController *)self _loadIfNeeded];
  [(NSRecursiveLock *)self->_lock lock];
  id v8 = [(IDSIDStatusQueryController *)self idStatusCacheForService:v6];
  id v9 = [v8 objectForKey:v6];

  id v10 = [v7 prefixedURI];

  id v11 = [v9 objectForKey:v10];

  id v12 = [v11 objectForKey:@"LookupDate"];
  id v13 = [v12 copy];

  [(NSRecursiveLock *)self->_lock unlock];

  return v13;
}

- (id)_validExpiryForURI:(id)a3 fromService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(IDSIDStatusQueryController *)self _loadIfNeeded];
  [(NSRecursiveLock *)self->_lock lock];
  id v8 = [(IDSIDStatusQueryController *)self idStatusCacheForService:v6];
  id v9 = [v8 objectForKey:v6];

  id v10 = [v7 prefixedURI];

  id v11 = [v9 objectForKey:v10];

  id v12 = [v11 objectForKey:@"ValidExpiry"];
  id v13 = [v12 copy];

  [(NSRecursiveLock *)self->_lock unlock];

  return v13;
}

- (id)_negativeTTLForURI:(id)a3 fromService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(IDSIDStatusQueryController *)self _loadIfNeeded];
  [(NSRecursiveLock *)self->_lock lock];
  id v8 = [(IDSIDStatusQueryController *)self idStatusCacheForService:v6];
  id v9 = [v8 objectForKey:v6];

  id v10 = [v7 prefixedURI];

  id v11 = [v9 objectForKey:v10];

  id v12 = [v11 objectForKey:@"NegativeTTL"];
  id v13 = [v12 copy];

  [(NSRecursiveLock *)self->_lock unlock];

  return v13;
}

- (BOOL)hasValidStatusForURI:(id)a3 fromURI:(id)a4 fromService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(IDSIDStatusQueryController *)self _IDStatusForURI:v8 fromService:v10] == 2)
  {
    id v11 = [(IDSIDStatusQueryController *)self _lookupDateForURI:v8 fromService:v10];
    [v11 doubleValue];
    double v13 = v12;
    double Current = CFAbsoluteTimeGetCurrent();
    id v15 = +[IDSPeerIDManager sharedInstance];
    double v16 = vabdd_f64(Current, v13);
    [v15 timeToCacheURI:v8 fromURI:v9 service:v10 forStatus:2];
    double v18 = v17;

    BOOL v19 = v16 >= v18 || v11 == 0;
    BOOL v20 = v19;
    if (!v19)
    {
      long long v21 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110144;
        int v24 = 2;
        __int16 v25 = 2048;
        double v26 = Current;
        __int16 v27 = 2048;
        double v28 = v13;
        __int16 v29 = 2048;
        double v30 = v16;
        __int16 v31 = 2048;
        double v32 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, " => Not looking up... current status: %d  current time: %f   last looked up: %f  difference: %f  difference needed: %f", buf, 0x30u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        IMLogString();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (void)_lookupIDStatusForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 forceQuery:(BOOL)a9 bypassLimit:(BOOL)a10 reason:(id)a11 completionBlock:(id)a12
{
  BOOL v159 = a8;
  BOOL v143 = a7;
  id v151 = a3;
  id v149 = a4;
  id v161 = a5;
  id v163 = a6;
  v147 = (__CFString *)a11;
  id v16 = a12;
  v164 = self;
  if (!self->_allowProxyQueries)
  {
    if (![v151 count]
      || (id v46 = v16,
          [v161 prefixedURI],
          id v47 = objc_claimAutoreleasedReturnValue(),
          id v48 = [v47 length],
          v47,
          id v16 = v46,
          !v149)
      || !v48)
    {
      if (v16) {
        (*((void (**)(id, void, id, id, void, void))v16 + 2))(v16, 0, v161, v163, 0, 0);
      }
      goto LABEL_207;
    }
  }
  v148 = v16;
  double v17 = +[IDSTrafficMonitor sharedInstance];
  [v17 noteQueryRequestForService:v163 requestor:@"unknown"];

  [(IDSIDStatusQueryController *)self _loadIfNeeded];
  id v154 = objc_alloc_init((Class)NSMutableArray);
  id v158 = objc_alloc_init((Class)NSMutableArray);
  id v18 = objc_alloc_init((Class)NSMutableArray);
  id v153 = objc_alloc_init((Class)NSMutableArray);
  [(NSRecursiveLock *)self->_lock lock];
  long long v181 = 0u;
  long long v182 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  id obj = v151;
  id v19 = [obj countByEnumeratingWithState:&v179 objects:v194 count:16];
  if (!v19)
  {
    int v156 = 0;
    goto LABEL_79;
  }
  int v156 = 0;
  uint64_t v20 = *(void *)v180;
  do
  {
    for (i = 0; i != v19; i = (char *)i + 1)
    {
      if (*(void *)v180 != v20) {
        objc_enumerationMutation(obj);
      }
      long long v22 = *(void **)(*((void *)&v179 + 1) + 8 * i);
      id v23 = objc_msgSend(v22, "FZIDType", *(void *)&v132, *(void *)&v139, *(void *)&v140, *(void *)&v141, *(void *)&v142);
      [v18 addObject:v22];
      if (sub_10029E170((unint64_t)v23, v22))
      {
        if (a9 && sub_1002A1C18())
        {
          int v24 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v187 = v22;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, " => Forcing query for URI: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            MarcoLogMadridLevel();
            double v132 = *(double *)&v22;
            IMLogString();
            if (_IMWillLog())
            {
              double v132 = *(double *)&v22;
              _IMAlwaysLog();
            }
          }
LABEL_62:
          objc_msgSend(v158, "addObject:", v22, *(void *)&v132);
          continue;
        }
        double v26 = COERCE_DOUBLE((id)[(IDSIDStatusQueryController *)v164 _IDStatusForURI:v22 fromService:v163]);
        __int16 v27 = [(IDSIDStatusQueryController *)v164 _lookupDateForURI:v22 fromService:v163];
        double v28 = [(IDSIDStatusQueryController *)v164 _validExpiryForURI:v22 fromService:v163];
        __int16 v29 = [(IDSIDStatusQueryController *)v164 _negativeTTLForURI:v22 fromService:v163];
        [v27 doubleValue];
        double v31 = v30;
        [(IDSIDStatusDependencyProvider *)v164->_dependencyProvider currentTime];
        double v33 = v32;
        if (v29)
        {
          [v29 doubleValue];
          goto LABEL_22;
        }
        if (v28 && sub_1002A1C84())
        {
          [v28 doubleValue];
LABEL_22:
          double v35 = v34;
        }
        else
        {
          v36 = [(IDSIDStatusQueryController *)v164 peerIDManager];
          [v36 timeToCacheURI:v22 fromURI:v161 service:v163 forStatus:*(void *)&v26];
          double v35 = v37;
        }
        double v38 = vabdd_f64(v33, v31);
        unsigned int v39 = [(IDSIDStatusQueryController *)v164 cachedIDStatusForID:v22 fromURI:v161 fromService:v163];
        if (v39 != 1 || v38 >= v35)
        {
          if (v159)
          {
            if (!v27 || v38 >= v35)
            {
              if (!v27) {
                [v153 addObject:v22];
              }
              unsigned int v44 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138413570;
                *(void *)v187 = v22;
                *(_WORD *)&v187[8] = 1024;
                *(_DWORD *)&v187[10] = LODWORD(v26);
                *(_WORD *)&v187[14] = 2048;
                *(double *)&v187[16] = v31;
                __int16 v188 = 2048;
                double v189 = v33;
                __int16 v190 = 2048;
                double v191 = v38;
                __int16 v192 = 2048;
                double v193 = v35;
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, " => Issuing ID query for URIs: %@   (Current status: %d  Last time: %f   Current time: %f  Difference: %f  Needed Difference: %f)", buf, 0x3Au);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                MarcoLogMadridLevel();
                double v142 = v38;
                double v140 = v31;
                double v141 = v33;
                double v132 = *(double *)&v22;
                double v139 = v26;
                IMLogString();
                if (_IMWillLog())
                {
                  double v142 = v38;
                  double v140 = v31;
                  double v141 = v33;
                  double v132 = *(double *)&v22;
                  double v139 = v26;
                  _IMAlwaysLog();
                }
              }

              goto LABEL_62;
            }
            if (v39)
            {
              v41 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67110144;
                *(_DWORD *)v187 = LODWORD(v26);
                *(_WORD *)&v187[4] = 2048;
                *(double *)&v187[6] = v33;
                *(_WORD *)&v187[14] = 2048;
                *(double *)&v187[16] = v31;
                __int16 v188 = 2048;
                double v189 = v38;
                __int16 v190 = 2048;
                double v191 = v35;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, " => Not looking up... current status: %d  current time: %f   last looked up: %f  difference: %f  difference needed: %f", buf, 0x30u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                MarcoLogMadridLevel();
                double v141 = v38;
                double v142 = v35;
                double v139 = v33;
                double v140 = v31;
                double v132 = v26;
                IMLogString();
                if (_IMWillLog()) {
                  goto LABEL_39;
                }
              }
            }
            else
            {
              v45 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67110144;
                *(_DWORD *)v187 = LODWORD(v26);
                *(_WORD *)&v187[4] = 2048;
                *(double *)&v187[6] = v33;
                *(_WORD *)&v187[14] = 2048;
                *(double *)&v187[16] = v31;
                __int16 v188 = 2048;
                double v189 = v38;
                __int16 v190 = 2048;
                double v191 = v35;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, " => We can't look up, but can piggyback... current status: %d  current time: %f   last looked up: %f  difference: %f  difference needed: %f", buf, 0x30u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                MarcoLogMadridLevel();
                double v141 = v38;
                double v142 = v35;
                double v139 = v33;
                double v140 = v31;
                double v132 = v26;
                IMLogString();
                if (_IMWillLog())
                {
                  double v141 = v38;
                  double v142 = v35;
                  double v139 = v33;
                  double v140 = v31;
                  double v132 = v26;
                  _IMAlwaysLog();
                }
              }
              objc_msgSend(v154, "addObject:", v22, *(void *)&v132);
            }
          }
          else
          {
            v43 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67110144;
              *(_DWORD *)v187 = LODWORD(v26);
              *(_WORD *)&v187[4] = 2048;
              *(double *)&v187[6] = v33;
              *(_WORD *)&v187[14] = 2048;
              *(double *)&v187[16] = v31;
              __int16 v188 = 2048;
              double v189 = v38;
              __int16 v190 = 2048;
              double v191 = v35;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, " => Not looking up, query not allowed... current status: %d  current time: %f   last looked up: %f  difference: %f  difference needed: %f", buf, 0x30u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              MarcoLogMadridLevel();
              double v141 = v38;
              double v142 = v35;
              double v139 = v33;
              double v140 = v31;
              double v132 = v26;
              IMLogString();
              if (_IMWillLog())
              {
LABEL_39:
                double v141 = v38;
                double v142 = v35;
                double v139 = v33;
                double v140 = v31;
                double v132 = v26;
                _IMAlwaysLog();
              }
            }
          }
        }
        else if (([v163 isEqualToString:@"com.apple.madrid"] & 1) == 0 {
               && ([v163 isEqualToString:@"com.apple.private.alloy.willow"] & 1) == 0
        }
               && ([v163 isEqualToString:@"com.apple.private.alloy.biz"] & 1) == 0)
        {
          v42 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, " => Not looking up... status is Valid", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            MarcoLogMadridLevel();
            IMLogString();
            if (_IMWillLog()) {
              _IMAlwaysLog();
            }
          }
          int v156 = 1;
        }

        continue;
      }
      __int16 v25 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v187 = v22;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, " => Bogus ID query for: %@   ignoring this", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        double v132 = *(double *)&v22;
        IMLogString();
        if (_IMWillLog())
        {
          double v132 = *(double *)&v22;
          _IMAlwaysLog();
        }
      }
    }
    id v19 = [obj countByEnumeratingWithState:&v179 objects:v194 count:16];
  }
  while (v19);
LABEL_79:

  [(NSRecursiveLock *)v164->_lock unlock];
  v173[0] = _NSConcreteStackBlock;
  v173[1] = 3221225472;
  v173[2] = sub_1002A1CF0;
  v173[3] = &unk_100987B70;
  id v160 = v161;
  id v174 = v160;
  v175 = v164;
  id v49 = v163;
  id v176 = v49;
  v144 = v148;
  v178 = v144;
  id v146 = v18;
  id v177 = v146;
  v145 = objc_retainBlock(v173);
  double v50 = COERCE_DOUBLE(v49);
  double v51 = +[IDSDServiceController sharedInstance];
  v150 = [v51 serviceWithIdentifier:*(void *)&v50];

  double v52 = v50;
  if ([v150 adHocServiceType])
  {
    v53 = +[IDSDServiceController sharedInstance];
    v54 = objc_msgSend(v53, "primaryServiceForAdhocServiceType:", objc_msgSend(v150, "adHocServiceType"));

    double v52 = [v54 identifier];
  }
  startQueryDateByTopLevelService = v164->_startQueryDateByTopLevelService;
  if (!startQueryDateByTopLevelService)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v57 = v164->_startQueryDateByTopLevelService;
    v164->_startQueryDateByTopLevelService = (NSMutableDictionary *)Mutable;

    startQueryDateByTopLevelService = v164->_startQueryDateByTopLevelService;
  }
  v157 = -[NSMutableDictionary objectForKeyedSubscript:](startQueryDateByTopLevelService, "objectForKeyedSubscript:", *(void *)&v52, *(void *)&v132);
  [v157 timeIntervalSinceNow];
  double v59 = v58;
  int v60 = sub_1002A2298(*(void **)&v52);
  double v61 = fabs(v59);
  if (v157)
  {
    if (v61 > (double)(3600 * v60))
    {
      id v62 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        int v63 = sub_1002A2298(*(void **)&v52);
        *(_DWORD *)buf = 134217984;
        *(void *)v187 = v63;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Over %ld hour(s), resetting query per hour(s) count", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        sub_1002A2298(*(void **)&v52);
        MarcoLogMadridLevel();
        v133 = (void *)(int)sub_1002A2298(*(void **)&v52);
        IMLogString();
        if (_IMWillLog())
        {
          v133 = (void *)(int)sub_1002A2298(*(void **)&v52);
          _IMAlwaysLog();
        }
      }

      numQueriesThisHourByTopLevelService = v164->_numQueriesThisHourByTopLevelService;
      if (!numQueriesThisHourByTopLevelService)
      {
        CFMutableDictionaryRef v65 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v66 = v164->_numQueriesThisHourByTopLevelService;
        v164->_numQueriesThisHourByTopLevelService = (NSMutableDictionary *)v65;

        numQueriesThisHourByTopLevelService = v164->_numQueriesThisHourByTopLevelService;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](numQueriesThisHourByTopLevelService, "setObject:forKeyedSubscript:", &off_1009D1AA0, *(void *)&v52, v133);
      reportedRateLimitedThisHour = v164->_reportedRateLimitedThisHour;
      if (!reportedRateLimitedThisHour)
      {
        id v68 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        v69 = v164->_reportedRateLimitedThisHour;
        v164->_reportedRateLimitedThisHour = v68;

        reportedRateLimitedThisHour = v164->_reportedRateLimitedThisHour;
      }
      [(NSMutableSet *)reportedRateLimitedThisHour removeObject:*(void *)&v52];
      goto LABEL_95;
    }
  }
  else
  {
LABEL_95:
    v157 = [(IDSIDStatusDependencyProvider *)v164->_dependencyProvider currentDate];
    [(NSMutableDictionary *)v164->_startQueryDateByTopLevelService setObject:v157 forKeyedSubscript:*(void *)&v52];
    uint64_t v70 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v187 = v157;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "New start query date %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      v133 = v157;
      IMLogString();
      if (_IMWillLog())
      {
        v133 = v157;
        _IMAlwaysLog();
      }
    }
  }
  uint64_t v71 = -[NSMutableDictionary objectForKeyedSubscript:](v164->_numQueriesThisHourByTopLevelService, "objectForKeyedSubscript:", *(void *)&v52, v133);
  v72 = (void *)v71;
  v73 = &off_1009D1AA0;
  if (v71) {
    v73 = (_UNKNOWN **)v71;
  }
  v152 = v73;

  signed int v74 = [v152 intValue];
  id v155 = *(id *)&v52;
  id v75 = +[IDSServerBag sharedInstanceForBagType:1];
  v76 = +[NSString stringWithFormat:@"device-queries-per-hour-%@", v155];
  v77 = [v75 objectForKey:v76];

  if (v77)
  {
    signed int v78 = [v77 intValue];
  }
  else if ([v155 isEqualToString:@"com.apple.private.alloy.arcade"])
  {
    signed int v78 = 1000;
  }
  else
  {
    signed int v78 = 200;
  }

  if (v74 < v78
    || a10
    && ((+[IDSServerBag sharedInstanceForBagType:0],
         long long v80 = objc_claimAutoreleasedReturnValue(),
         [v80 objectForKey:@"client-query-allow-bypass-limit"],
         long long v81 = objc_claimAutoreleasedReturnValue(),
         v80,
         !v81)
     || (unsigned int v82 = [v81 BOOLValue], v81, v82)))
  {
    if ([v158 count]) {
      BOOL v79 = 1;
    }
    else {
      BOOL v79 = [v154 count] != 0;
    }
    if (((v156 ^ 1) & 1) == 0 && (!a10 || !v79))
    {
      v100 = [(IDSIDStatusQueryController *)v164 _cachedResultsForURIs:v146 fromURI:v160 fromService:*(void *)&v50];
      v101 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v187 = v100;
        _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "We have at least one valid result, returning cached results %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        v134 = v100;
        IMLogString();
        if (_IMWillLog())
        {
          v134 = v100;
          _IMAlwaysLog();
        }
      }
      -[IDSIDStatusQueryController _sendIDStatusChanges:forService:URI:success:error:](v164, "_sendIDStatusChanges:forService:URI:success:error:", v100, *(void *)&v50, v160, 1, 0, v134);
      if (v144) {
        v144[2]();
      }
LABEL_205:

      goto LABEL_206;
    }
    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    id v102 = v153;
    id v103 = [v102 countByEnumeratingWithState:&v169 objects:v185 count:16];
    if (v103)
    {
      uint64_t v104 = *(void *)v170;
      do
      {
        for (j = 0; j != v103; j = (char *)j + 1)
        {
          if (*(void *)v170 != v104) {
            objc_enumerationMutation(v102);
          }
          uint64_t v106 = *(void *)(*((void *)&v169 + 1) + 8 * (void)j);
          v107 = +[NSNumber numberWithUnsignedInt:0];
          v108 = +[NSDictionary dictionaryWithObject:v107 forKey:v106];

          [(IDSIDStatusQueryController *)v164 _updateCacheWithStatusUpdates:v108 fromURI:v160 fromService:*(void *)&v50 success:0 hadError:0 negativeCacheHints:0];
        }
        id v103 = [v102 countByEnumeratingWithState:&v169 objects:v185 count:16];
      }
      while (v103);
    }

    if (v149)
    {
      uint64_t v109 = sub_1002A1C84();
      if (((v109 | !a9) & 1) == 0) {
        uint64_t v109 = sub_1002A1C18();
      }
      if ([v158 count] || !objc_msgSend(v154, "count"))
      {
        v110 = [(IDSIDStatusQueryController *)v164 peerIDManager];
        v111 = v110;
        CFStringRef v112 = @"StatusLookup";
        if (v147) {
          CFStringRef v112 = v147;
        }
        LOBYTE(v134) = a9;
        unsigned int v98 = [v110 startQueryForURIs:v158 fromIdentity:v149 fromURI:v160 fromService:*(void *)&v50 forSending:1 forRefresh:v109 isForced:v134 reason:v112 completionBlock:v145];

        if (!v164->_numQueriesThisHourByTopLevelService)
        {
          CFMutableDictionaryRef v113 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          v114 = v164->_numQueriesThisHourByTopLevelService;
          v164->_numQueriesThisHourByTopLevelService = (NSMutableDictionary *)v113;
        }
        v115 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v158 count] + (int)objc_msgSend(v152, "intValue"));
        [(NSMutableDictionary *)v164->_numQueriesThisHourByTopLevelService setObject:v115 forKeyedSubscript:v155];

        v116 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
        {
          v117 = [(NSMutableDictionary *)v164->_numQueriesThisHourByTopLevelService objectForKeyedSubscript:v155];
          *(_DWORD *)buf = 138412546;
          *(void *)v187 = v117;
          *(_WORD *)&v187[8] = 2112;
          *(void *)&v187[10] = v155;
          _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "We're at %@ queries for this hour for service: %@", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          v135 = [(NSMutableDictionary *)v164->_numQueriesThisHourByTopLevelService objectForKeyedSubscript:v155];
          MarcoLogMadridLevel();

          v136 = -[NSMutableDictionary objectForKeyedSubscript:](v164->_numQueriesThisHourByTopLevelService, "objectForKeyedSubscript:", v155, v135, v155);
          IMLogString();

          if (_IMWillLog())
          {
            v137 = -[NSMutableDictionary objectForKeyedSubscript:](v164->_numQueriesThisHourByTopLevelService, "objectForKeyedSubscript:", v155, v136, v155);
            _IMAlwaysLog();
          }
        }
        goto LABEL_192;
      }
      if ([v154 count])
      {
        v119 = [[IDSPeerIDQueryContext alloc] initWithSending:1 refresh:v109 messaging:0 resultExpected:0 preventNewQuery:1 isForced:a9];
        v120 = [(IDSIDStatusQueryController *)v164 peerIDManager];
        v121 = v120;
        if (v147) {
          CFStringRef v122 = v147;
        }
        else {
          CFStringRef v122 = @"StatusLookupPiggyback";
        }
        unsigned int v98 = [v120 startQueryForURIs:v154 fromIdentity:v149 fromURI:v160 fromService:*(void *)&v50 context:v119 reason:v122 completionBlock:v145];

        if (((v98 | v156 ^ 1) & 1) == 0)
        {
          v123 = [(IDSIDStatusQueryController *)v164 _cachedResultsForURIs:v146 fromURI:v160 fromService:*(void *)&v50];
          v124 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v187 = v123;
            _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "We have at least one valid result, returning cached results %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            MarcoLogMadridLevel();
            v138 = v123;
            IMLogString();
            if (_IMWillLog())
            {
              v138 = v123;
              _IMAlwaysLog();
            }
          }
          -[IDSIDStatusQueryController _sendIDStatusChanges:forService:URI:success:error:](v164, "_sendIDStatusChanges:forService:URI:success:error:", v123, *(void *)&v50, v160, 1, 0, v138);
          if (v144) {
            ((void (*)(void (**)(void), void *, id, id, uint64_t, void))v144[2])(v144, v123, v160, *(id *)&v50, 1, 0);
          }
        }
        goto LABEL_192;
      }
    }
    else
    {
      if (v164->_allowProxyQueries && [v158 count])
      {
        v118 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "Device does not have a cert, attempting to proxy the query", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          MarcoLogMadridLevel();
          IMLogString();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        v100 = [(IDSIDStatusDependencyProvider *)v164->_dependencyProvider newRemoteCredential];
        v165[0] = _NSConcreteStackBlock;
        v165[1] = 3221225472;
        v165[2] = sub_1002A235C;
        v165[3] = &unk_100987B98;
        v165[4] = v164;
        id v166 = v160;
        id v167 = *(id *)&v50;
        v168 = v144;
        [v100 requestIDStatusForURIs:obj service:v167 lightQuery:v143 allowQuery:v159 completionBlock:v165];

        goto LABEL_205;
      }
      v125 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v126 = @"YES";
        if (!v164->_allowProxyQueries) {
          CFStringRef v126 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        *(void *)v187 = v126;
        *(_WORD *)&v187[8] = 2112;
        *(void *)&v187[10] = v158;
        _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "Device does not have a cert {_allowProxyQueries: %@, URIsToQuery: %@}", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        IMLogString();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
    }
    unsigned int v98 = 0;
LABEL_192:
    int v99 = 0;
    goto LABEL_193;
  }
  id v83 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v187 = v152;
    *(_WORD *)&v187[8] = 2112;
    *(double *)&v187[10] = v50;
    _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "We're at %@ queries for this hour for service: %@, can't do more", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    MarcoLogMadridLevel();
    v134 = v152;
    double v139 = v50;
    IMLogString();
    if (_IMWillLog())
    {
      v134 = v152;
      double v139 = v50;
      _IMAlwaysLog();
    }
  }
  v84 = v164->_reportedRateLimitedThisHour;
  if (!v84)
  {
    v85 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v86 = v164->_reportedRateLimitedThisHour;
    v164->_reportedRateLimitedThisHour = v85;

    v84 = v164->_reportedRateLimitedThisHour;
  }
  if ((-[NSMutableSet containsObject:](v84, "containsObject:", v155, v134, *(void *)&v139) & 1) == 0)
  {
    [(NSMutableSet *)v164->_reportedRateLimitedThisHour addObject:v155];
    if (+[IDSAutoBugCapture isSupported])
    {
      __int16 v87 = +[NSString stringWithFormat:@"(%@)", v155];
      +[IDSAutoBugCapture triggerCaptureWithEvent:103 context:v87 completion:&stru_100987BB8];
    }
    id v88 = objc_alloc((Class)IDSQueryRateLimitedMetric);
    __int16 v89 = +[NSNumber numberWithDouble:v61];
    id v90 = [v88 initWithTopLevelService:v155 count:v152 timeSinceStart:v89];

    __int16 v91 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v91 logMetric:v90];

    id v92 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v93 = *(id *)&v50;
    if (v93) {
      CFDictionarySetValue(v92, @"service", v93);
    }

    v94 = +[NSNumber numberWithBool:1];
    if (v94) {
      CFDictionarySetValue(v92, @"isRateLimited", v94);
    }

    v95 = v152;
    CFDictionarySetValue(v92, @"numQueriesThisHour", v95);

    v96 = +[NSNumber numberWithDouble:v61];
    if (v96) {
      CFDictionarySetValue(v92, @"timeSinceStart", v96);
    }

    v97 = +[TransparencyAnalytics logger];
    [v97 logHardFailureForEventNamed:@"IDSQueryMetric" withAttributes:v92];
  }
  unsigned int v98 = 0;
  int v99 = 1;
LABEL_193:
  if (((v98 | v156) & 1) == 0)
  {
    v100 = [(IDSIDStatusQueryController *)v164 _cachedResultsForURIs:v146 fromURI:v160 fromService:*(void *)&v50];
    v127 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v187 = v100;
      _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "We didn't query anything, returning cached results %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    uint64_t v128 = +[NSString stringWithFormat:@"Query on the service %@ is being rate limited { numQueriesThisHour: %@ }", *(void *)&v50, v152];
    v129 = (void *)v128;
    if (v99)
    {
      NSErrorUserInfoKey v183 = NSLocalizedDescriptionKey;
      uint64_t v184 = v128;
      v130 = +[NSDictionary dictionaryWithObjects:&v184 forKeys:&v183 count:1];
      id v131 = +[NSError errorWithDomain:IDSPeerIDManagerErrorDomain code:5 userInfo:v130];
    }
    else
    {
      id v131 = 0;
    }
    [(IDSIDStatusQueryController *)v164 _sendIDStatusChanges:v100 forService:*(void *)&v50 URI:v160 success:1 error:v131];
    if (v144) {
      v144[2]();
    }

    goto LABEL_205;
  }
LABEL_206:

  id v16 = v148;
LABEL_207:
}

- (void)requestIDStatusForIDs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 forceQuery:(BOOL)a9 bypassLimit:(BOOL)a10 reason:(id)a11 completionBlock:(id)a12
{
  BOOL v31 = a7;
  BOOL v32 = a8;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a11;
  id v21 = a12;
  [(IDSIDStatusQueryController *)self _loadIfNeeded];
  if (self->_allowProxyQueries) {
    goto LABEL_2;
  }
  if ([v19 length])
  {
    long long v22 = [v18 prefixedURI];
    id v23 = [v22 length];
    if (v17 && v23)
    {
      int v24 = [v18 prefixedURI];
      unsigned int v25 = [v24 isEqualToIgnoringCase:kIDSServiceDefaultsSentinelAlias];

      if (!v25) {
        goto LABEL_2;
      }
    }
    else
    {
    }
  }
  double v26 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v16;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, " => Bogus ID query for: %@   ignoring this request", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    MarcoLogMadridLevel();
    id v30 = v16;
    IMLogString();
    if (_IMWillLog())
    {
      id v30 = v16;
      _IMAlwaysLog();
    }
  }
  __int16 v27 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v18;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, " => From URI: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    MarcoLogMadridLevel();
    id v30 = v18;
    IMLogString();
    if (_IMWillLog())
    {
      id v30 = v18;
      _IMAlwaysLog();
    }
  }
  double v28 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v19;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, " => From Service: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    MarcoLogMadridLevel();
    id v30 = v19;
    IMLogString();
    if (_IMWillLog())
    {
      id v30 = v19;
      _IMAlwaysLog();
    }
  }
  if (!v17)
  {
    __int16 v29 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, " *** Missing identity, failing query", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
  }
  if (v21)
  {
    (*((void (**)(id, void, id, id, void, void))v21 + 2))(v21, 0, v18, v19, 0, 0);
    goto LABEL_3;
  }
LABEL_2:
  LOWORD(v30) = __PAIR16__(a10, a9);
  -[IDSIDStatusQueryController _lookupIDStatusForURIs:fromIdentity:fromURI:fromService:lightQuery:allowQuery:forceQuery:bypassLimit:reason:completionBlock:](self, "_lookupIDStatusForURIs:fromIdentity:fromURI:fromService:lightQuery:allowQuery:forceQuery:bypassLimit:reason:completionBlock:", v16, v17, v18, v19, v31, v32, v30, v20, v21);
LABEL_3:
}

- (void)requestIDStatusForID:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 reason:(id)a9 completionBlock:(id)a10
{
  BOOL v10 = a7;
  id v15 = a10;
  id v16 = a9;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  IMSingleObjectArray();
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  LOWORD(v20) = 0;
  -[IDSIDStatusQueryController requestIDStatusForIDs:fromIdentity:fromURI:fromService:lightQuery:allowQuery:forceQuery:bypassLimit:reason:completionBlock:](self, "requestIDStatusForIDs:fromIdentity:fromURI:fromService:lightQuery:allowQuery:forceQuery:bypassLimit:reason:completionBlock:", v21, v19, v18, v17, v10, v10, v20, v16, v15);
}

- (void)setCachedIDStatus:(unsigned int)a3 ForID:(id)a4 fromURI:(id)a5 fromService:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [(IDSIDStatusQueryController *)self _loadIfNeeded];
  id v13 = [v10 FZIDType];
  if ([v12 length]
    && ([v11 prefixedURI],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        id v15 = [v14 length],
        v14,
        v15))
  {
    if (sub_10029E170((unint64_t)v13, v10))
    {
      id v16 = objc_alloc_init((Class)NSMutableDictionary);
      id v17 = +[NSNumber numberWithUnsignedInt:v8];
      [v16 setObject:v17 forKey:v10];

      [(IDSIDStatusQueryController *)self _updateCacheWithStatusUpdates:v16 fromURI:v11 fromService:v12 success:1 hadError:0 negativeCacheHints:0];
      goto LABEL_25;
    }
    id v21 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, " => Bogus ID for: %@   ignoring this", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
LABEL_24:
      }
        _IMAlwaysLog();
    }
  }
  else
  {
    id v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, " => Bogus ID for: %@   ignoring this", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    id v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, " => From URI: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    uint64_t v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, " => From Service: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        goto LABEL_24;
      }
    }
  }
LABEL_25:
}

- (unsigned)cachedIDStatusForID:(id)a3 fromURI:(id)a4 fromService:(id)a5
{
  return [(IDSIDStatusQueryController *)self cachedIDStatusForID:a3 fromURI:a4 fromService:a5 respectExpiry:0];
}

- (unsigned)cachedIDStatusForID:(id)a3 fromURI:(id)a4 fromService:(id)a5 respectExpiry:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [(IDSIDStatusQueryController *)self _loadIfNeeded];
  id v13 = [v10 FZIDType];
  if (![v12 length]
    || ([v11 prefixedURI],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        id v15 = [v14 length],
        v14,
        !v15))
  {
    id v30 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v10;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, " => Bogus ID query for: %@   ignoring this", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    BOOL v31 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v11;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, " => From URI: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    BOOL v32 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v12;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, " => From Service: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    goto LABEL_25;
  }
  if (sub_10029E170((unint64_t)v13, v10))
  {
    uint64_t v16 = [(IDSIDStatusQueryController *)self _IDStatusForURI:v10 fromService:v12];
    uint64_t v17 = v16;
    if (v6 && v16)
    {
      id v18 = [(IDSIDStatusQueryController *)self _lookupDateForURI:v10 fromService:v12];
      id v19 = v18;
      if (v18)
      {
        [v18 doubleValue];
        double v21 = v20;
        [(IDSIDStatusDependencyProvider *)self->_dependencyProvider currentTime];
        double v23 = v22;
        int v24 = [(IDSIDStatusQueryController *)self _negativeTTLForURI:v10 fromService:v12];
        uint64_t v25 = [(IDSIDStatusQueryController *)self _validExpiryForURI:v10 fromService:v12];
        double v26 = (void *)v25;
        if (v24)
        {
          __int16 v27 = v24;
        }
        else
        {
          if (!v25 || !sub_1002A1C84())
          {
            double v35 = [(IDSIDStatusQueryController *)self peerIDManager];
            [v35 timeToCacheURI:v10 fromURI:v11 service:v12 forStatus:v17];
            double v29 = v36;

            goto LABEL_37;
          }
          __int16 v27 = v26;
        }
        [v27 doubleValue];
        double v29 = v28;
LABEL_37:
        double v37 = vabdd_f64(v23, v21);
        if (v37 < v29)
        {

          goto LABEL_32;
        }
        double v38 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          id v40 = v10;
          __int16 v41 = 2112;
          id v42 = v11;
          __int16 v43 = 2048;
          double v44 = v37;
          __int16 v45 = 2048;
          double v46 = v29;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, " => Expired status -- returning unknown {URI: %@, fromURI: %@, difference: %f, timeNeeded: %f}", buf, 0x2Au);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          MarcoLogMadridLevel();
          IMLogString();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
      }
LABEL_25:
      LODWORD(v17) = 0;
    }
  }
  else
  {
    double v33 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v10;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, " => Bogus ID query for: %@   ignoring this", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    LODWORD(v17) = 2;
  }
LABEL_32:

  return v17;
}

- (id)currentCache
{
  [(IDSIDStatusQueryController *)self _loadIfNeeded];
  id v25 = objc_alloc_init((Class)NSMutableDictionary);
  [(NSRecursiveLock *)self->_lock lock];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  double v20 = self;
  id obj = [(IDSIDStatusQueryController *)self idStatusCaches];
  id v23 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  id v3 = 0;
  id v4 = 0;
  if (v23)
  {
    uint64_t v22 = *(void *)v40;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v5;
        BOOL v6 = *(void **)(*((void *)&v39 + 1) + 8 * v5);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v28 = v6;
        id v27 = [v28 countByEnumeratingWithState:&v35 objects:v44 count:16];
        if (v27)
        {
          uint64_t v26 = *(void *)v36;
          do
          {
            uint64_t v7 = 0;
            uint64_t v8 = v4;
            do
            {
              if (*(void *)v36 != v26) {
                objc_enumerationMutation(v28);
              }
              uint64_t v29 = *(void *)(*((void *)&v35 + 1) + 8 * v7);
              uint64_t v30 = v7;
              id v9 = objc_msgSend(v28, "objectForKey:");

              id v4 = objc_alloc_init((Class)NSMutableDictionary);
              long long v33 = 0u;
              long long v34 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              id v3 = v9;
              id v10 = [v3 countByEnumeratingWithState:&v31 objects:v43 count:16];
              if (v10)
              {
                id v11 = v10;
                uint64_t v12 = *(void *)v32;
                do
                {
                  for (i = 0; i != v11; i = (char *)i + 1)
                  {
                    if (*(void *)v32 != v12) {
                      objc_enumerationMutation(v3);
                    }
                    uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * i);
                    id v15 = [v3 objectForKey:v14];
                    uint64_t v16 = [v15 objectForKey:@"IDStatus"];
                    id v17 = [v16 copy];

                    if (v17) {
                      [v4 setObject:v17 forKey:v14];
                    }
                  }
                  id v11 = [v3 countByEnumeratingWithState:&v31 objects:v43 count:16];
                }
                while (v11);
              }

              [v25 setObject:v4 forKey:v29];
              uint64_t v7 = v30 + 1;
              uint64_t v8 = v4;
            }
            while ((id)(v30 + 1) != v27);
            id v27 = [v28 countByEnumeratingWithState:&v35 objects:v44 count:16];
          }
          while (v27);
        }

        uint64_t v5 = v24 + 1;
      }
      while ((id)(v24 + 1) != v23);
      id v23 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v23);
  }

  [(NSRecursiveLock *)v20->_lock unlock];
  id v18 = v25;

  return v18;
}

- (id)currentCacheForService:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(IDSIDStatusQueryController *)self _loadIfNeeded];
    [(NSRecursiveLock *)self->_lock lock];
    id v19 = self;
    id v20 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v5 = [(IDSIDStatusQueryController *)self idStatusCacheForService:v4];
    id v21 = v4;
    BOOL v6 = [v5 objectForKey:v4];

    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v14 = [v8 objectForKey:v13];
          id v15 = [v14 objectForKey:@"IDStatus"];
          id v16 = [v15 copy];

          if (v16) {
            [v7 setObject:v16 forKey:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    id v17 = v20;
    id v4 = v21;
    [v20 setObject:v7 forKey:v21];
    [(NSRecursiveLock *)v19->_lock unlock];
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)remoteDevicesForIDs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 reason:(id)a9 completionBlock:(id)a10
{
  BOOL v33 = a7;
  BOOL v34 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  id v19 = a10;
  [(IDSIDStatusQueryController *)self _loadIfNeeded];
  if (!self->_allowProxyQueries)
  {
    if ([v17 length])
    {
      id v20 = [v16 prefixedURI];
      id v21 = [v20 length];
      if (v15 && v21)
      {
        long long v22 = [v16 prefixedURI];
        unsigned int v23 = [v22 isEqualToIgnoringCase:kIDSServiceDefaultsSentinelAlias];

        if (!v23) {
          goto LABEL_31;
        }
      }
      else
      {
      }
    }
    long long v24 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v14;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, " => Bogus ID query for: %@   ignoring this request", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      id v32 = v14;
      IMLogString();
      if (_IMWillLog())
      {
        id v32 = v14;
        _IMAlwaysLog();
      }
    }
    long long v25 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v16;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, " => From URI: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      id v32 = v16;
      IMLogString();
      if (_IMWillLog())
      {
        id v32 = v16;
        _IMAlwaysLog();
      }
    }
    uint64_t v26 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v17;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, " => From Service: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      id v32 = v17;
      IMLogString();
      if (_IMWillLog())
      {
        id v32 = v17;
        _IMAlwaysLog();
      }
    }
    if (!v15)
    {
      id v27 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, " *** Missing identity, failing query", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        IMLogString();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
    }
    if (v19) {
      (*((void (**)(id, void, id, id, void, void))v19 + 2))(v19, 0, v16, v17, 0, 0);
    }
  }
LABEL_31:
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1002A4630;
  v35[3] = &unk_100987BE0;
  v35[4] = self;
  id v36 = v14;
  id v37 = v17;
  id v38 = v16;
  id v39 = v19;
  id v28 = v19;
  id v29 = v16;
  id v30 = v17;
  id v31 = v14;
  LOWORD(v32) = 0;
  -[IDSIDStatusQueryController _lookupIDStatusForURIs:fromIdentity:fromURI:fromService:lightQuery:allowQuery:forceQuery:bypassLimit:reason:completionBlock:](self, "_lookupIDStatusForURIs:fromIdentity:fromURI:fromService:lightQuery:allowQuery:forceQuery:bypassLimit:reason:completionBlock:", v31, v15, v29, v30, v33, v34, v32, v18, v35);
}

- (void)infoForIDs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 infoType:(unint64_t)a7 infoOptions:(id)a8 lightQuery:(BOOL)a9 allowQuery:(BOOL)a10 reason:(id)a11 completion:(id)a12
{
  id v39 = a3;
  id v42 = a4;
  id v41 = a5;
  id v18 = a6;
  id v19 = a8;
  id v40 = a11;
  id v20 = a12;
  [(IDSIDStatusQueryController *)self _loadIfNeeded];
  id v21 = self;
  if (!self->_allowProxyQueries)
  {
    if ([v18 length])
    {
      long long v22 = [v41 prefixedURI];
      id v23 = [v22 length];
      if (v42 && v23)
      {
        long long v24 = [v41 prefixedURI];
        unsigned int v25 = [v24 isEqualToIgnoringCase:kIDSServiceDefaultsSentinelAlias];

        if (!v25) {
          goto LABEL_31;
        }
      }
      else
      {
      }
    }
    uint64_t v26 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v39;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, " => Bogus ID query for: %@   ignoring this request", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      id v35 = v39;
      IMLogString();
      if (_IMWillLog())
      {
        id v35 = v39;
        _IMAlwaysLog();
      }
    }
    id v27 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v41;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, " => From URI: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      id v35 = v41;
      IMLogString();
      if (_IMWillLog())
      {
        id v35 = v41;
        _IMAlwaysLog();
      }
    }
    id v28 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v18;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, " => From Service: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      id v35 = v18;
      IMLogString();
      if (_IMWillLog())
      {
        id v35 = v18;
        _IMAlwaysLog();
      }
    }
    if (!v42)
    {
      id v29 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, " *** Missing identity, failing query", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        IMLogString();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
    }
    if (v20) {
      (*((void (**)(id, void, id, id, void, void))v20 + 2))(v20, 0, v41, v18, 0, 0);
    }
  }
LABEL_31:
  unsigned __int8 v30 = objc_msgSend(v19, "forceRefresh", v35);
  unsigned __int8 v31 = [v19 bypassLimit];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1002A4DA0;
  v43[3] = &unk_100987C08;
  v43[4] = v21;
  id v44 = v39;
  id v45 = v18;
  id v46 = v41;
  id v48 = v20;
  unint64_t v49 = a7;
  id v47 = v19;
  id v38 = v20;
  id v37 = v19;
  id v32 = v41;
  id v33 = v18;
  id v34 = v39;
  BYTE1(v36) = v31;
  LOBYTE(v36) = v30;
  -[IDSIDStatusQueryController _lookupIDStatusForURIs:fromIdentity:fromURI:fromService:lightQuery:allowQuery:forceQuery:bypassLimit:reason:completionBlock:](v21, "_lookupIDStatusForURIs:fromIdentity:fromURI:fromService:lightQuery:allowQuery:forceQuery:bypassLimit:reason:completionBlock:", v34, v42, v32, v33, a9, a10, v36, v40, v43);
}

- (void)_sendIDStatusChanges:(id)a3 forService:(id)a4 URI:(id)a5 success:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v33 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v32 = v12;
  if ([v12 length]
    && ([v13 prefixedURI],
        id v15 = objc_claimAutoreleasedReturnValue(),
        id v16 = [v15 length],
        v15,
        v16))
  {
    id v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      CFStringRef v18 = @"NO";
      id v40 = v33;
      if (v8) {
        CFStringRef v18 = @"YES";
      }
      __int16 v41 = 2112;
      id v42 = v12;
      __int16 v43 = 2112;
      id v44 = v13;
      __int16 v45 = 2112;
      CFStringRef v46 = v18;
      __int16 v47 = 2112;
      id v48 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sending id status changes %@ for service %@ URI %@ success %@ error %@", buf, 0x34u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      id v19 = v8 ? @"YES" : @"NO";
      MarcoLogMadridLevel();
      unsigned __int8 v30 = v19;
      id v31 = v14;
      id v28 = v32;
      id v29 = v13;
      id v27 = v33;
      IMLogString();
      if (_IMWillLog())
      {
        unsigned __int8 v30 = v19;
        id v31 = v14;
        id v28 = v32;
        id v29 = v13;
        id v27 = v33;
        _IMAlwaysLog();
      }
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v20 = [(NSMutableDictionary *)self->_completionBlocks copy];
    id v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v21)
    {
      long long v22 = 0;
      uint64_t v23 = *(void *)v35;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v20);
          }
          unsigned int v25 = [(NSMutableDictionary *)self->_completionBlocks objectForKey:*(void *)(*((void *)&v34 + 1) + 8 * i)];

          long long v22 = v25;
          if (v25) {
            ((void (**)(void, id, id, void *, BOOL, id))v25)[2](v25, v33, v13, v32, v8, v14);
          }
        }
        id v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v21);
    }
  }
  else
  {
    uint64_t v26 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Empty service or URI to send ID status changes", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
  }
}

- (void)addCompletionBlock:(id)a3 forUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = [v6 copy];
      if (v8)
      {
        completionBlocks = self->_completionBlocks;
        if (!completionBlocks)
        {
          CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          uint64_t v11 = self->_completionBlocks;
          self->_completionBlocks = Mutable;

          completionBlocks = self->_completionBlocks;
        }
        id v12 = objc_retainBlock(v8);
        [(NSMutableDictionary *)completionBlocks setObject:v12 forKey:v7];
      }
      id v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = self->_completionBlocks;
        *(_DWORD *)buf = 138412546;
        id v18 = v7;
        __int16 v19 = 2112;
        id v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Completion block for uniqueID %@ added %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        IMLogString();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }

      goto LABEL_23;
    }
    id v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Empty completion block for uniqueID %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
LABEL_22:
      }
        _IMAlwaysLog();
    }
  }
  else
  {
    id v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Empty uniqueID %@ for adding completion block", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        goto LABEL_22;
      }
    }
  }
LABEL_23:
}

- (void)removeCompletionBlockForUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMutableDictionary *)self->_completionBlocks removeObjectForKey:v4];
    if (![(NSMutableDictionary *)self->_completionBlocks count])
    {
      completionBlocks = self->_completionBlocks;
      self->_completionBlocks = 0;
    }
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removed completion block for uniqueID %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
LABEL_13:
      }
        _IMAlwaysLog();
    }
  }
  else
  {
    id v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Empty uniqueID %@ for removing completion block", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        goto LABEL_13;
      }
    }
  }
}

- (void)clearCache
{
  v2 = im_primary_queue();
  dispatch_async(v2, self->_purgeCancelBlock);

  [(NSRecursiveLock *)self->_lock lock];
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "**** Forcing deleting of peer cache ****", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    MarcoLogMadridLevel();
    IMLogString();
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  [(IDSIDStatusQueryController *)self _loadIfNeeded];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(IDSIDStatusQueryController *)self idStatusCaches];
  id v4 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v4)
  {
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v5);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v7 = [v6 allKeys];
        id v8 = [v7 _copyForEnumerating];

        id v9 = [v8 countByEnumeratingWithState:&v18 objects:v27 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v19;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(v8);
              }
              uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v11);
              id v13 = +[NSDictionary dictionary];
              [v6 setObject:v13 forKey:v12];

              uint64_t v11 = (char *)v11 + 1;
            }
            while (v9 != v11);
            id v9 = [v8 countByEnumeratingWithState:&v18 objects:v27 count:16];
          }
          while (v9);
        }

        uint64_t v5 = (char *)v5 + 1;
      }
      while (v5 != v4);
      id v4 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v4);
  }

  id v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Forcing flush of peer cache", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    MarcoLogMadridLevel();
    IMLogString();
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  [(IDSIDStatusQueryController *)self _flush];
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_flush
{
  id v3 = im_primary_queue();
  dispatch_async(v3, self->_purgeCancelBlock);

  [(NSRecursiveLock *)self->_lock lock];
  self->_loaded = 0;
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Forcing save of peer cache", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    MarcoLogMadridLevel();
    IMLogString();
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  [(IDSIDStatusQueryController *)self _saveCache];
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Forcing flush of peer cache", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    MarcoLogMadridLevel();
    IMLogString();
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = [(IDSIDStatusQueryController *)self idStatusCaches];
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) removeAllObjects];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }

  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_setPurgeTimer
{
  id v3 = im_primary_queue();
  dispatch_async(v3, self->_purgeEnqueueBlock);
}

- (void)_loadIfNeeded
{
  [(NSRecursiveLock *)self->_lock lock];
  if (!self->_loaded)
  {
    self->_loaded = 1;
    [(IDSIDStatusQueryController *)self _loadCache];
  }
  [(NSRecursiveLock *)self->_lock unlock];

  [(IDSIDStatusQueryController *)self _setPurgeTimer];
}

- (void)_pruneExpiredStatusUnknownEntries
{
  id v28 = (NSMutableDictionary *)[(NSMutableDictionary *)self->_standardIDStatusCache mutableCopy];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v33 = self;
  id obj = self->_standardIDStatusCache;
  id v31 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v40;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(obj);
        }
        long long v34 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (([v34 isEqualToString:@"CacheVersion"] & 1) == 0)
          {
            id v29 = [(NSMutableDictionary *)v33->_standardIDStatusCache objectForKeyedSubscript:v34];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v3 = [v29 mutableCopy];
              long long v37 = 0u;
              long long v38 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              id v4 = v29;
              id v5 = [v4 countByEnumeratingWithState:&v35 objects:v47 count:16];
              if (v5)
              {
                uint64_t v6 = *(void *)v36;
                do
                {
                  for (j = 0; j != v5; j = (char *)j + 1)
                  {
                    if (*(void *)v36 != v6) {
                      objc_enumerationMutation(v4);
                    }
                    uint64_t v8 = *(void *)(*((void *)&v35 + 1) + 8 * (void)j);
                    id v9 = objc_msgSend(v4, "objectForKeyedSubscript:", v8, v25, v26);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v10 = [v9 objectForKeyedSubscript:@"IDStatus"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        if (![v10 intValue])
                        {
                          long long v11 = [v9 objectForKeyedSubscript:@"LookupDate"];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            [v11 doubleValue];
                            double v13 = v12;
                            [(IDSIDStatusDependencyProvider *)v33->_dependencyProvider currentTime];
                            double v15 = v14;
                            +[IDSBagUtilities timeToCacheResultsForIDStatus:0 forService:v34];
                            if (vabdd_f64(v15, v13) >= v16)
                            {
                              [v3 removeObjectForKey:v8];
                              uint64_t v17 = OSLogHandleForIDSCategory();
                              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 138412546;
                                uint64_t v44 = v8;
                                __int16 v45 = 2112;
                                CFStringRef v46 = v9;
                                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Removing entry with unknown status {URI: %@, URIDict: %@}", buf, 0x16u);
                              }

                              if (os_log_shim_legacy_logging_enabled())
                              {
                                MarcoLogMadridLevel();
                                uint64_t v25 = v8;
                                uint64_t v26 = v9;
                                IMLogString();
                                if (_IMWillLog())
                                {
                                  uint64_t v25 = v8;
                                  uint64_t v26 = v9;
                                  _IMAlwaysLog();
                                }
                              }
                            }
                          }
                          else
                          {
                            [v3 removeObjectForKey:v8];
                            long long v20 = OSLogHandleForIDSCategory();
                            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_WORD *)buf = 0;
                              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Corrupted entry in cache (lookUpDate). Removing entry", buf, 2u);
                            }

                            if (os_log_shim_legacy_logging_enabled())
                            {
                              MarcoLogMadridLevel();
                              IMLogString();
                              if (_IMWillLog()) {
                                _IMAlwaysLog();
                              }
                            }
                          }
                        }
                      }
                      else
                      {
                        [v3 removeObjectForKey:v8];
                        long long v19 = OSLogHandleForIDSCategory();
                        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Corrupted entry in cache (status). Removing entry", buf, 2u);
                        }

                        if (os_log_shim_legacy_logging_enabled())
                        {
                          MarcoLogMadridLevel();
                          IMLogString();
                          if (_IMWillLog()) {
                            _IMAlwaysLog();
                          }
                        }
                      }
                    }
                    else
                    {
                      [v3 removeObjectForKey:v8];
                      long long v18 = OSLogHandleForIDSCategory();
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Corrupted entry in cache (missing dict). Removing entry", buf, 2u);
                      }

                      if (os_log_shim_legacy_logging_enabled())
                      {
                        MarcoLogMadridLevel();
                        IMLogString();
                        if (_IMWillLog()) {
                          _IMAlwaysLog();
                        }
                      }
                    }
                  }
                  id v5 = [v4 countByEnumeratingWithState:&v35 objects:v47 count:16];
                }
                while (v5);
              }

              id v21 = [v3 copy];
              [(NSMutableDictionary *)v28 setObject:v21 forKeyedSubscript:v34];
            }
            else
            {
              [(NSMutableDictionary *)v28 removeObjectForKey:v34];
              long long v23 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Non-dict value in cache (service) -- Removing", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                MarcoLogMadridLevel();
                IMLogString();
                if (_IMWillLog()) {
                  _IMAlwaysLog();
                }
              }
            }
          }
        }
        else
        {
          [(NSMutableDictionary *)v28 removeObjectForKey:v34];
          long long v22 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Non-string key in cache (service) -- Removing", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            MarcoLogMadridLevel();
            IMLogString();
            if (_IMWillLog()) {
              _IMAlwaysLog();
            }
          }
        }
      }
      id v31 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v31);
  }

  standardIDStatusCache = v33->_standardIDStatusCache;
  v33->_standardIDStatusCache = v28;
}

- (id)_plistFilePath
{
  plistCachePath = self->_plistCachePath;
  if (plistCachePath)
  {
    id v3 = plistCachePath;
  }
  else
  {
    id v4 = NSHomeDirectory();
    v10[0] = v4;
    v10[1] = @"/Library/IdentityServices/";
    id v5 = +[NSArray arrayWithObjects:v10 count:2];
    uint64_t v6 = +[NSString pathWithComponents:v5];

    v9[0] = v6;
    v9[1] = @"idstatuscache.plist";
    id v7 = +[NSArray arrayWithObjects:v9 count:2];
    id v3 = +[NSString pathWithComponents:v7];
  }

  return v3;
}

- (void)_loadCache
{
  id v3 = [(IDSIDStatusQueryController *)self _plistFilePath];
  id v4 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v3];
  id v5 = [v4 valueForKey:@"CacheVersion"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (int)[v5 intValue] > 0)
  {
    if (v4) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v4 = [(IDSIDStatusQueryController *)self _loadLegacyCache];
  if (v4)
  {
    [(IDSIDStatusQueryController *)self _wipeLegacyCache];
LABEL_9:
    p_standardIDStatusCache = (id *)&self->_standardIDStatusCache;
    standardIDStatusCache = self->_standardIDStatusCache;
    if (standardIDStatusCache)
    {
      [(NSMutableDictionary *)standardIDStatusCache addEntriesFromDictionary:v4];
    }
    else
    {
      id v10 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v4];
      id v11 = *p_standardIDStatusCache;
      id *p_standardIDStatusCache = v10;
    }
    goto LABEL_15;
  }
  p_standardIDStatusCache = (id *)&self->_standardIDStatusCache;
  if (!self->_standardIDStatusCache)
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    id v9 = *p_standardIDStatusCache;
    id *p_standardIDStatusCache = v8;
  }
  id v4 = 0;
LABEL_15:
  [(IDSIDStatusQueryController *)self _pruneExpiredStatusUnknownEntries];
  double v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [*p_standardIDStatusCache count];
    *(_DWORD *)buf = 67109120;
    unsigned int v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Loaded cache: %d items", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    id v14 = [*p_standardIDStatusCache count];
    MarcoLogMadridLevel();
    id v15 = objc_msgSend(*p_standardIDStatusCache, "count", v14);
    IMLogString();
    if (_IMWillLog())
    {
      objc_msgSend(*p_standardIDStatusCache, "count", v15);
      _IMAlwaysLog();
    }
  }
}

- (id)_loadLegacyCache
{
  id v3 = [(IDSIDStatusQueryController *)self userDefaults];
  id v4 = [v3 copyKeyListForAppID:@"com.apple.identityservices.idstatuscache"];

  if (v4)
  {
    id v5 = [(IDSIDStatusQueryController *)self userDefaults];
    id v6 = [v5 copyValueForKey:@"CacheVersion" appID:@"com.apple.identityservices.idstatuscache"];

    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (int)[v6 intValue] >= 1)
    {
      id v7 = [(IDSIDStatusQueryController *)self userDefaults];
      id v8 = [v7 copyMultipleForCurrentKeys:v4 appID:@"com.apple.identityservices.idstatuscache"];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_wipeLegacyCache
{
  [(NSRecursiveLock *)self->_lock lock];
  id v3 = [(IDSIDStatusQueryController *)self userDefaults];
  id v4 = [v3 copyKeyListForAppID:@"com.apple.identityservices.idstatuscache"];

  if (v4)
  {
    id v5 = [(IDSIDStatusQueryController *)self userDefaults];
    [v5 setMultiple:0 remove:v4 appID:@"com.apple.identityservices.idstatuscache"];

    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished wipe of legacy cache", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      MarcoLogMadridLevel();
      IMLogString();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    id v7 = [(IDSIDStatusQueryController *)self userDefaults];
    [v7 synchronizeAppID:@"com.apple.identityservices.idstatuscache"];
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_saveCache
{
  [(NSRecursiveLock *)self->_lock lock];
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(NSMutableDictionary *)self->_standardIDStatusCache count];
    *(_DWORD *)buf = 67109120;
    unsigned int v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Saving cache: %d items", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    id v9 = [(NSMutableDictionary *)self->_standardIDStatusCache count];
    MarcoLogMadridLevel();
    id v8 = [(NSMutableDictionary *)self->_standardIDStatusCache count];
    IMLogString();
    if (_IMWillLog())
    {
      id v8 = [(NSMutableDictionary *)self->_standardIDStatusCache count];
      _IMAlwaysLog();
    }
  }
  id v6 = [(IDSIDStatusQueryController *)self _plistFilePath];
  id v7 = [(NSMutableDictionary *)self->_standardIDStatusCache mutableCopy];
  [v7 setObject:&off_1009D1AB8 forKey:@"CacheVersion"];
  [v7 writeToFile:v6 atomically:1];

  [(NSRecursiveLock *)self->_lock unlock];
}

- (id)idStatusCacheForService:(id)a3
{
  standardIDStatusCache = self->_standardIDStatusCache;
  if (!standardIDStatusCache)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v6 = self->_standardIDStatusCache;
    self->_standardIDStatusCache = Mutable;

    standardIDStatusCache = self->_standardIDStatusCache;
  }

  return standardIDStatusCache;
}

- (void)clearIDStatusCacheIfNeeded
{
  if (![(NSMutableDictionary *)self->_restrictedIDStatusCache count])
  {
    restrictedIDStatusCache = self->_restrictedIDStatusCache;
    self->_restrictedIDStatusCache = 0;
  }
  if (![(NSMutableDictionary *)self->_standardIDStatusCache count])
  {
    standardIDStatusCache = self->_standardIDStatusCache;
    self->_standardIDStatusCache = 0;
  }
}

- (id)idStatusCaches
{
  restrictedIDStatusCache = self->_restrictedIDStatusCache;
  if (self->_standardIDStatusCache)
  {
    if (restrictedIDStatusCache)
    {
      v9[0] = self->_standardIDStatusCache;
      v9[1] = restrictedIDStatusCache;
      p_standardIDStatusCache = (NSMutableDictionary **)v9;
      uint64_t v4 = 2;
LABEL_8:
      unsigned int v5 = +[NSArray arrayWithObjects:p_standardIDStatusCache count:v4];
      goto LABEL_9;
    }
    standardIDStatusCache = self->_standardIDStatusCache;
    p_standardIDStatusCache = &standardIDStatusCache;
LABEL_7:
    uint64_t v4 = 1;
    goto LABEL_8;
  }
  if (restrictedIDStatusCache)
  {
    id v7 = self->_restrictedIDStatusCache;
    p_standardIDStatusCache = &v7;
    goto LABEL_7;
  }
  unsigned int v5 = &__NSArray0__struct;
LABEL_9:

  return v5;
}

- (IDSPeerIDManager)peerIDManager
{
  return self->_peerIDManager;
}

- (void)setPeerIDManager:(id)a3
{
}

- (IMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (IDSIDStatusDependencyProvider)dependencyProvider
{
  return self->_dependencyProvider;
}

- (void)setDependencyProvider:(id)a3
{
}

- (NSString)plistCachePath
{
  return self->_plistCachePath;
}

- (void)setPlistCachePath:(id)a3
{
}

- (BOOL)allowProxyQueries
{
  return self->_allowProxyQueries;
}

- (void)setAllowProxyQueries:(BOOL)a3
{
  self->_allowProxyQueries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistCachePath, 0);
  objc_storeStrong((id *)&self->_dependencyProvider, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_peerIDManager, 0);
  objc_storeStrong((id *)&self->_reportedRateLimitedThisHour, 0);
  objc_storeStrong((id *)&self->_numQueriesThisHourByTopLevelService, 0);
  objc_storeStrong(&self->_purgeEnqueueBlock, 0);
  objc_storeStrong(&self->_purgeCancelBlock, 0);
  objc_storeStrong((id *)&self->_startQueryDateByTopLevelService, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_restrictedIDStatusCache, 0);
  objc_storeStrong((id *)&self->_standardIDStatusCache, 0);
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_purgeTimer, 0);
}

@end