@interface BBDataProviderGetClearedInfoWithCompletion
@end

@implementation BBDataProviderGetClearedInfoWithCompletion

void ___BBDataProviderGetClearedInfoWithCompletion_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Get cleared info for section %{public}@", (uint8_t *)&v7, 0xCu);
  }
  v4 = (void *)MEMORY[0x21D44A020]();
  v5 = [(id)__server _clearedInfoForSectionID:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  }
}

@end