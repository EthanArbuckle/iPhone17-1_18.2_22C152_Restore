@interface AMSUIDCellularDataInquiry
+ (NSURL)settingsURL;
- (AMSUIDCellularDataInquiry)init;
- (AMSUIDCellularDataInquiry)initWithBundle:(id)a3;
- (BOOL)isEnabledForBundle;
- (BOOL)isEnabledForDevice;
- (BOOL)isSupported;
- (NSBundle)bundle;
@end

@implementation AMSUIDCellularDataInquiry

- (AMSUIDCellularDataInquiry)initWithBundle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIDCellularDataInquiry;
  v6 = [(AMSUIDCellularDataInquiry *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundle, a3);
  }

  return v7;
}

- (AMSUIDCellularDataInquiry)init
{
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [(AMSUIDCellularDataInquiry *)self initWithBundle:v3];

  return v4;
}

+ (NSURL)settingsURL
{
  return (NSURL *)[MEMORY[0x1E4F92E18] preferencesURL];
}

- (BOOL)isSupported
{
  return [MEMORY[0x1E4F92E18] deviceSupportsCellularData];
}

- (BOOL)isEnabledForDevice
{
  int v2 = [(AMSUIDCellularDataInquiry *)self isSupported];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F92E18];
    LOBYTE(v2) = [v3 isEnabled];
  }
  return v2;
}

- (BOOL)isEnabledForBundle
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AMSUIDCellularDataInquiry *)self isEnabledForDevice];
  if (v3)
  {
    CFDictionaryRef v4 = (const __CFDictionary *)_CTServerConnectionCreateOnTargetQueue();
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      v6 = [(AMSUIDCellularDataInquiry *)self bundle];
      v7 = [v6 bundleIdentifier];

      uint64_t v8 = _CTServerConnectionCopyCellularUsagePolicy();
      CFRelease(v5);
      if (v8)
      {
        objc_super v9 = [MEMORY[0x1E4F4DCE8] sharedConfig];
        if (!v9)
        {
          objc_super v9 = [MEMORY[0x1E4F4DCE8] sharedConfig];
        }
        v10 = [v9 OSLogObject];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67240448;
          int v14 = v8;
          __int16 v15 = 1026;
          int v16 = HIDWORD(v8);
          _os_log_impl(&dword_1BF3A0000, v10, OS_LOG_TYPE_ERROR, "Could not determine cellular usage policy, reason: CTError(domain: %{public}d, error: %{public}d)", buf, 0xEu);
        }

        goto LABEL_12;
      }

      CFDictionaryRef v4 = 0;
    }
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E4F23D30]);
    CFRelease(0);
    if (!Value)
    {
LABEL_12:
      LOBYTE(v3) = 1;
      return v3;
    }
    LOBYTE(v3) = CFBooleanGetValue(Value) != 0;
  }
  return v3;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
}

@end