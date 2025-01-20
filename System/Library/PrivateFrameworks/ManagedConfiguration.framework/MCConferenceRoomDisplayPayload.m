@interface MCConferenceRoomDisplayPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCConferenceRoomDisplayPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSString)customMessage;
- (id)configuration;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
@end

@implementation MCConferenceRoomDisplayPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.conferenceroomdisplay";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"CONFERENCE_ROOM_DISPLAY_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"CONFERENCE_ROOM_DISPLAY_PLURAL", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCConferenceRoomDisplayPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MCConferenceRoomDisplayPayload;
  uint64_t v9 = [(MCPayload *)&v25 initWithDictionary:v8 profile:a4 outError:a5];
  if (v9)
  {
    id v24 = 0;
    uint64_t v10 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"Message" isRequired:0 outError:&v24];
    id v11 = v24;
    customMessage = v9->_customMessage;
    v9->_customMessage = (NSString *)v10;

    if (v11)
    {
      v13 = [(MCPayload *)v9 malformedPayloadErrorWithError:v11];
      v14 = v13;
      if (a5) {
        *a5 = v13;
      }
      v15 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        v17 = objc_opt_class();
        id v18 = v17;
        v19 = [v14 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v27 = v17;
        __int16 v28 = 2114;
        id v29 = v19;
        _os_log_impl(&dword_1A13F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      uint64_t v9 = 0;
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

- (id)configuration
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(MCConferenceRoomDisplayPayload *)self customMessage];
  [v3 setObject:v4 forKeyedSubscript:@"Message"];

  return v3;
}

- (id)stubDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)MCConferenceRoomDisplayPayload;
  uint64_t v3 = [(MCPayload *)&v6 stubDictionary];
  uint64_t v4 = [(MCConferenceRoomDisplayPayload *)self configuration];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(MCConferenceRoomDisplayPayload *)self customMessage];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    objc_super v6 = [MCKeyValue alloc];
    uint64_t v7 = [(MCConferenceRoomDisplayPayload *)self customMessage];
    id v8 = MCLocalizedString(@"CONFERENCE_ROOM_DISPLAY_CUSTOM_MESSAGE");
    uint64_t v9 = [(MCKeyValue *)v6 initWithLocalizedString:v7 localizedKey:v8];

    [v3 addObject:v9];
  }
  if ([v3 count])
  {
    uint64_t v10 = +[MCKeyValueSection sectionWithKeyValues:v3];
    v13[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (NSString)customMessage
{
  return self->_customMessage;
}

- (void).cxx_destruct
{
}

@end