@interface NSArray(HKCodedObject)
+ (uint64_t)indexableKeyPathsWithPrefix:()HKCodedObject;
- (BOOL)applyConcepts:()HKCodedObject forKeyPath:error:;
- (id)codingsForKeyPath:()HKCodedObject error:;
@end

@implementation NSArray(HKCodedObject)

+ (uint64_t)indexableKeyPathsWithPrefix:()HKCodedObject
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"NSArray+HKCodedObject.m" lineNumber:20 description:@"Indexing by key-path is not supported for NSArray"];

  return MEMORY[0x1E4F1CBF0];
}

- (id)codingsForKeyPath:()HKCodedObject error:
{
  id v7 = a3;
  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"NSArray+HKCodedObject.m", 26, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];
  }
  if ((unint64_t)[a1 count] <= 0x7F)
  {
    v9 = &unk_1EECEB508;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__42;
    v27 = __Block_byref_object_dispose__42;
    id v28 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__NSArray_HKCodedObject__codingsForKeyPath_error___block_invoke;
    v18[3] = &unk_1E58C6160;
    id v11 = v9;
    id v19 = v11;
    v22 = &v23;
    id v20 = v7;
    id v12 = v10;
    id v21 = v12;
    [a1 enumerateObjectsUsingBlock:v18];
    v13 = (void *)v24[5];
    if (v13)
    {
      id v14 = v13;
      v15 = v14;
      if (a4) {
        *a4 = v14;
      }
      else {
        _HKLogDroppedError(v14);
      }

      v8 = 0;
    }
    else
    {
      v8 = (void *)[v12 copy];
    }

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Unable to generate concept index for array of length %lu for key-path %@", objc_msgSend(a1, "count"), v7);
    v8 = 0;
  }

  return v8;
}

- (BOOL)applyConcepts:()HKCodedObject forKeyPath:error:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[HKIndexableObject indexableObjectsByApplyingOutermostIndex:expectedCount:error:](HKIndexableObject, "indexableObjectsByApplyingOutermostIndex:expectedCount:error:", v8, [a1 count], a5);
  id v11 = v10;
  if (v10)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__42;
    uint64_t v25 = __Block_byref_object_dispose__42;
    id v26 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__NSArray_HKCodedObject__applyConcepts_forKeyPath_error___block_invoke;
    v17[3] = &unk_1E58C6188;
    id v20 = &v21;
    id v18 = v10;
    id v19 = v9;
    [a1 enumerateObjectsUsingBlock:v17];
    id v12 = (void *)v22[5];
    BOOL v13 = v12 == 0;
    if (v12)
    {
      id v14 = v12;
      v15 = v14;
      if (a5) {
        *a5 = v14;
      }
      else {
        _HKLogDroppedError(v14);
      }
    }
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

@end