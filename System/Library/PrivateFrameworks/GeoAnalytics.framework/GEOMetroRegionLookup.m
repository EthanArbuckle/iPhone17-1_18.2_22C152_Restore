@interface GEOMetroRegionLookup
- (id)_lookupRegionWithLocation:(id)a3 countryCode:(id)a4;
- (id)lookupRegionWithLocation:(id)a3;
- (id)lookupRegionWithLocation:(id)a3 countryCodeHint:(id)a4;
@end

@implementation GEOMetroRegionLookup

- (id)lookupRegionWithLocation:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F41770] sharedConfiguration];
  v6 = [v5 countryCode];

  if (v6)
  {
    uint64_t v7 = [(GEOMetroRegionLookup *)self _lookupRegionWithLocation:v4 countryCode:v6];
    v8 = (void *)v7;
    v9 = @"UNKNOWN";
    if (v7) {
      v9 = (__CFString *)v7;
    }
    v10 = v9;
  }
  else
  {
    v11 = GEOGetMetroRegionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_24FE56000, v11, OS_LOG_TYPE_INFO, "Could not determine country code", v13, 2u);
    }

    v10 = @"UNKNOWN";
  }

  return v10;
}

- (id)lookupRegionWithLocation:(id)a3 countryCodeHint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    v8 = [(GEOMetroRegionLookup *)self _lookupRegionWithLocation:v6 countryCode:v7];
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v10 = [(GEOMetroRegionLookup *)self lookupRegionWithLocation:v6];
    }
    v12 = v10;
  }
  else
  {
    v11 = GEOGetMetroRegionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_24FE56000, v11, OS_LOG_TYPE_INFO, "Country code not provided", v14, 2u);
    }

    v12 = @"UNKNOWN";
  }

  return v12;
}

- (id)_lookupRegionWithLocation:(id)a3 countryCode:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[GEOMetroRegionAssetProvider sharedProvider];
  v8 = [v7 urlForInstalledCountryCode:v6];

  GEOGetMetroRegionLog();
  v9 = (GEOMetroRegionData *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = os_log_type_enabled(&v9->super, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_24FE56000, &v9->super, OS_LOG_TYPE_INFO, "MA-URL for country code '%@' is '%@'", (uint8_t *)&v15, 0x16u);
    }

    v9 = [[GEOMetroRegionData alloc] initWithFileURL:v8];
    id v11 = objc_alloc_init(MEMORY[0x263F417D0]);
    v12 = (void *)[v5 copy];
    [v11 setLatLng:v12];

    v13 = [(GEOMetroRegionData *)v9 metroNameForLocation:v11];
  }
  else
  {
    if (v10)
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_24FE56000, &v9->super, OS_LOG_TYPE_INFO, "MA-URL unavailable for country code '%@'", (uint8_t *)&v15, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

@end