@interface SGAssetDownloader
+ (void)downloadAssetsWithTypeIdentifier:(id)a3 matchingBlock:(id)a4;
@end

@implementation SGAssetDownloader

+ (void)downloadAssetsWithTypeIdentifier:(id)a3 matchingBlock:(id)a4
{
  id v5 = a3;
  v41 = (uint64_t (**)(id, void *))a4;
  fwrite("\n=== A friendly message from SGAssetDownloader ===\nUnit tests now automatically download critical mobile assets needed for tests to pass.\nIf this takes a long time, make sure your device has an internal network connection.\nYou can share your Mac's connection this way:\n1. Open System Preferences --> Sharing --> Internet Sharing.\n2. *Uncheck* and *select* 'Internet Sharing'.\n3. Share your connection from: Ethernet (or WiFi, if you use AppleWiFiSecure).\n4. To computers using: Check all items named iPhone USB or iPad USB.\n5. *Check* 'Internet Sharing'.\n\n", 0x22CuLL, 1uLL, __stderrp);
  v6 = __stderrp;
  id v7 = v5;
  fprintf(v6, "downloadAssetsWithTypeIdentifier starting for V2: %s\n", (const char *)[v7 UTF8String]);
  dispatch_semaphore_t v40 = dispatch_semaphore_create(0);
  v8 = objc_opt_new();
  [v8 setAllowsCellularAccess:1];
  [v8 setTimeoutIntervalForResource:1800];
  v39 = v8;
  [v8 setDiscretionary:0];
  id v9 = [objc_alloc((Class)MAAssetQuery) initWithType:v7];
  if ([v9 queryMetaDataSync]) {
    fwrite("couldn't query assets :(\n", 0x19uLL, 1uLL, __stderrp);
  }
  v10 = [v9 results];
  id v11 = [v10 count];

  v37 = v7;
  if (!v11)
  {
    fwrite("going to download catalog because query had 0 results\n", 0x36uLL, 1uLL, __stderrp);
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1000055D4;
    v52[3] = &unk_100058C28;
    v12 = v40;
    v53 = v12;
    +[MAAsset startCatalogDownload:v7 options:v8 then:v52];
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    id v13 = [objc_alloc((Class)MAAssetQuery) initWithType:v7];

    if ([v13 queryMetaDataSync]) {
      fwrite("couldn't query assets :(\n", 0x19uLL, 1uLL, __stderrp);
    }

    id v9 = v13;
  }
  v14 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v36 = v9;
  v15 = [v9 results];
  id v16 = [v15 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v49;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v21 = [v20 attributes];
        int v22 = v41[2](v41, v21);

        if (v22) {
          [v14 addObject:v20];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v17);
  }

  fprintf(__stderrp, "Will download %lu assets...\n", [v14 count]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v23 = v14;
  id v24 = [v23 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = 0;
    uint64_t v38 = *(void *)v45;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v45 != v38) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
        v29 = __stderrp;
        id v30 = [v23 count];
        id v31 = [v28 assetId];
        fprintf(v29, "Beginning download of asset %lu of %lu (%s)\n", (char *)j + v26 + 1, v30, (const char *)[v31 UTF8String]);

        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_10000562C;
        v42[3] = &unk_100058C28;
        v32 = v40;
        v43 = v32;
        [v28 startDownload:v39 then:v42];
        dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
        v33 = __stderrp;
        id v34 = [v23 count];
        id v35 = [v28 assetId];
        fprintf(v33, "Finished download of asset %lu of %lu (%s)\n", (char *)j + v26 + 1, v34, (const char *)[v35 UTF8String]);
      }
      v26 += (uint64_t)j;
      id v25 = [v23 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v25);
  }
}

@end