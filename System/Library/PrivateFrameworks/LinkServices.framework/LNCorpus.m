@interface LNCorpus
- (LNCorpus)init;
- (LNCorpus)initWithContents:(id)a3;
- (LNCorpus)initWithContents:(id)a3 capacity:(int64_t)a4;
- (LNCorpusObserver)observer;
- (NSArray)terms;
- (OS_dispatch_queue)queue;
- (id)getTerms;
- (unint64_t)capacity;
- (unint64_t)count;
- (void)changeWithBlock:(id)a3 completionHandler:(id)a4;
- (void)removeAllWithCompletionHandler:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setObserver:(id)a3;
- (void)setTerms:(id)a3;
@end

@implementation LNCorpus

- (LNCorpus)initWithContents:(id)a3 capacity:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LNCorpus.m", 37, @"Invalid parameter not satisfying: %@", @"contents" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)LNCorpus;
  v8 = [(LNCorpus *)&v22 init];
  v9 = v8;
  if (v8)
  {
    unint64_t v10 = a4 & ~(a4 >> 63);
    if (v10 >= 0x3E8) {
      unint64_t v10 = 1000;
    }
    v8->_capacity = v10;
    if ([v7 count] <= (unint64_t)a4)
    {
      uint64_t v14 = [v7 copy];
      terms = v9->_terms;
      v9->_terms = (NSArray *)v14;
    }
    else
    {
      terms = objc_msgSend(v7, "subarrayWithRange:", 0, a4);
      uint64_t v12 = [terms copy];
      v13 = v9->_terms;
      v9->_terms = (NSArray *)v12;
    }
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.link.LNCorpus.internal-queue", v16);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v17;

    v19 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_terms, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (LNCorpusObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (LNCorpusObserver *)WeakRetained;
}

- (void)setTerms:(id)a3
{
}

- (NSArray)terms
{
  return self->_terms;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)removeObserver:(id)a3
{
  p_observer = &self->_observer;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_observer);

  if (WeakRetained == v4)
  {
    objc_storeWeak((id *)p_observer, 0);
  }
}

- (void)setObserver:(id)a3
{
}

- (id)getTerms
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  unint64_t v10 = __Block_byref_object_dispose_;
  id v11 = (id)MEMORY[0x1E4F1CBF0];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __20__LNCorpus_getTerms__block_invoke;
  v5[3] = &unk_1E5B39400;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __20__LNCorpus_getTerms__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  return MEMORY[0x1F41817F8]();
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __17__LNCorpus_count__block_invoke;
  v5[3] = &unk_1E5B39400;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __17__LNCorpus_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)changeWithBlock:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__LNCorpus_changeWithBlock_completionHandler___block_invoke;
  block[3] = &unk_1E5B38888;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __46__LNCorpus_changeWithBlock_completionHandler___block_invoke(void *a1)
{
  id v10 = (id)[*(id *)(a1[4] + 16) copy];
  v2 = (*(void (**)(void))(a1[5] + 16))();
  unint64_t v3 = (void *)[v2 copy];

  if ([v3 isEqualToArray:v10]) {
    goto LABEL_6;
  }
  unint64_t v4 = [v3 count];
  uint64_t v5 = a1[4];
  if (v4 > *(void *)(v5 + 8))
  {
    uint64_t v6 = [v3 subarrayWithRange:0];

    uint64_t v5 = a1[4];
    unint64_t v3 = (void *)v6;
  }
  objc_storeStrong((id *)(v5 + 16), v3);
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));

  if (!WeakRetained)
  {
LABEL_6:
    uint64_t v9 = a1[6];
    if (v9) {
      (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
    }
  }
  else
  {
    id v8 = objc_loadWeakRetained((id *)(a1[4] + 24));
    [v8 corpusContentsChanged:a1[4] completionHandler:a1[6]];
  }
}

- (void)removeAllWithCompletionHandler:(id)a3
{
}

uint64_t __43__LNCorpus_removeAllWithCompletionHandler___block_invoke()
{
  return MEMORY[0x1E4F1CBF0];
}

- (LNCorpus)initWithContents:(id)a3
{
  return [(LNCorpus *)self initWithContents:a3 capacity:1000];
}

- (LNCorpus)init
{
  return [(LNCorpus *)self initWithContents:MEMORY[0x1E4F1CBF0]];
}

@end