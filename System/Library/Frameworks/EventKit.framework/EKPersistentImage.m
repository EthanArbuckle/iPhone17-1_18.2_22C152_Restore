@interface EKPersistentImage
+ (Class)meltedClass;
+ (id)defaultPropertiesToLoad;
+ (id)relations;
- (id)colorData;
- (id)identifier;
- (id)name;
- (id)source;
- (int)entityType;
- (int64_t)type;
- (void)setColorData:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setSource:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation EKPersistentImage

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_2 != -1) {
    dispatch_once(&defaultPropertiesToLoad_onceToken_2, &__block_literal_global_10);
  }
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_2;

  return v2;
}

void __44__EKPersistentImage_defaultPropertiesToLoad__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F57058];
  v4[0] = *MEMORY[0x1E4F57050];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F57070];
  v4[2] = *MEMORY[0x1E4F57060];
  v4[3] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  v3 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_2;
  defaultPropertiesToLoad_defaultPropertiesToLoad_2 = v2;
}

+ (id)relations
{
  if (relations_onceToken_4 != -1) {
    dispatch_once(&relations_onceToken_4, &__block_literal_global_9_3);
  }
  uint64_t v2 = (void *)relations_relations_4;

  return v2;
}

void __30__EKPersistentImage_relations__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F57068];
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v1 = +[EKRelation relationWithEntityName:@"Source" toMany:0 inversePropertyNames:v0 ownsRelated:0];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v3 = (void *)relations_relations_4;
  relations_relations_4 = v2;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (int)entityType
{
  return 28;
}

- (id)colorData
{
  return [(EKPersistentObject *)self primitiveDataValueForKey:*MEMORY[0x1E4F57050]];
}

- (void)setColorData:(id)a3
{
}

- (id)identifier
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57058]];
}

- (void)setIdentifier:(id)a3
{
}

- (id)name
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57060]];
}

- (void)setName:(id)a3
{
}

- (int64_t)type
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57070]];
}

- (void)setType:(int64_t)a3
{
}

- (id)source
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57068]];
}

- (void)setSource:(id)a3
{
}

@end