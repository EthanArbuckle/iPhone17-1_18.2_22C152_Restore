@interface EKPersistentResourceChangeNotification
+ (Class)meltedClass;
+ (id)relations;
- (id)lastModifiedDate;
- (id)resourceChanges;
- (int)entityType;
- (void)setLastModifiedDate:(id)a3;
- (void)setResourceChanges:(id)a3;
@end

@implementation EKPersistentResourceChangeNotification

+ (id)relations
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__EKPersistentResourceChangeNotification_relations__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (relations_onceToken_18 != -1) {
    dispatch_once(&relations_onceToken_18, block);
  }
  v2 = (void *)relations_relations_18;

  return v2;
}

void __51__EKPersistentResourceChangeNotification_relations__block_invoke(uint64_t a1)
{
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___EKPersistentResourceChangeNotification;
  v1 = objc_msgSendSuper2(&v7, sel_relations);
  v2 = (void *)[v1 mutableCopy];

  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:@"notification"];
  v4 = +[EKRelation relationWithEntityName:@"ResourceChange" toMany:1 inversePropertyNames:v3];
  [v2 setObject:v4 forKey:*MEMORY[0x1E4F57118]];

  uint64_t v5 = [v2 copy];
  v6 = (void *)relations_relations_18;
  relations_relations_18 = v5;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (int)entityType
{
  return 17;
}

- (id)lastModifiedDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F57110]];
}

- (void)setLastModifiedDate:(id)a3
{
}

- (id)resourceChanges
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57118]];
}

- (void)setResourceChanges:(id)a3
{
}

@end