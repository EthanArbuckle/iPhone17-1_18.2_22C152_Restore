@interface MUFetchBadgeIconWithStyleAttributes
@end

@implementation MUFetchBadgeIconWithStyleAttributes

void ___MUFetchBadgeIconWithStyleAttributes_block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F30EB8] imageForStyle:*(void *)(a1 + 32) size:*(void *)(a1 + 56) forScale:0 format:*(unsigned __int8 *)(a1 + 72) transparent:0 transitMode:0 isCarplay:*(double *)(a1 + 64)];
  v3 = v2;
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v4 = [v2 imageWithRenderingMode:2];

    v3 = (void *)v4;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___MUFetchBadgeIconWithStyleAttributes_block_invoke_2;
  v8[3] = &unk_1E57502D8;
  v5 = *(NSObject **)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t ___MUFetchBadgeIconWithStyleAttributes_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0);
}

@end