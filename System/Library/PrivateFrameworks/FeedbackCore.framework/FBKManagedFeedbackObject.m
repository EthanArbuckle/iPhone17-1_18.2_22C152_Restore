@interface FBKManagedFeedbackObject
+ (id)entityName;
+ (id)importFromJSONArray:(id)a3 intoContext:(id)a4;
+ (id)importFromJSONObject:(id)a3 intoContext:(id)a4;
- (BOOL)isEqualToFBKObject:(id)a3;
- (id)entityName;
- (void)setID:(id)a3;
- (void)setPropertiesFromJSONObject:(id)a3;
@end

@implementation FBKManagedFeedbackObject

+ (id)importFromJSONObject:(id)a3 intoContext:(id)a4
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 objectForKeyedSubscript:@"id"];
  v10 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v9, "integerValue"));

  v11 = [a1 entityName];
  v12 = [v7 feedbackObjectWithEntityName:v11 remoteID:v10 creatingIfNeeded:1];

  [v12 setPropertiesFromJSONObject:v8];

  return v12;
}

+ (id)importFromJSONArray:(id)a3 intoContext:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = FBKArrayToIdDictionary(a3);
  id v8 = [a1 entityName];
  v9 = [v7 allKeys];
  v10 = [v6 feedbackObjectsWithEntityName:v8 remoteIDs:v9 creatingIfNeeded:1];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "remoteID", (void)v20);
        v18 = [v7 objectForKeyedSubscript:v17];
        [v16 setPropertiesFromJSONObject:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  return v11;
}

+ (id)entityName
{
  return &stru_26DDF6A30;
}

- (id)entityName
{
  v2 = objc_opt_class();

  return (id)[v2 entityName];
}

- (void)setPropertiesFromJSONObject:(id)a3
{
}

- (void)setID:(id)a3
{
  id v4 = a3;
  [(FBKManagedFeedbackObject *)self willChangeValueForKey:@"ID"];
  [(FBKManagedFeedbackObject *)self setRemoteID:v4];

  [(FBKManagedFeedbackObject *)self didChangeValueForKey:@"ID"];
}

- (BOOL)isEqualToFBKObject:(id)a3
{
  id v4 = a3;
  if (v4 && (v5 = objc_opt_class(), [v5 isSubclassOfClass:objc_opt_class()]))
  {
    id v6 = [(FBKManagedFeedbackObject *)self ID];
    id v7 = [v4 ID];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

@end