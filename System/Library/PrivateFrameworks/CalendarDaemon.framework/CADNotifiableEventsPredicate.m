@interface CADNotifiableEventsPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicate;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)defaultPropertiesToLoad;
- (id)predicateFormat;
@end

@implementation CADNotifiableEventsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicate
{
  objc_opt_class();
  v2 = objc_opt_new();
  return v2;
}

- (id)defaultPropertiesToLoad
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = CADEKPersistentEventDefaultPropertiesToLoad();
  uint64_t v3 = *MEMORY[0x1E4F56FD8];
  v8[0] = *MEMORY[0x1E4F56D38];
  v8[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F56FD0];
  v8[2] = *MEMORY[0x1E4F56FF8];
  v8[3] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];
  v6 = [v2 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)predicateFormat
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)CalDatabaseCopyOfAllNotifiableEventsInStore();
  if (![v3 count]) {
    return v3;
  }
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (const void *)CalEventOccurrenceCreateForInitialOccurrence();
        objc_msgSend(v4, "addObject:", v10, v12);
        CFRelease(v10);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

@end