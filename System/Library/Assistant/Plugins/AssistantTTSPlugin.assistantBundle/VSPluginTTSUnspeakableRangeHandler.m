@interface VSPluginTTSUnspeakableRangeHandler
- (void)performWithCompletion:(id)a3;
@end

@implementation VSPluginTTSUnspeakableRangeHandler

- (void)performWithCompletion:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v29 = (void (**)(id, void *))a3;
  v4 = VSGetLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v46 = self;
    _os_log_impl(&dword_229253000, v4, OS_LOG_TYPE_INFO, "ttsGetUnspeakableRangeOfText= %@", buf, 0xCu);
  }

  id v28 = objc_alloc_init(MEMORY[0x263F64E90]);
  id v5 = objc_alloc(MEMORY[0x263F84E80]);
  v6 = [(SATTSGetUnspeakableRangeOfText *)self locale];
  v7 = (void *)[v5 initWithLanguage:v6];

  unint64_t v8 = 0x263EFF000uLL;
  v9 = [MEMORY[0x263EFF980] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [(SATTSGetUnspeakableRangeOfText *)self texts];
  uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
    v31 = v9;
    v32 = v7;
    uint64_t v30 = *(void *)v40;
    do
    {
      uint64_t v13 = 0;
      uint64_t v33 = v11;
      do
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v39 + 1) + 8 * v13);
        v15 = [*(id *)(v8 + 2432) array];
        if (v7)
        {
          id v16 = [v7 unspeakableRangeOfText:v14];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v36;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v36 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = [*(id *)(*((void *)&v35 + 1) + 8 * i) rangeValue];
                uint64_t v23 = v22;
                id v24 = objc_alloc_init(MEMORY[0x263F64B88]);
                [v24 setStart:v21];
                [v24 setLength:v23];
                v25 = [v24 dictionary];
                [v15 addObject:v25];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v18);
            v9 = v31;
            v7 = v32;
            unint64_t v8 = 0x263EFF000;
            uint64_t v12 = v30;
            uint64_t v11 = v33;
          }
        }
        else
        {
          id v16 = objc_alloc_init(MEMORY[0x263F64B88]);
          [v16 setStart:0];
          objc_msgSend(v16, "setLength:", objc_msgSend(v14, "length"));
          v26 = [v16 dictionary];
          [v15 addObject:v26];
        }
        [v9 addObject:v15];

        ++v13;
      }
      while (v13 != v11);
      uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v11);
  }

  [v28 setResults:v9];
  if (v29)
  {
    v27 = [v28 dictionary];
    v29[2](v29, v27);
  }
}

@end