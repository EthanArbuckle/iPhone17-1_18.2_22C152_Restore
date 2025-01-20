@interface EKPersistentNotification
+ (id)relations;
- (id)UUID;
- (id)calendar;
- (id)externalID;
- (id)externalModificationTag;
- (id)hostURL;
- (int)entityType;
- (void)setExternalID:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setHostURL:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation EKPersistentNotification

+ (id)relations
{
  if (relations_onceToken_2 != -1) {
    dispatch_once(&relations_onceToken_2, &__block_literal_global_4);
  }
  v2 = (void *)relations_relations_2;

  return v2;
}

void __37__EKPersistentNotification_relations__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F570E0];
  v0 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56DE8]];
  v1 = +[EKRelation relationWithEntityName:@"Calendar" toMany:0 inversePropertyNames:v0 ownsRelated:0];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v3 = (void *)relations_relations_2;
  relations_relations_2 = v2;
}

- (int)entityType
{
  return 102;
}

- (id)externalID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57158]];
}

- (void)setExternalID:(id)a3
{
}

- (id)hostURL
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F570F8]];
}

- (void)setHostURL:(id)a3
{
}

- (id)externalModificationTag
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F570F0]];
}

- (void)setExternalModificationTag:(id)a3
{
}

- (id)UUID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57150]];
}

- (void)setUUID:(id)a3
{
}

- (id)calendar
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F570E0]];
}

@end