@interface ASDCellularSettings
+ (id)settingsForIdentity:(id)a3;
- (ASDCellularSettings)initWithDefaultsKey:(id)a3;
- (BOOL)allowAutomaticDownloads;
- (id)_cellularSettings;
- (int64_t)cellularDataPrompt;
- (void)setAllowAutomaticDownloads:(BOOL)a3;
- (void)setCellularDataPrompt:(int64_t)a3;
@end

@implementation ASDCellularSettings

+ (id)settingsForIdentity:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 defaultsKey];

  v7 = (void *)[v5 initWithDefaultsKey:v6];
  return v7;
}

- (ASDCellularSettings)initWithDefaultsKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDCellularSettings;
  v6 = [(ASDCellularSettings *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_defaultsKey, a3);
  }

  return v7;
}

- (BOOL)allowAutomaticDownloads
{
  return CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", @"com.apple.itunesstored", 0) != 0;
}

- (void)setAllowAutomaticDownloads:(BOOL)a3
{
  id v3 = [NSNumber numberWithBool:a3];
  CFPreferencesSetAppValue(@"AllowAutoDownloadOnCellular", v3, @"com.apple.itunesstored");
}

- (int64_t)cellularDataPrompt
{
  id v3 = -[ASDCellularSettings _cellularSettings](self);
  id v4 = [v3 objectForKey:self->_defaultsKey];
  id v5 = [v4 objectForKey:@"CellularDataPrompt"];
  if ([v5 isEqualToString:@"Always"])
  {
    int64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"OverLimit"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"Never"])
  {
    int64_t v6 = 2;
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)_cellularSettings
{
  if (a1)
  {
    a1 = (void *)CFPreferencesCopyValue(@"CellularSettings", @"com.apple.appstored", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setCellularDataPrompt:(int64_t)a3
{
  -[ASDCellularSettings _cellularSettings](self);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v8 objectForKey:self->_defaultsKey];
  int64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v8];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v5];
  [v6 setObject:v7 forKey:self->_defaultsKey];
  if ((unint64_t)a3 <= 2) {
    [v7 setObject:off_1E58B38C8[a3] forKey:@"CellularDataPrompt"];
  }
  CFPreferencesSetAppValue(@"CellularSettings", v6, @"com.apple.appstored");
}

- (void).cxx_destruct
{
}

@end