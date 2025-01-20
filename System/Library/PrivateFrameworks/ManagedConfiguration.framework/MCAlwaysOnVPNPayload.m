@interface MCAlwaysOnVPNPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCAlwaysOnVPNPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (id)_validatePayload:(id)a3;
@end

@implementation MCAlwaysOnVPNPayload

- (MCAlwaysOnVPNPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MCAlwaysOnVPNPayload;
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

- (id)_validatePayload:(id)a3
{
  id v4 = a3;
  if (MCNEProfileIngestionClass())
  {
    v5 = (void *)[objc_alloc(NSClassFromString(&cfstr_Neprofilepaylo.isa)) initWithPayload:v4];
    [(MCVPNPayloadBase *)self setNePayloadBase:v5];

    v6 = [(MCVPNPayloadBase *)self nePayloadBase];
    v7 = [v6 validatePayload];
  }
  else
  {
    id v8 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "MCAlwaysOnVPNPayload failed to load NE bundle", buf, 2u);
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    __int16 v17 = MCErrorArray(@"ERROR_ALWAYS_ON_VPN_INTERNAL_ERROR", v9, v10, v11, v12, v13, v14, v15, 0);
    v7 = [v16 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2005 descriptionArray:v17 errorType:@"MCFatalError"];
  }
  return v7;
}

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.vpn.managed.alwayson";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"ALWAYS_ON_VPN_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"ALWAYS_ON_VPN_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

@end