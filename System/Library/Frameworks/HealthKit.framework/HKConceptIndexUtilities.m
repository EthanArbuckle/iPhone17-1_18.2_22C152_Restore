@interface HKConceptIndexUtilities
+ (BOOL)applyConcepts:(id)a3 toIndexableObject:(id)a4 keyPath:(id)a5 error:(id *)a6;
+ (BOOL)assignError:(id *)a3 forInvalidKeyPath:(id)a4 inClass:(Class)a5;
+ (id)conceptsForIndexedConcepts:(id)a3 expectedCount:(int64_t)a4 context:(id)a5 error:(id *)a6;
+ (id)firstComponentForKeyPath:(id)a3 error:(id *)a4;
+ (id)indexedCodingsForCodingCollections:(id)a3 context:(id)a4 error:(id *)a5;
+ (id)keyPathRemovingFirstComponentFromKeyPath:(id)a3 error:(id *)a4;
+ (id)keyPaths:(id)a3 prefix:(id)a4;
+ (id)medicalCodingCollectionForIndexableObject:(id)a3 keyPath:(id)a4 error:(id *)a5;
- (HKConceptIndexUtilities)init;
@end

@implementation HKConceptIndexUtilities

- (HKConceptIndexUtilities)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (id)keyPathRemovingFirstComponentFromKeyPath:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HKConceptIndexUtilities.m", 26, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];
  }
  uint64_t v8 = [v7 rangeOfString:@"."];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"No remaining key-path");
    v10 = 0;
  }
  else
  {
    v10 = [v7 substringFromIndex:v8 + v9];
  }

  return v10;
}

+ (id)firstComponentForKeyPath:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HKConceptIndexUtilities.m", 36, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];
  }
  if ([v7 length])
  {
    uint64_t v8 = [v7 rangeOfString:@"."];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v7 substringToIndex:v8];
    }
    v10 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Unable to get first component for empty key-path");
    v10 = 0;
  }

  return v10;
}

+ (id)keyPaths:(id)a3 prefix:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__HKConceptIndexUtilities_keyPaths_prefix___block_invoke;
    v9[3] = &unk_1E58C42B8;
    id v10 = v5;
    id v7 = objc_msgSend(a3, "hk_map:", v9);
  }
  else
  {
    id v7 = (void *)[a3 copy];
  }

  return v7;
}

uint64_t __43__HKConceptIndexUtilities_keyPaths_prefix___block_invoke(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"%@.%@", *(void *)(a1 + 32), a2];
}

+ (id)indexedCodingsForCodingCollections:(id)a3 context:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"HKConceptIndexUtilities.m", 62, @"Invalid parameter not satisfying: %@", @"codingCollections" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"HKConceptIndexUtilities.m", 63, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

LABEL_3:
  if ((unint64_t)[v9 count] <= 0x7F)
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 1;
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__27;
    v28 = __Block_byref_object_dispose__27;
    id v29 = 0;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __76__HKConceptIndexUtilities_indexedCodingsForCodingCollections_context_error___block_invoke;
    v20[3] = &unk_1E58C42E0;
    v22 = &v24;
    v23 = &v30;
    id v14 = v13;
    id v21 = v14;
    [v9 enumerateObjectsUsingBlock:v20];
    if (*((unsigned char *)v31 + 24))
    {
      v12 = (void *)[v14 copy];
    }
    else
    {
      id v15 = (id)v25[5];
      v16 = v15;
      if (v15)
      {
        if (a5) {
          *a5 = v15;
        }
        else {
          _HKLogDroppedError(v15);
        }
      }

      v12 = 0;
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Unable to generate concept index for array of length %lu for context %@", objc_msgSend(v9, "count"), v11);
    v12 = 0;
  }

  return v12;
}

void __76__HKConceptIndexUtilities_indexedCodingsForCodingCollections_context_error___block_invoke(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = +[HKIndexableObject indexableObjectWithObject:a2 index:a3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

+ (id)conceptsForIndexedConcepts:(id)a3 expectedCount:(int64_t)a4 context:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  v11 = +[HKIndexableObject indexableObjectsByApplyingOutermostIndex:v9 expectedCount:a4 error:a6];
  if (v11)
  {
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 1;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__27;
    uint64_t v26 = __Block_byref_object_dispose__27;
    id v27 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __82__HKConceptIndexUtilities_conceptsForIndexedConcepts_expectedCount_context_error___block_invoke;
    v18[3] = &unk_1E58C4308;
    id v19 = v10;
    v20 = &v22;
    id v21 = &v28;
    v12 = objc_msgSend(v11, "hk_map:", v18);
    id v13 = v12;
    if (*((unsigned char *)v29 + 24))
    {
      id v14 = v12;
    }
    else
    {
      id v15 = (id)v23[5];
      v16 = v15;
      if (v15)
      {
        if (a6) {
          *a6 = v15;
        }
        else {
          _HKLogDroppedError(v15);
        }
      }

      id v14 = 0;
    }

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

id __82__HKConceptIndexUtilities_conceptsForIndexedConcepts_expectedCount_context_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 count];
  uint64_t v5 = a1[4];
  uint64_t v6 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v6 + 40);
  BOOL v7 = HKIndexableObjectCheckCardinalityForIndexRestore(v4, 1, v5, (uint64_t)&obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    uint64_t v8 = [v3 firstObject];
    id v9 = [v8 object];
  }
  else
  {
    id v9 = 0;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }

  return v9;
}

+ (id)medicalCodingCollectionForIndexableObject:(id)a3 keyPath:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      id v9 = [v7 codingsForKeyPath:v8 error:a5];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"No remaining key-path");
    id v9 = 0;
  }

  return v9;
}

+ (BOOL)applyConcepts:(id)a3 toIndexableObject:(id)a4 keyPath:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v10) {
      char v12 = [v10 applyConcepts:v9 forKeyPath:v11 error:a6];
    }
    else {
      char v12 = HKIndexableObjectCheckCardinalityForIndexRestore([v9 count], 0, (uint64_t)v11, (uint64_t)a6);
    }
    BOOL v13 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 3, @"No remaining key-path");
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)assignError:(id *)a3 forInvalidKeyPath:(id)a4 inClass:(Class)a5
{
  id v7 = (void *)MEMORY[0x1E4F28C58];
  id v8 = a4;
  id v9 = NSStringFromClass(a5);
  LOBYTE(a3) = objc_msgSend(v7, "hk_assignError:code:format:", a3, 3, @"%@ does not support codings for key path %@", v9, v8);

  return (char)a3;
}

@end