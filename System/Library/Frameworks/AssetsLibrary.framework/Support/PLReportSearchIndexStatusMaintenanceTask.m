@interface PLReportSearchIndexStatusMaintenanceTask
+ (void)_getCountOfAssetsInSpotlightForPhotoLibrary:(id)a3 completion:(id)a4;
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLReportSearchIndexStatusMaintenanceTask

+ (void)_getCountOfAssetsInSpotlightForPhotoLibrary:(id)a3 completion:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, uint64_t, uint64_t))a4;
  if (!v8)
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLReportSearchIndexStatusMaintenanceTask.m", 131, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = objc_alloc_init((Class)CSSearchQueryContext);
  [v9 setBundleIDs:&off_10002E1A0];
  [v9 setDisableBlockingOnIndex:1];
  v10 = +[NSString stringWithFormat:@"%@ == %@", MDItemPhotosResultType, PLSpotlightSearchResultContentTypeAsset];
  v11 = [v7 libraryServicesManager];
  unsigned int v12 = +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:](PLSpotlightDonationUtilities, "shouldUseSpotlightPrivateIndexForLibraryIdentifier:", [v11 wellKnownPhotoLibraryIdentifier]);

  if (v12)
  {
    v13 = [v7 pathManager];
    v14 = [v13 spotlightSearchIndexPath];

    id v15 = [objc_alloc((Class)CSManagedSearchQuery) initWithPath:v14 queryString:v10 context:v9];
  }
  else
  {
    id v15 = [objc_alloc((Class)CSSearchQuery) initWithQueryString:v10 queryContext:v9];
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_100015CB0;
  v32 = sub_100015CC0;
  id v33 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100015CC8;
  v23[3] = &unk_10002D238;
  v23[4] = &v24;
  [v15 setFoundItemsHandler:v23];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100015D04;
  v20[3] = &unk_10002D210;
  v22 = &v28;
  v17 = v16;
  v21 = v17;
  [v15 setCompletionHandler:v20];
  [v15 start];
  dispatch_time_t v18 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v17, v18);
  v8[2](v8, v25[3], v29[5]);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
}

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v47 = a3;
  v4 = [(PLMaintenanceTask *)self photoLibrary];
  v5 = [v4 libraryServicesManager];
  id v6 = [v5 wellKnownPhotoLibraryIdentifier];

  if (v6 != (id)3)
  {
    id v46 = v6;
    id v7 = PLSearchBackendIndexStatusMaintenanceTaskGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Checking Search Index Status.", buf, 2u);
    }

    id v8 = objc_alloc_init((Class)PLCoreAnalyticsEventManager);
    id v9 = +[NSNumber numberWithInteger:v6];
    uint64_t v10 = PLCoreAnalyticsSearchIndexStatusEvent;
    [v8 setPayloadValue:v9 forKey:PLCoreAnalyticsSearchIndexStatusPhotoLibraryWellKnownIdentifierKey onEventWithName:PLCoreAnalyticsSearchIndexStatusEvent];

    v11 = [v4 globalValues];
    unsigned int v12 = [v11 searchIndexSpotlightClientStateMissingCount];
    id v44 = [v12 unsignedIntegerValue];

    v13 = +[NSNumber numberWithUnsignedInteger:v44];
    [v8 setPayloadValue:v13 forKey:PLCoreAnalyticsSearchIndexStatusClientStateMissingCountKey onEventWithName:v10];

    v14 = [v11 searchIndexSpotlightClientStateMismatchedCount];
    id v43 = [v14 unsignedIntegerValue];

    id v15 = +[NSNumber numberWithUnsignedInteger:v43];
    [v8 setPayloadValue:v15 forKey:PLCoreAnalyticsSearchIndexStatusClientStateMismatchedCountKey onEventWithName:v10];

    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    uint64_t v64 = 0;
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2020000000;
    uint64_t v60 = 0;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10001642C;
    v53[3] = &unk_10002D1C0;
    id v16 = v4;
    id v54 = v16;
    v55 = &v61;
    v56 = &v57;
    [v16 performBlockAndWait:v53];
    uint64_t v42 = v58[3] + v62[3];
    v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
    [v8 setPayloadValue:v17 forKey:PLCoreAnalyticsSearchIndexStatusTotalAssetCountKey onEventWithName:v10];

    dispatch_time_t v18 = +[NSNumber numberWithUnsignedChar:PLFeaturesEnabledForCoreAnalyticsReporting()];
    [v8 setPayloadValue:v18 forKey:PLCoreAnalyticsSearchIndexStatusFeaturesEnabledKey onEventWithName:v10];

    char v52 = 0;
    [v11 searchIndexUptimeIsRebuildInProgress:&v52];
    if (v52) {
      double v20 = 0.0;
    }
    else {
      double v20 = v19;
    }
    v21 = +[NSNumber numberWithDouble:v20];
    [v8 setPayloadValue:v21 forKey:PLCoreAnalyticsSearchIndexStatusUptimeSinceLastRebuildKey onEventWithName:v10];

    v22 = objc_opt_class();
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10001644C;
    v50[3] = &unk_10002D1E8;
    id v23 = v8;
    id v51 = v23;
    [v22 _getCountOfAssetsInSpotlightForPhotoLibrary:v16 completion:v50];
    v45 = [v11 mediaAnalysisEmbeddingVersion];
    LODWORD(v22) = [v45 intValue];
    uint64_t v24 = +[PLMediaAnalysisServiceRequestAdapter currentImageEmbeddingVersion];
    LODWORD(v22) = v22 == [v24 intValue];

    if (v22)
    {
      v25 = [v11 searchFeatureReadyDate];
      uint64_t v26 = [v11 libraryReadyForAnalysisDate];
      uint64_t v27 = [v11 mediaAnalysisEmbeddingVersionBumpDate];
      uint64_t v28 = v27;
      if (v25 && v26 && v27)
      {
        [v27 timeIntervalSinceDate:v26];
        if (v29 <= 0.0) {
          uint64_t v30 = v26;
        }
        else {
          uint64_t v30 = v28;
        }
        id v41 = v30;
        objc_msgSend(v25, "timeIntervalSinceDate:");
        v31 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v23 setPayloadValue:v31 forKey:PLCoreAnalyticsSearchIndexStatusFeatureReadyTimeKey onEventWithName:v10];

        v32 = [v11 searchFeatureReadyFraction];
        id v33 = v32;
        if (v32)
        {
          [v32 doubleValue];
          v35 = +[NSNumber numberWithDouble:v34 * 100.0];
          [v23 setPayloadValue:v35 forKey:PLCoreAnalyticsSearchIndexStatusFeatureReadyPercentageKey onEventWithName:v10];
        }
      }
    }
    [v23 publishEventWithName:v10];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100016550;
    v48[3] = &unk_10002D400;
    id v36 = v11;
    id v49 = v36;
    [v16 performTransactionAndWait:v48];
    v37 = PLSearchBackendIndexStatusMaintenanceTaskGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = [v16 libraryServicesManager];
      id v39 = [v38 wellKnownPhotoLibraryIdentifier];
      *(_DWORD *)buf = 134219266;
      id v66 = v44;
      __int16 v67 = 2048;
      id v68 = v43;
      __int16 v69 = 2048;
      uint64_t v70 = v42;
      __int16 v71 = 2048;
      double v72 = v20;
      __int16 v73 = 2048;
      id v74 = v39;
      __int16 v75 = 2112;
      id v76 = v16;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Reporting Spotlight client state status, missing count: %tu, mismatched count: %tu, total asset count: %tu, and index uptime: %f for wellKnownIdentifier %lld, photoLibrary: %@", buf, 0x3Eu);
    }
    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v61, 8);

    id v6 = v46;
  }

  return v6 != (id)3;
}

@end