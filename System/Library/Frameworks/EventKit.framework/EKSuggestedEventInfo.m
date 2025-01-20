@interface EKSuggestedEventInfo
+ (Class)frozenClass;
+ (id)knownIdentityKeysForComparison;
+ (id)knownSingleValueKeysForComparison;
- (BOOL)changesAcknowledged;
- (EKSuggestedEventInfo)initWithEventStore:(id)a3 opaqueKey:(id)a4 uniqueKey:(id)a5;
- (EKSuggestedEventInfo)initWithEventStore:(id)a3 opaqueKey:(id)a4 uniqueKey:(id)a5 extractionGroupIdentifier:(id)a6;
- (EKSuggestedEventInfo)initWithOpaqueKey:(id)a3 uniqueKey:(id)a4;
- (EKSuggestedEventInfo)initWithOpaqueKey:(id)a3 uniqueKey:(id)a4 extractionGroupIdentifier:(id)a5;
- (NSString)extractionGroupIdentifier;
- (NSString)opaqueKey;
- (NSString)uniqueKey;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)relatedEvent;
- (id)semanticIdentifier;
- (id)timestampAsDate;
- (unint64_t)changedFields;
- (void)setChangedFields:(unint64_t)a3;
- (void)setChangesAcknowledged:(BOOL)a3;
- (void)setExtractionGroupIdentifier:(id)a3;
- (void)setOpaqueKey:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setTimestampAsDate:(id)a3;
- (void)setUniqueKey:(id)a3;
@end

@implementation EKSuggestedEventInfo

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_1 != -1) {
    dispatch_once(&knownIdentityKeysForComparison_onceToken_1, &__block_literal_global_15);
  }
  v2 = (void *)knownIdentityKeysForComparison_keys_1;

  return v2;
}

void __54__EKSuggestedEventInfo_knownIdentityKeysForComparison__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F57410];
  v3[0] = *MEMORY[0x1E4F57400];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  v2 = (void *)knownIdentityKeysForComparison_keys_1;
  knownIdentityKeysForComparison_keys_1 = v1;
}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_0 != -1) {
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_0, &__block_literal_global_4);
  }
  v2 = (void *)knownSingleValueKeysForComparison_keys_0;

  return v2;
}

void __57__EKSuggestedEventInfo_knownSingleValueKeysForComparison__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F57408];
  v3[0] = *MEMORY[0x1E4F573E8];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  v2 = (void *)knownSingleValueKeysForComparison_keys_0;
  knownSingleValueKeysForComparison_keys_0 = v1;
}

- (EKSuggestedEventInfo)initWithOpaqueKey:(id)a3 uniqueKey:(id)a4
{
  return [(EKSuggestedEventInfo *)self initWithEventStore:0 opaqueKey:a3 uniqueKey:a4];
}

- (EKSuggestedEventInfo)initWithOpaqueKey:(id)a3 uniqueKey:(id)a4 extractionGroupIdentifier:(id)a5
{
  return [(EKSuggestedEventInfo *)self initWithEventStore:0 opaqueKey:a3 uniqueKey:a4 extractionGroupIdentifier:a5];
}

- (EKSuggestedEventInfo)initWithEventStore:(id)a3 opaqueKey:(id)a4 uniqueKey:(id)a5
{
  return [(EKSuggestedEventInfo *)self initWithEventStore:a3 opaqueKey:a4 uniqueKey:a5 extractionGroupIdentifier:0];
}

- (EKSuggestedEventInfo)initWithEventStore:(id)a3 opaqueKey:(id)a4 uniqueKey:(id)a5 extractionGroupIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)EKSuggestedEventInfo;
  v14 = [(EKObject *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(EKObject *)v14 setEventStore:v10];
    [(EKSuggestedEventInfo *)v15 setOpaqueKey:v11];
    [(EKSuggestedEventInfo *)v15 setUniqueKey:v12];
    [(EKSuggestedEventInfo *)v15 setChangedFields:0];
    [(EKSuggestedEventInfo *)v15 setChangesAcknowledged:0];
    [(EKSuggestedEventInfo *)v15 setExtractionGroupIdentifier:v13];
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(EKSuggestedEventInfo *)self opaqueKey];
  v7 = [(EKSuggestedEventInfo *)self uniqueKey];
  v8 = [(EKSuggestedEventInfo *)self extractionGroupIdentifier];
  unint64_t v9 = [(EKSuggestedEventInfo *)self changedFields];
  BOOL v10 = [(EKSuggestedEventInfo *)self changesAcknowledged];
  [(EKSuggestedEventInfo *)self timestamp];
  id v12 = [v3 stringWithFormat:@"[%@] opaqueKey: %@, uniqueKey: %@, extractionGroupIdentifier: %@, changedFields: %lu, changesAcknowledged: %d, timestamp: %f", v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E30901FFFFFFFFLL])
  {
    v12.receiver = self;
    v12.super_class = (Class)EKSuggestedEventInfo;
    return [(EKObject *)&v12 copyWithZone:a3];
  }
  else
  {
    v6 = [EKSuggestedEventInfo alloc];
    v7 = [(EKObject *)self eventStore];
    v8 = [(EKSuggestedEventInfo *)self opaqueKey];
    unint64_t v9 = [(EKSuggestedEventInfo *)self uniqueKey];
    BOOL v10 = [(EKSuggestedEventInfo *)self extractionGroupIdentifier];
    v5 = [(EKSuggestedEventInfo *)v6 initWithEventStore:v7 opaqueKey:v8 uniqueKey:v9 extractionGroupIdentifier:v10];

    [(EKSuggestedEventInfo *)v5 setChangedFields:[(EKSuggestedEventInfo *)self changedFields]];
    [(EKSuggestedEventInfo *)v5 setChangesAcknowledged:[(EKSuggestedEventInfo *)self changesAcknowledged]];
    [(EKSuggestedEventInfo *)self timestamp];
    -[EKSuggestedEventInfo setTimestamp:](v5, "setTimestamp:");
  }
  return v5;
}

- (id)relatedEvent
{
  return [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F57160]];
}

- (NSString)opaqueKey
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57400]];
}

- (void)setOpaqueKey:(id)a3
{
}

- (NSString)uniqueKey
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57410]];
}

- (void)setUniqueKey:(id)a3
{
}

- (NSString)extractionGroupIdentifier
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F573F8]];
}

- (void)setExtractionGroupIdentifier:(id)a3
{
}

- (unint64_t)changedFields
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F573E8]];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setChangedFields:(unint64_t)a3
{
  if ([(EKSuggestedEventInfo *)self changedFields] != a3)
  {
    id v5 = [NSNumber numberWithUnsignedInteger:a3];
    [(EKObject *)self setSingleChangedValue:v5 forKey:*MEMORY[0x1E4F573E8]];
  }
}

- (BOOL)changesAcknowledged
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F573F0]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setChangesAcknowledged:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(EKSuggestedEventInfo *)self changesAcknowledged] != a3)
  {
    id v5 = [NSNumber numberWithBool:v3];
    [(EKObject *)self setSingleChangedValue:v5 forKey:*MEMORY[0x1E4F573F0]];
  }
}

- (void)setTimestamp:(double)a3
{
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  [(EKSuggestedEventInfo *)self setTimestampAsDate:v4];
}

- (double)timestamp
{
  v2 = [(EKSuggestedEventInfo *)self timestampAsDate];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (void)setTimestampAsDate:(id)a3
{
}

- (id)timestampAsDate
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57408]];
}

- (id)semanticIdentifier
{
  double v3 = [(EKObject *)self uniqueIdentifier];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EKSuggestedEventInfo;
    id v5 = [(EKObject *)&v8 semanticIdentifier];
  }
  v6 = v5;

  return v6;
}

@end