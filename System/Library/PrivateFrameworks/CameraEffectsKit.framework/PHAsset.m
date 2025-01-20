@interface PHAsset
@end

@implementation PHAsset

uint64_t __71__PHAsset_CloudSupport__isAssetLocalWithCompletion_requiresDerivative___block_invoke()
{
  return 1;
}

void __71__PHAsset_CloudSupport__isAssetLocalWithCompletion_requiresDerivative___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9
    || ([v5 objectForKey:*MEMORY[0x263F15070]],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 BOOLValue],
        v6,
        !v7))
  {
    v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

void __71__PHAsset_CloudSupport__isAssetLocalWithCompletion_requiresDerivative___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v7
    || ([v9 objectForKeyedSubscript:*MEMORY[0x263F150C8]],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 BOOLValue],
        v11,
        !v12))
  {
    v13 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    if (!*(unsigned char *)(a1 + 64)
      && ((unint64_t)[*(id *)(a1 + 32) pixelHeight] > 0x86F
       || (unint64_t)[*(id *)(a1 + 32) pixelWidth] >= 0x870)
      && !+[CFXVideoSettings canDecodeHEVC2160P])
    {
      [*(id *)(a1 + 40) setDeliveryMode:2];
      uint64_t v15 = *(void *)(a1 + 40);
      v14 = *(void **)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 32);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __71__PHAsset_CloudSupport__isAssetLocalWithCompletion_requiresDerivative___block_invoke_4;
      v17[3] = &unk_264C0A7A8;
      id v18 = *(id *)(a1 + 56);
      [v14 requestAVAssetForVideo:v16 options:v15 resultHandler:v17];

      goto LABEL_7;
    }
    v13 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v13();
LABEL_7:
}

uint64_t __71__PHAsset_CloudSupport__isAssetLocalWithCompletion_requiresDerivative___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end