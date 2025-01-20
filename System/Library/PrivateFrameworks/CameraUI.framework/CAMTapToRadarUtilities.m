@interface CAMTapToRadarUtilities
+ (id)writeDictionary:(id)a3 toPlistFileWithName:(id)a4;
+ (void)fileRadarWithTitle:(id)a3 description:(id)a4 classification:(id)a5 reproducibility:(id)a6 componentID:(id)a7 componentName:(id)a8 componentVersion:(id)a9 keywordIdsString:(id)a10 attachmentURLs:(id)a11 includeSysDiagnose:(BOOL)a12 includePhotosDiagnose:(BOOL)a13 includeHIDContinuousRecordings:(BOOL)a14;
@end

@implementation CAMTapToRadarUtilities

+ (void)fileRadarWithTitle:(id)a3 description:(id)a4 classification:(id)a5 reproducibility:(id)a6 componentID:(id)a7 componentName:(id)a8 componentVersion:(id)a9 keywordIdsString:(id)a10 attachmentURLs:(id)a11 includeSysDiagnose:(BOOL)a12 includePhotosDiagnose:(BOOL)a13 includeHIDContinuousRecordings:(BOOL)a14
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v64 = a7;
  id v23 = a8;
  id v24 = a9;
  id v63 = a10;
  id v25 = a11;
  v26 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v77 = v23;
    __int16 v78 = 2114;
    id v79 = v19;
    _os_log_impl(&dword_2099F8000, v26, OS_LOG_TYPE_DEFAULT, "Tap-to-Radar initiated for component: %{public}@, title: %{public}@", buf, 0x16u);
  }

  id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v28 = FigCaptureGetModelSpecificName();
  v55 = MGCopyAnswer();
  v56 = (void *)v28;
  v54 = [NSString stringWithFormat:@"%@/%@: %@", v28, v55, v19];
  objc_msgSend(v27, "setObject:forKeyedSubscript:");
  [v27 setObject:v21 forKeyedSubscript:@"Classification"];
  [v27 setObject:v22 forKeyedSubscript:@"Reproducibility"];
  [v27 setObject:v64 forKeyedSubscript:@"ComponentID"];
  v58 = v23;
  [v27 setObject:v23 forKeyedSubscript:@"ComponentName"];
  [v27 setObject:v24 forKeyedSubscript:@"ComponentVersion"];
  [v27 setObject:v20 forKeyedSubscript:@"Description"];
  if ([v63 length]) {
    [v27 setObject:v63 forKeyedSubscript:@"Keywords"];
  }
  v59 = v22;
  if (!a12) {
    [v27 setObject:@"0" forKeyedSubscript:@"AutoDiagnostics"];
  }
  v29 = [MEMORY[0x263EFF980] array];
  v30 = v29;
  if (a13) {
    [v29 addObject:@"com.apple.PhotoLibraryServices.PhotosDiagnostics"];
  }
  if (a14) {
    [v30 addObject:@"com.apple.DiagnosticExtensions.HIDContinuousRecordings"];
  }
  v61 = v20;
  if ([v30 count])
  {
    v31 = [v30 componentsJoinedByString:@","];
    [v27 setObject:v31 forKeyedSubscript:@"ExtensionIdentifiers"];
  }
  v53 = v30;
  id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v25;
  uint64_t v33 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v71 != v35) {
          objc_enumerationMutation(obj);
        }
        v37 = [*(id *)(*((void *)&v70 + 1) + 8 * i) path];
        if (v37) {
          [v32 addObject:v37];
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
    }
    while (v34);
  }
  v57 = v24;
  v60 = v21;
  v62 = v19;

  v38 = [v32 componentsJoinedByString:@","];
  if ([v38 length]) {
    [v27 setObject:v38 forKeyedSubscript:@"Attachments"];
  }
  v52 = v38;
  v51 = [MEMORY[0x263F08BA0] componentsWithString:@"tap-to-radar://new"];
  id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v40 = v27;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v67 != v43) {
          objc_enumerationMutation(v40);
        }
        uint64_t v45 = *(void *)(*((void *)&v66 + 1) + 8 * j);
        v46 = (void *)MEMORY[0x263F08BD0];
        v47 = [v40 objectForKeyedSubscript:v45];
        v48 = [v46 queryItemWithName:v45 value:v47];
        [v39 addObject:v48];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v66 objects:v74 count:16];
    }
    while (v42);
  }

  [v51 setQueryItems:v39];
  v49 = [v51 URL];
  if ((CAMOpenSensitiveURLWithUnlockRequest(v49, 1) & 1) == 0)
  {
    v50 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      +[CAMTapToRadarUtilities fileRadarWithTitle:description:classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:]((uint64_t)v49, v50);
    }
  }
}

+ (id)writeDictionary:(id)a3 toPlistFileWithName:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    uint64_t v7 = NSTemporaryDirectory();
    v8 = [v5 stringByAppendingString:@".plist"];

    v9 = [(id)v7 stringByAppendingPathComponent:v8];

    v10 = [NSURL fileURLWithPath:v9];
    id v14 = 0;
    LOBYTE(v7) = [v6 writeToURL:v10 error:&v14];

    id v11 = v14;
    if ((v7 & 1) == 0)
    {
      v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v11;
        _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "CAMTapToRadarUtilities: Failed to save tap-to-radar info, error: %{public}@", buf, 0xCu);
      }

      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (void)fileRadarWithTitle:(uint64_t)a1 description:(NSObject *)a2 classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "CAMTapToRadarUtilities: Failed to open radar url: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end