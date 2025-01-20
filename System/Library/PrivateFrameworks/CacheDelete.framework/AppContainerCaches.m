@interface AppContainerCaches
+ (BOOL)supportsSecureCoding;
+ (id)appContainerCachesWithInfo:(id)a3;
+ (id)deleteAppCaches:(id)a3 telemetry:(id)a4;
- (AppContainerCaches)initWithCoder:(id)a3;
- (AppContainerCaches)initWithInfo:(id)a3;
- (BOOL)multi_user;
- (NSDictionary)info;
- (NSMutableDictionary)cachesByVolume;
- (NSMutableDictionary)cdVolumes;
- (OS_dispatch_queue)collection_queue;
- (OS_dispatch_queue)purge_queue;
- (OperationState)opState;
- (id)appCache:(id)a3 forPath:(id)a4;
- (id)cachesForInstalledApps:(BOOL)a3 bytesNeeded:(unint64_t)a4 volume:(id)a5 sortForUrgency:(int)a6 telemetry:(id)a7;
- (id)cdVolumeForPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initReadOnlyCopy;
- (id)mountPointForPath:(id)a3;
- (unint64_t)processContainerCachesForVolume:(id)a3 bytesNeeded:(unint64_t)a4 urgency:(int)a5 calculate:(BOOL)a6 verbose:(BOOL)a7 telemetry:(id)a8;
- (void)_serviceCallback:(id)a3 replyBlock:(id)a4;
- (void)_serviceCancelPurge:(id)a3;
- (void)_serviceNotify:(id)a3 replyBlock:(id)a4;
- (void)_servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)_servicePing:(id)a3;
- (void)_servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)_servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setCachesByVolume:(id)a3;
- (void)setCdVolumes:(id)a3;
- (void)setCollection_queue:(id)a3;
- (void)setInfo:(id)a3;
- (void)setMulti_user:(BOOL)a3;
- (void)setOpState:(id)a3;
- (void)setPurge_queue:(id)a3;
@end

@implementation AppContainerCaches

uint64_t __89__AppContainerCaches_cachesForInstalledApps_bytesNeeded_volume_sortForUrgency_telemetry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (char *)[v3 caches:*(unsigned __int8 *)(a1 + 76) purge:0];
  v32 = &v4[(void)[v3 tmp:*(unsigned __int8 *)(a1 + 76) purge:0 all:*(_DWORD *)(a1 + 72) == 4]];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = [v3 bundleRecords];
  id v33 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v43;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v43 != v31) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v42 + 1) + 8 * v5);
        if (v32)
        {
          v7 = *(void **)(a1 + 32);
          v8 = [*(id *)(*((void *)&v42 + 1) + 8 * v5) bundleIdentifier];
          v9 = [v7 objectForKeyedSubscript:v8];

          if (v9)
          {
            v10 = [v3 lastUsed];
            v11 = *(void **)(a1 + 32);
            v12 = [v6 bundleIdentifier];
            v13 = [v11 objectForKeyedSubscript:v12];
            if (!v10) {
              goto LABEL_11;
            }
            id v14 = [v10 compare:v13];

            if (v14 == (id)-1)
            {
              v15 = *(void **)(a1 + 32);
              v12 = [v6 bundleIdentifier];
              v13 = [v15 objectForKeyedSubscript:v12];
LABEL_11:
              [v3 setLastUsed:v13];
            }
          }
        }
        uint64_t v34 = v5;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v35 = [v6 groupContainerIdentifiers];
        id v37 = [v35 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v37)
        {
          uint64_t v36 = *(void *)v39;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v39 != v36) {
                objc_enumerationMutation(v35);
              }
              uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * i);
              [*(id *)(a1 + 40) addObject:v17];
              v18 = [*(id *)(a1 + 48) objectForKeyedSubscript:v17];
              if (!v18)
              {
                v18 = objc_opt_new();
                [*(id *)(a1 + 48) setObject:v18 forKeyedSubscript:v17];
              }
              [v18 addObject:v6];
              uint64_t v19 = [*(id *)(a1 + 56) objectForKeyedSubscript:v17];
              if (!v19) {
                goto LABEL_22;
              }
              v20 = (void *)v19;
              id v21 = v3;
              signed int v22 = [v3 urgency];
              [*(id *)(a1 + 56) objectForKeyedSubscript:v17];
              v24 = v23 = v6;
              signed int v25 = [v24 intValue];

              v6 = v23;
              BOOL v26 = v22 <= v25;
              id v3 = v21;
              if (!v26)
              {
LABEL_22:
                v27 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 urgency]);
                [*(id *)(a1 + 56) setObject:v27 forKeyedSubscript:v17];
              }
            }
            id v37 = [v35 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v37);
        }

        uint64_t v5 = v34 + 1;
      }
      while ((id)(v34 + 1) != v33);
      id v33 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v33);
  }

  if (v32 && (int)[v3 urgency] <= *(_DWORD *)(a1 + 72)) {
    [*(id *)(a1 + 64) addObject:v3];
  }

  return 1;
}

- (unint64_t)processContainerCachesForVolume:(id)a3 bytesNeeded:(unint64_t)a4 urgency:(int)a5 calculate:(BOOL)a6 verbose:(BOOL)a7 telemetry:(id)a8
{
  BOOL v9 = a7;
  BOOL v43 = a6;
  uint64_t v10 = *(void *)&a5;
  id v13 = a3;
  id v14 = a8;
  unint64_t v15 = a4;
  id v16 = v14;
  unint64_t v44 = v15;
  if (v15 && v10 == 4)
  {
    uint64_t v17 = dispatch_get_global_queue(2, 0);
    dispatch_async(v17, &__block_literal_global_47);

    unint64_t v15 = v44;
  }
  v18 = [(AppContainerCaches *)self cachesForInstalledApps:v43 bytesNeeded:v15 volume:v13 sortForUrgency:v10 telemetry:v16];
  if ([v18 count])
  {
    id v41 = v13;
    long long v42 = v18;
    if (v9)
    {
      BOOL v39 = v9;
      int v40 = v10;
      uint64_t v19 = CDGetLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "sorted caches:", buf, 2u);
      }

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v20 = v18;
      id v21 = [v20 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v50;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v50 != v23) {
              objc_enumerationMutation(v20);
            }
            signed int v25 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            BOOL v26 = CDGetLogHandle();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v54 = v25;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "  %@", buf, 0xCu);
            }
          }
          id v22 = [v20 countByEnumeratingWithState:&v49 objects:v58 count:16];
        }
        while (v22);
      }

      BOOL v9 = v39;
      LODWORD(v10) = v40;
      v18 = v42;
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v27 = v18;
    id v28 = [v27 countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v28)
    {
      id v29 = v28;
      unint64_t v30 = 0;
      uint64_t v31 = *(void *)v46;
      unint64_t v32 = v44;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v46 != v31)
          {
            objc_enumerationMutation(v27);
            unint64_t v32 = v44;
          }
          uint64_t v34 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
          if (v32)
          {
            v30 += (unint64_t)[v34 clearCaches:v10 == 4];
            if (v30 >= v32) {
              goto LABEL_29;
            }
          }
          else
          {
            v30 += (unint64_t)[v34 caches:v43 purge:0];
          }
        }
        unint64_t v32 = v44;
        id v29 = [v27 countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v29);
LABEL_29:

      if (v32)
      {
        id v13 = v41;
        if (v30) {
          clearDiscardedCaches();
        }
        v18 = v42;
        if (!v9) {
          goto LABEL_44;
        }
      }
      else
      {
        id v13 = v41;
        v18 = v42;
        if (!v9) {
          goto LABEL_44;
        }
      }
    }
    else
    {

      unint64_t v30 = 0;
      id v13 = v41;
      if (!v9) {
        goto LABEL_44;
      }
    }
LABEL_41:
    uint64_t v36 = CDGetLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = [v16 deletes];
      *(_DWORD *)buf = 134218240;
      id v54 = v37;
      __int16 v55 = 1024;
      int v56 = v10;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Deleted %llu files at urgency %d", buf, 0x12u);
    }

    goto LABEL_44;
  }
  id v35 = CDGetLogHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "No application cache space to reap", buf, 2u);
  }

  unint64_t v30 = 0;
  if (v9) {
    goto LABEL_41;
  }
LABEL_44:

  return v30;
}

- (id)cachesForInstalledApps:(BOOL)a3 bytesNeeded:(unint64_t)a4 volume:(id)a5 sortForUrgency:(int)a6 telemetry:(id)a7
{
  id v47 = a5;
  id v11 = a7;
  v12 = objc_opt_new();
  id v13 = recentlyUsedAppsDictionary();
  id v14 = objc_opt_new();
  unint64_t v15 = objc_opt_new();
  id v16 = objc_opt_new();
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = __89__AppContainerCaches_cachesForInstalledApps_bytesNeeded_volume_sortForUrgency_telemetry___block_invoke;
  v59[3] = &unk_10005E028;
  if (a4) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = a6 == 4;
  }
  uint64_t v18 = v17;
  BOOL v66 = a3;
  int v65 = a6;
  id v46 = v13;
  id v60 = v46;
  id v19 = v16;
  id v61 = v19;
  id v20 = v14;
  id v62 = v20;
  id v21 = v15;
  id v63 = v21;
  id v22 = v12;
  id v64 = v22;
  +[AppCache enumerateAppCachesOnVolume:v47 options:v18 telemetry:v11 block:v59];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = __89__AppContainerCaches_cachesForInstalledApps_bytesNeeded_volume_sortForUrgency_telemetry___block_invoke_2;
  v53[3] = &unk_10005E050;
  id v43 = v21;
  id v54 = v43;
  id v42 = v20;
  id v55 = v42;
  int v58 = a6;
  id v44 = v11;
  id v56 = v44;
  id v23 = v22;
  id v57 = v23;
  long long v45 = v19;
  +[AppCache enumerateGroupCachesOnVolume:v19 block:v53];
  if ((a6 - 5) > 0xFFFFFFFB)
  {
    id v24 = [v23 sortedArrayUsingComparator:&__block_literal_global_9];
  }
  else
  {
    id v24 = [v23 copy];
  }
  signed int v25 = v24;
  id v41 = v23;
  BOOL v26 = CDGetLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "cachesForInstalledApps result:", buf, 2u);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v27 = v25;
  id v28 = [v27 countByEnumeratingWithState:&v49 objects:v75 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v50;
    id v48 = v27;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v50 != v30) {
          objc_enumerationMutation(v27);
        }
        unint64_t v32 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        id v33 = CDGetLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v34 = [v32 identifier];
          if (v34) {
            [v32 identifier];
          }
          else {
          id v35 = [v32 bundleRecords];
          }
          uint64_t v36 = [v32 lastUsed];
          id v37 = [v32 lastKnownCacheSize];
          [v37 unsignedLongLongValue];
          long long v38 = humanReadableNumber();
          unsigned int v39 = [v32 urgency];
          *(_DWORD *)buf = 138413058;
          v68 = v35;
          __int16 v69 = 2112;
          v70 = v36;
          __int16 v71 = 2112;
          v72 = v38;
          __int16 v73 = 1024;
          unsigned int v74 = v39;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%@ : %@ : %@, urgency: %d", buf, 0x26u);

          id v27 = v48;
        }
      }
      id v29 = [v27 countByEnumeratingWithState:&v49 objects:v75 count:16];
    }
    while (v29);
  }

  return v27;
}

- (void)_servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  BOOL v9 = (void (**)(id, void *))a5;
  uint64_t v10 = [v8 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  id v11 = evaluateStringProperty();
  v12 = +[CacheDeleteVolume volumeWithPath:v11];

  id v13 = CDGetLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v30 = "com.apple.mobile.cache_delete_app_container_caches";
    __int16 v31 = 2114;
    id v32 = v8;
    __int16 v33 = 2114;
    uint64_t v34 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: PURGEABLE callback, info: %{public}@, cdVol: %{public}@", buf, 0x20u);
  }

  if (v12
    && ([v12 mountPoint],
        id v14 = objc_claimAutoreleasedReturnValue(),
        getRootVolume(),
        unint64_t v15 = objc_claimAutoreleasedReturnValue(),
        unsigned int v16 = [v14 isEqualToString:v15],
        v15,
        v14,
        v16))
  {
    BOOL v17 = +[TestTelemetry testTelemetryWithInfo:v8];
    uint64_t v18 = [v8 objectForKeyedSubscript:@"CACHE_DELETE_NO_CACHE"];
    uint64_t v19 = evaluateBoolProperty();

    id v20 = [v8 objectForKeyedSubscript:@"CACHE_DELETE_DIAGNOSTIC_INFO"];
    uint64_t v21 = evaluateBoolProperty();

    if ((int)v6 <= 1 && self->_multi_user) {
      unint64_t v22 = 0;
    }
    else {
      unint64_t v22 = [(AppContainerCaches *)self processContainerCachesForVolume:v12 bytesNeeded:0 urgency:v6 calculate:v19 verbose:v21 telemetry:v17];
    }
    id v24 = objc_msgSend(v12, "mountPoint", @"CACHE_DELETE_VOLUME");
    v27[1] = @"CACHE_DELETE_AMOUNT";
    v28[0] = v24;
    signed int v25 = +[NSNumber numberWithUnsignedLongLong:v22];
    v28[1] = v25;
    id v23 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

    BOOL v26 = CDGetLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v30 = "com.apple.mobile.cache_delete_app_container_caches";
      __int16 v31 = 2114;
      id v32 = v23;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s PURGEABLE Result: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v23 = 0;
  }
  v9[2](v9, v23);
}

+ (id)deleteAppCaches:(id)a3 telemetry:(id)a4
{
  id v5 = a3;
  id v65 = a4;
  v53 = objc_opt_new();
  id v60 = objc_opt_new();
  id v61 = objc_opt_new();
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v79 objects:v92 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = &APFSContainerGetSpaceInfo_ptr;
    uint64_t v9 = *(void *)v80;
    uint64_t v54 = *(void *)v80;
    do
    {
      uint64_t v10 = 0;
      id v55 = v7;
      do
      {
        if (*(void *)v80 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v79 + 1) + 8 * (void)v10);
        v12 = v8[240];
        id v78 = 0;
        uint64_t v59 = v11;
        id v13 = objc_msgSend(v12, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
        id v14 = v78;
        unint64_t v15 = CDGetLogHandle();
        unsigned int v16 = v15;
        if (v13) {
          BOOL v17 = v14 == 0;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = objc_opt_class();
            *(_DWORD *)buf = 138412802;
            uint64_t v87 = v59;
            __int16 v88 = 2112;
            id v89 = v18;
            __int16 v90 = 2112;
            v91 = v13;
            id v19 = v18;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "LSBundleRecord for %@ : (class: %@) %@", buf, 0x20u);
          }
          objc_opt_class();
          id v57 = v14;
          int v58 = v10;
          if (objc_opt_isKindOfClass()) {
            unsigned __int8 v64 = [v13 isPlaceholder];
          }
          else {
            unsigned __int8 v64 = 0;
          }
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          id v20 = [v13 bundleIdentifier];
          [v13 platform];
          uint64_t v21 = dataContainerURLs();

          long long v76 = 0u;
          long long v77 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          unsigned int v16 = v21;
          id v22 = [v16 countByEnumeratingWithState:&v74 objects:v85 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v62 = *(void *)v75;
            do
            {
              for (i = 0; i != v23; i = (char *)i + 1)
              {
                if (*(void *)v75 != v62) {
                  objc_enumerationMutation(v16);
                }
                signed int v25 = *(void **)(*((void *)&v74 + 1) + 8 * i);
                if ([v25 isEqualToString:@"NO_PERSONA_AVAILABLE"]) {
                  id v26 = 0;
                }
                else {
                  id v26 = v25;
                }
                id v27 = +[NSSet setWithObject:v13];
                id v28 = [v13 bundleIdentifier];
                id v29 = [v16 objectForKeyedSubscript:v25];
                BYTE1(v52) = isKindOfClass & 1;
                LOBYTE(v52) = v64;
                uint64_t v30 = +[AppCache appCacheWithRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:isDataseparated:isPlaceholder:isPlugin:telemetry:](AppCache, "appCacheWithRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:isDataseparated:isPlaceholder:isPlugin:telemetry:", v27, v28, v29, 0, v26, 0, v52, v65);

                if (v30)
                {
                  [v60 addObject:v30];
                  __int16 v31 = [v30 cdVol];
                  [v61 addObject:v31];

                  id v32 = CDGetLogHandle();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  {
                    [v30 caches:1 purge:0];
                    __int16 v33 = humanReadableNumber();
                    *(_DWORD *)buf = 138412802;
                    uint64_t v87 = v59;
                    __int16 v88 = 2112;
                    id v89 = v33;
                    __int16 v90 = 2112;
                    v91 = v30;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "AppCache for %@ : (%@) %@", buf, 0x20u);
                  }
                }
                else
                {
                  id v32 = CDGetLogHandle();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v87 = v59;
                    _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Unable to create AppCache for %@", buf, 0xCu);
                  }
                }
              }
              id v23 = [v16 countByEnumeratingWithState:&v74 objects:v85 count:16];
            }
            while (v23);
          }

          id v8 = &APFSContainerGetSpaceInfo_ptr;
          uint64_t v9 = v54;
          id v7 = v55;
          id v14 = v57;
          uint64_t v10 = v58;
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v87 = v59;
          __int16 v88 = 2112;
          id v89 = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unable to create an LSBundleRecord for %@ : %@", buf, 0x16u);
        }

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v10 != v7);
      id v7 = [obj countByEnumeratingWithState:&v79 objects:v92 count:16];
    }
    while (v7);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v34 = v60;
  id v35 = [v34 countByEnumeratingWithState:&v70 objects:v84 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = 0;
    uint64_t v38 = *(void *)v71;
    unsigned int v39 = v53;
    do
    {
      for (j = 0; j != v36; j = (char *)j + 1)
      {
        if (*(void *)v71 != v38) {
          objc_enumerationMutation(v34);
        }
        id v41 = *(void **)(*((void *)&v70 + 1) + 8 * (void)j);
        id v42 = [v41 clearCaches:1];
        v37 += (uint64_t)v42;
        id v43 = +[NSNumber numberWithUnsignedLongLong:v42];
        id v44 = [v41 identifier];
        [v53 setObject:v43 forKeyedSubscript:v44];
      }
      id v36 = [v34 countByEnumeratingWithState:&v70 objects:v84 count:16];
    }
    while (v36);
  }
  else
  {
    uint64_t v37 = 0;
    unsigned int v39 = v53;
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v45 = v61;
  id v46 = (char *)[v45 countByEnumeratingWithState:&v66 objects:v83 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v67;
    do
    {
      for (k = 0; k != v47; ++k)
      {
        if (*(void *)v67 != v48) {
          objc_enumerationMutation(v45);
        }
        clearDiscardedCaches();
      }
      id v47 = (char *)[v45 countByEnumeratingWithState:&v66 objects:v83 count:16];
    }
    while (v47);
  }

  long long v50 = +[NSNumber numberWithUnsignedLongLong:v37];
  [v39 setObject:v50 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  return v39;
}

- (AppContainerCaches)initWithInfo:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)AppContainerCaches;
  id v6 = [(CDService *)&v35 initWithInfo:v5];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_info, a3);
    id v8 = [v5 objectForKeyedSubscript:@"CONTAINER_CACHES_BY_VOLUME"];
    uint64_t v30 = v8;
    if (v8) {
      uint64_t v9 = (NSMutableDictionary *)objc_msgSend(v8, "mutableCopy", v8);
    }
    else {
      uint64_t v9 = (NSMutableDictionary *)objc_opt_new();
    }
    cachesByVolume = v7->_cachesByVolume;
    v7->_cachesByVolume = v9;

    uint64_t v11 = objc_opt_new();
    opState = v7->_opState;
    v7->_opState = (OperationState *)v11;

    uint64_t v13 = objc_opt_new();
    cdVolumes = v7->_cdVolumes;
    v7->_cdVolumes = (NSMutableDictionary *)v13;

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    unint64_t v15 = getLocalVolumes();
    id v16 = [v15 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v21 = +[CacheDeleteVolume volumeWithMountpoint:](CacheDeleteVolume, "volumeWithMountpoint:", v20, v30);
          if (v21) {
            [(NSMutableDictionary *)v7->_cdVolumes setObject:v21 forKeyedSubscript:v20];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }
      while (v17);
    }

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.cache_delete.app_caches.collection", 0);
    collection_queue = v7->_collection_queue;
    v7->_collection_queue = (OS_dispatch_queue *)v22;

    dispatch_queue_t v24 = dispatch_queue_create("com.apple.cache_delete.app_caches.purge", 0);
    purge_queue = v7->_purge_queue;
    v7->_purge_queue = (OS_dispatch_queue *)v24;

    v7->_multi_user = 0;
    CFDictionaryRef v26 = (const __CFDictionary *)MKBUserTypeDeviceMode();
    if (!v26)
    {
      id v27 = CDGetLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v37 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "MKBUserTypeDeviceMode error: %@", buf, 0xCu);
      }
    }
    Value = CFDictionaryGetValue(v26, kMKBDeviceModeKey);
    if (Value && CFEqual(kMKBDeviceModeSharedIPad, Value)) {
      v7->_multi_user = 1;
    }
    if (v26) {
      CFRelease(v26);
    }
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)appContainerCachesWithInfo:(id)a3
{
  id v3 = a3;
  v4 = [[AppContainerCaches alloc] initWithInfo:v3];

  return v4;
}

- (AppContainerCaches)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeObjectForKey:@"CONTAINER_CACHES_BY_VOLUME"];
  id v5 = (void *)v4;
  if (v4)
  {
    v11[0] = @"CONTAINER_CACHES_BY_VOLUME";
    v11[1] = @"CACHE_DELETE_ID";
    v12[0] = v4;
    v12[1] = @"com.apple.mobile.cache_delete_app_container_caches";
    v11[2] = @"CACHE_DELETE_SERVICES";
    v12[2] = &off_1000615B8;
    id v6 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
    id v7 = [(AppContainerCaches *)self initWithInfo:v6];
  }
  else
  {
    id v8 = CDGetLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to decode cachesByVolume", v10, 2u);
    }

    id v7 = [(AppContainerCaches *)self initWithInfo:&off_1000613F0];
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AppContainerCaches *)self cachesByVolume];
  [v4 encodeObject:v5 forKey:@"CONTAINER_CACHES_BY_VOLUME"];
}

uint64_t __89__AppContainerCaches_cachesForInstalledApps_bytesNeeded_volume_sortForUrgency_telemetry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    signed int v9 = [v8 intValue];
  }
  else
  {
    signed int v9 = 1;
  }

  uint64_t v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  if (v10 && v9 <= *(_DWORD *)(a1 + 64))
  {
    LOWORD(v13) = 0;
    uint64_t v11 = +[AppCache appCacheWithRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:isDataseparated:isPlaceholder:isPlugin:telemetry:](AppCache, "appCacheWithRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:isDataseparated:isPlaceholder:isPlugin:telemetry:", v10, v5, v6, 0, 0, 0, v13, *(void *)(a1 + 48));
    if (v11) {
      [*(id *)(a1 + 56) addObject:v11];
    }
  }
  return 1;
}

int64_t __89__AppContainerCaches_cachesForInstalledApps_bytesNeeded_volume_sortForUrgency_telemetry___block_invoke_3(id a1, id a2, id a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  if ([v6 isPlaceholder] && !objc_msgSend(v7, "isPlaceholder")) {
    goto LABEL_6;
  }
  if ([v7 isPlaceholder] && !objc_msgSend(v6, "isPlaceholder")) {
    goto LABEL_8;
  }
  int v8 = [v6 urgency];
  if (v8 < (int)[v7 urgency])
  {
LABEL_6:
    int64_t v9 = -1;
    goto LABEL_9;
  }
  int v10 = [v6 urgency];
  if (v10 > (int)[v7 urgency]) {
    goto LABEL_8;
  }
  v12 = [v6 lastUsed];
  if (v12)
  {
  }
  else
  {
    id v28 = [v7 lastUsed];

    if (v28) {
      goto LABEL_6;
    }
  }
  uint64_t v13 = [v6 lastUsed];
  if (v13)
  {
    id v14 = (void *)v13;
    unint64_t v15 = [v7 lastUsed];

    if (!v15)
    {
LABEL_8:
      int64_t v9 = 1;
      goto LABEL_9;
    }
  }
  uint64_t v16 = [v6 lastUsed];
  if (!v16) {
    goto LABEL_17;
  }
  id v17 = (void *)v16;
  uint64_t v18 = [v7 lastUsed];

  if (!v18
    || ([v6 lastUsed],
        id v19 = objc_claimAutoreleasedReturnValue(),
        [v7 lastUsed],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        int64_t v9 = (int64_t)[v19 compare:v20],
        v20,
        v19,
        !v9))
  {
LABEL_17:
    uint64_t v21 = [v6 lastKnownCacheSize];
    id v22 = [v21 unsignedLongLongValue];
    id v23 = [v7 lastKnownCacheSize];
    id v24 = [v23 unsignedLongLongValue];

    if (v22 >= v24)
    {
      signed int v25 = [v6 lastKnownCacheSize];
      id v26 = [v25 unsignedLongLongValue];
      id v27 = [v7 lastKnownCacheSize];
      int64_t v9 = v26 > [v27 unsignedLongLongValue];

      goto LABEL_9;
    }
    goto LABEL_6;
  }
LABEL_9:

  return v9;
}

void __102__AppContainerCaches_processContainerCachesForVolume_bytesNeeded_urgency_calculate_verbose_telemetry___block_invoke(id a1)
{
  v1 = +[CacheDeletePruner prunerWithFileAge:259200.0 dirAge:86400.0];
  [v1 pruneDir:@"/private/var/tmp" bundleID:0];

  id v2 = +[CacheDeletePruner prunerWithFileAge:259200.0 dirAge:86400.0];
  [v2 pruneDir:@"/private/var/mobile/tmp" bundleID:0];
}

- (id)cdVolumeForPath:(id)a3
{
  id v4 = a3;
  bzero(&v23, 0x878uLL);
  id v5 = v4;
  if (statfs((const char *)[v5 UTF8String], &v23))
  {
    id v6 = CDGetLogHandle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    id v16 = [v5 UTF8String];
    id v17 = __error();
    uint64_t v18 = strerror(*v17);
    int v19 = 136315394;
    id v20 = v16;
    __int16 v21 = 2080;
    id v22 = v18;
    uint64_t v13 = "statfs failed for %s : %s";
    id v14 = v6;
    uint32_t v15 = 22;
    goto LABEL_14;
  }
  int v8 = [(AppContainerCaches *)self cdVolumes];
  int64_t v9 = +[NSString stringWithUTF8String:v23.f_mntonname];
  id v7 = [v8 objectForKeyedSubscript:v9];

  if (!v7)
  {
    uint64_t v11 = +[CacheDeleteVolume volumeWithPath:v5];
    if (v11)
    {
      id v7 = (void *)v11;
      id v6 = [(AppContainerCaches *)self cdVolumes];
      v12 = [v7 mountPoint];
      [v6 setObject:v7 forKeyedSubscript:v12];

      goto LABEL_4;
    }
    id v6 = CDGetLogHandle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_3:
      id v7 = 0;
LABEL_4:

      goto LABEL_6;
    }
    int v19 = 138412290;
    id v20 = v5;
    uint64_t v13 = "Unable to create CDVolume from: %@";
    id v14 = v6;
    uint32_t v15 = 12;
LABEL_14:
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v19, v15);
    goto LABEL_3;
  }
LABEL_6:

  return v7;
}

- (id)appCache:(id)a3 forPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__8;
  __int16 v21 = __Block_byref_object_dispose__8;
  id v22 = 0;
  int v8 = [(AppContainerCaches *)self mountPointForPath:v7];
  if (v8)
  {
    int64_t v9 = [(AppContainerCaches *)self collection_queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __39__AppContainerCaches_appCache_forPath___block_invoke;
    block[3] = &unk_10005E0D8;
    block[4] = self;
    id v13 = v8;
    id v14 = v6;
    id v15 = v7;
    id v16 = &v17;
    dispatch_sync(v9, block);
  }
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __39__AppContainerCaches_appCache_forPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cachesByVolume];
  id v11 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    id v4 = v11;
    if (!v11)
    {
      id v12 = (id)objc_opt_new();
      id v5 = [*(id *)(a1 + 32) cachesByVolume];
      [v5 setObject:v12 forKeyedSubscript:*(void *)(a1 + 40)];

      id v4 = v12;
      uint64_t v3 = *(void *)(a1 + 48);
    }
    id v11 = v4;
    [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 56)];
  }
  else
  {
    id v6 = v11;
    if (!v11) {
      goto LABEL_9;
    }
    id v7 = [v11 objectForKeyedSubscript:*(void *)(a1 + 56)];

    if (v7)
    {
      uint64_t v8 = [v11 objectForKeyedSubscript:*(void *)(a1 + 56)];
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
  id v6 = v11;
LABEL_9:
}

- (id)mountPointForPath:(id)a3
{
  return (id)normalizePath();
}

- (id)initReadOnlyCopy
{
  v10.receiver = self;
  v10.super_class = (Class)AppContainerCaches;
  id v2 = [(AppContainerCaches *)&v10 init];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [(AppContainerCaches *)v2 info];
    id v5 = +[AppContainerCaches appContainerCachesWithInfo:v4];

    id v6 = [v5 cachesByVolume];
    id v7 = (NSMutableDictionary *)[v6 copy];
    cachesByVolume = v3->_cachesByVolume;
    v3->_cachesByVolume = v7;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = +[AppContainerCaches allocWithZone:a3];
  return [(AppContainerCaches *)v3 initReadOnlyCopy];
}

- (void)_servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(id, id))a5;
  uint64_t v9 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  objc_super v10 = evaluateStringProperty();
  id v11 = +[CacheDeleteVolume volumeWithPath:v10];

  id v12 = CDGetLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "com.apple.mobile.cache_delete_app_container_caches";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: PURGE callback, cdVol: %{public}@", buf, 0x16u);
  }

  if (v11)
  {
    id v13 = [v11 mountPoint];
    id v14 = getRootVolume();
    unsigned int v15 = [v13 isEqualToString:v14];

    if (v15)
    {
      id v41 = +[NSMutableDictionary dictionary];
      id v16 = +[TestTelemetry testTelemetryWithInfo:v7];
      uint64_t v17 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_DIAGNOSTIC_INFO"];
      char v18 = evaluateBoolProperty();

      uint64_t v19 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
      id v20 = evaluateNumberProperty();
      id v21 = [v20 unsignedLongLongValue];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      *(void *)&buf[24] = 0;
      if (v16)
      {
        id v22 = CDGetLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v53 = 138543362;
          uint64_t v54 = v16;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "TestTelemetry: %{public}@", v53, 0xCu);
        }
      }
      if (a3 > 1 || !self->_multi_user)
      {
        statfs v23 = [(AppContainerCaches *)self purge_queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __52__AppContainerCaches__servicePurge_info_replyBlock___block_invoke;
        block[3] = &unk_10005E100;
        block[4] = self;
        id v46 = buf;
        id v44 = v11;
        id v47 = v21;
        int v48 = a3;
        char v49 = v18;
        id v45 = v16;
        dispatch_sync(v23, block);
      }
      v51[0] = @"CACHE_DELETE_VOLUME";
      id v24 = [v11 mountPoint];
      v52[0] = v24;
      v51[1] = @"CACHE_DELETE_AMOUNT";
      signed int v25 = +[NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)&buf[8] + 24)];
      v52[1] = v25;
      id v26 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
      id v27 = [v26 mutableCopy];

      if (v16)
      {
        id v28 = [v16 terminationFailures];
        if ([v28 count])
        {

LABEL_19:
          id v29 = +[NSMutableDictionary dictionary];
          long long v33 = [v16 terminationFailures];
          id v34 = [v33 count];

          if (v34)
          {
            objc_super v35 = [v16 terminationFailures];
            [v29 setObject:v35 forKeyedSubscript:@"CACHE_DELETE_TEST_TERMINATION_FAILURES"];
          }
          id v36 = [v16 removeFailures];
          id v37 = [v36 count];

          if (v37)
          {
            uint64_t v38 = [v16 removeFailures];
            [v29 setObject:v38 forKeyedSubscript:@"CACHE_DELETE_TEST_REMOVE_FAILURES"];
          }
          if ([v29 count]) {
            [v27 setObject:v29 forKeyedSubscript:@"CACHE_DELETE_TEST_FAILURES"];
          }
          goto LABEL_26;
        }
        long long v31 = [v16 removeFailures];
        BOOL v32 = [v31 count] == 0;

        if (!v32) {
          goto LABEL_19;
        }
      }
      id v29 = 0;
LABEL_26:
      id v30 = [v27 copy];
      _Block_object_dispose(buf, 8);

      goto LABEL_27;
    }
  }
  id v29 = CDGetLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Unable to create cdVol from info: %{public}@", buf, 0xCu);
  }
  id v30 = 0;
LABEL_27:

  unsigned int v39 = CDGetLogHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    int v40 = [v11 mountPoint];
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "com.apple.mobile.cache_delete_app_container_caches";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    *(_WORD *)&buf[18] = 2114;
    *(void *)&buf[20] = v40;
    *(_WORD *)&buf[28] = 2114;
    *(void *)&buf[30] = v30;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}s PURGE result: [u:%d] %{public}@ : %{public}@", buf, 0x26u);
  }
  v8[2](v8, v30);
}

uint64_t __52__AppContainerCaches__servicePurge_info_replyBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) opState];
  unsigned int v3 = [v2 begin];

  if (v3)
  {
    id v4 = CDGetLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Purging Container Caches", (uint8_t *)&v9, 2u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) processContainerCachesForVolume:*(void *)(a1 + 40) bytesNeeded:*(void *)(a1 + 64) urgency:*(unsigned int *)(a1 + 72) calculate:0 verbose:*(unsigned __int8 *)(a1 + 76) telemetry:*(void *)(a1 + 48)];
    id v5 = [*(id *)(a1 + 32) opState];
    [v5 end];

    if (*(void *)(a1 + 48))
    {
      id v6 = CDGetLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        int v9 = 138543362;
        uint64_t v10 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "testTelemetry: %{public}@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  return clearDiscardedCaches();
}

- (void)_servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v6 = a4;
  uint64_t v7 = (void (**)(id, _UNKNOWN **))a5;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  int v9 = evaluateStringProperty();
  uint64_t v10 = +[CacheDeleteVolume volumeWithPath:v9];

  id v11 = CDGetLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 mountPoint];
    int v17 = 136446466;
    char v18 = "com.apple.mobile.cache_delete_app_container_caches";
    __int16 v19 = 2114;
    id v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: PERIODIC callback, cdVol: %{public}@", (uint8_t *)&v17, 0x16u);
  }
  if (v10)
  {
    id v13 = [v10 mountPoint];
    id v14 = getRootVolume();
    unsigned int v15 = [v13 isEqualToString:v14];

    if (v15)
    {
      id v16 = +[TestTelemetry testTelemetryWithInfo:v6];
      +[AppCache enumerateAppCachesOnVolume:v10 options:1 telemetry:v16 block:&__block_literal_global_83];
      +[AppCache enumerateGroupCachesOnVolume:0 block:&__block_literal_global_85];
    }
  }
  v7[2](v7, &off_100061418);
}

BOOL __55__AppContainerCaches__servicePeriodic_info_replyBlock___block_invoke(id a1, AppCache *a2)
{
  id v2 = [(AppCache *)a2 cachePath];
  [v2 UTF8String];
  enableDirStats();

  return 1;
}

BOOL __55__AppContainerCaches__servicePeriodic_info_replyBlock___block_invoke_2(id a1, NSString *a2, NSURL *a3)
{
  unsigned int v3 = +[NSString stringWithUTF8String:[(NSURL *)a3 fileSystemRepresentation]];
  id v4 = [v3 stringByAppendingPathComponent:@"Library/Caches"];

  id v5 = v4;
  [v5 UTF8String];
  enableDirStats();

  return 1;
}

- (void)_serviceCancelPurge:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = CDGetLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446210;
    uint64_t v8 = "com.apple.mobile.cache_delete_app_container_caches";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: PURGE CANCEL callback", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(AppContainerCaches *)self opState];
  [v6 cancel];

  v4[2](v4);
}

- (void)_servicePing:(id)a3
{
}

- (void)_serviceNotify:(id)a3 replyBlock:(id)a4
{
  id v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136446210;
    id v6 = "com.apple.mobile.cache_delete_app_container_caches";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "_serviceNotify is unsupported for %{public}s", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_serviceCallback:(id)a3 replyBlock:(id)a4
{
  id v5 = a3;
  id v37 = (void (**)(id, id))a4;
  unsigned int v39 = +[NSMutableDictionary dictionary];
  id v6 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_OPERATIONS"];
  int v7 = CDGetLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)char v49 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "com.apple.mobile.cache_delete_app_container_caches Callback ENTRY, info: %{public}@", buf, 0xCu);
  }
  uint64_t v38 = v5;

  uint64_t v8 = getLocalVolumes();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v45;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        id v14 = +[CacheDeleteVolume volumeWithPath:v13];
        unsigned int v15 = v14;
        if (v13)
        {
          id v16 = [v14 mountPoint];
          int v17 = getRootVolume();
          unsigned int v18 = [v16 isEqualToString:v17];

          if (v18) {
            clearDiscardedCaches();
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v10);
  }
  id v36 = v8;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v19 = v6;
  id v20 = [v19 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v41;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
        signed int v25 = [v19 objectForKeyedSubscript:v24];
        id v26 = [v25 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
        id v27 = evaluateStringProperty();
        id v28 = +[CacheDeleteVolume volumeWithPath:v27];

        id v29 = CDGetLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)char v49 = 676;
          *(_WORD *)&v49[4] = 2114;
          *(void *)&v49[6] = v28;
          *(_WORD *)&v49[14] = 2114;
          *(void *)&v49[16] = v25;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%d, cdVol: %{public}@, opInfo: %{public}@", buf, 0x1Cu);
        }

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v24 isEqualToString:@"CACHE_DELETE_PURGE_OPERATION"])
          {
            id v30 = CDGetLogHandle();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              long long v31 = v30;
              BOOL v32 = "unsupported, call _servicePurge directly";
              goto LABEL_36;
            }
LABEL_37:

            goto LABEL_38;
          }
          if ([v24 isEqualToString:@"CACHE_DELETE_PURGEABLE_OPERATION"])
          {
            id v30 = CDGetLogHandle();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              goto LABEL_37;
            }
            *(_WORD *)buf = 0;
            long long v31 = v30;
            BOOL v32 = "unsupported, call _servicePurgeable directly";
          }
          else if ([v24 isEqualToString:@"CACHE_DELETE_PURGE_CANCEL_OPERATION"])
          {
            id v30 = CDGetLogHandle();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              goto LABEL_37;
            }
            *(_WORD *)buf = 0;
            long long v31 = v30;
            BOOL v32 = "unsupported, call _serviceCancelPurge directly";
          }
          else
          {
            if (![v24 isEqualToString:@"CACHE_DELETE_PERIODIC_OPERATION"]) {
              goto LABEL_38;
            }
            id v30 = CDGetLogHandle();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              goto LABEL_37;
            }
            *(_WORD *)buf = 0;
            long long v31 = v30;
            BOOL v32 = "unsupported, call _servicePeriodic directly";
          }
LABEL_36:
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v32, buf, 2u);
          goto LABEL_37;
        }
        long long v33 = CDGetLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)char v49 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "operation info is not a dictionary: %@", buf, 0xCu);
        }

        [v39 setObject:&off_100061440 forKeyedSubscript:@"CACHE_DELETE_SERVICE_REQUEST_OPERATION"];
LABEL_38:
      }
      id v21 = [v19 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v21);
  }

  id v34 = CDGetLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)char v49 = "com.apple.mobile.cache_delete_app_container_caches";
    *(_WORD *)&v49[8] = 2114;
    *(void *)&v49[10] = v39;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}s result: %{public}@", buf, 0x16u);
  }

  id v35 = [v39 copy];
  v37[2](v37, v35);
}

- (NSMutableDictionary)cachesByVolume
{
  return self->_cachesByVolume;
}

- (void)setCachesByVolume:(id)a3
{
}

- (NSMutableDictionary)cdVolumes
{
  return self->_cdVolumes;
}

- (void)setCdVolumes:(id)a3
{
}

- (OperationState)opState
{
  return self->_opState;
}

- (void)setOpState:(id)a3
{
}

- (OS_dispatch_queue)collection_queue
{
  return self->_collection_queue;
}

- (void)setCollection_queue:(id)a3
{
}

- (OS_dispatch_queue)purge_queue
{
  return self->_purge_queue;
}

- (void)setPurge_queue:(id)a3
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (BOOL)multi_user
{
  return self->_multi_user;
}

- (void)setMulti_user:(BOOL)a3
{
  self->_multi_user = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_purge_queue, 0);
  objc_storeStrong((id *)&self->_collection_queue, 0);
  objc_storeStrong((id *)&self->_opState, 0);
  objc_storeStrong((id *)&self->_cdVolumes, 0);
  objc_storeStrong((id *)&self->_cachesByVolume, 0);
}

@end