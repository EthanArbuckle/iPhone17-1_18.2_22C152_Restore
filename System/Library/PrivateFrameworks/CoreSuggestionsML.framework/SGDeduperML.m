@interface SGDeduperML
+ (id)bucketerWithEqualityTest:(id)a3;
+ (id)bucketerWithLabeledBuckets:(id)a3;
+ (id)bucketerWithMapping:(id)a3;
+ (id)dedupe:(id)a3 bucketer:(id)a4 resolver:(id)a5;
+ (id)resolveByPairs:(id)a3;
+ (id)resolveByScoreBreakTiesArbitrarily:(id)a3;
@end

@implementation SGDeduperML

+ (id)resolveByScoreBreakTiesArbitrarily:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__SGDeduperML_resolveByScoreBreakTiesArbitrarily___block_invoke;
  v7[3] = &unk_2647EAF30;
  id v8 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x22A66BFD0](v7);

  return v5;
}

id __50__SGDeduperML_resolveByScoreBreakTiesArbitrarily___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (!v4) {
    goto LABEL_12;
  }
  uint64_t v5 = v4;
  v6 = 0;
  uint64_t v7 = *(void *)v17;
  signed int v8 = 0x80000000;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v3);
      }
      v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      signed int v11 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
      if (v11 > v8)
      {
        signed int v12 = v11;
        id v13 = v10;

        signed int v8 = v12;
        v6 = v13;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  }
  while (v5);
  if (v6)
  {
    v20 = v6;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  }
  else
  {
LABEL_12:
    v14 = (void *)MEMORY[0x263EFFA68];
  }

  return v14;
}

+ (id)resolveByPairs:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__SGDeduperML_resolveByPairs___block_invoke;
  v7[3] = &unk_2647EAF30;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x22A66BFD0](v7);

  return v5;
}

id __30__SGDeduperML_resolveByPairs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (!v4) {
    goto LABEL_13;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  uint64_t v7 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v3);
      }
      if (v6)
      {
        uint64_t v9 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

        id v6 = (id)v9;
      }
      else
      {
        id v6 = *(id *)(*((void *)&v12 + 1) + 8 * i);
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
  }
  while (v5);
  if (v6)
  {
    id v16 = v6;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  }
  else
  {
LABEL_13:
    v10 = (void *)MEMORY[0x263EFFA68];
  }

  return v10;
}

+ (id)bucketerWithEqualityTest:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__SGDeduperML_bucketerWithEqualityTest___block_invoke;
  v7[3] = &unk_2647EAF08;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x22A66BFD0](v7);

  return v5;
}

id __40__SGDeduperML_bucketerWithEqualityTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v18 = (id)objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v3;
  uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v6 = v18;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v21 != v9) {
                objc_enumerationMutation(v6);
              }
              signed int v11 = *(void **)(*((void *)&v20 + 1) + 8 * j);
              uint64_t v12 = *(void *)(a1 + 32);
              long long v13 = [v11 objectAtIndexedSubscript:0];
              LODWORD(v12) = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v5, v13);

              if (v12)
              {
                [v11 addObject:v5];
                goto LABEL_16;
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v8) {
              continue;
            }
            break;
          }
        }

        uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v5, 0);
        [v6 addObject:v14];
        id v6 = (id)v14;
LABEL_16:
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }

  return v18;
}

+ (id)bucketerWithLabeledBuckets:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SGDeduperML_bucketerWithLabeledBuckets___block_invoke;
  v7[3] = &unk_2647EAEE0;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x22A66BFD0](v7);

  return v5;
}

id __42__SGDeduperML_bucketerWithLabeledBuckets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        signed int v11 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        uint64_t v12 = objc_msgSend(v4, "objectForKeyedSubscript:", v11, (void)v14);
        if (!v12)
        {
          uint64_t v12 = objc_opt_new();
          [v4 setObject:v12 forKeyedSubscript:v11];
        }
        [v12 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)bucketerWithMapping:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__SGDeduperML_bucketerWithMapping___block_invoke;
  v7[3] = &unk_2647EAEB8;
  id v8 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x22A66BFD0](v7);

  return v5;
}

id __35__SGDeduperML_bucketerWithMapping___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
        signed int v11 = (void *)MEMORY[0x22A66BDC0](v6);
        uint64_t v12 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        long long v13 = objc_msgSend(v4, "objectForKeyedSubscript:", v12, (void)v17);
        if (!v13)
        {
          long long v13 = objc_opt_new();
          [v4 setObject:v13 forKeyedSubscript:v12];
        }
        [v13 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  long long v14 = (void *)MEMORY[0x22A66BDC0]();
  long long v15 = [v4 allValues];

  return v15;
}

+ (id)dedupe:(id)a3 bucketer:(id)a4 resolver:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v30 = (void (**)(id, void *))a5;
  CFMutableSetRef Mutable = CFSetCreateMutable(0, 16, 0);
  if (!Mutable)
  {
    id v26 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v26);
  }
  uint64_t v10 = Mutable;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v28 = v8;
  v29 = v7;
  signed int v11 = (*((void (**)(id, id))v8 + 2))(v8, v7);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if ((unint64_t)[v15 count] < 2)
        {
          long long v16 = [v15 objectAtIndexedSubscript:0];
          CFSetAddValue(v10, v16);
        }
        else
        {
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v16 = v30[2](v30, v15);
          uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v36 != v18) {
                  objc_enumerationMutation(v16);
                }
                CFSetAddValue(v10, *(const void **)(*((void *)&v35 + 1) + 8 * j));
              }
              uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
            }
            while (v17);
          }
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v12);
  }

  long long v20 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v21 = v29;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v21);
        }
        long long v25 = *(const void **)(*((void *)&v31 + 1) + 8 * k);
        if (CFSetContainsValue(v10, v25))
        {
          [v20 addObject:v25];
          CFSetRemoveValue(v10, v25);
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v22);
  }

  CFRelease(v10);
  return v20;
}

@end