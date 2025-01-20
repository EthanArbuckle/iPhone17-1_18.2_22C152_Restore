@interface AXSSDocument
+ (id)documentWithAttributedText:(id)a3;
+ (id)documentWithText:(id)a3;
- (AXSSDocument)init;
- (NSArray)nodes;
- (NSMutableArray)_nodes;
- (id)_generateAllDocIssues;
- (id)_generateAllWordIssues;
- (id)generateAllIssues;
- (id)stringByAcceptingFirstSuggestionForIssues:(id)a3;
- (void)addNode:(id)a3;
- (void)set_nodes:(id)a3;
@end

@implementation AXSSDocument

+ (id)documentWithText:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F086A0];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithString:v5];

  v7 = [a1 documentWithAttributedText:v6];

  return v7;
}

+ (id)documentWithAttributedText:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AXSSDocumentNode);
  [(AXSSDocumentNode *)v4 setText:v3];

  id v5 = objc_opt_new();
  [v5 addNode:v4];

  return v5;
}

- (AXSSDocument)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXSSDocument;
  v2 = [(AXSSDocument *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    nodes = v2->__nodes;
    v2->__nodes = (NSMutableArray *)v3;
  }
  return v2;
}

- (NSArray)nodes
{
  v2 = [(AXSSDocument *)self _nodes];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)addNode:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSSDocument *)self _nodes];
  [v5 addObject:v4];
}

- (id)generateAllIssues
{
  uint64_t v3 = [(AXSSDocument *)self _generateAllWordIssues];
  id v4 = [(AXSSDocument *)self _generateAllDocIssues];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (id)_generateAllDocIssues
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  v19 = +[AXSSDocumentTextRulesetManager sharedManager];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = [(AXSSDocument *)self nodes];
  uint64_t v21 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(obj);
        }
        id v5 = [*(id *)(*((void *)&v32 + 1) + 8 * i) text];
        if ([v5 length])
        {
          uint64_t v22 = i;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v23 = [v19 rulesets];
          uint64_t v6 = [v23 countByEnumeratingWithState:&v28 objects:v37 count:16];
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v7; ++j)
              {
                if (*(void *)v29 != v8) {
                  objc_enumerationMutation(v23);
                }
                v10 = [*(id *)(*((void *)&v28 + 1) + 8 * j) rulesForGranularity:2];
                long long v24 = 0u;
                long long v25 = 0u;
                long long v26 = 0u;
                long long v27 = 0u;
                uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v36 count:16];
                if (v11)
                {
                  uint64_t v12 = v11;
                  uint64_t v13 = *(void *)v25;
                  do
                  {
                    for (uint64_t k = 0; k != v12; ++k)
                    {
                      if (*(void *)v25 != v13) {
                        objc_enumerationMutation(v10);
                      }
                      v15 = [*(id *)(*((void *)&v24 + 1) + 8 * k) issuesInText:v5];
                      if ([v15 count]) {
                        [v3 addObjectsFromArray:v15];
                      }
                    }
                    uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v36 count:16];
                  }
                  while (v12);
                }
              }
              uint64_t v7 = [v23 countByEnumeratingWithState:&v28 objects:v37 count:16];
            }
            while (v7);
          }

          uint64_t i = v22;
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v21);
  }

  v16 = (void *)[v3 copy];
  return v16;
}

- (id)_generateAllWordIssues
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v20 = (id)objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = [(AXSSDocument *)self nodes];
  uint64_t v3 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v3)
  {
    uint64_t v19 = *(void *)v40;
    int64x2_t v18 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v6 = objc_opt_new();
        uint64_t v7 = [v5 text];
        uint64_t v8 = [v7 string];
        uint64_t v33 = 0;
        long long v34 = &v33;
        uint64_t v35 = 0x3032000000;
        v36 = __Block_byref_object_copy_;
        v37 = __Block_byref_object_dispose_;
        id v38 = 0;
        uint64_t v28 = 0;
        long long v29 = &v28;
        uint64_t v30 = 0x3010000000;
        long long v31 = &unk_228E855A9;
        int64x2_t v32 = v18;
        uint64_t v9 = [v8 length];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __38__AXSSDocument__generateAllWordIssues__block_invoke;
        v21[3] = &unk_264855A00;
        id v10 = v7;
        id v22 = v10;
        id v23 = v5;
        long long v26 = &v33;
        long long v27 = &v28;
        id v11 = v6;
        id v24 = v11;
        id v12 = v20;
        id v25 = v12;
        objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 1027, v21);
        if (v34[5] && (unint64_t)[v10 length] >= 3)
        {
          uint64_t v13 = objc_opt_new();
          unint64_t v14 = [v10 length];
          v15 = _CheckNodeWord(v5, v10, v13, v14, 0, (void *)v34[5], v29[4], v29[5], v11);

          if ([v15 count]) {
            [v12 addObjectsFromArray:v15];
          }
        }
        _Block_object_dispose(&v28, 8);
        _Block_object_dispose(&v33, 8);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v3);
  }

  return v20;
}

void __38__AXSSDocument__generateAllWordIssues__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:");
  _CheckNodeWord(*(void **)(a1 + 40), *(void **)(a1 + 32), v7, a3, a4, *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(void **)(a1 + 48));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if ([v11 count]) {
    [*(id *)(a1 + 56) addObjectsFromArray:v11];
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
  *(void *)(v8 + 32) = a3;
  *(void *)(v8 + 40) = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
}

- (id)stringByAcceptingFirstSuggestionForIssues:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v28 = (id)objc_opt_new();
  long long v26 = v4;
  uint64_t v30 = (void *)[v4 mutableCopy];
  [v30 sortUsingComparator:&__block_literal_global_0];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = [(AXSSDocument *)self nodes];
  uint64_t v31 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v31)
  {
    uint64_t v29 = *(void *)v41;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v5;
        uint64_t v6 = *(void **)(*((void *)&v40 + 1) + 8 * v5);
        uint64_t v7 = [v6 text];
        uint64_t v33 = (void *)[v7 mutableCopy];

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v35 = v30;
        uint64_t v8 = [v35 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = 0;
          uint64_t v11 = *(void *)v37;
          do
          {
            uint64_t v12 = 0;
            uint64_t v34 = v9;
            do
            {
              if (*(void *)v37 != v11) {
                objc_enumerationMutation(v35);
              }
              uint64_t v13 = *(void **)(*((void *)&v36 + 1) + 8 * v12);
              unint64_t v14 = [v13 node];
              int v15 = [v14 isEqual:v6];

              if (v15)
              {
                uint64_t v16 = [v13 range];
                uint64_t v18 = v17;
                uint64_t v19 = [v13 suggestions];
                id v20 = [v19 firstObject];
                if (v20)
                {
                  uint64_t v21 = v6;
                  uint64_t v22 = [v33 length];
                  objc_msgSend(v33, "replaceCharactersInRange:withAttributedString:", v16 - v10, v18, v20);
                  uint64_t v23 = [v33 length];
                  uint64_t v24 = v22 + v10;
                  uint64_t v6 = v21;
                  uint64_t v9 = v34;
                  uint64_t v10 = v24 - v23;
                }
              }
              ++v12;
            }
            while (v9 != v12);
            uint64_t v9 = [v35 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v9);
        }

        if ([v33 length]) {
          [v28 appendAttributedString:v33];
        }

        uint64_t v5 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v31);
  }

  return v28;
}

uint64_t __58__AXSSDocument_stringByAcceptingFirstSuggestionForIssues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 range];
  if (v6 == [v5 range])
  {
    uint64_t v7 = 0;
  }
  else
  {
    unint64_t v8 = [v4 range];
    if (v8 < [v5 range]) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = 1;
    }
  }

  return v7;
}

- (NSMutableArray)_nodes
{
  return self->__nodes;
}

- (void)set_nodes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end