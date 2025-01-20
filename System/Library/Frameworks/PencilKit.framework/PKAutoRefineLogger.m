@interface PKAutoRefineLogger
+ (id)sharedAutoRefineLogger;
- (PKAutoRefineLogger)init;
- (id)entries;
- (void)addLogEntry:(void *)a1;
- (void)clearAllEntries;
@end

@implementation PKAutoRefineLogger

- (PKAutoRefineLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKAutoRefineLogger;
  v2 = [(PKAutoRefineLogger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    entryLog = v2->_entryLog;
    v2->_entryLog = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addLogEntry:(void *)a1
{
  id v5 = a2;
  if (a1)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    objc_msgSend(objc_getProperty(v3, v4, 8, 1), "addObject:", v5);
    objc_sync_exit(v3);
  }
}

- (void)clearAllEntries
{
  if (a1)
  {
    self = a1;
    objc_sync_enter(self);
    objc_msgSend(objc_getProperty(self, v1, 8, 1), "removeAllObjects");
    objc_sync_exit(self);
  }
}

- (id)entries
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    id v3 = objc_getProperty(v1, v2, 8, 1);
    objc_sync_exit(v1);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)sharedAutoRefineLogger
{
  self;
  if (_MergedGlobals_150 != -1) {
    dispatch_once(&_MergedGlobals_150, &__block_literal_global_65);
  }
  v0 = (void *)qword_1EB3C6118;

  return v0;
}

void __44__PKAutoRefineLogger_sharedAutoRefineLogger__block_invoke()
{
  if (os_variant_has_internal_diagnostics())
  {
    v0 = objc_alloc_init(PKAutoRefineLogger);
    id v1 = (void *)qword_1EB3C6118;
    qword_1EB3C6118 = (uint64_t)v0;
  }
}

- (void).cxx_destruct
{
}

@end