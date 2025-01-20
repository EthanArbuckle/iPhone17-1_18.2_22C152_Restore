@interface DNDMutableConfiguration
+ (id)configurationOfType:(unint64_t)a3;
+ (id)defaultConfiguration;
- (BOOL)hasSecureData;
- (id)_configurationForApplicationIdentifier:(id)a3;
- (void)removeExceptionForApplication:(id)a3;
- (void)removeExceptionForApplication:(id)a3 thread:(id)a4;
- (void)removeExceptionForApplicationIdentifier:(id)a3;
- (void)removeExceptionForApplicationIdentifier:(id)a3 thread:(id)a4;
- (void)removeExceptionForContact:(id)a3;
- (void)removeExceptionForContactGroup:(id)a3;
- (void)removeExceptionForContactType:(unint64_t)a3;
- (void)removeExceptionForWebApplicationIdentifier:(id)a3;
- (void)setAllowIntelligentManagement:(unint64_t)a3;
- (void)setAllowedApplicationIdentifiers:(id)a3;
- (void)setAllowedApplications:(id)a3;
- (void)setAllowedWebApplicationIdentifiers:(id)a3;
- (void)setApplicationConfigurationType:(unint64_t)a3;
- (void)setCompatibilityVersion:(int64_t)a3;
- (void)setDeniedApplicationIdentifiers:(id)a3;
- (void)setDeniedApplications:(id)a3;
- (void)setDeniedWebApplicationIdentifiers:(id)a3;
- (void)setExceptionForApplication:(id)a3;
- (void)setExceptionForApplication:(id)a3 thread:(id)a4;
- (void)setExceptionForApplicationIdentifier:(id)a3;
- (void)setExceptionForApplicationIdentifier:(id)a3 thread:(id)a4;
- (void)setExceptionForContact:(id)a3;
- (void)setExceptionForContactGroup:(id)a3;
- (void)setExceptionForContactType:(unint64_t)a3;
- (void)setExceptionForWebApplicationIdentifier:(id)a3;
- (void)setExceptionOfType:(unint64_t)a3 forApplication:(id)a4;
- (void)setExceptionOfType:(unint64_t)a3 forApplication:(id)a4 thread:(id)a5;
- (void)setExceptionOfType:(unint64_t)a3 forApplicationIdentifier:(id)a4;
- (void)setExceptionOfType:(unint64_t)a3 forApplicationIdentifier:(id)a4 thread:(id)a5;
- (void)setExceptionOfType:(unint64_t)a3 forContact:(id)a4;
- (void)setExceptionOfType:(unint64_t)a3 forContactGroup:(id)a4;
- (void)setExceptionOfType:(unint64_t)a3 forContactType:(unint64_t)a4;
- (void)setHideApplicationBadges:(unint64_t)a3;
- (void)setMinimumBreakthroughUrgency:(unint64_t)a3;
- (void)setMinimumBreakthroughUrgency:(unint64_t)a3 forApplication:(id)a4;
- (void)setMinimumBreakthroughUrgency:(unint64_t)a3 forApplicationIdentifier:(id)a4;
- (void)setPhoneCallBypassSettings:(id)a3;
- (void)setSenderConfiguration:(id)a3;
- (void)setSenderConfigurationType:(unint64_t)a3;
- (void)setSuppressionMode:(unint64_t)a3;
- (void)setSuppressionType:(unint64_t)a3;
@end

@implementation DNDMutableConfiguration

+ (id)defaultConfiguration
{
  unint64_t v2 = +[DNDConfiguration defaultConfigurationType];
  return +[DNDMutableConfiguration configurationOfType:v2];
}

+ (id)configurationOfType:(unint64_t)a3
{
  id v3 = [(DNDConfiguration *)[DNDMutableConfiguration alloc] _initWithConfigurationType:a3];
  return v3;
}

- (void)setSuppressionType:(unint64_t)a3
{
  self->super._suppressionType = a3;
}

- (void)setSuppressionMode:(unint64_t)a3
{
  self->super._suppressionMode = a3;
}

- (void)setApplicationConfigurationType:(unint64_t)a3
{
  self->super._applicationConfigurationType = a3;
}

- (void)setSenderConfigurationType:(unint64_t)a3
{
  self->super._senderConfigurationType = a3;
}

- (void)setAllowedApplicationIdentifiers:(id)a3
{
  self->super._allowedApplicationIdentifiers = (NSMutableDictionary *)[a3 mutableCopy];
  MEMORY[0x1F41817F8]();
}

- (void)setDeniedApplicationIdentifiers:(id)a3
{
  self->super._deniedApplicationIdentifiers = (NSMutableSet *)[a3 mutableCopy];
  MEMORY[0x1F41817F8]();
}

- (void)setAllowedWebApplicationIdentifiers:(id)a3
{
  self->super._allowedWebApplicationIdentifiers = (NSMutableSet *)[a3 mutableCopy];
  MEMORY[0x1F41817F8]();
}

- (void)setDeniedWebApplicationIdentifiers:(id)a3
{
  self->super._deniedWebApplicationIdentifiers = (NSMutableSet *)[a3 mutableCopy];
  MEMORY[0x1F41817F8]();
}

- (void)setAllowedApplications:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  allowedApplicationIdentifiers = self->super._allowedApplicationIdentifiers;
  self->super._allowedApplicationIdentifiers = v5;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        v13 = [DNDApplicationIdentifier alloc];
        v14 = -[DNDApplicationIdentifier initWithBundleID:](v13, "initWithBundleID:", v12, (void)v16);
        v15 = [v7 objectForKeyedSubscript:v12];
        [(NSMutableDictionary *)self->super._allowedApplicationIdentifiers setObject:v15 forKeyedSubscript:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)setDeniedApplications:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] set];
  deniedApplicationIdentifiers = self->super._deniedApplicationIdentifiers;
  self->super._deniedApplicationIdentifiers = v5;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
        v13 = [DNDApplicationIdentifier alloc];
        v14 = -[DNDApplicationIdentifier initWithBundleID:](v13, "initWithBundleID:", v12, (void)v15);
        [(NSMutableSet *)self->super._deniedApplicationIdentifiers addObject:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)setSenderConfiguration:(id)a3
{
  self->super._senderConfiguration = (DNDMutableSenderConfiguration *)[a3 mutableCopy];
  MEMORY[0x1F41817F8]();
}

- (void)setMinimumBreakthroughUrgency:(unint64_t)a3
{
  self->super._minimumBreakthroughUrgency = a3;
}

- (void)setHideApplicationBadges:(unint64_t)a3
{
  self->super._hideApplicationBadges = a3;
}

- (void)setAllowIntelligentManagement:(unint64_t)a3
{
  self->super._allowIntelligentManagement = a3;
}

- (void)setCompatibilityVersion:(int64_t)a3
{
  self->super._compatibilityVersion = a3;
}

- (void)setExceptionForApplication:(id)a3
{
  id v4 = a3;
  v5 = [[DNDApplicationIdentifier alloc] initWithBundleID:v4];

  [(DNDMutableConfiguration *)self setExceptionForApplicationIdentifier:v5];
}

- (void)setExceptionForApplicationIdentifier:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [(DNDConfiguration *)self applicationConfigurationType];
  if (v4 == 1)
  {
    [(NSMutableDictionary *)self->super._allowedApplicationIdentifiers removeObjectForKey:v7];
    [(NSMutableSet *)self->super._deniedApplicationIdentifiers addObject:v7];
  }
  else if (!v4)
  {
    [(NSMutableSet *)self->super._deniedApplicationIdentifiers removeObject:v7];
    allowedApplicationIdentifiers = self->super._allowedApplicationIdentifiers;
    v6 = +[DNDApplicationConfiguration defaultConfiguration];
    [(NSMutableDictionary *)allowedApplicationIdentifiers setObject:v6 forKey:v7];
  }
}

- (void)removeExceptionForApplication:(id)a3
{
  id v4 = a3;
  v5 = [[DNDApplicationIdentifier alloc] initWithBundleID:v4];

  [(DNDMutableConfiguration *)self removeExceptionForApplicationIdentifier:v5];
}

- (void)removeExceptionForApplicationIdentifier:(id)a3
{
  allowedApplicationIdentifiers = self->super._allowedApplicationIdentifiers;
  id v5 = a3;
  [(NSMutableDictionary *)allowedApplicationIdentifiers removeObjectForKey:v5];
  [(NSMutableSet *)self->super._deniedApplicationIdentifiers removeObject:v5];
}

- (void)setExceptionForApplication:(id)a3 thread:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[DNDApplicationIdentifier alloc] initWithBundleID:v7];

  [(DNDMutableConfiguration *)self setExceptionForApplicationIdentifier:v8 thread:v6];
}

- (void)setExceptionForApplicationIdentifier:(id)a3 thread:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(DNDMutableConfiguration *)self _configurationForApplicationIdentifier:v14];
  uint64_t v8 = (void *)[v7 mutableCopy];

  unint64_t v9 = [(DNDConfiguration *)self threadConfigurationType];
  if (v9 == 1)
  {
    uint64_t v12 = [v8 allowedThreads];
    [v12 removeObject:v6];

    uint64_t v11 = [v8 deniedThreads];
  }
  else
  {
    if (v9) {
      goto LABEL_6;
    }
    uint64_t v10 = [v8 deniedThreads];
    [v10 removeObject:v6];

    uint64_t v11 = [v8 allowedThreads];
  }
  v13 = v11;
  [v11 addObject:v6];

LABEL_6:
  [(NSMutableDictionary *)self->super._allowedApplicationIdentifiers setObject:v8 forKey:v14];
}

- (void)removeExceptionForApplication:(id)a3 thread:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[DNDApplicationIdentifier alloc] initWithBundleID:v7];

  [(DNDMutableConfiguration *)self removeExceptionForApplicationIdentifier:v8 thread:v6];
}

- (void)removeExceptionForApplicationIdentifier:(id)a3 thread:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(DNDMutableConfiguration *)self _configurationForApplicationIdentifier:v7];
  id v11 = (id)[v8 mutableCopy];

  unint64_t v9 = [v11 allowedThreads];
  [v9 removeObject:v6];

  uint64_t v10 = [v11 deniedThreads];
  [v10 removeObject:v6];

  [(NSMutableDictionary *)self->super._allowedApplicationIdentifiers setObject:v11 forKey:v7];
}

- (void)setExceptionForWebApplicationIdentifier:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [(DNDConfiguration *)self applicationConfigurationType];
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    uint64_t v5 = 48;
    uint64_t v6 = 40;
  }
  else
  {
    uint64_t v5 = 40;
    uint64_t v6 = 48;
  }
  [*(id *)((char *)&self->super.super.isa + v6) removeObject:v7];
  [*(id *)((char *)&self->super.super.isa + v5) addObject:v7];
LABEL_6:
}

- (void)removeExceptionForWebApplicationIdentifier:(id)a3
{
  allowedWebApplicationIdentifiers = self->super._allowedWebApplicationIdentifiers;
  id v5 = a3;
  [(NSMutableSet *)allowedWebApplicationIdentifiers removeObject:v5];
  [(NSMutableSet *)self->super._deniedWebApplicationIdentifiers removeObject:v5];
}

- (void)setExceptionForContactType:(unint64_t)a3
{
  unint64_t v5 = [(DNDConfiguration *)self senderConfigurationType];
  if (v5 == 1)
  {
    unint64_t v9 = [(DNDSenderConfiguration *)self->super._senderConfiguration allowedContactTypes];
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
    [v9 removeObject:v10];

    uint64_t v8 = [(DNDSenderConfiguration *)self->super._senderConfiguration deniedContactTypes];
  }
  else
  {
    if (v5) {
      return;
    }
    uint64_t v6 = [(DNDSenderConfiguration *)self->super._senderConfiguration deniedContactTypes];
    id v7 = [NSNumber numberWithUnsignedInteger:a3];
    [v6 removeObject:v7];

    uint64_t v8 = [(DNDSenderConfiguration *)self->super._senderConfiguration allowedContactTypes];
  }
  id v12 = (id)v8;
  id v11 = [NSNumber numberWithUnsignedInteger:a3];
  [v12 addObject:v11];
}

- (void)removeExceptionForContactType:(unint64_t)a3
{
  unint64_t v5 = [(DNDSenderConfiguration *)self->super._senderConfiguration allowedContactTypes];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 removeObject:v6];

  id v8 = [(DNDSenderConfiguration *)self->super._senderConfiguration deniedContactTypes];
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  [v8 removeObject:v7];
}

- (void)setExceptionForContactGroup:(id)a3
{
  id v9 = a3;
  unint64_t v4 = [(DNDConfiguration *)self senderConfigurationType];
  if (v4 == 1)
  {
    id v7 = [(DNDSenderConfiguration *)self->super._senderConfiguration allowedContactGroups];
    [v7 removeObject:v9];

    uint64_t v6 = [(DNDSenderConfiguration *)self->super._senderConfiguration deniedContactGroups];
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    unint64_t v5 = [(DNDSenderConfiguration *)self->super._senderConfiguration deniedContactGroups];
    [v5 removeObject:v9];

    uint64_t v6 = [(DNDSenderConfiguration *)self->super._senderConfiguration allowedContactGroups];
  }
  id v8 = v6;
  [v6 addObject:v9];

LABEL_6:
}

- (void)removeExceptionForContactGroup:(id)a3
{
  senderConfiguration = self->super._senderConfiguration;
  id v5 = a3;
  uint64_t v6 = [(DNDSenderConfiguration *)senderConfiguration allowedContactGroups];
  [v6 removeObject:v5];

  id v7 = [(DNDSenderConfiguration *)self->super._senderConfiguration deniedContactGroups];
  [v7 removeObject:v5];
}

- (void)setExceptionForContact:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [(DNDConfiguration *)self senderConfigurationType];
  if (v4 == 1)
  {
    [(DNDMutableSenderConfiguration *)self->super._senderConfiguration removeAllowedContactMatchingContact:v7];
    id v5 = [(DNDSenderConfiguration *)self->super._senderConfiguration deniedContacts];
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    [(DNDMutableSenderConfiguration *)self->super._senderConfiguration removeDeniedContactMatchingContact:v7];
    id v5 = [(DNDSenderConfiguration *)self->super._senderConfiguration allowedContacts];
  }
  uint64_t v6 = v5;
  [v5 addObject:v7];

LABEL_6:
}

- (void)removeExceptionForContact:(id)a3
{
  senderConfiguration = self->super._senderConfiguration;
  id v5 = a3;
  [(DNDMutableSenderConfiguration *)senderConfiguration removeAllowedContactMatchingContact:v5];
  [(DNDMutableSenderConfiguration *)self->super._senderConfiguration removeDeniedContactMatchingContact:v5];
}

- (void)setPhoneCallBypassSettings:(id)a3
{
}

- (BOOL)hasSecureData
{
  id v3 = [(DNDSenderConfiguration *)self->super._senderConfiguration allowedContacts];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 1;
  }
  id v5 = [(DNDSenderConfiguration *)self->super._senderConfiguration deniedContacts];
  uint64_t v6 = [v5 count];

  if (v6) {
    return 1;
  }
  id v7 = [(DNDSenderConfiguration *)self->super._senderConfiguration allowedContactGroups];
  uint64_t v8 = [v7 count];

  if (v8) {
    return 1;
  }
  id v9 = [(DNDSenderConfiguration *)self->super._senderConfiguration deniedContactGroups];
  uint64_t v10 = [v9 count];

  if (v10) {
    return 1;
  }
  id v11 = [(DNDSenderConfiguration *)self->super._senderConfiguration allowedContactTypes];
  uint64_t v12 = [v11 count];

  if (v12) {
    return 1;
  }
  v13 = [(DNDSenderConfiguration *)self->super._senderConfiguration deniedContactTypes];
  uint64_t v14 = [v13 count];

  return v14
      || [(NSMutableDictionary *)self->super._allowedApplicationIdentifiers count]
      || [(NSMutableSet *)self->super._deniedApplicationIdentifiers count] != 0;
}

- (id)_configurationForApplicationIdentifier:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->super._allowedApplicationIdentifiers objectForKeyedSubscript:a3];
  if (!v3)
  {
    id v3 = +[DNDApplicationConfiguration defaultConfiguration];
  }
  return v3;
}

- (void)setExceptionOfType:(unint64_t)a3 forApplicationIdentifier:(id)a4
{
  id v6 = a4;
  id v8 = v6;
  if (a3)
  {
    id v7 = v6;
    if (a3 == 1)
    {
      id v6 = [(DNDConfiguration *)self applicationConfigurationType];
      id v7 = v8;
      if (v6 == (id)1) {
        goto LABEL_4;
      }
    }
  }
  else
  {
    id v6 = [(DNDConfiguration *)self applicationConfigurationType];
    id v7 = v8;
    if (!v6)
    {
LABEL_4:
      id v6 = (id)[(DNDMutableConfiguration *)self setExceptionForApplicationIdentifier:v8];
      id v7 = v8;
    }
  }
  MEMORY[0x1F41817F8](v6, v7);
}

- (void)setExceptionOfType:(unint64_t)a3 forApplicationIdentifier:(id)a4 thread:(id)a5
{
  id v9 = a4;
  id v8 = a5;
  if (a3)
  {
    if (a3 == 1 && [(DNDConfiguration *)self threadConfigurationType] == 1) {
      goto LABEL_4;
    }
  }
  else if (![(DNDConfiguration *)self threadConfigurationType])
  {
LABEL_4:
    [(DNDMutableConfiguration *)self setExceptionForApplicationIdentifier:v9 thread:v8];
  }
}

- (void)setMinimumBreakthroughUrgency:(unint64_t)a3 forApplicationIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(DNDMutableConfiguration *)self _configurationForApplicationIdentifier:v6];
  id v8 = (id)[v7 mutableCopy];

  [v8 setMinimumBreakthroughUrgency:a3];
  [(NSMutableDictionary *)self->super._allowedApplicationIdentifiers setObject:v8 forKey:v6];
}

- (void)setMinimumBreakthroughUrgency:(unint64_t)a3 forApplication:(id)a4
{
  id v6 = a4;
  id v7 = [[DNDApplicationIdentifier alloc] initWithBundleID:v6];

  [(DNDMutableConfiguration *)self setMinimumBreakthroughUrgency:a3 forApplicationIdentifier:v7];
}

- (void)setExceptionOfType:(unint64_t)a3 forContactGroup:(id)a4
{
  id v6 = a4;
  id v8 = v6;
  if (a3)
  {
    id v7 = v6;
    if (a3 == 1)
    {
      id v6 = [(DNDConfiguration *)self senderConfigurationType];
      id v7 = v8;
      if (v6 == (id)1) {
        goto LABEL_4;
      }
    }
  }
  else
  {
    id v6 = [(DNDConfiguration *)self senderConfigurationType];
    id v7 = v8;
    if (!v6)
    {
LABEL_4:
      id v6 = (id)[(DNDMutableConfiguration *)self setExceptionForContactGroup:v8];
      id v7 = v8;
    }
  }
  MEMORY[0x1F41817F8](v6, v7);
}

- (void)setExceptionOfType:(unint64_t)a3 forContactType:(unint64_t)a4
{
  if (a3)
  {
    if (a3 != 1 || [(DNDConfiguration *)self senderConfigurationType] != 1) {
      return;
    }
  }
  else if ([(DNDConfiguration *)self senderConfigurationType])
  {
    return;
  }
  [(DNDMutableConfiguration *)self setExceptionForContactType:a4];
}

- (void)setExceptionOfType:(unint64_t)a3 forContact:(id)a4
{
  id v6 = a4;
  id v8 = v6;
  if (a3)
  {
    id v7 = v6;
    if (a3 == 1)
    {
      id v6 = [(DNDConfiguration *)self senderConfigurationType];
      id v7 = v8;
      if (v6 == (id)1) {
        goto LABEL_4;
      }
    }
  }
  else
  {
    id v6 = [(DNDConfiguration *)self senderConfigurationType];
    id v7 = v8;
    if (!v6)
    {
LABEL_4:
      id v6 = (id)[(DNDMutableConfiguration *)self setExceptionForContact:v8];
      id v7 = v8;
    }
  }
  MEMORY[0x1F41817F8](v6, v7);
}

- (void)setExceptionOfType:(unint64_t)a3 forApplication:(id)a4
{
  id v6 = a4;
  id v7 = [[DNDApplicationIdentifier alloc] initWithBundleID:v6];

  [(DNDMutableConfiguration *)self setExceptionOfType:a3 forApplicationIdentifier:v7];
}

- (void)setExceptionOfType:(unint64_t)a3 forApplication:(id)a4 thread:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [[DNDApplicationIdentifier alloc] initWithBundleID:v9];

  [(DNDMutableConfiguration *)self setExceptionOfType:a3 forApplicationIdentifier:v10 thread:v8];
}

@end