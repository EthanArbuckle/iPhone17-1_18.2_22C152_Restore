@interface GEOSearchAttributionManifestVersionMigrationTask
@end

@implementation GEOSearchAttributionManifestVersionMigrationTask

void __115___GEOSearchAttributionManifestVersionMigrationTask_initWithMigrator_newSearchAttributionManifestURL_oldTileGroup___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

void __94___GEOSearchAttributionManifestVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke(id *a1)
{
  uint64_t v2 = [a1[6] copy];
  v3 = a1[4];
  v4 = (void *)v3[6];
  v3[6] = v2;

  objc_storeStrong((id *)a1[4] + 7, a1[5]);
  v5 = [*((id *)a1[4] + 5) urlInfoSet];
  v6 = [v5 searchAttributionManifestURL];
  v7 = [v6 nsURL];

  id v8 = *((id *)a1[4] + 4);
  v9 = v8;
  if (v8)
  {
    if ([v8 isEqual:v7])
    {
      v10 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_INFO, "[SearchAttributionManifest] Search attribution manifest URL is unchanged.", buf, 2u);
      }

      v11 = +[GEOFilePaths pathFor:30];
      v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      v13 = +[GEOFilePaths pathFor:30];
      int v14 = [v12 fileExistsAtPath:v13];

      if (v14)
      {
        v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v11];
        if (v15)
        {
          v16 = [[GEOSearchAttributionManifest alloc] initWithData:v15];
          if (v16)
          {
            v17 = a1[4];
            v18 = (void *)v17[12];
            v17[12] = v16;
            v19 = v16;

            [a1[4] _completeWithError:0];
LABEL_21:

            goto LABEL_22;
          }
        }
      }
      else
      {
        v15 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "[SearchAttributionManifest] Search attribution manifest URL is unchanged, but file is gone!. Will re-download.", buf, 2u);
        }
      }
    }
    v21 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_INFO, "[SearchAttributionManifest] Updating search attribution manifest", buf, 2u);
    }

    v11 = (void *)[objc_alloc(MEMORY[0x1E4F290D0]) initWithURL:v9];
    v22 = (void *)MEMORY[0x1E4F290D0];
    v23 = +[GEOPlatform sharedPlatform];
    if ([v23 isInternalInstall]) {
      uint64_t BOOL = GEOConfigGetBOOL(GeoServicesConfig_AllowNonEVCerts, (uint64_t)off_1E9113CB8);
    }
    else {
      uint64_t BOOL = 0;
    }

    v25 = [v11 URL];
    v26 = [v25 host];
    [v22 setAllowsAnyHTTPSCertificate:BOOL forHost:v26];

    v15 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
    uint64_t v27 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v15];
    v28 = a1[4];
    v29 = (void *)v28[9];
    v28[9] = v27;

    v30 = a1[4];
    v31 = (void *)v30[9];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __94___GEOSearchAttributionManifestVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_88;
    v40[3] = &unk_1E53ECA20;
    v40[4] = v30;
    uint64_t v32 = [v31 dataTaskWithRequest:v11 completionHandler:v40];
    v33 = a1[4];
    v34 = (void *)v33[10];
    v33[10] = v32;

    v35 = +[GEORequestCounter sharedCounter];
    v36 = +[GEOApplicationAuditToken currentProcessAuditToken];
    uint64_t v37 = [v35 requestCounterTicketForType:2 auditToken:v36 traits:0];
    v38 = a1[4];
    v39 = (void *)v38[11];
    v38[11] = v37;

    [*((id *)a1[4] + 11) startingRequestWithTask:*((void *)a1[4] + 10)];
    [*((id *)a1[4] + 10) resume];
    goto LABEL_21;
  }
  v20 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_INFO, "[SearchAttributionManifest] No search attribution manifest URL. Done.", buf, 2u);
  }

  [a1[4] _completeWithError:0];
LABEL_22:
}

void __94___GEOSearchAttributionManifestVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_88(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 16);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94___GEOSearchAttributionManifestVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_2;
  v15[3] = &unk_1E53D8AF8;
  v15[4] = v10;
  id v16 = v8;
  id v17 = v7;
  id v18 = v9;
  id v12 = v9;
  id v13 = v7;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __94___GEOSearchAttributionManifestVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleResponse:*(void *)(a1 + 40) withData:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

uint64_t __59___GEOSearchAttributionManifestVersionMigrationTask_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) cancel];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);

  return [v2 cancel];
}

uint64_t __72___GEOSearchAttributionManifestVersionMigrationTask__completeWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end