@interface EKObject(Shared)
+ (BOOL)_compareIdentityKeysForObject:()Shared againstObject:propertiesToIgnore:;
+ (BOOL)_compareKnownKeys:()Shared forObject:againstObject:compareIdentityKeys:compareImmutableKeys:propertiesToIgnore:;
+ (BOOL)_compareKnownKeys:()Shared forObject:againstObject:compareImmutableKeys:propertiesToIgnore:;
+ (BOOL)_compareMultiValueRelationshipKeys:()Shared forObject:againstObject:propertiesToIgnore:;
+ (BOOL)_compareNonIdentityKeys:()Shared forObject:againstObject:compareImmutableKeys:propertiesToIgnore:;
+ (BOOL)_compareSingleValueRelationshipKeys:()Shared forObject:againstObject:propertiesToIgnore:;
- (NSDictionary)cachedMeltedObjects;
- (void)setCachedMeltedObjects:()Shared;
@end

@implementation EKObject(Shared)

- (NSDictionary)cachedMeltedObjects
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__18;
  v9 = __Block_byref_object_dispose__18;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__EKObject_Shared__cachedMeltedObjects__block_invoke;
  v4[3] = &unk_1E5B96F20;
  v4[4] = self;
  v4[5] = &v5;
  [(EKObject *)self _performWithLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

- (void)setCachedMeltedObjects:()Shared
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__EKObject_Shared__setCachedMeltedObjects___block_invoke;
  v6[3] = &unk_1E5B97140;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(EKObject *)self _performWithLock:v6];
}

+ (BOOL)_compareKnownKeys:()Shared forObject:againstObject:compareIdentityKeys:compareImmutableKeys:propertiesToIgnore:
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (v15 == v16)
  {
    char v18 = 1;
  }
  else if (v10 {
         && ![a1 _compareIdentityKeysForObject:v15 againstObject:v16 propertiesToIgnore:v17])
  }
  {
    char v18 = 0;
  }
  else
  {
    char v18 = [a1 _compareNonIdentityKeys:v14 forObject:v15 againstObject:v16 compareImmutableKeys:v9 propertiesToIgnore:v17];
  }

  return v18;
}

+ (BOOL)_compareKnownKeys:()Shared forObject:againstObject:compareImmutableKeys:propertiesToIgnore:
{
  return [a1 _compareKnownKeys:a3 forObject:a4 againstObject:a5 compareIdentityKeys:1 compareImmutableKeys:a6 propertiesToIgnore:a7];
}

+ (BOOL)_compareMultiValueRelationshipKeys:()Shared forObject:againstObject:propertiesToIgnore:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        if (!objc_msgSend(a1, "_compareMultiValueRelationshipKey:forObject:againstObject:propertiesToIgnore:", *(void *)(*((void *)&v21 + 1) + 8 * i), v11, v12, v13, (void)v21))
        {
          BOOL v19 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_11:

  return v19;
}

+ (BOOL)_compareNonIdentityKeys:()Shared forObject:againstObject:compareImmutableKeys:propertiesToIgnore:
{
  id v11 = a3;
  id v39 = a4;
  id v38 = a5;
  id v12 = a7;
  id v13 = (void *)MEMORY[0x1E4F1CA80];
  id v14 = [a1 knownRelationshipMultiValueKeys];
  uint64_t v15 = [v13 setWithArray:v14];

  uint64_t v16 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v17 = [a1 knownRelationshipSingleValueKeys];
  char v18 = [v16 setWithArray:v17];

  BOOL v19 = (void *)MEMORY[0x1E4F1CA80];
  v20 = [a1 knownSingleValueKeysForComparison];
  long long v21 = [v19 setWithArray:v20];

  long long v22 = (void *)MEMORY[0x1E4F1CA80];
  long long v23 = [a1 knownImmutableKeys];
  long long v24 = [v22 setWithArray:v23];

  v40 = v21;
  if (v11)
  {
    v25 = v15;
    [v15 intersectSet:v11];
    [v18 intersectSet:v11];
    [v21 intersectSet:v11];
    [v24 intersectSet:v11];
  }
  else
  {
    v25 = v15;
    if (!a6)
    {

      long long v24 = 0;
    }
  }
  uint64_t v26 = [v18 allObjects];
  v28 = v38;
  v27 = v39;
  int v29 = [a1 _compareSingleValueRelationshipKeys:v26 forObject:v39 againstObject:v38 propertiesToIgnore:v12];

  if (!v29
    || ([v25 allObjects],
        v30 = objc_claimAutoreleasedReturnValue(),
        int v31 = [a1 _compareMultiValueRelationshipKeys:v30 forObject:v39 againstObject:v38 propertiesToIgnore:v12], v30, !v31))
  {
    char v35 = 0;
    goto LABEL_11;
  }
  v32 = [v40 allObjects];
  int v33 = [a1 _compareNonRelationshipKeys:v32 forObject:v39 againstObject:v38 propertiesToIgnore:v12];

  if (!v33)
  {
    char v35 = 0;
LABEL_14:
    v28 = v38;
    v27 = v39;
    goto LABEL_11;
  }
  if (!v24)
  {
    char v35 = 1;
    goto LABEL_14;
  }
  v34 = [v24 allObjects];
  v28 = v38;
  v27 = v39;
  char v35 = [a1 _compareNonRelationshipKeys:v34 forObject:v39 againstObject:v38 propertiesToIgnore:v12];

LABEL_11:
  return v35;
}

+ (BOOL)_compareSingleValueRelationshipKeys:()Shared forObject:againstObject:propertiesToIgnore:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        if (!objc_msgSend(a1, "_compareSingleValueRelationshipKey:forObject:againstObject:propertiesToIgnore:ignoreIdentityKeys:", *(void *)(*((void *)&v21 + 1) + 8 * i), v11, v12, v13, 0, (void)v21))
        {
          BOOL v19 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_11:

  return v19;
}

+ (BOOL)_compareIdentityKeysForObject:()Shared againstObject:propertiesToIgnore:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [a1 knownIdentityKeysForComparison];
  LOBYTE(a1) = [a1 _compareNonRelationshipKeys:v11 forObject:v10 againstObject:v9 propertiesToIgnore:v8];

  return (char)a1;
}

- (void)validate:()Shared .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  id v4 = [a2 privacyDescription];
  int v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_ERROR, "Reached maximum depth while validating root object %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)singleChangedValueForKey:()Shared .cold.1()
{
  OUTLINED_FUNCTION_5_2();
  id v2 = v1;
  v3 = [(id)OUTLINED_FUNCTION_4_3() backingObject];
  id v4 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_6_0(&dword_1A4E47000, v5, v6, "Property %@ was unavailable on backingObject %@. %@", v7, v8, v9, v10, v11);
}

- (void)meltedAndCachedSingleRelationObjectForKey:()Shared .cold.1()
{
  OUTLINED_FUNCTION_5_2();
  id v2 = v1;
  v3 = [(id)OUTLINED_FUNCTION_4_3() eventStore];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Failed to get melted object for frozen object related by key %@. Event store is %@", v6, v7, v8, v9, v10);
}

@end