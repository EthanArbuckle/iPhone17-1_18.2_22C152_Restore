@interface NSArray(AAAFoundation)
+ (uint64_t)aaf_empty;
- (BOOL)aaf_hasObjects;
- (id)aaf_arrayByRemovingObject:()AAAFoundation;
- (id)aaf_filter:()AAAFoundation;
- (id)aaf_firstObjectPassingTest:()AAAFoundation;
- (id)aaf_map:()AAAFoundation;
- (id)aaf_mapStoppable:()AAAFoundation;
- (uint64_t)aaf_arrayAsCommaSeperatedString;
- (uint64_t)aaf_isSubsetOfArray:()AAAFoundation;
@end

@implementation NSArray(AAAFoundation)

- (id)aaf_firstObjectPassingTest:()AAAFoundation
{
  id v4 = a3;
  if ([a1 count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__NSArray_AAAFoundation__aaf_firstObjectPassingTest___block_invoke;
    v8[3] = &unk_1E6CFAB60;
    id v9 = v4;
    uint64_t v5 = [a1 indexOfObjectPassingTest:v8];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = 0;
    }
    else
    {
      v6 = [a1 objectAtIndex:v5];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (uint64_t)aaf_empty
{
  return MEMORY[0x1E4F1CBF0];
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
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __37__NSArray_AAAFoundation__aaf_filter___block_invoke;
    v12 = &unk_1E6CFAB10;
    id v13 = v5;
    id v14 = v4;
    id v6 = v5;
    [a1 enumerateObjectsUsingBlock:&v9];
    v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1C978], "aaf_empty");
  }

  return v7;
}

- (id)aaf_map:()AAAFoundation
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__NSArray_AAAFoundation__aaf_map___block_invoke;
  v8[3] = &unk_1E6CFAB38;
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
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __43__NSArray_AAAFoundation__aaf_mapStoppable___block_invoke;
    v12 = &unk_1E6CFAB10;
    id v13 = v5;
    id v14 = v4;
    id v6 = v5;
    [a1 enumerateObjectsUsingBlock:&v9];
    v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1C978], "aaf_empty");
  }

  return v7;
}

- (id)aaf_arrayByRemovingObject:()AAAFoundation
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
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C978], "aaf_empty");
  }
  id v6 = (void *)v7;
LABEL_8:

  return v6;
}

- (uint64_t)aaf_isSubsetOfArray:()AAAFoundation
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:a1];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];
    uint64_t v7 = [v5 isSubsetOfSet:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)aaf_arrayAsCommaSeperatedString
{
  return [a1 componentsJoinedByString:@","];
}

@end