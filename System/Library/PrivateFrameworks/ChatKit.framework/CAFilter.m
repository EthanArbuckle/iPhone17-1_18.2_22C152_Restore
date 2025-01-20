@interface CAFilter
@end

@implementation CAFilter

void __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) setObject:v6 forKey:v5];
  }
  else {
    _IMWarn();
  }
}

void __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 containsObject:v9]) {
    [*(id *)(a1 + 32) setObject:v9 forKey:v8];
  }
  else {
    _IMWarn();
  }
}

void __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            _IMWarn();

            goto LABEL_13;
          }
          [v8 addObject:v14];
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    [*(id *)(a1 + 32) setObject:v9 forKey:v6];
LABEL_13:
  }
  else
  {
    _IMWarn();
  }
}

void __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();
  _IMWarn();
}

void __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v20;
    id v7 = [v6 _numberForKey:@"x"];
    [v7 floatValue];
    double v9 = v8;

    uint64_t v10 = [v6 _numberForKey:@"y"];
    [v10 floatValue];
    double v12 = v11;

    uint64_t v13 = [v6 _numberForKey:@"width"];
    [v13 floatValue];
    double v15 = v14;

    long long v16 = [v6 _numberForKey:@"height"];

    [v16 floatValue];
    double v18 = v17;

    v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v9, v12, v15, v18);
    [*(id *)(a1 + 32) setObject:v19 forKey:v5];
  }
  else
  {
    _IMWarn();
  }
}

uint64_t __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_6()
{
  return _IMWarn();
}

void __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _IMWarn();
    goto LABEL_27;
  }
  id v7 = v5;
  if ([v7 count] != 4)
  {
    _IMWarn();
    goto LABEL_26;
  }
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v110 objects:v115 count:16];
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v111;
  id v103 = v6;
  id v104 = v7;
  uint64_t v99 = *(void *)v111;
  uint64_t v101 = a1;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v111 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v110 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v6 = v103;
        _IMWarn();
LABEL_25:

        id v7 = v104;
        goto LABEL_26;
      }
      id v14 = v13;
      if ([v14 count] != 5)
      {
        id v6 = v103;
        _IMWarn();
LABEL_24:

        goto LABEL_25;
      }
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      id v14 = v14;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v106 objects:v114 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v107;
        while (2)
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v107 != v17) {
              objc_enumerationMutation(v14);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v6 = v103;
              _IMWarn();

              goto LABEL_24;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v106 objects:v114 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      a1 = v101;
      uint64_t v11 = v99;
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v110 objects:v115 count:16];
    id v6 = v103;
    id v7 = v104;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_20:

  id v19 = v8;
  id v20 = [v19 objectAtIndexedSubscript:0];
  v21 = [v20 objectAtIndexedSubscript:0];
  [v21 floatValue];
  int v102 = v22;

  v23 = [v19 objectAtIndexedSubscript:0];
  v24 = [v23 objectAtIndexedSubscript:1];
  [v24 floatValue];
  int v100 = v25;

  v26 = [v19 objectAtIndexedSubscript:0];
  v27 = [v26 objectAtIndexedSubscript:2];
  [v27 floatValue];
  int v98 = v28;

  v29 = [v19 objectAtIndexedSubscript:0];
  v30 = [v29 objectAtIndexedSubscript:3];
  [v30 floatValue];
  int v97 = v31;

  v32 = [v19 objectAtIndexedSubscript:0];
  v33 = [v32 objectAtIndexedSubscript:4];
  [v33 floatValue];
  int v96 = v34;

  v35 = [v19 objectAtIndexedSubscript:1];
  v36 = [v35 objectAtIndexedSubscript:0];
  [v36 floatValue];
  int v95 = v37;

  v38 = [v19 objectAtIndexedSubscript:1];
  v39 = [v38 objectAtIndexedSubscript:1];
  [v39 floatValue];
  int v94 = v40;

  v41 = [v19 objectAtIndexedSubscript:1];
  v42 = [v41 objectAtIndexedSubscript:2];
  [v42 floatValue];
  int v93 = v43;

  v44 = [v19 objectAtIndexedSubscript:1];
  v45 = [v44 objectAtIndexedSubscript:3];
  [v45 floatValue];
  int v92 = v46;

  v47 = [v19 objectAtIndexedSubscript:1];
  v48 = [v47 objectAtIndexedSubscript:4];
  [v48 floatValue];
  int v91 = v49;

  v50 = [v19 objectAtIndexedSubscript:2];
  v51 = [v50 objectAtIndexedSubscript:0];
  [v51 floatValue];
  int v90 = v52;

  v53 = [v19 objectAtIndexedSubscript:2];
  v54 = [v53 objectAtIndexedSubscript:1];
  [v54 floatValue];
  int v89 = v55;

  v56 = [v19 objectAtIndexedSubscript:2];
  v57 = [v56 objectAtIndexedSubscript:2];
  [v57 floatValue];
  int v59 = v58;

  v60 = [v19 objectAtIndexedSubscript:2];
  v61 = [v60 objectAtIndexedSubscript:3];
  [v61 floatValue];
  int v63 = v62;

  v64 = [v19 objectAtIndexedSubscript:2];
  v65 = [v64 objectAtIndexedSubscript:4];
  [v65 floatValue];
  int v67 = v66;

  v68 = [v19 objectAtIndexedSubscript:3];
  v69 = [v68 objectAtIndexedSubscript:0];
  [v69 floatValue];
  int v71 = v70;

  v72 = [v19 objectAtIndexedSubscript:3];
  v73 = [v72 objectAtIndexedSubscript:1];
  [v73 floatValue];
  int v75 = v74;

  v76 = [v19 objectAtIndexedSubscript:3];
  v77 = [v76 objectAtIndexedSubscript:2];
  [v77 floatValue];
  int v79 = v78;

  v80 = [v19 objectAtIndexedSubscript:3];
  v81 = [v80 objectAtIndexedSubscript:3];
  [v81 floatValue];
  int v83 = v82;

  v84 = [v19 objectAtIndexedSubscript:3];

  v85 = [v84 objectAtIndexedSubscript:4];
  [v85 floatValue];
  int v87 = v86;

  v105[0] = v102;
  v105[1] = v100;
  v105[2] = v98;
  v105[3] = v97;
  v105[4] = v96;
  v105[5] = v95;
  v105[6] = v94;
  v105[7] = v93;
  v105[8] = v92;
  v105[9] = v91;
  v105[10] = v90;
  v105[11] = v89;
  v105[12] = v59;
  v105[13] = v63;
  v105[14] = v67;
  v105[15] = v71;
  v105[16] = v75;
  v105[17] = v79;
  v105[18] = v83;
  v105[19] = v87;
  v88 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v105];
  [*(id *)(a1 + 32) setObject:v88 forKey:v6];

LABEL_26:
LABEL_27:
}

void __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_8(void *a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([v8 isEqualToString:@"type"] & 1) == 0
    && ([v8 isEqualToString:@"name"] & 1) == 0)
  {
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A0E8]])
    {
LABEL_4:
      uint64_t v6 = a1[4];
LABEL_7:
      (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v5, v8);
      goto LABEL_8;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A0F8]])
    {
LABEL_6:
      uint64_t v6 = a1[5];
      goto LABEL_7;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A100]]
      || [v8 isEqualToString:*MEMORY[0x1E4F3A108]]
      || [v8 isEqualToString:*MEMORY[0x1E4F3A110]])
    {
      goto LABEL_4;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A118]]
      || [v8 isEqualToString:*MEMORY[0x1E4F3A120]])
    {
      goto LABEL_16;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A128]]
      || [v8 isEqualToString:*MEMORY[0x1E4F3A130]])
    {
      goto LABEL_4;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A138]]) {
      goto LABEL_6;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A140]])
    {
      uint64_t v6 = a1[7];
      goto LABEL_7;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A148]]
      || [v8 isEqualToString:*MEMORY[0x1E4F3A150]]
      || [v8 isEqualToString:*MEMORY[0x1E4F3A158]])
    {
      goto LABEL_16;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A160]])
    {
      uint64_t v6 = a1[8];
      goto LABEL_7;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A168]])
    {
      uint64_t v6 = a1[9];
      goto LABEL_7;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A170]]
      || [v8 isEqualToString:*MEMORY[0x1E4F3A178]])
    {
      goto LABEL_4;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A180]]) {
      goto LABEL_16;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A188]]) {
      goto LABEL_4;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A190]]) {
      goto LABEL_6;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A198]]
      || [v8 isEqualToString:*MEMORY[0x1E4F3A1A0]])
    {
      goto LABEL_4;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A1A8]])
    {
      id v7 = *(void (**)(void))(a1[10] + 16);
LABEL_38:
      v7();
      goto LABEL_8;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A1B0]]
      || [v8 isEqualToString:*MEMORY[0x1E4F3A1B8]]
      || [v8 isEqualToString:*MEMORY[0x1E4F3A1C0]])
    {
      goto LABEL_4;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A1D0]])
    {
      id v7 = *(void (**)(void))(a1[10] + 16);
      goto LABEL_38;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A1D8]]) {
      goto LABEL_4;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A1E0]]) {
      goto LABEL_6;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A1E8]]
      || [v8 isEqualToString:*MEMORY[0x1E4F3A1F0]])
    {
      goto LABEL_4;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A1F8]]
      || [v8 isEqualToString:*MEMORY[0x1E4F3A200]])
    {
LABEL_16:
      uint64_t v6 = a1[6];
      goto LABEL_7;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A208]]
      || [v8 isEqualToString:*MEMORY[0x1E4F3A210]])
    {
      goto LABEL_4;
    }
    if ([v8 isEqualToString:*MEMORY[0x1E4F3A218]]) {
      goto LABEL_6;
    }
    _IMWarn();
  }
LABEL_8:
}

uint64_t __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forKey:a2];
}

@end