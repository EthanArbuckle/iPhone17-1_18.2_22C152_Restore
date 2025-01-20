@interface HFCameraAnalyticsPayloadDecorator
+ (id)sharedDecorator;
- (HFCameraAnalyticsPayloadDecorator)init;
- (NSMutableDictionary)additionalPayload;
- (id)decoratePayload:(id)a3;
- (void)_initialiseAdditionalPayloadForNewHome;
- (void)_updateHomeInformation:(id)a3;
- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5;
- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3;
- (void)setAdditionalPayload:(id)a3;
@end

@implementation HFCameraAnalyticsPayloadDecorator

+ (id)sharedDecorator
{
  if (qword_26AB2F0D8 != -1) {
    dispatch_once(&qword_26AB2F0D8, &__block_literal_global_91);
  }
  v2 = (void *)_MergedGlobals_251;
  return v2;
}

uint64_t __52__HFCameraAnalyticsPayloadDecorator_sharedDecorator__block_invoke()
{
  v0 = objc_alloc_init(HFCameraAnalyticsPayloadDecorator);
  uint64_t v1 = _MergedGlobals_251;
  _MergedGlobals_251 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFCameraAnalyticsPayloadDecorator)init
{
  v9.receiver = self;
  v9.super_class = (Class)HFCameraAnalyticsPayloadDecorator;
  v2 = [(HFCameraAnalyticsPayloadDecorator *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    additionalPayload = v2->_additionalPayload;
    v2->_additionalPayload = (NSMutableDictionary *)v3;

    [(HFCameraAnalyticsPayloadDecorator *)v2 _initialiseAdditionalPayload];
    v5 = +[HFHomeKitDispatcher sharedDispatcher];
    [v5 addHomeManagerObserver:v2];
    v6 = [v5 home];

    if (v6)
    {
      v7 = [v5 home];
      [(HFCameraAnalyticsPayloadDecorator *)v2 _updateHomeInformation:v7];
    }
  }
  return v2;
}

- (void)_initialiseAdditionalPayloadForNewHome
{
  uint64_t v3 = [(HFCameraAnalyticsPayloadDecorator *)self additionalPayload];
  [v3 setObject:@"Unknown" forKeyedSubscript:HFCameraAnalyticsISOCountryCode];

  id v4 = [(HFCameraAnalyticsPayloadDecorator *)self additionalPayload];
  [v4 setObject:@"Unknown" forKeyedSubscript:HFCameraAnalyticsAdministrativeArea];
}

- (id)decoratePayload:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  v6 = [v4 dictionary];
  [v6 addEntriesFromDictionary:v5];

  v7 = [(HFCameraAnalyticsPayloadDecorator *)self additionalPayload];
  [v6 addEntriesFromDictionary:v7];

  return v6;
}

- (void)_updateHomeInformation:(id)a3
{
  id v4 = a3;
  [(HFCameraAnalyticsPayloadDecorator *)self _initialiseAdditionalPayloadForNewHome];
  id v5 = [v4 location];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F00A40]);
    v7 = [v4 location];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__HFCameraAnalyticsPayloadDecorator__updateHomeInformation___block_invoke;
    v8[3] = &unk_264094618;
    id v9 = v4;
    v10 = self;
    [v6 reverseGeocodeLocation:v7 completionHandler:v8];
  }
}

void __60__HFCameraAnalyticsPayloadDecorator__updateHomeInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = HFLogForCategory(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v30 = 138412546;
      uint64_t v31 = v8;
      __int16 v32 = 2112;
      id v33 = v6;
      id v9 = "Unable to reverse geocode home location for home:%@ error:%@";
      v10 = v7;
      uint32_t v11 = 22;
LABEL_15:
      _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v30, v11);
    }
  }
  else if (v5 && [v5 count])
  {
    v7 = [v5 objectAtIndex:0];
    v12 = [*(id *)(a1 + 32) location];
    [v12 coordinate];
    double v14 = v13;
    v15 = [v7 location];
    [v15 coordinate];
    double v17 = vabdd_f64(v14, v16);

    v18 = [*(id *)(a1 + 32) location];
    [v18 coordinate];
    double v20 = v19;
    v21 = [v7 location];
    [v21 coordinate];
    double v23 = vabdd_f64(v20, v22);

    if (v17 <= 0.00000011920929 && v23 <= 0.00000011920929)
    {
      v25 = [v7 ISOcountryCode];
      v26 = [*(id *)(a1 + 40) additionalPayload];
      [v26 setObject:v25 forKeyedSubscript:HFCameraAnalyticsISOCountryCode];

      v27 = [v7 administrativeArea];
      v28 = [*(id *)(a1 + 40) additionalPayload];
      [v28 setObject:v27 forKeyedSubscript:HFCameraAnalyticsAdministrativeArea];
    }
  }
  else
  {
    v7 = HFLogForCategory(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = *(void *)(a1 + 32);
      int v30 = 138412290;
      uint64_t v31 = v29;
      id v9 = "No placemarks from reverse geocode home location for home:%@";
      v10 = v7;
      uint32_t v11 = 12;
      goto LABEL_15;
    }
  }
}

- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3
{
  id v4 = [a3 currentHome];
  [(HFCameraAnalyticsPayloadDecorator *)self _updateHomeInformation:v4];
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
}

- (NSMutableDictionary)additionalPayload
{
  return self->_additionalPayload;
}

- (void)setAdditionalPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end