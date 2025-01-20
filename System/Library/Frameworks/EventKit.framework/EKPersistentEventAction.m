@interface EKPersistentEventAction
+ (Class)meltedClass;
+ (id)relations;
- (id)externalFolderID;
- (id)externalID;
- (id)externalModificationTag;
- (id)externalRepresentation;
- (id)externalScheduleID;
- (id)owner;
- (int)entityType;
- (void)setExternalFolderID:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setExternalRepresentation:(id)a3;
- (void)setExternalScheduleID:(id)a3;
- (void)setOwner:(id)a3;
@end

@implementation EKPersistentEventAction

+ (id)relations
{
  if (relations_onceToken_14 != -1) {
    dispatch_once(&relations_onceToken_14, &__block_literal_global_55);
  }
  v2 = (void *)relations_relations_14;

  return v2;
}

void __36__EKPersistentEventAction_relations__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56F50]];
  v1 = +[EKRelation relationWithEntityName:@"Event" toMany:0 inversePropertyNames:v4 ownsRelated:0];
  uint64_t v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E4F57160], 0);
  v3 = (void *)relations_relations_14;
  relations_relations_14 = v2;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)externalID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57158]];
}

- (void)setExternalID:(id)a3
{
}

- (id)externalFolderID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56F30]];
}

- (void)setExternalFolderID:(id)a3
{
}

- (id)externalScheduleID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56F48]];
}

- (void)setExternalScheduleID:(id)a3
{
}

- (id)externalModificationTag
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56F38]];
}

- (void)setExternalModificationTag:(id)a3
{
}

- (id)externalRepresentation
{
  return [(EKPersistentObject *)self primitiveDataValueForKey:*MEMORY[0x1E4F56F40]];
}

- (void)setExternalRepresentation:(id)a3
{
}

- (int)entityType
{
  return 9;
}

- (id)owner
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57160]];
}

- (void)setOwner:(id)a3
{
}

@end