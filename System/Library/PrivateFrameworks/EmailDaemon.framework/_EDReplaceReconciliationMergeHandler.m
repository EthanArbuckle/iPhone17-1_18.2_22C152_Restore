@interface _EDReplaceReconciliationMergeHandler
+ (_EDReplaceReconciliationMergeHandler)sharedInstance;
+ (id)allocWithZone:(_NSZone *)a3;
- (unint64_t)handleReconciliationMergeErrorForTable:(id)a3 columnName:(id)a4 statement:(id)a5 journalRowID:(id)a6 protectedRowID:(id)a7 connection:(id)a8 rowsUpdated:(unint64_t *)a9 error:(id *)a10;
- (void)dealloc;
@end

@implementation _EDReplaceReconciliationMergeHandler

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    [NSString stringWithFormat:@"Cannot directly allocate a %@ object, use +sharedInstance instead.", a1];
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v6);
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS____EDReplaceReconciliationMergeHandler;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

+ (_EDReplaceReconciliationMergeHandler)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___EDReplaceReconciliationMergeHandler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_predicate_320 != -1) {
    dispatch_once(&sharedInstance_predicate_320, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_321;

  return (_EDReplaceReconciliationMergeHandler *)v2;
}

- (void)dealloc
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    [NSString stringWithFormat:@"Cannot deallocate a %@ object.", objc_opt_class()];
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)_EDReplaceReconciliationMergeHandler;
  [(_EDReplaceReconciliationMergeHandler *)&v5 dealloc];
}

- (unint64_t)handleReconciliationMergeErrorForTable:(id)a3 columnName:(id)a4 statement:(id)a5 journalRowID:(id)a6 protectedRowID:(id)a7 connection:(id)a8 rowsUpdated:(unint64_t *)a9 error:(id *)a10
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v18 = [MEMORY[0x1E4F60E78] column:a4];
  v19 = [v18 equalTo:v16];

  v20 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:v14 where:v19];
  if ([v17 executeDeleteStatement:v20 error:a10]
    && [v17 executeUpdateStatement:v15 error:a10])
  {
    if (!a9)
    {
      unint64_t v21 = 0;
      goto LABEL_8;
    }
    unint64_t v21 = 0;
    unint64_t v22 = sqlite3_changes((sqlite3 *)[v17 sqlDB]);
    goto LABEL_7;
  }
  unint64_t v21 = 2;
  if (a9)
  {
    unint64_t v22 = 0;
LABEL_7:
    *a9 = v22;
  }
LABEL_8:

  return v21;
}

@end