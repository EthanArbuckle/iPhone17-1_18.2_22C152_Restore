@interface HFTransformItem
- (HFItem)sourceItem;
- (HFItem)transformedSourceItem;
- (HFTransformItem)init;
- (HFTransformItem)initWithSourceItem:(id)a3 resultKeyExclusionFilter:(id)a4;
- (HFTransformItem)initWithSourceItem:(id)a3 resultKeyFilter:(id)a4;
- (HFTransformItem)initWithSourceItem:(id)a3 transformationBlock:(id)a4;
- (HFTransformItem)initWithSourceItem:(id)a3 updateOptionsTransformBlock:(id)a4 resultsTransformBlock:(id)a5;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)optionsTransformBlock;
- (id)resultsTransformBlock;
- (void)setOptionsTransformBlock:(id)a3;
- (void)setResultsTransformBlock:(id)a3;
- (void)setSourceItem:(id)a3;
@end

@implementation HFTransformItem

id __47__HFTransformItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained resultsTransformBlock];
  v6 = [v3 results];

  v7 = ((void (**)(void, void *))v5)[2](v5, v6);

  v8 = (void *)MEMORY[0x263F58190];
  v9 = +[HFItemUpdateOutcome outcomeWithResults:v7];
  v10 = [v8 futureWithResult:v9];

  return v10;
}

id __63__HFTransformItem_initWithSourceItem_resultKeyExclusionFilter___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a2];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "removeObjectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFTransformItem *)self sourceItem];

  if (!v5) {
    NSLog(&cfstr_MustHaveASourc.isa);
  }
  uint64_t v6 = [(HFTransformItem *)self resultsTransformBlock];

  if (!v6) {
    NSLog(&cfstr_MustSpecifyATr.isa);
  }
  uint64_t v7 = [(HFTransformItem *)self sourceItem];
  if (v7
    && (v8 = (void *)v7,
        [(HFTransformItem *)self resultsTransformBlock],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __47__HFTransformItem__subclass_updateWithOptions___block_invoke;
    v19[3] = &unk_264091A08;
    id v20 = v4;
    v21 = self;
    long long v10 = __47__HFTransformItem__subclass_updateWithOptions___block_invoke((uint64_t)v19);
    long long v11 = [(HFTransformItem *)self sourceItem];
    long long v12 = [v11 updateWithOptions:v10];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __47__HFTransformItem__subclass_updateWithOptions___block_invoke_2;
    v17[3] = &unk_26408FB70;
    objc_copyWeak(&v18, &location);
    long long v13 = [v12 flatMap:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v14 = (void *)MEMORY[0x263F58190];
    uint64_t v15 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    long long v13 = [v14 futureWithError:v15];
  }
  return v13;
}

- (HFItem)sourceItem
{
  return self->_sourceItem;
}

- (id)resultsTransformBlock
{
  return self->_resultsTransformBlock;
}

id __47__HFTransformItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  [v2 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:HFItemUpdateOptionAllowInFlightResults];
  id v3 = [*(id *)(a1 + 40) optionsTransformBlock];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) optionsTransformBlock];
    uint64_t v5 = ((void (**)(void, void *))v4)[2](v4, v2);
  }
  else
  {
    uint64_t v5 = (void *)[v2 copy];
  }

  return v5;
}

- (id)optionsTransformBlock
{
  return self->_optionsTransformBlock;
}

- (HFTransformItem)initWithSourceItem:(id)a3 resultKeyExclusionFilter:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__HFTransformItem_initWithSourceItem_resultKeyExclusionFilter___block_invoke;
  v10[3] = &unk_264099F80;
  id v11 = v6;
  id v7 = v6;
  v8 = [(HFTransformItem *)self initWithSourceItem:a3 transformationBlock:v10];

  return v8;
}

- (HFTransformItem)initWithSourceItem:(id)a3 updateOptionsTransformBlock:(id)a4 resultsTransformBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HFTransformItem;
  long long v12 = [(HFTransformItem *)&v19 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourceItem, a3);
    v14 = _Block_copy(v10);
    id optionsTransformBlock = v13->_optionsTransformBlock;
    v13->_id optionsTransformBlock = v14;

    v16 = _Block_copy(v11);
    id resultsTransformBlock = v13->_resultsTransformBlock;
    v13->_id resultsTransformBlock = v16;
  }
  return v13;
}

- (HFTransformItem)initWithSourceItem:(id)a3 transformationBlock:(id)a4
{
  return [(HFTransformItem *)self initWithSourceItem:a3 updateOptionsTransformBlock:0 resultsTransformBlock:a4];
}

- (HFItem)transformedSourceItem
{
  sub_20BA208F4(0, (unint64_t *)&qword_26AB2E460);
  id v3 = self;
  id v4 = HFTransformItem.transformedSourceItem.getter();

  return (HFItem *)v4;
}

- (HFTransformItem)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = NSStringFromSelector(sel_initWithSourceItem_transformationBlock_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFTransformItem.m", 27, @"%s is unavailable; use %@ instead",
    "-[HFTransformItem init]",
    v5);

  return 0;
}

- (HFTransformItem)initWithSourceItem:(id)a3 resultKeyFilter:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__HFTransformItem_initWithSourceItem_resultKeyFilter___block_invoke;
  v10[3] = &unk_264099F80;
  id v11 = v6;
  id v7 = v6;
  v8 = [(HFTransformItem *)self initWithSourceItem:a3 transformationBlock:v10];

  return v8;
}

id __54__HFTransformItem_initWithSourceItem_resultKeyFilter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v11 = objc_msgSend(v3, "objectForKeyedSubscript:", v10, (void)v13);
        objc_msgSend(v4, "na_safeSetObject:forKey:", v11, v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFTransformItem *)self sourceItem];
  uint64_t v6 = [(HFTransformItem *)self optionsTransformBlock];
  uint64_t v7 = [(HFTransformItem *)self resultsTransformBlock];
  uint64_t v8 = (void *)[v4 initWithSourceItem:v5 updateOptionsTransformBlock:v6 resultsTransformBlock:v7];

  [v8 copyLatestResultsFromItem:self];
  return v8;
}

- (void)setSourceItem:(id)a3
{
}

- (void)setOptionsTransformBlock:(id)a3
{
}

- (void)setResultsTransformBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsTransformBlock, 0);
  objc_storeStrong(&self->_optionsTransformBlock, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
}

@end