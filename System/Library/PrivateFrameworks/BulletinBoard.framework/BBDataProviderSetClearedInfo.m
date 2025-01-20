@interface BBDataProviderSetClearedInfo
@end

@implementation BBDataProviderSetClearedInfo

void ___BBDataProviderSetClearedInfo_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Set cleared info for section %{public}@ to %{public}@", (uint8_t *)&v6, 0x16u);
  }
  v5 = (void *)MEMORY[0x21D44A020]();
  [(id)__server _saveUpdatedClearedInfo:*(void *)(a1 + 40) forSectionID:*(void *)(a1 + 32)];
}

@end