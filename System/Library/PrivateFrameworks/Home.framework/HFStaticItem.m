@interface HFStaticItem
+ (id)emptyItem;
- (HFStaticItem)init;
- (HFStaticItem)initWithResults:(id)a3;
- (HFStaticItem)initWithResultsBlock:(id)a3;
- (NSDictionary)staticResults;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)resultsBlock;
- (void)reset;
- (void)setResultsBlock:(id)a3;
- (void)setStaticResults:(id)a3;
@end

@implementation HFStaticItem

id __44__HFStaticItem__subclass_updateWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)MEMORY[0x263F58190];
  v3 = +[HFItemUpdateOutcome outcomeWithResults:a2];
  v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = [(HFStaticItem *)self staticResults];

  if (v4)
  {
    v5 = (void *)MEMORY[0x263F58190];
    v6 = [(HFStaticItem *)self staticResults];
    v7 = +[HFItemUpdateOutcome outcomeWithResults:v6];
    uint64_t v8 = [v5 futureWithResult:v7];
LABEL_5:
    v10 = (void *)v8;

    goto LABEL_6;
  }
  v9 = [(HFStaticItem *)self resultsBlock];

  if (v9)
  {
    v6 = [(HFStaticItem *)self resultsBlock];
    v7 = v6[2]();
    uint64_t v8 = [v7 flatMap:&__block_literal_global_12];
    goto LABEL_5;
  }
  v12 = (void *)MEMORY[0x263F58190];
  objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v10 = [v12 futureWithError:v6];
LABEL_6:

  return v10;
}

- (id)resultsBlock
{
  return self->_resultsBlock;
}

- (NSDictionary)staticResults
{
  return self->_staticResults;
}

- (HFStaticItem)initWithResultsBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFStaticItem;
  v5 = [(HFStaticItem *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id resultsBlock = v5->_resultsBlock;
    v5->_id resultsBlock = v6;
  }
  return v5;
}

- (HFStaticItem)initWithResults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFStaticItem;
  v6 = [(HFStaticItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_staticResults, a3);
  }

  return v7;
}

+ (id)emptyItem
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[v2 initWithResults:MEMORY[0x263EFFA78]];
  return v3;
}

- (HFStaticItem)init
{
  return [(HFStaticItem *)self initWithResults:MEMORY[0x263EFFA78]];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(HFStaticItem *)self staticResults];

  if (v5)
  {
    id v6 = objc_alloc((Class)objc_opt_class());
    v7 = [(HFStaticItem *)self staticResults];
    uint64_t v8 = (void *)[v7 copy];
    uint64_t v9 = [v6 initWithResults:v8];
  }
  else
  {
    v10 = [(HFStaticItem *)self resultsBlock];

    if (!v10)
    {
      v7 = [MEMORY[0x263F08690] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"HFStaticItem.m", 60, @"HFStaticItem should have either staticResults or a resultsBlock, but it has neither" object file lineNumber description];
      v12 = 0;
      goto LABEL_6;
    }
    id v11 = objc_alloc((Class)objc_opt_class());
    v7 = [(HFStaticItem *)self resultsBlock];
    uint64_t v8 = (void *)[v7 copy];
    uint64_t v9 = [v11 initWithResultsBlock:v8];
  }
  v12 = (void *)v9;

LABEL_6:
  [v12 copyLatestResultsFromItem:self];
  return v12;
}

- (void)reset
{
  if (+[HFUtilities isInternalTest])
  {
    [(HFStaticItem *)self setResultsBlock:0];
    [(HFStaticItem *)self setStaticResults:0];
  }
}

- (void)setStaticResults:(id)a3
{
}

- (void)setResultsBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsBlock, 0);
  objc_storeStrong((id *)&self->_staticResults, 0);
}

@end