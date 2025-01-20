@interface EKNotification
+ (Class)frozenClass;
+ (id)knownRelationshipSingleValueKeys;
+ (id)knownRelationshipWeakKeys;
- (BOOL)save:(id *)a3;
- (EKObjectID)objectID;
- (NSString)UUID;
- (NSString)externalID;
- (NSString)externalModificationTag;
- (NSURL)hostURL;
- (id)calendar;
- (void)setExternalID:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setHostURL:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation EKNotification

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownRelationshipSingleValueKeys
{
  if (knownRelationshipSingleValueKeys_onceToken_1 != -1) {
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken_1, &__block_literal_global_34);
  }
  v2 = (void *)knownRelationshipSingleValueKeys_keys_1;

  return v2;
}

void __50__EKNotification_knownRelationshipSingleValueKeys__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F570E0];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)knownRelationshipSingleValueKeys_keys_1;
  knownRelationshipSingleValueKeys_keys_1 = v0;
}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_2 != -1) {
    dispatch_once(&knownRelationshipWeakKeys_onceToken_2, &__block_literal_global_4_0);
  }
  v2 = (void *)knownRelationshipWeakKeys_keys_2;

  return v2;
}

void __43__EKNotification_knownRelationshipWeakKeys__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F57108];
  v3[0] = *MEMORY[0x1E4F570E0];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  v2 = (void *)knownRelationshipWeakKeys_keys_2;
  knownRelationshipWeakKeys_keys_2 = v1;
}

- (EKObjectID)objectID
{
  v2 = [(EKObject *)self persistentObject];
  v3 = [v2 objectID];

  return (EKObjectID *)v3;
}

- (NSString)externalID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57158]];
}

- (void)setExternalID:(id)a3
{
}

- (NSURL)hostURL
{
  return (NSURL *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F570F8]];
}

- (void)setHostURL:(id)a3
{
}

- (NSString)externalModificationTag
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F570F0]];
}

- (void)setExternalModificationTag:(id)a3
{
}

- (NSString)UUID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57150]];
}

- (void)setUUID:(id)a3
{
}

- (id)calendar
{
  return [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F570E0]];
}

- (BOOL)save:(id *)a3
{
  if (a3)
  {
    *a3 = 0;
    if ([(EKObject *)self isNew])
    {
      id v5 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:35, @"In order to save a new notification, add it to a NotificationCollection, save, and commit the collection instead." description];
      BOOL result = 0;
      *a3 = v5;
      return result;
    }
  }
  else if ([(EKObject *)self isNew])
  {
    return 0;
  }
  [(EKObject *)self updatePersistentObject];
  return 1;
}

@end