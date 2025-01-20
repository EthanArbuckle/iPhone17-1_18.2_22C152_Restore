@interface BSMutableOrderedDictionary
+ (BOOL)supportsSecureCoding;
- (BSMutableOrderedDictionary)init;
- (BSMutableOrderedDictionary)initWithCapacity:(unint64_t)a3 keyOrderingStrategy:(id)a4;
- (BSMutableOrderedDictionary)initWithCoder:(id)a3;
- (BSMutableOrderedDictionary)initWithDictionary:(id)a3 keyOrderingStrategy:(id)a4;
- (BSMutableOrderedDictionary)initWithKeyOrderingStrategy:(id)a3;
- (BSMutableOrderedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (BSOrderedDictionaryKeyStrategy)keyOrderingStrategy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addEntriesFromDictionary:(id)a3;
- (void)addEntriesFromOrderedDictionary:(id)a3;
- (void)addObject:(id)a3 toCollectionClass:(Class)a4 forKey:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3 fromCollectionForKey:(id)a4;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectsForKeys:(id)a3;
- (void)removeObjectsInRange:(_NSRange)a3;
- (void)setKeyOrderingStrategy:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation BSMutableOrderedDictionary

- (void)addObject:(id)a3 toCollectionClass:(Class)a4 forKey:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() != a4 && (Class)objc_opt_class() != a4 && (Class)objc_opt_class() != a4)
  {
    v10 = [NSString stringWithFormat:@"'%@' must be NSMutableSet, NSMutableOrderedSet, or NSMutableArray, not (%@)", a5, a4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      id v16 = v11;
      __int16 v17 = 2114;
      v18 = v13;
      __int16 v19 = 2048;
      v20 = self;
      __int16 v21 = 2114;
      v22 = @"BSOrderedDictionary.m";
      __int16 v23 = 1024;
      int v24 = 536;
      __int16 v25 = 2114;
      v26 = v10;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v10 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE87A8);
  }
  id v14 = [(BSOrderedDictionary *)self objectForKey:a5];
  if (!v14)
  {
    id v14 = objc_alloc_init(a4);
    [(BSMutableOrderedDictionary *)self setObject:v14 forKey:a5];
  }
  [v14 addObject:a3];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [(BSOrderedDictionary *)self count];
  if (self)
  {
    if (!a4)
    {
      v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"inKey != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__setObject_forKey_atIndex_);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        __int16 v21 = NSStringFromClass(v20);
        *(_DWORD *)buf = 138544642;
        id v32 = v19;
        __int16 v33 = 2114;
        v34 = v21;
        __int16 v35 = 2048;
        v36 = self;
        __int16 v37 = 2114;
        v38 = @"BSOrderedDictionary.m";
        __int16 v39 = 1024;
        int v40 = 457;
        __int16 v41 = 2114;
        v42 = v18;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v18 UTF8String];
      __break(0);
      JUMPOUT(0x18AAE8AC0);
    }
    if (!a3)
    {
      v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"object != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__setObject_forKey_atIndex_);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        int v24 = (objc_class *)objc_opt_class();
        __int16 v25 = NSStringFromClass(v24);
        *(_DWORD *)buf = 138544642;
        id v32 = v23;
        __int16 v33 = 2114;
        v34 = v25;
        __int16 v35 = 2048;
        v36 = self;
        __int16 v37 = 2114;
        v38 = @"BSOrderedDictionary.m";
        __int16 v39 = 1024;
        int v40 = 458;
        __int16 v41 = 2114;
        v42 = v22;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v22 UTF8String];
      __break(0);
      JUMPOUT(0x18AAE8BC4);
    }
    uint64_t v8 = v7;
    int64_t v9 = [(BSOrderedDictionary *)self count];
    if (v9 < v8)
    {
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"idx:%d greater than count:%d", v8, v9);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__setObject_forKey_atIndex_);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        *(_DWORD *)buf = 138544642;
        id v32 = v27;
        __int16 v33 = 2114;
        v34 = v29;
        __int16 v35 = 2048;
        v36 = self;
        __int16 v37 = 2114;
        v38 = @"BSOrderedDictionary.m";
        __int16 v39 = 1024;
        int v40 = 460;
        __int16 v41 = 2114;
        v42 = v26;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v26 UTF8String];
      __break(0);
      JUMPOUT(0x18AAE8CC0);
    }
    id v30 = (id)[a4 copyWithZone:0];
    v10 = self->super._keys;
    id v11 = self->super._values;
    v12 = [(NSDictionary *)v11 objectForKey:v30];
    if (v12)
    {
      uint64_t v13 = [(NSArray *)v10 indexOfObject:v30];
      [(NSArray *)v10 removeObjectAtIndex:v13];
      [(NSDictionary *)v11 removeObjectForKey:v30];
      --v9;
      v8 -= v13 <= v8;
    }
    uint64_t v14 = [(BSOrderedDictionaryKeyStrategy *)self->super._keyOrderingStrategy limitCount];
    if (v14 >= 1)
    {
      uint64_t v15 = v9 - v14 + 1;
      if (v15 >= 1)
      {
        -[BSMutableOrderedDictionary removeObjectsInRange:](self, "removeObjectsInRange:", 0, v15);
        if (v8 <= v15) {
          uint64_t v16 = 0;
        }
        else {
          uint64_t v16 = v15;
        }
        v8 -= v16;
      }
    }
    keyOrderingStrategy = self->super._keyOrderingStrategy;
    if (keyOrderingStrategy && keyOrderingStrategy->_keyComparator) {
      uint64_t v8 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](v10, "indexOfObject:inSortedRange:options:usingComparator:", v30, 0, [(NSArray *)v10 count], 1024, self->super._keyOrderingStrategy->_keyComparator);
    }
    [(NSArray *)v10 insertObject:v30 atIndex:v8];
    [(NSDictionary *)v11 setObject:a3 forKey:v30];
  }
}

- (BSMutableOrderedDictionary)init
{
  v3 = +[BSOrderedDictionaryKeyStrategy sortByInsertionOrder];
  v4 = [(BSMutableOrderedDictionary *)self initWithKeyOrderingStrategy:v3];

  return v4;
}

- (BSMutableOrderedDictionary)initWithKeyOrderingStrategy:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v13 = NSString;
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    uint64_t v16 = [v13 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"strategy", v15];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138544642;
      id v31 = v17;
      __int16 v32 = 2114;
      __int16 v33 = v19;
      __int16 v34 = 2048;
      __int16 v35 = self;
      __int16 v36 = 2114;
      __int16 v37 = @"BSOrderedDictionary.m";
      __int16 v38 = 1024;
      int v39 = 348;
      __int16 v40 = 2114;
      __int16 v41 = v16;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v16 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE9480);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = NSString;
    __int16 v21 = (objc_class *)[v6 classForCoder];
    if (!v21) {
      __int16 v21 = (objc_class *)objc_opt_class();
    }
    v22 = NSStringFromClass(v21);
    id v23 = (objc_class *)objc_opt_class();
    int v24 = NSStringFromClass(v23);
    __int16 v25 = [v20 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"strategy", v22, v24];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      id v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      *(_DWORD *)buf = 138544642;
      id v31 = v26;
      __int16 v32 = 2114;
      __int16 v33 = v28;
      __int16 v34 = 2048;
      __int16 v35 = self;
      __int16 v36 = 2114;
      __int16 v37 = @"BSOrderedDictionary.m";
      __int16 v38 = 1024;
      int v39 = 348;
      __int16 v40 = 2114;
      __int16 v41 = v25;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v25 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE95C8);
  }

  v29.receiver = self;
  v29.super_class = (Class)BSMutableOrderedDictionary;
  unint64_t v7 = [(BSOrderedDictionary *)&v29 _initTabulaRasa];
  if (v7)
  {
    uint64_t v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    keys = v7->super._keys;
    v7->super._keys = v8;

    v10 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    values = v7->super._values;
    v7->super._values = v10;

    objc_storeStrong((id *)&v7->super._keyOrderingStrategy, a3);
  }
  return v7;
}

- (void)addEntriesFromOrderedDictionary:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = NSString;
    unint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    int64_t v9 = [v6 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"otherDictionary", v8];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138544642;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = v12;
      __int16 v27 = 2048;
      v28 = self;
      __int16 v29 = 2114;
      id v30 = @"BSOrderedDictionary.m";
      __int16 v31 = 1024;
      int v32 = 518;
      __int16 v33 = 2114;
      __int16 v34 = v9;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v9 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF3314);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = NSString;
    uint64_t v14 = (objc_class *)[v5 classForCoder];
    if (!v14) {
      uint64_t v14 = (objc_class *)objc_opt_class();
    }
    uint64_t v15 = NSStringFromClass(v14);
    uint64_t v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    v18 = [v13 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"otherDictionary", v15, v17];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      __int16 v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      id v24 = v19;
      __int16 v25 = 2114;
      id v26 = v21;
      __int16 v27 = 2048;
      v28 = self;
      __int16 v29 = 2114;
      id v30 = @"BSOrderedDictionary.m";
      __int16 v31 = 1024;
      int v32 = 518;
      __int16 v33 = 2114;
      __int16 v34 = v18;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v18 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF345CLL);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __62__BSMutableOrderedDictionary_addEntriesFromOrderedDictionary___block_invoke;
  v22[3] = &unk_1E5446F30;
  v22[4] = self;
  [v5 enumerateKeysAndObjectsWithIndexesUsingBlock:v22];
}

- (void)addEntriesFromDictionary:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = NSString;
    unint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    int64_t v9 = [v6 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"otherDictionary", v8];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138544642;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = v12;
      __int16 v27 = 2048;
      v28 = self;
      __int16 v29 = 2114;
      id v30 = @"BSOrderedDictionary.m";
      __int16 v31 = 1024;
      int v32 = 527;
      __int16 v33 = 2114;
      __int16 v34 = v9;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v9 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF36E4);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = NSString;
    uint64_t v14 = (objc_class *)[v5 classForCoder];
    if (!v14) {
      uint64_t v14 = (objc_class *)objc_opt_class();
    }
    uint64_t v15 = NSStringFromClass(v14);
    uint64_t v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    v18 = [v13 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"otherDictionary", v15, v17];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      __int16 v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      id v24 = v19;
      __int16 v25 = 2114;
      id v26 = v21;
      __int16 v27 = 2048;
      v28 = self;
      __int16 v29 = 2114;
      id v30 = @"BSOrderedDictionary.m";
      __int16 v31 = 1024;
      int v32 = 527;
      __int16 v33 = 2114;
      __int16 v34 = v18;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v18 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF382CLL);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __55__BSMutableOrderedDictionary_addEntriesFromDictionary___block_invoke;
  v22[3] = &unk_1E5446F58;
  v22[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v22];
}

- (BSMutableOrderedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", a4, a5, @"objects != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138544642;
      id v28 = v16;
      __int16 v29 = 2114;
      id v30 = v18;
      __int16 v31 = 2048;
      int v32 = self;
      __int16 v33 = 2114;
      __int16 v34 = @"BSOrderedDictionary.m";
      __int16 v35 = 1024;
      int v36 = 386;
      __int16 v37 = 2114;
      __int16 v38 = v15;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v15 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF6268);
  }
  unint64_t v7 = a4;
  if (!a4)
  {
    id v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", 0, a5, @"keys != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138544642;
      id v28 = v20;
      __int16 v29 = 2114;
      id v30 = v22;
      __int16 v31 = 2048;
      int v32 = self;
      __int16 v33 = 2114;
      __int16 v34 = @"BSOrderedDictionary.m";
      __int16 v35 = 1024;
      int v36 = 387;
      __int16 v37 = 2114;
      __int16 v38 = v19;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v19 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF636CLL);
  }
  unint64_t v8 = a5;
  if (!a5)
  {
    id v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"count > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v25 = (objc_class *)objc_opt_class();
      id v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138544642;
      id v28 = v24;
      __int16 v29 = 2114;
      id v30 = v26;
      __int16 v31 = 2048;
      int v32 = self;
      __int16 v33 = 2114;
      __int16 v34 = @"BSOrderedDictionary.m";
      __int16 v35 = 1024;
      int v36 = 388;
      __int16 v37 = 2114;
      __int16 v38 = v23;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v23 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF6470);
  }
  int64_t v9 = a3;
  id v10 = +[BSOrderedDictionaryKeyStrategy sortByInsertionOrder];
  id v11 = [(BSMutableOrderedDictionary *)self initWithCapacity:v8 keyOrderingStrategy:v10];

  if (v11)
  {
    do
    {
      id v12 = (id)*v7;
      id v13 = (id)*v9;
      [(BSMutableOrderedDictionary *)v11 setObject:v13 forKey:v12];

      ++v9;
      ++v7;
      --v8;
    }
    while (v8);
  }
  return v11;
}

- (void)removeObjectForKey:(id)a3
{
  if (a3)
  {
    id v6 = self->super._keys;
    id v5 = self->super._values;
    [(NSArray *)v6 removeObject:a3];
    [(NSDictionary *)v5 removeObjectForKey:a3];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [BSOrderedDictionary alloc];
  return (id)-[BSOrderedDictionary _initWithCopyOfOrderedDictionary:](v4, (id *)&self->super.super.isa);
}

- (BSMutableOrderedDictionary)initWithCapacity:(unint64_t)a3 keyOrderingStrategy:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!v8)
  {
    uint64_t v15 = NSString;
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    v18 = [v15 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"strategy", v17];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v20 = (objc_class *)objc_opt_class();
      __int16 v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      id v33 = v19;
      __int16 v34 = 2114;
      __int16 v35 = v21;
      __int16 v36 = 2048;
      __int16 v37 = self;
      __int16 v38 = 2114;
      uint64_t v39 = @"BSOrderedDictionary.m";
      __int16 v40 = 1024;
      int v41 = 360;
      __int16 v42 = 2114;
      uint64_t v43 = v18;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v18 UTF8String];
    __break(0);
    JUMPOUT(0x18AB410E0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = NSString;
    id v23 = (objc_class *)[v8 classForCoder];
    if (!v23) {
      id v23 = (objc_class *)objc_opt_class();
    }
    id v24 = NSStringFromClass(v23);
    __int16 v25 = (objc_class *)objc_opt_class();
    id v26 = NSStringFromClass(v25);
    __int16 v27 = [v22 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"strategy", v24, v26];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v29 = (objc_class *)objc_opt_class();
      id v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138544642;
      id v33 = v28;
      __int16 v34 = 2114;
      __int16 v35 = v30;
      __int16 v36 = 2048;
      __int16 v37 = self;
      __int16 v38 = 2114;
      uint64_t v39 = @"BSOrderedDictionary.m";
      __int16 v40 = 1024;
      int v41 = 360;
      __int16 v42 = 2114;
      uint64_t v43 = v27;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v27 UTF8String];
    __break(0);
    JUMPOUT(0x18AB41228);
  }

  v31.receiver = self;
  v31.super_class = (Class)BSMutableOrderedDictionary;
  int64_t v9 = [(BSOrderedDictionary *)&v31 _initTabulaRasa];
  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    keys = v9->super._keys;
    v9->super._keys = (NSArray *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
    values = v9->super._values;
    v9->super._values = (NSDictionary *)v12;

    objc_storeStrong((id *)&v9->super._keyOrderingStrategy, a4);
  }
  return v9;
}

- (BSMutableOrderedDictionary)initWithDictionary:(id)a3 keyOrderingStrategy:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v17 = NSString;
    v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    id v20 = [v17 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"dictionary", v19];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      id v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138544642;
      id v55 = v21;
      __int16 v56 = 2114;
      v57 = v23;
      __int16 v58 = 2048;
      v59 = self;
      __int16 v60 = 2114;
      v61 = @"BSOrderedDictionary.m";
      __int16 v62 = 1024;
      int v63 = 372;
      __int16 v64 = 2114;
      v65 = v20;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v20 UTF8String];
    __break(0);
    JUMPOUT(0x18AB41590);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v24 = NSString;
    __int16 v25 = (objc_class *)[v7 classForCoder];
    if (!v25) {
      __int16 v25 = (objc_class *)objc_opt_class();
    }
    id v26 = NSStringFromClass(v25);
    __int16 v27 = (objc_class *)objc_opt_class();
    id v28 = NSStringFromClass(v27);
    __int16 v29 = [v24 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"dictionary", v26, v28];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_super v31 = (objc_class *)objc_opt_class();
      int v32 = NSStringFromClass(v31);
      *(_DWORD *)buf = 138544642;
      id v55 = v30;
      __int16 v56 = 2114;
      v57 = v32;
      __int16 v58 = 2048;
      v59 = self;
      __int16 v60 = 2114;
      v61 = @"BSOrderedDictionary.m";
      __int16 v62 = 1024;
      int v63 = 372;
      __int16 v64 = 2114;
      v65 = v29;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v29 UTF8String];
    __break(0);
    JUMPOUT(0x18AB416D8);
  }

  id v8 = a4;
  if (!v8)
  {
    id v33 = NSString;
    __int16 v34 = (objc_class *)objc_opt_class();
    __int16 v35 = NSStringFromClass(v34);
    __int16 v36 = [v33 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"strategy", v35];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v38 = (objc_class *)objc_opt_class();
      uint64_t v39 = NSStringFromClass(v38);
      *(_DWORD *)buf = 138544642;
      id v55 = v37;
      __int16 v56 = 2114;
      v57 = v39;
      __int16 v58 = 2048;
      v59 = self;
      __int16 v60 = 2114;
      v61 = @"BSOrderedDictionary.m";
      __int16 v62 = 1024;
      int v63 = 373;
      __int16 v64 = 2114;
      v65 = v36;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v36 UTF8String];
    __break(0);
    JUMPOUT(0x18AB417F8);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v40 = NSString;
    int v41 = (objc_class *)[v8 classForCoder];
    if (!v41) {
      int v41 = (objc_class *)objc_opt_class();
    }
    __int16 v42 = NSStringFromClass(v41);
    uint64_t v43 = (objc_class *)objc_opt_class();
    uint64_t v44 = NSStringFromClass(v43);
    v45 = [v40 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"strategy", v42, v44];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v46 = (id)objc_claimAutoreleasedReturnValue();
      v47 = (objc_class *)objc_opt_class();
      v48 = NSStringFromClass(v47);
      *(_DWORD *)buf = 138544642;
      id v55 = v46;
      __int16 v56 = 2114;
      v57 = v48;
      __int16 v58 = 2048;
      v59 = self;
      __int16 v60 = 2114;
      v61 = @"BSOrderedDictionary.m";
      __int16 v62 = 1024;
      int v63 = 373;
      __int16 v64 = 2114;
      v65 = v45;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v45 UTF8String];
    __break(0);
    JUMPOUT(0x18AB41940);
  }

  int64_t v9 = -[BSMutableOrderedDictionary initWithCapacity:keyOrderingStrategy:](self, "initWithCapacity:keyOrderingStrategy:", [v7 count], v8);
  if (v9)
  {
    [v7 allKeys];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v50 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          uint64_t v15 = [v7 objectForKey:v14];
          [(BSMutableOrderedDictionary *)v9 setObject:v15 forKey:v14];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v11);
    }
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSMutableOrderedDictionary)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BSMutableOrderedDictionary;
  return [(BSOrderedDictionary *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BSMutableOrderedDictionary;
  [(BSOrderedDictionary *)&v3 encodeWithCoder:a3];
}

- (BSOrderedDictionaryKeyStrategy)keyOrderingStrategy
{
  keyOrderingStrategy = self->super._keyOrderingStrategy;
  if (keyOrderingStrategy)
  {
    objc_super v3 = keyOrderingStrategy;
  }
  else
  {
    objc_super v3 = +[BSOrderedDictionaryKeyStrategy sortByInsertionOrder];
  }
  return v3;
}

- (void)setKeyOrderingStrategy:(id)a3
{
  objc_super v4 = (BSOrderedDictionaryKeyStrategy *)a3;
  if (!v4)
  {
    objc_super v4 = +[BSOrderedDictionaryKeyStrategy sortByInsertionOrder];
  }
  if (self->super._keyOrderingStrategy != v4)
  {
    uint64_t v11 = v4;
    objc_storeStrong((id *)&self->super._keyOrderingStrategy, v4);
    uint64_t v5 = [(BSOrderedDictionaryKeyStrategy *)v11 limitCount];
    if (v5 >= 1 && (int64_t)([(BSOrderedDictionary *)self count] - v5) >= 1) {
      [(BSMutableOrderedDictionary *)self removeObjectsInRange:0];
    }
    objc_super v4 = v11;
    if (v11->_keyComparator)
    {
      -[BSOrderedDictionary sortedDictionaryUsingComparator:](self, "sortedDictionaryUsingComparator:");
      id v6 = (id *)objc_claimAutoreleasedReturnValue();
      id v7 = (NSArray *)[v6[1] mutableCopy];
      keys = self->super._keys;
      self->super._keys = v7;

      int64_t v9 = (NSDictionary *)[v6[2] mutableCopy];
      values = self->super._values;
      self->super._values = v9;

      objc_super v4 = v11;
    }
  }
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  if (a3) {
    [(BSMutableOrderedDictionary *)self setObject:a3 forKey:a4];
  }
  else {
    [(BSMutableOrderedDictionary *)self removeObjectForKey:a4];
  }
}

uint64_t __62__BSMutableOrderedDictionary_addEntriesFromOrderedDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKey:a3];
}

uint64_t __55__BSMutableOrderedDictionary_addEntriesFromDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKey:a3];
}

- (void)removeObject:(id)a3 fromCollectionForKey:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v12 = [(BSOrderedDictionary *)self objectForKey:a4];
    if (v12)
    {
      if ((_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0 && (_NSIsNSArray() & 1) == 0)
      {
        id v8 = [NSString stringWithFormat:@"'%@' must be NSMutableSet, NSMutableOrderedSet, or NSMutableArray, not (%@)", a4, objc_opt_class()];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
          id v10 = (objc_class *)objc_opt_class();
          uint64_t v11 = NSStringFromClass(v10);
          *(_DWORD *)buf = 138544642;
          id v14 = v9;
          __int16 v15 = 2114;
          id v16 = v11;
          __int16 v17 = 2048;
          v18 = self;
          __int16 v19 = 2114;
          id v20 = @"BSOrderedDictionary.m";
          __int16 v21 = 1024;
          int v22 = 553;
          __int16 v23 = 2114;
          id v24 = v8;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        qword_1E911F420 = [v8 UTF8String];
        __break(0);
        JUMPOUT(0x18AB41E8CLL);
      }
      [v12 removeObject:a3];
      if (![v12 count]) {
        [(BSMutableOrderedDictionary *)self removeObjectForKey:a4];
      }
    }
  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id v7 = self->super._keys;
  uint64_t v5 = self->super._values;
  id v6 = [(NSArray *)v7 objectAtIndex:a3];
  [(NSArray *)v7 removeObject:v6];
  [(NSDictionary *)v5 removeObjectForKey:v6];
}

- (void)removeObjectsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (a3.location >= 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = NSString;
    id v13 = NSStringFromRange(a3);
    id v14 = [v12 stringWithFormat:@"range.location too large: %@", v13];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = (objc_class *)objc_opt_class();
      __int16 v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      id v37 = v15;
      __int16 v38 = 2114;
      uint64_t v39 = v17;
      __int16 v40 = 2048;
      int v41 = self;
      __int16 v42 = 2114;
      uint64_t v43 = @"BSOrderedDictionary.m";
      __int16 v44 = 1024;
      int v45 = 583;
      __int16 v46 = 2114;
      v47 = v14;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v14 UTF8String];
    __break(0);
    JUMPOUT(0x18AB42234);
  }
  if (a3.length >= 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = NSString;
    __int16 v19 = NSStringFromRange(a3);
    id v20 = [v18 stringWithFormat:@"range.length too large: %@", v19];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      int v22 = (objc_class *)objc_opt_class();
      __int16 v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138544642;
      id v37 = v21;
      __int16 v38 = 2114;
      uint64_t v39 = v23;
      __int16 v40 = 2048;
      int v41 = self;
      __int16 v42 = 2114;
      uint64_t v43 = @"BSOrderedDictionary.m";
      __int16 v44 = 1024;
      int v45 = 584;
      __int16 v46 = 2114;
      v47 = v20;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v20 UTF8String];
    __break(0);
    JUMPOUT(0x18AB4234CLL);
  }
  unint64_t v7 = [(BSOrderedDictionary *)self count];
  if (location + length > v7)
  {
    unint64_t v24 = v7;
    uint64_t v25 = NSString;
    v50.NSUInteger location = location;
    v50.NSUInteger length = length;
    id v26 = NSStringFromRange(v50);
    __int16 v27 = [v25 stringWithFormat:@"range (%@) exceeds self.count (%d)", v26, v24];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v29 = (objc_class *)objc_opt_class();
      id v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138544642;
      id v37 = v28;
      __int16 v38 = 2114;
      uint64_t v39 = v30;
      __int16 v40 = 2048;
      int v41 = self;
      __int16 v42 = 2114;
      uint64_t v43 = @"BSOrderedDictionary.m";
      __int16 v44 = 1024;
      int v45 = 586;
      __int16 v46 = 2114;
      v47 = v27;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v27 UTF8String];
    __break(0);
    JUMPOUT(0x18AB42468);
  }
  __int16 v35 = self->super._keys;
  id v8 = self->super._values;
  if (location || length != [(BSOrderedDictionary *)self count])
  {
    if (length)
    {
      if (length == 1)
      {
        id v9 = [(NSArray *)v35 objectAtIndex:location];
        [(NSArray *)v35 removeObjectAtIndex:location];
        [(NSDictionary *)v8 removeObjectForKey:v9];
      }
      else
      {
        id v10 = malloc_type_malloc(8 * length, 0x80040B8603338uLL);
        if (!v10)
        {
          objc_super v31 = objc_msgSend(NSString, "stringWithFormat:", @"Unix can't run out of memory! you will regret this! (failed to allocate for %d items)", length);
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            id v32 = (id)objc_claimAutoreleasedReturnValue();
            id v33 = (objc_class *)objc_opt_class();
            __int16 v34 = NSStringFromClass(v33);
            *(_DWORD *)buf = 138544642;
            id v37 = v32;
            __int16 v38 = 2114;
            uint64_t v39 = v34;
            __int16 v40 = 2048;
            int v41 = self;
            __int16 v42 = 2114;
            uint64_t v43 = @"BSOrderedDictionary.m";
            __int16 v44 = 1024;
            int v45 = 602;
            __int16 v46 = 2114;
            v47 = v31;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          qword_1E911F420 = [v31 UTF8String];
          __break(0);
          JUMPOUT(0x18AB42564);
        }
        -[NSArray getObjects:range:](v35, "getObjects:range:", v10, location, length);
        -[NSArray removeObjectsInRange:](v35, "removeObjectsInRange:", location, length);
        for (uint64_t i = 0; i != length; ++i)
          [(NSDictionary *)v8 removeObjectForKey:v10[i]];
        free(v10);
      }
    }
  }
  else
  {
    [(NSArray *)v35 removeAllObjects];
    [(NSDictionary *)v8 removeAllObjects];
  }
}

- (void)removeAllObjects
{
  objc_super v4 = self->super._keys;
  objc_super v3 = self->super._values;
  [(NSArray *)v4 removeAllObjects];
  [(NSDictionary *)v3 removeAllObjects];
}

- (void)removeObjectsForKeys:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        -[BSMutableOrderedDictionary removeObjectForKey:](self, "removeObjectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

@end