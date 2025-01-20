@interface LNSiriVocabulary
+ (id)vocabularyForBundleIdentifier:(id)a3;
- (LNDebouncer)debouncer;
- (LNSiriVocabulary)initWithBundleIdentifier:(id)a3 donatorClient:(id)a4 picker:(id)a5;
- (LNVocabularyDonator)donatorClient;
- (LNVocabularyPicker)vocabularyPicker;
- (NSArray)corpora;
- (NSMutableArray)completions;
- (NSString)bundleIdentifier;
- (OS_dispatch_queue)queue;
- (void)corpusContentsChanged:(id)a3 completionHandler:(id)a4;
- (void)donateWithCompletionHandler:(id)a3;
- (void)setCompletions:(id)a3;
- (void)setCorpora:(id)a3;
- (void)setCorporaByPriority:(id)a3 completionHandler:(id)a4;
@end

@implementation LNSiriVocabulary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_vocabularyPicker, 0);
  objc_storeStrong((id *)&self->_donatorClient, 0);
  objc_storeStrong((id *)&self->_corpora, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)setCompletions:(id)a3
{
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (LNDebouncer)debouncer
{
  return self->_debouncer;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (LNVocabularyPicker)vocabularyPicker
{
  return self->_vocabularyPicker;
}

- (LNVocabularyDonator)donatorClient
{
  return self->_donatorClient;
}

- (void)setCorpora:(id)a3
{
}

- (NSArray)corpora
{
  return self->_corpora;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)corpusContentsChanged:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  if (+[LNFeatureFlags isVocabularyDonationEnabled]) {
    [(LNSiriVocabulary *)self donateWithCompletionHandler:v5];
  }
}

- (void)donateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __48__LNSiriVocabulary_donateWithCompletionHandler___block_invoke;
  v10 = &unk_1E5B395F8;
  v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync(queue, &v7);
  [(LNDebouncer *)self->_debouncer trigger];
}

void __48__LNSiriVocabulary_donateWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 56);
    id v4 = _Block_copy(v2);
    [v3 addObject:v4];
  }
}

- (void)setCorporaByPriority:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (+[LNFeatureFlags isVocabularyDonationEnabled])
  {
    corpora = self->_corpora;
    if (corpora)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v9 = corpora;
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v26;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v9);
            }
            [*(id *)(*((void *)&v25 + 1) + 8 * v13++) removeObserver:self];
          }
          while (v11 != v13);
          uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v11);
      }
    }
    v14 = (NSArray *)[v6 copy];
    v15 = self->_corpora;
    self->_corpora = v14;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v16 = self->_corpora;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v20++), "setObserver:", self, (void)v21);
        }
        while (v18 != v20);
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v18);
    }

    [(LNSiriVocabulary *)self donateWithCompletionHandler:v7];
  }
}

- (LNSiriVocabulary)initWithBundleIdentifier:(id)a3 donatorClient:(id)a4 picker:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"LNSiriVocabulary.m", 63, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"LNSiriVocabulary.m", 62, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"LNSiriVocabulary.m", 64, @"Invalid parameter not satisfying: %@", @"picker" object file lineNumber description];

LABEL_4:
  v39.receiver = self;
  v39.super_class = (Class)LNSiriVocabulary;
  uint64_t v12 = [(LNSiriVocabulary *)&v39 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    bundleIdentifier = v12->_bundleIdentifier;
    v12->_bundleIdentifier = (NSString *)v13;

    objc_storeStrong((id *)&v12->_donatorClient, a4);
    objc_storeStrong((id *)&v12->_vocabularyPicker, a5);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.link.LNSiriVocabulary.internal-queue", v16);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v17;

    objc_initWeak(&location, v12);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__LNSiriVocabulary_initWithBundleIdentifier_donatorClient_picker___block_invoke;
    aBlock[3] = &unk_1E5B3A4A8;
    objc_copyWeak(&v37, &location);
    uint64_t v19 = _Block_copy(aBlock);
    uint64_t v20 = [LNDebouncer alloc];
    long long v21 = v12->_queue;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __66__LNSiriVocabulary_initWithBundleIdentifier_donatorClient_picker___block_invoke_3;
    v33[3] = &unk_1E5B395F8;
    long long v22 = v12;
    v34 = v22;
    id v23 = v19;
    id v35 = v23;
    uint64_t v24 = [(LNDebouncer *)v20 initWithDelay:v21 maxDelay:v33 queue:0.25 block:1.0];
    debouncer = v22->_debouncer;
    v22->_debouncer = (LNDebouncer *)v24;

    long long v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completions = v22->_completions;
    v22->_completions = v26;

    long long v28 = v22;
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  return v12;
}

void __66__LNSiriVocabulary_initWithBundleIdentifier_donatorClient_picker___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__LNSiriVocabulary_initWithBundleIdentifier_donatorClient_picker___block_invoke_2;
  v8[3] = &unk_1E5B3A0D8;
  id v9 = WeakRetained;
  id v10 = v3;
  id v6 = v3;
  id v7 = WeakRetained;
  dispatch_async(v5, v8);
}

void __66__LNSiriVocabulary_initWithBundleIdentifier_donatorClient_picker___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) pickTermsFromCorpora:*(void *)(*(void *)(a1 + 32) + 16)];
  [*(id *)(*(void *)(a1 + 32) + 24) donateFullVocabularySet:v2 completionHandler:*(void *)(a1 + 40)];
}

uint64_t __66__LNSiriVocabulary_initWithBundleIdentifier_donatorClient_picker___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        if (v7) {
          (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(a1 + 40));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "removeAllObjects", (void)v9);
}

+ (id)vocabularyForBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"LNSiriVocabulary.m", 44, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  if (vocabularyForBundleIdentifier__onceToken != -1) {
    dispatch_once(&vocabularyForBundleIdentifier__onceToken, &__block_literal_global_9063);
  }
  id v6 = (id)vocabularyForBundleIdentifier__value;
  uint64_t v7 = [v6 objectForKey:v5];

  if (!v7)
  {
    uint64_t v8 = [LNSiriVocabulary alloc];
    id v9 = [[LNKoaClient alloc] initForBundleIdentifier:v5];
    long long v10 = objc_opt_new();
    long long v11 = [(LNSiriVocabulary *)v8 initWithBundleIdentifier:v5 donatorClient:v9 picker:v10];

    [v6 setObject:v11 forKey:v5];
  }
  long long v12 = [v6 objectForKey:v5];

  return v12;
}

uint64_t __50__LNSiriVocabulary_vocabularyForBundleIdentifier___block_invoke()
{
  vocabularyForBundleIdentifier__value = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

@end