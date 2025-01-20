@interface MADVSKClient
- (BOOL)isPrewarmed;
- (MADVSKClient)initWithConfig:(id)a3 error:(id *)a4;
- (VSKClient)client;
- (void)cooldown;
- (void)dealloc;
- (void)warmup;
@end

@implementation MADVSKClient

- (MADVSKClient)initWithConfig:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADVSKClient;
  v7 = [(MADVSKClient *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB3BD0]) initWithConfig:v6 error:a4];
    client = v7->_client;
    v7->_client = (VSKClient *)v8;
  }
  return v7;
}

- (void)warmup
{
  if (!self->_isPrewarmed)
  {
    v3 = VCPSignPostLog();
    os_signpost_id_t v4 = os_signpost_id_generate(v3);

    v5 = VCPSignPostLog();
    id v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MAD_VSKClientWarmup", "", buf, 2u);
    }

    [(VSKClient *)self->_client warmup];
    v7 = VCPSignPostLog();
    uint64_t v8 = v7;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v8, OS_SIGNPOST_INTERVAL_END, v4, "MAD_VSKClientWarmup", "", v9, 2u);
    }

    self->_isPrewarmed = 1;
  }
}

- (void)cooldown
{
  if (self->_isPrewarmed)
  {
    v3 = VCPSignPostLog();
    os_signpost_id_t v4 = os_signpost_id_generate(v3);

    v5 = VCPSignPostLog();
    id v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MAD_VSKClientCooldown", "", buf, 2u);
    }

    [(VSKClient *)self->_client cooldown];
    v7 = VCPSignPostLog();
    uint64_t v8 = v7;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v8, OS_SIGNPOST_INTERVAL_END, v4, "MAD_VSKClientCooldown", "", v9, 2u);
    }

    self->_isPrewarmed = 0;
  }
}

- (void)dealloc
{
  [(MADVSKClient *)self cooldown];
  v3.receiver = self;
  v3.super_class = (Class)MADVSKClient;
  [(MADVSKClient *)&v3 dealloc];
}

- (BOOL)isPrewarmed
{
  return self->_isPrewarmed;
}

- (VSKClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

@end