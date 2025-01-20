@interface ATXFaceGalleryLayoutGenerator
+ (id)_descriptorsByDeduplicatingExtensionsInDescriptors:(id)a3;
- (ATXFaceGalleryLayoutGenerator)initWithDescriptors:(id)a3 complicationProvider:(id)a4 complicationDescriptorProvider:(id)a5 parameters:(id)a6 dayZero:(BOOL)a7 locale:(id)a8;
- (BOOL)_complicationExistsOnSystem:(id)a3;
- (BOOL)_descriptorIsEligibleForComplications:(id)a3;
- (BOOL)_isFocusUser;
- (BOOL)isDescriptor:(id)a3 availableInAssetParameter:(id)a4;
- (BOOL)isDescriptorFromGalleryItem:(id)a3 availableInAssetParameter:(id)a4;
- (BOOL)shouldAddDescriptorFromExtension:(id)a3 descriptorIdentifierInAsset:(id)a4 withSemanticType:(int64_t)a5 assetParametersToFilterOut:(id)a6;
- (BOOL)shouldRemoveDescriptorFromFeatured:(id)a3 withDescriptorsToRemove:(id)a4;
- (NSArray)candidateFeaturedDescriptors;
- (NSArray)rankedFeaturedDescriptors;
- (id)_candidateFeaturedDescriptors;
- (id)_generateSectionWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 assetDescriptors:(id)a6 otherParameters:(id)a7 semanticType:(int64_t)a8;
- (id)_generatedFeaturedPhotosSectionGivenFeaturedSection:(id)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6;
- (id)_generatedFeaturedSectionWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5;
- (id)_generatedFocusSection;
- (id)_generatedHeroSectionWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 heroSectionOrder:(id)a6;
- (id)_generatedPhotoShuffleSectionWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5;
- (id)_inlineComplicationForDescriptor:(id)a3;
- (id)_itemFromDescriptor:(id)a3 shouldShowDisplayName:(BOOL)a4 shouldShowComplications:(BOOL)a5 systemSuggestedComplicationSet:(id)a6 systemSuggestedLandscapeComplicationSet:(id)a7;
- (id)_itemsFromDescriptors:(id)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6 shouldShowDisplayName:(BOOL)a7 shouldShowComplications:(BOOL)a8 limit:(id)a9;
- (id)_landscapeSetsFromLandscapeSetsDict:(id)a3;
- (id)_localizedSubtitleTextWithSemanticType:(int64_t)a3;
- (id)_localizedTitleForWeatherAndAstronomySection;
- (id)_localizedTitleTextWithSemanticType:(int64_t)a3;
- (id)_localizedTitleforOSVersionSection;
- (id)_modularComplicationsForDescriptor:(id)a3 systemSuggestionComplications:(id)a4;
- (id)_modularLandscapeComplicationsForDescriptor:(id)a3 systemSuggestionComplications:(id)a4;
- (id)_shuffledSuggestableComplicationSetsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5;
- (id)descriptorsToRemoveFromSectionWithSemanticType:(int64_t)a3 parameters:(id)a4;
- (id)generatedConfigurationWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5;
- (void)_processDescriptors:(id)a3;
@end

@implementation ATXFaceGalleryLayoutGenerator

- (ATXFaceGalleryLayoutGenerator)initWithDescriptors:(id)a3 complicationProvider:(id)a4 complicationDescriptorProvider:(id)a5 parameters:(id)a6 dayZero:(BOOL)a7 locale:(id)a8
{
  id v14 = a3;
  id v23 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ATXFaceGalleryLayoutGenerator;
  v18 = [(ATXFaceGalleryLayoutGenerator *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_complicationProvider, a4);
    objc_storeStrong((id *)&v19->_complicationDescriptorProvider, a5);
    v19->_dayZero = a7;
    objc_storeStrong((id *)&v19->_locale, a8);
    uint64_t v20 = +[ATXComplicationSuggestionParameters sharedInstance];
    complicationParameters = v19->_complicationParameters;
    v19->_complicationParameters = (ATXComplicationSuggestionParameters *)v20;

    objc_storeStrong((id *)&v19->_parameters, a6);
    [(ATXFaceGalleryLayoutGenerator *)v19 _processDescriptors:v14];
  }

  return v19;
}

- (id)generatedConfigurationWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v88 = a4;
  id v87 = a5;
  v9 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v97 = "-[ATXFaceGalleryLayoutGenerator generatedConfigurationWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchD"
          "ata:bundleIdToCompanionBundleId:]";
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "%s: generating new gallery layout", buf, 0xCu);
  }

  v10 = objc_opt_new();
  v11 = [(ATXFaceGalleryLayoutGenerator *)self _generatedFeaturedSectionWithWidgetDescriptorsAdditionalData:v8 aggregatedAppLaunchData:v88 bundleIdToCompanionBundleId:v87];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = self->_parameters;
  }
  else {
    v12 = 0;
  }
  v86 = v12;
  uint64_t v13 = [(ATXFaceSuggestionParameters *)v12 sectionOrder];
  id v14 = (void *)v13;
  id v15 = (void *)MEMORY[0x1E4F1CBF0];
  if (v13) {
    id v15 = (void *)v13;
  }
  id v16 = v15;

  if (![v16 count])
  {
    id v17 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[ATXFaceGalleryLayoutGenerator generatedConfigurationWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  v90 = self;
  v89 = objc_opt_new();
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v25 = v16;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v91 objects:v95 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v92;
    v84 = v11;
    id v85 = v8;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v92 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(id *)(*((void *)&v91 + 1) + 8 * v29);
        if ([v30 isEqualToString:@"Default"]) {
          goto LABEL_18;
        }
        if ([v30 isEqualToString:@"FeaturedFaces"])
        {

          [v10 addObject:v11];
          goto LABEL_21;
        }
        if ([v30 isEqualToString:@"FeaturedPhotos"])
        {

          if ([v89 bundleIdIsLockedOrHiddenByUserPreference:@"com.apple.mobileslideshow"])
          {
            v30 = __atxlog_handle_lock_screen();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v97 = (const char *)@"com.apple.mobileslideshow";
              v31 = v30;
              v32 = "Not generating Suggested Photos section: %@ is locked or hidden by user preference.";
              goto LABEL_27;
            }
            goto LABEL_18;
          }
          uint64_t v33 = [(ATXFaceGalleryLayoutGenerator *)v90 _generatedFeaturedPhotosSectionGivenFeaturedSection:v11 widgetDescriptorsAdditionalData:v8 aggregatedAppLaunchData:v88 bundleIdToCompanionBundleId:v87];
          goto LABEL_31;
        }
        if ([v30 isEqualToString:@"Focus"])
        {

          uint64_t v33 = [(ATXFaceGalleryLayoutGenerator *)v90 _generatedFocusSection];
          goto LABEL_31;
        }
        if ([v30 isEqualToString:@"Hero"])
        {

          uint64_t v34 = [(ATXFaceSuggestionParameters *)v86 heroSectionOrder];
          v30 = v34;
          if (v34) {
            uint64_t v35 = v34;
          }
          else {
            uint64_t v35 = MEMORY[0x1E4F1CBF0];
          }
          v36 = -[ATXFaceGalleryLayoutGenerator _generatedHeroSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:heroSectionOrder:](v90, "_generatedHeroSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:heroSectionOrder:", v8, v88, v87, v35, v84, v85);
          [v10 addObject:v36];

          goto LABEL_18;
        }
        if ([v30 isEqualToString:@"PhotoShuffle"])
        {

          if ([v89 bundleIdIsLockedOrHiddenByUserPreference:@"com.apple.mobileslideshow"])
          {
            v30 = __atxlog_handle_lock_screen();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v97 = (const char *)@"com.apple.mobileslideshow";
              v31 = v30;
              v32 = "Not generating Photo Shuffle section: %@ is locked or hidden by user preference.";
LABEL_27:
              _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 0xCu);
            }
LABEL_18:

            goto LABEL_21;
          }
          uint64_t v33 = [(ATXFaceGalleryLayoutGenerator *)v90 _generatedPhotoShuffleSectionWithWidgetDescriptorsAdditionalData:v8 aggregatedAppLaunchData:v88 bundleIdToCompanionBundleId:v87];
LABEL_31:
          v30 = v33;
          if (v33) {
            [v10 addObject:v33];
          }
          goto LABEL_18;
        }
        if ([v30 isEqualToString:@"WeatherAndAstronomy"])
        {

          uint64_t v37 = [(ATXFaceSuggestionParameters *)v86 weatherAndAstronomySectionDescriptors];
          v38 = (void *)v37;
          v39 = (void *)MEMORY[0x1E4F1CBF0];
          if (v37) {
            v39 = (void *)v37;
          }
          id v40 = v8;
          id v41 = v39;

          v42 = v90;
          id v43 = v40;
          id v45 = v87;
          id v44 = v88;
          id v46 = v41;
          v47 = v86;
          uint64_t v48 = 6;
        }
        else if ([v30 isEqualToString:@"Kaleidoscope"])
        {

          uint64_t v49 = [(ATXFaceSuggestionParameters *)v86 kaleidoscopeSectionDescriptors];
          v50 = (void *)v49;
          v51 = (void *)MEMORY[0x1E4F1CBF0];
          if (v49) {
            v51 = (void *)v49;
          }
          id v52 = v8;
          id v41 = v51;

          v42 = v90;
          id v43 = v52;
          id v45 = v87;
          id v44 = v88;
          id v46 = v41;
          v47 = v86;
          uint64_t v48 = 7;
        }
        else if ([v30 isEqualToString:@"Emoji"])
        {

          uint64_t v53 = [(ATXFaceSuggestionParameters *)v86 emojiSectionDescriptors];
          v54 = (void *)v53;
          v55 = (void *)MEMORY[0x1E4F1CBF0];
          if (v53) {
            v55 = (void *)v53;
          }
          id v56 = v8;
          id v41 = v55;

          v42 = v90;
          id v43 = v56;
          id v45 = v87;
          id v44 = v88;
          id v46 = v41;
          v47 = v86;
          uint64_t v48 = 8;
        }
        else if ([v30 isEqualToString:@"Unity"])
        {

          uint64_t v57 = [(ATXFaceSuggestionParameters *)v86 unitySectionDescriptors];
          v58 = (void *)v57;
          v59 = (void *)MEMORY[0x1E4F1CBF0];
          if (v57) {
            v59 = (void *)v57;
          }
          id v60 = v8;
          id v41 = v59;

          v42 = v90;
          id v43 = v60;
          id v45 = v87;
          id v44 = v88;
          id v46 = v41;
          v47 = v86;
          uint64_t v48 = 9;
        }
        else if ([v30 isEqualToString:@"Pride"])
        {

          uint64_t v61 = [(ATXFaceSuggestionParameters *)v86 prideSectionDescriptors];
          v62 = (void *)v61;
          v63 = (void *)MEMORY[0x1E4F1CBF0];
          if (v61) {
            v63 = (void *)v61;
          }
          id v64 = v8;
          id v41 = v63;

          v42 = v90;
          id v43 = v64;
          id v45 = v87;
          id v44 = v88;
          id v46 = v41;
          v47 = v86;
          uint64_t v48 = 10;
        }
        else if ([v30 isEqualToString:@"OSVersion"])
        {

          uint64_t v65 = [(ATXFaceSuggestionParameters *)v86 osVersionSectionDescriptors];
          v66 = (void *)v65;
          v67 = (void *)MEMORY[0x1E4F1CBF0];
          if (v65) {
            v67 = (void *)v65;
          }
          id v68 = v8;
          id v41 = v67;

          v42 = v90;
          id v43 = v68;
          id v45 = v87;
          id v44 = v88;
          id v46 = v41;
          v47 = v86;
          uint64_t v48 = 11;
        }
        else if ([v30 isEqualToString:@"Collections"])
        {

          uint64_t v69 = [(ATXFaceSuggestionParameters *)v86 collectionsSectionDescriptors];
          v70 = (void *)v69;
          v71 = (void *)MEMORY[0x1E4F1CBF0];
          if (v69) {
            v71 = (void *)v69;
          }
          id v72 = v8;
          id v41 = v71;

          v42 = v90;
          id v43 = v72;
          id v45 = v87;
          id v44 = v88;
          id v46 = v41;
          v47 = v86;
          uint64_t v48 = 12;
        }
        else
        {
          char v73 = [v30 isEqualToString:@"Color"];

          if ((v73 & 1) == 0) {
            goto LABEL_21;
          }
          uint64_t v74 = [(ATXFaceSuggestionParameters *)v86 colorSectionDescriptors];
          v75 = (void *)v74;
          v76 = (void *)MEMORY[0x1E4F1CBF0];
          if (v74) {
            v76 = (void *)v74;
          }
          id v77 = v8;
          id v41 = v76;

          v42 = v90;
          id v43 = v77;
          id v45 = v87;
          id v44 = v88;
          id v46 = v41;
          v47 = v86;
          uint64_t v48 = 13;
        }
        v78 = -[ATXFaceGalleryLayoutGenerator _generateSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:assetDescriptors:otherParameters:semanticType:](v42, "_generateSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:assetDescriptors:otherParameters:semanticType:", v43, v44, v45, v46, v47, v48, v84, v85);

        if (v78) {
          [v10 addObject:v78];
        }

        v11 = v84;
        id v8 = v85;
LABEL_21:
        ++v29;
      }
      while (v27 != v29);
      uint64_t v79 = [v25 countByEnumeratingWithState:&v91 objects:v95 count:16];
      uint64_t v27 = v79;
    }
    while (v79);
  }

  id v80 = objc_alloc(MEMORY[0x1E4F4B028]);
  v81 = (void *)[v10 copy];
  v82 = (void *)[v80 initWithSections:v81 source:1 locale:v90->_locale dayZero:v90->_dayZero];

  return v82;
}

- (void)_processDescriptors:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  id v8 = [(ATXFaceSuggestionParameters *)self->_parameters hiddenRegions];
  v9 = [(ATXFaceSuggestionParameters *)self->_parameters allowedDescriptorsForRegions];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __53__ATXFaceGalleryLayoutGenerator__processDescriptors___block_invoke;
  uint64_t v24 = &unk_1E68B5C50;
  id v25 = self;
  id v26 = v8;
  id v27 = v9;
  id v28 = v5;
  id v29 = v6;
  id v30 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v5;
  id v13 = v9;
  id v14 = v8;
  [v4 enumerateKeysAndObjectsUsingBlock:&v21];

  id v15 = (NSArray *)objc_msgSend(v12, "copy", v21, v22, v23, v24, v25);
  allHeroDescriptors = self->_allHeroDescriptors;
  self->_allHeroDescriptors = v15;

  id v17 = (NSArray *)[v11 copy];
  allNonHeroDescriptors = self->_allNonHeroDescriptors;
  self->_allNonHeroDescriptors = v17;

  uint64_t v19 = (NSDictionary *)[v10 copy];
  nonHeroDescriptorsByExtensionBundleId = self->_nonHeroDescriptorsByExtensionBundleId;
  self->_nonHeroDescriptorsByExtensionBundleId = v19;
}

void __53__ATXFaceGalleryLayoutGenerator__processDescriptors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 72) countryCode];
  if (!v7) {
    goto LABEL_42;
  }
  id v8 = (void *)v7;
  v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  id v10 = [*(id *)(*(void *)(a1 + 32) + 72) countryCode];
  int v11 = [v9 containsObject:v10];

  if (!v11)
  {
LABEL_42:
    if ([v5 isEqualToString:@"com.apple.WatchFacesWallpaperSupport.KaleidoscopePoster"])
    {
      id v12 = MGGetStringAnswer();
      if (([v12 isEqualToString:@"iPad7,5"] & 1) != 0
        || [v12 isEqualToString:@"iPad7,6"])
      {
        id v13 = __atxlog_handle_lock_screen();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
LABEL_11:

          goto LABEL_39;
        }
        *(_DWORD *)buf = 136315650;
        v51 = "-[ATXFaceGalleryLayoutGenerator _processDescriptors:]_block_invoke";
        __int16 v52 = 2112;
        id v53 = v5;
        __int16 v54 = 2112;
        v55 = v12;
        id v14 = "%s: disallowing extensionBundleId %@ for product type: %@";
        id v15 = v13;
LABEL_10:
        _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, 0x20u);
        goto LABEL_11;
      }
    }
    v42 = objc_opt_new();
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v41 = v6;
    id obj = v6;
    uint64_t v16 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (!v16) {
      goto LABEL_38;
    }
    uint64_t v17 = v16;
    char v44 = 0;
    uint64_t v45 = *(void *)v47;
LABEL_15:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v47 != v45) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void **)(*((void *)&v46 + 1) + 8 * v18);
      uint64_t v20 = [*(id *)(*(void *)(a1 + 32) + 72) countryCode];
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        [*(id *)(a1 + 48) objectForKeyedSubscript:v5];
        uint64_t v23 = v22 = v5;
        uint64_t v24 = [*(id *)(*(void *)(a1 + 32) + 72) countryCode];
        id v25 = [v23 objectForKeyedSubscript:v24];

        id v5 = v22;
        if (v25)
        {
          id v26 = [*(id *)(a1 + 48) objectForKeyedSubscript:v22];
          id v27 = [*(id *)(*(void *)(a1 + 32) + 72) countryCode];
          id v28 = [v26 objectForKeyedSubscript:v27];
          id v29 = [v19 identifier];
          char v30 = [v28 containsObject:v29];

          v31 = __atxlog_handle_lock_screen();
          BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
          id v5 = v22;
          if ((v30 & 1) == 0)
          {
            if (v32)
            {
              uint64_t v37 = [v19 identifier];
              v38 = [*(id *)(*(void *)(a1 + 32) + 72) countryCode];
              *(_DWORD *)buf = 136315906;
              v51 = "-[ATXFaceGalleryLayoutGenerator _processDescriptors:]_block_invoke";
              __int16 v52 = 2112;
              id v53 = v22;
              __int16 v54 = 2112;
              v55 = v37;
              __int16 v56 = 2112;
              uint64_t v57 = v38;
              _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, "%s: hiding extensionBundleId %@ descriptorId: %@ in restricted locale: %@ because it's not on allow list.", buf, 0x2Au);
            }
            goto LABEL_36;
          }
          if (v32)
          {
            uint64_t v33 = [v19 identifier];
            uint64_t v34 = [*(id *)(*(void *)(a1 + 32) + 72) countryCode];
            *(_DWORD *)buf = 136315906;
            v51 = "-[ATXFaceGalleryLayoutGenerator _processDescriptors:]_block_invoke";
            __int16 v52 = 2112;
            id v53 = v22;
            __int16 v54 = 2112;
            v55 = v33;
            __int16 v56 = 2112;
            uint64_t v57 = v34;
            _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, "%s: Accepting extensionBundleId %@ descriptorId: %@ in restricted locale: %@ because it is on allow list.", buf, 0x2Au);
          }
        }
      }
      uint64_t v35 = [v19 galleryOptions];
      int v36 = [v35 isHero];

      if (v36)
      {
        if ((v44 & 1) != 0 && !isPhotosPosterExtensionBundleId(v5))
        {
          v39 = __atxlog_handle_lock_screen();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v51 = "-[ATXFaceGalleryLayoutGenerator _processDescriptors:]_block_invoke";
            __int16 v52 = 2112;
            id v53 = v5;
            _os_log_error_impl(&dword_1D0FA3000, v39, OS_LOG_TYPE_ERROR, "%s: provider %@ has provided more than one hero descriptor!", buf, 0x16u);
          }
        }
        else
        {
          [*(id *)(a1 + 56) addObject:v19];
        }
        char v44 = 1;
      }
      else
      {
        [v42 addObject:v19];
      }
LABEL_36:
      if (v17 == ++v18)
      {
        uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
        if (!v17)
        {
LABEL_38:

          id v12 = v42;
          [*(id *)(a1 + 64) addObjectsFromArray:v42];
          id v40 = [v42 copy];
          [*(id *)(a1 + 72) setObject:v40 forKeyedSubscript:v5];

          id v6 = v41;
          goto LABEL_39;
        }
        goto LABEL_15;
      }
    }
  }
  id v12 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [*(id *)(*(void *)(a1 + 32) + 72) countryCode];
    *(_DWORD *)buf = 136315650;
    v51 = "-[ATXFaceGalleryLayoutGenerator _processDescriptors:]_block_invoke";
    __int16 v52 = 2112;
    id v53 = v5;
    __int16 v54 = 2112;
    v55 = v13;
    id v14 = "%s: hiding extensionBundleId %@ in restricted locale: %@";
    id v15 = v12;
    goto LABEL_10;
  }
LABEL_39:
}

- (id)_generatedHeroSectionWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 heroSectionOrder:(id)a6
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v68 = a4;
  id v67 = a5;
  id v69 = a6;
  int v11 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v12 = [(NSArray *)self->_allHeroDescriptors count];
    *(_DWORD *)buf = 136315394;
    v90 = "-[ATXFaceGalleryLayoutGenerator _generatedHeroSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchDa"
          "ta:bundleIdToCompanionBundleId:heroSectionOrder:]";
    __int16 v91 = 2048;
    NSUInteger v92 = v12;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "%s: %lu hero descriptors", buf, 0x16u);
  }
  v66 = v10;

  id v13 = objc_opt_new();
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  uint64_t v65 = self;
  id v14 = self->_allHeroDescriptors;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v82 objects:v88 count:16];
  if (!v15)
  {
    id v72 = 0;
    id v73 = 0;
    id v17 = 0;
    id v18 = 0;
    goto LABEL_29;
  }
  uint64_t v16 = v15;
  id v72 = 0;
  id v73 = 0;
  id v17 = 0;
  id v18 = 0;
  uint64_t v19 = *(void *)v83;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v83 != v19) {
        objc_enumerationMutation(v14);
      }
      id v21 = *(id *)(*((void *)&v82 + 1) + 8 * i);
      if (isPhotosDescriptor(v21))
      {
        id v22 = [v21 identifier];
        int v23 = [v22 hasPrefix:@"CreateAFacePhotos"];

        if (v23)
        {
          uint64_t v24 = v18;
          id v18 = v21;
          goto LABEL_25;
        }
      }
      else
      {
      }
      id v25 = v21;
      if (isPhotosDescriptor(v25))
      {
        id v26 = [v25 identifier];
        int v27 = [v26 hasPrefix:@"CreateAFacePeople"];

        if (v27)
        {
          uint64_t v24 = v17;
          id v17 = v25;
          goto LABEL_25;
        }
      }
      else
      {
      }
      id v28 = v25;
      if (isPhotosDescriptor(v28))
      {
        id v29 = [v28 identifier];
        int v30 = [v29 hasPrefix:@"CreateAFaceShuffle"];

        if (v30)
        {
          uint64_t v24 = v72;
          id v72 = v28;
          goto LABEL_25;
        }
      }
      else
      {
      }
      id v31 = v28;
      if (isPhotosDescriptor(v31))
      {
        BOOL v32 = [v31 identifier];
        int v33 = [v32 hasPrefix:@"CreateAFaceLivePhoto"];

        if (v33)
        {
          uint64_t v24 = v73;
          id v73 = v31;
          goto LABEL_25;
        }
      }
      else
      {
      }
      uint64_t v24 = [v31 extensionBundleIdentifier];
      [v13 setObject:v31 forKeyedSubscript:v24];
LABEL_25:
    }
    uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v82 objects:v88 count:16];
  }
  while (v16);
LABEL_29:
  v71 = v13;

  uint64_t v34 = objc_opt_new();
  id v35 = v72;
  if (![v69 count])
  {
    int v36 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
      -[ATXFaceGalleryLayoutGenerator _generatedHeroSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:heroSectionOrder:](v36, v37, v38, v39, v40, v41, v42, v43);
    }
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v44 = v69;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v78 objects:v87 count:16];
  v70 = v44;
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v79;
    do
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v79 != v47) {
          objc_enumerationMutation(v44);
        }
        long long v49 = *(void **)(*((void *)&v78 + 1) + 8 * j);
        if (v18
          && [*(id *)(*((void *)&v78 + 1) + 8 * j) isEqualToString:@"Photos"])
        {
          v50 = v34;
          id v51 = v18;
LABEL_50:
          [v50 addObject:v51];
          continue;
        }
        if (v17 && [v49 isEqualToString:@"People"])
        {
          v50 = v34;
          id v51 = v17;
          goto LABEL_50;
        }
        if (v35 && [v49 isEqualToString:@"Shuffle"])
        {
          v50 = v34;
          id v51 = v35;
          goto LABEL_50;
        }
        if (v73 && [v49 isEqualToString:@"LivePhoto"])
        {
          v50 = v34;
          id v51 = v73;
          goto LABEL_50;
        }
        __int16 v52 = [v71 objectForKeyedSubscript:v49];
        if (v52)
        {
          [v34 addObject:v52];
          [v71 removeObjectForKey:v49];
        }
        else
        {
          id v53 = __atxlog_handle_lock_screen();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v90 = "-[ATXFaceGalleryLayoutGenerator _generatedHeroSectionWithWidgetDescriptorsAdditionalData:aggregatedApp"
                  "LaunchData:bundleIdToCompanionBundleId:heroSectionOrder:]";
            __int16 v91 = 2112;
            NSUInteger v92 = (NSUInteger)v49;
            _os_log_error_impl(&dword_1D0FA3000, v53, OS_LOG_TYPE_ERROR, "%s: could not find extensionBundleId defined in hero section order: %@", buf, 0x16u);
          }
        }
        id v35 = v72;
        id v44 = v70;
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v78 objects:v87 count:16];
    }
    while (v46);
  }

  __int16 v54 = [v71 allValues];
  if ([v54 count])
  {
    v55 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
      -[ATXFaceGalleryLayoutGenerator _generatedHeroSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:heroSectionOrder:](v71, v55);
    }

    [v34 addObjectsFromArray:v54];
  }
  __int16 v56 = (void *)[v34 copy];
  uint64_t v57 = [(ATXFaceGalleryLayoutGenerator *)v65 _itemsFromDescriptors:v56 widgetDescriptorsAdditionalData:v66 aggregatedAppLaunchData:v68 bundleIdToCompanionBundleId:v67 shouldShowDisplayName:1 shouldShowComplications:0 limit:0];

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v58 = v57;
  uint64_t v59 = [v58 countByEnumeratingWithState:&v74 objects:v86 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v75;
    do
    {
      for (uint64_t k = 0; k != v60; ++k)
      {
        if (*(void *)v75 != v61) {
          objc_enumerationMutation(v58);
        }
        [*(id *)(*((void *)&v74 + 1) + 8 * k) setSource:1];
      }
      uint64_t v60 = [v58 countByEnumeratingWithState:&v74 objects:v86 count:16];
    }
    while (v60);
  }

  v63 = (void *)[objc_alloc(MEMORY[0x1E4F4B038]) initWithLocalizedTitle:0 symbolImageName:0 symbolColorName:0 localizedSubtitle:0 localizedDescriptiveText:0 unityDescription:0 type:3 items:v58 semanticType:4];
  return v63;
}

- (id)_generatedFeaturedSectionWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_dayZero)
  {
    int v11 = [(ATXFaceSuggestionParameters *)self->_parameters dayZeroFeaturedDescriptors];
    if ((unint64_t)[v11 count] > 5) {
      goto LABEL_11;
    }
    NSUInteger v12 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[ATXFaceGalleryLayoutGenerator _generatedFeaturedSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:]();
    }
  }
  else
  {
    NSUInteger v12 = [(ATXFaceGalleryLayoutGenerator *)self rankedFeaturedDescriptors];
    id v13 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v53 = "-[ATXFaceGalleryLayoutGenerator _generatedFeaturedSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLa"
            "unchData:bundleIdToCompanionBundleId:]";
      __int16 v54 = 2112;
      v55 = v12;
      _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "%s: ranked descriptors before deduplicating and photos promotion: %@", buf, 0x16u);
    }

    id v14 = [v12 _pas_filteredArrayWithTest:&__block_literal_global_229];
    int v11 = [(id)objc_opt_class() _descriptorsByDeduplicatingExtensionsInDescriptors:v14];
    uint64_t v15 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v53 = "-[ATXFaceGalleryLayoutGenerator _generatedFeaturedSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLa"
            "unchData:bundleIdToCompanionBundleId:]";
      __int16 v54 = 2112;
      v55 = v11;
      _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "%s: ranked descriptors after deduplicating photos promotion: %@", buf, 0x16u);
    }
  }
LABEL_11:
  uint64_t v37 = v11;
  uint64_t v38 = v10;
  if (v11) {
    uint64_t v16 = v11;
  }
  else {
    uint64_t v16 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v39 = v9;
  uint64_t v40 = v8;
  [(ATXFaceGalleryLayoutGenerator *)self _itemsFromDescriptors:v16 widgetDescriptorsAdditionalData:v8 aggregatedAppLaunchData:v9 bundleIdToCompanionBundleId:v10 shouldShowDisplayName:1 shouldShowComplications:1 limit:&unk_1F27F2838];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v47 != v19) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        [v21 setSource:2];
        uint64_t v22 = [(ATXFaceSuggestionParameters *)self->_parameters osVersionSectionDescriptors];
        int v23 = (void *)v22;
        uint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
        if (v22) {
          uint64_t v24 = (void *)v22;
        }
        id v25 = v24;

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v43 != v29) {
                objc_enumerationMutation(v26);
              }
              if ([(ATXFaceGalleryLayoutGenerator *)self isDescriptorFromGalleryItem:v21 availableInAssetParameter:*(void *)(*((void *)&v42 + 1) + 8 * j)])
              {
                id v31 = [(ATXFaceGalleryLayoutGenerator *)self _localizedTitleforOSVersionSection];
                [v21 setLocalizedDisplayName:v31];
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v28);
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v18);
  }
  id v32 = objc_alloc(MEMORY[0x1E4F4B038]);
  int v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v34 = [v33 localizedStringForKey:@"FACE_GALLERY_SECTION_TITLE_FEATURED_FACES" value:&stru_1F2740B58 table:0];
  id v35 = (void *)[v32 initWithLocalizedTitle:v34 symbolImageName:0 symbolColorName:0 localizedSubtitle:0 localizedDescriptiveText:0 unityDescription:0 type:1 items:obj semanticType:1];

  return v35;
}

uint64_t __146__ATXFaceGalleryLayoutGenerator__generatedFeaturedSectionWithWidgetDescriptorsAdditionalData_aggregatedAppLaunchData_bundleIdToCompanionBundleId___block_invoke(uint64_t a1, void *a2)
{
  return isPhotosDescriptor(a2) ^ 1;
}

- (NSArray)rankedFeaturedDescriptors
{
  v3 = [(ATXFaceGalleryLayoutGenerator *)self _candidateFeaturedDescriptors];
  id v4 = [ATXFaceSuggestionScorer alloc];
  parameters = self->_parameters;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v3];
  uint64_t v7 = [(ATXFaceSuggestionScorer *)v4 initWithParameters:parameters descriptors:v6];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__ATXFaceGalleryLayoutGenerator_rankedFeaturedDescriptors__block_invoke;
  v12[3] = &unk_1E68B5C98;
  id v13 = v7;
  id v8 = v7;
  id v9 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v12);
  id v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_63_0];

  return (NSArray *)v10;
}

id __58__ATXFaceGalleryLayoutGenerator_rankedFeaturedDescriptors__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[a2 copy];
  [*(id *)(a1 + 32) featuredScoreForDescriptor:v3];
  id v4 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v3 setScore:v4];

  id v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[ATXFaceGalleryLayoutGenerator rankedFeaturedDescriptors]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%s: descriptor: %@", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

uint64_t __58__ATXFaceGalleryLayoutGenerator_rankedFeaturedDescriptors__block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v5 score];
  int v7 = [v4 score];
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    __int16 v9 = [v4 identifier];
    id v10 = [v5 identifier];
    uint64_t v8 = [v9 compare:v10];

    if (!v8)
    {
      uint64_t v11 = [v4 identifier];
      NSUInteger v12 = [v5 identifier];
      uint64_t v8 = [v11 compare:v12];
    }
  }

  return v8;
}

- (id)_candidateFeaturedDescriptors
{
  allNonHeroDescriptors = self->_allNonHeroDescriptors;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__ATXFaceGalleryLayoutGenerator__candidateFeaturedDescriptors__block_invoke;
  v5[3] = &unk_1E68B4D70;
  v5[4] = self;
  v3 = [(NSArray *)allNonHeroDescriptors _pas_filteredArrayWithTest:v5];
  return v3;
}

uint64_t __62__ATXFaceGalleryLayoutGenerator__candidateFeaturedDescriptors__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (isPhotosDescriptor(v3))
  {
    id v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315394;
      id v26 = "-[ATXFaceGalleryLayoutGenerator _candidateFeaturedDescriptors]_block_invoke";
      __int16 v27 = 2112;
      id v28 = v3;
      id v5 = "%s: not considering photos descriptor for featured section: %@";
LABEL_10:
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v25, 0x16u);
    }
  }
  else
  {
    id v6 = [v3 galleryOptions];
    uint64_t v7 = [v6 featuredConfidenceLevel];

    if (v7)
    {
      uint64_t v8 = [v3 galleryOptions];
      int v9 = [v8 isOnlyEligibleForMadeForFocusSection];

      if (v9)
      {
        id v4 = __atxlog_handle_lock_screen();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 136315394;
          id v26 = "-[ATXFaceGalleryLayoutGenerator _candidateFeaturedDescriptors]_block_invoke";
          __int16 v27 = 2112;
          id v28 = v3;
          id v5 = "%s: not considering descriptor made only for focus for featured section: %@";
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 72) countryCode];
        if (v12)
        {
          id v13 = (void *)v12;
          id v14 = [*(id *)(*(void *)(a1 + 32) + 24) unpromotableRegions];
          uint64_t v15 = [v3 extensionBundleIdentifier];
          uint64_t v16 = [v14 objectForKeyedSubscript:v15];
          uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 72) countryCode];
          int v18 = [v16 containsObject:v17];

          if (v18)
          {
            uint64_t v19 = __atxlog_handle_lock_screen();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v20 = [*(id *)(*(void *)(a1 + 32) + 72) countryCode];
              int v25 = 136315394;
              id v26 = "-[ATXFaceGalleryLayoutGenerator _candidateFeaturedDescriptors]_block_invoke";
              __int16 v27 = 2112;
              id v28 = v20;
              _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "%s: not considering unpromotable descriptor in restricted locale: %@", (uint8_t *)&v25, 0x16u);
            }
            goto LABEL_12;
          }
        }
        id v21 = [v3 extensionBundleIdentifier];
        int v22 = [v21 isEqualToString:@"com.apple.weather.poster"];

        if (!v22 || ([MEMORY[0x1E4F4AF00] isInstalledForBundle:@"com.apple.weather"] & 1) != 0)
        {
          int v23 = *(id **)(a1 + 32);
          uint64_t v24 = [v23[3] descriptorsToRemoveFromFeatured];
          LODWORD(v23) = [v23 shouldRemoveDescriptorFromFeatured:v3 withDescriptorsToRemove:v24];

          uint64_t v10 = v23 ^ 1;
          goto LABEL_13;
        }
        id v4 = __atxlog_handle_lock_screen();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 136315394;
          id v26 = "-[ATXFaceGalleryLayoutGenerator _candidateFeaturedDescriptors]_block_invoke";
          __int16 v27 = 2112;
          id v28 = v3;
          id v5 = "%s: not considering descriptor for featured section because weather app is not currently installed: %@";
          goto LABEL_10;
        }
      }
    }
    else
    {
      id v4 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 136315394;
        id v26 = "-[ATXFaceGalleryLayoutGenerator _candidateFeaturedDescriptors]_block_invoke";
        __int16 v27 = 2112;
        id v28 = v3;
        id v5 = "%s: not considering unconfident descriptor for featured section: %@";
        goto LABEL_10;
      }
    }
  }

LABEL_12:
  uint64_t v10 = 0;
LABEL_13:

  return v10;
}

+ (id)_descriptorsByDeduplicatingExtensionsInDescriptors:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v47 count:16];
  id v32 = v5;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v12 = [v11 extensionBundleIdentifier];
        int v13 = [v12 isEqualToString:@"com.apple.WatchFacesWallpaperSupport.RhizomePoster"];

        if (v13)
        {
          id v14 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    id v14 = 0;
LABEL_11:
    id v5 = v32;
  }
  else
  {
    id v14 = 0;
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v6;
  uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (!v15) {
    goto LABEL_34;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v35;
  do
  {
    for (uint64_t j = 0; j != v16; ++j)
    {
      if (*(void *)v35 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void **)(*((void *)&v34 + 1) + 8 * j);
      uint64_t v20 = [v19 extensionBundleIdentifier];
      int v21 = [v4 containsObject:v20];

      if (!v21)
      {
        int v23 = [v19 extensionBundleIdentifier];
        if ([v23 isEqualToString:@"com.apple.UnityPoster.UnityPosterExtension"]) {
          goto LABEL_25;
        }
        uint64_t v24 = [v19 extensionBundleIdentifier];
        if ([v24 isEqualToString:@"com.apple.WatchFacesWallpaperSupport.ExtragalacticPoster"])
        {

LABEL_25:
LABEL_26:
          [v4 addObject:@"com.apple.UnityPoster.UnityPosterExtension"];
          [v4 addObject:@"com.apple.WatchFacesWallpaperSupport.ExtragalacticPoster"];
          [v4 addObject:@"com.apple.WatchFacesWallpaperSupport.RhizomePoster"];
          if (v14)
          {
            int v25 = v5;
            id v26 = v14;
LABEL_31:
            [v25 addObject:v26];
            continue;
          }
        }
        else
        {
          __int16 v27 = [v19 extensionBundleIdentifier];
          char v28 = [v27 isEqualToString:@"com.apple.WatchFacesWallpaperSupport.RhizomePoster"];

          id v5 = v32;
          if (v28) {
            goto LABEL_26;
          }
          uint64_t v29 = [v19 extensionBundleIdentifier];
          [v4 addObject:v29];

          id v5 = v32;
        }
        int v25 = v5;
        id v26 = v19;
        goto LABEL_31;
      }
      int v22 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v43 = "+[ATXFaceGalleryLayoutGenerator _descriptorsByDeduplicatingExtensionsInDescriptors:]";
        __int16 v44 = 2112;
        long long v45 = v19;
        _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "%s: skipping descriptor, extensionBundleId already used: %@", buf, 0x16u);
      }
    }
    uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
  }
  while (v16);
LABEL_34:

  int v30 = (void *)[v5 copy];
  return v30;
}

- (id)_generatedFeaturedPhotosSectionGivenFeaturedSection:(id)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(NSDictionary *)self->_nonHeroDescriptorsByExtensionBundleId objectForKeyedSubscript:@"com.apple.mobileslideshow.PhotosPosterProvider"];
  int v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [(NSDictionary *)self->_nonHeroDescriptorsByExtensionBundleId objectForKeyedSubscript:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"];
  }
  uint64_t v15 = v14;

  uint64_t v16 = objc_msgSend(v15, "_pas_filteredArrayWithTest:", &__block_literal_global_88_0);
  if (v16)
  {
    uint64_t v17 = [(ATXFaceGalleryLayoutGenerator *)self _itemsFromDescriptors:v16 widgetDescriptorsAdditionalData:v9 aggregatedAppLaunchData:v10 bundleIdToCompanionBundleId:v11 shouldShowDisplayName:0 shouldShowComplications:1 limit:&unk_1F27F2850];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * i) setSource:3];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v19);
    }
    id v22 = objc_alloc(MEMORY[0x1E4F4B038]);
    int v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v24 = [v23 localizedStringForKey:@"FACE_GALLERY_SECTION_TITLE_FEATURED_PHOTOS" value:&stru_1F2740B58 table:0];
    int v25 = (void *)[v22 initWithLocalizedTitle:v24 symbolImageName:0 symbolColorName:0 localizedSubtitle:0 localizedDescriptiveText:0 unityDescription:0 type:1 items:v17 semanticType:2];
  }
  else
  {
    uint64_t v17 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v32 = "-[ATXFaceGalleryLayoutGenerator _generatedFeaturedPhotosSectionGivenFeaturedSection:widgetDescriptorsAdditio"
            "nalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:]";
      _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "%s: no viable photos descriptors are available, not returning a photos section", buf, 0xCu);
    }
    int v25 = 0;
  }

  return v25;
}

uint64_t __169__ATXFaceGalleryLayoutGenerator__generatedFeaturedPhotosSectionGivenFeaturedSection_widgetDescriptorsAdditionalData_aggregatedAppLaunchData_bundleIdToCompanionBundleId___block_invoke(uint64_t a1, void *a2)
{
  return isPhotoShuffleDescriptor(a2) ^ 1;
}

- (id)_generatedPhotoShuffleSectionWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(NSDictionary *)self->_nonHeroDescriptorsByExtensionBundleId objectForKeyedSubscript:@"com.apple.mobileslideshow.PhotosPosterProvider"];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [(NSDictionary *)self->_nonHeroDescriptorsByExtensionBundleId objectForKeyedSubscript:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"];
  }
  id v14 = v13;

  uint64_t v15 = objc_msgSend(v14, "_pas_filteredArrayWithTest:", &__block_literal_global_95_0);
  if ([v15 count])
  {
    unint64_t v16 = [v15 count];
    uint64_t v17 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v48 = "-[ATXFaceGalleryLayoutGenerator _generatedPhotoShuffleSectionWithWidgetDescriptorsAdditionalData:aggregatedA"
            "ppLaunchData:bundleIdToCompanionBundleId:]";
      __int16 v49 = 1024;
      BOOL v50 = v16 > 1;
      _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "%s: shuffle should show display name: %{BOOL}d", buf, 0x12u);
    }

    id v40 = v9;
    uint64_t v18 = [(ATXFaceGalleryLayoutGenerator *)self _itemsFromDescriptors:v15 widgetDescriptorsAdditionalData:v8 aggregatedAppLaunchData:v9 bundleIdToCompanionBundleId:v10 shouldShowDisplayName:v16 > 1 shouldShowComplications:0 limit:&unk_1F27F2850];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v42 + 1) + 8 * i) setSource:4];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v20);
    }
    long long v39 = v14;
    id v41 = v8;
    int v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v24 = [v23 localizedStringForKey:@"FACE_GALLERY_SECTION_DESCRIPTIVE_TEXT_PHOTO_SHUFFLE" value:&stru_1F2740B58 table:0];

    id v25 = v10;
    if ([MEMORY[0x1E4F93B08] isiPad])
    {
      id v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v27 = [v26 localizedStringForKey:@"FACE_GALLERY_SECTION_DESCRIPTIVE_TEXT_PHOTO_SHUFFLE_IPAD" value:&stru_1F2740B58 table:0];

      uint64_t v24 = v27;
    }
    BOOL v28 = v16 > 1;
    if (v16 <= 1) {
      long long v29 = v24;
    }
    else {
      long long v29 = 0;
    }
    if (v28) {
      long long v30 = v24;
    }
    else {
      long long v30 = 0;
    }
    id v31 = (objc_class *)MEMORY[0x1E4F4B038];
    id v32 = v24;
    id v33 = [v31 alloc];
    uint64_t v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v35 = [v34 localizedStringForKey:@"FACE_GALLERY_SECTION_TITLE_PHOTO_SHUFFLE" value:&stru_1F2740B58 table:0];
    uint64_t v36 = 1;
    if (v29) {
      uint64_t v36 = 2;
    }
    long long v37 = (void *)[v33 initWithLocalizedTitle:v35 symbolImageName:0 symbolColorName:0 localizedSubtitle:v30 localizedDescriptiveText:v29 unityDescription:v29 type:v36 items:v18 semanticType:5];

    id v9 = v40;
    id v8 = v41;
    id v10 = v25;
    id v14 = v39;
  }
  else
  {
    long long v29 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v48 = "-[ATXFaceGalleryLayoutGenerator _generatedPhotoShuffleSectionWithWidgetDescriptorsAdditionalData:aggregatedA"
            "ppLaunchData:bundleIdToCompanionBundleId:]";
      _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, "%s: no photo shuffle descriptors available, not returning a photo shuffle section", buf, 0xCu);
    }
    long long v37 = 0;
  }

  return v37;
}

uint64_t __150__ATXFaceGalleryLayoutGenerator__generatedPhotoShuffleSectionWithWidgetDescriptorsAdditionalData_aggregatedAppLaunchData_bundleIdToCompanionBundleId___block_invoke(uint64_t a1, void *a2)
{
  return isPhotoShuffleDescriptor(a2);
}

- (BOOL)_isFocusUser
{
  v2 = [MEMORY[0x1E4F4AF78] sharedInstance];
  id v3 = [v2 dndModeUUIDForDNDModeSemanticType:3];

  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = 4;
    do
    {
      uint64_t v6 = v5;
      if (v5 == 9) {
        break;
      }
      uint64_t v7 = [v2 dndModeUUIDForDNDModeSemanticType:v5];

      uint64_t v5 = v6 + 1;
    }
    while (!v7);
    BOOL v4 = (unint64_t)(v6 - 1) < 8;
  }

  return v4;
}

- (id)_generatedFocusSection
{
  if ([(ATXFaceGalleryLayoutGenerator *)self _isFocusUser])
  {
    id v3 = objc_alloc_init(ATXModeFaceSuggestionGenerator);
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:self->_allNonHeroDescriptors];
    uint64_t v5 = [(ATXModeFaceSuggestionGenerator *)v3 generateFacesFromDescriptors:v4];

    if ([v5 count])
    {
      id v6 = objc_alloc(MEMORY[0x1E4F4B038]);
      uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v8 = [v7 localizedStringForKey:@"FACE_GALLERY_SECTION_TITLE_FOCUS" value:&stru_1F2740B58 table:0];
      id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v10 = [v9 localizedStringForKey:@"FACE_GALLERY_SECTION_SUBTITLE_FOCUS" value:&stru_1F2740B58 table:0];
      id v11 = (void *)[v6 initWithLocalizedTitle:v8 symbolImageName:@"moon.fill" symbolColorName:@"systemIndigoColor" localizedSubtitle:v10 localizedDescriptiveText:0 unityDescription:0 type:1 items:v5 semanticType:3];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    uint64_t v12 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "Not generating Made For Focus section because user is not a Focus user", buf, 2u);
    }

    id v11 = 0;
  }
  return v11;
}

- (id)_generateSectionWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 assetDescriptors:(id)a6 otherParameters:(id)a7 semanticType:(int64_t)a8
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v55 = a4;
  id v54 = a5;
  id v14 = a6;
  id v15 = a7;
  unint64_t v16 = objc_opt_new();
  id v53 = v15;
  if ([v14 count])
  {
    uint64_t v17 = [(ATXFaceGalleryLayoutGenerator *)self descriptorsToRemoveFromSectionWithSemanticType:a8 parameters:v15];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v52 = v14;
    id obj = v14;
    uint64_t v59 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
    if (v59)
    {
      uint64_t v58 = *(void *)v71;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v71 != v58) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(id *)(*((void *)&v70 + 1) + 8 * v18);
          uint64_t v61 = v18;
          if ([v19 containsString:@":"])
          {
            uint64_t v20 = [v19 componentsSeparatedByString:@":"];
            uint64_t v21 = [v20 firstObject];

            id v22 = [v19 componentsSeparatedByString:@":"];
            int v23 = [v22 lastObject];

            id v19 = (id)v21;
          }
          else
          {
            int v23 = &stru_1F2740B58;
          }
          uint64_t v60 = v19;
          uint64_t v24 = [(NSDictionary *)self->_nonHeroDescriptorsByExtensionBundleId objectForKeyedSubscript:v19];
          id v25 = objc_msgSend(v24, "_pas_filteredArrayWithTest:", &__block_literal_global_124);

          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v26 = v25;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v66 objects:v75 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v67;
            do
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v67 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v31 = *(void *)(*((void *)&v66 + 1) + 8 * i);
                if ([(ATXFaceGalleryLayoutGenerator *)self shouldAddDescriptorFromExtension:v31 descriptorIdentifierInAsset:v23 withSemanticType:a8 assetParametersToFilterOut:v17])
                {
                  [v16 addObject:v31];
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v66 objects:v75 count:16];
            }
            while (v28);
          }

          uint64_t v18 = v61 + 1;
        }
        while (v61 + 1 != v59);
        uint64_t v59 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
      }
      while (v59);
    }

    id v32 = (void *)[v16 copy];
    id v33 = [(ATXFaceGalleryLayoutGenerator *)self _itemsFromDescriptors:v32 widgetDescriptorsAdditionalData:v56 aggregatedAppLaunchData:v55 bundleIdToCompanionBundleId:v54 shouldShowDisplayName:0 shouldShowComplications:1 limit:&unk_1F27F2850];

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v34 = v33;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v62 objects:v74 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v63 != v37) {
            objc_enumerationMutation(v34);
          }
          [*(id *)(*((void *)&v62 + 1) + 8 * j) setSource:5];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v62 objects:v74 count:16];
      }
      while (v36);
    }

    id v39 = objc_alloc(MEMORY[0x1E4F4B038]);
    id v40 = [(ATXFaceGalleryLayoutGenerator *)self _localizedTitleTextWithSemanticType:a8];
    id v41 = [(ATXFaceGalleryLayoutGenerator *)self _localizedSubtitleTextWithSemanticType:a8];
    long long v42 = (void *)[v39 initWithLocalizedTitle:v40 symbolImageName:0 symbolColorName:0 localizedSubtitle:v41 localizedDescriptiveText:0 unityDescription:0 type:1 items:v34 semanticType:a8];

    long long v43 = v52;
  }
  else
  {
    long long v43 = v14;
    uint64_t v17 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      [(ATXFaceGalleryLayoutGenerator *)v17 _generateSectionWithWidgetDescriptorsAdditionalData:v45 aggregatedAppLaunchData:v46 bundleIdToCompanionBundleId:v47 assetDescriptors:v48 otherParameters:v49 semanticType:v50];
    }
    long long v42 = 0;
  }

  return v42;
}

uint64_t __183__ATXFaceGalleryLayoutGenerator__generateSectionWithWidgetDescriptorsAdditionalData_aggregatedAppLaunchData_bundleIdToCompanionBundleId_assetDescriptors_otherParameters_semanticType___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 galleryOptions];
  uint64_t v3 = [v2 isOnlyEligibleForMadeForFocusSection] ^ 1;

  return v3;
}

- (id)_itemsFromDescriptors:(id)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6 shouldShowDisplayName:(BOOL)a7 shouldShowComplications:(BOOL)a8 limit:(id)a9
{
  BOOL v57 = a8;
  BOOL v53 = a7;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v47 = a9;
  uint64_t v17 = [(ATXFaceGalleryLayoutGenerator *)self _shuffledSuggestableComplicationSetsWithWidgetDescriptorsAdditionalData:v14 aggregatedAppLaunchData:v15 bundleIdToCompanionBundleId:v16];
  uint64_t v49 = v15;
  uint64_t v50 = v14;
  uint64_t v48 = v16;
  [(ATXFaceGalleryLayoutGeneratorComplicationProviding *)self->_complicationProvider landscapeModularSetsDictsWithWidgetDescriptorsAdditionalData:v14 aggregatedAppLaunchData:v15 bundleIdToCompanionBundleId:v16 portraitSets:v17];
  uint64_t v46 = v56 = self;
  uint64_t v18 = -[ATXFaceGalleryLayoutGenerator _landscapeSetsFromLandscapeSetsDict:](self, "_landscapeSetsFromLandscapeSetsDict:");
  id v19 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v13;
  uint64_t v54 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v54)
  {
    unint64_t v20 = 0;
    uint64_t v52 = *(void *)v59;
    id v55 = v18;
    do
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v59 != v52) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        BOOL v23 = v57
           && [(ATXFaceGalleryLayoutGenerator *)v56 _descriptorIsEligibleForComplications:*(void *)(*((void *)&v58 + 1) + 8 * i)];
        if ([v17 count]) {
          unint64_t v24 = v20 % [v17 count];
        }
        else {
          unint64_t v24 = 0;
        }
        if ([v18 count])
        {
          unint64_t v25 = v20 % [v18 count];
          if (!v23) {
            goto LABEL_20;
          }
        }
        else
        {
          unint64_t v25 = 0;
          if (!v23) {
            goto LABEL_20;
          }
        }
        if (![v17 count])
        {
LABEL_20:
          uint64_t v29 = 0;
          uint64_t v28 = 0;
          goto LABEL_32;
        }
        id v26 = [v22 galleryOptions];
        if ([v26 allowsSystemSuggestedComplications])
        {
          uint64_t v27 = [v17 count];

          if (v27)
          {
            uint64_t v28 = [v17 objectAtIndexedSubscript:v24];
            goto LABEL_23;
          }
        }
        else
        {
        }
        uint64_t v28 = 0;
LABEL_23:
        long long v30 = [v22 extensionBundleIdentifier];
        if ([v30 isEqualToString:@"com.apple.GradientPoster.GradientPosterExtension"])
        {

LABEL_26:
          id v33 = [v22 galleryOptions];
          if (![v33 allowsSystemSuggestedComplications]) {
            goto LABEL_30;
          }
          goto LABEL_27;
        }
        uint64_t v31 = [v22 extensionBundleIdentifier];
        int v32 = [v31 isEqualToString:@"com.apple.WallpaperKit.CollectionsPoster"];

        if (v32) {
          goto LABEL_26;
        }
        id v33 = [v22 galleryOptions];
        if (![v33 allowsSystemSuggestedComplicationsInLandscape])
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_27:
        uint64_t v34 = [v55 count];

        if (v34)
        {
          uint64_t v29 = [v55 objectAtIndexedSubscript:v25];
          goto LABEL_32;
        }
LABEL_31:
        uint64_t v29 = 0;
LABEL_32:
        uint64_t v35 = [(ATXFaceGalleryLayoutGenerator *)v56 _itemFromDescriptor:v22 shouldShowDisplayName:v53 shouldShowComplications:v57 systemSuggestedComplicationSet:v28 systemSuggestedLandscapeComplicationSet:v29];
        [v19 addObject:v35];
        uint64_t v36 = [v35 complications];
        uint64_t v37 = [v36 count];

        long long v38 = [v35 landscapeComplications];
        uint64_t v39 = v37 | [v38 count];

        if (v39) {
          ++v20;
        }

        uint64_t v18 = v55;
      }
      uint64_t v54 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
    }
    while (v54);
  }

  if (v47)
  {
    unint64_t v40 = [v19 count];
    unint64_t v41 = [v47 unsignedIntegerValue];
    if (v40 >= v41) {
      unint64_t v42 = v41;
    }
    else {
      unint64_t v42 = v40;
    }
    objc_msgSend(v19, "subarrayWithRange:", 0, v42);
    id v43 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v43 = v19;
  }
  uint64_t v44 = v43;

  return v44;
}

- (id)_itemFromDescriptor:(id)a3 shouldShowDisplayName:(BOOL)a4 shouldShowComplications:(BOOL)a5 systemSuggestedComplicationSet:(id)a6 systemSuggestedLandscapeComplicationSet:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  BOOL v39 = v10;
  if (v10)
  {
    id v15 = (void *)MEMORY[0x1E4F4AEF8];
    id v16 = [v12 extensionBundleIdentifier];
    unint64_t v42 = [v15 localizedNameForExtensionBundleId:v16];
  }
  else
  {
    unint64_t v42 = 0;
  }
  unint64_t v40 = v14;
  unint64_t v41 = v13;
  if (v9)
  {
    uint64_t v17 = [v13 complications];
    uint64_t v18 = [(ATXFaceGalleryLayoutGenerator *)self _modularComplicationsForDescriptor:v12 systemSuggestionComplications:v17];

    id v19 = [v14 complications];
    unint64_t v20 = [(ATXFaceGalleryLayoutGenerator *)self _modularLandscapeComplicationsForDescriptor:v12 systemSuggestionComplications:v19];

    uint64_t v21 = [(ATXFaceGalleryLayoutGenerator *)self _inlineComplicationForDescriptor:v12];
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v18 = 0;
    unint64_t v20 = 0;
  }
  id v22 = objc_alloc(MEMORY[0x1E4F4B030]);
  BOOL v23 = objc_opt_new();
  unint64_t v24 = [v23 UUIDString];
  unint64_t v25 = [v12 identifier];
  id v26 = [v12 extensionBundleIdentifier];
  uint64_t v27 = [MEMORY[0x1E4F4F6E0] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  uint64_t v28 = (void *)[v22 initWithIdentifier:v24 descriptorIdentifier:v25 extensionBundleIdentifier:v26 localizedDisplayName:v42 modeSemanticType:0 titleFontName:&stru_1F2740B58 titleColor:v27 subtitleComplication:v21 layoutType:0 complications:v18 landscapeComplications:v20];

  [v28 setSource:5];
  if (v39)
  {
    uint64_t v29 = [v12 galleryOptions];
    long long v30 = [v29 displayNameLocalizationKey];
    [v28 setDisplayNameLocalizationKey:v30];
  }
  else
  {
    [v28 setDisplayNameLocalizationKey:0];
  }
  uint64_t v31 = [v12 galleryOptions];
  int v32 = [v31 spokenNameLocalizationKey];
  [v28 setSpokenNameLocalizationKey:v32];

  id v33 = [v12 galleryOptions];
  uint64_t v34 = [v33 descriptiveTextLocalizationKey];
  [v28 setDescriptiveTextLocalizationKey:v34];

  uint64_t v35 = [v12 score];
  [v28 setScore:v35];

  uint64_t v36 = [v12 galleryOptions];
  objc_msgSend(v28, "setBlankTemplate:", objc_msgSend(v36, "isHero"));

  uint64_t v37 = [v12 galleryOptions];
  objc_msgSend(v28, "setShouldShowAsShuffleStack:", objc_msgSend(v37, "shouldShowAsShuffleStack"));

  return v28;
}

- (id)_inlineComplicationForDescriptor:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ATXComplicationSuggestionParameters *)self->_complicationParameters showPreviewsInPosterGallery])
  {
    uint64_t v5 = [v4 galleryOptions];
    id v6 = [v5 inlineComplication];

    if (v6)
    {
      uint64_t v7 = [v4 galleryOptions];
      id v8 = [v7 inlineComplication];
      BOOL v9 = [(ATXFaceGalleryLayoutGenerator *)self _complicationExistsOnSystem:v8];

      if (v9)
      {
        BOOL v10 = [v4 galleryOptions];
        id v11 = [v10 inlineComplication];
        id v12 = (void *)[v11 copy];

        [v12 setSource:5];
        goto LABEL_9;
      }
      id v13 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [v4 galleryOptions];
        id v15 = [v14 inlineComplication];
        int v17 = 138412290;
        uint64_t v18 = v15;
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Not showing complication since no matching chrono descriptor exists on system: %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  id v12 = 0;
LABEL_9:

  return v12;
}

- (id)_modularComplicationsForDescriptor:(id)a3 systemSuggestionComplications:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ATXComplicationSuggestionParameters *)self->_complicationParameters showPreviewsInPosterGallery])
  {
    id v8 = [v6 galleryOptions];
    BOOL v9 = [v8 modularComplications];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __98__ATXFaceGalleryLayoutGenerator__modularComplicationsForDescriptor_systemSuggestionComplications___block_invoke;
    v15[3] = &unk_1E68B5CE0;
    v15[4] = self;
    uint64_t v10 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", v15);
    id v11 = (void *)v10;
    if (v10) {
      id v12 = (void *)v10;
    }
    else {
      id v12 = v7;
    }
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

id __98__ATXFaceGalleryLayoutGenerator__modularComplicationsForDescriptor_systemSuggestionComplications___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) _complicationExistsOnSystem:v3])
  {
    id v4 = (void *)[v3 copy];
    [v4 setSource:5];
  }
  else
  {
    uint64_t v5 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Not showing preferred complication since no matching chrono descriptor exists on system: %@", (uint8_t *)&v7, 0xCu);
    }

    id v4 = 0;
  }

  return v4;
}

- (id)_modularLandscapeComplicationsForDescriptor:(id)a3 systemSuggestionComplications:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[ATXComplicationSuggestionParameters showPreviewsInPosterGallery](self->_complicationParameters, "showPreviewsInPosterGallery")&& [MEMORY[0x1E4F93B08] isiPad])
  {
    id v8 = [v6 galleryOptions];
    uint64_t v9 = [v8 modularLandscapeComplications];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __107__ATXFaceGalleryLayoutGenerator__modularLandscapeComplicationsForDescriptor_systemSuggestionComplications___block_invoke;
    v15[3] = &unk_1E68B5CE0;
    v15[4] = self;
    uint64_t v10 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", v15);
    id v11 = (void *)v10;
    if (v10) {
      id v12 = (void *)v10;
    }
    else {
      id v12 = v7;
    }
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

id __107__ATXFaceGalleryLayoutGenerator__modularLandscapeComplicationsForDescriptor_systemSuggestionComplications___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) _complicationExistsOnSystem:v3])
  {
    id v4 = (void *)[v3 copy];
    [v4 setSource:5];
  }
  else
  {
    uint64_t v5 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Not showing preferred landscape complication since no matching chrono descriptor exists on system: %@", (uint8_t *)&v7, 0xCu);
    }

    id v4 = 0;
  }

  return v4;
}

- (BOOL)_complicationExistsOnSystem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXFaceGalleryLayoutGeneratorComplicationDescriptorProviding *)self->_complicationDescriptorProvider allWidgetDescriptorsAllowedOnLockscreen];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__ATXFaceGalleryLayoutGenerator__complicationExistsOnSystem___block_invoke;
  v9[3] = &unk_1E68B5D08;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v9);

  return v7;
}

uint64_t __61__ATXFaceGalleryLayoutGenerator__complicationExistsOnSystem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 extensionBundleIdentifier];
  uint64_t v5 = [*(id *)(a1 + 32) extensionBundleIdentifier];
  if ([v4 isEqualToString:v5])
  {
    id v6 = [v3 kind];
    char v7 = [*(id *)(a1 + 32) kind];
    if ([v6 isEqualToString:v7])
    {
      [v3 supportedFamilies];
      [*(id *)(a1 + 32) widgetFamily];
      uint64_t v8 = CHSWidgetFamilyMaskContainsFamily();
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_shuffledSuggestableComplicationSetsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = -[ATXFaceGalleryLayoutGeneratorComplicationProviding modularSetsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](self->_complicationProvider, "modularSetsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v8, v9, v10, 0);
  id v13 = objc_msgSend(v12, "_pas_shuffledArrayUsingRng:", 0);

  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        [v11 addObject:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  uint64_t v18 = (void *)[v11 copy];
  return v18;
}

- (id)_landscapeSetsFromLandscapeSetsDict:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v53 = (id)objc_opt_new();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v56 = *(void *)v58;
    uint64_t v55 = *MEMORY[0x1E4F4AD78];
    uint64_t v8 = *MEMORY[0x1E4F4AD70];
    uint64_t v9 = *MEMORY[0x1E4F4AD68];
    id v52 = v4;
    do
    {
      uint64_t v10 = 0;
      int v54 = v7;
      do
      {
        if (*(void *)v58 != v56) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v57 + 1) + 8 * v10);
        id v12 = [v11 objectForKeyedSubscript:v55];
        id v13 = [v12 complications];

        uint64_t v14 = [v11 objectForKeyedSubscript:v8];
        uint64_t v15 = [v14 complications];

        uint64_t v16 = [v11 objectForKeyedSubscript:v9];
        int v17 = [v16 complications];

        if ([v13 count] == 2 && objc_msgSend(v15, "count") == 2 && objc_msgSend(v17, "count") == 4)
        {
          uint64_t v18 = objc_opt_new();
          switch(v54 + v10)
          {
            case 0:
              uint64_t v19 = [v17 objectAtIndexedSubscript:0];
              [v18 addObject:v19];

              long long v20 = [v17 objectAtIndexedSubscript:1];
              [v18 addObject:v20];

              long long v21 = [v13 objectAtIndexedSubscript:0];
              [v18 addObject:v21];

              long long v22 = [v17 objectAtIndexedSubscript:2];
              [v18 addObject:v22];

              long long v23 = [v17 objectAtIndexedSubscript:3];
              [v18 addObject:v23];

              unint64_t v24 = [v15 objectAtIndexedSubscript:0];
              [v18 addObject:v24];

              uint64_t v25 = v13;
              uint64_t v26 = 1;
              goto LABEL_15;
            case 1:
              uint64_t v27 = [v17 objectAtIndexedSubscript:0];
              [v18 addObject:v27];

              uint64_t v28 = [v17 objectAtIndexedSubscript:1];
              [v18 addObject:v28];

              uint64_t v29 = [v17 objectAtIndexedSubscript:2];
              [v18 addObject:v29];

              long long v30 = [v17 objectAtIndexedSubscript:3];
              [v18 addObject:v30];

              uint64_t v31 = [v15 objectAtIndexedSubscript:0];
              [v18 addObject:v31];

              int v32 = [v15 objectAtIndexedSubscript:1];
              [v18 addObject:v32];

              id v33 = v13;
              uint64_t v34 = 0;
              goto LABEL_13;
            case 2:
              uint64_t v35 = [v17 objectAtIndexedSubscript:0];
              [v18 addObject:v35];

              uint64_t v36 = [v17 objectAtIndexedSubscript:1];
              [v18 addObject:v36];

              uint64_t v37 = [v15 objectAtIndexedSubscript:0];
              [v18 addObject:v37];

              long long v38 = [v13 objectAtIndexedSubscript:0];
              [v18 addObject:v38];

              BOOL v39 = [v17 objectAtIndexedSubscript:2];
              [v18 addObject:v39];

              unint64_t v40 = [v17 objectAtIndexedSubscript:3];
              [v18 addObject:v40];

              id v33 = v15;
              uint64_t v34 = 1;
LABEL_13:
              unint64_t v41 = [v33 objectAtIndexedSubscript:v34];
              unint64_t v42 = v13;
              goto LABEL_16;
            case 3:
              id v43 = [v13 objectAtIndexedSubscript:0];
              [v18 addObject:v43];

              uint64_t v44 = [v13 objectAtIndexedSubscript:1];
              [v18 addObject:v44];

              uint64_t v45 = [v17 objectAtIndexedSubscript:0];
              [v18 addObject:v45];

              uint64_t v46 = [v17 objectAtIndexedSubscript:1];
              [v18 addObject:v46];

              id v47 = [v17 objectAtIndexedSubscript:2];
              [v18 addObject:v47];

              uint64_t v48 = [v17 objectAtIndexedSubscript:3];
              [v18 addObject:v48];

              uint64_t v25 = v15;
              uint64_t v26 = 0;
LABEL_15:
              unint64_t v41 = [v25 objectAtIndexedSubscript:v26];
              unint64_t v42 = v15;
LABEL_16:
              [v18 addObject:v41];

              uint64_t v49 = [v42 objectAtIndexedSubscript:1];
              [v18 addObject:v49];

              break;
            default:
              break;
          }
          uint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F4AF58]) initWithComplications:v18];
          [v53 addObject:v50];

          id v4 = v52;
        }

        ++v10;
      }
      while (v6 != v10);
      int v7 = v54 + v6;
      uint64_t v6 = [v4 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v6);
  }

  return v53;
}

- (BOOL)_descriptorIsEligibleForComplications:(id)a3
{
  parameters = self->_parameters;
  id v4 = a3;
  uint64_t v5 = [(ATXFaceSuggestionParameters *)parameters extensionBundleIdsEligibleForComplicationsInFaceGallery];
  uint64_t v6 = [v4 extensionBundleIdentifier];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (id)_localizedTitleForWeatherAndAstronomySection
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"FACE_GALLERY_SECTION_TITLE_WEATHER_AND_ASTRONOMY" value:&stru_1F2740B58 table:0];

  if (([MEMORY[0x1E4F4AF00] isInstalledForBundle:@"com.apple.weather"] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"FACE_GALLERY_SECTION_TITLE_ASTRONOMY_ONLY" value:&stru_1F2740B58 table:0];

    id v3 = (void *)v5;
  }
  return v3;
}

- (id)_localizedTitleforOSVersionSection
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"FACE_GALLERY_SECTION_TITLE_IOS_VERSION" value:&stru_1F2740B58 table:0];

  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"FACE_GALLERY_SECTION_TITLE_IPADOS_VERSION" value:&stru_1F2740B58 table:0];

    id v3 = (void *)v5;
  }
  return v3;
}

- (id)_localizedTitleTextWithSemanticType:(int64_t)a3
{
  switch(a3)
  {
    case 6:
      uint64_t v3 = [(ATXFaceGalleryLayoutGenerator *)self _localizedTitleForWeatherAndAstronomySection];
      goto LABEL_12;
    case 7:
      uint64_t v5 = (void *)MEMORY[0x1E4F4AEF8];
      uint64_t v6 = @"com.apple.WatchFacesWallpaperSupport.KaleidoscopePoster";
      goto LABEL_11;
    case 8:
      uint64_t v5 = (void *)MEMORY[0x1E4F4AEF8];
      uint64_t v6 = @"com.apple.EmojiPoster.EmojiPosterExtension";
      goto LABEL_11;
    case 9:
      int v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v4 = [v7 localizedStringForKey:@"FACE_GALLERY_SECTION_TITLE_UNITY" value:&stru_1F2740B58 table:0];

      break;
    case 10:
      uint64_t v5 = (void *)MEMORY[0x1E4F4AEF8];
      uint64_t v6 = @"com.apple.PridePoster.PridePosterExtension";
      goto LABEL_11;
    case 11:
      uint64_t v3 = [(ATXFaceGalleryLayoutGenerator *)self _localizedTitleforOSVersionSection];
      goto LABEL_12;
    case 12:
      uint64_t v5 = (void *)MEMORY[0x1E4F4AEF8];
      uint64_t v6 = @"com.apple.WallpaperKit.CollectionsPoster";
      goto LABEL_11;
    case 13:
      uint64_t v5 = (void *)MEMORY[0x1E4F4AEF8];
      uint64_t v6 = @"com.apple.GradientPoster.GradientPosterExtension";
LABEL_11:
      uint64_t v3 = [v5 localizedNameForExtensionBundleId:v6];
LABEL_12:
      id v4 = (__CFString *)v3;
      break;
    default:
      id v4 = &stru_1F2740B58;
      break;
  }
  return v4;
}

- (id)_localizedSubtitleTextWithSemanticType:(int64_t)a3
{
  uint64_t v3 = &stru_1F2740B58;
  switch(a3)
  {
    case 6:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v5 = v4;
      uint64_t v6 = @"FACE_GALLERY_SECTION_SUBTITLE_WEATHER_AND_ASTRONOMY";
      goto LABEL_6;
    case 9:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v5 = v4;
      uint64_t v6 = @"FACE_GALLERY_SECTION_SUBTITLE_UNITY";
      goto LABEL_6;
    case 10:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v5 = v4;
      uint64_t v6 = @"FACE_GALLERY_SECTION_SUBTITLE_PRIDE";
      goto LABEL_6;
    case 11:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v5 = v4;
      uint64_t v6 = @"FACE_GALLERY_SECTION_SUBTITLE_OS_VERSION";
LABEL_6:
      uint64_t v3 = [v4 localizedStringForKey:v6 value:&stru_1F2740B58 table:0];

      break;
    default:
      break;
  }
  return v3;
}

- (BOOL)shouldAddDescriptorFromExtension:(id)a3 descriptorIdentifierInAsset:(id)a4 withSemanticType:(int64_t)a5 assetParametersToFilterOut:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v12;
  switch(a5)
  {
    case 12:
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v16 = v12;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v16);
            }
            if (-[ATXFaceGalleryLayoutGenerator isDescriptor:availableInAssetParameter:](self, "isDescriptor:availableInAssetParameter:", v10, *(void *)(*((void *)&v24 + 1) + 8 * i), (void)v24))
            {

              goto LABEL_19;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      break;
    case 11:
      long long v22 = [v10 identifier];
      char v21 = [v22 hasPrefix:v11];

      goto LABEL_20;
    case 6:
      uint64_t v14 = [v10 extensionBundleIdentifier];
      int v15 = [v14 isEqualToString:@"com.apple.weather.poster"];

      if (v15)
      {
        if (([MEMORY[0x1E4F4AF00] isInstalledForBundle:@"com.apple.weather"] & 1) == 0)
        {
LABEL_19:
          char v21 = 0;
          goto LABEL_20;
        }
      }
      break;
  }
  char v21 = 1;
LABEL_20:

  return v21;
}

- (id)descriptorsToRemoveFromSectionWithSemanticType:(int64_t)a3 parameters:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (a3 == 12)
  {
    uint64_t v7 = [v5 descriptorsToRemoveFromCollections];
    uint64_t v8 = (void *)v7;
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
    if (v7) {
      id v10 = (void *)v7;
    }
    else {
      id v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v11 = v10;

    uint64_t v12 = [v6 osVersionSectionDescriptors];
    id v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = (void *)v12;
    }
    else {
      uint64_t v14 = v9;
    }
    id v15 = v14;

    id v16 = [MEMORY[0x1E4F1CA80] setWithArray:v11];
    uint64_t v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];

    [v16 unionSet:v17];
  }
  else
  {
    id v16 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v16;
}

- (BOOL)isDescriptorFromGalleryItem:(id)a3 availableInAssetParameter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 extensionBundleIdentifier];
  uint64_t v8 = [v6 componentsSeparatedByString:@":"];
  uint64_t v9 = [v8 firstObject];
  if ([v7 isEqualToString:v9])
  {
    id v10 = [v5 descriptorIdentifier];
    id v11 = [v6 componentsSeparatedByString:@":"];
    uint64_t v12 = [v11 lastObject];
    char v13 = [v10 hasPrefix:v12];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)isDescriptor:(id)a3 availableInAssetParameter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 extensionBundleIdentifier];
  uint64_t v8 = [v6 componentsSeparatedByString:@":"];
  uint64_t v9 = [v8 firstObject];
  if ([v7 isEqualToString:v9])
  {
    id v10 = [v5 identifier];
    id v11 = [v6 componentsSeparatedByString:@":"];
    uint64_t v12 = [v11 lastObject];
    char v13 = [v10 hasPrefix:v12];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)shouldRemoveDescriptorFromFeatured:(id)a3 withDescriptorsToRemove:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (-[ATXFaceGalleryLayoutGenerator isDescriptor:availableInAssetParameter:](self, "isDescriptor:availableInAssetParameter:", v6, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (NSArray)candidateFeaturedDescriptors
{
  return self->_candidateFeaturedDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateFeaturedDescriptors, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_complicationParameters, 0);
  objc_storeStrong((id *)&self->_nonHeroDescriptorsByExtensionBundleId, 0);
  objc_storeStrong((id *)&self->_allNonHeroDescriptors, 0);
  objc_storeStrong((id *)&self->_allHeroDescriptors, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_complicationDescriptorProvider, 0);
  objc_storeStrong((id *)&self->_complicationProvider, 0);
}

- (void)generatedConfigurationWithWidgetDescriptorsAdditionalData:(uint64_t)a3 aggregatedAppLaunchData:(uint64_t)a4 bundleIdToCompanionBundleId:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_generatedHeroSectionWithWidgetDescriptorsAdditionalData:(void *)a1 aggregatedAppLaunchData:(NSObject *)a2 bundleIdToCompanionBundleId:heroSectionOrder:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 allKeys];
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "%s: missing descriptors from hero section order: %@", (uint8_t *)v4, 0x16u);
}

- (void)_generatedHeroSectionWithWidgetDescriptorsAdditionalData:(uint64_t)a3 aggregatedAppLaunchData:(uint64_t)a4 bundleIdToCompanionBundleId:(uint64_t)a5 heroSectionOrder:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_generatedFeaturedSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "%s: not enough day zero descriptors were provided: %@", (uint8_t *)v1, 0x16u);
}

- (void)_generateSectionWithWidgetDescriptorsAdditionalData:(uint64_t)a3 aggregatedAppLaunchData:(uint64_t)a4 bundleIdToCompanionBundleId:(uint64_t)a5 assetDescriptors:(uint64_t)a6 otherParameters:(uint64_t)a7 semanticType:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end