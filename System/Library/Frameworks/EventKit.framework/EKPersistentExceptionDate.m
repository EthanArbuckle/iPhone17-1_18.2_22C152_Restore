@interface EKPersistentExceptionDate
+ (Class)meltedClass;
+ (id)relations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)date;
- (id)description;
- (id)owner;
- (int)entityType;
- (void)setDate:(id)a3;
- (void)setOwner:(id)a3;
@end

@implementation EKPersistentExceptionDate

+ (id)relations
{
  if (relations_onceToken_10 != -1) {
    dispatch_once(&relations_onceToken_10, &__block_literal_global_42);
  }
  v2 = (void *)relations_relations_10;

  return v2;
}

void __38__EKPersistentExceptionDate_relations__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56BE0]];
  v1 = +[EKRelation relationWithEntityName:@"CalendarItem" toMany:0 inversePropertyNames:v4 ownsRelated:0];
  uint64_t v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E4F57160], 0);
  v3 = (void *)relations_relations_10;
  relations_relations_10 = v2;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(EKPersistentExceptionDate);
  v5 = [(EKPersistentExceptionDate *)self date];
  [(EKPersistentObject *)v4 primitiveSetDateValue:v5 forKey:*MEMORY[0x1E4F57048]];

  return v4;
}

- (id)date
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F57048]];
}

- (void)setDate:(id)a3
{
}

- (int)entityType
{
  return 10;
}

- (id)owner
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57160]];
}

- (void)setOwner:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(EKPersistentExceptionDate *)self date];
  v6 = [v3 stringWithFormat:@"%@ <%p> {date = %@}", v4, self, v5];

  return v6;
}

@end