@interface NavdDoomAnalytics
- (NavdDoomStorageSnapshotDataSource)snapshotDataSource;
- (id)uniqueName;
- (void)didInvalidateWindow;
- (void)setSnapshotDataSource:(id)a3;
@end

@implementation NavdDoomAnalytics

- (id)uniqueName
{
  v2 = objc_opt_class();

  return [v2 description];
}

- (void)didInvalidateWindow
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(NavdDoomAnalytics *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v42 = v4;
    __int16 v43 = 2080;
    v44 = "didInvalidateWindow";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  v5 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "didInvalidateWindow", "", buf, 2u);
  }

  v32 = self;
  v6 = [(NavdDoomAnalytics *)self snapshotDataSource];
  v7 = [v6 snapshot];

  v33 = v7;
  v8 = [v7 mostRecentDestinations];
  id v9 = [v8 copy];

  id v35 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    char v12 = 1;
    uint64_t v13 = *(void *)v37;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v16 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
        id v17 = [v15 type];
        uint64_t v18 = 3;
        if (v17 == (id)19) {
          uint64_t v18 = 4;
        }
        if ((unint64_t)v17 >= 3) {
          id v19 = (id)v18;
        }
        else {
          id v19 = v17;
        }
        v20 = +[NSNumber numberWithInteger:v19];
        [v16 setObject:v20 forKeyedSubscript:&off_1000905A0];

        v21 = +[NSNumber numberWithBool:v12 & 1];
        [v16 setObject:v21 forKeyedSubscript:&off_1000905B8];

        [v15 weight];
        v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v16 setObject:v22 forKeyedSubscript:&off_1000905D0];

        [v35 addObject:v16];
        char v12 = 0;
      }
      id v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      char v12 = 0;
    }
    while (v11);
  }

  v23 = [v33 mostRecentDoomWindow];
  v24 = [v33 mostRecentExitTime];
  id v25 = [v24 copy];
  id v26 = [v35 copy];
  id v27 = [v33 reasonForEnd];
  if (v27 == (id)2) {
    uint64_t v28 = 2;
  }
  else {
    uint64_t v28 = v27 == (id)1;
  }
  +[GEOAPPortal captureCommuteDoomWindow:exitTime:destinations:reason:networkRequests:alerts:](GEOAPPortal, "captureCommuteDoomWindow:exitTime:destinations:reason:networkRequests:alerts:", v23, v25, v26, v28, [v33 numberOfDirectionRequests], objc_msgSend(v33, "numberOfAlertableRoutes"));

  v29 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v30 = [(NavdDoomAnalytics *)v32 uniqueName];
    *(_DWORD *)buf = 138412546;
    v42 = v30;
    __int16 v43 = 2080;
    v44 = "didInvalidateWindow";
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
  }
  v31 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "didInvalidateWindow", "", buf, 2u);
  }
}

- (NavdDoomStorageSnapshotDataSource)snapshotDataSource
{
  return self->_snapshotDataSource;
}

- (void)setSnapshotDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end