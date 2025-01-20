@interface GEOCountryConfigurationLocalProxy
@end

@implementation GEOCountryConfigurationLocalProxy

void __67___GEOCountryConfigurationLocalProxy__determineCurrentCountryCode___block_invoke_254(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) uppercaseString];
  (*(void (**)(uint64_t, id, uint64_t, void))(v1 + 16))(v1, v2, 261, 0);
}

void __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_2(uint64_t a1, void *a2, unsigned int a3, void *a4)
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (!v8)
  {
    if (GEOConfigGetBOOL(GeoServicesConfig_ShouldOverrideCountryCode, (uint64_t)off_1E9113938))
    {
      v13 = _getValue(GeoServicesConfig_OverrideCountryCode, (uint64_t)off_1E9113948, 1, 0, 0, 0);
      v14 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138478083;
        *(void *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2113;
        *(void *)&buf[14] = v7;
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_INFO, "Overriding country code to '%{private}@' (is actually '%{private}@')", buf, 0x16u);
      }

      a3 = 258;
    }
    else
    {
      v13 = v7;
    }
    v12 = +[_GEOCountryConfigurationInfo get]();
    uint64_t v15 = +[_GEOCountryConfigurationInfo countryCode:source:]((uint64_t)_GEOCountryConfigurationInfo, v13, a3);
    if ([v13 length]
      && v15
      && ([MEMORY[0x1E4F1CA20] ISOCountryCodes],
          v16 = objc_claimAutoreleasedReturnValue(),
          char v17 = [v16 containsObject:v13],
          v16,
          (v17 & 1) != 0))
    {
      if (([(id)v15 isEqual:v12] & 1) == 0)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v43 = __Block_byref_object_copy__18;
        v44 = __Block_byref_object_dispose__18;
        id v45 = 0;
        uint64_t v18 = *(void *)(a1 + 32);
        v19 = *(void **)(v18 + 8);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_2_273;
        v33[3] = &unk_1E53DE218;
        v36 = buf;
        v33[4] = v18;
        id v34 = v12;
        id v35 = (id)v15;
        uint64_t v20 = _GEOConfigAddBlockListenerForKey(GeoServicesConfig_DeviceCountryCodeSourced, (uint64_t)off_1E9113928, v19, v33);
        v21 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v20;

        _Block_object_dispose(buf, 8);
      }
      *(void *)buf = *(void *)(v15 + 16);
      v46[0] = @"cc";
      v46[1] = @"source";
      v22 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v15 + 8)];
      v46[2] = @"date";
      uint64_t v23 = *(void *)(v15 + 24);
      *(void *)&buf[8] = v22;
      *(void *)&buf[16] = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v46 count:3];
      _setValue(GeoServicesConfig_DeviceCountryCodeSourced, (uint64_t)off_1E9113928, v24, 1, 0);

      if (!*(void *)(a1 + 48)) {
        goto LABEL_27;
      }
      v25 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_DEBUG, "Finished updating country configuration. Calling callback.", buf, 2u);
      }

      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_274;
      v31[3] = &unk_1E53DA028;
      v26 = *(NSObject **)(a1 + 40);
      id v32 = *(id *)(a1 + 48);
      dispatch_async(v26, v31);
      v27 = v32;
    }
    else
    {
      v28 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v13;
        _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_ERROR, "Country code '%{public}@' is not a valid ISO 3166-1 alpha-2 country code. Ignoring...", buf, 0xCu);
      }

      if (!*(void *)(a1 + 48)) {
        goto LABEL_27;
      }
      v29 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:@"Received non-ISO 3166-1 alpha-2 country code" forKey:*MEMORY[0x1E4F1D140]];
      v27 = v29;
      if (v13) {
        [v29 setObject:v13 forKey:@"Country Code"];
      }
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_272;
      v37[3] = &unk_1E53DA028;
      v30 = *(NSObject **)(a1 + 40);
      id v38 = *(id *)(a1 + 48);
      dispatch_async(v30, v37);
    }
LABEL_27:

    id v7 = v13;
    goto LABEL_28;
  }
  v9 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v8;
    _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Could not determine current country code: %{public}@", buf, 0xCu);
  }

  v10 = *(void **)(a1 + 48);
  if (v10)
  {
    v11 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_264;
    block[3] = &unk_1E53D7C50;
    id v41 = v10;
    id v40 = v8;
    dispatch_async(v11, block);

    v12 = v41;
LABEL_28:
  }
}

uint64_t __82___GEOCountryConfigurationLocalProxy_updateCountryCodeWithCallbackQueue_callback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCountryCodeWithCallbackQueue:*(void *)(a1 + 40) callback:*(void *)(a1 + 48)];
}

uint64_t __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_274(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67___GEOCountryConfigurationLocalProxy__determineCurrentCountryCode___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 72))
  {
    v3 = *(void **)(v2 + 48);
    id v9 = 0;
    uint64_t v4 = [v3 getCurrentDataSubscriptionContextSync:&v9];
    id v5 = v9;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 80);
    *(void *)(v6 + 80) = v4;

    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
    if (!*(void *)(*(void *)(a1 + 32) + 80))
    {
      id v8 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v11 = v5;
        _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Could not get active cellular data context: %{public}@", buf, 0xCu);
      }
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(v2 + 80));
}

void __69___GEOCountryConfigurationLocalProxy_initWithDelegate_delegateQueue___block_invoke(uint64_t a1)
{
  if (MGGetBoolAnswer())
  {
    if (CoreTelephonyLibraryCore())
    {
      uint64_t v2 = [objc_alloc((Class)getCoreTelephonyClientClass()) initWithQueue:*(void *)(*(void *)(a1 + 32) + 8)];
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void **)(v3 + 48);
      *(void *)(v3 + 48) = v2;

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setDelegate:");
      *(void *)(*(void *)(a1 + 32) + 56) = geo_CTServerConnectionCreateOnTargetQueue(0, @"com.apple.GeoServices.GEOCountryConfiguration", *(void **)(*(void *)(a1 + 32) + 8), 0);
      if (!*(void *)(*(void *)(a1 + 32) + 56))
      {
        id v5 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v6 = 0;
          _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Failed to create connection to telephony server. Will not use MCC country code lookup", v6, 2u);
        }
      }
    }
  }
}

void __69___GEOCountryConfigurationLocalProxy_initWithDelegate_delegateQueue___block_invoke_242(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x18C1203C0]();
  uint64_t v3 = +[GEONetworkObserver sharedNetworkObserver];
  [v3 initializeIfNecessary];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69___GEOCountryConfigurationLocalProxy_initWithDelegate_delegateQueue___block_invoke_2;
  block[3] = &unk_1E53D79D8;
  id v9 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  global_queue = (void *)geo_get_global_queue();
  uint64_t v5 = _GEOConfigAddBlockListenerForKey(GeoServicesConfig_OverrideCountryCode, (uint64_t)off_1E9113948, global_queue, &__block_literal_global_248);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __69___GEOCountryConfigurationLocalProxy_initWithDelegate_delegateQueue___block_invoke_2(uint64_t a1)
{
  id v2 = +[GEONetworkObserver sharedNetworkObserver];
  [v2 addNetworkReachableObserver:*(void *)(a1 + 32) selector:sel__reachabilityChanged_];
}

void __69___GEOCountryConfigurationLocalProxy_initWithDelegate_delegateQueue___block_invoke_3()
{
  id v0 = +[GEOCountryConfiguration sharedConfiguration];
  [v0 updateCountryConfiguration:0];
}

uint64_t __60___GEOCountryConfigurationLocalProxy_servingNetworkChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  double Double = GEOConfigGetDouble(GeoServicesConfig_CountryConfigurationUpdateTimerInterval, (uint64_t)off_1E9113D38);

  return [v1 _scheduleUpdate:Double];
}

void __60___GEOCountryConfigurationLocalProxy_currentDataSimChanged___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
}

void __59___GEOCountryConfigurationLocalProxy__reachabilityChanged___block_invoke(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
  uint64_t v5 = [*(id *)(a1 + 40) userInfo];
  uint64_t v6 = [v5 objectForKey:@"GEONetworkObserverReachable"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    id v8 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, "Became reachable. Scheduling country code update", v9, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_scheduleUpdate:", GEOConfigGetDouble(GeoServicesConfig_CountryConfigurationUpdateTimerInterval, (uint64_t)off_1E9113D38));
  }
}

uint64_t __54___GEOCountryConfigurationLocalProxy__scheduleUpdate___block_invoke(uint64_t a1)
{
  id v2 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Update timer fired. Updating country code", v7, 2u);
  }

  uint64_t v3 = *(dispatch_source_t **)(a1 + 32);
  if (v3[4])
  {
    dispatch_source_cancel(v3[4]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;

    uint64_t v3 = *(dispatch_source_t **)(a1 + 32);
  }
  return [(dispatch_source_t *)v3 _updateCountryCodeWithCallbackQueue:0 callback:0];
}

uint64_t __67___GEOCountryConfigurationLocalProxy__determineCurrentCountryCode___block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB29F7B2 = result;
  return result;
}

void __65___GEOCountryConfigurationLocalProxy__determineGeoIPCountryCode___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1[6] + 8) + 40);
  uint64_t v5 = a1[4];
  if (v4 == *(void **)(v5 + 88))
  {
    *(void *)(v5 + 88) = 0;
  }
  uint64_t v6 = [v3 error];

  if (v6)
  {
    uint64_t v7 = a1[5];
    id v8 = [v3 error];
    id v9 = *(void (**)(void))(v7 + 16);
    goto LABEL_13;
  }
  v10 = [v3 receivedData];
  if (![v10 length])
  {

    goto LABEL_12;
  }
  id v11 = [v3 receivedData];
  unint64_t v12 = [v11 length];

  if (v12 >= 0x65)
  {
LABEL_12:
    id v8 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:0];
    id v9 = *(void (**)(void))(a1[5] + 16);
    goto LABEL_13;
  }
  id v13 = [NSString alloc];
  v14 = [v3 receivedData];
  id v8 = (void *)[v13 initWithData:v14 encoding:4];

  if (!v8)
  {
    v16 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:0];
    (*(void (**)(void))(a1[5] + 16))();

    goto LABEL_14;
  }
  uint64_t v15 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138477827;
    uint64_t v18 = v8;
    _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "Received country code '%{private}@' from network", (uint8_t *)&v17, 0xCu);
  }

  id v9 = *(void (**)(void))(a1[5] + 16);
LABEL_13:
  v9();
LABEL_14:
}

uint64_t __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_264(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_272(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-14];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_2_273(uint64_t a1)
{
  GEOConfigRemoveBlockListener(*(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(v5 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_3;
  block[3] = &unk_1E53D99F0;
  void block[4] = v5;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  dispatch_after(v4, v6, block);
}

uint64_t __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postNotificationsForOldInfo:*(void *)(a1 + 40) newInfo:*(void *)(a1 + 48)];
}

void __75___GEOCountryConfigurationLocalProxy__postNotificationsForOldInfo_newInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained serverProxy:*(void *)(a1 + 32) countryCodeDidChange:*(void *)(a1 + 40)];
}

void __75___GEOCountryConfigurationLocalProxy__postNotificationsForOldInfo_newInfo___block_invoke_276(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained serverProxyProvidersDidChange:*(void *)(a1 + 32)];
}

@end