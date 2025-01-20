@interface OSLogStore
+ (OSLogStore)storeWithScope:(OSLogStoreScope)scope error:(NSError *)error;
+ (OSLogStore)storeWithURL:(NSURL *)url error:(NSError *)error;
- (OSLogEnumerator)entriesEnumeratorAndReturnError:(NSError *)error;
- (OSLogEnumerator)entriesEnumeratorWithOptions:(OSLogEnumeratorOptions)options position:(OSLogPosition *)position predicate:(NSPredicate *)predicate error:(NSError *)error;
- (OSLogPosition)positionWithDate:(NSDate *)date;
- (OSLogPosition)positionWithTimeIntervalSinceEnd:(NSTimeInterval)seconds;
- (OSLogPosition)positionWithTimeIntervalSinceLatestBoot:(NSTimeInterval)seconds;
- (OSLogStore)init;
- (id)_constrainedEntriesEnumeratorWithOptions:(unint64_t)a3 position:(id)a4 predicate:(id)a5 error:(id *)a6;
- (id)initForFactory;
@end

@implementation OSLogStore

- (void).cxx_destruct
{
}

- (OSLogPosition)positionWithTimeIntervalSinceLatestBoot:(NSTimeInterval)seconds
{
  v3 = [[OSLogPosition alloc] initWithTimeIntervalSinceLatestBoot:seconds];

  return v3;
}

- (OSLogPosition)positionWithTimeIntervalSinceEnd:(NSTimeInterval)seconds
{
  v3 = [[OSLogPosition alloc] initWithEventSource:self->_source timeIntervalSinceEnd:seconds];

  return v3;
}

- (OSLogPosition)positionWithDate:(NSDate *)date
{
  v3 = date;
  v4 = [[OSLogPosition alloc] initWithDate:v3];

  return v4;
}

- (OSLogEnumerator)entriesEnumeratorAndReturnError:(NSError *)error
{
  return [(OSLogStore *)self entriesEnumeratorWithOptions:0 position:0 predicate:0 error:error];
}

- (OSLogEnumerator)entriesEnumeratorWithOptions:(OSLogEnumeratorOptions)options position:(OSLogPosition *)position predicate:(NSPredicate *)predicate error:(NSError *)error
{
  v10 = position;
  v11 = predicate;
  if (self->_constraint)
  {
    v12 = [(OSLogStore *)self _constrainedEntriesEnumeratorWithOptions:options position:v10 predicate:v11 error:error];
  }
  else
  {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F730C8]) initWithSource:self->_source];
    v14 = v13;
    if (v11) {
      [v13 setFilterPredicate:v11];
    }
    v12 = [[OSLogSystemEnumerator alloc] initWithEventStream:v14 options:options position:v10];
  }

  return (OSLogEnumerator *)v12;
}

- (id)_constrainedEntriesEnumeratorWithOptions:(unint64_t)a3 position:(id)a4 predicate:(id)a5 error:(id *)a6
{
  id v8 = a5;
  id v9 = a4;
  v10 = [[OSLogCurrentProcessEnumerator alloc] initWithOptions:a3 predicate:v8 position:v9];

  return v10;
}

- (id)initForFactory
{
  v3.receiver = self;
  v3.super_class = (Class)OSLogStore;
  return [(OSLogStore *)&v3 init];
}

- (OSLogStore)init
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1DC757000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Invalid direct use of -[OSLogStore init] (use factory instead)", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)OSLogStore;
  return [(OSLogStore *)&v4 init];
}

+ (OSLogStore)storeWithURL:(NSURL *)url error:(NSError *)error
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v5 = url;
  id v6 = [[OSLogStore alloc] initForFactory];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F730C0] storeWithArchiveURL:v5];
    if (v7)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __33__OSLogStore_storeWithURL_error___block_invoke;
      v12[3] = &unk_1E6CA1D60;
      v14 = error;
      id v8 = v6;
      v13 = v8;
      [v7 prepareWithCompletionHandler:v12];
      if (v8[1]) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
      v10 = v13;
    }
    else
    {
      if (!error)
      {
        v7 = 0;
        id v9 = 0;
        goto LABEL_12;
      }
      uint64_t v15 = *MEMORY[0x1E4F28568];
      v16 = @"Cannot open logarchive";
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F730E0] code:-1 userInfo:v10];
      id v9 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }

LABEL_12:
    goto LABEL_13;
  }
  if (error)
  {
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"Unable to alloc/init";
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F730E0] code:-1 userInfo:v7];
    id v9 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  id v9 = 0;
LABEL_13:

  return (OSLogStore *)v9;
}

void __33__OSLogStore_storeWithURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (*(void *)(a1 + 40)) {
      **(void **)(a1 + 40) = v6;
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
  }
}

+ (OSLogStore)storeWithScope:(OSLogStoreScope)scope error:(NSError *)error
{
  if (scope == OSLogStoreCurrentProcessIdentifier)
  {
    id v6 = [[OSLogStore alloc] initForFactory];
    if (v6) {
      v6[4] = 1;
    }
  }
  else
  {
    id v6 = 0;
  }
  return (OSLogStore *)v6;
}

@end