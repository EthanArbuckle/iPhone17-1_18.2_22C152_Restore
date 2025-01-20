@interface ODPMetricsHandler
- (BOOL)shouldCollectMetrics;
- (id)deviceID;
- (id)getAppEventsWithError:(id *)a3;
- (id)logKey;
- (id)topic;
- (int64_t)appUsageType;
- (void)postMetrics;
- (void)recordDeletedBundleIDs:(id)a3;
- (void)recordInstallEventsForBundleIDs:(id)a3 installType:(unsigned __int8)a4;
- (void)recordLaunches:(id)a3;
- (void)recordSupplementalAppMetricsEvents;
- (void)resetMetrics;
@end

@implementation ODPMetricsHandler

- (int64_t)appUsageType
{
  return 5;
}

- (id)deviceID
{
  v2 = sub_1003F2158((uint64_t)AppDefaultsManager, @"ODPDeviceID");
  if (!v2)
  {
    v3 = +[NSUUID UUID];
    v2 = [v3 UUIDString];

    sub_1003F2074((uint64_t)AppDefaultsManager, v2, @"ODPDeviceID");
    v4 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = (id)objc_opt_class();
      id v5 = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting initial deviceID", (uint8_t *)&v7, 0xCu);
    }
  }
  return v2;
}

- (id)getAppEventsWithError:(id *)a3
{
  if (self)
  {
    id v5 = +[NSMutableArray array];
    sub_1003B0C40((id *)&self->super.super.isa, 1, a3);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v9);
          id v11 = objc_alloc_init((Class)ASDAppMetricsEvent);
          if (v10)
          {
            unsigned __int8 v12 = sub_10026E91C(v10, @"event_type");
            objc_msgSend(v11, "setEventType:", sub_10023A1D0((uint64_t)AppMetricsEvent, v12));
            v13 = [v10 valueForProperty:@"payload"];
            [v11 setPayload:v13];

            id v14 = sub_10026E7EC(v10, @"has_been_posted");
          }
          else
          {
            self;
            [v11 setEventType:3];
            [v11 setPayload:0];
            id v14 = 0;
          }
          [v11 setPosted:v14];
          [v5 addObject:v11];

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v15 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
        id v7 = v15;
      }
      while (v15);
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)logKey
{
  logKey = self->_logKey;
  if (!logKey)
  {
    v4 = self->super._baseLogKey;
    id v5 = [(LogKey *)v4 prependingCategory:@"ODP"];
    id v6 = self->_logKey;
    self->_logKey = v5;

    logKey = self->_logKey;
  }
  return logKey;
}

- (void)postMetrics
{
  id v8 = 0;
  v3 = sub_1003B0C40((id *)&self->super.super.isa, 0, &v8);
  id v4 = v8;
  if ([v3 count])
  {
    sub_1003B12C8(self, v3);
    id v5 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [(ODPMetricsHandler *)self logKey];
      id v7 = [v3 count];
      *(_DWORD *)buf = 138412546;
      v10 = v6;
      __int16 v11 = 2048;
      id v12 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%@] Posted %ld event(s) to AMSEngagement", buf, 0x16u);
    }
  }
  [(ODPMetricsHandler *)self resetMetrics];
}

- (void)recordInstallEventsForBundleIDs:(id)a3 installType:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v31 = a3;
  [(ODPMetricsHandler *)self recordSupplementalAppMetricsEvents];
  self;
  if (v4 <= 0x13 && ((1 << v4) & 0xF17FE) != 0)
  {
    v38 = self;
    unsigned int v37 = v4;
    BOOL v7 = v4 != 4 && v4 != 19;
    BOOL v33 = v7;
    v34 = +[NSMutableArray array];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v31;
    id v36 = [obj countByEnumeratingWithState:&v42 objects:v53 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v43;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(obj);
          }
          currentApps = v38;
          if (v38) {
            currentApps = v38->super._currentApps;
          }
          v10 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v8);
          id v11 = currentApps;
          id v12 = [v11 objectForKeyedSubscript:v10];

          if (v12
            || (+[ApplicationProxy proxyForBundleID:v10],
                v13 = objc_claimAutoreleasedReturnValue(),
                id v12 = sub_1003A3448([AppMetadata alloc], v13),
                v13,
                v12))
          {
            id v14 = sub_1003B1B7C((id *)&v38->super.super.isa, v10, v12);
            [v14 setObject:@"installs" forKeyedSubscript:@"eventType"];
            id v15 = sub_100333AF0((uint64_t)MetricsHandler, v37);
            if (v15) {
              [v14 setObject:v15 forKeyedSubscript:@"installType"];
            }
            [v14 setObject:v10 forKeyedSubscript:@"bundleId"];
            v16 = +[NSDate now];
            v17 = sub_100333B60((uint64_t)MetricsHandler, v16);
            [v14 setObject:v17 forKeyedSubscript:@"eventTime"];

            long long v18 = objc_alloc_init(AppMetricsEvent);
            sub_10023A390(v18, 5);
            sub_10023A2B0(v18, v37);
            sub_10023A24C(v18, v10);
            sub_10023A400(v18, v14);
            sub_10023A320(v18, 1);
            sub_10023A464(v18, v33);
            [v34 addObject:v18];
            long long v19 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              long long v20 = [(ODPMetricsHandler *)v38 logKey];
              long long v21 = sub_10022DD24((uint64_t)AppEvent, 1u);
              v22 = [v12 valueForProperty:@"short_version"];
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v20;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v21;
              *(_WORD *)&buf[22] = 2114;
              v51 = (uint64_t (*)(uint64_t, uint64_t))v10;
              LOWORD(v52) = 2114;
              *(void *)((char *)&v52 + 2) = v22;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@] [%{public}@] Created app event with version: %{public}@", buf, 0x2Au);
            }
          }
          else
          {
            id v12 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              v23 = [(ODPMetricsHandler *)v38 logKey];
              v24 = sub_10022DD24((uint64_t)AppEvent, 1u);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v23;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v24;
              *(_WORD *)&buf[22] = 2114;
              v51 = (uint64_t (*)(uint64_t, uint64_t))v10;
              _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%@] [%{public}@] [%{public}@] App metadata not found", buf, 0x20u);
            }
          }

          id v8 = (char *)v8 + 1;
        }
        while (v36 != v8);
        id v25 = [obj countByEnumeratingWithState:&v42 objects:v53 count:16];
        id v36 = v25;
      }
      while (v25);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v51 = sub_1000183A8;
    *(void *)&long long v52 = sub_100017D90;
    *((void *)&v52 + 1) = 0;
    v26 = sub_10038F000();
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1003B1F14;
    v39[3] = &unk_100526AD8;
    id v27 = v34;
    id v40 = v27;
    v41 = buf;
    [v26 modifyUsingTransaction:v39];

    if (*(void *)(*(void *)&buf[8] + 40))
    {
      v28 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = [(ODPMetricsHandler *)v38 logKey];
        uint64_t v30 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v46 = 138412546;
        v47 = v29;
        __int16 v48 = 2114;
        uint64_t v49 = v30;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "[%@] App install metrics event import resulted in error: %{public}@", v46, 0x16u);
      }
    }
    if (v37 != 4 && v37 != 19) {
      sub_1003B12C8(v38, v27);
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)recordDeletedBundleIDs:(id)a3
{
  id v4 = a3;
  [(ODPMetricsHandler *)self recordSupplementalAppMetricsEvents];
  id v27 = +[NSMutableArray array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v4;
  id v29 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v34;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(obj);
        }
        if (self) {
          currentApps = self->super._currentApps;
        }
        else {
          currentApps = 0;
        }
        BOOL v7 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v5);
        id v8 = currentApps;
        v9 = [(NSDictionary *)v8 objectForKeyedSubscript:v7];

        if (v9)
        {
          v10 = sub_1003B1B7C((id *)&self->super.super.isa, v7, v9);
          [v10 setObject:@"uninstalls" forKeyedSubscript:@"eventType"];
          [v10 setObject:v7 forKeyedSubscript:@"bundleId"];
          id v11 = +[NSDate now];
          id v12 = sub_100333B60((uint64_t)MetricsHandler, v11);
          [v10 setObject:v12 forKeyedSubscript:@"eventTime"];

          v13 = objc_alloc_init(AppMetricsEvent);
          sub_10023A390(v13, 5);
          sub_10023A24C(v13, v7);
          sub_10023A400(v13, v10);
          sub_10023A320(v13, 3);
          sub_10023A464(v13, 1);
          [v27 addObject:v13];
          id v14 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [(ODPMetricsHandler *)self logKey];
            v16 = sub_10022DD24((uint64_t)AppEvent, 3u);
            v17 = [v9 valueForProperty:@"short_version"];
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v15;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v16;
            *(_WORD *)&buf[22] = 2114;
            long long v42 = (uint64_t (*)(uint64_t, uint64_t))v7;
            LOWORD(v43) = 2114;
            *(void *)((char *)&v43 + 2) = v17;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@] [%{public}@] Created app event with version: %{public}@", buf, 0x2Au);
          }
        }
        else
        {
          v10 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            long long v18 = [(ODPMetricsHandler *)self logKey];
            long long v19 = sub_10022DD24((uint64_t)AppEvent, 3u);
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v18;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v19;
            *(_WORD *)&buf[22] = 2114;
            long long v42 = (uint64_t (*)(uint64_t, uint64_t))v7;
            _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%@] [%{public}@] [%{public}@] App metadata not found", buf, 0x20u);
          }
        }

        id v5 = (char *)v5 + 1;
      }
      while (v29 != v5);
      id v20 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
      id v29 = v20;
    }
    while (v20);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v42 = sub_1000183A8;
  *(void *)&long long v43 = sub_100017D90;
  *((void *)&v43 + 1) = 0;
  long long v21 = sub_10038F000();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1003B24EC;
  v30[3] = &unk_100526AD8;
  id v22 = v27;
  id v31 = v22;
  v32 = buf;
  [v21 modifyUsingTransaction:v30];

  if (*(void *)(*(void *)&buf[8] + 40))
  {
    v23 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = [(ODPMetricsHandler *)self logKey];
      uint64_t v25 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)unsigned int v37 = 138412546;
      v38 = v24;
      __int16 v39 = 2114;
      uint64_t v40 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[%@] App uninstall metrics event import resulted in error: %{public}@", v37, 0x16u);
    }
  }
  sub_1003B12C8(self, v22);

  _Block_object_dispose(buf, 8);
}

- (void)recordLaunches:(id)a3
{
  id v4 = a3;
  uint64_t v46 = +[NSMutableArray array];
  id v5 = v4;
  long long v52 = self;
  if (!self)
  {
    id v42 = 0;
    long long v43 = (void *)v46;
    goto LABEL_40;
  }
  __int16 v48 = +[NSMutableDictionary dictionary];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v45 = v5;
  id obj = v5;
  id v51 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (!v51) {
    goto LABEL_30;
  }
  uint64_t v50 = *(void *)v62;
  do
  {
    id v6 = 0;
    do
    {
      if (*(void *)v62 != v50) {
        objc_enumerationMutation(obj);
      }
      BOOL v7 = *(id **)(*((void *)&v61 + 1) + 8 * (void)v6);
      if (!v7)
      {
        long long v21 = 0;
        goto LABEL_25;
      }
      id v8 = v7[5];
      if (v8)
      {
        v9 = v52->super._currentApps;
        id v5 = v7[5];
        id v4 = [(NSDictionary *)v9 objectForKeyedSubscript:v5];
        if (v4)
        {
          BOOL v10 = 0;
          goto LABEL_19;
        }
        v53 = v9;
      }
      id v11 = v7[16];
      if (!v11)
      {
        if (!v8) {
          goto LABEL_26;
        }
        BOOL v10 = 1;
LABEL_18:
        v9 = v53;
LABEL_19:

        v53 = v9;
        if (v10) {
          goto LABEL_26;
        }
LABEL_20:
        id v16 = v7[2];
        id v17 = v7[3];
        [v16 timeIntervalSinceDate:v17];
        double v19 = v18;

        if (v19 <= 1.0) {
          goto LABEL_26;
        }
        id v20 = v7[5];
        long long v21 = [v48 objectForKeyedSubscript:v20];

        if (v21)
        {
          id v22 = [v21 objectForKeyedSubscript:@"foregroundEvents"];
        }
        else
        {
          id v47 = v7[5];
          v23 = v52->super._currentApps;
          v24 = [(NSDictionary *)v23 objectForKeyedSubscript:v47];
          uint64_t v25 = sub_1003B1B7C((id *)&v52->super.super.isa, v47, v24);

          [v25 setObject:@"launches" forKeyedSubscript:@"eventType"];
          id v22 = +[NSMutableArray array];
          [v25 setObject:v22 forKeyedSubscript:@"foregroundEvents"];
          id v26 = v7[5];
          [v48 setObject:v25 forKeyedSubscript:v26];
        }
        id v27 = v7[3];
        uint64_t v28 = sub_100333B60((uint64_t)MetricsHandler, v27);

        id v29 = [v28 stringValue];
        v66 = v29;
        uint64_t v30 = +[NSNumber numberWithDouble:v19];
        v67 = v30;
        id v31 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        [v22 addObject:v31];

LABEL_25:
        goto LABEL_26;
      }
      id v12 = v11;
      v13 = v52->super._currentApps;
      id v14 = v7[16];
      id v15 = [(NSDictionary *)v13 objectForKeyedSubscript:v14];
      BOOL v10 = v15 == 0;

      if (v8) {
        goto LABEL_18;
      }
      if (v15) {
        goto LABEL_20;
      }
LABEL_26:
      id v6 = (char *)v6 + 1;
    }
    while (v51 != v6);
    id v32 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
    id v51 = v32;
  }
  while (v32);
LABEL_30:

  long long v33 = +[NSMutableArray array];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v34 = [v48 keyEnumerator];
  id v35 = [v34 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v58;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v58 != v37) {
          objc_enumerationMutation(v34);
        }
        __int16 v39 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v40 = objc_msgSend(v48, "objectForKeyedSubscript:", v39, v45);
        if (v40)
        {
          v41 = objc_alloc_init(AppMetricsEvent);
          sub_10023A24C(v41, v39);
          sub_10023A390(v41, 5);
          sub_10023A320(v41, 2);
          sub_10023A400(v41, v40);
          [v33 addObject:v41];
        }
      }
      id v36 = [v34 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v36);
  }

  id v42 = [v33 copy];
  id v5 = v45;
  long long v43 = (void *)v46;
LABEL_40:

  if ([v42 count])
  {
    [v43 addObjectsFromArray:v42];
    long long v44 = sub_10038F000();
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_1003B2B48;
    v54[3] = &unk_1005228E8;
    id v55 = v43;
    v56 = v52;
    [v44 modifyUsingTransaction:v54];
  }
}

- (void)recordSupplementalAppMetricsEvents
{
  v3 = sub_1002E1C14((uint64_t)MetricsCoordinator, 5);
  id v4 = sub_1003B2E28((id *)&self->super.super.isa, v3);
  if ([v4 count])
  {
    id v5 = sub_10038F000();
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1003B30C0;
    v11[3] = &unk_1005228E8;
    id v12 = v4;
    v13 = self;
    [v5 modifyUsingTransaction:v11];
  }
  sub_1002E1E70((uint64_t)MetricsCoordinator, 5);
  id v6 = sub_1002E1C14((uint64_t)MetricsCoordinator, 5);

  BOOL v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [(ODPMetricsHandler *)self logKey];
    if (v6)
    {
      [v6 timeIntervalSince1970];
      uint64_t v10 = (uint64_t)v9;
    }
    else
    {
      uint64_t v10 = 0;
    }
    *(_DWORD *)buf = 138412546;
    id v15 = v8;
    __int16 v16 = 2048;
    uint64_t v17 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%@] Updated supplemental date to: %{time_t}ld", buf, 0x16u);
  }
}

- (void)resetMetrics
{
  sub_1002E1C68((uint64_t)MetricsCoordinator, 5);
  sub_1002E1E70((uint64_t)MetricsCoordinator, 5);
  v3 = sub_1002E1F40((uint64_t)MetricsCoordinator, 5);
  id v4 = sub_1002E1C14((uint64_t)MetricsCoordinator, 5);
  id v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ODPMetricsHandler *)self logKey];
    if (v3)
    {
      [v3 timeIntervalSince1970];
      uint64_t v8 = (uint64_t)v7;
      if (v4)
      {
LABEL_4:
        [v4 timeIntervalSince1970];
        uint64_t v10 = (uint64_t)v9;
LABEL_5:
        *(_DWORD *)buf = 138412802;
        __int16 v16 = v6;
        __int16 v17 = 2048;
        uint64_t v18 = v8;
        __int16 v19 = 2048;
        uint64_t v20 = v10;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] Updated start date to: %{time_t}ld supplemental: %{time_t}ld", buf, 0x20u);

        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v8 = 0;
      if (v4) {
        goto LABEL_4;
      }
    }
    uint64_t v10 = 0;
    goto LABEL_5;
  }
LABEL_6:

  id v11 = sub_10038F000();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1003B33F8;
  v14[3] = &unk_10052A400;
  v14[4] = self;
  [v11 modifyUsingTransaction:v14];

  id v12 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [(ODPMetricsHandler *)self logKey];
    *(_DWORD *)buf = 138412290;
    __int16 v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%@] Reset metrics ", buf, 0xCu);
  }
}

- (BOOL)shouldCollectMetrics
{
  return 1;
}

- (id)topic
{
  return @"on_device_personalization";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerMetrics, 0);
  objc_storeStrong((id *)&self->_engagement, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end