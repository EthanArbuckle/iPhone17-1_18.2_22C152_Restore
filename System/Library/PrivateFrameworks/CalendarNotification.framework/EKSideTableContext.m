@interface EKSideTableContext
+ (id)sideTableContext;
- (BOOL)_removeSqliteFiles;
- (EKSideTableContext)initWithConcurrencyType:(unint64_t)a3;
- (id)_alarmsMatchingPredicate:(id)a3;
- (id)_managedObjectModel;
- (id)_pathForPersistentStore;
- (id)_persistentStoreCoordinator;
- (id)_settingForKey:(id)a3;
- (id)_urlForPersistentStore;
- (id)alarmsBetweenStartDate:(id)a3 endDate:(id)a4;
- (id)insertNewAlarm;
- (id)nextAlarmFireTime;
- (id)rootDirectory;
- (id)settingForKey:(id)a3;
- (void)deleteAllAlarms;
- (void)setSetting:(id)a3 forKey:(id)a4;
@end

@implementation EKSideTableContext

+ (id)sideTableContext
{
  v2 = [[EKSideTableContext alloc] initWithConcurrencyType:1];
  uint64_t v3 = [(EKSideTableContext *)v2 persistentStoreCoordinator];
  if (!v3) {
    goto LABEL_4;
  }
  v4 = (void *)v3;
  v5 = [(EKSideTableContext *)v2 persistentStoreCoordinator];
  v6 = [v5 persistentStores];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = v2;
  }
  else
  {
LABEL_4:
    v9 = [NSString stringWithUTF8String:"+[EKSideTableContext sideTableContext]"];
    NSLog(&cfstr_FailedToCreate_0.isa, v9);

    v8 = 0;
  }

  return v8;
}

- (EKSideTableContext)initWithConcurrencyType:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EKSideTableContext;
  uint64_t v3 = [(EKSideTableContext *)&v7 initWithConcurrencyType:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(EKSideTableContext *)v3 _persistentStoreCoordinator];
    if (v5) {
      [(EKSideTableContext *)v4 setPersistentStoreCoordinator:v5];
    }
    [(EKSideTableContext *)v4 setUndoManager:0];
    [(EKSideTableContext *)v4 setMergePolicy:*MEMORY[0x263EFF068]];
  }
  return v4;
}

- (id)_alarmsMatchingPredicate:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF240];
  id v5 = a3;
  v6 = [v4 entityForName:@"Alarm" inManagedObjectContext:self];
  id v7 = objc_alloc_init(MEMORY[0x263EFF260]);
  [v7 setEntity:v6];
  [v7 setPredicate:v5];

  [v7 setIncludesPendingChanges:0];
  uint64_t v10 = 0;
  v8 = [(EKSideTableContext *)self executeFetchRequest:v7 error:&v10];

  return v8;
}

- (void)deleteAllAlarms
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(EKSideTableContext *)self _alarmsMatchingPredicate:0];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(EKSideTableContext *)self deleteObject:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)insertNewAlarm
{
  return (id)[MEMORY[0x263EFF240] insertNewObjectForEntityForName:@"Alarm" inManagedObjectContext:self];
}

- (id)nextAlarmFireTime
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF260]);
  uint64_t v4 = [MEMORY[0x263EFF240] entityForName:@"Alarm" inManagedObjectContext:self];
  [v3 setEntity:v4];

  uint64_t v5 = (void *)MEMORY[0x263F08A98];
  uint64_t v6 = [MEMORY[0x263EFF910] CalSimulatedDateForNow];
  uint64_t v7 = [v5 predicateWithFormat:@"fireTime > %@", v6];
  [v3 setPredicate:v7];

  [v3 setIncludesPendingChanges:0];
  [v3 setFetchLimit:1];
  long long v8 = (void *)MEMORY[0x263EFF8C0];
  long long v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"fireTime" ascending:1];
  long long v10 = [v8 arrayWithObject:v9];
  [v3 setSortDescriptors:v10];

  uint64_t v15 = 0;
  long long v11 = [(EKSideTableContext *)self executeFetchRequest:v3 error:&v15];
  if ([v11 count])
  {
    v12 = [v11 objectAtIndex:0];
    uint64_t v13 = [v12 fireTime];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)alarmsBetweenStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x263EFF260];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  long long v10 = [MEMORY[0x263EFF240] entityForName:@"Alarm" inManagedObjectContext:self];
  [v9 setEntity:v10];

  long long v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"fireTime >= %@ and fireTime <= %@", v8, v7];

  [v9 setPredicate:v11];
  [v9 setIncludesPendingChanges:0];
  v12 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v13 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"fireTime" ascending:1];
  v14 = [v12 arrayWithObject:v13];
  [v9 setSortDescriptors:v14];

  uint64_t v17 = 0;
  uint64_t v15 = [(EKSideTableContext *)self executeFetchRequest:v9 error:&v17];

  return v15;
}

- (id)_settingForKey:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263EFF260];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [MEMORY[0x263EFF240] entityForName:@"Setting" inManagedObjectContext:self];
  [v6 setEntity:v7];

  id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"key = %@", v5];

  [v6 setPredicate:v8];
  [v6 setIncludesPendingChanges:1];
  [v6 setFetchLimit:1];
  uint64_t v12 = 0;
  id v9 = [(EKSideTableContext *)self executeFetchRequest:v6 error:&v12];
  if ([v9 count])
  {
    long long v10 = [v9 objectAtIndex:0];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (id)settingForKey:(id)a3
{
  id v3 = [(EKSideTableContext *)self _settingForKey:a3];
  uint64_t v4 = [v3 valueForKey:@"value"];

  return v4;
}

- (void)setSetting:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(EKSideTableContext *)self _settingForKey:v6];
  if (!v7)
  {
    id v7 = [MEMORY[0x263EFF240] insertNewObjectForEntityForName:@"Setting" inManagedObjectContext:self];
    [v7 setValue:v6 forKey:@"key"];
  }
  [v7 setValue:v8 forKey:@"value"];
}

- (id)rootDirectory
{
  path = self->_path;
  if (path)
  {
    id v3 = path;
  }
  else
  {
    CALNDefaultCalendarDirectory();
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_pathForPersistentStore
{
  v2 = [(EKSideTableContext *)self rootDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"Extras.db"];

  return v3;
}

- (id)_urlForPersistentStore
{
  v2 = NSURL;
  id v3 = [(EKSideTableContext *)self _pathForPersistentStore];
  uint64_t v4 = [v2 fileURLWithPath:v3];

  return v4;
}

- (BOOL)_removeSqliteFiles
{
  id v3 = [(EKSideTableContext *)self persistentStoreCoordinator];
  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263EFF320]);
    id v5 = [(EKSideTableContext *)self _managedObjectModel];
    id v3 = (void *)[v4 initWithManagedObjectModel:v5];
  }
  id v6 = [(EKSideTableContext *)self _urlForPersistentStore];
  uint64_t v7 = *MEMORY[0x263EFF168];
  id v12 = 0;
  char v8 = [v3 _destroyPersistentStoreAtURL:v6 withType:v7 options:0 error:&v12];
  id v9 = v12;

  if ((v8 & 1) == 0)
  {
    long long v10 = [v9 userInfo];
    NSLog(&cfstr_UnableToRecove.isa, v9, v10);
  }
  return v8;
}

- (id)_managedObjectModel
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 pathForResource:@"SideTables" ofType:@"momd"];

  id v4 = objc_alloc(MEMORY[0x263EFF298]);
  id v5 = [NSURL fileURLWithPath:v3];
  id v6 = (void *)[v4 initWithContentsOfURL:v5];

  if (v6)
  {

    return v6;
  }
  else
  {
    NSLog(&cfstr_FailedToLoadSc.isa, v3);
    __break(1u);
  }
  return result;
}

- (id)_persistentStoreCoordinator
{
  id v3 = [(EKSideTableContext *)self _urlForPersistentStore];
  id v4 = objc_alloc(MEMORY[0x263EFF320]);
  id v5 = [(EKSideTableContext *)self _managedObjectModel];
  id v6 = (void *)[v4 initWithManagedObjectModel:v5];

  uint64_t v7 = NSDictionary;
  char v8 = [NSNumber numberWithBool:1];
  uint64_t v9 = *MEMORY[0x263EFF070];
  long long v10 = [NSNumber numberWithBool:1];
  long long v11 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, v9, v10, *MEMORY[0x263EFF008], *MEMORY[0x263F080B0], *MEMORY[0x263EFF0E0], 0);

  uint64_t v12 = *MEMORY[0x263EFF168];
  id v21 = 0;
  uint64_t v13 = [v6 addPersistentStoreWithType:v12 configuration:0 URL:v3 options:v11 error:&v21];
  id v14 = v21;

  if (v13) {
    goto LABEL_2;
  }
  v16 = [v14 userInfo];
  NSLog(&cfstr_ErrorWhileImpo.isa, v14, v16);

  if ([(EKSideTableContext *)self _removeSqliteFiles])
  {
    id v20 = 0;
    uint64_t v17 = [v6 addPersistentStoreWithType:v12 configuration:0 URL:v3 options:v11 error:&v20];
    id v14 = v20;

    if (v17)
    {
      NSLog(&cfstr_CreatedNewData.isa);
LABEL_2:
      id v15 = v6;
      goto LABEL_9;
    }
    v18 = [v14 userInfo];
    NSLog(&cfstr_SecondErrorWhi.isa, v14, v18);
  }
  else
  {
    id v14 = [NSString stringWithUTF8String:"-[EKSideTableContext _persistentStoreCoordinator]"];
    NSLog(&cfstr_UnableToRemove.isa, v14);
  }
  id v15 = 0;
LABEL_9:

  return v15;
}

- (void).cxx_destruct
{
}

@end