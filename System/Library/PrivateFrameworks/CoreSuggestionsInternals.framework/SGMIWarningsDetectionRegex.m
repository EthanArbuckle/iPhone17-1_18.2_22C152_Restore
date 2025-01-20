@interface SGMIWarningsDetectionRegex
+ (id)hashedValueOfString:(id)a3;
- (NSNumber)privateGroupsCount;
- (SGMIWarningsDetectionRegex)initWithPattern:(id)a3;
- (SGMIWarningsDetectionRegex)initWithPattern:(id)a3 compiledRegexCache:(id)a4;
- (id)description;
- (id)matchForString:(id)a3;
- (id)matchForString:(id)a3 withinRange:(_NSRange)a4;
- (id)matchesForString:(id)a3;
- (id)matchesForString:(id)a3 withinRange:(_NSRange)a4 onlyFirstMatch:(BOOL)a5;
@end

@implementation SGMIWarningsDetectionRegex

- (void).cxx_destruct
{
}

- (NSNumber)privateGroupsCount
{
  return self->_privateGroupsCount;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (void *)[v3 initWithFormat:@"<SGMIWarningsDetectionRegex with %@ private groups>\nPattern:'%@'\n", self->_privateGroupsCount, *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F292C8])];
  return v4;
}

- (id)matchesForString:(id)a3 withinRange:(_NSRange)a4 onlyFirstMatch:(BOOL)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  v10 = objc_opt_new();
  v11 = objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__SGMIWarningsDetectionRegex_matchesForString_withinRange_onlyFirstMatch___block_invoke;
  v18[3] = &unk_1E65BE9B0;
  v18[4] = self;
  id v19 = v9;
  id v20 = v11;
  id v12 = v10;
  id v21 = v12;
  BOOL v22 = a5;
  id v13 = v11;
  id v14 = v9;
  -[SGMIWarningsDetectionRegex enumerateMatchesInString:options:range:usingBlock:](self, "enumerateMatchesInString:options:range:usingBlock:", v14, 0, location, length, v18);
  v15 = v21;
  id v16 = v12;

  return v16;
}

void __74__SGMIWarningsDetectionRegex_matchesForString_withinRange_onlyFirstMatch___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  v51 = objc_opt_new();
  v52 = objc_opt_new();
  v7 = objc_opt_new();
  if (!v6 || (unint64_t)[v6 numberOfRanges] < 2) {
    goto LABEL_27;
  }
  v46 = a4;
  v49 = v7;
  uint64_t v8 = [v6 range];
  uint64_t v47 = v9;
  uint64_t v48 = v8;
  v10 = objc_opt_new();
  uint64_t v53 = a1;
  if ([*(id *)(*(void *)(a1 + 32) + 40) unsignedIntValue])
  {
    unint64_t v11 = 0;
    do
    {
      id v12 = (void *)MEMORY[0x1E4F29238];
      id v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"G%tu", v11);
      uint64_t v14 = [v6 rangeWithName:v13];
      id v16 = objc_msgSend(v12, "valueWithRange:", v14, v15);
      [v10 addObject:v16];

      ++v11;
    }
    while (v11 < [*(id *)(*(void *)(a1 + 32) + 40) unsignedIntValue]);
  }
  uint64_t v17 = [v6 rangeWithName:@"core"];
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v23 = v17;
    uint64_t v25 = v18;
    uint64_t v21 = v53;
    goto LABEL_13;
  }
  uint64_t v19 = [v6 rangeWithName:@"coreAlternative"];
  uint64_t v21 = a1;
  if (v19 != 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v19 = [v6 rangeWithName:@"coreAlternative2"],
        uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL,
        v19 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v23 = v19;
    uint64_t v25 = v20;
    goto LABEL_13;
  }
  uint64_t v23 = [v6 rangeWithName:@"coreAlternative3"];
  uint64_t v25 = v24;
  if (v23 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_13:
    v26 = objc_msgSend(*(id *)(v21 + 40), "substringWithRange:", v23, v25);
    if ([*(id *)(v53 + 48) containsObject:v26])
    {

LABEL_26:
      v7 = v49;
      goto LABEL_27;
    }
    [*(id *)(v53 + 48) addObject:v26];

    uint64_t v22 = v23;
  }
  uint64_t v45 = v22;
  v27 = objc_opt_new();
  v50 = objc_opt_new();
  if ([v6 numberOfRanges])
  {
    unint64_t v28 = 0;
    do
    {
      uint64_t v29 = [v6 rangeAtIndex:v28];
      if (v29 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v31 = v29;
        uint64_t v32 = v30;
        [v27 addIndex:v29];
        [v27 addIndex:v31 + v32];
        v33 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v31, v32);
        int v34 = [v10 containsObject:v33];

        if (v34) {
          objc_msgSend(v50, "addIndexesInRange:", v31, v32);
        }
      }
      ++v28;
    }
    while (v28 < [v6 numberOfRanges]);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v65 = v48;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  char v63 = 0;
  objc_msgSend(v27, "removeIndex:");
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __74__SGMIWarningsDetectionRegex_matchesForString_withinRange_onlyFirstMatch___block_invoke_2;
  v54[3] = &unk_1E65BE988;
  v60 = buf;
  id v55 = *(id *)(v53 + 40);
  id v35 = v50;
  id v56 = v35;
  v61 = v62;
  id v36 = v51;
  id v57 = v36;
  id v37 = v52;
  id v58 = v37;
  id v38 = v49;
  id v59 = v38;
  [v27 enumerateIndexesUsingBlock:v54];

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(buf, 8);

  v7 = v49;
  if (v48 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v39 = objc_msgSend(v37, "_pas_componentsJoinedByString:", @" ");
    v40 = objc_msgSend(v36, "_pas_componentsJoinedByString:", &stru_1F24EEF20);
    v41 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = objc_msgSend(*(id *)(v53 + 40), "substringWithRange:", v48, v47);
      *(_DWORD *)buf = 138740483;
      *(void *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v40;
      *(_WORD *)&buf[22] = 2117;
      uint64_t v65 = (uint64_t)v39;
      _os_log_impl(&dword_1CA650000, v41, OS_LOG_TYPE_DEFAULT, "SGMIWarningsDetectionRegexMatch (%{sensitive}@) with signature: %@ (%{sensitive}@)", buf, 0x20u);
    }
    v43 = *(void **)(v53 + 56);
    v44 = -[SGMIWarningsDetectionRegexMatch initWithRange:coreRange:signature:wildcardsMatches:]([SGMIWarningsDetectionRegexMatch alloc], "initWithRange:coreRange:signature:wildcardsMatches:", v48, v47, v45, v25, v40, v38);
    [v43 addObject:v44];

    unsigned char *v46 = *(unsigned char *)(v53 + 64);
    goto LABEL_26;
  }
LABEL_27:
}

void __74__SGMIWarningsDetectionRegex_matchesForString_withinRange_onlyFirstMatch___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v5 = a2 - v4;
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v4, a2 - v4);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "intersectsIndexesInRange:", v4, v5))
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      [*(id *)(a1 + 48) addObject:@"ff"];
      [*(id *)(a1 + 56) addObject:@"[PRIVATE]>(ff)"];
    }
    [*(id *)(a1 + 64) addObject:v13];
    char v6 = 1;
  }
  else
  {
    v7 = *(void **)(a1 + 48);
    uint64_t v8 = +[SGMIWarningsDetectionRegex hashedValueOfString:v13];
    [v7 addObject:v8];

    uint64_t v9 = *(void **)(a1 + 56);
    id v10 = [NSString alloc];
    unint64_t v11 = [*(id *)(a1 + 48) lastObject];
    id v12 = (void *)[v10 initWithFormat:@"[%@]>(%@)", v13, v11];
    [v9 addObject:v12];

    char v6 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v6;
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a2;
}

- (id)matchesForString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[SGMIWarningsDetectionRegex matchesForString:withinRange:onlyFirstMatch:](self, "matchesForString:withinRange:onlyFirstMatch:", v4, 0, [v4 length], 0);

  return v5;
}

- (id)matchForString:(id)a3 withinRange:(_NSRange)a4
{
  id v4 = -[SGMIWarningsDetectionRegex matchesForString:withinRange:onlyFirstMatch:](self, "matchesForString:withinRange:onlyFirstMatch:", a3, a4.location, a4.length, 1);
  uint64_t v5 = [v4 firstObject];

  return v5;
}

- (id)matchForString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[SGMIWarningsDetectionRegex matchForString:withinRange:](self, "matchForString:withinRange:", v4, 0, [v4 length]);

  return v5;
}

- (SGMIWarningsDetectionRegex)initWithPattern:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 length];
  id v38 = 0;
  char v6 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"(?:(?:(?<!\\\\)\\.)|\\\\w)(?:[*\\+\\?]|\\{\\d*\\,\\d*\\})?|(?:\\[[^\\]]+\\](?:[*\\+\\?]|\\{\\d*\\,\\d*\\}))" options:0 error:&v38];
  id v7 = v38;
  uint64_t v8 = objc_opt_new();
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v9 = (void *)MEMORY[0x1CB79B230]();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __46__SGMIWarningsDetectionRegex_initWithPattern___block_invoke;
  v25[3] = &unk_1E65BE960;
  unint64_t v28 = &v34;
  id v10 = v8;
  id v26 = v10;
  id v11 = v4;
  id v27 = v11;
  uint64_t v29 = &v30;
  objc_msgSend(v6, "enumerateMatchesInString:options:range:usingBlock:", v11, 0, 0, v5, v25);
  unint64_t v12 = v35[3];
  uint64_t v13 = v5 - v12;
  if (v5 > v12)
  {
    uint64_t v14 = objc_msgSend(v11, "substringWithRange:");
    [v10 addObject:v14];
  }
  uint64_t v15 = objc_msgSend(v10, "_pas_componentsJoinedByString:", &stru_1F24EEF20, v13);

  v23.receiver = self;
  v23.super_class = (Class)SGMIWarningsDetectionRegex;
  id v24 = v7;
  id v16 = [(SGMIWarningsDetectionRegex *)&v23 initWithPattern:v15 options:1 error:&v24];
  id v17 = v24;

  if (v16)
  {
    uint64_t v18 = [NSNumber numberWithUnsignedInteger:v31[3]];
    privateGroupsCount = v16->_privateGroupsCount;
    v16->_privateGroupsCount = (NSNumber *)v18;

    uint64_t v20 = v16;
  }
  else
  {
    uint64_t v21 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v40 = v15;
      __int16 v41 = 2112;
      id v42 = v17;
      _os_log_fault_impl(&dword_1CA650000, v21, OS_LOG_TYPE_FAULT, "SGMIWarningsDetectionRegex: Invalid pattern %@ : %@.", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v16;
}

void __46__SGMIWarningsDetectionRegex_initWithPattern___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v15 = v3;
    unint64_t v5 = [v3 rangeAtIndex:0];
    id v3 = v15;
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = v4;
      if (v5 > *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        id v7 = *(void **)(a1 + 32);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:");
        [v7 addObject:v8];
      }
      uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v5, v6);
      id v10 = *(void **)(a1 + 32);
      id v11 = [NSString alloc];
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v13 = *(void *)(v12 + 24);
      *(void *)(v12 + 24) = v13 + 1;
      uint64_t v14 = (void *)[v11 initWithFormat:@"(?<G%tu>%@)", v13, v9];
      [v10 addObject:v14];

      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5 + v6;
      id v3 = v15;
    }
  }
}

- (SGMIWarningsDetectionRegex)initWithPattern:(id)a3 compiledRegexCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v9 = [@"SGMIWarningsDetectionRegex-" stringByAppendingString:v6];
  id v10 = [v7 objectForKeyedSubscript:v9];
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = v10;
  }
  else
  {
    uint64_t v12 = [(SGMIWarningsDetectionRegex *)self initWithPattern:v6];
    [v7 setObject:v12 forKeyedSubscript:v9];
    self = v12;
  }

  return v12;
}

+ (id)hashedValueOfString:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = (const char *)[a3 UTF8String];
  *(_OWORD *)md = 0u;
  long long v10 = 0u;
  CC_LONG v4 = strlen(v3);
  CC_SHA256(v3, v4, md);
  id v5 = [NSString alloc];
  unsigned __int8 v6 = md[0];
  if (md[0] == 0xFF) {
    unsigned __int8 v6 = 0;
  }
  id v7 = objc_msgSend(v5, "initWithFormat:", @"%02x", v6);
  return v7;
}

@end