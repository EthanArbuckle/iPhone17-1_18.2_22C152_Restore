@interface ATXFaceSuggestionAssetParameters
+ (id)loadAssetParametersDictionaryFromPath:(id)a3;
+ (id)posterDescriptorFromKey:(id)a3 withDescriptorCache:(id)a4;
- (ATXFaceSuggestionAssetParameters)init;
- (NSArray)collectionsSectionDescriptors;
- (NSArray)colorSectionDescriptors;
- (NSArray)dayZeroFeaturedDescriptors;
- (NSArray)descriptorsToRemoveFromCollections;
- (NSArray)emojiSectionDescriptors;
- (NSArray)heroSectionOrder;
- (NSArray)kaleidoscopeSectionDescriptors;
- (NSArray)osVersionSectionDescriptors;
- (NSArray)prideSectionDescriptors;
- (NSArray)sectionOrder;
- (NSArray)unitySectionDescriptors;
- (NSArray)weatherAndAstronomySectionDescriptors;
- (NSDictionary)allowedDescriptorsForRegions;
- (NSDictionary)globalPopularityScores;
- (NSDictionary)hiddenRegions;
- (NSDictionary)topLevelDictionary;
- (NSDictionary)unpromotableRegions;
- (NSDictionary)uprankedDateIntervals;
- (NSSet)extensionBundleIdsEligibleForComplicationsInFaceGallery;
- (id)_currentCountryCode;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)dictionaryStringToSetFromObject:(id)a3;
- (void)topLevelDictionary;
@end

@implementation ATXFaceSuggestionAssetParameters

- (ATXFaceSuggestionAssetParameters)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATXFaceSuggestionAssetParameters;
  v2 = [(ATXFaceSuggestionAssetParameters *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[ATXPosterDescriptorCache sharedInstance];
    descriptorCache = v2->_descriptorCache;
    v2->_descriptorCache = (ATXPosterDescriptorCache *)v3;

    uint64_t v5 = [MEMORY[0x1E4F4AF08] pathForResource:@"FaceSuggestionAssetParameters" ofType:@"json" isDirectory:0];
    path = v2->_path;
    v2->_path = (NSString *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v7;
  }
  return v2;
}

- (NSArray)sectionOrder
{
  v2 = [(ATXFaceSuggestionAssetParameters *)self arrayForKey:@"SectionOrder"];
  uint64_t v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_204);

  return (NSArray *)v3;
}

id __48__ATXFaceSuggestionAssetParameters_sectionOrder__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__ATXFaceSuggestionAssetParameters_sectionOrder__block_invoke_cold_1();
    }

    id v3 = 0;
  }

  return v3;
}

- (NSArray)heroSectionOrder
{
  id v2 = [(ATXFaceSuggestionAssetParameters *)self arrayForKey:@"HeroSectionOrder"];
  id v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_87);

  return (NSArray *)v3;
}

id __52__ATXFaceSuggestionAssetParameters_heroSectionOrder__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__ATXFaceSuggestionAssetParameters_heroSectionOrder__block_invoke_cold_1();
    }

    id v3 = 0;
  }

  return v3;
}

- (NSArray)weatherAndAstronomySectionDescriptors
{
  id v2 = [(ATXFaceSuggestionAssetParameters *)self arrayForKey:@"WeatherAndAstronomySectionDescriptors"];
  id v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_89_2);

  return (NSArray *)v3;
}

id __73__ATXFaceSuggestionAssetParameters_weatherAndAstronomySectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__ATXFaceSuggestionAssetParameters_weatherAndAstronomySectionDescriptors__block_invoke_cold_1();
    }

    id v3 = 0;
  }

  return v3;
}

- (NSArray)kaleidoscopeSectionDescriptors
{
  id v2 = [(ATXFaceSuggestionAssetParameters *)self arrayForKey:@"KaleidoscopeSectionDescriptors"];
  id v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_91);

  return (NSArray *)v3;
}

id __66__ATXFaceSuggestionAssetParameters_kaleidoscopeSectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__ATXFaceSuggestionAssetParameters_kaleidoscopeSectionDescriptors__block_invoke_cold_1();
    }

    id v3 = 0;
  }

  return v3;
}

- (NSArray)emojiSectionDescriptors
{
  id v2 = [(ATXFaceSuggestionAssetParameters *)self arrayForKey:@"EmojiSectionDescriptors"];
  id v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_93_0);

  return (NSArray *)v3;
}

id __59__ATXFaceSuggestionAssetParameters_emojiSectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__ATXFaceSuggestionAssetParameters_emojiSectionDescriptors__block_invoke_cold_1();
    }

    id v3 = 0;
  }

  return v3;
}

- (NSArray)unitySectionDescriptors
{
  id v2 = [(ATXFaceSuggestionAssetParameters *)self arrayForKey:@"UnitySectionDescriptors"];
  id v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_95);

  return (NSArray *)v3;
}

id __59__ATXFaceSuggestionAssetParameters_unitySectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__ATXFaceSuggestionAssetParameters_unitySectionDescriptors__block_invoke_cold_1();
    }

    id v3 = 0;
  }

  return v3;
}

- (NSArray)prideSectionDescriptors
{
  id v2 = [(ATXFaceSuggestionAssetParameters *)self arrayForKey:@"PrideSectionDescriptors"];
  id v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_97_0);

  return (NSArray *)v3;
}

id __59__ATXFaceSuggestionAssetParameters_prideSectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__ATXFaceSuggestionAssetParameters_prideSectionDescriptors__block_invoke_cold_1();
    }

    id v3 = 0;
  }

  return v3;
}

- (NSArray)osVersionSectionDescriptors
{
  id v2 = [(ATXFaceSuggestionAssetParameters *)self arrayForKey:@"OSVersionSectionDescriptors"];
  id v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_99_1);

  return (NSArray *)v3;
}

id __63__ATXFaceSuggestionAssetParameters_osVersionSectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63__ATXFaceSuggestionAssetParameters_osVersionSectionDescriptors__block_invoke_cold_1();
    }

    id v3 = 0;
  }

  return v3;
}

- (NSArray)collectionsSectionDescriptors
{
  id v2 = [(ATXFaceSuggestionAssetParameters *)self arrayForKey:@"CollectionsSectionDescriptors"];
  id v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_101);

  return (NSArray *)v3;
}

id __65__ATXFaceSuggestionAssetParameters_collectionsSectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__ATXFaceSuggestionAssetParameters_collectionsSectionDescriptors__block_invoke_cold_1();
    }

    id v3 = 0;
  }

  return v3;
}

- (NSArray)colorSectionDescriptors
{
  id v2 = [(ATXFaceSuggestionAssetParameters *)self arrayForKey:@"ColorSectionDescriptors"];
  id v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_103);

  return (NSArray *)v3;
}

id __59__ATXFaceSuggestionAssetParameters_colorSectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__ATXFaceSuggestionAssetParameters_colorSectionDescriptors__block_invoke_cold_1();
    }

    id v3 = 0;
  }

  return v3;
}

- (NSArray)descriptorsToRemoveFromCollections
{
  id v2 = [(ATXFaceSuggestionAssetParameters *)self arrayForKey:@"DescriptorsToRemoveFromCollections"];
  id v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_105);

  return (NSArray *)v3;
}

id __70__ATXFaceSuggestionAssetParameters_descriptorsToRemoveFromCollections__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__ATXFaceSuggestionAssetParameters_descriptorsToRemoveFromCollections__block_invoke_cold_1();
    }

    id v3 = 0;
  }

  return v3;
}

- (NSArray)dayZeroFeaturedDescriptors
{
  id v3 = [(ATXFaceSuggestionAssetParameters *)self _currentCountryCode];
  v4 = [(ATXFaceSuggestionAssetParameters *)self unpromotableRegions];
  uint64_t v5 = [(ATXFaceSuggestionAssetParameters *)self hiddenRegions];
  v6 = [(ATXFaceSuggestionAssetParameters *)self arrayForKey:@"DayZeroFeaturedDescriptors"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__ATXFaceSuggestionAssetParameters_dayZeroFeaturedDescriptors__block_invoke;
  v12[3] = &unk_1E68B4D48;
  id v13 = v3;
  id v14 = v4;
  id v15 = v5;
  v16 = self;
  id v7 = v5;
  id v8 = v4;
  id v9 = v3;
  objc_super v10 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v12);

  return (NSArray *)v10;
}

id __62__ATXFaceSuggestionAssetParameters_dayZeroFeaturedDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 componentsSeparatedByString:@"/"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__ATXFaceSuggestionAssetParameters_dayZeroFeaturedDescriptors__block_invoke_109;
    v10[3] = &unk_1E68B4D20;
    v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    uint64_t v5 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", v10);

    v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v5, "count")));
    id v7 = +[ATXFaceSuggestionAssetParameters posterDescriptorFromKey:v6 withDescriptorCache:*(void *)(*(void *)(a1 + 56) + 8)];

    id v8 = v11;
  }
  else
  {
    id v8 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __62__ATXFaceSuggestionAssetParameters_dayZeroFeaturedDescriptors__block_invoke_cold_1();
    }
    id v7 = 0;
  }

  return v7;
}

uint64_t __62__ATXFaceSuggestionAssetParameters_dayZeroFeaturedDescriptors__block_invoke_109(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 componentsSeparatedByString:@":"];
  v4 = [v3 firstObject];

  if (v4)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
      if ([v5 containsObject:*(void *)(a1 + 32)])
      {

LABEL_6:
        id v8 = __atxlog_handle_lock_screen();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(a1 + 32);
          int v12 = 136315650;
          id v13 = "-[ATXFaceSuggestionAssetParameters dayZeroFeaturedDescriptors]_block_invoke";
          __int16 v14 = 2112;
          uint64_t v15 = v9;
          __int16 v16 = 2112;
          v17 = v4;
          _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s: not showing hidden or unpromotable day zero extensionBundleId in restricted country code %@: %@", (uint8_t *)&v12, 0x20u);
        }

        goto LABEL_9;
      }
      v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
      int v7 = [v6 containsObject:*(void *)(a1 + 32)];

      if (v7) {
        goto LABEL_6;
      }
    }
    uint64_t v10 = 1;
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

- (NSSet)extensionBundleIdsEligibleForComplicationsInFaceGallery
{
  id v2 = [(ATXFaceSuggestionAssetParameters *)self arrayForKey:@"ExtensionBundleIdsEligibleForComplicationsInFaceGallery"];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v4 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_118_0);
    uint64_t v5 = (void *)[v3 initWithArray:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSSet *)v5;
}

id __91__ATXFaceSuggestionAssetParameters_extensionBundleIdsEligibleForComplicationsInFaceGallery__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __91__ATXFaceSuggestionAssetParameters_extensionBundleIdsEligibleForComplicationsInFaceGallery__block_invoke_cold_1();
    }

    id v3 = 0;
  }

  return v3;
}

- (NSDictionary)uprankedDateIntervals
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v2 = [(ATXFaceSuggestionAssetParameters *)self dictionaryForKey:@"UprankedDateIntervals"];
  if (v2)
  {
    v40 = objc_opt_new();
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v37 = v2;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v52 objects:v63 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v53;
      uint64_t v38 = *(void *)v53;
      id v39 = v3;
      do
      {
        uint64_t v7 = 0;
        uint64_t v41 = v5;
        do
        {
          if (*(void *)v53 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(__CFString **)(*((void *)&v52 + 1) + 8 * v7);
          uint64_t v9 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, v37);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v11 = [v3 objectForKeyedSubscript:v8];
            uint64_t v12 = [(ATXFaceSuggestionAssetParameters *)self _currentCountryCode];
            id v13 = (void *)v12;
            if (v12) {
              __int16 v14 = (__CFString *)v12;
            }
            else {
              __int16 v14 = @"default";
            }
            uint64_t v15 = v14;

            __int16 v16 = [v11 objectForKeyedSubscript:v15];
            if (v16)
            {
              v17 = v15;
            }
            else
            {

              v17 = @"default";
            }
            v46 = v17;
            uint64_t v18 = -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:");

            if (v18)
            {
              objc_opt_class();
              v45 = v18;
              if (objc_opt_isKindOfClass())
              {
                v42 = v8;
                v43 = v11;
                uint64_t v44 = v7;
                v19 = objc_opt_new();
                long long v48 = 0u;
                long long v49 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                id v20 = v18;
                uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v62 count:16];
                if (v21)
                {
                  uint64_t v22 = v21;
                  uint64_t v23 = *(void *)v49;
                  do
                  {
                    for (uint64_t i = 0; i != v22; ++i)
                    {
                      if (*(void *)v49 != v23) {
                        objc_enumerationMutation(v20);
                      }
                      v25 = *(__CFString **)(*((void *)&v48 + 1) + 8 * i);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v26 = v25;
                        v27 = [(__CFString *)v26 objectForKeyedSubscript:@"start"];
                        v28 = dateFromDict(v27);

                        if (v28)
                        {
                          v29 = [(__CFString *)v26 objectForKeyedSubscript:@"end"];
                          v30 = dateFromDict(v29);

                          if (v30 && ([v28 isAfterDate:v30] & 1) == 0) {
                            v31 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v28 endDate:v30];
                          }
                          else {
                            v31 = 0;
                          }
                        }
                        else
                        {
                          v31 = 0;
                        }

                        if (v31)
                        {
                          [v19 addObject:v31];
                        }
                        else
                        {
                          v32 = __atxlog_handle_lock_screen();
                          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                          {
                            locale = self->_locale;
                            *(_DWORD *)buf = 136315650;
                            v57 = "-[ATXFaceSuggestionAssetParameters uprankedDateIntervals]";
                            __int16 v58 = 2112;
                            v59 = v26;
                            __int16 v60 = 2112;
                            v61 = locale;
                            _os_log_error_impl(&dword_1D0FA3000, v32, OS_LOG_TYPE_ERROR, "%s: date interval dict didn't produce a valid interval: %@, current locale: %@", buf, 0x20u);
                          }
                        }
                      }
                      else
                      {
                        v31 = __atxlog_handle_lock_screen();
                        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 136315394;
                          v57 = "-[ATXFaceSuggestionAssetParameters uprankedDateIntervals]";
                          __int16 v58 = 2112;
                          v59 = v25;
                          _os_log_error_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_ERROR, "%s: array element %@ is not a dictionary", buf, 0x16u);
                        }
                      }
                    }
                    uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v62 count:16];
                  }
                  while (v22);
                }

                id v34 = [v19 copy];
                [v40 setObject:v34 forKeyedSubscript:v42];

                uint64_t v6 = v38;
                id v3 = v39;
                uint64_t v5 = v41;
                v11 = v43;
                uint64_t v7 = v44;
              }
              else
              {
                v19 = __atxlog_handle_lock_screen();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v57 = "-[ATXFaceSuggestionAssetParameters uprankedDateIntervals]";
                  __int16 v58 = 2112;
                  v59 = v46;
                  _os_log_error_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_ERROR, "%s: value of key %@ is not an array", buf, 0x16u);
                }
              }

              uint64_t v18 = v45;
            }
          }
          else
          {
            v11 = __atxlog_handle_lock_screen();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v57 = "-[ATXFaceSuggestionAssetParameters uprankedDateIntervals]";
              __int16 v58 = 2112;
              v59 = v8;
              _os_log_error_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_ERROR, "%s: value of key %@ not a dictionary", buf, 0x16u);
            }
          }

          ++v7;
        }
        while (v7 != v5);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v52 objects:v63 count:16];
      }
      while (v5);
    }

    v35 = (void *)[v40 copy];
    id v2 = v37;
  }
  else
  {
    v35 = 0;
  }

  return (NSDictionary *)v35;
}

- (NSDictionary)globalPopularityScores
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(ATXFaceSuggestionAssetParameters *)self dictionaryForKey:@"GlobalPopularityScores"];
  if (v3)
  {
    v17 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    __int16 v16 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v10 = +[ATXFaceSuggestionAssetParameters posterDescriptorFromKey:v9 withDescriptorCache:self->_descriptorCache];
          if (v10)
          {
            v11 = [v4 objectForKeyedSubscript:v9];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              id v13 = [v4 objectForKeyedSubscript:v9];
              [v17 setObject:v13 forKeyedSubscript:v10];
            }
            else
            {
              id v13 = __atxlog_handle_lock_screen();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                uint64_t v23 = "-[ATXFaceSuggestionAssetParameters globalPopularityScores]";
                __int16 v24 = 2112;
                uint64_t v25 = v9;
                _os_log_error_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_ERROR, "%s: value is not NSNumber for key: %@", buf, 0x16u);
              }
            }
          }
          else
          {
            id v13 = __atxlog_handle_lock_screen();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              uint64_t v23 = "-[ATXFaceSuggestionAssetParameters globalPopularityScores]";
              __int16 v24 = 2112;
              uint64_t v25 = v9;
              _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "%s: no descriptor found for key: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v6);
    }

    __int16 v14 = (void *)[v17 copy];
    id v3 = v16;
  }
  else
  {
    __int16 v14 = 0;
  }

  return (NSDictionary *)v14;
}

- (NSDictionary)unpromotableRegions
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = [(ATXFaceSuggestionAssetParameters *)self dictionaryForKey:@"UnpromotableRegions"];
  if (v2)
  {
    id v3 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v20 = v2;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (!v5) {
      goto LABEL_18;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v13 = __atxlog_handle_lock_screen();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_13;
          }
          *(_DWORD *)buf = 136315394;
          v26 = "-[ATXFaceSuggestionAssetParameters unpromotableRegions]";
          __int16 v27 = 2112;
          uint64_t v28 = v9;
          uint64_t v15 = v13;
          __int16 v16 = "%s: key is not a string: %@";
          goto LABEL_16;
        }
        uint64_t v10 = [v4 objectForKeyedSubscript:v9];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          id v13 = [v4 objectForKeyedSubscript:v9];
          __int16 v14 = (void *)[v12 initWithArray:v13];
          [v3 setObject:v14 forKeyedSubscript:v9];

          goto LABEL_13;
        }
        id v13 = __atxlog_handle_lock_screen();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v26 = "-[ATXFaceSuggestionAssetParameters unpromotableRegions]";
          __int16 v27 = 2112;
          uint64_t v28 = v9;
          uint64_t v15 = v13;
          __int16 v16 = "%s: value is not an array for key: %@";
LABEL_16:
          _os_log_error_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);
        }
LABEL_13:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v17 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
      uint64_t v6 = v17;
      if (!v17)
      {
LABEL_18:

        long long v18 = (void *)[v3 copy];
        id v2 = v20;
        goto LABEL_20;
      }
    }
  }
  long long v18 = 0;
LABEL_20:

  return (NSDictionary *)v18;
}

- (NSDictionary)hiddenRegions
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = [(ATXFaceSuggestionAssetParameters *)self dictionaryForKey:@"HiddenRegions"];
  if (v2)
  {
    id v3 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v20 = v2;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (!v5) {
      goto LABEL_18;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v13 = __atxlog_handle_lock_screen();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_13;
          }
          *(_DWORD *)buf = 136315394;
          v26 = "-[ATXFaceSuggestionAssetParameters hiddenRegions]";
          __int16 v27 = 2112;
          uint64_t v28 = v9;
          uint64_t v15 = v13;
          __int16 v16 = "%s: key is not a string: %@";
          goto LABEL_16;
        }
        uint64_t v10 = [v4 objectForKeyedSubscript:v9];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          id v13 = [v4 objectForKeyedSubscript:v9];
          __int16 v14 = (void *)[v12 initWithArray:v13];
          [v3 setObject:v14 forKeyedSubscript:v9];

          goto LABEL_13;
        }
        id v13 = __atxlog_handle_lock_screen();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v26 = "-[ATXFaceSuggestionAssetParameters hiddenRegions]";
          __int16 v27 = 2112;
          uint64_t v28 = v9;
          uint64_t v15 = v13;
          __int16 v16 = "%s: value is not an array for key: %@";
LABEL_16:
          _os_log_error_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);
        }
LABEL_13:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v17 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
      uint64_t v6 = v17;
      if (!v17)
      {
LABEL_18:

        long long v18 = (void *)[v3 copy];
        id v2 = v20;
        goto LABEL_20;
      }
    }
  }
  long long v18 = 0;
LABEL_20:

  return (NSDictionary *)v18;
}

- (NSDictionary)allowedDescriptorsForRegions
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(ATXFaceSuggestionAssetParameters *)self dictionaryForKey:@"AllowedDescriptorsForRegions"];
  if (v3)
  {
    id v4 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    __int16 v16 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v11 = [v5 objectForKeyedSubscript:v10];
            id v12 = [(ATXFaceSuggestionAssetParameters *)self dictionaryStringToSetFromObject:v11];

            if (v12)
            {
              [v4 setObject:v12 forKeyedSubscript:v10];
            }
            else
            {
              id v13 = __atxlog_handle_lock_screen();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315394;
                long long v22 = "-[ATXFaceSuggestionAssetParameters allowedDescriptorsForRegions]";
                __int16 v23 = 2112;
                uint64_t v24 = v10;
                _os_log_fault_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_FAULT, "%s: dictionary is nil. key: %@", buf, 0x16u);
              }
            }
          }
          else
          {
            id v12 = __atxlog_handle_lock_screen();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              long long v22 = "-[ATXFaceSuggestionAssetParameters allowedDescriptorsForRegions]";
              __int16 v23 = 2112;
              uint64_t v24 = v10;
              _os_log_fault_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_FAULT, "%s: key is not a string: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v7);
    }

    __int16 v14 = (void *)[v4 copy];
    id v3 = v16;
  }
  else
  {
    __int16 v14 = 0;
  }

  return (NSDictionary *)v14;
}

- (id)dictionaryStringToSetFromObject:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v3;
    id v4 = v3;
    id v5 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (!v7) {
      goto LABEL_18;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v15 = __atxlog_handle_lock_screen();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            goto LABEL_13;
          }
          *(_DWORD *)buf = 136315394;
          uint64_t v28 = "-[ATXFaceSuggestionAssetParameters dictionaryStringToSetFromObject:]";
          __int16 v29 = 2112;
          uint64_t v30 = v11;
          long long v17 = v15;
          long long v18 = "%s: key is not a string: %@";
          goto LABEL_16;
        }
        id v12 = [v6 objectForKeyedSubscript:v11];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          uint64_t v15 = [v6 objectForKeyedSubscript:v11];
          __int16 v16 = (void *)[v14 initWithArray:v15];
          [v5 setObject:v16 forKeyedSubscript:v11];

          goto LABEL_13;
        }
        uint64_t v15 = __atxlog_handle_lock_screen();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v28 = "-[ATXFaceSuggestionAssetParameters dictionaryStringToSetFromObject:]";
          __int16 v29 = 2112;
          uint64_t v30 = v11;
          long long v17 = v15;
          long long v18 = "%s: value is not an array for key: %@";
LABEL_16:
          _os_log_fault_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_FAULT, v18, buf, 0x16u);
        }
LABEL_13:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v19 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
      uint64_t v8 = v19;
      if (!v19)
      {
LABEL_18:

        long long v20 = (void *)[v5 copy];
        id v3 = v22;
        goto LABEL_22;
      }
    }
  }
  uint64_t v6 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    -[ATXFaceSuggestionAssetParameters dictionaryStringToSetFromObject:]((uint64_t)v3, v6);
  }
  long long v20 = 0;
LABEL_22:

  return v20;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXFaceSuggestionAssetParameters *)self topLevelDictionary];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(ATXFaceSuggestionAssetParameters *)(uint64_t)v4 dictionaryForKey:v8];
    }

    id v7 = 0;
  }

  return v7;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXFaceSuggestionAssetParameters *)self topLevelDictionary];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(ATXFaceSuggestionAssetParameters *)(uint64_t)v4 arrayForKey:v8];
    }

    id v7 = 0;
  }

  return v7;
}

- (NSDictionary)topLevelDictionary
{
  id v2 = self;
  objc_sync_enter(v2);
  topLevelDictionary = v2->_topLevelDictionary;
  if (topLevelDictionary)
  {
    uint64_t v4 = [(NSDictionary *)topLevelDictionary copy];
LABEL_5:
    id v7 = (void *)v4;
    goto LABEL_6;
  }
  if (v2->_path)
  {
    uint64_t v5 = +[ATXFaceSuggestionAssetParameters loadAssetParametersDictionaryFromPath:](ATXFaceSuggestionAssetParameters, "loadAssetParametersDictionaryFromPath:");
    uint64_t v6 = v2->_topLevelDictionary;
    v2->_topLevelDictionary = (NSDictionary *)v5;

    uint64_t v4 = [(NSDictionary *)v2->_topLevelDictionary copy];
    goto LABEL_5;
  }
  uint64_t v9 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[ATXFaceSuggestionAssetParameters topLevelDictionary](v9);
  }

  id v7 = 0;
LABEL_6:
  objc_sync_exit(v2);

  return (NSDictionary *)v7;
}

+ (id)loadAssetParametersDictionaryFromPath:(id)a3
{
  id v3 = a3;
  id v12 = 0;
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3 options:0 error:&v12];
  id v5 = v12;
  if (v4)
  {
    id v11 = v5;
    uint64_t v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v11];
    id v7 = v11;

    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v6;
        uint64_t v8 = v6;
        goto LABEL_13;
      }
      uint64_t v9 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[ATXFaceSuggestionAssetParameters loadAssetParametersDictionaryFromPath:]();
      }
    }
    else
    {
      uint64_t v9 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[ATXFaceSuggestionAssetParameters loadAssetParametersDictionaryFromPath:]();
      }
    }

    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v6 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[ATXFaceSuggestionAssetParameters loadAssetParametersDictionaryFromPath:]();
    }
    uint64_t v8 = 0;
    id v7 = v5;
  }
LABEL_13:

  return v8;
}

+ (id)posterDescriptorFromKey:(id)a3 withDescriptorCache:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"com.apple.WallpaperKit.CollectionsPoster"])
  {
    id v7 = [v6 descriptors];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"com.apple.WallpaperKit.CollectionsPoster"];
    id v9 = [v8 firstObject];
  }
  else
  {
    id v7 = [v5 componentsSeparatedByString:@":"];
    if ((unint64_t)[v7 count] > 1)
    {
      uint64_t v8 = [v7 objectAtIndexedSubscript:0];
      uint64_t v10 = [v7 objectAtIndexedSubscript:1];
      id v11 = [v6 descriptors];
      id v12 = [v11 objectForKeyedSubscript:v8];

      if (v12)
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __80__ATXFaceSuggestionAssetParameters_posterDescriptorFromKey_withDescriptorCache___block_invoke;
        v20[3] = &unk_1E68B4D70;
        id v13 = v10;
        long long v21 = v13;
        id v14 = objc_msgSend(v12, "bs_firstObjectPassingTest:", v20);
        uint64_t v15 = v14;
        if (v14)
        {
          id v9 = v14;
        }
        else
        {
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __80__ATXFaceSuggestionAssetParameters_posterDescriptorFromKey_withDescriptorCache___block_invoke_2;
          v18[3] = &unk_1E68B4D70;
          uint64_t v19 = v13;
          objc_msgSend(v12, "bs_firstObjectPassingTest:", v18);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        __int16 v16 = v21;
      }
      else
      {
        __int16 v16 = __atxlog_handle_lock_screen();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          +[ATXFaceSuggestionAssetParameters posterDescriptorFromKey:withDescriptorCache:]();
        }
        id v9 = 0;
      }
    }
    else
    {
      uint64_t v8 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[ATXFaceSuggestionAssetParameters posterDescriptorFromKey:withDescriptorCache:](v8);
      }
      id v9 = 0;
    }
  }

  return v9;
}

uint64_t __80__ATXFaceSuggestionAssetParameters_posterDescriptorFromKey_withDescriptorCache___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 coreIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __80__ATXFaceSuggestionAssetParameters_posterDescriptorFromKey_withDescriptorCache___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 coreIdentifier];
  uint64_t v4 = [v3 containsString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_currentCountryCode
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [(NSLocale *)self->_locale countryCode];
  id v3 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionAssetParameters _currentCountryCode]";
    __int16 v7 = 2112;
    uint64_t v8 = v2;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%s: using country code: %@", (uint8_t *)&v5, 0x16u);
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLevelDictionary, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
}

void __48__ATXFaceSuggestionAssetParameters_sectionOrder__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_12(&dword_1D0FA3000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
}

void __52__ATXFaceSuggestionAssetParameters_heroSectionOrder__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_12(&dword_1D0FA3000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
}

void __73__ATXFaceSuggestionAssetParameters_weatherAndAstronomySectionDescriptors__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_12(&dword_1D0FA3000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
}

void __66__ATXFaceSuggestionAssetParameters_kaleidoscopeSectionDescriptors__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_12(&dword_1D0FA3000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
}

void __59__ATXFaceSuggestionAssetParameters_emojiSectionDescriptors__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_12(&dword_1D0FA3000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
}

void __59__ATXFaceSuggestionAssetParameters_unitySectionDescriptors__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_12(&dword_1D0FA3000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
}

void __59__ATXFaceSuggestionAssetParameters_prideSectionDescriptors__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_12(&dword_1D0FA3000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
}

void __63__ATXFaceSuggestionAssetParameters_osVersionSectionDescriptors__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_12(&dword_1D0FA3000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
}

void __65__ATXFaceSuggestionAssetParameters_collectionsSectionDescriptors__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_12(&dword_1D0FA3000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
}

void __59__ATXFaceSuggestionAssetParameters_colorSectionDescriptors__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_12(&dword_1D0FA3000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
}

void __70__ATXFaceSuggestionAssetParameters_descriptorsToRemoveFromCollections__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_12(&dword_1D0FA3000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
}

void __62__ATXFaceSuggestionAssetParameters_dayZeroFeaturedDescriptors__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_12(&dword_1D0FA3000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
}

void __91__ATXFaceSuggestionAssetParameters_extensionBundleIdsEligibleForComplicationsInFaceGallery__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_12(&dword_1D0FA3000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
}

- (void)dictionaryStringToSetFromObject:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  id v4 = v3;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "%s: object is not a dictionary: %@", (uint8_t *)v5, 0x16u);
}

- (void)dictionaryForKey:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = [a2 topLevelDictionary];
  v6[0] = 136315650;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_9(&dword_1D0FA3000, a3, v5, "%s: did not find dictionary with key %@ in top level dictionary: %@", (uint8_t *)v6);
}

- (void)arrayForKey:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = [a2 topLevelDictionary];
  v6[0] = 136315650;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_9(&dword_1D0FA3000, a3, v5, "%s: did not find array with key %@ in top level dictionary: %@", (uint8_t *)v6);
}

- (void)topLevelDictionary
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[ATXFaceSuggestionAssetParameters topLevelDictionary]";
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%s: could not get file path", (uint8_t *)&v1, 0xCu);
}

+ (void)loadAssetParametersDictionaryFromPath:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_4_8();
  OUTLINED_FUNCTION_2_9(&dword_1D0FA3000, v0, (uint64_t)v0, "%s: could not load data from path: %@; error: %@",
    (uint8_t *)v1);
}

+ (void)loadAssetParametersDictionaryFromPath:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_4_8();
  OUTLINED_FUNCTION_2_9(&dword_1D0FA3000, v0, (uint64_t)v0, "%s: could not parse JSON from contents of path: %@; error: %@",
    (uint8_t *)v1);
}

+ (void)loadAssetParametersDictionaryFromPath:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "%s: parsed JSON is not a dictionary at path: %@", (uint8_t *)v1, 0x16u);
}

+ (void)posterDescriptorFromKey:(os_log_t)log withDescriptorCache:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "+[ATXFaceSuggestionAssetParameters posterDescriptorFromKey:withDescriptorCache:]";
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%s: parsed poster descriptor key is not a valid key. Needs to be extensionBundleId:identifier", (uint8_t *)&v1, 0xCu);
}

+ (void)posterDescriptorFromKey:withDescriptorCache:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "%s: extensionBundleId %@ not found in descriptor cache", (uint8_t *)v1, 0x16u);
}

@end