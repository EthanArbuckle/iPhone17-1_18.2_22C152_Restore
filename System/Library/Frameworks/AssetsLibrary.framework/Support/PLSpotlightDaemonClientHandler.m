@interface PLSpotlightDaemonClientHandler
- (BOOL)_isValidProtectionClass:(id)a3;
- (BOOL)_isValidReindexingRequestWithBundleID:(id)a3;
- (id)pathManager;
- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5;
- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 reason:(id)a5 acknowledgementHandler:(id)a6;
- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6;
- (void)start;
@end

@implementation PLSpotlightDaemonClientHandler

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v8 = a8;
  v9 = PLSearchBackendDonationsGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SpotlightDaemonClient: Received request from Spotlight to provideFileURLForBundleID - no action is implemented by Photos in response to this request", v10, 2u);
  }

  (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
}

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v8 = a8;
  v9 = PLSearchBackendDonationsGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SpotlightDaemonClient: Received request from Spotlight to provideDataForBundleID - no action is implemented by Photos in response to this request", v10, 2u);
  }

  (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
}

- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(void))a6;
  if (![(PLSpotlightDaemonClientHandler *)self _isValidProtectionClass:v12])
  {
    v16 = PLSearchBackendDonationsGetLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v29 = 138543618;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v10;
    v19 = "SpotlightDaemonClient: Aborting unexpected request to reindex searchable items with identifiers for unsupporte"
          "d protectionClass: %{public}@, identifiers: %@";
    goto LABEL_22;
  }
  if (!+[PLSpotlightDonationUtilities shouldDisablePhotosLegacySearchDonation])
  {
    v20 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
    unsigned __int8 v21 = [v11 isEqualToString:v20];

    v22 = PLSearchBackendDonationsGetLog();
    v16 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138412546;
        id v30 = v10;
        __int16 v31 = 2112;
        id v32 = v11;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SpotlightDaemonClient: Received request to reindex searchable items for Core Spotlight: %@ for bundleID: %@", (uint8_t *)&v29, 0x16u);
      }

      v23 = [(PLSpotlightDaemonClientHandler *)self pathManager];
      unsigned int v24 = +[PLSpotlightProgressManager addSearchableItemIdentifiers:v10 forOperationType:1 forPhotoLibraryPathManager:v23];

      v25 = PLSearchBackendDonationsGetLog();
      v16 = v25;
      if (v24)
      {
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_28;
        }
        int v29 = 138412290;
        id v30 = v10;
        v19 = "SpotlightDaemonClient: Recorded request to reindex searchable item identifiers for Core Spotlight: %@";
        v26 = v16;
        os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_26;
      }
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      int v29 = 138412290;
      id v30 = v10;
      v19 = "SpotlightDaemonClient: Failed to record request to reindex searchable item identifiers for Core Spotlight: %@";
LABEL_25:
      v26 = v16;
      os_log_type_t v27 = OS_LOG_TYPE_ERROR;
LABEL_26:
      uint32_t v28 = 12;
      goto LABEL_27;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v29 = 138412546;
    id v30 = v11;
    __int16 v31 = 2112;
    id v32 = v10;
    v19 = "SpotlightDaemonClient: Aborting unexpected request to reindex searchable items for bundleID: %@, identifiers: %@";
LABEL_22:
    v26 = v16;
    os_log_type_t v27 = OS_LOG_TYPE_ERROR;
    uint32_t v28 = 22;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v26, v27, v19, (uint8_t *)&v29, v28);
    goto LABEL_28;
  }
  unsigned __int8 v14 = [(PLSpotlightDaemonClientHandler *)self _isValidReindexingRequestWithBundleID:v11];
  v15 = PLSearchBackendDonationsGetLog();
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v29 = 138543362;
    id v30 = v10;
    v19 = "SpotlightDaemonClient: Aborting unexpected request to reindex searchable items with identifiers: %{public}@";
    goto LABEL_25;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138412802;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v11;
    __int16 v33 = 2114;
    id v34 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SpotlightDaemonClient: Received request to reindex searchable items for Core Spotlight: %@ for bundleID: %@, protection class: %{public}@", (uint8_t *)&v29, 0x20u);
  }

  +[PLAutoBugCapture captureSpotlightClientHandlerReindexItemsWithIdentifiers:v10 reason:0 completion:&stru_10002CF60];
  v16 = +[PLSpotlightReindexing recordReindexIdentifiersWithIdentifiers:v10 bundleID:v11];
  if ([v16 isFailure])
  {
    v17 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = [v16 error];
      int v29 = 138412546;
      id v30 = v10;
      __int16 v31 = 2112;
      id v32 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "SpotlightDaemonClient: Failed to record reindex searchable items: %@ with error: %@", (uint8_t *)&v29, 0x16u);
    }
  }
LABEL_28:

  v13[2](v13);
}

- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 reason:(id)a5 acknowledgementHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(void))a6;
  if (![(PLSpotlightDaemonClientHandler *)self _isValidProtectionClass:v11])
  {
    v19 = PLSearchBackendDonationsGetLog();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    int v32 = 138543362;
    id v33 = v11;
    v20 = "SpotlightDaemonClient: Aborting unexpected request to reindex all searchable items for unsupported protectionC"
          "lass: %{public}@";
    goto LABEL_19;
  }
  if (!+[PLSpotlightDonationUtilities shouldDisablePhotosLegacySearchDonation])
  {
    unsigned __int8 v21 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
    unsigned __int8 v22 = [v10 isEqualToString:v21];

    v23 = PLSearchBackendDonationsGetLog();
    v19 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138412290;
        id v33 = v10;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SpotlightDaemonClient: Received request to reindex all searchable items for Core Spotlight for bundleID: %@", (uint8_t *)&v32, 0xCu);
      }

      unsigned int v24 = [(PLSpotlightDaemonClientHandler *)self pathManager];
      unsigned int v25 = +[PLSpotlightProgressManager setSpotlightIndexNeedsReindexing:1 forPhotoLibraryPathManager:v24];

      v26 = PLSearchBackendDonationsGetLog();
      v19 = v26;
      if (v25)
      {
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        LOWORD(v32) = 0;
        v20 = "SpotlightDaemonClient: Recorded request to reindex all searchable items for Core Spotlight";
        os_log_type_t v27 = v19;
        os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_23;
      }
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      LOWORD(v32) = 0;
      v20 = "SpotlightDaemonClient: Failed to record request to reindex all searchable items for Core Spotlight";
LABEL_22:
      os_log_type_t v27 = v19;
      os_log_type_t v28 = OS_LOG_TYPE_ERROR;
LABEL_23:
      uint32_t v29 = 2;
      goto LABEL_24;
    }
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    int v32 = 138412290;
    id v33 = v10;
    v20 = "SpotlightDaemonClient: Aborting unexpected request to reindex all searchable items for bundleID: %@";
LABEL_19:
    os_log_type_t v27 = v19;
    os_log_type_t v28 = OS_LOG_TYPE_ERROR;
    uint32_t v29 = 12;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v27, v28, v20, (uint8_t *)&v32, v29);
    goto LABEL_25;
  }
  if (![(PLSpotlightDaemonClientHandler *)self _isValidReindexingRequestWithBundleID:v10])
  {
    v19 = PLSearchBackendDonationsGetLog();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    LOWORD(v32) = 0;
    v20 = "SpotlightDaemonClient: Aborting unexpected request to reindex all searchable items";
    goto LABEL_22;
  }
  unsigned __int8 v14 = PLSearchBackendDonationsGetLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (!v15) {
      goto LABEL_29;
    }
    int v32 = 138543874;
    id v33 = v10;
    __int16 v34 = 2114;
    id v35 = v12;
    __int16 v36 = 2114;
    id v37 = v11;
    v16 = "SpotlightDaemonClient: Received request to reindex all searchable items for Core Spotlight for bundleID: %{pub"
          "lic}@, reason: %{public}@, protection class: %{public}@";
    v17 = v14;
    uint32_t v18 = 32;
  }
  else
  {
    if (!v15) {
      goto LABEL_29;
    }
    int v32 = 138543618;
    id v33 = v10;
    __int16 v34 = 2114;
    id v35 = v11;
    v16 = "SpotlightDaemonClient: Received request to reindex all searchable items for Core Spotlight for bundleID: %{pub"
          "lic}@, protection class: %{public}@";
    v17 = v14;
    uint32_t v18 = 22;
  }
  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v32, v18);
LABEL_29:

  +[PLAutoBugCapture captureSpotlightClientHandlerReindexAllItemsWithReason:v12 completion:&stru_10002CF40];
  v19 = +[PLSpotlightReindexing recordReindexAllItemsForBundleID:v10 reindexReason:v12];
  if ([v19 isFailure])
  {
    id v30 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = [v19 error];
      int v32 = 138412290;
      id v33 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "SpotlightDaemonClient: Failed to record reindex all searchable items with error: %@", (uint8_t *)&v32, 0xCu);
    }
  }
LABEL_25:

  v13[2](v13);
}

- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
}

- (BOOL)_isValidProtectionClass:(id)a3
{
  id v3 = a3;
  v4 = PLSearchFileProtectionTypes();
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5;
}

- (BOOL)_isValidReindexingRequestWithBundleID:(id)a3
{
  id v3 = a3;
  v4 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
  unsigned __int8 v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    if (!+[PLSpotlightDonationUtilities spotlightPrivateIndexEnabled])
    {
      BOOL v10 = 1;
      goto LABEL_10;
    }
    v6 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      v7 = "SpotlightDaemonClient: Unexpected request to reindex searchable items for Spotlight managed index";
      id v8 = v6;
      uint32_t v9 = 2;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v12, v9);
    }
  }
  else
  {
    v6 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v3;
      v7 = "SpotlightDaemonClient: Unexpected request to reindex searchable items for bundleID: %@";
      id v8 = v6;
      uint32_t v9 = 12;
      goto LABEL_7;
    }
  }

  BOOL v10 = 0;
LABEL_10:

  return v10;
}

- (id)pathManager
{
  v2 = +[PLPhotoLibraryPathManager wellKnownPhotoLibraryURLForIdentifier:1];
  id v3 = +[PLLibraryServicesManager libraryServicesManagerForLibraryURL:v2];
  v4 = [v3 pathManager];

  return v4;
}

- (void)start
{
}

@end