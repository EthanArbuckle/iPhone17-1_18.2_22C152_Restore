@interface EKPersistentSource
+ (Class)meltedClass;
+ (id)defaultPropertiesToLoad;
+ (id)propertyKeyForUniqueIdentifier;
+ (id)relations;
- (BOOL)disabled;
- (BOOL)onlyCreatorCanModify;
- (BOOL)showsNotifications;
- (EKFrozenReminderSource)reminderSource;
- (NSNumber)defaultAlarmOffset;
- (NSString)UUID;
- (NSString)externalID;
- (NSString)externalModificationTag;
- (NSString)title;
- (id)appGroupIdentifier;
- (id)cachedExternalInfoData;
- (id)constraints;
- (id)constraintsName;
- (id)creatorBundleID;
- (id)creatorCodeSigningIdentity;
- (id)defaultAllDayAlarmOffset;
- (id)delegatedAccountOwnerStoreID;
- (id)description;
- (id)lastSyncEndDate;
- (id)lastSyncStartDate;
- (id)notes;
- (id)ownerName;
- (id)pendingPersonaIdentifierForNewSource;
- (id)syncError;
- (int)displayOrder;
- (int)entityType;
- (int)flags;
- (int)flags2;
- (int)managedConfigurationAccountAccess;
- (int)preferredEventPrivateValueRaw;
- (int)strictestEventPrivateValueRaw;
- (int64_t)sourceTypeRaw;
- (void)setAppGroupIdentifier:(id)a3;
- (void)setCachedExternalInfoData:(id)a3;
- (void)setConstraintsName:(id)a3;
- (void)setCreatorBundleID:(id)a3;
- (void)setCreatorCodeSigningIdentity:(id)a3;
- (void)setDefaultAlarmOffset:(id)a3;
- (void)setDefaultAllDayAlarmOffset:(id)a3;
- (void)setDelegatedAccountOwnerStoreID:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisplayOrder:(int)a3;
- (void)setExternalID:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setFlags2:(int)a3;
- (void)setFlags:(int)a3;
- (void)setLastSyncEndDate:(id)a3;
- (void)setLastSyncStartDate:(id)a3;
- (void)setNotes:(id)a3;
- (void)setOnlyCreatorCanModify:(BOOL)a3;
- (void)setOwnerName:(id)a3;
- (void)setPendingPersonaIdentifierForNewSource:(id)a3;
- (void)setPreferredEventPrivateValueRaw:(int)a3;
- (void)setReminderSource:(id)a3;
- (void)setShowsNotifications:(BOOL)a3;
- (void)setSourceTypeRaw:(int64_t)a3;
- (void)setStrictestEventPrivateValueRaw:(int)a3;
- (void)setSyncError:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation EKPersistentSource

- (int64_t)sourceTypeRaw
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F573C8]];
}

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_12 != -1) {
    dispatch_once(&defaultPropertiesToLoad_onceToken_12, &__block_literal_global_81);
  }
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_11;

  return v2;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (NSString)UUID
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57150]];
}

- (int)flags
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57370]];
}

- (id)delegatedAccountOwnerStoreID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57350]];
}

- (int)managedConfigurationAccountAccess
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57390]];
}

+ (id)relations
{
  if (relations_onceToken_19 != -1) {
    dispatch_once(&relations_onceToken_19, &__block_literal_global_9_7);
  }
  v2 = (void *)relations_relations_19;

  return v2;
}

- (id)syncError
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F573D8]];
}

- (id)lastSyncStartDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F57388]];
}

- (id)lastSyncEndDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F57380]];
}

- (int)entityType
{
  return 6;
}

- (void).cxx_destruct
{
}

- (NSString)title
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F573E0]];
}

- (NSString)externalID
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57158]];
}

void __31__EKPersistentSource_relations__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56EA8]];
  v1 = +[EKRelation relationWithEntityName:@"Calendar" toMany:1 inversePropertyNames:v7];
  uint64_t v2 = *MEMORY[0x1E4F57320];
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56F20]];
  v4 = +[EKRelation relationWithEntityName:@"Error" toMany:0 inversePropertyNames:v3];
  uint64_t v5 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, v2, v4, *MEMORY[0x1E4F573D8], 0);
  v6 = (void *)relations_relations_19;
  relations_relations_19 = v5;
}

void __45__EKPersistentSource_defaultPropertiesToLoad__block_invoke()
{
  v8[13] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F573E0];
  v8[0] = *MEMORY[0x1E4F573C8];
  v8[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F57358];
  v8[2] = *MEMORY[0x1E4F573A8];
  v8[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F57150];
  v8[4] = *MEMORY[0x1E4F57158];
  v8[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F57348];
  v8[6] = *MEMORY[0x1E4F57340];
  v8[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F57370];
  v8[8] = *MEMORY[0x1E4F57350];
  v8[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F573D8];
  v8[10] = *MEMORY[0x1E4F57378];
  v8[11] = v5;
  v8[12] = *MEMORY[0x1E4F57390];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:13];
  id v7 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_11;
  defaultPropertiesToLoad_defaultPropertiesToLoad_11 = v6;
}

- (id)constraints
{
  uint64_t v3 = [(EKPersistentObject *)self eventStore];
  uint64_t v4 = [(EKPersistentObject *)self CADObjectID];
  uint64_t v5 = [v3 cachedConstraintsForEventOrSourceWithCADObjectID:v4];

  return v5;
}

+ (id)propertyKeyForUniqueIdentifier
{
  return (id)*MEMORY[0x1E4F57150];
}

- (void)setSourceTypeRaw:(int64_t)a3
{
}

- (int)preferredEventPrivateValueRaw
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F573B8]];
}

- (void)setPreferredEventPrivateValueRaw:(int)a3
{
}

- (int)strictestEventPrivateValueRaw
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F573D0]];
}

- (void)setStrictestEventPrivateValueRaw:(int)a3
{
}

- (void)setTitle:(id)a3
{
}

- (id)notes
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57398]];
}

- (void)setNotes:(id)a3
{
}

- (NSNumber)defaultAlarmOffset
{
  return (NSNumber *)[(EKPersistentObject *)self primitiveNumberValueForKey:*MEMORY[0x1E4F57340]];
}

- (void)setDefaultAlarmOffset:(id)a3
{
}

- (id)defaultAllDayAlarmOffset
{
  return [(EKPersistentObject *)self primitiveNumberValueForKey:*MEMORY[0x1E4F57348]];
}

- (void)setDefaultAllDayAlarmOffset:(id)a3
{
}

- (void)setUUID:(id)a3
{
}

- (void)setExternalID:(id)a3
{
}

- (id)constraintsName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57328]];
}

- (void)setConstraintsName:(id)a3
{
}

- (NSString)externalModificationTag
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57368]];
}

- (void)setExternalModificationTag:(id)a3
{
}

- (BOOL)disabled
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F57358]];
}

- (void)setDisabled:(BOOL)a3
{
}

- (id)creatorBundleID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57330]];
}

- (void)setCreatorBundleID:(id)a3
{
}

- (id)creatorCodeSigningIdentity
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57338]];
}

- (void)setCreatorCodeSigningIdentity:(id)a3
{
}

- (BOOL)onlyCreatorCanModify
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F573A0]];
}

- (void)setOnlyCreatorCanModify:(BOOL)a3
{
}

- (BOOL)showsNotifications
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F573C0]];
}

- (void)setShowsNotifications:(BOOL)a3
{
}

- (void)setFlags:(int)a3
{
}

- (int)flags2
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57378]];
}

- (void)setFlags2:(int)a3
{
}

- (void)setLastSyncStartDate:(id)a3
{
}

- (void)setLastSyncEndDate:(id)a3
{
}

- (void)setDelegatedAccountOwnerStoreID:(id)a3
{
}

- (int)displayOrder
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57360]];
}

- (void)setDisplayOrder:(int)a3
{
}

- (id)ownerName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F573A8]];
}

- (void)setOwnerName:(id)a3
{
}

- (void)setSyncError:(id)a3
{
}

- (id)cachedExternalInfoData
{
  return [(EKPersistentObject *)self primitiveDataValueForKey:*MEMORY[0x1E4F57318]];
}

- (void)setCachedExternalInfoData:(id)a3
{
}

- (id)appGroupIdentifier
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57310]];
}

- (void)setAppGroupIdentifier:(id)a3
{
}

- (id)pendingPersonaIdentifierForNewSource
{
  return [(EKPersistentObject *)self loadedOrUpdatedPropertyValue:*MEMORY[0x1E4F573B0] wasAvailable:0];
}

- (void)setPendingPersonaIdentifierForNewSource:(id)a3
{
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(EKPersistentSource *)self UUID];
  uint64_t v6 = description_kTypeStrings_0[[(EKPersistentSource *)self sourceTypeRaw]];
  id v7 = [(EKPersistentSource *)self title];
  v8 = [(EKPersistentSource *)self externalID];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> {UUID = %@; type = %@; title = %@; externalId = %@}",
    v4,
    self,
    v5,
    v6,
    v7,
  v9 = v8);

  return v9;
}

- (EKFrozenReminderSource)reminderSource
{
  return (EKFrozenReminderSource *)objc_getProperty(self, a2, 120, 1);
}

- (void)setReminderSource:(id)a3
{
}

@end