@interface CAFTuneToIdentifierControl
+ (id)controlIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (void)registerObserver:(id)a3;
- (void)tuneToIdentifier:(id)a3 sourceIdentifier:(id)a4 completion:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTuneToIdentifierControl

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTuneToIdentifierControl;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA8730]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFTuneToIdentifierControl;
  [(CAFControl *)&v6 registerObserver:v5];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA8730]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFTuneToIdentifierControl;
  [(CAFControl *)&v6 unregisterObserver:v5];
}

- (void)tuneToIdentifier:(id)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  v17[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v16[0] = @"identifier";
  v16[1] = @"sourceIdentifier";
  v17[0] = a3;
  v17[1] = a4;
  v9 = NSDictionary;
  id v10 = a4;
  id v11 = a3;
  v12 = [v9 dictionaryWithObjects:v17 forKeys:v16 count:2];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__CAFTuneToIdentifierControl_tuneToIdentifier_sourceIdentifier_completion___block_invoke;
  v14[3] = &unk_2652632C0;
  id v15 = v8;
  id v13 = v8;
  [(CAFControl *)self requestWithValue:v12 response:v14];
}

uint64_t __75__CAFTuneToIdentifierControl_tuneToIdentifier_sourceIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

+ (id)controlIdentifier
{
  return @"0x000000000F00004B";
}

+ (id)observerProtocol
{
  return &unk_26FDAFC58;
}

@end