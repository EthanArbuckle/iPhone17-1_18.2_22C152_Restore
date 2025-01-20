@interface CNTCC
+ (id)sharedInstance;
- (CNTCC)tccServices;
- (int)accessPreflight;
- (void)setTccServices:(id)a3;
@end

@implementation CNTCC

+ (id)sharedInstance
{
  if (sharedInstance_cn_once_token_0 != -1) {
    dispatch_once(&sharedInstance_cn_once_token_0, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_cn_once_object_0;

  return v2;
}

uint64_t __23__CNTCC_sharedInstance__block_invoke()
{
  sharedInstance_cn_once_object_0 = objc_alloc_init(CNTCC);

  return MEMORY[0x1F41817F8]();
}

- (CNTCC)tccServices
{
  id v3 = (id)cn_objectResultWithObjectLock();
  return self->_tccServices;
}

id __20__CNTCC_tccServices__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F5A528] defaultTCC];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }

  return v2;
}

- (int)accessPreflight
{
  if (accessPreflight_cn_once_token_1 != -1) {
    dispatch_once(&accessPreflight_cn_once_token_1, &__block_literal_global_4_0);
  }
  id v3 = (id)accessPreflight_cn_once_object_1;
  uint64_t v4 = [(CNTCC *)self tccServices];
  uint64_t v5 = [v4 checkAuthorizationStatusOfCurrentProcess];

  v6 = [NSNumber numberWithInteger:v5];
  v7 = [v3 objectForKeyedSubscript:v6];

  LODWORD(v3) = [v7 integerValue];
  return (int)v3;
}

void __24__CNTCC_accessPreflight__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v3[0] = &unk_1EE0891B8;
  v3[1] = &unk_1EE0891E8;
  v4[0] = &unk_1EE0891D0;
  v4[1] = &unk_1EE089200;
  v3[2] = &unk_1EE089218;
  v3[3] = &unk_1EE089248;
  v4[2] = &unk_1EE089230;
  v4[3] = &unk_1EE089230;
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  uint64_t v1 = [v0 copy];
  v2 = (void *)accessPreflight_cn_once_object_1;
  accessPreflight_cn_once_object_1 = v1;
}

- (void)setTccServices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end