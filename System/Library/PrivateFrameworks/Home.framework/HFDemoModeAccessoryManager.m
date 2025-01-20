@interface HFDemoModeAccessoryManager
+ (BOOL)isInternalAccessoryType:(id)a3;
+ (BOOL)isPressDemoModeEnabled;
+ (BOOL)isValidExternalType:(id)a3;
+ (id)_clipStartDateFromComponents:(id)a3 today:(id)a4;
+ (id)_demoClipWithURL:(id)a3 duration:(double)a4 cameraProfile:(id)a5;
+ (id)_eventsFromString:(id)a3 startDate:(id)a4 cameraProfile:(id)a5;
+ (id)accessoryProfileName:(id)a3;
+ (id)accessoryWithContentsOfDictionary:(id)a3 forHome:(id)a4;
+ (id)clipsForCameraProfile:(id)a3;
+ (id)configurationProfileFromAccessoryType:(id)a3;
+ (id)demoLiveStreamURLForCameraName:(id)a3;
+ (id)demoModeDirectoryURL;
+ (id)demoSnapshotURLForCameraName:(id)a3;
+ (id)demoURLWithCameraName:(id)a3 fileName:(id)a4 extension:(id)a5;
+ (id)imageIconDescriptorFromDictionary:(id)a3;
+ (id)profileURLForDemoModeAccessoryName:(id)a3;
+ (id)sharedManager;
- (HFCharacteristicValueSource)valueSource;
- (HFDemoModeAccessoryManager)initWithNullValueSource:(id)a3;
- (NSArray)demoAccessories;
- (id)accessories;
- (void)dispatchUpdateMessageForAccessory:(id)a3;
- (void)saveAccessories;
- (void)setDemoAccessories:(id)a3;
@end

@implementation HFDemoModeAccessoryManager

+ (id)sharedManager
{
  if (qword_26AB2EBB8 != -1) {
    dispatch_once(&qword_26AB2EBB8, &__block_literal_global);
  }
  v2 = (void *)_MergedGlobals_207;
  return v2;
}

void __43__HFDemoModeAccessoryManager_sharedManager__block_invoke()
{
  v2 = objc_alloc_init(HFNullValueSource);
  v0 = [[HFDemoModeAccessoryManager alloc] initWithNullValueSource:v2];
  v1 = (void *)_MergedGlobals_207;
  _MergedGlobals_207 = (uint64_t)v0;
}

- (HFDemoModeAccessoryManager)initWithNullValueSource:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFDemoModeAccessoryManager;
  v6 = [(HFDemoModeAccessoryManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_valueSource, a3);
    BOOL v8 = +[HFUtilities isAMac];
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    v10 = v9;
    v11 = (void *)MEMORY[0x263F1D0D8];
    if (v8) {
      v11 = (void *)MEMORY[0x263F1D0E0];
    }
    [v9 addObserver:v7 selector:sel_saveAccessories name:*v11 object:0];
  }
  return v7;
}

+ (id)accessoryProfileName:(id)a3
{
  return (id)[NSString stringWithFormat:@"AccessoryProfile-%@", a3];
}

+ (BOOL)isValidExternalType:(id)a3
{
  return 1;
}

+ (BOOL)isInternalAccessoryType:(id)a3
{
  v7[6] = *MEMORY[0x263EF8340];
  v7[0] = @"HomePod";
  v7[1] = @"HomePodMini";
  v7[2] = @"MediaSystem-HomePod";
  v7[3] = @"MediaSystem-HomePodMini";
  v7[4] = @"AppleTV";
  v7[5] = @"Generic";
  v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a3;
  id v5 = [v3 arrayWithObjects:v7 count:6];
  LOBYTE(v3) = [v5 containsObject:v4];

  return (char)v3;
}

+ (id)configurationProfileFromAccessoryType:(id)a3
{
  id v4 = a3;
  id v5 = [a1 accessoryProfileName:v4];
  char v6 = [a1 isInternalAccessoryType:v4];

  if ((v6 & 1) != 0 || ([a1 isValidExternalType:v5] & 1) == 0)
  {
    BOOL v8 = [MEMORY[0x263F086E0] bundleForClass:a1];
    v7 = [v8 URLForResource:v5 withExtension:@"plist"];
  }
  else
  {
    v7 = [a1 profileURLForDemoModeAccessoryName:v5];
  }
  v9 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v7];

  return v9;
}

+ (id)accessoryWithContentsOfDictionary:(id)a3 forHome:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"type"];
  v9 = (void *)v8;
  v10 = @"Generic";
  if (v8) {
    v10 = (__CFString *)v8;
  }
  v11 = v10;

  v12 = [a1 configurationProfileFromAccessoryType:v11];

  objc_super v13 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v12];
  [v13 setValuesForKeysWithDictionary:v7];

  v14 = +[HFDemoModeAccessory accessoryWithContentsOfDictionary:v13 forHome:v6];

  return v14;
}

+ (id)profileURLForDemoModeAccessoryName:(id)a3
{
  id v3 = a3;
  id v4 = +[HFDemoModeAccessoryManager demoModeDirectoryURL];
  id v5 = [NSString stringWithFormat:@"%@.plist", v3];

  id v6 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  id v7 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v6];

  uint64_t v8 = [NSURL URLWithString:v7 relativeToURL:v4];

  return v8;
}

- (id)accessories
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  demoAccessories = self->_demoAccessories;
  if (demoAccessories)
  {
    id v3 = demoAccessories;
  }
  else
  {
    id v5 = (void *)CFPreferencesCopyAppValue(@"HFDemoModeAccessories", @"com.apple.Home");
    if (v5)
    {
      v26 = self;
      id v6 = +[HFHomeKitDispatcher sharedDispatcher];
      v33 = [v6 home];

      v32 = [MEMORY[0x263F08850] defaultManager];
      v29 = [MEMORY[0x263EFF9C0] set];
      v31 = +[HFDemoModeAccessoryManager demoModeDirectoryURL];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v27 = v5;
      id obj = v5;
      uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v30 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v35 != v30) {
              objc_enumerationMutation(obj);
            }
            v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            v11 = [v10 objectForKeyedSubscript:@"name"];
            v12 = [v10 objectForKeyedSubscript:@"type"];
            objc_super v13 = [NSString stringWithFormat:@"%@_%@.plist", v11, v12];
            v14 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
            v15 = [v13 stringByAddingPercentEncodingWithAllowedCharacters:v14];

            v16 = [NSURL URLWithString:v15 relativeToURL:v31];
            v17 = [v16 path];
            int v18 = [v32 fileExistsAtPath:v17];

            if (v18)
            {
              v19 = [NSDictionary dictionaryWithContentsOfURL:v16];
            }
            else
            {
              v19 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v10];
              [v19 setObject:v15 forKeyedSubscript:@"fileName"];
            }
            v20 = +[HFDemoModeAccessoryManager accessoryWithContentsOfDictionary:v19 forHome:v33];
            if (v20) {
              [v29 addObject:v20];
            }
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v8);
      }

      v21 = (void *)MEMORY[0x263EFF980];
      v22 = [v29 allObjects];
      uint64_t v23 = [v21 arrayWithArray:v22];
      v24 = v26->_demoAccessories;
      v26->_demoAccessories = (NSArray *)v23;

      id v3 = (NSArray *)[(NSArray *)v26->_demoAccessories copy];
      id v5 = v27;
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

- (void)saveAccessories
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = +[HFDemoModeAccessoryManager demoModeDirectoryURL];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(HFDemoModeAccessoryManager *)self demoAccessories];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v9 = [v8 applicationData];
        v10 = [v9 objectForKeyedSubscript:@"fileName"];

        v11 = [NSURL URLWithString:v10 relativeToURL:v3];
        v12 = [v8 applicationData];
        objc_super v13 = [v12 dictionary];
        [v13 writeToURL:v11 atomically:1];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

+ (id)demoModeDirectoryURL
{
  return +[HFUtilities cachesDirectoryURL];
}

+ (BOOL)isPressDemoModeEnabled
{
  return +[HFUtilities isPressDemoModeEnabled];
}

+ (id)imageIconDescriptorFromDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"icon"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"type"];

  if (+[HFDemoModeAccessoryManager isInternalAccessoryType:v5])
  {
    uint64_t v6 = [[HFImageIconDescriptor alloc] initWithImageIdentifier:v4];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v8 = [NSString stringWithFormat:@"%@", v4];
    v9 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
    v10 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:v9];

    v11 = NSURL;
    v12 = +[HFDemoModeAccessoryManager demoModeDirectoryURL];
    objc_super v13 = [v11 URLWithString:v10 relativeToURL:v12];

    v14 = [v13 path];
    int v15 = [v7 fileExistsAtPath:v14];

    long long v16 = [HFImageIconDescriptor alloc];
    long long v17 = v16;
    if (v15)
    {
      long long v18 = [v13 path];
      uint64_t v6 = [(HFImageIconDescriptor *)v17 initWithDemoModeImageIdentifier:v18];
    }
    else
    {
      uint64_t v6 = [(HFImageIconDescriptor *)v16 initWithImageIdentifier:@"HFImageIconIdentifierGeneric"];
    }
  }
  return v6;
}

- (void)dispatchUpdateMessageForAccessory:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[HFHomeKitDispatcher sharedDispatcher];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__HFDemoModeAccessoryManager_dispatchUpdateMessageForAccessory___block_invoke;
  v6[3] = &unk_26408C938;
  id v7 = v3;
  id v5 = v3;
  [v4 dispatchAccessoryObserverMessage:v6 sender:0];
}

void __64__HFDemoModeAccessoryManager_dispatchUpdateMessageForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didUpdateDemoModeStateForAccessory:*(void *)(a1 + 32)];
  }
}

+ (id)demoSnapshotURLForCameraName:(id)a3
{
  return (id)[a1 demoURLWithCameraName:a3 fileName:@"snapshot" extension:@"png"];
}

+ (id)demoLiveStreamURLForCameraName:(id)a3
{
  return (id)[a1 demoURLWithCameraName:a3 fileName:@"live" extension:@"mov"];
}

+ (id)demoURLWithCameraName:(id)a3 fileName:(id)a4 extension:(id)a5
{
  id v5 = [NSString stringWithFormat:@"%@/%@.%@", a3, a4, a5];
  uint64_t v6 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  id v7 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v6];

  uint64_t v8 = NSURL;
  v9 = +[HFUtilities demoModeDirectoryURL];
  v10 = [v8 URLWithString:v7 relativeToURL:v9];

  return v10;
}

+ (id)clipsForCameraProfile:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = NSString;
  id v7 = [v4 accessory];
  uint64_t v8 = [v7 name];
  v9 = [v6 stringWithFormat:@"%@/clips", v8];

  v10 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  v11 = [v9 stringByAddingPercentEncodingWithAllowedCharacters:v10];

  v12 = NSURL;
  objc_super v13 = +[HFUtilities demoModeDirectoryURL];
  v14 = [v12 URLWithString:v11 relativeToURL:v13];

  int v15 = [MEMORY[0x263F08850] defaultManager];
  long long v16 = [v14 path];
  id v29 = 0;
  long long v17 = [v15 contentsOfDirectoryAtPath:v16 error:&v29];
  id v18 = v29;

  if (v18)
  {
    v19 = HFLogForCategory(0x21uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v14;
      _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "Failure getting contents of directory:%@", buf, 0xCu);
    }

    id v20 = v5;
  }
  else
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __52__HFDemoModeAccessoryManager_clipsForCameraProfile___block_invoke;
    v24[3] = &unk_26408C960;
    id v25 = v14;
    id v28 = a1;
    id v26 = v4;
    id v21 = v5;
    id v27 = v21;
    [v17 enumerateObjectsUsingBlock:v24];
    [v21 sortUsingComparator:&__block_literal_global_67];
    id v22 = v21;
  }
  return v5;
}

void __52__HFDemoModeAccessoryManager_clipsForCameraProfile___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [NSString stringWithFormat:@"/%@", a2];
  id v5 = [v3 URLByAppendingPathComponent:v4];

  uint64_t v6 = [MEMORY[0x263EFA470] assetWithURL:v5];
  id v7 = v6;
  if (v6) {
    [v6 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  uint64_t v8 = [*(id *)(a1 + 56) _demoClipWithURL:v5 duration:*(void *)(a1 + 40) cameraProfile:CMTimeGetSeconds(&time)];
  if (v8)
  {
    v9 = +[HFCameraImageManager sharedManager];
    [v9 generateDemoPosterFramesForAsset:v7 forClip:v8];

    [*(id *)(a1 + 48) addObject:v8];
  }
}

uint64_t __52__HFDemoModeAccessoryManager_clipsForCameraProfile___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 dateOfOccurrence];
  uint64_t v6 = [v4 dateOfOccurrence];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)_demoClipWithURL:(id)a3 duration:(double)a4 cameraProfile:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 lastPathComponent];
  v11 = [v10 stringByReplacingOccurrencesOfString:@".mov" withString:&stru_26C081158];

  v12 = [v11 componentsSeparatedByString:@"_"];
  if ((unint64_t)[v12 count] > 3)
  {
    objc_super v13 = [MEMORY[0x263EFF910] date];
    int v15 = [a1 _clipStartDateFromComponents:v12 today:v13];
    long long v16 = v15;
    if (v15 && ([v15 timeIntervalSinceDate:v13], v17 <= 0.0))
    {
      v19 = [v12 lastObject];
      id v18 = [a1 _eventsFromString:v19 startDate:v16 cameraProfile:v9];

      v14 = (void *)[objc_alloc(MEMORY[0x263F0E2C8]) initWithClipURL:v8 startDate:v16 duration:v18 significantEvents:a4];
      id v20 = HFLogForCategory(0x21uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412546;
        id v23 = v14;
        __int16 v24 = 2112;
        id v25 = v8;
        _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "Creating demo clip:%@ from path:%@", (uint8_t *)&v22, 0x16u);
      }
    }
    else
    {
      id v18 = HFLogForCategory(0x21uLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412546;
        id v23 = v16;
        __int16 v24 = 2112;
        id v25 = v8;
        _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "Invalid start date:%@ for url:%@. Unable to create demo clip.", (uint8_t *)&v22, 0x16u);
      }
      v14 = 0;
    }
  }
  else
  {
    objc_super v13 = HFLogForCategory(0x21uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v8;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "Invalid url:%@. Unable to create demo clip.", (uint8_t *)&v22, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

+ (id)_clipStartDateFromComponents:(id)a3 today:(id)a4
{
  id v5 = (void *)MEMORY[0x263EFF910];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(v5, "hf_sharedCalendar");
  id v9 = [v8 components:156 fromDate:v6];

  v10 = [v7 objectAtIndexedSubscript:0];
  objc_msgSend(v9, "setDay:", objc_msgSend(v9, "day") - objc_msgSend(v10, "integerValue"));

  v11 = [v7 objectAtIndexedSubscript:1];
  objc_msgSend(v9, "setHour:", objc_msgSend(v11, "integerValue"));

  v12 = [v7 objectAtIndexedSubscript:2];

  objc_msgSend(v9, "setMinute:", objc_msgSend(v12, "integerValue"));
  objc_super v13 = [v8 dateFromComponents:v9];

  return v13;
}

+ (id)_eventsFromString:(id)a3 startDate:(id)a4 cameraProfile:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263EFF9C0] set];
  if ([v7 containsString:@"h"])
  {
    id v11 = objc_alloc(MEMORY[0x263F0E1C0]);
    v12 = [MEMORY[0x263F08C38] UUID];
    objc_super v13 = [v9 uuid];
    v14 = [MEMORY[0x263F08C38] UUID];
    int v15 = (void *)[v11 initWithUniqueIdentifier:v12 reason:2 dateOfOccurrence:v8 confidenceLevel:100 cameraProfileUUID:v13 faceClassification:0 timeOffsetWithinClip:0.0 clipUUID:v14];

    [v10 addObject:v15];
  }
  if ([v7 containsString:@"a"])
  {
    id v16 = objc_alloc(MEMORY[0x263F0E1C0]);
    double v17 = [MEMORY[0x263F08C38] UUID];
    id v18 = [v9 uuid];
    v19 = [MEMORY[0x263F08C38] UUID];
    id v20 = (void *)[v16 initWithUniqueIdentifier:v17 reason:3 dateOfOccurrence:v8 confidenceLevel:100 cameraProfileUUID:v18 faceClassification:0 timeOffsetWithinClip:0.0 clipUUID:v19];

    [v10 addObject:v20];
  }
  if ([v7 containsString:@"v"])
  {
    id v21 = objc_alloc(MEMORY[0x263F0E1C0]);
    int v22 = [MEMORY[0x263F08C38] UUID];
    id v23 = [v9 uuid];
    __int16 v24 = [MEMORY[0x263F08C38] UUID];
    id v25 = (void *)[v21 initWithUniqueIdentifier:v22 reason:4 dateOfOccurrence:v8 confidenceLevel:100 cameraProfileUUID:v23 faceClassification:0 timeOffsetWithinClip:0.0 clipUUID:v24];

    [v10 addObject:v25];
  }
  if ([v7 containsString:@"p"])
  {
    id v26 = objc_alloc(MEMORY[0x263F0E1C0]);
    id v27 = [MEMORY[0x263F08C38] UUID];
    id v28 = [v9 uuid];
    id v29 = [MEMORY[0x263F08C38] UUID];
    uint64_t v30 = (void *)[v26 initWithUniqueIdentifier:v27 reason:5 dateOfOccurrence:v8 confidenceLevel:100 cameraProfileUUID:v28 faceClassification:0 timeOffsetWithinClip:0.0 clipUUID:v29];

    [v10 addObject:v30];
  }

  return v10;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (NSArray)demoAccessories
{
  return self->_demoAccessories;
}

- (void)setDemoAccessories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoAccessories, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
}

@end