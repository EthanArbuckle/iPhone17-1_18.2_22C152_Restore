@interface NSArray(UserNotifications)
- (id)un_filter:()UserNotifications;
- (id)un_map:()UserNotifications;
- (id)un_nonEmptyCopy;
- (id)un_safeArrayContainingClass:()UserNotifications;
- (id)un_safeArrayContainingClasses:()UserNotifications;
- (void)un_each:()UserNotifications;
@end

@implementation NSArray(UserNotifications)

- (id)un_filter:()UserNotifications
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__NSArray_UserNotifications__un_filter___block_invoke;
    v9[3] = &unk_1E5F064E0;
    id v10 = v4;
    v6 = [a1 indexesOfObjectsPassingTest:v9];
    v7 = [a1 objectsAtIndexes:v6];
  }
  else
  {
    v7 = (void *)[a1 copy];
  }

  return v7;
}

- (id)un_nonEmptyCopy
{
  v2 = (void *)[a1 count];
  if (v2) {
    v2 = (void *)[a1 copy];
  }

  return v2;
}

- (void)un_each:()UserNotifications
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__NSArray_UserNotifications__un_each___block_invoke;
    v6[3] = &unk_1E5F06508;
    id v7 = v4;
    [a1 enumerateObjectsUsingBlock:v6];
  }
}

- (id)un_map:()UserNotifications
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = v5;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__NSArray_UserNotifications__un_map___block_invoke;
    v8[3] = &unk_1E5F06530;
    id v9 = v5;
    id v10 = v4;
    objc_msgSend(a1, "un_each:", v8);
  }
  else
  {
    [v5 addObjectsFromArray:a1];
  }

  return v6;
}

- (id)un_safeArrayContainingClass:()UserNotifications
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "un_safeAddObject:class:", *(void *)(*((void *)&v13 + 1) + 8 * i), a3, (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v11 = (void *)[v5 copy];

  return v11;
}

- (id)un_safeArrayContainingClasses:()UserNotifications
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "un_safeAddObject:classes:", *(void *)(*((void *)&v13 + 1) + 8 * i), v4, (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v11 = (void *)[v5 copy];

  return v11;
}

@end