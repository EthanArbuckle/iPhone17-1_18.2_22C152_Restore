@interface NSArray(FamilyCircle)
- (id)fa_firstObjectMatching:()FamilyCircle;
- (id)fa_map:()FamilyCircle;
@end

@implementation NSArray(FamilyCircle)

- (id)fa_map:()FamilyCircle
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __32__NSArray_FamilyCircle__fa_map___block_invoke;
  v13 = &unk_1E6925950;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)fa_firstObjectMatching:()FamilyCircle
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  id v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__NSArray_FamilyCircle__fa_firstObjectMatching___block_invoke;
  v8[3] = &unk_1E6925978;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end