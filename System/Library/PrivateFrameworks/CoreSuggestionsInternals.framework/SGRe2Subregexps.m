@interface SGRe2Subregexps
- (SGRe2Subregexps)initWithSubregexps:(id)a3 prefilter:(id)a4;
- (id)description;
- (id)existsInUtf8:(const char *)a3;
- (id)matchesUtf8:(const char *)a3;
- (int)_enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6;
@end

@implementation SGRe2Subregexps

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefilter, 0);
  objc_storeStrong((id *)&self->_subregexps, 0);
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(NSArray *)self->_subregexps _pas_componentsJoinedByString:@"\n"];
  v5 = (void *)[v3 initWithFormat:@"<RE2 %@>", v4];

  return v5;
}

- (int)_enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  prefilter = self->_prefilter;
  if (prefilter)
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    int v33 = 1;
    v13 = [(SGRe2PrefilterTree *)prefilter regexpIdsThatMightMatchUtf8:a3];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __68__SGRe2Subregexps__enumerateMatchesInUtf8_fromString_ngroups_block___block_invoke;
    v24[3] = &unk_1E65BE918;
    v24[4] = self;
    v28 = a3;
    id v25 = v10;
    unint64_t v29 = a5;
    id v26 = v11;
    v27 = &v30;
    [v13 enumerateIndexesUsingBlock:v24];

    int v14 = *((_DWORD *)v31 + 6);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v15 = self->_subregexps;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v15);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "_enumerateMatchesInUtf8:fromString:ngroups:block:", a3, v10, a5, v11, (void)v20))
          {

            int v14 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v34 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    int v14 = 1;
  }
LABEL_13:

  return v14;
}

void __68__SGRe2Subregexps__enumerateMatchesInUtf8_fromString_ngroups_block___block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  v5 = [*(id *)(a1[4] + 16) objectAtIndexedSubscript:a2];
  int v6 = [v5 _enumerateMatchesInUtf8:a1[8] fromString:a1[5] ngroups:a1[9] block:a1[6]];

  if (!v6)
  {
    *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (id)matchesUtf8:(const char *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    prefilter = self->_prefilter;
    if (prefilter)
    {
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x3032000000;
      long long v21 = __Block_byref_object_copy__35418;
      long long v22 = __Block_byref_object_dispose__35419;
      id v23 = 0;
      int v6 = [(SGRe2PrefilterTree *)prefilter regexpIdsThatMightMatchUtf8:a3];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __31__SGRe2Subregexps_matchesUtf8___block_invoke;
      v17[3] = &unk_1E65BE8F0;
      v17[5] = &v18;
      v17[6] = a3;
      v17[4] = self;
      [v6 enumerateIndexesUsingBlock:v17];

      id v7 = (id)v19[5];
      _Block_object_dispose(&v18, 8);

      goto LABEL_15;
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v8 = self->_subregexps;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "matchesUtf8:", a3, (void)v13);
          id v7 = (id)objc_claimAutoreleasedReturnValue();
          if (v7)
          {

            goto LABEL_15;
          }
        }
        uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  id v7 = 0;
LABEL_15:
  return v7;
}

void __31__SGRe2Subregexps_matchesUtf8___block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  v5 = [*(id *)(a1[4] + 16) objectAtIndexedSubscript:a2];
  id obj = [v5 matchesUtf8:a1[6]];

  int v6 = obj;
  if (obj)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), obj);
    int v6 = obj;
    *a3 = 1;
  }
}

- (id)existsInUtf8:(const char *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    prefilter = self->_prefilter;
    if (prefilter)
    {
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x3032000000;
      long long v21 = __Block_byref_object_copy__35418;
      long long v22 = __Block_byref_object_dispose__35419;
      id v23 = 0;
      int v6 = [(SGRe2PrefilterTree *)prefilter regexpIdsThatMightMatchUtf8:a3];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __32__SGRe2Subregexps_existsInUtf8___block_invoke;
      v17[3] = &unk_1E65BE8F0;
      v17[5] = &v18;
      v17[6] = a3;
      v17[4] = self;
      [v6 enumerateIndexesUsingBlock:v17];

      id v7 = (id)v19[5];
      _Block_object_dispose(&v18, 8);

      goto LABEL_15;
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v8 = self->_subregexps;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "existsInUtf8:", a3, (void)v13);
          id v7 = (id)objc_claimAutoreleasedReturnValue();
          if (v7)
          {

            goto LABEL_15;
          }
        }
        uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  id v7 = 0;
LABEL_15:
  return v7;
}

void __32__SGRe2Subregexps_existsInUtf8___block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  v5 = [*(id *)(a1[4] + 16) objectAtIndexedSubscript:a2];
  id obj = [v5 existsInUtf8:a1[6]];

  int v6 = obj;
  if (obj)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), obj);
    int v6 = obj;
    *a3 = 1;
  }
}

- (SGRe2Subregexps)initWithSubregexps:(id)a3 prefilter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGRe2.mm", 551, @"Invalid parameter not satisfying: %@", @"subregexps" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)SGRe2Subregexps;
  uint64_t v9 = [(SGRe2Subregexps *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    subregexps = v9->_subregexps;
    v9->_subregexps = (NSArray *)v10;

    objc_storeStrong((id *)&v9->_prefilter, a4);
  }

  return v9;
}

@end