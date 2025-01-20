@interface PLLibraryRepairSupport
- (BOOL)_deferActivityIfRequiredForClassName:(id)a3;
- (BOOL)_isValidProcessingURL:(id)a3 interruptedPaths:(id)a4;
- (BOOL)_runCriticalPeriodicMaintenanceTasksDeferActivityIfRequired:(id)a3;
- (BOOL)_updateDeferredCriticalMaintenanceTaskMarker:(id)a3;
- (BOOL)_updateDeferredMaintenanceTaskMarker:(id)a3 value:(id)a4;
- (BOOL)_updateMaintenanceTaskMarker:(id)a3 key:(id)a4 value:(id)a5;
- (BOOL)shouldRunLocationOfInterestUpdateTaskWithGlobalValues:(id)a3;
- (PLLibraryRepairSupport)initWithActivity:(id)a3 description:(id)a4;
- (PLPhotoLibraryBundle)bundle;
- (id)_buildIncompleteMaintenanceTaskPathsKey;
- (id)_interruptedProcessingURLs;
- (id)_registeredCriticalMaintenaceTaskClasses;
- (id)_registeredMaintenanceTaskClasses;
- (unint64_t)_indexOfRegisteredMaintenanceTaskForMarker:(id)a3;
- (void)_maintainLibrary:(id)a3 executionBlock:(id)a4;
- (void)_saveInterruptedProcessingURLs:(id)a3;
- (void)runCuratedLibraryPeriodicMaintenanceTasks;
- (void)runPeriodicMaintenance;
- (void)runPeriodicMaintenanceActivityOnAllLibrariesWithExecutionBlock:(id)a3;
- (void)setBundle:(id)a3;
@end

@implementation PLLibraryRepairSupport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_xpcActivity, 0);
}

- (void)setBundle:(id)a3
{
}

- (PLPhotoLibraryBundle)bundle
{
  return (PLPhotoLibraryBundle *)objc_getProperty(self, a2, 32, 1);
}

- (void)runPeriodicMaintenanceActivityOnAllLibrariesWithExecutionBlock:(id)a3
{
  id v38 = a3;
  v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    description = self->_description;
    *(_DWORD *)buf = 138543362;
    v59 = description;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Maintenance task: processing all libraries for %{public}@", buf, 0xCu);
  }

  v37 = +[PLLibraryBookmarkManager sharedBookmarkManager];
  v6 = [v37 allKnownLibraryURLs];
  v7 = +[PLPhotoLibraryPathManager wellKnownPhotoLibraryURLForIdentifier:1];
  v57[0] = v7;
  v8 = +[PLPhotoLibraryPathManager wellKnownPhotoLibraryURLForIdentifier:3];
  v57[1] = v8;
  v9 = +[NSArray arrayWithObjects:v57 count:2];

  id v10 = objc_alloc_init((Class)NSMutableSet);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v51;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v51 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v50 + 1) + 8 * i) path];
        v17 = +[PLFileUtilities realPathForPath:v16 error:0];

        if (v17) {
          [v10 addObject:v17];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v13);
  }

  id v18 = objc_alloc_init((Class)NSMutableArray);
  v19 = [(PLLibraryRepairSupport *)self _interruptedProcessingURLs];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v20 = v11;
  v21 = v18;
  id obj = v20;
  id v22 = [v20 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v47;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v47 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v46 + 1) + 8 * (void)j);
        if ([(PLLibraryRepairSupport *)self _isValidProcessingURL:v26 interruptedPaths:v19])
        {
          [v21 addObject:v26];
        }
      }
      id v23 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v23);
  }
  v39 = v21;
  v40 = v10;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v27 = v6;
  id v28 = [v27 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v43;
    do
    {
      for (k = 0; k != v29; k = (char *)k + 1)
      {
        if (*(void *)v43 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v42 + 1) + 8 * (void)k);
        if ([(PLLibraryRepairSupport *)self _isValidProcessingURL:v32 interruptedPaths:v19])
        {
          v33 = [v32 path];
          v34 = +[PLFileUtilities realPathForPath:v33 error:0];

          if (v34 && ([v40 containsObject:v34] & 1) == 0) {
            [v39 addObject:v32];
          }
        }
      }
      id v29 = [v27 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v29);
  }

  [(PLLibraryRepairSupport *)self _saveInterruptedProcessingURLs:v39];
  v35 = PLBackendGetLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = (NSString *)[v39 count];
    *(_DWORD *)buf = 134217984;
    v59 = v36;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Maintenance task: processing %td libraries", buf, 0xCu);
  }

  [(PLLibraryRepairSupport *)self _maintainLibrary:v39 executionBlock:v38];
}

- (void)_maintainLibrary:(id)a3 executionBlock:(id)a4
{
  id v6 = a3;
  id v29 = (void (**)(id, PLLibraryRepairSupport *))a4;
  v7 = +[NSMutableOrderedSet orderedSetWithArray:v6];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (!v9) {
    goto LABEL_27;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v33;
  while (2)
  {
    id v12 = 0;
    do
    {
      if (*(void *)v33 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v12);
      BOOL should_defer = xpc_activity_should_defer(self->_xpcActivity);
      v15 = PLBackendGetLog();
      v16 = v15;
      if (should_defer)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v37 = (unint64_t)v7;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Defer maintenance tasks operations on libraries: %@", buf, 0xCu);
        }

        xpc_activity_set_state(self->_xpcActivity, 3);
        goto LABEL_27;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v37 = (unint64_t)v13;
        __int16 v38 = 2112;
        v39 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Maintain library at URL: %@, remaining URLs: %@", buf, 0x16u);
      }

      id v31 = 0;
      unint64_t v17 = +[PLLibraryRepairSupportRegistration checkLibraryIsReadyForProcessing:v13 libraryBundle:&v31];
      id v30 = v31;
      -[PLLibraryRepairSupport setBundle:](self, "setBundle:");
      id v18 = PLBackendGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v37 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Maintain library: readyForMaintenance:%td", buf, 0xCu);
      }

      if (v17 <= 6)
      {
        if (((1 << v17) & 0x3B) != 0)
        {
          [(NSString *)v7 removeObject:v13];
          v19 = [(NSString *)v7 array];
          [(PLLibraryRepairSupport *)self _saveInterruptedProcessingURLs:v19];

LABEL_14:
          id v20 = PLBackendGetLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = v7;
            id v22 = v10;
            uint64_t v23 = v11;
            id v24 = v8;
            description = self->_description;
            uint64_t v26 = [(PLLibraryRepairSupport *)self bundle];
            *(_DWORD *)buf = 134218498;
            unint64_t v37 = v17;
            __int16 v38 = 2114;
            v39 = description;
            id v8 = v24;
            uint64_t v11 = v23;
            id v10 = v22;
            v7 = v21;
            __int16 v40 = 2112;
            v41 = v26;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error (%ld) activating library for maintenance tasks [%{public}@] for library bundle %@", buf, 0x20u);
          }
LABEL_16:

          goto LABEL_17;
        }
        if (v17 == 2) {
          goto LABEL_14;
        }
        v29[2](v29, self);
        if (xpc_activity_get_state(self->_xpcActivity) != 3)
        {
          [(NSString *)v7 removeObject:v13];
          id v20 = [(NSString *)v7 array];
          [(PLLibraryRepairSupport *)self _saveInterruptedProcessingURLs:v20];
          goto LABEL_16;
        }
      }
LABEL_17:

      id v12 = (char *)v12 + 1;
    }
    while (v10 != v12);
    id v27 = [v8 countByEnumeratingWithState:&v32 objects:v42 count:16];
    id v10 = v27;
    if (v27) {
      continue;
    }
    break;
  }
LABEL_27:

  if (![(NSString *)v7 count])
  {
    id v28 = PLBackendGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Done maintenance tasks for all libraries", buf, 2u);
    }

    xpc_activity_set_state(self->_xpcActivity, 5);
  }
}

- (BOOL)_updateDeferredCriticalMaintenanceTaskMarker:(id)a3
{
  id v4 = a3;
  v5 = +[NSDate date];
  LOBYTE(self) = [(PLLibraryRepairSupport *)self _updateMaintenanceTaskMarker:v4 key:@"PLDeferredCriticalMaintenanceTask" value:v5];

  return (char)self;
}

- (BOOL)_updateDeferredMaintenanceTaskMarker:(id)a3 value:(id)a4
{
  return [(PLLibraryRepairSupport *)self _updateMaintenanceTaskMarker:a3 key:@"PLDeferredMaintenanceTask" value:a4];
}

- (BOOL)_updateMaintenanceTaskMarker:(id)a3 key:(id)a4 value:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v13 = 0;
  unsigned __int8 v9 = [a3 setValue:v8 forKeyPath:v7 error:&v13];
  id v10 = v13;
  if ((v9 & 1) == 0)
  {
    uint64_t v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v15 = v7;
      __int16 v16 = 2114;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error updating %{public}@ with value %{public}@. Error: %@", buf, 0x20u);
    }
  }
  return v9;
}

- (BOOL)_isValidProcessingURL:(id)a3 interruptedPaths:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    id v7 = [v5 path];
    unsigned __int8 v8 = [v6 containsObject:v7];
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (id)_interruptedProcessingURLs
{
  v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [(PLLibraryRepairSupport *)self _buildIncompleteMaintenanceTaskPathsKey];
  id v5 = [v3 arrayForKey:v4];
  id v6 = +[NSSet setWithArray:v5];

  return v6;
}

- (void)_saveInterruptedProcessingURLs:(id)a3
{
  id v6 = [a3 mutableArrayValueForKeyPath:@"self.path"];
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [(PLLibraryRepairSupport *)self _buildIncompleteMaintenanceTaskPathsKey];
  [v4 setObject:v6 forKey:v5];
}

- (id)_buildIncompleteMaintenanceTaskPathsKey
{
  v2 = (void *)xpc_activity_copy_identifier();
  v3 = +[NSString stringWithUTF8String:v2];
  free(v2);
  id v4 = [v3 componentsSeparatedByString:@"."];
  id v5 = [v4 lastObject];
  id v6 = [@"PLIncompleteMaintenanceTaskPaths" stringByAppendingPathExtension:v5];

  return v6;
}

- (void)runPeriodicMaintenance
{
  v3 = [(PLLibraryRepairSupport *)self bundle];
  id v4 = [v3 libraryServicesManager];
  id v5 = [v4 wellKnownPhotoLibraryIdentifier];

  id v6 = PLBackendGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "running periodic maintenance tasks [library identifier: %ld]...", buf, 0xCu);
  }

  id v7 = [(PLLibraryRepairSupport *)self _registeredMaintenanceTaskClasses];
  unsigned __int8 v8 = [(PLLibraryRepairSupport *)self bundle];
  unsigned __int8 v9 = [v8 libraryURL];
  id v10 = +[PLAppPrivateData appPrivateDataForLibraryURL:v9];

  uint64_t v11 = [v10 valueForKey:@"PLDeferredMaintenanceTask"];
  id v31 = v10;
  unsigned __int8 v12 = [(PLLibraryRepairSupport *)self _runCriticalPeriodicMaintenanceTasksDeferActivityIfRequired:v10];
  unint64_t v13 = [(PLLibraryRepairSupport *)self _indexOfRegisteredMaintenanceTaskForMarker:v11];
  char v14 = 0;
  if (v13 >= (unint64_t)[v7 count] || (v12 & 1) != 0) {
    goto LABEL_20;
  }
  id v30 = v11;
  while (1)
  {
    id v16 = objc_alloc((Class)[v7 objectAtIndexedSubscript:v13]);
    id v17 = [(PLLibraryRepairSupport *)self bundle];
    id v18 = [v16 initWithLibraryBundle:v17];

    id v19 = (objc_class *)objc_opt_class();
    id v20 = NSStringFromClass(v19);
    unsigned __int8 v12 = [(PLLibraryRepairSupport *)self _updateDeferredMaintenanceTaskMarker:v31 value:v20];
    if ((v12 & 1) == 0) {
      break;
    }
    if ([(PLLibraryRepairSupport *)self _deferActivityIfRequiredForClassName:v20])
    {
      goto LABEL_19;
    }
    v21 = PLBackendGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Starting maintenance task %{public}@", buf, 0xCu);
    }

    id v22 = +[PLTimedPerfCheck start];
    unsigned int v23 = [v18 runTaskWithTransaction:self->_transaction];
    id v24 = [v22 perfCheckLogStringWithPerfCheckInfo:0];
    v25 = PLBackendGetLog();
    uint64_t v26 = v25;
    if (v23)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v33 = v20;
        __int16 v34 = 2114;
        long long v35 = v24;
        id v27 = v26;
        os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
        id v29 = "Completed maintenance task %{public}@%{public}@";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v27, v28, v29, buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v33 = v20;
      __int16 v34 = 2114;
      long long v35 = v24;
      id v27 = v26;
      os_log_type_t v28 = OS_LOG_TYPE_ERROR;
      id v29 = "Failed maintenance task %{public}@%{public}@";
      goto LABEL_15;
    }

    if (++v13 >= (unint64_t)[v7 count])
    {
      char v14 = 0;
      unsigned __int8 v12 = 0;
      uint64_t v11 = v30;
      goto LABEL_20;
    }
  }

  id v31 = 0;
LABEL_19:
  uint64_t v11 = v30;
  char v14 = v12 ^ 1;

LABEL_20:
  if ((v14 & 1) == 0 && (v12 & 1) == 0) {
    [(PLLibraryRepairSupport *)self _updateDeferredMaintenanceTaskMarker:v31 value:0];
  }
  [(PLXPCTransaction *)self->_transaction stillAlive];
}

- (void)runCuratedLibraryPeriodicMaintenanceTasks
{
  v3 = PLBackendGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "running curated library periodic maintenance tasks...", v13, 2u);
  }

  id v4 = [(PLLibraryRepairSupport *)self bundle];
  id v5 = [v4 libraryServicesManager];

  id v6 = [v5 momentGenerationDataManager];
  id v7 = objc_alloc((Class)PLGlobalValues);
  unsigned __int8 v8 = [v6 managedObjectContext];
  id v9 = [v7 initWithManagedObjectContext:v8];

  unsigned int v10 = [(PLLibraryRepairSupport *)self shouldRunLocationOfInterestUpdateTaskWithGlobalValues:v9];
  if (v10) {
    uint64_t v11 = 45;
  }
  else {
    uint64_t v11 = 13;
  }
  [v6 runPeriodicMaintenanceTasks:v11 withTransaction:self->_transaction];
  if (v10)
  {
    unsigned __int8 v12 = +[NSDate date];
    [v9 setLocationOfInterestUpdateDate:v12];
  }
}

- (BOOL)shouldRunLocationOfInterestUpdateTaskWithGlobalValues:(id)a3
{
  v3 = [a3 locationOfInterestUpdateDate];
  if (v3)
  {
    id v4 = +[NSDate date];
    [v4 timeIntervalSinceDate:v3];
    double v6 = v5;

    BOOL v7 = v6 > 604800.0;
    unsigned __int8 v8 = PLMomentsGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = @"NO";
      if (v6 > 604800.0) {
        id v9 = @"YES";
      }
      unsigned int v10 = v9;
      int v12 = 138543618;
      unint64_t v13 = v10;
      __int16 v14 = 2048;
      double v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "shouldRunLocationOfInterestUpdateTask: %{public}@, time since last run: %.0f", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    unsigned __int8 v8 = PLMomentsGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "shouldRunLocationOfInterestUpdateTask: YES, lastRunDate is nil", (uint8_t *)&v12, 2u);
    }
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)_runCriticalPeriodicMaintenanceTasksDeferActivityIfRequired:(id)a3
{
  id v4 = a3;
  double v5 = [v4 valueForKey:@"PLDeferredCriticalMaintenanceTask"];
  double v6 = v5;
  if (v5 && ([v5 timeIntervalSinceNow], fabs(v7) < 86400.0))
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    unint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    id v9 = [(PLLibraryRepairSupport *)self _registeredCriticalMaintenaceTaskClasses];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100009B80;
    v11[3] = &unk_10002CD70;
    v11[4] = self;
    v11[5] = &v12;
    [v9 enumerateObjectsUsingBlock:v11];

    if (*((unsigned char *)v13 + 24))
    {
      BOOL v8 = 1;
    }
    else
    {
      [(PLLibraryRepairSupport *)self _updateDeferredCriticalMaintenanceTaskMarker:v4];
      BOOL v8 = *((unsigned char *)v13 + 24) != 0;
    }
    _Block_object_dispose(&v12, 8);
  }

  return v8;
}

- (BOOL)_deferActivityIfRequiredForClassName:(id)a3
{
  id v4 = a3;
  if (xpc_activity_should_defer(self->_xpcActivity))
  {
    xpc_activity_set_state(self->_xpcActivity, 3);
    double v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Defer processing of maintenance task: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    double v6 = [(PLLibraryRepairSupport *)self bundle];
    unsigned int v7 = [v6 isShuttingDown];

    if (!v7)
    {
      BOOL v10 = 0;
      goto LABEL_9;
    }
    xpc_activity_set_state(self->_xpcActivity, 3);
    double v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = [(PLLibraryRepairSupport *)self bundle];
      id v9 = [v8 shutdownReason];
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Maintenance task early termination due to library shutdown. Reason: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }

  BOOL v10 = 1;
LABEL_9:

  return v10;
}

- (unint64_t)_indexOfRegisteredMaintenanceTaskForMarker:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    double v5 = [(PLLibraryRepairSupport *)self _registeredMaintenanceTaskClasses];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000A000;
    v9[3] = &unk_10002CD48;
    id v10 = v4;
    id v6 = [v5 indexOfObjectPassingTest:v9];

    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v7 = 0;
    }
    else {
      unint64_t v7 = (unint64_t)v6;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)_registeredMaintenanceTaskClasses
{
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v10[2] = objc_opt_class();
  v10[3] = objc_opt_class();
  v10[4] = objc_opt_class();
  v10[5] = objc_opt_class();
  v10[6] = objc_opt_class();
  v10[7] = objc_opt_class();
  v10[8] = objc_opt_class();
  v10[9] = objc_opt_class();
  v10[10] = objc_opt_class();
  v10[11] = objc_opt_class();
  v10[12] = objc_opt_class();
  v10[13] = objc_opt_class();
  v10[14] = objc_opt_class();
  v10[15] = objc_opt_class();
  v10[16] = objc_opt_class();
  v10[17] = objc_opt_class();
  v10[18] = objc_opt_class();
  v10[19] = objc_opt_class();
  v3 = +[NSArray arrayWithObjects:v10 count:20];
  id v4 = [v3 mutableCopy];
  double v5 = [(PLLibraryRepairSupport *)self bundle];
  id v6 = [v5 libraryServicesManager];
  unsigned __int8 v7 = [v6 isSyndicationPhotoLibrary];

  if ((v7 & 1) == 0) {
    [v4 addObject:objc_opt_class()];
  }
  id v8 = [v4 copy];

  return v8;
}

- (id)_registeredCriticalMaintenaceTaskClasses
{
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

- (PLLibraryRepairSupport)initWithActivity:(id)a3 description:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLLibraryRepairSupport;
  id v9 = [(PLLibraryRepairSupport *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcActivity, a3);
    objc_storeStrong((id *)&v10->_description, a4);
    uint64_t v11 = +[PLXPCTransaction transaction:[(NSString *)v10->_description UTF8String]];
    transaction = v10->_transaction;
    v10->_transaction = (PLXPCTransaction *)v11;
  }
  return v10;
}

@end