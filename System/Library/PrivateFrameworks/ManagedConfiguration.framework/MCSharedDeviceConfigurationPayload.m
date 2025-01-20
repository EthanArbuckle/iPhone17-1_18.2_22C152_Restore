@interface MCSharedDeviceConfigurationPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCSharedDeviceConfigurationPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSDictionary)configuration;
- (NSString)assetTagInformation;
- (NSString)lockScreenFootnote;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
@end

@implementation MCSharedDeviceConfigurationPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.shareddeviceconfiguration";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"SHARED_DEVICE_CONFIGURATION_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"SHARED_DEVICE_CONFIGURATION_PLURAL", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCSharedDeviceConfigurationPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v31.receiver = self;
  v31.super_class = (Class)MCSharedDeviceConfigurationPayload;
  uint64_t v9 = [(MCPayload *)&v31 initWithDictionary:v8 profile:a4 outError:a5];
  if (v9)
  {
    id v30 = 0;
    uint64_t v10 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"LockScreenFootnote" isRequired:0 outError:&v30];
    id v11 = v30;
    lockScreenFootnote = v9->_lockScreenFootnote;
    v9->_lockScreenFootnote = (NSString *)v10;

    if (v11) {
      goto LABEL_7;
    }
    if (!v9->_lockScreenFootnote)
    {
      id v29 = 0;
      uint64_t v15 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"IfLostReturnToMessage" isRequired:0 outError:&v29];
      id v11 = v29;
      v16 = v9->_lockScreenFootnote;
      v9->_lockScreenFootnote = (NSString *)v15;

      if (v11) {
        goto LABEL_7;
      }
    }
    id v28 = 0;
    uint64_t v13 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"AssetTagInformation" isRequired:0 outError:&v28];
    id v11 = v28;
    assetTagInformation = v9->_assetTagInformation;
    v9->_assetTagInformation = (NSString *)v13;

    if (v11)
    {
LABEL_7:
      v17 = [(MCPayload *)v9 malformedPayloadErrorWithError:v11];
      v18 = v17;
      if (a5) {
        *a5 = v17;
      }
      v19 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v20 = v19;
        v21 = objc_opt_class();
        id v22 = v21;
        v23 = [v18 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v33 = v21;
        __int16 v34 = 2114;
        id v35 = v23;
        _os_log_impl(&dword_1A13F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      uint64_t v9 = 0;
    }
    if ([v8 count])
    {
      v24 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v25 = v24;
        v26 = [(MCPayload *)v9 friendlyName];
        *(_DWORD *)buf = 138543618;
        v33 = v26;
        __int16 v34 = 2114;
        id v35 = v8;
        _os_log_impl(&dword_1A13F0000, v25, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
      }
    }
  }
  return v9;
}

- (NSDictionary)configuration
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(MCSharedDeviceConfigurationPayload *)self lockScreenFootnote];
  [v3 setObject:v4 forKeyedSubscript:@"LockScreenFootnote"];

  uint64_t v5 = [(MCSharedDeviceConfigurationPayload *)self assetTagInformation];
  [v3 setObject:v5 forKeyedSubscript:@"AssetTagInformation"];

  return (NSDictionary *)v3;
}

- (id)stubDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)MCSharedDeviceConfigurationPayload;
  uint64_t v3 = [(MCPayload *)&v6 stubDictionary];
  uint64_t v4 = [(MCSharedDeviceConfigurationPayload *)self configuration];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(MCSharedDeviceConfigurationPayload *)self lockScreenFootnote];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    objc_super v6 = [MCKeyValue alloc];
    uint64_t v7 = [(MCSharedDeviceConfigurationPayload *)self lockScreenFootnote];
    id v8 = MCLocalizedString(@"LOCK_SCREEN_FOOTNOTE");
    uint64_t v9 = [(MCKeyValue *)v6 initWithLocalizedString:v7 localizedKey:v8];

    [v3 addObject:v9];
  }
  uint64_t v10 = [(MCSharedDeviceConfigurationPayload *)self assetTagInformation];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    v12 = [MCKeyValue alloc];
    uint64_t v13 = [(MCSharedDeviceConfigurationPayload *)self assetTagInformation];
    v14 = MCLocalizedString(@"ASSET_TAG_INFORMATION");
    uint64_t v15 = [(MCKeyValue *)v12 initWithLocalizedString:v13 localizedKey:v14];

    [v3 addObject:v15];
  }
  if ([v3 count])
  {
    v16 = +[MCKeyValueSection sectionWithKeyValues:v3];
    v19[0] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSString)lockScreenFootnote
{
  return self->_lockScreenFootnote;
}

- (NSString)assetTagInformation
{
  return self->_assetTagInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTagInformation, 0);
  objc_storeStrong((id *)&self->_lockScreenFootnote, 0);
}

@end