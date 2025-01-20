@interface IMBalloonAppExtension
@end

@implementation IMBalloonAppExtension

void __64__IMBalloonAppExtension_ImageLoading____ck_generateStatusImage___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [MEMORY[0x1E4F42A80] imageWithCGImage:a2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__IMBalloonAppExtension_ImageLoading____ck_generateStatusImage___block_invoke_2;
  v6[3] = &unk_1E5623828;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __64__IMBalloonAppExtension_ImageLoading____ck_generateStatusImage___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end