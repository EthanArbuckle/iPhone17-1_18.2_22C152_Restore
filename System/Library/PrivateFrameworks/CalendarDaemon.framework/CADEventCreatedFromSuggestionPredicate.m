@interface CADEventCreatedFromSuggestionPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateForAllSuggestedEvents;
- (BOOL)isEqual:(id)a3;
- (CADEventCreatedFromSuggestionPredicate)initWithCoder:(id)a3;
- (CADEventCreatedFromSuggestionPredicate)initWithExtractionGroupIdentifier:(id)a3;
- (CADEventCreatedFromSuggestionPredicate)initWithOpaqueKey:(id)a3;
- (CADEventCreatedFromSuggestionPredicate)initWithOpaqueKey:(id)a3 extractionGroupIdentifier:(id)a4;
- (NSString)extractionGroupIdentifier;
- (NSString)opaqueKey;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)defaultPropertiesToLoad;
- (id)predicateFormat;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADEventCreatedFromSuggestionPredicate

- (id)defaultPropertiesToLoad
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = CADEKPersistentEventDefaultPropertiesToLoad();
  uint64_t v3 = *MEMORY[0x1E4F56D38];
  v7[0] = *MEMORY[0x1E4F56B88];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  v5 = [v2 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (id)predicateFormat
{
  uint64_t v3 = [(CADEventCreatedFromSuggestionPredicate *)self opaqueKey];

  if (v3)
  {
    v4 = [NSString stringWithFormat:@"CADEventCreatedFromSuggestionPredicate opaqueKey:%@", self->_opaqueKey];
  }
  else
  {
    v5 = [(CADEventCreatedFromSuggestionPredicate *)self extractionGroupIdentifier];

    if (v5)
    {
      v6 = NSString;
      v7 = [(CADEventCreatedFromSuggestionPredicate *)self extractionGroupIdentifier];
      v4 = [v6 stringWithFormat:@"CADEventCreatedFromSuggestionPredicate extractionGroupIdentifier:%@", v7];
    }
    else
    {
      v4 = @"CADEventCreatedFromSuggestionPredicate allSuggestedEvents";
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CADEventCreatedFromSuggestionPredicate;
  id v4 = a3;
  [(EKPredicate *)&v7 encodeWithCoder:v4];
  v5 = [(CADEventCreatedFromSuggestionPredicate *)self opaqueKey];
  [v4 encodeObject:v5 forKey:@"opaqueKey"];

  v6 = [(CADEventCreatedFromSuggestionPredicate *)self extractionGroupIdentifier];
  [v4 encodeObject:v6 forKey:@"extractionGroupIdentifier"];
}

- (NSString)opaqueKey
{
  return self->_opaqueKey;
}

- (NSString)extractionGroupIdentifier
{
  return self->_extractionGroupIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_opaqueKey, 0);
}

- (CADEventCreatedFromSuggestionPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADEventCreatedFromSuggestionPredicate;
  v5 = [(EKPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"opaqueKey"];
    opaqueKey = v5->_opaqueKey;
    v5->_opaqueKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extractionGroupIdentifier"];
    extractionGroupIdentifier = v5->_extractionGroupIdentifier;
    v5->_extractionGroupIdentifier = (NSString *)v8;
  }
  return v5;
}

+ (id)predicateForAllSuggestedEvents
{
  v2 = (void *)[objc_alloc((Class)a1) initWithOpaqueKey:0 extractionGroupIdentifier:0];
  return v2;
}

- (CADEventCreatedFromSuggestionPredicate)initWithOpaqueKey:(id)a3 extractionGroupIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CADEventCreatedFromSuggestionPredicate;
  uint64_t v8 = [(CADEventCreatedFromSuggestionPredicate *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    opaqueKey = v8->_opaqueKey;
    v8->_opaqueKey = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    extractionGroupIdentifier = v8->_extractionGroupIdentifier;
    v8->_extractionGroupIdentifier = (NSString *)v11;
  }
  return v8;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [(CADEventCreatedFromSuggestionPredicate *)self opaqueKey];

  if (v4)
  {
    [(CADEventCreatedFromSuggestionPredicate *)self opaqueKey];
LABEL_3:
    v5 = (void *)CalDatabaseCopyOfAllEventsCreatedFromSuggestionsInStore();
    goto LABEL_6;
  }
  id v6 = [(CADEventCreatedFromSuggestionPredicate *)self extractionGroupIdentifier];

  if (!v6) {
    goto LABEL_3;
  }
  id v7 = [(CADEventCreatedFromSuggestionPredicate *)self extractionGroupIdentifier];
  v5 = (void *)CalDatabaseCopyOfAllEventsCreatedFromSuggestionsWithExtractionGroupIdentifierInStore();

LABEL_6:
  if ([v5 count])
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_super v14 = (const void *)CalEventOccurrenceCreateForInitialOccurrence();
          objc_msgSend(v8, "addObject:", v14, v16);
          CFRelease(v14);
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (CADEventCreatedFromSuggestionPredicate)initWithExtractionGroupIdentifier:(id)a3
{
  return [(CADEventCreatedFromSuggestionPredicate *)self initWithOpaqueKey:0 extractionGroupIdentifier:a3];
}

- (CADEventCreatedFromSuggestionPredicate)initWithOpaqueKey:(id)a3
{
  return [(CADEventCreatedFromSuggestionPredicate *)self initWithOpaqueKey:a3 extractionGroupIdentifier:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CADEventCreatedFromSuggestionPredicate *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    id v7 = [(CADEventCreatedFromSuggestionPredicate *)v6 opaqueKey];
    int v8 = CalEqualStrings();

    if (v8)
    {
      id v9 = [(CADEventCreatedFromSuggestionPredicate *)self extractionGroupIdentifier];
      uint64_t v10 = [(CADEventCreatedFromSuggestionPredicate *)v6 extractionGroupIdentifier];
      char v11 = CalEqualStrings();
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

@end