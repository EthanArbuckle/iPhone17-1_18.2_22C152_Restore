@interface CDDaemonPurgeableResultCache
+ (id)defaultPath;
+ (id)fetchVolumeWithPath:(id)a3;
+ (id)pathForVersion:(unint64_t)a3;
+ (id)sharedPurgeableResultsCache;
+ (unint64_t)currentVersion;
- (BOOL)shouldUpdatePurgeable:(id)a3;
- (CDDaemonPurgeableResultCache)initWithPath:(id)a3;
- (CDDaemonRecentInfo)recentPurgeableResults;
- (NSString)path;
- (OS_dispatch_queue)queue;
- (id)copyInvalidServicesForVolume:(id)a3 atUrgency:(id)a4;
- (id)copyPushingServices;
- (id)diagnosticsForVolume:(id)a3 atUrgency:(int)a4;
- (id)emitRecentInfo:(id)a3;
- (id)updatedBlock;
- (id)updatedNotificationBlock;
- (void)absorbRecentInfo:(id)a3;
- (void)addInvalidVolume:(id)a3;
- (void)deductPurgeableAmount:(id)a3 serviceID:(id)a4 volume:(id)a5 urgency:(int)a6;
- (void)forgetPushingService:(id)a3;
- (void)invalidateRecentResultsForVolume:(id)a3;
- (void)keepUpToDate:(id)a3;
- (void)prune;
- (void)prunePreserving:(id)a3;
- (void)removeServiceInfo:(id)a3;
- (void)save:(id)a3;
- (void)setPath:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecentPurgeableResults:(id)a3;
- (void)setUpdateBlock:(id)a3;
- (void)setUpdateNotificationBlock:(id)a3;
- (void)setUpdatedBlock:(id)a3;
- (void)setUpdatedNotificationBlock:(id)a3;
- (void)updateInvalidVolumes;
- (void)updateRecentInfoForServiceID:(id)a3 volume:(id)a4 info:(id)a5;
- (void)updateRecentStateforVolume:(id)a3;
@end

@implementation CDDaemonPurgeableResultCache

void __73__CDDaemonPurgeableResultCache_updateRecentInfoForServiceID_volume_info___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) mutableCopy];
  v3 = [v2 objectForKeyedSubscript:@"CACHE_DELETE_PUSHED"];
  int v4 = evaluateBoolProperty();

  v5 = evaluatePurgeableUrgency();
  v6 = [v2 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  v7 = [v2 objectForKeyedSubscript:@"CACHE_DELETE_TIMESTAMP"];
  if (!*(void *)(a1 + 40))
  {
    obj = CDGetLogHandle();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v88 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_ERROR, "parameter error (volume). mInfo: %@", buf, 0xCu);
    }
    v10 = 0;
    goto LABEL_68;
  }
  v8 = &APFSContainerGetSpaceInfo_ptr;
  objc_opt_class();
  v75 = v7;
  if (objc_opt_isKindOfClass()) {
    [v7 doubleValue];
  }
  else {
    +[NSDate timeIntervalSinceReferenceDate];
  }
  double v11 = v9;
  int v74 = v4;
  if (!v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v101 = &off_1000616A8;
      v102 = v6;
      v12 = &v102;
      v13 = (void **)&v101;
LABEL_14:
      v14 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v13 count:1];
      goto LABEL_26;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v99 = v5;
      v100 = v6;
      v12 = &v100;
      v13 = &v99;
      goto LABEL_14;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = [*(id *)(a1 + 48) recentPurgeableResults];
    uint64_t v25 = *(void *)(a1 + 56);
    v26 = [*(id *)(a1 + 40) mountPoint];
    [v24 removeServiceInfo:v25 forVolume:v26];

    v23 = 0;
    goto LABEL_28;
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  obj = v6;
  id v15 = [obj countByEnumeratingWithState:&v83 objects:v98 count:16];
  if (!v15) {
    goto LABEL_25;
  }
  id v16 = v15;
  uint64_t v17 = *(void *)v84;
  while (2)
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v84 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(*((void *)&v83 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v57 = CDGetLogHandle();
        if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
LABEL_58:

          v10 = 0;
          goto LABEL_59;
        }
        *(_DWORD *)buf = 138412290;
        v88 = obj;
        v58 = "bad key in amounts dictionary: %@";
LABEL_70:
        _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, v58, buf, 0xCu);
        goto LABEL_58;
      }
      v20 = [obj objectForKeyedSubscript:v19];
      v21 = v8;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v57 = CDGetLogHandle();
        if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
          goto LABEL_58;
        }
        *(_DWORD *)buf = 138412290;
        v88 = obj;
        v58 = "bad value in amounts dictionary: %@";
        goto LABEL_70;
      }
      v8 = v21;
    }
    id v16 = [obj countByEnumeratingWithState:&v83 objects:v98 count:16];
    int v4 = v74;
    if (v16) {
      continue;
    }
    break;
  }
LABEL_25:

  v14 = obj;
LABEL_26:
  v23 = v14;
LABEL_28:
  obj = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
  if (!obj)
  {
    v27 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CACHE_DELETE_NONPURGEABLE_AMOUNT"];
    obj = evaluateNumberProperty();
  }
  v72 = v5;
  v28 = CDGetLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    v68 = *(NSObject **)(a1 + 56);
    uint64_t v69 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v88 = v68;
    __int16 v89 = 2112;
    uint64_t v90 = v69;
    __int16 v91 = 2112;
    v92 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Updating cache for service: %@, volume: %@, amounts: %@", buf, 0x20u);
  }
  v71 = v6;
  v73 = v2;

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v10 = v23;
  id v29 = [v10 countByEnumeratingWithState:&v79 objects:v97 count:16];
  if (v29)
  {
    id v30 = v29;
    char v31 = 0;
    v32 = "FALSE";
    if (v4) {
      v32 = "TRUE";
    }
    v76 = v32;
    uint64_t v77 = *(void *)v80;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v80 != v77) {
          objc_enumerationMutation(v10);
        }
        v34 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
        v35 = v10;
        v36 = [v10 objectForKeyedSubscript:v34];
        v37 = CDGetLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v38 = *(void *)(a1 + 56);
          v39 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
          *(_DWORD *)buf = 138413314;
          v88 = v36;
          __int16 v89 = 2112;
          uint64_t v90 = v38;
          __int16 v91 = 2112;
          v92 = v39;
          __int16 v93 = 2112;
          v94 = v34;
          __int16 v95 = 2080;
          v96 = v76;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Updating service info amount: %@, serviceID: %@ (%@), urgency: %@, pushed: %s", buf, 0x34u);
        }
        v40 = [*(id *)(a1 + 48) recentPurgeableResults];
        uint64_t v41 = *(void *)(a1 + 56);
        v42 = [*(id *)(a1 + 40) mountPoint];
        unsigned __int8 v43 = objc_msgSend(v40, "updateServiceInfoAmount:forService:onVolume:atUrgency:withTimestamp:nonPurgeableAmount:deductFromCurrentAmount:info:", v36, v41, v42, objc_msgSend(v34, "intValue"), obj, 0, v11, *(void *)(a1 + 32));

        v31 |= v43;
        v10 = v35;
      }
      id v30 = [v35 countByEnumeratingWithState:&v79 objects:v97 count:16];
    }
    while (v30);
  }
  else
  {
    char v31 = 0;
  }

  if (v74)
  {
    v44 = [*(id *)(a1 + 48) recentPurgeableResults];
    v45 = [v44 pushingServices];
    [v45 addObject:*(void *)(a1 + 56)];
  }
  v5 = v72;
  v2 = v73;
  v6 = v71;
  if ((v31 & 1) != 0
    && ([*(id *)(a1 + 48) updatedNotificationBlock],
        v46 = objc_claimAutoreleasedReturnValue(),
        v46,
        v46))
  {
    v70 = v10;
    if (qword_10006A860 != -1) {
      dispatch_once(&qword_10006A860, &__block_literal_global_81);
    }
    v47 = (void *)qword_10006A858;
    v48 = [*(id *)(a1 + 40) mountPoint];
    v49 = [v47 objectForKeyedSubscript:v48];
    v50 = evaluateNumberProperty();

    if (v50)
    {
      v51 = [*(id *)(a1 + 40) thresholds];
      v52 = [v51 objectForKeyedSubscript:@"VERY_LOW_DISK_THRESHOLD"];
      evaluateNumberProperty();
      v53 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

      id v54 = [v50 unsignedLongLongValue];
      if (v54 <= [*(id *)(a1 + 40) freespace])
      {
        v55 = [*(id *)(a1 + 40) freespace];
        v56 = [v50 unsignedLongLongValue];
      }
      else
      {
        v55 = [v50 unsignedLongLongValue];
        v56 = [*(id *)(a1 + 40) freespace];
      }
      unint64_t v62 = v55 - v56;
      if (v53 && (unint64_t)[v53 unsignedLongLongValue] >> 22 <= 0x18) {
        unint64_t v63 = (unint64_t)[v53 unsignedLongLongValue];
      }
      else {
        unint64_t v63 = 104857600;
      }
      if (v62 > v63)
      {
        v64 = [*(id *)(a1 + 48) updatedNotificationBlock];
        v64[2](v64, 1);

        v65 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(a1 + 40) freespace]);
        v66 = (void *)qword_10006A858;
        v67 = [*(id *)(a1 + 40) mountPoint];
        [v66 setObject:v65 forKeyedSubscript:v67];
      }
    }
    else
    {
      v59 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(a1 + 40) freespace]);
      v60 = (void *)qword_10006A858;
      v61 = [*(id *)(a1 + 40) mountPoint];
      [v60 setObject:v59 forKeyedSubscript:v61];

      v53 = [*(id *)(a1 + 48) updatedNotificationBlock];
      v53[2](v53, 1);
    }
    v7 = v75;
    v10 = v70;
  }
  else
  {
LABEL_59:
    v7 = v75;
  }
LABEL_68:
}

- (CDDaemonRecentInfo)recentPurgeableResults
{
  return self->_recentPurgeableResults;
}

- (void)updateRecentInfoForServiceID:(id)a3 volume:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(CDDaemonPurgeableResultCache *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __73__CDDaemonPurgeableResultCache_updateRecentInfoForServiceID_volume_info___block_invoke;
  v15[3] = &unk_10005D748;
  id v16 = v10;
  id v17 = v9;
  v18 = self;
  id v19 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __54__CDDaemonPurgeableResultCache_shouldUpdatePurgeable___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = CDGetLogHandle();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_DWORD *)buf = 67109120;
      int v54 = 201;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%d shouldUpdatePurgeable", buf, 8u);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v5 = getLocalVolumes();
    id v6 = [v5 countByEnumeratingWithState:&v48 objects:v58 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v49;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v49 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = +[CacheDeleteDaemonVolume volumeWithMountpoint:*(void *)(*((void *)&v48 + 1) + 8 * i)];
          if (v10) {
            [*(id *)(a1 + 32) addObject:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v48 objects:v58 count:16];
      }
      while (v7);
    }
  }
  else
  {
    if (v4)
    {
      *(_DWORD *)buf = 67109120;
      int v54 = 210;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%d shouldUpdatePurgeable", buf, 8u);
    }

    double v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
    v5 = evaluateStringProperty();

    if (v5)
    {
      id v12 = CDGetLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v54 = 213;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%d shouldUpdatePurgeable", buf, 8u);
      }

      id v13 = +[CacheDeleteDaemonVolume volumeWithMountpoint:v5];
      id v14 = v13;
      if (v13)
      {
        id v15 = *(void **)(a1 + 32);
        id v16 = [v13 siblings];
        [v15 addObjectsFromArray:v16];
      }
    }
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = *(id *)(a1 + 32);
  id v17 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v43 = *(void *)v45;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v45 != v43) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
        if (v20)
        {
          v21 = evaluatePurgeableUrgency();
          v22 = [v20 mountPoint];
          v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%d", v22, [v21 intValue]);

          v24 = [(id)qword_10006A840 objectForKeyedSubscript:v23];
          uint64_t v25 = CDGetLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            int v54 = 227;
            __int16 v55 = 2112;
            v56 = v23;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%d shouldUpdatePurgeable %@", buf, 0x12u);
          }

          v26 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_NO_CACHE"];
          int v27 = evaluateBoolProperty();

          if (v27)
          {
            v28 = CDGetLogHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              int v54 = 229;
              id v29 = v28;
              goto LABEL_40;
            }
            goto LABEL_41;
          }
          if (v24)
          {
            id v30 = [v24 objectAtIndexedSubscript:0];
            id v31 = [v30 unsignedLongLongValue];

            v32 = [v24 objectAtIndexedSubscript:1];
            [v32 doubleValue];
            v33 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

            if (v31)
            {
              if ([v20 freespaceIsStale:v31])
              {
                v34 = CDGetLogHandle();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  int v54 = 239;
                  v35 = v34;
                  goto LABEL_47;
                }
LABEL_48:

                *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_49:
                v36 = CDGetLogHandle();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  int v54 = 245;
                  _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%d shouldUpdatePurgeable", buf, 8u);
                }

LABEL_52:
                if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
                {
                  v37 = CDGetLogHandle();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109378;
                    int v54 = 252;
                    __int16 v55 = 2112;
                    v56 = v23;
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%d shouldUpdatePurgeable %@", buf, 0x12u);
                  }

                  uint64_t v38 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v20 freespace]);
                  v52[0] = v38;
                  v39 = +[NSDate date];
                  [v39 timeIntervalSinceReferenceDate];
                  v40 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                  v52[1] = v40;
                  uint64_t v41 = +[NSArray arrayWithObjects:v52 count:2];
                  [(id)qword_10006A840 setObject:v41 forKeyedSubscript:v23];
                }
                continue;
              }
              if (validateTimestamp()) {
                goto LABEL_49;
              }
              v34 = CDGetLogHandle();
              if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_48;
              }
              *(_DWORD *)buf = 67109120;
              int v54 = 242;
              v35 = v34;
            }
            else
            {
              v34 = CDGetLogHandle();
              if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_48;
              }
              *(_DWORD *)buf = 67109120;
              int v54 = 236;
              v35 = v34;
            }
LABEL_47:
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%d shouldUpdatePurgeable", buf, 8u);
            goto LABEL_48;
          }
          v28 = CDGetLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v54 = 247;
            id v29 = v28;
LABEL_40:
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%d shouldUpdatePurgeable", buf, 8u);
          }
LABEL_41:

          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          goto LABEL_52;
        }
      }
      id v18 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
    }
    while (v18);
  }
}

- (id)emitRecentInfo:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__1;
  id v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  v5 = CDGetLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "emitRecentInfo ENTRY, info: %@", buf, 0xCu);
  }

  if ([(CDDaemonPurgeableResultCache *)self shouldUpdatePurgeable:v4])
  {
    id v6 = CDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "emitRecentInfo shouldUpdatePurgeable", buf, 2u);
    }

    [(CDDaemonPurgeableResultCache *)self keepUpToDate:v4];
  }
  id v7 = [(CDDaemonPurgeableResultCache *)self queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __47__CDDaemonPurgeableResultCache_emitRecentInfo___block_invoke;
  v12[3] = &unk_10005CD78;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(v7, v12);

  uint64_t v8 = CDGetLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)v14[5];
    *(_DWORD *)buf = 138412290;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "emitRecentInfo EXIT, result: %@", buf, 0xCu);
  }

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (BOOL)shouldUpdatePurgeable:(id)a3
{
  id v3 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  id v4 = [v3 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_PURGEABLE"];
  char v5 = evaluateBoolProperty();

  id v6 = objc_opt_new();
  id v7 = CDGetLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v25 = 192;
    __int16 v26 = 2112;
    int v27 = (const char *)v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%d shouldUpdatePurgeable ENTRY, info: %@", buf, 0x12u);
  }

  if (qword_10006A850 != -1) {
    dispatch_once(&qword_10006A850, &__block_literal_global_41);
  }
  uint64_t v8 = qword_10006A848;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __54__CDDaemonPurgeableResultCache_shouldUpdatePurgeable___block_invoke_2;
  v15[3] = &unk_10005D700;
  char v19 = v5;
  id v9 = v6;
  id v16 = v9;
  id v10 = v3;
  id v17 = v10;
  id v18 = &v20;
  dispatch_sync(v8, v15);
  double v11 = CDGetLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (*((unsigned char *)v21 + 24)) {
      id v12 = "YES";
    }
    else {
      id v12 = "NO";
    }
    *(_DWORD *)buf = 67109378;
    int v25 = 259;
    __int16 v26 = 2080;
    int v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%d shouldUpdatePurgeable EXIT, result: %s", buf, 0x12u);
  }

  BOOL v13 = *((unsigned char *)v21 + 24) != 0;
  _Block_object_dispose(&v20, 8);

  return v13;
}

void __52__CDDaemonPurgeableResultCache_updateInvalidVolumes__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) recentPurgeableResults];
  [v1 updateInvalidVolumes];
}

- (void)updateInvalidVolumes
{
  id v3 = [(CDDaemonPurgeableResultCache *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __52__CDDaemonPurgeableResultCache_updateInvalidVolumes__block_invoke;
  block[3] = &unk_10005CD00;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (id)copyPushingServices
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__1;
  double v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  id v3 = [(CDDaemonPurgeableResultCache *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __51__CDDaemonPurgeableResultCache_copyPushingServices__block_invoke;
  v6[3] = &unk_10005CD78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)keepUpToDate:(id)a3
{
  id v4 = a3;
  char v5 = [(CDDaemonPurgeableResultCache *)self updatedBlock];

  if (v5)
  {
    uint64_t v6 = [(CDDaemonPurgeableResultCache *)self updatedBlock];
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
  }
  else
  {
    uint64_t v6 = CDGetLogHandle();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_ERROR, "keepUpToDate: no updateBlock.", v7, 2u);
    }
  }
}

- (id)updatedBlock
{
  return self->_updatedBlock;
}

void __47__CDDaemonPurgeableResultCache_emitRecentInfo___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc((Class)CDRecentInfo);
  id v6 = [*(id *)(a1 + 32) recentPurgeableResults];
  id v3 = [v2 initWithRecentInfo:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __51__CDDaemonPurgeableResultCache_copyPushingServices__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) recentPurgeableResults];
  id v2 = [v5 copyPushingServices];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (unint64_t)currentVersion
{
  return 2;
}

+ (id)pathForVersion:(unint64_t)a3
{
  if (a3 >= 2)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"_v%lu", a3];
  }
  else
  {
    uint64_t v3 = &stru_1000601A0;
  }
  uint64_t v4 = +[NSString localizedStringWithFormat:@"%@%@", @"CacheDeleteDaemonRecentInfo", v3];

  return v4;
}

+ (id)defaultPath
{
  uint64_t v3 = cdCachesPath();
  uint64_t v4 = [a1 pathForVersion:2];
  id v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

+ (id)sharedPurgeableResultsCache
{
  if (qword_10006A838 != -1) {
    dispatch_once(&qword_10006A838, &__block_literal_global_3);
  }
  id v2 = (void *)_MergedGlobals_1;
  return v2;
}

void __59__CDDaemonPurgeableResultCache_sharedPurgeableResultsCache__block_invoke(id a1)
{
  id v1 = [CDDaemonPurgeableResultCache alloc];
  id v4 = +[CDDaemonPurgeableResultCache defaultPath];
  id v2 = [(CDDaemonPurgeableResultCache *)v1 initWithPath:v4];
  uint64_t v3 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v2;
}

- (CDDaemonPurgeableResultCache)initWithPath:(id)a3
{
  long long v51 = (__CFString *)a3;
  v54.receiver = self;
  v54.super_class = (Class)CDDaemonPurgeableResultCache;
  id v4 = [(CDDaemonPurgeableResultCache *)&v54 init];
  id v5 = v4;
  if (!v4) {
    goto LABEL_31;
  }
  [(CDDaemonPurgeableResultCache *)v4 setPath:v51];
  id v6 = [(CDDaemonPurgeableResultCache *)v5 path];

  if (!v6)
  {
    uint64_t v8 = 0;
    long long v50 = 0;
    goto LABEL_21;
  }
  uint64_t v7 = [(CDDaemonPurgeableResultCache *)v5 path];
  id v53 = 0;
  long long v50 = +[NSData dataWithContentsOfFile:v7 options:1 error:&v53];
  uint64_t v8 = (__CFString *)v53;

  if (!v50 || v8)
  {
LABEL_21:
    NSErrorDomain v28 = [(__CFString *)v8 domain];
    NSErrorDomain v29 = v28;
    if (v28 == NSPOSIXErrorDomain)
    {
      BOOL v30 = [(__CFString *)v8 code] == (id)2;

      if (v30) {
        goto LABEL_28;
      }
    }
    else
    {
    }
    id v31 = CDGetLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v40 = [(__CFString *)v8 description];
      *(_DWORD *)buf = 138412546;
      CFStringRef v56 = v51;
      __int16 v57 = 2112;
      v58 = v40;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Unable to make data from %@ : %@", buf, 0x16u);
    }
    goto LABEL_27;
  }
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  objc_opt_class();
  id v52 = 0;
  id v16 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v15 fromData:v50 error:&v52];
  uint64_t v8 = (__CFString *)v52;
  [(CDDaemonPurgeableResultCache *)v5 setRecentPurgeableResults:v16];

  id v17 = [(CDDaemonPurgeableResultCache *)v5 recentPurgeableResults];
  if (v17) {
    BOOL v18 = v8 == 0;
  }
  else {
    BOOL v18 = 0;
  }
  int v19 = !v18;

  if (v19)
  {
    uint64_t v20 = CDGetLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v41 = @"No error information available";
      if (v8) {
        CFStringRef v41 = v8;
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v56 = v41;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "NSKeyedUnarchiver unarchivedObjectOfClass failed to unarchive recent purgeable results: %@", buf, 0xCu);
    }
  }
  v21 = [(CDDaemonPurgeableResultCache *)v5 recentPurgeableResults];

  if (!v21) {
    goto LABEL_28;
  }
  uint64_t v22 = [(CDDaemonPurgeableResultCache *)v5 recentPurgeableResults];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v27 = CDGetLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v42 = [(CDDaemonPurgeableResultCache *)v5 recentPurgeableResults];
      uint64_t v43 = (__CFString *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      CFStringRef v56 = v43;
      long long v44 = v43;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "result is not of class (or subclass) CacheDeleteRecentInfo: %@", buf, 0xCu);
    }
    goto LABEL_19;
  }
  v24 = [(CDDaemonPurgeableResultCache *)v5 recentPurgeableResults];
  int v25 = [v24 version];
  unsigned __int8 v26 = [v25 isEqualToNumber:&off_100061690];

  if ((v26 & 1) == 0)
  {
    int v27 = CDGetLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      long long v45 = [(CDDaemonPurgeableResultCache *)v5 recentPurgeableResults];
      long long v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      long long v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
      long long v48 = [(CDDaemonPurgeableResultCache *)v5 recentPurgeableResults];
      long long v49 = [v48 version];
      *(_DWORD *)buf = 138412802;
      CFStringRef v56 = v47;
      __int16 v57 = 2112;
      v58 = v49;
      __int16 v59 = 1024;
      int v60 = 2;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "unarchived version of %@ (%@) is incompatible with current version (%d)", buf, 0x1Cu);
    }
LABEL_19:

    [(CDDaemonPurgeableResultCache *)v5 setRecentPurgeableResults:0];
LABEL_27:
    unlink((const char *)[(__CFString *)v51 fileSystemRepresentation]);
  }
LABEL_28:
  v32 = [(CDDaemonPurgeableResultCache *)v5 recentPurgeableResults];
  BOOL v33 = v32 == 0;

  if (v33)
  {
    v34 = +[CDDaemonRecentInfo recentInfoForVolumes:&__NSDictionary0__struct];
    [(CDDaemonPurgeableResultCache *)v5 setRecentPurgeableResults:v34];
  }
  v35 = (objc_class *)objc_opt_class();
  NSStringFromClass(v35);
  id v36 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v37 = dispatch_queue_create((const char *)[v36 UTF8String], 0);
  [(CDDaemonPurgeableResultCache *)v5 setQueue:v37];

  uint64_t v38 = v5;
LABEL_31:

  return v5;
}

- (void)save:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = [(CDDaemonPurgeableResultCache *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __37__CDDaemonPurgeableResultCache_save___block_invoke;
  block[3] = &unk_10005D148;
  id v10 = v5;
  uint64_t v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __37__CDDaemonPurgeableResultCache_save___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) recentPurgeableResults];
  uint64_t v3 = +[NSKeyedArchiver archivedDataWithRootObject:v2 requiringSecureCoding:1 error:0];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) path];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) path];
      id v11 = 0;
      unsigned __int8 v6 = [v3 writeToFile:v5 options:0 error:&v11];
      id v4 = v11;

      if ((v6 & 1) == 0)
      {
        id v7 = CDGetLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          id v10 = [*(id *)(a1 + 40) path];
          *(_DWORD *)buf = 138412546;
          uint64_t v13 = v10;
          __int16 v14 = 2112;
          uint64_t v15 = v4;
          _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "unable to write results to cache file: %@: %@", buf, 0x16u);
        }
      }
      uint64_t v8 = *(void *)(a1 + 48);
      if (v8) {
        (*(void (**)(void))(v8 + 16))();
      }
    }
  }
  else
  {
    id v4 = CDGetLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [*(id *)(a1 + 40) recentPurgeableResults];
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to create data from: %@", buf, 0xCu);
    }
  }
}

- (void)prune
{
}

- (void)absorbRecentInfo:(id)a3
{
}

void __54__CDDaemonPurgeableResultCache_shouldUpdatePurgeable___block_invoke(id a1)
{
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)qword_10006A840;
  qword_10006A840 = v1;

  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.cache_delete.shouldUpdatePurgeable", v5);
  id v4 = (void *)qword_10006A848;
  qword_10006A848 = (uint64_t)v3;
}

+ (id)fetchVolumeWithPath:(id)a3
{
  return +[CacheDeleteDaemonVolume volumeWithPath:a3];
}

- (void)addInvalidVolume:(id)a3
{
  id v4 = a3;
  id v5 = [(CDDaemonPurgeableResultCache *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __49__CDDaemonPurgeableResultCache_addInvalidVolume___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __49__CDDaemonPurgeableResultCache_addInvalidVolume___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recentPurgeableResults];
  [v2 addInvalidVolume:*(void *)(a1 + 40)];
}

- (id)diagnosticsForVolume:(id)a3 atUrgency:(int)a4
{
  return 0;
}

void __73__CDDaemonPurgeableResultCache_updateRecentInfoForServiceID_volume_info___block_invoke_79(id a1)
{
  qword_10006A858 = objc_opt_new();
  _objc_release_x1();
}

- (void)deductPurgeableAmount:(id)a3 serviceID:(id)a4 volume:(id)a5 urgency:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(CDDaemonPurgeableResultCache *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __79__CDDaemonPurgeableResultCache_deductPurgeableAmount_serviceID_volume_urgency___block_invoke;
  block[3] = &unk_10005D770;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  int v21 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __79__CDDaemonPurgeableResultCache_deductPurgeableAmount_serviceID_volume_urgency___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) recentPurgeableResults];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 56) mountPoint];
  uint64_t v5 = *(unsigned int *)(a1 + 64);
  +[NSDate timeIntervalSinceReferenceDate];
  objc_msgSend(v6, "updateServiceInfoAmount:forService:onVolume:atUrgency:withTimestamp:nonPurgeableAmount:deductFromCurrentAmount:info:", v2, v3, v4, v5, 0, 1, 0);
}

- (void)removeServiceInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CDDaemonPurgeableResultCache *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __50__CDDaemonPurgeableResultCache_removeServiceInfo___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__CDDaemonPurgeableResultCache_removeServiceInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) recentPurgeableResults];
  [v2 removeServiceInfo:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) updatedNotificationBlock];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) updatedNotificationBlock];
    v4[2](v4, 0);
  }
}

- (void)updateRecentStateforVolume:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 state];
    id v7 = [(CDDaemonPurgeableResultCache *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __59__CDDaemonPurgeableResultCache_updateRecentStateforVolume___block_invoke;
    block[3] = &unk_10005CF68;
    id v9 = v5;
    id v10 = self;
    id v11 = v6;
    dispatch_sync(v7, block);
  }
}

void __59__CDDaemonPurgeableResultCache_updateRecentStateforVolume___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) mountPoint];
  BOOL v3 = [*(id *)(a1 + 32) validate] == 0;
  uint64_t v2 = v8;
  BOOL v3 = v3 || v8 == 0;
  if (!v3)
  {
    id v4 = [*(id *)(a1 + 40) recentPurgeableResults];
    unsigned int v5 = [v4 updateRecentState:*(void *)(a1 + 48) forVolume:v8];

    uint64_t v2 = v8;
    if (v5)
    {
      id v6 = [*(id *)(a1 + 40) updatedNotificationBlock];

      uint64_t v2 = v8;
      if (v6)
      {
        id v7 = [*(id *)(a1 + 40) updatedNotificationBlock];
        v7[2](v7, 0);

        uint64_t v2 = v8;
      }
    }
  }
}

- (void)prunePreserving:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CDDaemonPurgeableResultCache *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __48__CDDaemonPurgeableResultCache_prunePreserving___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__CDDaemonPurgeableResultCache_prunePreserving___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) recentPurgeableResults];
  [v2 prunePreserving:*(void *)(a1 + 40)];

  BOOL v3 = [*(id *)(a1 + 32) updatedNotificationBlock];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) updatedNotificationBlock];
    v4[2](v4, 0);
  }
}

- (void)forgetPushingService:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CDDaemonPurgeableResultCache *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __53__CDDaemonPurgeableResultCache_forgetPushingService___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__CDDaemonPurgeableResultCache_forgetPushingService___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) recentPurgeableResults];
  uint64_t v2 = [v3 pushingServices];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)invalidateRecentResultsForVolume:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CDDaemonPurgeableResultCache *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __65__CDDaemonPurgeableResultCache_invalidateRecentResultsForVolume___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__CDDaemonPurgeableResultCache_invalidateRecentResultsForVolume___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) recentPurgeableResults];
  uint64_t v2 = [*(id *)(a1 + 40) mountPoint];
  [v3 invalidateForVolume:v2];
}

- (id)copyInvalidServicesForVolume:(id)a3 atUrgency:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__1;
  int v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  id v8 = [(CDDaemonPurgeableResultCache *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __71__CDDaemonPurgeableResultCache_copyInvalidServicesForVolume_atUrgency___block_invoke;
  v13[3] = &unk_10005D798;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __71__CDDaemonPurgeableResultCache_copyInvalidServicesForVolume_atUrgency___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) recentPurgeableResults];
  uint64_t v2 = [*(id *)(a1 + 40) mountPoint];
  id v3 = objc_msgSend(v6, "copyInvalidsForVolume:atUrgency:", v2, objc_msgSend(*(id *)(a1 + 48), "intValue"));
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  unsigned int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setUpdateNotificationBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CDDaemonPurgeableResultCache *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __59__CDDaemonPurgeableResultCache_setUpdateNotificationBlock___block_invoke;
  v7[3] = &unk_10005D1C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __59__CDDaemonPurgeableResultCache_setUpdateNotificationBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUpdatedNotificationBlock:*(void *)(a1 + 40)];
}

- (void)setUpdateBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CDDaemonPurgeableResultCache *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __47__CDDaemonPurgeableResultCache_setUpdateBlock___block_invoke;
  v7[3] = &unk_10005D1C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __47__CDDaemonPurgeableResultCache_setUpdateBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUpdatedBlock:*(void *)(a1 + 40)];
}

- (void)setRecentPurgeableResults:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (id)updatedNotificationBlock
{
  return self->_updatedNotificationBlock;
}

- (void)setUpdatedNotificationBlock:(id)a3
{
}

- (void)setUpdatedBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updatedBlock, 0);
  objc_storeStrong(&self->_updatedNotificationBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_recentPurgeableResults, 0);
}

@end