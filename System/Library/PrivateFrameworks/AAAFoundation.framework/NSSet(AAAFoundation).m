@interface NSSet(AAAFoundation)
+ (id)aaf_empty;
- (BOOL)aaf_hasObjects;
- (id)aaf_filter:()AAAFoundation;
- (id)aaf_map:()AAAFoundation;
- (id)aaf_mapStoppable:()AAAFoundation;
- (id)aaf_setByRemovingObject:()AAAFoundation;
- (id)aaf_setByRemovingObjectsFromSet:()AAAFoundation;
@end

@implementation NSSet(AAAFoundation)

+ (id)aaf_empty
{
  if (aaf_empty__aaf_onceToken != -1) {
    dispatch_once(&aaf_empty__aaf_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)aaf_empty__aaf_empty;
  return v0;
}

- (BOOL)aaf_hasObjects
{
  return [a1 count] != 0;
}

- (id)aaf_filter:()AAAFoundation
{
  id v4 = a3;
  if ([a1 count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(a1, "count"));
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __35__NSSet_AAAFoundation__aaf_filter___block_invoke;
    v12 = &unk_1E6CFA770;
    id v13 = v5;
    id v14 = v4;
    id v6 = v5;
    [a1 enumerateObjectsUsingBlock:&v9];
    v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "aaf_empty");
  }

  return v7;
}

- (id)aaf_map:()AAAFoundation
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__NSSet_AAAFoundation__aaf_map___block_invoke;
  v8[3] = &unk_1E6CFA798;
  id v9 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "aaf_mapStoppable:", v8);

  return v6;
}

- (id)aaf_mapStoppable:()AAAFoundation
{
  id v4 = a3;
  if ([a1 count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(a1, "count"));
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __41__NSSet_AAAFoundation__aaf_mapStoppable___block_invoke;
    v12 = &unk_1E6CFA770;
    id v13 = v5;
    id v14 = v4;
    id v6 = v5;
    [a1 enumerateObjectsUsingBlock:&v9];
    v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "aaf_empty");
  }

  return v7;
}

- (id)aaf_setByRemovingObject:()AAAFoundation
{
  id v4 = a3;
  if ([a1 count])
  {
    if (v4 && ([a1 containsObject:v4] & 1) != 0)
    {
      id v5 = (void *)[a1 mutableCopy];
      [v5 removeObject:v4];
      id v6 = (void *)[v5 copy];

      goto LABEL_8;
    }
    uint64_t v7 = [a1 copy];
  }
  else
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "aaf_empty");
  }
  id v6 = (void *)v7;
LABEL_8:

  return v6;
}

- (id)aaf_setByRemovingObjectsFromSet:()AAAFoundation
{
  id v4 = a3;
  if ([a1 count])
  {
    if ([v4 count])
    {
      id v5 = (void *)[a1 mutableCopy];
      [v5 minusSet:v4];
      id v6 = (void *)[v5 copy];

      goto LABEL_7;
    }
    uint64_t v7 = [a1 copy];
  }
  else
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "aaf_empty");
  }
  id v6 = (void *)v7;
LABEL_7:

  return v6;
}

@end