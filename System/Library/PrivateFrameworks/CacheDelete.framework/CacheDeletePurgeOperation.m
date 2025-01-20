@interface CacheDeletePurgeOperation
- (BOOL)cancel;
- (BOOL)reportedAmountMatchesFreedSpace:(id)a3;
- (CDPurgeOperationResult)purgeResult;
- (CacheDeletePurgeOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5;
- (id)filterServices:(id)a3;
- (id)purgeSentinel:(BOOL)a3 outInode:(unint64_t *)a4;
- (unint64_t)purge_amount_needed;
- (unint64_t)purge_amount_reported;
- (unint64_t)volumeContribution:(id)a3 urgency:(int)a4 isTargetVolume:(BOOL)a5;
- (void)_startOperation:(id)a3;
- (void)batchServicesForVolume:(id)a3 atUrgency:(int)a4 services:(id)a5 batchSize:(int)a6 block:(id)a7;
- (void)cancelOperation;
- (void)oneShot:(id)a3 volume:(id)a4 urgency:(int)a5 donation:(unint64_t)a6 currentRoundResults:(id)a7 timeout:(unint64_t)a8 info:(id)a9 optionalTestInfo:(id)a10;
- (void)serviceRequest:(id)a3 volume:(id)a4 urgency:(int)a5 donation:(unint64_t)a6 info:(id)a7 optionalTestInfo:(id)a8 completion:(id)a9;
- (void)setCancel:(BOOL)a3;
- (void)setPurgeResult:(id)a3;
- (void)setPurge_amount_reported:(unint64_t)a3;
- (void)tryFSPurge:(unint64_t)a3 atUrgency:(int)a4 onVolume:(id)a5 orderedServices:(id)a6 completion:(id)a7;
@end

@implementation CacheDeletePurgeOperation

- (CacheDeletePurgeOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5
{
  id v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CacheDeletePurgeOperation;
  v9 = [(CacheDeleteOperation *)&v28 initWithInfo:v8 services:a4 volumes:a5];
  if (!v9) {
    goto LABEL_13;
  }
  v10 = +[NSMutableDictionary dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v11 = [(CacheDeleteOperation *)v9 services];
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v15);
        v17 = [(CacheDeleteOperation *)v9 services];
        v18 = [v17 objectForKeyedSubscript:v16];

        if ([v18 doesPurge]) {
          [v10 setObject:v18 forKeyedSubscript:v16];
        }

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v13);
  }

  [(CacheDeleteOperation *)v9 setServices:v10];
  v19 = [(CacheDeleteOperation *)v9 result];
  v20 = [v19 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9->_purge_amount_needed = (unint64_t)[v20 unsignedLongLongValue];
    v9->_purge_amount_reported = 0;

LABEL_13:
    v21 = v9;
    goto LABEL_17;
  }
  v22 = CDGetLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v30 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "CACHE_DELETE_AMOUNT is missing in info: %{public}@", buf, 0xCu);
  }

  v21 = 0;
LABEL_17:

  return v21;
}

- (void)cancelOperation
{
  [(CacheDeletePurgeOperation *)self setCancel:1];
  v3 = CDGetLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CancelPurge Start ", buf, 2u);
  }

  v4 = [(CacheDeleteOperation *)self services];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __44__CacheDeletePurgeOperation_cancelOperation__block_invoke;
  v5[3] = &unk_10005DA00;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __44__CacheDeletePurgeOperation_cancelOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 inFlight])
  {
    v6 = [*(id *)(a1 + 32) services];
    v7 = [v6 objectForKeyedSubscript:v5];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __44__CacheDeletePurgeOperation_cancelOperation__block_invoke_2;
    v8[3] = &unk_10005CD00;
    id v9 = v5;
    [v7 serviceCancelPurge:v8];
  }
}

void __44__CacheDeletePurgeOperation_cancelOperation__block_invoke_2(uint64_t a1)
{
  v2 = CDGetLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CancelPurge complete (service=%{public}@)", (uint8_t *)&v4, 0xCu);
  }
}

- (void)tryFSPurge:(unint64_t)a3 atUrgency:(int)a4 onVolume:(id)a5 orderedServices:(id)a6 completion:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a7;
  v23[0] = @"CACHE_DELETE_VOLUME";
  id v13 = a6;
  id v14 = a5;
  v15 = [v14 mountPoint];
  v24[0] = v15;
  v23[1] = @"CACHE_DELETE_AMOUNT";
  uint64_t v16 = +[NSNumber numberWithUnsignedLongLong:a3];
  v23[2] = @"CACHE_DELETE_SERVICES";
  v24[1] = v16;
  v24[2] = v13;
  v17 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];

  v18 = [(CacheDeleteOperation *)self services];
  v19 = [v18 objectForKeyedSubscript:@"com.apple.deleted_helper"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __86__CacheDeletePurgeOperation_tryFSPurge_atUrgency_onVolume_orderedServices_completion___block_invoke;
  v21[3] = &unk_10005DA28;
  id v22 = v12;
  id v20 = v12;
  [(CacheDeletePurgeOperation *)self serviceRequest:v19 volume:v14 urgency:v9 donation:a3 info:v17 optionalTestInfo:0 completion:v21];
}

void __86__CacheDeletePurgeOperation_tryFSPurge_atUrgency_onVolume_orderedServices_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "fsPurge: result: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)reportedAmountMatchesFreedSpace:(id)a3
{
  int v4 = [a3 amountPurged];
  if ((unsigned char *)[(CacheDeletePurgeOperation *)self purge_amount_reported] <= v4)
  {
    int v5 = &off_1000616C0;
  }
  else
  {
    int v5 = +[NSNumber numberWithUnsignedLongLong:(unsigned char *)[(CacheDeletePurgeOperation *)self purge_amount_reported] - v4];
  }
  [v5 doubleValue];
  double v7 = v6;
  id v8 = +[NSNumber numberWithUnsignedLongLong:[(CacheDeletePurgeOperation *)self purge_amount_needed]];
  [v8 doubleValue];
  BOOL v10 = v7 <= v9 * 0.03;

  return v10;
}

- (id)purgeSentinel:(BOOL)a3 outInode:(unint64_t *)a4
{
  BOOL v5 = a3;
  double v6 = sentinelDir();
  double v7 = v6;
  if (!v6)
  {
    double v9 = 0;
    goto LABEL_28;
  }
  memset(&v32, 0, sizeof(v32));
  id v8 = [v6 stringByAppendingPathComponent:@"CacheDeleteFSPurgeInProgress"];
  double v9 = v8;
  if (!v5)
  {
    id v20 = v8;
    int v21 = unlink((const char *)[v20 UTF8String]);
    v15 = CDGetLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [v20 UTF8String];
      if (v21)
      {
        v23 = __error();
        long long v24 = strerror(*v23);
      }
      else
      {
        long long v24 = "No Error";
      }
      *(_DWORD *)buf = 136315394;
      __darwin_ino64_t st_ino = (__darwin_ino64_t)v22;
      __int16 v35 = 2080;
      v36 = v24;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "purgeDoneSentinel unlink'd %s : %s", buf, 0x16u);
    }
    goto LABEL_27;
  }
  id v10 = v7;
  if (mkdir((const char *)[v10 UTF8String], 0x1EDu) && *__error() != 17)
  {
    v11 = CDGetLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v29 = [v10 UTF8String];
      id v30 = __error();
      v31 = strerror(*v30);
      *(_DWORD *)buf = 136315394;
      __darwin_ino64_t st_ino = (__darwin_ino64_t)v29;
      __int16 v35 = 2080;
      v36 = v31;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "purgeDoneSentinel mkdir failed for %s : %s", buf, 0x16u);
    }
  }
  id v12 = v9;
  int v13 = open((const char *)[v12 UTF8String], 514, 448);
  id v14 = CDGetLogHandle();
  v15 = v14;
  if (v13 == -1)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v25 = [v12 UTF8String];
      long long v26 = __error();
      long long v27 = strerror(*v26);
      *(_DWORD *)buf = 136315394;
      __darwin_ino64_t st_ino = (__darwin_ino64_t)v25;
      __int16 v35 = 2080;
      v36 = v27;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "purgeDoneSentinel unable to open %s : %s", buf, 0x16u);
    }
LABEL_27:

    goto LABEL_28;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v12 UTF8String];
    *(_DWORD *)buf = 136315138;
    __darwin_ino64_t st_ino = (__darwin_ino64_t)v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "purgeDoneSentinel Created %s", buf, 0xCu);
  }

  if (fstat(v13, &v32))
  {
    v17 = CDGetLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = __error();
      v19 = strerror(*v18);
      *(_DWORD *)buf = 138412546;
      __darwin_ino64_t st_ino = (__darwin_ino64_t)v12;
      __int16 v35 = 2080;
      v36 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "purgeDoneSentinel Unable to fstat %@ : %s", buf, 0x16u);
    }
  }
  else
  {
    if (a4) {
      *a4 = v32.st_ino;
    }
    v17 = CDGetLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __darwin_ino64_t st_ino = v32.st_ino;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "purgeDoneSentinel ino: %llu", buf, 0xCu);
    }
  }

  close(v13);
  double v9 = v12;
LABEL_28:

  return v9;
}

- (void)batchServicesForVolume:(id)a3 atUrgency:(int)a4 services:(id)a5 batchSize:(int)a6 block:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  v69 = (uint64_t (**)(id, void *))a7;
  id v12 = +[CDDaemonPurgeableResultCache sharedPurgeableResultsCache];
  uint64_t v70 = objc_opt_new();
  v66 = v12;
  int v13 = [v12 recentInfoForVolume:v10 atUrgency:v9];
  id v14 = objc_opt_new();
  v74 = v13;
  if ([v11 count])
  {
    int v67 = v9;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v64 = v11;
    id obj = v11;
    id v15 = [obj countByEnumeratingWithState:&v86 objects:v96 count:16];
    if (!v15) {
      goto LABEL_20;
    }
    id v16 = v15;
    uint64_t v17 = *(void *)v87;
    while (1)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v87 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v86 + 1) + 8 * i);
        id v20 = [v10 mountPoint];
        int v21 = getRootVolume();
        if ([v20 isEqualToString:v21])
        {

LABEL_10:
          long long v24 = [v13 objectForKeyedSubscript:v19];

          if (v24)
          {
            id v25 = [v13 objectForKeyedSubscript:v19];
            [v14 setObject:v25 forKeyedSubscript:v19];
          }
          else
          {
            [v14 setObject:&off_1000616C0 forKeyedSubscript:v19];
          }
          continue;
        }
        id v22 = [(CacheDeleteOperation *)self volumes];
        id v23 = [v22 count];

        int v13 = v74;
        if (v23 == (id)1) {
          goto LABEL_10;
        }
        long long v26 = [v74 objectForKeyedSubscript:v19];

        if (v26)
        {
          long long v27 = [v74 objectForKeyedSubscript:v19];
          objc_super v28 = evaluateNumberProperty();

          if (v28 && [v28 intValue])
          {
            id v29 = [v74 objectForKeyedSubscript:v19];
            [v14 setObject:v29 forKeyedSubscript:v19];
          }
        }
      }
      id v16 = [obj countByEnumeratingWithState:&v86 objects:v96 count:16];
      if (!v16)
      {
LABEL_20:

        LODWORD(v9) = v67;
        id v11 = v64;
        break;
      }
    }
  }
  id v30 = CDGetLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "batchServicesForVolume end", buf, 2u);
  }

  v31 = [v14 allKeys];
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = __87__CacheDeletePurgeOperation_batchServicesForVolume_atUrgency_services_batchSize_block___block_invoke;
  v83[3] = &unk_10005DA50;
  id v65 = v14;
  id v84 = v65;
  id v72 = v11;
  id v85 = v72;
  stat v32 = [v31 sortedArrayUsingComparator:v83];
  id v33 = [v32 mutableCopy];

  v34 = CDGetLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v35 = [v10 mountPoint];
    *(_DWORD *)buf = 67109634;
    int v92 = 227;
    __int16 v93 = 1024;
    *(_DWORD *)v94 = v9;
    *(_WORD *)&v94[4] = 2114;
    *(void *)&v94[6] = v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%d sortedPurgeable [urgency: %d, volume: %{public}@]:", buf, 0x18u);
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v36 = v33;
  id v37 = [v36 countByEnumeratingWithState:&v79 objects:v95 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v80;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v80 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v79 + 1) + 8 * (void)j);
        v42 = CDGetLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = [v74 objectForKeyedSubscript:v41];
          *(_DWORD *)buf = 67109634;
          int v92 = 229;
          __int16 v93 = 2112;
          *(void *)v94 = v41;
          *(_WORD *)&v94[8] = 2112;
          *(void *)&v94[10] = v43;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%d\t%@ : %@", buf, 0x1Cu);
        }
      }
      id v38 = [v36 countByEnumeratingWithState:&v79 objects:v95 count:16];
    }
    while (v38);
  }

  if (![v36 count])
  {
    v44 = [v72 allKeys];
    id v45 = [v44 mutableCopy];

    id v36 = v45;
  }
  v46 = (void *)v70;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v47 = v36;
  id v48 = [v47 countByEnumeratingWithState:&v75 objects:v90 count:16];
  v49 = &off_10004A000;
  if (v48)
  {
    id v50 = v48;
    uint64_t v51 = *(void *)v76;
    while (2)
    {
      for (k = 0; k != v50; k = (char *)k + 1)
      {
        if (*(void *)v76 != v51) {
          objc_enumerationMutation(v47);
        }
        v53 = [v72 objectForKeyedSubscript:*(void *)(*((void *)&v75 + 1) + 8 * (void)k)];
        if (v53)
        {
          [v46 addObject:v53];
          if ((unint64_t)[v46 count] >= a6)
          {
            v54 = CDGetLogHandle();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              id v55 = [v46 count];
              *(_DWORD *)buf = 67109376;
              int v92 = 243;
              __int16 v93 = 2048;
              *(void *)v94 = v55;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%d Calling block with %lu batch items", buf, 0x12u);
            }

            int v56 = v69[2](v69, v46);
            [v46 removeAllObjects];
            v57 = CDGetLogHandle();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109378;
              v58 = "FALSE";
              if (v56) {
                v58 = "TRUE";
              }
              int v92 = 246;
              __int16 v93 = 2080;
              *(void *)v94 = v58;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%d batch block returned: %s", buf, 0x12u);
            }

            v46 = (void *)v70;
            if ((v56 & 1) == 0)
            {

              int v59 = 0;
              goto LABEL_54;
            }
          }
        }
      }
      id v50 = [v47 countByEnumeratingWithState:&v75 objects:v90 count:16];
      if (v50) {
        continue;
      }
      break;
    }
    int v59 = 1;
LABEL_54:
    v49 = &off_10004A000;
  }
  else
  {
    int v59 = 1;
  }

  v60 = CDGetLogHandle();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    v61 = "FALSE";
    if (v59) {
      v61 = "TRUE";
    }
    *(_DWORD *)buf = *((void *)v49 + 209);
    int v92 = 253;
    __int16 v93 = 2080;
    *(void *)v94 = v61;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%d batch for loop done, proceed: %s", buf, 0x12u);
  }

  if (v59 && [v46 count])
  {
    v62 = CDGetLogHandle();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      id v63 = [v46 count];
      *(_DWORD *)buf = 67109376;
      int v92 = 255;
      __int16 v93 = 2048;
      *(void *)v94 = v63;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%d Calling block with %lu batch items", buf, 0x12u);
    }

    v69[2](v69, v46);
  }
}

uint64_t __87__CacheDeletePurgeOperation_batchServicesForVolume_atUrgency_services_batchSize_block___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = evaluateStringProperty();
  double v6 = evaluateStringProperty();

  double v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v8 = evaluateNumberProperty();

  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  id v10 = evaluateNumberProperty();

  id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];

  if (!v11)
  {

    id v8 = 0;
  }
  id v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];

  if (v12)
  {
    BOOL v13 = v10 != 0;
    if (v8 && v10)
    {
      uint64_t v14 = (uint64_t)[v10 compare:v8];
      goto LABEL_11;
    }
  }
  else
  {

    BOOL v13 = 0;
    id v10 = 0;
  }
  if (v8 == 0 && v13) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = -1;
  }
LABEL_11:

  return v14;
}

- (unint64_t)volumeContribution:(id)a3 urgency:(int)a4 isTargetVolume:(BOOL)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = +[CDDaemonPurgeableResultCache sharedPurgeableResultsCache];
  uint64_t v9 = [v8 recentInfoForVolume:v7 atUrgency:v6];

  id v10 = [v9 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_AVAILABLE"];
  id v11 = evaluateNumberProperty();

  if (a5
    || ([v9 objectForKeyedSubscript:@"CACHE_DELETE_SHARED_PURGEABLE"],
        id v12 = objc_claimAutoreleasedReturnValue(),
        evaluateNumberProperty(),
        BOOL v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    id v14 = [v11 unsignedLongLongValue];
  }
  else
  {
    id v14 = [v13 unsignedLongLongValue];
  }
  return (unint64_t)v14;
}

- (id)filterServices:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v5 = objc_msgSend(v3, "objectForKeyedSubscript:", @"CACHE_DELETE_SERVICES", 0);
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v11 = fsPurgeableTypeToServiceMap();
        id v12 = [v11 allValues];
        unsigned int v13 = [v12 containsObject:v10];

        if (v13) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v14 = [v4 copy];
  return v14;
}

- (void)_startOperation:(id)a3
{
  v156 = (void (**)(id, id))a3;
  [(CacheDeleteOperation *)self setStart_time:(double)mach_absolute_time()];
  v163 = self;
  id v4 = [(CacheDeleteOperation *)self info];
  id v158 = [v4 mutableCopy];

  uint64_t v202 = 0;
  v203 = (id *)&v202;
  uint64_t v204 = 0x3032000000;
  v205 = __Block_byref_object_copy__5;
  v206 = __Block_byref_object_dispose__5;
  id v207 = 0;
  BOOL v5 = [(CacheDeleteOperation *)v163 info];
  id v6 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v157 = evaluateStringProperty();

  if (v157)
  {
    id v7 = +[CacheDeleteDaemonVolume volumeWithPath:](CacheDeleteDaemonVolume, "volumeWithPath:");
    uint64_t v8 = v163;
    if (!v7)
    {
      uint64_t v9 = CDGetLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        buf.f_bsize = 138412290;
        *(void *)&buf.f_iosize = v157;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to validate volume: %@", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v8 = v163;
    }
    v160 = v7;
    id v10 = [v7 initialFreespace];
    id v11 = [(CacheDeleteOperation *)v8 info];
    id v12 = [v11 objectForKeyedSubscript:@"CACHE_DELETE_CALLING_PROCESS"];
    evaluateStringProperty();
    v153 = (__CFString *)objc_claimAutoreleasedReturnValue();

    unsigned int v13 = [CDPurgeOperationResult alloc];
    id v14 = [(CacheDeleteOperation *)v163 volumeNames];
    id v15 = [(CacheDeletePurgeOperation *)v163 purge_amount_needed];
    if (v153) {
      CFStringRef v16 = v153;
    }
    else {
      CFStringRef v16 = @"unknown";
    }
    long long v17 = [(CDPurgeOperationResult *)v13 initWithVolumes:v14 requestedBytes:v15 mainVolume:v160 clientProcName:v16];
    [(CacheDeletePurgeOperation *)v163 setPurgeResult:v17];

    id v18 = (id)[(CacheDeleteOperation *)v163 urgency];
    long long v19 = [(CacheDeletePurgeOperation *)v163 purgeResult];
    [v19 setLevel:v18];

    id v20 = [(CacheDeleteOperation *)v163 info];
    int v21 = [v20 objectForKeyedSubscript:@"CACHE_DELETE_EVENT_KEY"];
    id v22 = [v21 isEqualToString:@"CD_LOWDISK_EVENT"];
    id v23 = [(CacheDeletePurgeOperation *)v163 purgeResult];
    [v23 setLowDisk:v22];

    long long v24 = [(CacheDeleteOperation *)v163 info];
    id v25 = [v24 objectForKeyedSubscript:@"CACHE_DELETE_EVENT_KEY"];
    id v26 = [v25 isEqualToString:@"CD_VERYLOWDISK_EVENT"];
    long long v27 = [(CacheDeletePurgeOperation *)v163 purgeResult];
    [v27 setVeryLowDisk:v26];

    objc_super v28 = [(CacheDeleteOperation *)v163 info];
    id v29 = [v28 objectForKeyedSubscript:@"CACHE_DELETE_EVENT_KEY"];
    id v30 = [v29 isEqualToString:@"CD_NEAR_LOW_DISK_EVENT"];
    v31 = [(CacheDeletePurgeOperation *)v163 purgeResult];
    [v31 setNearLowDisk:v30];

    stat v32 = +[NSNumber numberWithUnsignedLongLong:v10];
    [v158 setObject:v32 forKeyedSubscript:@"CACHE_DELETE_FREESPACE_BEGIN"];

    [v158 setObject:&off_1000616C0 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    id v33 = CDGetLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int32_t v34 = [(CacheDeleteOperation *)v163 urgencyLimit];
      __int16 v35 = [(CacheDeleteOperation *)v163 result];
      buf.f_bsize = 67109378;
      buf.f_iosize = v34;
      LOWORD(buf.f_blocks) = 2114;
      *(uint64_t *)((char *)&buf.f_blocks + 2) = (uint64_t)v35;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "urgencyLimit: %d, info at start: %{public}@", (uint8_t *)&buf, 0x12u);
    }
    [(CacheDeletePurgeOperation *)v163 setPurge_amount_reported:0];
    uint64_t v196 = 0;
    v197 = &v196;
    uint64_t v198 = 0x3032000000;
    v199 = __Block_byref_object_copy__5;
    v200 = __Block_byref_object_dispose__5;
    id v201 = 0;
    id v36 = CDGetLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = [v160 mountPoint];
      id v38 = [v160 fsType];
      buf.f_bsize = 138543618;
      *(void *)&buf.f_iosize = v37;
      WORD2(buf.f_blocks) = 2114;
      *(uint64_t *)((char *)&buf.f_blocks + 6) = (uint64_t)v38;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "mainVolume: %{public}@, fstype: %{public}@", (uint8_t *)&buf, 0x16u);
    }
    uint64_t v39 = [v160 fsType];
    if ([v39 isEqualToString:@"apfs"])
    {
      v40 = [(CacheDeleteOperation *)v163 services];
      uint64_t v41 = [v40 objectForKeyedSubscript:@"com.apple.deleted_helper"];
      BOOL v42 = v41 == 0;

      if (!v42)
      {
        FSEventStreamEventId CurrentEventId = FSEventsGetCurrentEventId();
        v44 = CDGetLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          buf.f_bsize = 134217984;
          *(void *)&buf.f_iosize = CurrentEventId;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "beforePurgeEventID: %llu", (uint8_t *)&buf, 0xCu);
        }

        long long v194 = 0u;
        *(_OWORD *)dsema = 0u;
        memset(&context, 0, sizeof(context));
        uint64_t v192 = 0;
        id v45 = [(CacheDeletePurgeOperation *)v163 purgeSentinel:1 outInode:&v192];
        if (v192)
        {
          bzero(&buf, 0x878uLL);
          id v46 = v45;
          if (statfs((const char *)[v46 UTF8String], &buf))
          {
            id v47 = CDGetLogHandle();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              v148 = (char *)[v46 UTF8String];
              v149 = __error();
              v150 = strerror(*v149);
              *(_DWORD *)v217 = 136446466;
              v218 = v148;
              __int16 v219 = 2080;
              v220 = v150;
              _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "statfs failed for \"%{public}s\" : %s", v217, 0x16u);
            }

            id obj = 0;
            v154 = 0;
            id v155 = 0;

LABEL_101:
            _Block_object_dispose(&v196, 8);

            id v48 = v160;
            goto LABEL_102;
          }
          *(void *)&long long v194 = v192;
          *((void *)&v194 + 1) = buf.f_fsid;
          v127 = dispatch_semaphore_create(0);
          dispatch_semaphore_t v128 = dsema[1];
          dsema[1] = v127;

          context.info = &v194;
          v129 = sentinelDir();
          v216 = v129;
          v126 = FSEventStreamCreate(0, (FSEventStreamCallback)fsEventStreamMonitor, &context, (CFArrayRef)+[NSArray arrayWithObjects:&v216 count:1], 0xFFFFFFFFFFFFFFFFLL, 0.0, 0x51u);
          if (v126)
          {
            v130 = CDGetLogHandle();
            if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v217 = 138412290;
              v218 = (char *)v129;
              _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_DEFAULT, "Created FSEventStream with: %@", v217, 0xCu);
            }

            v131 = dispatch_get_global_queue(0, 0);
            FSEventStreamSetDispatchQueue(v126, v131);

            FSEventStreamStart(v126);
          }
          else
          {
            v132 = CDGetLogHandle();
            if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
            {
              v151 = __error();
              v152 = strerror(*v151);
              *(_DWORD *)v217 = 136315138;
              v218 = v152;
              _os_log_error_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_ERROR, "unable to create fsEventStream: %s", v217, 0xCu);
            }
          }
        }
        else
        {
          v125 = CDGetLogHandle();
          if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.f_bsize) = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_ERROR, "unable to create sentinel file", (uint8_t *)&buf, 2u);
          }

          v126 = 0;
        }
        *(void *)&buf.f_bsize = 0;
        buf.f_blocks = (uint64_t)&buf;
        buf.f_bfree = 0x2020000000;
        buf.f_bavail = 0;
        v133 = CDGetLogHandle();
        if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
        {
          v134 = [(CacheDeleteOperation *)v163 volumes];
          *(_DWORD *)v217 = 138412290;
          v218 = v134;
          _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "VOLUMES: %@", v217, 0xCu);
        }
        v187[0] = _NSConcreteStackBlock;
        v187[1] = 3221225472;
        v187[2] = __45__CacheDeletePurgeOperation__startOperation___block_invoke;
        v187[3] = &unk_10005DAA0;
        v187[4] = v163;
        v135 = v160;
        v188 = v135;
        id v136 = v158;
        id v189 = v136;
        p_statfs buf = &buf;
        v191 = &v196;
        [(CacheDeleteOperation *)v163 performBlockWithUrgency:v187];
        BOOL v137 = 0;
        if (v126 && v192)
        {
          id v138 = [(CacheDeletePurgeOperation *)v163 purgeSentinel:0 outInode:0];
          dispatch_semaphore_wait(dsema[1], 0xFFFFFFFFFFFFFFFFLL);
          BOOL v137 = LOBYTE(dsema[0]) != 0;
          dispatch_semaphore_t v139 = dsema[1];
          dsema[1] = 0;

          FSEventStreamStop(v126);
          FSEventStreamInvalidate(v126);
          FSEventStreamRelease(v126);
        }
        if ([(CacheDeletePurgeOperation *)v163 purge_amount_reported]
          || [v135 amountPurged])
        {
          if (v197[5])
          {
            v214[0] = @"CACHE_DELETE_FSPURGED_VOLUMES";
            v140 = +[NSNumber numberWithUnsignedLongLong:CurrentEventId];
            v212 = v140;
            uint64_t v213 = v197[5];
            v141 = +[NSDictionary dictionaryWithObjects:&v213 forKeys:&v212 count:1];
            v215[0] = v141;
            v214[1] = @"rescan";
            v142 = +[NSNumber numberWithBool:v137];
            v215[1] = v142;
            v154 = +[NSDictionary dictionaryWithObjects:v215 forKeys:v214 count:2];
          }
          else
          {
            v154 = 0;
          }
          id v143 = [v135 amountPurged];
          if (v143 >= (id)[(CacheDeletePurgeOperation *)v163 purge_amount_needed])
          {
            v144 = CDGetLogHandle();
            if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
            {
              v145 = [v135 mountPoint];
              *(_DWORD *)v217 = 138543362;
              v218 = v145;
              _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_DEFAULT, "[Purge goal satisfied by fsPurge for %{public}@, skipping cleanup and services loop", v217, 0xCu);
            }
            [v136 setObject:&__kCFBooleanFalse forKeyedSubscript:@"CACHE_DELETE_QUERY_AFTER_PURGE"];
            int v146 = 24;
LABEL_130:

            _Block_object_dispose(&buf, 8);
            if (v146)
            {
              id obj = 0;
              v162 = 0;
              id v155 = 0;
LABEL_74:
              uint64_t v92 = mach_absolute_time();
              [(CacheDeleteOperation *)v163 start_time];
              double v94 = v93;
              double v95 = gTimebaseConversion;
              v96 = [v158 objectForKeyedSubscript:@"CACHE_DELETE_QUERY_AFTER_PURGE"];
              BOOL v97 = v96 == 0;

              if (v97)
              {
                v98 = +[NSNumber numberWithInt:[(CacheDeletePurgeOperation *)v163 reportedAmountMatchesFreedSpace:v160] ^ 1];
                [v158 setObject:v98 forKeyedSubscript:@"CACHE_DELETE_QUERY_AFTER_PURGE"];
              }
              if (v154) {
                [v158 setObject:v154 forKeyedSubscript:@"CACHE_DELETE_FS_PURGE_NOTIFY"];
              }
              v99 = +[NSNumber numberWithUnsignedLongLong:[(CacheDeletePurgeOperation *)v163 purge_amount_reported]];
              [v158 setObject:v99 forKeyedSubscript:@"CACHE_DELETE_AMOUNT_REPORTED"];

              v100 = +[NSNumber numberWithDouble:((double)v92 - v94) * v95 / 1000000000.0];
              [v158 setObject:v100 forKeyedSubscript:@"CACHE_DELETE_ELAPSED_TIME"];

              if ([(CacheDeletePurgeOperation *)v163 cancel]) {
                [v158 setObject:@"Purge operation was cancelled" forKeyedSubscript:@"CACHE_DELETE_ERROR"];
              }
              v101 = +[NSNumber numberWithUnsignedLongLong:[v160 amountPurged]];
              [v158 setObject:v101 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

              v102 = +[NSNumber numberWithUnsignedLongLong:[(CacheDeletePurgeOperation *)v163 purge_amount_reported]];
              [v158 setObject:v102 forKeyedSubscript:@"CACHE_DELETE_AMOUNT_REPORTED"];

              id v103 = [v160 freespace];
              v104 = +[NSNumber numberWithUnsignedLongLong:v103];
              [v158 setObject:v104 forKeyedSubscript:@"CACHE_DELETE_FREESPACE_END"];

              v105 = [(CacheDeletePurgeOperation *)v163 purgeResult];
              [v105 setEndFreeSpace:v103];

              v106 = [(CacheDeletePurgeOperation *)v163 purgeResult];
              [v106 finish];

              v107 = [v158 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
              id v108 = [v107 unsignedLongLongValue];

              if ([(CacheDeletePurgeOperation *)v163 cancel])
              {
                [v158 setObject:@"Operation Cancelled" forKeyedSubscript:@"CACHE_DELETE_ERROR"];
                [v158 setObject:&__kCFBooleanTrue forKeyedSubscript:@"CACHE_DELETE_OPERATION_CANCELLED"];
              }
              else if (v108 < (id)[(CacheDeletePurgeOperation *)v163 purge_amount_needed])
              {
                v109 = CDGetLogHandle();
                if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
                {
                  v147 = [v160 mountPoint];
                  buf.f_bsize = 138543362;
                  *(void *)&buf.f_iosize = v147;
                  _os_log_error_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "CacheDelete was unable to satisfy the purge request for volume: %{public}@", (uint8_t *)&buf, 0xCu);
                }
                v110 = [(CacheDeletePurgeOperation *)v163 purgeResult];
                [v110 setSuccess:0];
              }
              v111 = [(CacheDeleteOperation *)v163 analyticsReporter];
              v112 = [(CacheDeletePurgeOperation *)v163 purgeResult];
              [v111 reportPurge:v112];

              v113 = [(CacheDeleteOperation *)v163 testFailures];
              if (v113)
              {
                v114 = [(CacheDeleteOperation *)v163 testFailures];
                BOOL v115 = [v114 count] == 0;

                if (!v115)
                {
                  v116 = [(CacheDeleteOperation *)v163 testFailures];
                  [v158 setObject:v116 forKeyedSubscript:@"CACHE_DELETE_TEST_FAILURES"];
                }
              }
              v117 = CDGetLogHandle();
              if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
              {
                buf.f_bsize = 134349314;
                *(void *)&buf.f_iosize = v108;
                WORD2(buf.f_blocks) = 2114;
                *(uint64_t *)((char *)&buf.f_blocks + 6) = (uint64_t)v160;
                _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "Purge Result: %{public}llu bytes on: %{public}@", (uint8_t *)&buf, 0x16u);
              }

              long long v166 = 0u;
              long long v167 = 0u;
              long long v164 = 0u;
              long long v165 = 0u;
              id v118 = v158;
              id v119 = [v118 countByEnumeratingWithState:&v164 objects:v208 count:16];
              if (v119)
              {
                uint64_t v120 = *(void *)v165;
                do
                {
                  for (i = 0; i != v119; i = (char *)i + 1)
                  {
                    if (*(void *)v165 != v120) {
                      objc_enumerationMutation(v118);
                    }
                    uint64_t v122 = *(void *)(*((void *)&v164 + 1) + 8 * i);
                    v123 = CDGetLogHandle();
                    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
                    {
                      v124 = [v118 objectForKeyedSubscript:v122];
                      buf.f_bsize = 138543618;
                      *(void *)&buf.f_iosize = v122;
                      WORD2(buf.f_blocks) = 2114;
                      *(uint64_t *)((char *)&buf.f_blocks + 6) = (uint64_t)v124;
                      _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "%{public}@ : %{public}@", (uint8_t *)&buf, 0x16u);
                    }
                  }
                  id v119 = [v118 countByEnumeratingWithState:&v164 objects:v208 count:16];
                }
                while (v119);
              }

              v156[2](v156, v118);
              goto LABEL_101;
            }
LABEL_27:
            v49 = [(CacheDeleteOperation *)v163 services];
            BOOL v50 = (unint64_t)[v49 count] > 1;

            if (v50)
            {
              long long v185 = 0u;
              long long v186 = 0u;
              long long v183 = 0u;
              long long v184 = 0u;
              uint64_t v51 = v163;
              v52 = [(CacheDeleteOperation *)v163 services];
              id v53 = [v52 countByEnumeratingWithState:&v183 objects:v211 count:16];
              if (v53)
              {
                uint64_t v54 = *(void *)v184;
                while (2)
                {
                  for (j = 0; j != v53; j = (char *)j + 1)
                  {
                    if (*(void *)v184 != v54) {
                      objc_enumerationMutation(v52);
                    }
                    uint64_t v56 = *(void *)(*((void *)&v183 + 1) + 8 * (void)j);
                    v57 = [(CacheDeleteOperation *)v51 services];
                    v58 = [v57 objectForKeyedSubscript:v56];

                    int v59 = [v58 ID];
                    unsigned int v60 = [v59 isEqualToString:@"com.apple.mobile.cache_delete_mobile_backup"];

                    if (v60)
                    {
                      objc_storeStrong(v203 + 5, v58);

                      goto LABEL_38;
                    }

                    uint64_t v51 = v163;
                  }
                  id v53 = [v52 countByEnumeratingWithState:&v183 objects:v211 count:16];
                  if (v53) {
                    continue;
                  }
                  break;
                }
              }
LABEL_38:
            }
            v61 = [(CacheDeleteOperation *)v163 services];
            id v62 = [v61 mutableCopy];

            id v63 = v203[5];
            if (v63)
            {
              id v64 = [v63 ID];
              [v62 removeObjectForKey:v64];
            }
            [v62 removeObjectForKey:@"com.apple.deleted_helper"];
            v162 = objc_opt_new();
            long long v181 = 0u;
            long long v182 = 0u;
            long long v179 = 0u;
            long long v180 = 0u;
            id obj = v62;
            id v65 = [obj countByEnumeratingWithState:&v179 objects:v210 count:16];
            if (v65)
            {
              uint64_t v66 = *(void *)v180;
              do
              {
                for (k = 0; k != v65; k = (char *)k + 1)
                {
                  if (*(void *)v180 != v66) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v68 = *(void *)(*((void *)&v179 + 1) + 8 * (void)k);
                  v69 = fsPurgeableTypeForService();

                  if (v69) {
                    [v162 addObject:v68];
                  }
                }
                id v65 = [obj countByEnumeratingWithState:&v179 objects:v210 count:16];
              }
              while (v65);
            }

            [obj removeObjectsForKeys:v162];
            id v155 = [obj copy];
            if (v203[5])
            {
              if (![(CacheDeletePurgeOperation *)v163 cancel])
              {
                if (!-[CacheDeletePurgeOperation reportedAmountMatchesFreedSpace:](v163, "reportedAmountMatchesFreedSpace:", v160)|| (-[CacheDeletePurgeOperation purgeResult](v163, "purgeResult"), uint64_t v70 = objc_claimAutoreleasedReturnValue(), v71 = [v70 isVeryLowDisk], v70, v71))
                {
                  [(CacheDeleteOperation *)v163 non_negative_time_remaining];
                  double v73 = v72;
                  long long v177 = 0u;
                  long long v178 = 0u;
                  long long v175 = 0u;
                  long long v176 = 0u;
                  v74 = [(CacheDeleteOperation *)v163 volumes];
                  id v75 = [v74 countByEnumeratingWithState:&v175 objects:v209 count:16];
                  if (v75)
                  {
                    uint64_t v76 = *(void *)v176;
                    id v159 = v74;
                    do
                    {
                      for (m = 0; m != v75; m = (char *)m + 1)
                      {
                        if (*(void *)v176 != v76) {
                          objc_enumerationMutation(v159);
                        }
                        uint64_t v78 = *(void *)(*((void *)&v175 + 1) + 8 * (void)m);
                        long long v79 = +[NSMutableArray array];
                        id v80 = [(CacheDeletePurgeOperation *)v163 purge_amount_needed];
                        if (v80 > [v160 amountPurged])
                        {
                          long long v81 = [(CacheDeletePurgeOperation *)v163 purge_amount_needed];
                          long long v82 = [v160 amountPurged];
                          v83 = CDGetLogHandle();
                          int64_t v84 = v81 - v82;
                          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                          {
                            buf.f_bsize = 134218242;
                            *(void *)&buf.f_iosize = v81 - v82;
                            WORD2(buf.f_blocks) = 2114;
                            *(uint64_t *)((char *)&buf.f_blocks + 6) = v78;
                            _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "[Purge VERY_LOWDISK]: asking snapshot holders for %llu bytes from %{public}@", (uint8_t *)&buf, 0x16u);
                          }

                          id v85 = v203[5];
                          if ([(CacheDeleteOperation *)v163 clientSpecifiedTimeout]) {
                            unint64_t v86 = (unint64_t)v73;
                          }
                          else {
                            unint64_t v86 = 900;
                          }
                          long long v87 = [(CacheDeleteOperation *)v163 result];
                          long long v88 = [v87 objectForKeyedSubscript:@"CACHE_DELETE_TEST_PARAMETERS"];
                          [(CacheDeletePurgeOperation *)v163 oneShot:v85 volume:v78 urgency:3 donation:v84 currentRoundResults:v79 timeout:v86 info:&off_1000613A0 optionalTestInfo:v88];
                        }
                      }
                      v74 = v159;
                      id v75 = [v159 countByEnumeratingWithState:&v175 objects:v209 count:16];
                    }
                    while (v75);
                  }
                }
              }
            }
            id v89 = [v160 amountPurged];
            if (v89 >= (id)[(CacheDeletePurgeOperation *)v163 purge_amount_needed])
            {
              v90 = CDGetLogHandle();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
              {
                v91 = [v160 mountPoint];
                buf.f_bsize = 138543362;
                *(void *)&buf.f_iosize = v91;
                _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "[Purge goal satisfied for %{public}@, skipping services loop", (uint8_t *)&buf, 0xCu);
              }
            }
            else
            {
              *(void *)&buf.f_bsize = 0;
              buf.f_blocks = (uint64_t)&buf;
              buf.f_bfree = 0x2020000000;
              LOBYTE(buf.f_bavail) = 0;
              LOBYTE(buf.f_bavail) = [(CacheDeleteOperation *)v163 timeoutNotReached];
              v168[0] = _NSConcreteStackBlock;
              v168[1] = 3221225472;
              v168[2] = __45__CacheDeletePurgeOperation__startOperation___block_invoke_81;
              v168[3] = &unk_10005DB18;
              v173 = &buf;
              v168[4] = v163;
              v169 = v160;
              id v170 = v158;
              id v171 = v157;
              id v155 = v155;
              id v172 = v155;
              v174 = &v202;
              [(CacheDeleteOperation *)v163 performBlockWithUrgency:v168];

              _Block_object_dispose(&buf, 8);
            }
            goto LABEL_74;
          }
        }
        else
        {
          v154 = 0;
        }
        int v146 = 0;
        goto LABEL_130;
      }
    }
    else
    {
    }
    v154 = 0;
    goto LABEL_27;
  }
  id v48 = CDGetLogHandle();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf.f_bsize) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "No volume name in info dictionary.", (uint8_t *)&buf, 2u);
  }
  id obj = 0;
  id v155 = 0;
LABEL_102:

  _Block_object_dispose(&v202, 8);
}

uint64_t __45__CacheDeletePurgeOperation__startOperation___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v36 = [*(id *)(a1 + 32) timeoutNotReached];
  dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
  uint64_t v55 = 0;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  double v54 = 0.0;
  double v54 = nan("");
  id v4 = *(void **)(a1 + 32);
  BOOL v5 = [v4 info];
  id v38 = [v4 filterServices:v5];

  dispatch_semaphore_t v6 = v34;
  uint64_t v37 = mach_absolute_time();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v7 = [*(id *)(a1 + 32) volumes];
  id v8 = [v7 countByEnumeratingWithState:&v49 objects:v69 count:16];
  if (!v8) {
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)v50;
  *(void *)&long long v9 = 134219010;
  long long v33 = v9;
  id obj = v7;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v50 != v10) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      id v13 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed", v33);
      if (v13 <= [*(id *)(a1 + 40) amountPurged])
      {
        int64_t v15 = 0;
      }
      else
      {
        id v14 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed");
        int64_t v15 = v14 - (unsigned char *)[*(id *)(a1 + 40) amountPurged];
      }
      CFStringRef v16 = [v12 mountPoint];
      id v17 = (id)dropBreadcrumb();

      id v18 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed");
      if (v18 <= [*(id *)(a1 + 40) amountPurged])
      {
        id v30 = CDGetLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = [v12 mountPoint];
          *(_DWORD *)statfs buf = 138412290;
          unsigned int v60 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Purge satisfied, skipping %@", buf, 0xCu);
        }
        goto LABEL_22;
      }
      if ([*(id *)(a1 + 32) cancel])
      {
        [*(id *)(a1 + 48) setObject:&__kCFBooleanTrue forKeyedSubscript:@"CACHE_DELETE_OPERATION_CANCELLED"];
LABEL_22:
        unsigned __int8 v36 = 0;
        id v7 = obj;
        goto LABEL_23;
      }
      long long v19 = *(void **)(a1 + 32);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = __45__CacheDeletePurgeOperation__startOperation___block_invoke_66;
      v39[3] = &unk_10005DA78;
      uint64_t v47 = v37;
      uint64_t v44 = *(void *)(a1 + 56);
      id v45 = &v55;
      v43 = v53;
      v39[4] = v19;
      id v20 = *(id *)(a1 + 40);
      int v48 = a2;
      id v40 = v20;
      uint64_t v41 = v12;
      uint64_t v46 = *(void *)(a1 + 64);
      int v21 = v6;
      BOOL v42 = v21;
      [v19 tryFSPurge:v15 atUrgency:a2 onVolume:v12 orderedServices:v38 completion:v39];
      dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
      id v22 = [*(id *)(a1 + 40) amountPurged];
      if (v22 >= objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed"))
      {
        id v23 = CDGetLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          long long v24 = (void *)v56[3];
          id v25 = [*(id *)(a1 + 40) amountPurged];
          id v26 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed");
          long long v27 = [*(id *)(a1 + 40) mountPoint];
          uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          *(_DWORD *)statfs buf = v33;
          unsigned int v60 = v24;
          __int16 v61 = 2048;
          id v62 = v25;
          __int16 v63 = 2048;
          id v64 = v26;
          __int16 v65 = 2112;
          uint64_t v66 = v27;
          __int16 v67 = 2048;
          uint64_t v68 = v28;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "fsPurge satisfied request: %llu purged (%llu measured) of %llu needed on volume: %@, ET: %f", buf, 0x34u);

          dispatch_semaphore_t v6 = v34;
        }

        id v29 = [*(id *)(a1 + 32) purgeResult];
        [v29 setFsPurgeSuccess:1];

        unsigned __int8 v36 = 0;
      }
    }
    id v7 = obj;
    id v8 = [obj countByEnumeratingWithState:&v49 objects:v69 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_23:

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(&v55, 8);

  return v36 & 1;
}

void __45__CacheDeletePurgeOperation__startOperation___block_invoke_66(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = gTimebaseConversion
                                                              * ((double)mach_absolute_time()
                                                               - (double)*(unint64_t *)(a1 + 96))
                                                              / 1000000000.0;
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 24)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 24);
  if (v3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += [v3 reportedBytes];
    id v4 = [*(id *)(a1 + 32) purgeResult];
    [v4 addResult:v3];

    objc_msgSend(*(id *)(a1 + 32), "setPurge_amount_reported:", (char *)objc_msgSend(v3, "reportedBytes") + (void)objc_msgSend(*(id *)(a1 + 32), "purge_amount_reported"));
    BOOL v5 = [*(id *)(a1 + 32) analyticsReporter];
    [v5 reportPurgeTimingInfo:v3];
  }
  dispatch_semaphore_t v6 = CDGetLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v3 reportedBytes];
    id v8 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    id v9 = [*(id *)(a1 + 40) amountPurged];
    id v10 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed");
    id v11 = [*(id *)(a1 + 40) mountPoint];
    int v12 = *(_DWORD *)(a1 + 104);
    id v13 = [*(id *)(a1 + 48) mountPoint];
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    int v26 = 134219778;
    id v27 = v7;
    __int16 v28 = 2048;
    id v29 = v8;
    __int16 v30 = 2048;
    id v31 = v9;
    __int16 v32 = 2048;
    id v33 = v10;
    __int16 v34 = 2114;
    __int16 v35 = v11;
    __int16 v36 = 1024;
    int v37 = v12;
    __int16 v38 = 2112;
    uint64_t v39 = v13;
    __int16 v40 = 2048;
    uint64_t v41 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "fsPurge reports %llu purged (%llu total reported, %llu measured) of %llu needed on volume: %{public}@ at urgency: %d by purging volume: %@, ET: %f", (uint8_t *)&v26, 0x4Eu);
  }
  if ([v3 reportedBytes])
  {
    int64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    if (!v15)
    {
      uint64_t v16 = objc_opt_new();
      uint64_t v17 = *(void *)(*(void *)(a1 + 88) + 8);
      id v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      int64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    }
    long long v19 = [*(id *)(a1 + 48) uuid];
    id v20 = [v19 UUIDString];
    [v15 addObject:v20];

    int v21 = CDGetLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [*(id *)(a1 + 48) mountPoint];
      id v23 = [*(id *)(a1 + 48) uuid];
      long long v24 = [v23 UUIDString];
      int v26 = 138412546;
      id v27 = v22;
      __int16 v28 = 2112;
      id v29 = v24;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "fsPurge noting purge on %@ : %@", (uint8_t *)&v26, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  if (![v3 reportedBytes])
  {
    id v25 = [*(id *)(a1 + 48) mountPoint];
    removeBreadcrumb();
  }
}

BOOL __45__CacheDeletePurgeOperation__startOperation___block_invoke_81(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    unsigned __int8 v4 = [*(id *)(a1 + 32) timeoutNotReached];
    uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
  }
  else
  {
    unsigned __int8 v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    BOOL v5 = CDGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_semaphore_t v6 = [*(id *)(a1 + 40) mountPoint];
      *(_DWORD *)statfs buf = 67109378;
      *(_DWORD *)id v64 = 576;
      *(_WORD *)&v64[4] = 2112;
      *(void *)&v64[6] = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%d : Timeout reached for (%@) - stopping purge urgency loop.", buf, 0x12u);
    }
    return 0;
  }
  if ([*(id *)(a1 + 32) cancel])
  {
    [*(id *)(a1 + 48) setObject:&__kCFBooleanTrue forKeyedSubscript:@"CACHE_DELETE_OPERATION_CANCELLED"];
    return 0;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = [*(id *)(a1 + 32) volumes];
  id v42 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v60;
    *(void *)&long long v8 = 138544130;
    long long v39 = v8;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v60 != v41)
        {
          uint64_t v10 = v9;
          objc_enumerationMutation(obj);
          uint64_t v9 = v10;
        }
        uint64_t v43 = v9;
        id v11 = *(void **)(*((void *)&v59 + 1) + 8 * v9);
        uint64_t v55 = 0;
        uint64_t v56 = &v55;
        uint64_t v57 = 0x2020000000;
        id v58 = 0;
        int v12 = *(void **)(a1 + 32);
        id v45 = v11;
        id v13 = objc_msgSend(v11, "mountPoint", v39);
        id v14 = objc_msgSend(v12, "volumeContribution:urgency:isTargetVolume:", v45, a2, objc_msgSend(v13, "isEqualToString:", *(void *)(a1 + 56)));

        id v58 = v14;
        id v15 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed");
        if (v15 <= [*(id *)(a1 + 40) amountPurged])
        {
          unint64_t v17 = 0;
        }
        else
        {
          uint64_t v16 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed");
          unint64_t v17 = v16 - (unsigned char *)[*(id *)(a1 + 40) amountPurged];
        }
        unint64_t v18 = v56[3];
        if (v18 >= v17) {
          unint64_t v19 = v17;
        }
        else {
          unint64_t v19 = v56[3];
        }
        if (v18) {
          unint64_t v17 = v19;
        }
        v56[3] = v17;
        id v20 = CDGetLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)statfs buf = 138543618;
          *(void *)id v64 = v45;
          *(_WORD *)&v64[8] = 1024;
          *(_DWORD *)&v64[10] = a2;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Purging %{public}@ at urgency = %d", buf, 0x12u);
        }

        int v21 = CDGetLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = [v45 mountPoint];
          *(_DWORD *)statfs buf = 67109634;
          *(_DWORD *)id v64 = 613;
          *(_WORD *)&v64[4] = 2112;
          *(void *)&v64[6] = v22;
          *(_WORD *)&v64[14] = 1024;
          *(_DWORD *)&v64[16] = a2;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%d calling batchServicesForVolume: \"%@\", atUrgency: %d, with services:", buf, 0x18u);
        }
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v23 = *(id *)(a1 + 64);
        id v24 = [v23 countByEnumeratingWithState:&v51 objects:v67 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v52;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v52 != v25) {
                objc_enumerationMutation(v23);
              }
              uint64_t v27 = *(void *)(*((void *)&v51 + 1) + 8 * i);
              __int16 v28 = CDGetLogHandle();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)statfs buf = 67109378;
                *(_DWORD *)id v64 = 615;
                *(_WORD *)&v64[4] = 2112;
                *(void *)&v64[6] = v27;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%d\t%@", buf, 0x12u);
              }
            }
            id v24 = [v23 countByEnumeratingWithState:&v51 objects:v67 count:16];
          }
          while (v24);
        }

        uint64_t v47 = 0;
        int v48 = &v47;
        uint64_t v49 = 0x2020000000;
        int v50 = 0;
        id v29 = *(void **)(a1 + 32);
        id v46 = *(id *)(a1 + 40);
        objc_msgSend(v29, "batchServicesForVolume:atUrgency:services:batchSize:block:");
        __int16 v30 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed");
        id v31 = [*(id *)(a1 + 40) amountPurged];
        __int16 v32 = CDGetLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = [v45 mountPoint];
          int v34 = *((_DWORD *)v48 + 6);
          *(_DWORD *)statfs buf = v39;
          *(void *)id v64 = v33;
          *(_WORD *)&v64[8] = 1024;
          *(_DWORD *)&v64[10] = a2;
          *(_WORD *)&v64[14] = 1024;
          *(_DWORD *)&v64[16] = v34;
          __int16 v65 = 2048;
          uint64_t v66 = (v30 - v31) & ~((v30 - v31) >> 63);
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[Purge End](Volume %{public}@, Urgency %d) finished after %d Rounds (%llu bytes left)", buf, 0x22u);
        }
        __int16 v35 = CDGetLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v36 = "proceed";
          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
            __int16 v36 = "do not proceed";
          }
          *(_DWORD *)statfs buf = 67109378;
          *(_DWORD *)id v64 = 852;
          *(_WORD *)&v64[4] = 2080;
          *(void *)&v64[6] = v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%d Volume loop: %s", buf, 0x12u);
        }

        _Block_object_dispose(&v47, 8);
        _Block_object_dispose(&v55, 8);
        uint64_t v9 = v43 + 1;
      }
      while ((id)(v43 + 1) != v42);
      id v42 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
    }
    while (v42);
  }

  int v37 = CDGetLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
      __int16 v38 = "proceed";
    }
    else {
      __int16 v38 = "do not proceed";
    }
    *(_DWORD *)statfs buf = 67109634;
    *(_DWORD *)id v64 = 856;
    *(_WORD *)&v64[4] = 1024;
    *(_DWORD *)&v64[6] = a2;
    *(_WORD *)&v64[10] = 2080;
    *(void *)&v64[12] = v38;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%d Urgency Loop [%d] returning: %s", buf, 0x18u);
  }

  return *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) != 0;
}

BOOL __45__CacheDeletePurgeOperation__startOperation___block_invoke_82(uint64_t a1, void *a2)
{
  id v2 = a2;
  v150 = +[NSMutableArray array];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  id v3 = [*(id *)(a1 + 32) amountPurged];
  id v4 = objc_msgSend(*(id *)(a1 + 40), "purge_amount_needed");
  LOBYTE(v5) = 0;
  if (v3 < v4)
  {
    id v5 = [v2 count];
    if (v5)
    {
      if ([*(id *)(a1 + 40) cancel]) {
        LOBYTE(v5) = 0;
      }
      else {
        LOBYTE(v5) = [*(id *)(a1 + 40) timeoutNotReached];
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (_BYTE)v5;
  dispatch_semaphore_t v6 = CDGetLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = "TRUE";
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      id v7 = "FALSE";
    }
    *(_DWORD *)statfs buf = 67109378;
    *(_DWORD *)v197 = 629;
    *(_WORD *)&v197[4] = 2080;
    *(void *)&v197[6] = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%d proceed: %s, batch:", buf, 0x12u);
  }

  long long v190 = 0u;
  long long v191 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  id obj = v2;
  id v8 = [obj countByEnumeratingWithState:&v188 objects:v200 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v189;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v189 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v188 + 1) + 8 * i);
        int v12 = CDGetLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [v11 ID];
          *(_DWORD *)statfs buf = 67109378;
          *(_DWORD *)v197 = 631;
          *(_WORD *)&v197[4] = 2112;
          *(void *)&v197[6] = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%d\t%@", buf, 0x12u);
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v188 objects:v200 count:16];
    }
    while (v8);
  }

  id v14 = obj;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    goto LABEL_126;
  }
  id v14 = obj;
  while (1)
  {
    unint64_t v15 = (unint64_t)[v14 count];
    uint64_t v16 = CDGetLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v17 = "TRUE";
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        unint64_t v17 = "FALSE";
      }
      *(_DWORD *)statfs buf = 67109634;
      *(_DWORD *)v197 = 643;
      *(_WORD *)&v197[4] = 2080;
      *(void *)&v197[6] = v17;
      *(_WORD *)&v197[14] = 2048;
      *(void *)&v197[16] = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%d proceed: %s, numPlayers: %lu", buf, 0x1Cu);
    }

    id v18 = objc_msgSend(*(id *)(a1 + 40), "purge_amount_needed");
    if (v18 <= [*(id *)(a1 + 32) amountPurged]
      || (unint64_t v19 = objc_msgSend(*(id *)(a1 + 40), "purge_amount_needed"),
          id v20 = [*(id *)(a1 + 32) amountPurged],
          v19 == v20))
    {
      id v22 = CDGetLogHandle();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_125;
      }
      id v133 = objc_msgSend(*(id *)(a1 + 40), "purge_amount_needed");
      id v134 = [*(id *)(a1 + 32) amountPurged];
      *(_DWORD *)statfs buf = 134218496;
      *(void *)v197 = 0;
      *(_WORD *)&v197[8] = 2048;
      *(void *)&v197[10] = v133;
      *(_WORD *)&v197[18] = 2048;
      *(void *)&v197[20] = v134;
      v135 = "[Purge Start] aborting, (roundGoal <= 0): %llu, purge_amount_needed: %llu, amountPurged: %llu";
      id v136 = v22;
      uint32_t v137 = 32;
      goto LABEL_124;
    }
    unint64_t v147 = v19 - v20;
    BOOL v21 = v15 > v19 - v20;
    id v22 = CDGetLogHandle();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v21) {
      break;
    }
    if (v23)
    {
      int v24 = *(_DWORD *)(a1 + 88);
      int v25 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      int v26 = [*(id *)(a1 + 48) mountPoint];
      uint64_t v27 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      *(_DWORD *)statfs buf = 67110146;
      *(_DWORD *)v197 = v24;
      *(_WORD *)&v197[4] = 1024;
      *(_DWORD *)&v197[6] = v25;
      *(_WORD *)&v197[10] = 2114;
      *(void *)&v197[12] = v26;
      *(_WORD *)&v197[20] = 2048;
      *(void *)&v197[22] = v147;
      __int16 v198 = 2048;
      id v199 = v27;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[Purge Start](Urgency %d : Round %d) Volume = %{public}@, Goal = %llu, Donation = %llu, Remaining Services:", buf, 0x2Cu);
    }
    long long v186 = 0u;
    long long v187 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    id v28 = v14;
    id v29 = [v28 countByEnumeratingWithState:&v184 objects:v195 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v185;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v185 != v30) {
            objc_enumerationMutation(v28);
          }
          __int16 v32 = *(void **)(*((void *)&v184 + 1) + 8 * (void)j);
          id v33 = CDGetLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            int v34 = [v32 ID];
            *(_DWORD *)statfs buf = 67109378;
            *(_DWORD *)v197 = 656;
            *(_WORD *)&v197[4] = 2112;
            *(void *)&v197[6] = v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%d\t%@", buf, 0x12u);
          }
        }
        id v29 = [v28 countByEnumeratingWithState:&v184 objects:v195 count:16];
      }
      while (v29);
    }

    unint64_t v35 = v147 / v15;
    uint64_t v36 = *(void *)(*(void *)(a1 + 72) + 8);
    if (v147 / v15 >= *(void *)(v36 + 24)) {
      unint64_t v35 = *(void *)(v36 + 24);
    }
    *(void *)(v36 + 24) = v35;
    group = dispatch_group_create();
    int v37 = [CacheDeleteAsyncTimeoutFlag alloc];
    __int16 v38 = objc_msgSend(*(id *)(a1 + 40), "response_queue");
    v153 = [(CacheDeleteAsyncTimeoutFlag *)v37 initWithQueue:v38];

    id v151 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v28, "count"));
    long long v39 = CDGetLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v40 = [*(id *)(a1 + 48) mountPoint];
      int v41 = *(_DWORD *)(a1 + 88);
      int v42 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(_DWORD *)statfs buf = 138543874;
      *(void *)v197 = v40;
      *(_WORD *)&v197[8] = 1024;
      *(_DWORD *)&v197[10] = v41;
      *(_WORD *)&v197[14] = 1024;
      *(_DWORD *)&v197[16] = v42;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "[Purge Main](Volume: %{public}@, Urgency %d : Round %d) Begin", buf, 0x18u);
    }
    long long v182 = 0u;
    long long v183 = 0u;
    long long v180 = 0u;
    long long v181 = 0u;
    id v148 = v28;
    id v152 = [v148 countByEnumeratingWithState:&v180 objects:v194 count:16];
    uint64_t v43 = a1;
    if (v152)
    {
      uint64_t v149 = *(void *)v181;
LABEL_45:
      uint64_t v44 = 0;
      while (1)
      {
        if (*(void *)v181 != v149)
        {
          objc_enumerationMutation(v148);
          uint64_t v43 = a1;
        }
        id v155 = *(void **)(*((void *)&v180 + 1) + 8 * (void)v44);
        uint64_t v45 = *(void *)(*(void *)(v43 + 64) + 8);
        if (*(unsigned char *)(v45 + 24))
        {
          unsigned __int8 v46 = [*(id *)(v43 + 40) timeoutNotReached];
          uint64_t v43 = a1;
          uint64_t v45 = *(void *)(*(void *)(a1 + 64) + 8);
        }
        else
        {
          unsigned __int8 v46 = 0;
        }
        *(unsigned char *)(v45 + 24) = v46;
        if (([*(id *)(v43 + 40) cancel] & 1) != 0
          || !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
        {
          break;
        }
        objc_initWeak(&location, *(id *)(a1 + 40));
        uint64_t v47 = objc_msgSend(*(id *)(a1 + 40), "response_queue");
        int v48 = CDGetLogHandle();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v49 = [*(id *)(a1 + 48) mountPoint];
          int v50 = *(_DWORD *)(a1 + 88);
          int v51 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          long long v52 = [v155 ID];
          long long v53 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
          *(_DWORD *)statfs buf = 138544386;
          *(void *)v197 = v49;
          *(_WORD *)&v197[8] = 1024;
          *(_DWORD *)&v197[10] = v50;
          *(_WORD *)&v197[14] = 1024;
          *(_DWORD *)&v197[16] = v51;
          *(_WORD *)&v197[20] = 2114;
          *(void *)&v197[22] = v52;
          __int16 v198 = 2048;
          id v199 = v53;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "[Purge Main](Volume: %{public}@, Urgency %d : Round %d) %{public}@ request %llu bytes", buf, 0x2Cu);
        }
        dispatch_group_enter(group);
        uint64_t v55 = *(void **)(a1 + 40);
        uint64_t v54 = *(void *)(a1 + 48);
        uint64_t v56 = *(unsigned int *)(a1 + 88);
        uint64_t v57 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        id v58 = [v55 info];
        long long v59 = [*(id *)(a1 + 40) result];
        long long v60 = [v59 objectForKeyedSubscript:@"CACHE_DELETE_TEST_PARAMETERS"];
        v168[0] = _NSConcreteStackBlock;
        v168[1] = 3221225472;
        v168[2] = __45__CacheDeletePurgeOperation__startOperation___block_invoke_84;
        v168[3] = &unk_10005DAC8;
        objc_copyWeak(&v177, &location);
        id v61 = v47;
        id v169 = v61;
        id v170 = v153;
        id v62 = v150;
        uint64_t v63 = *(void *)(a1 + 48);
        uint64_t v64 = *(void *)(a1 + 56);
        id v171 = v62;
        uint64_t v172 = v63;
        int v178 = *(_DWORD *)(a1 + 88);
        uint64_t v176 = v64;
        v173 = v155;
        id v174 = v151;
        long long v175 = group;
        [v55 serviceRequest:v155 volume:v54 urgency:v56 donation:v57 info:v58 optionalTestInfo:v60 completion:v168];

        objc_destroyWeak(&v177);
        objc_destroyWeak(&location);
        uint64_t v44 = (char *)v44 + 1;
        uint64_t v43 = a1;
        if (v152 == v44)
        {
          id v152 = [v148 countByEnumeratingWithState:&v180 objects:v194 count:16];
          uint64_t v43 = a1;
          if (v152) {
            goto LABEL_45;
          }
          break;
        }
      }
    }

    objc_msgSend(*(id *)(a1 + 40), "non_negative_time_remaining");
    if ((unint64_t)v65 >= 0x2D) {
      unint64_t v66 = 45;
    }
    else {
      unint64_t v66 = (unint64_t)v65;
    }
    dispatch_time_t v67 = dispatch_time(0, 1000000000 * v66);
    uint64_t v68 = CDGetLogHandle();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = [*(id *)(a1 + 48) mountPoint];
      int v70 = *(_DWORD *)(a1 + 88);
      int v71 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(_DWORD *)statfs buf = 138544130;
      *(void *)v197 = v69;
      *(_WORD *)&v197[8] = 1024;
      *(_DWORD *)&v197[10] = v70;
      *(_WORD *)&v197[14] = 1024;
      *(_DWORD *)&v197[16] = v71;
      *(_WORD *)&v197[20] = 2048;
      *(void *)&v197[22] = v66;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "[Purge Main](Volume: %{public}@, Urgency %d : Round %d) Waiting for end of round: %llu seconds", buf, 0x22u);
    }
    if (dispatch_group_wait(group, v67))
    {
      [(CacheDeleteAsyncTimeoutFlag *)v153 setTimedOut:1];
      double v72 = [*(id *)(a1 + 40) purgeResult];
      [v72 setTimedOut:1];

      double v73 = [*(id *)(a1 + 40) purgeResult];
      objc_msgSend(v73, "setNoOfTimeouts:", (char *)objc_msgSend(v73, "noOfTimeouts") + 1);

      id v74 = objc_alloc((Class)NSMutableArray);
      id v75 = [*(id *)(a1 + 40) services];
      id v76 = objc_msgSend(v74, "initWithCapacity:", objc_msgSend(v75, "count"));

      long long v77 = [*(id *)(a1 + 40) services];
      v166[0] = _NSConcreteStackBlock;
      v166[1] = 3221225472;
      v166[2] = __45__CacheDeletePurgeOperation__startOperation___block_invoke_85;
      v166[3] = &unk_10005DA00;
      id v78 = v76;
      id v167 = v78;
      [v77 enumerateKeysAndObjectsUsingBlock:v166];

      BOOL v79 = [v78 count] == 0;
      id v80 = CDGetLogHandle();
      long long v81 = v80;
      if (v79)
      {
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          v132 = [*(id *)(a1 + 48) mountPoint];
          *(_DWORD *)statfs buf = 138543362;
          *(void *)v197 = v132;
          _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "Timed out with no inFlight list for volume: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          long long v82 = [*(id *)(a1 + 48) mountPoint];
          int v83 = *(_DWORD *)(a1 + 88);
          int v84 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          *(_DWORD *)statfs buf = 138544386;
          *(void *)v197 = v82;
          *(_WORD *)&v197[8] = 1024;
          *(_DWORD *)&v197[10] = v83;
          *(_WORD *)&v197[14] = 1024;
          *(_DWORD *)&v197[16] = v84;
          *(_WORD *)&v197[20] = 2048;
          *(void *)&v197[22] = v66;
          __int16 v198 = 2114;
          id v199 = v78;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "[Purge Main](Volume: %{public}@, Urgency %d : Round %d) Timed out waiting for %llu seconds: %{public}@", buf, 0x2Cu);
        }
        id v85 = [*(id *)(a1 + 40) purgeResult];
        [v85 setTimeoutTime:v66];

        long long v164 = 0u;
        long long v165 = 0u;
        long long v162 = 0u;
        long long v163 = 0u;
        long long v81 = v78;
        id v86 = [v81 countByEnumeratingWithState:&v162 objects:v193 count:16];
        if (v86)
        {
          uint64_t v87 = *(void *)v163;
          do
          {
            for (k = 0; k != v86; k = (char *)k + 1)
            {
              if (*(void *)v163 != v87) {
                objc_enumerationMutation(v81);
              }
              uint64_t v89 = *(void *)(*((void *)&v162 + 1) + 8 * (void)k);
              v90 = [*(id *)(a1 + 40) purgeResult];
              v91 = [v90 timedOutServices];
              unsigned __int8 v92 = [v91 containsObject:v89];

              if ((v92 & 1) == 0)
              {
                double v93 = [*(id *)(a1 + 40) purgeResult];
                double v94 = [v93 timedOutServices];
                [v94 addObject:v89];
              }
            }
            id v86 = [v81 countByEnumeratingWithState:&v162 objects:v193 count:16];
          }
          while (v86);
        }
      }
    }
    long long v160 = 0u;
    long long v161 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    id v95 = v150;
    unint64_t v96 = 0;
    id v97 = [v95 countByEnumeratingWithState:&v158 objects:v192 count:16];
    if (v97)
    {
      uint64_t v98 = *(void *)v159;
      do
      {
        for (m = 0; m != v97; m = (char *)m + 1)
        {
          if (*(void *)v159 != v98) {
            objc_enumerationMutation(v95);
          }
          v100 = *(void **)(*((void *)&v158 + 1) + 8 * (void)m);
          id v101 = [v100 reportedBytes];
          [v100 requestedBytes];
          v96 += (unint64_t)v101;
        }
        id v97 = [v95 countByEnumeratingWithState:&v158 objects:v192 count:16];
      }
      while (v97);
    }

    id v102 = [*(id *)(a1 + 32) amountPurged];
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
    {
      unint64_t v103 = (unint64_t)v102;
      v104 = CDGetLogHandle();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        v105 = [*(id *)(a1 + 48) mountPoint];
        int v106 = *(_DWORD *)(a1 + 88);
        int v107 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        *(_DWORD *)statfs buf = 138543874;
        *(void *)v197 = v105;
        *(_WORD *)&v197[8] = 1024;
        *(_DWORD *)&v197[10] = v106;
        *(_WORD *)&v197[14] = 1024;
        *(_DWORD *)&v197[16] = v107;
        _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "[Purge Cleanup](Volume: %{public}@, Urgency %d : Round %d) Begin", buf, 0x18u);
      }
      id v108 = objc_msgSend(*(id *)(a1 + 40), "purge_amount_needed");
      if (v108 > [*(id *)(a1 + 32) amountPurged])
      {
        objc_msgSend(*(id *)(a1 + 40), "non_negative_time_remaining");
        double v110 = v109;
        if (*(int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) <= 1 && [v151 count])
        {
          unint64_t v111 = (unint64_t)[v151 count];
          unint64_t v112 = v96 - v103;
          if (v96 < v103) {
            unint64_t v112 = 0;
          }
          unint64_t v113 = v147 / v111 + v112;
          if (v147 > v103 && v147 - v103 < v113) {
            unint64_t v113 = v147 - v103;
          }
LABEL_99:
          if (v113)
          {
            v114 = *(void **)(a1 + 40);
            uint64_t v115 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
            uint64_t v116 = *(void *)(a1 + 48);
            uint64_t v117 = *(unsigned int *)(a1 + 88);
            if ([v114 clientSpecifiedTimeout]) {
              unint64_t v118 = (unint64_t)v110;
            }
            else {
              unint64_t v118 = 900;
            }
            id v119 = [*(id *)(a1 + 40) result];
            uint64_t v120 = [v119 objectForKeyedSubscript:@"CACHE_DELETE_TEST_PARAMETERS"];
            [v114 oneShot:v115 volume:v116 urgency:v117 donation:v113 currentRoundResults:v95 timeout:v118 info:0 optionalTestInfo:v120];
          }
        }
        else
        {
          unint64_t v113 = v147 - v103;
          if (v147 > v103) {
            goto LABEL_99;
          }
        }
      }
      v121 = CDGetLogHandle();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v122 = [*(id *)(a1 + 48) mountPoint];
        int v123 = *(_DWORD *)(a1 + 88);
        int v124 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        *(_DWORD *)statfs buf = 138543874;
        *(void *)v197 = v122;
        *(_WORD *)&v197[8] = 1024;
        *(_DWORD *)&v197[10] = v123;
        *(_WORD *)&v197[14] = 1024;
        *(_DWORD *)&v197[16] = v124;
        _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "[Purge Cleanup](Volume: %{public}@, Urgency %d : Round %d) End", buf, 0x18u);
      }
    }
    id v14 = v151;

    uint64_t v125 = *(void *)(*(void *)(a1 + 56) + 8);
    int v126 = *(_DWORD *)(v125 + 24);
    *(_DWORD *)(v125 + 24) = v126 + 1;
    if (v126 > 3) {
      goto LABEL_111;
    }
    id v127 = [*(id *)(a1 + 32) amountPurged];
    if (v127 >= objc_msgSend(*(id *)(a1 + 40), "purge_amount_needed")) {
      goto LABEL_111;
    }
    id v128 = [v14 count];
    if (v128)
    {
      if (([*(id *)(a1 + 40) cancel] & 1) == 0)
      {
        LOBYTE(v128) = [*(id *)(a1 + 40) timeoutNotReached];
        goto LABEL_112;
      }
LABEL_111:
      LOBYTE(v128) = 0;
    }
LABEL_112:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (_BYTE)v128;
    v129 = CDGetLogHandle();
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        v130 = "proceed";
      }
      else {
        v130 = "do not proceed";
      }
      id v131 = [v14 count];
      *(_DWORD *)statfs buf = 67109634;
      *(_DWORD *)v197 = 839;
      *(_WORD *)&v197[4] = 2080;
      *(void *)&v197[6] = v130;
      *(_WORD *)&v197[14] = 2048;
      *(void *)&v197[16] = v131;
      _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "%d Retry loop: %s, currentRoundService.count: %lu", buf, 0x1Cu);
    }

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      goto LABEL_126;
    }
  }
  if (!v23) {
    goto LABEL_125;
  }
  *(_DWORD *)statfs buf = 134217984;
  *(void *)v197 = v147;
  v135 = "[Purge Start] aborting, (_donation <= 0), roundGoal: %llu";
  id v136 = v22;
  uint32_t v137 = 12;
LABEL_124:
  _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, v135, buf, v137);
LABEL_125:

LABEL_126:
  id v138 = [*(id *)(a1 + 32) amountPurged];
  if (v138 >= objc_msgSend(*(id *)(a1 + 40), "purge_amount_needed")
    || ([*(id *)(a1 + 40) cancel] & 1) != 0)
  {
    unsigned __int8 v139 = 0;
  }
  else
  {
    unsigned __int8 v139 = [*(id *)(a1 + 40) timeoutNotReached];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v139;
  v140 = CDGetLogHandle();
  if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      v141 = "TRUE";
    }
    else {
      v141 = "FALSE";
    }
    id v142 = [v14 count];
    *(_DWORD *)statfs buf = 67109634;
    *(_DWORD *)v197 = 845;
    *(_WORD *)&v197[4] = 2080;
    *(void *)&v197[6] = v141;
    *(_WORD *)&v197[14] = 2048;
    *(void *)&v197[16] = v142;
    _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_DEFAULT, "%d batch returning %s currentRoundServices count: %lu", buf, 0x1Cu);
  }

  id v143 = CDGetLogHandle();
  if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
  {
    v144 = "proceed";
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      v144 = "do not proceed";
    }
    *(_DWORD *)statfs buf = 67109378;
    *(_DWORD *)v197 = 846;
    *(_WORD *)&v197[4] = 2080;
    *(void *)&v197[6] = v144;
    _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_DEFAULT, "%d Batch loop: %s", buf, 0x12u);
  }

  BOOL v145 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 0;
  return v145;
}

void __45__CacheDeletePurgeOperation__startOperation___block_invoke_84(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (([*(id *)(a1 + 40) timedOut] & 1) == 0)
    {
      unint64_t v17 = [v5 purgeResult];
      [v17 addResult:v3];

      [*(id *)(a1 + 48) addObject:v3];
      objc_msgSend(v5, "setPurge_amount_reported:", (char *)objc_msgSend(v3, "reportedBytes") + (void)objc_msgSend(v5, "purge_amount_reported"));
      id v18 = CDGetLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v19 = [*(id *)(a1 + 56) mountPoint];
        int v20 = *(_DWORD *)(a1 + 104);
        int v21 = *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
        id v22 = [*(id *)(a1 + 64) ID];
        id v23 = [v3 reportedBytes];
        id v24 = [v3 requestedBytes];
        [v3 duration];
        int v29 = 138544898;
        uint64_t v30 = v19;
        __int16 v31 = 1024;
        int v32 = v20;
        __int16 v33 = 1024;
        *(_DWORD *)int v34 = v21;
        *(_WORD *)&v34[4] = 2114;
        *(void *)&v34[6] = v22;
        __int16 v35 = 2048;
        id v36 = v23;
        __int16 v37 = 2048;
        id v38 = v24;
        __int16 v39 = 2048;
        uint64_t v40 = v25;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[Purge Result](Volume: %{public}@, Urgency %d : Round %d) %{public}@ purged (%llu / %llu) bytes : elapsed time %lfs", (uint8_t *)&v29, 0x40u);
      }
      id v26 = [v3 reportedBytes];
      if (v26 >= [v3 requestedBytes])
      {
        [*(id *)(a1 + 72) addObject:*(void *)(a1 + 64)];
        dispatch_semaphore_t v6 = CDGetLogHandle();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        id v7 = [*(id *)(a1 + 64) ID];
        int v28 = *(_DWORD *)(a1 + 104);
        uint64_t v10 = [*(id *)(a1 + 56) mountPoint];
        int v29 = 138543874;
        uint64_t v30 = v7;
        __int16 v31 = 1024;
        int v32 = v28;
        __int16 v33 = 2114;
        *(void *)int v34 = v10;
        id v14 = "** %{public}@ will continue purging at urgency %d on volume: %{public}@";
      }
      else
      {
        dispatch_semaphore_t v6 = CDGetLogHandle();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        id v7 = [*(id *)(a1 + 64) ID];
        int v27 = *(_DWORD *)(a1 + 104);
        uint64_t v10 = [*(id *)(a1 + 56) mountPoint];
        int v29 = 138543874;
        uint64_t v30 = v7;
        __int16 v31 = 1024;
        int v32 = v27;
        __int16 v33 = 2114;
        *(void *)int v34 = v10;
        id v14 = "** %{public}@ is disqualified from purging at urgency %d on volume: %{public}@";
      }
      unint64_t v15 = v6;
      uint32_t v16 = 28;
      goto LABEL_16;
    }
    dispatch_semaphore_t v6 = CDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 56) mountPoint];
      int v8 = *(_DWORD *)(a1 + 104);
      int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      uint64_t v10 = [*(id *)(a1 + 64) ID];
      id v11 = [v3 reportedBytes];
      id v12 = [v3 requestedBytes];
      [v3 duration];
      int v29 = 138544898;
      uint64_t v30 = v7;
      __int16 v31 = 1024;
      int v32 = v8;
      __int16 v33 = 1024;
      *(_DWORD *)int v34 = v9;
      *(_WORD *)&v34[4] = 2114;
      *(void *)&v34[6] = v10;
      __int16 v35 = 2048;
      id v36 = v11;
      __int16 v37 = 2048;
      id v38 = v12;
      __int16 v39 = 2048;
      uint64_t v40 = v13;
      id v14 = "[Purge Result(tardy!)](Volume: %{public}@, Urgency %d : Round %d) %{public}@ purged (%llu / %llu) bytes : elapsed time %lfs";
      unint64_t v15 = v6;
      uint32_t v16 = 64;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v29, v16);

      goto LABEL_17;
    }
  }
  else
  {
    dispatch_semaphore_t v6 = CDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 56) mountPoint];
      int v29 = 138543362;
      uint64_t v30 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Purge failed (volume %{public}@ possibly invalid)", (uint8_t *)&v29, 0xCu);
LABEL_17:
    }
  }
LABEL_18:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
}

void __45__CacheDeletePurgeOperation__startOperation___block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 inFlight]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)oneShot:(id)a3 volume:(id)a4 urgency:(int)a5 donation:(unint64_t)a6 currentRoundResults:(id)a7 timeout:(unint64_t)a8 info:(id)a9 optionalTestInfo:(id)a10
{
  id v37 = a3;
  id v42 = a4;
  id v38 = a7;
  id v39 = a9;
  id v40 = a10;
  id v14 = CDGetLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v15 = [v42 mountPoint];
    *(_DWORD *)statfs buf = 138543618;
    uint64_t v56 = v15;
    __int16 v57 = 1024;
    int v58 = a5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[Purge OneShot](Volume: %{public}@, Urgency %d) Begin", buf, 0x12u);
  }
  uint32_t v16 = [(CacheDeleteOperation *)self volumes];
  unint64_t v17 = [v16 firstObject];

  unint64_t v18 = [(CacheDeletePurgeOperation *)self purge_amount_needed];
  if (v18 > (unint64_t)[v17 amountPurged])
  {
    unint64_t v19 = [CacheDeleteAsyncTimeoutFlag alloc];
    int v20 = [(CacheDeleteOperation *)self response_queue];
    int v21 = [(CacheDeleteAsyncTimeoutFlag *)v19 initWithQueue:v20];

    objc_initWeak(&location, self);
    id v22 = [(CacheDeleteOperation *)self response_queue];
    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    id v24 = [(CacheDeleteOperation *)self response_queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __111__CacheDeletePurgeOperation_oneShot_volume_urgency_donation_currentRoundResults_timeout_info_optionalTestInfo___block_invoke;
    block[3] = &unk_10005DB68;
    block[4] = self;
    id v25 = v37;
    id v44 = v25;
    id v26 = v42;
    int v53 = a5;
    id v45 = v26;
    v52[1] = (id)a6;
    id v46 = v39;
    id v47 = v40;
    objc_copyWeak(v52, &location);
    id v27 = v22;
    id v48 = v27;
    int v28 = v21;
    uint64_t v49 = v28;
    id v50 = v38;
    int v29 = v23;
    int v51 = v29;
    dispatch_async(v24, block);

    dispatch_time_t v30 = dispatch_time(0, 1000000000 * a8);
    if (dispatch_semaphore_wait(v29, v30))
    {
      [(CacheDeleteAsyncTimeoutFlag *)v28 setTimedOut:1];
      __int16 v31 = CDGetLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = [v26 mountPoint];
        __int16 v33 = [v25 ID];
        *(_DWORD *)statfs buf = 138543874;
        uint64_t v56 = v32;
        __int16 v57 = 1024;
        int v58 = a5;
        __int16 v59 = 2114;
        long long v60 = v33;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[Purge OneShot] (Volume: %{public}@, Urgency %d) Timed out waiting for: %{public}@", buf, 0x1Cu);
      }
    }

    objc_destroyWeak(v52);
    objc_destroyWeak(&location);
  }
  int v34 = CDGetLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v35 = [v42 mountPoint];
    *(_DWORD *)statfs buf = 138543618;
    uint64_t v56 = v35;
    __int16 v57 = 1024;
    int v58 = a5;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[Purge OneShot](Volume: %{public}@, Urgency %d) End", buf, 0x12u);
  }
}

void __111__CacheDeletePurgeOperation_oneShot_volume_urgency_donation_currentRoundResults_timeout_info_optionalTestInfo___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned int *)(a1 + 120);
  uint64_t v5 = *(void *)(a1 + 112);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __111__CacheDeletePurgeOperation_oneShot_volume_urgency_donation_currentRoundResults_timeout_info_optionalTestInfo___block_invoke_2;
  v9[3] = &unk_10005DB40;
  objc_copyWeak(&v16, (id *)(a1 + 104));
  id v10 = *(id *)(a1 + 72);
  id v11 = *(id *)(a1 + 80);
  id v12 = *(id *)(a1 + 88);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 96);
  [v2 serviceRequest:v3 volume:v7 urgency:v4 donation:v5 info:v6 optionalTestInfo:v8 completion:v9];

  objc_destroyWeak(&v16);
}

void __111__CacheDeletePurgeOperation_oneShot_volume_urgency_donation_currentRoundResults_timeout_info_optionalTestInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if ([*(id *)(a1 + 40) timedOut])
    {
      uint64_t v6 = CDGetLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = [*(id *)(a1 + 56) ID];
        id v8 = [v3 reportedBytes];
        id v9 = [v3 requestedBytes];
        id v10 = [*(id *)(a1 + 64) mountPoint];
        [v3 duration];
        int v16 = 138544386;
        unint64_t v17 = v7;
        __int16 v18 = 2048;
        id v19 = v8;
        __int16 v20 = 2048;
        id v21 = v9;
        __int16 v22 = 2114;
        dispatch_semaphore_t v23 = v10;
        __int16 v24 = 2048;
        uint64_t v25 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[Purge Result (oneShot, tardy!)] %{public}@ purged (%llu / %llu) bytes on volume: %{public}@ in %lf seconds", (uint8_t *)&v16, 0x34u);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      id v12 = [v5 purgeResult];
      [v12 addResult:v3];

      [*(id *)(a1 + 48) addObject:v3];
      objc_msgSend(v5, "setPurge_amount_reported:", (char *)objc_msgSend(v3, "reportedBytes") + (void)objc_msgSend(v5, "purge_amount_reported"));
      uint64_t v6 = CDGetLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [*(id *)(a1 + 56) ID];
        id v13 = [v3 reportedBytes];
        id v14 = [v3 requestedBytes];
        id v10 = [*(id *)(a1 + 64) mountPoint];
        [v3 duration];
        int v16 = 138544386;
        unint64_t v17 = v7;
        __int16 v18 = 2048;
        id v19 = v13;
        __int16 v20 = 2048;
        id v21 = v14;
        __int16 v22 = 2114;
        dispatch_semaphore_t v23 = v10;
        __int16 v24 = 2048;
        uint64_t v25 = v15;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Purge Result (oneShot)] %{public}@ purged (%llu / %llu) bytes on volume: %{public}@ in %lf seconds", (uint8_t *)&v16, 0x34u);
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v6 = CDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [*(id *)(a1 + 64) mountPoint];
      int v16 = 138543362;
      unint64_t v17 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Purge oneShot failed (volume %{public}@ was likely invalid)", (uint8_t *)&v16, 0xCu);
LABEL_11:
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
}

- (void)serviceRequest:(id)a3 volume:(id)a4 urgency:(int)a5 donation:(unint64_t)a6 info:(id)a7 optionalTestInfo:(id)a8 completion:(id)a9
{
  uint64_t v12 = *(void *)&a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v35 = a8;
  id v18 = a9;
  uint64_t v19 = [v16 mountPoint];
  unsigned int v20 = [v16 validate];
  int v34 = (void *)v19;
  if (v15 && v20 && v19)
  {
    v47[0] = @"CACHE_DELETE_ID";
    id v21 = [v15 ID];
    v48[0] = v21;
    v47[1] = @"CACHE_DELETE_AMOUNT";
    +[NSNumber numberWithUnsignedLongLong:a6];
    __int16 v22 = v33 = v17;
    v48[1] = v22;
    v47[2] = @"CACHE_DELETE_URGENCY";
    dispatch_semaphore_t v23 = +[NSNumber numberWithInt:v12];
    v47[3] = @"CACHE_DELETE_VOLUME";
    v48[2] = v23;
    v48[3] = v19;
    id v24 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:4];

    if (v33)
    {
      id v25 = [v33 mutableCopy];
      [v25 addEntriesFromDictionary:v24];
    }
    else
    {
      id v25 = [v24 mutableCopy];
    }
    if (v35) {
      [v25 setObject:v35 forKeyedSubscript:@"CACHE_DELETE_TEST_PARAMETERS"];
    }
    int v29 = [(CacheDeleteOperation *)self response_queue];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke_2;
    v36[3] = &unk_10005DBB8;
    unint64_t v43 = a6;
    int v44 = v12;
    id v37 = v15;
    id v38 = self;
    id v39 = v25;
    id v41 = v29;
    id v42 = v18;
    id v40 = v16;
    id v30 = v18;
    __int16 v31 = v29;
    id v28 = v25;
    dispatch_async(v31, v36);

    id v17 = v33;
  }
  else
  {
    id v26 = CDGetLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v32 = [v16 mountPoint];
      *(_DWORD *)statfs buf = 138543618;
      id v50 = v15;
      __int16 v51 = 2114;
      long long v52 = v32;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Parameter error: service: %{public}@, volume %{public}@", buf, 0x16u);
    }
    id v27 = [(CacheDeleteOperation *)self response_queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke;
    block[3] = &unk_10005C9A8;
    id v46 = v18;
    id v24 = v18;
    dispatch_async(v27, block);

    id v28 = v46;
  }
}

uint64_t __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(CDPurgeServiceRequestResult);
  [(CDPurgeServiceRequestResult *)v2 setRequestedBytes:*(void *)(a1 + 80)];
  [(CDServiceRequestResult *)v2 setUrgency:*(unsigned int *)(a1 + 88)];
  id v3 = [*(id *)(a1 + 32) ID];
  [(CDServiceRequestResult *)v2 setServiceName:v3];

  uint64_t v4 = [*(id *)(a1 + 40) servicesToTranslate];
  uint64_t v5 = [*(id *)(a1 + 32) ID];
  [v4 containsObject:v5];

  uint64_t v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  uint64_t v7 = mapVolume();
  [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  objc_initWeak(&location, *(id *)(a1 + 40));
  id v8 = (void *)mach_absolute_time();
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(unsigned int *)(a1 + 88);
  id v11 = [*(id *)(a1 + 48) copy];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke_3;
  v14[3] = &unk_10005DB90;
  v22[1] = v8;
  objc_copyWeak(v22, &location);
  id v21 = v25;
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 72);
  id v17 = *(id *)(a1 + 64);
  uint64_t v12 = v2;
  int v23 = *(_DWORD *)(a1 + 88);
  uint64_t v13 = *(void *)(a1 + 40);
  id v18 = v12;
  uint64_t v19 = v13;
  [v9 servicePurge:v10 info:v11 replyBlock:v14];

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Block_object_dispose(v25, 8);
}

void __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = mach_absolute_time();
  unint64_t v5 = *(void *)(a1 + 96);
  double v6 = gTimebaseConversion;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    id v9 = CDGetLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      id v21 = [*(id *)(a1 + 32) ID];
      __int16 v22 = [*(id *)(a1 + 40) mountPoint];
      *(_DWORD *)statfs buf = 138543618;
      __int16 v33 = v21;
      __int16 v34 = 2114;
      double v35 = *(double *)&v22;
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Purge callback firing more than once for service %{public}@ on volume: %{public}@", buf, 0x16u);
    }
    uint64_t v10 = [*(id *)(a1 + 32) ID];
    int v23 = [*(id *)(a1 + 40) mountPoint];
    _CacheDeleteAbortWithMessage();
  }
  else
  {
    *(unsigned char *)(v8 + 24) = 1;
    id v11 = [v3 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    uint64_t v10 = evaluateNumberProperty();

    uint64_t v12 = CDGetLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = v6 * ((double)v4 - (double)v5);
      id v14 = [*(id *)(a1 + 32) ID];
      id v15 = [v10 unsignedLongLongValue];
      id v16 = [*(id *)(a1 + 40) mountPoint];
      *(_DWORD *)statfs buf = 138544130;
      __int16 v33 = v14;
      __int16 v34 = 2048;
      double v35 = v13 / 1000000000.0;
      __int16 v36 = 2048;
      id v37 = v15;
      __int16 v38 = 2114;
      id v39 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ took %f seconds, purged %llu bytes on volume: %{public}@", buf, 0x2Au);
    }
    if (WeakRetained)
    {
      id v17 = *(NSObject **)(a1 + 48);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke_121;
      block[3] = &unk_10005CE38;
      id v25 = v3;
      id v26 = *(id *)(a1 + 56);
      id v27 = *(id *)(a1 + 32);
      id v18 = *(id *)(a1 + 40);
      int v31 = *(_DWORD *)(a1 + 104);
      uint64_t v19 = *(void *)(a1 + 64);
      id v20 = *(void **)(a1 + 72);
      id v28 = v18;
      uint64_t v29 = v19;
      id v30 = v20;
      dispatch_async(v17, block);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
  }
}

void __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke_121(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = [v9 unsignedLongLongValue];
  }
  else {
    id v2 = 0;
  }
  [*(id *)(a1 + 40) setReportedBytes:v2];
  [*(id *)(a1 + 40) finish];
  if ([*(id *)(a1 + 40) reportedBytes])
  {
    id v3 = +[CDDaemonPurgeableResultCache sharedPurgeableResultsCache];
    uint64_t v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(a1 + 40) reportedBytes]);
    unint64_t v5 = [*(id *)(a1 + 48) ID];
    [v3 deductPurgeableAmount:v4 serviceID:v5 volume:*(void *)(a1 + 56) urgency:*(unsigned int *)(a1 + 80)];
  }
  double v6 = [*(id *)(a1 + 64) analyticsReporter];
  [v6 reportPurgeTimingInfo:*(void *)(a1 + 40)];

  uint64_t v7 = *(void **)(a1 + 64);
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CACHE_DELETE_TEST_FAILURES"];
  [v7 processTestFailures:v8];

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (BOOL)cancel
{
  return self->_cancel;
}

- (void)setCancel:(BOOL)a3
{
  self->_cancel = a3;
}

- (unint64_t)purge_amount_needed
{
  return self->_purge_amount_needed;
}

- (unint64_t)purge_amount_reported
{
  return self->_purge_amount_reported;
}

- (void)setPurge_amount_reported:(unint64_t)a3
{
  self->_purge_amount_reported = a3;
}

- (CDPurgeOperationResult)purgeResult
{
  return self->_purgeResult;
}

- (void)setPurgeResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end