@interface CADUnacknowledgedEventsPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicate;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)predicateFormat;
@end

@implementation CADUnacknowledgedEventsPredicate

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

- (id)predicateFormat
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = (void *)CalDatabaseCopyOfAllUnacknowledgedEventsInStore();
  if (![v3 count]) {
    return v3;
  }
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
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