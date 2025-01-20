@interface EMTTokenizer
- (EMTTokenizer)initWithModelURL:(id)a3;
- (NSLocale)outputLocale;
- (id)format:(id)a3;
- (id)format:(id)a3 preToPostItnMap:(id)a4;
@end

@implementation EMTTokenizer

- (EMTTokenizer)initWithModelURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMTTokenizer;
  v5 = [(EMTTokenizer *)&v13 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.sequoia.tokenizer", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v8 = v5->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __33__EMTTokenizer_initWithModelURL___block_invoke;
    v10[3] = &unk_1E5FFE528;
    id v11 = v4;
    v12 = v5;
    dispatch_async(v8, v10);
  }
  return v5;
}

void __33__EMTTokenizer_initWithModelURL___block_invoke(uint64_t a1)
{
  id v17 = [*(id *)(a1 + 32) URLByAppendingPathComponent:@"mini.json"];
  v2 = [v17 path];
  BOOL v3 = +[_EARFormatter supportedByQuasarConfig:v2];

  if (v3)
  {
    id v4 = [_EARFormatter alloc];
    v5 = [v17 path];
    uint64_t v6 = [(_EARFormatter *)v4 initWithLanguage:&stru_1F0A64AB0 withSdapiConfig:&stru_1F0A64AB0 quasarConfig:v5];
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = v6;
  }
  else
  {
    v5 = [*(id *)(a1 + 32) URLByAppendingPathComponent:@"ncs/dispatch.voc"];
    v8 = [*(id *)(a1 + 32) URLByAppendingPathComponent:@"ncs/lexicon.enh"];
    v9 = [*(id *)(a1 + 32) URLByAppendingPathComponent:@"ncs/itn_s.enh"];
    v10 = [_EARFormatter alloc];
    id v11 = [v5 path];
    v12 = [v8 path];
    objc_super v13 = [v9 path];
    uint64_t v14 = [(_EARFormatter *)v10 initWithGeneralVoc:v11 withLexiconEnh:v12 withItnEnh:v13];
    uint64_t v15 = *(void *)(a1 + 40);
    v16 = *(void **)(v15 + 8);
    *(void *)(v15 + 8) = v14;
  }
}

- (id)format:(id)a3 preToPostItnMap:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 tokens];
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = [*(id *)(*((void *)&v30 + 1) + 8 * i) text];
        [v9 addObject:v14];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v11);
  }

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__8;
  v28 = __Block_byref_object_dispose__8;
  id v29 = 0;
  queue = self->_queue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __39__EMTTokenizer_format_preToPostItnMap___block_invoke;
  v20[3] = &unk_1E5FFF868;
  v20[4] = self;
  id v21 = v9;
  id v22 = v7;
  v23 = &v24;
  id v16 = v7;
  id v17 = v9;
  dispatch_sync(queue, v20);
  id v18 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v18;
}

void __39__EMTTokenizer_format_preToPostItnMap___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) formattedStringWithStrings:a1[5] preToPostItnArray:a1[6]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)format:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 tokens];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = [*(id *)(*((void *)&v25 + 1) + 8 * i) text];
        [v6 addObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  id v24 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__EMTTokenizer_format___block_invoke;
  block[3] = &unk_1E5FFE468;
  id v17 = v6;
  id v18 = &v19;
  block[4] = self;
  id v13 = v6;
  dispatch_sync(queue, block);
  id v14 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v14;
}

void __23__EMTTokenizer_format___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) formattedStringWithStrings:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSLocale)outputLocale
{
  return self->_outputLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputLocale, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end