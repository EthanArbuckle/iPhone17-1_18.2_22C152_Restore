@interface GEOExperimentServerLocalProxy
+ (void)_deleteExperimentInfoFromDisk;
- (BOOL)_removeOldExperimentsInfoIfNecessary:(BOOL)a3;
- (GEOABAssignmentResponse)experimentsInfo;
- (GEOExperimentServerLocalProxy)initWithDelegate:(id)a3;
- (GEOExperimentServerProxyDelegate)delegate;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (void)_debug_fetchAllAvailableExperiments:(id)a3;
- (void)_debug_setActiveExperimentBranchDictionaryRepresentation:(id)a3;
- (void)_debug_setBucketIdDictionaryRepresentation:(id)a3;
- (void)_debug_setQuerySubstring:(id)a3 forExperimentType:(int64_t)a4 dispatcherRequestType:(int)a5;
- (void)_loadExperimentsConfiguration:(id)a3;
- (void)_notifyExperimentsInfoChanged:(id)a3 current:(id)a4;
- (void)_setExperimentsInfo:(id)a3;
- (void)_setupRefreshTask;
- (void)_submitNonRepeatingRetryTask:(double)a3;
- (void)_updateIfNecessary;
- (void)_writeExperimentInfoToDisk:(id)a3;
- (void)abAssignUUIDWithSyncCompletionHandler:(id)a3;
- (void)cancelRefreshTask;
- (void)dealloc;
- (void)forceUpdate;
- (void)forceUpdate:(id)a3;
- (void)refreshDatasetABStatus:(id)a3;
- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5;
- (void)setDelegate:(id)a3;
- (void)submitBackgroundTasksNeededDuringDaemonStart;
@end

@implementation GEOExperimentServerLocalProxy

- (void)refreshDatasetABStatus:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 hasDatasetId])
  {
    p_experimentsInfoLock = &self->_experimentsInfoLock;
    os_unfair_lock_lock_with_options();
    v7 = [(GEOABAssignmentResponse *)self->_experimentsInfo mapsAbClientMetadata];
    v8 = [v7 clientDatasetMetadata];

    if (v8)
    {
      unsigned int v9 = [v8 datasetId];
      if (v9 != [v5 datasetId])
      {
        v10 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67240448;
          unsigned int v41 = [v8 datasetId];
          __int16 v42 = 1026;
          unsigned int v43 = [v5 datasetId];
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Data set changed (%{public}u -> %{public}u)", buf, 0xEu);
        }

        if (!self->_experimentsInfo)
        {
          v11 = (GEOABAssignmentResponse *)objc_alloc_init((Class)GEOABAssignmentResponse);
          experimentsInfo = self->_experimentsInfo;
          self->_experimentsInfo = v11;

          id v13 = objc_alloc_init((Class)GEOABSecondPartyPlaceRequestClientMetaData);
          [(GEOABAssignmentResponse *)self->_experimentsInfo setMapsAbClientMetadata:v13];

          id v14 = objc_alloc_init((Class)GEOABSecondPartyPlaceRequestClientMetaData);
          [(GEOABAssignmentResponse *)self->_experimentsInfo setParsecClientMetadata:v14];

          id v15 = objc_alloc_init((Class)GEOABSecondPartyPlaceRequestClientMetaData);
          [(GEOABAssignmentResponse *)self->_experimentsInfo setSiriClientMetadata:v15];

          id v16 = objc_alloc_init((Class)GEOABSecondPartyPlaceRequestClientMetaData);
          [(GEOABAssignmentResponse *)self->_experimentsInfo setRapClientMetadata:v16];

          id v17 = objc_alloc_init((Class)GEOPDABClientDatasetMetadata);
          v18 = [(GEOABAssignmentResponse *)self->_experimentsInfo mapsAbClientMetadata];
          [v18 setClientDatasetMetadata:v17];

          id v19 = objc_alloc_init((Class)GEOPDABClientDatasetMetadata);
          v20 = [(GEOABAssignmentResponse *)self->_experimentsInfo parsecClientMetadata];
          [v20 setClientDatasetMetadata:v19];

          id v21 = objc_alloc_init((Class)GEOPDABClientDatasetMetadata);
          v22 = [(GEOABAssignmentResponse *)self->_experimentsInfo siriClientMetadata];
          [v22 setClientDatasetMetadata:v21];

          id v23 = objc_alloc_init((Class)GEOPDABClientDatasetMetadata);
          v24 = [(GEOABAssignmentResponse *)self->_experimentsInfo rapClientMetadata];
          [v24 setClientDatasetMetadata:v23];
        }
        id v25 = [v5 datasetId];
        v26 = [(GEOABAssignmentResponse *)self->_experimentsInfo mapsAbClientMetadata];
        v27 = [v26 clientDatasetMetadata];
        [v27 setDatasetId:v25];

        id v28 = [v5 datasetId];
        v29 = [(GEOABAssignmentResponse *)self->_experimentsInfo parsecClientMetadata];
        v30 = [v29 clientDatasetMetadata];
        [v30 setDatasetId:v28];

        id v31 = [v5 datasetId];
        v32 = [(GEOABAssignmentResponse *)self->_experimentsInfo siriClientMetadata];
        v33 = [v32 clientDatasetMetadata];
        [v33 setDatasetId:v31];

        id v34 = [v5 datasetId];
        v35 = [(GEOABAssignmentResponse *)self->_experimentsInfo rapClientMetadata];
        v36 = [v35 clientDatasetMetadata];
        [v36 setDatasetId:v34];

        [(GEOExperimentServerLocalProxy *)self _writeExperimentInfoToDisk:self->_experimentsInfo];
        v37 = +[GEOResourceManifestManager modernManager];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_10000D834;
        v39[3] = &unk_100071468;
        v39[4] = self;
        [v37 updateManifest:v39];

        v38 = +[GEOPlaceDataLocalProxy shared];
        [v38 clearCache];
      }
    }
    os_unfair_lock_unlock(p_experimentsInfoLock);
  }
}

- (void)cancelRefreshTask
{
  if (sub_100022B80())
  {
    v2 = [sub_100022D94() sharedScheduler];
    uint64_t v3 = GEOExperimentServerLocalProxyBackgroundTaskIdentifier;
    id v11 = 0;
    [v2 cancelTaskRequestWithIdentifier:GEOExperimentServerLocalProxyBackgroundTaskIdentifier error:&v11];
    id v4 = v11;

    if (v4)
    {
      v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v13 = v3;
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Trouble cancelling %@ with error %@", buf, 0x16u);
      }
    }
    v6 = [sub_100022D94() sharedScheduler];
    uint64_t v7 = GEOExperimentServerLocalProxyBackgroundTaskRetryIdentifier;
    id v10 = 0;
    [v6 cancelTaskRequestWithIdentifier:GEOExperimentServerLocalProxyBackgroundTaskRetryIdentifier error:&v10];
    id v8 = v10;

    if (v8)
    {
      unsigned int v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v13 = v7;
        __int16 v14 = 2112;
        id v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Trouble cancelling %@ with error %@", buf, 0x16u);
      }
    }
  }
}

- (GEOExperimentServerLocalProxy)initWithDelegate:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOExperimentServerLocalProxy;
  v5 = [(GEOExperimentServerLocalProxy *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_experimentsInfoLock._os_unfair_lock_opaque = 0;
    v6->_currentRequestLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = geo_isolater_create();
    taskIsolater = v6->_taskIsolater;
    v6->_taskIsolater = (geo_isolater *)v7;

    unsigned int v9 = GEOExperimentConfigurationPath();
    id v10 = +[NSData dataWithContentsOfFile:v9];

    if ([v10 length])
    {
      id v11 = (GEOABAssignmentResponse *)[objc_alloc((Class)GEOABAssignmentResponse) initWithData:v10];
      experimentsInfo = v6->_experimentsInfo;
      v6->_experimentsInfo = v11;
    }
    uint64_t v13 = dispatch_get_global_queue(21, 0);
    GEORegisterPListStateCaptureLegacy();

    repeatingTask = v6->_repeatingTask;
    v6->_repeatingTask = 0;

    id v15 = v6;
  }

  return v6;
}

- (void)dealloc
{
  v6 = self->_taskIsolater;
  _geo_isolate_lock_data();
  GEOUnregisterStateCaptureLegacy();
  uint64_t v3 = +[GEOResourceManifestManager modernManager];
  [v3 removeTileGroupObserver:self];

  if (self->_currentRequest)
  {
    id v4 = +[_GEOExperimentServiceRequester sharedInstance];
    [v4 cancelRequest:self->_currentRequest];
  }
  _geo_isolate_unlock();

  v5.receiver = self;
  v5.super_class = (Class)GEOExperimentServerLocalProxy;
  [(GEOExperimentServerLocalProxy *)&v5 dealloc];
}

- (void)abAssignUUIDWithSyncCompletionHandler:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void (**)(id, id, void *, void))a3;
    sub_10000D9E8();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    GEOConfigGetDouble();
    id v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    v3[2](v3, v5, v4, 0);
  }
}

- (void)_setupRefreshTask
{
  if (sub_100022B80())
  {
    os_unfair_lock_lock_with_options();
    experimentsInfo = self->_experimentsInfo;
    if (experimentsInfo
      && ([(GEOABAssignmentResponse *)experimentsInfo hasRefreshIntervalSeconds] & 1) != 0)
    {
      v35 = self->_taskIsolater;
      _geo_isolate_lock_data();
      double Current = CFAbsoluteTimeGetCurrent();
      id v5 = [(GEOABAssignmentResponse *)self->_experimentsInfo refreshIntervalSeconds];
      [(GEOABAssignmentResponse *)self->_experimentsInfo timestamp];
      double v7 = v6;
      os_unfair_lock_unlock(&self->_experimentsInfoLock);
      GEOConfigGetDouble();
      GEOConfigGetDouble();
      GEOConfigGetDouble();
      double v8 = (double)(unint64_t)v5;
      if (v9 < (double)(unint64_t)v5)
      {
        GEOFindOrCreateLog();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          GEOConfigGetDouble();
          GEOConfigGetDouble();
          GEOConfigGetDouble();
          *(_DWORD *)buf = 134218240;
          double v37 = (double)(unint64_t)v5;
          __int16 v38 = 2048;
          uint64_t v39 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Experiment response has refresh interval of %f. Capping at %f.", buf, 0x16u);
        }

        GEOConfigGetDouble();
        GEOConfigGetDouble();
        GEOConfigGetDouble();
        double v8 = v12;
      }
      GEOConfigGetDouble();
      if (v7 + v8 - Current < v13)
      {
        GEOFindOrCreateLog();
        __int16 v14 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          GEOConfigGetDouble();
          *(_DWORD *)buf = 134217984;
          double v37 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Experiment should have refreshed already or will refresh in the next %f seconds, going to run it now", buf, 0xCu);
        }

        [(GEOExperimentServerLocalProxy *)self forceUpdate];
        goto LABEL_34;
      }
      repeatingTask = self->_repeatingTask;
      if (!repeatingTask || ([(BGRepeatingSystemTaskRequest *)repeatingTask interval], v17 == v8))
      {
        id v25 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          double v37 = v8;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Setting experiment refresh interval to %f", buf, 0xCu);
        }

        v26 = (BGRepeatingSystemTaskRequest *)[objc_alloc((Class)sub_10002300C()) initWithIdentifier:GEOExperimentServerLocalProxyBackgroundTaskIdentifier];
        v27 = self->_repeatingTask;
        self->_repeatingTask = v26;

        [(BGRepeatingSystemTaskRequest *)self->_repeatingTask setPriority:2];
        [(BGRepeatingSystemTaskRequest *)self->_repeatingTask setInterval:v8];
        [(BGRepeatingSystemTaskRequest *)self->_repeatingTask setRequiresNetworkConnectivity:1];
        [(BGRepeatingSystemTaskRequest *)self->_repeatingTask setPreventsDeviceSleep:1];
        id v28 = [sub_100022D94() sharedScheduler];
        v29 = self->_repeatingTask;
        id v33 = 0;
        unsigned __int8 v30 = [v28 submitTaskRequest:v29 error:&v33];
        v22 = (__CFString *)v33;

        if (v30) {
          goto LABEL_33;
        }
        id v31 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(double *)&CFStringRef v32 = COERCE_DOUBLE(@"Unknown");
          if (v22) {
            CFStringRef v32 = v22;
          }
          *(_DWORD *)buf = 138412290;
          double v37 = *(double *)&v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to submit task with error: %@", buf, 0xCu);
        }

        id v23 = self->_repeatingTask;
        self->_repeatingTask = 0;
      }
      else
      {
        v18 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          double v37 = v8;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Updating experiment refresh interval to %f", buf, 0xCu);
        }

        id v19 = [sub_100022D94() sharedScheduler];
        v20 = self->_repeatingTask;
        id v34 = 0;
        unsigned __int8 v21 = [v19 updateTaskRequest:v20 error:&v34];
        v22 = (__CFString *)v34;

        if (v21) {
          goto LABEL_33;
        }
        id v23 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(double *)&CFStringRef v24 = COERCE_DOUBLE(@"Unknown");
          if (v22) {
            CFStringRef v24 = v22;
          }
          *(_DWORD *)buf = 138412290;
          double v37 = *(double *)&v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to update task with error: %@", buf, 0xCu);
        }
      }

LABEL_33:
LABEL_34:
      _geo_isolate_unlock();

      return;
    }
    os_unfair_lock_unlock(&self->_experimentsInfoLock);
    [(GEOExperimentServerLocalProxy *)self cancelRefreshTask];
  }
}

- (void)_submitNonRepeatingRetryTask:(double)a3
{
  if (sub_100022B80())
  {
    id v4 = [objc_alloc((Class)sub_100022ED0()) initWithIdentifier:GEOExperimentServerLocalProxyBackgroundTaskRetryIdentifier];
    [v4 setTrySchedulingBefore:a3];
    id v5 = [sub_100022D94() sharedScheduler];
    id v10 = 0;
    unsigned __int8 v6 = [v5 submitTaskRequest:v4 error:&v10];
    double v7 = (__CFString *)v10;

    if ((v6 & 1) == 0)
    {
      double v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v9 = @"Unknown";
        if (v7) {
          CFStringRef v9 = v7;
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to submit nonrepeating task with error: %@", buf, 0xCu);
      }
    }
  }
}

- (GEOABAssignmentResponse)experimentsInfo
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_experimentsInfo;
  os_unfair_lock_unlock(p_experimentsInfoLock);

  return v4;
}

- (void)_debug_setQuerySubstring:(id)a3 forExperimentType:(int64_t)a4 dispatcherRequestType:(int)a5
{
  if (a4)
  {
    _GEOSetQueryForExperimentType();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v7 = [(GEOExperimentServerLocalProxy *)self experimentsInfo];
    [WeakRetained serverProxy:self didChangeExperimentsInfo:v7];

    notify_post("com.apple.GeoServices.experimentsChanged");
  }
}

- (BOOL)_removeOldExperimentsInfoIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = GEOURLString();
  os_unfair_lock_lock_with_options();
  experimentsInfo = self->_experimentsInfo;
  if (!experimentsInfo)
  {
    os_unfair_lock_unlock(&self->_experimentsInfoLock);
    LOBYTE(v9) = 0;
    goto LABEL_26;
  }
  uint64_t v7 = [(GEOABAssignmentResponse *)experimentsInfo sourceURL];
  if (v5 | v7) {
    unsigned int v8 = [(id)v5 isEqualToString:v7] ^ 1;
  }
  else {
    unsigned int v8 = 0;
  }
  if ([(GEOABAssignmentResponse *)self->_experimentsInfo hasBranchExpirationTtlHours])
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(GEOABAssignmentResponse *)self->_experimentsInfo timestamp];
    double v12 = v11
        + (double)(unint64_t)(3600
                                   * (void)[(GEOABAssignmentResponse *)self->_experimentsInfo branchExpirationTtlHours]);
    if (v12 < Current)
    {
      double v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349312;
        double v30 = v12;
        __int16 v31 = 2050;
        double v32 = Current;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Experiments expired. Deleting existing experiments config. Expiration time %{public}f current time %{public}f", buf, 0x16u);
      }
      uint64_t v27 = v7;

      __int16 v14 = self->_experimentsInfo;
      goto LABEL_13;
    }
  }
  __int16 v14 = self->_experimentsInfo;
  if (v8)
  {
    uint64_t v27 = v7;
LABEL_13:
    BOOL v15 = v3;
    id v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Deleting cached experiments config", buf, 2u);
    }

    double v17 = self->_experimentsInfo;
    self->_experimentsInfo = 0;

    v18 = +[NSFileManager defaultManager];
    id v19 = GEOExperimentConfigurationPath();
    id v28 = 0;
    unsigned __int8 v20 = [v18 removeItemAtPath:v19 error:&v28];
    id v21 = v28;

    BOOL v3 = v15;
    uint64_t v7 = v27;
    if ((v20 & 1) == 0)
    {
      v22 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        double v30 = *(double *)&v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to remove stale environments configuration: %{public}@", buf, 0xCu);
      }
    }
    BOOL v9 = 1;
    goto LABEL_21;
  }
  BOOL v9 = 0;
LABEL_21:
  id v23 = self->_experimentsInfo;
  os_unfair_lock_unlock(&self->_experimentsInfoLock);
  if (v9)
  {
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v25 = [(GEOExperimentServerLocalProxy *)self experimentsInfo];
      [WeakRetained serverProxy:self didChangeExperimentsInfo:v25];
    }
    notify_post("com.apple.GeoServices.experimentsChanged");
    [(GEOExperimentServerLocalProxy *)self _notifyExperimentsInfoChanged:v14 current:v23];
  }

LABEL_26:
  return v9;
}

- (void)_notifyExperimentsInfoChanged:(id)a3 current:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = +[NSMutableDictionary dictionaryWithCapacity:2];
  unsigned int v8 = sub_10000E7DC(v7);

  [v11 setObject:v8 forKeyedSubscript:NSKeyValueChangeOldKey];
  BOOL v9 = sub_10000E7DC(v6);

  [v11 setObject:v9 forKeyedSubscript:NSKeyValueChangeNewKey];
  id v10 = +[NSNotificationCenter defaultCenter];
  [v10 postNotificationName:@"GEOExperimentInfoChangedInternalNotification" object:self userInfo:v11];
}

- (void)_updateIfNecessary
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  experimentsInfo = self->_experimentsInfo;
  if (experimentsInfo
    && ([(GEOABAssignmentResponse *)experimentsInfo hasRefreshIntervalSeconds] & 1) != 0)
  {
    uint64_t v7 = GEOURLString();
    uint64_t v5 = [(GEOABAssignmentResponse *)self->_experimentsInfo sourceURL];
    if (v7 | v5)
    {
      unsigned __int8 v6 = [(id)v7 isEqualToString:v5];
      os_unfair_lock_unlock(p_experimentsInfoLock);
      if ((v6 & 1) == 0) {
        [(GEOExperimentServerLocalProxy *)self forceUpdate];
      }
    }
    else
    {
      os_unfair_lock_unlock(p_experimentsInfoLock);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_experimentsInfoLock);
    [(GEOExperimentServerLocalProxy *)self forceUpdate];
  }
}

- (void)_writeExperimentInfoToDisk:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  if (v3)
  {
    uint64_t v5 = [v3 data];
    unsigned __int8 v6 = GEOExperimentConfigurationPath();
    id v16 = 0;
    unsigned __int8 v7 = [v5 writeToFile:v6 options:268435457 error:&v16];
    id v8 = v16;

    if ((v7 & 1) == 0)
    {
      BOOL v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v8;
        id v10 = "Failed to write experiment configuration to disk: %{public}@";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v11 = GEOExperimentConfigurationPath();
  unsigned int v12 = [v4 fileExistsAtPath:v11 isDirectory:0];

  if (v12)
  {
    double v13 = GEOExperimentConfigurationPath();
    id v15 = 0;
    unsigned __int8 v14 = [v4 removeItemAtPath:v13 error:&v15];
    id v8 = v15;

    if ((v14 & 1) == 0)
    {
      BOOL v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v8;
        id v10 = "Failed to remove experiment configuration from disk: %{public}@";
        goto LABEL_9;
      }
LABEL_10:
    }
LABEL_11:
  }
}

- (void)forceUpdate
{
}

- (void)forceUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Updating experiment configuration", buf, 2u);
  }

  *(void *)buf = 0;
  unsigned __int8 v20 = buf;
  uint64_t v21 = 0x2810000000;
  v22 = &unk_10006C519;
  uint64_t v23 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000F024;
  v16[3] = &unk_1000714B8;
  id v18 = buf;
  id v6 = v4;
  id v17 = v6;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000F0C0;
  v14[3] = &unk_1000714E0;
  unsigned __int8 v7 = objc_retainBlock(v16);
  id v15 = v7;
  [v6 setExpirationHandler:v14];
  id v8 = GEOGetURL();

  if (v8)
  {
    [(GEOExperimentServerLocalProxy *)self _removeOldExperimentsInfoIfNecessary:0];
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000F110;
    v10[3] = &unk_100071508;
    id v11 = v7;
    objc_copyWeak(&v12, &location);
    v10[4] = self;
    [(GEOExperimentServerLocalProxy *)self _loadExperimentsConfiguration:v10];
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(location) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No experiments URL populated. Not updating (will update if/when tile group changes).", (uint8_t *)&location, 2u);
    }
  }
  _Block_object_dispose(buf, 8);
}

- (void)submitBackgroundTasksNeededDuringDaemonStart
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  geo_dispatch_async_qos();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

- (void)_loadExperimentsConfiguration:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = self->_currentRequest;
  id v6 = objc_alloc_init((Class)GEOABAssignmentRequest);
  id v7 = objc_alloc((Class)GEOPDClientMetadata);
  id v8 = +[GEOMapService sharedService];
  BOOL v9 = [v8 defaultTraits];
  id v10 = [v7 initWithTraits:v9];
  [v6 setClientMetadata:v10];

  id v11 = sub_10000D9E8();
  [v6 setGuid:v11];

  objc_storeStrong((id *)&self->_currentRequest, v6);
  os_unfair_lock_unlock(&self->_currentRequestLock);
  if (v5)
  {
    id v12 = +[_GEOExperimentServiceRequester sharedInstance];
    [v12 cancelRequest:v5];
  }
  double v13 = +[_GEOExperimentServiceRequester sharedInstance];
  unsigned __int8 v14 = +[GEOMapService sharedService];
  id v15 = [v14 defaultTraits];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000F900;
  v18[3] = &unk_100071558;
  v18[4] = self;
  id v19 = v6;
  id v20 = v4;
  id v16 = v4;
  id v17 = v6;
  [v13 startWithRequest:v17 traits:v15 completionHandler:v18];
}

- (void)_debug_fetchAllAvailableExperiments:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init((Class)GEOABAssignmentRequest);
    id v5 = objc_alloc((Class)GEOPDClientMetadata);
    id v6 = +[GEOMapService sharedService];
    id v7 = [v6 defaultTraits];
    id v8 = [v5 initWithTraits:v7];
    [v4 setClientMetadata:v8];

    [v4 setRequestType:2];
    BOOL v9 = +[_GEOExperimentServiceRequester sharedInstance];
    id v10 = +[GEOMapService sharedService];
    id v11 = [v10 defaultTraits];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000FB38;
    v12[3] = &unk_100071580;
    id v13 = v3;
    [v9 startWithRequest:v4 traits:v11 completionHandler:v12];
  }
}

- (void)_debug_setActiveExperimentBranchDictionaryRepresentation:(id)a3
{
  GEOConfigSetDictionary();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [(GEOExperimentServerLocalProxy *)self experimentsInfo];
  [WeakRetained serverProxy:self didChangeExperimentsInfo:v5];

  notify_post("com.apple.GeoServices.experimentsChanged");
}

- (void)_debug_setBucketIdDictionaryRepresentation:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"bucketId"];
  if (v4)
  {
    id v16 = v4;
    id v5 = [v4 unsignedIntegerValue];
    os_unfair_lock_lock_with_options();
    id v6 = [(GEOABAssignmentResponse *)self->_experimentsInfo mapsAbClientMetadata];
    id v7 = [v6 clientDatasetMetadata];
    [v7 setBucketId:v5];

    id v8 = [(GEOABAssignmentResponse *)self->_experimentsInfo parsecClientMetadata];
    BOOL v9 = [v8 clientDatasetMetadata];
    [v9 setBucketId:v5];

    id v10 = [(GEOABAssignmentResponse *)self->_experimentsInfo siriClientMetadata];
    id v11 = [v10 clientDatasetMetadata];
    [v11 setBucketId:v5];

    id v12 = [(GEOABAssignmentResponse *)self->_experimentsInfo rapClientMetadata];
    id v13 = [v12 clientDatasetMetadata];
    [v13 setBucketId:v5];

    [(GEOExperimentServerLocalProxy *)self _writeExperimentInfoToDisk:self->_experimentsInfo];
    os_unfair_lock_unlock(&self->_experimentsInfoLock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v15 = [(GEOExperimentServerLocalProxy *)self experimentsInfo];
    [WeakRetained serverProxy:self didChangeExperimentsInfo:v15];

    notify_post("com.apple.GeoServices.experimentsChanged");
    id v4 = v16;
  }
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  id v5 = sub_10000E7DC(self->_experimentsInfo);
  os_unfair_lock_unlock(p_experimentsInfoLock);
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = &__NSDictionary0__struct;
  }
  id v7 = v6;

  return v7;
}

+ (void)_deleteExperimentInfoFromDisk
{
  id v3 = +[NSFileManager defaultManager];
  id v2 = GEOExperimentConfigurationPath();
  [v3 removeItemAtPath:v2 error:0];
}

- (void)_setExperimentsInfo:(id)a3
{
}

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  experimentsInfo = self->_experimentsInfo;
  if (!experimentsInfo)
  {
    [(GEOExperimentServerLocalProxy *)self _removeOldExperimentsInfoIfNecessary:1];
LABEL_6:
    [(GEOExperimentServerLocalProxy *)self forceUpdate:0];
    goto LABEL_7;
  }
  unsigned int v12 = [(GEOABAssignmentResponse *)experimentsInfo hasRefreshIntervalSeconds];
  if ([(GEOExperimentServerLocalProxy *)self _removeOldExperimentsInfoIfNecessary:1]|| !v12)
  {
    goto LABEL_6;
  }
LABEL_7:
}

- (GEOExperimentServerProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOExperimentServerProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatingTask, 0);
  objc_storeStrong((id *)&self->_taskIsolater, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_experimentsInfo, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end