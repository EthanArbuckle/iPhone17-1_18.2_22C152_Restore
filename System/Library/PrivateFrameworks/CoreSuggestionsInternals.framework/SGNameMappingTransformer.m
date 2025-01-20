@interface SGNameMappingTransformer
+ (id)instanceForNameDetector;
+ (id)withFullNameMapping:(id)a3 firstNameMapping:(id)a4 lastNameMapping:(id)a5 andPossessive:(id)a6;
+ (id)withFullNameMapping:(id)a3 firstNameMapping:(id)a4 lastNameMapping:(id)a5 minimumConfidence:(int)a6 confidenceMapper:(id)a7 tokenToIgnore:(id)a8 andPossessive:(id)a9;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNameMappingTransformer:(id)a3;
- (BOOL)isPossessive:(id)a3;
- (SGNameMappingTransformer)initWithNameMappings:(id)a3 minimumConfidence:(int)a4 confidenceMapper:(id)a5 tokenToIgnore:(id)a6 forNameDetector:(BOOL)a7;
- (SGNameMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)nameMappingForToken:(id)a3 withConfidence:(int *)a4;
- (id)toPlistWithChunks:(id)a3;
- (id)transform:(id)a3;
- (unint64_t)hash;
@end

@implementation SGNameMappingTransformer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_confidenceMapper, 0);
  objc_storeStrong((id *)&self->_tokenToIgnore, 0);
  objc_storeStrong((id *)&self->_nameMappings, 0);
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDictionary *)self->_nameMappings hash];
  NSUInteger v4 = [(NSString *)self->_tokenToIgnore hash];
  uint64_t v5 = self->_minimumConfidence - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  return [self->_confidenceMapper hash] - v5 + 32 * v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SGNameMappingTransformer *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGNameMappingTransformer *)self isEqualToNameMappingTransformer:v5];

  return v6;
}

- (BOOL)isEqualToNameMappingTransformer:(id)a3
{
  NSUInteger v4 = (id *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  nameMappings = self->_nameMappings;
  v7 = (NSDictionary *)v4[2];
  if (nameMappings == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = nameMappings;
    char v10 = [(NSDictionary *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_12;
    }
  }
  tokenToIgnore = self->_tokenToIgnore;
  v12 = (NSString *)v5[3];
  if (tokenToIgnore == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = tokenToIgnore;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
  if (self->_minimumConfidence != *((_DWORD *)v5 + 8))
  {
LABEL_12:
    BOOL v16 = 0;
    goto LABEL_13;
  }
  BOOL v16 = self->_confidenceMapper == v5[5];
LABEL_13:

  return v16;
}

- (SGNameMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"NAME_MAPPINGS"];
  v8 = [v6 objectForKeyedSubscript:@"MINIMUM_CONFIDENCE"];
  uint64_t v9 = [v8 intValue];
  char v10 = [v6 objectForKeyedSubscript:@"TOKEN_TO_IGNORE"];

  v11 = [(SGNameMappingTransformer *)self initWithNameMappings:v7 minimumConfidence:v9 confidenceMapper:0 tokenToIgnore:v10 forNameDetector:0];
  return v11;
}

- (id)toPlistWithChunks:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  nameMappings = self->_nameMappings;
  v10[1] = @"MINIMUM_CONFIDENCE";
  v11[0] = nameMappings;
  v10[0] = @"NAME_MAPPINGS";
  uint64_t v5 = [NSNumber numberWithInt:self->_minimumConfidence];
  v11[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v7 = (void *)[v6 mutableCopy];

  tokenToIgnore = self->_tokenToIgnore;
  if (tokenToIgnore) {
    [v7 setObject:tokenToIgnore forKeyedSubscript:@"TOKEN_TO_IGNORE"];
  }
  return v7;
}

- (BOOL)isPossessive:(id)a3
{
  return [a3 isEqualToString:@"'s"];
}

- (id)transform:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[SGNameMappingTransformer transform:]", "SGNameMappingTransformer.m", 195, "[input isKindOfClass:[NSArray class]]");
  }
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v55 = objc_opt_new();
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v8)
  {
    SEL v54 = a2;
    int v58 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v66;
    uint64_t v11 = v8;
    uint64_t v60 = *(void *)v66;
    id v56 = v7;
    while (1)
    {
      uint64_t v12 = 0;
      uint64_t v57 = v11;
      do
      {
        if (*(void *)v66 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v65 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1CB79B230]();
        if (![v13 isEqualToString:self->_tokenToIgnore])
        {
          int v64 = 0;
          char v15 = [(SGNameMappingTransformer *)self nameMappingForToken:v13 withConfidence:&v64];
          if (v15)
          {
            BOOL v16 = v15;
            if (v64 < self->_minimumConfidence)
            {

              goto LABEL_13;
            }
            v59 = v9;
            if (v15 == @"FIRST")
            {
              BOOL v26 = v9 != @"LAST";
              BOOL v27 = v9 != @"UNDEFINED";
              char v25 = v26 && v27;
              if (v26 && v27) {
                BOOL v16 = @"FIRST";
              }
              else {
                BOOL v16 = @"FULL";
              }
            }
            else if (v15 == @"LAST")
            {
              BOOL v30 = v9 != @"FIRST";
              BOOL v31 = v9 != @"UNDEFINED";
              char v25 = v30 && v31;
              if (v30 && v31) {
                BOOL v16 = @"LAST";
              }
              else {
                BOOL v16 = @"FULL";
              }
            }
            else if (v15 == @"UNDEFINED")
            {
              char v25 = v9 != @"FIRST" && v9 != @"LAST" && v9 != @"UNDEFINED";
              if (v9 != @"FIRST" && v9 != @"LAST") {
                BOOL v16 = @"UNDEFINED";
              }
              else {
                BOOL v16 = @"FULL";
              }
            }
            else if (v15 == @"POSSESSIVE")
            {
              v47 = [MEMORY[0x1E4F28B00] currentHandler];
              [v47 handleFailureInMethod:v54 object:self file:@"SGNameMappingTransformer.m" lineNumber:245 description:@"Shouldn't be NameMappingPossessive"];

              char v25 = 1;
              BOOL v16 = @"POSSESSIVE";
            }
            else
            {
              char v25 = 1;
            }
            uint64_t v32 = -[NSDictionary objectForKeyedSubscript:](self->_nameMappings, "objectForKeyedSubscript:", v16, v54);
            if (!v32) {
              __assert_rtn("-[SGNameMappingTransformer transform:]", "SGNameMappingTransformer.m", 249, "feature");
            }
            v33 = (void *)v32;
            if (v25)
            {
              uint64_t v34 = [v13 range];
              v36 = +[SGTokenString stringWithString:range:confidence:](SGTokenString, "stringWithString:range:confidence:", v33, v34, v35, v64);
              [v6 addObject:v36];

              v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count") - 1);
              [v55 addObject:v37];
            }
            else
            {
              int v38 = v64;
              if (v64 <= v58) {
                int v38 = v58;
              }
              int v64 = v38 + 1;
              v39 = [v6 lastObject];
              NSUInteger v40 = [v39 range];
              v41 = v6;
              NSUInteger v43 = v42;
              v73.location = [v13 range];
              v73.length = v44;
              v72.location = v40;
              v72.length = v43;
              id v6 = v41;
              NSRange v45 = NSUnionRange(v72, v73);
              v37 = +[SGTokenString stringWithString:range:confidence:](SGTokenString, "stringWithString:range:confidence:", v33, v45.location, v45.length, v64);

              uint64_t v11 = v57;
              objc_msgSend(v41, "setObject:atIndexedSubscript:", v37, objc_msgSend(v41, "count") - 1);
            }

            v46 = v16;
            int v58 = v64;

            uint64_t v9 = v46;
            id v7 = v56;
LABEL_45:
            uint64_t v10 = v60;
            goto LABEL_46;
          }
LABEL_13:
          v17 = v9;
          if (v9)
          {
            uint64_t v18 = [(NSDictionary *)self->_nameMappings objectForKeyedSubscript:v9];
            if (v18)
            {
              v19 = (void *)v18;
              v20 = v17;
              uint64_t v21 = [(NSDictionary *)self->_nameMappings objectForKeyedSubscript:@"POSSESSIVE"];
              if (v21)
              {
                v22 = (void *)v21;
                BOOL v23 = [(SGNameMappingTransformer *)self isPossessive:v13];

                v17 = v20;
                uint64_t v11 = v57;
                if (v23)
                {
                  v24 = [v6 lastObject];
                  [v24 setConfidence:-v58];

                  uint64_t v9 = @"POSSESSIVE";
                  goto LABEL_45;
                }
              }
              else
              {

                uint64_t v11 = v57;
              }
            }
          }

          if (!self->_forNameDetector)
          {
            if ([v13 hasPrefix:@"SG_"])
            {
              [v6 addObject:v13];
            }
            else
            {
              v28 = [v13 lowercaseString];
              v29 = [v13 stringWithNewContents:v28];
              [v6 addObject:v29];
            }
          }
          uint64_t v9 = 0;
          goto LABEL_45;
        }
        if (!self->_forNameDetector) {
          [v6 addObject:v13];
        }
LABEL_46:
        ++v12;
      }
      while (v11 != v12);
      uint64_t v48 = [v7 countByEnumeratingWithState:&v65 objects:v69 count:16];
      uint64_t v11 = v48;
      if (!v48) {
        goto LABEL_52;
      }
    }
  }
  uint64_t v9 = 0;
LABEL_52:

  if (self->_forNameDetector)
  {
    id v49 = v6;
    v50 = v55;
  }
  else
  {
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __38__SGNameMappingTransformer_transform___block_invoke;
    v61[3] = &unk_1E65B6A68;
    id v51 = v6;
    id v62 = v51;
    v63 = self;
    v50 = v55;
    [v55 enumerateObjectsUsingBlock:v61];
    id v52 = v51;
  }
  return v6;
}

void __38__SGNameMappingTransformer_transform___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  uint64_t v3 = [v15 unsignedIntegerValue];
  id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v3];
  int v5 = [v4 confidence];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 40);
  id v7 = v4;
  if (v6)
  {
    if (v5 >= 0) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = -v5;
    }
    uint64_t v9 = (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v8);
    id v7 = v4;
    if ([v9 length])
    {
      appendFeatureSuffix(v4, v9);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if (v5 < 0)
  {
    uint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:@"POSSESSIVE"];

    if (v10)
    {
      uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:@"POSSESSIVE"];
      uint64_t v12 = appendFeatureSuffix(v7, v11);

      id v7 = (id)v12;
    }
  }
  if (v7 != v4)
  {
    v13 = (void *)MEMORY[0x1CB79B230]();
    v14 = [v4 stringWithNewContents:v7];
    [*(id *)(a1 + 32) setObject:v14 atIndexedSubscript:v3];
  }
}

- (id)nameMappingForToken:(id)a3 withConfidence:(int *)a4
{
  id v5 = a3;
  int v6 = [v5 confidence];
  if (v6) {
    id v7 = @"UNDEFINED";
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = v7;
  char v9 = +[SGNames attributesForNameWord:v5];
  if ((v9 & 5) == 0)
  {
    int v11 = v6;
    if (!a4) {
      goto LABEL_35;
    }
LABEL_34:
    *a4 = v11;
    goto LABEL_35;
  }
  if ((v9 & 4) != 0) {
    int v10 = 10;
  }
  else {
    int v10 = 5;
  }
  if (v6 <= v10) {
    int v11 = v10;
  }
  else {
    int v11 = v6;
  }
  if ((v9 & 2) == 0)
  {
    uint64_t v12 = (void *)MEMORY[0x1CB79B230]();
    v13 = [v5 lowercaseString];
    if (firstnames_onceToken != -1) {
      dispatch_once(&firstnames_onceToken, &__block_literal_global_7281);
    }
    int v14 = [(id)firstnames_trie payloadForString:v13];
    if (lastnames_onceToken != -1) {
      dispatch_once(&lastnames_onceToken, &__block_literal_global_171);
    }
    int v15 = [(id)lastnames_trie payloadForString:v13];
    if (v14 | v15)
    {
      BOOL v16 = v15 != 0;
      BOOL v17 = v14 != 0;
      uint64_t v18 = @"FIRST";
      if (v17 && v16) {
        uint64_t v18 = @"UNDEFINED";
      }
      if (v14) {
        v19 = v18;
      }
      else {
        v19 = @"LAST";
      }
      if (v17 && v16) {
        int v20 = 2;
      }
      else {
        int v20 = 1;
      }
      v11 += v20;

      uint64_t v8 = v19;
    }
    else
    {
      if (!v6)
      {
        uint64_t v8 = 0;
LABEL_33:

        if (!a4) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
      uint64_t v8 = @"UNDEFINED";
    }
    v11 += +[SGNames isCapitalized:v5];
    goto LABEL_33;
  }

  uint64_t v8 = @"LAST";
  if (a4) {
    goto LABEL_34;
  }
LABEL_35:

  return v8;
}

- (SGNameMappingTransformer)initWithNameMappings:(id)a3 minimumConfidence:(int)a4 confidenceMapper:(id)a5 tokenToIgnore:(id)a6 forNameDetector:(BOOL)a7
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  BOOL v17 = [v14 objectForKeyedSubscript:@"FULL"];

  if (!v17)
  {
    BOOL v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SGNameMappingTransformer.m", 126, @"Invalid parameter not satisfying: %@", @"nameMappings[NameMappingFull]" object file lineNumber description];
  }
  uint64_t v18 = [v14 objectForKeyedSubscript:@"FIRST"];

  if (!v18)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"SGNameMappingTransformer.m", 127, @"Invalid parameter not satisfying: %@", @"nameMappings[NameMappingFirst]" object file lineNumber description];
  }
  v19 = [v14 objectForKeyedSubscript:@"LAST"];

  if (!v19)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"SGNameMappingTransformer.m", 128, @"Invalid parameter not satisfying: %@", @"nameMappings[NameMappingLast]" object file lineNumber description];
  }
  int v20 = [v14 objectForKeyedSubscript:@"UNDEFINED"];

  if (!v20)
  {
    BOOL v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"SGNameMappingTransformer.m", 129, @"Invalid parameter not satisfying: %@", @"nameMappings[NameMappingUndefined]" object file lineNumber description];
  }
  uint64_t v21 = [v14 objectForKeyedSubscript:@"POSSESSIVE"];

  if (!v21)
  {
    BOOL v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"SGNameMappingTransformer.m", 130, @"Invalid parameter not satisfying: %@", @"nameMappings[NameMappingPossessive]" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)SGNameMappingTransformer;
  v22 = [(SGNameMappingTransformer *)&v32 init];
  BOOL v23 = v22;
  if (v22)
  {
    v22->_forNameDetector = a7;
    objc_storeStrong((id *)&v22->_nameMappings, a3);
    objc_storeStrong((id *)&v23->_tokenToIgnore, a6);
    v23->_minimumConfidence = a4;
    uint64_t v24 = MEMORY[0x1CB79B4C0](v15);
    id confidenceMapper = v23->_confidenceMapper;
    v23->_id confidenceMapper = (id)v24;
  }
  return v23;
}

+ (id)withFullNameMapping:(id)a3 firstNameMapping:(id)a4 lastNameMapping:(id)a5 minimumConfidence:(int)a6 confidenceMapper:(id)a7 tokenToIgnore:(id)a8 andPossessive:(id)a9
{
  uint64_t v11 = *(void *)&a6;
  v26[5] = *MEMORY[0x1E4F143B8];
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  uint64_t v21 = [SGNameMappingTransformer alloc];
  v25[0] = @"FULL";
  v25[1] = @"FIRST";
  v26[0] = v20;
  v26[1] = v19;
  v25[2] = @"LAST";
  v25[3] = @"UNDEFINED";
  v26[2] = v18;
  v26[3] = v20;
  v25[4] = @"POSSESSIVE";
  v26[4] = v15;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:5];

  BOOL v23 = [(SGNameMappingTransformer *)v21 initWithNameMappings:v22 minimumConfidence:v11 confidenceMapper:v17 tokenToIgnore:v16 forNameDetector:0];
  return v23;
}

+ (id)withFullNameMapping:(id)a3 firstNameMapping:(id)a4 lastNameMapping:(id)a5 andPossessive:(id)a6
{
  return +[SGNameMappingTransformer withFullNameMapping:a3 firstNameMapping:a4 lastNameMapping:a5 minimumConfidence:10 confidenceMapper:0 tokenToIgnore:0 andPossessive:a6];
}

+ (id)instanceForNameDetector
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v2 = [SGNameMappingTransformer alloc];
  v6[0] = @"FULL";
  v6[1] = @"FIRST";
  v7[0] = @"SG_FEATURE_FULLNAME";
  v7[1] = @"SG_FEATURE_FIRSTNAME";
  v6[2] = @"LAST";
  v6[3] = @"UNDEFINED";
  v7[2] = @"SG_FEATURE_LASTNAME";
  v7[3] = @"SG_FEATURE_FULLNAME";
  v6[4] = @"POSSESSIVE";
  v7[4] = @"SG_POSSESSIVE";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:5];
  id v4 = [(SGNameMappingTransformer *)v2 initWithNameMappings:v3 minimumConfidence:10 confidenceMapper:0 tokenToIgnore:0 forNameDetector:1];

  return v4;
}

@end