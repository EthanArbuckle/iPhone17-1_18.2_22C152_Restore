@interface EMQuery
+ (BOOL)_isValidSortDescriptor:(id)a3 forTargetClass:(Class)a4;
+ (BOOL)supportsSecureCoding;
+ (OS_os_log)log;
+ (void)addValidSortDescriptorKeyPaths:(id)a3 forTargetClass:(Class)a4;
- (BOOL)_isEqualToQuery:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (CSSuggestion)suggestion;
- (Class)targetClass;
- (EMQuery)initWithCoder:(id)a3;
- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5;
- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 builder:(id)a6;
- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 queryOptions:(unint64_t)a7 targetClassOptions:(id)a8 label:(id)a9;
- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 queryOptions:(unint64_t)a6 label:(id)a7;
- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 queryOptions:(unint64_t)a6 targetClassOptions:(id)a7 label:(id)a8;
- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 suggestion:(id)a6 limit:(int64_t)a7 queryOptions:(unint64_t)a8 targetClassOptions:(id)a9 label:(id)a10;
- (EMQuery)queryWithPredicate:(id)a3;
- (EMQuery)queryWithTargetClass:(Class)a3 predicate:(id)a4;
- (NSArray)sortDescriptors;
- (NSDictionary)targetClassOptions;
- (NSPredicate)predicate;
- (NSString)debugDescription;
- (NSString)label;
- (int64_t)limit;
- (unint64_t)hash;
- (unint64_t)queryOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLimit:(int64_t)a3;
- (void)setPredicate:(id)a3;
- (void)setQueryOptions:(unint64_t)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)setTargetClass:(Class)a3;
- (void)setTargetClassOptions:(id)a3;
@end

@implementation EMQuery

- (BOOL)_isEqualToQuery:(id)a3
{
  id v4 = a3;
  v5 = [(EMQuery *)self targetClass];
  if (v5 == (objc_class *)[v4 targetClass])
  {
    unint64_t v6 = [(EMQuery *)self queryOptions];
    if (v6 == [v4 queryOptions])
    {
      v7 = [(EMQuery *)self predicate];
      v8 = [v7 predicateFormat];
      v9 = [v4 predicate];
      v10 = [v9 predicateFormat];
      if (![v8 isEqual:v10])
      {
        char v16 = 0;
LABEL_18:

        goto LABEL_11;
      }
      v11 = [(EMQuery *)self sortDescriptors];
      v12 = [v4 sortDescriptors];
      if (![v11 isEqual:v12]
        || (int64_t v13 = -[EMQuery limit](self, "limit"), v13 != [v4 limit]))
      {
        char v16 = 0;
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v21 = [(EMQuery *)self suggestion];
      if (v21 || ([v4 suggestion], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v14 = [(EMQuery *)self suggestion];
        v15 = [v4 suggestion];
        char v16 = [v14 isEqual:v15];

        v17 = (void *)v21;
        if (v21)
        {
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {
        v20 = 0;
        char v16 = 1;
      }
      v17 = v20;
      goto LABEL_16;
    }
  }
  char v16 = 0;
LABEL_11:

  return v16;
}

- (Class)targetClass
{
  return self->_targetClass;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (unint64_t)queryOptions
{
  return self->_queryOptions;
}

- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 queryOptions:(unint64_t)a6 targetClassOptions:(id)a7 label:(id)a8
{
  return [(EMQuery *)self initWithTargetClass:a3 predicate:a4 sortDescriptors:a5 limit:0 queryOptions:a6 targetClassOptions:a7 label:a8];
}

- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 queryOptions:(unint64_t)a7 targetClassOptions:(id)a8 label:(id)a9
{
  return [(EMQuery *)self initWithTargetClass:a3 predicate:a4 sortDescriptors:a5 suggestion:0 limit:a6 queryOptions:a7 targetClassOptions:a8 label:a9];
}

- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 suggestion:(id)a6 limit:(int64_t)a7 queryOptions:(unint64_t)a8 targetClassOptions:(id)a9 label:(id)a10
{
  id v16 = a6;
  id v17 = a9;
  id v18 = a10;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __112__EMQuery_initWithTargetClass_predicate_sortDescriptors_suggestion_limit_queryOptions_targetClassOptions_label___block_invoke;
  v24[3] = &unk_1E63E5C38;
  int64_t v28 = a7;
  unint64_t v29 = a8;
  id v25 = v16;
  id v26 = v17;
  id v27 = v18;
  id v19 = v18;
  id v20 = v17;
  id v21 = v16;
  v22 = [(EMQuery *)self initWithTargetClass:a3 predicate:a4 sortDescriptors:a5 builder:v24];

  return v22;
}

- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 queryOptions:(unint64_t)a6 label:(id)a7
{
  return [(EMQuery *)self initWithTargetClass:a3 predicate:a4 sortDescriptors:a5 queryOptions:a6 targetClassOptions:0 label:a7];
}

- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  return [(EMQuery *)self initWithTargetClass:a3 predicate:a4 sortDescriptors:a5 queryOptions:0 label:0];
}

- (EMQuery)initWithTargetClass:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 builder:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  int64_t v13 = (void (**)(id, EMQuery *))a6;
  if (!v11)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"EMQuery.m", 84, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];
  }
  if ((unint64_t)[v12 count] >= 3)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"EMQuery.m", 85, @"Invalid parameter not satisfying: %@", @"sortDescriptors.count <= 2" object file lineNumber description];

    if (v13) {
      goto LABEL_5;
    }
  }
  else if (v13)
  {
    goto LABEL_5;
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"EMQuery.m", 86, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];

LABEL_5:
  v24.receiver = self;
  v24.super_class = (Class)EMQuery;
  v14 = [(EMQuery *)&v24 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_targetClass, a3);
    uint64_t v16 = [v11 copy];
    predicate = v15->_predicate;
    v15->_predicate = (NSPredicate *)v16;

    uint64_t v18 = [v12 copy];
    sortDescriptors = v15->_sortDescriptors;
    v15->_sortDescriptors = (NSArray *)v18;

    v13[2](v13, v15);
  }

  return v15;
}

void __25__EMQuery_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  v3 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_suggestion"];
  [v15 setSuggestion:v3];

  objc_msgSend(v15, "setLimit:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", @"EFPropertyKey_limit"));
  objc_msgSend(v15, "setQueryOptions:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", @"EFPropertyKey_queryOptions"));
  id v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  int64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"EFPropertyKey_targetClassOptions"];
  [v15 setTargetClassOptions:v13];

  v14 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_label"];
  [v15 setLabel:v14];
}

void __112__EMQuery_initWithTargetClass_predicate_sortDescriptors_suggestion_limit_queryOptions_targetClassOptions_label___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  [v3 setSuggestion:a1[4]];
  [v3 setLimit:a1[7]];
  [v3 setQueryOptions:a1[8]];
  [v3 setTargetClassOptions:a1[5]];
  [v3 setLabel:a1[6]];
}

- (void)setTargetClassOptions:(id)a3
{
}

- (void)setQueryOptions:(unint64_t)a3
{
  self->_queryOptions = a3;
}

- (void)setSuggestion:(id)a3
{
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void)setLabel:(id)a3
{
}

- (EMQuery)initWithCoder:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v20 = self;
  id v4 = [v22 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_targetClass"];
  Class v5 = NSClassFromString(v4);

  id v21 = [v22 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_predicate"];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v9 = [v22 decodeObjectOfClasses:v8 forKey:@"EFPropertyKey_sortDescriptors"];

  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (+[EMQuery _isValidSortDescriptor:v15 forTargetClass:v5])
          {
            [v15 allowEvaluation];
            [v10 addObject:v15];
          }
          else
          {
            uint64_t v16 = +[EMQuery log];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543618;
              v30 = v15;
              __int16 v31 = 2114;
              Class v32 = v5;
              _os_log_fault_impl(&dword_1BEFDB000, v16, OS_LOG_TYPE_FAULT, "%{public}@ is not a valid sort descriptor for target class %{public}@", buf, 0x16u);
            }

            __debugbreak();
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v10 = 0;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __25__EMQuery_initWithCoder___block_invoke;
  v23[3] = &unk_1E63E5C60;
  id v17 = v22;
  id v24 = v17;
  uint64_t v18 = [(EMQuery *)v20 initWithTargetClass:v5 predicate:v21 sortDescriptors:v10 builder:v23];

  return v18;
}

+ (BOOL)_isValidSortDescriptor:(id)a3 forTargetClass:(Class)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 key];

  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sSortDescriptorsLock);
    uint64_t v7 = [(id)sValidSortDescriptorKeyPathsByClass objectForKey:a4];
    uint64_t v8 = [v5 key];
    char v9 = [v7 containsObject:v8];

    os_unfair_lock_unlock((os_unfair_lock_t)&sSortDescriptorsLock);
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = NSStringFromClass([(EMQuery *)self targetClass]);
  [v10 encodeObject:v4 forKey:@"EFPropertyKey_targetClass"];

  id v5 = [(EMQuery *)self predicate];
  [v10 encodeObject:v5 forKey:@"EFPropertyKey_predicate"];

  uint64_t v6 = [(EMQuery *)self sortDescriptors];
  [v10 encodeObject:v6 forKey:@"EFPropertyKey_sortDescriptors"];

  objc_msgSend(v10, "encodeInteger:forKey:", -[EMQuery limit](self, "limit"), @"EFPropertyKey_limit");
  objc_msgSend(v10, "encodeInteger:forKey:", -[EMQuery queryOptions](self, "queryOptions"), @"EFPropertyKey_queryOptions");
  uint64_t v7 = [(EMQuery *)self targetClassOptions];
  [v10 encodeObject:v7 forKey:@"EFPropertyKey_targetClassOptions"];

  uint64_t v8 = [(EMQuery *)self label];
  [v10 encodeObject:v8 forKey:@"EFPropertyKey_label"];

  char v9 = [(EMQuery *)self suggestion];
  [v10 encodeObject:v9 forKey:@"EFPropertyKey_suggestion"];
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)hash
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = NSStringFromClass([(EMQuery *)self targetClass]);
  uint64_t v4 = [v3 hash];

  id v5 = [(EMQuery *)self predicate];
  uint64_t v6 = [v5 hash];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [(EMQuery *)self sortDescriptors];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  uint64_t v9 = 33 * v4 + v6 + 1089;
  if (v8)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v19 + 1) + 8 * v11);
        uint64_t v13 = [v12 hash];

        uint64_t v9 = v13 + 33 * v9;
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  uint64_t v14 = [(EMQuery *)self limit];
  unint64_t v15 = [(EMQuery *)self queryOptions];
  uint64_t v16 = [(EMQuery *)self suggestion];
  uint64_t v17 = [v16 hash];
  if (v14 < 0) {
    uint64_t v14 = -v14;
  }

  return 33 * (33 * (v14 + 33 * v9) + v15) + v17;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (CSSuggestion)suggestion
{
  return self->_suggestion;
}

- (int64_t)limit
{
  return self->_limit;
}

- (NSDictionary)targetClassOptions
{
  return self->_targetClassOptions;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (EMQuery *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(EMQuery *)self _isEqualToQuery:v4];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_targetClassOptions, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_targetClass, 0);
}

+ (void)addValidSortDescriptorKeyPaths:(id)a3 forTargetClass:(Class)a4
{
  id v12 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&sSortDescriptorsLock);
  BOOL v5 = (void *)sValidSortDescriptorKeyPathsByClass;
  if (!sValidSortDescriptorKeyPathsByClass)
  {
    uint64_t v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    uint64_t v7 = (void *)sValidSortDescriptorKeyPathsByClass;
    sValidSortDescriptorKeyPathsByClass = v6;

    BOOL v5 = (void *)sValidSortDescriptorKeyPathsByClass;
  }
  uint64_t v8 = [v5 objectForKey:a4];

  if (!v8)
  {
    uint64_t v9 = (void *)sValidSortDescriptorKeyPathsByClass;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [v9 setObject:v10 forKey:a4];
  }
  uint64_t v11 = [(id)sValidSortDescriptorKeyPathsByClass objectForKey:a4];
  [v11 addObjectsFromArray:v12];

  os_unfair_lock_unlock((os_unfair_lock_t)&sSortDescriptorsLock);
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __14__EMQuery_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_33 != -1) {
    dispatch_once(&log_onceToken_33, block);
  }
  v2 = (void *)log_log_33;
  return (OS_os_log *)v2;
}

void __14__EMQuery_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_33;
  log_log_33 = (uint64_t)v1;
}

- (EMQuery)queryWithPredicate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EMQuery *)self queryWithTargetClass:[(EMQuery *)self targetClass] predicate:v4];

  return (EMQuery *)v5;
}

- (EMQuery)queryWithTargetClass:(Class)a3 predicate:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(EMQuery *)self queryOptions];
  uint64_t v8 = [EMQuery alloc];
  uint64_t v9 = [(EMQuery *)self sortDescriptors];
  id v10 = [(EMQuery *)self suggestion];
  int64_t v11 = [(EMQuery *)self limit];
  id v12 = [(EMQuery *)self targetClassOptions];
  uint64_t v13 = [(EMQuery *)self label];
  uint64_t v14 = [(EMQuery *)v8 initWithTargetClass:a3 predicate:v6 sortDescriptors:v9 suggestion:v10 limit:v11 queryOptions:v7 & 0xFFFFFFFFFFFFFFFDLL targetClassOptions:v12 label:v13];

  return v14;
}

- (BOOL)isValid
{
  id v3 = [(EMQuery *)self predicate];
  BOOL v4 = +[EMMessageListItemPredicates isValidPredicate:v3 forClass:[(EMQuery *)self targetClass]];

  return v4;
}

- (NSString)debugDescription
{
  uint64_t v14 = NSString;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(EMQuery *)self label];
  BOOL v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_1F1A3DFB0;
  }
  unint64_t v15 = NSStringFromClass([(EMQuery *)self targetClass]);
  unint64_t v7 = [(EMQuery *)self predicate];
  uint64_t v8 = [v7 debugDescription];
  uint64_t v9 = [(EMQuery *)self sortDescriptors];
  id v10 = [v9 debugDescription];
  int64_t v11 = [(EMQuery *)self suggestion];
  id v12 = [v14 stringWithFormat:@"<%@: %p> %@ \n\tresult class:%@ \n\tpredicate:%@ \n\tsort descriptors:%@ \n\tsuggestion:%@ \n\tqueryOptions:%lu\n\tlimit:%ld", v3, self, v6, v15, v8, v10, v11, -[EMQuery queryOptions](self, "queryOptions"), -[EMQuery limit](self, "limit")];

  return (NSString *)v12;
}

- (void)setTargetClass:(Class)a3
{
}

- (void)setPredicate:(id)a3
{
}

- (void)setSortDescriptors:(id)a3
{
}

@end