@interface AXSDSoundDetectionGatherFilesAndGenerateRadarForNotificationAt
@end

@implementation AXSDSoundDetectionGatherFilesAndGenerateRadarForNotificationAt

void ___AXSDSoundDetectionGatherFilesAndGenerateRadarForNotificationAt_block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v35 = *(id *)(a1 + 32);
  buf[0] = 1;
  v1 = [MEMORY[0x263F08850] defaultManager];
  if (([v1 fileExistsAtPath:@"/var/mobile/Library/Accessibility/DataCollection/SoundFiles" isDirectory:buf] & 1) == 0)
  {
    v2 = AXLogUltron();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      ___AXSDSoundDetectionGatherFilesAndGenerateRadarForNotificationAt_block_invoke_cold_1(v2);
    }

    [v1 createDirectoryAtPath:@"/var/mobile/Library/Accessibility/DataCollection/SoundFiles" withIntermediateDirectories:1 attributes:0 error:0];
  }

  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [v3 enumeratorAtPath:@"/var/mobile/Library/Accessibility/DataCollection/SoundFiles"];

  id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      v7 = [@"/var/mobile/Library/Accessibility/DataCollection/SoundFiles" stringByAppendingPathComponent:v6];
      v8 = [MEMORY[0x263F08850] defaultManager];
      id v37 = 0;
      v9 = [v8 attributesOfItemAtPath:v7 error:&v37];
      id v10 = v37;
      v11 = [v9 fileCreationDate];

      if (v10)
      {
        v12 = AXLogUltron();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v7;
          __int16 v41 = 2112;
          id v42 = v10;
          _os_log_error_impl(&dword_21F182000, v12, OS_LOG_TYPE_ERROR, "filesNearestDate: failed to find creation date for file %@. Skipping. error: %@", buf, 0x16u);
        }
      }
      else
      {
        [v11 timeIntervalSinceDate:v35];
        if (fabs(v13) < 15.0) {
          [v34 addObject:v7];
        }
      }

      uint64_t v14 = [v4 nextObject];

      v6 = (void *)v14;
    }
    while (v14);
  }

  v31 = objc_opt_new();
  [v31 setScheme:@"tap-to-radar"];
  [v31 setHost:@"new"];
  v15 = (void *)MEMORY[0x263F08BD0];
  v16 = [NSString stringWithFormat:@"AX Sound Recognition False Positive: %@", *(void *)(a1 + 40)];
  v36 = [v15 queryItemWithName:@"Title" value:v16];

  v33 = [MEMORY[0x263F08BD0] queryItemWithName:@"Description" value:@"[Add any details about where you were or what you were doing when the false positive occured. Thanks!]"];
  v30 = [MEMORY[0x263F08BD0] queryItemWithName:@"Classification" value:@"Performance"];
  v17 = [MEMORY[0x263F08BD0] queryItemWithName:@"Reproducibility" value:@"I Didn't Try"];
  v18 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentName" value:@"Accessibility Sound Detection"];
  v19 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentID" value:@"1074027"];
  uint64_t v20 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentVersion" value:@"All"];
  v21 = (void *)MEMORY[0x263F08BD0];
  v22 = [v34 componentsJoinedByString:@","];
  v23 = [v21 queryItemWithName:@"Attachments" value:v22];

  v24 = [MEMORY[0x263F08BD0] queryItemWithName:@"AutoDiagnostics" value:@"0"];
  v25 = [MEMORY[0x263F08BD0] queryItemWithName:@"DeviceClasses" value:@"iPhone,iPad"];
  v38[0] = v36;
  v38[1] = v33;
  v38[2] = v17;
  v38[3] = v30;
  v38[4] = v18;
  v38[5] = v19;
  v38[6] = v20;
  v38[7] = v23;
  v26 = (void *)v20;
  v38[8] = v24;
  v38[9] = v25;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:10];
  [v31 setQueryItems:v27];

  v28 = [v31 URL];
  v29 = [MEMORY[0x263F01880] defaultWorkspace];
  [v29 openURL:v28 withOptions:0];
}

void ___AXSDSoundDetectionGatherFilesAndGenerateRadarForNotificationAt_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21F182000, log, OS_LOG_TYPE_DEBUG, "Creating Ultron Directory", v1, 2u);
}

@end