@interface GEOMobileAssetResourceServer
+ (id)identifier;
+ (id)possibleBackgroundTaskIdentifiers;
+ (unint64_t)launchMode;
+ (void)submitBackgroundTasksNeededDuringDaemonStart;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOMobileAssetResourceServer)initWithDaemon:(id)a3;
- (unint64_t)_processPurgableResourcesForUrgency:(int)a3 purgeSize:(unint64_t)a4 error:(id *)a5;
- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4;
- (unint64_t)purgableDiskSpaceForUrgency:(int)a3;
- (void)calculateFreeableWithRequest:(id)a3;
- (void)fetchWithRequest:(id)a3;
- (void)purgeDiskCacheWithRequest:(id)a3;
- (void)reportCorruptWithRequest:(id)a3;
- (void)runBackgroundTask:(id)a3;
- (void)updateWithMessage:(id)a3;
@end

@implementation GEOMobileAssetResourceServer

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  BOOL v14 = 0;
  if (v13 <= 1409)
  {
    if (v13 == 522)
    {
      uint64_t v23 = objc_opt_class();
      v24 = sub_100008DBC(@"MAResources", v10, v11, v23, v12);
      v17 = v24;
      BOOL v14 = v24 != 0;
      if (v24)
      {
        [v24 setSignpostId:a6];
        [(GEOMobileAssetResourceServer *)self fetchWithRequest:v17];
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    if (v13 == 643)
    {
      if (!sub_100019858(v12, v11, @"MAResources", v10, &off_100077BB8, 0))
      {
        BOOL v14 = 1;
        goto LABEL_22;
      }
      id v18 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
      v17 = v18;
      BOOL v14 = v18 != 0;
      if (!v18) {
        goto LABEL_21;
      }
      [v18 setSignpostId:a6];
      [(GEOMobileAssetResourceServer *)self updateWithMessage:v17];
      goto LABEL_20;
    }
  }
  else
  {
    switch(v13)
    {
      case 1410:
        BOOL v14 = 1;
        if (sub_100019858(v12, v11, @"MAResources", v10, &off_100077BE8, 1))
        {
          uint64_t v19 = objc_opt_class();
          v20 = sub_100008DBC(@"MAResources", v10, v11, v19, v12);
          v17 = v20;
          BOOL v14 = v20 != 0;
          if (v20)
          {
            [v20 setSignpostId:a6];
            [(GEOMobileAssetResourceServer *)self purgeDiskCacheWithRequest:v17];
            goto LABEL_20;
          }
LABEL_21:
        }
        break;
      case 1419:
        uint64_t v21 = objc_opt_class();
        v22 = sub_100008DBC(@"MAResources", v10, v11, v21, v12);
        v17 = v22;
        BOOL v14 = v22 != 0;
        if (v22)
        {
          [v22 setSignpostId:a6];
          [(GEOMobileAssetResourceServer *)self reportCorruptWithRequest:v17];
          goto LABEL_20;
        }
        goto LABEL_21;
      case 1732:
        BOOL v14 = 1;
        if (sub_100019858(v12, v11, @"MAResources", v10, &off_100077BD0, 1))
        {
          uint64_t v15 = objc_opt_class();
          v16 = sub_100008DBC(@"MAResources", v10, v11, v15, v12);
          v17 = v16;
          BOOL v14 = v16 != 0;
          if (v16)
          {
            [v16 setSignpostId:a6];
            [(GEOMobileAssetResourceServer *)self calculateFreeableWithRequest:v17];
LABEL_20:
            BOOL v14 = 1;
            goto LABEL_21;
          }
          goto LABEL_21;
        }
        break;
    }
  }
LABEL_22:

  return v14;
}

- (void)fetchWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GEOMAResourceFetchReply) initWithRequest:v3];
  id v5 = [v3 type];
  v6 = [v3 extras];
  v7 = sub_100009218(v5, v6);

  if (v7)
  {
    qos_class_self();
    global_workloop = (void *)geo_get_global_workloop();
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000096C0;
    v11[3] = &unk_100072AE8;
    id v12 = v4;
    id v13 = v7;
    id v14 = v3;
    id v15 = global_workloop;
    id v9 = global_workloop;
    [v13 listResources:0 queue:v9 results:v11];
  }
  else
  {
    id v10 = +[NSError GEOErrorWithCode:-10 reason:@"Unrecognized type"];
    [v4 setError:v10];

    [v4 send];
  }
}

+ (id)identifier
{
  return @"MAResources";
}

+ (unint64_t)launchMode
{
  return 1;
}

+ (id)possibleBackgroundTaskIdentifiers
{
  return &off_100077BA0;
}

- (GEOMobileAssetResourceServer)initWithDaemon:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMobileAssetResourceServer;
  id v3 = [(GEOMobileAssetResourceServer *)&v6 initWithDaemon:a3];
  id v4 = +[GEOMobileAssetResourceUpdater sharedUpdater];
  return v3;
}

- (void)updateWithMessage:(id)a3
{
  id v3 = a3;
  +[GEOMobileAssetResourceUpdater run];
  [v3 sendReply:&__NSDictionary0__struct];
}

- (void)reportCorruptWithRequest:(id)a3
{
  id v4 = a3;
  GEOGetMonotonicTime();
  double v6 = v5;
  double lastCorruptMessage = self->_lastCorruptMessage;
  GEOConfigGetDouble();
  if (lastCorruptMessage + v8 <= v6)
  {
    id v11 = [v4 url];
    unsigned __int8 v12 = [v11 isFileURL];

    if ((v12 & 1) == 0)
    {
      id v9 = sub_10000966C();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        goto LABEL_23;
      }
      id v15 = [v4 url];
      *(_DWORD *)buf = 138412290;
      double v38 = *(double *)&v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Will not remove MAResource, URL is not a file URL: \"%@\"", buf, 0xCu);
LABEL_22:

      goto LABEL_23;
    }
    id v13 = +[GEOFilePaths urlFor:17];
    id v9 = [v13 URLByResolvingSymlinksInPath];

    id v14 = [v4 url];
    id v15 = [v14 URLByResolvingSymlinksInPath];

    v16 = [v15 absoluteString];
    v17 = [v9 absoluteString];
    unsigned __int8 v18 = [v16 hasPrefix:v17];

    if (v18)
    {
      uint64_t v19 = +[NSFileManager defaultManager];
      v20 = [v4 url];
      uint64_t v21 = [v20 path];
      unsigned __int8 v22 = [v19 fileExistsAtPath:v21];

      if (v22)
      {
        self->_double lastCorruptMessage = v6;
        uint64_t v23 = [v4 url];
        id v36 = 0;
        unsigned __int8 v24 = +[GEOMAResource removeResourceAt:v23 error:&v36];
        v25 = v36;

        v26 = sub_10000966C();
        v27 = v26;
        if (v24)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            double v38 = *(double *)&v15;
            v28 = "Removed corrupt MAResource at \"%@\"";
            v29 = v27;
            os_log_type_t v30 = OS_LOG_TYPE_DEBUG;
            uint32_t v31 = 12;
LABEL_19:
            _os_log_impl((void *)&_mh_execute_header, v29, v30, v28, buf, v31);
          }
        }
        else if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          double v38 = *(double *)&v15;
          __int16 v39 = 2112;
          v40 = v25;
          v28 = "Failed to remove corrupt MAResource at \"%@\": %@";
          v29 = v27;
          os_log_type_t v30 = OS_LOG_TYPE_FAULT;
          uint32_t v31 = 22;
          goto LABEL_19;
        }

        goto LABEL_21;
      }
      v25 = sub_10000966C();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        double v38 = *(double *)&v15;
        v32 = "Can not remove MAResource, no file/dir found at \"%@\"";
        v33 = v25;
        os_log_type_t v34 = OS_LOG_TYPE_ERROR;
        uint32_t v35 = 12;
        goto LABEL_16;
      }
    }
    else
    {
      v25 = sub_10000966C();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        double v38 = *(double *)&v15;
        __int16 v39 = 2112;
        v40 = v9;
        v32 = "Will not remove URL, is not an MAResource: \"%@\" (expected prefix: \"%@\"";
        v33 = v25;
        os_log_type_t v34 = OS_LOG_TYPE_FAULT;
        uint32_t v35 = 22;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v33, v34, v32, buf, v35);
      }
    }
LABEL_21:

    goto LABEL_22;
  }
  id v9 = sub_10000966C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    double v10 = v6 - self->_lastCorruptMessage;
    *(_DWORD *)buf = 134217984;
    double v38 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Will not remove MAResource, last call to reportCorrupt was only %f seconds ago", buf, 0xCu);
  }
LABEL_23:
}

- (unint64_t)_processPurgableResourcesForUrgency:(int)a3 purgeSize:(unint64_t)a4 error:(id *)a5
{
  double v6 = sub_10000966C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v47 = a4;
    __int16 v48 = 1024;
    LODWORD(v49) = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Looking for %llu bytes of purgable resources at urgency %d", buf, 0x12u);
  }

  sub_100035A2C();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (!v7)
  {
    unint64_t v10 = 0;
    goto LABEL_46;
  }
  id v9 = v7;
  unint64_t v10 = 0;
  uint64_t v11 = *(void *)v42;
  if (a4) {
    unsigned __int8 v12 = "purging";
  }
  else {
    unsigned __int8 v12 = "counting";
  }
  uint32_t v31 = v12;
  *(void *)&long long v8 = 136315394;
  long long v30 = v8;
  uint64_t v32 = *(void *)v42;
  do
  {
    id v13 = 0;
    id v33 = v9;
    do
    {
      if (*(void *)v42 != v11) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v13);
      id v15 = objc_msgSend(v14, "policy", v30);
      if (v15 == (id)3)
      {
        if (a3 <= 1)
        {
          v16 = sub_10000966C();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_42;
          }
          *(_DWORD *)buf = v30;
          unint64_t v47 = (unint64_t)v31;
          __int16 v48 = 2112;
          v49 = v14;
          v17 = v16;
          unsigned __int8 v18 = "Resource has policy auto update, not %s: %@";
          goto LABEL_22;
        }
      }
      else if (v15 == (id)2)
      {
        if (a3 <= 2)
        {
          v16 = sub_10000966C();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_42;
          }
          *(_DWORD *)buf = v30;
          unint64_t v47 = (unint64_t)v31;
          __int16 v48 = 2112;
          v49 = v14;
          v17 = v16;
          unsigned __int8 v18 = "Resource has policy prefetch, not %s: %@";
          goto LABEL_22;
        }
      }
      else if (v15 == (id)1)
      {
        v16 = sub_10000966C();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_42;
        }
        *(_DWORD *)buf = v30;
        unint64_t v47 = (unint64_t)v31;
        __int16 v48 = 2112;
        v49 = v14;
        v17 = v16;
        unsigned __int8 v18 = "Resource has policy required, not %s: %@";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, v18, buf, 0x16u);
        goto LABEL_42;
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v16 = [v14 installedResources];
      id v19 = [v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v38;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v38 != v21) {
              objc_enumerationMutation(v16);
            }
            uint64_t v23 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            id v24 = [v23 size];
            id v25 = v24;
            if (a4)
            {
              if (v10 < a4)
              {
                v26 = sub_10000966C();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  unint64_t v47 = (unint64_t)v23;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Purging resource: %@", buf, 0xCu);
                }

                if ([v23 remove:a5]) {
                  id v27 = v25;
                }
                else {
                  id v27 = 0;
                }
                v10 += (unint64_t)v27;
              }
              if (v10 >= a4) {
                goto LABEL_41;
              }
            }
            else
            {
              v10 += (unint64_t)v24;
            }
          }
          id v20 = [v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v20);
LABEL_41:
        uint64_t v11 = v32;
        id v9 = v33;
      }
LABEL_42:

      id v13 = (char *)v13 + 1;
    }
    while (v13 != v9);
    id v9 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  }
  while (v9);
LABEL_46:
  v28 = sub_10000966C();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v47 = v10;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Found %llu purgable bytes", buf, 0xCu);
  }

  return v10;
}

- (unint64_t)purgableDiskSpaceForUrgency:(int)a3
{
  return [(GEOMobileAssetResourceServer *)self _processPurgableResourcesForUrgency:*(void *)&a3 purgeSize:0 error:0];
}

- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4
{
  return [(GEOMobileAssetResourceServer *)self _processPurgableResourcesForUrgency:*(void *)&a4 purgeSize:a3 error:0];
}

- (void)calculateFreeableWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMAResourceCalculateFreeableSizeReply) initWithRequest:v4];
  id v6 = [v4 urgency];

  id v9 = 0;
  unint64_t v7 = [(GEOMobileAssetResourceServer *)self _processPurgableResourcesForUrgency:v6 purgeSize:0 error:&v9];
  id v8 = v9;
  [v5 setSize:v7];
  [v5 setError:v8];

  [v5 send];
}

- (void)purgeDiskCacheWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOMAResourcePurgeCacheToSizeReply) initWithRequest:v4];
  id v6 = [v4 urgency];
  id v7 = [v4 targetSize];

  id v10 = 0;
  unint64_t v8 = [(GEOMobileAssetResourceServer *)self _processPurgableResourcesForUrgency:v6 purgeSize:v7 error:&v10];
  id v9 = v10;
  [v5 setAmountDeleted:v8];
  [v5 setError:v9];

  [v5 send];
}

- (void)runBackgroundTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  GEOBackgroundTaskReportReportTaskInitiated();

  id v6 = [v4 identifier];
  unsigned int v7 = [v6 isEqualToString:GEOMobileAssetResourceUpdaterTaskIdentifier];

  if (v7)
  {
    unint64_t v8 = +[GEOMobileAssetResourceUpdater sharedUpdater];
    [v8 triggerUpdate:v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GEOMobileAssetResourceServer;
    [(GEOMobileAssetResourceServer *)&v9 runBackgroundTask:v4];
  }
}

+ (void)submitBackgroundTasksNeededDuringDaemonStart
{
}

@end