@interface BUCellularSettings
+ (BOOL)shouldShowCellularAutomaticDownloadsSwitch;
+ (id)_copyValueForCarrierBundleKey:(id)a3;
+ (id)settingsForIdentity:(id)a3;
- (BOOL)allowAutomaticDownloads;
- (BOOL)legacyAllowAutomaticDownloads;
- (BUCellularSettings)initWithDefaultsKey:(id)a3;
- (id)_cellularSettings;
- (int64_t)cellularDataPrompt;
- (void)setAllowAutomaticDownloads:(BOOL)a3;
- (void)setCellularDataPrompt:(int64_t)a3;
@end

@implementation BUCellularSettings

+ (id)settingsForIdentity:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v8 = objc_msgSend_defaultsKey(v4, v6, v7);

  v10 = objc_msgSend_initWithDefaultsKey_(v5, v9, (uint64_t)v8);

  return v10;
}

- (BUCellularSettings)initWithDefaultsKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BUCellularSettings;
  v6 = [(BUCellularSettings *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_defaultsKey, a3);
  }

  return v7;
}

- (BOOL)allowAutomaticDownloads
{
  return CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", @"com.apple.iBooks", 0) != 0;
}

- (void)setAllowAutomaticDownloads:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(@"AllowAutoDownloadOnCellular", v3, @"com.apple.iBooks");
}

- (BOOL)legacyAllowAutomaticDownloads
{
  return CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", @"com.apple.itunesstored", 0) != 0;
}

- (int64_t)cellularDataPrompt
{
  id v4 = objc_msgSend__cellularSettings(self, a2, v2);
  v6 = objc_msgSend_objectForKey_(v4, v5, (uint64_t)self->_defaultsKey);
  v8 = objc_msgSend_objectForKey_(v6, v7, @"CellularDataPrompt");
  if (objc_msgSend_isEqualToString_(v8, v9, @"Always"))
  {
    int64_t v11 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v8, v10, @"OverLimit"))
  {
    int64_t v11 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v8, v12, @"Never"))
  {
    int64_t v11 = 2;
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (void)setCellularDataPrompt:(int64_t)a3
{
  objc_msgSend__cellularSettings(self, a2, a3);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_objectForKey_(v15, v5, (uint64_t)self->_defaultsKey);
  id v7 = objc_alloc(MEMORY[0x263EFF9A0]);
  objc_super v9 = objc_msgSend_initWithDictionary_(v7, v8, (uint64_t)v15);
  id v10 = objc_alloc(MEMORY[0x263EFF9A0]);
  v12 = objc_msgSend_initWithDictionary_(v10, v11, (uint64_t)v6);
  objc_msgSend_setObject_forKey_(v9, v13, (uint64_t)v12, self->_defaultsKey);
  if ((unint64_t)a3 <= 2) {
    objc_msgSend_setObject_forKey_(v12, v14, (uint64_t)off_26449DA00[a3], @"CellularDataPrompt");
  }
  CFPreferencesSetAppValue(@"CellularSettings", v9, @"com.apple.iBooks");
}

+ (BOOL)shouldShowCellularAutomaticDownloadsSwitch
{
  uint64_t v2 = objc_opt_class();
  id v4 = objc_msgSend__copyValueForCarrierBundleKey_(v2, v3, @"ShowiTunesStoreAutoDownloadOverCellularSwitch");
  if (v4)
  {
    if (objc_opt_respondsToSelector()) {
      char v7 = objc_msgSend_BOOLValue(v4, v5, v6);
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (id)_cellularSettings
{
  uint64_t v2 = (void *)CFPreferencesCopyValue(@"CellularSettings", @"com.apple.iBooks", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);

  return v2;
}

+ (id)_copyValueForCarrierBundleKey:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F02D30]);
  uint64_t v6 = objc_msgSend_initWithQueue_(v4, v5, 0);
  id v20 = 0;
  v8 = objc_msgSend_getCurrentDataSubscriptionContextSync_(v6, v7, (uint64_t)&v20);
  id v9 = v20;
  if (v8)
  {
    id v10 = objc_alloc(MEMORY[0x263F02C20]);
    v12 = objc_msgSend_initWithBundleType_(v10, v11, 1);
    id v19 = v9;
    v14 = objc_msgSend_copyCarrierBundleValue_key_bundleType_error_(v6, v13, (uint64_t)v8, v3, v12, &v19);
    id v15 = v19;

    id v9 = v15;
  }
  else
  {
    v12 = BookUtilityLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_21E1F0C1C((uint64_t)v9, v12);
    }
    v14 = 0;
  }

  if (v9)
  {
    BookUtilityLog();
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      sub_21E1F0B58(v9, v16, v17);
    }
  }
  return v14;
}

- (void).cxx_destruct
{
}

@end