@interface HFActionSetBuilderPair
- (HFActionSetBuilderPair)initWithActionSet:(id)a3 builder:(id)a4;
- (HFActionSetBuilderPair)initWithBuilder:(id)a3;
- (HMActionSet)actionSet;
- (HMActionSetBuilder)builder;
- (id)commitActionSetInHome:(id)a3;
@end

@implementation HFActionSetBuilderPair

- (HFActionSetBuilderPair)initWithActionSet:(id)a3 builder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFActionSetBuilderPair;
  v9 = [(HFActionSetBuilderPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionSet, a3);
    objc_storeStrong((id *)&v10->_builder, a4);
  }

  return v10;
}

- (HFActionSetBuilderPair)initWithBuilder:(id)a3
{
  return [(HFActionSetBuilderPair *)self initWithActionSet:0 builder:a3];
}

- (id)commitActionSetInHome:(id)a3
{
  id v4 = a3;
  v5 = [(HFActionSetBuilderPair *)self builder];

  if (v5)
  {
    v6 = [(HFActionSetBuilderPair *)self builder];
    id v7 = [(HFActionSetBuilderPair *)self actionSet];
    id v8 = v7;
    v9 = (void *)MEMORY[0x263F58190];
    if (v7)
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __48__HFActionSetBuilderPair_commitActionSetInHome___block_invoke;
      v24[3] = &unk_26408E218;
      v10 = &v25;
      id v11 = v7;
      objc_super v12 = &v26;
      id v25 = v11;
      v26 = v6;
      id v13 = v6;
      v14 = [v9 futureWithErrorOnlyHandlerAdapterBlock:v24];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __48__HFActionSetBuilderPair_commitActionSetInHome___block_invoke_2;
      v22[3] = &unk_26408CDC8;
      id v23 = v11;
      v15 = [v14 flatMap:v22];
    }
    else
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __48__HFActionSetBuilderPair_commitActionSetInHome___block_invoke_3;
      v19[3] = &unk_264090378;
      v10 = &v20;
      objc_super v12 = &v21;
      id v20 = v4;
      v21 = v6;
      id v17 = v6;
      v15 = [v9 futureWithCompletionHandlerAdapterBlock:v19];
    }
  }
  else
  {
    NSLog(&stru_26C081158.isa);
    v16 = (void *)MEMORY[0x263F58190];
    id v8 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    v15 = [v16 futureWithError:v8];
  }

  return v15;
}

uint64_t __48__HFActionSetBuilderPair_commitActionSetInHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateWithBuilder:*(void *)(a1 + 40) completionHandler:a2];
}

uint64_t __48__HFActionSetBuilderPair_commitActionSetInHome___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x263F58190] futureWithResult:*(void *)(a1 + 32)];
}

uint64_t __48__HFActionSetBuilderPair_commitActionSetInHome___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addActionSetFromBuilder:*(void *)(a1 + 40) completionHandler:a2];
}

- (HMActionSetBuilder)builder
{
  return self->_builder;
}

- (HMActionSet)actionSet
{
  return self->_actionSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSet, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

@end