@interface HFTriggerBuilderPair
+ (id)creatingTriggerWithBuilder:(id)a3;
+ (id)updatingTrigger:(id)a3 withBuilder:(id)a4;
- (HFTriggerBuilderPair)initWithTrigger:(id)a3 builder:(id)a4;
- (HMTrigger)trigger;
- (HMTriggerBuilder)builder;
- (id)commitBuilderInHome:(id)a3;
- (void)_notifyObserversOfAddingTrigger:(id)a3 inHome:(id)a4;
- (void)_notifyObserversOfChangingTrigger:(id)a3 inHome:(id)a4;
@end

@implementation HFTriggerBuilderPair

- (HFTriggerBuilderPair)initWithTrigger:(id)a3 builder:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HFTriggerBuilder+AutomationBuilders.m", 60, @"Invalid parameter not satisfying: %@", @"builder" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)HFTriggerBuilderPair;
  v10 = [(HFTriggerBuilderPair *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_trigger, a3);
    objc_storeStrong((id *)&v11->_builder, a4);
  }

  return v11;
}

+ (id)creatingTriggerWithBuilder:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithTrigger:0 builder:v4];

  return v5;
}

+ (id)updatingTrigger:(id)a3 withBuilder:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithTrigger:v7 builder:v6];

  return v8;
}

- (id)commitBuilderInHome:(id)a3
{
  id v4 = a3;
  v5 = [(HFTriggerBuilderPair *)self trigger];
  id v6 = [(HFTriggerBuilderPair *)self builder];
  if (v6)
  {
    if (v5)
    {
      id v7 = objc_msgSend(v5, "hf_updateWithBuilder:", v6);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __44__HFTriggerBuilderPair_commitBuilderInHome___block_invoke;
      v14[3] = &unk_264099FA8;
      v14[4] = self;
      id v15 = v4;
      id v8 = [v7 addSuccessBlock:v14];
      id v9 = v15;
    }
    else
    {
      id v7 = objc_msgSend(MEMORY[0x263F0E878], "hf_newTriggerWithBuilder:inHome:", v6, v4);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __44__HFTriggerBuilderPair_commitBuilderInHome___block_invoke_2;
      v12[3] = &unk_264099FA8;
      v12[4] = self;
      id v13 = v4;
      id v8 = [v7 addSuccessBlock:v12];
      id v9 = v13;
    }
  }
  else
  {
    NSLog(&cfstr_TriedToCommitA.isa);
    v10 = (void *)MEMORY[0x263F58190];
    id v7 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    id v8 = [v10 futureWithError:v7];
  }

  return v8;
}

uint64_t __44__HFTriggerBuilderPair_commitBuilderInHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserversOfChangingTrigger:a2 inHome:*(void *)(a1 + 40)];
}

uint64_t __44__HFTriggerBuilderPair_commitBuilderInHome___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserversOfAddingTrigger:a2 inHome:*(void *)(a1 + 40)];
}

- (void)_notifyObserversOfAddingTrigger:(id)a3 inHome:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[HFHomeKitDispatcher sharedDispatcher];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__HFTriggerBuilderPair__notifyObserversOfAddingTrigger_inHome___block_invoke;
  v10[3] = &unk_26408D8F0;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 dispatchHomeObserverMessage:v10 sender:0];
}

void __63__HFTriggerBuilderPair__notifyObserversOfAddingTrigger_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didAddTrigger:*(void *)(a1 + 40)];
  }
}

- (void)_notifyObserversOfChangingTrigger:(id)a3 inHome:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[HFHomeKitDispatcher sharedDispatcher];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__HFTriggerBuilderPair__notifyObserversOfChangingTrigger_inHome___block_invoke;
  v10[3] = &unk_26408D8F0;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 dispatchHomeObserverMessage:v10 sender:0];
}

void __65__HFTriggerBuilderPair__notifyObserversOfChangingTrigger_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didUpdateTrigger:*(void *)(a1 + 40)];
  }
}

- (HMTriggerBuilder)builder
{
  return self->_builder;
}

- (HMTrigger)trigger
{
  return self->_trigger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

@end