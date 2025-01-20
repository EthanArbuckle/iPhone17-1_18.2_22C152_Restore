@interface CAFTuneToFrequencyControl
+ (id)controlIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (void)registerObserver:(id)a3;
- (void)tuneToFrequency:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFTuneToFrequencyControl

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTuneToFrequencyControl;
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
  v6.super_class = (Class)CAFTuneToFrequencyControl;
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
  v6.super_class = (Class)CAFTuneToFrequencyControl;
  [(CAFControl *)&v6 unregisterObserver:v5];
}

- (void)tuneToFrequency:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v17[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v16[0] = @"frequency";
  v9 = NSNumber;
  id v10 = a4;
  v11 = [v9 numberWithUnsignedInt:v6];
  v16[1] = @"sourceIdentifier";
  v17[0] = v11;
  v17[1] = v10;
  v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__CAFTuneToFrequencyControl_tuneToFrequency_sourceIdentifier_completion___block_invoke;
  v14[3] = &unk_2652632C0;
  id v15 = v8;
  id v13 = v8;
  [(CAFControl *)self requestWithValue:v12 response:v14];
}

uint64_t __73__CAFTuneToFrequencyControl_tuneToFrequency_sourceIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

+ (id)controlIdentifier
{
  return @"0x000000000F00004C";
}

+ (id)observerProtocol
{
  return &unk_26FDAFAA0;
}

@end