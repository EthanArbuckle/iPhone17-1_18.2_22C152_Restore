@interface ArcadePayoutMetricsHandler
- (BOOL)isCandidateAppMetadata:(id)a3;
- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4;
- (BOOL)shouldCollectMetrics;
- (id)_activeAccountIDForAppEvent:(id)a3 withAccountEvents:(id)a4;
- (id)_qualifiedEventsForWeekStartingWithDate:(id)a3;
- (id)logKey;
- (int64_t)appUsageType;
- (void)recordLaunches:(id)a3;
@end

@implementation ArcadePayoutMetricsHandler

- (int64_t)appUsageType
{
  return 4;
}

- (BOOL)isCandidateAppMetadata:(id)a3
{
  if (a3) {
    return sub_1003A400C(a3);
  }
  else {
    return 0;
  }
}

- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4
{
  id v4 = a3;
  BOOL v5 = [v4 isInstalled] && (objc_msgSend(v4, "isArcade") & 1) != 0;

  return v5;
}

- (id)logKey
{
  logKey = self->_logKey;
  if (!logKey)
  {
    id v4 = self->super._baseLogKey;
    BOOL v5 = [(LogKey *)v4 prependingCategory:@"ArcadePayout"];
    v6 = self->_logKey;
    self->_logKey = v5;

    logKey = self->_logKey;
  }
  return logKey;
}

- (void)recordLaunches:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_10030B11C();
  id v97 = sub_10030D3A0((uint64_t)v5, @"ocelot-payout-qualifying-duration-seconds", (void *)0x3C, 0);

  v6 = sub_1002188DC();
  sub_100219264((uint64_t)v6);
  v88 = +[NSMutableArray array];
  v90 = +[NSMutableDictionary dictionary];
  v7 = +[NSMutableDictionary dictionary];
  v89 = +[NSMutableDictionary dictionary];
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id obj = v4;
  id v8 = [obj countByEnumeratingWithState:&v116 objects:v130 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v101 = *(void *)v117;
    v91 = v7;
    v86 = v6;
    v87 = self;
    do
    {
      id v10 = 0;
      id v94 = v9;
      do
      {
        if (*(void *)v117 != v101) {
          objc_enumerationMutation(obj);
        }
        uint64_t v104 = *(void *)(*((void *)&v116 + 1) + 8 * (void)v10);
        if (self) {
          currentApps = self->super._currentApps;
        }
        else {
          currentApps = 0;
        }
        v12 = currentApps;
        v102 = (char *)v10;
        v13 = (void *)v104;
        if (v104) {
          v13 = *(void **)(v104 + 40);
        }
        id v14 = v13;
        v15 = [(NSDictionary *)v12 objectForKeyedSubscript:v14];

        v103 = v15;
        if ([(ArcadePayoutMetricsHandler *)self isCandidateAppMetadata:v15])
        {
          v16 = v102;
          if (v104)
          {
            if (*(void *)(v104 + 144) < (uint64_t)v97) {
              goto LABEL_13;
            }
            v27 = *(void **)(v104 + 16);
          }
          else
          {
            if ((uint64_t)v97 > 0)
            {
LABEL_13:
              v17 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                v18 = v17;
                v19 = [(ArcadePayoutMetricsHandler *)self logKey];
                if (v104)
                {
                  id v20 = *(id *)(v104 + 40);
                  uint64_t v21 = *(void *)(v104 + 144);
                  v22 = v20;
                }
                else
                {
                  id v20 = 0;
                  v22 = 0;
                  uint64_t v21 = 0;
                }
                *(_DWORD *)buf = 138412802;
                v121 = v19;
                __int16 v122 = 2114;
                id v123 = v20;
                __int16 v124 = 2048;
                uint64_t v125 = v21;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%@] [%{public}@] Skipping too short app duration: %lld", buf, 0x20u);

                v17 = v18;
              }
              goto LABEL_80;
            }
            v27 = 0;
          }
          id v28 = v27;
          v17 = sub_100218B5C((uint64_t)AccountEventCoordinator, v28);

          v100 = v17;
          if (v17)
          {
            os_log_t log = (os_log_t)sub_10022D3F8([AppEvent alloc], v15);
            [log setValue:&off_10054C390 forProperty:@"event_type"];
            v95 = sub_100218C48(v6, v17);
            v93 = [v7 objectForKeyedSubscript:v17];
            if (!v93)
            {
              v29 = objc_opt_new();
              long long v112 = 0u;
              long long v113 = 0u;
              long long v114 = 0u;
              long long v115 = 0u;
              id v30 = v95;
              id v31 = [v30 countByEnumeratingWithState:&v112 objects:v129 count:16];
              if (v31)
              {
                id v33 = v31;
                uint64_t v34 = *(void *)v113;
                do
                {
                  for (i = 0; i != v33; i = (char *)i + 1)
                  {
                    if (*(void *)v113 != v34) {
                      objc_enumerationMutation(v30);
                    }
                    id Property = *(id *)(*((void *)&v112 + 1) + 8 * i);
                    if (Property) {
                      id Property = objc_getProperty(Property, v32, 8, 1);
                    }
                    id v37 = Property;
                    v38 = sub_100222B6C(v37);
                    [v29 addObject:v38];
                  }
                  id v33 = [v30 countByEnumeratingWithState:&v112 objects:v129 count:16];
                }
                while (v33);
              }

              v39 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v29 count]);
              v7 = v91;
              [v91 setObject:v39 forKeyedSubscript:v100];

              v40 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                v41 = [(ArcadePayoutMetricsHandler *)self logKey];
                v42 = sub_1002827D0(v100);
                v43 = [v29 allObjects];
                v44 = [v43 componentsJoinedByString:@", "];
                *(_DWORD *)buf = 138412802;
                v121 = v41;
                __int16 v122 = 2114;
                id v123 = v42;
                __int16 v124 = 2114;
                uint64_t v125 = (uint64_t)v44;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "[%@] Accounts for week: %{public}@ are: [%{public}@]", buf, 0x20u);

                v7 = v91;
              }

              v16 = v102;
              v17 = v100;
            }
            v45 = [v7 objectForKeyedSubscript:v17];
            sub_100218C48(v6, v17);
            v47 = v46 = v17;
            uint64_t v48 = [(ArcadePayoutMetricsHandler *)self _activeAccountIDForAppEvent:v104 withAccountEvents:v47];

            v96 = (void *)v48;
            if (v48)
            {
              v49 = [v89 objectForKeyedSubscript:v46];
              if (!v49)
              {
                v49 = objc_opt_new();
                [v89 setObject:v49 forKeyedSubscript:v46];
              }
              v50 = (void *)v104;
              v92 = v45;
              if (v104) {
                v50 = *(void **)(v104 + 40);
              }
              id v51 = v50;
              v52 = +[NSString stringWithFormat:@"%@:%@", v51, v96];

              v17 = v100;
              id v53 = [v90 objectForKeyedSubscript:v100];
              if (!v53)
              {
                v54 = [(ArcadePayoutMetricsHandler *)self _qualifiedEventsForWeekStartingWithDate:v100];
                [v90 setObject:v54 forKeyedSubscript:v100];
                long long v110 = 0u;
                long long v111 = 0u;
                long long v108 = 0u;
                long long v109 = 0u;
                id v53 = v54;
                id v55 = [v53 countByEnumeratingWithState:&v108 objects:v128 count:16];
                if (v55)
                {
                  id v56 = v55;
                  uint64_t v57 = *(void *)v109;
                  do
                  {
                    for (j = 0; j != v56; j = (char *)j + 1)
                    {
                      if (*(void *)v109 != v57) {
                        objc_enumerationMutation(v53);
                      }
                      v59 = *(void **)(*((void *)&v108 + 1) + 8 * (void)j);
                      v60 = sub_10022E5E8(v59);
                      v61 = sub_10022DD6C(v59);
                      v62 = +[NSString stringWithFormat:@"%@:%@", v60, v61];

                      if (([v49 containsObject:v62] & 1) == 0) {
                        [v49 addObject:v62];
                      }
                    }
                    id v56 = [v53 countByEnumeratingWithState:&v108 objects:v128 count:16];
                  }
                  while (v56);
                }

                if ([v53 count])
                {
                  v63 = ASDLogHandleForCategory();
                  v6 = v86;
                  self = v87;
                  v16 = v102;
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                  {
                    v64 = [(ArcadePayoutMetricsHandler *)v87 logKey];
                    v65 = [v49 componentsJoinedByString:@", "];
                    *(_DWORD *)buf = 138412546;
                    v121 = v64;
                    __int16 v122 = 2114;
                    id v123 = v65;
                    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "[%@] Qualified for week are now: [%{public}@]", buf, 0x16u);
                  }
                }
                else
                {
                  v6 = v86;
                  self = v87;
                  v16 = v102;
                }
                v17 = v100;
              }
              if ([v49 containsObject:v52])
              {
                v77 = ASDLogHandleForCategory();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
                {
                  v78 = [(ArcadePayoutMetricsHandler *)self logKey];
                  v79 = (void *)v104;
                  if (v104) {
                    v79 = *(void **)(v104 + 40);
                  }
                  id v80 = v79;
                  *(_DWORD *)buf = 138412802;
                  v121 = v78;
                  __int16 v122 = 2114;
                  id v123 = v80;
                  __int16 v124 = 2114;
                  uint64_t v125 = (uint64_t)v52;
                  _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "[%@] Skipping event with bundleID: %{public}@. We have already have a qualifying event this week with eventKey: %{public}@", buf, 0x20u);

                  v17 = v100;
                }
              }
              else
              {
                if (v92) {
                  [log setValue:v92 forProperty:@"cumulative_user_count"];
                }
                [log setValue:v17 forProperty:@"week_start_time"];
                v81 = [v96 stringValue];
                [log setValue:v81 forProperty:@"account_id"];

                [v49 addObject:v52];
                [v88 addObject:log];
                v77 = ASDLogHandleForCategory();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
                {
                  v82 = [(ArcadePayoutMetricsHandler *)self logKey];
                  [v17 timeIntervalSince1970];
                  *(_DWORD *)buf = 138413058;
                  v121 = v82;
                  __int16 v122 = 2114;
                  id v123 = v52;
                  __int16 v124 = 2114;
                  uint64_t v125 = (uint64_t)v92;
                  __int16 v126 = 2048;
                  uint64_t v127 = (uint64_t)v83;
                  _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "[%@] Added payout event with eventKey: %{public}@ cumulativeAccountCount: %{public}@ weekStart: %{time_t}ld ", buf, 0x2Au);
                }
              }

              v7 = v91;
              v45 = v92;
            }
            else
            {
              v49 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                v69 = v45;
                v70 = [(ArcadePayoutMetricsHandler *)self logKey];
                v17 = v100;
                if (v104)
                {
                  id v71 = *(id *)(v104 + 40);
                  id v72 = *(id *)(v104 + 16);
                  v73 = v72;
                  if (v72)
                  {
                    [v72 timeIntervalSince1970];
                    uint64_t v75 = (uint64_t)v74;
                  }
                  else
                  {
                    uint64_t v75 = 0;
                  }
                  id v76 = v71;
                }
                else
                {
                  v73 = 0;
                  id v71 = 0;
                  id v76 = 0;
                  uint64_t v75 = 0;
                }
                *(_DWORD *)buf = 138412802;
                v121 = v70;
                __int16 v122 = 2114;
                id v123 = v76;
                __int16 v124 = 2048;
                uint64_t v125 = v75;
                _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "[%@] Skipping app launch event with bundleID: %{public}@ due to no active account at launch time ending: %{time_t}ld", buf, 0x20u);

                v7 = v91;
                v45 = v69;
              }
              else
              {
                v17 = v100;
              }
            }

            id v9 = v94;
          }
          else
          {
            ASDLogHandleForCategory();
            os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
            id v9 = v94;
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              v66 = [(ArcadePayoutMetricsHandler *)self logKey];
              v67 = (void *)v104;
              if (v104) {
                v67 = *(void **)(v104 + 40);
              }
              id v68 = v67;
              *(_DWORD *)buf = 138412546;
              v121 = v66;
              __int16 v122 = 2112;
              id v123 = v68;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "[%@] [%@] Could not find the week start date", buf, 0x16u);

              id v9 = v94;
              v17 = 0;
            }
          }
        }
        else
        {
          v17 = ASDLogHandleForCategory();
          v16 = v102;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v23 = v17;
            v24 = [(ArcadePayoutMetricsHandler *)self logKey];
            v25 = (void *)v104;
            if (v104) {
              v25 = *(void **)(v104 + 40);
            }
            id v26 = v25;
            *(_DWORD *)buf = 138412546;
            v121 = v24;
            __int16 v122 = 2114;
            id v123 = v26;
            _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "[%@] [%{public}@] Skipping non arcade launch event", buf, 0x16u);

            v17 = v23;
            id v9 = v94;
          }
        }
LABEL_80:

        id v10 = v16 + 1;
      }
      while (v10 != v9);
      id v84 = [obj countByEnumeratingWithState:&v116 objects:v130 count:16];
      id v9 = v84;
    }
    while (v84);
  }

  if ([v88 count])
  {
    v85 = sub_10038F000();
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472;
    v105[2] = sub_1002D3DC8;
    v105[3] = &unk_1005228E8;
    id v106 = v88;
    v107 = self;
    [v85 modifyUsingTransaction:v105];
  }
}

- (BOOL)shouldCollectMetrics
{
  v2 = sub_1003DA6D4();
  if ([v2 isHRNMode])
  {
    unsigned __int8 v3 = 0;
  }
  else
  {
    id v4 = sub_10030B11C();
    BOOL v5 = v4;
    if (v4) {
      unsigned __int8 v3 = sub_10030CE24(v4, @"arcade-payout-enabled", (void *)1, 1);
    }
    else {
      unsigned __int8 v3 = 0;
    }
  }
  return v3;
}

- (id)_activeAccountIDForAppEvent:(id)a3 withAccountEvents:(id)a4
{
  v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6) {
      id v8 = (void *)v6[3];
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    [v9 timeIntervalSinceReferenceDate];
    double v11 = v10;

    if (v6) {
      v12 = (void *)v6[2];
    }
    else {
      v12 = 0;
    }
    id v13 = v12;
    [v13 timeIntervalSinceReferenceDate];
    double v15 = v14;

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v16 = v7;
    id v18 = [v16 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v35;
      BOOL v20 = v15 < 0.0 && v11 > 0.0;
      while (2)
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v16);
          }
          v22 = *(double **)(*((void *)&v34 + 1) + 8 * (void)v21);
          if (v22)
          {
            if (v11 > v22[2] && v15 < v22[3])
            {
              id Property = objc_getProperty(v22, v17, 8, 1);
LABEL_25:
              id v24 = Property;
              sub_100222B6C(v24);
              id v18 = (id)objc_claimAutoreleasedReturnValue();

              if ([(ArcadePayoutMetricsHandler *)self appUsageType])
              {
                v25 = ASDLogHandleForCategory();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  id v26 = [(ArcadePayoutMetricsHandler *)self logKey];
                  if (v6) {
                    v27 = (void *)v6[5];
                  }
                  else {
                    v27 = 0;
                  }
                  id v28 = v27;
                  *(_DWORD *)buf = 138412802;
                  v39 = v26;
                  __int16 v40 = 2114;
                  id v41 = v28;
                  __int16 v42 = 2114;
                  id v43 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[%@] [%{public}@] Found app launch accountID: %{public}@", buf, 0x20u);
                }
              }
              goto LABEL_31;
            }
          }
          else if (v20)
          {
            id Property = 0;
            goto LABEL_25;
          }
          uint64_t v21 = (char *)v21 + 1;
        }
        while (v18 != v21);
        id v23 = [v16 countByEnumeratingWithState:&v34 objects:v44 count:16];
        id v18 = v23;
        if (v23) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    v16 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v30 = [(ArcadePayoutMetricsHandler *)self logKey];
      if (v6) {
        id v31 = (void *)v6[5];
      }
      else {
        id v31 = 0;
      }
      id v32 = v31;
      *(_DWORD *)buf = 138412546;
      v39 = v30;
      __int16 v40 = 2114;
      id v41 = v32;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%@] [%{public}@] Unable to find launch account for event due to no active accounts", buf, 0x16u);
    }
    id v18 = 0;
  }
LABEL_31:

  return v18;
}

- (id)_qualifiedEventsForWeekStartingWithDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  [v4 timeIntervalSinceReferenceDate];
  v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(ArcadePayoutMetricsHandler *)self logKey];
    id v9 = sub_1002827D0(v4);
    *(_DWORD *)buf = 138412546;
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Looking for qualified in with week: %{public}@", buf, 0x16u);
  }
  double v10 = +[SQLiteComparisonPredicate predicateWithProperty:@"week_start_time" equalToValue:v6];
  double v11 = sub_10038F000();
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1002D44B4;
  v16[3] = &unk_100526620;
  id v17 = v10;
  id v18 = self;
  id v19 = v5;
  id v12 = v5;
  id v13 = v10;
  [v11 readUsingSession:v16];

  id v14 = [v12 copy];
  return v14;
}

- (void).cxx_destruct
{
}

@end