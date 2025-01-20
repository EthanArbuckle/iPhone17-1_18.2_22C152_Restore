@interface CHManagedHandle
+ (id)fetchRequest;
+ (id)managedHandleForHandle:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedHandlesForHandles:(id)a3 inManagedObjectContext:(id)a4;
- (CHHandle)chHandle;
- (id)copyWithContext:(id)a3;
@end

@implementation CHManagedHandle

- (CHHandle)chHandle
{
  v3 = [(CHManagedHandle *)self value];
  if (v3 && (uint64_t v4 = [(CHManagedHandle *)self type] - 1, v4 <= 2))
  {
    uint64_t v5 = v4 + 1;
    v6 = [CHHandle alloc];
    v7 = [(CHManagedHandle *)self normalizedValue];
    v8 = [(CHHandle *)v6 initWithType:v5 value:v3 normalizedValue:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)managedHandleForHandle:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 persistentStoreCoordinator];
  v8 = [v7 managedObjectModel];

  if (v8)
  {
    v9 = [v8 entitiesByName];
    v10 = [v9 objectForKeyedSubscript:@"Handle"];

    if (v10)
    {
      uint64_t v11 = [objc_alloc((Class)objc_opt_class()) initWithEntity:v10 insertIntoManagedObjectContext:v6];
    }
    else
    {
      v13 = ch_framework_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543618;
        v18 = @"Handle";
        __int16 v19 = 2114;
        id v20 = v6;
        _os_log_impl(&dword_1B8E4A000, v13, OS_LOG_TYPE_DEFAULT, "Could not find entity description with name %{public}@ in managed object context %{public}@. Falling back to convenience initializer.", (uint8_t *)&v17, 0x16u);
      }

      uint64_t v11 = [objc_alloc((Class)objc_opt_class()) initWithContext:v6];
    }
    v12 = (void *)v11;
    v14 = [v5 normalizedValue];
    [v12 setNormalizedValue:v14];

    objc_msgSend(v12, "setType:", (__int16)objc_msgSend(v5, "type"));
    v15 = [v5 value];
    [v12 setValue:v15];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)managedHandlesForHandles:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(a1, "managedHandleForHandle:inManagedObjectContext:", *(void *)(*((void *)&v17 + 1) + 8 * i), v7, (void)v17);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  v15 = (void *)[v8 copy];
  return v15;
}

- (id)copyWithContext:(id)a3
{
  id v4 = a3;
  id v5 = +[DBManager entityDescriptionHavingName:@"Handle" forContext:v4];
  if (v5)
  {
    uint64_t v6 = [objc_alloc((Class)objc_opt_class()) initWithEntity:v5 insertIntoManagedObjectContext:v4];
  }
  else
  {
    id v7 = +[CHLogServer sharedInstance];
    v8 = [v7 logHandleForDomain:"CHManagedHandle"];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CHManagedHandle(Additions) copyWithContext:]((uint64_t)v4, v8);
    }

    uint64_t v6 = [objc_alloc((Class)objc_opt_class()) initWithContext:v4];
  }
  id v9 = (void *)v6;
  uint64_t v10 = [(CHManagedHandle *)self normalizedValue];
  [v9 setNormalizedValue:v10];

  objc_msgSend(v9, "setType:", -[CHManagedHandle type](self, "type"));
  uint64_t v11 = [(CHManagedHandle *)self value];
  [v9 setValue:v11];

  return v9;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Handle"];
}

@end