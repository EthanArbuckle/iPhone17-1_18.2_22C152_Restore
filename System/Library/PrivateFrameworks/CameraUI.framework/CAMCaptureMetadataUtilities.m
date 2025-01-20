@interface CAMCaptureMetadataUtilities
+ (id)metadataFromPanoramaRequest:(id)a3;
+ (id)metadataFromRequest:(id)a3;
+ (id)preciseCaptureDateFromStillImageMetadata:(id)a3;
+ (void)removeUnwantedKeysForPersistenceFromMetadata:(id)a3;
@end

@implementation CAMCaptureMetadataUtilities

+ (id)metadataFromRequest:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v5 = [v3 location];
  v6 = [v3 heading];
  if (v5)
  {
    v7 = +[CAMLocationController locationMetadataForLocation:heading:device:](CAMLocationController, "locationMetadataForLocation:heading:device:", v5, v6, [v3 captureDevice]);
    [v4 setObject:v7 forKey:*MEMORY[0x263F0F3C0]];
  }
  if ([v3 capturedFromPhotoBooth])
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v4 setObject:v8 forKey:*MEMORY[0x263F0F470]];
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v8 setObject:v9 forKey:*MEMORY[0x263F0F480]];
    [v9 addObject:@"Photo Booth"];
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([v3 conformsToProtocol:&unk_26BE663A8])
  {
    v11 = [v3 burstIdentifier];
    if (v11) {
      [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x263F2C030]];
    }
  }
  if (![v3 type])
  {
    id v12 = v3;
    v13 = +[CAMCaptureCapabilities capabilities];
    char v14 = objc_msgSend(v13, "semanticStyleSupportForMode:devicePosition:", objc_msgSend(v12, "captureMode"), objc_msgSend(v12, "captureDevicePosition"));

    v15 = [v12 semanticStyle];

    if (v15)
    {
      if ((v14 & 2) != 0)
      {
        v16 = [v12 semanticStyle];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v18 = [v12 semanticStyle];
          uint64_t v23 = *MEMORY[0x263F2C058];
          v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "makerPreset"));
          v24[0] = v19;
          v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
          [v10 setObject:v20 forKeyedSubscript:*MEMORY[0x263F2C050]];
        }
      }
    }
  }
  if ([v10 count]) {
    [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x263F0F4A0]];
  }
  v21 = (void *)[v4 copy];

  return v21;
}

+ (id)preciseCaptureDateFromStillImageMetadata:(id)a3
{
  id v3 = [a3 objectForKey:*MEMORY[0x263F0F4A0]];
  CFDictionaryRef v4 = [v3 objectForKey:*MEMORY[0x263F2C060]];
  if (v4)
  {
    HostTimeClock = CMClockGetHostTimeClock();
    memset(&v11, 0, sizeof(v11));
    CMTimeMakeFromDictionary(&v11, v4);
    memset(&v10, 0, sizeof(v10));
    CMClockGetTime(&lhs, HostTimeClock);
    CMTime v8 = v11;
    CMTimeSubtract(&v10, &lhs, &v8);
    CMTime v8 = v10;
    v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-CMTimeGetSeconds(&v8)];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)removeUnwantedKeysForPersistenceFromMetadata:(id)a3
{
  id v8 = a3;
  [v8 setObject:0 forKeyedSubscript:@"{Diagnostic}"];
  [v8 setObject:0 forKeyedSubscript:@"AddDebugInfoToUserComments"];
  [v8 setObject:0 forKeyedSubscript:@"{ApplePortrait}"];
  uint64_t v3 = *MEMORY[0x263F20830];
  CFDictionaryRef v4 = [v8 objectForKey:*MEMORY[0x263F20830]];
  uint64_t v5 = *MEMORY[0x263F2EBC0];
  v6 = [v4 objectForKey:*MEMORY[0x263F2EBC0]];
  if (v6)
  {
    v7 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];
    [v7 removeObjectForKey:v5];
    [v8 setObject:v7 forKey:v3];
  }
}

+ (id)metadataFromPanoramaRequest:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v4 setObject:v5 forKey:*MEMORY[0x263F0F248]];
  +[CAMOrientationUtilities imageOrientationOfResult:withCaptureDevice:captureOrientation:](CAMOrientationUtilities, "imageOrientationOfResult:withCaptureDevice:captureOrientation:", 0, [v3 captureDevice], objc_msgSend(v3, "captureOrientation"));
  v6 = [NSNumber numberWithInt:PLExifOrientationFromImageOrientation()];
  [v4 setObject:v6 forKey:*MEMORY[0x263F0F4C8]];

  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v4 setObject:v7 forKey:*MEMORY[0x263F0F518]];
  id v8 = [MEMORY[0x263F82670] currentDevice];
  id v9 = (void *)MGCopyAnswer();
  CMTime v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v8 localizedModel];
  }
  id v12 = v11;

  [v7 setObject:@"Apple" forKey:*MEMORY[0x263F0F530]];
  [v7 setObject:v12 forKey:*MEMORY[0x263F0F538]];
  v13 = [v8 systemVersion];
  [v7 setObject:v13 forKey:*MEMORY[0x263F0F550]];

  if (metadataFromPanoramaRequest__onceToken != -1) {
    dispatch_once(&metadataFromPanoramaRequest__onceToken, &__block_literal_global_3);
  }
  uint64_t v23 = v8;
  char v14 = [MEMORY[0x263EFF910] date];
  v15 = [(id)metadataFromPanoramaRequest__exifDateTimeFormatter stringFromDate:v14];
  v16 = v15;
  if (v15 && [v15 length])
  {
    [v5 setObject:v16 forKey:*MEMORY[0x263F0F240]];
    [v5 setObject:v16 forKey:*MEMORY[0x263F0F238]];
    [v7 setObject:v16 forKey:*MEMORY[0x263F0F510]];
  }
  v17 = v12;
  v18 = [(id)metadataFromPanoramaRequest__exifSubsecTimeFormatter stringFromDate:v14];
  v19 = v18;
  if (v18 && [v18 length])
  {
    [v5 setObject:v19 forKey:*MEMORY[0x263F0F338]];
    [v5 setObject:v19 forKey:*MEMORY[0x263F0F330]];
  }
  v20 = +[CAMCaptureMetadataUtilities metadataFromRequest:v3];
  [v4 addEntriesFromDictionary:v20];
  v21 = (void *)[v4 copy];

  return v21;
}

uint64_t __59__CAMCaptureMetadataUtilities_metadataFromPanoramaRequest___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)metadataFromPanoramaRequest__exifDateTimeFormatter;
  metadataFromPanoramaRequest__exifDateTimeFormatter = (uint64_t)v0;

  v2 = (void *)metadataFromPanoramaRequest__exifDateTimeFormatter;
  id v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
  [v2 setLocale:v3];

  id v4 = (void *)metadataFromPanoramaRequest__exifDateTimeFormatter;
  id v5 = objc_alloc(MEMORY[0x263EFF8F0]);
  uint64_t v6 = *MEMORY[0x263EFF3F8];
  id v7 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  [v4 setCalendar:v7];

  [(id)metadataFromPanoramaRequest__exifDateTimeFormatter setDateFormat:@"yyyy:MM:dd HH:mm:ss"];
  id v8 = objc_alloc_init(MEMORY[0x263F08790]);
  id v9 = (void *)metadataFromPanoramaRequest__exifSubsecTimeFormatter;
  metadataFromPanoramaRequest__exifSubsecTimeFormatter = (uint64_t)v8;

  CMTime v10 = (void *)metadataFromPanoramaRequest__exifSubsecTimeFormatter;
  id v11 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
  [v10 setLocale:v11];

  id v12 = (void *)metadataFromPanoramaRequest__exifSubsecTimeFormatter;
  v13 = (void *)[objc_alloc(MEMORY[0x263EFF8F0]) initWithCalendarIdentifier:v6];
  [v12 setCalendar:v13];

  char v14 = (void *)metadataFromPanoramaRequest__exifSubsecTimeFormatter;
  return [v14 setDateFormat:@"SSS"];
}

@end