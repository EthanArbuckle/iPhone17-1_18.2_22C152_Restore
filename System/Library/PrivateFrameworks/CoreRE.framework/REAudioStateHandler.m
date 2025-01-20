@interface REAudioStateHandler
- (REAudioStateHandler)initWithTitle:(id)a3 block:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation REAudioStateHandler

- (REAudioStateHandler)initWithTitle:(id)a3 block:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)REAudioStateHandler;
  v8 = [(REAudioStateHandler *)&v15 init];
  v9 = v8;
  if (v8)
  {
    id v14 = v7;
    id v13 = v6;
    v9->unint64_t osStateHandle = os_state_add_handler();
  }
  v10 = *re::audioLogObjects((re *)v8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t osStateHandle = v9->osStateHandle;
    *(_DWORD *)buf = 134217984;
    unint64_t v17 = osStateHandle;
    _os_log_impl(&dword_233120000, v10, OS_LOG_TYPE_DEFAULT, "Created osStateHandle: %llu", buf, 0xCu);
  }

  return v9;
}

char *__43__REAudioStateHandler_initWithTitle_block___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!os_variant_has_internal_diagnostics() || *(_DWORD *)(a2 + 16) != 3) {
    return 0;
  }
  v4 = (void *)MEMORY[0x237DBDCF0]();
  v5 = (void *)MEMORY[0x263F08AC0];
  id v6 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v7 = [v5 dataWithPropertyList:v6 format:200 options:0 error:0];

  if (v7)
  {
    size_t v8 = [v7 length];
    v9 = (char *)malloc_type_calloc(1uLL, v8 + 200, 0xB73316B3uLL);
    if (v9)
    {
      strlcpy(v9 + 136, (const char *)[*(id *)(a1 + 32) UTF8String], 0x40uLL);
      *(_DWORD *)v9 = 1;
      *((_DWORD *)v9 + 1) = v8;
      memcpy(v9 + 200, (const void *)[v7 bytes], v8);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->osStateHandle)
  {
    v3 = *re::audioLogObjects((re *)self);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t osStateHandle = self->osStateHandle;
      int v5 = 134217984;
      unint64_t v6 = osStateHandle;
      _os_log_impl(&dword_233120000, v3, OS_LOG_TYPE_DEFAULT, "Removed osStateHandle: %llu", (uint8_t *)&v5, 0xCu);
    }
    os_state_remove_handler();
    self->unint64_t osStateHandle = 0;
  }
}

- (void)dealloc
{
  [(REAudioStateHandler *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)REAudioStateHandler;
  [(REAudioStateHandler *)&v3 dealloc];
}

@end