@interface AFConnectionUserInteractionAssertion
- (AFConnectionUserInteractionAssertion)initWithCompletion:(id)a3;
- (void)releaseAssertion;
@end

@implementation AFConnectionUserInteractionAssertion

- (void).cxx_destruct
{
}

- (void)releaseAssertion
{
}

- (AFConnectionUserInteractionAssertion)initWithCompletion:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFConnectionUserInteractionAssertion;
  v5 = [(AFConnectionUserInteractionAssertion *)&v12 init];
  if (v5)
  {
    v6 = [AFSafetyBlock alloc];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__AFConnectionUserInteractionAssertion_initWithCompletion___block_invoke;
    v10[3] = &unk_1E5928560;
    id v11 = v4;
    uint64_t v7 = [(AFSafetyBlock *)v6 initWithBlock:v10];
    safetyBlock = v5->_safetyBlock;
    v5->_safetyBlock = (AFSafetyBlock *)v7;
  }
  return v5;
}

uint64_t __59__AFConnectionUserInteractionAssertion_initWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end