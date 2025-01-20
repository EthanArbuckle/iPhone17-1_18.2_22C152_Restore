@interface EKFrozenReminderSource
+ (Class)meltedClass;
- (BOOL)disabled;
- (NSString)sourceIdentifier;
- (REMAccount)remAccount;
- (id)cachedExternalInfoData;
- (id)constraintsName;
- (id)defaultAlarmOffset;
- (id)delegatedAccountOwnerStoreID;
- (id)externalID;
- (id)lastSyncEndDate;
- (id)lastSyncStartDate;
- (id)meltedObjectInStore:(id)a3;
- (id)syncError;
- (id)title;
- (int)flags;
- (int)managedConfigurationAccountAccess;
- (int64_t)sourceTypeRaw;
@end

@implementation EKFrozenReminderSource

- (REMAccount)remAccount
{
  return (REMAccount *)self->super._remObject;
}

- (id)meltedObjectInStore:(id)a3
{
  id v4 = a3;
  v5 = [v4 eventSourceForReminderSource:self];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)EKFrozenReminderSource;
    id v7 = [(EKPersistentObject *)&v10 meltedObjectInStore:v4];
  }
  v8 = v7;

  return v8;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (NSString)sourceIdentifier
{
  v2 = [(EKFrozenReminderSource *)self remAccount];
  v3 = [v2 objectID];
  id v4 = [v3 uuid];
  v5 = [v4 UUIDString];

  return (NSString *)v5;
}

- (int64_t)sourceTypeRaw
{
  v2 = [(EKFrozenReminderSource *)self remAccount];
  unint64_t v3 = [v2 type];

  if (v3 > 7) {
    return 2;
  }
  else {
    return qword_1A4F90148[v3];
  }
}

- (id)title
{
  v2 = [(EKFrozenReminderSource *)self remAccount];
  unint64_t v3 = [v2 name];

  return v3;
}

- (id)externalID
{
  v2 = [(EKFrozenReminderSource *)self remAccount];
  unint64_t v3 = [v2 externalIdentifier];

  return v3;
}

- (id)delegatedAccountOwnerStoreID
{
  return 0;
}

- (id)syncError
{
  return 0;
}

- (id)lastSyncStartDate
{
  return 0;
}

- (id)lastSyncEndDate
{
  return 0;
}

- (id)constraintsName
{
  return 0;
}

- (int)managedConfigurationAccountAccess
{
  return 0;
}

- (int)flags
{
  return 2;
}

- (id)defaultAlarmOffset
{
  return 0;
}

- (BOOL)disabled
{
  return 0;
}

- (id)cachedExternalInfoData
{
  return 0;
}

@end