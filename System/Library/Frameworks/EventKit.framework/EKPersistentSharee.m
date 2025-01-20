@interface EKPersistentSharee
+ (Class)meltedClass;
+ (id)defaultPropertiesToLoad;
+ (id)relations;
- (BOOL)shareeMuteRemoval;
- (id)UUID;
- (id)address;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayName;
- (id)externalID;
- (id)firstName;
- (id)lastName;
- (id)owner;
- (int)entityType;
- (int)shareeAccessLevelRaw;
- (int)shareeStatusRaw;
- (void)setAddress:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setOwner:(id)a3;
- (void)setShareeAccessLevelRaw:(int)a3;
- (void)setShareeMuteRemoval:(BOOL)a3;
- (void)setShareeStatusRaw:(int)a3;
- (void)setUUID:(id)a3;
@end

@implementation EKPersistentSharee

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken != -1) {
    dispatch_once(&defaultPropertiesToLoad_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad;

  return v2;
}

void __45__EKPersistentSharee_defaultPropertiesToLoad__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F572B8];
  v3[0] = *MEMORY[0x1E4F57158];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E4F57150];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad;
  defaultPropertiesToLoad_defaultPropertiesToLoad = v1;
}

+ (id)relations
{
  if (relations_onceToken != -1) {
    dispatch_once(&relations_onceToken, &__block_literal_global_9_0);
  }
  v2 = (void *)relations_relations;

  return v2;
}

void __31__EKPersistentSharee_relations__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56E90]];
  uint64_t v1 = +[EKRelation relationWithEntityName:@"Calendar" toMany:0 inversePropertyNames:v4 ownsRelated:0];
  uint64_t v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E4F57160], 0);
  v3 = (void *)relations_relations;
  relations_relations = v2;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(EKPersistentSharee);
  if (v4)
  {
    v5 = EKUUIDString();
    [(EKPersistentSharee *)v4 setUUID:v5];

    v6 = [(EKPersistentSharee *)self displayName];
    [(EKPersistentSharee *)v4 setDisplayName:v6];

    v7 = [(EKPersistentSharee *)self address];
    [(EKPersistentSharee *)v4 setAddress:v7];

    v8 = [(EKPersistentSharee *)self externalID];
    [(EKPersistentSharee *)v4 setExternalID:v8];

    [(EKPersistentSharee *)v4 setShareeStatusRaw:[(EKPersistentSharee *)self shareeStatusRaw]];
    [(EKPersistentSharee *)v4 setShareeAccessLevelRaw:[(EKPersistentSharee *)self shareeAccessLevelRaw]];
  }
  return v4;
}

- (int)entityType
{
  return 15;
}

- (id)UUID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57150]];
}

- (void)setUUID:(id)a3
{
}

- (id)displayName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F572B8]];
}

- (void)setDisplayName:(id)a3
{
}

- (id)address
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F572B0]];
}

- (void)setAddress:(id)a3
{
}

- (id)firstName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F572C0]];
}

- (void)setFirstName:(id)a3
{
}

- (id)lastName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F572C8]];
}

- (void)setLastName:(id)a3
{
}

- (id)externalID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57158]];
}

- (void)setExternalID:(id)a3
{
}

- (int)shareeStatusRaw
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F572D8]];
}

- (void)setShareeStatusRaw:(int)a3
{
}

- (int)shareeAccessLevelRaw
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F572A8]];
}

- (void)setShareeAccessLevelRaw:(int)a3
{
}

- (void)setOwner:(id)a3
{
}

- (id)owner
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57160]];
}

- (BOOL)shareeMuteRemoval
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F572D0]];
}

- (void)setShareeMuteRemoval:(BOOL)a3
{
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(EKPersistentSharee *)self UUID];
  v6 = [(EKPersistentSharee *)self displayName];
  v7 = [(EKPersistentSharee *)self address];
  v8 = [(EKPersistentSharee *)self firstName];
  v9 = [(EKPersistentSharee *)self lastName];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> {UUID = %@; displayName = %@; address = %@; firstName = %@; lastName = %@; status = %lu; accessLevel = %lu;}",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    [(EKPersistentSharee *)self shareeStatusRaw],
  v10 = [(EKPersistentSharee *)self shareeAccessLevelRaw]);

  return v10;
}

@end