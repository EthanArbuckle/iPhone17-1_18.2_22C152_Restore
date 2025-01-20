@interface GEOPhoneNumberResolver
+ (id)sharedResolver;
- (GEOPhoneNumberResolver)init;
- (void)resolvePhoneNumbers:(id)a3 handler:(id)a4 queue:(id)a5;
@end

@implementation GEOPhoneNumberResolver

+ (id)sharedResolver
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__GEOPhoneNumberResolver_sharedResolver__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB2A0920 != -1) {
    dispatch_once(&qword_1EB2A0920, block);
  }
  v2 = (void *)_MergedGlobals_352;

  return v2;
}

void __40__GEOPhoneNumberResolver_sharedResolver__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_352;
  _MergedGlobals_352 = (uint64_t)v1;
}

- (GEOPhoneNumberResolver)init
{
  v8.receiver = self;
  v8.super_class = (Class)GEOPhoneNumberResolver;
  v2 = [(GEOPhoneNumberResolver *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)qword_1EB2A0928;
    uint64_t v13 = qword_1EB2A0928;
    if (!qword_1EB2A0928)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getPNRPhoneNumberResolverClass_block_invoke;
      v9[3] = &unk_1E53DB3C8;
      v9[4] = &v10;
      __getPNRPhoneNumberResolverClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (PNRPhoneNumberResolver *)objc_alloc_init(v4);
    resolver = v2->_resolver;
    v2->_resolver = v5;
  }
  return v2;
}

- (void)resolvePhoneNumbers:(id)a3 handler:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = GeoServicesConfig_PNRDisabled;
  v11 = off_1E9114B78;
  uint64_t v12 = a5;
  if (GEOConfigGetBOOL(v10, (uint64_t)v11))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__GEOPhoneNumberResolver_resolvePhoneNumbers_handler_queue___block_invoke;
    block[3] = &unk_1E53DA028;
    uint64_t v13 = &v20;
    id v20 = v9;
    id v14 = v9;
    dispatch_async(v12, block);
  }
  else
  {
    resolver = self->_resolver;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__GEOPhoneNumberResolver_resolvePhoneNumbers_handler_queue___block_invoke_2;
    v17[3] = &unk_1E53F8EA0;
    uint64_t v13 = &v18;
    id v18 = v9;
    id v16 = v9;
    [(PNRPhoneNumberResolver *)resolver resolvePhoneNumbers:v8 queue:v12 handler:v17];
  }
}

uint64_t __60__GEOPhoneNumberResolver_resolvePhoneNumbers_handler_queue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__GEOPhoneNumberResolver_resolvePhoneNumbers_handler_queue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[GEOPhoneNumberResolutionResultSet alloc] initWithPNRResultSet:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end