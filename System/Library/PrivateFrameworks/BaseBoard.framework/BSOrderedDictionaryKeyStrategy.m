@interface BSOrderedDictionaryKeyStrategy
+ (id)new;
+ (id)sortByInsertionOrder;
+ (id)sortByInsertionOrderWithEntryLimit:(int64_t)a3;
+ (id)sortUsingComparator:(id)a3;
- (BSOrderedDictionaryKeyStrategy)init;
- (id)_init;
- (id)keyComparator;
- (int64_t)limitCount;
- (void)setKeyComparator:(id)a3;
- (void)setLimitCount:(int64_t)a3;
@end

@implementation BSOrderedDictionaryKeyStrategy

- (int64_t)limitCount
{
  return self->_limitCount;
}

+ (id)sortByInsertionOrder
{
  if (_MergedGlobals_36 != -1) {
    dispatch_once(&_MergedGlobals_36, &__block_literal_global_34);
  }
  v2 = (void *)qword_1EB21B3B0;
  return v2;
}

- (id)_init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)BSOrderedDictionaryKeyStrategy;
  v3 = [(BSOrderedDictionaryKeyStrategy *)&v10 init];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    if (v4 != objc_opt_class())
    {
      v6 = [NSString stringWithFormat:@"subclassing not permitted"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138544642;
        id v12 = v7;
        __int16 v13 = 2114;
        v14 = v9;
        __int16 v15 = 2048;
        v16 = v3;
        __int16 v17 = 2114;
        v18 = @"BSOrderedDictionary.m";
        __int16 v19 = 1024;
        int v20 = 60;
        __int16 v21 = 2114;
        v22 = v6;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v6 UTF8String];
      __break(0);
      JUMPOUT(0x18AAFA768);
    }
  }
  return v3;
}

+ (id)sortByInsertionOrderWithEntryLimit:(int64_t)a3
{
  id v4 = [[BSOrderedDictionaryKeyStrategy alloc] _init];
  [v4 setLimitCount:a3];
  return v4;
}

+ (id)new
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"use one of the class methods"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    v16 = @"BSOrderedDictionary.m";
    __int16 v17 = 1024;
    int v18 = 37;
    __int16 v19 = 2114;
    int v20 = v4;
    _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  id result = (id) [v4 UTF8String];
  qword_1E911F420 = (uint64_t)result;
  __break(0);
  return result;
}

- (BSOrderedDictionaryKeyStrategy)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"use one of the class methods"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    v16 = @"BSOrderedDictionary.m";
    __int16 v17 = 1024;
    int v18 = 42;
    __int16 v19 = 2114;
    int v20 = v4;
    _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  id result = (BSOrderedDictionaryKeyStrategy *)[v4 UTF8String];
  qword_1E911F420 = (uint64_t)result;
  __break(0);
  return result;
}

void __54__BSOrderedDictionaryKeyStrategy_sortByInsertionOrder__block_invoke()
{
  id v0 = [[BSOrderedDictionaryKeyStrategy alloc] _init];
  v1 = (void *)qword_1EB21B3B0;
  qword_1EB21B3B0 = (uint64_t)v0;
}

+ (id)sortUsingComparator:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"comparator != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = (objc_class *)objc_opt_class();
      __int16 v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      __int16 v15 = v11;
      __int16 v16 = 2048;
      id v17 = a1;
      __int16 v18 = 2114;
      __int16 v19 = @"BSOrderedDictionary.m";
      __int16 v20 = 1024;
      int v21 = 72;
      __int16 v22 = 2114;
      uint64_t v23 = v8;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v8 UTF8String];
    __break(0);
    JUMPOUT(0x18AB3FF30);
  }
  id v4 = [[BSOrderedDictionaryKeyStrategy alloc] _init];
  [v4 setKeyComparator:a3];
  return v4;
}

- (void)setLimitCount:(int64_t)a3
{
  self->_limitCount = a3;
}

- (id)keyComparator
{
  return self->_keyComparator;
}

- (void)setKeyComparator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end