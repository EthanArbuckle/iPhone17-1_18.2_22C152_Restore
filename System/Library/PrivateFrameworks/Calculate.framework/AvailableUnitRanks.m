@interface AvailableUnitRanks
+ (AvailableUnitRanks)shared;
- (AvailableUnitRanks)init;
- (AvailableUnitRanks)ranksWithLocales:(id)a3;
- (AvailableUnitRanks)ranksWithLocales:(id)a3 cachedOnly:(BOOL)a4;
- (NSCache)availableRanks;
- (NSLock)lock;
- (UnitsInfo)unitsInfo;
- (id)conversionVerbsWithLocale:(id)a3 from:(BOOL)a4;
- (id)conversionVerbsWithLocalization:(id)a3 from:(BOOL)a4;
- (id)ranks;
- (void)clearCache;
- (void)setAvailableRanks:(id)a3;
- (void)setLock:(id)a3;
- (void)setUnitsInfo:(id)a3;
@end

@implementation AvailableUnitRanks

void __50__AvailableUnitRanks_ranksWithLocales_cachedOnly___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, float a5)
{
  id v18 = a2;
  id v9 = a4;
  if (!+[CalculateTokenizer displayNameExponent:v18])
  {
    if ([v18 containsString:@"/"])
    {
      v10 = [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndexedSubscript:(int)a3];
      v11 = [v10 name];
      if (([v11 hasPrefix:@"BTU "] & 1) != 0
        || ([v18 containsString:@"100"] & 1) != 0
        || ([v18 containsString:@"١٠٠"] & 1) != 0)
      {
      }
      else
      {
        char v17 = [v18 containsString:@"百"];

        if ((v17 & 1) == 0) {
          goto LABEL_10;
        }
      }
    }
    v12 = -[Trie objectForKeyedSubscript:](*(void *)(a1 + 40), v18);
    if (!v12)
    {
      v13 = [*(id *)(a1 + 32) unitsInfo];
      v12 = +[UnitRanks unitRanksWithUnitsInfo:v13];
      -[Trie setObject:forKeyedSubscript:](*(void *)(a1 + 40), v12, v18);

      [*(id *)(a1 + 48) addObject:v12];
    }
    v14 = [UnitRank alloc];
    *(float *)&double v15 = a5;
    v16 = [(UnitRank *)v14 initWithUnitID:a3 rank:v9 locale:v15];
    [v12 addUnitRank:v16];
  }
LABEL_10:
}

- (UnitsInfo)unitsInfo
{
  return self->_unitsInfo;
}

void __50__AvailableUnitRanks_ranksWithLocales_cachedOnly___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a5;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v29 = *(void *)v31;
    double v14 = (float)(a4 + 1);
    uint64_t v15 = a4 + 1;
    uint64_t v28 = *MEMORY[0x1E4F1C4D8];
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v31 != v29) {
          objc_enumerationMutation(v9);
        }
        char v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
        uint64_t v18 = *(void *)(a1 + 32);
        double v19 = (double)(unint64_t)(v13 + v16);
        float v20 = v19 / (double)(unint64_t)objc_msgSend(v9, "count", v28) + v14;
        (*(void (**)(uint64_t, void *, uint64_t, id, float))(v18 + 16))(v18, v17, a3, v10, v20);
        double v21 = (double)(unint64_t)([v9 count] + v15);
        float v22 = v19 / (double)(unint64_t)[v9 count] + v21;
        id v23 = v17;
        v24 = objc_msgSend((id)ranksWithLocales_cachedOnly__diacriticsRegex, "firstMatchInString:options:range:", v23, 0, 0, objc_msgSend(v23, "length"));

        if (v24)
        {
          v25 = [v23 stringByApplyingTransform:v28 reverse:0];

          if (([v25 isEqualToString:v23] & 1) == 0) {
            (*(void (**)(float))(*(void *)(a1 + 32) + 16))(v22);
          }
        }
        else
        {
          v25 = v23;
        }
        v26 = objc_msgSend((id)ranksWithLocales_cachedOnly__uppercaseRegex, "firstMatchInString:options:range:", v25, 0, 0, objc_msgSend(v25, "length"));

        if (v26)
        {
          v27 = [v25 lowercaseStringWithLocale:v10];
          if (([v27 isEqualToString:v25] & 1) == 0) {
            (*(void (**)(float))(*(void *)(a1 + 32) + 16))(v22);
          }
        }
        ++v16;
      }
      while (v12 != v16);
      v13 += v16;
      uint64_t v12 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v12);
  }
}

uint64_t __28__AvailableUnitRanks_shared__block_invoke()
{
  shared_shared_979 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (AvailableUnitRanks)init
{
  v10.receiver = self;
  v10.super_class = (Class)AvailableUnitRanks;
  v2 = [(AvailableUnitRanks *)&v10 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v2->_lock;
    v2->_lock = v3;

    uint64_t v5 = objc_opt_new();
    availableRanks = v2->_availableRanks;
    v2->_availableRanks = (NSCache *)v5;

    [(NSCache *)v2->_availableRanks setCountLimit:2];
    uint64_t v7 = +[UnitsInfo converterUnits];
    unitsInfo = v2->_unitsInfo;
    v2->_unitsInfo = (UnitsInfo *)v7;
  }
  return v2;
}

+ (AvailableUnitRanks)shared
{
  if (shared_onceToken_977 != -1) {
    dispatch_once(&shared_onceToken_977, &__block_literal_global_978);
  }
  v2 = (void *)shared_shared_979;
  return (AvailableUnitRanks *)v2;
}

- (AvailableUnitRanks)ranksWithLocales:(id)a3 cachedOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v124[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 count])
  {
    v6 = +[Localize systemLocale];
    v124[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:1];

    id v5 = (id)v7;
  }
  v8 = objc_opt_new();
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v112 objects:v123 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v113;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v113 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = [*(id *)(*((void *)&v112 + 1) + 8 * i) localeIdentifier];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v112 objects:v123 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [v8 componentsJoinedByString:@"|"];
  [(NSLock *)self->_lock lock];
  uint64_t v16 = [(NSCache *)self->_availableRanks objectForKey:v15];
  if (v16 || v4)
  {
    [(NSLock *)self->_lock unlock];
    id v62 = v16;
  }
  else
  {
    v71 = v15;
    char v17 = objc_opt_new();
    uint64_t v18 = objc_opt_new();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__AvailableUnitRanks_ranksWithLocales_cachedOnly___block_invoke;
    aBlock[3] = &unk_1E6365E70;
    aBlock[4] = self;
    id v83 = v17;
    id v110 = v83;
    id v69 = v18;
    id v111 = v69;
    double v19 = _Block_copy(aBlock);
    if (ranksWithLocales_cachedOnly__onceToken[0] != -1) {
      dispatch_once(ranksWithLocales_cachedOnly__onceToken, &__block_literal_global_29);
    }
    v107[0] = MEMORY[0x1E4F143A8];
    v107[1] = 3221225472;
    v107[2] = __50__AvailableUnitRanks_ranksWithLocales_cachedOnly___block_invoke_3;
    v107[3] = &unk_1E6365E98;
    id v70 = v19;
    id v108 = v70;
    v84 = (void (**)(void *, void *, uint64_t, void, uint64_t))_Block_copy(v107);
    float v20 = objc_opt_new();
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    obuint64_t j = v9;
    uint64_t v21 = [obj countByEnumeratingWithState:&v103 objects:v122 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      unsigned int v85 = 0;
      uint64_t v23 = *(void *)v104;
      p_info = CalculateUnitsTrieNode.info;
      id v74 = v9;
      v75 = v8;
      uint64_t v72 = *(void *)v104;
      v73 = v20;
      do
      {
        uint64_t v25 = 0;
        uint64_t v76 = v22;
        do
        {
          if (*(void *)v104 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v86 = *(void *)(*((void *)&v103 + 1) + 8 * v25);
          v26 = objc_msgSend(p_info + 206, "localizationForLocale:");
          if (([v20 containsObject:v26] & 1) == 0)
          {
            if ((unint64_t)[v20 count] > 2)
            {

              goto LABEL_62;
            }
            uint64_t v81 = v25;
            [v20 addObject:v26];
            v27 = CalculateLogForCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v121 = v26;
              _os_log_impl(&dword_1BDCDE000, v27, OS_LOG_TYPE_DEFAULT, "Calculate: loading localization \"%{public}@\"", buf, 0xCu);
            }

            context = (void *)MEMORY[0x1C1886920]();
            v80 = v26;
            uint64_t v28 = [p_info + 206 localizedStringsForTable:@"LocalizableUnits" localization:v26];
            long long v99 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            long long v102 = 0u;
            uint64_t v29 = self;
            long long v30 = [(AvailableUnitRanks *)self unitsInfo];
            long long v31 = [v30 unitNames];

            uint64_t v32 = [v31 countByEnumeratingWithState:&v99 objects:v119 count:16];
            if (v32)
            {
              uint64_t v33 = v32;
              uint64_t v34 = *(void *)v100;
              do
              {
                for (uint64_t j = 0; j != v33; ++j)
                {
                  if (*(void *)v100 != v34) {
                    objc_enumerationMutation(v31);
                  }
                  uint64_t v36 = *(void *)(*((void *)&v99 + 1) + 8 * j);
                  v37 = [(AvailableUnitRanks *)self unitsInfo];
                  v38 = [v37 objectForKeyedSubscript:v36];
                  uint64_t v39 = [v38 unitID];

                  uint64_t v40 = [v28 objectForKeyedSubscript:v36];
                  if (v40)
                  {
                    v41 = (void *)v40;
                    v42 = +[CalculateTokenizer prepareString:v40];

                    v43 = [v42 componentsSeparatedByString:@"|"];
                    v84[2](v84, v43, v39, v85, v86);
                  }
                }
                uint64_t v33 = [v31 countByEnumeratingWithState:&v99 objects:v119 count:16];
              }
              while (v33);
            }

            v44 = [v28 objectForKeyedSubscript:@"ConfusableUnits"];
            if (v44)
            {
              id v78 = v44;
              v45 = [v44 componentsSeparatedByString:@"|"];
              long long v95 = 0u;
              long long v96 = 0u;
              long long v97 = 0u;
              long long v98 = 0u;
              uint64_t v46 = [v45 countByEnumeratingWithState:&v95 objects:v118 count:16];
              if (v46)
              {
                uint64_t v47 = v46;
                uint64_t v48 = *(void *)v96;
                do
                {
                  for (uint64_t k = 0; k != v47; ++k)
                  {
                    if (*(void *)v96 != v48) {
                      objc_enumerationMutation(v45);
                    }
                    v50 = -[Trie objectForKeyedSubscript:]((uint64_t)v83, *(void **)(*((void *)&v95 + 1) + 8 * k));
                    v51 = v50;
                    if (v50)
                    {
                      long long v93 = 0u;
                      long long v94 = 0u;
                      long long v91 = 0u;
                      long long v92 = 0u;
                      v52 = [v50 ranks];
                      uint64_t v53 = [v52 countByEnumeratingWithState:&v91 objects:v117 count:16];
                      if (v53)
                      {
                        uint64_t v54 = v53;
                        uint64_t v55 = *(void *)v92;
                        do
                        {
                          for (uint64_t m = 0; m != v54; ++m)
                          {
                            if (*(void *)v92 != v55) {
                              objc_enumerationMutation(v52);
                            }
                            [*(id *)(*((void *)&v91 + 1) + 8 * m) setIsConfusable:1];
                          }
                          uint64_t v54 = [v52 countByEnumeratingWithState:&v91 objects:v117 count:16];
                        }
                        while (v54);
                      }

                      uint64_t v29 = self;
                    }
                  }
                  uint64_t v47 = [v45 countByEnumeratingWithState:&v95 objects:v118 count:16];
                }
                while (v47);
              }

              v44 = v78;
            }

            v85 += 5;
            v26 = v80;
            uint64_t v57 = [(AvailableUnitRanks *)v29 conversionVerbsWithLocalization:v80 from:0];
            if (v57)
            {
              v58 = (void *)v57;
              uint64_t v59 = 4294967294;
              id v9 = v74;
              v8 = v75;
              float v20 = v73;
              uint64_t v22 = v76;
              p_info = (__objc2_class_ro **)(CalculateUnitsTrieNode + 32);
              uint64_t v25 = v81;
LABEL_54:
              v84[2](v84, v58, v59, 0, v86);

              uint64_t v23 = v72;
              goto LABEL_55;
            }
            uint64_t v60 = [(AvailableUnitRanks *)v29 conversionVerbsWithLocalization:v80 from:1];
            id v9 = v74;
            v8 = v75;
            float v20 = v73;
            uint64_t v22 = v76;
            uint64_t v25 = v81;
            if (v60)
            {
              v58 = (void *)v60;
              uint64_t v59 = 0xFFFFFFFFLL;
              p_info = (__objc2_class_ro **)(CalculateUnitsTrieNode + 32);
              goto LABEL_54;
            }
            uint64_t v23 = v72;
            p_info = (__objc2_class_ro **)(CalculateUnitsTrieNode + 32);
          }
LABEL_55:

          ++v25;
        }
        while (v25 != v22);
        uint64_t v61 = [obj countByEnumeratingWithState:&v103 objects:v122 count:16];
        uint64_t v22 = v61;
      }
      while (v61);
    }
LABEL_62:

    +[CalculateTokenizer addSymbols:v83];
    +[CalculateTokenizer addUnits:v83 builtIn:0];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v63 = v69;
    uint64_t v64 = [v63 countByEnumeratingWithState:&v87 objects:v116 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v88;
      do
      {
        for (uint64_t n = 0; n != v65; ++n)
        {
          if (*(void *)v88 != v66) {
            objc_enumerationMutation(v63);
          }
          [*(id *)(*((void *)&v87 + 1) + 8 * n) sort];
        }
        uint64_t v65 = [v63 countByEnumeratingWithState:&v87 objects:v116 count:16];
      }
      while (v65);
    }

    [(NSCache *)self->_availableRanks setObject:v83 forKey:v71];
    [(NSLock *)self->_lock unlock];
    id v62 = v83;

    uint64_t v15 = v71;
  }

  return (AvailableUnitRanks *)v62;
}

uint64_t __50__AvailableUnitRanks_ranksWithLocales_cachedOnly___block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\p{Diacritic}|\\p{Mn}" options:0 error:0];
  v1 = (void *)ranksWithLocales_cachedOnly__diacriticsRegex;
  ranksWithLocales_cachedOnly__diacriticsRegex = v0;

  ranksWithLocales_cachedOnly__uppercaseRegex = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\p{Lu}|\\p{Lt}" options:0 error:0];
  return MEMORY[0x1F41817F8]();
}

- (AvailableUnitRanks)ranksWithLocales:(id)a3
{
  return [(AvailableUnitRanks *)self ranksWithLocales:a3 cachedOnly:0];
}

- (id)conversionVerbsWithLocalization:(id)a3 from:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = +[Localize localizedStringForKey:@"CONVERSION_SYNTAX" value:0 table:@"Localizable" localization:a3];
  v6 = +[CalculateTokenizer prepareString:v5];

  uint64_t v7 = @"_unit_to_";
  if (v4) {
    v8 = @"_unit_to_";
  }
  else {
    v8 = @"_number_and_unit_from_";
  }
  if (v4) {
    uint64_t v7 = @"_number_and_unit_from_";
  }
  id v9 = [NSString stringWithFormat:@"%@(\\s*)\\(([^)]*)\\(\\s*)%@"], v8, v7);
  uint64_t v17 = 0;
  uint64_t v10 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v9 options:0 error:&v17];
  uint64_t v11 = objc_msgSend(v10, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  uint64_t v12 = 0;
  if ([v11 numberOfRanges] == 4)
  {
    uint64_t v13 = [v11 rangeAtIndex:2];
    uint64_t v15 = objc_msgSend(v6, "substringWithRange:", v13, v14);
    uint64_t v12 = [v15 componentsSeparatedByString:@"|"];
  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitsInfo, 0);
  objc_storeStrong((id *)&self->_availableRanks, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)setUnitsInfo:(id)a3
{
}

- (void)setAvailableRanks:(id)a3
{
}

- (NSCache)availableRanks
{
  return self->_availableRanks;
}

- (void)setLock:(id)a3
{
}

- (NSLock)lock
{
  return self->_lock;
}

- (id)conversionVerbsWithLocale:(id)a3 from:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = +[Localize localizationForLocale:a3];
  uint64_t v7 = [(AvailableUnitRanks *)self conversionVerbsWithLocalization:v6 from:v4];

  return v7;
}

- (void)clearCache
{
}

- (id)ranks
{
  v3 = +[Localize systemLocales];
  BOOL v4 = [(AvailableUnitRanks *)self ranksWithLocales:v3];

  return v4;
}

@end