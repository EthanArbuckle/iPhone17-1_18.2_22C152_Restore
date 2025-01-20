@interface EmergencyMediaItem
+ (id)fetchRequest;
+ (id)managedEmergencyMediaItemForEmergencyMediaItem:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedEmergencyMediaItemsForEmergencyMediaItems:(id)a3 inManagedObjectContext:(id)a4;
- (CHEmergencyMediaItem)chEmergencyMediaItem;
- (id)copyWithContext:(id)a3;
@end

@implementation EmergencyMediaItem

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"EmergencyMediaItem"];
}

+ (id)managedEmergencyMediaItemForEmergencyMediaItem:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 persistentStoreCoordinator];
  v8 = [v7 managedObjectModel];

  if (v8)
  {
    v9 = [v8 entitiesByName];
    v10 = [v9 objectForKeyedSubscript:@"EmergencyMediaItem"];

    if (v10)
    {
      uint64_t v11 = [objc_alloc((Class)objc_opt_class()) initWithEntity:v10 insertIntoManagedObjectContext:v6];
    }
    else
    {
      v13 = ch_framework_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543618;
        v17 = @"EmergencyMediaItem";
        __int16 v18 = 2114;
        id v19 = v6;
        _os_log_impl(&dword_1B8E4A000, v13, OS_LOG_TYPE_DEFAULT, "Could not find entity description with name %{public}@ in managed object context %{public}@. Falling back to convenience initializer.", (uint8_t *)&v16, 0x16u);
      }

      uint64_t v11 = [objc_alloc((Class)objc_opt_class()) initWithContext:v6];
    }
    v12 = (void *)v11;
    v14 = [v5 assetId];
    [v12 setAssetId:v14];

    objc_msgSend(v12, "setEmergencyMediaType:", objc_msgSend(v5, "emergencyMediaType"));
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)managedEmergencyMediaItemsForEmergencyMediaItems:(id)a3 inManagedObjectContext:(id)a4
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
        v14 = objc_msgSend(a1, "managedEmergencyMediaItemForEmergencyMediaItem:inManagedObjectContext:", *(void *)(*((void *)&v17 + 1) + 8 * i), v7, (void)v17);
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

- (CHEmergencyMediaItem)chEmergencyMediaItem
{
  v3 = [(EmergencyMediaItem *)self assetId];

  if (v3)
  {
    v4 = [CHEmergencyMediaItem alloc];
    id v5 = [(EmergencyMediaItem *)self assetId];
    id v6 = [(CHEmergencyMediaItem *)v4 initWithAssetId:v5 mediaType:[(EmergencyMediaItem *)self emergencyMediaType]];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)copyWithContext:(id)a3
{
  id v4 = a3;
  id v5 = +[DBManager entityDescriptionHavingName:@"EmergencyMediaItem" forContext:v4];
  if (v5)
  {
    uint64_t v6 = [objc_alloc((Class)objc_opt_class()) initWithEntity:v5 insertIntoManagedObjectContext:v4];
  }
  else
  {
    id v7 = +[CHLogServer sharedInstance];
    v8 = [v7 logHandleForDomain:"EmergencyMediaItem"];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[EmergencyMediaItem(Additions) copyWithContext:]((uint64_t)v4, v8);
    }

    uint64_t v6 = [objc_alloc((Class)objc_opt_class()) initWithContext:v4];
  }
  id v9 = (void *)v6;
  uint64_t v10 = [(EmergencyMediaItem *)self assetId];
  [v9 setAssetId:v10];

  objc_msgSend(v9, "setEmergencyMediaType:", -[EmergencyMediaItem emergencyMediaType](self, "emergencyMediaType"));
  return v9;
}

@end