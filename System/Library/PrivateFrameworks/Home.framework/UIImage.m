@interface UIImage
@end

@implementation UIImage

void __45__UIImage_HFAdditions__hf_fetchImageFromURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF8F8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  v6 = [v3 dataWithContentsOfURL:v4];
  v7 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v6];
  v8 = HFLogForCategory(0);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v13 = 138412290;
      uint64_t v14 = v10;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Successfully loaded image for URL : %@", (uint8_t *)&v13, 0xCu);
    }

    [v5 finishWithResult:v7];
  }
  else
  {
    if (v9)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v13 = 138412290;
      uint64_t v14 = v11;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Failed to load image for URL : %@", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "na_genericError");
    [v5 finishWithError:v12];

    id v5 = (id)v12;
  }
}

@end