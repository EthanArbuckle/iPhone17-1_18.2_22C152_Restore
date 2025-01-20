@interface HandleClearScreen
@end

@implementation HandleClearScreen

void ___HandleClearScreen_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 27))
  {
    *(unsigned char *)(v1 + 27) = 1;
    v2 = *(void **)(a1 + 32);
    v3 = v2[20];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___HandleClearScreen_block_invoke_2;
    block[3] = &unk_264EA1AE8;
    v5 = v2;
    dispatch_async(v3, block);
  }
}

void ___HandleClearScreen_block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 videoStreamIsCleared:1 forRenderer:*(void *)(a1 + 32)];
  }
}

@end