@interface MX_GEOCountryConfigurationObserver
- (MX_GEOCountryConfigurationObserver)init;
- (id)getCurrentCountryCode;
- (void)_updateCountryCodeFromCurrentGeoCountryConfiguration:(id)a3;
- (void)countryConfigurationDidChange:(id)a3;
- (void)dealloc;
@end

@implementation MX_GEOCountryConfigurationObserver

- (MX_GEOCountryConfigurationObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)MX_GEOCountryConfigurationObserver;
  v2 = [(MX_GEOCountryConfigurationObserver *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_create("com.apple.coremedia.geocountryconfigurationobserver", v3);
    v2->mAccessQueue = (OS_dispatch_queue *)v4;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__MX_GEOCountryConfigurationObserver_init__block_invoke;
    block[3] = &unk_1E57C6368;
    block[4] = v2;
    dispatch_async(v4, block);
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)MEMORY[0x1997179E0](self, a2);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, getGEOCountryConfigurationCountryCodeDidChangeNotification(), 0);
  mAccessQueue = self->mAccessQueue;
  if (mAccessQueue) {
    dispatch_release(mAccessQueue);
  }
  v5.receiver = self;
  v5.super_class = (Class)MX_GEOCountryConfigurationObserver;
  [(MX_GEOCountryConfigurationObserver *)&v5 dealloc];
}

- (id)getCurrentCountryCode
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  mAccessQueue = self->mAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__MX_GEOCountryConfigurationObserver_getCurrentCountryCode__block_invoke;
  v5[3] = &unk_1E57C8DC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_async_and_wait(mAccessQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateCountryCodeFromCurrentGeoCountryConfiguration:(id)a3
{
  mAccessQueue = self->mAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __91__MX_GEOCountryConfigurationObserver__updateCountryCodeFromCurrentGeoCountryConfiguration___block_invoke;
  v4[3] = &unk_1E57C96F0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mAccessQueue, v4);
}

- (void)countryConfigurationDidChange:(id)a3
{
  v4 = (void *)[a3 userInfo];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  objc_super v5 = (void *)getGEODeviceCountryCodeKeySymbolLoc_ptr;
  uint64_t v11 = getGEODeviceCountryCodeKeySymbolLoc_ptr;
  if (!getGEODeviceCountryCodeKeySymbolLoc_ptr)
  {
    uint64_t v6 = (void *)GeoServicesLibrary();
    v9[3] = (uint64_t)dlsym(v6, "GEODeviceCountryCodeKey");
    getGEODeviceCountryCodeKeySymbolLoc_ptr = v9[3];
    objc_super v5 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v5)
  {
    objc_super v7 = (_Unwind_Exception *)__68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  -[MX_GEOCountryConfigurationObserver _updateCountryCodeFromCurrentGeoCountryConfiguration:](self, "_updateCountryCodeFromCurrentGeoCountryConfiguration:", [v4 objectForKey:*v5]);
}

@end