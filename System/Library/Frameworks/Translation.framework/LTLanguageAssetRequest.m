@interface LTLanguageAssetRequest
@end

@implementation LTLanguageAssetRequest

void __56___LTLanguageAssetRequest_assetRequestWithService_done___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v2 = [a1[5] copy];
    v3 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = v2;

    objc_storeStrong((id *)WeakRetained + 2, a1[4]);
    objc_msgSend(*((id *)WeakRetained + 2), "assetRequestHandler:");
  }
}

uint64_t __68___LTLanguageAssetRequest_assetResponseWithProgress_finished_error___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 4);
    [v3 assetResponseWithProgress:*(void *)(a1 + 32) finished:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 40)];

    if (*(unsigned char *)(a1 + 56))
    {
      v4 = v9;
      v5 = (void (**)(id, void))v9[8];
      if (v5)
      {
        v5[2](v5, *(void *)(a1 + 40));
        v4 = v9;
      }
      v6 = (void (**)(void))v4[3];
      if (v6) {
        v6[2]();
      }
    }
    else
    {
      v7 = (void (**)(id, void))v9[7];
      if (v7) {
        v7[2](v7, *(void *)(a1 + 32));
      }
    }
  }

  return MEMORY[0x270F9A758]();
}

@end