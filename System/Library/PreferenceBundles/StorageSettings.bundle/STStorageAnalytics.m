@interface STStorageAnalytics
+ (id)sharedInstance;
- (BOOL)lauchEventDidSend;
- (NSDate)dateDisplayCalculating;
- (NSDate)dateDisplayEnd;
- (NSDate)dateDisplayStart;
- (void)sendAnalyticsEventActionWithType:(int64_t)a3 andActionSize:(id)a4;
- (void)sendAnalyticsEventExitWithOtherSize:(int64_t)a3;
- (void)sendAnalyticsEventLaunchWithBarData:(id)a3 otherSize:(int64_t)a4 andAppsCount:(int64_t)a5;
- (void)setDateDisplayCalculating:(id)a3;
- (void)setDateDisplayEnd:(id)a3;
- (void)setDateDisplayStart:(id)a3;
- (void)setLauchEventDidSend:(BOOL)a3;
- (void)trackDisplayCalculating;
- (void)trackDisplayEnd;
- (void)trackDisplayStart;
@end

@implementation STStorageAnalytics

+ (id)sharedInstance
{
  if (qword_3A510 != -1) {
    dispatch_once(&qword_3A510, &stru_2CB70);
  }
  v2 = (void *)qword_3A508;

  return v2;
}

- (void)trackDisplayStart
{
  v3 = [(STStorageAnalytics *)self dateDisplayStart];

  if (!v3)
  {
    v4 = +[NSDate date];
    [(STStorageAnalytics *)self setDateDisplayStart:v4];

    id v5 = [(STStorageAnalytics *)self dateDisplayStart];
    STLog();
  }
}

- (void)trackDisplayCalculating
{
  v3 = [(STStorageAnalytics *)self dateDisplayCalculating];

  if (!v3)
  {
    v4 = +[NSDate date];
    [(STStorageAnalytics *)self setDateDisplayCalculating:v4];

    id v5 = [(STStorageAnalytics *)self dateDisplayCalculating];
    STLog();
  }
}

- (void)trackDisplayEnd
{
  v3 = [(STStorageAnalytics *)self dateDisplayEnd];

  if (!v3)
  {
    v4 = +[NSDate date];
    [(STStorageAnalytics *)self setDateDisplayEnd:v4];

    id v5 = [(STStorageAnalytics *)self dateDisplayEnd];
    STLog();
  }
}

- (void)sendAnalyticsEventLaunchWithBarData:(id)a3 otherSize:(int64_t)a4 andAppsCount:(int64_t)a5
{
  id v7 = a3;
  if (![(STStorageAnalytics *)self lauchEventDidSend])
  {
    [(STStorageAnalytics *)self setLauchEventDidSend:1];
    v8 = +[STStorageDiskMonitor sharedMonitor];
    v92 = [v8 storageSpace];
    id v70 = v7;
    v9 = [v7 categories];
    v10 = objc_opt_new();
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v108 objects:v112 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v109;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v109 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v108 + 1) + 8 * i);
          v17 = [v16 identifier];

          if (v17)
          {
            v18 = [v16 identifier];
            [v10 setObject:v16 forKeyedSubscript:v18];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v108 objects:v112 count:16];
      }
      while (v13);
    }

    v19 = +[STStorageMediaMonitor sharedMonitor];
    v20 = [v19 atcDictionary];

    [(NSDate *)self->_dateDisplayCalculating timeIntervalSinceDate:self->_dateDisplayStart];
    v91 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(NSDate *)self->_dateDisplayEnd timeIntervalSinceDate:self->_dateDisplayStart];
    v90 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 deviceSize]);
    v21 = v69 = v8;
    v89 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v92 usedBytes]);
    v88 = STStorageComputePercentage();
    v87 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v92 purgeableBytes]);
    v86 = STStorageComputePercentage();
    v84 = +[NSNumber numberWithLongLong:a4];
    v82 = STStorageComputePercentage();
    v22 = [v10 objectForKeyedSubscript:STCategoryMediaKey];
    v80 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 bytes]);

    v78 = STStorageComputePercentage();
    v23 = [v10 objectForKeyedSubscript:STCategoryPhotosKey];
    v76 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v23 bytes]);

    v74 = STStorageComputePercentage();
    v24 = [v10 objectForKeyedSubscript:STCategoryAppsKey];
    v73 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v24 bytes]);

    v71 = STStorageComputePercentage();
    v25 = [v10 objectForKeyedSubscript:STCategoryMessagesKey];
    v54 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v25 bytes]);

    v56 = STStorageComputePercentage();
    v26 = [v10 objectForKeyedSubscript:STCategoryMailKey];
    v58 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v26 bytes]);

    v60 = STStorageComputePercentage();
    v27 = [v20 objectForKeyedSubscript:@"Photo"];
    v28 = [v27 objectForKeyedSubscript:@"CameraRoll"];
    uint64_t v29 = [v28 objectForKeyedSubscript:@"_Count"];
    v30 = (void *)v29;
    if (v29) {
      v31 = (_UNKNOWN **)v29;
    }
    else {
      v31 = &off_2FE88;
    }
    v65 = v31;

    v32 = v20;
    v67 = v20;
    v33 = [v20 objectForKeyedSubscript:@"Media"];
    v34 = [v33 objectForKeyedSubscript:@"Podcast"];
    uint64_t v35 = [v34 objectForKeyedSubscript:@"_Count"];
    v36 = (void *)v35;
    if (v35) {
      v37 = (_UNKNOWN **)v35;
    }
    else {
      v37 = &off_2FE88;
    }
    v53 = v37;

    v38 = [v32 objectForKeyedSubscript:@"Media"];
    v39 = [v38 objectForKeyedSubscript:@"Music"];
    uint64_t v40 = [v39 objectForKeyedSubscript:@"_Count"];
    v41 = (void *)v40;
    if (v40) {
      v42 = (_UNKNOWN **)v40;
    }
    else {
      v42 = &off_2FE88;
    }
    v62 = v42;

    v43 = +[CacheDeleteVolume rootVolume];
    v44 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v43 state]);

    v93 = v21;
    v94 = v84;
    v95 = v82;
    v96 = v80;
    v97 = v78;
    v98 = v76;
    v99 = v74;
    v100 = v71;
    v101 = v54;
    v102 = v56;
    v103 = v58;
    v104 = v60;
    v105 = v65;
    v106 = v62;
    v107 = v44;
    id v64 = v44;
    v63 = v62;
    v68 = v53;
    v66 = v65;
    id v61 = v60;
    id v59 = v58;
    id v57 = v56;
    id v55 = v54;
    id v72 = v71;
    id v45 = v73;
    id v75 = v74;
    id v77 = v76;
    id v79 = v78;
    id v81 = v80;
    id v83 = v82;
    id v85 = v84;
    id v46 = v86;
    id v47 = v87;
    id v48 = v88;
    id v49 = v89;
    id v50 = v21;
    id v51 = v90;
    id v52 = v91;
    AnalyticsSendEventLazy();

    id v7 = v70;
  }
}

- (void)sendAnalyticsEventActionWithType:(int64_t)a3 andActionSize:(id)a4
{
  id v4 = a4;
  v8 = +[STStorageDiskMonitor sharedMonitor];
  id v7 = v4;
  id v5 = v8;
  id v6 = v4;
  AnalyticsSendEventLazy();
  STLog();
}

- (void)sendAnalyticsEventExitWithOtherSize:(int64_t)a3
{
  id v5 = +[STStorageDiskMonitor sharedMonitor];
  v30 = v5;
  id v6 = [v5 storageSpace];
  v31 = +[NSDate date];
  [v31 timeIntervalSinceDate:self->_dateDisplayStart];
  v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v7 = +[STStorageMediaMonitor sharedMonitor];
  unsigned int v8 = [v7 isAsynchronouslyLoaded];

  if (v8) {
    v9 = &off_2FEB8;
  }
  else {
    v9 = &off_2FEA0;
  }
  v10 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v5 deviceSize]);
  uint64_t v29 = v6;
  id v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v6 usedBytes]);
  id v12 = STStorageComputePercentage();
  id v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v6 purgeableBytes]);
  uint64_t v14 = STStorageComputePercentage();
  v15 = +[NSNumber numberWithLongLong:a3];
  v16 = STStorageComputePercentage();
  v17 = +[CacheDeleteVolume rootVolume];
  v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v17 state]);

  v32 = v9;
  v33 = v10;
  v34 = v11;
  uint64_t v35 = v13;
  v36 = v14;
  v37 = v15;
  v38 = v16;
  v39 = v18;
  id v27 = v18;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  id v24 = v11;
  id v25 = v10;
  id v26 = v28;
  AnalyticsSendEventLazy();
  STLog();
}

- (NSDate)dateDisplayStart
{
  return self->_dateDisplayStart;
}

- (void)setDateDisplayStart:(id)a3
{
}

- (NSDate)dateDisplayCalculating
{
  return self->_dateDisplayCalculating;
}

- (void)setDateDisplayCalculating:(id)a3
{
}

- (NSDate)dateDisplayEnd
{
  return self->_dateDisplayEnd;
}

- (void)setDateDisplayEnd:(id)a3
{
}

- (BOOL)lauchEventDidSend
{
  return self->_lauchEventDidSend;
}

- (void)setLauchEventDidSend:(BOOL)a3
{
  self->_lauchEventDidSend = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateDisplayEnd, 0);
  objc_storeStrong((id *)&self->_dateDisplayCalculating, 0);

  objc_storeStrong((id *)&self->_dateDisplayStart, 0);
}

@end