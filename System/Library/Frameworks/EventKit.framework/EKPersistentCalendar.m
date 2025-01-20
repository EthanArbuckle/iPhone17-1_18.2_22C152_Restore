@interface EKPersistentCalendar
+ (Class)meltedClass;
+ (id)calendarWithRandomUUID;
+ (id)defaultPropertiesToLoad;
+ (id)propertyKeyForUniqueIdentifier;
+ (id)relations;
- (BOOL)isColorDisplayOnly;
- (BOOL)isPublished;
- (EKPersistentSource)source;
- (NSSet)sharees;
- (NSString)UUID;
- (NSString)colorStringRaw;
- (NSString)externalID;
- (NSString)externalModificationTag;
- (NSString)ownerIdentityDisplayName;
- (NSString)ownerIdentityEmail;
- (NSString)ownerIdentityFirstName;
- (NSString)ownerIdentityLastName;
- (NSString)ownerIdentityPhoneNumber;
- (NSString)pushKey;
- (NSString)selfIdentityAddressString;
- (NSString)selfIdentityDisplayName;
- (NSString)selfIdentityEmail;
- (NSString)selfIdentityFirstName;
- (NSString)selfIdentityLastName;
- (NSString)selfIdentityPhoneNumber;
- (NSString)sharedOwnerName;
- (NSString)sharedOwnerURLString;
- (NSString)subcalAccountID;
- (NSString)symbolicColorName;
- (NSString)unlocalizedTitle;
- (id)allAlarms;
- (id)cachedExternalInfoData;
- (id)description;
- (id)digest;
- (id)externalIDTag;
- (id)externalRepresentation;
- (id)image;
- (id)lastSyncEndDate;
- (id)lastSyncStartDate;
- (id)lastSyncTitle;
- (id)locale;
- (id)notes;
- (id)notifications;
- (id)ownerIdentityAddressString;
- (id)pubcalAccountID;
- (id)publishURLString;
- (id)refreshDate;
- (id)subcalURL;
- (id)subscriptionID;
- (id)syncError;
- (id)syncToken;
- (int)allowedEntities;
- (int)displayOrder;
- (int)entityType;
- (int)flags;
- (int)ownerIdentityId;
- (int)refreshInterval;
- (int64_t)maxAttendees;
- (unint64_t)invitationStatus;
- (unint64_t)sharingInvitationResponse;
- (unint64_t)sharingStatus;
- (void)setAllAlarms:(id)a3;
- (void)setAllowedEntities:(int)a3;
- (void)setCachedExternalInfoData:(id)a3;
- (void)setColorDisplayOnly:(BOOL)a3;
- (void)setColorStringRaw:(id)a3;
- (void)setDigest:(id)a3;
- (void)setDisplayOrder:(int)a3;
- (void)setExternalID:(id)a3;
- (void)setExternalIDTag:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setExternalRepresentation:(id)a3;
- (void)setFlags:(int)a3;
- (void)setImage:(id)a3;
- (void)setInvitationStatus:(unint64_t)a3;
- (void)setIsPublished:(BOOL)a3;
- (void)setLastSyncEndDate:(id)a3;
- (void)setLastSyncStartDate:(id)a3;
- (void)setLastSyncTitle:(id)a3;
- (void)setLocale:(id)a3;
- (void)setMaxAttendees:(int64_t)a3;
- (void)setNotes:(id)a3;
- (void)setNotifications:(id)a3;
- (void)setOwnerIdentityAddressString:(id)a3;
- (void)setOwnerIdentityDisplayName:(id)a3;
- (void)setOwnerIdentityEmail:(id)a3;
- (void)setOwnerIdentityFirstName:(id)a3;
- (void)setOwnerIdentityId:(int)a3;
- (void)setOwnerIdentityLastName:(id)a3;
- (void)setOwnerIdentityPhoneNumber:(id)a3;
- (void)setPubcalAccountID:(id)a3;
- (void)setPublishURLString:(id)a3;
- (void)setPublished:(BOOL)a3;
- (void)setPushKey:(id)a3;
- (void)setRefreshDate:(id)a3;
- (void)setRefreshInterval:(int)a3;
- (void)setSelfIdentityAddressString:(id)a3;
- (void)setSelfIdentityDisplayName:(id)a3;
- (void)setSelfIdentityEmail:(id)a3;
- (void)setSelfIdentityFirstName:(id)a3;
- (void)setSelfIdentityLastName:(id)a3;
- (void)setSelfIdentityPhoneNumber:(id)a3;
- (void)setSharedOwnerName:(id)a3;
- (void)setSharedOwnerURLString:(id)a3;
- (void)setSharees:(id)a3;
- (void)setSharingInvitationResponse:(unint64_t)a3;
- (void)setSharingStatus:(unint64_t)a3;
- (void)setSource:(id)a3;
- (void)setSubcalAccountID:(id)a3;
- (void)setSubcalURL:(id)a3;
- (void)setSubscriptionID:(id)a3;
- (void)setSymbolicColorName:(id)a3;
- (void)setSyncError:(id)a3;
- (void)setSyncToken:(id)a3;
- (void)setUUID:(id)a3;
- (void)setUnlocalizedTitle:(id)a3;
@end

@implementation EKPersistentCalendar

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_0 != -1) {
    dispatch_once(&defaultPropertiesToLoad_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_0;

  return v2;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (int)flags
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56D98]];
}

- (NSString)symbolicColorName
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56EC8]];
}

- (EKPersistentSource)source
{
  return (EKPersistentSource *)[(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56EA8]];
}

- (int)allowedEntities
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56D50]];
}

- (NSString)UUID
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57150]];
}

+ (id)relations
{
  if (relations_onceToken_0 != -1) {
    dispatch_once(&relations_onceToken_0, &__block_literal_global_9_1);
  }
  v2 = (void *)relations_relations_0;

  return v2;
}

- (NSString)unlocalizedTitle
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56EE0]];
}

- (NSString)externalID
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57158]];
}

- (id)syncError
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56ED0]];
}

- (int)entityType
{
  return 1;
}

void __33__EKPersistentCalendar_relations__block_invoke()
{
  id v16 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v18 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F57320]];
  v15 = +[EKRelation relationWithEntityName:@"Source" toMany:0 inversePropertyNames:v18 ownsRelated:0];
  uint64_t v14 = *MEMORY[0x1E4F56EA8];
  v17 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F57160]];
  v13 = +[EKRelation relationWithEntityName:@"Sharee" toMany:1 inversePropertyNames:v17];
  uint64_t v12 = *MEMORY[0x1E4F56E90];
  v0 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56A90]];
  v1 = +[EKRelation relationWithEntityName:@"Alarm" toMany:1 inversePropertyNames:v0];
  uint64_t v2 = *MEMORY[0x1E4F56D48];
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F570E0]];
  v4 = +[EKRelation relationWithEntityName:@"Notification" toMany:1 inversePropertyNames:v3];
  uint64_t v5 = *MEMORY[0x1E4F56DE8];
  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56F08]];
  v7 = +[EKRelation relationWithEntityName:@"Error" toMany:0 inversePropertyNames:v6];
  uint64_t v8 = *MEMORY[0x1E4F56ED0];
  v9 = +[EKRelation relationWithEntityName:@"Image" toMany:0 inversePropertyNames:0 ownsRelated:0];
  uint64_t v10 = objc_msgSend(v16, "initWithObjectsAndKeys:", v15, v14, v13, v12, v1, v2, v4, v5, v7, v8, v9, *MEMORY[0x1E4F56DA0], 0);
  v11 = (void *)relations_relations_0;
  relations_relations_0 = v10;
}

void __47__EKPersistentCalendar_defaultPropertiesToLoad__block_invoke()
{
  v9[14] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56EC8];
  v9[0] = *MEMORY[0x1E4F56D68];
  v9[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F56EA8];
  v9[2] = *MEMORY[0x1E4F56D78];
  v9[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F56D50];
  v9[4] = *MEMORY[0x1E4F56D98];
  v9[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F56EA0];
  v9[6] = *MEMORY[0x1E4F57150];
  v9[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F56DB0];
  v9[8] = *MEMORY[0x1E4F56E88];
  v9[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F56EE0];
  v9[10] = *MEMORY[0x1E4F56E30];
  v9[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F57158];
  v9[12] = *MEMORY[0x1E4F56ED0];
  v9[13] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:14];
  uint64_t v8 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_0;
  defaultPropertiesToLoad_defaultPropertiesToLoad_0 = v7;
}

- (NSString)externalModificationTag
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56D88]];
}

+ (id)propertyKeyForUniqueIdentifier
{
  return (id)*MEMORY[0x1E4F57150];
}

- (void)setExternalID:(id)a3
{
}

- (id)externalIDTag
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56D80]];
}

- (void)setExternalIDTag:(id)a3
{
}

- (void)setExternalModificationTag:(id)a3
{
}

- (id)syncToken
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56ED8]];
}

- (void)setSyncToken:(id)a3
{
}

- (id)externalRepresentation
{
  return [(EKPersistentObject *)self primitiveDataValueForKey:*MEMORY[0x1E4F56D90]];
}

- (void)setExternalRepresentation:(id)a3
{
  id v4 = (id)[a3 copy];
  [(EKPersistentObject *)self primitiveSetDataValue:v4 forKey:*MEMORY[0x1E4F56D90]];
}

- (void)setUnlocalizedTitle:(id)a3
{
}

- (id)lastSyncTitle
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56DC8]];
}

- (void)setLastSyncTitle:(id)a3
{
}

- (BOOL)isColorDisplayOnly
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F56D60]];
}

- (void)setColorDisplayOnly:(BOOL)a3
{
}

- (void)setSymbolicColorName:(id)a3
{
}

- (NSString)colorStringRaw
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56D68]];
}

- (void)setColorStringRaw:(id)a3
{
}

- (void)setUUID:(id)a3
{
}

- (int)displayOrder
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56D78]];
}

- (void)setDisplayOrder:(int)a3
{
}

- (id)description
{
  char v3 = [(EKPersistentCalendar *)self flags];
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(EKPersistentCalendar *)self unlocalizedTitle];
  if (v3) {
    uint64_t v7 = "NO";
  }
  else {
    uint64_t v7 = "YES";
  }
  uint64_t v8 = [(EKPersistentCalendar *)self colorStringRaw];
  v9 = [(EKPersistentCalendar *)self source];
  uint64_t v10 = [(EKPersistentCalendar *)self sharees];
  objc_msgSend(v4, "stringWithFormat:", @"%@ <%p> {title = %@; allowsModify = %s; color = %@; source = %@; sharees = %@}",
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
  v11 = v10);

  return v11;
}

- (void)setFlags:(int)a3
{
}

- (unint64_t)sharingStatus
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56EA0]];
}

- (void)setSharingStatus:(unint64_t)a3
{
}

- (NSString)sharedOwnerName
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56E80]];
}

- (void)setSharedOwnerName:(id)a3
{
}

- (NSString)sharedOwnerURLString
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56E88]];
}

- (void)setSharedOwnerURLString:(id)a3
{
}

- (id)cachedExternalInfoData
{
  return [(EKPersistentObject *)self primitiveDataValueForKey:*MEMORY[0x1E4F56D58]];
}

- (void)setCachedExternalInfoData:(id)a3
{
}

- (unint64_t)sharingInvitationResponse
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56E98]];
}

- (void)setSharingInvitationResponse:(unint64_t)a3
{
}

- (id)publishURLString
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56E30]];
}

- (void)setPublishURLString:(id)a3
{
}

- (void)setIsPublished:(BOOL)a3
{
}

- (BOOL)isPublished
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F56DB0]];
}

- (void)setPublished:(BOOL)a3
{
}

- (id)notifications
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56DE8]];
}

- (void)setNotifications:(id)a3
{
}

- (NSSet)sharees
{
  return (NSSet *)[(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56E90]];
}

- (void)setSharees:(id)a3
{
}

- (void)setSource:(id)a3
{
}

- (unint64_t)invitationStatus
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56DA8]];
}

- (void)setInvitationStatus:(unint64_t)a3
{
}

- (void)setAllowedEntities:(int)a3
{
}

- (NSString)selfIdentityDisplayName
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56E58]];
}

- (void)setSelfIdentityDisplayName:(id)a3
{
}

- (NSString)selfIdentityEmail
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56E60]];
}

- (void)setSelfIdentityEmail:(id)a3
{
}

- (NSString)selfIdentityPhoneNumber
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56E78]];
}

- (void)setSelfIdentityPhoneNumber:(id)a3
{
}

- (NSString)selfIdentityAddressString
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56E50]];
}

- (void)setSelfIdentityAddressString:(id)a3
{
}

- (NSString)selfIdentityFirstName
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56E68]];
}

- (void)setSelfIdentityFirstName:(id)a3
{
}

- (NSString)selfIdentityLastName
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56E70]];
}

- (void)setSelfIdentityLastName:(id)a3
{
}

- (NSString)ownerIdentityDisplayName
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56DF8]];
}

- (int)ownerIdentityId
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56E10]];
}

- (void)setOwnerIdentityId:(int)a3
{
}

- (void)setOwnerIdentityDisplayName:(id)a3
{
}

- (NSString)ownerIdentityEmail
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56E00]];
}

- (void)setOwnerIdentityEmail:(id)a3
{
}

- (NSString)ownerIdentityPhoneNumber
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56E20]];
}

- (void)setOwnerIdentityPhoneNumber:(id)a3
{
}

- (id)ownerIdentityAddressString
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56DF0]];
}

- (void)setOwnerIdentityAddressString:(id)a3
{
}

- (NSString)ownerIdentityFirstName
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56E08]];
}

- (void)setOwnerIdentityFirstName:(id)a3
{
}

- (NSString)ownerIdentityLastName
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56E18]];
}

- (void)setOwnerIdentityLastName:(id)a3
{
}

- (id)notes
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56DE0]];
}

- (void)setNotes:(id)a3
{
}

- (id)pubcalAccountID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56E28]];
}

- (void)setPubcalAccountID:(id)a3
{
}

- (NSString)subcalAccountID
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56EB0]];
}

- (void)setSubcalAccountID:(id)a3
{
}

- (id)subcalURL
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56EB8]];
}

- (void)setSubcalURL:(id)a3
{
}

- (NSString)pushKey
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56E38]];
}

- (void)setPushKey:(id)a3
{
}

- (id)digest
{
  return [(EKPersistentObject *)self primitiveDataValueForKey:*MEMORY[0x1E4F56D70]];
}

- (void)setDigest:(id)a3
{
}

- (void)setAllAlarms:(id)a3
{
}

- (id)allAlarms
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56D48]];
}

- (id)refreshDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F56E40]];
}

- (void)setRefreshDate:(id)a3
{
}

- (int)refreshInterval
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56E48]];
}

- (void)setRefreshInterval:(int)a3
{
}

- (id)subscriptionID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56EC0]];
}

- (void)setSubscriptionID:(id)a3
{
}

- (id)lastSyncStartDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F56DC0]];
}

- (void)setLastSyncStartDate:(id)a3
{
}

- (id)lastSyncEndDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F56DB8]];
}

- (void)setLastSyncEndDate:(id)a3
{
}

- (void)setSyncError:(id)a3
{
}

- (int64_t)maxAttendees
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56DD8]];
}

- (void)setMaxAttendees:(int64_t)a3
{
}

- (id)locale
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56DD0]];
}

- (void)setLocale:(id)a3
{
}

- (id)image
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56DA0]];
}

- (void)setImage:(id)a3
{
}

+ (id)calendarWithRandomUUID
{
  uint64_t v2 = objc_alloc_init(EKPersistentCalendar);
  char v3 = EKUUIDString();
  [(EKPersistentCalendar *)v2 setUUID:v3];

  return v2;
}

@end