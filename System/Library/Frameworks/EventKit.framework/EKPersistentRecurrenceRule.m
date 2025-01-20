@interface EKPersistentRecurrenceRule
+ (Class)alternateUniverseClass;
+ (Class)meltedClass;
+ (id)defaultPropertiesToLoad;
+ (id)propertyKeyForUniqueIdentifier;
+ (id)relations;
- (id)UUID;
- (id)cachedEndDate;
- (id)cachedEndDateTimeZone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)endDate;
- (id)owner;
- (id)specifier;
- (int)entityType;
- (int)frequencyRaw;
- (int64_t)firstDayOfTheWeekRaw;
- (int64_t)interval;
- (unint64_t)count;
- (void)setCachedEndDate:(id)a3;
- (void)setCachedEndDateTimeZone:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setEndDate:(id)a3;
- (void)setFirstDayOfTheWeekRaw:(int64_t)a3;
- (void)setFrequencyRaw:(int)a3;
- (void)setInterval:(int64_t)a3;
- (void)setOwner:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation EKPersistentRecurrenceRule

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_1 != -1) {
    dispatch_once(&defaultPropertiesToLoad_onceToken_1, &__block_literal_global_7);
  }
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_1;

  return v2;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (int)entityType
{
  return 5;
}

- (id)endDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F57200]];
}

- (unint64_t)count
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F571F8]];
}

- (id)specifier
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57228]];
}

- (int)frequencyRaw
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57210]];
}

- (int64_t)interval
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57218]];
}

- (int64_t)firstDayOfTheWeekRaw
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57208]];
}

void __53__EKPersistentRecurrenceRule_defaultPropertiesToLoad__block_invoke()
{
  v5[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F57218];
  v5[0] = *MEMORY[0x1E4F57210];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F571F8];
  v5[2] = *MEMORY[0x1E4F57200];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F57228];
  v5[4] = *MEMORY[0x1E4F57208];
  v5[5] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:6];
  v4 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_1;
  defaultPropertiesToLoad_defaultPropertiesToLoad_1 = v3;
}

+ (id)relations
{
  if (relations_onceToken_3 != -1) {
    dispatch_once(&relations_onceToken_3, &__block_literal_global_9_2);
  }
  uint64_t v2 = (void *)relations_relations_3;

  return v2;
}

void __39__EKPersistentRecurrenceRule_relations__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56C80]];
  uint64_t v1 = +[EKRelation relationWithEntityName:@"CalendarItem" toMany:0 inversePropertyNames:v4 ownsRelated:0];
  uint64_t v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E4F57220], 0);
  uint64_t v3 = (void *)relations_relations_3;
  relations_relations_3 = v2;
}

+ (Class)alternateUniverseClass
{
  return (Class)objc_opt_class();
}

- (id)UUID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57150]];
}

- (void)setUUID:(id)a3
{
}

- (id)owner
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57220]];
}

- (void)setOwner:(id)a3
{
}

+ (id)propertyKeyForUniqueIdentifier
{
  return (id)*MEMORY[0x1E4F57150];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(EKPersistentRecurrenceRule *)self frequencyRaw];
  int64_t v6 = [(EKPersistentRecurrenceRule *)self interval];
  int64_t v7 = [(EKPersistentRecurrenceRule *)self firstDayOfTheWeekRaw];
  v8 = [(EKPersistentRecurrenceRule *)self endDate];
  unint64_t v9 = [(EKPersistentRecurrenceRule *)self count];
  v10 = [(EKPersistentRecurrenceRule *)self specifier];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> {frequency = %ld; interval = %ld; firstDayOfWeek = %ld; enddate = %@; count = %lu; specifier = %@}",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
  v11 = v10);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(EKPersistentRecurrenceRule);
  uint64_t v5 = [(EKPersistentRecurrenceRule *)self UUID];
  int64_t v6 = (void *)[v5 copy];
  [(EKPersistentRecurrenceRule *)v4 setUUID:v6];

  [(EKPersistentRecurrenceRule *)v4 setFrequencyRaw:[(EKPersistentRecurrenceRule *)self frequencyRaw]];
  [(EKPersistentRecurrenceRule *)v4 setInterval:[(EKPersistentRecurrenceRule *)self interval]];
  [(EKPersistentRecurrenceRule *)v4 setFirstDayOfTheWeekRaw:[(EKPersistentRecurrenceRule *)self firstDayOfTheWeekRaw]];
  int64_t v7 = [(EKPersistentRecurrenceRule *)self specifier];
  [(EKPersistentRecurrenceRule *)v4 setSpecifier:v7];

  v8 = [(EKPersistentRecurrenceRule *)self endDate];
  [(EKPersistentRecurrenceRule *)v4 setEndDate:v8];

  [(EKPersistentRecurrenceRule *)v4 setCount:[(EKPersistentRecurrenceRule *)self count]];
  return v4;
}

- (void)setFrequencyRaw:(int)a3
{
}

- (void)setInterval:(int64_t)a3
{
}

- (void)setEndDate:(id)a3
{
}

- (void)setCount:(unint64_t)a3
{
}

- (id)cachedEndDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F571E8]];
}

- (void)setCachedEndDate:(id)a3
{
}

- (id)cachedEndDateTimeZone
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F571F0]];
}

- (void)setCachedEndDateTimeZone:(id)a3
{
}

- (void)setFirstDayOfTheWeekRaw:(int64_t)a3
{
}

- (void)setSpecifier:(id)a3
{
}

@end