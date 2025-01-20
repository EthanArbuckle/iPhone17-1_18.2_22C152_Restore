@interface HMDAccessorySettingsMetadata
- (HMDAccessorySettingGroupMetadata)rootGroup;
- (HMDAccessorySettingsMetadata)init;
- (HMDAccessorySettingsMetadata)initWithURL:(id)a3;
- (NSString)propertyDescription;
@end

@implementation HMDAccessorySettingsMetadata

- (void).cxx_destruct
{
}

- (HMDAccessorySettingGroupMetadata)rootGroup
{
  return (HMDAccessorySettingGroupMetadata *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)propertyDescription
{
  v2 = NSString;
  v3 = [(HMDAccessorySettingsMetadata *)self rootGroup];
  v4 = [v2 stringWithFormat:@", Root = %@", v3];

  return (NSString *)v4;
}

- (HMDAccessorySettingsMetadata)initWithURL:(id)a3
{
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:a3];
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)HMDAccessorySettingsMetadata;
    v5 = [(HMDAccessorySettingsMetadata *)&v16 init];
    if (v5)
    {
      v6 = [HMDAccessorySettingGroupMetadata alloc];
      uint64_t v7 = *MEMORY[0x1E4F2C628];
      v8 = objc_msgSend(v4, "hmf_arrayForKey:", @"Settings");
      v9 = +[HMDAccessorySettingMetadata settingsWithArrayRepresenation:v8 parentKeyPath:@"root"];
      v10 = objc_msgSend(v4, "hmf_arrayForKey:", @"Groups");
      v11 = +[HMDAccessorySettingGroupMetadata groupsWithArrayRepresenation:v10 parentKeyPath:@"root"];
      uint64_t v12 = [(HMDAccessorySettingGroupMetadata *)v6 initWithName:v7 settings:v9 groups:v11];
      rootGroup = v5->_rootGroup;
      v5->_rootGroup = (HMDAccessorySettingGroupMetadata *)v12;
    }
    self = v5;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (HMDAccessorySettingsMetadata)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = [MEMORY[0x1E4F65548] productInfo];
  [v4 productClass];
  v5 = HMFProductClassToString();
  v6 = [v3 stringWithFormat:@"%@.plist", v5];

  uint64_t v7 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v8 = [v7 productClass];

  if (v8 == 6)
  {

    v6 = @"AudioAccessory-b238.plist";
  }
  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 resourceURL];
  v11 = [v10 URLByAppendingPathComponent:v6];

  uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  v13 = [v11 path];
  char v14 = [v12 fileExistsAtPath:v13];

  if (v14)
  {
    v15 = [(HMDAccessorySettingsMetadata *)self initWithURL:v11];
    objc_super v16 = v15;
  }
  else
  {
    v17 = (void *)MEMORY[0x1D9452090]();
    v15 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v22 = v19;
      __int16 v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot find setting resource at: %@", buf, 0x16u);
    }
    objc_super v16 = 0;
  }

  return v16;
}

@end