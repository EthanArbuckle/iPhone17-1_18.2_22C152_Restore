@interface PHSearchQueryQUToken
+ (BOOL)_isSupportedEntityCategoryType:(unint64_t)a3;
+ (BOOL)isGenericLocation:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_supportedEntityCategoryTypes;
+ (id)entityCategoryTypeKeyForEntityTypeCategory:(unint64_t)a3;
- (BOOL)hasMemoryGenAnnotation;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)metadata;
- (NSIndexSet)entityCategoryTypes;
- (NSString)text;
- (PHSearchQueryQUToken)initWithCoder:(id)a3;
- (PHSearchQueryQUToken)initWithText:(id)a3 entityCategoryTypes:(id)a4 metadata:(id)a5;
- (id)description;
- (id)jsonDictionary;
- (id)metadataForCategoryType:(unint64_t)a3;
- (unint64_t)ambiguityType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PHSearchQueryQUToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_entityCategoryTypes, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSIndexSet)entityCategoryTypes
{
  return self->_entityCategoryTypes;
}

- (NSString)text
{
  return self->_text;
}

- (id)jsonDictionary
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __38__PHSearchQueryQUToken_jsonDictionary__block_invoke;
  v34[3] = &unk_1E5847D40;
  id v5 = v3;
  id v35 = v5;
  [v4 enumerateIndexesUsingBlock:v34];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = [(PHSearchQueryQUToken *)self text];
  [v6 setObject:v7 forKeyedSubscript:@"query_term"];

  [v6 setObject:v5 forKeyedSubscript:@"entity_category_types"];
  unint64_t v8 = [(PHSearchQueryQUToken *)self ambiguityType];
  v9 = @"PHSearchAmbiguityTypeNone";
  if (v8 == 1) {
    v9 = @"PHSearchAmbiguityTypePartiallyAmbiguous";
  }
  if (v8 == 2) {
    v9 = @"PHSearchAmbiguityTypeFullyAmbiguous";
  }
  v10 = v9;
  [v6 setObject:v10 forKeyedSubscript:@"ambiguity_type"];

  v11 = +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:1];
  v12 = [(PHSearchQueryQUToken *)self metadata];
  v13 = [v12 objectForKeyedSubscript:v11];

  if ([v13 count])
  {
    v27 = v11;
    v28 = self;
    id v29 = v5;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          id v21 = objc_alloc_init(MEMORY[0x1E4F28C10]);
          [v21 setDateFormat:@"yyyy-MM-dd HH:mm"];
          v22 = [v21 stringFromDate:v20];
          [v14 addObject:v22];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v17);
    }

    v23 = [(PHSearchQueryQUToken *)v28 metadata];
    v24 = (void *)[v23 mutableCopy];

    v11 = v27;
    [v24 setObject:v14 forKeyedSubscript:v27];
    [v6 setObject:v24 forKeyedSubscript:@"metadata"];

    id v5 = v29;
  }
  else
  {
    id v14 = [(PHSearchQueryQUToken *)self metadata];
    [v6 setObject:v14 forKeyedSubscript:@"metadata"];
  }

  v25 = (void *)[v6 copy];

  return v25;
}

void __38__PHSearchQueryQUToken_jsonDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) > 0x11) {
    id v3 = @"PHSearchEntityCategoryTypeUndefined";
  }
  else {
    id v3 = off_1E5841E10[a2 - 1];
  }
  v4 = v3;
  [*(id *)(a1 + 32) addObject:v4];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __35__PHSearchQueryQUToken_description__block_invoke;
  v14[3] = &unk_1E5847D40;
  id v15 = v3;
  id v5 = v3;
  [v4 enumerateIndexesUsingBlock:v14];

  id v6 = NSString;
  v7 = [(PHSearchQueryQUToken *)self text];
  unint64_t v8 = [(PHSearchQueryQUToken *)self metadata];
  unint64_t v9 = [(PHSearchQueryQUToken *)self ambiguityType];
  v10 = @"PHSearchAmbiguityTypeNone";
  if (v9 == 1) {
    v10 = @"PHSearchAmbiguityTypePartiallyAmbiguous";
  }
  if (v9 == 2) {
    v10 = @"PHSearchAmbiguityTypeFullyAmbiguous";
  }
  v11 = v10;
  v12 = [v6 stringWithFormat:@"text: %@, metadata: %@, entityCategories: %@, ambiguity: %@", v7, v8, v5, v11];

  return v12;
}

void __35__PHSearchQueryQUToken_description__block_invoke(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) > 0x11) {
    id v3 = @"PHSearchEntityCategoryTypeUndefined";
  }
  else {
    id v3 = off_1E5841E10[a2 - 1];
  }
  v4 = v3;
  [*(id *)(a1 + 32) addObject:v4];
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"PHSearchQueryDisambiguationPropertyText"];
  [v5 encodeObject:self->_entityCategoryTypes forKey:@"PHSearchQueryDisambiguationPropertyEntityCategoryTypes"];
  [v5 encodeObject:self->_metadata forKey:@"PHSearchQueryDisambiguationPropertyMetadata"];
}

- (PHSearchQueryQUToken)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchQueryDisambiguationPropertyText"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchQueryDisambiguationPropertyEntityCategoryTypes"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"PHSearchQueryDisambiguationPropertyMetadata"];

  v13 = [(PHSearchQueryQUToken *)self initWithText:v5 entityCategoryTypes:v6 metadata:v12];
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PHSearchQueryQUToken *)a3;
  if (v4 == self)
  {
    char v20 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(PHSearchQueryQUToken *)self text];
      v7 = [(PHSearchQueryQUToken *)v5 text];
      int v8 = [v6 isEqualToString:v7];

      if (v8)
      {
        uint64_t v9 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
        if (v9
          && ([(PHSearchQueryQUToken *)v5 entityCategoryTypes],
              (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v11 = (void *)v10;
          v12 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
          v13 = [(PHSearchQueryQUToken *)v5 entityCategoryTypes];
          char v14 = [v12 isEqualToIndexSet:v13];

          if (v14)
          {
LABEL_7:
            id v15 = [(PHSearchQueryQUToken *)self metadata];
            if (v15
              && ([(PHSearchQueryQUToken *)v5 metadata], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              uint64_t v17 = (void *)v16;
              uint64_t v18 = [(PHSearchQueryQUToken *)self metadata];
              v19 = [(PHSearchQueryQUToken *)v5 metadata];
              char v20 = [v18 isEqualToDictionary:v19];
            }
            else
            {
              uint64_t v17 = [(PHSearchQueryQUToken *)self metadata];
              uint64_t v18 = [(PHSearchQueryQUToken *)v5 metadata];
              char v20 = v17 == v18;
            }

            goto LABEL_18;
          }
        }
        else
        {
          id v21 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
          v22 = [(PHSearchQueryQUToken *)v5 entityCategoryTypes];

          if (v9) {
          if (v21 == v22)
          }
            goto LABEL_7;
        }
      }
      char v20 = 0;
LABEL_18:

      goto LABEL_19;
    }
    char v20 = 0;
  }
LABEL_19:

  return v20;
}

- (BOOL)hasMemoryGenAnnotation
{
  v2 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
  if (([v2 containsIndex:5] & 1) != 0
    || ([v2 containsIndex:6] & 1) != 0
    || ([v2 containsIndex:7] & 1) != 0
    || ([v2 containsIndex:11] & 1) != 0
    || ([v2 containsIndex:12] & 1) != 0
    || ([v2 containsIndex:8] & 1) != 0
    || ([v2 containsIndex:10] & 1) != 0
    || ([v2 containsIndex:9] & 1) != 0
    || ([v2 containsIndex:13] & 1) != 0
    || ([v2 containsIndex:14] & 1) != 0
    || ([v2 containsIndex:15] & 1) != 0
    || ([v2 containsIndex:17] & 1) != 0
    || ([v2 containsIndex:18] & 1) != 0)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = [v2 containsIndex:16];
  }

  return v3;
}

- (id)metadataForCategoryType:(unint64_t)a3
{
  id v4 = [(id)objc_opt_class() entityCategoryTypeKeyForEntityTypeCategory:a3];
  id v5 = [(PHSearchQueryQUToken *)self metadata];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (unint64_t)ambiguityType
{
  if (![(PHSearchQueryQUToken *)self hasMemoryGenAnnotation]
    || ([(PHSearchQueryQUToken *)self entityCategoryTypes],
        char v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        v4 != 1))
  {
    id v6 = [(PHSearchQueryQUToken *)self metadata];
    if ([v6 count])
    {
      v7 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        uint64_t v49 = 0;
        v50 = &v49;
        uint64_t v51 = 0x2020000000;
        uint64_t v52 = 2;
        uint64_t v45 = 0;
        v46 = &v45;
        uint64_t v47 = 0x2020000000;
        uint64_t v48 = 2;
        uint64_t v41 = 0;
        v42 = &v41;
        uint64_t v43 = 0x2020000000;
        uint64_t v44 = 2;
        uint64_t v37 = 0;
        v38 = &v37;
        uint64_t v39 = 0x2020000000;
        uint64_t v40 = 2;
        uint64_t v33 = 0;
        v34 = &v33;
        uint64_t v35 = 0x2020000000;
        char v36 = 0;
        uint64_t v9 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __37__PHSearchQueryQUToken_ambiguityType__block_invoke;
        v32[3] = &unk_1E5842CC0;
        v32[4] = self;
        v32[5] = &v33;
        v32[6] = &v49;
        v32[7] = &v45;
        v32[8] = &v41;
        v32[9] = &v37;
        [v9 enumerateIndexesUsingBlock:v32];

        if (!*((unsigned char *)v34 + 24))
        {
          if ([(PHSearchQueryQUToken *)self hasMemoryGenAnnotation]) {
            unint64_t v5 = 1;
          }
          else {
            unint64_t v5 = 2;
          }
          goto LABEL_35;
        }
        uint64_t v10 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
        unint64_t v11 = [v10 count];

        if (v11 < 2)
        {
          v19 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
          int v20 = [v19 containsIndex:2];

          if (v20)
          {
            id v21 = v50;
LABEL_32:
            unint64_t v5 = v21[3];
            goto LABEL_35;
          }
          v22 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
          int v23 = [v22 containsIndex:3];

          if (!v23)
          {
            v27 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
            int v28 = [v27 containsIndex:1];

            if (v28)
            {
              id v21 = v38;
            }
            else
            {
              id v29 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
              int v30 = [v29 containsIndex:4];

              if (!v30)
              {
                unint64_t v5 = 2;
                goto LABEL_35;
              }
              id v21 = v42;
            }
            goto LABEL_32;
          }
        }
        else
        {
          if (![(PHSearchQueryQUToken *)self hasMemoryGenAnnotation]) {
            goto LABEL_34;
          }
          v12 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
          if (([v12 containsIndex:3] & 1) == 0)
          {

            goto LABEL_24;
          }
          v13 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
          int v14 = [v13 containsIndex:13];

          if (!v14) {
            goto LABEL_24;
          }
          id v15 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
          uint64_t v16 = [v15 count];

          if (v16 != 2)
          {
            uint64_t v17 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
            unint64_t v18 = [v17 count];

            if (v18 > 2) {
              goto LABEL_34;
            }
LABEL_24:
            if (!v50[3])
            {
              v24 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
              if ([v24 containsIndex:2])
              {
                v25 = [(PHSearchQueryQUToken *)self entityCategoryTypes];
                char v26 = [v25 containsIndex:14];

                if (v26)
                {
                  unint64_t v5 = 0;
LABEL_35:
                  _Block_object_dispose(&v33, 8);
                  _Block_object_dispose(&v37, 8);
                  _Block_object_dispose(&v41, 8);
                  _Block_object_dispose(&v45, 8);
                  _Block_object_dispose(&v49, 8);
                  return v5;
                }
              }
              else
              {
              }
            }
LABEL_34:
            unint64_t v5 = 1;
            goto LABEL_35;
          }
        }
        id v21 = v46;
        goto LABEL_32;
      }
    }
    else
    {
    }
    return 2;
  }
  return 0;
}

void __37__PHSearchQueryQUToken_ambiguityType__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) metadataForCategoryType:a2];
  id v23 = v4;
  switch(a2)
  {
    case 1:
      id v5 = v4;
      id v6 = v5;
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(unsigned char *)(v7 + 24))
      {
        BOOL v8 = 1;
      }
      else
      {
        BOOL v8 = [v5 count] == 2;
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      }
      *(unsigned char *)(v7 + 24) = v8;
      if ([v6 count] != 2) {
        goto LABEL_32;
      }
      uint64_t v21 = 0;
      uint64_t v22 = a1 + 72;
      goto LABEL_31;
    case 2:
      id v17 = v4;
      unint64_t v18 = v17;
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(unsigned char *)(v19 + 24))
      {
        BOOL v20 = 1;
      }
      else
      {
        BOOL v20 = [v17 count] != 0;
        uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
      }
      *(unsigned char *)(v19 + 24) = v20;
      if ([v18 count] == 1)
      {
        uint64_t v21 = 0;
      }
      else
      {
        if ((unint64_t)[v18 count] < 2) {
          goto LABEL_32;
        }
        uint64_t v21 = 1;
      }
      uint64_t v22 = a1 + 48;
      goto LABEL_31;
    case 3:
      id v9 = v4;
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(unsigned char *)(v11 + 24))
      {
        BOOL v12 = 1;
      }
      else
      {
        BOOL v12 = [v9 count] != 0;
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      }
      *(unsigned char *)(v11 + 24) = v12;
      if ([v10 count] == 1)
      {
        uint64_t v21 = 0;
      }
      else
      {
        if ((unint64_t)[v10 count] < 2) {
          goto LABEL_32;
        }
        uint64_t v21 = 1;
      }
      uint64_t v22 = a1 + 56;
      goto LABEL_31;
    case 4:
      id v13 = v4;
      int v14 = v13;
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(unsigned char *)(v15 + 24))
      {
        BOOL v16 = 1;
      }
      else
      {
        BOOL v16 = [v13 count] != 0;
        uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      }
      *(unsigned char *)(v15 + 24) = v16;
      if ([v14 count] == 1)
      {
        uint64_t v21 = 0;
      }
      else
      {
        if ((unint64_t)[v14 count] < 2) {
          goto LABEL_32;
        }
        uint64_t v21 = 1;
      }
      uint64_t v22 = a1 + 64;
LABEL_31:
      *(void *)(*(void *)(*(void *)v22 + 8) + 24) = v21;
LABEL_32:

      uint64_t v4 = v23;
LABEL_33:

      return;
    default:
      goto LABEL_33;
  }
}

- (PHSearchQueryQUToken)initWithText:(id)a3 entityCategoryTypes:(id)a4 metadata:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PHSearchQueryQUToken.m", 25, @"Invalid parameter not satisfying: %@", @"text" object file lineNumber description];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__PHSearchQueryQUToken_initWithText_entityCategoryTypes_metadata___block_invoke;
  v19[3] = &unk_1E5842C98;
  SEL v21 = a2;
  id v13 = self;
  BOOL v20 = v13;
  [v11 enumerateIndexesUsingBlock:v19];
  v18.receiver = v13;
  v18.super_class = (Class)PHSearchQueryQUToken;
  int v14 = [(PHSearchQueryQUToken *)&v18 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_text, a3);
    objc_storeStrong((id *)&v15->_entityCategoryTypes, a4);
    objc_storeStrong((id *)&v15->_metadata, a5);
  }

  return v15;
}

void __66__PHSearchQueryQUToken_initWithText_entityCategoryTypes_metadata___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!+[PHSearchQueryQUToken _isSupportedEntityCategoryType:a2])
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"PHSearchQueryQUToken.m", 29, @"Invalid parameter not satisfying: %@", @"isSupportedType" object file lineNumber description];
  }
}

+ (id)_supportedEntityCategoryTypes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:2];
  [v2 addIndex:3];
  [v2 addIndex:1];
  [v2 addIndex:13];
  [v2 addIndex:11];
  [v2 addIndex:5];
  [v2 addIndex:6];
  [v2 addIndex:7];
  [v2 addIndex:12];
  [v2 addIndex:8];
  [v2 addIndex:10];
  [v2 addIndex:9];
  [v2 addIndex:14];
  [v2 addIndex:15];
  [v2 addIndex:16];
  [v2 addIndex:17];
  [v2 addIndex:18];
  id v3 = (void *)[v2 copy];

  return v3;
}

+ (BOOL)_isSupportedEntityCategoryType:(unint64_t)a3
{
  return (a3 < 0x13) & (0x7FFFEu >> a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isGenericLocation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = @"PHSearchEntityCategoryTypeLocations";
  char v5 = [v3 containsObject:@"PHSearchEntityCategoryTypeLocations"];

  id v6 = @"PHSearchEntityCategoryTypeMemoriesWhat";
  char v7 = [v3 containsObject:@"PHSearchEntityCategoryTypeMemoriesWhat"];

  return v5 & v7;
}

+ (id)entityCategoryTypeKeyForEntityTypeCategory:(unint64_t)a3
{
  if (objc_msgSend(a1, "_isSupportedEntityCategoryType:"))
  {
    uint64_t v4 = NSString;
    if (a3 - 1 > 0x11) {
      char v5 = @"PHSearchEntityCategoryTypeUndefined";
    }
    else {
      char v5 = off_1E5841E10[a3 - 1];
    }
    char v7 = v5;
    id v6 = [v4 stringWithFormat:@"%@", v7];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end