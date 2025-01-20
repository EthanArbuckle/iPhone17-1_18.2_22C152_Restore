@interface EKNotificationCollection
+ (BOOL)isWeakRelationship;
+ (Class)frozenClass;
+ (id)knownRelationshipMultiValueKeys;
- (BOOL)_hasNotificationsCollectionFlag;
- (BOOL)save:(id *)a3;
- (BOOL)validate:(id *)a3;
- (EKNotificationCollection)initWithOptions:(id)a3;
- (EKSource)source;
- (NSSet)notifications;
- (unsigned)flags;
- (void)_setNotificationsCollectionFlag;
- (void)addNotification:(id)a3;
- (void)removeNotification:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setExternalIDTag:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setNotifications:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation EKNotificationCollection

+ (id)knownRelationshipMultiValueKeys
{
  if (knownRelationshipMultiValueKeys_onceToken_0 != -1) {
    dispatch_once(&knownRelationshipMultiValueKeys_onceToken_0, &__block_literal_global_43);
  }
  v2 = (void *)knownRelationshipMultiValueKeys_keys_0;

  return v2;
}

void __59__EKNotificationCollection_knownRelationshipMultiValueKeys__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F56DE8];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)knownRelationshipMultiValueKeys_keys_0;
  knownRelationshipMultiValueKeys_keys_0 = v0;
}

+ (BOOL)isWeakRelationship
{
  return 1;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

- (EKNotificationCollection)initWithOptions:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EKNotificationCollection;
  v5 = [(EKObject *)&v13 init];
  if (v5)
  {
    v6 = [v4 source];
    [(EKNotificationCollection *)v5 setSource:v6];

    v7 = [v4 externalID];
    [(EKNotificationCollection *)v5 setExternalID:v7];

    v8 = [v4 externalIDTag];
    [(EKNotificationCollection *)v5 setExternalIDTag:v8];

    [(EKNotificationCollection *)v5 _setNotificationsCollectionFlag];
    v9 = [v4 source];
    v10 = [v9 eventStore];
    v11 = [(EKObject *)v5 persistentObject];
    [v10 _registerObject:v11];
  }
  return v5;
}

- (EKSource)source
{
  return (EKSource *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56EA8]];
}

- (NSSet)notifications
{
  return (NSSet *)[(EKObject *)self meltedAndCachedMultiRelationObjectsForKey:*MEMORY[0x1E4F56DE8]];
}

- (void)setNotifications:(id)a3
{
}

- (void)addNotification:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Adding nil Notification to notification collection."];
    id v4 = 0;
  }
  [(EKObject *)self addCachedMeltedObject:v4 forMultiValueKey:*MEMORY[0x1E4F56DE8]];
}

- (void)removeNotification:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Removing nil Notification from notification collection."];
    id v4 = 0;
  }
  [(EKObject *)self removeCachedMeltedObject:v4 forMultiValueKey:*MEMORY[0x1E4F56DE8]];
}

- (BOOL)validate:(id *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EKNotificationCollection;
  BOOL v5 = -[EKObject validate:](&v8, sel_validate_);
  if (v5)
  {
    if ([(EKNotificationCollection *)self _hasNotificationsCollectionFlag])
    {
      LOBYTE(v5) = 1;
    }
    else if (a3)
    {
      id v6 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:32];
      LOBYTE(v5) = 0;
      *a3 = v6;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)save:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  [(EKObject *)self insertPersistentObjectIfNeeded];
  [(EKObject *)self updatePersistentObject];
  return 1;
}

- (void)setSource:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56EA8];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:+[EKSource frozenClass]];
}

- (void)setExternalID:(id)a3
{
}

- (void)setExternalIDTag:(id)a3
{
}

- (void)_setNotificationsCollectionFlag
{
  uint64_t v3 = [(EKNotificationCollection *)self flags] | 0x40;

  [(EKNotificationCollection *)self setFlags:v3];
}

- (BOOL)_hasNotificationsCollectionFlag
{
  return ([(EKNotificationCollection *)self flags] >> 6) & 1;
}

- (unsigned)flags
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D98]];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (void)setFlags:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56D98]];
}

@end