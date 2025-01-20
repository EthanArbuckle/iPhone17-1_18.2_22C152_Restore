void sub_100005658(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  unsigned int v7;
  NSObject *v8;
  BOOL v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;
  uint8_t v14[16];
  uint8_t buf[16];

  if (a1)
  {
    *(unsigned char *)(a1 + 40) = 0;
    v2 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    if (PLIsRunningInStoreDemoMode())
    {
      v3 = PLStoreDemoModeGetLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Store demo mode enabled, system photo library will be modified or replaced with demo content!", buf, 2u);
      }

      v4 = +[PLDemoModeUtilities newDemoModeUtilitiesWithDefaultSystemPaths];
      v5 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v4;

      v6 = PLStoreDemoModeGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Replacing system photo library with staged store demo content if found", v14, 2u);
      }

      v7 = [*(id *)(a1 + 48) replaceTargetPhotoLibraryWithStagedDemoLibraryIfExists];
      *(unsigned char *)(a1 + 40) = v7;
      v8 = PLStoreDemoModeGetLog();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (v7)
      {
        if (v9)
        {
          v13 = 0;
          v10 = "Installed store demo content as system photo library";
          v11 = (uint8_t *)&v13;
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v10, v11, 2u);
        }
      }
      else if (v9)
      {
        v12 = 0;
        v10 = "Did not install store demo content";
        v11 = (uint8_t *)&v12;
        goto LABEL_12;
      }
    }
  }
}

void sub_1000057B8(uint64_t a1)
{
  if (a1)
  {
    +[PLLibraryServicesManager setLibraryServicesDelegateClass:](PLLibraryServicesManager, "setLibraryServicesDelegateClass:", +[PLPlatformLibraryServicesDelegate platformLibraryServicesDelegateClass]);
    id v2 = [objc_alloc((Class)PLAssetsdServer) initWithDaemonServices:*(void *)(a1 + 8)];
    v3 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v2;

    v6 = objc_alloc_init(PLSyndicationSpotlightReceiver);
    [*(id *)(a1 + 16) setSyndicationSpotlightReceiver:v6];
    v4 = objc_alloc_init(PLSyndicationPreferencesListener);
    [*(id *)(a1 + 16) setSyndicationPreferencesListener:v4];
    v5 = objc_alloc_init(PLSpotlightDaemonClientHandler);
    [*(id *)(a1 + 16) setSearchSpotlightReceiver:v5];
    [*(id *)(a1 + 16) start];
    +[PLLibraryRepairSupportRegistration installPeriodicMaintenanceActivity];
  }
}

void sub_1000058B4(uint64_t a1)
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 16);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100005D50;
    v6[3] = &unk_10002D400;
    id v7 = v2;
    id v3 = v2;
    uint64_t v4 = sub_100005CC8(0x1DuLL, v6);
    v5 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v4;

    dispatch_resume(*(dispatch_object_t *)(a1 + 24));
  }
}

void sub_10000596C(uint64_t a1)
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 16);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100005B84;
    v6[3] = &unk_10002D400;
    id v7 = v2;
    id v3 = v2;
    uint64_t v4 = sub_100005CC8(0xFuLL, v6);
    v5 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v4;

    dispatch_resume(*(dispatch_object_t *)(a1 + 32));
  }
}

void sub_100005A24(uint64_t a1)
{
  if (a1 && *(unsigned char *)(a1 + 40))
  {
    id v2 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Enqueuing request to warm up installed demo content", buf, 2u);
    }

    id v3 = +[PLXPCTransaction transaction:](PLXPCTransaction, "transaction:", "-[PLPhotoLibraryDaemon warmUpDemoLibraryIfSupported]");
    uint64_t v4 = dispatch_get_global_queue(25, 0);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100005B44;
    v6[3] = &unk_10002D4B0;
    void v6[4] = a1;
    id v7 = v3;
    id v5 = v3;
    dispatch_async(v4, v6);
  }
}

id sub_100005B44(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) warmUpDemoLibraryInstalledFromStagedTemplate];
  id v2 = *(void **)(a1 + 40);

  return [v2 stillAlive];
}

uint64_t sub_100005B84(uint64_t a1)
{
  id v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "assetsd shutting down due to SIGTERM", v8, 2u);
  }

  [*(id *)(a1 + 32) stopObservingSystemLibraryChanges];
  pl_notify_disable_for_shutdown();
  id v3 = +[PLPhotoLibraryBundleController sharedBundleController];
  uint64_t v4 = PLPhotosErrorDomain;
  NSErrorUserInfoKey v9 = NSDebugDescriptionErrorKey;
  CFStringRef v10 = @"SIGTERM";
  id v5 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v6 = +[NSError errorWithDomain:v4 code:41021 userInfo:v5];
  [v3 shutdownAllBundlesWithReason:v6];

  return xpc_transaction_exit_clean();
}

NSObject *sub_100005CC8(uintptr_t a1, void *a2)
{
  uint64_t v4 = dispatch_get_global_queue(2, 0);
  id v5 = a2;
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a1, 0, v4);
  dispatch_source_set_event_handler(v6, v5);

  return v6;
}

id sub_100005D50(uint64_t a1)
{
  return [*(id *)(a1 + 32) logStatus];
}

void sub_100006390(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) photoLibrary];
  id v3 = [v2 managedObjectContext];

  uint64_t v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "recalculating cached counts for albums & moments...", buf, 2u);
  }

  +[PLPhotoLibrary refreshCachedCountsOnAllAssetContainersInContext:v3];
  id v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "updating play/share/view counts for assets", v10, 2u);
  }

  v6 = [*(id *)(a1 + 32) photoLibrary];
  [v6 updateAssetPlayShareViewCountsInContext:v3];

  id v7 = PLBackendGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)NSErrorUserInfoKey v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "updating play/share/view counts for memories", v9, 2u);
  }

  v8 = [*(id *)(a1 + 32) photoLibrary];
  [v8 updateMemoryPlayShareViewCountsInContext:v3];
}

id sub_1000064F8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) photoLibrary];
  +[PLAggdLogging performLibraryStatisticsLoggingForLibrary:v2 completionHandler:&stru_10002CCD8];

  id v3 = *(void **)(a1 + 40);

  return [v3 stillAlive];
}

void sub_100006564(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = PLBackendGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Error while performing statistic logging: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_100006C38(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) libraryBundle];
  id v3 = [v2 persistentContainer];

  int v4 = +[NSProgress progressWithTotalUnitCount:1];
  id v5 = [*(id *)(a1 + 32) modelMigrator];
  v6 = [v5 progress];
  [v4 addChild:v6 withPendingUnitCount:1];

  id v7 = [*(id *)(a1 + 32) modelMigrator];
  id v39 = 0;
  id v8 = [v7 migrateOrCreateDatabaseIfNecessaryWithPersistentContainer:v3 migrationPolicy:7 error:&v39];
  id v9 = v39;

  [*(id *)(a1 + 40) setMigrationType:v8];
  switch((unint64_t)v8)
  {
    case 0uLL:
    case 3uLL:
      goto LABEL_5;
    case 1uLL:
    case 2uLL:
      CFStringRef v10 = PLMigrationGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Registering background migration", buf, 2u);
      }

      v11 = [*(id *)(a1 + 32) pathManager];
      v12 = [v11 libraryURL];
      +[PLBackgroundMigrationActivity installBackgroundMigrationActivity:v12];

LABEL_5:
      v13 = [*(id *)(a1 + 32) pathManager];
      unsigned int v14 = [v13 isDeviceRestoreSupported];

      if (!v14) {
        goto LABEL_28;
      }
      v15 = [*(id *)(a1 + 32) modelMigrator];
      v16 = [v15 postProcessingToken];

      v17 = [*(id *)(a1 + 32) modelMigrator];
      v18 = [v17 deviceRestoreMigrationSupport];
      if (![v18 isRestoreFromBackup])
      {

        goto LABEL_27;
      }
      unsigned __int8 v19 = [v16 isModelMigrationRestorePostProcessingComplete];

      if (v19) {
        goto LABEL_27;
      }
      if (![*(id *)(a1 + 32) isCloudPhotoLibraryEnabled]) {
        goto LABEL_24;
      }
      v20 = [*(id *)(a1 + 32) modelMigrator];
      v21 = [v20 deviceRestoreMigrationSupport];
      unsigned int v22 = [v21 isRestoreFromBackupSourceDeviceToDevice];

      if (v22)
      {
        v23 = PLMigrationGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v24 = "Marking resources as purgeable after D2D restore";
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
      v26 = [*(id *)(a1 + 32) modelMigrator];
      v27 = [v26 deviceRestoreMigrationSupport];
      unsigned int v28 = [v27 isRestoreFromBackupSourceMegaBackup];

      if (v28)
      {
        v23 = PLMigrationGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v24 = "Marking resources as purgeable after Mega-backup restore";
          goto LABEL_21;
        }
LABEL_22:

        v29 = [*(id *)(a1 + 32) cplSettings];
        [v29 setRunOnceFlag:8 error:0];
        [v29 setRunOnceFlag:4 error:0];
LABEL_23:

        goto LABEL_24;
      }
      v34 = [*(id *)(a1 + 32) modelMigrator];
      v35 = [v34 deviceRestoreMigrationSupport];
      unsigned int v36 = [v35 isRestoreFromBackupSourceiTunes];

      if (v36)
      {
        v37 = PLMigrationGetLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Wiping CPL directory after iTunes restore", buf, 2u);
        }

        v38 = [*(id *)(a1 + 32) libraryBundle];
        v29 = [v38 indicatorFileCoordinator];

        [v29 setWipeCPLOnOpen];
        goto LABEL_23;
      }
LABEL_24:
      v30 = PLMigrationGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = [*(id *)(a1 + 32) modelMigrator];
        v32 = [v31 deviceRestoreMigrationSupport];
        v33 = [v32 restoreTypeDescription];
        *(_DWORD *)buf = 138543362;
        v41 = v33;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Writing model migration restore post processing complete token after restore type %{public}@", buf, 0xCu);
      }
      [v16 writeModelMigrationRestorePostProcessingCompleteToken];
LABEL_27:

LABEL_28:
      return;
    case 4uLL:
      [*(id *)(a1 + 40) operationCompletionActivities];
      if (PLIsErrorEqualToCode())
      {
        v25 = PLMigrationGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Rebuild prevented by user", buf, 2u);
        }

        [*(id *)(a1 + 32) deactivateWithInvalidationError:v9];
        [*(id *)(a1 + 32) shutdownLibraryWithDescription:@"Rebuild prevented by user"];
      }
      else
      {
        [*(id *)(a1 + 40) _abortWithMigrationFailureError:v9];
      }
      goto LABEL_28;
    default:
      goto LABEL_28;
  }
}

void sub_10000717C(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) cloudPhotoLibraryManager];
}

void sub_1000071AC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSystemPhotoLibrary])
  {
    uint64_t v2 = 0;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) pathManager];
    unsigned int v4 = [v3 cplInitialSyncMarkerFileExists];

    if (v4) {
      uint64_t v2 = 3;
    }
    else {
      uint64_t v2 = 2;
    }
  }
  id v5 = [*(id *)(a1 + 32) pathManager];
  objc_msgSend(v5, "setBackupExclusionAttributesForWellKnownLibrariesOrWithCreateOptions:andBackupType:", objc_msgSend(*(id *)(a1 + 32), "createOptions"), v2);
}

void sub_100007254(uint64_t a1)
{
  id v1 = [objc_alloc((Class)PLDuplicateMergeCrashRecovery) initWithLibraryServicesManager:*(void *)(a1 + 32)];
  [v1 performCrashRecoveryIfNeeded];
}

void sub_1000072AC(uint64_t a1)
{
  id v1 = [objc_alloc((Class)PHAssetCrashRecoverySupport) initWithLibraryServicesManager:*(void *)(a1 + 32)];
  [v1 recoverFromCrashIfNeeded];
}

void sub_100007304(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) backgroundJobService];
  uint64_t v2 = [*(id *)(a1 + 32) libraryBundle];
  [v3 performCrashRecoveryIfNeededOnBundle:v2];
}

void sub_100007370(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cacheDeleteSupport];
}

void sub_1000073A0(id a1)
{
}

void sub_100007B20(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelMigrator];
  id v3 = [v2 deviceRestoreMigrationSupport];
  unsigned __int8 v4 = [v3 hasCompletedDataMigratorPrerequisitesForTrackingRestoreFromCloud];

  if ((v4 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) modelMigrator];
    id v5 = [v6 deviceRestoreMigrationSupport];
    [v5 waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud];
  }
}

void sub_100007BCC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modelMigrator];
  id v3 = [v2 deviceRestoreMigrationSupport];

  if (objc_msgSend(v3, "prepareDatabaseForOTARestoreIfNecessaryWithMigrationType:", objc_msgSend(*(id *)(a1 + 40), "migrationType")))
  {
    unsigned __int8 v4 = PLMigrationGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Configuring state machine to skip file system import operation after preparing for OTA restore", v5, 2u);
    }

    [*(id *)(a1 + 40) setShouldSkipFileSystemImportOperation:1];
  }
}

void sub_100007C88(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) crashRecoverySupport];
  uint64_t v2 = [*(id *)(a1 + 32) imageWriter];
  [v3 recoverFromCrashIfNeededWithImageWriter:v2];
}

void sub_100007CF4(uint64_t a1)
{
  uint64_t v2 = +[PLXPCTransaction transaction:](PLXPCTransaction, "transaction:", "-[PLIOSPlatformLibraryServicesDelegate systemLibraryBuiltInOperations]_block_invoke_2");
  id v3 = +[PLConcurrencyLimiter sharedLimiter];
  unsigned __int8 v4 = [v3 sharedBackgroundQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007E9C;
  v6[3] = &unk_10002D4B0;
  id v7 = *(id *)(a1 + 32);
  id v8 = v2;
  id v5 = v2;
  dispatch_async(v4, v6);
}

void sub_100007DE0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) migrationType] == (id)1)
  {
    uint64_t v2 = [*(id *)(a1 + 40) libraryURL];
    unsigned int v3 = +[PLPhotoSharingHelper sharedStreamsEnabledForPhotoLibraryURL:v2];

    if (v3)
    {
      unsigned __int8 v4 = PLMigrationGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initial sync of shared albums after rebuild", v5, 2u);
      }

      +[PLPhotoSharingHelper pollForAlbumListUpdates];
    }
  }
}

id sub_100007E9C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) quickActionManager];
  [v2 buildQuickActionItems];

  unsigned int v3 = *(void **)(a1 + 40);

  return [v3 stillAlive];
}

void sub_100008018(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) photoLibrary];
  id v6 = 0;
  unsigned __int8 v3 = +[PLProjectAlbum cleanupOrphanedProjectPreviewImagesInLibrary:v2 error:&v6];
  id v4 = v6;

  if ((v3 & 1) == 0)
  {
    id v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error cleaning up orphaned project preview images: %@", buf, 0xCu);
    }
  }
  [*(id *)(a1 + 40) stillAlive];
}

uint64_t start()
{
  _set_user_dir_suffix();
  uint64_t v2 = objc_alloc_init(PLPhotoLibraryDaemon);
  uint64_t v3 = [(PLPhotoLibraryDaemon *)v2 setup];
  if (!v3)
  {
    [(PLPhotoLibraryDaemon *)v2 run];
    uint64_t v3 = 1;
  }

  return v3;
}

id sub_1000082F8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) photoLibrary];
  uint64_t v3 = [v2 managedObjectContext];
  +[PLMomentShare deleteExpiredSharesInManagedObjectContext:v3];

  id v4 = [*(id *)(a1 + 32) photoLibrary];
  id v5 = +[PLLibraryScope fireParticipantAssetTrashNotificationIfNeededWithPhotoLibrary:v4 forceNotification:0];

  id v6 = [*(id *)(a1 + 32) photoLibrary];
  id v7 = [v6 managedObjectContext];
  +[PLManagedAsset deleteOldPlaceholderAssetsInManagedObjectContext:v7];

  id v8 = *(void **)(a1 + 40);

  return [v8 stillAlive];
}

void sub_100008598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000085BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained libraryServicesManager];
    id v4 = [v3 databaseContext];
    id v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    id v6 = objc_claimAutoreleasedReturnValue();
    id v7 = objc_msgSend(v4, "newShortLivedLibraryWithName:", objc_msgSend(v6, "UTF8String"));
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void sub_100009B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009B80(uint64_t a1, Class aClass, uint64_t a3, unsigned char *a4)
{
  id v7 = NSStringFromClass(aClass);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _deferActivityIfRequiredForClassName:v7];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v8 = [aClass alloc];
    id v9 = [*(id *)(a1 + 32) bundle];
    id v10 = [v8 initWithLibraryBundle:v9];

    v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543362;
      Class v21 = aClass;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting critical maintenance task %{public}@", (uint8_t *)&v20, 0xCu);
    }

    v12 = +[PLTimedPerfCheck start];
    unsigned int v13 = [v10 runTaskWithTransaction:*(void *)(*(void *)(a1 + 32) + 16)];
    unsigned int v14 = [v12 perfCheckLogStringWithPerfCheckInfo:0];
    v15 = PLBackendGetLog();
    v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543618;
        Class v21 = aClass;
        __int16 v22 = 2114;
        v23 = v14;
        v17 = "Completed maintenance task %{public}@%{public}@";
        v18 = v16;
        os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, (uint8_t *)&v20, 0x16u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138543618;
      Class v21 = aClass;
      __int16 v22 = 2114;
      v23 = v14;
      v17 = "Failed maintenance task %{public}@%{public}@";
      v18 = v16;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  *a4 = 1;
LABEL_12:
}

id sub_10000A000(uint64_t a1, Class aClass)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = NSStringFromClass(aClass);
  id v4 = [v2 isEqualToString:v3];

  return v4;
}

void sub_10000A6BC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) libraryServicesManager];
  uint64_t v3 = [v2 libraryBundle];
  id v4 = [v3 persistentContainer];

  id v5 = [*(id *)(a1 + 32) libraryServicesManager];
  id v6 = [v5 modelMigrator];
  id v19 = 0;
  id v7 = (char *)[v6 migrateOrCreateDatabaseIfNecessaryWithPersistentContainer:v4 migrationPolicy:7 error:&v19];
  id v8 = v19;

  [*(id *)(a1 + 32) setMigrationType:v7];
  if ((unint64_t)(v7 - 1) < 2)
  {
    id v9 = PLMigrationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registering background migration", buf, 2u);
    }

    id v10 = [*(id *)(a1 + 32) libraryServicesManager];
    v11 = [v10 pathManager];
    v12 = [v11 libraryURL];
    +[PLBackgroundMigrationActivity installBackgroundMigrationActivity:v12];

LABEL_12:
    goto LABEL_13;
  }
  if (v7 == (char *)4)
  {
    unsigned int v13 = PLMigrationGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Database migration failed: %@", buf, 0xCu);
    }

    unsigned int v14 = [v8 userInfo];
    uint64_t v15 = [v14 objectForKeyedSubscript:NSDebugDescriptionErrorKey];
    v16 = (void *)v15;
    if (v15) {
      id v17 = (id)v15;
    }
    else {
      id v17 = v8;
    }
    v18 = +[NSString stringWithFormat:@"Cannot create persistent store: %@", v17];

    id v10 = v18;
    [v10 UTF8String];
    PLAbortWithReason();
    goto LABEL_12;
  }
LABEL_13:
}

void sub_10000A914(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) libraryServicesManager];
  [v1 cloudPhotoLibraryManager];
}

void sub_10000A960(id a1)
{
}

void sub_10000AB70(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) capabilities];
  unsigned int v3 = [v2 isCentralizedCacheDeleteCapable];

  if (v3)
  {
    id v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "verifying and fixing local availability for resources with broken fileIDs", buf, 2u);
    }

    uint64_t v6 = 0;
    *(void *)buf = 0;
    uint64_t v5 = 0;
    +[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:*(void *)(a1 + 40) countPresent:buf countMissing:&v6 countUnableToVerify:&v5 error:0];
  }
}

id sub_10000AC2C(uint64_t a1)
{
  return +[PLCacheDeleteSupport clearPurgeableIsCloneStateOnPurgeableResourcesOnceIfNecessaryInManagedObjectContext:*(void *)(a1 + 32) pathManager:*(void *)(a1 + 40)];
}

BOOL sub_10000B394(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  uint64_t v5 = a3;
  uint64_t v6 = PLBackendGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Failed to identify url: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

void sub_10000B7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000BA34(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 managedObjectContext];

    if (v5)
    {
      uint64_t v6 = [v4 managedObjectContext];
      id v7 = [v6 persistentStoreCoordinator];

      if (v7)
      {
        uint64_t v8 = 1;
        goto LABEL_17;
      }
      unsigned int v14 = PLImageManagerGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "resource availability service failure: nil persistent store coordinator", v18, 2u);
      }

      uint64_t v10 = PLPhotosErrorDomain;
      NSErrorUserInfoKey v19 = NSDebugDescriptionErrorKey;
      CFStringRef v20 = @"resource availability service failure: nil persistent store coordinator";
      v11 = &v20;
      v12 = &v19;
    }
    else
    {
      unsigned int v13 = PLImageManagerGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "resource availability service failure: nil moc", v18, 2u);
      }

      uint64_t v10 = PLPhotosErrorDomain;
      NSErrorUserInfoKey v21 = NSDebugDescriptionErrorKey;
      CFStringRef v22 = @"resource availability service failure: nil moc";
      v11 = &v22;
      v12 = &v21;
    }
  }
  else
  {
    id v9 = PLImageManagerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "resource availability service failure: nil photo library", v18, 2u);
    }

    uint64_t v10 = PLPhotosErrorDomain;
    NSErrorUserInfoKey v23 = NSDebugDescriptionErrorKey;
    CFStringRef v24 = @"resource availability service failure: nil photo library";
    v11 = &v24;
    v12 = &v23;
  }
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v12 count:1];
  id v16 = +[NSError errorWithDomain:v10 code:46502 userInfo:v15];
  if (a2)
  {
    id v16 = v16;
    *a2 = v16;
  }

  uint64_t v8 = 0;
LABEL_17:

  return v8;
}

void sub_10000BCBC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  PLSanitizedErrorForXPC();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);
}

void sub_10000BEDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  PLSanitizedErrorForXPC();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);
}

void sub_10000C124(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  v18 = +[NSDate date];
  [v18 timeIntervalSinceDate:a1[4]];
  uint64_t v20 = v19;

  NSErrorUserInfoKey v21 = PLImageManagerGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = a1[5];
    CFStringRef v23 = @"N";
    int v26 = 138544386;
    if (a2) {
      CFStringRef v23 = @"Y";
    }
    uint64_t v27 = v22;
    __int16 v28 = 2114;
    CFStringRef v29 = v23;
    __int16 v30 = 2112;
    id v31 = v13;
    __int16 v32 = 2048;
    uint64_t v33 = v20;
    __int16 v34 = 2114;
    id v35 = v14;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ video request replying to client with success: %{public}@, url: %@, duration: %.3fs, error: %{public}@", (uint8_t *)&v26, 0x34u);
  }

  uint64_t v24 = a1[6];
  v25 = PLSanitizedErrorForXPC();
  (*(void (**)(uint64_t, uint64_t, id, id, id, id, void *))(v24 + 16))(v24, a2, v13, v17, v16, v15, v25);
}

void sub_10000C5B0(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = +[NSDate date];
  [v15 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v17 = v16;

  v18 = [*(id *)(a1 + 40) resourceIdentity];
  [v18 recipeID];
  os_log_type_t v19 = PLShouldBoostLogLevelForResourceRecipeID() ^ 1;

  uint64_t v20 = PLImageManagerGetLog();
  if (os_log_type_enabled(v20, v19))
  {
    id v30 = v13;
    id v32 = v11;
    if (a2) {
      CFStringRef v21 = @"Y";
    }
    else {
      CFStringRef v21 = @"N";
    }
    id v22 = v14;
    uint64_t v23 = *(void *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "assetObjectIDURL", v30, v32);
    uint64_t v24 = v34 = v12;
    PLShortObjectIDFromURL();
    v25 = unsigned int v35 = a2;
    int v26 = [*(id *)(a1 + 40) resourceIdentity];
    uint64_t v27 = PLResourceIdentityShortDescription();
    *(_DWORD *)buf = 138544642;
    uint64_t v37 = v23;
    id v14 = v22;
    __int16 v38 = 2114;
    CFStringRef v39 = v21;
    id v13 = v31;
    id v11 = v33;
    __int16 v40 = 2048;
    uint64_t v41 = v17;
    __int16 v42 = 2114;
    v43 = v33;
    __int16 v44 = 2114;
    v45 = v25;
    __int16 v46 = 2114;
    v47 = v27;
    _os_log_impl((void *)&_mh_execute_header, v20, v19, "[RM]: %{public}@ resource availability request replying to client with success: %{public}@, duration: %.3fs, error: %{public}@, asset: %{public}@, resource: %{public}@", buf, 0x3Eu);

    id v12 = v34;
    a2 = v35;
  }

  uint64_t v28 = *(void *)(a1 + 56);
  CFStringRef v29 = PLSanitizedErrorForXPC();
  (*(void (**)(uint64_t, uint64_t, id, id, id, void *))(v28 + 16))(v28, a2, v14, v13, v12, v29);
}

id sub_10000CA08(uint64_t a1)
{
  return [*(id *)(a1 + 32) stillAlive];
}

void sub_10000CB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000CB4C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v9 = 0;
  uint64_t v3 = +[PLPerson fetchDuplicatePersonUUIDsInManagedObjectContext:v2 error:&v9];
  id v4 = v9;

  if (v3)
  {
    if ([v3 count])
    {
      uint64_t v5 = PLBackendGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = [v3 count];
        *(_DWORD *)buf = 134218242;
        id v11 = v6;
        __int16 v12 = 2114;
        id v13 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Duplicate personUUID maintenance: Found %tu duplicates: %{public}@", buf, 0x16u);
      }

      id v7 = [*(id *)(a1 + 32) pathManager];
      [v7 setSqliteErrorForRebuildReason:19 allowsExit:1];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Duplicate personUUID maintenance: failed to detect duplicate personUUIDs: %@", buf, 0xCu);
    }
  }
}

BOOL sub_10000D240(uint64_t a1)
{
  BOOL should_defer = xpc_activity_should_defer(*(xpc_activity_t *)(*(void *)(a1 + 32) + 16));
  if (should_defer)
  {
    xpc_activity_set_state(*(xpc_activity_t *)(*(void *)(a1 + 32) + 16), 3);
    uint64_t v3 = PLMigrationGetLog();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

    if (v4)
    {
      if (*(void *)(a1 + 40))
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        *(_OWORD *)buf = 0u;
        long long v12 = 0u;
        uint64_t v5 = PLMigrationGetLog();
        os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
        v10[0] = 0;
        LODWORD(v9) = 2;
        id v6 = (uint8_t *)_os_log_send_and_compose_impl();

        objc_msgSend(*(id *)(a1 + 40), "logWithMessage:fromCodeLocation:type:", v6, "PLBackgroundMigrationActivity.m", 47, 1, v10, v9);
        if (v6 != buf) {
          free(v6);
        }
      }
      else
      {
        id v7 = PLMigrationGetLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Defer processing background migration", buf, 2u);
        }
      }
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 24) stillAlive];
  return !should_defer;
}

void sub_10000D660(void *a1, void *a2)
{
  uint64_t v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    uint64_t v4 = a1[4];
    id v11 = 0;
    unint64_t v5 = +[PLLibraryRepairSupportRegistration checkLibraryIsReadyForProcessing:v4 libraryBundle:&v11];
    id v6 = v11;
    if (v5 > 6)
    {
LABEL_12:

      goto LABEL_13;
    }
    if (((1 << v5) & 0x37) != 0)
    {
      xpc_activity_set_state(v3, 5);
      PLBackendGetLog();
      id v7 = (PLBackgroundMigrationActivity *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = a1[6];
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v8;
        uint64_t v9 = "Library not ready for background migration. Identifier: %@";
LABEL_6:
        _os_log_impl((void *)&_mh_execute_header, &v7->super, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      }
    }
    else
    {
      if (v5 != 3)
      {
        id v7 = [[PLBackgroundMigrationActivity alloc] initWithLibraryBundle:v6 xpcActivity:v3 description:a1[5]];
        [(PLBackgroundMigrationActivity *)v7 _runBackgroundMigrationActions];
        goto LABEL_11;
      }
      xpc_activity_set_state(v3, 3);
      PLBackendGetLog();
      id v7 = (PLBackgroundMigrationActivity *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = a1[6];
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v10;
        uint64_t v9 = "Library not ready for background migration - rebuild in progress. Identifier: %@";
        goto LABEL_6;
      }
    }
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:
}

void sub_10000DEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000DEE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000DEF4(uint64_t a1)
{
}

void sub_10000DEFC(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) libraryServicesManager];
  uint64_t v2 = [v5 cloudPhotoLibraryManager];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000E198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class sub_10000E1B8(uint64_t a1)
{
  v6[0] = 0;
  if (!qword_100034E68)
  {
    v6[1] = _NSConcreteStackBlock;
    v6[2] = (void *)3221225472;
    v6[3] = sub_10000E3A4;
    void v6[4] = &unk_10002D3D8;
    void v6[5] = v6;
    long long v7 = off_10002CEE0;
    uint64_t v8 = 0;
    qword_100034E68 = _sl_dlopen();
  }
  if (!qword_100034E68)
  {
    uint64_t v3 = +[NSAssertionHandler currentHandler];
    uint64_t v4 = +[NSString stringWithUTF8String:"void *MobileBackupLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PLCPLManagerMaintenanceTask.m", 28, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("MBManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = +[NSAssertionHandler currentHandler];
    id v5 = +[NSString stringWithUTF8String:"Class getMBManagerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PLCPLManagerMaintenanceTask.m", 29, @"Unable to find class %s", "MBManager");

LABEL_10:
    __break(1u);
  }
  qword_100034E60 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000E3A4()
{
  uint64_t result = _sl_dlopen();
  qword_100034E68 = result;
  return result;
}

void sub_10000E904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000E940(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v3 + 40);
  unsigned __int8 v4 = [v2 processObjectsWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v4;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v5 = (void *)a1[5];
    if (v5)
    {
      uint64_t v6 = *(void *)(a1[7] + 8);
      id v8 = *(id *)(v6 + 40);
      unsigned __int8 v7 = [v5 processObjectsWithError:&v8];
      objc_storeStrong((id *)(v6 + 40), v8);
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v7;
    }
  }
}

void sub_10000F224(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _signalBackgroundProcessingNeededForSyndication];
}

void sub_10000FD70(id a1, PLResult *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = PLSearchBackendDonationsGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Auto bug capture completed with result: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100010220(id a1, PLResult *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = PLSearchBackendDonationsGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Auto bug capture completed with result: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_1000107B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000107F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100010804(uint64_t a1)
{
}

void sub_10001080C(uint64_t a1)
{
  uint64_t v2 = +[PLFetchingAlbum predicateForAlbumKind:1613];
  uint64_t v3 = +[PLManagedAsset entityName];
  int v4 = +[NSFetchRequest fetchRequestWithEntityName:v3];

  [v4 setPredicate:v2];
  id v5 = [*(id *)(a1 + 32) photoLibrary];
  uint64_t v6 = [v5 managedObjectContext];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [v6 countForFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
}

void sub_100010AE8(uint64_t a1)
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = sub_100010C00;
  v4[4] = sub_100010C10;
  id v5 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) databaseContext];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100010C18;
  v3[3] = &unk_10002D0A0;
  v3[4] = v4;
  [v2 performTransactionSync:v3 withName:"+[PLLibraryRepairSupportRegistration _enqueueSocialGroupAssetContainmentOperationWithLSM:library:serverTransaction:]_block_invoke"];

  [*(id *)(a1 + 40) completeTransactionScope:PLTransactionScopeSocialGroupAssetContainment];
  _Block_object_dispose(v4, 8);
}

void sub_100010BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010C00(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100010C10(uint64_t a1)
{
}

void sub_100010C18(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 managedObjectContext];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v4 + 40);
  unsigned __int8 v5 = +[PLSocialGroup runAssetContainmentOnAllSocialGroupsInContext:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error running asset containment for all groups in the library: %@", buf, 0xCu);
    }
  }
}

void sub_100010E60(id *a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = [a1[4] pathManager];
  id v8 = 0;
  LOBYTE(v2) = +[PLBackgroundModelMigration resetBackgroundActionClass:v2 pathManager:v3 error:&v8];
  id v4 = v8;

  if ((v2 & 1) == 0)
  {
    unsigned __int8 v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error resetting PLModelMigrationAction_DrawAssetPersonEdges: %@", buf, 0xCu);
    }
  }
  uint64_t v6 = [a1[5] pathManager];
  uint64_t v7 = [v6 libraryURL];
  +[PLBackgroundMigrationActivity installBackgroundMigrationActivity:v7];

  [a1[6] completeTransactionScope:PLTransactionScopeSocialGroupAssetPersonEdges];
}

id sub_1000110D0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) databaseContext];
  [v2 performTransactionSync:&stru_10002D078 withName:"+[PLLibraryRepairSupportRegistration _enqueueSocialGroupDeduplicationOperationWithLSM:library:serverTransaction:]_block_invoke"];

  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = PLTransactionScopeSocialGroupDeduplication;

  return [v3 completeTransactionScope:v4];
}

void sub_100011138(id a1, PLPhotoLibrary *a2)
{
  uint64_t v2 = [(PLPhotoLibrary *)a2 managedObjectContext];
  id v6 = 0;
  unsigned __int8 v3 = +[PLSocialGroup deleteDuplicateGraphAndUnverifiedGroupsInContext:v2 error:&v6];
  id v4 = v6;

  if ((v3 & 1) == 0)
  {
    unsigned __int8 v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error deduplicating social groups in library: %@", buf, 0xCu);
    }
  }
}

void sub_100011394(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[PLClientServerTransaction beginClientTransactionWithChangeScopes:pathManager:identifier:](PLClientServerTransaction, "beginClientTransactionWithChangeScopes:pathManager:identifier:", v3, *(void *)(a1 + 32), "+[PLLibraryRepairSupportRegistration enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:]_block_invoke");
  unsigned __int8 v5 = [v4 transactionToken];
  id v6 = +[PLClientServerTransaction beginServerTransactionWithToken:changeScopes:pathManager:identifier:](PLClientServerTransaction, "beginServerTransactionWithToken:changeScopes:pathManager:identifier:", v5, v3, *(void *)(a1 + 32), "+[PLLibraryRepairSupportRegistration enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:]_block_invoke");

  [v4 completeTransaction];
  uint64_t v7 = PLTransactionScopeMomentGeneration;
  if ([v3 containsObject:PLTransactionScopeMomentGeneration])
  {
    if (PLPlatformMomentsSupported())
    {
      uint64_t v8 = PLLibraryServicesOperationNameCrashRecoveryRebuildMoments;
      uint64_t v9 = [*(id *)(a1 + 40) preRunningProgress];
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_100011C04;
      v55[3] = &unk_10002D4B0;
      v56 = *(id *)(a1 + 40);
      id v57 = v6;
      id v10 = +[PLLibraryServicesOperation operationWithName:v8 requiredState:6 parentProgress:v9 execution:v55];

      [*(id *)(a1 + 40) enqueueOperation:v10 error:0];
      id v11 = v56;
    }
    else
    {
      [v6 completeTransactionScope:v7];
      id v11 = PLMomentsGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Ignoring requested moment rebuild because of outstanding transactions", buf, 2u);
      }
    }
  }
  if (([v3 containsObject:PLTransactionScopeAlbumCounts] & 1) != 0
    || [v3 containsObject:PLTransactionScopeImportSessionCounts])
  {
    uint64_t v12 = PLLibraryServicesOperationNameCrashRecoveryRecalculateAlbumCounts;
    uint64_t v13 = [*(id *)(a1 + 40) preRunningProgress];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100011D6C;
    v50[3] = &unk_10002D2A0;
    id v51 = *(id *)(a1 + 40);
    id v52 = v3;
    id v53 = v6;
    uint64_t v14 = +[PLLibraryServicesOperation operationWithName:v12 requiredState:7 parentProgress:v13 execution:v50];

    [*(id *)(a1 + 40) enqueueOperation:v14 error:0];
  }
  uint64_t v15 = PLTransactionScopeCloudFeed;
  if ([v3 containsObject:PLTransactionScopeCloudFeed])
  {
    if (PLPlatformCloudFeedSupported())
    {
      uint64_t v16 = PLLibraryServicesOperationNameCrashRecoveryRebuildCloudFeed;
      long long v17 = [*(id *)(a1 + 40) preRunningProgress];
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100011E6C;
      v47[3] = &unk_10002D4B0;
      v48 = v6;
      id v49 = *(id *)(a1 + 40);
      long long v18 = +[PLLibraryServicesOperation operationWithName:v16 requiredState:7 parentProgress:v17 execution:v47];

      [*(id *)(a1 + 40) enqueueOperation:v18 error:0];
      long long v19 = v48;
    }
    else
    {
      [v6 completeTransactionScope:v15];
      long long v19 = PLCloudFeedGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Ignoring requested cloud feed rebuild because of outstanding transactions", buf, 2u);
      }
    }
  }
  if ([v3 containsObject:PLTransactionScopeFileIngestion])
  {
    if (*(unsigned char *)(a1 + 64))
    {
      long long v20 = PLMigrationGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Not Forcing redundant import because of outstanding transactions due to outstanding File System Import", buf, 2u);
      }
    }
    else
    {
      uint64_t v21 = PLLibraryServicesOperationNameCrashRecoveryImportFromFileSystem;
      long long v22 = [*(id *)(a1 + 40) preRunningProgress];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100011FA4;
      v44[3] = &unk_10002D4B0;
      v45 = *(id *)(a1 + 40);
      id v46 = v6;
      long long v23 = +[PLLibraryServicesOperation operationWithName:v21 requiredState:7 parentProgress:v22 execution:v44];

      [*(id *)(a1 + 40) enqueueOperation:v23 error:0];
      long long v20 = v45;
    }
  }
  uint64_t v24 = PLTransactionScopeSearchIndex;
  if ([v3 containsObject:PLTransactionScopeSearchIndex])
  {
    if ([*(id *)(a1 + 40) isSearchIndexingEnabled])
    {
      uint64_t v25 = PLLibraryServicesOperationNameCrashRecoveryResetSearchIndex;
      long long v26 = [*(id *)(a1 + 40) preRunningProgress];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100012198;
      v41[3] = &unk_10002D4B0;
      long long v42 = *(id *)(a1 + 40);
      id v43 = v6;
      long long v27 = +[PLLibraryServicesOperation operationWithName:v25 requiredState:7 parentProgress:v26 execution:v41];

      [*(id *)(a1 + 40) enqueueOperation:v27 error:0];
      long long v28 = v42;
    }
    else
    {
      [v6 completeTransactionScope:v24];
      long long v28 = PLSearchIndexGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Ignoring requested force search reindex because isSearchIndexingEnabled is NO.", buf, 2u);
      }
    }
  }
  if ([v3 containsObject:PLTransactionScopePlaceholderDownload])
  {
    uint64_t v29 = PLLibraryServicesOperationNameCrashRecoveryRestartPendingPlaceholderAssets;
    long long v30 = [*(id *)(a1 + 40) preRunningProgress];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100012314;
    v38[3] = &unk_10002D4B0;
    id v39 = *(id *)(a1 + 48);
    id v40 = v6;
    long long v31 = +[PLLibraryServicesOperation operationWithName:v29 requiredState:7 parentProgress:v30 execution:v38];

    [*(id *)(a1 + 40) enqueueOperation:v31 error:0];
  }
  if ([v3 containsObject:PLTransactionScopeLockedResources])
  {
    uint64_t v32 = PLLibraryServicesOperationNameCrashRecoveryRepairInterruptedLockedResourceTransfer;
    long long v33 = [*(id *)(a1 + 40) preRunningProgress];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000123A4;
    v35[3] = &unk_10002D4B0;
    id v36 = *(id *)(a1 + 48);
    id v37 = v6;
    long long v34 = +[PLLibraryServicesOperation operationWithName:v32 requiredState:7 parentProgress:v33 execution:v35];

    [*(id *)(a1 + 40) enqueueOperation:v34 error:0];
  }
  if ([v3 containsObject:PLTransactionScopeSocialGroupDeduplication]) {
    [*(id *)(a1 + 56) _enqueueSocialGroupDeduplicationOperationWithLSM:*(void *)(a1 + 40) library:*(void *)(a1 + 48) serverTransaction:v6];
  }
  if ([v3 containsObject:PLTransactionScopeSocialGroupAssetPersonEdges]) {
    [*(id *)(a1 + 56) _enqueueDrawAssetPersonEdgesOperationWithLSM:*(void *)(a1 + 40) library:*(void *)(a1 + 48) serverTransaction:v6];
  }
  if ([v3 containsObject:PLTransactionScopeSocialGroupAssetContainment]) {
    [*(id *)(a1 + 56) _enqueueSocialGroupAssetContainmentOperationWithLSM:*(void *)(a1 + 40) library:*(void *)(a1 + 48) serverTransaction:v6];
  }
}

void sub_100011C04(uint64_t a1)
{
  uint64_t v2 = PLMomentsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Forcing moment rebuild because of outstanding transactions", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) momentGenerationDataManager];
  id v4 = [v3 generator];

  unsigned __int8 v5 = [*(id *)(a1 + 32) modelMigrator];
  id v6 = [v5 analyticsEventManager];

  [v6 startRecordingTimedEventToken];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012640;
  block[3] = &unk_10002D2F0;
  id v11 = v6;
  uint64_t v13 = v7;
  id v12 = *(id *)(a1 + 40);
  id v8 = v6;
  dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0, block);
  [v4 rebuildAllMomentsWithOptions:&__NSDictionary0__struct completionHandler:v9];
  dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_100011D6C(id *a1)
{
  uint64_t v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Forcing (album, moment and/or importSession) count and keyAsset recalculation because of outstanding transactions", buf, 2u);
  }

  id v3 = [a1[4] databaseContext];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012580;
  v4[3] = &unk_10002D010;
  id v5 = a1[5];
  id v6 = a1[6];
  [v3 performTransactionSync:v4 withName:"+[PLLibraryRepairSupportRegistration enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:]_block_invoke_2"];
}

void sub_100011E6C(uint64_t a1)
{
  uint64_t v2 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Forcing cloud feed rebuild because of outstanding transactions", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001256C;
  block[3] = &unk_10002D400;
  id v8 = *(id *)(a1 + 32);
  dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0, block);
  id v4 = [*(id *)(a1 + 40) databaseContext];
  id v5 = [v4 newShortLivedLibraryWithName:"+[PLLibraryRepairSupportRegistration enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:]_block_invoke_2"];

  id v6 = [objc_alloc((Class)PLCloudFeedEntriesManager) initWithPhotoLibrary:v5];
  [v6 rebuildAllEntries:v3];
  dispatch_block_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_100011FA4(uint64_t a1)
{
  uint64_t v2 = PLMigrationGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Forcing redundant import because of outstanding transactions", buf, 2u);
  }

  dispatch_block_t v3 = [*(id *)(a1 + 32) databaseContext];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s --> forceImportFileSystemDataIntoDatabaseWithPhotoLibrary", "+[PLLibraryRepairSupportRegistration enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:]_block_invoke");
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = objc_msgSend(v3, "newShortLivedLibraryWithName:", objc_msgSend(v4, "UTF8String"));

  id v6 = [v5 globalValues];
  [v6 setImportFilesystemAssetsState:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012498;
  block[3] = &unk_10002D400;
  id v14 = *(id *)(a1 + 40);
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0, block);
  id v8 = [*(id *)(a1 + 32) modelMigrator];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000124AC;
  v10[3] = &unk_10002D338;
  id v11 = *(id *)(a1 + 32);
  id v12 = v7;
  id v9 = v7;
  [v8 loadFileSystemDataIntoDatabaseIfNeededWithReason:@"outstanding PLTransactionScopeFileIngestion transaction" completionHandler:v10];

  dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_100012198(uint64_t a1)
{
  uint64_t v2 = PLSearchIndexGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Forcing search reindex because of outstanding transactions", buf, 2u);
  }

  dispatch_block_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_100012434;
  id v10 = &unk_10002D4B0;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0, &v7);
  id v4 = objc_msgSend(*(id *)(a1 + 32), "searchIndexManager", v7, v8, v9, v10);

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) searchIndexManager];
    [v5 dropSearchIndexWithCompletion:v3];

    dispatch_block_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    id v6 = PLSearchIndexGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to reset search index due to nil search index manager", buf, 2u);
    }
  }
}

id sub_100012314(uint64_t a1)
{
  uint64_t v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Forcing restart of all pending placeholder assets", v4, 2u);
  }

  +[PHAssetCreationRequestPlaceholderSupportCrashRecovery restartPendingPlaceholderDownloadsForLibrary:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 40) completeTransactionScope:PLTransactionScopePlaceholderDownload];
}

id sub_1000123A4(uint64_t a1)
{
  uint64_t v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Forcing repair of interrupted locked resource job", v4, 2u);
  }

  +[PLBackgroundJobLockedResourceWorker recoverFromInterruptedJobWithLibrary:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 40) completeTransactionScope:PLTransactionScopeLockedResources];
}

id sub_100012434(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) searchIndexManager];
  [v2 unpauseIndexingWithReason:PLSearchIndexPauseReasonCloseSearchIndex];

  dispatch_block_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = PLTransactionScopeSearchIndex;

  return [v3 completeTransactionScope:v4];
}

id sub_100012498(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransactionScope:PLTransactionScopeFileIngestion];
}

uint64_t sub_1000124AC(uint64_t a1, int a2)
{
  if (a2)
  {
    dispatch_block_t v3 = PLMigrationGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_block_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering background migration after rebuild", v7, 2u);
    }

    uint64_t v4 = [*(id *)(a1 + 32) pathManager];
    id v5 = [v4 libraryURL];
    +[PLBackgroundMigrationActivity installBackgroundMigrationActivity:v5];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_10001256C(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransactionScope:PLTransactionScopeCloudFeed];
}

void sub_100012580(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 managedObjectContext];
  +[PLPhotoLibrary refreshCachedCountsOnAllAssetContainersInContext:](PLPhotoLibrary, "refreshCachedCountsOnAllAssetContainersInContext:");
  [v3 updateKeyAssetsInAlbums:0];

  uint64_t v4 = PLTransactionScopeAlbumCounts;
  if ([*(id *)(a1 + 32) containsObject:PLTransactionScopeAlbumCounts]) {
    [*(id *)(a1 + 40) completeTransactionScope:v4];
  }
  uint64_t v5 = PLTransactionScopeImportSessionCounts;
  if ([*(id *)(a1 + 32) containsObject:PLTransactionScopeImportSessionCounts]) {
    [*(id *)(a1 + 40) completeTransactionScope:v5];
  }
}

id sub_100012640(uint64_t a1)
{
  [*(id *)(a1 + 32) stopRecordingTimedEventWithToken:PLCoreAnalyticsLibraryMigrateEventMomentRebuildTimeKey forKey:PLCoreAnalyticsLibraryMigrateEvent onEventWithName:*(double *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = PLTransactionScopeMomentGeneration;

  return [v2 completeTransactionScope:v3];
}

void sub_1000127A0(id a1, PLLibraryRepairSupport *a2)
{
}

void sub_1000127A8(id a1, PLLibraryRepairSupport *a2)
{
}

uint64_t sub_100012E38(uint64_t a1, void *a2)
{
  activity = a2;
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    if ([*(id *)(a1 + 48) _shouldSuppressPeriodicMaintenanceTasks])
    {
      xpc_activity_set_state(activity, 5);
    }
    else
    {
      uint64_t v4 = [[PLLibraryRepairSupport alloc] initWithActivity:activity description:*(void *)(a1 + 32)];
      [(PLLibraryRepairSupport *)v4 runPeriodicMaintenanceActivityOnAllLibrariesWithExecutionBlock:*(void *)(a1 + 40)];
    }
  }
  else if (!state)
  {
    [*(id *)(a1 + 48) _updateXPCActivityProperties:activity];
  }

  return _objc_release_x1();
}

void sub_1000136CC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  [*(id *)(a1 + 40) deletePersistentHistoryWithContext:v2];
}

id sub_10001383C()
{
  v0 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "PLKeepDaemonAliveAssertionServer: XPC keep alive server connection finalized", v2, 2u);
  }

  return [(id)qword_100034E78 _deactivateCameraSession];
}

void sub_1000138B0(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  uint64_t v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)dispatch_block_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "PLKeepDaemonAliveAssertionServer: received event", v7, 2u);
  }

  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    xpc_dictionary_get_remote_connection(v2);
    uint64_t v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (!xpc_dictionary_get_BOOL(v2, "cameraRollVisibilityChange"))
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v2);
      xpc_connection_send_message(v5, reply);
    }
  }
}

void sub_100013AB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    dispatch_block_t v7 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "PLKeepDaemonAliveAssertionServer: listener connection went invalid.", (uint8_t *)v8, 2u);
    }

    goto LABEL_9;
  }
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    id v6 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = xpc_connection_get_pid((xpc_connection_t)v3);
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PLKeepDaemonAliveAssertionServer: New connection from PID: %d", (uint8_t *)v8, 8u);
    }

    [*(id *)(a1 + 32) _registerNewConnection:v3];
LABEL_9:

    return;
  }
  __break(1u);
}

uint64_t sub_100013D7C(uint64_t a1)
{
  qword_100034E78 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

NSSet *__cdecl sub_100014298(id a1, RBSProcessState *a2)
{
  return (NSSet *)[(RBSProcessState *)a2 tags];
}

void sub_100014BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014BC0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v11 = 0;
  id v3 = +[PLSceneClassification countOfOrphanedSceneClassificationsWithLimit:100000 inContext:v2 error:&v11];
  id v4 = v11;

  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [*(id *)(a1 + 32) globalValues];
    [v5 setOrphanedSceneClassificationsCount:0];

    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable to fetch orphaned scene classification count: %@", buf, 0xCu);
    }
LABEL_7:

    goto LABEL_8;
  }
  dispatch_block_t v7 = +[NSNumber numberWithUnsignedInteger:v3];
  uint64_t v8 = [*(id *)(a1 + 32) globalValues];
  [v8 setOrphanedSceneClassificationsCount:v7];

  if ((unint64_t)v3 > 0x1869F)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 40) libraryURL];
      id v10 = +[PLFilePathDescription descriptionWithFileURL:v9];
      *(_DWORD *)buf = 134218242;
      id v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Maintenance task: Excessive orphaned scene classifications found: %tu in library URL: %@", buf, 0x16u);
    }
    goto LABEL_7;
  }
LABEL_8:
}

void sub_100015298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000152DC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000152EC(uint64_t a1)
{
}

void sub_1000152F4(void *a1)
{
  id v2 = objc_alloc_init((Class)NSFetchRequest);
  id v3 = +[PLManagedAsset entityInManagedObjectContext:a1[4]];
  [v2 setEntity:v3];

  id v4 = (void *)a1[4];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = [v4 countForFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(void *)(*(void *)(a1[5] + 8) + 24) = v6;
}

void sub_1000156B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [*(id *)(a1 + 32) libraryURL];
      id v6 = +[PLFilePathDescription descriptionWithFileURL:v5];
      int v11 = 138412546;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      id v14 = v3;
      dispatch_block_t v7 = "Maintenance task: Failed to snapshot journals when requested due to excessive history size for library URL: %@. Error: %@";
      uint64_t v8 = v4;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setSqliteErrorForRebuildReason:*(void *)(a1 + 48) allowsExit:0];
    id v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) libraryURL];
      id v6 = +[PLFilePathDescription descriptionWithFileURL:v5];
      int v11 = 138412290;
      uint64_t v12 = v6;
      dispatch_block_t v7 = "Maintenance task: Added rebuild flag for excessive persistent history size for library URL: %@";
      uint64_t v8 = v4;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 12;
      goto LABEL_6;
    }
  }

  [*(id *)(a1 + 40) stillAlive];
}

void sub_100015C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_100015CB0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100015CC0(uint64_t a1)
{
}

id sub_100015CC8(uint64_t a1, void *a2)
{
  id result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void sub_100015D04(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000163D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 224), 8);
  _Unwind_Resume(a1);
}

id sub_10001642C(uint64_t a1)
{
  return [*(id *)(a1 + 32) getPhotoCount:*(void *)(*(void *)(a1 + 40) + 8) + 24 videoCount:*(void *)(*(void *)(a1 + 48) + 8) + 24];
}

void sub_10001644C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = PLSearchBackendIndexStatusMaintenanceTaskGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error fetching asset count from spotlight: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    dispatch_block_t v7 = *(void **)(a1 + 32);
    id v6 = +[NSNumber numberWithUnsignedInteger:a2];
    [v7 setPayloadValue:v6 forKey:PLCoreAnalyticsSearchIndexStatusSpotlightIndexCountKey onEventWithName:PLCoreAnalyticsSearchIndexStatusEvent];
  }
}

id sub_100016550(uint64_t a1)
{
  [*(id *)(a1 + 32) setSearchIndexSpotlightClientStateMissingCount:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 setSearchIndexSpotlightClientStateMismatchedCount:0];
}

void sub_100017204(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) modelMigrator];
  id v2 = [v1 analyticsEventManager];

  [v2 removeEventWithName:PLCoreAnalyticsLibraryCreateEvent];
  [v2 removeEventWithName:PLCoreAnalyticsLibraryMigrateEvent];
  [v2 removeEventWithName:PLCoreAnalyticsLibraryRebuildEvent];
}

id sub_100017298(uint64_t a1)
{
  return [*(id *)(a1 + 32) initializeChangeHandling];
}

void sub_1000172A0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) modelMigrator];
  [v1 loadFileSystemAssetsNotifyEnter];
}

void sub_1000172E4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) databaseContext];
  id v3 = objc_msgSend(v2, "newShortLivedLibraryWithName:", objc_msgSend(PLLibraryServicesOperationNameCreateSingletonAlbums, "UTF8String"));

  uint64_t v4 = PLGenericAlbumHashOfSingletonAlbumValues();
  id v5 = [v3 managedObjectContext];
  id v6 = [v5 persistentStoreCoordinator];
  dispatch_block_t v7 = [v6 persistentStores];
  int v8 = [v7 firstObject];

  id v9 = [v8 metadata];
  uint32_t v10 = v9;
  if (v9)
  {
    int v11 = [v9 objectForKeyedSubscript:PLAlbumSingletonHashKey];
    id v12 = [v11 unsignedIntegerValue];

    if (v12 != (id)v4) {
      [v3 repairSingletonObjects];
    }
  }
  else
  {
    __int16 v13 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = [*(id *)(a1 + 40) logPrefix];
      int v15 = 138543362;
      uint64_t v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get store metadata in PLLibraryServicesOperationNameCreateSingletonAlbums", (uint8_t *)&v15, 0xCu);
    }
  }
}

id sub_100017490(uint64_t a1)
{
  return +[PLLibraryRepairSupportRegistration enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:*(void *)(a1 + 32)];
}

void sub_1000174A4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) databaseContext];
  id v3 = objc_msgSend(v2, "newShortLivedLibraryWithName:", objc_msgSend(PLLibraryServicesOperationNameEnsureLabelsUpdated, "UTF8String"));

  [v3 managedObjectContext];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000185D0;
  v6[3] = &unk_10002D2A0;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 40);
  id v4 = v3;
  id v5 = v7;
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v6];
}

void sub_1000175A4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) databaseContext];
  id v2 = objc_msgSend(v1, "newShortLivedLibraryWithName:", objc_msgSend(PLLibraryServicesOperationNameCheckForMediaAnalysisVersionBump, "UTF8String"));

  PLCheckForMediaAnalysisVersionBump();
}

void sub_100017618(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) createOptions];
  char v3 = v2;
  if ((~v2 & 0x11) != 0)
  {
    id v6 = [*(id *)(a1 + 32) libraryURL];
    id v4 = [objc_alloc((Class)PLPhotoAnalysisServiceClient) initWithLibraryURL:v6];
    id v5 = v4;
    if ((v3 & 1) == 0) {
      [v4 notifyLibraryAvailableAtURLForPhotoanalysisd:v6];
    }
    if ((v3 & 0x10) == 0) {
      [v5 notifyLibraryAvailableAtURLForMediaanalysisd:v6];
    }
  }
}

void sub_1000176CC(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) libraryURL];
  id v19 = 0;
  char v3 = +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:v2 createIfMissing:0 error:&v19];
  id v4 = v19;
  if (v3)
  {
    id v5 = [v3 containerIdentifier];
    if (!v5)
    {
      int v15 = +[NSAssertionHandler currentHandler];
      [v15 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"PLPlatformLibraryServicesDelegate.m", 254, @"Invalid parameter not satisfying: %@", @"libraryBundleID != nil" object file lineNumber description];
    }
    if ([v5 isEqualToString:PLPhotoLibraryUserDomainContainerIdentifier])
    {
      id v6 = PLLibraryServicesGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [*(id *)(a1 + 40) logPrefix];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v7;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v2;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@: SpaceAttribution: Skipping registration of user domain library %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v21 = &v20;
      uint64_t v22 = 0x2050000000;
      uint64_t v9 = (void *)qword_100034E80;
      uint64_t v23 = qword_100034E80;
      if (!qword_100034E80)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = sub_1000180F8;
        long long v26 = &unk_10002D3A0;
        long long v27 = &v20;
        sub_1000180F8((uint64_t)buf);
        uint64_t v9 = (void *)v21[3];
      }
      id v10 = v9;
      _Block_object_dispose(&v20, 8);
      id v6 = [v10 defaultManager];
      uint64_t v20 = 0;
      uint64_t v21 = &v20;
      uint64_t v22 = 0x2050000000;
      int v11 = (void *)qword_100034E90;
      uint64_t v23 = qword_100034E90;
      if (!qword_100034E90)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = sub_1000181C0;
        long long v26 = &unk_10002D3A0;
        long long v27 = &v20;
        sub_1000181C0((uint64_t)buf);
        int v11 = (void *)v21[3];
      }
      id v12 = v11;
      _Block_object_dispose(&v20, 8);
      __int16 v13 = [v12 pathInfoWithURL:v2];
      uint64_t v24 = v13;
      id v14 = +[NSArray arrayWithObjects:&v24 count:1];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100018288;
      v16[3] = &unk_10002D2C8;
      v16[4] = *(void *)(a1 + 40);
      uint64_t v17 = v5;
      id v18 = v2;
      [v6 registerPaths:v14 forBundleID:v17 completionHandler:v16];
    }
  }
  else
  {
    id v5 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v8 = [*(id *)(a1 + 40) logPrefix];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v2;
      *(_WORD *)&buf[22] = 2112;
      long long v26 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@: Unable to obtain library identifier for %@: %@", buf, 0x20u);
    }
  }
}

void sub_100017AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100017B10(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  unsigned int v2 = +[PLXPCTransaction transaction:](PLXPCTransaction, "transaction:", "-[PLPlatformLibraryServicesDelegate commonBuiltInOperations]_block_invoke");
  char v3 = +[PLConcurrencyLimiter sharedLimiter];
  id v4 = [v3 sharedBackgroundQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017F9C;
  v7[3] = &unk_10002D4B0;
  id v8 = v1;
  id v9 = v2;
  id v5 = v2;
  id v6 = v1;
  dispatch_sync(v4, v7);
}

void sub_100017C08(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldSkipFileSystemImportOperation])
  {
    unsigned int v2 = PLMigrationGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Skipping file system import operation", v9, 2u);
    }

    id v3 = +[NSProgress progressWithTotalUnitCount:100];
    objc_msgSend(v3, "setCompletedUnitCount:", objc_msgSend(v3, "totalUnitCount"));
  }
  else
  {
    dispatch_block_t v4 = dispatch_block_create((dispatch_block_flags_t)0, &stru_10002D310);
    id v5 = [*(id *)(a1 + 40) modelMigrator];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100017E28;
    v10[3] = &unk_10002D338;
    id v11 = *(id *)(a1 + 40);
    id v12 = v4;
    id v3 = v4;
    [v5 loadFileSystemDataIntoDatabaseIfNeededWithReason:@"Library services bringup" completionHandler:v10];

    dispatch_block_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  }

  if (([*(id *)(a1 + 40) isCloudPhotoLibraryEnabled] & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 40) databaseContext];
    id v7 = [v6 newShortLivedLibraryWithName:"photoanalysisd FTE registration"];

    +[PLPhotoAnalysisPhotoLibraryService notifyComputeCacheDidLoadForLibrary:v7 reply:&stru_10002D378];
  }
  id v8 = [*(id *)(a1 + 40) modelMigrator];
  [v8 loadFileSystemAssetsNotifyLeave];
}

void sub_100017DCC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) libraryServicesManager];
  id v1 = [v2 rebuildJournalManager];
  [v1 start];
}

uint64_t sub_100017E28(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = PLMigrationGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering background migration after rebuild", v7, 2u);
    }

    dispatch_block_t v4 = [*(id *)(a1 + 32) pathManager];
    id v5 = [v4 libraryURL];
    +[PLBackgroundMigrationActivity installBackgroundMigrationActivity:v5];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100017EE8(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = PLMigrationGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "photoanalysisd FTE registration failed. Error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_100017F9C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) databaseContext];
  id v3 = [v2 newShortLivedLibraryWithName:"thumbnailManager_rebuildCheck"];

  int v4 = [*(id *)(a1 + 32) pathManager];
  id v5 = PLLibraryIDFromPathManager();

  id v6 = PLDataStoreForClassIDAndLibraryID();
  id v7 = [v6 thumbnailManager];
  id v8 = v7;
  if (v3)
  {
    if ([v7 hasExceededRebuildThumbnailRequestLimit])
    {
      [v8 handleRebuildThumbnailRequestPersistentFailureInPhotoLibrary:v3];
      [*(id *)(a1 + 32) shutdownLibraryWithDescription:@"thumbnail manager has exceeded rebuild request limit"];
    }
    if ([v8 hasRebuildThumbnailsRequest])
    {
      [v8 rebuildAllMissingThumbnailsInLibrary:v3];
    }
    else if ([v8 wantsTableOnlyRebuild])
    {
      [v8 continueRebuildingTableThumbsInLibrary:v3];
    }
  }
  else
  {
    id v9 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cannot check thumbnail rebuild status because there is no library", v10, 2u);
    }
  }
  [*(id *)(a1 + 40) stillAlive];
}

void sub_1000180F8(uint64_t a1)
{
  sub_10001840C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SAPathManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100034E80 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getSAPathManagerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PLPlatformLibraryServicesDelegate.m", 45, @"Unable to find class %s", "SAPathManager");

    __break(1u);
  }
}

void sub_1000181C0(uint64_t a1)
{
  sub_10001840C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SAPathInfo");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100034E90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getSAPathInfoClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PLPlatformLibraryServicesDelegate.m", 46, @"Unable to find class %s", "SAPathInfo");

    __break(1u);
  }
}

void sub_100018288(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = PLLibraryServicesGetLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) logPrefix];
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = [*(id *)(a1 + 48) path];
      int v14 = 138544130;
      int v15 = v6;
      __int16 v16 = 2114;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v3;
      id v9 = "%{public}@: SpaceAttribution: Failed to register (%{public}@, %@) %@";
      id v10 = v5;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 42;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 32) logPrefix];
    uint64_t v13 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 48) path];
    int v14 = 138543874;
    int v15 = v6;
    __int16 v16 = 2114;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    id v19 = v8;
    id v9 = "%{public}@: SpaceAttribution: Registered successfully (%{public}@, %@)";
    id v10 = v5;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 32;
    goto LABEL_6;
  }
}

void sub_10001840C()
{
  v3[0] = 0;
  if (!qword_100034E88)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_10001855C;
    v3[4] = &unk_10002D3D8;
    void v3[5] = v3;
    long long v4 = off_10002D3C0;
    uint64_t v5 = 0;
    qword_100034E88 = _sl_dlopen();
  }
  if (!qword_100034E88)
  {
    id v1 = +[NSAssertionHandler currentHandler];
    id v2 = +[NSString stringWithUTF8String:"void *SpaceAttributionLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"PLPlatformLibraryServicesDelegate.m", 44, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_10001855C()
{
  uint64_t result = _sl_dlopen();
  qword_100034E88 = result;
  return result;
}

void sub_1000185D0(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018674;
  v5[3] = &unk_10002D2A0;
  id v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 performBlockAndWait:v5];
}

void sub_100018674(id *a1)
{
  id v2 = [a1[4] managedObjectContext];
  +[PLGraphLabel ensureLabelsAreUpdatedInContext:v2];

  if ([a1[5] hasChanges])
  {
    id v3 = a1[5];
    id v13 = 0;
    unsigned int v4 = [v3 save:&v13];
    id v5 = v13;
    id v6 = PLLibraryServicesGetLog();
    id v7 = v6;
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [a1[6] logPrefix];
        *(_DWORD *)buf = 138543362;
        int v15 = v8;
        id v9 = "%{public}@: Saved updated graph labels";
        id v10 = v7;
        os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
        uint32_t v12 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [a1[6] logPrefix];
      *(_DWORD *)buf = 138543618;
      int v15 = v8;
      __int16 v16 = 2112;
      id v17 = v5;
      id v9 = "%{public}@: Failed to save updated labels with error: %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
      goto LABEL_7;
    }
  }
}

void sub_1000187EC(id a1)
{
  id v1 = +[PLPrivacy sharedInstance];
  id v2 = [v1 photosAccessAllowedWithScope:7];

  if (v2)
  {
    id v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"assetsd requires TCCPhotosService access" userInfo:0];
    objc_exception_throw(v3);
  }
}

void sub_100018900(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) libraryServicesManager];
  unsigned int v3 = [v2 updateGreenTeaSavedContactsAuthorizationIfNeeded];

  unsigned int v4 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) logPrefix];
    id v6 = @"NO";
    if (v3) {
      id v6 = @"YES";
    }
    id v7 = v6;
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    os_log_type_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: greenTeaContactsAuthorization operation contacts authorization change: %@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_100018AAC(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  unsigned int v3 = [*(id *)(a1 + 32) libraryServicesManager];
  [v2 addObserver:v3 selector:"currentLocaleDidChangeNotification:" name:NSCurrentLocaleDidChangeNotification object:0];

  unsigned int v4 = [*(id *)(a1 + 32) libraryServicesManager];
  unsigned int v5 = [v4 updateSavedLocaleIfNeeded];

  id v6 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) logPrefix];
    int v8 = @"NO";
    if (v5) {
      int v8 = @"YES";
    }
    id v9 = v8;
    int v10 = 138543618;
    os_log_type_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: localeChangeCheck operation found locale change: %@", (uint8_t *)&v10, 0x16u);
  }
}

void sub_100018E30(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) libraryServicesManager];
  [v1 initializeConstraintsDirector];
}

void sub_100018E74(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) libraryServicesManager];
  id v2 = [v1 libraryBundle];
  unsigned int v3 = [v2 bundleController];
  int v4 = PLOpenSyndicationLibrary();
  id v5 = 0;

  id v6 = PLSyndicationGetLog();
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v8 = "Library services operation opened syndication photo library";
      id v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      uint32_t v11 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, buf, v11);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    int v8 = "Library services operation failed to open syndication library, error: %@";
    id v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 12;
    goto LABEL_6;
  }
}

void sub_100018FB0(id a1)
{
}

void sub_10001915C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100019174(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100019184(uint64_t a1)
{
}

uint64_t sub_10001918C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    if (v5)
    {
      uint64_t v6 = [v5 arrayByAddingObjectsFromArray:v3];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      int v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    else
    {
      id v9 = v3;
      int v8 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v9;
    }
  }

  return _objc_release_x1();
}

void sub_100019818(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pathManager];
  id v3 = [v2 libraryURL];
  uint64_t v4 = [v3 path];

  id v5 = +[NSFileManager defaultManager];
  LODWORD(v3) = [v5 fileExistsAtPath:v4];

  if (v3)
  {
    uint64_t v6 = [*(id *)(a1 + 32) pathManager];
    id v14 = 0;
    unsigned __int8 v7 = [v6 ensureFileProviderSyncExclusionAttributeIsSetWithError:&v14];
    id v8 = v14;

    if ((v7 & 1) == 0)
    {
      id v9 = PLMigrationGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v16 = v4;
        __int16 v17 = 2112;
        id v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to set file provider exclusion attribute for path %@: %@", buf, 0x16u);
      }
    }
  }
  if (+[PLFileUtilities filePathIsSubpathOfSyncRoot:v4])
  {
    os_log_type_t v10 = PLMigrationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint32_t v11 = [*(id *)(a1 + 32) pathManager];
      *(_DWORD *)buf = 138412290;
      __int16 v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Attempting to open photo library in a sync root is forbidden: %@", buf, 0xCu);
    }
    __int16 v12 = +[NSMutableDictionary dictionary];
    [v12 setObject:@"Attempting to open photo library in a sync root" forKeyedSubscript:NSDebugDescriptionErrorKey];
    [v12 setObject:v4 forKeyedSubscript:NSFilePathErrorKey];
    id v13 = +[NSError errorWithDomain:PLPhotosErrorDomain code:46017 userInfo:v12];
    [*(id *)(a1 + 32) deactivateWithInvalidationError:v13];
  }
}

void sub_100019A64(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) pathManager];
  [v1 setBackupExclusionAttributesForWellKnownLibrariesOrWithCreateOptions:32 andBackupType:1];
}

void sub_100019AB0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cloudPhotoLibraryManager];
}

void sub_100019AE0(uint64_t a1)
{
  id v1 = [objc_alloc((Class)PLDuplicateMergeCrashRecovery) initWithLibraryServicesManager:*(void *)(a1 + 32)];
  [v1 performCrashRecoveryIfNeeded];
}

void sub_100019B38(uint64_t a1)
{
  id v1 = [objc_alloc((Class)PHAssetCrashRecoverySupport) initWithLibraryServicesManager:*(void *)(a1 + 32)];
  [v1 recoverFromCrashIfNeeded];
}

void sub_100019B90(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) backgroundJobService];
  id v2 = [*(id *)(a1 + 32) libraryBundle];
  [v3 performCrashRecoveryIfNeededOnBundle:v2];
}

void sub_100019BFC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cacheDeleteSupport];
}

void sub_100019C2C(id a1)
{
  id v2 = +[PLLibraryBookmarkManager sharedBookmarkManager];
  id v1 = +[PLPhotoLibraryPathManager systemLibraryURL];
  [v2 removeInvalidSSBsExcept:v1];
}

void sub_100019F2C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) libraryURL];
  uint64_t v6 = 0;
  id v3 = +[PLAssetsdService autoCreateWellKnownPhotoLibraryIfNeededWithURL:v2 wellKnownLibraryIdentifier:&v6];

  if (v3)
  {
    id v4 = objc_alloc((Class)PLLibraryOpenerCreationOptions);
    id v5 = [v4 initWithWellKnownLibraryIdentifier:v6];
    [*(id *)(a1 + 32) setCreateMode:1 options:v5];
  }
}

char *sub_100019FC4(uint64_t a1)
{
  uint64_t result = (char *)[*(id *)(a1 + 32) migrationType];
  if ((unint64_t)(result - 1) <= 2)
  {
    id v2 = (const char *)PLSystemPhotoLibraryAvailableNotificationName;
    return (char *)notify_post(v2);
  }
  return result;
}

void sub_10001A010(uint64_t a1)
{
  if ([*(id *)(a1 + 32) migrationType] == (id)1)
  {
    id v2 = [*(id *)(a1 + 40) libraryURL];
    unsigned int v3 = +[PLPhotoSharingHelper sharedStreamsEnabledForPhotoLibraryURL:v2];

    if (v3)
    {
      id v4 = PLMigrationGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initial sync of shared albums after rebuild", v5, 2u);
      }

      +[PLPhotoSharingHelper pollForAlbumListUpdates];
    }
  }
}

void sub_10001A344(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 40) pathManager];
  PLDeleteGuestAssetsInLibraryWithManagedObjectContext();
}

void sub_10001A4F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10001A514(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (!strcmp(string, (const char *)[@"SLSharedWithYouSettingHasChanged" UTF8String])
    || !strcmp(string, (const char *)[@"SLSharedWithYouAppSettingHasChanged" UTF8String]))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _handleSettingChange];
  }
}

void sub_10001A7E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001A7F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001A808(uint64_t a1)
{
}

void sub_10001A810(uint64_t a1)
{
  id v1 = +[PLManagedAsset entityName];
  long long v34 = +[NSFetchRequest fetchRequestWithEntityName:v1];

  uint64_t v32 = +[NSPredicate predicateWithFormat:@"%K != 0.0", @"latitude"];
  v50[0] = v32;
  uint64_t v2 = +[NSPredicate predicateWithFormat:@"%K != 0.0", @"longitude"];
  v50[1] = v2;
  unsigned int v3 = +[NSPredicate predicateWithFormat:@"noindex:(%K) == %d", @"trashedState", 0];
  v50[2] = v3;
  id v4 = +[NSPredicate predicateWithFormat:@"noindex:(%K) == NO", @"hidden"];
  v50[3] = v4;
  id v5 = +[NSPredicate predicateWithFormat:@"%K != nil", @"additionalAttributes.reverseLocationData"];
  void v50[4] = v5;
  uint64_t v6 = +[NSPredicate predicateWithFormat:@"%K != nil", @"additionalAttributes.sceneprint"];
  v50[5] = v6;
  unsigned __int8 v7 = +[NSPredicate predicateWithFormat:@"%K >= 0", @"additionalAttributes.gpsHorizontalAccuracy"];
  v50[6] = v7;
  id v8 = +[NSPredicate predicateWithFormat:@"%K < %f", @"additionalAttributes.gpsHorizontalAccuracy", kPLLocationUtilsCoarseLocationHorizontalAccuracy];
  v50[7] = v8;
  id v9 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"additionalAttributes.importedBy", &off_10002E1B8];
  v50[8] = v9;
  os_log_type_t v10 = +[NSArray arrayWithObjects:v50 count:9];
  uint32_t v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];
  [v34 setPredicate:v11];

  [v34 setRelationshipKeyPathsForPrefetching:&off_10002E1D0];
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v13 = [*(id *)(a1 + 32) photoLibrary];
  id v14 = [v13 managedObjectContext];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10001AEA4;
  v41[3] = &unk_10002D4D8;
  id v15 = v12;
  id v42 = v15;
  __int16 v44 = &v45;
  id v16 = v14;
  id v43 = v16;
  id v17 = [v16 enumerateObjectsFromFetchRequest:v34 usingDefaultBatchSizeWithBlock:v41];
  if (*((unsigned char *)v46 + 24))
  {
    id v18 = objc_msgSend(*(id *)(a1 + 32), "randomIndexForSampleSize:", objc_msgSend(v15, "count"));
    id v19 = objc_alloc_init((Class)NSMutableArray);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10001AF54;
    v37[3] = &unk_10002D500;
    id v38 = v15;
    id v20 = v19;
    id v39 = v20;
    [v18 enumerateIndexesUsingBlock:v37];
    if ([v20 count])
    {
      id v21 = +[PLManagedAsset entityName];
      uint64_t v22 = +[NSFetchRequest fetchRequestWithEntityName:v21];

      [v22 setResultType:2];
      CFStringRef v49 = @"uuid";
      uint64_t v23 = +[NSArray arrayWithObjects:&v49 count:1];
      [v22 setPropertiesToFetch:v23];

      uint64_t v24 = +[NSPredicate predicateWithFormat:@"self IN %@", v20];
      [v22 setPredicate:v24];

      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10001AFB0;
      v35[3] = &unk_10002D528;
      id v25 = objc_alloc_init((Class)NSMutableArray);
      id v36 = v25;
      id v26 = [v16 enumerateObjectsFromFetchRequest:v22 count:0 batchSize:10 usingBlock:v35];
      uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = v25;
      id v29 = v25;
    }
  }
  else
  {
    long long v30 = PLBackendGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Crowd Sourced Themes Stream Collection: User does not have a home node.", buf, 2u);
    }

    uint64_t v31 = *(void *)(*(void *)(a1 + 40) + 8);
    id v18 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = &__NSArray0__struct;
  }

  _Block_object_dispose(&v45, 8);
}

void sub_10001AE6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_10001AEA4(uint64_t a1, void *a2)
{
  id v8 = a2;
  unsigned __int8 v3 = [v8 isLocatedAtHome];
  if ((v3 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v8 objectID];
    [v4 addObject:v5];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v6 + 24)) {
    char v7 = 1;
  }
  else {
    char v7 = v3;
  }
  *(unsigned char *)(v6 + 24) = v7;
  objc_msgSend(*(id *)(a1 + 40), "refreshObject:mergeChanges:", v8, objc_msgSend(v8, "hasChanges"));
}

void sub_10001AF54(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndex:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

void sub_10001AFB0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 objectForKeyedSubscript:@"uuid"];
  [v2 addObject:v3];
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t DCIM_IS_PAD()
{
  return _DCIM_IS_PAD();
}

uint64_t GSInitialize()
{
  return _GSInitialize();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PLAbortWithReason()
{
  return _PLAbortWithReason();
}

uint64_t PLAssertMinimumCoreDataVersion()
{
  return _PLAssertMinimumCoreDataVersion();
}

uint64_t PLAssetAnalysisGetLog()
{
  return _PLAssetAnalysisGetLog();
}

uint64_t PLBackendGetLog()
{
  return _PLBackendGetLog();
}

uint64_t PLCheckForMediaAnalysisVersionBump()
{
  return _PLCheckForMediaAnalysisVersionBump();
}

uint64_t PLClientServerTransactionsGetLog()
{
  return _PLClientServerTransactionsGetLog();
}

uint64_t PLCloudFeedGetLog()
{
  return _PLCloudFeedGetLog();
}

uint64_t PLCreateShortLivedSyndicationPhotoLibrary()
{
  return _PLCreateShortLivedSyndicationPhotoLibrary();
}

uint64_t PLDataStoreForClassIDAndLibraryID()
{
  return _PLDataStoreForClassIDAndLibraryID();
}

uint64_t PLDateToISO8160StringWithLocalTimeZone()
{
  return _PLDateToISO8160StringWithLocalTimeZone();
}

uint64_t PLDebugEnableCoreDataMultithreadedAsserts()
{
  return _PLDebugEnableCoreDataMultithreadedAsserts();
}

uint64_t PLDeleteGuestAssetsInLibraryWithManagedObjectContext()
{
  return _PLDeleteGuestAssetsInLibraryWithManagedObjectContext();
}

uint64_t PLFeaturesEnabledForCoreAnalyticsReporting()
{
  return _PLFeaturesEnabledForCoreAnalyticsReporting();
}

uint64_t PLFinishReportiCPLState()
{
  return _PLFinishReportiCPLState();
}

uint64_t PLGatekeeperXPCGetLog()
{
  return _PLGatekeeperXPCGetLog();
}

uint64_t PLGenericAlbumHashOfSingletonAlbumValues()
{
  return _PLGenericAlbumHashOfSingletonAlbumValues();
}

uint64_t PLHandleSpotlightAddedOrUpdatedItems()
{
  return _PLHandleSpotlightAddedOrUpdatedItems();
}

uint64_t PLHasInternalDiagnostics()
{
  return _PLHasInternalDiagnostics();
}

uint64_t PLImageManagerGetLog()
{
  return _PLImageManagerGetLog();
}

uint64_t PLIsCaptureSessionEnabled()
{
  return _PLIsCaptureSessionEnabled();
}

uint64_t PLIsChinaSKU()
{
  return _PLIsChinaSKU();
}

uint64_t PLIsErrorEqualToCode()
{
  return _PLIsErrorEqualToCode();
}

uint64_t PLIsErrorSQLiteDiskFull()
{
  return _PLIsErrorSQLiteDiskFull();
}

uint64_t PLIsRunningInStoreDemoMode()
{
  return _PLIsRunningInStoreDemoMode();
}

uint64_t PLLibraryIDFromPathManager()
{
  return _PLLibraryIDFromPathManager();
}

uint64_t PLLibraryServicesGetLog()
{
  return _PLLibraryServicesGetLog();
}

uint64_t PLMigrationGetLog()
{
  return _PLMigrationGetLog();
}

uint64_t PLMomentsGetLog()
{
  return _PLMomentsGetLog();
}

uint64_t PLOpenSyndicationLibrary()
{
  return _PLOpenSyndicationLibrary();
}

uint64_t PLPlatformCloudFeedSupported()
{
  return _PLPlatformCloudFeedSupported();
}

uint64_t PLPlatformCloudPhotosPrimarySyncSupported()
{
  return _PLPlatformCloudPhotosPrimarySyncSupported();
}

uint64_t PLPlatformMomentsSupported()
{
  return _PLPlatformMomentsSupported();
}

uint64_t PLRegisterBackgroundMigrationLibraryURL()
{
  return _PLRegisterBackgroundMigrationLibraryURL();
}

uint64_t PLRegisteredBackgroundMigrationPaths()
{
  return _PLRegisteredBackgroundMigrationPaths();
}

uint64_t PLReportiCPLState()
{
  return _PLReportiCPLState();
}

uint64_t PLRequestGetLog()
{
  return _PLRequestGetLog();
}

uint64_t PLResourceIdentityShortDescription()
{
  return _PLResourceIdentityShortDescription();
}

uint64_t PLSanitizedErrorForXPC()
{
  return _PLSanitizedErrorForXPC();
}

uint64_t PLSearchBackendDonationsGetLog()
{
  return _PLSearchBackendDonationsGetLog();
}

uint64_t PLSearchBackendIndexStatusMaintenanceTaskGetLog()
{
  return _PLSearchBackendIndexStatusMaintenanceTaskGetLog();
}

uint64_t PLSearchFileProtectionTypes()
{
  return _PLSearchFileProtectionTypes();
}

uint64_t PLSearchIndexGetLog()
{
  return _PLSearchIndexGetLog();
}

uint64_t PLSendCoreAnalyticEvent()
{
  return _PLSendCoreAnalyticEvent();
}

uint64_t PLShortObjectIDFromURL()
{
  return _PLShortObjectIDFromURL();
}

uint64_t PLShouldBoostLogLevelForResourceRecipeID()
{
  return _PLShouldBoostLogLevelForResourceRecipeID();
}

uint64_t PLSimulateCrash()
{
  return _PLSimulateCrash();
}

uint64_t PLStoreDemoModeGetLog()
{
  return _PLStoreDemoModeGetLog();
}

uint64_t PLStringFromLibraryServicesState()
{
  return _PLStringFromLibraryServicesState();
}

uint64_t PLSyndicationAllEquivalentFileProviderLocalAndCloudBundleIDs()
{
  return _PLSyndicationAllEquivalentFileProviderLocalAndCloudBundleIDs();
}

uint64_t PLSyndicationGetLog()
{
  return _PLSyndicationGetLog();
}

uint64_t PLSyndicationPreferencesEnabled()
{
  return _PLSyndicationPreferencesEnabled();
}

uint64_t PLSyndicationRuntimeEnabled()
{
  return _PLSyndicationRuntimeEnabled();
}

uint64_t PLThumbnailsGetLog()
{
  return _PLThumbnailsGetLog();
}

uint64_t PLTopLevelErrorAndAllUnderlyingErrors()
{
  return _PLTopLevelErrorAndAllUnderlyingErrors();
}

uint64_t SpotlightReceiverRegister()
{
  return _SpotlightReceiverRegister();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return _dispatch_block_wait(block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t pl_dispatch_once()
{
  return _pl_dispatch_once();
}

uint64_t pl_dispatch_queue_create_with_fallback_qos()
{
  return _pl_dispatch_queue_create_with_fallback_qos();
}

uint64_t pl_notify_disable_for_shutdown()
{
  return _pl_notify_disable_for_shutdown();
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

uint64_t xpc_activity_copy_identifier()
{
  return _xpc_activity_copy_identifier();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__abortWithMigrationFailureReasonEACCES(void *a1, const char *a2, ...)
{
  return [a1 _abortWithMigrationFailureReasonEACCES];
}

id objc_msgSend__abortWithMigrationFailureReasonENOSPC(void *a1, const char *a2, ...)
{
  return [a1 _abortWithMigrationFailureReasonENOSPC];
}

id objc_msgSend__buildIncompleteMaintenanceTaskPathsKey(void *a1, const char *a2, ...)
{
  return [a1 _buildIncompleteMaintenanceTaskPathsKey];
}

id objc_msgSend__criteriaForBackgroundMigration(void *a1, const char *a2, ...)
{
  return [a1 _criteriaForBackgroundMigration];
}

id objc_msgSend__deactivateCameraSession(void *a1, const char *a2, ...)
{
  return [a1 _deactivateCameraSession];
}

id objc_msgSend__handleSettingChange(void *a1, const char *a2, ...)
{
  return [a1 _handleSettingChange];
}

id objc_msgSend__interruptedProcessingURLs(void *a1, const char *a2, ...)
{
  return [a1 _interruptedProcessingURLs];
}

id objc_msgSend__recordSpotlightUpdate(void *a1, const char *a2, ...)
{
  return [a1 _recordSpotlightUpdate];
}

id objc_msgSend__registeredCriticalMaintenaceTaskClasses(void *a1, const char *a2, ...)
{
  return [a1 _registeredCriticalMaintenaceTaskClasses];
}

id objc_msgSend__registeredMaintenanceTaskClasses(void *a1, const char *a2, ...)
{
  return [a1 _registeredMaintenanceTaskClasses];
}

id objc_msgSend__runBackgroundMigrationActions(void *a1, const char *a2, ...)
{
  return [a1 _runBackgroundMigrationActions];
}

id objc_msgSend__runTask(void *a1, const char *a2, ...)
{
  return [a1 _runTask];
}

id objc_msgSend__shouldSuppressPeriodicMaintenanceTasks(void *a1, const char *a2, ...)
{
  return [a1 _shouldSuppressPeriodicMaintenanceTasks];
}

id objc_msgSend__signalBackgroundProcessingNeededForSPL(void *a1, const char *a2, ...)
{
  return [a1 _signalBackgroundProcessingNeededForSPL];
}

id objc_msgSend__signalBackgroundProcessingNeededForSyndication(void *a1, const char *a2, ...)
{
  return [a1 _signalBackgroundProcessingNeededForSyndication];
}

id objc_msgSend__startServer(void *a1, const char *a2, ...)
{
  return [a1 _startServer];
}

id objc_msgSend_activateCameraSessionTaskConstraints(void *a1, const char *a2, ...)
{
  return [a1 activateCameraSessionTaskConstraints];
}

id objc_msgSend_allKnownLibraryURLs(void *a1, const char *a2, ...)
{
  return [a1 allKnownLibraryURLs];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_analyticsEventManager(void *a1, const char *a2, ...)
{
  return [a1 analyticsEventManager];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetObjectIDURL(void *a1, const char *a2, ...)
{
  return [a1 assetObjectIDURL];
}

id objc_msgSend_backgroundJobService(void *a1, const char *a2, ...)
{
  return [a1 backgroundJobService];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buildQuickActionItems(void *a1, const char *a2, ...)
{
  return [a1 buildQuickActionItems];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bundleController(void *a1, const char *a2, ...)
{
  return [a1 bundleController];
}

id objc_msgSend_cacheDeleteSupport(void *a1, const char *a2, ...)
{
  return [a1 cacheDeleteSupport];
}

id objc_msgSend_cachedPrimaryAppleAccount(void *a1, const char *a2, ...)
{
  return [a1 cachedPrimaryAppleAccount];
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return [a1 capabilities];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_cloudPhotoLibraryManager(void *a1, const char *a2, ...)
{
  return [a1 cloudPhotoLibraryManager];
}

id objc_msgSend_coalesceRebuildJournals(void *a1, const char *a2, ...)
{
  return [a1 coalesceRebuildJournals];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commonBuiltInOperations(void *a1, const char *a2, ...)
{
  return [a1 commonBuiltInOperations];
}

id objc_msgSend_completeTransaction(void *a1, const char *a2, ...)
{
  return [a1 completeTransaction];
}

id objc_msgSend_computeCacheManager(void *a1, const char *a2, ...)
{
  return [a1 computeCacheManager];
}

id objc_msgSend_containerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 containerIdentifier];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_cplInitialSyncMarkerFileExists(void *a1, const char *a2, ...)
{
  return [a1 cplInitialSyncMarkerFileExists];
}

id objc_msgSend_cplReadiness(void *a1, const char *a2, ...)
{
  return [a1 cplReadiness];
}

id objc_msgSend_cplSettings(void *a1, const char *a2, ...)
{
  return [a1 cplSettings];
}

id objc_msgSend_cplStatus(void *a1, const char *a2, ...)
{
  return [a1 cplStatus];
}

id objc_msgSend_crashRecoverySupport(void *a1, const char *a2, ...)
{
  return [a1 crashRecoverySupport];
}

id objc_msgSend_createOptions(void *a1, const char *a2, ...)
{
  return [a1 createOptions];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentImageEmbeddingVersion(void *a1, const char *a2, ...)
{
  return [a1 currentImageEmbeddingVersion];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_databaseContext(void *a1, const char *a2, ...)
{
  return [a1 databaseContext];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_daysOfHistoryToKeep(void *a1, const char *a2, ...)
{
  return [a1 daysOfHistoryToKeep];
}

id objc_msgSend_deactivateCameraSessionTaskConstraints(void *a1, const char *a2, ...)
{
  return [a1 deactivateCameraSessionTaskConstraints];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deleteExpiredTrashedAssetsAndAlbums(void *a1, const char *a2, ...)
{
  return [a1 deleteExpiredTrashedAssetsAndAlbums];
}

id objc_msgSend_deleteExpiredTrashedResources(void *a1, const char *a2, ...)
{
  return [a1 deleteExpiredTrashedResources];
}

id objc_msgSend_deleteTTRDeferredIntermediates(void *a1, const char *a2, ...)
{
  return [a1 deleteTTRDeferredIntermediates];
}

id objc_msgSend_deleteUnusedCameraMetadataPaths(void *a1, const char *a2, ...)
{
  return [a1 deleteUnusedCameraMetadataPaths];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceRestoreMigrationSupport(void *a1, const char *a2, ...)
{
  return [a1 deviceRestoreMigrationSupport];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didImportFileSystemAssets(void *a1, const char *a2, ...)
{
  return [a1 didImportFileSystemAssets];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_enableMultiLibraryMode(void *a1, const char *a2, ...)
{
  return [a1 enableMultiLibraryMode];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_entityName(void *a1, const char *a2, ...)
{
  return [a1 entityName];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_evictIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 evictIfNeeded];
}

id objc_msgSend_extensionPointRecord(void *a1, const char *a2, ...)
{
  return [a1 extensionPointRecord];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_generateUuidSelection(void *a1, const char *a2, ...)
{
  return [a1 generateUuidSelection];
}

id objc_msgSend_generator(void *a1, const char *a2, ...)
{
  return [a1 generator];
}

id objc_msgSend_globalValues(void *a1, const char *a2, ...)
{
  return [a1 globalValues];
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return [a1 hasChanges];
}

id objc_msgSend_hasCompletedDataMigratorPrerequisitesForTrackingRestoreFromCloud(void *a1, const char *a2, ...)
{
  return [a1 hasCompletedDataMigratorPrerequisitesForTrackingRestoreFromCloud];
}

id objc_msgSend_hasExceededRebuildThumbnailRequestLimit(void *a1, const char *a2, ...)
{
  return [a1 hasExceededRebuildThumbnailRequestLimit];
}

id objc_msgSend_hasRebuildThumbnailsRequest(void *a1, const char *a2, ...)
{
  return [a1 hasRebuildThumbnailsRequest];
}

id objc_msgSend_historyPercentThreshold(void *a1, const char *a2, ...)
{
  return [a1 historyPercentThreshold];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return [a1 identity];
}

id objc_msgSend_imageWriter(void *a1, const char *a2, ...)
{
  return [a1 imageWriter];
}

id objc_msgSend_indicatorFileCoordinator(void *a1, const char *a2, ...)
{
  return [a1 indicatorFileCoordinator];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initialSyncDate(void *a1, const char *a2, ...)
{
  return [a1 initialSyncDate];
}

id objc_msgSend_initializeConstraintsDirector(void *a1, const char *a2, ...)
{
  return [a1 initializeConstraintsDirector];
}

id objc_msgSend_installPeriodicMaintenanceActivity(void *a1, const char *a2, ...)
{
  return [a1 installPeriodicMaintenanceActivity];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateCachedConfig(void *a1, const char *a2, ...)
{
  return [a1 invalidateCachedConfig];
}

id objc_msgSend_invalidateThumbnailManager(void *a1, const char *a2, ...)
{
  return [a1 invalidateThumbnailManager];
}

id objc_msgSend_isBackupEnabled(void *a1, const char *a2, ...)
{
  return [a1 isBackupEnabled];
}

id objc_msgSend_isCentralizedCacheDeleteCapable(void *a1, const char *a2, ...)
{
  return [a1 isCentralizedCacheDeleteCapable];
}

id objc_msgSend_isCloudPhotoLibraryEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCloudPhotoLibraryEnabled];
}

id objc_msgSend_isDCIM(void *a1, const char *a2, ...)
{
  return [a1 isDCIM];
}

id objc_msgSend_isDeviceRestoreSupported(void *a1, const char *a2, ...)
{
  return [a1 isDeviceRestoreSupported];
}

id objc_msgSend_isEnumeratingDirectoryPostOrder(void *a1, const char *a2, ...)
{
  return [a1 isEnumeratingDirectoryPostOrder];
}

id objc_msgSend_isFailure(void *a1, const char *a2, ...)
{
  return [a1 isFailure];
}

id objc_msgSend_isLocatedAtHome(void *a1, const char *a2, ...)
{
  return [a1 isLocatedAtHome];
}

id objc_msgSend_isModelMigrationRestorePostProcessingComplete(void *a1, const char *a2, ...)
{
  return [a1 isModelMigrationRestorePostProcessingComplete];
}

id objc_msgSend_isRebuildingThumbnails(void *a1, const char *a2, ...)
{
  return [a1 isRebuildingThumbnails];
}

id objc_msgSend_isRestoreFromBackup(void *a1, const char *a2, ...)
{
  return [a1 isRestoreFromBackup];
}

id objc_msgSend_isRestoreFromBackupSourceDeviceToDevice(void *a1, const char *a2, ...)
{
  return [a1 isRestoreFromBackupSourceDeviceToDevice];
}

id objc_msgSend_isRestoreFromBackupSourceMegaBackup(void *a1, const char *a2, ...)
{
  return [a1 isRestoreFromBackupSourceMegaBackup];
}

id objc_msgSend_isRestoreFromBackupSourceiTunes(void *a1, const char *a2, ...)
{
  return [a1 isRestoreFromBackupSourceiTunes];
}

id objc_msgSend_isSearchIndexingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSearchIndexingEnabled];
}

id objc_msgSend_isShuttingDown(void *a1, const char *a2, ...)
{
  return [a1 isShuttingDown];
}

id objc_msgSend_isSyndicationPhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 isSyndicationPhotoLibrary];
}

id objc_msgSend_isSystemPhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 isSystemPhotoLibrary];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_libraryBundle(void *a1, const char *a2, ...)
{
  return [a1 libraryBundle];
}

id objc_msgSend_libraryID(void *a1, const char *a2, ...)
{
  return [a1 libraryID];
}

id objc_msgSend_libraryReadyForAnalysisDate(void *a1, const char *a2, ...)
{
  return [a1 libraryReadyForAnalysisDate];
}

id objc_msgSend_libraryServicesManager(void *a1, const char *a2, ...)
{
  return [a1 libraryServicesManager];
}

id objc_msgSend_libraryURL(void *a1, const char *a2, ...)
{
  return [a1 libraryURL];
}

id objc_msgSend_loadFileSystemAssetsNotifyEnter(void *a1, const char *a2, ...)
{
  return [a1 loadFileSystemAssetsNotifyEnter];
}

id objc_msgSend_loadFileSystemAssetsNotifyLeave(void *a1, const char *a2, ...)
{
  return [a1 loadFileSystemAssetsNotifyLeave];
}

id objc_msgSend_locationOfInterestUpdateDate(void *a1, const char *a2, ...)
{
  return [a1 locationOfInterestUpdateDate];
}

id objc_msgSend_logPrefix(void *a1, const char *a2, ...)
{
  return [a1 logPrefix];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 managedObjectContext];
}

id objc_msgSend_mediaAnalysisEmbeddingVersion(void *a1, const char *a2, ...)
{
  return [a1 mediaAnalysisEmbeddingVersion];
}

id objc_msgSend_mediaAnalysisEmbeddingVersionBumpDate(void *a1, const char *a2, ...)
{
  return [a1 mediaAnalysisEmbeddingVersionBumpDate];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_migrationType(void *a1, const char *a2, ...)
{
  return [a1 migrationType];
}

id objc_msgSend_modelMigrator(void *a1, const char *a2, ...)
{
  return [a1 modelMigrator];
}

id objc_msgSend_momentGenerationDataManager(void *a1, const char *a2, ...)
{
  return [a1 momentGenerationDataManager];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_newDemoModeUtilitiesWithDefaultSystemPaths(void *a1, const char *a2, ...)
{
  return [a1 newDemoModeUtilitiesWithDefaultSystemPaths];
}

id objc_msgSend_none(void *a1, const char *a2, ...)
{
  return [a1 none];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_operationCompletionActivities(void *a1, const char *a2, ...)
{
  return [a1 operationCompletionActivities];
}

id objc_msgSend_operationForGreenTeaContactsAuthorizationCheck(void *a1, const char *a2, ...)
{
  return [a1 operationForGreenTeaContactsAuthorizationCheck];
}

id objc_msgSend_operationForLocaleChangeCheck(void *a1, const char *a2, ...)
{
  return [a1 operationForLocaleChangeCheck];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathManager(void *a1, const char *a2, ...)
{
  return [a1 pathManager];
}

id objc_msgSend_performCrashRecoveryIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 performCrashRecoveryIfNeeded];
}

id objc_msgSend_persistentContainer(void *a1, const char *a2, ...)
{
  return [a1 persistentContainer];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreCoordinator];
}

id objc_msgSend_persistentStores(void *a1, const char *a2, ...)
{
  return [a1 persistentStores];
}

id objc_msgSend_photoLibrary(void *a1, const char *a2, ...)
{
  return [a1 photoLibrary];
}

id objc_msgSend_photosBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 photosBundleIdentifier];
}

id objc_msgSend_photosDatabasePath(void *a1, const char *a2, ...)
{
  return [a1 photosDatabasePath];
}

id objc_msgSend_platformLibraryServicesDelegateClass(void *a1, const char *a2, ...)
{
  return [a1 platformLibraryServicesDelegateClass];
}

id objc_msgSend_pollForAlbumListUpdates(void *a1, const char *a2, ...)
{
  return [a1 pollForAlbumListUpdates];
}

id objc_msgSend_pollForAlbumListUpdatesIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 pollForAlbumListUpdatesIfNecessary];
}

id objc_msgSend_postProcessingToken(void *a1, const char *a2, ...)
{
  return [a1 postProcessingToken];
}

id objc_msgSend_postRunningProgress(void *a1, const char *a2, ...)
{
  return [a1 postRunningProgress];
}

id objc_msgSend_preRunningProgress(void *a1, const char *a2, ...)
{
  return [a1 preRunningProgress];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_quickActionManager(void *a1, const char *a2, ...)
{
  return [a1 quickActionManager];
}

id objc_msgSend_reStampConfigAsNeedingTableThumbMigration(void *a1, const char *a2, ...)
{
  return [a1 reStampConfigAsNeedingTableThumbMigration];
}

id objc_msgSend_rebuildJournalManager(void *a1, const char *a2, ...)
{
  return [a1 rebuildJournalManager];
}

id objc_msgSend_recipeID(void *a1, const char *a2, ...)
{
  return [a1 recipeID];
}

id objc_msgSend_recoverFromCrashIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 recoverFromCrashIfNeeded];
}

id objc_msgSend_registerIncompleteBackgroundMigrationActivity(void *a1, const char *a2, ...)
{
  return [a1 registerIncompleteBackgroundMigrationActivity];
}

id objc_msgSend_removeUnusedGroupsFromPSI(void *a1, const char *a2, ...)
{
  return [a1 removeUnusedGroupsFromPSI];
}

id objc_msgSend_repairSingletonObjects(void *a1, const char *a2, ...)
{
  return [a1 repairSingletonObjects];
}

id objc_msgSend_replaceTargetPhotoLibraryWithStagedDemoLibraryIfExists(void *a1, const char *a2, ...)
{
  return [a1 replaceTargetPhotoLibraryWithStagedDemoLibraryIfExists];
}

id objc_msgSend_reportLibrarySizeToDAS(void *a1, const char *a2, ...)
{
  return [a1 reportLibrarySizeToDAS];
}

id objc_msgSend_requiredStateForFileSystemImportOperation(void *a1, const char *a2, ...)
{
  return [a1 requiredStateForFileSystemImportOperation];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resourceIdentity(void *a1, const char *a2, ...)
{
  return [a1 resourceIdentity];
}

id objc_msgSend_restoreTypeDescription(void *a1, const char *a2, ...)
{
  return [a1 restoreTypeDescription];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_searchFeatureReadyDate(void *a1, const char *a2, ...)
{
  return [a1 searchFeatureReadyDate];
}

id objc_msgSend_searchFeatureReadyFraction(void *a1, const char *a2, ...)
{
  return [a1 searchFeatureReadyFraction];
}

id objc_msgSend_searchIndexManager(void *a1, const char *a2, ...)
{
  return [a1 searchIndexManager];
}

id objc_msgSend_searchIndexSpotlightClientStateMismatchedCount(void *a1, const char *a2, ...)
{
  return [a1 searchIndexSpotlightClientStateMismatchedCount];
}

id objc_msgSend_searchIndexSpotlightClientStateMissingCount(void *a1, const char *a2, ...)
{
  return [a1 searchIndexSpotlightClientStateMissingCount];
}

id objc_msgSend_searchIndexingEngine(void *a1, const char *a2, ...)
{
  return [a1 searchIndexingEngine];
}

id objc_msgSend_setWipeCPLOnOpen(void *a1, const char *a2, ...)
{
  return [a1 setWipeCPLOnOpen];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_sharedBackgroundQueue(void *a1, const char *a2, ...)
{
  return [a1 sharedBackgroundQueue];
}

id objc_msgSend_sharedBookmarkManager(void *a1, const char *a2, ...)
{
  return [a1 sharedBookmarkManager];
}

id objc_msgSend_sharedBundleController(void *a1, const char *a2, ...)
{
  return [a1 sharedBundleController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedLimiter(void *a1, const char *a2, ...)
{
  return [a1 sharedLimiter];
}

id objc_msgSend_shouldDisablePhotosLegacySearchDonation(void *a1, const char *a2, ...)
{
  return [a1 shouldDisablePhotosLegacySearchDonation];
}

id objc_msgSend_shouldSkipFileSystemImportOperation(void *a1, const char *a2, ...)
{
  return [a1 shouldSkipFileSystemImportOperation];
}

id objc_msgSend_shutdownReason(void *a1, const char *a2, ...)
{
  return [a1 shutdownReason];
}

id objc_msgSend_snapshotComputeCacheJournals(void *a1, const char *a2, ...)
{
  return [a1 snapshotComputeCacheJournals];
}

id objc_msgSend_spotlightPrivateIndexEnabled(void *a1, const char *a2, ...)
{
  return [a1 spotlightPrivateIndexEnabled];
}

id objc_msgSend_spotlightSearchIndexPath(void *a1, const char *a2, ...)
{
  return [a1 spotlightSearchIndexPath];
}

id objc_msgSend_sqliteErrorIndicatorFileExists(void *a1, const char *a2, ...)
{
  return [a1 sqliteErrorIndicatorFileExists];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startAutomaticPrefetchOrPrune(void *a1, const char *a2, ...)
{
  return [a1 startAutomaticPrefetchOrPrune];
}

id objc_msgSend_startRecordingTimedEventToken(void *a1, const char *a2, ...)
{
  return [a1 startRecordingTimedEventToken];
}

id objc_msgSend_stillAlive(void *a1, const char *a2, ...)
{
  return [a1 stillAlive];
}

id objc_msgSend_stopObservingSystemLibraryChanges(void *a1, const char *a2, ...)
{
  return [a1 stopObservingSystemLibraryChanges];
}

id objc_msgSend_syndicationDeleteManager(void *a1, const char *a2, ...)
{
  return [a1 syndicationDeleteManager];
}

id objc_msgSend_systemLibraryBuiltInOperations(void *a1, const char *a2, ...)
{
  return [a1 systemLibraryBuiltInOperations];
}

id objc_msgSend_systemLibraryPathManager(void *a1, const char *a2, ...)
{
  return [a1 systemLibraryPathManager];
}

id objc_msgSend_systemLibraryURL(void *a1, const char *a2, ...)
{
  return [a1 systemLibraryURL];
}

id objc_msgSend_tags(void *a1, const char *a2, ...)
{
  return [a1 tags];
}

id objc_msgSend_taskIdentifier(void *a1, const char *a2, ...)
{
  return [a1 taskIdentifier];
}

id objc_msgSend_thumbnailManager(void *a1, const char *a2, ...)
{
  return [a1 thumbnailManager];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnitCount];
}

id objc_msgSend_transactionNumber(void *a1, const char *a2, ...)
{
  return [a1 transactionNumber];
}

id objc_msgSend_transactionToken(void *a1, const char *a2, ...)
{
  return [a1 transactionToken];
}

id objc_msgSend_unknown(void *a1, const char *a2, ...)
{
  return [a1 unknown];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateGreenTeaSavedContactsAuthorizationIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 updateGreenTeaSavedContactsAuthorizationIfNeeded];
}

id objc_msgSend_updateSavedLocaleIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 updateSavedLocaleIfNeeded];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_variationCache(void *a1, const char *a2, ...)
{
  return [a1 variationCache];
}

id objc_msgSend_waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud(void *a1, const char *a2, ...)
{
  return [a1 waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud];
}

id objc_msgSend_wantsTableOnlyRebuild(void *a1, const char *a2, ...)
{
  return [a1 wantsTableOnlyRebuild];
}

id objc_msgSend_warmUpDemoLibraryInstalledFromStagedTemplate(void *a1, const char *a2, ...)
{
  return [a1 warmUpDemoLibraryInstalledFromStagedTemplate];
}

id objc_msgSend_wellKnownPhotoLibraryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 wellKnownPhotoLibraryIdentifier];
}

id objc_msgSend_writeModelMigrationRestorePostProcessingCompleteToken(void *a1, const char *a2, ...)
{
  return [a1 writeModelMigrationRestorePostProcessingCompleteToken];
}