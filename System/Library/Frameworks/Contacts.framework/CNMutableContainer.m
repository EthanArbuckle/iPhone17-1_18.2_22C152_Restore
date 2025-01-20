@interface CNMutableContainer
- (BOOL)isEnabled;
- (BOOL)isGuardianRestricted;
- (BOOL)isGuardianStateDirty;
- (CNProviderMetadata)providerMetadata;
- (NSData)externalSyncData;
- (NSDate)lastSyncDate;
- (NSString)accountIdentifier;
- (NSString)constraintsPath;
- (NSString)externalIdentifier;
- (NSString)externalModificationTag;
- (NSString)externalSyncTag;
- (NSString)identifier;
- (NSString)meIdentifier;
- (NSString)name;
- (NSString)providerIdentifier;
- (id)copy;
- (id)freeze;
- (id)freezeWithSelfAsSnapshot;
- (int)iOSLegacyIdentifier;
- (int64_t)type;
- (unint64_t)restrictions;
- (void)adoptValuesFromAndSetSnapshot:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setConstraintsPath:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setExternalSyncData:(id)a3;
- (void)setExternalSyncTag:(id)a3;
- (void)setGuardianRestricted:(BOOL)a3;
- (void)setGuardianRestricted:(BOOL)a3 shouldPushChangeToServer:(BOOL)a4;
- (void)setGuardianStateDirty:(BOOL)a3;
- (void)setIOSLegacyIdentifier:(int)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastSyncDate:(id)a3;
- (void)setMeIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setProviderMetadata:(id)a3;
- (void)setRestrictions:(unint64_t)a3;
- (void)setSnapshot:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CNMutableContainer

- (id)copy
{
  v3 = [CNContainer alloc];

  return [(CNContainer *)v3 initWithContainer:self];
}

- (NSString)identifier
{
  return self->super._identifier;
}

- (void)setIdentifier:(id)a3
{
  if (self->super._identifier != a3)
  {
    self->super._identifier = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)name
{
  return self->super._name;
}

- (void)setName:(id)a3
{
  if (self->super._name != a3)
  {
    self->super._name = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (int64_t)type
{
  return self->super._type;
}

- (void)setType:(int64_t)a3
{
  self->super._type = a3;
}

- (int)iOSLegacyIdentifier
{
  return self->super._iOSLegacyIdentifier;
}

- (void)setIOSLegacyIdentifier:(int)a3
{
  self->super._iOSLegacyIdentifier = a3;
}

- (NSString)accountIdentifier
{
  return self->super._accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  if (self->super._accountIdentifier != a3)
  {
    self->super._accountIdentifier = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (BOOL)isEnabled
{
  return self->super._enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->super._enabled = a3;
}

- (NSString)externalIdentifier
{
  return self->super._externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
  if (self->super._externalIdentifier != a3)
  {
    self->super._externalIdentifier = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)externalModificationTag
{
  return self->super._externalModificationTag;
}

- (void)setExternalModificationTag:(id)a3
{
  if (self->super._externalModificationTag != a3)
  {
    self->super._externalModificationTag = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)externalSyncTag
{
  return self->super._externalSyncTag;
}

- (void)setExternalSyncTag:(id)a3
{
  if (self->super._externalSyncTag != a3)
  {
    self->super._externalSyncTag = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSData)externalSyncData
{
  return self->super._externalSyncData;
}

- (void)setExternalSyncData:(id)a3
{
  if (self->super._externalSyncData != a3)
  {
    self->super._externalSyncData = (NSData *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)constraintsPath
{
  return self->super._constraintsPath;
}

- (void)setConstraintsPath:(id)a3
{
  if (self->super._constraintsPath != a3)
  {
    self->super._constraintsPath = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)meIdentifier
{
  return self->super._meIdentifier;
}

- (void)setMeIdentifier:(id)a3
{
  if (self->super._meIdentifier != a3)
  {
    self->super._meIdentifier = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (unint64_t)restrictions
{
  return self->super._restrictions;
}

- (void)setRestrictions:(unint64_t)a3
{
  self->super._restrictions = a3;
}

- (BOOL)isGuardianRestricted
{
  return self->super._guardianRestricted;
}

- (void)setGuardianRestricted:(BOOL)a3
{
  self->super._guardianRestricted = a3;
  self->super._guardianStateDirty = 1;
}

- (BOOL)isGuardianStateDirty
{
  return self->super._guardianStateDirty;
}

- (void)setGuardianStateDirty:(BOOL)a3
{
  self->super._guardianStateDirty = a3;
}

- (void)setGuardianRestricted:(BOOL)a3 shouldPushChangeToServer:(BOOL)a4
{
  self->super._guardianRestricted = a3;
  self->super._guardianStateDirty = a4;
}

- (NSDate)lastSyncDate
{
  return self->super._lastSyncDate;
}

- (void)setLastSyncDate:(id)a3
{
  if (self->super._lastSyncDate != a3)
  {
    self->super._lastSyncDate = (NSDate *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setSnapshot:(id)a3
{
  snapshot = self->super._snapshot;
  if (snapshot != a3)
  {
    self->super._snapshot = 0;
    id v5 = a3;

    v6 = (CNContainer *)[v5 copy];
    v7 = self->super._snapshot;
    self->super._snapshot = v6;
  }
}

- (void)adoptValuesFromAndSetSnapshot:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = +[CN writableContainerProperties];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          v11 = [v10 CNValueForContainer:v4];
          [v10 setCNValue:v11 onContainer:self];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  [(CNMutableContainer *)self setSnapshot:v4];
}

- (id)freeze
{
  v3 = (objc_class *)objc_opt_class();
  object_setClass(self, v3);
  return self;
}

- (id)freezeWithSelfAsSnapshot
{
  v3 = [MEMORY[0x1E4F1CA98] null];
  [(CNMutableContainer *)self setSnapshot:v3];

  return [(CNMutableContainer *)self freeze];
}

- (NSString)providerIdentifier
{
  return self->super._providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
  if (self->super._providerIdentifier != a3)
  {
    self->super._providerIdentifier = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (CNProviderMetadata)providerMetadata
{
  return self->super._providerMetadata;
}

- (void)setProviderMetadata:(id)a3
{
  if (self->super._providerMetadata != a3)
  {
    self->super._providerMetadata = (CNProviderMetadata *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

@end