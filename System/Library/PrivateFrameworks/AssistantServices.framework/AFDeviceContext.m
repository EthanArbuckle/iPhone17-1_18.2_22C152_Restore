@interface AFDeviceContext
+ (BOOL)supportsSecureCoding;
- (AFCallStateSnapshot)callStateSnapshot;
- (AFClockAlarmSnapshot)alarmSnapshot;
- (AFClockTimerSnapshot)timerSnapshot;
- (AFDeviceContext)init;
- (AFDeviceContext)initWithCoder:(id)a3;
- (AFDeviceContext)initWithSerializedBackingStore:(id)a3 fromLocalDevice:(BOOL)a4 contextCollectorSource:(id)a5;
- (AFDeviceContextMetadata)alarmSnapshotMetadata;
- (AFDeviceContextMetadata)callStateMetadata;
- (AFDeviceContextMetadata)heardVoiceTriggerMetadata;
- (AFDeviceContextMetadata)homeAnnouncementSnapshotMetadata;
- (AFDeviceContextMetadata)locationMetadata;
- (AFDeviceContextMetadata)multiUserStateMetadata;
- (AFDeviceContextMetadata)playbackStateMetadata;
- (AFDeviceContextMetadata)siriClientStateMetadata;
- (AFDeviceContextMetadata)systemStateMetadata;
- (AFDeviceContextMetadata)timerSnapshotMetadata;
- (AFHomeAnnouncementSnapshot)homeAnnouncementSnapshot;
- (AFLocationSnapshot)locationSnapshot;
- (AFMediaPlaybackStateSnapshot)playbackStateSnapshot;
- (AFMultiUserStateSnapshot)multiUserStateSnapshot;
- (AFPeerInfo)deviceInfo;
- (AFSystemStateSnapshot)systemStateSnapshot;
- (BOOL)af_didHearVoiceTrigger;
- (BOOL)fromLocalDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NSData)myriadAdvertisementContext;
- (NSString)contextCollectorSource;
- (NSUUID)identifier;
- (id)_safeContextDictionary;
- (id)_serializedBackingStoreIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4;
- (id)af_serviceDeviceContextForKeys:(id)a3;
- (id)af_serviceDeviceContextForKeys:(id)a3 excludeContextExpiredBefore:(id)a4 proximity:(int64_t)a5;
- (id)af_validFlowContext;
- (id)allContextKeys;
- (id)buildBuiltInContextsDescriptions;
- (id)buildDescription;
- (id)contextMetadataForKey:(id)a3;
- (id)description;
- (id)deviceContextForDeviceContextKeys:(id)a3 excludingMandatoryKeys:(id)a4;
- (id)historicalContextMetadataForKey:(id)a3;
- (id)historicalSiriClientStateMetadata;
- (id)historicalSiriClientStates;
- (id)partiallyUpdatedContextForDeviceContextKeys:(id)a3 excludingMandatoryKeys:(id)a4 fromDeviceContext:(id)a5;
- (id)serializedBackingStore;
- (id)serializedContextForKey:(id)a3;
- (id)serializedHistoricalContextForKey:(id)a3;
- (id)updatedContextWithSerializedContextByKey:(id)a3 metadata:(id)a4;
- (int64_t)heardVoiceTrigger;
- (int64_t)privacyClass;
- (unint64_t)hash;
- (unint64_t)siriClientState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFDeviceContext

- (id)buildBuiltInContextsDescriptions
{
  v3 = (void *)MEMORY[0x19F3A4E70](self, a2);
  v4 = [(AFDeviceContext *)self alarmSnapshot];

  if (v4)
  {
    v5 = [(AFDeviceContext *)self alarmSnapshot];
    v6 = objc_msgSend(v5, "ad_shortDescription");
    [&stru_1EEE35D28 stringByAppendingFormat:@", alarm=%@", v6];
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1EEE35D28;
  }
  v8 = [(AFDeviceContext *)self timerSnapshot];

  if (v8)
  {
    v9 = [(AFDeviceContext *)self timerSnapshot];
    v10 = objc_msgSend(v9, "ad_shortDescription");
    uint64_t v11 = [(__CFString *)v7 stringByAppendingFormat:@", timer=%@", v10];

    v7 = (__CFString *)v11;
  }
  v12 = [(AFDeviceContext *)self playbackStateSnapshot];

  if (v12)
  {
    v13 = [(AFDeviceContext *)self playbackStateSnapshot];
    v14 = objc_msgSend(v13, "ad_shortDescription");
    uint64_t v15 = [(__CFString *)v7 stringByAppendingFormat:@", media=%@", v14];

    v7 = (__CFString *)v15;
  }
  if ([(AFDeviceContext *)self af_didHearVoiceTrigger])
  {
    uint64_t v16 = [(__CFString *)v7 stringByAppendingString:@", heardVT"];

    v7 = (__CFString *)v16;
  }
  v17 = [(AFDeviceContext *)self homeAnnouncementSnapshot];

  if (v17)
  {
    v18 = [(AFDeviceContext *)self homeAnnouncementSnapshot];
    v19 = objc_msgSend(v18, "ad_shortDescription");
    uint64_t v20 = [(__CFString *)v7 stringByAppendingFormat:@", homeAnnounce=%@", v19];

    v7 = (__CFString *)v20;
  }
  v21 = [(AFDeviceContext *)self myriadAdvertisementContext];

  if (v21)
  {
    v22 = [(AFDeviceContext *)self myriadAdvertisementContext];
    uint64_t v23 = -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", @", myriadAdvLen=%lu", [v22 length]);

    v7 = (__CFString *)v23;
  }
  v24 = [(AFDeviceContext *)self locationSnapshot];

  if (v24)
  {
    v25 = [(AFDeviceContext *)self locationSnapshot];
    v26 = objc_msgSend(v25, "ad_shortDescription");
    uint64_t v27 = [(__CFString *)v7 stringByAppendingFormat:@", location=%@", v26];

    v7 = (__CFString *)v27;
  }
  v28 = [(AFDeviceContext *)self callStateSnapshot];

  if (v28)
  {
    v29 = [(AFDeviceContext *)self callStateSnapshot];
    v30 = objc_msgSend(v29, "ad_shortDescription");
    v31 = [(AFDeviceContext *)self callStateMetadata];
    v32 = [v31 deliveryDate];
    uint64_t v33 = [(__CFString *)v7 stringByAppendingFormat:@", call=%@(delivered: %@)", v30, v32];

    v7 = (__CFString *)v33;
  }
  v34 = [(AFDeviceContext *)self systemStateSnapshot];

  if (v34)
  {
    v35 = [(AFDeviceContext *)self systemStateSnapshot];
    v36 = objc_msgSend(v35, "ad_shortDescription");
    uint64_t v37 = [(__CFString *)v7 stringByAppendingFormat:@", sys=%@", v36];

    v7 = (__CFString *)v37;
  }
  v38 = [(AFDeviceContext *)self af_validFlowContext];

  if (v38)
  {
    uint64_t v39 = [(__CFString *)v7 stringByAppendingString:@", flowUpdate=YES"];

    v7 = (__CFString *)v39;
  }
  if ([(AFDeviceContext *)self siriClientState])
  {
    id v40 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v41 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
    [v40 setLocale:v41];

    [v40 setLocalizedDateFormatFromTemplate:@"HH:mm:ss.SSS"];
    unint64_t v42 = [(AFDeviceContext *)self siriClientState];
    v52 = [(AFDeviceContext *)self historicalSiriClientStates];
    v43 = [v52 lastObject];
    uint64_t v44 = [v43 unsignedLongValue];
    v45 = [(AFDeviceContext *)self historicalSiriClientStateMetadata];
    v46 = [v45 lastObject];
    v47 = [v46 deliveryDate];
    [v40 stringFromDate:v47];
    v49 = v48 = v3;
    uint64_t v50 = [(__CFString *)v7 stringByAppendingFormat:@", clientState=%llu(prev %lu %@)", v42, v44, v49];

    v3 = v48;
    v7 = (__CFString *)v50;
  }
  return v7;
}

- (id)historicalSiriClientStateMetadata
{
  return [(AFDeviceContext *)self historicalContextMetadataForKey:@"siriClientState"];
}

- (id)historicalSiriClientStates
{
  v2 = [(AFDeviceContext *)self serializedHistoricalContextForKey:@"siriClientState"];
  v3 = objc_msgSend(v2, "af_lenientMappedArray:", &__block_literal_global_16683);

  return v3;
}

id __66__AFDeviceContext_BuiltInContextTypes__historicalSiriClientStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F28ED0];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithSerializedBackingStore:v3];

  return v4;
}

- (AFDeviceContextMetadata)siriClientStateMetadata
{
  return (AFDeviceContextMetadata *)[(AFDeviceContext *)self contextMetadataForKey:@"siriClientState"];
}

- (unint64_t)siriClientState
{
  v2 = [(AFDeviceContext *)self serializedContextForKey:@"siriClientState"];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithSerializedBackingStore:v2];
  unint64_t v4 = [v3 unsignedLongValue];

  return v4;
}

- (AFDeviceContextMetadata)systemStateMetadata
{
  return (AFDeviceContextMetadata *)[(AFDeviceContext *)self contextMetadataForKey:@"systemState"];
}

- (AFSystemStateSnapshot)systemStateSnapshot
{
  v2 = [(AFDeviceContext *)self serializedContextForKey:@"systemState"];
  id v3 = [[AFSystemStateSnapshot alloc] initWithSerializedBackingStore:v2];

  return v3;
}

- (AFDeviceContextMetadata)callStateMetadata
{
  return (AFDeviceContextMetadata *)[(AFDeviceContext *)self contextMetadataForKey:@"callState"];
}

- (AFCallStateSnapshot)callStateSnapshot
{
  v2 = [(AFDeviceContext *)self serializedContextForKey:@"callState"];
  id v3 = [[AFCallStateSnapshot alloc] initWithSerializedBackingStore:v2];

  return v3;
}

- (AFDeviceContextMetadata)locationMetadata
{
  return (AFDeviceContextMetadata *)[(AFDeviceContext *)self contextMetadataForKey:@"location"];
}

- (AFLocationSnapshot)locationSnapshot
{
  v2 = [(AFDeviceContext *)self serializedContextForKey:@"location"];
  id v3 = [[AFLocationSnapshot alloc] initWithSerializedBackingStore:v2];

  return v3;
}

- (AFDeviceContextMetadata)multiUserStateMetadata
{
  return (AFDeviceContextMetadata *)[(AFDeviceContext *)self contextMetadataForKey:@"multiUserState"];
}

- (AFMultiUserStateSnapshot)multiUserStateSnapshot
{
  v2 = [(AFDeviceContext *)self serializedContextForKey:@"multiUserState"];
  id v3 = [[AFMultiUserStateSnapshot alloc] initWithSerializedBackingStore:v2];

  return v3;
}

- (NSData)myriadAdvertisementContext
{
  v2 = [(AFDeviceContext *)self serializedContextForKey:@"myriadAdvertisementContext"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSData *)v3;
}

- (AFDeviceContextMetadata)heardVoiceTriggerMetadata
{
  return (AFDeviceContextMetadata *)[(AFDeviceContext *)self contextMetadataForKey:@"heardVoiceTrigger"];
}

- (int64_t)heardVoiceTrigger
{
  v2 = [(AFDeviceContext *)self serializedContextForKey:@"heardVoiceTrigger"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (AFDeviceContextMetadata)homeAnnouncementSnapshotMetadata
{
  return (AFDeviceContextMetadata *)[(AFDeviceContext *)self contextMetadataForKey:@"homeAnnouncement"];
}

- (AFHomeAnnouncementSnapshot)homeAnnouncementSnapshot
{
  v2 = [(AFDeviceContext *)self serializedContextForKey:@"homeAnnouncement"];
  int64_t v3 = [[AFHomeAnnouncementSnapshot alloc] initWithSerializedBackingStore:v2];

  return v3;
}

- (AFDeviceContextMetadata)playbackStateMetadata
{
  return (AFDeviceContextMetadata *)[(AFDeviceContext *)self contextMetadataForKey:@"playbackState"];
}

- (AFMediaPlaybackStateSnapshot)playbackStateSnapshot
{
  v2 = [(AFDeviceContext *)self serializedContextForKey:@"playbackState"];
  int64_t v3 = [[AFMediaPlaybackStateSnapshot alloc] initWithSerializedBackingStore:v2];

  return v3;
}

- (AFDeviceContextMetadata)timerSnapshotMetadata
{
  return (AFDeviceContextMetadata *)[(AFDeviceContext *)self contextMetadataForKey:@"timer"];
}

- (AFClockTimerSnapshot)timerSnapshot
{
  v2 = [(AFDeviceContext *)self serializedContextForKey:@"timer"];
  int64_t v3 = [[AFClockTimerSnapshot alloc] initWithSerializedBackingStore:v2];

  return v3;
}

- (AFDeviceContextMetadata)alarmSnapshotMetadata
{
  return (AFDeviceContextMetadata *)[(AFDeviceContext *)self contextMetadataForKey:@"alarm"];
}

- (AFClockAlarmSnapshot)alarmSnapshot
{
  v2 = [(AFDeviceContext *)self serializedContextForKey:@"alarm"];
  int64_t v3 = [[AFClockAlarmSnapshot alloc] initWithSerializedBackingStore:v2];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextCollectorSource, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_serializedBackingStore, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int64_t)privacyClass
{
  return self->_privacyClass;
}

- (AFPeerInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)contextCollectorSource
{
  return self->_contextCollectorSource;
}

- (BOOL)fromLocalDevice
{
  return self->_fromLocalDevice;
}

- (id)buildDescription
{
  uint64_t v3 = [(AFDeviceContext *)self buildBuiltInContextsDescriptions];
  id v16 = [NSString alloc];
  v17.receiver = self;
  v17.super_class = (Class)AFDeviceContext;
  unint64_t v4 = [(AFDeviceContext *)&v17 description];
  v5 = [(AFDeviceContext *)self deviceInfo];
  v6 = [v5 productType];
  v7 = [(AFDeviceContext *)self identifier];
  v8 = [v7 UUIDString];
  v9 = objc_msgSend(v8, "ad_shortDescription");
  v10 = [(AFDeviceContext *)self deviceInfo];
  uint64_t v11 = objc_msgSend(v10, "ad_shortDescription");
  BOOL v12 = [(AFDeviceContext *)self fromLocalDevice];
  v13 = (void *)v3;
  v14 = objc_msgSend(v16, "initWithFormat:", @"%@(%@)(id=%@, deviceInfo=%@, local=%d%@"), v4, v6, v9, v11, v12, v3;

  return v14;
}

- (BOOL)isValid
{
  return self->_deviceInfo && self->_identifier != 0;
}

- (id)updatedContextWithSerializedContextByKey:(id)a3 metadata:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(AFDeviceContext *)self serializedBackingStore];
  uint64_t v23 = (void *)[v8 mutableCopy];

  v24 = self;
  v9 = [(AFDeviceContext *)self _safeContextDictionary];
  id v10 = (id)[v9 mutableCopy];

  if (!v10) {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v7;
  uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v16 = [v15 type];
        objc_super v17 = [v6 objectForKey:v16];
        if (v17)
        {
          v18 = [v10 objectForKey:v16];
          id v19 = (id)[v18 mutableCopy];

          if (!v19) {
            id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          [v19 setObject:v17 forKey:@"data"];
          uint64_t v20 = [v15 backingStore];
          [v19 setObject:v20 forKey:@"metadata"];

          [v10 setObject:v19 forKey:v16];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  [v23 setObject:v10 forKey:@"contexts"];
  v21 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSerializedBackingStore:v23 fromLocalDevice:v24->_fromLocalDevice contextCollectorSource:v24->_contextCollectorSource];

  return v21;
}

- (id)deviceContextForDeviceContextKeys:(id)a3 excludingMandatoryKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 containsObject:@"all"])
  {
    v8 = (void *)[(AFDeviceContext *)self copy];
  }
  else
  {
    v9 = [(AFDeviceContext *)self partialSerializedBackingStoreIncludingKeys:v6 excludingMandatoryKeys:v7];
    v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSerializedBackingStore:v9 fromLocalDevice:self->_fromLocalDevice contextCollectorSource:self->_contextCollectorSource];
  }
  return v8;
}

- (id)partiallyUpdatedContextForDeviceContextKeys:(id)a3 excludingMandatoryKeys:(id)a4 fromDeviceContext:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10 && [v8 count])
  {
    uint64_t v11 = [(AFDeviceContext *)self serializedBackingStore];
    uint64_t v12 = (void *)[v11 mutableCopy];

    uint64_t v13 = [v10 serializedBackingStore];
    if (([v9 containsObject:@"deviceInfo"] & 1) == 0)
    {
      v14 = [v13 objectForKey:@"deviceInfo"];
      if (v14) {
        [v12 setObject:v14 forKey:@"deviceInfo"];
      }
    }
    if (([v9 containsObject:@"identifier"] & 1) == 0)
    {
      uint64_t v15 = [v13 objectForKey:@"identifier"];
      if (v15) {
        [v12 setObject:v15 forKey:@"identifier"];
      }
    }
    if (([v9 containsObject:@"privacyClass"] & 1) == 0)
    {
      id v16 = [v13 objectForKey:@"privacyClass"];
      if (v16) {
        [v12 setObject:v16 forKey:@"privacyClass"];
      }
    }
    v30 = v12;
    id v31 = v9;
    objc_super v17 = [(NSMutableDictionary *)self->_serializedBackingStore objectForKey:@"contexts", v13];
    id v18 = (id)[v17 mutableCopy];

    if (!v18) {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v19 = [v10 _safeContextDictionary];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v32 = v8;
    id v20 = v8;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          long long v26 = [v19 objectForKey:v25];
          if (v26) {
            [v18 setObject:v26 forKey:v25];
          }
          else {
            [v18 removeObjectForKey:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v22);
    }

    [v30 setObject:v18 forKey:@"contexts"];
    long long v27 = (AFDeviceContext *)[objc_alloc((Class)objc_opt_class()) initWithSerializedBackingStore:v30 fromLocalDevice:self->_fromLocalDevice contextCollectorSource:self->_contextCollectorSource];

    id v9 = v31;
    id v8 = v32;
  }
  else
  {
    long long v27 = self;
  }

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(AFDeviceContext *)self serializedBackingStore];
  [v5 encodeObject:v4 forKey:@"serializedBackingStore"];

  [v5 encodeBool:self->_fromLocalDevice forKey:@"fromLocalDevice"];
  [v5 encodeObject:self->_contextCollectorSource forKey:@"contextCollectorSource"];
}

- (AFDeviceContext)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:7];
  id v7 = objc_msgSend(v4, "setWithArray:", v6, v13, v14, v15, v16, v17, v18);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"serializedBackingStore"];

  uint64_t v9 = [v5 decodeBoolForKey:@"fromLocalDevice"];
  id v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"contextCollectorSource"];

  uint64_t v11 = [(AFDeviceContext *)self initWithSerializedBackingStore:v8 fromLocalDevice:v9 contextCollectorSource:v10];
  return v11;
}

- (id)description
{
  p_cachedDescriptionLock = &self->_cachedDescriptionLock;
  os_unfair_lock_lock(&self->_cachedDescriptionLock);
  if (!self->_cachedDescription)
  {
    unint64_t v4 = [(AFDeviceContext *)self buildDescription];
    cachedDescription = self->_cachedDescription;
    self->_cachedDescription = v4;
  }
  os_unfair_lock_unlock(p_cachedDescriptionLock);
  id v6 = self->_cachedDescription;
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (AFDeviceContext *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(AFDeviceContext *)self serializedBackingStore];
      id v6 = [(AFDeviceContext *)v4 serializedBackingStore];
      if ([v5 isEqual:v6])
      {
        BOOL fromLocalDevice = self->_fromLocalDevice;
        BOOL v8 = fromLocalDevice == [(AFDeviceContext *)v4 fromLocalDevice];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_identifier hash];
  unint64_t v4 = [(AFPeerInfo *)self->_deviceInfo idsDeviceUniqueIdentifier];
  uint64_t v5 = [v4 hash] ^ v3;
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_fromLocalDevice];
  uint64_t v7 = v5 ^ [v6 hash];
  BOOL v8 = [(AFDeviceContext *)self serializedBackingStore];
  unint64_t v9 = v7 ^ [v8 hash];

  return v9;
}

- (id)allContextKeys
{
  v2 = [(AFDeviceContext *)self _safeContextDictionary];
  uint64_t v3 = [v2 allKeys];

  return v3;
}

- (id)historicalContextMetadataForKey:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AFDeviceContext *)self _safeContextDictionary];
  uint64_t v17 = v4;
  id v6 = [v5 objectForKey:v4];
  uint64_t v7 = [v6 objectForKey:@"historicalMetadata"];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = [[AFDeviceContextMetadata alloc] initWithBackingStore:v14];
          [v8 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)contextMetadataForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AFDeviceContext *)self _safeContextDictionary];
  id v6 = [v5 objectForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 objectForKey:@"metadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      id v9 = [[AFDeviceContextMetadata alloc] initWithBackingStore:v8];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_safeContextDictionary
{
  v2 = [(NSMutableDictionary *)self->_serializedBackingStore objectForKey:@"contexts"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)serializedHistoricalContextForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AFDeviceContext *)self _safeContextDictionary];
  id v6 = [v5 objectForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 objectForKey:@"historicalData"];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)serializedContextForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AFDeviceContext *)self _safeContextDictionary];
  id v6 = [v5 objectForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 objectForKey:@"data"];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)serializedBackingStore
{
  id v3 = [(AFDeviceContext *)self _serializedBackingStoreIncludingKeys:0 excludingMandatoryKeys:0];
  id v4 = (void *)[(NSMutableDictionary *)self->_serializedBackingStore mutableCopy];
  [v4 addEntriesFromDictionary:v3];

  return v4;
}

- (id)_serializedBackingStoreIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (self->_identifier && ([v7 containsObject:@"identifier"] & 1) == 0) {
    [v8 setObject:self->_identifier forKey:@"identifier"];
  }
  if (self->_deviceInfo && ([v7 containsObject:@"deviceInfo"] & 1) == 0)
  {
    if (self->_dirtyFlags)
    {
      id v9 = [(AFPeerInfo *)self->_deviceInfo buildDictionaryRepresentation];
      if (!v9)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      id v9 = [(NSMutableDictionary *)self->_serializedBackingStore objectForKey:@"deviceInfo"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_11;
      }
    }
    [v8 setObject:v9 forKey:@"deviceInfo"];
    goto LABEL_11;
  }
LABEL_12:
  if ([v7 containsObject:@"privacyClass"]) {
    goto LABEL_24;
  }
  if ((self->_dirtyFlags & 2) != 0)
  {
    int64_t privacyClass = self->_privacyClass;
    uint64_t v12 = @"AFDeviceContextPrivacyClassUsedByLocalUser";
    if (privacyClass == 50) {
      uint64_t v12 = @"AFDeviceContextPrivacyClassSharedWithHome";
    }
    if (privacyClass) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = @"AFDeviceContextPrivacyClassUnknown";
    }
    uint64_t v10 = v13;
  }
  else
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_serializedBackingStore objectForKey:@"privacyClass"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_23;
    }
  }
  [v8 setObject:v10 forKey:@"privacyClass"];
LABEL_23:

LABEL_24:
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v15 = [(AFDeviceContext *)self _safeContextDictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v22 = objc_msgSend(v15, "objectForKey:", v21, (void)v24);
        if (v22) {
          [v14 setObject:v22 forKey:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }

  if ([v14 count]) {
    [v8 setObject:v14 forKey:@"contexts"];
  }

  return v8;
}

- (AFDeviceContext)initWithSerializedBackingStore:(id)a3 fromLocalDevice:(BOOL)a4 contextCollectorSource:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(AFDeviceContext *)self init];
  if (v10)
  {
    uint64_t v11 = [v8 mutableCopy];
    serializedBackingStore = v10->_serializedBackingStore;
    v10->_serializedBackingStore = (NSMutableDictionary *)v11;

    v10->_BOOL fromLocalDevice = a4;
    objc_storeStrong((id *)&v10->_contextCollectorSource, a5);
    uint64_t v13 = [v8 objectForKey:@"deviceInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [[AFPeerInfo alloc] initWithDictionaryRepresentation:v13];
      deviceInfo = v10->_deviceInfo;
      v10->_deviceInfo = v14;
    }
    id v16 = [v8 objectForKey:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v10->_identifier, v16);
    }
    uint64_t v17 = [v8 objectForKey:@"privacyClass"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10->_int64_t privacyClass = AFDeviceContextPrivacyClassFromString(v17);
    }
  }
  return v10;
}

- (AFDeviceContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)AFDeviceContext;
  v2 = [(AFDeviceContext *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    v2->_cachedDescriptionLock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    serializedBackingStore = v3->_serializedBackingStore;
    v3->_serializedBackingStore = v4;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)af_validFlowContext
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(AFDeviceContext *)self serializedContextForKey:@"serverContextUpdateCommand"];
  if (!v3)
  {
LABEL_8:
    uint64_t v5 = 0;
    goto LABEL_9;
  }
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F96928]) initWithSerializedBackingStore:v3];
  if (!v4)
  {
    id v9 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = v9;
      uint64_t v12 = [(AFDeviceContext *)self deviceInfo];
      int v13 = 136315650;
      id v14 = "-[AFDeviceContext(Utilities) af_validFlowContext]";
      __int16 v15 = 2112;
      id v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = 0;
      _os_log_error_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_ERROR, "%s Error unarchiving flowContext from %@: %@", (uint8_t *)&v13, 0x20u);
    }
    goto LABEL_8;
  }
  uint64_t v5 = (void *)v4;
  id v6 = [(AFDeviceContext *)self contextMetadataForKey:@"serverContextUpdateCommand"];
  objc_super v7 = [MEMORY[0x1E4F1C9C8] date];
  int v8 = [v6 isExpiredByDate:v7];

  if (v8)
  {

    uint64_t v5 = 0;
  }

LABEL_9:
  return v5;
}

- (BOOL)af_didHearVoiceTrigger
{
  if ([(AFDeviceContext *)self heardVoiceTrigger] != 2) {
    return 0;
  }
  id v3 = [(AFDeviceContext *)self heardVoiceTriggerMetadata];
  uint64_t v4 = [v3 expirationDate];
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v6 = [v4 compare:v5] == 1;

  return v6;
}

- (id)af_serviceDeviceContextForKeys:(id)a3 excludeContextExpiredBefore:(id)a4 proximity:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(AFDeviceContext *)self deviceInfo];
  uint64_t v11 = [v10 mediaRouteIdentifier];

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __99__AFDeviceContext_Utilities__af_serviceDeviceContextForKeys_excludeContextExpiredBefore_proximity___block_invoke;
  v37[3] = &unk_1E5927B60;
  v37[4] = self;
  id v12 = v8;
  id v38 = v12;
  int v13 = objc_msgSend(v9, "af_lenientMappedDictionary:", v37);

  if ([v13 count])
  {
    long long v35 = v13;
    id v36 = v12;
    id v14 = [(AFDeviceContext *)self deviceInfo];
    uint64_t v15 = [v14 productType];

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    __int16 v17 = v16;
    if (v15) {
      [v16 setObject:v15 forKey:@"productType"];
    }
    long long v34 = AFCoreAnalyticsPayloadCreateForDeviceContext(self, a5, 0);
    [v17 setObject:v34 forKey:@"coreAnalyticsContextPayload"];
    v30 = [AFServiceDeviceContext alloc];
    uint64_t v29 = [(AFDeviceContext *)self identifier];
    id v32 = [(AFDeviceContext *)self deviceInfo];
    [v32 assistantIdentifier];
    uint64_t v18 = v17;
    uint64_t v19 = v31 = v17;
    long long v20 = [(AFDeviceContext *)self deviceInfo];
    [v20 mediaSystemIdentifier];
    v21 = long long v33 = (void *)v15;
    uint64_t v22 = [(AFDeviceContext *)self deviceInfo];
    uint64_t v23 = [v22 sharedUserIdentifier];
    long long v24 = [(AFDeviceContext *)self deviceInfo];
    long long v25 = [v24 roomName];
    long long v28 = v18;
    int v13 = v35;
    long long v26 = [(AFServiceDeviceContext *)v30 initWithIdentifier:v29 assistantIdentifier:v19 mediaSystemIdentifier:v21 mediaRouteIdentifier:v11 sharedUserID:v23 roomName:v25 proximity:a5 serializedContextByKey:v35 metricsContext:v28];

    id v12 = v36;
  }
  else
  {
    long long v26 = 0;
  }

  return v26;
}

id __99__AFDeviceContext_Utilities__af_serviceDeviceContextForKeys_excludeContextExpiredBefore_proximity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) serializedContextForKey:v3];
  uint64_t v5 = [*(id *)(a1 + 32) contextMetadataForKey:v3];
  BOOL v6 = v5;
  if (v4)
  {
    if (![v5 isExpiredByDate:*(void *)(a1 + 40)]
      || ([*(id *)(a1 + 32) fromLocalDevice] & 1) != 0)
    {
      id v14 = v3;
      uint64_t v15 = v4;
      objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      goto LABEL_8;
    }
    id v8 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = v8;
      uint64_t v11 = [v9 deviceInfo];
      id v12 = [v11 idsDeviceUniqueIdentifier];
      *(_DWORD *)buf = 136315650;
      __int16 v17 = "-[AFDeviceContext(Utilities) af_serviceDeviceContextForKeys:excludeContextExpiredBefore:proximity:]_block_invoke";
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      id v21 = v3;
      _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s #hal Context for %@ of type %@ has expired", buf, 0x20u);
    }
  }
  objc_super v7 = 0;
LABEL_8:

  return v7;
}

- (id)af_serviceDeviceContextForKeys:(id)a3
{
  return [(AFDeviceContext *)self af_serviceDeviceContextForKeys:a3 excludeContextExpiredBefore:0 proximity:0];
}

@end