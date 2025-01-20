@interface _HDSQLiteStatementCacheStorage
- (CFDictionaryRef)allStatementSQLStrings;
- (_HDSQLiteStatementCacheStorage)init;
- (const)statementForSQL:(uint64_t)a1;
- (void)clearStatements;
- (void)dealloc;
- (void)initWithParentStorage:(void *)a1;
@end

@implementation _HDSQLiteStatementCacheStorage

- (void).cxx_destruct
{
}

- (const)statementForSQL:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), v3);
    if (!Value) {
      Value = (const void *)-[_HDSQLiteStatementCacheStorage statementForSQL:](*(void *)(a1 + 8), v3);
    }
  }
  else
  {
    Value = 0;
  }

  return Value;
}

- (void)dealloc
{
  CFRelease(self->_statementsBySQL);
  CFRelease(self->_statementsByKey);
  v3.receiver = self;
  v3.super_class = (Class)_HDSQLiteStatementCacheStorage;
  [(_HDSQLiteStatementCacheStorage *)&v3 dealloc];
}

- (void)initWithParentStorage:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_HDSQLiteStatementCacheStorage;
    id v5 = objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      a1[2] = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], &kSQLite3StatementDictionaryValueCallbacks);
      a1[3] = CFDictionaryCreateMutable(0, 0, 0, &kSQLite3StatementDictionaryValueCallbacks);
    }
  }

  return a1;
}

- (CFDictionaryRef)allStatementSQLStrings
{
  v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
    CFDictionaryApplyFunction(v1[3], (CFDictionaryApplierFunction)collectStatementStrings, v2);
    CFDictionaryApplyFunction(v1[2], (CFDictionaryApplierFunction)collectStatementStrings, v2);
    v1 = (CFDictionaryRef *)[v2 copy];
  }

  return v1;
}

- (void)clearStatements
{
  if (a1)
  {
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 16));
    id v2 = *(__CFDictionary **)(a1 + 24);
    CFDictionaryRemoveAllValues(v2);
  }
}

- (_HDSQLiteStatementCacheStorage)init
{
  return (_HDSQLiteStatementCacheStorage *)-[_HDSQLiteStatementCacheStorage initWithParentStorage:](self, 0);
}

@end