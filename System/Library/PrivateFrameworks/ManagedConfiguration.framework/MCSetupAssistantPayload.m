@interface MCSetupAssistantPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCSetupAssistantPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)skipKeys;
- (NSDictionary)configuration;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)verboseDescription;
@end

@implementation MCSetupAssistantPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.SetupAssistant.managed";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"SETUP_ASSISTANT_SETTINGS_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"SETUP_ASSISTANT_SETTINGS_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCSetupAssistantPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MCSetupAssistantPayload;
  uint64_t v9 = [(MCPayload *)&v25 initWithDictionary:v8 profile:a4 outError:a5];
  if (v9)
  {
    id v24 = 0;
    v10 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"SkipSetupItems" isRequired:0 outError:&v24];
    id v11 = v24;
    if (v11)
    {

      v12 = [(MCPayload *)v9 malformedPayloadErrorWithError:v11];
      v10 = v12;
      if (a5) {
        *a5 = v12;
      }
      v13 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v14 = v13;
        v15 = objc_opt_class();
        id v16 = v15;
        v17 = [v10 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v27 = v15;
        __int16 v28 = 2114;
        id v29 = v17;
        _os_log_impl(&dword_1A13F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      skipKeys = v9;
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v19 = [v10 copy];
      skipKeys = v9->_skipKeys;
      v9->_skipKeys = (NSArray *)v19;
    }

    if ([v8 count])
    {
      v20 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v21 = v20;
        v22 = [(MCPayload *)v9 friendlyName];
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        __int16 v28 = 2114;
        id v29 = v8;
        _os_log_impl(&dword_1A13F0000, v21, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
      }
    }
  }
  return v9;
}

- (NSDictionary)configuration
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(MCSetupAssistantPayload *)self skipKeys];
  uint64_t v5 = (void *)[v4 copy];
  [v3 setObject:v5 forKeyedSubscript:@"SkipSetupItems"];

  uint64_t v6 = (void *)[v3 copy];
  return (NSDictionary *)v6;
}

- (id)stubDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)MCSetupAssistantPayload;
  uint64_t v3 = [(MCPayload *)&v6 stubDictionary];
  uint64_t v4 = [(MCSetupAssistantPayload *)self configuration];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

- (id)verboseDescription
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MCSetupAssistantPayload;
  uint64_t v4 = [(MCPayload *)&v8 verboseDescription];
  uint64_t v5 = [(MCSetupAssistantPayload *)self skipKeys];
  objc_super v6 = [v3 stringWithFormat:@"%@ %p: Skip keys:%@", v4, self, v5];

  return v6;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(MCSetupAssistantPayload *)self skipKeys];
  uint64_t v5 = MCLocalizedString(@"SETUP_ASSISTANT_SKIP_KEYS");
  objc_super v6 = +[MCKeyValueSection sectionWithLocalizedArray:v4 title:v5 footer:0];

  if (v6) {
    [v3 addObject:v6];
  }
  if (![v3 count])
  {

    uint64_t v3 = 0;
  }

  return v3;
}

- (NSArray)skipKeys
{
  return self->_skipKeys;
}

- (void).cxx_destruct
{
}

@end