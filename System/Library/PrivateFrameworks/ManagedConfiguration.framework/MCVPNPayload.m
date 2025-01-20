@interface MCVPNPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCVPNPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
@end

@implementation MCVPNPayload

- (MCVPNPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MCVPNPayload;
  v9 = [(MCVPNPayloadBase *)&v14 initWithDictionary:v8 profile:a4 outError:a5];
  if (v9)
  {
    if ([v8 count])
    {
      v10 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v11 = v10;
        v12 = [(MCPayload *)v9 friendlyName];
        *(_DWORD *)buf = 138543618;
        v16 = v12;
        __int16 v17 = 2114;
        id v18 = v8;
        _os_log_impl(&dword_1A13F0000, v11, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
      }
    }
  }

  return v9;
}

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.vpn.managed"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"VPN_SETTINGS_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"VPN_SETTINGS_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

@end