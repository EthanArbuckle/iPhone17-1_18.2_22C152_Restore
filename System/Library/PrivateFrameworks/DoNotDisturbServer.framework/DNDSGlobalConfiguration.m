@interface DNDSGlobalConfiguration
+ (id)backingStoreWithFileURL:(id)a3;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isAutomaticallyGenerated;
- (BOOL)isEqual:(id)a3;
- (DNDBypassSettings)bypassSettings;
- (DNDSGlobalConfiguration)init;
- (DNDSGlobalConfiguration)initWithPreventAutoReply:(unint64_t)a3 bypassSettings:(id)a4 modesCanImpactAvailability:(unint64_t)a5 lastModified:(id)a6 automaticallyGenerated:(BOOL)a7;
- (NSDate)lastModified;
- (NSString)description;
- (id)_initWithConfiguration:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mergeWithGlobalConfiguration:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)modesCanImpactAvailability;
- (unint64_t)preventAutoReply;
@end

@implementation DNDSGlobalConfiguration

+ (id)backingStoreWithFileURL:(id)a3
{
  id v4 = a3;
  v5 = [[DNDSJSONBackingStore alloc] initWithRecordClass:a1 fileURL:v4 versionNumber:1];

  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"preventAutoReply", objc_opt_class());
  v8 = v7;
  if (v7) {
    uint64_t v23 = [v7 unsignedIntegerValue];
  }
  else {
    uint64_t v23 = 0;
  }
  v9 = objc_msgSend(v5, "bs_safeDictionaryForKey:", @"bypassSettings");
  v25 = v6;
  if (v9)
  {
    id v10 = +[DNDSBypassSettingsRecord newWithDictionaryRepresentation:v9 context:v6];
    v11 = [MEMORY[0x1E4F5F5A8] settingsForRecord:v10];
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"modesCanImpactAvailability", objc_opt_class());
  v13 = v12;
  if (v12) {
    uint64_t v14 = [v12 unsignedIntegerValue];
  }
  else {
    uint64_t v14 = 0;
  }
  v15 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"lastModified", objc_opt_class());
  v16 = (void *)MEMORY[0x1E4F1C9C8];
  [v15 doubleValue];
  v17 = objc_msgSend(v16, "dateWithTimeIntervalSince1970:");
  v18 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"automaticallyGenerated", objc_opt_class());
  v19 = v18;
  if (v18) {
    uint64_t v20 = [v18 BOOLValue];
  }
  else {
    uint64_t v20 = 0;
  }
  v21 = (void *)[objc_alloc((Class)a1) initWithPreventAutoReply:v23 bypassSettings:v11 modesCanImpactAvailability:v14 lastModified:v17 automaticallyGenerated:v20];

  return v21;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(DNDSGlobalConfiguration *)self bypassSettings];
  id v6 = [v5 makeRecord];

  v7 = [v6 dictionaryRepresentationWithContext:v4];

  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DNDSGlobalConfiguration preventAutoReply](self, "preventAutoReply"));
  [v8 setObject:v9 forKeyedSubscript:@"preventAutoReply"];

  [v8 setObject:v7 forKeyedSubscript:@"bypassSettings"];
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DNDSGlobalConfiguration modesCanImpactAvailability](self, "modesCanImpactAvailability"));
  [v8 setObject:v10 forKeyedSubscript:@"modesCanImpactAvailability"];

  v11 = NSNumber;
  v12 = [(DNDSGlobalConfiguration *)self lastModified];
  [v12 timeIntervalSince1970];
  v13 = objc_msgSend(v11, "numberWithDouble:");
  [v8 setObject:v13 forKeyedSubscript:@"lastModified"];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSGlobalConfiguration isAutomaticallyGenerated](self, "isAutomaticallyGenerated"));
  [v8 setObject:v14 forKeyedSubscript:@"automaticallyGenerated"];

  return v8;
}

- (DNDSGlobalConfiguration)init
{
  return (DNDSGlobalConfiguration *)[(DNDSGlobalConfiguration *)self _initWithConfiguration:0];
}

- (DNDSGlobalConfiguration)initWithPreventAutoReply:(unint64_t)a3 bypassSettings:(id)a4 modesCanImpactAvailability:(unint64_t)a5 lastModified:(id)a6 automaticallyGenerated:(BOOL)a7
{
  id v12 = a4;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)DNDSGlobalConfiguration;
  uint64_t v14 = [(DNDSGlobalConfiguration *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_preventAutoReply = a3;
    uint64_t v16 = [v12 copy];
    bypassSettings = v15->_bypassSettings;
    v15->_bypassSettings = (DNDBypassSettings *)v16;

    v15->_modesCanImpactAvailability = a5;
    uint64_t v18 = [v13 copy];
    lastModified = v15->_lastModified;
    v15->_lastModified = (NSDate *)v18;

    v15->_automaticallyGenerated = a7;
  }

  return v15;
}

- (id)_initWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 preventAutoReply];
  id v6 = [v4 bypassSettings];
  uint64_t v7 = [v4 modesCanImpactAvailability];
  v8 = [v4 lastModified];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v10 = -[DNDSGlobalConfiguration initWithPreventAutoReply:bypassSettings:modesCanImpactAvailability:lastModified:automaticallyGenerated:](self, "initWithPreventAutoReply:bypassSettings:modesCanImpactAvailability:lastModified:automaticallyGenerated:", v5, v6, v7, v9, [v4 isAutomaticallyGenerated]);
  if (!v8) {

  }
  return v10;
}

- (id)mergeWithGlobalConfiguration:(id)a3
{
  id v4 = (DNDSGlobalConfiguration *)a3;
  p_isa = (id *)&v4->super.isa;
  if (!v4) {
    goto LABEL_8;
  }
  if (self->_automaticallyGenerated)
  {
    id v6 = v4;
    if (!v4->_automaticallyGenerated) {
      goto LABEL_9;
    }
  }
  else if (v4->_automaticallyGenerated)
  {
LABEL_8:
    id v6 = self;
    goto LABEL_9;
  }
  lastModified = self->_lastModified;
  v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  LOBYTE(lastModified) = [(NSDate *)lastModified isEqualToDate:v8];

  if ((lastModified & 1) != 0
    || ([p_isa[4] isEqualToDate:self->_lastModified] & 1) != 0)
  {
    goto LABEL_8;
  }
  v11 = [p_isa[4] laterDate:self->_lastModified];
  int v12 = [v11 isEqualToDate:p_isa[4]];

  if (v12) {
    id v6 = (DNDSGlobalConfiguration *)p_isa;
  }
  else {
    id v6 = self;
  }
LABEL_9:
  v9 = v6;

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_lastModified hash];
  return [(DNDBypassSettings *)self->_bypassSettings hash] ^ v3 ^ self->_preventAutoReply ^ self->_modesCanImpactAvailability ^ self->_automaticallyGenerated;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDSGlobalConfiguration *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unint64_t v6 = [(DNDSGlobalConfiguration *)self preventAutoReply];
      if (v6 != [(DNDSGlobalConfiguration *)v5 preventAutoReply]
        || (BOOL v7 = [(DNDSGlobalConfiguration *)self isAutomaticallyGenerated],
            v7 != [(DNDSGlobalConfiguration *)v5 isAutomaticallyGenerated])
        || (unint64_t v8 = [(DNDSGlobalConfiguration *)self modesCanImpactAvailability],
            v8 != [(DNDSGlobalConfiguration *)v5 modesCanImpactAvailability]))
      {
        char v16 = 0;
LABEL_14:

        goto LABEL_15;
      }
      v9 = [(DNDSGlobalConfiguration *)self lastModified];
      id v10 = [(DNDSGlobalConfiguration *)v5 lastModified];
      if (v9 != v10)
      {
        uint64_t v11 = [(DNDSGlobalConfiguration *)self lastModified];
        if (!v11)
        {
          char v16 = 0;
LABEL_30:

          goto LABEL_14;
        }
        int v12 = (void *)v11;
        id v13 = [(DNDSGlobalConfiguration *)v5 lastModified];
        if (!v13)
        {
          char v16 = 0;
LABEL_29:

          goto LABEL_30;
        }
        uint64_t v14 = [(DNDSGlobalConfiguration *)self lastModified];
        v15 = [(DNDSGlobalConfiguration *)v5 lastModified];
        if (![v14 isEqual:v15])
        {
          char v16 = 0;
LABEL_28:

          goto LABEL_29;
        }
        v26 = v15;
        v27 = v14;
        v28 = v13;
        v29 = v12;
      }
      uint64_t v18 = [(DNDSGlobalConfiguration *)self bypassSettings];
      uint64_t v19 = [(DNDSGlobalConfiguration *)v5 bypassSettings];
      if (v18 == (void *)v19)
      {

        char v16 = 1;
      }
      else
      {
        uint64_t v20 = (void *)v19;
        uint64_t v21 = [(DNDSGlobalConfiguration *)self bypassSettings];
        if (v21)
        {
          v22 = (void *)v21;
          uint64_t v23 = [(DNDSGlobalConfiguration *)v5 bypassSettings];
          if (v23)
          {
            v25 = [(DNDSGlobalConfiguration *)self bypassSettings];
            v24 = [(DNDSGlobalConfiguration *)v5 bypassSettings];
            char v16 = [v25 isEqual:v24];
          }
          else
          {
            char v16 = 0;
          }
        }
        else
        {

          char v16 = 0;
        }
      }
      id v13 = v28;
      int v12 = v29;
      v15 = v26;
      uint64_t v14 = v27;
      if (v9 == v10) {
        goto LABEL_30;
      }
      goto LABEL_28;
    }
    char v16 = 0;
  }
LABEL_15:

  return v16;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = DNDEnabledSettingToString();
  unint64_t v6 = [(DNDSGlobalConfiguration *)self bypassSettings];
  BOOL v7 = DNDEnabledSettingToString();
  unint64_t v8 = [(DNDSGlobalConfiguration *)self lastModified];
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSGlobalConfiguration isAutomaticallyGenerated](self, "isAutomaticallyGenerated"));
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; preventAutoReply: %@; bypassSettings: %@; modesCanImpactAvailability: %@; lastModified: %@; automaticallyGenerated: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
  id v10 = v9);

  return (NSString *)v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableGlobalConfiguration alloc];
  return [(DNDSGlobalConfiguration *)v4 _initWithConfiguration:self];
}

- (unint64_t)preventAutoReply
{
  return self->_preventAutoReply;
}

- (DNDBypassSettings)bypassSettings
{
  return self->_bypassSettings;
}

- (unint64_t)modesCanImpactAvailability
{
  return self->_modesCanImpactAvailability;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (BOOL)isAutomaticallyGenerated
{
  return self->_automaticallyGenerated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_bypassSettings, 0);
}

@end