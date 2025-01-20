@interface __HMDBundleApplicationInfo
- (BOOL)isEntitledForAPIAccess;
- (BOOL)isEntitledForSPIAccess;
- (__HMDBundleApplicationInfo)initWithBundleIdentifier:(id)a3;
- (__HMDBundleApplicationInfo)initWithRecord:(id)a3;
@end

@implementation __HMDBundleApplicationInfo

- (BOOL)isEntitledForSPIAccess
{
  v3 = [(LSPropertyList *)self->_entitlements objectForKey:@"com.apple.private.homekit" ofClass:objc_opt_class()];
  char v4 = [v3 BOOLValue];

  if (v4) {
    return 1;
  }
  v6 = [(LSPropertyList *)self->_entitlements objectForKey:@"com.apple.homekit.private-spi-access" ofClass:objc_opt_class()];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void).cxx_destruct
{
}

- (BOOL)isEntitledForAPIAccess
{
  v2 = [(LSPropertyList *)self->_entitlements objectForKey:@"com.apple.developer.homekit" ofClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (__HMDBundleApplicationInfo)initWithRecord:(id)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 bundleIdentifier];

    if (v6)
    {
      char v7 = [v5 bundleIdentifier];
      v8 = [v5 URL];
      v17.receiver = self;
      v17.super_class = (Class)__HMDBundleApplicationInfo;
      v9 = [(HMDApplicationInfo *)&v17 initWithBundleIdentifier:v7 bundleURL:v8];

      if (v9)
      {
        v10 = [v5 entitlements];
        v11 = (void *)MEMORY[0x1E4F1CAD0];
        v18[0] = @"com.apple.developer.homekit";
        v18[1] = @"com.apple.private.homekit";
        v18[2] = @"com.apple.homekit.private-spi-access";
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
        v13 = [v11 setWithArray:v12];
        uint64_t v14 = [v10 objectsForKeys:v13];
        entitlements = v9->_entitlements;
        v9->_entitlements = (LSPropertyList *)v14;
      }
      self = v9;
      v6 = self;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (__HMDBundleApplicationInfo)initWithBundleIdentifier:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F223C8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithBundleIdentifier:v5 allowPlaceholder:0 error:0];

  char v7 = [(__HMDBundleApplicationInfo *)self initWithRecord:v6];
  return v7;
}

@end