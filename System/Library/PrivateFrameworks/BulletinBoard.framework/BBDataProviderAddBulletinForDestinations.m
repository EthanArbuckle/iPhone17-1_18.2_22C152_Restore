@interface BBDataProviderAddBulletinForDestinations
@end

@implementation BBDataProviderAddBulletinForDestinations

void ___BBDataProviderAddBulletinForDestinations_block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[6];
    v4 = v2;
    v5 = BBPublisherDestinationStrings(v3);
    int v7 = 134218242;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Add bulletin to destinations %ld: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  v6 = (void *)MEMORY[0x21D44A020]();
  [(id)__server _publishBulletinRequest:a1[4] forSectionID:a1[5] forDestinations:a1[6]];
}

@end