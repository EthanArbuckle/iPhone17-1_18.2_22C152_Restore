@interface FedStatsPluginEngine
+ (BOOL)hasRecipeIdentifier:(id)a3 usedWithAssetProvider:(id)a4;
+ (id)runAllRecipesWithAssetProvider:(id)a3;
+ (void)removeOldRecordsFromUserDefaults;
@end

@implementation FedStatsPluginEngine

+ (BOOL)hasRecipeIdentifier:(id)a3 usedWithAssetProvider:(id)a4
{
  v35[3] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 experimentIdentifierForRecipe:v6];
  v35[0] = v7;
  v8 = [v5 deploymentIdentifierForRecipe:v6];
  v35[1] = v8;
  v9 = [v5 treatmentIdentifierForRecipe:v6];

  v35[2] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];
  v11 = [v10 componentsJoinedByString:@":"];

  v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v13 = [v12 persistentDomainForName:kFedStatsPluginUserDefaultsDomain];
  v14 = (void *)[v13 mutableCopy];

  v15 = [v14 objectForKey:kFedStatsPluginUserDefaultsKeyExperimentList];
  v16 = (void *)[v15 mutableCopy];

  v17 = +[FedStatsPluginLog logger];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    +[FedStatsPluginEngine hasRecipeIdentifier:usedWithAssetProvider:]((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
  }

  v24 = [v16 objectForKey:v11];

  if (!v24)
  {
    uint64_t v25 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
    v26 = (void *)v25;
    if (v16)
    {
      [v16 setObject:v25 forKey:v11];
    }
    else
    {
      v33 = v11;
      uint64_t v34 = v25;
      v27 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v16 = (void *)[v27 mutableCopy];
    }
    if (v14)
    {
      [v14 setObject:v16 forKey:kFedStatsPluginUserDefaultsKeyExperimentList];
    }
    else
    {
      uint64_t v31 = kFedStatsPluginUserDefaultsKeyExperimentList;
      v32 = v16;
      v28 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v14 = (void *)[v28 mutableCopy];
    }
    v29 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v29 setPersistentDomain:v14 forName:kFedStatsPluginUserDefaultsDomain];
  }
  return v24 == 0;
}

+ (void)removeOldRecordsFromUserDefaults
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 persistentDomainForName:kFedStatsPluginUserDefaultsDomain];
  v4 = (void *)[v3 mutableCopy];

  id v5 = [v4 objectForKey:kFedStatsPluginUserDefaultsKeyExperimentList];
  id v6 = (void *)[v5 mutableCopy];

  double Current = CFAbsoluteTimeGetCurrent();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    double v11 = Current + -2419200.0;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v15 = objc_msgSend(v8, "objectForKey:", v14, (void)v26);
        [v15 doubleValue];
        double v17 = v16;

        if (v17 < v11) {
          [v8 removeObjectForKey:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  [v4 setObject:v8 forKey:kFedStatsPluginUserDefaultsKeyExperimentList];
  uint64_t v18 = +[FedStatsPluginLog logger];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    +[FedStatsPluginEngine hasRecipeIdentifier:usedWithAssetProvider:]((uint64_t)v8, v18, v19, v20, v21, v22, v23, v24);
  }

  uint64_t v25 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v25 setPersistentDomain:v4 forName:kFedStatsPluginUserDefaultsDomain];
}

+ (id)runAllRecipesWithAssetProvider:(id)a3
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 recipeIdentifiers];
  v86 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v112 objects:v125 count:16];
  v85 = v3;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v113;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v113 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v112 + 1) + 8 * i);
        if (+[FedStatsPluginEngine hasRecipeIdentifier:v9 usedWithAssetProvider:v3])
        {
          id v111 = 0;
          uint64_t v10 = +[FedStatsPluginRecipe recipeWithAssetProvider:v3 recipeIdentifier:v9 error:&v111];
          id v11 = v111;
          id v12 = v11;
          if (!v10)
          {
            double v16 = +[FedStatsPluginLog logger];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v122 = v9;
              __int16 v123 = 2112;
              id v124 = v12;
              _os_log_debug_impl(&dword_24DF73000, v16, OS_LOG_TYPE_DEBUG, "Cannot create recipe with identifier '%@'. Error: %@", buf, 0x16u);
            }

            goto LABEL_22;
          }
          id v110 = v11;
          char v13 = [v10 checkConsentWithError:&v110];
          id v14 = v110;

          if (v13)
          {
            id v109 = v14;
            char v15 = [v10 checkDeviceRegionCodeWithError:&v109];
            id v12 = v109;

            if (v15)
            {
              [v86 setObject:v10 forKey:v9];
              goto LABEL_23;
            }
            uint64_t v18 = +[FedStatsPluginLog logger];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v122 = v9;
              __int16 v123 = 2112;
              id v124 = v12;
              _os_log_debug_impl(&dword_24DF73000, v18, OS_LOG_TYPE_DEBUG, "Device region is not allowed for recipe with identifier '%@'. Error: %@", buf, 0x16u);
            }

            if (v12)
            {
LABEL_22:
              +[FedStatsPluginTelemetry reportPluginForAssetProvider:v85 recipeIdentifier:v9 withError:v12];
              goto LABEL_23;
            }
          }
          else
          {
            double v17 = +[FedStatsPluginLog logger];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v122 = v9;
              __int16 v123 = 2112;
              id v124 = v14;
              _os_log_debug_impl(&dword_24DF73000, v17, OS_LOG_TYPE_DEBUG, "Cannot get consent for recipe with identifier '%@'. Error: %@", buf, 0x16u);
            }

            +[FedStatsPluginTelemetry reportPluginForAssetProvider:v85 recipeIdentifier:v9 withError:v14];
            id v12 = v14;
LABEL_23:
          }
          id v3 = v85;
          goto LABEL_25;
        }
        uint64_t v10 = +[FedStatsPluginLog logger];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v122 = v9;
          _os_log_debug_impl(&dword_24DF73000, v10, OS_LOG_TYPE_DEBUG, "The recipe '%@' has already ran on this device", buf, 0xCu);
        }
LABEL_25:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v112 objects:v125 count:16];
    }
    while (v6);
  }

  v82 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v86, "count"));
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v19 = [v86 allKeys];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v105 objects:v120 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v106;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v106 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v105 + 1) + 8 * j);
        uint64_t v25 = [v86 objectForKey:v24];
        id v104 = 0;
        long long v26 = [v25 evaluateQueryWithError:&v104];
        id v27 = v104;
        if (v26)
        {
          [v82 setObject:v26 forKey:v24];
        }
        else
        {
          long long v28 = +[FedStatsPluginLog logger];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v122 = v24;
            __int16 v123 = 2112;
            id v124 = v27;
            _os_log_debug_impl(&dword_24DF73000, v28, OS_LOG_TYPE_DEBUG, "Cannot run query for recipe with identifier '%@'. Error: %@", buf, 0x16u);
          }

          +[FedStatsPluginTelemetry reportPluginForAssetProvider:v85 recipeIdentifier:v24 withError:v27];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v105 objects:v120 count:16];
    }
    while (v21);
  }

  long long v29 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v82, "count"));
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v30 = [v82 allKeys];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v100 objects:v119 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v101;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v101 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void *)(*((void *)&v100 + 1) + 8 * k);
        v36 = [v86 objectForKey:v35];
        v37 = [v82 objectForKey:v35];
        v38 = [v36 collateQueryResults:v37];
        [v29 setObject:v38 forKey:v35];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v100 objects:v119 count:16];
    }
    while (v32);
  }

  v39 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v29, "count"));
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v40 = [v29 allKeys];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v96 objects:v118 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v97;
    do
    {
      for (uint64_t m = 0; m != v42; ++m)
      {
        if (*(void *)v97 != v43) {
          objc_enumerationMutation(v40);
        }
        uint64_t v45 = *(void *)(*((void *)&v96 + 1) + 8 * m);
        v46 = [v86 objectForKey:v45];
        v47 = [v29 objectForKey:v45];
        v48 = [v46 assetKeysFromCollatedData:v47];
        [v39 setObject:v48 forKey:v45];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v96 objects:v118 count:16];
    }
    while (v42);
  }

  id v95 = 0;
  char v49 = [v85 fetchAssets:v39 error:&v95];
  id v50 = v95;
  if ((v49 & 1) == 0)
  {
    v51 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
      +[FedStatsPluginEngine runAllRecipesWithAssetProvider:]((uint64_t)v50, v51, v52, v53, v54, v55, v56, v57);
    }
  }
  v83 = v39;
  v84 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v29, "count", v50));
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v80 = [v29 allKeys];
  uint64_t v58 = [v80 countByEnumeratingWithState:&v91 objects:v117 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v92;
    do
    {
      for (uint64_t n = 0; n != v59; ++n)
      {
        if (*(void *)v92 != v60) {
          objc_enumerationMutation(v80);
        }
        uint64_t v62 = *(void *)(*((void *)&v91 + 1) + 8 * n);
        v63 = [v86 objectForKey:v62];
        v64 = [v29 objectForKey:v62];
        v65 = [v83 objectForKey:v62];
        v66 = [v63 assetURLsForAssetKeys:v65];
        v67 = [v63 recordCollatedData:v64 assetURLs:v66];
        [v84 setObject:v67 forKey:v62];
      }
      uint64_t v59 = [v80 countByEnumeratingWithState:&v91 objects:v117 count:16];
    }
    while (v59);
  }

  [v85 removeAssets];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  v68 = [v84 allKeys];
  uint64_t v69 = [v68 countByEnumeratingWithState:&v87 objects:v116 count:16];
  unint64_t v70 = 0x265312000uLL;
  if (v69)
  {
    uint64_t v71 = v69;
    uint64_t v72 = *(void *)v88;
    do
    {
      for (iuint64_t i = 0; ii != v71; ++ii)
      {
        if (*(void *)v88 != v72) {
          objc_enumerationMutation(v68);
        }
        v74 = *(void **)(*((void *)&v87 + 1) + 8 * ii);
        v75 = +[FedStatsPluginLog logger];
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
        {
          v76 = [v84 objectForKey:v74];
          *(_DWORD *)buf = 138412546;
          v122 = v76;
          __int16 v123 = 2112;
          id v124 = v74;
          _os_log_debug_impl(&dword_24DF73000, v75, OS_LOG_TYPE_DEBUG, "Recorded %@ payloads for recipe with identifier '%@'", buf, 0x16u);

          unint64_t v70 = 0x265312000;
        }

        [*(id *)(v70 + 568) reportPluginSucceedForAssetProvider:v85 recipeIdentifier:v74];
      }
      uint64_t v71 = [v68 countByEnumeratingWithState:&v87 objects:v116 count:16];
    }
    while (v71);
  }

  [a1 removeOldRecordsFromUserDefaults];
  return v84;
}

+ (void)hasRecipeIdentifier:(uint64_t)a3 usedWithAssetProvider:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)runAllRecipesWithAssetProvider:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end