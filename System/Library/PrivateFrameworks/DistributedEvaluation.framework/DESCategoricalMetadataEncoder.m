@interface DESCategoricalMetadataEncoder
- (BOOL)useRange;
- (DESCategoricalMetadataEncoder)initWithSingleSchema:(id)a3;
- (id)encodeNumber:(id)a3 toLength:(unint64_t)a4;
- (id)encodeNumberVector:(id)a3 toLength:(unint64_t)a4;
- (id)encodeString:(id)a3 toLength:(unint64_t)a4;
- (id)encodeStringVector:(id)a3 toLength:(unint64_t)a4;
- (id)zeroWithLength:(unint64_t)a3;
- (unint64_t)findBucketIndexOfNumber:(id)a3 inItems:(id)a4;
- (unint64_t)findBucketIndexOfString:(id)a3 inItems:(id)a4;
@end

@implementation DESCategoricalMetadataEncoder

- (DESCategoricalMetadataEncoder)initWithSingleSchema:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DESCategoricalMetadataEncoder;
  v6 = [(DESCategoricalMetadataEncoder *)&v16 init];
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"range"];
  if (!v7)
  {
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v8 = (void *)v7;
  v9 = [v5 objectForKeyedSubscript:@"range"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  v10 = [v5 objectForKeyedSubscript:@"items"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  v11 = [v5 objectForKeyedSubscript:@"items"];
  uint64_t v12 = [v11 count];

  if (!v12) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v6->_schemaDict, a3);
  v13 = [(NSDictionary *)v6->_schemaDict objectForKeyedSubscript:@"range"];
  v6->_useRange = [v13 BOOLValue];

LABEL_7:
  v14 = v6;
LABEL_11:

  return v14;
}

- (id)encodeString:(id)a3 toLength:(unint64_t)a4
{
  v6 = (void *)MEMORY[0x1E4F1CA58];
  id v7 = a3;
  id v8 = [v6 dataWithLength:a4];
  uint64_t v9 = [v8 mutableBytes];
  v10 = [(NSDictionary *)self->_schemaDict objectForKeyedSubscript:@"items"];
  unint64_t v11 = [(DESCategoricalMetadataEncoder *)self findBucketIndexOfString:v7 inItems:v10];

  if (v11 >= a4 - 1 || v11 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = v11 + 1;
  }
  *(unsigned char *)(v9 + v13) = 1;

  return v8;
}

- (id)encodeNumber:(id)a3 toLength:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA58] dataWithLength:a4];
  uint64_t v8 = [v7 mutableBytes];
  [(NSDictionary *)self->_schemaDict objectForKeyedSubscript:@"items"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "floatValue", (void)v17);
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  [v6 floatValue];
  unint64_t v13 = [(DESCategoricalMetadataEncoder *)self findBucketIndexOfNumber:v6 inItems:v9];
  if (v13 >= a4 - 1 || v13 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v15 = 0;
  }
  else {
    unint64_t v15 = v13 + 1;
  }
  *(unsigned char *)(v8 + v15) = 1;

  return v7;
}

- (id)encodeStringVector:(id)a3 toLength:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v19 = [MEMORY[0x1E4F1CA58] dataWithLength:a4];
  uint64_t v7 = [v19 mutableBytes];
  uint64_t v8 = [(NSDictionary *)self->_schemaDict objectForKeyedSubscript:@"items"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    unint64_t v13 = a4 - 1;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v15 = [(DESCategoricalMetadataEncoder *)self findBucketIndexOfString:*(void *)(*((void *)&v20 + 1) + 8 * i) inItems:v8];
        if (v15 >= v13 || v15 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v17 = 0;
        }
        else {
          unint64_t v17 = v15 + 1;
        }
        *(unsigned char *)(v7 + v17) = 1;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  return v19;
}

- (id)encodeNumberVector:(id)a3 toLength:(unint64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA58] dataWithLength:a4];
  uint64_t v25 = [v7 mutableBytes];
  v26 = self;
  [(NSDictionary *)self->_schemaDict objectForKeyedSubscript:@"items"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  id v24 = v7;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * i) floatValue];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v10);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    unint64_t v17 = a4 - 1;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        id v19 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        [v19 floatValue];
        unint64_t v20 = [(DESCategoricalMetadataEncoder *)v26 findBucketIndexOfNumber:v19 inItems:v8];
        if (v20 >= v17 || v20 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v22 = 0;
        }
        else {
          unint64_t v22 = v20 + 1;
        }
        *(unsigned char *)(v25 + v22) = 1;
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v15);
  }

  return v24;
}

- (id)zeroWithLength:(unint64_t)a3
{
  return (id)[MEMORY[0x1E4F1CA58] dataWithLength:a3];
}

- (unint64_t)findBucketIndexOfString:(id)a3 inItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(DESCategoricalMetadataEncoder *)self useRange]) {
    uint64_t v8 = objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v7, "count"), 256, &__block_literal_global_2);
  }
  else {
    uint64_t v8 = [v7 indexOfObject:v6];
  }
  unint64_t v9 = v8;

  return v9;
}

uint64_t __65__DESCategoricalMetadataEncoder_findBucketIndexOfString_inItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if ([a2 compare:a3 options:64] == -1) {
    return -1;
  }
  else {
    return 0;
  }
}

- (unint64_t)findBucketIndexOfNumber:(id)a3 inItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(DESCategoricalMetadataEncoder *)self useRange])
  {
    unint64_t v8 = objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v7, "count"), 256, &__block_literal_global_4);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__DESCategoricalMetadataEncoder_findBucketIndexOfNumber_inItems___block_invoke_2;
    v10[3] = &unk_1E63C1AE0;
    id v11 = v6;
    unint64_t v8 = [v7 indexOfObjectPassingTest:v10];
  }
  return v8;
}

uint64_t __65__DESCategoricalMetadataEncoder_findBucketIndexOfNumber_inItems___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "compare:") == -1) {
    return -1;
  }
  else {
    return 0;
  }
}

BOOL __65__DESCategoricalMetadataEncoder_findBucketIndexOfNumber_inItems___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 floatValue];
  float v4 = v3;
  [*(id *)(a1 + 32) floatValue];

  return almostEqual(v4, v5);
}

- (BOOL)useRange
{
  return self->_useRange;
}

- (void).cxx_destruct
{
}

@end