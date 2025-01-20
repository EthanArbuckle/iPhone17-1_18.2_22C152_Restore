@interface EKPersistentSuggestedEventInfo
+ (Class)meltedClass;
+ (id)relations;
+ (id)suggestedEventInfoWithOpaqueKey:(id)a3 uniqueKey:(id)a4;
- (BOOL)changesAcknowledged;
- (EKPersistentEvent)owner;
- (NSString)extractionGroupIdentifier;
- (NSString)opaqueKey;
- (NSString)uniqueKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)semanticIdentifier;
- (id)timestampAsDate;
- (int)entityType;
- (unint64_t)changedFields;
- (void)setChangedFields:(unint64_t)a3;
- (void)setChangesAcknowledged:(BOOL)a3;
- (void)setExtractionGroupIdentifier:(id)a3;
- (void)setOpaqueKey:(id)a3;
- (void)setOwner:(id)a3;
- (void)setTimestampAsDate:(id)a3;
- (void)setUniqueKey:(id)a3;
@end

@implementation EKPersistentSuggestedEventInfo

+ (id)suggestedEventInfoWithOpaqueKey:(id)a3 uniqueKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setOpaqueKey:v6];

  [v7 setUniqueKey:v5];

  return v7;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  id v5 = [(EKPersistentSuggestedEventInfo *)self opaqueKey];
  [v4 setOpaqueKey:v5];

  id v6 = [(EKPersistentSuggestedEventInfo *)self uniqueKey];
  [v4 setUniqueKey:v6];

  v7 = [(EKPersistentSuggestedEventInfo *)self extractionGroupIdentifier];
  [v4 setExtractionGroupIdentifier:v7];

  objc_msgSend(v4, "setChangesAcknowledged:", -[EKPersistentSuggestedEventInfo changesAcknowledged](self, "changesAcknowledged"));
  objc_msgSend(v4, "setChangedFields:", -[EKPersistentSuggestedEventInfo changedFields](self, "changedFields"));
  v8 = [(EKPersistentSuggestedEventInfo *)self timestampAsDate];
  [v4 setTimestampAsDate:v8];

  return v4;
}

+ (id)relations
{
  if (relations_onceToken_15 != -1) {
    dispatch_once(&relations_onceToken_15, &__block_literal_global_60);
  }
  v2 = (void *)relations_relations_15;

  return v2;
}

void __43__EKPersistentSuggestedEventInfo_relations__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F57030]];
  v1 = +[EKRelation relationWithEntityName:@"CalendarItem" toMany:0 inversePropertyNames:v4 ownsRelated:0];
  uint64_t v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E4F57160], 0);
  v3 = (void *)relations_relations_15;
  relations_relations_15 = v2;
}

- (int)entityType
{
  return 20;
}

- (NSString)opaqueKey
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57400]];
}

- (void)setOpaqueKey:(id)a3
{
}

- (NSString)uniqueKey
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57410]];
}

- (void)setUniqueKey:(id)a3
{
}

- (NSString)extractionGroupIdentifier
{
  return (NSString *)[(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F573F8]];
}

- (void)setExtractionGroupIdentifier:(id)a3
{
}

- (unint64_t)changedFields
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F573E8]];
}

- (void)setChangedFields:(unint64_t)a3
{
}

- (BOOL)changesAcknowledged
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F573F0]] != 0;
}

- (void)setChangesAcknowledged:(BOOL)a3
{
}

- (id)timestampAsDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F57408]];
}

- (void)setTimestampAsDate:(id)a3
{
}

- (void)setOwner:(id)a3
{
}

- (EKPersistentEvent)owner
{
  return (EKPersistentEvent *)[(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57160]];
}

- (id)semanticIdentifier
{
  v3 = [(EKPersistentObject *)self uniqueIdentifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EKPersistentSuggestedEventInfo;
    id v5 = [(EKPersistentObject *)&v8 semanticIdentifier];
  }
  id v6 = v5;

  return v6;
}

@end