@interface SGThreadParser
+ (id)emailFrom:(id)a3;
+ (id)emailFrom:(id)a3 entity:(id)a4;
+ (id)ipsosMessageWithSearchableItem:(id)a3;
+ (id)nextMessage:(id)a3;
+ (id)nextMessage:(id)a3 entity:(id)a4;
+ (id)stripChevrons:(id)a3;
+ (void)enumeratePreviousMessages:(id)a3 inEntity:(id)a4 usingBlock:(id)a5;
+ (void)enumeratePreviousMessages:(id)a3 usingBlock:(id)a4;
@end

@implementation SGThreadParser

+ (id)ipsosMessageWithSearchableItem:(id)a3
{
  v3 = +[SGMessage messageWithSearchableItem:a3];
  v4 = [v3 textContent];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = +[SGNaturalLanguageDissector ipsosMessageWithMailMessage:v3 store:0];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)enumeratePreviousMessages:(id)a3 usingBlock:(id)a4
{
}

+ (void)enumeratePreviousMessages:(id)a3 inEntity:(id)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void *, void *))a5;
  v10 = (void *)MEMORY[0x1CB79B230]();
  v11 = +[SGThreadParser nextMessage:v7 entity:v8];
  if (v11)
  {
    do
    {
      v12 = (void *)MEMORY[0x1E4F5DB38];
      v13 = [v11 objectAtIndexedSubscript:1];
      v14 = [v12 namedEmailAddressWithFieldValue:v13];

      v15 = [v11 objectAtIndexedSubscript:0];
      v16 = [v14 emailAddress];
      v17 = SGNormalizeEmailAddress();
      v9[2](v9, v15, v17);

      id v19 = [v11 objectAtIndexedSubscript:0];

      v18 = (void *)MEMORY[0x1CB79B230]();
      v11 = +[SGThreadParser nextMessage:v19 entity:v8];
      id v7 = v19;
    }
    while (v11);
  }
  else
  {
    id v19 = v7;
  }
}

+ (id)nextMessage:(id)a3
{
  return (id)[a1 nextMessage:a3 entity:0];
}

+ (id)nextMessage:(id)a3 entity:(id)a4
{
  v71[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__9213;
  v69 = __Block_byref_object_dispose__9214;
  id v7 = v5;
  id v70 = v7;
  uint64_t v62 = 0;
  v63[0] = &v62;
  v63[1] = 0x3032000000;
  v63[2] = __Block_byref_object_copy__9213;
  v63[3] = __Block_byref_object_dispose__9214;
  id v64 = 0;
  uint64_t v59 = 0;
  v60[0] = &v59;
  v60[1] = 0x3032000000;
  v60[2] = __Block_byref_object_copy__9213;
  v60[3] = __Block_byref_object_dispose__9214;
  id v61 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__9213;
  v57 = __Block_byref_object_dispose__9214;
  id v58 = 0;
  id v8 = +[SGMailPatterns replyAttributionPattern];
  uint64_t v9 = v66[5];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __37__SGThreadParser_nextMessage_entity___block_invoke;
  v52[3] = &unk_1E65BA268;
  v52[4] = &v62;
  [v8 enumerateMatchesInString:v9 ngroups:0 block:v52];

  v10 = +[SGMailPatterns headerPattern:@"From"];
  uint64_t v11 = v66[5];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __37__SGThreadParser_nextMessage_entity___block_invoke_2;
  v51[3] = &unk_1E65BA268;
  v51[4] = &v59;
  [v10 enumerateMatchesInString:v11 ngroups:0 block:v51];

  v12 = +[SGMailPatterns quotedRegionStartPattern];
  uint64_t v13 = v66[5];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __37__SGThreadParser_nextMessage_entity___block_invoke_3;
  v50[3] = &unk_1E65BA268;
  v50[4] = &v53;
  [v12 enumerateMatchesInString:v13 ngroups:0 block:v50];

  v14 = *(void **)(v63[0] + 40);
  if (!v14)
  {
    v16 = *(void **)(v60[0] + 40);
    if (!v16)
    {
      if (!v54[5])
      {
        v47 = 0;
        goto LABEL_28;
      }
      unint64_t v15 = -1;
      goto LABEL_9;
    }
    unint64_t v15 = -1;
LABEL_6:
    unint64_t v17 = [v16 rangeValue];
    goto LABEL_10;
  }
  unint64_t v15 = [v14 rangeValue];
  v16 = *(void **)(v60[0] + 40);
  if (v16) {
    goto LABEL_6;
  }
LABEL_9:
  unint64_t v17 = -1;
LABEL_10:
  v18 = (void *)v54[5];
  if (v18 && (unint64_t v19 = [v18 rangeValue], v19 < v15) && v19 < v17)
  {
    v20 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v21 = objc_msgSend((id)v66[5], "substringFromIndex:", objc_msgSend((id)v54[5], "rangeValue"));
    v22 = (void *)v66[5];
    v66[5] = v21;

    uint64_t v23 = +[SGThreadParser stripChevrons:v66[5]];
    v24 = (void *)v66[5];
    v66[5] = v23;

    v25 = &stru_1F24EEF20;
  }
  else
  {
    v26 = (void *)MEMORY[0x1CB79B230]();
    v27 = v63;
    if (v15 >= v17) {
      v27 = v60;
    }
    id v28 = *(id *)(*v27 + 40);
    v29 = (void *)v66[5];
    uint64_t v30 = [v28 rangeValue];
    v32 = objc_msgSend(v29, "substringWithRange:", v30, v31);
    v33 = (void *)v66[5];
    uint64_t v34 = [v28 rangeValue];
    [v28 rangeValue];
    uint64_t v36 = [v33 substringFromIndex:v35 + v34];
    v37 = (void *)v66[5];
    v66[5] = v36;

    if (v28 == *(id *)(v60[0] + 40))
    {
      v38 = +[SGMailPatterns headersPattern];
      uint64_t v39 = v66[5];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __37__SGThreadParser_nextMessage_entity___block_invoke_4;
      v49[3] = &unk_1E65BA268;
      v49[4] = &v65;
      [v38 enumerateMatchesInString:v39 ngroups:0 block:v49];
    }
    v40 = patterns();
    v41 = [v40 regex2ForKey:@"NextLineQuoted"];
    v42 = [v41 existsInString:v66[5]];

    if (v42)
    {
      uint64_t v43 = +[SGThreadParser stripChevrons:v66[5]];
      v44 = (void *)v66[5];
      v66[5] = v43;
    }
    v45 = +[SGThreadParser emailFrom:v32 entity:v6];
    v46 = v45;
    if (v45) {
      v25 = v45;
    }
    else {
      v25 = &stru_1F24EEF20;
    }
  }
  if ([(id)v66[5] length])
  {
    v71[0] = v66[5];
    v71[1] = v25;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
  }
  else
  {
    v47 = 0;
  }

LABEL_28:
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v65, 8);
  return v47;
}

uint64_t __37__SGThreadParser_nextMessage_entity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", *a2, a2[1]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

uint64_t __37__SGThreadParser_nextMessage_entity___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", *a2, a2[1]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

uint64_t __37__SGThreadParser_nextMessage_entity___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", *a2, a2[1]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

uint64_t __37__SGThreadParser_nextMessage_entity___block_invoke_4(uint64_t a1, void *a2)
{
  if (!*a2)
  {
    uint64_t v4 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) substringFromIndex:a2[1]];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  return 0;
}

+ (id)emailFrom:(id)a3
{
  return (id)[a1 emailFrom:a3 entity:0];
}

+ (id)emailFrom:(id)a3 entity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
  id v7 = patterns();
  id v8 = [v7 regex2ForKey:@"Email"];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __35__SGThreadParser_emailFrom_entity___block_invoke;
  v36[3] = &unk_1E65B70D0;
  v36[4] = &v41;
  v36[5] = &v37;
  [v8 enumerateMatchesInString:v5 ngroups:0 block:v36];

  uint64_t v9 = v42[3];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || v38[3] == v9)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1CB79B230]();
    v12 = objc_msgSend(v5, "substringWithRange:", v42[3], v38[3] - v42[3]);
    uint64_t v13 = [v6 emailToCanonicalEmailCache];
    v14 = [v13 objectForKeyedSubscript:v12];

    if (v14)
    {
      id v10 = v14;
    }
    else
    {
      unint64_t v15 = [v5 length] - 1;
      if (v38[3] < v15 && objc_msgSend(v5, "characterAtIndex:") == 62) {
        ++v38[3];
      }
      uint64_t v16 = v42[3];
      if (v16)
      {
        int v17 = [v5 characterAtIndex:v16 - 1];
        uint64_t v18 = v42[3];
        if (v17 == 60) {
          v42[3] = --v18;
        }
        if (v18)
        {
          unsigned int v19 = [v5 characterAtIndex:v18 - 1];
          uint64_t v20 = MEMORY[0x1E4F14390];
          if (v19 > 0x7F ? __maskrune(v19, 0x4000uLL) : *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v19 + 60) & 0x4000)
          {
            while (1)
            {
              uint64_t v22 = v42[3];
              v42[3] = v22 - 1;
              if (v22 == 1) {
                break;
              }
              unsigned int v23 = [v5 characterAtIndex:v22 - 2];
              if (v23 > 0x7F)
              {
                if (!__maskrune(v23, 0x4000uLL))
                {
LABEL_22:
                  uint64_t v24 = v42[3];
                  if (v24)
                  {
                    int v25 = [v5 characterAtIndex:v24 - 1];
                    v26 = v42;
                    uint64_t v27 = v42[3];
                    if (v25 == 34)
                    {
                      while (1)
                      {
                        uint64_t v28 = v27 - 1;
                        v26[3] = v28;
                        if (!v28) {
                          break;
                        }
                        int v29 = [v5 characterAtIndex:v28 - 1];
                        v26 = v42;
                        uint64_t v27 = v42[3];
                        if (v29 == 34)
                        {
                          if (v27 && [v5 characterAtIndex:v27 - 1] == 34) {
                            --v42[3];
                          }
                          goto LABEL_34;
                        }
                      }
                    }
                    else
                    {
                      for (; v27; v42[3] = v27)
                      {
                        unsigned int v30 = [v5 characterAtIndex:v27 - 1];
                        if (v30 <= 0x3F && ((1 << v30) & 0x8400100200000000) != 0) {
                          break;
                        }
                        if (v30 == 65306) {
                          break;
                        }
                        uint64_t v27 = v42[3] - 1;
                      }
                    }
                  }
                  break;
                }
              }
              else if ((*(_DWORD *)(v20 + 4 * v23 + 60) & 0x4000) == 0)
              {
                goto LABEL_22;
              }
            }
          }
        }
      }
LABEL_34:
      uint64_t v31 = (void *)MEMORY[0x1CB79B230]();
      v32 = objc_msgSend(v5, "substringWithRange:", v42[3], v38[3] - v42[3]);
      v33 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      id v10 = [v32 stringByTrimmingCharactersInSet:v33];

      uint64_t v34 = [v6 emailToCanonicalEmailCache];
      [v34 setObject:v10 forKeyedSubscript:v12];
    }
  }
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v10;
}

uint64_t __35__SGThreadParser_emailFrom_entity___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2[1]
                                                              + *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return 0;
}

+ (id)stripChevrons:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  context = (void *)MEMORY[0x1CB79B230]();
  uint64_t v4 = patterns();
  uint64_t v20 = [v4 regex2ForKey:@"NonQuotedLinePart"];

  id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v6 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = [v3 componentsSeparatedByString:@"\n"];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v13 = (void *)MEMORY[0x1CB79B230]();
        v14 = [v12 stringByTrimmingCharactersInSet:v5];
        if ([v14 length])
        {
          unint64_t v15 = (void *)MEMORY[0x1CB79B230]();
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __32__SGThreadParser_stripChevrons___block_invoke;
          v21[3] = &unk_1E65B9F40;
          id v22 = v6;
          id v23 = v14;
          [v20 enumerateMatchesInString:v23 ngroups:1 block:v21];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  uint64_t v16 = objc_msgSend(v6, "_pas_componentsJoinedByString:", @"\n");
  int v17 = [v16 stringByTrimmingCharactersInSet:v5];

  return v17;
}

uint64_t __32__SGThreadParser_stripChevrons___block_invoke(uint64_t a1, void *a2)
{
  if (a2[1])
  {
    uint64_t v4 = (void *)MEMORY[0x1CB79B230]();
    if (a2[4])
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = [*(id *)(a1 + 40) substringWithRange:a2[3]];
      [v5 addObject:v6];
    }
    else
    {
      [*(id *)(a1 + 32) addObject:&stru_1F24EEF20];
    }
  }
  return 0;
}

@end