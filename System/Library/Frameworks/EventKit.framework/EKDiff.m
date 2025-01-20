@interface EKDiff
+ (id)_addChangeStarIfChangedKey:(id)a3 onObject:(id)a4;
+ (id)_indentStringAtDepth:(int64_t)a3;
+ (id)_keysToIgnoreForComputingDiff;
+ (id)_keysToIgnoreForComputingUIDiff;
+ (id)_summaryKeyForMultiValueChange:(id)a3 ofPropertyKey:(id)a4;
+ (id)diffBetweenObject:(id)a3 andObject:(id)a4;
+ (id)diffBetweenObject:(id)a3 andObject:(id)a4 compareUIVisiblePropertiesOnly:(BOOL)a5;
+ (id)summaryKeyForChangedProperty:(id)a3 subProperty:(id)a4;
+ (id)summaryKeyForMultiValueAddOfPropertyKey:(id)a3;
+ (id)summaryKeyForMultiValueModifyOfPropertyKey:(id)a3;
+ (id)summaryKeyForMultiValueRemoveOfPropertyKey:(id)a3;
+ (void)_addObject:(id)a3 forKey:(id)a4 toDiff:(id)a5;
+ (void)_addPaddedHeaderToMutableString:(id)a3 forKey:(id)a4 withDepth:(int64_t)a5;
+ (void)_addSummaryWithDepth:(int64_t)a3 toMutableString:(id)a4 forRelationshipMultiValueKeys:(id)a5 firstObject:(id)a6 secondObject:(id)a7;
+ (void)_addSummaryWithDepth:(int64_t)a3 toMutableString:(id)a4 forRelationshipSingleValueKeys:(id)a5 firstObject:(id)a6 secondObject:(id)a7;
+ (void)_addSummaryWithDepth:(int64_t)a3 toMutableString:(id)a4 forSingleValueKeys:(id)a5 firstObject:(id)a6 secondObject:(id)a7;
+ (void)_populateIdentityKeysForDiff:(id)a3;
+ (void)_populateImmutableKeysForDiff:(id)a3;
+ (void)_populateMultiValueRelationshipKeysForDiff:(id)a3 compareUIVisiblePropertiesOnly:(BOOL)a4;
+ (void)_populateSingleValueKeysForDiff:(id)a3 compareUIVisiblePropertiesOnly:(BOOL)a4;
+ (void)_populateSingleValueRelationshipKeysForDiff:(id)a3 compareUIVisiblePropertiesOnly:(BOOL)a4;
- (EKDiff)initWithFirstObject:(id)a3 secondObject:(id)a4;
- (EKObject)firstObject;
- (EKObject)secondObject;
- (NSDictionary)relationshipMultiValueAdds;
- (NSDictionary)relationshipMultiValueModifies;
- (NSDictionary)relationshipMultiValueRemoves;
- (NSDictionary)relationshipSingleValueModifies;
- (NSSet)differentIdentityKeys;
- (NSSet)differentImmutableKeys;
- (NSSet)differentRelationshipMultiValueKeys;
- (NSSet)differentRelationshipSingleValueKeys;
- (NSSet)differentSingleValueKeys;
- (id)_multiValueModifiedObjectsForKey:(id)a3;
- (id)_nonNilObject;
- (id)changeSetForDiff;
- (id)copyOfObject:(id)a3 alreadyCopiedObjects:(id)a4 madeNewCopy:(BOOL *)a5;
- (id)differentKeys;
- (id)summaryDictionary;
- (id)summaryString;
- (int)result;
- (void)_summarizeDiffsBetweenFirstObject:(id)a3 secondObject:(id)a4 mutableString:(id)a5 depth:(int64_t)a6;
- (void)setDifferentIdentityKeys:(id)a3;
- (void)setDifferentImmutableKeys:(id)a3;
- (void)setDifferentRelationshipMultiValueKeys:(id)a3;
- (void)setDifferentRelationshipSingleValueKeys:(id)a3;
- (void)setDifferentSingleValueKeys:(id)a3;
- (void)setFirstObject:(id)a3;
- (void)setRelationshipMultiValueAdds:(id)a3;
- (void)setRelationshipMultiValueModifies:(id)a3;
- (void)setRelationshipMultiValueRemoves:(id)a3;
- (void)setRelationshipSingleValueModifies:(id)a3;
- (void)setResult:(int)a3;
- (void)setSecondObject:(id)a3;
@end

@implementation EKDiff

- (EKDiff)initWithFirstObject:(id)a3 secondObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EKDiff;
  v8 = [(EKDiff *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(EKDiff *)v8 setFirstObject:v6];
    [(EKDiff *)v9 setSecondObject:v7];
  }

  return v9;
}

- (id)_nonNilObject
{
  v3 = [(EKDiff *)self firstObject];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(EKDiff *)self secondObject];
  }
  id v6 = v5;

  return v6;
}

+ (id)diffBetweenObject:(id)a3 andObject:(id)a4
{
  return +[EKDiff diffBetweenObject:a3 andObject:a4 compareUIVisiblePropertiesOnly:0];
}

+ (id)diffBetweenObject:(id)a3 andObject:(id)a4 compareUIVisiblePropertiesOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    +[EKDiff diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:].cold.5((uint64_t)v8, (uint64_t)v9, v10);
  }
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  v13 = [[EKDiff alloc] initWithFirstObject:v8 secondObject:v9];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v12)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      +[EKDiff diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:].cold.4();
    }
    uint64_t v14 = 1;
LABEL_28:
    [(EKDiff *)v13 setResult:v14];
    goto LABEL_29;
  }
  [a1 _populateSingleValueKeysForDiff:v13 compareUIVisiblePropertiesOnly:v5];
  [a1 _populateImmutableKeysForDiff:v13];
  [a1 _populateSingleValueRelationshipKeysForDiff:v13 compareUIVisiblePropertiesOnly:v5];
  [a1 _populateMultiValueRelationshipKeysForDiff:v13 compareUIVisiblePropertiesOnly:v5];
  v15 = [(EKDiff *)v13 differentSingleValueKeys];
  if (![v15 count])
  {
    v20 = [(EKDiff *)v13 differentRelationshipSingleValueKeys];
    if (![v20 count])
    {
      v21 = [(EKDiff *)v13 differentRelationshipMultiValueKeys];
      if (![v21 count])
      {
        v23 = [(EKDiff *)v13 differentImmutableKeys];
        if ([v23 count]) {
          char v22 = v12;
        }
        else {
          char v22 = 0;
        }
        char v24 = v22;

        if (v24) {
          goto LABEL_36;
        }
LABEL_16:
        if (v5) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }
    if (v12) {
      goto LABEL_36;
    }
    goto LABEL_16;
  }

  if (!v12) {
    goto LABEL_16;
  }
LABEL_36:
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    +[EKDiff diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:]();
  }
  [(EKDiff *)v13 setResult:3];
  if (!v5) {
LABEL_17:
  }
    [a1 _populateIdentityKeysForDiff:v13];
LABEL_18:
  v16 = [(EKDiff *)v13 differentIdentityKeys];
  uint64_t v17 = [v16 count];

  char v18 = v12 ^ 1;
  if (!v17) {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      +[EKDiff diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:]();
    }
    [(EKDiff *)v13 setResult:2];
  }
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      +[EKDiff diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:]();
    }
    uint64_t v14 = 4;
    goto LABEL_28;
  }
LABEL_29:

  return v13;
}

+ (id)_keysToIgnoreForComputingDiff
{
  if (_keysToIgnoreForComputingDiff_onceToken != -1) {
    dispatch_once(&_keysToIgnoreForComputingDiff_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)_keysToIgnoreForComputingDiff_keysToIgnore;

  return v2;
}

void __39__EKDiff__keysToIgnoreForComputingDiff__block_invoke()
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F56BD8];
  v6[0] = *MEMORY[0x1E4F56BC8];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F56F50];
  v6[2] = *MEMORY[0x1E4F56C68];
  v6[3] = v2;
  v6[4] = *MEMORY[0x1E4F570E8];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  uint64_t v4 = [v0 setWithArray:v3];
  BOOL v5 = (void *)_keysToIgnoreForComputingDiff_keysToIgnore;
  _keysToIgnoreForComputingDiff_keysToIgnore = v4;
}

+ (id)_keysToIgnoreForComputingUIDiff
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__EKDiff__keysToIgnoreForComputingUIDiff__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_keysToIgnoreForComputingUIDiff_onceToken != -1) {
    dispatch_once(&_keysToIgnoreForComputingUIDiff_onceToken, block);
  }
  uint64_t v2 = (void *)_keysToIgnoreForComputingUIDiff_keysToIgnore;

  return v2;
}

void __41__EKDiff__keysToIgnoreForComputingUIDiff__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF953120];
  v3 = (void *)_keysToIgnoreForComputingUIDiff_keysToIgnore;
  _keysToIgnoreForComputingUIDiff_keysToIgnore = v2;

  id v6 = [*(id *)(a1 + 32) _keysToIgnoreForComputingDiff];
  uint64_t v4 = [v6 setByAddingObjectsFromSet:_keysToIgnoreForComputingUIDiff_keysToIgnore];
  BOOL v5 = (void *)_keysToIgnoreForComputingUIDiff_keysToIgnore;
  _keysToIgnoreForComputingUIDiff_keysToIgnore = v4;
}

+ (void)_populateSingleValueKeysForDiff:(id)a3 compareUIVisiblePropertiesOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    +[EKDiff _populateSingleValueKeysForDiff:compareUIVisiblePropertiesOnly:]();
  }
  id v7 = [v6 _nonNilObject];
  id v8 = [(id)objc_opt_class() knownSingleValueKeysForComparison];

  id v9 = [a1 _keysToIgnoreForComputingDiff];
  if (v4)
  {
    v10 = [v6 _nonNilObject];
    BOOL v11 = [(id)objc_opt_class() knownIdentityKeysForComparison];
    int v12 = [v9 setByAddingObjectsFromArray:v11];

    v13 = [v6 _nonNilObject];
    uint64_t v14 = [(id)objc_opt_class() knownSingleValueKeysToSkipForUIComparison];
    id v9 = [v12 setByAddingObjectsFromArray:v14];
  }
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __73__EKDiff__populateSingleValueKeysForDiff_compareUIVisiblePropertiesOnly___block_invoke;
  char v24 = &unk_1E5B97580;
  id v15 = v6;
  id v25 = v15;
  BOOL v28 = v4;
  id v16 = v9;
  id v26 = v16;
  id v27 = a1;
  uint64_t v17 = [v8 indexesOfObjectsPassingTest:&v21];
  char v18 = objc_msgSend(v8, "objectsAtIndexes:", v17, v21, v22, v23, v24);

  v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v18];
  [v15 setDifferentSingleValueKeys:v19];

  v20 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    +[EKDiff _populateSingleValueKeysForDiff:compareUIVisiblePropertiesOnly:](v20);
  }
}

uint64_t __73__EKDiff__populateSingleValueKeysForDiff_compareUIVisiblePropertiesOnly___block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) _nonNilObject];
  BOOL v5 = [(id)objc_opt_class() specialComparisonBlocks];
  id v6 = [v5 objectForKeyedSubscript:v3];

  if (*(unsigned char *)(a1 + 56) && v6)
  {
    id v7 = [*(id *)(a1 + 32) firstObject];
    id v8 = [*(id *)(a1 + 32) secondObject];
    uint64_t v9 = ((unsigned int (**)(void, void *, void *))v6)[2](v6, v7, v8) ^ 1;

LABEL_7:
    goto LABEL_8;
  }
  if (([*(id *)(a1 + 40) containsObject:v3] & 1) == 0)
  {
    id v7 = [*(id *)(a1 + 32) _nonNilObject];
    v10 = objc_opt_class();
    v16[0] = v3;
    BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    int v12 = [*(id *)(a1 + 32) firstObject];
    v13 = [*(id *)(a1 + 32) secondObject];
    uint64_t v14 = [*(id *)(a1 + 48) _keysToIgnoreForComputingDiff];
    uint64_t v9 = [v10 _compareNonRelationshipKeys:v11 forObject:v12 againstObject:v13 propertiesToIgnore:v14] ^ 1;

    goto LABEL_7;
  }
  uint64_t v9 = 0;
LABEL_8:

  return v9;
}

+ (void)_populateSingleValueRelationshipKeysForDiff:(id)a3 compareUIVisiblePropertiesOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    +[EKDiff _populateSingleValueRelationshipKeysForDiff:compareUIVisiblePropertiesOnly:]();
  }
  id v7 = [v6 _nonNilObject];
  id v8 = [(id)objc_opt_class() knownDerivedAndSingleValueRelationshipKeys];

  uint64_t v9 = [a1 _keysToIgnoreForComputingDiff];
  if (v4)
  {
    v10 = [v6 _nonNilObject];
    BOOL v11 = [(id)objc_opt_class() knownIdentityKeysForComparison];
    int v12 = [v9 setByAddingObjectsFromArray:v11];

    v13 = [v6 _nonNilObject];
    uint64_t v14 = [(id)objc_opt_class() knownSingleValueKeysToSkipForUIComparison];
    uint64_t v9 = [v12 setByAddingObjectsFromArray:v14];
  }
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __85__EKDiff__populateSingleValueRelationshipKeysForDiff_compareUIVisiblePropertiesOnly___block_invoke;
  v55[3] = &unk_1E5B975A8;
  id v42 = v9;
  id v56 = v42;
  id v15 = v6;
  id v57 = v15;
  BOOL v47 = v4;
  BOOL v58 = v4;
  id v16 = [v8 indexesOfObjectsPassingTest:v55];
  v44 = v8;
  uint64_t v17 = [v8 objectsAtIndexes:v16];

  char v18 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
  [v15 setDifferentRelationshipSingleValueKeys:v18];

  v19 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    +[EKDiff _populateSingleValueRelationshipKeysForDiff:compareUIVisiblePropertiesOnly:](v19);
  }
  v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count", v42));
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v17;
  uint64_t v49 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v49)
  {
    uint64_t v21 = *(void *)v52;
    uint64_t v45 = *(void *)v52;
    id v46 = v15;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v52 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v51 + 1) + 8 * v22);
        char v24 = [v15 secondObject];
        id v25 = [v24 valueForKey:v23];

        if (v25)
        {
          id v26 = [v15 firstObject];
          id v27 = [v26 valueForKey:v23];

          BOOL v28 = [v15 secondObject];
          v29 = [v28 valueForKey:v23];
          v30 = (void *)[v29 copy];

          v50 = v30;
          if (v27)
          {
            v31 = [v15 firstObject];
            v32 = [v31 eventStore];
            v33 = [v27 meltedObjectInStore:v32];

            v34 = [v15 secondObject];
            [v34 eventStore];
            v36 = v35 = v20;
            v37 = [v30 meltedObjectInStore:v36];

            v38 = [v33 diffWithObject:v37 compareUIVisiblePropertiesOnly:v47];
            v39 = [v38 differentKeys];
            uint64_t v40 = [v39 count];

            v20 = v35;
            if (v40) {
              [v35 setObject:v38 forKeyedSubscript:v23];
            }

            uint64_t v21 = v45;
            id v15 = v46;
          }
          else
          {
            v33 = [MEMORY[0x1E4F1CA98] null];
            [v20 setObject:v33 forKeyedSubscript:v23];
          }
        }
        else
        {
          id v27 = [MEMORY[0x1E4F1CA98] null];
          [v20 setObject:v27 forKeyedSubscript:v23];
        }

        ++v22;
      }
      while (v49 != v22);
      uint64_t v49 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v49);
  }

  v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v20];
  [v15 setRelationshipSingleValueModifies:v41];
}

uint64_t __85__EKDiff__populateSingleValueRelationshipKeysForDiff_compareUIVisiblePropertiesOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    uint64_t v4 = 0;
  }
  else
  {
    BOOL v5 = [*(id *)(a1 + 40) _nonNilObject];
    id v6 = objc_opt_class();
    id v7 = [*(id *)(a1 + 40) firstObject];
    id v8 = [*(id *)(a1 + 40) secondObject];
    uint64_t v4 = [v6 _compareSingleValueRelationshipKey:v3 forObject:v7 againstObject:v8 propertiesToIgnore:*(void *)(a1 + 32) ignoreIdentityKeys:*(unsigned __int8 *)(a1 + 48)] ^ 1;
  }
  return v4;
}

+ (void)_populateMultiValueRelationshipKeysForDiff:(id)a3 compareUIVisiblePropertiesOnly:(BOOL)a4
{
  BOOL v69 = a4;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    +[EKDiff _populateMultiValueRelationshipKeysForDiff:compareUIVisiblePropertiesOnly:]();
  }
  id v6 = [v5 _nonNilObject];
  id v7 = [(id)objc_opt_class() knownRelationshipMultiValueKeys];

  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __84__EKDiff__populateMultiValueRelationshipKeysForDiff_compareUIVisiblePropertiesOnly___block_invoke;
  v89[3] = &unk_1E5B975D0;
  id v58 = a1;
  id v91 = a1;
  id v8 = v5;
  id v90 = v8;
  uint64_t v9 = [v7 indexesOfObjectsPassingTest:v89];
  id v57 = v7;
  uint64_t v10 = [v7 objectsAtIndexes:v9];

  id v56 = (void *)v10;
  BOOL v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
  [v8 setDifferentRelationshipMultiValueKeys:v11];

  int v12 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    +[EKDiff _populateMultiValueRelationshipKeysForDiff:compareUIVisiblePropertiesOnly:](v12);
  }
  unint64_t v13 = 0x1E4F1C000uLL;
  v63 = [MEMORY[0x1E4F1CA60] dictionary];
  v62 = [MEMORY[0x1E4F1CA60] dictionary];
  v61 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = [v8 differentRelationshipMultiValueKeys];
  uint64_t v66 = [obj countByEnumeratingWithState:&v85 objects:v95 count:16];
  if (v66)
  {
    uint64_t v64 = *(void *)v86;
    id v65 = v8;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v86 != v64) {
          objc_enumerationMutation(obj);
        }
        uint64_t v67 = v14;
        uint64_t v15 = *(void *)(*((void *)&v85 + 1) + 8 * v14);
        uint64_t v71 = [MEMORY[0x1E4F1CA80] set];
        v72 = [MEMORY[0x1E4F1CA80] set];
        v70 = [*(id *)(v13 + 2656) dictionary];
        id v16 = objc_opt_new();
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        uint64_t v17 = [v8 firstObject];
        uint64_t v68 = v15;
        char v18 = [v17 valueForKey:v15];

        uint64_t v19 = [v18 countByEnumeratingWithState:&v81 objects:v94 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v82;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v82 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void **)(*((void *)&v81 + 1) + 8 * i);
              char v24 = [v23 uniqueIdentifier];
              if ([v24 length]) {
                [v16 setObject:v23 forKeyedSubscript:v24];
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v81 objects:v94 count:16];
          }
          while (v20);
        }

        id v25 = objc_opt_new();
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v26 = [v8 secondObject];
        id v27 = [v26 valueForKey:v68];

        uint64_t v28 = [v27 countByEnumeratingWithState:&v77 objects:v93 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v78;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v78 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = *(void **)(*((void *)&v77 + 1) + 8 * j);
              v33 = [v32 uniqueIdentifier];
              if ([v33 length]) {
                [v25 setObject:v32 forKeyedSubscript:v33];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v77 objects:v93 count:16];
          }
          while (v29);
        }

        v34 = (void *)MEMORY[0x1E4F1CAD0];
        v35 = [v16 allKeys];
        v36 = [v34 setWithArray:v35];
        v37 = [v25 allKeys];
        v38 = [v36 setByAddingObjectsFromArray:v37];

        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v39 = v38;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v73 objects:v92 count:16];
        v41 = (void *)v71;
        if (v40)
        {
          uint64_t v42 = v40;
          uint64_t v43 = *(void *)v74;
          do
          {
            for (uint64_t k = 0; k != v42; ++k)
            {
              if (*(void *)v74 != v43) {
                objc_enumerationMutation(v39);
              }
              uint64_t v45 = *(void *)(*((void *)&v73 + 1) + 8 * k);
              uint64_t v46 = [v16 objectForKeyedSubscript:v45];
              uint64_t v47 = [v25 objectForKeyedSubscript:v45];
              v48 = (void *)v47;
              if (!(v46 | v47))
              {
                long long v52 = [MEMORY[0x1E4F28B00] currentHandler];
                [v52 handleFailureInMethod:a2 object:v58 file:@"EKDiff.m" lineNumber:269 description:@"One of these has to be non-nil"];

LABEL_40:
                v50 = v41;
                long long v51 = v48;
LABEL_41:
                [v50 addObject:v51];
                goto LABEL_42;
              }
              if (!v46) {
                goto LABEL_40;
              }
              if (!v47)
              {
                v50 = v72;
                long long v51 = (void *)v46;
                goto LABEL_41;
              }
              if (([(id)v46 isEqual:v47 ignoringProperties:0] & 1) == 0)
              {
                uint64_t v49 = +[EKDiff diffBetweenObject:v46 andObject:v48 compareUIVisiblePropertiesOnly:v69];
                [v70 setObject:v49 forKeyedSubscript:v45];

                v41 = (void *)v71;
              }
LABEL_42:
            }
            uint64_t v42 = [v39 countByEnumeratingWithState:&v73 objects:v92 count:16];
          }
          while (v42);
        }

        if ([v41 count]) {
          [v63 setObject:v41 forKeyedSubscript:v68];
        }
        if ([v72 count]) {
          [v62 setObject:v72 forKeyedSubscript:v68];
        }
        if ([v70 count]) {
          [v61 setObject:v70 forKeyedSubscript:v68];
        }

        uint64_t v14 = v67 + 1;
        id v8 = v65;
        unint64_t v13 = 0x1E4F1C000;
      }
      while (v67 + 1 != v66);
      uint64_t v66 = [obj countByEnumeratingWithState:&v85 objects:v95 count:16];
    }
    while (v66);
  }

  if ([v63 count])
  {
    long long v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v63];
    [v8 setRelationshipMultiValueAdds:v53];
  }
  if ([v62 count])
  {
    long long v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v62];
    [v8 setRelationshipMultiValueRemoves:v54];
  }
  if ([v61 count])
  {
    v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v61];
    [v8 setRelationshipMultiValueModifies:v55];
  }
}

uint64_t __84__EKDiff__populateMultiValueRelationshipKeysForDiff_compareUIVisiblePropertiesOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 40) _keysToIgnoreForComputingDiff];
  char v5 = [v4 containsObject:v3];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) _nonNilObject];
    id v8 = objc_opt_class();
    uint64_t v9 = [*(id *)(a1 + 32) firstObject];
    uint64_t v10 = [*(id *)(a1 + 32) secondObject];
    BOOL v11 = [*(id *)(a1 + 40) _keysToIgnoreForComputingDiff];
    uint64_t v6 = [v8 _compareMultiValueRelationshipKey:v3 forObject:v9 againstObject:v10 propertiesToIgnore:v11] ^ 1;
  }
  return v6;
}

+ (void)_populateIdentityKeysForDiff:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    +[EKDiff _populateIdentityKeysForDiff:]();
  }
  char v5 = [v4 _nonNilObject];
  uint64_t v6 = [(id)objc_opt_class() knownIdentityKeysForComparison];

  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __39__EKDiff__populateIdentityKeysForDiff___block_invoke;
  uint64_t v15 = &unk_1E5B975D0;
  id v17 = a1;
  id v7 = v4;
  id v16 = v7;
  id v8 = [v6 indexesOfObjectsPassingTest:&v12];
  uint64_t v9 = objc_msgSend(v6, "objectsAtIndexes:", v8, v12, v13, v14, v15);

  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  [v7 setDifferentIdentityKeys:v10];

  BOOL v11 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    +[EKDiff _populateIdentityKeysForDiff:](v11);
  }
}

uint64_t __39__EKDiff__populateIdentityKeysForDiff___block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 40) _keysToIgnoreForComputingDiff];
  char v5 = [v4 containsObject:v3];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) _nonNilObject];
    id v8 = objc_opt_class();
    v14[0] = v3;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v10 = [*(id *)(a1 + 32) firstObject];
    BOOL v11 = [*(id *)(a1 + 32) secondObject];
    uint64_t v12 = [*(id *)(a1 + 40) _keysToIgnoreForComputingDiff];
    uint64_t v6 = [v8 _compareNonRelationshipKeys:v9 forObject:v10 againstObject:v11 propertiesToIgnore:v12] ^ 1;
  }
  return v6;
}

+ (void)_populateImmutableKeysForDiff:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    +[EKDiff _populateImmutableKeysForDiff:]();
  }
  char v5 = [v4 _nonNilObject];
  uint64_t v6 = [(id)objc_opt_class() knownImmutableKeys];

  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __40__EKDiff__populateImmutableKeysForDiff___block_invoke;
  uint64_t v15 = &unk_1E5B975D0;
  id v17 = a1;
  id v7 = v4;
  id v16 = v7;
  id v8 = [v6 indexesOfObjectsPassingTest:&v12];
  uint64_t v9 = objc_msgSend(v6, "objectsAtIndexes:", v8, v12, v13, v14, v15);

  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  [v7 setDifferentImmutableKeys:v10];

  BOOL v11 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    +[EKDiff _populateImmutableKeysForDiff:](v11);
  }
}

uint64_t __40__EKDiff__populateImmutableKeysForDiff___block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 40) _keysToIgnoreForComputingDiff];
  char v5 = [v4 containsObject:v3];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) _nonNilObject];
    id v8 = objc_opt_class();
    v14[0] = v3;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v10 = [*(id *)(a1 + 32) firstObject];
    BOOL v11 = [*(id *)(a1 + 32) secondObject];
    uint64_t v12 = [*(id *)(a1 + 40) _keysToIgnoreForComputingDiff];
    uint64_t v6 = [v8 _compareNonRelationshipKeys:v9 forObject:v10 againstObject:v11 propertiesToIgnore:v12] ^ 1;
  }
  return v6;
}

- (id)_multiValueModifiedObjectsForKey:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(EKDiff *)self relationshipMultiValueModifies];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = objc_msgSend(v6, "allValues", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) secondObject];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)differentKeys
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(EKDiff *)self differentIdentityKeys];
  [v3 unionSet:v4];

  char v5 = [(EKDiff *)self differentImmutableKeys];
  [v3 unionSet:v5];

  uint64_t v6 = [(EKDiff *)self differentSingleValueKeys];
  [v3 unionSet:v6];

  id v7 = [(EKDiff *)self differentRelationshipSingleValueKeys];
  [v3 unionSet:v7];

  id v8 = [(EKDiff *)self differentRelationshipMultiValueKeys];
  [v3 unionSet:v8];

  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithSet:v3];

  return v9;
}

- (id)summaryDictionary
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v4 = [(EKDiff *)self differentSingleValueKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v133 objects:v145 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v134;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v134 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v133 + 1) + 8 * i);
        uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
        [v3 setObject:v10 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v133 objects:v145 count:16];
    }
    while (v6);
  }

  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  uint64_t v11 = [(EKDiff *)self differentIdentityKeys];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v129 objects:v144 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v130;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v130 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v129 + 1) + 8 * j);
        long long v17 = [MEMORY[0x1E4F1CA98] null];
        [v3 setObject:v17 forKeyedSubscript:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v129 objects:v144 count:16];
    }
    while (v13);
  }

  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v18 = [(EKDiff *)self differentImmutableKeys];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v125 objects:v143 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v126;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v126 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v125 + 1) + 8 * k);
        char v24 = [MEMORY[0x1E4F1CA98] null];
        [v3 setObject:v24 forKeyedSubscript:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v125 objects:v143 count:16];
    }
    while (v20);
  }

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id obj = [(EKDiff *)self differentRelationshipSingleValueKeys];
  uint64_t v25 = [obj countByEnumeratingWithState:&v121 objects:v142 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v122;
    uint64_t v87 = *(void *)v122;
    do
    {
      uint64_t v28 = 0;
      uint64_t v88 = v26;
      do
      {
        if (*(void *)v122 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void **)(*((void *)&v121 + 1) + 8 * v28);
        uint64_t v30 = [(EKDiff *)self firstObject];
        v31 = [v30 valueForKey:v29];

        v32 = [(EKDiff *)self secondObject];
        uint64_t v33 = [v32 valueForKey:v29];

        v34 = (void *)v33;
        if (v31) {
          BOOL v35 = v33 == 0;
        }
        else {
          BOOL v35 = 1;
        }
        if (v35)
        {
          v36 = [MEMORY[0x1E4F1CA98] null];
          [v3 setObject:v36 forKeyedSubscript:v29];
        }
        else
        {
          uint64_t v92 = v28;
          id v93 = v29;
          uint64_t v37 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "meltedClass"), "knownSingleValueKeysForComparison");
          uint64_t v38 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "meltedClass"), "knownIdentityKeysForComparison");
          id v91 = (void *)v37;
          [MEMORY[0x1E4F1CA48] arrayWithArray:v37];
          id v39 = v95 = (void *)v33;
          id v90 = (void *)v38;
          [v39 addObjectsFromArray:v38];
          long long v119 = 0u;
          long long v120 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          id v40 = v39;
          v34 = (void *)v33;
          id v99 = v40;
          uint64_t v41 = [v40 countByEnumeratingWithState:&v117 objects:v141 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v118;
            do
            {
              uint64_t v44 = 0;
              uint64_t v97 = v42;
              do
              {
                if (*(void *)v118 != v43) {
                  objc_enumerationMutation(v99);
                }
                uint64_t v45 = *(void *)(*((void *)&v117 + 1) + 8 * v44);
                uint64_t v46 = [v31 valueForKey:v45];
                uint64_t v47 = [v34 valueForKey:v45];
                v48 = (void *)v47;
                if (v46) {
                  BOOL v49 = v47 == 0;
                }
                else {
                  BOOL v49 = 1;
                }
                if (v49)
                {
                  if (!(v46 | v47)) {
                    goto LABEL_45;
                  }
LABEL_44:
                  v50 = [(id)objc_opt_class() summaryKeyForChangedProperty:v93 subProperty:v45];
                  [MEMORY[0x1E4F1CA98] null];
                  long long v51 = self;
                  uint64_t v52 = v43;
                  v54 = long long v53 = v31;
                  v34 = v95;
                  [v3 setObject:v54 forKeyedSubscript:v93];

                  v55 = [MEMORY[0x1E4F1CA98] null];
                  [v3 setObject:v55 forKeyedSubscript:v50];

                  v31 = v53;
                  uint64_t v43 = v52;
                  self = v51;
                  uint64_t v42 = v97;

                  goto LABEL_45;
                }
                char v56 = [(id)v46 isEqual:v47];
                if ((v56 & 1) == 0) {
                  goto LABEL_44;
                }
LABEL_45:

                ++v44;
              }
              while (v42 != v44);
              uint64_t v57 = [v99 countByEnumeratingWithState:&v117 objects:v141 count:16];
              uint64_t v42 = v57;
            }
            while (v57);
          }

          uint64_t v27 = v87;
          uint64_t v26 = v88;
          v36 = v91;
          uint64_t v28 = v92;
        }

        ++v28;
      }
      while (v28 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v121 objects:v142 count:16];
    }
    while (v26);
  }

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v94 = [(EKDiff *)self differentRelationshipMultiValueKeys];
  uint64_t v98 = [v94 countByEnumeratingWithState:&v113 objects:v140 count:16];
  if (v98)
  {
    uint64_t v96 = *(void *)v114;
    do
    {
      id v58 = 0;
      do
      {
        if (*(void *)v114 != v96) {
          objc_enumerationMutation(v94);
        }
        v100 = v58;
        uint64_t v59 = *(void *)(*((void *)&v113 + 1) + 8 * (void)v58);
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        uint64_t v60 = [(EKDiff *)self relationshipMultiValueAdds];
        v61 = [v60 objectForKeyedSubscript:v59];

        uint64_t v62 = [v61 countByEnumeratingWithState:&v109 objects:v139 count:16];
        if (v62)
        {
          uint64_t v63 = v62;
          uint64_t v64 = *(void *)v110;
          do
          {
            for (uint64_t m = 0; m != v63; ++m)
            {
              if (*(void *)v110 != v64) {
                objc_enumerationMutation(v61);
              }
              uint64_t v66 = *(void *)(*((void *)&v109 + 1) + 8 * m);
              uint64_t v67 = objc_opt_class();
              uint64_t v68 = [(id)objc_opt_class() summaryKeyForMultiValueAddOfPropertyKey:v59];
              [v67 _addObject:v66 forKey:v68 toDiff:v3];
            }
            uint64_t v63 = [v61 countByEnumeratingWithState:&v109 objects:v139 count:16];
          }
          while (v63);
        }

        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        BOOL v69 = [(EKDiff *)self relationshipMultiValueRemoves];
        v70 = [v69 objectForKeyedSubscript:v59];

        uint64_t v71 = [v70 countByEnumeratingWithState:&v105 objects:v138 count:16];
        if (v71)
        {
          uint64_t v72 = v71;
          uint64_t v73 = *(void *)v106;
          do
          {
            for (uint64_t n = 0; n != v72; ++n)
            {
              if (*(void *)v106 != v73) {
                objc_enumerationMutation(v70);
              }
              uint64_t v75 = *(void *)(*((void *)&v105 + 1) + 8 * n);
              long long v76 = objc_opt_class();
              long long v77 = [(id)objc_opt_class() summaryKeyForMultiValueRemoveOfPropertyKey:v59];
              [v76 _addObject:v75 forKey:v77 toDiff:v3];
            }
            uint64_t v72 = [v70 countByEnumeratingWithState:&v105 objects:v138 count:16];
          }
          while (v72);
        }

        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        long long v78 = [(EKDiff *)self _multiValueModifiedObjectsForKey:v59];
        uint64_t v79 = [v78 countByEnumeratingWithState:&v101 objects:v137 count:16];
        if (v79)
        {
          uint64_t v80 = v79;
          uint64_t v81 = *(void *)v102;
          do
          {
            for (iuint64_t i = 0; ii != v80; ++ii)
            {
              if (*(void *)v102 != v81) {
                objc_enumerationMutation(v78);
              }
              uint64_t v83 = *(void *)(*((void *)&v101 + 1) + 8 * ii);
              long long v84 = objc_opt_class();
              long long v85 = [(id)objc_opt_class() summaryKeyForMultiValueModifyOfPropertyKey:v59];
              [v84 _addObject:v83 forKey:v85 toDiff:v3];
            }
            uint64_t v80 = [v78 countByEnumeratingWithState:&v101 objects:v137 count:16];
          }
          while (v80);
        }

        id v58 = v100 + 1;
      }
      while (v100 + 1 != (char *)v98);
      uint64_t v98 = [v94 countByEnumeratingWithState:&v113 objects:v140 count:16];
    }
    while (v98);
  }

  return v3;
}

+ (void)_addObject:(id)a3 forKey:(id)a4 toDiff:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 objectForKey:v7];

  if (v9)
  {
    uint64_t v10 = [v8 objectForKey:v7];
    [v10 addObject:v11];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA80] setWithObject:v11];
    [v8 setObject:v10 forKey:v7];
  }
}

+ (id)summaryKeyForChangedProperty:(id)a3 subProperty:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@.%@", a3, a4];
}

+ (id)_summaryKeyForMultiValueChange:(id)a3 ofPropertyKey:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@.%@", a4, a3];
}

+ (id)summaryKeyForMultiValueAddOfPropertyKey:(id)a3
{
  return (id)[a1 _summaryKeyForMultiValueChange:@"add" ofPropertyKey:a3];
}

+ (id)summaryKeyForMultiValueRemoveOfPropertyKey:(id)a3
{
  return (id)[a1 _summaryKeyForMultiValueChange:@"remove" ofPropertyKey:a3];
}

+ (id)summaryKeyForMultiValueModifyOfPropertyKey:(id)a3
{
  return (id)[a1 _summaryKeyForMultiValueChange:@"modify" ofPropertyKey:a3];
}

- (id)summaryString
{
  id v3 = [(EKDiff *)self firstObject];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28E78] string];
    uint64_t v5 = [(EKDiff *)self firstObject];
    uint64_t v6 = [(EKDiff *)self secondObject];
    [(EKDiff *)self _summarizeDiffsBetweenFirstObject:v5 secondObject:v6 mutableString:v4 depth:0];

    [v4 appendString:@"\n-------------------------\n"];
    id v7 = [(EKDiff *)self secondObject];
    id v8 = [(EKDiff *)self firstObject];
    [(EKDiff *)self _summarizeDiffsBetweenFirstObject:v7 secondObject:v8 mutableString:v4 depth:0];
  }
  else
  {
    uint64_t v9 = NSString;
    id v7 = [(EKDiff *)self secondObject];
    id v4 = [v9 stringWithFormat:@"No object for comparison, %@ is entirely different", v7];
  }

  return v4;
}

- (void)_summarizeDiffsBetweenFirstObject:(id)a3 secondObject:(id)a4 mutableString:(id)a5 depth:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v12 _basicSummaryWithDepth:a6];
  [v10 appendString:v13];

  uint64_t v14 = objc_opt_class();
  long long v15 = [(EKDiff *)self differentSingleValueKeys];
  uint64_t v16 = [v15 allObjects];
  [v14 _addSummaryWithDepth:a6 toMutableString:v10 forSingleValueKeys:v16 firstObject:v12 secondObject:v11];

  long long v17 = objc_opt_class();
  long long v18 = [(EKDiff *)self differentIdentityKeys];
  uint64_t v19 = [v18 allObjects];
  [v17 _addSummaryWithDepth:a6 toMutableString:v10 forSingleValueKeys:v19 firstObject:v12 secondObject:v11];

  uint64_t v20 = objc_opt_class();
  uint64_t v21 = [(EKDiff *)self differentImmutableKeys];
  uint64_t v22 = [v21 allObjects];
  [v20 _addSummaryWithDepth:a6 toMutableString:v10 forSingleValueKeys:v22 firstObject:v12 secondObject:v11];

  uint64_t v23 = objc_opt_class();
  char v24 = [(EKDiff *)self differentRelationshipSingleValueKeys];
  uint64_t v25 = [v24 allObjects];
  [v23 _addSummaryWithDepth:a6 toMutableString:v10 forRelationshipSingleValueKeys:v25 firstObject:v12 secondObject:v11];

  uint64_t v26 = objc_opt_class();
  id v28 = [(EKDiff *)self differentRelationshipMultiValueKeys];
  uint64_t v27 = [v28 allObjects];
  [v26 _addSummaryWithDepth:a6 toMutableString:v10 forRelationshipMultiValueKeys:v27 firstObject:v12 secondObject:v11];
}

+ (void)_addSummaryWithDepth:(int64_t)a3 toMutableString:(id)a4 forSingleValueKeys:(id)a5 firstObject:(id)a6 secondObject:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v12 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v21 = v12;
    id obj = v12;
    uint64_t v14 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * v17);
          [v11 appendString:@"\n"];
          uint64_t v19 = [(id)objc_opt_class() _addChangeStarIfChangedKey:v18 onObject:v13];
          [a1 _addPaddedHeaderToMutableString:v11 forKey:v19 withDepth:a3];
          uint64_t v20 = [v13 valueForKey:v18];
          [v11 appendFormat:@"%@", v20];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }

    id v12 = v21;
  }
}

+ (void)_addSummaryWithDepth:(int64_t)a3 toMutableString:(id)a4 forRelationshipSingleValueKeys:(id)a5 firstObject:(id)a6 secondObject:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v11;
  uint64_t v29 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v29)
  {
    uint64_t v26 = *(void *)v31;
    int64_t v24 = a3 + 4;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8 * v14);
        [v10 appendString:@"\n"];
        [a1 _addPaddedHeaderToMutableString:v10 forKey:v15 withDepth:a3];
        uint64_t v16 = [v12 valueForKey:v15];
        uint64_t v17 = [v13 valueForKey:v15];
        uint64_t v18 = [v12 eventStore];
        uint64_t v19 = [v16 meltedObjectInStore:v18];

        uint64_t v20 = [v13 eventStore];
        id v21 = [v17 meltedObjectInStore:v20];

        if (!v16)
        {
          [v10 appendString:@"(null)"];
          goto LABEL_13;
        }
        if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "meltedClass"), "isWeakRelationObject:forKey:", v16, v15))
        {
          uint64_t v22 = [v16 uniqueIdentifier];
          [v10 appendFormat:@"<weak relation: %@>", v22];
LABEL_12:

          goto LABEL_13;
        }
        if (v13)
        {
          uint64_t v22 = [v19 diffWithObject:v21];
          [v22 _summarizeDiffsBetweenFirstObject:v19 secondObject:v21 mutableString:v10 depth:v24];
          goto LABEL_12;
        }
        [v19 _addSummaryWithDepth:v24 toMutableString:v10 indentFirstLine:0];
LABEL_13:

        ++v14;
      }
      while (v29 != v14);
      uint64_t v23 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v29 = v23;
    }
    while (v23);
  }
}

+ (void)_addSummaryWithDepth:(int64_t)a3 toMutableString:(id)a4 forRelationshipMultiValueKeys:(id)a5 firstObject:(id)a6 secondObject:(id)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v13;
  uint64_t v15 = [v13 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v43;
    int64_t v18 = a3 + 8;
    int64_t v33 = a3;
    id v34 = a7;
    uint64_t v31 = *(void *)v43;
    id v32 = a1;
    do
    {
      uint64_t v19 = 0;
      uint64_t v35 = v16;
      do
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v42 + 1) + 8 * v19);
        [v12 appendString:@"\n"];
        [a1 _addPaddedHeaderToMutableString:v12 forKey:v20 withDepth:a3];
        uint64_t v37 = v19;
        if (a7)
        {
          id v21 = [NSString stringWithFormat:@"There is a difference for the multi-valued key: %@", v20];
          [v12 appendString:v21];
        }
        else
        {
          uint64_t v22 = [v14 valueForKey:v20];
          uint64_t v23 = v22;
          if (!v22 || ![v22 count]) {
            [v12 appendString:@"(null)"];
          }
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v21 = v23;
          uint64_t v24 = [v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v39;
            do
            {
              uint64_t v27 = 0;
              do
              {
                if (*(void *)v39 != v26) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v28 = *(void **)(*((void *)&v38 + 1) + 8 * v27);
                uint64_t v29 = [v14 eventStore];
                long long v30 = [v28 meltedObjectInStore:v29];

                [v12 appendString:@"\n"];
                if (v28) {
                  [v30 _addSummaryWithDepth:v18 toMutableString:v12 indentFirstLine:1];
                }
                else {
                  [v12 appendString:@"(null)"];
                }

                ++v27;
              }
              while (v25 != v27);
              uint64_t v25 = [v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
            }
            while (v25);
          }

          a3 = v33;
          a7 = v34;
          uint64_t v17 = v31;
          a1 = v32;
          uint64_t v16 = v35;
        }

        uint64_t v19 = v37 + 1;
      }
      while (v37 + 1 != v16);
      uint64_t v16 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v16);
  }
}

+ (void)_addPaddedHeaderToMutableString:(id)a3 forKey:(id)a4 withDepth:(int64_t)a5
{
  int64_t v7 = a5 + 4;
  id v8 = a4;
  id v9 = a3;
  id v10 = [a1 _indentStringAtDepth:v7];
  [v9 appendString:v10];

  id v11 = [v8 stringByPaddingToLength:20 withString:@" " startingAtIndex:0];

  [v9 appendFormat:@"%@: ", v11];
}

+ (id)_addChangeStarIfChangedKey:(id)a3 onObject:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 changeSet];
  int v7 = [v6 hasUnsavedChangeForKey:v5];

  if (v7)
  {
    id v8 = [NSString stringWithFormat:@"* %@", v5];
  }
  else
  {
    id v8 = v5;
  }
  id v9 = v8;

  return v9;
}

+ (id)_indentStringAtDepth:(int64_t)a3
{
  return (id)[&stru_1EF932508 stringByPaddingToLength:a3 withString:@" " startingAtIndex:0];
}

- (id)copyOfObject:(id)a3 alreadyCopiedObjects:(id)a4 madeNewCopy:(BOOL *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 objectID];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];
  if (v10)
  {
    id v11 = (void *)v10;
    if (a5) {
      *a5 = 0;
    }
  }
  else
  {
    if (a5) {
      *a5 = 1;
    }
    id v11 = (void *)[v7 copy];
    [v8 setObject:v11 forKeyedSubscript:v9];
  }

  return v11;
}

- (id)changeSetForDiff
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  v70 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v3 = [(EKDiff *)self differentSingleValueKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v84 objects:v91 count:16];
  unint64_t v5 = 0x1E4F1C000uLL;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v85 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v84 + 1) + 8 * i);
        uint64_t v10 = [(EKDiff *)self secondObject];
        id v11 = [v10 valueForKey:v9];
        id v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          id v13 = [MEMORY[0x1E4F1CA98] null];
        }
        id v14 = v13;

        [v70 setObject:v14 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v84 objects:v91 count:16];
    }
    while (v6);
  }

  uint64_t v15 = objc_opt_new();
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = [(EKDiff *)self differentRelationshipSingleValueKeys];
  uint64_t v68 = [obj countByEnumeratingWithState:&v80 objects:v90 count:16];
  if (v68)
  {
    uint64_t v16 = *(void *)v81;
    uint64_t v64 = *(void *)v81;
    do
    {
      for (uint64_t j = 0; j != v68; ++j)
      {
        if (*(void *)v81 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v80 + 1) + 8 * j);
        uint64_t v19 = [(EKDiff *)self relationshipSingleValueModifies];
        uint64_t v20 = [v19 objectForKeyedSubscript:v18];

        id v21 = [*(id *)(v5 + 2712) null];
        char v22 = [v20 isEqual:v21];

        if (v22)
        {
          uint64_t v23 = [(EKDiff *)self secondObject];
          uint64_t v24 = [v23 valueForKey:v18];
          uint64_t v25 = v24;
          if (v24)
          {
            id v26 = v24;
          }
          else
          {
            id v26 = [*(id *)(v5 + 2712) null];
          }
          uint64_t v35 = v26;

          [v70 setObject:v35 forKeyedSubscript:v18];
        }
        else
        {
          unint64_t v27 = v5;
          char v79 = 0;
          uint64_t v28 = [(EKDiff *)self secondObject];
          uint64_t v29 = [v28 valueForKey:v18];

          long long v30 = [(EKDiff *)self secondObject];
          uint64_t v31 = [v30 eventStore];
          id v32 = [v29 meltedObjectInStore:v31];

          id v33 = [(EKDiff *)self copyOfObject:v32 alreadyCopiedObjects:v15 madeNewCopy:&v79];
          if (v79)
          {
            id v34 = [v20 changeSetForDiff];
            [v33 addChanges:v34];
          }
          [v70 setObject:v33 forKeyedSubscript:v18];

          unint64_t v5 = v27;
          uint64_t v16 = v64;
        }
      }
      uint64_t v68 = [obj countByEnumeratingWithState:&v80 objects:v90 count:16];
    }
    while (v68);
  }

  v36 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v37 = [(EKDiff *)self relationshipMultiValueAdds];
  long long v38 = [v36 dictionaryWithDictionary:v37];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v60 = [(EKDiff *)self relationshipMultiValueModifies];
  uint64_t v63 = [v60 countByEnumeratingWithState:&v75 objects:v89 count:16];
  if (v63)
  {
    uint64_t v61 = *(void *)v76;
    uint64_t v62 = v38;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v76 != v61) {
          objc_enumerationMutation(v60);
        }
        long long v40 = *(void **)(*((void *)&v75 + 1) + 8 * v39);
        long long v41 = [v38 objectForKeyedSubscript:v40];
        long long v42 = v41;
        uint64_t v69 = v39;
        if (v41)
        {
          id v43 = v41;
        }
        else
        {
          id v43 = [MEMORY[0x1E4F1CA80] set];
        }
        long long v44 = v43;

        long long v45 = [(EKDiff *)self relationshipMultiValueModifies];
        id obja = v40;
        uint64_t v46 = [v45 objectForKeyedSubscript:v40];

        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v65 = v46;
        uint64_t v47 = [v46 allValues];
        uint64_t v48 = [v47 countByEnumeratingWithState:&v71 objects:v88 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v72;
          do
          {
            for (uint64_t k = 0; k != v49; ++k)
            {
              if (*(void *)v72 != v50) {
                objc_enumerationMutation(v47);
              }
              uint64_t v52 = *(void **)(*((void *)&v71 + 1) + 8 * k);
              char v79 = 0;
              long long v53 = [v52 secondObject];
              id v54 = [(EKDiff *)self copyOfObject:v53 alreadyCopiedObjects:v15 madeNewCopy:&v79];

              if (v79)
              {
                v55 = [v52 changeSetForDiff];
                [v54 addChanges:v55];
              }
              [v44 addObject:v54];
            }
            uint64_t v49 = [v47 countByEnumeratingWithState:&v71 objects:v88 count:16];
          }
          while (v49);
        }

        long long v38 = v62;
        [v62 setObject:v44 forKeyedSubscript:obja];

        uint64_t v39 = v69 + 1;
      }
      while (v69 + 1 != v63);
      uint64_t v63 = [v60 countByEnumeratingWithState:&v75 objects:v89 count:16];
    }
    while (v63);
  }

  char v56 = [EKChangeSet alloc];
  uint64_t v57 = [(EKDiff *)self relationshipMultiValueRemoves];
  id v58 = [(EKChangeSet *)v56 initWithSingleValueChanges:v70 multiValueAdditions:v38 multiValueRemovals:v57];

  return v58;
}

- (EKObject)firstObject
{
  return self->_firstObject;
}

- (void)setFirstObject:(id)a3
{
}

- (EKObject)secondObject
{
  return self->_secondObject;
}

- (void)setSecondObject:(id)a3
{
}

- (int)result
{
  return self->_result;
}

- (void)setResult:(int)a3
{
  self->_result = a3;
}

- (NSSet)differentIdentityKeys
{
  return self->_differentIdentityKeys;
}

- (void)setDifferentIdentityKeys:(id)a3
{
}

- (NSSet)differentImmutableKeys
{
  return self->_differentImmutableKeys;
}

- (void)setDifferentImmutableKeys:(id)a3
{
}

- (NSSet)differentSingleValueKeys
{
  return self->_differentSingleValueKeys;
}

- (void)setDifferentSingleValueKeys:(id)a3
{
}

- (NSSet)differentRelationshipSingleValueKeys
{
  return self->_differentRelationshipSingleValueKeys;
}

- (void)setDifferentRelationshipSingleValueKeys:(id)a3
{
}

- (NSSet)differentRelationshipMultiValueKeys
{
  return self->_differentRelationshipMultiValueKeys;
}

- (void)setDifferentRelationshipMultiValueKeys:(id)a3
{
}

- (NSDictionary)relationshipMultiValueAdds
{
  return self->_relationshipMultiValueAdds;
}

- (void)setRelationshipMultiValueAdds:(id)a3
{
}

- (NSDictionary)relationshipMultiValueRemoves
{
  return self->_relationshipMultiValueRemoves;
}

- (void)setRelationshipMultiValueRemoves:(id)a3
{
}

- (NSDictionary)relationshipMultiValueModifies
{
  return self->_relationshipMultiValueModifies;
}

- (void)setRelationshipMultiValueModifies:(id)a3
{
}

- (NSDictionary)relationshipSingleValueModifies
{
  return self->_relationshipSingleValueModifies;
}

- (void)setRelationshipSingleValueModifies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipSingleValueModifies, 0);
  objc_storeStrong((id *)&self->_relationshipMultiValueModifies, 0);
  objc_storeStrong((id *)&self->_relationshipMultiValueRemoves, 0);
  objc_storeStrong((id *)&self->_relationshipMultiValueAdds, 0);
  objc_storeStrong((id *)&self->_differentRelationshipMultiValueKeys, 0);
  objc_storeStrong((id *)&self->_differentRelationshipSingleValueKeys, 0);
  objc_storeStrong((id *)&self->_differentSingleValueKeys, 0);
  objc_storeStrong((id *)&self->_differentImmutableKeys, 0);
  objc_storeStrong((id *)&self->_differentIdentityKeys, 0);
  objc_storeStrong((id *)&self->_secondObject, 0);

  objc_storeStrong((id *)&self->_firstObject, 0);
}

+ (void)diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "One or both objects are nil.", v2, v3, v4, v5, v6);
}

+ (void)diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Objects have different identities.  Diff finished", v2, v3, v4, v5, v6);
}

+ (void)diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Objects have different values.  Diff finished", v2, v3, v4, v5, v6);
}

+ (void)diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Objects are of different classes.  Diff finished", v2, v3, v4, v5, v6);
}

+ (void)diffBetweenObject:(uint64_t)a1 andObject:(uint64_t)a2 compareUIVisiblePropertiesOnly:(os_log_t)log .cold.5(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1A4E47000, log, OS_LOG_TYPE_DEBUG, "Computing diff between %@ and %@", (uint8_t *)&v3, 0x16u);
}

+ (void)_populateSingleValueKeysForDiff:(void *)a1 compareUIVisiblePropertiesOnly:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  int v3 = [(id)OUTLINED_FUNCTION_5() differentSingleValueKeys];
  v4[0] = 67109120;
  v4[1] = [v3 count] != 0;
  _os_log_debug_impl(&dword_1A4E47000, v1, OS_LOG_TYPE_DEBUG, "Single value differences? [%d]", (uint8_t *)v4, 8u);
}

+ (void)_populateSingleValueKeysForDiff:compareUIVisiblePropertiesOnly:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Computing single value differences.", v2, v3, v4, v5, v6);
}

+ (void)_populateSingleValueRelationshipKeysForDiff:(void *)a1 compareUIVisiblePropertiesOnly:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() differentRelationshipSingleValueKeys];
  [v3 count];
  uint64_t v4 = [(id)OUTLINED_FUNCTION_4() differentRelationshipSingleValueKeys];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1A4E47000, v5, v6, "Single value relationship differences? [%d] - %@", v7, v8, v9, v10, v11);
}

+ (void)_populateSingleValueRelationshipKeysForDiff:compareUIVisiblePropertiesOnly:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Computing single value relationship differences.", v2, v3, v4, v5, v6);
}

+ (void)_populateMultiValueRelationshipKeysForDiff:(void *)a1 compareUIVisiblePropertiesOnly:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() differentRelationshipMultiValueKeys];
  [v3 count];
  uint64_t v4 = [(id)OUTLINED_FUNCTION_4() differentRelationshipMultiValueKeys];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1A4E47000, v5, v6, "Multi value relationship differences? [%d] - %@", v7, v8, v9, v10, v11);
}

+ (void)_populateMultiValueRelationshipKeysForDiff:compareUIVisiblePropertiesOnly:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Computing multi value relationship differences.", v2, v3, v4, v5, v6);
}

+ (void)_populateIdentityKeysForDiff:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() differentIdentityKeys];
  [v3 count];
  uint64_t v4 = [(id)OUTLINED_FUNCTION_4() differentIdentityKeys];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1A4E47000, v5, v6, "Identity differences? [%d] - %@", v7, v8, v9, v10, v11);
}

+ (void)_populateIdentityKeysForDiff:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Computing identity differences.", v2, v3, v4, v5, v6);
}

+ (void)_populateImmutableKeysForDiff:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() differentImmutableKeys];
  [v3 count];
  uint64_t v4 = [(id)OUTLINED_FUNCTION_4() differentImmutableKeys];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1A4E47000, v5, v6, "Immutable differences? [%d] - %@", v7, v8, v9, v10, v11);
}

+ (void)_populateImmutableKeysForDiff:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Computing immutable differences.", v2, v3, v4, v5, v6);
}

@end