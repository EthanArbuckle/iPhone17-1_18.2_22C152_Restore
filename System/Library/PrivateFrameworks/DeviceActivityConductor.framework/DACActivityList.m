@interface DACActivityList
+ (BOOL)supportsSecureCoding;
- (BOOL)addActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualIgnoringLastModified:(id)a3;
- (BOOL)removeActivity:(id)a3 requester:(id)a4;
- (DACActivityList)init;
- (DACActivityList)initWithCoder:(id)a3;
- (DACActivityList)listWithMerge:(id)a3;
- (NSDate)lastModified;
- (id)changeMarkerForActivity:(id)a3;
- (id)changesFromList:(id)a3 includingMetadata:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (os_unfair_lock)_entryOfActivity:(os_unfair_lock *)a1;
- (uint64_t)_indexOfActivity:(uint64_t)a1;
- (uint64_t)_removeActivity:(void *)a3 origin:;
- (uint64_t)_stateOfActivity:(const os_unfair_lock *)a1;
- (uint64_t)_updateModificationDate;
- (unint64_t)activityCount;
- (unint64_t)hash;
- (unint64_t)stateOfActivity:(id)a3;
- (void)_addActivityEntry:(uint64_t)a1;
- (void)_reconcileReasons;
- (void)_updateReason:(uint64_t)a3 atIndex:;
- (void)_withLock:(os_unfair_lock_s *)a1;
- (void)encodeWithCoder:(id)a3;
- (void)enumerate:(id)a3;
- (void)splitLocalOnly:(id)a3;
@end

@implementation DACActivityList

- (DACActivityList)init
{
  v9.receiver = self;
  v9.super_class = (Class)DACActivityList;
  v2 = [(DACActivityList *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    activeActivities = v3->_activeActivities;
    v3->_activeActivities = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x263EFF910] distantPast];
    lastModified = v3->_lastModified;
    v3->_lastModified = (NSDate *)v6;
  }
  return v3;
}

- (id)description
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v16 = [v3 stringWithFormat:@"<%@: %p, stack: {", v5, self];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __30__DACActivityList_description__block_invoke;
  v10[3] = &unk_264BDCAC8;
  v10[4] = self;
  v10[5] = &v11;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v10);
  uint64_t v6 = [(id)v12[5] stringByAppendingString:@"}>"];
  v7 = (void *)v12[5];
  v12[5] = v6;

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __30__DACActivityList_description__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[3];
  }
  v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingFormat:@"%@,", *(void *)(*((void *)&v11 + 1) + 8 * v7)];
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_withLock:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    v2 = a1 + 2;
    v3 = a2;
    os_unfair_lock_lock(v2);
    v3[2](v3);

    os_unfair_lock_unlock(v2);
  }
}

- (DACActivityList)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"version"] < 1)
  {
    uint64_t v8 = DACLogForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v28 = self;
      _os_log_error_impl(&dword_2330F4000, v8, OS_LOG_TYPE_ERROR, "%p failed to initialize with coder: invalid version", buf, 0xCu);
    }
    v17 = 0;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v7 = (DACActivityList *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"activeActivities"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModified"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_22;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      v22 = v9;
      uint64_t v13 = *(void *)v24;
      char v14 = 1;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            char v14 = 0;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v12);
      int v16 = v14 & 1;
      uint64_t v9 = v22;
    }
    else
    {
      int v16 = 1;
    }

    if (!v16 || v9 == 0)
    {
LABEL_22:
      v19 = DACLogForCategory(1);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v28 = self;
        _os_log_error_impl(&dword_2330F4000, v19, OS_LOG_TYPE_ERROR, "%p failed to initialize with coder: invalid types", buf, 0xCu);
      }

      v17 = 0;
    }
    else
    {
      v17 = [(DACActivityList *)self init];
      objc_storeStrong((id *)&v17->_activeActivities, v8);
      v20 = v9;
      self = (DACActivityList *)v17->_lastModified;
      v17->_lastModified = v20;
    }

    self = v7;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__DACActivityList_encodeWithCoder___block_invoke;
  v6[3] = &unk_264BDC9E0;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v6);
}

uint64_t __35__DACActivityList_encodeWithCoder___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) encodeInteger:1 forKey:@"version"];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  [*(id *)(a1 + 32) encodeObject:v3 forKey:@"activeActivities"];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 16);

  return [v4 encodeObject:v5 forKey:@"lastModified"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(DACActivityList);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32__DACActivityList_copyWithZone___block_invoke;
  v8[3] = &unk_264BDC9E0;
  uint64_t v5 = v4;
  uint64_t v9 = v5;
  v10 = self;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v8);
  uint64_t v6 = v5;

  return v6;
}

uint64_t __32__DACActivityList_copyWithZone___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {
    uint64_t v2 = (void *)v2[3];
  }
  uint64_t v3 = v2;
  uint64_t v4 = [v3 mutableCopy];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v4;

  *(void *)(*(void *)(a1 + 32) + 16) = [*(id *)(*(void *)(a1 + 40) + 16) copy];

  return MEMORY[0x270F9A758]();
}

void __41__DACActivityList_isEqualToActivityList___block_invoke(int8x16_t *a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __41__DACActivityList_isEqualToActivityList___block_invoke_2;
  v2[3] = &unk_264BDCAF0;
  uint64_t v4 = a1[3].i64[0];
  int8x16_t v1 = a1[2];
  int8x16_t v3 = vextq_s8(v1, v1, 8uLL);
  -[DACActivityList _withLock:]((os_unfair_lock_s *)(id)v1.i64[0], v2);
}

void __41__DACActivityList_isEqualToActivityList___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[3];
  }
  uint64_t v6 = v2;
  int8x16_t v3 = (void *)a1[5];
  if (v3) {
    int8x16_t v3 = (void *)v3[3];
  }
  uint64_t v4 = v3;
  int v5 = [v6 isEqualToArray:v4];
  if (v5) {
    LOBYTE(v5) = [*(id *)(a1[4] + 16) isEqualToDate:*(void *)(a1[5] + 16)];
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DACActivityList *)a3;
  int v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  if (self == v4)
  {
    LOBYTE(self) = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v5;
    id v7 = v6;
    if (self)
    {
      uint64_t v13 = 0;
      char v14 = &v13;
      uint64_t v15 = 0x2020000000;
      char v16 = 0;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __41__DACActivityList_isEqualToActivityList___block_invoke;
      v9[3] = &unk_264BDCAF0;
      uint64_t v11 = self;
      uint64_t v12 = &v13;
      v10 = v6;
      -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v9);
      LOBYTE(self) = *((unsigned char *)v14 + 24) != 0;

      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
LABEL_7:
    LOBYTE(self) = 0;
  }
LABEL_9:

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __23__DACActivityList_hash__block_invoke;
  v4[3] = &unk_264BDC9B8;
  v4[4] = self;
  v4[5] = &v5;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __23__DACActivityList_hash__block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    unint64_t v2 = (void *)v2[3];
  }
  uint64_t v4 = v2;
  uint64_t v3 = [v4 hash];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 16) hash] ^ v3;
}

- (BOOL)isEqualIgnoringLastModified:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__DACActivityList_isEqualIgnoringLastModified___block_invoke;
  v7[3] = &unk_264BDCAF0;
  id v5 = v4;
  uint64_t v9 = self;
  v10 = &v11;
  id v8 = v5;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v7);
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __47__DACActivityList_isEqualIgnoringLastModified___block_invoke(int8x16_t *a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __47__DACActivityList_isEqualIgnoringLastModified___block_invoke_2;
  v2[3] = &unk_264BDCAF0;
  uint64_t v4 = a1[3].i64[0];
  int8x16_t v1 = a1[2];
  int8x16_t v3 = vextq_s8(v1, v1, 8uLL);
  -[DACActivityList _withLock:]((os_unfair_lock_s *)(id)v1.i64[0], v2);
}

void __47__DACActivityList_isEqualIgnoringLastModified___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    int8x16_t v3 = *(void **)(v2 + 24);
  }
  else {
    int8x16_t v3 = 0;
  }
  uint64_t v4 = (void *)a1[5];
  if (v4) {
    uint64_t v4 = (void *)v4[3];
  }
  id v5 = v4;
  id v6 = v3;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v6 isEqualToArray:v5];
}

- (unint64_t)activityCount
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__DACActivityList_activityCount__block_invoke;
  v4[3] = &unk_264BDC9B8;
  v4[4] = self;
  v4[5] = &v5;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __32__DACActivityList_activityCount__block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    unint64_t v2 = (void *)v2[3];
  }
  int8x16_t v3 = v2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 count];
}

- (unint64_t)stateOfActivity:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__DACActivityList_stateOfActivity___block_invoke;
  v8[3] = &unk_264BDCAF0;
  v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v8);
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __35__DACActivityList_stateOfActivity___block_invoke(uint64_t a1)
{
  uint64_t result = -[DACActivityList _stateOfActivity:](*(const os_unfair_lock **)(a1 + 32), *(void **)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (uint64_t)_stateOfActivity:(const os_unfair_lock *)a1
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 2);
    uint64_t v4 = -[DACActivityList _indexOfActivity:]((uint64_t)a1, v3);
    os_unfair_lock_assert_owner(a1 + 2);
    uint64_t v5 = 1;
    if (v4) {
      uint64_t v5 = 2;
    }
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = v5;
    }
    uint64_t v7 = DACLogForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 134218498;
      v10 = a1;
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_debug_impl(&dword_2330F4000, v7, OS_LOG_TYPE_DEBUG, "%p determined state(%lu) for Activity(%{public}@)", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)changeMarkerForActivity:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__DACActivityList_changeMarkerForActivity___block_invoke;
  v8[3] = &unk_264BDCAF0;
  v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __43__DACActivityList_changeMarkerForActivity___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(os_unfair_lock **)(a1 + 32);
  if (v2)
  {
    id v3 = *(id *)(a1 + 40);
    os_unfair_lock_assert_owner(v2 + 2);
    -[DACActivityList _entryOfActivity:](v2, v3);
    id v4 = (id *)objc_claimAutoreleasedReturnValue();

    if (v4) {
      id v5 = v4[5];
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)enumerate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (unsigned int (**)(id, void))a3;
  id v5 = [MEMORY[0x263EFF980] array];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __29__DACActivityList_enumerate___block_invoke;
  v16[3] = &unk_264BDC9E0;
  v16[4] = self;
  id v6 = v5;
  id v17 = v6;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v16);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v13 != v10) {
        objc_enumerationMutation(v7);
      }
      if (!v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11))) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v18 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __29__DACActivityList_enumerate___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    unint64_t v2 = (void *)v2[3];
  }
  obj = v2;
  uint64_t v23 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v23)
  {
    uint64_t v3 = 0;
    uint64_t v21 = *(void *)v25;
    do
    {
      uint64_t v4 = 0;
      uint64_t v22 = v3 - 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v24 + 1) + 8 * v4);
        id v6 = *(void **)(a1 + 40);
        id v7 = [DACLifecycleInfo alloc];
        if (v5) {
          uint64_t v8 = *(void **)(v5 + 8);
        }
        else {
          uint64_t v8 = 0;
        }
        id v9 = v8;
        uint64_t v10 = *(const os_unfair_lock **)(a1 + 32);
        if (v10)
        {
          uint64_t v11 = v3;
          os_unfair_lock_assert_owner(v10 + 2);
          uint64_t v12 = 1;
          if (v3 + v4) {
            uint64_t v12 = 2;
          }
          if (v22 + v4) {
            uint64_t v13 = v12;
          }
          else {
            uint64_t v13 = 0;
          }
          if (v5)
          {
LABEL_17:
            uint64_t v14 = *(void *)(v5 + 24);
            id v15 = *(id *)(v5 + 32);
            id v16 = *(void **)(v5 + 40);
            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v11 = v3;
          uint64_t v13 = 0;
          if (v5) {
            goto LABEL_17;
          }
        }
        id v15 = 0;
        uint64_t v14 = 0;
        id v16 = 0;
LABEL_18:
        id v17 = v16;
        id v18 = [(DACLifecycleInfo *)v7 _initWithActivity:v9 state:v13 reason:v14 origin:v15 changeMarker:v17];
        [v6 addObject:v18];

        ++v4;
        uint64_t v3 = v11;
      }
      while (v23 != v4);
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v3 = v11 + v4;
      uint64_t v23 = v19;
    }
    while (v19);
  }
}

- (BOOL)addActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  id v34 = 0;
  int v11 = [v8 isEqual:v9];
  uint64_t v12 = 4;
  if (!v9) {
    uint64_t v12 = 5;
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __54__DACActivityList_addActivity_requester_changeMarker___block_invoke;
  v20[3] = &unk_264BDCB18;
  if (v11) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = v12;
  }
  long long v24 = &v45;
  v20[4] = self;
  id v14 = v8;
  id v21 = v14;
  long long v25 = &v35;
  long long v26 = &v29;
  uint64_t v28 = v13;
  id v15 = v9;
  id v22 = v15;
  id v16 = v10;
  id v23 = v16;
  long long v27 = &v41;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v20);
  id v17 = DACLogForCategory(1);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v50 = self;
    __int16 v51 = 2114;
    id v52 = v14;
    _os_log_impl(&dword_2330F4000, v17, OS_LOG_TYPE_DEFAULT, "%p added activity %{public}@ to list", buf, 0x16u);
  }

  if (v46[3] == v42[3]) {
    int v18 = [(id)v30[5] isEqual:v36[5]] ^ 1;
  }
  else {
    LOBYTE(v18) = 1;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v18;
}

uint64_t __54__DACActivityList_addActivity_requester_changeMarker___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = -[DACActivityList _indexOfActivity:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v2 = -[DACActivityList _entryOfActivity:](*(os_unfair_lock **)(a1 + 32), *(void **)(a1 + 40));
    uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = DACLogForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 40);
      int v21 = 134218242;
      uint64_t v22 = v19;
      __int16 v23 = 2114;
      uint64_t v24 = v20;
      _os_log_error_impl(&dword_2330F4000, v5, OS_LOG_TYPE_ERROR, "%p activity %{public}@ already in list, removing it", (uint8_t *)&v21, 0x16u);
    }

    -[DACActivityList _removeActivity:origin:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 40));
  }
  id v6 = [DACActivityListEntry alloc];
  if (v6)
  {
    id v7 = *(void **)(a1 + 48);
    id v8 = *(void **)(a1 + 96);
    id v9 = *(void **)(a1 + 40);
    id v10 = (void *)MEMORY[0x263EFF910];
    id v11 = *(id *)(a1 + 56);
    id v12 = v7;
    id v13 = v9;
    id v14 = [v10 now];
    id v15 = -[DACActivityListEntry _initWithActivity:date:reason:origin:changeMarker:]((id *)&v6->super.isa, v13, v14, v8, v12, v11);

    id v6 = v15;
  }
  uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v6;

  -[DACActivityList _addActivityEntry:](*(void *)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
  uint64_t result = -[DACActivityList _indexOfActivity:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = result;
  return result;
}

- (uint64_t)_indexOfActivity:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    uint64_t v4 = *(void **)(a1 + 24);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__DACActivityList__indexOfActivity___block_invoke;
    v6[3] = &unk_264BDCBE0;
    id v7 = v3;
    a1 = [v4 indexOfObjectPassingTest:v6];
  }
  return a1;
}

- (os_unfair_lock)_entryOfActivity:(os_unfair_lock *)a1
{
  if (a1)
  {
    uint64_t v3 = (uint64_t)a1;
    uint64_t v4 = a1 + 2;
    id v5 = a2;
    os_unfair_lock_assert_owner(v4);
    uint64_t v6 = -[DACActivityList _indexOfActivity:](v3, v5);

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      a1 = 0;
    }
    else
    {
      a1 = [*(id *)(v3 + 24) objectAtIndex:v6];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)_removeActivity:(void *)a3 origin:
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    uint64_t v7 = -[DACActivityList _indexOfActivity:](a1, v5);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = DACLogForCategory(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v11 = 134218242;
        uint64_t v12 = a1;
        __int16 v13 = 2114;
        id v14 = v5;
        _os_log_error_impl(&dword_2330F4000, v8, OS_LOG_TYPE_ERROR, "%p activity %{public}@ not in list, unable to remove it", (uint8_t *)&v11, 0x16u);
      }

      a1 = 0;
    }
    else
    {
      [*(id *)(a1 + 24) removeObjectAtIndex:v7];
      -[DACActivityList _updateModificationDate](a1);
      id v9 = DACLogForCategory(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134218498;
        uint64_t v12 = a1;
        __int16 v13 = 2114;
        id v14 = v5;
        __int16 v15 = 2114;
        id v16 = v6;
        _os_log_impl(&dword_2330F4000, v9, OS_LOG_TYPE_DEFAULT, "%p removed activity %{public}@ from list due to %{public}@", (uint8_t *)&v11, 0x20u);
      }

      -[DACActivityList _reconcileReasons](a1);
      a1 = 1;
    }
  }

  return a1;
}

- (void)_addActivityEntry:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    uint64_t v4 = v3;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    uint64_t v5 = [*(id *)(a1 + 24) count];
    id v6 = *(id *)(a1 + 24);
    self;
    uint64_t v7 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, v5, 1280, &__block_literal_global_1);

    id v8 = DACLogForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 134218498;
      uint64_t v13 = a1;
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      uint64_t v17 = v4;
      _os_log_debug_impl(&dword_2330F4000, v8, OS_LOG_TYPE_DEBUG, "%p insert index %lu for %{public}@", (uint8_t *)&v12, 0x20u);
    }

    [*(id *)(a1 + 24) insertObject:v4 atIndex:v7];
    -[DACActivityList _updateModificationDate](a1);
    id v9 = DACLogForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        id v10 = (void *)v4[1];
      }
      else {
        id v10 = 0;
      }
      id v11 = v10;
      int v12 = 134218242;
      uint64_t v13 = a1;
      __int16 v14 = 2114;
      uint64_t v15 = (uint64_t)v11;
      _os_log_impl(&dword_2330F4000, v9, OS_LOG_TYPE_DEFAULT, "%p added activity %{public}@ to list", (uint8_t *)&v12, 0x16u);
    }
    -[DACActivityList _reconcileReasons](a1);
  }
}

- (BOOL)removeActivity:(id)a3 requester:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__DACActivityList_removeActivity_requester___block_invoke;
  v11[3] = &unk_264BDCB40;
  __int16 v14 = &v15;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v11);
  LOBYTE(self) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

uint64_t __44__DACActivityList_removeActivity_requester___block_invoke(uint64_t a1)
{
  uint64_t result = -[DACActivityList _removeActivity:origin:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (DACActivityList)listWithMerge:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)[(DACActivityList *)self copy];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __33__DACActivityList_listWithMerge___block_invoke;
  v12[3] = &unk_264BDC9E0;
  id v6 = v4;
  id v13 = v6;
  id v7 = v5;
  __int16 v14 = v7;
  -[DACActivityList _withLock:](v7, v12);
  id v8 = DACLogForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    __int16 v16 = self;
    __int16 v17 = 2114;
    char v18 = v7;
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    uint64_t v22 = self;
    _os_log_debug_impl(&dword_2330F4000, v8, OS_LOG_TYPE_DEBUG, "%p merge result %{public}@ from %{public}@ into %{public}@", buf, 0x2Au);
  }

  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __33__DACActivityList_listWithMerge___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33__DACActivityList_listWithMerge___block_invoke_2;
  v3[3] = &unk_264BDC9E0;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  -[DACActivityList _withLock:](v4, v3);
  -[DACActivityList _reconcileReasons](*(void *)(a1 + 40));
}

void __33__DACActivityList_listWithMerge___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[3];
  }
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        if (v8) {
          id v9 = (void *)v8[1];
        }
        else {
          id v9 = 0;
        }
        uint64_t v10 = -[DACActivityList _indexOfActivity:](*(void *)(a1 + 40), v9);
        id v11 = *(void **)(a1 + 40);
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          -[DACActivityList _addActivityEntry:]((uint64_t)v11, v8);
          goto LABEL_22;
        }
        if (v11) {
          id v11 = (void *)v11[3];
        }
        uint64_t v12 = objc_msgSend(v11, "objectAtIndex:", v10, (void)v21);
        id v13 = (void *)v12;
        if (v12)
        {
          __int16 v14 = *(void **)(v12 + 16);
          if (!v8) {
            goto LABEL_26;
          }
        }
        else
        {
          __int16 v14 = 0;
          if (!v8)
          {
LABEL_26:
            uint64_t v15 = 0;
            goto LABEL_17;
          }
        }
        uint64_t v15 = v8[2];
LABEL_17:
        id v16 = v14;
        uint64_t v17 = [v16 compare:v15];

        if (v17 == -1)
        {
          uint64_t v18 = *(void *)(a1 + 40);
          if (v18) {
            __int16 v19 = *(void **)(v18 + 24);
          }
          else {
            __int16 v19 = 0;
          }
          [v19 removeObjectAtIndex:v10];
          -[DACActivityList _addActivityEntry:](*(void *)(a1 + 40), v8);
        }

LABEL_22:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v20 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v5 = v20;
    }
    while (v20);
  }
}

- (void)_reconcileReasons
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = DACLogForCategory(1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 134217984;
      uint64_t v21 = a1;
      _os_log_debug_impl(&dword_2330F4000, v2, OS_LOG_TYPE_DEBUG, "%p starting reason reconciliation", (uint8_t *)&v20, 0xCu);
    }

    uint64_t v3 = [*(id *)(a1 + 24) firstObject];
    uint64_t v4 = (void *)v3;
    if (v3) {
      uint64_t v5 = *(void **)(v3 + 8);
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;
    unint64_t v7 = [v6 priority];
    uint64_t v8 = [*(id *)(a1 + 24) count];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = [*(id *)(a1 + 24) objectAtIndex:v10];
        uint64_t v12 = (void *)v11;
        if (!v11) {
          break;
        }
        uint64_t v13 = *(void *)(v11 + 24);
        if (v10)
        {
          __int16 v14 = *(void **)(v11 + 8);
LABEL_11:
          unint64_t v15 = [v14 priority];
          if (v15 != v7 || v13 == 6)
          {
            if (v15 >= v7 || v13 == 8) {
              goto LABEL_24;
            }
            uint64_t v16 = a1;
            uint64_t v17 = 8;
          }
          else
          {
            uint64_t v16 = a1;
            uint64_t v17 = 6;
          }
          uint64_t v18 = v10;
          goto LABEL_23;
        }
        if (v13 == 8)
        {
          uint64_t v16 = a1;
          uint64_t v17 = 9;
LABEL_22:
          uint64_t v18 = 0;
LABEL_23:
          -[DACActivityList _updateReason:atIndex:](v16, v17, v18);
          goto LABEL_24;
        }
        if (v13 == 6)
        {
          uint64_t v16 = a1;
          uint64_t v17 = 7;
          goto LABEL_22;
        }
LABEL_24:

        if (v9 == ++v10) {
          goto LABEL_28;
        }
      }
      if (!v10) {
        goto LABEL_24;
      }
      uint64_t v13 = 0;
      __int16 v14 = 0;
      goto LABEL_11;
    }
LABEL_28:
    __int16 v19 = DACLogForCategory(1);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 134217984;
      uint64_t v21 = a1;
      _os_log_debug_impl(&dword_2330F4000, v19, OS_LOG_TYPE_DEBUG, "%p finished reason reconciliation", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)splitLocalOnly:(id)a3
{
  uint64_t v4 = (void (**)(id, id, id))a3;
  uint64_t v5 = objc_alloc_init(DACActivityList);
  id v6 = objc_alloc_init(DACActivityList);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__DACActivityList_splitLocalOnly___block_invoke;
  v9[3] = &unk_264BDCB68;
  void v9[4] = self;
  uint64_t v10 = v5;
  uint64_t v11 = v6;
  unint64_t v7 = v6;
  uint64_t v8 = v5;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v9);
  v4[2](v4, v8, v7);
}

void __34__DACActivityList_splitLocalOnly___block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[3];
  }
  uint64_t v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * v7);
        if (v8) {
          uint64_t v9 = *(void **)(v8 + 8);
        }
        else {
          uint64_t v9 = 0;
        }
        if (objc_msgSend(v9, "isLocalOnly", (void)v19))
        {
          uint64_t v10 = a1[5];
          if (!v10) {
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v10 = a1[6];
          if (!v10)
          {
LABEL_12:
            uint64_t v11 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v11 = *(void **)(v10 + 24);
LABEL_15:
        [v11 addObject:v8];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v12 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v5 = v12;
    }
    while (v12);
  }

  uint64_t v13 = [*(id *)(a1[4] + 16) copy];
  uint64_t v14 = a1[5];
  unint64_t v15 = *(void **)(v14 + 16);
  *(void *)(v14 + 16) = v13;

  uint64_t v16 = [*(id *)(a1[4] + 16) copy];
  uint64_t v17 = a1[6];
  uint64_t v18 = *(void **)(v17 + 16);
  *(void *)(v17 + 16) = v16;
}

- (id)changesFromList:(id)a3 includingMetadata:(BOOL)a4
{
  id v6 = a3;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  id v34 = __Block_byref_object_dispose__0;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__0;
  uint64_t v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __53__DACActivityList_changesFromList_includingMetadata___block_invoke;
  uint64_t v17 = &unk_264BDCBB8;
  id v8 = v6;
  id v18 = v8;
  long long v19 = self;
  long long v21 = &v30;
  id v9 = v7;
  BOOL v23 = a4;
  id v20 = v9;
  long long v22 = &v24;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, &v14);
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "array", v14, v15, v16, v17);
  uint64_t v11 = v10;
  if (v31[5]) {
    objc_msgSend(v10, "addObject:");
  }
  if (v25[5]) {
    objc_msgSend(v11, "addObject:");
  }
  [v11 addObjectsFromArray:v9];
  id v12 = [[DACLifecycleChangelist alloc] _initWithLifecycleInfoArray:v11];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v12;
}

void __53__DACActivityList_changesFromList_includingMetadata___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__DACActivityList_changesFromList_includingMetadata___block_invoke_2;
  v6[3] = &unk_264BDCBB8;
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  uint64_t v2 = (os_unfair_lock_s *)(id)v4.i64[0];
  int8x16_t v7 = vextq_s8(v4, v4, 8uLL);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v5;
  long long v8 = v5;
  char v10 = *(unsigned char *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 64);
  -[DACActivityList _withLock:](v2, v6);
}

void __53__DACActivityList_changesFromList_includingMetadata___block_invoke_2(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v33 = MEMORY[0x263EF8330];
  uint64_t v34 = 3221225472;
  id v35 = __53__DACActivityList_changesFromList_includingMetadata___block_invoke_3;
  v36 = &unk_264BDCB90;
  long long v5 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v37 = v3;
  uint64_t v40 = v4;
  id v38 = v5;
  id v6 = *(id *)(a1 + 40);
  char v42 = *(unsigned char *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 64);
  id v39 = v6;
  uint64_t v41 = v7;
  long long v8 = v2;
  uint64_t v9 = &v33;
  if (v3)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v3 + 8));
    os_unfair_lock_assert_owner(v8 + 2);
    id v10 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v11 = *(id *)(v3 + 24);
    uint64_t v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v64, 16, v33, v34);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v48;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * v15);
          if (v16) {
            uint64_t v17 = *(void *)(v16 + 8);
          }
          else {
            uint64_t v17 = 0;
          }
          [v10 addObject:v17];
          ++v15;
        }
        while (v13 != v15);
        uint64_t v18 = [v11 countByEnumeratingWithState:&v47 objects:v64 count:16];
        uint64_t v13 = v18;
      }
      while (v18);
    }

    id v19 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    if (v8) {
      id v20 = *(void **)&v8[6]._os_unfair_lock_opaque;
    }
    else {
      id v20 = 0;
    }
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v63 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v44;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v44 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v43 + 1) + 8 * v25);
          if (v26) {
            uint64_t v27 = *(void *)(v26 + 8);
          }
          else {
            uint64_t v27 = 0;
          }
          [v19 addObject:v27];
          ++v25;
        }
        while (v23 != v25);
        uint64_t v28 = [v21 countByEnumeratingWithState:&v43 objects:v63 count:16];
        uint64_t v23 = v28;
      }
      while (v28);
    }

    id v29 = (void *)[v10 mutableCopy];
    [v29 intersectOrderedSet:v19];
    uint64_t v30 = (void *)[v10 mutableCopy];
    [v30 minusOrderedSet:v19];
    uint64_t v31 = (void *)[v19 mutableCopy];
    [v31 minusOrderedSet:v10];
    uint64_t v32 = DACLogForCategory(1);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219266;
      uint64_t v52 = v3;
      __int16 v53 = 2114;
      v54 = v29;
      __int16 v55 = 2114;
      v56 = v30;
      __int16 v57 = 2114;
      v58 = v31;
      __int16 v59 = 2048;
      v60 = v8;
      __int16 v61 = 2048;
      uint64_t v62 = v3;
      _os_log_debug_impl(&dword_2330F4000, v32, OS_LOG_TYPE_DEBUG, "%p delta common(%{public}@) add(%{public}@) remove(%{public}@) from %p to %p", buf, 0x3Eu);
    }

    v35((uint64_t)v9, v29, v30, v31);
  }
}

void __53__DACActivityList_changesFromList_includingMetadata___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v76 = a2;
  id v7 = a3;
  id v73 = a4;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id obj = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v91 objects:v97 count:16];
  if (v8)
  {
    id v9 = (id)v8;
    uint64_t v10 = *(void *)v92;
    uint64_t v78 = *(void *)v92;
    do
    {
      id v11 = 0;
      id v80 = v9;
      do
      {
        if (*(void *)v92 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v91 + 1) + 8 * (void)v11);
        uint64_t v13 = -[DACActivityList _entryOfActivity:](*(os_unfair_lock **)(a1 + 32), v12);
        uint64_t v14 = -[DACActivityList _stateOfActivity:](*(const os_unfair_lock **)(a1 + 32), v12);
        if (v14 == 1)
        {
          uint64_t v15 = [DACLifecycleInfo alloc];
          if (v13)
          {
            uint64_t v16 = *(void *)(v13 + 24);
            id v17 = *(id *)(v13 + 32);
            uint64_t v18 = *(void **)(v13 + 40);
          }
          else
          {
            id v17 = 0;
            uint64_t v16 = 0;
            uint64_t v18 = 0;
          }
          id v19 = v18;
          uint64_t v20 = [(DACLifecycleInfo *)v15 _initWithActivity:v12 state:1 reason:v16 origin:v17 changeMarker:v19];
          uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
          id v22 = *(id *)(v21 + 40);
          *(void *)(v21 + 40) = v20;
        }
        else
        {
          uint64_t v23 = v14;
          uint64_t v24 = *(void **)(a1 + 40);
          uint64_t v25 = [DACLifecycleInfo alloc];
          if (v13)
          {
            uint64_t v26 = *(void *)(v13 + 24);
            id v17 = *(id *)(v13 + 32);
            uint64_t v27 = *(void **)(v13 + 40);
          }
          else
          {
            id v17 = 0;
            uint64_t v26 = 0;
            uint64_t v27 = 0;
          }
          id v22 = v27;
          id v19 = [(DACLifecycleInfo *)v25 _initWithActivity:v12 state:v23 reason:v26 origin:v17 changeMarker:v22];
          [v24 addObject:v19];
          uint64_t v10 = v78;
          id v9 = v80;
        }

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      uint64_t v28 = [obj countByEnumeratingWithState:&v91 objects:v97 count:16];
      id v9 = (id)v28;
    }
    while (v28);
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v77 = v76;
  id v81 = (id)[v77 countByEnumeratingWithState:&v87 objects:v96 count:16];
  if (v81)
  {
    uint64_t v79 = *(void *)v88;
    do
    {
      id v29 = 0;
      do
      {
        if (*(void *)v88 != v79) {
          objc_enumerationMutation(v77);
        }
        uint64_t v30 = *(void **)(*((void *)&v87 + 1) + 8 * (void)v29);
        uint64_t v31 = -[DACActivityList _entryOfActivity:](*(os_unfair_lock **)(a1 + 32), v30);
        uint64_t v32 = -[DACActivityList _entryOfActivity:](*(os_unfair_lock **)(a1 + 48), v30);
        uint64_t v33 = -[DACActivityList _stateOfActivity:](*(const os_unfair_lock **)(a1 + 32), v30);
        uint64_t v34 = -[DACActivityList _stateOfActivity:](*(const os_unfair_lock **)(a1 + 48), v30);
        uint64_t v35 = v34;
        if (v31)
        {
          uint64_t v36 = *(void *)(v31 + 24);
          if (!v32) {
            goto LABEL_49;
          }
        }
        else
        {
          uint64_t v36 = 0;
          if (!v32)
          {
LABEL_49:
            uint64_t v37 = 0;
            goto LABEL_26;
          }
        }
        uint64_t v37 = v32[3];
LABEL_26:
        if (v36 != v37 || v33 != v34) {
          goto LABEL_33;
        }
        if (!*(unsigned char *)(a1 + 72)) {
          goto LABEL_46;
        }
        if (v31)
        {
          id v38 = *(void **)(v31 + 40);
          if (v32) {
            goto LABEL_31;
          }
        }
        else
        {
          id v38 = 0;
          if (v32)
          {
LABEL_31:
            uint64_t v39 = v32[5];
            goto LABEL_32;
          }
        }
        uint64_t v39 = 0;
LABEL_32:
        if ([v38 isEqual:v39]) {
          goto LABEL_46;
        }
LABEL_33:
        if (v35 == 1)
        {
          uint64_t v40 = [DACLifecycleInfo alloc];
          if (v31)
          {
            uint64_t v41 = *(void *)(v31 + 24);
            id v42 = *(id *)(v31 + 32);
            long long v43 = *(void **)(v31 + 40);
          }
          else
          {
            id v42 = 0;
            uint64_t v41 = 0;
            long long v43 = 0;
          }
          id v44 = v43;
          uint64_t v45 = [(DACLifecycleInfo *)v40 _initWithActivity:v30 state:v33 reason:v41 origin:v42 changeMarker:v44];
          uint64_t v46 = *(void *)(a1 + 64);
        }
        else
        {
          if (v33 != 1)
          {
            v74 = *(void **)(a1 + 40);
            uint64_t v52 = [DACLifecycleInfo alloc];
            if (v31)
            {
              uint64_t v53 = *(void *)(v31 + 24);
              id v42 = *(id *)(v31 + 32);
              v54 = *(void **)(v31 + 40);
            }
            else
            {
              id v42 = 0;
              uint64_t v53 = 0;
              v54 = 0;
            }
            id v51 = v54;
            id v44 = [(DACLifecycleInfo *)v52 _initWithActivity:v30 state:v33 reason:v53 origin:v42 changeMarker:v51];
            [v74 addObject:v44];
            goto LABEL_45;
          }
          long long v47 = [DACLifecycleInfo alloc];
          if (v31)
          {
            uint64_t v48 = *(void *)(v31 + 24);
            id v42 = *(id *)(v31 + 32);
            long long v49 = *(void **)(v31 + 40);
          }
          else
          {
            id v42 = 0;
            uint64_t v48 = 0;
            long long v49 = 0;
          }
          id v44 = v49;
          uint64_t v45 = [(DACLifecycleInfo *)v47 _initWithActivity:v30 state:1 reason:v48 origin:v42 changeMarker:v44];
          uint64_t v46 = *(void *)(a1 + 56);
        }
        uint64_t v50 = *(void *)(v46 + 8);
        id v51 = *(id *)(v50 + 40);
        *(void *)(v50 + 40) = v45;
LABEL_45:

LABEL_46:
        id v29 = (char *)v29 + 1;
      }
      while (v81 != v29);
      uint64_t v55 = [v77 countByEnumeratingWithState:&v87 objects:v96 count:16];
      id v81 = (id)v55;
    }
    while (v55);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v82 = v73;
  uint64_t v56 = [v82 countByEnumeratingWithState:&v83 objects:v95 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v84;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v84 != v58) {
          objc_enumerationMutation(v82);
        }
        v60 = *(void **)(*((void *)&v83 + 1) + 8 * v59);
        uint64_t v61 = -[DACActivityList _entryOfActivity:](*(os_unfair_lock **)(a1 + 48), v60);
        if (-[DACActivityList _stateOfActivity:](*(const os_unfair_lock **)(a1 + 48), v60) == 1)
        {
          uint64_t v62 = [DACLifecycleInfo alloc];
          if (v61)
          {
            id v63 = *(id *)(v61 + 32);
            v64 = *(void **)(v61 + 40);
          }
          else
          {
            id v63 = 0;
            v64 = 0;
          }
          id v65 = v64;
          uint64_t v66 = [(DACLifecycleInfo *)v62 _initWithActivity:v60 state:0 reason:2 origin:v63 changeMarker:v65];
          uint64_t v67 = *(void *)(*(void *)(a1 + 64) + 8);
          id v68 = *(id *)(v67 + 40);
          *(void *)(v67 + 40) = v66;
        }
        else
        {
          v69 = *(void **)(a1 + 40);
          v70 = [DACLifecycleInfo alloc];
          if (v61)
          {
            id v63 = *(id *)(v61 + 32);
            v71 = *(void **)(v61 + 40);
          }
          else
          {
            id v63 = 0;
            v71 = 0;
          }
          id v68 = v71;
          id v65 = [(DACLifecycleInfo *)v70 _initWithActivity:v60 state:0 reason:2 origin:v63 changeMarker:v68];
          [v69 addObject:v65];
        }

        ++v59;
      }
      while (v57 != v59);
      uint64_t v72 = [v82 countByEnumeratingWithState:&v83 objects:v95 count:16];
      uint64_t v57 = v72;
    }
    while (v72);
  }
}

- (NSDate)lastModified
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__0;
  id v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__DACActivityList_lastModified__block_invoke;
  v4[3] = &unk_264BDC9B8;
  v4[4] = self;
  v4[5] = &v5;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

void __31__DACActivityList_lastModified__block_invoke(uint64_t a1)
{
}

uint64_t __36__DACActivityList__indexOfActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) identifier];
  if (v6) {
    uint64_t v8 = (void *)v6[1];
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = [v8 identifier];
  uint64_t v10 = [v7 isEqual:v9];

  if (v10) {
    *a4 = 1;
  }

  return v10;
}

- (uint64_t)_updateModificationDate
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  *(void *)(a1 + 16) = [MEMORY[0x263EFF910] now];

  return MEMORY[0x270F9A758]();
}

- (void)_updateReason:(uint64_t)a3 atIndex:
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  id v6 = [*(id *)(a1 + 24) objectAtIndex:a3];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)[v6 copy];
    v8[3] = a2;
  }
  else
  {
    uint64_t v8 = 0;
  }
  [*(id *)(a1 + 24) replaceObjectAtIndex:a3 withObject:v8];
  -[DACActivityList _updateModificationDate](a1);
  id v9 = DACLogForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (v8) {
      uint64_t v10 = (void *)v8[1];
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;
    int v12 = 134218754;
    uint64_t v13 = a1;
    __int16 v14 = 2114;
    id v15 = v11;
    __int16 v16 = 2048;
    uint64_t v17 = a3;
    __int16 v18 = 2048;
    uint64_t v19 = a2;
    _os_log_debug_impl(&dword_2330F4000, v9, OS_LOG_TYPE_DEBUG, "%p update reason of %{public}@ at %lu to %lu", (uint8_t *)&v12, 0x2Au);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeActivities, 0);

  objc_storeStrong((id *)&self->_lastModified, 0);
}

@end