@interface NSSQLiteIndexTrackingModel
+ (id)ancillaryModelNamespace;
+ (id)newModelForFrameworkVersion:;
+ (unint64_t)ancillaryEntityCount;
+ (unint64_t)ancillaryEntityOffset;
+ (void)_invalidateStaticCaches;
+ (void)initialize;
+ (void)updateIndexStatistics:(uint64_t)a3 usingConnection:(void *)a4 model:;
@end

@implementation NSSQLiteIndexTrackingModel

+ (unint64_t)ancillaryEntityOffset
{
  return 18000;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    self;
  }
}

+ (unint64_t)ancillaryEntityCount
{
  return 1;
}

+ (void)_invalidateStaticCaches
{
  _MergedGlobals_89 = 0;
}

+ (id)newModelForFrameworkVersion:
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__NSSQLiteIndexTrackingModel_newModelForFrameworkVersion___block_invoke;
  block[3] = &unk_1E544B868;
  block[4] = v0;
  if (qword_1EB270810 != -1) {
    dispatch_once(&qword_1EB270810, block);
  }
  return (id)_MergedGlobals_89;
}

uint64_t __58__NSSQLiteIndexTrackingModel_newModelForFrameworkVersion___block_invoke(uint64_t a1)
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(NSEntityDescription);
  v3 = (objc_class *)self;
  [(NSEntityDescription *)v2 setName:NSStringFromClass(v3)];
  v7[0] = makeAttribute(@"indexName", 700);
  v7[1] = makeAttribute(@"executionCount", 300);
  v7[2] = makeAttribute(@"instructionCount", 300);
  v7[3] = makeAttribute(@"rowCount", 300);
  -[NSEntityDescription setProperties:](v2, "setProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4]);
  _MergedGlobals_89 = objc_alloc_init(NSManagedObjectModel);
  objc_msgSend((id)_MergedGlobals_89, "_setModelsReferenceIDOffset:", objc_msgSend(*(id *)(a1 + 32), "ancillaryEntityOffset"));
  v6 = v2;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
  [(id)_MergedGlobals_89 setEntities:v4];
  return [(id)_MergedGlobals_89 _setIsEditable:0];
}

+ (void)updateIndexStatistics:(uint64_t)a3 usingConnection:(void *)a4 model:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  self;
  if (a4) {
    a4 = (void *)a4[3];
  }
  v6 = (objc_class *)objc_opt_class();
  v7 = (id *)[a4 objectForKeyedSubscript:NSStringFromClass(v6)];
  v8 = v7;
  if (v7)
  {
    uint64_t v28 = [v7 tableName];
    uint64_t v9 = objc_msgSend((id)objc_msgSend(v8[5], "objectForKey:", @"executionCount"), "columnName");
    uint64_t v10 = objc_msgSend((id)objc_msgSend(v8[5], "objectForKey:", @"rowCount"), "columnName");
    uint64_t v11 = objc_msgSend((id)objc_msgSend(v8[5], "objectForKey:", @"instructionCount"), "columnName");
    uint64_t v27 = objc_msgSend((id)objc_msgSend(v8[5], "objectForKey:", @"indexName"), "columnName");
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v12 = (void *)[a2 allValues];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v13)
    {
      id obj = v12;
      uint64_t v26 = *(void *)v32;
      do
      {
        uint64_t v30 = v13;
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(obj);
          }
          v15 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, objc_msgSend(NSString, "stringWithFormat:", @"UPDATE OR IGNORE \"%@\" SET \"%@\" = \"%@\" + %lld, \"%@\" = \"%@\" + %lld, \"%@\" = \"%@\" + %lld WHERE \"%@\" = '%@'", v28, v9, v9, objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "executionCount"), v10, v10, objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "rowCount"), v11, v11, objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "instructionCount"), v27, objc_msgSend(
                      (id)[*(id *)(*((void *)&v31 + 1) + 8 * i) indexName],
                      "uppercaseString")));
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a3, v15);
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v13);
    }
  }
  else
  {
    uint64_t v16 = [NSString stringWithUTF8String:"Couldn't find NSSQLiteIndexStatistics entity"];
    _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, v24);
    v23 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Couldn't find NSSQLiteIndexStatistics entity", buf, 2u);
    }
  }
}

+ (id)ancillaryModelNamespace
{
  return @"SQLiteIndexTracking";
}

@end