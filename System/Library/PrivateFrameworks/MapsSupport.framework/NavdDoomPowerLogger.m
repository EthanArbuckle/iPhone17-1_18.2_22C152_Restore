@interface NavdDoomPowerLogger
- (NSString)uniqueName;
- (NavdDoomPowerLogger)init;
- (NavdDoomStorageSnapshotDataSource)snapshotDataSource;
- (void)_flushToPowerLog;
- (void)_resetValues;
- (void)didEndUpdate;
- (void)didFireAlert;
- (void)didReceiveTrigger:(id)a3;
- (void)setSnapshotDataSource:(id)a3;
- (void)triggerFired:(id)a3;
@end

@implementation NavdDoomPowerLogger

- (NavdDoomPowerLogger)init
{
  v10.receiver = self;
  v10.super_class = (Class)NavdDoomPowerLogger;
  v2 = [(NavdDoomPowerLogger *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("NavdDoomPowerLogger", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100047830;
    block[3] = &unk_100088EE0;
    v9 = v2;
    dispatch_async(v6, block);
  }
  return v2;
}

- (void)_flushToPowerLog
{
  v3 = [(NavdDoomPowerLogger *)self snapshotDataSource];
  dispatch_queue_t v4 = [v3 snapshot];

  if (!v4)
  {
    v15 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136446978;
    *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomPowerLogger.m";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 97;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "-[NavdDoomPowerLogger _flushToPowerLog]";
    *(_WORD *)&buf[28] = 2082;
    *(void *)&buf[30] = "snapshot == nil";
    v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Snapshot is not set!";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, v16, buf, 0x26u);
    goto LABEL_24;
  }
  updateEndDate = self->_updateEndDate;
  if (!updateEndDate)
  {
    v15 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136446978;
    *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomPowerLogger.m";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 98;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "-[NavdDoomPowerLogger _flushToPowerLog]";
    *(_WORD *)&buf[28] = 2082;
    *(void *)&buf[30] = "_updateEndDate == nil";
    v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. endDate is not set!";
    goto LABEL_9;
  }
  BOOL firedAlert = self->_firedAlert;
  int64_t triggerType = self->_triggerType;
  v40 = v4;
  id v8 = v4;
  v41 = updateEndDate;
  v9 = [v8 mostRecentDestinations];
  objc_super v10 = [v9 firstObject];

  v11 = [v8 mostRecentDoomWindow];
  if (v11)
  {
    v12 = [v8 mostRecentDoomWindow];
    v13 = [v12 endDate];
    [v13 timeIntervalSince1970];
    v39 = +[NSNumber numberWithInteger:(uint64_t)v14];
  }
  else
  {
    v39 = &off_100090990;
  }

  v17 = &off_100090990;
  if (v10)
  {
    id v18 = [v10 type];
    v19 = &off_1000909C0;
    if (v18 != (id)2) {
      v19 = &off_100090990;
    }
    if (v18 == (id)1) {
      v17 = &off_1000909A8;
    }
    else {
      v17 = v19;
    }
    v20 = [v8 mostRecentRoutesPerDestination];
    v21 = [v20 objectForKey:v10];
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v21 count] != 0);
    v22 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = &off_100090990;
  }
  BOOL v23 = firedAlert;
  v42[0] = @"trigger";
  v38 = +[NSNumber numberWithInteger:triggerType];
  *(void *)buf = v38;
  v42[1] = @"startDate";
  v37 = [v8 mostRecentStart];
  [v37 timeIntervalSince1970];
  v36 = +[NSNumber numberWithInteger:(uint64_t)v24];
  *(void *)&buf[8] = v36;
  v42[2] = @"endDate";
  [(NSDate *)v41 timeIntervalSince1970];
  v26 = +[NSNumber numberWithInteger:(uint64_t)v25];
  *(void *)&buf[16] = v26;
  v42[3] = @"LOIExitDate";
  v27 = [v8 mostRecentExitTime];
  [v27 timeIntervalSince1970];
  v29 = +[NSNumber numberWithInteger:(uint64_t)v28];
  *(void *)&buf[24] = v29;
  *(void *)&buf[32] = v17;
  v42[4] = @"destinationLOI";
  v42[5] = @"LOIEntryDate";
  v44 = v39;
  v45 = v22;
  v30 = v22;
  v42[6] = @"networkRequest";
  v42[7] = @"notified";
  v31 = +[NSNumber numberWithBool:v23];
  v46 = v31;
  v42[8] = @"scheduledWakeup";
  v32 = [v8 nextWakeup];
  [v32 timeIntervalSince1970];
  v34 = +[NSNumber numberWithInteger:(uint64_t)v33];
  v47 = v34;
  v15 = +[NSDictionary dictionaryWithObjects:buf forKeys:v42 count:9];

  if (PLShouldLogRegisteredEvent()) {
    PLLogRegisteredEvent();
  }
  v35 = GEOFindOrCreateLog();
  dispatch_queue_t v4 = v40;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    *(void *)&buf[4] = @"CommuteRefresh";
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v15;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Flushed Doom snapshot to powerlog:\n[%{private}@] %{private}@", buf, 0x16u);
  }

LABEL_24:
}

- (void)_resetValues
{
  updateEndDate = self->_updateEndDate;
  self->_int64_t triggerType = -1;
  self->_updateEndDate = 0;

  self->_BOOL firedAlert = 0;
}

- (void)didReceiveTrigger:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100047E70;
  v7[3] = &unk_1000891A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)triggerFired:(id)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100047F50;
  v5[3] = &unk_1000893C0;
  objc_copyWeak(&v6, &location);
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)didFireAlert
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100048108;
  v4[3] = &unk_1000893C0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)didEndUpdate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048284;
  block[3] = &unk_100088EE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
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
  objc_storeStrong((id *)&self->_snapshotDataSource, 0);
  objc_storeStrong((id *)&self->_updateEndDate, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end