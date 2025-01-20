@interface AXOutputRequest
+ (id)addAttributesToAction:(id)a3 fromDictionary:(id)a4;
+ (id)processString:(id)a3 brailleString:(id)a4 breakWords:(BOOL)a5 withLanguage:(id)a6 atIndex:(int64_t)a7 category:(id)a8;
+ (id)processStringsAndLanguages:(id)a3 brailleString:(id)a4 breakWords:(BOOL)a5 withLanguage:(id)a6 atIndex:(int64_t)a7 category:(id)a8;
@end

@implementation AXOutputRequest

+ (id)processString:(id)a3 brailleString:(id)a4 breakWords:(BOOL)a5 withLanguage:(id)a6 atIndex:(int64_t)a7 category:(id)a8
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a8;
  v15 = objc_opt_new();
  if (v11)
  {
    v16 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v25 = v14;
    if ((unint64_t)[v11 length] < 0x3E9)
    {
      v21 = 0;
    }
    else
    {
      v17 = 0;
      v18 = v11;
      while (2)
      {
        uint64_t v19 = 1000;
        while ((objc_msgSend(v16, "characterIsMember:", objc_msgSend(v18, "characterAtIndex:", v19)) & 1) == 0)
        {
          if (--v19 == -1)
          {
            uint64_t v19 = [v18 length];
            if (v19 < 0)
            {
              id v11 = v18;
              v21 = v17;
              goto LABEL_14;
            }
            break;
          }
        }
        v20 = [v18 substringToIndex:v19];
        v21 = (void *)[objc_allocWithZone((Class)AXOutputAction) initWithString:v20 brailleString:v12];

        [v21 setWasDivided:1];
        [v21 setObject:v13 forVariant:15];
        [v15 addObject:v21];
        unint64_t v22 = v19 + 1;
        if (v22 >= [v18 length])
        {

          id v11 = v18;
        }
        else
        {
          id v11 = [v18 substringFromIndex:v22];

          v18 = v11;
          v17 = v21;
          if ((unint64_t)[v11 length] > 0x3E8) {
            continue;
          }
        }
        break;
      }
    }
LABEL_14:
    if ([v11 length])
    {
      v23 = (void *)[objc_allocWithZone((Class)AXOutputAction) initWithString:v11 brailleString:v12];

      [v23 setWasDivided:1];
      id v14 = v25;
      [v23 setObject:v25 forVariant:86];
      if ([v13 length]) {
        [v23 setObject:v13 forVariant:15];
      }
      [v15 addObject:v23];
    }
    else
    {
      v23 = v21;
      id v14 = v25;
    }
  }

  return v15;
}

+ (id)processStringsAndLanguages:(id)a3 brailleString:(id)a4 breakWords:(BOOL)a5 withLanguage:(id)a6 atIndex:(int64_t)a7 category:(id)a8
{
  BOOL v39 = a5;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = (__CFString *)a6;
  id v40 = a8;
  v15 = objc_opt_new();
  if (v12)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v35 = v12;
    obuint64_t j = v12;
    uint64_t v41 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v41)
    {
      uint64_t v16 = *(void *)v47;
      uint64_t v17 = MEMORY[0x1E4F1CC38];
      uint64_t v36 = *(void *)v47;
      int64_t v37 = a7;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v47 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v20 = [v19 objectForKeyedSubscript:@"language"];

          v21 = [MEMORY[0x1E4F1CA98] null];
          char v22 = [(__CFString *)v20 isEqual:v21];

          if ((v22 & 1) != 0 || !v20)
          {

            id v14 = &stru_1EDC3DEF8;
          }
          else
          {
            id v14 = v20;
          }
          v23 = [v19 objectForKeyedSubscript:@"string"];
          v24 = +[AXOutputRequest processString:v23 brailleString:v13 breakWords:v39 withLanguage:v14 atIndex:a7 category:v40];

          [v15 axSafelyAddObjectsFromArray:v24];
          id v25 = [v19 objectForKeyedSubscript:@"skipsUnpronounceable"];
          int v26 = [v25 BOOLValue];

          if (v26)
          {
            v27 = v15;
            id v28 = v13;
            long long v44 = 0u;
            long long v45 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            id v29 = v24;
            uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v50 count:16];
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v32 = *(void *)v43;
              do
              {
                for (uint64_t j = 0; j != v31; ++j)
                {
                  if (*(void *)v43 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  [*(id *)(*((void *)&v42 + 1) + 8 * j) setObject:v17 forVariant:83];
                }
                uint64_t v31 = [v29 countByEnumeratingWithState:&v42 objects:v50 count:16];
              }
              while (v31);
            }

            id v13 = v28;
            v15 = v27;
            uint64_t v16 = v36;
            a7 = v37;
          }
        }
        uint64_t v41 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v41);
    }

    id v12 = v35;
  }

  return v15;
}

+ (id)addAttributesToAction:(id)a3 fromDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 objectForKey:*MEMORY[0x1E4F48988]];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F1CFD0];
    v10 = v5;
    uint64_t v11 = 45;
  }
  else
  {
    id v12 = [v6 objectForKey:*MEMORY[0x1E4F48A68]];
    int v13 = [v12 BOOLValue];

    if (v13)
    {
      uint64_t v9 = *MEMORY[0x1E4F1CFD0];
      v10 = v5;
      uint64_t v11 = 46;
    }
    else
    {
      id v14 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F48AD0]];
      int v15 = [v14 BOOLValue];

      if (v15)
      {
        uint64_t v9 = *MEMORY[0x1E4F1CFD0];
        v10 = v5;
        uint64_t v11 = 41;
      }
      else
      {
        uint64_t v16 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F48B18]];
        int v17 = [v16 BOOLValue];

        if (v17)
        {
          uint64_t v9 = *MEMORY[0x1E4F1CFD0];
          v10 = v5;
          uint64_t v11 = 65;
        }
        else
        {
          v18 = [v6 objectForKey:*MEMORY[0x1E4F48A90]];
          int v19 = [v18 BOOLValue];

          if (v19)
          {
            uint64_t v9 = *MEMORY[0x1E4F1CFD0];
            v10 = v5;
            uint64_t v11 = 44;
          }
          else
          {
            v20 = [v6 objectForKey:*MEMORY[0x1E4F489B8]];
            int v21 = [v20 BOOLValue];

            if (!v21)
            {
              v119 = [v6 objectForKey:*MEMORY[0x1E4F48998]];
              int v120 = [v119 BOOLValue];

              if (v120)
              {
                v121 = [v5 string];
                v122 = [v121 lowercaseString];
                [v5 setString:v122];
              }
              else
              {
                v123 = [v6 objectForKey:*MEMORY[0x1E4F489B0]];
                int v124 = [v123 BOOLValue];

                if (v124)
                {
                  uint64_t v9 = *MEMORY[0x1E4F1CFD0];
                  v10 = v5;
                  uint64_t v11 = 47;
                  goto LABEL_13;
                }
                v125 = [v6 objectForKey:*MEMORY[0x1E4F489C0]];
                int v126 = [v125 BOOLValue];

                if (v126)
                {
                  uint64_t v9 = *MEMORY[0x1E4F1CFD0];
                  v10 = v5;
                  uint64_t v11 = 48;
                  goto LABEL_13;
                }
                v127 = [v6 objectForKey:*MEMORY[0x1E4F489A0]];
                int v128 = [v127 BOOLValue];

                if (v128)
                {
                  uint64_t v9 = *MEMORY[0x1E4F1CFD0];
                  v10 = v5;
                  uint64_t v11 = 49;
                  goto LABEL_13;
                }
                v129 = [v6 objectForKey:*MEMORY[0x1E4F48AD8]];
                int v130 = [v129 BOOLValue];

                if (v130)
                {
                  uint64_t v9 = *MEMORY[0x1E4F1CFD0];
                  v10 = v5;
                  uint64_t v11 = 51;
                  goto LABEL_13;
                }
                v131 = (void *)MEMORY[0x1E4F48AA8];
                v132 = [v6 objectForKey:*MEMORY[0x1E4F48AA8]];

                if (v132)
                {
                  v121 = [v6 objectForKey:*v131];
                  v133 = v5;
                  v134 = v121;
                  uint64_t v135 = 75;
                }
                else
                {
                  v136 = (void *)MEMORY[0x1E4F48968];
                  v137 = [v6 objectForKey:*MEMORY[0x1E4F48968]];

                  if (!v137)
                  {
                    v138 = [v6 objectForKey:*MEMORY[0x1E4F48A98]];
                    int v139 = [v138 BOOLValue];

                    if (!v139) {
                      goto LABEL_14;
                    }
                    uint64_t v9 = *MEMORY[0x1E4F1CFD0];
                    v10 = v5;
                    uint64_t v11 = 64;
                    goto LABEL_13;
                  }
                  v121 = [v6 objectForKey:*v136];
                  v133 = v5;
                  v134 = v121;
                  uint64_t v135 = 85;
                }
                [v133 setObject:v134 forVariant:v135];
              }

              goto LABEL_14;
            }
            uint64_t v9 = *MEMORY[0x1E4F1CFD0];
            v10 = v5;
            uint64_t v11 = 60;
          }
        }
      }
    }
  }
LABEL_13:
  [v10 setObject:v9 forVariant:v11];
LABEL_14:
  uint64_t v22 = *MEMORY[0x1E4F488C8];
  v23 = [v6 objectForKey:*MEMORY[0x1E4F488C8]];

  if (v23)
  {
    v24 = [v6 objectForKey:v22];
    [v5 setObject:v24 forVariant:78];

    [v5 setObject:MEMORY[0x1E4F1CC38] forVariant:54];
  }
  uint64_t v25 = *MEMORY[0x1E4F488E8];
  int v26 = [v6 objectForKey:*MEMORY[0x1E4F488E8]];

  if (v26)
  {
    v27 = [v6 objectForKey:v25];
    [v5 setObject:v27 forVariant:79];
  }
  id v28 = [v6 objectForKey:*MEMORY[0x1E4F48A20]];
  int v29 = [v28 BOOLValue];

  if (v29) {
    [v5 setObject:*MEMORY[0x1E4F1CFD0] forVariant:52];
  }
  uint64_t v30 = [NSNumber numberWithUnsignedLongLong:*MEMORY[0x1E4F48BF8]];
  uint64_t v31 = [v6 objectForKey:v30];
  int v32 = [v31 BOOLValue];

  if (v32) {
    [v5 setObject:*MEMORY[0x1E4F1CFD0] forVariant:53];
  }
  v33 = (void *)MEMORY[0x1E4F489F0];
  v34 = [v6 objectForKey:*MEMORY[0x1E4F489F0]];

  if (v34)
  {
    id v35 = [v6 objectForKey:*v33];
    [v5 setObject:v35 forVariant:62];
  }
  uint64_t v36 = [v6 objectForKey:*MEMORY[0x1E4F48A88]];
  int v37 = [v36 BOOLValue];

  if (v37) {
    [v5 setObject:*MEMORY[0x1E4F1CFD0] forVariant:55];
  }
  v38 = [v6 objectForKey:*MEMORY[0x1E4F48A50]];
  int v39 = [v38 BOOLValue];

  if (v39) {
    [v5 setObject:*MEMORY[0x1E4F1CFD0] forVariant:56];
  }
  id v40 = [v6 objectForKey:*MEMORY[0x1E4F489F8]];
  int v41 = [v40 BOOLValue];

  if (v41) {
    [v5 setObject:*MEMORY[0x1E4F1CFD0] forVariant:66];
  }
  long long v42 = (void *)MEMORY[0x1E4F48A18];
  long long v43 = [v6 objectForKey:*MEMORY[0x1E4F48A18]];

  if (v43) {
    goto LABEL_31;
  }
  uint64_t v108 = *MEMORY[0x1E4F488C0];
  v109 = [v6 objectForKey:*MEMORY[0x1E4F488C0]];

  if (v109)
  {
    long long v44 = [v6 objectForKey:v108];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v44 length]) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  long long v42 = (void *)MEMORY[0x1E4F48948];
  v112 = [v6 objectForKey:*MEMORY[0x1E4F48948]];

  if (v112
    || (long long v42 = (void *)MEMORY[0x1E4F48A60],
        [v6 objectForKey:*MEMORY[0x1E4F48A60]],
        v113 = objc_claimAutoreleasedReturnValue(),
        v113,
        v113))
  {
LABEL_31:
    long long v44 = [v6 objectForKey:*v42];
LABEL_32:
    [v5 setObject:v44 forVariant:15];
LABEL_33:
  }
  long long v45 = (void *)MEMORY[0x1E4F48A70];
  long long v46 = [v6 objectForKey:*MEMORY[0x1E4F48A70]];

  if (v46)
  {
    long long v47 = [v6 objectForKey:*v45];
    [v5 setObject:v47 forVariant:16];
  }
  long long v48 = (void *)MEMORY[0x1E4F489A8];
  long long v49 = [v6 objectForKey:*MEMORY[0x1E4F489A8]];

  if (v49)
  {
    v50 = [v6 objectForKey:*v48];
    [v5 setObject:v50 forVariant:77];
  }
  v51 = (uint64_t *)MEMORY[0x1E4F48B08];
  uint64_t v52 = [v6 objectForKey:*MEMORY[0x1E4F48B08]];
  int v53 = [v52 BOOLValue];

  v54 = (uint64_t *)MEMORY[0x1E4F48B10];
  if (v53)
  {
    uint64_t v55 = *v51;
LABEL_42:
    v58 = v5;
    uint64_t v59 = 30;
LABEL_43:
    [v58 setObject:v55 forVariant:v59];
    goto LABEL_44;
  }
  v56 = [v6 objectForKey:*MEMORY[0x1E4F48B10]];
  int v57 = [v56 BOOLValue];

  if (v57)
  {
    uint64_t v55 = *v54;
    goto LABEL_42;
  }
  v110 = [v6 objectForKey:*MEMORY[0x1E4F48B00]];
  int v111 = [v110 BOOLValue];

  if (v111)
  {
    uint64_t v55 = *MEMORY[0x1E4F1CFD0];
    v58 = v5;
    uint64_t v59 = 31;
    goto LABEL_43;
  }
  v114 = [v6 objectForKey:*MEMORY[0x1E4F48A00]];
  int v115 = [v114 BOOLValue];

  if (v115)
  {
    uint64_t v55 = *MEMORY[0x1E4F1CFD0];
    v58 = v5;
    uint64_t v59 = 70;
    goto LABEL_43;
  }
  uint64_t v116 = *MEMORY[0x1E4F48930];
  v117 = [v6 objectForKey:*MEMORY[0x1E4F48930]];

  if (v117)
  {
    v118 = [v6 objectForKey:v116];
    [v5 setObject:v118 forVariant:88];
  }
LABEL_44:
  v60 = [v6 objectForKey:*MEMORY[0x1E4F48A38]];
  if ([v60 BOOLValue])
  {
  }
  else
  {
    v61 = [v6 objectForKey:*MEMORY[0x1E4F488E0]];
    int v62 = [v61 BOOLValue];

    if (!v62) {
      goto LABEL_48;
    }
  }
  [v5 setObject:*MEMORY[0x1E4F1CFD0] forVariant:28];
LABEL_48:
  v63 = (void *)MEMORY[0x1E4F48950];
  v64 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F48950]];

  if (v64)
  {
    v65 = [v6 objectForKeyedSubscript:*v63];
    [v5 setObject:v65 forVariant:42];
  }
  v66 = [v6 objectForKey:*MEMORY[0x1E4F48A40]];
  uint64_t v67 = [v5 rangeOfString];
  if (v66)
  {
    uint64_t v69 = v67;
    uint64_t v70 = v68;
    v71 = [MEMORY[0x1E4F28E60] indexSet];
    v140[0] = MEMORY[0x1E4F143A8];
    v140[1] = 3221225472;
    v140[2] = __56__AXOutputRequest_addAttributesToAction_fromDictionary___block_invoke;
    v140[3] = &unk_1E55871D0;
    uint64_t v142 = v69;
    uint64_t v143 = v70;
    id v72 = v71;
    id v141 = v72;
    [v66 enumerateRangesUsingBlock:v140];
    [v5 setObject:v72 forVariant:29];
  }
  v73 = (void *)MEMORY[0x1E4F48B30];
  v74 = [v6 objectForKey:*MEMORY[0x1E4F48B30]];

  if (v74)
  {
    v75 = [v6 objectForKey:*v73];
    [v5 setString:v75];

    [v5 setObject:MEMORY[0x1E4F1CC38] forVariant:54];
  }
  v76 = (void *)MEMORY[0x1E4F489E8];
  v77 = [v6 objectForKey:*MEMORY[0x1E4F489E8]];
  char v78 = [v77 BOOLValue];

  if ((v78 & 1) != 0
    || (v76 = (void *)MEMORY[0x1E4F48A48],
        [v6 objectForKey:*MEMORY[0x1E4F48A48]],
        v79 = objc_claimAutoreleasedReturnValue(),
        int v80 = [v79 BOOLValue],
        v79,
        v80))
  {
    [v5 setObject:*v76 forVariant:32];
  }
  uint64_t v81 = *MEMORY[0x1E4F488D0];
  v82 = [v6 objectForKey:*MEMORY[0x1E4F488D0]];

  if (v82)
  {
    v83 = [v6 objectForKey:v81];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v83 floatValue];
      double v85 = v84;
      if (v85 > 2.0) {
        double v85 = 2.0;
      }
      double v86 = fmax(v85, 0.0);
      *(float *)&double v86 = v86;
      v87 = [NSNumber numberWithFloat:v86];
      [v5 setObject:v87 forVariant:32];
    }
  }
  uint64_t v88 = *MEMORY[0x1E4F488D8];
  v89 = [v6 objectForKey:*MEMORY[0x1E4F488D8]];

  if (v89)
  {
    v90 = [v6 objectForKey:v88];
    if ([v90 BOOLValue]) {
      v91 = v51;
    }
    else {
      v91 = v54;
    }
    [v5 setObject:*v91 forVariant:30];
  }
  v92 = (void *)MEMORY[0x1E4F48AF8];
  v93 = [v6 objectForKey:*MEMORY[0x1E4F48AF8]];

  if (v93)
  {
    v94 = [v6 objectForKey:*v92];
    [v5 setObject:v94 forVariant:71];
  }
  v95 = (void *)MEMORY[0x1E4F48980];
  v96 = [v6 objectForKey:*MEMORY[0x1E4F48980]];

  if (v96)
  {
    v97 = [v6 objectForKey:*v95];
    [v5 setObject:v97 forVariant:72];
  }
  v98 = (void *)MEMORY[0x1E4F48978];
  v99 = [v6 objectForKey:*MEMORY[0x1E4F48978]];

  if (v99)
  {
    v100 = [v6 objectForKey:*v98];
    [v5 setObject:v100 forVariant:73];
  }
  v101 = (void *)MEMORY[0x1E4F48AA0];
  v102 = [v6 objectForKey:*MEMORY[0x1E4F48AA0]];
  int v103 = [v102 BOOLValue];

  if (v103) {
    [v5 setObject:*v101 forVariant:32];
  }
  v104 = [v6 objectForKey:*MEMORY[0x1E4F48960]];
  int v105 = [v104 BOOLValue];

  if (v105) {
    [v5 setObject:*MEMORY[0x1E4F1CFD0] forVariant:61];
  }
  id v106 = v5;

  return v106;
}

NSUInteger __56__AXOutputRequest_addAttributesToAction_fromDictionary___block_invoke(uint64_t a1, NSRange range2)
{
  NSUInteger length = range2.length;
  NSUInteger location = range2.location;
  v10.NSUInteger location = range2.location;
  v10.NSUInteger length = length;
  NSRange v6 = NSIntersectionRange(*(NSRange *)(a1 + 40), v10);
  NSUInteger result = v6.location;
  if (v6.length)
  {
    v7 = *(void **)(a1 + 32);
    NSUInteger v8 = location - *(void *)(a1 + 40);
    return objc_msgSend(v7, "addIndexesInRange:", v8, length);
  }
  return result;
}

@end