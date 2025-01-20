@interface NSSet(FMAdditions)
+ (id)fm_setWithSafeObject:()FMAdditions;
- (id)fm_filter:()FMAdditions;
- (id)fm_firstObjectPassingTest:()FMAdditions;
- (id)fm_map:()FMAdditions;
- (id)fm_setByFlattening;
- (id)fm_setByIntersectingWithSet:()FMAdditions;
- (id)fm_setByRemovingObjectsFromSet:()FMAdditions;
- (uint64_t)fm_any:()FMAdditions;
- (void)fm_each:()FMAdditions;
@end

@implementation NSSet(FMAdditions)

- (id)fm_map:()FMAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __29__NSSet_FMAdditions__fm_map___block_invoke;
  v11[3] = &unk_1E6019A68;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)fm_filter:()FMAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__NSSet_FMAdditions__fm_filter___block_invoke;
  v8[3] = &unk_1E6019A90;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 objectsPassingTest:v8];

  return v6;
}

- (id)fm_firstObjectPassingTest:()FMAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__NSSet_FMAdditions__fm_firstObjectPassingTest___block_invoke;
  v8[3] = &unk_1E6019AB8;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (uint64_t)fm_any:()FMAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__NSSet_FMAdditions__fm_any___block_invoke;
  v8[3] = &unk_1E6019AB8;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)fm_each:()FMAdditions
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__NSSet_FMAdditions__fm_each___block_invoke;
  v6[3] = &unk_1E6019AE0;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsUsingBlock:v6];
}

- (id)fm_setByFlattening
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__NSSet_FMAdditions__fm_setByFlattening__block_invoke;
  v5[3] = &unk_1E60197B0;
  id v3 = v2;
  id v6 = v3;
  objc_msgSend(a1, "fm_each:", v5);

  return v3;
}

- (id)fm_setByIntersectingWithSet:()FMAdditions
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 intersectSet:v4];

  return v5;
}

- (id)fm_setByRemovingObjectsFromSet:()FMAdditions
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 minusSet:v4];

  return v5;
}

+ (id)fm_setWithSafeObject:()FMAdditions
{
  if (a3) {
    objc_msgSend(a1, "setWithObject:");
  }
  else {
  id v3 = [a1 set];
  }
  return v3;
}

@end