@interface SGPOSTagger
+ (id)sharedInstance;
- (id)tokenizeTextContent:(id)a3 languageHint:(id)a4;
- (id)tokenizeTextContent:(id)a3 languageHint:(id)a4 gazetteer:(id)a5;
@end

@implementation SGPOSTagger

- (id)tokenizeTextContent:(id)a3 languageHint:(id)a4 gazetteer:(id)a5
{
  v66[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__31651;
  v61 = __Block_byref_object_dispose__31652;
  id v62 = 0;
  id v62 = (id)objc_opt_new();
  if (v7)
  {
    int v10 = [v8 isEqualToString:@"zh-Hans"];
    uint64_t v12 = *MEMORY[0x1E4F38858];
    v66[0] = *MEMORY[0x1E4F38848];
    v11 = (void *)v66[0];
    v66[1] = v12;
    uint64_t v38 = v12;
    uint64_t v13 = *MEMORY[0x1E4F38868];
    v66[2] = *MEMORY[0x1E4F38868];
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];
    id v14 = v11;
    v37 = v14;
    if (v10)
    {
      v65 = (void *)*MEMORY[0x1E4F38860];
      v15 = v65;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];

      id v39 = v15;
      v40 = (void *)v16;
    }
    else
    {
      id v39 = v14;
    }
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F388F0]) initWithTagSchemes:v40];
    v18 = (void *)MEMORY[0x1CB79B230]();
    id v19 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v20 = objc_msgSend(v19, "initWithObjects:", *MEMORY[0x1E4F38820], *MEMORY[0x1E4F38800], *MEMORY[0x1E4F38828], 0);
    if (v9)
    {
      id v64 = v9;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
      [v17 setGazetteers:v21 forTagScheme:v13];

      v22 = [v9 labels];
      uint64_t v23 = [v20 setByAddingObjectsFromArray:v22];

      v20 = (void *)v23;
    }
    [v17 setString:v7];
    v24 = [v17 string];
    uint64_t v25 = [v24 length];

    if (v8) {
      objc_msgSend(v17, "setLanguage:range:", v8, 0, objc_msgSend(v7, "length"));
    }
    uint64_t v53 = 0;
    v54 = (double *)&v53;
    uint64_t v55 = 0x2020000000;
    uint64_t v56 = 0;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __58__SGPOSTagger_tokenizeTextContent_languageHint_gazetteer___block_invoke;
    v49[3] = &unk_1E65BBB78;
    v51 = &v53;
    v52 = &v57;
    id v26 = v7;
    id v50 = v26;
    objc_msgSend(v17, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v25, 0, v39, 4, v49);
    if ((unint64_t)[(id)v58[5] count] >= 2)
    {
      double v27 = v54[3];
      if (v27 / (double)(unint64_t)[(id)v58[5] count] > 0.8)
      {
        v28 = sgLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA650000, v28, OS_LOG_TYPE_ERROR, "SGPOSTagger: Most tags are SYM, likely missing LinguisticData", buf, 2u);
        }
      }
    }
    char v29 = v10 ^ 1;
    if (!v8) {
      char v29 = 1;
    }
    if (v29)
    {
      v32 = v17;
    }
    else
    {
      id v30 = objc_alloc(MEMORY[0x1E4F388F0]);
      v63[0] = v37;
      v63[1] = v38;
      v63[2] = v13;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:3];
      v32 = (void *)[v30 initWithTagSchemes:v31];

      [v32 setString:v26];
      objc_msgSend(v32, "setLanguage:range:", v8, 0, objc_msgSend(v26, "length"));
    }
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __58__SGPOSTagger_tokenizeTextContent_languageHint_gazetteer___block_invoke_11;
    v45[3] = &unk_1E65BBBA0;
    id v33 = v26;
    id v46 = v33;
    v47 = &v57;
    objc_msgSend(v32, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v25, 0, v38, 4, v45);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __58__SGPOSTagger_tokenizeTextContent_languageHint_gazetteer___block_invoke_2;
    v41[3] = &unk_1E65BBBC8;
    id v34 = v20;
    id v42 = v34;
    id v43 = v33;
    v44 = &v57;
    objc_msgSend(v32, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v25, 0, v13, 4, v41);

    _Block_object_dispose(&v53, 8);
  }
  id v35 = (id)v58[5];
  _Block_object_dispose(&v57, 8);

  return v35;
}

void __58__SGPOSTagger_tokenizeTextContent_languageHint_gazetteer___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = v7;
  if (v7)
  {
    if ([v7 isEqualToString:@"SYM"]) {
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
    }
                                                                              + 24)
                                                                  + 1.0;
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v10 = [SGTaggedCharacterRange alloc];
    v16[0] = v8;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v12 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
    id v14 = [v13 lowercaseString];

    v15 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v10, "initWithAnnotationType:tags:range:text:", 2, v11, a3, a4, v14);
    [v9 addObject:v15];
  }
}

void __58__SGPOSTagger_tokenizeTextContent_languageHint_gazetteer___block_invoke_11(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = (void *)MEMORY[0x1CB79B230]();
  id v9 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  if (v7)
  {
    v12[0] = v7;
    int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    int v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v11 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:]([SGTaggedCharacterRange alloc], "initWithAnnotationType:tags:range:text:", 3, v10, a3, a4, v9);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v11];
}

void __58__SGPOSTagger_tokenizeTextContent_languageHint_gazetteer___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (v7 && [*(id *)(a1 + 32) containsObject:v7])
  {
    id v8 = (void *)MEMORY[0x1CB79B230]();
    id v9 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a3, a4);
    int v10 = [SGTaggedCharacterRange alloc];
    v13[0] = v7;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    uint64_t v12 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v10, "initWithAnnotationType:tags:range:text:", 13, v11, a3, a4, v9);

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v12];
  }
}

- (id)tokenizeTextContent:(id)a3 languageHint:(id)a4
{
  return [(SGPOSTagger *)self tokenizeTextContent:a3 languageHint:a4 gazetteer:0];
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken3_31670 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken3_31670, &__block_literal_global_31671);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_31672;
  return v2;
}

void __29__SGPOSTagger_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_31672;
  sharedInstance__pasExprOnceResult_31672 = v1;
}

@end