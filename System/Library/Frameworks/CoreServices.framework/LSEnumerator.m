@interface LSEnumerator
+ (id)enumeratorForApplicationProxiesWithOptions:(unint64_t)a3;
+ (id)enumeratorForPlugInKitProxiesWithExtensionPoint:(id)a3 options:(unint64_t)a4;
+ (id)enumeratorForPlugInKitProxiesWithExtensionPoint:(id)a3 options:(unint64_t)a4 filter:(id)a5;
+ (id)new;
+ (void)initialize;
- (LSEnumerator)init;
- (NSPredicate)predicate;
- (id)_initWithContext:(LSContext *)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)errorHandler;
- (id)filter;
- (id)nextObject;
- (id)swift_firstWhere:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFilter:(id)a3;
- (void)setPredicate:(id)a3;
- (void)swift_forEach:(id)a3;
@end

@implementation LSEnumerator

- (id)_initWithContext:(LSContext *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LSEnumerator;
  return [(LSEnumerator *)&v4 init];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);

  objc_storeStrong(&self->_filter, 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.launchservices", "enumeration");
    v3 = (void *)_LSEnumeratorLog;
    _LSEnumeratorLog = (uint64_t)v2;
  }
}

- (void)setFilter:(id)a3
{
  objc_super v4 = (void *)[a3 copy];
  id filter = self->_filter;
  self->_id filter = v4;
}

- (LSEnumerator)init
{
}

+ (id)new
{
}

+ (id)enumeratorForApplicationProxiesWithOptions:(unint64_t)a3
{
  v3 = [(_LSApplicationRecordEnumerator *)[_LSApplicationProxyEnumerator alloc] initWithContext:0 volumeURL:0 options:a3];

  return v3;
}

+ (id)enumeratorForPlugInKitProxiesWithExtensionPoint:(id)a3 options:(unint64_t)a4
{
  if (!a3)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"LSEnumerator.mm", 65, @"Invalid parameter not satisfying: %@", @"extensionPointID != nil" object file lineNumber description];
  }
  v6 = [(_LSApplicationExtensionRecordEnumerator *)[_LSPlugInProxyEnumerator alloc] initWithExtensionPointIdentifier:a3 options:a4];

  return v6;
}

+ (id)enumeratorForPlugInKitProxiesWithExtensionPoint:(id)a3 options:(unint64_t)a4 filter:(id)a5
{
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"LSEnumerator.mm", 72, @"Invalid parameter not satisfying: %@", @"extensionPointID != nil" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, a1, @"LSEnumerator.mm", 73, @"Invalid parameter not satisfying: %@", @"filterBlock != nil" object file lineNumber description];

LABEL_3:
  v10 = [(_LSApplicationExtensionRecordEnumerator *)[_LSPlugInProxyEnumerator alloc] initWithExtensionPointIdentifier:a3 options:a4 filter:a5];

  return v10;
}

- (NSPredicate)predicate
{
  os_log_t v2 = (void *)MEMORY[0x18530F950](self->_filter, a2);
  v3 = v2;
  objc_super v4 = (void *)MEMORY[0x1E4F28F60];
  if (v2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __25__LSEnumerator_predicate__block_invoke;
    v7[3] = &unk_1E522F638;
    id v8 = v2;
    v5 = [v4 predicateWithBlock:v7];
  }
  else
  {
    v5 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }

  return (NSPredicate *)v5;
}

uint64_t __25__LSEnumerator_predicate__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPredicate:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__LSEnumerator_setPredicate___block_invoke;
  v6[3] = &unk_1E522F660;
  v6[4] = a3;
  objc_super v4 = (void *)MEMORY[0x18530F950](v6, a2);
  id filter = self->_filter;
  self->_id filter = v4;
}

uint64_t __29__LSEnumerator_setPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateWithObject:a2];
}

- (id)filter
{
  if (self->_filter) {
    id filter = self->_filter;
  }
  else {
    id filter = &__block_literal_global_39;
  }
  v3 = (void *)MEMORY[0x18530F950](filter, a2);

  return v3;
}

uint64_t __22__LSEnumerator_filter__block_invoke()
{
  return 1;
}

- (id)nextObject
{
}

- (void)swift_forEach:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v4 = self;
  uint64_t v5 = [(LSEnumerator *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [(LSEnumerator *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)swift_firstWhere:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v4 = self;
  uint64_t v5 = [(LSEnumerator *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((*((unsigned int (**)(id, void *))a3 + 2))(a3, v8))
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(LSEnumerator *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (id)copy
{
  return [(LSEnumerator *)self copyWithZone:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[(objc_class *)object_getClass(self) allocWithZone:a3] _initWithContext:0];
  if (v4)
  {
    uint64_t v5 = [self->_filter copy];
    uint64_t v6 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v5;

    uint64_t v7 = [self->_errorHandler copy];
    long long v8 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v7;

    unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->_hasFiredErrorHandler);
    atomic_store(v9 & 1, (unsigned __int8 *)(v4 + 16));
  }
  return (id)v4;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

@end