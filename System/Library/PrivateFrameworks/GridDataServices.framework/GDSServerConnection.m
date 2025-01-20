@interface GDSServerConnection
@end

@implementation GDSServerConnection

void __38___GDSServerConnection_sharedInstance__block_invoke()
{
  if (!sharedInstance_instance)
  {
    sharedInstance_instance = objc_alloc_init(_GDSServerConnection);
    MEMORY[0x270F9A758]();
  }
}

void __37___GDSServerConnection_dateFormatter__block_invoke()
{
  id v3 = (id)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)dateFormatter_dateFormatter;
  dateFormatter_dateFormatter = (uint64_t)v0;

  [(id)dateFormatter_dateFormatter setLocale:v3];
  v2 = [MEMORY[0x263EFFA18] timeZoneWithAbbreviation:@"UTC"];
  [(id)dateFormatter_dateFormatter setTimeZone:v2];

  [(id)dateFormatter_dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
}

void *__44___GDSServerConnection_queryItemsMetaParams__block_invoke()
{
  return &unk_27018F370;
}

void __45___GDSServerConnection_fetchConfigWithError___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_2504C2000, v2, OS_LOG_TYPE_DEFAULT, "Using test config URL %@", (uint8_t *)&v4, 0xCu);
  }
}

void __45___GDSServerConnection_fetchConfigWithError___block_invoke_144(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2112;
    id v34 = v7;
    _os_log_impl(&dword_2504C2000, v10, OS_LOG_TYPE_DEFAULT, "Response: %@, Error:%@, Data %@", buf, 0x20u);
  }
  if (v9)
  {
    v11 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v9;
      _os_log_impl(&dword_2504C2000, v11, OS_LOG_TYPE_DEFAULT, "Error generated %@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
  }
  if (v7)
  {
    v12 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:4 error:0];
    v13 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v12;
      _os_log_impl(&dword_2504C2000, v13, OS_LOG_TYPE_DEFAULT, "Config Response is %@", buf, 0xCu);
    }
    v14 = [v12 objectForKeyedSubscript:@"error"];
    uint64_t v15 = [v9 code];
    if (v15) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 700;
    }
    if (v14 && (uint64_t v17 = a1 + 64, *(void *)(a1 + 64)))
    {
      v18 = (void *)MEMORY[0x263F087E8];
      v27 = @"Error reason";
      v28 = v14;
      v19 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      **(void **)(a1 + 64) = [v18 errorWithDomain:@"com.apple.griddataservices" code:v16 userInfo:v19];

      v20 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __45___GDSServerConnection_fetchConfigWithError___block_invoke_144_cold_1(v17, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v12);
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

void __60___GDSServerConnection_fetchBalancingAuthorityFromLocation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v47 = *(double *)&v8;
    _os_log_impl(&dword_2504C2000, v10, OS_LOG_TYPE_DEFAULT, "Response: %@", buf, 0xCu);
  }

  v11 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v47 = *(double *)&v9;
    _os_log_impl(&dword_2504C2000, v11, OS_LOG_TYPE_DEFAULT, "Error:%@", buf, 0xCu);
  }

  v12 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v47 = *(double *)&v7;
    _os_log_impl(&dword_2504C2000, v12, OS_LOG_TYPE_DEFAULT, "Data %@", buf, 0xCu);
  }

  if (v7)
  {
    id v38 = v9;
    id v39 = v8;
    id v40 = v7;
    v13 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:4 error:0];
    v14 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v47 = *(double *)&v13;
      _os_log_impl(&dword_2504C2000, v14, OS_LOG_TYPE_DEFAULT, "Response is %@", buf, 0xCu);
    }

    v37 = v13;
    uint64_t v15 = [v13 objectForKeyedSubscript:@"balancingAuthorities"];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v43;
      v41 = v15;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v43 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v21 = [v20 objectForKeyedSubscript:@"longitude"];
          [v21 doubleValue];
          double v23 = v22;

          uint64_t v24 = [v20 objectForKeyedSubscript:@"latitude"];
          [v24 doubleValue];
          double v26 = v25;

          [*(id *)(a1 + 48) coordinate];
          if (v23 == v27 && ([*(id *)(a1 + 48) coordinate], v26 == v28))
          {
            v29 = [MEMORY[0x263EFF910] date];
            id v30 = [v20 objectForKeyedSubscript:@"name"];
            __int16 v31 = [v20 objectForKeyedSubscript:@"id"];
            if (v31) {
              id v32 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v31];
            }
            else {
              id v32 = 0;
            }
            __int16 v33 = [*(id *)(a1 + 32) log];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              double v47 = *(double *)&v30;
              __int16 v48 = 2112;
              double v49 = *(double *)&v32;
              __int16 v50 = 2112;
              v51 = v29;
              _os_log_impl(&dword_2504C2000, v33, OS_LOG_TYPE_DEFAULT, "Name %@, UUID %@, Date %@", buf, 0x20u);
            }

            id v34 = [[_GDSBalancingAuthorityOutput alloc] initWithID:v32 name:v30 updateDate:v29];
            uint64_t v35 = *(void *)(*(void *)(a1 + 56) + 8);
            v36 = *(void **)(v35 + 40);
            *(void *)(v35 + 40) = v34;

            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
            uint64_t v15 = v41;
          }
          else
          {
            v29 = [*(id *)(a1 + 32) log];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134283777;
              double v47 = v23;
              __int16 v48 = 2049;
              double v49 = v26;
              _os_log_impl(&dword_2504C2000, v29, OS_LOG_TYPE_DEFAULT, "Non-matching co-ordinates %{private}f, %{private}f", buf, 0x16u);
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v52 count:16];
      }
      while (v17);
    }

    id v8 = v39;
    id v7 = v40;
    id v9 = v38;
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

void __55___GDSServerConnection_fetchBalancingAuthorityPolygons__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x25337E490]();
  v11 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412802;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_2504C2000, v11, OS_LOG_TYPE_DEFAULT, "Response: %@, Error:%@, Data %@", (uint8_t *)&v18, 0x20u);
  }

  if (v7)
  {
    v12 = (void *)MEMORY[0x25337E490]();
    uint64_t v13 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:4 error:0];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:@"error"];
    uint64_t v17 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v16;
      _os_log_impl(&dword_2504C2000, v17, OS_LOG_TYPE_DEFAULT, "Error is %@", (uint8_t *)&v18, 0xCu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    AnalyticsSendEventLazy();
  }
}

void *__55___GDSServerConnection_fetchBalancingAuthorityPolygons__block_invoke_194()
{
  return &unk_27018F398;
}

void __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v56 = a4;
  id v9 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v71 = v8;
    _os_log_impl(&dword_2504C2000, v9, OS_LOG_TYPE_DEFAULT, "Response: %@", buf, 0xCu);
  }

  v10 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v71 = v56;
    _os_log_impl(&dword_2504C2000, v10, OS_LOG_TYPE_DEFAULT, "Error:%@", buf, 0xCu);
  }

  v11 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v71 = v7;
    _os_log_impl(&dword_2504C2000, v11, OS_LOG_TYPE_DEFAULT, "Data %@", buf, 0xCu);
  }

  if (v7)
  {
    id v53 = v7;
    id v54 = v8;
    v12 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:4 error:0];
    uint64_t v13 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke_cold_3((uint64_t)v12, v13);
    }

    v55 = v12;
    [v12 objectForKeyedSubscript:@"forecasts"];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v65;
      uint64_t v57 = *(void *)v65;
      do
      {
        uint64_t v17 = 0;
        uint64_t v58 = v15;
        do
        {
          if (*(void *)v65 != v16) {
            objc_enumerationMutation(obj);
          }
          int v18 = *(void **)(*((void *)&v64 + 1) + 8 * v17);
          id v19 = [v18 objectForKeyedSubscript:@"balancingAuthorityId"];
          __int16 v20 = [*(id *)(a1 + 48) identifier];
          int v21 = [v19 isEqualToString:v20];

          if (v21)
          {
            __int16 v22 = [v18 objectForKeyedSubscript:@"baseTime"];
            uint64_t v23 = +[_GDSServerConnection dateFromString:v22];
            uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
            double v25 = *(void **)(v24 + 40);
            *(void *)(v24 + 40) = v23;

            double v26 = [v18 objectForKeyedSubscript:@"dataPoints"];
            long long v60 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            uint64_t v27 = [v26 countByEnumeratingWithState:&v60 objects:v68 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              int v29 = 0;
              uint64_t v30 = *(void *)v61;
              do
              {
                for (uint64_t i = 0; i != v28; ++i)
                {
                  if (*(void *)v61 != v30) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t v32 = *(void *)(*((void *)&v60 + 1) + 8 * i);
                  __int16 v33 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) dateByAddingTimeInterval:(double)(v29 + (int)i) * 900.0];
                  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:v32 forKeyedSubscript:v33];
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v60 objects:v68 count:16];
                v29 += i;
              }
              while (v28);
            }

            uint64_t v16 = v57;
            uint64_t v15 = v58;
          }

          ++v17;
        }
        while (v17 != v15);
        uint64_t v15 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
      }
      while (v15);
    }
    id v34 = v55;
    uint64_t v35 = [v55 objectForKeyedSubscript:@"refetchPeriod"];
    [v35 doubleValue];
    double v37 = v36;

    if (v37 <= 14400.0) {
      double v37 = 14400.0;
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
    {
      id v38 = [_GDSEmissionForecast alloc];
      uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v40 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v41 = [MEMORY[0x263EFF910] date];
      uint64_t v42 = [(_GDSEmissionForecast *)v38 initWithForecast:v39 generatedAt:v40 fetchedAt:v41 refetchInterval:v37];
      uint64_t v43 = *(void *)(*(void *)(a1 + 72) + 8);
      long long v44 = *(void **)(v43 + 40);
      *(void *)(v43 + 40) = v42;

      long long v45 = [*(id *)(a1 + 32) log];
      id v8 = v54;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke_cold_2(v45, v37);
      }
      id v7 = v53;
      id v34 = v55;
    }
    else
    {
      long long v45 = [*(id *)(a1 + 32) log];
      id v8 = v54;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke_cold_1(v45, v46, v47, v48, v49, v50, v51, v52);
      }
      id v7 = v53;
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    AnalyticsSendEventLazy();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

void *__57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke_204()
{
  return &unk_27018F3C0;
}

void __65___GDSServerConnection_fetchCarbonIntensityHistoryForBA_from_to___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v8;
    _os_log_impl(&dword_2504C2000, v10, OS_LOG_TYPE_DEFAULT, "Response: %@", buf, 0xCu);
  }

  v11 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v9;
    _os_log_impl(&dword_2504C2000, v11, OS_LOG_TYPE_DEFAULT, "Error:%@", buf, 0xCu);
  }

  v12 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v7;
    _os_log_impl(&dword_2504C2000, v12, OS_LOG_TYPE_DEFAULT, "Data %@", buf, 0xCu);
  }

  if (v7)
  {
    id v34 = v9;
    id v35 = v8;
    uint64_t v13 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:4 error:0];
    uint64_t v14 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v13;
      _os_log_impl(&dword_2504C2000, v14, OS_LOG_TYPE_DEFAULT, "Historical data Response is %@", buf, 0xCu);
    }
    id v36 = v7;

    __int16 v33 = v13;
    [v13 objectForKeyedSubscript:@"dataPoints"];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          __int16 v20 = [v19 objectForKeyedSubscript:@"pointTime"];
          int v21 = +[_GDSServerConnection dateFromString:v20];

          __int16 v22 = [v19 objectForKeyedSubscript:@"systemwideValue"];
          uint64_t v23 = [v19 objectForKeyedSubscript:@"marginalValue"];
          uint64_t v24 = [*(id *)(a1 + 32) log];
          double v25 = v24;
          if (v21)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              id v45 = v21;
              __int16 v46 = 2112;
              uint64_t v47 = v22;
              __int16 v48 = 2112;
              uint64_t v49 = v23;
              _os_log_debug_impl(&dword_2504C2000, v25, OS_LOG_TYPE_DEBUG, "Date %@, Avg Value %@, Marginal Value %@", buf, 0x20u);
            }

            v42[0] = @"average";
            v42[1] = @"marginal";
            v43[0] = v22;
            v43[1] = v23;
            double v25 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v25 forKeyedSubscript:v21];
          }
          else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            double v26 = [v19 objectForKeyedSubscript:@"pointTime"];
            *(_DWORD *)buf = 138412290;
            id v45 = v26;
            _os_log_impl(&dword_2504C2000, v25, OS_LOG_TYPE_DEFAULT, "Error parsing date %@", buf, 0xCu);
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
      }
      while (v16);
    }
    uint64_t v27 = [_GDSEmissionHistory alloc];
    uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v29 = [MEMORY[0x263EFF910] date];
    uint64_t v30 = [(_GDSEmissionHistory *)v27 initWithHistoricalData:v28 fetchedAt:v29];
    uint64_t v31 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    id v8 = v35;
    id v7 = v36;
    id v9 = v34;
  }
  else
  {
    AnalyticsSendEventLazy();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

void *__65___GDSServerConnection_fetchCarbonIntensityHistoryForBA_from_to___block_invoke_237()
{
  return &unk_27018F3E8;
}

void __45___GDSServerConnection_fetchConfigWithError___block_invoke_144_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke_cold_2(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEBUG, "Forecast refetch interval %lf", (uint8_t *)&v2, 0xCu);
}

void __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2504C2000, a2, OS_LOG_TYPE_DEBUG, "Forecast result %@", (uint8_t *)&v2, 0xCu);
}

@end