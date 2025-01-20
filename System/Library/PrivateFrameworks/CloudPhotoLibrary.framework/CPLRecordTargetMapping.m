@interface CPLRecordTargetMapping
- (BOOL)hasUnknownTargets;
- (BOOL)hasUpdatedTargets;
- (CPLRecordTargetMapping)init;
- (NSArray)allTargetScopedIdentifiers;
- (NSArray)unknownTargetScopedIdentifiers;
- (NSSet)updatedTargetScopedIdentifiers;
- (NSString)targetDescriptions;
- (NSString)updatedTargetsDescription;
- (id)targetForRecordWithOtherScopedIdentifier:(id)a3;
- (id)targetForRecordWithScopedIdentifier:(id)a3;
- (void)_setTarget:(id)a3 forRecordWithScopedIdentifier:(id)a4 isUpdate:(BOOL)a5;
- (void)addKnownTarget:(id)a3 forRecordWithScopedIdentifier:(id)a4;
- (void)enumerateTargetsWithBlock:(id)a3;
- (void)enumerateUnknownTargetsWithBlock:(id)a3;
- (void)enumerateUpdatedTargetsWithBlock:(id)a3;
- (void)setTarget:(id)a3 forRecordWithScopedIdentifier:(id)a4;
- (void)startTrackingUpdates;
@end

@implementation CPLRecordTargetMapping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopedIdentifiersWithUnknownTargets, 0);
  objc_storeStrong((id *)&self->_updatedScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_targetsFromOtherScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_targets, 0);
}

- (NSString)targetDescriptions
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableDictionary count](self->_targets, "count"));
  targets = self->_targets;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __44__CPLRecordTargetMapping_targetDescriptions__block_invoke;
  v11 = &unk_1E60A7698;
  id v12 = v3;
  v13 = self;
  id v5 = v3;
  [(NSMutableDictionary *)targets enumerateKeysAndObjectsUsingBlock:&v8];
  v6 = objc_msgSend(v5, "componentsJoinedByString:", @"\n", v8, v9, v10, v11);

  return (NSString *)v6;
}

void __44__CPLRecordTargetMapping_targetDescriptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  v6 = (objc_class *)NSString;
  id v7 = a3;
  id v8 = a2;
  id v9 = [v6 alloc];
  int v10 = [*(id *)(*(void *)(a1 + 40) + 24) containsObject:v8];
  v11 = "";
  if (v10) {
    v11 = " (updated)";
  }
  id v12 = (id)[v9 initWithFormat:@"%@ = %@%s", v8, v7, v11];

  [v5 addObject:v12];
}

- (NSString)updatedTargetsDescription
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_updatedScopedIdentifiers count])
  {
    SEL v19 = a2;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableSet count](self->_updatedScopedIdentifiers, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = self->_updatedScopedIdentifiers;
    uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v11 = [(NSMutableDictionary *)self->_targets objectForKeyedSubscript:v10];
          if (!v11)
          {
            if (!_CPLSilentLogging)
            {
              v16 = __CPLGenericOSLogDomain();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v25 = v10;
                _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "Target for %@ should have been updated and thus present", buf, 0xCu);
              }
            }
            v17 = [MEMORY[0x1E4F28B00] currentHandler];
            v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordTarget.m"];
            [v17 handleFailureInMethod:v19, self, v18, 252, @"Target for %@ should have been updated and thus present", v10 object file lineNumber description];

            abort();
          }
          id v12 = (void *)v11;
          v13 = (void *)[[NSString alloc] initWithFormat:@"%@: %@", v10, v11];
          [v4 addObject:v13];
        }
        uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v7);
    }

    v14 = [v4 componentsJoinedByString:@"\n"];
  }
  else
  {
    v14 = @"no updates";
  }
  return (NSString *)v14;
}

- (NSSet)updatedTargetScopedIdentifiers
{
  return (NSSet *)self->_updatedScopedIdentifiers;
}

- (void)enumerateUpdatedTargetsWithBlock:(id)a3
{
  id v5 = a3;
  if ([(NSMutableSet *)self->_updatedScopedIdentifiers count])
  {
    updatedScopedIdentifiers = self->_updatedScopedIdentifiers;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__CPLRecordTargetMapping_enumerateUpdatedTargetsWithBlock___block_invoke;
    v7[3] = &unk_1E60A7670;
    v7[4] = self;
    SEL v9 = a2;
    id v8 = v5;
    [(NSMutableSet *)updatedScopedIdentifiers enumerateObjectsUsingBlock:v7];
  }
}

void __59__CPLRecordTargetMapping_enumerateUpdatedTargetsWithBlock___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:");
  if (!v3)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v10;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Target for %@ should have been updated and thus present", buf, 0xCu);
      }
    }
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[4];
    SEL v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordTarget.m"];
    [v6 handleFailureInMethod:v7, v8, v9, 235, @"Target for %@ should have been updated and thus present", v10 object file lineNumber description];

    abort();
  }
  v4 = (void *)v3;
  (*(void (**)(void))(a1[5] + 16))();
}

- (BOOL)hasUpdatedTargets
{
  return [(NSMutableSet *)self->_updatedScopedIdentifiers count] != 0;
}

- (void)startTrackingUpdates
{
  uint64_t v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  updatedScopedIdentifiers = self->_updatedScopedIdentifiers;
  self->_updatedScopedIdentifiers = v3;
  MEMORY[0x1F41817F8](v3, updatedScopedIdentifiers);
}

- (NSArray)unknownTargetScopedIdentifiers
{
  return (NSArray *)[(NSMutableSet *)self->_scopedIdentifiersWithUnknownTargets allObjects];
}

- (NSArray)allTargetScopedIdentifiers
{
  return (NSArray *)[(NSMutableDictionary *)self->_targets allKeys];
}

- (void)enumerateUnknownTargetsWithBlock:(id)a3
{
  id v5 = a3;
  scopedIdentifiersWithUnknownTargets = self->_scopedIdentifiersWithUnknownTargets;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__CPLRecordTargetMapping_enumerateUnknownTargetsWithBlock___block_invoke;
  v8[3] = &unk_1E60A7670;
  id v9 = v5;
  SEL v10 = a2;
  v8[4] = self;
  id v7 = v5;
  [(NSMutableSet *)scopedIdentifiersWithUnknownTargets enumerateObjectsUsingBlock:v8];
}

void __59__CPLRecordTargetMapping_enumerateUnknownTargetsWithBlock___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:");
  if (!v3)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v10;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Target for %@ should be present", buf, 0xCu);
      }
    }
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[4];
    id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordTarget.m"];
    [v6 handleFailureInMethod:v7, v8, v9, 208, @"Target for %@ should be present", v10 object file lineNumber description];

    abort();
  }
  v4 = (void *)v3;
  (*(void (**)(void))(a1[5] + 16))();
}

- (BOOL)hasUnknownTargets
{
  return [(NSMutableSet *)self->_scopedIdentifiersWithUnknownTargets count] != 0;
}

- (void)enumerateTargetsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_targets allKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CPLRecordTargetMapping_enumerateTargetsWithBlock___block_invoke;
  v7[3] = &unk_1E60A7648;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __52__CPLRecordTargetMapping_enumerateTargetsWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)targetForRecordWithOtherScopedIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_targetsFromOtherScopedIdentifier objectForKeyedSubscript:a3];
}

- (id)targetForRecordWithScopedIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_targets objectForKeyedSubscript:a3];
}

- (void)addKnownTarget:(id)a3 forRecordWithScopedIdentifier:(id)a4
{
}

- (void)setTarget:(id)a3 forRecordWithScopedIdentifier:(id)a4
{
}

- (void)_setTarget:(id)a3 forRecordWithScopedIdentifier:(id)a4 isUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v22 = v9;
  id v10 = [(NSMutableDictionary *)self->_targets objectForKeyedSubscript:v9];
  uint64_t v11 = v10;
  if (v10 && ([v10 isEqual:v8] & 1) != 0) {
    goto LABEL_23;
  }
  if (v5)
  {
    updatedScopedIdentifiers = self->_updatedScopedIdentifiers;
    if (updatedScopedIdentifiers) {
      [(NSMutableSet *)updatedScopedIdentifiers addObject:v9];
    }
  }
  uint64_t v13 = [v11 otherScopedIdentifier];
  uint64_t v14 = [v8 otherScopedIdentifier];
  v15 = (void *)v14;
  BOOL v16 = v14 != 0;
  if (!v13 || !v14)
  {
    if (!v13) {
      goto LABEL_12;
    }
LABEL_11:
    [(NSMutableDictionary *)self->_targetsFromOtherScopedIdentifier removeObjectForKey:v13];
    BOOL v16 = 1;
    goto LABEL_12;
  }
  if (([v13 isEqual:v14] & 1) == 0) {
    goto LABEL_11;
  }
  BOOL v16 = 0;
LABEL_12:
  uint64_t v17 = [v8 targetState];
  scopedIdentifiersWithUnknownTargets = self->_scopedIdentifiersWithUnknownTargets;
  if (v17)
  {
    [(NSMutableSet *)scopedIdentifiersWithUnknownTargets removeObject:v9];
  }
  else if (scopedIdentifiersWithUnknownTargets)
  {
    [(NSMutableSet *)scopedIdentifiersWithUnknownTargets addObject:v9];
  }
  else
  {
    SEL v19 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:&v22 count:1];
    long long v20 = self->_scopedIdentifiersWithUnknownTargets;
    self->_scopedIdentifiersWithUnknownTargets = v19;

    id v9 = v22;
  }
  [(NSMutableDictionary *)self->_targets setObject:v8 forKeyedSubscript:v9];
  if (v15) {
    BOOL v21 = v16;
  }
  else {
    BOOL v21 = 0;
  }
  if (v21) {
    [(NSMutableDictionary *)self->_targetsFromOtherScopedIdentifier setObject:v8 forKeyedSubscript:v15];
  }

LABEL_23:
}

- (CPLRecordTargetMapping)init
{
  v8.receiver = self;
  v8.super_class = (Class)CPLRecordTargetMapping;
  v2 = [(CPLRecordTargetMapping *)&v8 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    targets = v2->_targets;
    v2->_targets = v3;

    BOOL v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    targetsFromOtherScopedIdentifier = v2->_targetsFromOtherScopedIdentifier;
    v2->_targetsFromOtherScopedIdentifier = v5;
  }
  return v2;
}

@end