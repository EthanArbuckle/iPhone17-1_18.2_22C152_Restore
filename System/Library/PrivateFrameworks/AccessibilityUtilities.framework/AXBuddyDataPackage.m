@interface AXBuddyDataPackage
+ (BOOL)supportsSecureCoding;
+ (NSDictionary)testData;
+ (id)dataBlobForBuddy;
+ (id)dataPackageForCurrentSettings;
+ (id)deviceClassForBuddy;
+ (id)productVersionForBuddy;
+ (void)dataBlobForBuddy;
+ (void)restoreDataBlobForBuddy:(id)a3;
+ (void)setTestData:(id)a3;
+ (void)setTestData:(id)a3 forModel:(id)a4 hasHomeButton:(BOOL)a5 largeTextUsesExtendedRange:(BOOL)a6;
- (AXBuddyDataPackage)initWithCoder:(id)a3;
- (BOOL)hasHomeButton;
- (BOOL)usesExtendedSlider;
- (NSDictionary)accessibilityOptions;
- (NSString)axModel;
- (NSString)axOSVersion;
- (NSString)axPreferredContentSizeCategoryName;
- (void)applySavedSettings;
- (void)encodeWithCoder:(id)a3;
- (void)processDomainDictionary:(id)a3;
- (void)setAccessibilityOptions:(id)a3;
- (void)setAxModel:(id)a3;
- (void)setAxOSVersion:(id)a3;
- (void)setAxPreferredContentSizeCategoryName:(id)a3;
- (void)setHasHomeButton:(BOOL)a3;
- (void)setUsesExtendedSlider:(BOOL)a3;
@end

@implementation AXBuddyDataPackage

+ (NSDictionary)testData
{
  return (NSDictionary *)(id)Data;
}

+ (void)setTestData:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXBuddyDataPackage)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXBuddyDataPackage;
  v5 = [(AXBuddyDataPackage *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodePropertyListForKey:@"accessibilityOptions"];
    [(AXBuddyDataPackage *)v5 setAccessibilityOptions:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredContentSizeCategoryName"];
    [(AXBuddyDataPackage *)v5 setAxPreferredContentSizeCategoryName:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"axOSVersion"];
    [(AXBuddyDataPackage *)v5 setAxOSVersion:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"axModel"];
    [(AXBuddyDataPackage *)v5 setAxModel:v9];

    -[AXBuddyDataPackage setUsesExtendedSlider:](v5, "setUsesExtendedSlider:", [v4 decodeBoolForKey:@"usesExtendedSlider"]);
    -[AXBuddyDataPackage setHasHomeButton:](v5, "setHasHomeButton:", [v4 decodeBoolForKey:@"AXSHasHomeButton"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(AXBuddyDataPackage *)self accessibilityOptions];
  [v8 encodeObject:v4 forKey:@"accessibilityOptions"];

  v5 = [(AXBuddyDataPackage *)self axPreferredContentSizeCategoryName];
  [v8 encodeObject:v5 forKey:@"preferredContentSizeCategoryName"];

  v6 = [(AXBuddyDataPackage *)self axOSVersion];
  [v8 encodeObject:v6 forKey:@"axOSVersion"];

  v7 = [(AXBuddyDataPackage *)self axModel];
  [v8 encodeObject:v7 forKey:@"axModel"];

  objc_msgSend(v8, "encodeBool:forKey:", -[AXBuddyDataPackage usesExtendedSlider](self, "usesExtendedSlider"), @"usesExtendedSlider");
  objc_msgSend(v8, "encodeBool:forKey:", -[AXBuddyDataPackage hasHomeButton](self, "hasHomeButton"), @"AXSHasHomeButton");
}

+ (id)dataPackageForCurrentSettings
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v32 = objc_alloc_init((Class)a1);
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v2 = +[AXSettings sharedInstance];
  uint64_t v3 = [v2 keysToIgnoreDuringBuddyTransfer];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v4 = objc_alloc(MEMORY[0x1E4F1C978]);
  id obj = (id)objc_msgSend(v4, "initWithObjects:", *MEMORY[0x1E4FB8FD8], *MEMORY[0x1E4FB9338], *MEMORY[0x1E4FB9098], *MEMORY[0x1E4FB9170], *MEMORY[0x1E4FB9380], *MEMORY[0x1E4FB9370], *MEMORY[0x1E4FB93A8], *MEMORY[0x1E4FB9268], *MEMORY[0x1E4FB9320], *MEMORY[0x1E4FB9310], *MEMORY[0x1E4FB9208], 0);
  uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  v33 = (void *)v3;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v37;
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v11 = *(const __CFString **)(*((void *)&v36 + 1) + 8 * i);
        CFArrayRef v12 = CFPreferencesCopyKeyList(v11, v8, v9);
        if (v12)
        {
          CFArrayRef v13 = v12;
          CFDictionaryRef v14 = CFPreferencesCopyMultiple(v12, v11, v8, v9);
          v15 = [(__CFDictionary *)v14 objectForKey:@"AXSIgnoreTrackpad"];

          if (v15)
          {
            v16 = AXLogCommon();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v17 = [(__CFDictionary *)v14 objectForKey:@"AXSIgnoreTrackpad"];
              *(_DWORD *)buf = 138412290;
              v41 = v17;
              _os_log_impl(&dword_18D308000, v16, OS_LOG_TYPE_DEFAULT, "Transferring ignore trackpad setting: %@", buf, 0xCu);

              uint64_t v3 = (uint64_t)v33;
            }
          }
          [(__CFDictionary *)v14 removeObjectsForKeys:v3];
          if (v14) {
            [v34 setObject:v14 forKey:v11];
          }
          CFRelease(v13);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v6);
  }

  [v32 setAccessibilityOptions:v34];
  v18 = (void *)_AXSCopyPreferredContentSizeCategoryName();
  [v32 setAxPreferredContentSizeCategoryName:v18];

  [v32 setUsesExtendedSlider:_AXSLargeTextUsesExtendedRange() != 0];
  v19 = [(id)objc_opt_class() testData];

  if (v19)
  {
    v20 = AXLogSettings();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = [(id)objc_opt_class() testData];
      *(_DWORD *)buf = 138412290;
      v41 = v21;
      _os_log_impl(&dword_18D308000, v20, OS_LOG_TYPE_INFO, "Using test data mode settings: %@", buf, 0xCu);
    }
    v22 = [(id)objc_opt_class() testData];
    v23 = [v22 objectForKey:@"AXSOSVersion"];
    [v32 setAxOSVersion:v23];

    v24 = [(id)objc_opt_class() testData];
    v25 = [v24 objectForKey:@"AXSModel"];
    [v32 setAxModel:v25];

    v26 = [(id)objc_opt_class() testData];
    v27 = [v26 objectForKey:@"AXSUsesExtendedRange"];
    objc_msgSend(v32, "setUsesExtendedSlider:", objc_msgSend(v27, "BOOLValue"));
  }
  else
  {
    v28 = [a1 productVersionForBuddy];
    [v32 setAxOSVersion:v28];

    v29 = [a1 deviceClassForBuddy];
    [v32 setAxModel:v29];

    [v32 setHasHomeButton:AXDeviceHasHomeButton()];
  }

  return v32;
}

+ (void)setTestData:(id)a3 forModel:(id)a4 hasHomeButton:(BOOL)a5 largeTextUsesExtendedRange:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v20[4] = *MEMORY[0x1E4F143B8];
  v19[0] = @"AXSOSVersion";
  v19[1] = @"AXSModel";
  v20[0] = a3;
  v20[1] = a4;
  v19[2] = @"AXSHasHomeButton";
  CFStringRef v9 = NSNumber;
  id v10 = a4;
  id v11 = a3;
  CFArrayRef v12 = [v9 numberWithBool:v7];
  v20[2] = v12;
  v19[3] = @"AXSOSVersion";
  CFArrayRef v13 = [NSNumber numberWithBool:v6];
  v20[3] = v13;
  CFDictionaryRef v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];

  [(id)objc_opt_class() setTestData:v14];
  v15 = AXLogSettings();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = [(id)objc_opt_class() testData];
    int v17 = 138412290;
    v18 = v16;
    _os_log_impl(&dword_18D308000, v15, OS_LOG_TYPE_INFO, "Setting test data mode settings: %@", (uint8_t *)&v17, 0xCu);
  }
}

- (void)applySavedSettings
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = AXLogSettings();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D308000, v3, OS_LOG_TYPE_DEFAULT, "Applying saved settings", buf, 2u);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(AXBuddyDataPackage *)self accessibilityOptions];
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v24 = *(void *)v26;
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v24) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v10 = *(const __CFString **)(*((void *)&v25 + 1) + 8 * i);
        id v11 = [(AXBuddyDataPackage *)self accessibilityOptions];
        CFArrayRef v12 = [v11 objectForKeyedSubscript:v10];

        [(AXBuddyDataPackage *)self processDomainDictionary:v12];
        CFArrayRef v13 = AXLogSettings();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v30 = v10;
          _os_log_impl(&dword_18D308000, v13, OS_LOG_TYPE_DEFAULT, "Applying saved settings domain: %@", buf, 0xCu);
        }

        CFDictionaryRef v14 = AXLogSettings();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v30 = v12;
          _os_log_impl(&dword_18D308000, v14, OS_LOG_TYPE_DEFAULT, "Applying saved settings: %@", buf, 0xCu);
        }

        v15 = [(AXBuddyDataPackage *)self accessibilityOptions];
        CFDictionaryRef v16 = [v15 objectForKeyedSubscript:v10];
        CFPreferencesSetMultiple(v16, 0, v10, v6, v7);

        CFPreferencesSynchronize(v10, v6, v8);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v5);
  }

  int v17 = [(AXBuddyDataPackage *)self axPreferredContentSizeCategoryName];
  if (v17)
  {
    v18 = [(AXBuddyDataPackage *)self axPreferredContentSizeCategoryName];
    _AXSSetPreferredContentSizeCategoryName();
  }
  v19 = AXLogSettings();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v20 = [(AXBuddyDataPackage *)self usesExtendedSlider];
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = v20;
    _os_log_impl(&dword_18D308000, v19, OS_LOG_TYPE_DEFAULT, "Uses extended slider: %d", buf, 8u);
  }

  [(AXBuddyDataPackage *)self usesExtendedSlider];
  _AXSSetLargeTextUsesExtendedRange();
  v21 = AXLogSettings();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = _AXSLargeTextUsesExtendedRange();
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = v22;
    _os_log_impl(&dword_18D308000, v21, OS_LOG_TYPE_DEFAULT, "Saved extended range: %d", buf, 8u);
  }
}

+ (id)productVersionForBuddy
{
  return (id)MEMORY[0x1F417CE38](@"ProductVersion", a2);
}

+ (id)deviceClassForBuddy
{
  return (id)MEMORY[0x1F417CE38](@"DeviceClass", a2);
}

- (void)processDomainDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[AXBuddyDataPackage deviceClassForBuddy];
  CFStringRef v6 = +[AXBuddyDataPackage productVersionForBuddy];
  CFStringRef v7 = [NSNumber numberWithBool:AXDeviceHasHomeButton()];
  uint64_t v8 = [(id)objc_opt_class() testData];
  if (v8)
  {
    CFStringRef v9 = (void *)v8;
    int v10 = _AXSInUnitTestMode();

    if (v10)
    {
      id v11 = [(id)objc_opt_class() testData];
      uint64_t v12 = [v11 objectForKey:@"AXSOSVersion"];

      CFArrayRef v13 = [(id)objc_opt_class() testData];
      uint64_t v14 = [v13 objectForKey:@"AXSModel"];

      v15 = [(id)objc_opt_class() testData];
      uint64_t v16 = [v15 objectForKey:@"AXSHasHomeButton"];

      CFStringRef v7 = (void *)v16;
      CFStringRef v6 = (void *)v12;
      uint64_t v5 = (void *)v14;
    }
  }
  uint64_t v17 = [(AXBuddyDataPackage *)self axModel];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(AXBuddyDataPackage *)self axModel];
    char v20 = [v5 isEqualToString:v19];

    if ((v20 & 1) == 0) {
      [v4 removeObjectForKey:*MEMORY[0x1E4F482A0]];
    }
  }
  v21 = (void *)MEMORY[0x1E4FB9340];
  int v22 = [v4 objectForKey:*MEMORY[0x1E4FB9340]];
  if (!v22
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (![v22 count]
     || [v22 count] == 1 && objc_msgSend(v22, "containsObject:", &unk_1EDC62CA0)))
  {
    v23 = AXLogSettings();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      long long v26 = v22;
      _os_log_impl(&dword_18D308000, v23, OS_LOG_TYPE_DEFAULT, "Removing TC options because its empty or only has buddy settings: %@", (uint8_t *)&v25, 0xCu);
    }

    [v4 removeObjectForKey:*v21];
  }
  if (([v7 BOOLValue] & 1) == 0 && -[AXBuddyDataPackage hasHomeButton](self, "hasHomeButton")
    || [v7 BOOLValue] && !-[AXBuddyDataPackage hasHomeButton](self, "hasHomeButton"))
  {
    uint64_t v24 = AXLogSettings();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_18D308000, v24, OS_LOG_TYPE_DEFAULT, "Removing Reduce motion preference from domain dict because home button changed", (uint8_t *)&v25, 2u);
    }

    [v4 removeObjectForKey:*MEMORY[0x1E4FB9298]];
  }
  [v4 removeObjectForKey:*MEMORY[0x1E4FB9398]];
}

+ (id)dataBlobForBuddy
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = +[AXBuddyDataPackage dataPackageForCurrentSettings];
  id v10 = 0;
  uint64_t v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v10];
  id v4 = v10;
  uint64_t v5 = AXLogSettings();
  CFStringRef v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[AXBuddyDataPackage dataBlobForBuddy];
    }

    id v7 = 0;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v3 length];
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v8;
      _os_log_impl(&dword_18D308000, v6, OS_LOG_TYPE_INFO, "Archived data blob for buddy with size %lu", buf, 0xCu);
    }

    id v7 = v3;
  }

  return v7;
}

+ (void)restoreDataBlobForBuddy:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  id v10 = 0;
  uint64_t v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v10];

  id v6 = v10;
  id v7 = AXLogSettings();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[AXBuddyDataPackage restoreDataBlobForBuddy:]((uint64_t)v6, v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CFStringRef v9 = 0;
      _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_INFO, "Unarchived data blob for buddy", v9, 2u);
    }

    [v5 applySavedSettings];
  }
}

- (NSDictionary)accessibilityOptions
{
  return self->_accessibilityOptions;
}

- (void)setAccessibilityOptions:(id)a3
{
}

- (NSString)axOSVersion
{
  return self->_axOSVersion;
}

- (void)setAxOSVersion:(id)a3
{
}

- (NSString)axModel
{
  return self->_axModel;
}

- (void)setAxModel:(id)a3
{
}

- (BOOL)hasHomeButton
{
  return self->_hasHomeButton;
}

- (void)setHasHomeButton:(BOOL)a3
{
  self->_hasHomeButton = a3;
}

- (NSString)axPreferredContentSizeCategoryName
{
  return self->_axPreferredContentSizeCategoryName;
}

- (void)setAxPreferredContentSizeCategoryName:(id)a3
{
}

- (BOOL)usesExtendedSlider
{
  return self->_usesExtendedSlider;
}

- (void)setUsesExtendedSlider:(BOOL)a3
{
  self->_usesExtendedSlider = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axPreferredContentSizeCategoryName, 0);
  objc_storeStrong((id *)&self->_axModel, 0);
  objc_storeStrong((id *)&self->_axOSVersion, 0);

  objc_storeStrong((id *)&self->_accessibilityOptions, 0);
}

+ (void)dataBlobForBuddy
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "Error archiving data blob for buddy: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)restoreDataBlobForBuddy:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving data blob from buddy: %@", (uint8_t *)&v2, 0xCu);
}

@end