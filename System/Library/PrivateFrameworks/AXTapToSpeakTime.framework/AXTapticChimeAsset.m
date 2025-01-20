@interface AXTapticChimeAsset
+ (id)_assetPathForChimeSoundType:(int64_t)a3 fileName:(id)a4;
+ (id)hourAssetForType:(int64_t)a3 hour:(unint64_t)a4;
+ (id)quarterHourAssetForType:(int64_t)a3;
- (NSArray)hapticAtomEntries;
- (NSDictionary)hapticDictionary;
- (NSString)audioFilePath;
- (double)prePlayTimeInterval;
- (float)volume;
- (id)_initWithChimeSoundType:(int64_t)a3 audioFilePath:(id)a4 hapticsFilePath:(id)a5;
- (id)description;
- (unsigned)createSystemSoundIDForStartTime:(double)a3;
@end

@implementation AXTapticChimeAsset

+ (id)_assetPathForChimeSoundType:(int64_t)a3 fileName:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__AXTapticChimeAsset__assetPathForChimeSoundType_fileName___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (_assetPathForChimeSoundType_fileName__onceToken != -1) {
      dispatch_once(&_assetPathForChimeSoundType_fileName__onceToken, block);
    }
    v7 = @"Birds";
    if (a3 != 2) {
      v7 = 0;
    }
    if (a3 == 1) {
      v8 = @"Bells";
    }
    else {
      v8 = v7;
    }
    v9 = [(id)_assetPathForChimeSoundType_fileName__baseChimeAssetsDirectory stringByAppendingPathComponent:v8];
    v10 = [v9 stringByAppendingPathComponent:v6];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __59__AXTapticChimeAsset__assetPathForChimeSoundType_fileName___block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x263F086E0] bundleForClass:*(void *)(a1 + 32)];
  v1 = [v4 bundlePath];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"ChimeAssets"];
  v3 = (void *)_assetPathForChimeSoundType_fileName__baseChimeAssetsDirectory;
  _assetPathForChimeSoundType_fileName__baseChimeAssetsDirectory = v2;
}

+ (id)hourAssetForType:(int64_t)a3 hour:(unint64_t)a4
{
  if (a3 == 2)
  {
    if (a4 % 0xC) {
      unint64_t v9 = a4 % 0xC;
    }
    else {
      unint64_t v9 = 12;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"Bird%02d.caf", v9);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(NSString, "stringWithFormat:", @"Bird%02d.plist", v9);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 1) {
      v7 = @"Bell.plist";
    }
    else {
      v7 = 0;
    }
    if (a3 == 1) {
      v8 = @"Bell.caf";
    }
    else {
      v8 = 0;
    }
  }
  v10 = [a1 _assetPathForChimeSoundType:a3 fileName:v8];
  uint64_t v11 = [a1 _assetPathForChimeSoundType:a3 fileName:v7];
  v12 = (void *)v11;
  if (v10 && v11)
  {
    id v13 = [[AXTapticChimeAsset alloc] _initWithChimeSoundType:a3 audioFilePath:v10 hapticsFilePath:v11];
  }
  else
  {
    v14 = AXLogTapticTime();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      +[AXTapticChimeAsset hourAssetForType:hour:](a3, a4, v14);
    }

    id v13 = 0;
  }

  return v13;
}

+ (id)quarterHourAssetForType:(int64_t)a3
{
  v5 = @"QuarterBell.plist";
  if (a3 != 1) {
    v5 = 0;
  }
  if (a3 == 2) {
    id v6 = @"QuarterBird.plist";
  }
  else {
    id v6 = v5;
  }
  v7 = objc_msgSend(a1, "_assetPathForChimeSoundType:fileName:");
  uint64_t v8 = [a1 _assetPathForChimeSoundType:a3 fileName:v6];
  unint64_t v9 = (void *)v8;
  if (v7 && v8)
  {
    id v10 = [[AXTapticChimeAsset alloc] _initWithChimeSoundType:a3 audioFilePath:v7 hapticsFilePath:v8];
  }
  else
  {
    uint64_t v11 = AXLogTapticTime();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      +[AXTapticChimeAsset quarterHourAssetForType:](a3, v11);
    }

    id v10 = 0;
  }

  return v10;
}

- (id)_initWithChimeSoundType:(int64_t)a3 audioFilePath:(id)a4 hapticsFilePath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AXTapticChimeAsset;
  id v10 = [(AXTapticChimeAsset *)&v20 init];
  AXSVoiceOverTapticChimesVolumeForSoundType();
  v10->_volume = v11;
  objc_storeStrong((id *)&v10->_audioFilePath, a4);
  uint64_t v12 = [NSDictionary dictionaryWithContentsOfFile:v9];
  hapticDictionary = v10->_hapticDictionary;
  v10->_hapticDictionary = (NSDictionary *)v12;

  if (!v10->_hapticDictionary)
  {
    v14 = AXLogTapticTime();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[AXTapticChimeAsset _initWithChimeSoundType:audioFilePath:hapticsFilePath:]((uint64_t)v9, v14);
    }
  }
  v10->_prePlayTimeInterval = 0.0;
  v15 = [(AXTapticChimeAsset *)v10 hapticAtomEntries];
  v16 = [v15 lastObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [v16 objectForKey:@"StartTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v17 doubleValue];
      v10->_prePlayTimeInterval = v18;
    }
  }
  return v10;
}

- (NSArray)hapticAtomEntries
{
  uint64_t v2 = [(AXTapticChimeAsset *)self hapticDictionary];
  v3 = [v2 objectForKeyedSubscript:@"Atoms"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (unsigned)createSystemSoundIDForStartTime:(double)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [(AXTapticChimeAsset *)self hapticAtomEntries];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        float v11 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"StartTime"];
        id v13 = NSNumber;
        [v12 doubleValue];
        v15 = [v13 numberWithDouble:v14 + a3];
        [v11 setObject:v15 forKeyedSubscript:@"StartTime"];

        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v8);
  }

  v16 = (void *)MEMORY[0x263EFF9A0];
  v17 = [(AXTapticChimeAsset *)self hapticDictionary];
  double v18 = [v16 dictionaryWithDictionary:v17];

  [v18 setObject:v5 forKeyedSubscript:@"Atoms"];
  uint64_t v29 = *MEMORY[0x263EFC0E8];
  v30 = v18;
  [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  AudioServicesCreateSystemSoundIDWithOptions();
  v19 = AXLogTapticTime();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v26 = 0;
    __int16 v27 = 2112;
    v28 = v18;
    _os_log_impl(&dword_2352E7000, v19, OS_LOG_TYPE_INFO, "created system sound id: %u, with haptic dictionary: %@", buf, 0x12u);
  }

  return 0;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(AXTapticChimeAsset *)self audioFilePath];
  [(AXTapticChimeAsset *)self volume];
  double v8 = v7;
  [(AXTapticChimeAsset *)self prePlayTimeInterval];
  uint64_t v10 = v9;
  float v11 = [(AXTapticChimeAsset *)self hapticDictionary];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; audioFilePath = \"%@\", volume = \"%f\", prePlayTimeInterval = \"%f\" hapticDictionary = \"%@\">",
    v5,
    self,
    v6,
    *(void *)&v8,
    v10,
  uint64_t v12 = v11);

  return v12;
}

- (NSString)audioFilePath
{
  return self->_audioFilePath;
}

- (double)prePlayTimeInterval
{
  return self->_prePlayTimeInterval;
}

- (float)volume
{
  return self->_volume;
}

- (NSDictionary)hapticDictionary
{
  return self->_hapticDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticDictionary, 0);
  objc_storeStrong((id *)&self->_audioFilePath, 0);
}

+ (void)hourAssetForType:(os_log_t)log hour:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_2352E7000, log, OS_LOG_TYPE_FAULT, "failed to find asset for sound type: %li, hour: %lu", (uint8_t *)&v3, 0x16u);
}

+ (void)quarterHourAssetForType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_2352E7000, a2, OS_LOG_TYPE_FAULT, "failed to find quarter hour asset for sound type: %li", (uint8_t *)&v2, 0xCu);
}

- (void)_initWithChimeSoundType:(uint64_t)a1 audioFilePath:(NSObject *)a2 hapticsFilePath:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_2352E7000, a2, OS_LOG_TYPE_FAULT, "empty haptic dictionary at path: %@", (uint8_t *)&v2, 0xCu);
}

@end