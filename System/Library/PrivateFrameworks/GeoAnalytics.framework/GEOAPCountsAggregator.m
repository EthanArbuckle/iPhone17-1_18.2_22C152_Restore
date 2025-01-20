@interface GEOAPCountsAggregator
- (BOOL)aggregateDailyCountsAndReportFrom:(id)a3 until:(id)a4;
- (GEOAPCountsAggregator)init;
- (double)retrieveDailyAggregationInterval;
- (id)apPersistence;
- (id)now;
- (id)retrieveLastDailyAggregationTime;
- (id)retrieveLastMonthlyAggregationTime;
- (void)aggregateDailyUsageCountsAndReportFrom:(id)a3 until:(id)a4;
- (void)aggregateMonthlyCountsAndReportFrom:(id)a3 until:(id)a4;
- (void)aggregateMonthlyUsageCountsAndReportFrom:(id)a3 until:(id)a4;
- (void)reportDailySettingsFrom:(id)a3 until:(id)a4;
- (void)saveLastDailyAggregationTime:(id)a3;
- (void)saveLastMonthlyAggregationTime:(id)a3;
- (void)setup;
- (void)startDailyAggregationFromTime:(id)a3;
- (void)startMonthlyAggregationFromTime:(id)a3;
@end

@implementation GEOAPCountsAggregator

- (GEOAPCountsAggregator)init
{
  v5.receiver = self;
  v5.super_class = (Class)GEOAPCountsAggregator;
  v2 = [(GEOAPCountsAggregator *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GEOAPCountsAggregator *)v2 setup];
  }
  return v3;
}

- (void)setup
{
  v3 = (NSLock *)objc_alloc_init((Class)NSLock);
  runningLock = self->_runningLock;
  self->_runningLock = v3;

  id v21 = [(GEOAPCountsAggregator *)self now];
  objc_super v5 = [(GEOAPCountsAggregator *)self retrieveLastDailyAggregationTime];
  lastDailyAggregation = self->_lastDailyAggregation;
  self->_lastDailyAggregation = v5;

  if (!self->_lastDailyAggregation)
  {
    id v7 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    v8 = [v7 components:60 fromDate:v21];
    if ((uint64_t)[v8 hour] >= 4) {
      objc_msgSend(v8, "setDay:", (char *)objc_msgSend(v8, "day") + 1);
    }
    [v8 setHour:4];
    v9 = [v7 dateFromComponents:v8];
    v10 = self->_lastDailyAggregation;
    self->_lastDailyAggregation = v9;

    [(GEOAPCountsAggregator *)self saveLastDailyAggregationTime:self->_lastDailyAggregation];
  }
  [(GEOAPCountsAggregator *)self retrieveDailyAggregationInterval];
  self->_double dailyAggregationInterval = v11;
  v12 = +[GEOPlatform sharedPlatform];
  unsigned __int8 v13 = [v12 isInternalInstall];

  if ((v13 & 1) == 0)
  {
    double dailyAggregationInterval = self->_dailyAggregationInterval;
    if (dailyAggregationInterval < 86400.0) {
      double dailyAggregationInterval = 86400.0;
    }
    self->_double dailyAggregationInterval = dailyAggregationInterval;
  }
  v15 = [(GEOAPCountsAggregator *)self retrieveLastMonthlyAggregationTime];
  lastMonthlyAggregation = self->_lastMonthlyAggregation;
  self->_lastMonthlyAggregation = v15;

  if (!self->_lastMonthlyAggregation)
  {
    id v17 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    v18 = [v17 components:28 fromDate:v21];
    if ((uint64_t)[v18 day] >= 2) {
      objc_msgSend(v18, "setMonth:", (char *)objc_msgSend(v18, "month") + 1);
    }
    [v18 setDay:2];
    v19 = [v17 dateFromComponents:v18];
    v20 = self->_lastMonthlyAggregation;
    self->_lastMonthlyAggregation = v19;

    [(GEOAPCountsAggregator *)self saveLastMonthlyAggregationTime:self->_lastMonthlyAggregation];
  }
}

- (void)startDailyAggregationFromTime:(id)a3
{
  v4 = (NSDate *)a3;
  objc_super v5 = sub_100008CA0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "starting daily at %@", buf, 0xCu);
  }

  sub_100008914((uint64_t)self);
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  while ([(NSDate *)v6 compare:v4] == NSOrderedAscending)
  {
    id v7 = sub_100008CA0();
    os_signpost_id_t v8 = os_signpost_id_generate(v7);

    v9 = sub_100008CA0();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "DailyAggregation", "for '%@'", buf, 0xCu);
    }

    [(GEOAPCountsAggregator *)self aggregateDailyCountsAndReportFrom:self->_lastDailyAggregation until:v6];
    lastDailyAggregation = self->_lastDailyAggregation;
    self->_lastDailyAggregation = v6;
    v12 = v6;

    [(GEOAPCountsAggregator *)self saveLastDailyAggregationTime:self->_lastDailyAggregation];
    sub_100008914((uint64_t)self);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();

    unsigned __int8 v13 = sub_100008CA0();
    v14 = v13;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, v8, "DailyAggregation", "for '%@'", buf, 0xCu);
    }
  }
  v15 = sub_100008CA0();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "completed daily", buf, 2u);
  }
}

- (void)startMonthlyAggregationFromTime:(id)a3
{
  v4 = (NSDate *)a3;
  objc_super v5 = sub_100008CA0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "started monthly at %@", buf, 0xCu);
  }

  sub_100008980(self);
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  id v7 = sub_100008CA0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "next agg at %@", buf, 0xCu);
  }

  while ([(NSDate *)v6 compare:v4] == NSOrderedAscending)
  {
    os_signpost_id_t v8 = sub_100008CA0();
    os_signpost_id_t v9 = os_signpost_id_generate(v8);

    v10 = sub_100008CA0();
    double v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MonthlyAggregation", "for '%@'", buf, 0xCu);
    }

    [(GEOAPCountsAggregator *)self aggregateMonthlyCountsAndReportFrom:self->_lastMonthlyAggregation until:v6];
    lastMonthlyAggregation = self->_lastMonthlyAggregation;
    self->_lastMonthlyAggregation = v6;
    unsigned __int8 v13 = v6;

    [(GEOAPCountsAggregator *)self saveLastMonthlyAggregationTime:self->_lastMonthlyAggregation];
    sub_100008980(self);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();

    v14 = sub_100008CA0();
    v15 = v14;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v9, "MonthlyAggregation", "for '%@'", buf, 0xCu);
    }
  }
  v16 = sub_100008CA0();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "completed monthly", buf, 2u);
  }
}

- (void)reportDailySettingsFrom:(id)a3 until:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = sub_100008CA0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "starting Daily Settings report", buf, 2u);
  }

  *(void *)buf = 0;
  v15 = buf;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_1000092E0;
  v18 = sub_1000092F0;
  id v19 = 0;
  os_signpost_id_t v9 = [(GEOAPCountsAggregator *)self apPersistence];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000092F8;
  v13[3] = &unk_100028870;
  v13[4] = buf;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100009424;
  v12[3] = &unk_1000286C8;
  v12[4] = buf;
  [v9 selectDailySettingsWithVisitorBlock:v13 completionBlock:v12];

  v10 = sub_100008CA0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "finished Daily Settings report", v11, 2u);
  }

  _Block_object_dispose(buf, 8);
}

- (void)aggregateMonthlyUsageCountsAndReportFrom:(id)a3 until:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = sub_100008CA0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "starting monthly usage counts aggregation up until %{private}@", (uint8_t *)&buf, 0xCu);
  }

  os_signpost_id_t v9 = +[NSMutableDictionary dictionaryWithCapacity:113];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x2020000000;
  int v37 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  v10 = [(GEOAPCountsAggregator *)self apPersistence];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000098CC;
  v21[3] = &unk_1000288C0;
  id v11 = v7;
  id v22 = v11;
  p_long long buf = &buf;
  v26 = &v27;
  id v12 = v6;
  id v23 = v12;
  id v24 = v9;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100009CB4;
  v17[3] = &unk_100028910;
  id v19 = &buf;
  int v20 = 4;
  id v13 = v24;
  id v18 = v13;
  [v10 selectMonthlyCountsWithVisitorBlock:v21 completionBlock:v17];

  v14 = sub_100008CA0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v15 = *(_DWORD *)(*((void *)&buf + 1) + 24);
    int v16 = *((_DWORD *)v28 + 6);
    *(_DWORD *)v31 = 67109376;
    int v32 = v15;
    __int16 v33 = 1024;
    int v34 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "processed %u Monthly Usage counts; dropped %u counts",
      v31,
      0xEu);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)aggregateDailyUsageCountsAndReportFrom:(id)a3 until:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = sub_100008CA0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "starting daily usage counts aggregation up until %{private}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v66 = 0x3032000000;
  v67 = sub_1000092E0;
  v68 = sub_1000092F0;
  id v69 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = sub_1000092E0;
  v59[4] = sub_1000092F0;
  id v60 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = sub_1000092E0;
  v57[4] = sub_1000092F0;
  id v58 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = sub_1000092E0;
  v55[4] = sub_1000092F0;
  id v56 = v6;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v54[3] = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = sub_1000092E0;
  v52[4] = sub_1000092F0;
  id v9 = v56;
  id v53 = v9;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v51[3] = 0;
  v10 = +[NSMutableDictionary dictionaryWithCapacity:113];
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  int v50 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  int v46 = 0;
  id v11 = [(GEOAPCountsAggregator *)self apPersistence];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10000A598;
  v30[3] = &unk_100028960;
  id v17 = v7;
  id v31 = v17;
  int v34 = &v47;
  v35 = &v43;
  id v32 = v9;
  uint64_t v36 = v55;
  int v37 = v54;
  v38 = v52;
  v39 = v51;
  id v33 = v10;
  v40 = v57;
  v41 = v59;
  p_long long buf = &buf;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000AB94;
  v18[3] = &unk_1000289B0;
  id v21 = &v47;
  int v29 = 4;
  id v12 = v33;
  id v19 = v12;
  id v22 = v59;
  id v23 = &buf;
  id v24 = v54;
  v25 = v55;
  id v13 = v32;
  id v20 = v13;
  v26 = v51;
  uint64_t v27 = v52;
  v28 = v57;
  [v11 selectDailyCountsWithVisitorBlock:v30 completionBlock:v18];

  v14 = sub_100008CA0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v15 = *((_DWORD *)v48 + 6);
    int v16 = *((_DWORD *)v44 + 6);
    *(_DWORD *)v61 = 67109376;
    int v62 = v15;
    __int16 v63 = 1024;
    int v64 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "processed %u Daily Usage counts; dropped %u counts",
      v61,
      0xEu);
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v52, 8);

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(v55, 8);

  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);

  _Block_object_dispose(&buf, 8);
}

- (BOOL)aggregateDailyCountsAndReportFrom:(id)a3 until:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = sub_100008CA0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138478083;
    id v12 = v6;
    __int16 v13 = 2113;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "starting daily aggregation from %{private}@ until %{private}@", (uint8_t *)&v11, 0x16u);
  }

  [(GEOAPCountsAggregator *)self reportDailySettingsFrom:v6 until:v7];
  [(GEOAPCountsAggregator *)self aggregateDailyUsageCountsAndReportFrom:v6 until:v7];
  id v9 = sub_100008CA0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138478083;
    id v12 = v6;
    __int16 v13 = 2113;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "finished daily aggregation from %{private}@ until %{private}@", (uint8_t *)&v11, 0x16u);
  }

  return 1;
}

- (void)aggregateMonthlyCountsAndReportFrom:(id)a3 until:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = sub_100008CA0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138478083;
    id v11 = v6;
    __int16 v12 = 2113;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "starting monthly aggregation from %{private}@ until %{private}@", (uint8_t *)&v10, 0x16u);
  }

  [(GEOAPCountsAggregator *)self aggregateMonthlyUsageCountsAndReportFrom:v6 until:v7];
  id v9 = sub_100008CA0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138478083;
    id v11 = v6;
    __int16 v12 = 2113;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "finished monthly aggregation from %{private}@ until %{private}@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)saveLastDailyAggregationTime:(id)a3
{
}

- (id)retrieveLastDailyAggregationTime
{
  return (id)GEOConfigGetDate();
}

- (void)saveLastMonthlyAggregationTime:(id)a3
{
}

- (id)retrieveLastMonthlyAggregationTime
{
  return (id)GEOConfigGetDate();
}

- (double)retrieveDailyAggregationInterval
{
  GEOConfigGetDouble();
  return result;
}

- (id)now
{
  id v2 = objc_alloc_init((Class)NSDate);
  return v2;
}

- (id)apPersistence
{
  return +[GEOAPPersistence sharedInstance];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningLock, 0);
  objc_storeStrong((id *)&self->_lastMonthlyAggregation, 0);
  objc_storeStrong((id *)&self->_lastDailyAggregation, 0);
}

@end