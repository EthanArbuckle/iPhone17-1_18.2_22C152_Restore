@interface INImage
@end

@implementation INImage

void __49__INImage_IntentsUI__fetchUIImageWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v7)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = [MEMORY[0x263F1C6B0] imageWithData:v7];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
  else
  {
    if (v9)
    {
      v13 = *MEMORY[0x263F0F810];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315394;
        v15 = "-[INImage(IntentsUI) fetchUIImageWithCompletion:]_block_invoke";
        __int16 v16 = 2112;
        v17 = v10;
        _os_log_error_impl(&dword_20A3EB000, v13, OS_LOG_TYPE_ERROR, "%s UIImage loading failed with error: %@", (uint8_t *)&v14, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end