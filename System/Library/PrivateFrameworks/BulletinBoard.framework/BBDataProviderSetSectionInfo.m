@interface BBDataProviderSetSectionInfo
@end

@implementation BBDataProviderSetSectionInfo

void ___BBDataProviderSetSectionInfo_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Set info for section %{public}@ to %{public}@", (uint8_t *)&v7, 0x16u);
  }
  v5 = (void *)MEMORY[0x21D44A020]();
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    [(id)__server _saveUpdatedSectionInfo:v6 forSectionID:*(void *)(a1 + 32)];
  }
}

@end