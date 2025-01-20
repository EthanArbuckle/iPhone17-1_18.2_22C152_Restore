@interface CNNameStringTokenizer
+ (id)tokenizeNameString:(id)a3;
+ (id)tokenizeNameString:(id)a3 usingLocale:(id)a4 inferredNameOrder:(int64_t *)a5;
+ (void)setInferredNameOrder:(int64_t *)a3 toTokenizerNameOrder:(int)a4;
- (CNNameStringTokenizer)init;
- (CNNameStringTokenizer)initWithLocale:(id)a3;
- (CNUnfairLock)lock;
- (__CFStringTokenizer)tokenizer;
- (id)tokenizeNameString:(id)a3 inferredNameOrder:(int64_t *)a4;
- (void)dealloc;
@end

@implementation CNNameStringTokenizer

+ (id)tokenizeNameString:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  v6 = [v4 currentLocale];
  v7 = [a1 tokenizeNameString:v5 usingLocale:v6 inferredNameOrder:0];

  return v7;
}

+ (id)tokenizeNameString:(id)a3 usingLocale:(id)a4 inferredNameOrder:(int64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v8))
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)[objc_alloc((Class)a1) initWithLocale:v9];
    v10 = [v11 tokenizeNameString:v8 inferredNameOrder:a5];
  }

  return v10;
}

- (CNNameStringTokenizer)init
{
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  v4 = [(CNNameStringTokenizer *)self initWithLocale:v3];

  return v4;
}

- (CNNameStringTokenizer)initWithLocale:(id)a3
{
  CFLocaleRef v4 = (const __CFLocale *)a3;
  v10.receiver = self;
  v10.super_class = (Class)CNNameStringTokenizer;
  id v5 = [(CNNameStringTokenizer *)&v10 init];
  if (v5)
  {
    v11.location = -1;
    v11.length = 0;
    v5->_tokenizer = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &stru_1EE0267A8, v11, 0, v4);
    v6 = objc_alloc_init(CNUnfairLock);
    lock = v5->_lock;
    v5->_lock = v6;

    id v8 = v5;
  }

  return v5;
}

- (void)dealloc
{
  tokenizer = self->_tokenizer;
  if (tokenizer) {
    CFRelease(tokenizer);
  }
  v4.receiver = self;
  v4.super_class = (Class)CNNameStringTokenizer;
  [(CNNameStringTokenizer *)&v4 dealloc];
}

- (id)tokenizeNameString:(id)a3 inferredNameOrder:(int64_t *)a4
{
  id v6 = a3;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v6))
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__9;
    v24 = __Block_byref_object_dispose__9;
    id v25 = 0;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    int v19 = 0;
    id v8 = [(CNNameStringTokenizer *)self lock];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__CNNameStringTokenizer_tokenizeNameString_inferredNameOrder___block_invoke;
    v11[3] = &unk_1E56A17D0;
    v13 = &v26;
    v11[4] = self;
    id v12 = v6;
    v14 = &v16;
    v15 = &v20;
    CNRunWithLock(v8, v11);

    [(id)objc_opt_class() setInferredNameOrder:a4 toTokenizerNameOrder:*((unsigned int *)v17 + 6)];
    _Block_object_dispose(&v16, 8);
    id v9 = (const void *)v27[3];
    if (v9) {
      CFRelease(v9);
    }
    id v7 = (id)v21[5];
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }

  return v7;
}

uint64_t __62__CNNameStringTokenizer_tokenizeNameString_inferredNameOrder___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) tokenizer];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = _CFStringTokenizerCreateNamePartsArrayWithString();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

+ (void)setInferredNameOrder:(int64_t *)a3 toTokenizerNameOrder:(int)a4
{
  if (a3)
  {
    if (a4 == -1) {
      int64_t v4 = -1;
    }
    else {
      int64_t v4 = 0;
    }
    if (a4 == 1) {
      int64_t v4 = 1;
    }
    *a3 = v4;
  }
}

- (__CFStringTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (CNUnfairLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end