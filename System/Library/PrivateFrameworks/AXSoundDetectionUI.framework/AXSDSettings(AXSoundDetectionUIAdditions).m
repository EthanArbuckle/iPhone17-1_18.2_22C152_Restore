@interface AXSDSettings(AXSoundDetectionUIAdditions)
- (id)decodeKShotDetectors:()AXSoundDetectionUIAdditions;
- (id)decodedKShotDetectors;
- (id)detectorForIdentifier:()AXSoundDetectionUIAdditions;
- (id)encodeKShotDetectors:()AXSoundDetectionUIAdditions;
- (id)kShotCategoryForDetectionType:()AXSoundDetectionUIAdditions;
- (id)kShotSoundRecordingsForDetector:()AXSoundDetectionUIAdditions;
- (uint64_t)deleteModelForDetector:()AXSoundDetectionUIAdditions;
- (uint64_t)deleteTrainingFilesForDetector:()AXSoundDetectionUIAdditions;
- (uint64_t)hasCustomHapticForKshotDetector:()AXSoundDetectionUIAdditions;
- (uint64_t)hasCustomToneForKshotDetector:()AXSoundDetectionUIAdditions;
- (void)addKShotDetector:()AXSoundDetectionUIAdditions;
- (void)deleteRecordingLinksForDetector:()AXSoundDetectionUIAdditions;
- (void)disableDetector:()AXSoundDetectionUIAdditions;
- (void)editKShotDetectorName:()AXSoundDetectionUIAdditions newName:;
- (void)enableDetector:()AXSoundDetectionUIAdditions;
- (void)encodeAndSaveKShotDetectors:()AXSoundDetectionUIAdditions;
- (void)removeAllKShotDetectors;
- (void)removeKShotDetector:()AXSoundDetectionUIAdditions;
- (void)setDetectorIsEnabled:()AXSoundDetectionUIAdditions isEnabled:;
- (void)setKShotDetectorIsEnabled:()AXSoundDetectionUIAdditions isEnabled:;
- (void)setKShotDetectorModelFailed:()AXSoundDetectionUIAdditions modelFailed:;
- (void)updateKShotDetector:()AXSoundDetectionUIAdditions;
@end

@implementation AXSDSettings(AXSoundDetectionUIAdditions)

- (id)decodedKShotDetectors
{
  v2 = [a1 kShotDetectors];
  v3 = [a1 decodeKShotDetectors:v2];

  return v3;
}

- (id)decodeKShotDetectors:()AXSoundDetectionUIAdditions
{
  v20[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF8F8] data];

  if (v4 == v3)
  {
    v15 = [NSDictionary dictionary];
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x263EFFA08]);
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
    v7 = (void *)[v5 initWithArray:v6];

    id v8 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v19 = objc_opt_class();
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    v10 = (void *)[v8 initWithArray:v9];

    id v18 = 0;
    v11 = [MEMORY[0x263F08928] unarchivedDictionaryWithKeysOfClasses:v7 objectsOfClasses:v10 fromData:v3 error:&v18];
    id v12 = v18;
    v13 = v12;
    if (v11)
    {
      id v14 = v11;
    }
    else
    {
      if (v12)
      {
        v16 = AXLogUltron();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[AXSDSettings(AXSoundDetectionUIAdditions) decodeKShotDetectors:]((uint64_t)v13, v16);
        }
      }
      id v14 = [NSDictionary dictionary];
    }
    v15 = v14;
  }
  return v15;
}

- (void)addKShotDetector:()AXSoundDetectionUIAdditions
{
  id v4 = a3;
  id v5 = [a1 decodedKShotDetectors];
  id v7 = (id)[v5 mutableCopy];

  v6 = [v4 identifier];
  [v7 setObject:v4 forKey:v6];

  [a1 encodeAndSaveKShotDetectors:v7];
}

- (void)updateKShotDetector:()AXSoundDetectionUIAdditions
{
  id v4 = a3;
  id v5 = [a1 decodedKShotDetectors];
  id v7 = (id)[v5 mutableCopy];

  v6 = [v4 identifier];
  [v7 setObject:v4 forKey:v6];

  [a1 encodeAndSaveKShotDetectors:v7];
}

- (void)removeKShotDetector:()AXSoundDetectionUIAdditions
{
  id v4 = a3;
  id v5 = [a1 decodedKShotDetectors];
  id v7 = (id)[v5 mutableCopy];

  v6 = [v4 identifier];
  [v7 removeObjectForKey:v6];

  [a1 deleteTrainingFilesForDetector:v4];
  [a1 deleteModelForDetector:v4];

  [a1 encodeAndSaveKShotDetectors:v7];
}

- (void)removeAllKShotDetectors
{
  v2 = [NSDictionary dictionary];
  id v3 = [a1 encodeKShotDetectors:v2];

  [a1 setKShotDetectors:v3];
}

- (void)enableDetector:()AXSoundDetectionUIAdditions
{
  id v5 = a3;
  if ([v5 isCustom])
  {
    [a1 setKShotDetectorIsEnabled:v5 isEnabled:1];
  }
  else
  {
    uint64_t v4 = [v5 identifier];

    [a1 addSoundDetectionType:v4];
    id v5 = (id)v4;
  }
}

- (void)disableDetector:()AXSoundDetectionUIAdditions
{
  id v5 = a3;
  if ([v5 isCustom])
  {
    [a1 setKShotDetectorIsEnabled:v5 isEnabled:1];
  }
  else
  {
    uint64_t v4 = [v5 identifier];

    [a1 addSoundDetectionType:v4];
    id v5 = (id)v4;
  }
}

- (void)setDetectorIsEnabled:()AXSoundDetectionUIAdditions isEnabled:
{
  id v7 = a3;
  if ([v7 isCustom])
  {
    [a1 setKShotDetectorIsEnabled:v7 isEnabled:a4];
  }
  else
  {
    v6 = [v7 identifier];
    if (a4) {
      [a1 addSoundDetectionType:v6];
    }
    else {
      [a1 removeSoundDetectionType:v6];
    }
  }
}

- (void)setKShotDetectorIsEnabled:()AXSoundDetectionUIAdditions isEnabled:
{
  id v6 = a3;
  id v7 = [a1 enabledKShotDetectorIdentifiers];
  id v9 = (id)[v7 mutableCopy];

  id v8 = [v6 identifier];

  if (a4) {
    [v9 addObject:v8];
  }
  else {
    [v9 removeObject:v8];
  }

  [a1 setEnabledKShotDetectorIdentifiers:v9];
}

- (void)setKShotDetectorModelFailed:()AXSoundDetectionUIAdditions modelFailed:
{
  id v6 = a3;
  id v7 = [a1 decodedKShotDetectors];
  id v10 = (id)[v7 mutableCopy];

  id v8 = [v6 identifier];

  id v9 = [v10 objectForKey:v8];
  [v9 setModelFailed:a4];

  [a1 encodeAndSaveKShotDetectors:v10];
}

- (void)editKShotDetectorName:()AXSoundDetectionUIAdditions newName:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 decodedKShotDetectors];
  id v11 = (id)[v8 mutableCopy];

  id v9 = [v7 identifier];

  id v10 = [v11 objectForKey:v9];
  [v10 setName:v6];

  [a1 encodeAndSaveKShotDetectors:v11];
}

- (id)encodeKShotDetectors:()AXSoundDetectionUIAdditions
{
  id v7 = 0;
  id v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v7];
  id v4 = v7;
  if (v4)
  {
    id v5 = AXLogUltron();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AXSDSettings(AXSoundDetectionUIAdditions) encodeKShotDetectors:]((uint64_t)v4, v5);
    }
  }
  return v3;
}

- (void)encodeAndSaveKShotDetectors:()AXSoundDetectionUIAdditions
{
  objc_msgSend(a1, "encodeKShotDetectors:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setKShotDetectors:v2];
}

- (id)kShotSoundRecordingsForDetector:()AXSoundDetectionUIAdditions
{
  id v4 = a3;
  id v5 = [a1 kShotSoundRecordings];
  id v6 = [v4 identifier];

  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF8C0] array];
  }
  id v9 = v8;

  return v9;
}

- (id)kShotCategoryForDetectionType:()AXSoundDetectionUIAdditions
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x263F21D08]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F21D18]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F21D10]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F21D50]] & 1) != 0)
  {
    id v4 = (id *)MEMORY[0x263F21CB0];
  }
  else
  {
    char v7 = [v3 isEqualToString:*MEMORY[0x263F21D58]];
    id v4 = (id *)MEMORY[0x263F21CA0];
    if ((v7 & 1) == 0 && ![v3 isEqualToString:*MEMORY[0x263F21D90]]) {
      id v4 = (id *)MEMORY[0x263F21CB8];
    }
  }
  id v5 = *v4;

  return v5;
}

- (id)detectorForIdentifier:()AXSoundDetectionUIAdditions
{
  id v4 = a3;
  id v5 = [a1 decodedKShotDetectors];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (uint64_t)hasCustomToneForKshotDetector:()AXSoundDetectionUIAdditions
{
  id v3 = [a3 identifier];
  if (v3)
  {
    id v4 = [MEMORY[0x263F7FC90] sharedToneManager];
    id v5 = [v4 defaultToneIdentifierForAlertType:29 topic:v3];

    id v6 = [MEMORY[0x263F7FC90] sharedToneManager];
    char v7 = [v6 currentToneIdentifierForAlertType:29 topic:v3];

    id v8 = [v7 lowercaseString];
    id v9 = [v5 lowercaseString];
    uint64_t v10 = [v8 isEqualToString:v9] ^ 1;
  }
  else
  {
    id v11 = AXLogUltron();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AXSDSettings(AXSoundDetectionUIAdditions) hasCustomToneForKshotDetector:](v11);
    }

    uint64_t v10 = 0;
  }

  return v10;
}

- (uint64_t)hasCustomHapticForKshotDetector:()AXSoundDetectionUIAdditions
{
  id v3 = [a3 identifier];
  if (v3)
  {
    id v4 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
    id v5 = [v4 defaultVibrationIdentifierForAlertType:29 topic:v3];

    id v6 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
    char v7 = [v6 currentVibrationIdentifierForAlertType:29 topic:v3];

    id v8 = [v7 lowercaseString];
    id v9 = [v5 lowercaseString];
    uint64_t v10 = [v8 isEqualToString:v9] ^ 1;
  }
  else
  {
    id v11 = AXLogUltron();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AXSDSettings(AXSoundDetectionUIAdditions) hasCustomHapticForKshotDetector:](v11);
    }

    uint64_t v10 = 0;
  }

  return v10;
}

- (void)deleteRecordingLinksForDetector:()AXSoundDetectionUIAdditions
{
  id v4 = a3;
  id v5 = [a1 kShotSoundRecordings];
  id v8 = (id)[v5 mutableCopy];

  id v6 = [MEMORY[0x263EFF8C0] array];
  char v7 = [v4 identifier];

  [v8 setObject:v6 forKey:v7];
  [a1 setKShotSoundRecordings:v8];
}

- (uint64_t)deleteTrainingFilesForDetector:()AXSoundDetectionUIAdditions
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [NSURL fileURLWithPath:@"/var/mobile/Library/Accessibility/SoundDetectionKShot/TrainingFiles"];
  id v6 = [v4 identifier];
  char v7 = [v5 URLByAppendingPathComponent:v6];

  id v8 = [MEMORY[0x263F08850] defaultManager];
  id v9 = [v7 path];
  int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    id v20 = 0;
    char v11 = [v8 removeItemAtURL:v7 error:&v20];
    id v12 = v20;
    v13 = v12;
    if (v11)
    {
      [a1 deleteRecordingLinksForDetector:v4];
      id v14 = AXLogUltron();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = [v4 name];
        *(_DWORD *)buf = 138412546;
        v22 = v5;
        __int16 v23 = 2112;
        v24 = v15;
        _os_log_impl(&dword_226F20000, v14, OS_LOG_TYPE_INFO, "Deleted training files at path: %@ for detector: %@", buf, 0x16u);
      }
      uint64_t v16 = 1;
    }
    else
    {
      if (!v12)
      {
        uint64_t v16 = 1;
        goto LABEL_13;
      }
      id v18 = AXLogUltron();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[AXSDSettings(AXSoundDetectionUIAdditions) deleteTrainingFilesForDetector:](v4);
      }

      uint64_t v16 = 0;
    }
  }
  else
  {
    v13 = AXLogUltron();
    uint64_t v16 = 1;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v17 = [v4 name];
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      _os_log_impl(&dword_226F20000, v13, OS_LOG_TYPE_INFO, "No need to delete training files for detector: %@, since the directory does not exist", buf, 0xCu);
    }
  }

LABEL_13:
  return v16;
}

- (uint64_t)deleteModelForDetector:()AXSoundDetectionUIAdditions
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [NSURL fileURLWithPath:*MEMORY[0x263F21CD8]];
  id v5 = [v3 identifier];
  id v6 = [v5 stringByAppendingString:@".mlmodel"];

  char v7 = [v4 URLByAppendingPathComponent:v6];
  id v8 = [MEMORY[0x263F08850] defaultManager];
  id v9 = [v7 path];
  int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    id v20 = 0;
    char v11 = [v8 removeItemAtURL:v7 error:&v20];
    id v12 = v20;
    v13 = v12;
    if (v11)
    {
      id v14 = AXLogUltron();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = [v3 name];
        *(_DWORD *)buf = 138412546;
        v22 = v4;
        __int16 v23 = 2112;
        v24 = v15;
        _os_log_impl(&dword_226F20000, v14, OS_LOG_TYPE_INFO, "Deleted model at path: %@ for detector: %@", buf, 0x16u);
      }
      uint64_t v16 = 1;
    }
    else
    {
      if (!v12)
      {
        uint64_t v16 = 1;
        goto LABEL_13;
      }
      id v18 = AXLogUltron();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[AXSDSettings(AXSoundDetectionUIAdditions) deleteModelForDetector:](v3);
      }

      uint64_t v16 = 0;
    }
  }
  else
  {
    v13 = AXLogUltron();
    uint64_t v16 = 1;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v17 = [v3 name];
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      _os_log_impl(&dword_226F20000, v13, OS_LOG_TYPE_INFO, "No need to delete model for detector: %@, since the model does not exist", buf, 0xCu);
    }
  }

LABEL_13:
  return v16;
}

- (void)decodeKShotDetectors:()AXSoundDetectionUIAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226F20000, a2, OS_LOG_TYPE_ERROR, "Error decoding KShot detectors: %@", (uint8_t *)&v2, 0xCu);
}

- (void)encodeKShotDetectors:()AXSoundDetectionUIAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226F20000, a2, OS_LOG_TYPE_ERROR, "Error encoding KShot detectors: %@", (uint8_t *)&v2, 0xCu);
}

- (void)hasCustomToneForKshotDetector:()AXSoundDetectionUIAdditions .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_226F20000, log, OS_LOG_TYPE_ERROR, "Trying to check custom tone for detector identifier that doesn't exist!", v1, 2u);
}

- (void)hasCustomHapticForKshotDetector:()AXSoundDetectionUIAdditions .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_226F20000, log, OS_LOG_TYPE_ERROR, "Trying to check custom haptic for detector identifier that doesn't exist!", v1, 2u);
}

- (void)deleteTrainingFilesForDetector:()AXSoundDetectionUIAdditions .cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_226F20000, v2, v3, "Error deleting training directory for detector: %@ error: %@", v4, v5, v6, v7, v8);
}

- (void)deleteModelForDetector:()AXSoundDetectionUIAdditions .cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_226F20000, v2, v3, "Error deleting model for detector: %@ error: %@", v4, v5, v6, v7, v8);
}

@end