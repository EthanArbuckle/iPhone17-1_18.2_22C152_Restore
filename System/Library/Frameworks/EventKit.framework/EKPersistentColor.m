@interface EKPersistentColor
+ (Class)meltedClass;
+ (id)defaultPropertiesToLoad;
+ (id)relations;
- (BOOL)allowsDeletion;
- (id)UUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)externalID;
- (id)providerIdentifier;
- (id)source;
- (int)entityType;
- (void)setData:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setSource:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation EKPersistentColor

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_10 != -1) {
    dispatch_once(&defaultPropertiesToLoad_onceToken_10, &__block_literal_global_61);
  }
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_9;

  return v2;
}

void __44__EKPersistentColor_defaultPropertiesToLoad__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56EF0];
  v4[0] = *MEMORY[0x1E4F56EE8];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F57158];
  v4[2] = *MEMORY[0x1E4F57150];
  v4[3] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  v3 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_9;
  defaultPropertiesToLoad_defaultPropertiesToLoad_9 = v2;
}

+ (id)relations
{
  if (relations_onceToken_16 != -1) {
    dispatch_once(&relations_onceToken_16, &__block_literal_global_9_6);
  }
  uint64_t v2 = (void *)relations_relations_16;

  return v2;
}

void __30__EKPersistentColor_relations__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F56EF8];
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v1 = +[EKRelation relationWithEntityName:@"Source" toMany:0 inversePropertyNames:v0 ownsRelated:0];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v3 = (void *)relations_relations_16;
  relations_relations_16 = v2;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(EKPersistentColor);
  v5 = [(EKPersistentColor *)self data];
  [(EKPersistentColor *)v4 setData:v5];

  v6 = [(EKPersistentColor *)self UUID];
  [(EKPersistentColor *)v4 setUUID:v6];

  v7 = [(EKPersistentColor *)self providerIdentifier];
  [(EKPersistentColor *)v4 setProviderIdentifier:v7];

  v8 = [(EKPersistentColor *)self externalID];
  [(EKPersistentColor *)v4 setExternalID:v8];

  v9 = [(EKPersistentColor *)self source];
  [(EKPersistentColor *)v4 setSource:v9];

  return v4;
}

- (int)entityType
{
  return 29;
}

- (id)data
{
  return [(EKPersistentObject *)self primitiveDataValueForKey:*MEMORY[0x1E4F56EE8]];
}

- (void)setData:(id)a3
{
}

- (id)UUID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57150]];
}

- (void)setUUID:(id)a3
{
}

- (id)providerIdentifier
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56EF0]];
}

- (void)setProviderIdentifier:(id)a3
{
}

- (id)externalID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57158]];
}

- (void)setExternalID:(id)a3
{
}

- (id)source
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57068]];
}

- (void)setSource:(id)a3
{
}

- (BOOL)allowsDeletion
{
  return 0;
}

@end