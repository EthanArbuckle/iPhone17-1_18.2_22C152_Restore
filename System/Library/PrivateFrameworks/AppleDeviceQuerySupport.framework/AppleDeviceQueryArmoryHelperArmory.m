@interface AppleDeviceQueryArmoryHelperArmory
- (AppleDeviceQueryArmoryHelperArmory)initWithRawConfig:(id)a3;
- (AppleDeviceQueryCacheArmory)propertiesCache;
- (NSArray)flexibleList;
- (NSDictionary)aliasesMap;
- (NSDictionary)keysConfig;
- (id)getConfigOfKey:(id)a3 withError:(id *)a4;
- (id)getObfuscatedKey:(id)a3 withError:(id *)a4;
- (id)getPrimarykeyOfKey:(id)a3 withError:(id *)a4;
- (id)getPropertiesOfKey:(id)a3 withError:(id *)a4;
- (id)getSubkeyOfKey:(id)a3 withError:(id *)a4;
- (id)isKeyAlias:(id)a3 withError:(id *)a4;
- (id)pickFlexibleFromUnionizedConfig:(id)a3 withError:(id *)a4;
- (id)propertiesByKey:(id)a3 andSuperKeyRange:(_NSRange)a4 withError:(id *)a5;
- (id)propertiesOfKey:(id)a3 withError:(id *)a4;
- (id)sortAliasFromUnionizedConfig:(id)a3 withError:(id *)a4;
- (id)unionizeRawConfig:(id)a3 withError:(id *)a4;
- (void)setPropertiesCache:(id)a3;
@end

@implementation AppleDeviceQueryArmoryHelperArmory

- (id)unionizeRawConfig:(id)a3 withError:(id *)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v9 = v5;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory unionizeRawConfig:withError:]", 32, @"error p-pointer is nil!", v6, v7, v8, v50);
    v10 = 0;
    id v15 = 0;
    goto LABEL_34;
  }
  *a4 = 0;
  if (!v5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory unionizeRawConfig:withError:]", 38, @"rawConfig pointer is nil!", v6, v7, v8, v50);
    id v14 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
    v10 = 0;
    goto LABEL_7;
  }
  v10 = getZhuGeOS();
  if ([v10 isEqualToString:@"UNKNOWN_OS"])
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory unionizeRawConfig:withError:]", 45, @"ZhuGe is runing on an unknown OS!", v11, v12, v13, v50);
    id v14 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:39 underlyingError:0];
LABEL_7:
    id v15 = 0;
    *a4 = v14;
    goto LABEL_34;
  }
  v52 = a4;
  unint64_t v16 = 0x263EFF000uLL;
  id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v17 = v9;
  uint64_t v56 = [v17 countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (!v56) {
    goto LABEL_33;
  }
  v54 = v10;
  uint64_t v55 = *(void *)v62;
  v51 = v9;
  id v53 = v17;
  while (2)
  {
    uint64_t v18 = 0;
    uint64_t v19 = v55;
    do
    {
      if (*(void *)v62 != v19) {
        objc_enumerationMutation(v17);
      }
      uint64_t v20 = *(void *)(*((void *)&v61 + 1) + 8 * v18);
      v21 = [v17 objectForKeyedSubscript:v20];
      v22 = [v21 objectForKeyedSubscript:v10];

      if (!v22)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory unionizeRawConfig:withError:]", 55, @"Key \"%@\" isn't supported in %@!", v23, v24, v25, v20);
        uint64_t v48 = 40;
LABEL_32:
        [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:v48 underlyingError:0];
        v9 = v51;
        id *v52 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
      v26 = [v15 objectForKeyedSubscript:v20];

      if (v26)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory unionizeRawConfig:withError:]", 61, @"Key \"%@\" is repeated in %@!", v27, v28, v29, v20);
        uint64_t v48 = 28;
        goto LABEL_32;
      }
      v30 = *(void **)(v16 + 2464);
      v31 = [v17 objectForKeyedSubscript:v20];
      v32 = [v31 objectForKeyedSubscript:v10];
      v33 = [v30 dictionaryWithDictionary:v32];
      [v15 setObject:v33 forKeyedSubscript:v20];

      if (isZhuGeInRestoreOS())
      {
        v34 = [v17 objectForKeyedSubscript:v20];
        v35 = [v34 objectForKeyedSubscript:@"RESTOREOS"];

        if (v35)
        {
          v36 = [v17 objectForKeyedSubscript:v20];
          v37 = [v36 objectForKeyedSubscript:@"RESTOREOS"];

          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v38 = v37;
          uint64_t v39 = [v38 countByEnumeratingWithState:&v57 objects:v65 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            uint64_t v41 = *(void *)v58;
            do
            {
              for (uint64_t i = 0; i != v40; ++i)
              {
                if (*(void *)v58 != v41) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v43 = *(void *)(*((void *)&v57 + 1) + 8 * i);
                v44 = [v38 objectForKeyedSubscript:v43];
                char v45 = isObjectNSStringAndZhuGeNull(v44);

                if ((v45 & 1) == 0)
                {
                  v46 = [v38 objectForKeyedSubscript:v43];
                  v47 = [v15 objectForKeyedSubscript:v20];
                  [v47 setObject:v46 forKeyedSubscript:v43];
                }
              }
              uint64_t v40 = [v38 countByEnumeratingWithState:&v57 objects:v65 count:16];
            }
            while (v40);
          }

          id v17 = v53;
          v10 = v54;
          unint64_t v16 = 0x263EFF000;
          uint64_t v19 = v55;
        }
      }
      ++v18;
    }
    while (v18 != v56);
    v9 = v51;
    uint64_t v56 = [v17 countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v56) {
      continue;
    }
    break;
  }
LABEL_33:

LABEL_34:

  return v15;
}

- (id)sortAliasFromUnionizedConfig:(id)a3 withError:(id *)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v9 = v5;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory sortAliasFromUnionizedConfig:withError:]", 100, @"error p-pointer is nil!", v6, v7, v8, v48);
    id v10 = 0;
    goto LABEL_33;
  }
  *a4 = 0;
  if (!v5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory sortAliasFromUnionizedConfig:withError:]", 106, @"unionizedConfig pointer is nil!", v6, v7, v8, v48);
    [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
    id v10 = 0;
    v42 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v11 = v9;
  uint64_t v53 = [v11 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (!v53) {
    goto LABEL_24;
  }
  uint64_t v12 = *(void *)v59;
  v51 = a4;
  v52 = v9;
LABEL_5:
  uint64_t v13 = 0;
  uint64_t v14 = v53;
LABEL_6:
  if (*(void *)v59 != v12) {
    objc_enumerationMutation(v11);
  }
  uint64_t v15 = *(void *)(*((void *)&v58 + 1) + 8 * v13);
  unint64_t v16 = [v11 objectForKeyedSubscript:v15];
  id v17 = [v16 objectForKeyedSubscript:@"ALIAS"];

  if (!v17) {
    goto LABEL_22;
  }
  uint64_t v18 = [v11 objectForKeyedSubscript:v15];
  uint64_t v19 = [v18 objectForKeyedSubscript:@"ALIAS"];
  char v20 = isObjectNSStringAndZhuGeNull(v19);

  if (v20) {
    goto LABEL_22;
  }
  v21 = [v11 objectForKeyedSubscript:v15];
  v22 = [v21 objectForKeyedSubscript:@"ALIAS"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v27 = [v11 objectForKeyedSubscript:v15];
    uint64_t v28 = [v27 objectForKeyedSubscript:@"ALIAS"];

    uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (!v29) {
      goto LABEL_21;
    }
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v55;
    uint64_t v50 = v12;
LABEL_13:
    uint64_t v32 = 0;
    while (1)
    {
      if (*(void *)v55 != v31) {
        objc_enumerationMutation(v28);
      }
      uint64_t v33 = *(void *)(*((void *)&v54 + 1) + 8 * v32);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      v37 = [v11 objectForKeyedSubscript:v33];

      if (v37)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory sortAliasFromUnionizedConfig:withError:]", 137, @"Alias \"%@\" is duplicated with keys!", v38, v39, v40, v33);
        goto LABEL_30;
      }
      uint64_t v41 = [v10 objectForKeyedSubscript:v33];

      if (v41)
      {
        v49 = [v10 objectForKeyedSubscript:v33];
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory sortAliasFromUnionizedConfig:withError:]", 143, @"Alias \"%@\" is duplicated in keys of \"%@\" and \"%@\"!", v44, v45, v46, v33);

LABEL_30:
        uint64_t v43 = 28;
LABEL_31:
        id *v51 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:v43 underlyingError:0];

        goto LABEL_32;
      }
      [v10 setObject:v15 forKeyedSubscript:v33];
      if (v30 == ++v32)
      {
        uint64_t v30 = [v28 countByEnumeratingWithState:&v54 objects:v62 count:16];
        uint64_t v12 = v50;
        if (v30) {
          goto LABEL_13;
        }
LABEL_21:

        uint64_t v14 = v53;
LABEL_22:
        if (++v13 == v14)
        {
          v9 = v52;
          uint64_t v53 = [v11 countByEnumeratingWithState:&v58 objects:v63 count:16];
          if (!v53)
          {
LABEL_24:

            id v10 = v10;
            v42 = v10;
            goto LABEL_34;
          }
          goto LABEL_5;
        }
        goto LABEL_6;
      }
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory sortAliasFromUnionizedConfig:withError:]", 131, @"Key \"%@\" contains non-string alias", v34, v35, v36, v15);
    uint64_t v43 = 9;
    goto LABEL_31;
  }
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory sortAliasFromUnionizedConfig:withError:]", 123, @"Alias of key \"%@\" is not an array", v24, v25, v26, v15);
  id *v51 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:9 underlyingError:0];
LABEL_32:
  v9 = v52;

LABEL_33:
  v42 = 0;
LABEL_34:

  return v42;
}

- (id)pickFlexibleFromUnionizedConfig:(id)a3 withError:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v9 = v5;
  if (a4)
  {
    *a4 = 0;
    if (v5)
    {
      uint64_t v29 = a4;
      id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v30 = v9;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v32;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v32 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            id v17 = [v11 objectForKeyedSubscript:v16];
            uint64_t v18 = [v17 objectForKeyedSubscript:@"FLEXIBLE_PATTERN"];
            char v19 = isObjectNilOrZhuGeNull(v18);

            if ((v19 & 1) == 0)
            {
              char v20 = [v11 objectForKeyedSubscript:v16];
              v21 = [v20 objectForKeyedSubscript:@"FLEXIBLE_PATTERN"];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) == 0)
              {
                ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory pickFlexibleFromUnionizedConfig:withError:]", 185, @"Alias of key \"%@\" is not an string!", v23, v24, v25, v16);
                *uint64_t v29 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:9 underlyingError:0];

                id v26 = 0;
                goto LABEL_17;
              }
              [v10 addObject:v16];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      id v26 = v10;
      id v10 = v26;
LABEL_17:
      v9 = v30;
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory pickFlexibleFromUnionizedConfig:withError:]", 171, @"unionizedConfig pointer is nil!", v6, v7, v8, v28);
      [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
      id v26 = 0;
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory pickFlexibleFromUnionizedConfig:withError:]", 165, @"error p-pointer is nil!", v6, v7, v8, v28);
    id v26 = 0;
    id v10 = 0;
  }

  return v26;
}

- (id)propertiesOfKey:(id)a3 withError:(id *)a4
{
  v117[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v10 = v6;
  if (a4)
  {
    *a4 = 0;
    if (v6)
    {
      id v11 = [(AppleDeviceQueryArmoryHelperArmory *)self keysConfig];
      uint64_t v12 = [v11 objectForKeyedSubscript:v10];

      if (v12)
      {
        v117[0] = v10;
        v116[0] = @"p_primarykey";
        v116[1] = @"p_config";
        uint64_t v13 = [(AppleDeviceQueryArmoryHelperArmory *)self keysConfig];
        uint64_t v14 = [v13 objectForKeyedSubscript:v10];
        v117[1] = v14;
        v117[2] = MEMORY[0x263EFFA80];
        v116[2] = @"p_is_alias";
        v116[3] = @"p_subkey";
        v117[3] = @"ZHUGE_NULL";
        uint64_t v15 = [NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:4];

        uint64_t v16 = (void *)v15;
LABEL_9:
        id v17 = 0;
        uint64_t v18 = 0;
        char v19 = 0;
        id v20 = 0;
        goto LABEL_10;
      }
      v22 = [(AppleDeviceQueryArmoryHelperArmory *)self aliasesMap];
      uint64_t v23 = [v22 objectForKeyedSubscript:v10];

      if (v23)
      {
        v114[0] = @"p_primarykey";
        uint64_t v24 = [(AppleDeviceQueryArmoryHelperArmory *)self aliasesMap];
        uint64_t v25 = [v24 objectForKeyedSubscript:v10];
        v115[0] = v25;
        v114[1] = @"p_config";
        id v26 = [(AppleDeviceQueryArmoryHelperArmory *)self keysConfig];
        uint64_t v27 = [(AppleDeviceQueryArmoryHelperArmory *)self aliasesMap];
        uint64_t v28 = [v27 objectForKeyedSubscript:v10];
        uint64_t v29 = [v26 objectForKeyedSubscript:v28];
        v115[1] = v29;
        v115[2] = MEMORY[0x263EFFA88];
        v114[2] = @"p_is_alias";
        v114[3] = @"p_subkey";
        v115[3] = @"ZHUGE_NULL";
        uint64_t v30 = [NSDictionary dictionaryWithObjects:v115 forKeys:v114 count:4];

        uint64_t v16 = (void *)v30;
        goto LABEL_9;
      }
      v77 = a4;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      id obj = [(AppleDeviceQueryArmoryHelperArmory *)self flexibleList];
      uint64_t v82 = [obj countByEnumeratingWithState:&v103 objects:v113 count:16];
      if (v82)
      {
        id v84 = 0;
        uint64_t v18 = 0;
        char v19 = 0;
        id v20 = 0;
        v79 = 0;
        v80 = self;
        uint64_t v81 = *(void *)v104;
        v88 = v10;
        while (2)
        {
          uint64_t v33 = 0;
          do
          {
            v86 = v18;
            v92 = v19;
            if (*(void *)v104 != v81) {
              objc_enumerationMutation(obj);
            }
            uint64_t v85 = v33;
            uint64_t v34 = *(void *)(*((void *)&v103 + 1) + 8 * v33);
            uint64_t v35 = [(AppleDeviceQueryArmoryHelperArmory *)self keysConfig];
            uint64_t v36 = [v35 objectForKeyedSubscript:v34];

            v37 = [v36 objectForKeyedSubscript:@"FLEXIBLE_PATTERN"];
            id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);

            v112[0] = MEMORY[0x263EFFA80];
            uint64_t v39 = [MEMORY[0x263F08AE8] escapedPatternForString:v34];
            uint64_t v40 = [v37 stringByReplacingOccurrencesOfString:@"$superkey" withString:v39];
            v112[1] = v40;
            uint64_t v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v112 count:2];
            uint64_t v83 = v34;
            [v38 setObject:v41 forKeyedSubscript:v34];

            v87 = v36;
            v42 = [v36 objectForKeyedSubscript:@"ALIAS"];
            long long v99 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            long long v102 = 0u;
            uint64_t v43 = [v42 countByEnumeratingWithState:&v99 objects:v111 count:16];
            if (v43)
            {
              uint64_t v44 = v43;
              uint64_t v45 = *(void *)v100;
              do
              {
                for (uint64_t i = 0; i != v44; ++i)
                {
                  if (*(void *)v100 != v45) {
                    objc_enumerationMutation(v42);
                  }
                  uint64_t v47 = *(void *)(*((void *)&v99 + 1) + 8 * i);
                  v110[0] = MEMORY[0x263EFFA88];
                  uint64_t v48 = [MEMORY[0x263F08AE8] escapedPatternForString:v47];
                  v49 = [v37 stringByReplacingOccurrencesOfString:@"$superkey" withString:v48];
                  v110[1] = v49;
                  uint64_t v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v110 count:2];
                  [v38 setObject:v50 forKeyedSubscript:v47];
                }
                uint64_t v44 = [v42 countByEnumeratingWithState:&v99 objects:v111 count:16];
              }
              while (v44);
            }
            long long v97 = 0u;
            long long v98 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            id v20 = v38;
            uint64_t v90 = [v20 countByEnumeratingWithState:&v95 objects:v109 count:16];
            if (v90)
            {
              uint64_t v89 = *(void *)v96;
              v51 = v86;
              char v19 = v92;
              v91 = v20;
LABEL_25:
              uint64_t v52 = 0;
              uint64_t v53 = v84;
              long long v54 = v19;
              while (1)
              {
                v93 = v51;
                if (*(void *)v96 != v89) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v55 = *(void *)(*((void *)&v95 + 1) + 8 * v52);
                long long v56 = (void *)MEMORY[0x263F08AE8];
                long long v57 = [v20 objectForKeyedSubscript:v55];
                long long v58 = [v57 objectAtIndexedSubscript:1];
                id v94 = v53;
                char v19 = [v56 regularExpressionWithPattern:v58 options:0 error:&v94];
                id v59 = v94;

                if (!v19)
                {
                  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory propertiesOfKey:withError:]", 281, @"Creating regEx failed for checking flexible key \"%@\"!", v60, v61, v62, v55);
                  id v84 = v59;
                  [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:4 underlyingError:v59];
                  int v64 = 0;
                  id *v77 = (id)objc_claimAutoreleasedReturnValue();
                  id v20 = v91;
                  uint64_t v18 = v93;
LABEL_35:
                  id v10 = v88;
                  goto LABEL_40;
                }
                id v10 = v88;
                uint64_t v18 = objc_msgSend(v19, "firstMatchInString:options:range:", v88, 0, 0, objc_msgSend(v88, "length"));

                if (v18) {
                  break;
                }
                v51 = 0;
                ++v52;
                uint64_t v53 = v59;
                long long v54 = v19;
                id v20 = v91;
                if (v90 == v52)
                {
                  id v84 = v59;
                  uint64_t v63 = [v91 countByEnumeratingWithState:&v95 objects:v109 count:16];
                  v51 = 0;
                  int v64 = 1;
                  uint64_t v90 = v63;
                  if (v63) {
                    goto LABEL_25;
                  }
                  uint64_t v18 = 0;
                  goto LABEL_35;
                }
              }
              id v84 = v59;
              id v65 = objc_alloc_init(MEMORY[0x263EFF980]);
              if ((unint64_t)[v18 numberOfRanges] >= 2)
              {
                unint64_t v66 = 1;
                do
                {
                  uint64_t v67 = [v18 rangeAtIndex:v66];
                  v69 = objc_msgSend(v88, "substringWithRange:", v67, v68);
                  [v65 addObject:v69];

                  ++v66;
                }
                while ([v18 numberOfRanges] > v66);
              }
              v107[0] = @"p_primarykey";
              v107[1] = @"p_config";
              v108[0] = v83;
              v108[1] = v87;
              v107[2] = @"p_is_alias";
              v70 = [v91 objectForKeyedSubscript:v55];
              v71 = [v70 objectAtIndexedSubscript:0];
              v107[3] = @"p_subkey";
              v108[2] = v71;
              v108[3] = v65;
              uint64_t v72 = [NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:4];

              int v64 = 0;
              v79 = (void *)v72;
              id v20 = v91;
            }
            else
            {
              int v64 = 1;
              id v10 = v88;
              char v19 = v92;
              uint64_t v18 = v86;
            }
LABEL_40:

            if (!v64)
            {

              goto LABEL_47;
            }
            uint64_t v33 = v85 + 1;
            self = v80;
          }
          while (v85 + 1 != v82);
          uint64_t v82 = [obj countByEnumeratingWithState:&v103 objects:v113 count:16];
          if (v82) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v84 = 0;
        uint64_t v18 = 0;
        char v19 = 0;
        id v20 = 0;
        v79 = 0;
      }

      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory propertiesOfKey:withError:]", 304, @"Key \"%@\" may need further check", v73, v74, v75, (uint64_t)v10);
      id *v77 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:73 underlyingError:0];
LABEL_47:
      uint64_t v16 = v79;
      id v17 = v84;
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory propertiesOfKey:withError:]", 223, @"key pointer is nil!", v7, v8, v9, v76);
      id v21 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
      id v17 = 0;
      uint64_t v18 = 0;
      char v19 = 0;
      id v20 = 0;
      uint64_t v16 = 0;
      *a4 = v21;
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory propertiesOfKey:withError:]", 217, @"error p-pointer is nil!", v7, v8, v9, v76);
    id v17 = 0;
    uint64_t v18 = 0;
    char v19 = 0;
    id v20 = 0;
    uint64_t v16 = 0;
  }
LABEL_10:
  id v31 = v16;

  return v31;
}

- (id)propertiesByKey:(id)a3 andSuperKeyRange:(_NSRange)a4 withError:(id *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  uint64_t v13 = v9;
  if (a5)
  {
    *a5 = 0;
    if (v9)
    {
      if ([v9 length] >= location + length)
      {
        uint64_t v24 = objc_msgSend(v13, "substringWithRange:", location, length);
        id v43 = 0;
        uint64_t v25 = getObfuscatedString(v24, &v43);
        id v33 = v43;
        if (v25)
        {
          id v26 = objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:options:range:", v24, v25, 0, location, length);
          id v42 = v33;
          uint64_t v23 = [(AppleDeviceQueryArmoryHelperArmory *)self propertiesOfKey:v25 withError:&v42];
          id v22 = v42;

          if (v23)
          {
            id v21 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v23];
            [v21 setObject:v26 forKeyedSubscript:@"p_obfuscated_key"];
            ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:]", 365, @"Got properties after obfuscating \"%@\" for key \"%@\"", v37, v38, v39, (uint64_t)v24);
            goto LABEL_10;
          }
          ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:]", 358, @"Didn't get properties after obfuscating \"%@\" for key \"%@\"", v34, v35, v36, (uint64_t)v24);
          id v27 = v22;
          id v22 = v27;
          id v21 = 0;
          goto LABEL_9;
        }
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:]", 345, @"Failed to obfuacate super key of \"%@\" in range<%zu, %zu>!", v30, v31, v32, (uint64_t)v13);
        id v27 = v33;
        id v22 = v27;
        id v21 = 0;
        uint64_t v23 = 0;
LABEL_8:
        id v26 = 0;
LABEL_9:
        *a5 = v27;
        goto LABEL_10;
      }
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "length"));
      uint64_t v15 = [NSNumber numberWithUnsignedInteger:location];
      uint64_t v41 = [NSNumber numberWithUnsignedInteger:length];
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:]", 335, @"key length is %@, but super key range is {%@, %@}!", v16, v17, v18, (uint64_t)v14);

      char v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = 65;
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:]", 329, @"key pointer is nil!", v10, v11, v12, v40);
      char v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = 45;
    }
    id v27 = [v19 errorWithZhuGeErrorCode:v20 underlyingError:0];
    id v21 = 0;
    id v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    goto LABEL_8;
  }
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:]", 323, @"error p-pointer is nil!", v10, v11, v12, v40);
  id v21 = 0;
  id v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  id v26 = 0;
LABEL_10:
  id v28 = v21;

  return v28;
}

- (id)getPropertiesOfKey:(id)a3 withError:(id *)a4
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v10 = v6;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPropertiesOfKey:withError:]", 380, @"error p-pointer is nil!", v7, v8, v9, v87);
    id v18 = 0;
    id v19 = 0;
    id v20 = 0;
LABEL_8:
    uint64_t v14 = 0;
    goto LABEL_11;
  }
  *a4 = 0;
  if (!v6)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPropertiesOfKey:withError:]", 386, @"key pointer is nil!", v7, v8, v9, v87);
    id v21 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
    id v18 = 0;
LABEL_10:
    id v19 = 0;
    id v20 = 0;
    uint64_t v14 = 0;
    *a4 = v21;
    goto LABEL_11;
  }
  uint64_t v11 = [(AppleDeviceQueryArmoryHelperArmory *)self propertiesCache];

  if (!v11)
  {
    uint64_t v12 = [[AppleDeviceQueryCacheArmory alloc] initWithName:@"gPOK" andCapacity:&unk_26FC366F0 andCacheType:objc_opt_class()];
    [(AppleDeviceQueryArmoryHelperArmory *)self setPropertiesCache:v12];
  }
  uint64_t v13 = [(AppleDeviceQueryArmoryHelperArmory *)self propertiesCache];
  uint64_t v14 = [v13 getCacheForKey:v10];

  if (v14)
  {
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPropertiesOfKey:withError:]", 400, @"Hit cached properties for real key: \"%@\"", v15, v16, v17, (uint64_t)v10);
    id v18 = 0;
    id v19 = 0;
    id v20 = 0;
    goto LABEL_11;
  }
  id v116 = 0;
  uint64_t v14 = [(AppleDeviceQueryArmoryHelperArmory *)self propertiesOfKey:v10 withError:&v116];
  id v24 = v116;
  id v28 = v24;
  long long v98 = self;
  if (v14)
  {
    id v19 = 0;
    id v20 = 0;
LABEL_14:
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPropertiesOfKey:withError:]", 535, @"Caching properties for key: \"%@\"", v25, v26, v27, (uint64_t)v10);
    uint64_t v29 = [(AppleDeviceQueryArmoryHelperArmory *)v98 propertiesCache];
    id v99 = v28;
    char v30 = [v29 setCache:v14 forKey:v10 withError:&v99];
    id v18 = v99;

    if (v30) {
      goto LABEL_11;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPropertiesOfKey:withError:]", 538, @"Failed to cache properties for key \"%@\"!", v31, v32, v33, (uint64_t)v10);
    id v18 = v18;
    *a4 = v18;

    goto LABEL_8;
  }
  if ([v24 code] != 73)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPropertiesOfKey:withError:]", 410, @"Failed to get properties for key \"%@\" itself!", v34, v35, v36, (uint64_t)v10);
    uint64_t v38 = v28;
LABEL_20:
    id v21 = v38;
    id v18 = v21;
    goto LABEL_10;
  }
  id v115 = v28;
  uint64_t v14 = -[AppleDeviceQueryArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:](self, "propertiesByKey:andSuperKeyRange:withError:", v10, 0, [v10 length], &v115);
  id v37 = v115;

  if (v14)
  {
    id v19 = 0;
    id v20 = 0;
    id v28 = v37;
    goto LABEL_14;
  }
  if ([v37 code] != 73)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPropertiesOfKey:withError:]", 423, @"Failed to get properties for key \"%@\" in overall range!", v39, v40, v41, (uint64_t)v10);
    uint64_t v38 = v37;
    goto LABEL_20;
  }
  id v91 = v37;
  v88 = a4;
  uint64_t v89 = v10;
  id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id obj = [(AppleDeviceQueryArmoryHelperArmory *)self flexibleList];
  uint64_t v42 = [obj countByEnumeratingWithState:&v111 objects:v119 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v112;
    uint64_t v45 = @"ALIAS";
    do
    {
      uint64_t v46 = 0;
      uint64_t v94 = v43;
      do
      {
        if (*(void *)v112 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v47 = *(void *)(*((void *)&v111 + 1) + 8 * v46);
        uint64_t v48 = [(AppleDeviceQueryArmoryHelperArmory *)self keysConfig];
        v49 = [v48 objectForKeyedSubscript:v47];
        uint64_t v50 = [v49 objectForKeyedSubscript:v45];

        [v20 setObject:v47 forKeyedSubscript:v47];
        if ((isObjectNilOrZhuGeNull(v50) & 1) == 0)
        {
          uint64_t v51 = v44;
          uint64_t v52 = v45;
          long long v109 = 0u;
          long long v110 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          id v53 = v50;
          uint64_t v54 = [v53 countByEnumeratingWithState:&v107 objects:v118 count:16];
          if (v54)
          {
            uint64_t v55 = v54;
            uint64_t v56 = *(void *)v108;
            do
            {
              for (uint64_t i = 0; i != v55; ++i)
              {
                if (*(void *)v108 != v56) {
                  objc_enumerationMutation(v53);
                }
                [v20 setObject:v47 forKeyedSubscript:*(void *)(*((void *)&v107 + 1) + 8 * i)];
              }
              uint64_t v55 = [v53 countByEnumeratingWithState:&v107 objects:v118 count:16];
            }
            while (v55);
          }

          self = v98;
          uint64_t v45 = v52;
          uint64_t v44 = v51;
          uint64_t v43 = v94;
        }

        ++v46;
      }
      while (v46 != v43);
      uint64_t v43 = [obj countByEnumeratingWithState:&v111 objects:v119 count:16];
    }
    while (v43);
  }

  long long v58 = [v20 allKeys];
  id v59 = [v58 sortedArrayUsingComparator:&__block_literal_global_1];

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v19 = v59;
  uint64_t v95 = [v19 countByEnumeratingWithState:&v103 objects:v117 count:16];
  if (!v95)
  {
    uint64_t v10 = v89;
    id v18 = v91;
    goto LABEL_60;
  }
  uint64_t v93 = *(void *)v104;
  uint64_t v10 = v89;
  id v18 = v91;
  while (2)
  {
    for (uint64_t j = 0; j != v95; ++j)
    {
      uint64_t v61 = v18;
      if (*(void *)v104 != v93) {
        objc_enumerationMutation(v19);
      }
      uint64_t v62 = *(void **)(*((void *)&v103 + 1) + 8 * j);
      uint64_t v63 = [v20 objectForKeyedSubscript:v62];
      int v64 = [(AppleDeviceQueryArmoryHelperArmory *)v98 keysConfig];
      id obja = [v64 objectForKeyedSubscript:v63];

      id v102 = v61;
      id v65 = getElucidatedStringLen(v62, &v102);
      id v66 = v102;

      if (!v65)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPropertiesOfKey:withError:]", 484, @"Failed to get length of flexible key \"%@\"!", v67, v68, v69, (uint64_t)v62);
        id v18 = v66;
        id *v88 = v18;
        goto LABEL_62;
      }
      unint64_t v70 = [v89 length];
      if (v70 <= [v65 unsignedIntegerValue])
      {
        v71 = 0;
LABEL_54:
        id v18 = v66;
        goto LABEL_55;
      }
      v71 = [obja objectForKeyedSubscript:@"FLEXIBLE_PATTERN"];
      if ([v71 isEqualToString:@"^(?:$superkey)(.+)$"])
      {
        v92 = v63;
        uint64_t v72 = [v65 unsignedIntegerValue];
        id v101 = v66;
        uint64_t v14 = -[AppleDeviceQueryArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:](v98, "propertiesByKey:andSuperKeyRange:withError:", v89, 0, v72, &v101);
        id v73 = v101;

        if (!v14)
        {
          if ([v73 code] == 73)
          {
            id v18 = v73;
            uint64_t v63 = v92;
            goto LABEL_55;
          }
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPropertiesOfKey:withError:]", 503, @"Failed to get properties for key \"%@\" in MERMAID!", v74, v75, v76, (uint64_t)v62);
          id v18 = v73;
          id *v88 = v18;

          uint64_t v63 = v92;
LABEL_62:

          goto LABEL_8;
        }
        id v28 = v73;
LABEL_66:

        a4 = v88;
        goto LABEL_14;
      }
      if (![v71 isEqualToString:@"^(.+)(?:$superkey)$"]) {
        goto LABEL_54;
      }
      uint64_t v90 = v71;
      v92 = v63;
      uint64_t v77 = [v89 length];
      uint64_t v78 = v77 - [v65 unsignedIntegerValue];
      uint64_t v79 = [v65 unsignedIntegerValue];
      id v100 = v66;
      uint64_t v14 = -[AppleDeviceQueryArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:](v98, "propertiesByKey:andSuperKeyRange:withError:", v89, v78, v79, &v100);
      id v80 = v100;

      if (v14)
      {
        id v28 = v80;
        v71 = v90;
        goto LABEL_66;
      }
      uint64_t v63 = v92;
      if ([v80 code] != 73)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPropertiesOfKey:withError:]", 519, @"Failed to get properties for key \"%@\" in TAUREN!", v81, v82, v83, (uint64_t)v62);
        id v18 = v80;
        id *v88 = v18;

        goto LABEL_62;
      }
      id v18 = v80;
      v71 = v90;
LABEL_55:
    }
    uint64_t v95 = [v19 countByEnumeratingWithState:&v103 objects:v117 count:16];
    if (v95) {
      continue;
    }
    break;
  }
LABEL_60:

  ZhuGeLog(524800, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPropertiesOfKey:withError:]", 528, @"Key \"%@\" does not match any definition!", v84, v85, v86, (uint64_t)v10);
  [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:74 underlyingError:0];
  uint64_t v14 = 0;
  id *v88 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
  id v22 = v14;

  return v22;
}

uint64_t __67__AppleDeviceQueryArmoryHelperArmory_getPropertiesOfKey_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v22 = 0;
  id v6 = getElucidatedStringLen(v4, &v22);
  id v7 = v22;
  uint64_t v11 = v7;
  if (v6)
  {
    id v21 = v7;
    uint64_t v12 = getElucidatedStringLen(v5, &v21);
    id v13 = v21;

    if (v12)
    {
      unint64_t v17 = [v6 unsignedIntegerValue];
      if (v17 <= [v12 unsignedIntegerValue])
      {
        unint64_t v19 = [v6 unsignedIntegerValue];
        uint64_t v18 = v19 < [v12 unsignedIntegerValue];
      }
      else
      {
        uint64_t v18 = -1;
      }
    }
    else
    {
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPropertiesOfKey:withError:]_block_invoke", 458, @"Failed to get length for str2: %@, error: %@", v14, v15, v16, (uint64_t)v5);
      uint64_t v18 = 0;
    }
    uint64_t v11 = v13;
  }
  else
  {
    ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPropertiesOfKey:withError:]_block_invoke", 452, @"Failed to get length for str1: %@, error: %@", v8, v9, v10, (uint64_t)v4);
    uint64_t v18 = 0;
    uint64_t v12 = 0;
  }

  return v18;
}

- (AppleDeviceQueryArmoryHelperArmory)initWithRawConfig:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)AppleDeviceQueryArmoryHelperArmory;
  id v5 = [(AppleDeviceQueryArmoryHelperArmory *)&v34 init];
  uint64_t v9 = v5;
  if (v5)
  {
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory initWithRawConfig:]", 562, @"Initialize config for ZhuGeArmoryHelper instance \"%@\"", v6, v7, v8, (uint64_t)v5);
    id v33 = 0;
    uint64_t v10 = [(AppleDeviceQueryArmoryHelperArmory *)v9 unionizeRawConfig:v4 withError:&v33];
    id v11 = v33;
    keysConfig = v9->_keysConfig;
    v9->_keysConfig = (NSDictionary *)v10;

    uint64_t v16 = v9->_keysConfig;
    if (v16)
    {
      id v32 = v11;
      uint64_t v17 = [(AppleDeviceQueryArmoryHelperArmory *)v9 sortAliasFromUnionizedConfig:v16 withError:&v32];
      id v18 = v32;

      aliasesMap = v9->_aliasesMap;
      v9->_aliasesMap = (NSDictionary *)v17;

      if (v9->_aliasesMap)
      {
        uint64_t v23 = v9->_keysConfig;
        id v31 = v18;
        uint64_t v24 = [(AppleDeviceQueryArmoryHelperArmory *)v9 pickFlexibleFromUnionizedConfig:v23 withError:&v31];
        id v11 = v31;

        flexibleList = v9->_flexibleList;
        v9->_flexibleList = (NSArray *)v24;

        if (!v9->_flexibleList) {
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory initWithRawConfig:]", 579, @"Failed to get flexible list from keys config, error %@", v26, v27, v28, (uint64_t)v11);
        }
      }
      else
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory initWithRawConfig:]", 573, @"Failed to get aliases map from keys config, error %@", v20, v21, v22, (uint64_t)v18);
        id v11 = v18;
      }
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory initWithRawConfig:]", 567, @"Failed to get keys config from raw config, error %@", v13, v14, v15, (uint64_t)v11);
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory initWithRawConfig:]", 558, @"Failed to initialize an instance for ZhuGeArmoryHelper!", v6, v7, v8, v30);
    id v11 = 0;
  }

  return v9;
}

- (id)getPrimarykeyOfKey:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = v6;
  if (a4)
  {
    *a4 = 0;
    if (v6)
    {
      id v23 = 0;
      id v11 = [(AppleDeviceQueryArmoryHelperArmory *)self getPropertiesOfKey:v6 withError:&v23];
      id v15 = v23;
      if (v11)
      {
        unint64_t v19 = [v11 objectForKeyedSubscript:@"p_primarykey"];
        if (v19) {
          goto LABEL_10;
        }
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPrimarykeyOfKey:withError:]", 619, @"Unexpected nil primary key of key \"%@\"!", v16, v17, v18, (uint64_t)v10);
        id v20 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
      }
      else
      {
        ZhuGeLog(263184, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPrimarykeyOfKey:withError:]", 612, @"Failed to get properties of \"%@\" for primary key!", v12, v13, v14, (uint64_t)v10);
        id v20 = v15;
        id v15 = v20;
        unint64_t v19 = 0;
      }
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPrimarykeyOfKey:withError:]", 604, @"key pointer is nil!", v7, v8, v9, v22);
      id v20 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
      id v11 = 0;
      unint64_t v19 = 0;
      id v15 = 0;
    }
    *a4 = v20;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getPrimarykeyOfKey:withError:]", 598, @"error p-pointer is nil!", v7, v8, v9, v22);
    id v11 = 0;
    unint64_t v19 = 0;
    id v15 = 0;
  }
LABEL_10:

  return v19;
}

- (id)getConfigOfKey:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = v6;
  if (a4)
  {
    *a4 = 0;
    if (v6)
    {
      id v23 = 0;
      id v11 = [(AppleDeviceQueryArmoryHelperArmory *)self getPropertiesOfKey:v6 withError:&v23];
      id v15 = v23;
      if (v11)
      {
        unint64_t v19 = [v11 objectForKeyedSubscript:@"p_config"];
        if (v19) {
          goto LABEL_10;
        }
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getConfigOfKey:withError:]", 657, @"Unexpected nil config of key \"%@\"!", v16, v17, v18, (uint64_t)v10);
        id v20 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
      }
      else
      {
        ZhuGeLog(263184, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getConfigOfKey:withError:]", 650, @"Failed to get properties of \"%@\" for config!", v12, v13, v14, (uint64_t)v10);
        id v20 = v15;
        id v15 = v20;
        unint64_t v19 = 0;
      }
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getConfigOfKey:withError:]", 642, @"key pointer is nil!", v7, v8, v9, v22);
      id v20 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
      id v11 = 0;
      unint64_t v19 = 0;
      id v15 = 0;
    }
    *a4 = v20;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getConfigOfKey:withError:]", 636, @"error p-pointer is nil!", v7, v8, v9, v22);
    id v11 = 0;
    unint64_t v19 = 0;
    id v15 = 0;
  }
LABEL_10:

  return v19;
}

- (id)isKeyAlias:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = v6;
  if (a4)
  {
    *a4 = 0;
    if (v6)
    {
      id v23 = 0;
      id v11 = [(AppleDeviceQueryArmoryHelperArmory *)self getPropertiesOfKey:v6 withError:&v23];
      id v15 = v23;
      if (v11)
      {
        unint64_t v19 = [v11 objectForKeyedSubscript:@"p_is_alias"];
        if (v19) {
          goto LABEL_10;
        }
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory isKeyAlias:withError:]", 695, @"Unexpected nil isAlias of key \"%@\"!", v16, v17, v18, (uint64_t)v10);
        id v20 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
      }
      else
      {
        ZhuGeLog(263184, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory isKeyAlias:withError:]", 688, @"Failed to get properties of \"%@\" for alias!", v12, v13, v14, (uint64_t)v10);
        id v20 = v15;
        id v15 = v20;
        unint64_t v19 = 0;
      }
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory isKeyAlias:withError:]", 680, @"key pointer is nil!", v7, v8, v9, v22);
      id v20 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
      id v11 = 0;
      unint64_t v19 = 0;
      id v15 = 0;
    }
    *a4 = v20;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory isKeyAlias:withError:]", 674, @"error p-pointer is nil!", v7, v8, v9, v22);
    id v11 = 0;
    unint64_t v19 = 0;
    id v15 = 0;
  }
LABEL_10:

  return v19;
}

- (id)getSubkeyOfKey:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = v6;
  if (a4)
  {
    *a4 = 0;
    if (v6)
    {
      id v23 = 0;
      id v11 = [(AppleDeviceQueryArmoryHelperArmory *)self getPropertiesOfKey:v6 withError:&v23];
      id v15 = v23;
      if (v11)
      {
        unint64_t v19 = [v11 objectForKeyedSubscript:@"p_subkey"];
        if (v19) {
          goto LABEL_10;
        }
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getSubkeyOfKey:withError:]", 733, @"Lacking subkey of key \"%@\"!", v16, v17, v18, (uint64_t)v10);
        id v20 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
      }
      else
      {
        ZhuGeLog(263184, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getSubkeyOfKey:withError:]", 726, @"Failed to get properties of \"%@\" for subkey!", v12, v13, v14, (uint64_t)v10);
        id v20 = v15;
        id v15 = v20;
        unint64_t v19 = 0;
      }
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getSubkeyOfKey:withError:]", 718, @"key pointer is nil!", v7, v8, v9, v22);
      id v20 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
      id v11 = 0;
      unint64_t v19 = 0;
      id v15 = 0;
    }
    *a4 = v20;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getSubkeyOfKey:withError:]", 712, @"error p-pointer is nil!", v7, v8, v9, v22);
    id v11 = 0;
    unint64_t v19 = 0;
    id v15 = 0;
  }
LABEL_10:

  return v19;
}

- (id)getObfuscatedKey:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = v6;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getObfuscatedKey:withError:]", 750, @"error p-pointer is nil!", v7, v8, v9, v23);
    id v11 = 0;
    id v20 = 0;
    id v15 = 0;
    goto LABEL_11;
  }
  *a4 = 0;
  if (!v6)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getObfuscatedKey:withError:]", 756, @"key pointer is nil!", v7, v8, v9, v23);
    id v21 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
    id v11 = 0;
    id v20 = 0;
    id v15 = 0;
LABEL_10:
    *a4 = v21;
    goto LABEL_11;
  }
  id v24 = 0;
  id v11 = [(AppleDeviceQueryArmoryHelperArmory *)self getPropertiesOfKey:v6 withError:&v24];
  id v15 = v24;
  if (!v11)
  {
    ZhuGeLog(263184, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getObfuscatedKey:withError:]", 764, @"Failed to get properties of \"%@\" for itself!", v12, v13, v14, (uint64_t)v10);
    id v21 = v15;
    id v15 = v21;
    id v20 = 0;
    goto LABEL_10;
  }
  id v16 = [v11 objectForKeyedSubscript:@"p_obfuscated_key"];
  if (!v16)
  {
    ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[AppleDeviceQueryArmoryHelperArmory getObfuscatedKey:withError:]", 771, @"Original key \"%@\" is already obfuscated", v17, v18, v19, (uint64_t)v10);
    id v16 = v10;
  }
  id v20 = v16;
LABEL_11:

  return v20;
}

- (NSDictionary)keysConfig
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)aliasesMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)flexibleList
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (AppleDeviceQueryCacheArmory)propertiesCache
{
  return (AppleDeviceQueryCacheArmory *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPropertiesCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesCache, 0);
  objc_storeStrong((id *)&self->_flexibleList, 0);
  objc_storeStrong((id *)&self->_aliasesMap, 0);

  objc_storeStrong((id *)&self->_keysConfig, 0);
}

@end