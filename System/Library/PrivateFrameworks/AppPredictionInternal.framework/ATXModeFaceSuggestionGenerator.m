@interface ATXModeFaceSuggestionGenerator
- (ATXModeFaceSuggestionGenerator)init;
- (ATXSuggestedPagesTunableConstants)tunableConstants;
- (NSDictionary)appLaunchCounts;
- (NSSet)suggestedApps;
- (id)_facesForModeType:(int64_t)a3 modeUUID:(id)a4 allDescriptors:(id)a5;
- (id)_firstDescriptorWithExtension:(id)a3 focus:(int64_t)a4 allDescriptors:(id)a5;
- (id)_firstDescriptorWithExtension:(id)a3 identifier:(id)a4 allDescriptors:(id)a5;
- (id)_firstPhotosDescriptorMatchingSubtype:(int64_t)a3 allDescriptors:(id)a4;
- (id)_posterCandidatesForModeType:(int64_t)a3 allDescriptors:(id)a4;
- (id)facesForMode:(id)a3 allDescriptors:(id)a4;
- (id)generateFacesFromDescriptors:(id)a3;
- (void)generateAndCacheFacesFromDescriptors:(id)a3;
@end

@implementation ATXModeFaceSuggestionGenerator

- (ATXModeFaceSuggestionGenerator)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXModeFaceSuggestionGenerator;
  v2 = [(ATXModeFaceSuggestionGenerator *)&v7 init];
  if (v2)
  {
    v3 = objc_opt_new();
    uint64_t v4 = [v3 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps];
    appLaunchCounts = v2->_appLaunchCounts;
    v2->_appLaunchCounts = (NSDictionary *)v4;
  }
  return v2;
}

- (id)generateFacesFromDescriptors:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [&unk_1F27F39C0 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v17;
    char v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(&unk_1F27F39C0);
        }
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4B048]), "initWithType:uuid:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "integerValue"), 0);
        v12 = [(ATXModeFaceSuggestionGenerator *)self facesForMode:v11 allDescriptors:v3];
        v13 = objc_msgSend(v12, "bs_firstObjectPassingTest:", &__block_literal_global_236);
        if (v13 || ([v12 lastObject], (v13 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          if (v9)
          {
            uint64_t v7 = [v12 count] - 1;
            [v4 addObjectsFromArray:v12];
          }
          else
          {
            if (v7 >= 1)
            {
              [v4 removeObjectAtIndex:0];
              --v7;
            }
            [v4 addObject:v13];
          }

          char v9 = 0;
        }
      }
      uint64_t v6 = [&unk_1F27F39C0 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

uint64_t __63__ATXModeFaceSuggestionGenerator_generateFacesFromDescriptors___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPreferredForGallery];
}

- (void)generateAndCacheFacesFromDescriptors:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v6 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXModeFaceSuggestionGenerator: starting generation of mode faces", buf, 2u);
  }

  id v7 = objc_alloc_init(MEMORY[0x1E4F4B188]);
  [v7 evictCachedSuggestedFaces];
  uint64_t v8 = [MEMORY[0x1E4F4AF78] sharedInstance];
  char v9 = [v8 configuredModes];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__ATXModeFaceSuggestionGenerator_generateAndCacheFacesFromDescriptors___block_invoke;
  v13[3] = &unk_1E68B5E70;
  v13[4] = self;
  id v14 = v4;
  id v10 = v4;
  [v9 enumerateKeysAndObjectsUsingBlock:v13];

  v11 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v12 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    double v16 = v12 - Current;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "ATXModeFaceSuggestionGenerator: finished generation of mode faces in %f seconds", buf, 0xCu);
  }
}

void __71__ATXModeFaceSuggestionGenerator_generateAndCacheFacesFromDescriptors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1D25F6CC0]();
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = DNDModeSemanticTypeToSuggestedFaceType([v5 semanticType]);
  char v9 = [v11 UUIDString];
  id v10 = (id)[v7 _facesForModeType:v8 modeUUID:v9 allDescriptors:*(void *)(a1 + 40)];
}

- (id)facesForMode:(id)a3 allDescriptors:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [v7 type];
  char v9 = [v7 uuid];

  uint64_t v10 = [v9 length];
  if (v8)
  {
    if (v10)
    {
LABEL_14:
      long long v18 = [(ATXModeFaceSuggestionGenerator *)self _facesForModeType:v8 modeUUID:v9 allDescriptors:v6];
      goto LABEL_19;
    }
    id v11 = [MEMORY[0x1E4F4AF78] sharedInstance];
    CFAbsoluteTime v12 = v11;
    if (v8 >= 0xC) {
      unint64_t v13 = 0;
    }
    else {
      unint64_t v13 = v8 - 2;
    }
    id v14 = [v11 dndModeUUIDForDNDModeSemanticType:v13];

    if (v14)
    {
      uint64_t v15 = [v14 UUIDString];

      char v9 = (void *)v15;
LABEL_12:

      goto LABEL_14;
    }
  }
  else if (v10)
  {
    if (![v9 length])
    {
      unint64_t v8 = 0;
      goto LABEL_14;
    }
    double v16 = [MEMORY[0x1E4F4AF78] sharedInstance];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v9];
    id v14 = [v16 dndModeForDNDModeWithUUID:v17];

    if (v14)
    {
      unint64_t v8 = DNDModeSemanticTypeToSuggestedFaceType([v14 semanticType]);
      goto LABEL_12;
    }
    long long v19 = __atxlog_handle_modes();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ATXModeFaceSuggestionGenerator facesForMode:allDescriptors:]((uint64_t)v9, v19);
    }
  }
  long long v18 = 0;
LABEL_19:

  return v18;
}

- (id)_facesForModeType:(int64_t)a3 modeUUID:(id)a4 allDescriptors:(id)a5
{
  v49[5] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v36 = a5;
  if (!v9)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"ATXModeFaceSuggestionGenerator.m", 176, @"Invalid parameter not satisfying: %@", @"modeUUID" object file lineNumber description];
  }
  uint64_t v10 = objc_alloc_init(ATXModeFaceComplicationsAggregator);
  v35 = [(ATXModeFaceComplicationsAggregator *)v10 provideComplicationsForSuggestedFaceType:a3 environment:self];
  v34 = [(ATXModeFaceComplicationsAggregator *)v10 provideLandscapeComplicationsForSuggestedFaceType:a3 environment:self];
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = 0;
  id v11 = objc_opt_new();
  v49[0] = v11;
  CFAbsoluteTime v12 = objc_opt_new();
  v49[1] = v12;
  unint64_t v13 = objc_opt_new();
  v49[2] = v13;
  id v14 = objc_opt_new();
  v49[3] = v14;
  uint64_t v15 = objc_opt_new();
  v49[4] = v15;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:5];

  if ((unint64_t)(a3 - 1) >= 0xB) {
    int64_t v17 = 0;
  }
  else {
    int64_t v17 = a3 - 2;
  }
  long long v18 = [(ATXModeFaceSuggestionGenerator *)self _posterCandidatesForModeType:v17 allDescriptors:v36];
  if (v18)
  {
    long long v19 = DNDModeLocalizedNameForSemanticType();
    v20 = [MEMORY[0x1E4F4F6E0] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    uint64_t v21 = objc_opt_new();
    v22 = objc_opt_new();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __76__ATXModeFaceSuggestionGenerator__facesForModeType_modeUUID_allDescriptors___block_invoke;
    v37[3] = &unk_1E68B5E98;
    id v23 = v22;
    id v38 = v23;
    id v24 = v21;
    id v39 = v24;
    v46 = v48;
    id v40 = v16;
    int64_t v47 = v17;
    id v25 = v20;
    id v41 = v25;
    id v26 = v9;
    id v42 = v26;
    id v27 = v19;
    id v43 = v27;
    id v44 = v34;
    id v45 = v35;
    [v18 enumerateObjectsWithOptions:2 usingBlock:v37];
    if ([v24 count])
    {
      id v28 = objc_alloc_init(MEMORY[0x1E4F4B188]);
      v29 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v26];
      [v28 cacheSuggestedFaces:v24 forModeUUID:v29];
    }
    v30 = v45;
    id v31 = v24;
  }
  else
  {
    id v31 = 0;
  }

  _Block_object_dispose(v48, 8);
  return v31;
}

void __76__ATXModeFaceSuggestionGenerator__facesForModeType_modeUUID_allDescriptors___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v37 = a2;
  id v7 = [v37 descriptor];
  unint64_t v8 = [v7 extensionBundleIdentifier];
  if ([v8 isEqualToString:@"com.apple.mobileslideshow.PhotosPosterProvider"])
  {
  }
  else
  {
    int v9 = [v8 isEqualToString:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"];

    if (!v9) {
      goto LABEL_5;
    }
  }
  if ([*(id *)(a1 + 32) bundleIdIsLockedOrHiddenByUserPreference:@"com.apple.mobileslideshow"]) {
    goto LABEL_18;
  }
LABEL_5:
  if ((unint64_t)[*(id *)(a1 + 40) count] >= 3
    || (unint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), v10 >= [*(id *)(a1 + 48) count]))
  {
    *a4 = 1;
    goto LABEL_18;
  }
  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"mode-%ld-%ld", *(void *)(a1 + 104), a3);
  CFAbsoluteTime v12 = (void *)MEMORY[0x1E4F4AEF8];
  unint64_t v13 = [v37 descriptor];
  id v14 = [v13 extensionBundleIdentifier];
  uint64_t v15 = [v12 localizedNameForExtensionBundleId:v14];

  id v16 = objc_alloc(MEMORY[0x1E4F4B030]);
  int64_t v17 = [v37 descriptor];
  long long v18 = [v17 identifier];
  long long v19 = [v37 descriptor];
  v20 = [v19 extensionBundleIdentifier];
  uint64_t v21 = [NSNumber numberWithInteger:*(void *)(a1 + 104)];
  v22 = [v37 fontName];
  id v23 = (void *)[v16 initWithIdentifier:v11 descriptorIdentifier:v18 extensionBundleIdentifier:v20 localizedDisplayName:v15 modeSemanticType:v21 titleFontName:v22 titleColor:*(void *)(a1 + 56) subtitleComplication:0 layoutType:0 complications:0 landscapeComplications:0];

  [v23 setModeUUID:*(void *)(a1 + 64)];
  objc_msgSend(v23, "setIsPreferredForGallery:", objc_msgSend(v37, "isPreferredForGallery"));
  [v23 setLocalizedSubtitle:*(void *)(a1 + 72)];
  [v23 setSource:6];
  id v24 = [v37 descriptor];
  id v25 = [v24 galleryOptions];
  if ([v25 allowsSystemSuggestedComplications])
  {
  }
  else
  {
    id v26 = [v37 descriptor];
    id v27 = [v26 galleryOptions];
    id v28 = [v27 modularComplications];
    uint64_t v29 = [v28 count];

    if (!v29) {
      goto LABEL_12;
    }
  }
  v30 = [v37 descriptor];
  id v31 = [v30 extensionBundleIdentifier];
  char v32 = [v31 isEqualToString:@"com.apple.EmojiPoster.EmojiPosterExtension"];

  if ((v32 & 1) == 0)
  {
    v34 = 0;
    do
    {
      v33 = [*(id *)(a1 + 48) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];

      v35 = objc_opt_new();
      [v35 assignComplicationsFromCandidates:*(void *)(a1 + 80) forSuggestedFace:v23];
      unint64_t v36 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      if (v36 < [*(id *)(a1 + 48) count] - 1) {
        ++*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      }

      v34 = v33;
    }
    while (([v33 assignComplicationsFromCandidates:*(void *)(a1 + 88) forSuggestedFace:v23] & 1) == 0);
    goto LABEL_17;
  }
LABEL_12:
  v33 = objc_opt_new();
  [v33 assignComplicationsFromCandidates:*(void *)(a1 + 88) forSuggestedFace:v23];
LABEL_17:

  [*(id *)(a1 + 40) insertObject:v23 atIndex:0];
LABEL_18:
}

- (id)_firstDescriptorWithExtension:(id)a3 identifier:(id)a4 allDescriptors:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = a5;
  id v10 = (id)[v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "galleryOptions", (void)v22);
        char v15 = [v14 isHero];

        if ((v15 & 1) == 0)
        {
          if ([v8 length])
          {
            id v16 = [v13 extensionBundleIdentifier];
            if ([v16 isEqualToString:v7])
            {
              int64_t v17 = [v13 identifier];
              char v18 = [v17 hasPrefix:v8];

              if (v18) {
                goto LABEL_17;
              }
            }
            else
            {
            }
          }
          if (![v8 length])
          {
            long long v19 = [v13 extensionBundleIdentifier];
            char v20 = [v19 isEqualToString:v7];

            if (v20)
            {
LABEL_17:
              id v10 = v13;
              goto LABEL_18;
            }
          }
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v10;
}

- (id)_firstDescriptorWithExtension:(id)a3 focus:(int64_t)a4 allDescriptors:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = a5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v8) {
    goto LABEL_14;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(v7);
      }
      CFAbsoluteTime v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      unint64_t v13 = [v12 extensionBundleIdentifier];
      if (![v13 isEqualToString:v6]) {
        goto LABEL_11;
      }
      id v14 = [v12 galleryOptions];
      if (([v14 isOnlyEligibleForMadeForFocusSection] & 1) == 0)
      {

LABEL_11:
        continue;
      }
      char v15 = [v12 galleryOptions];
      uint64_t v16 = [v15 focus];

      if (v16 == a4)
      {
        id v17 = v12;
        goto LABEL_15;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v9);
LABEL_14:
  id v17 = 0;
LABEL_15:

  return v17;
}

- (id)_firstPhotosDescriptorMatchingSubtype:(int64_t)a3 allDescriptors:(id)a4
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__ATXModeFaceSuggestionGenerator__firstPhotosDescriptorMatchingSubtype_allDescriptors___block_invoke;
  v9[3] = &__block_descriptor_40_e29_B16__0__ATXPosterDescriptor_8l;
  v9[4] = a3;
  id v4 = objc_msgSend(a4, "_pas_filteredSetWithTest:", v9);
  id v5 = [v4 allObjects];
  id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_93_1];

  id v7 = [v6 firstObject];

  return v7;
}

uint64_t __87__ATXModeFaceSuggestionGenerator__firstPhotosDescriptorMatchingSubtype_allDescriptors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 galleryOptions];
  uint64_t v5 = [v4 photoSubtype];
  uint64_t v6 = *(void *)(a1 + 32);

  if (v5 == v6)
  {
    id v7 = [v3 galleryOptions];
    int v8 = [v7 shouldShowAsShuffleStack];

    uint64_t v9 = v8 ^ 1u;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __87__ATXModeFaceSuggestionGenerator__firstPhotosDescriptorMatchingSubtype_allDescriptors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a2;
  uint64_t v6 = [a3 galleryOptions];
  id v7 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v6, "featuredConfidenceLevel"));
  int v8 = NSNumber;
  uint64_t v9 = [v5 galleryOptions];

  uint64_t v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "featuredConfidenceLevel"));
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

- (id)_posterCandidatesForModeType:(int64_t)a3 allDescriptors:(id)a4
{
  id v6 = a4;
  id v7 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke;
  aBlock[3] = &unk_1E68B5EE0;
  id v8 = v7;
  id v43 = v8;
  uint64_t v9 = _Block_copy(aBlock);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke_2;
  v39[3] = &unk_1E68B5F08;
  id v10 = v9;
  id v41 = v10;
  v39[4] = self;
  id v11 = v6;
  id v40 = v11;
  CFAbsoluteTime v12 = (void (**)(void *, __CFString *, __CFString *, __CFString *, uint64_t))_Block_copy(v39);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke_3;
  v36[3] = &unk_1E68B5F30;
  id v13 = v10;
  id v38 = v13;
  v36[4] = self;
  id v14 = v11;
  id v37 = v14;
  char v15 = (uint64_t (**)(void *, __CFString *, uint64_t, __CFString *, void))_Block_copy(v36);
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  id v31 = __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke_4;
  char v32 = &unk_1E68B5F58;
  id v16 = v13;
  id v35 = v16;
  v33 = self;
  id v17 = v14;
  id v34 = v17;
  char v18 = _Block_copy(&v29);
  long long v19 = (uint64_t (**)(void, void, void, void))v18;
  int64_t v20 = a3 + 1;
  id v21 = 0;
  switch(v20)
  {
    case 0:
    case 1:
    case 3:
    case 10:
      break;
    case 2:
      v12[2](v12, @"com.apple.NanoUniverse.AegirProxyApp.AegirPoster", @"V02-Moon", &stru_1F2740B58, 1);
      if ((v15[2](v15, @"com.apple.EmojiPoster.EmojiPosterExtension", 2, &stru_1F2740B58, 0) & 1) == 0) {
        v12[2](v12, @"com.apple.EmojiPoster.EmojiPosterExtension", &stru_1F2740B58, &stru_1F2740B58, 0);
      }
      if (v15[2](v15, @"com.apple.GradientPoster.GradientPosterExtension", 2, &stru_1F2740B58, 0)) {
        goto LABEL_48;
      }
      goto LABEL_47;
    case 4:
      if (((*((uint64_t (**)(void *, uint64_t, __CFString *, uint64_t))v18 + 2))(v18, 3, &stru_1F2740B58, 1) & 1) == 0&& (v15[2](v15, @"com.apple.WallpaperKit.CollectionsPoster", 4, &stru_1F2740B58, 1) & 1) == 0&& (((uint64_t (*)(void *, __CFString *, __CFString *, __CFString *, uint64_t))v12[2])(v12, @"com.apple.WallpaperKit.CollectionsPoster", @"7560", &stru_1F2740B58, 1) & 1) == 0)
      {
        v12[2](v12, @"com.apple.WallpaperKit.CollectionsPoster", @"7420", &stru_1F2740B58, 1);
      }
      if ((v15[2](v15, @"com.apple.EmojiPoster.EmojiPosterExtension", 4, &stru_1F2740B58, 0) & 1) == 0) {
        v12[2](v12, @"com.apple.EmojiPoster.EmojiPosterExtension", &stru_1F2740B58, &stru_1F2740B58, 0);
      }
      if ((v15[2](v15, @"com.apple.GradientPoster.GradientPosterExtension", 4, &stru_1F2740B58, 0) & 1) == 0) {
        v12[2](v12, @"com.apple.GradientPoster.GradientPosterExtension", @"green", &stru_1F2740B58, 0);
      }
      goto LABEL_48;
    case 5:
      int v23 = (*((uint64_t (**)(void *, uint64_t, __CFString *, uint64_t))v18 + 2))(v18, 4, &stru_1F2740B58, 1);
      if ((v23 & 1) == 0) {
        v12[2](v12, @"com.apple.weather.poster", @"weather-poster", &stru_1F2740B58, 0);
      }
      if ((v15[2](v15, @"com.apple.EmojiPoster.EmojiPosterExtension", 5, &stru_1F2740B58, v23 ^ 1u) & 1) == 0) {
        v12[2](v12, @"com.apple.EmojiPoster.EmojiPosterExtension", &stru_1F2740B58, &stru_1F2740B58, 0);
      }
      if ((v15[2](v15, @"com.apple.GradientPoster.GradientPosterExtension", 5, &stru_1F2740B58, 0) & 1) == 0) {
        v12[2](v12, @"com.apple.GradientPoster.GradientPosterExtension", @"red", &stru_1F2740B58, 0);
      }
      goto LABEL_48;
    case 6:
      if (((*((uint64_t (**)(void *, uint64_t, __CFString *, uint64_t))v18 + 2))(v18, 2, &stru_1F2740B58, 1) & 1) == 0&& (((uint64_t (**)(void, uint64_t, __CFString *, uint64_t))v19)[2](v19, 1, &stru_1F2740B58, 1) & 1) == 0&& (v15[2](v15, @"com.apple.WallpaperKit.CollectionsPoster", 6, &stru_1F2740B58, 1) & 1) == 0&& (((uint64_t (*)(void *, __CFString *, __CFString *, __CFString *, uint64_t))v12[2])(v12, @"com.apple.WallpaperKit.CollectionsPoster", @"7560", &stru_1F2740B58, 1) & 1) == 0)
      {
        v12[2](v12, @"com.apple.WallpaperKit.CollectionsPoster", @"7420", &stru_1F2740B58, 1);
      }
      if ((v15[2](v15, @"com.apple.EmojiPoster.EmojiPosterExtension", 6, &stru_1F2740B58, 0) & 1) == 0) {
        v12[2](v12, @"com.apple.EmojiPoster.EmojiPosterExtension", &stru_1F2740B58, &stru_1F2740B58, 0);
      }
      if ((v15[2](v15, @"com.apple.GradientPoster.GradientPosterExtension", 6, &stru_1F2740B58, 0) & 1) == 0) {
        v12[2](v12, @"com.apple.GradientPoster.GradientPosterExtension", @"pink", &stru_1F2740B58, 0);
      }
      goto LABEL_48;
    case 7:
      v12[2](v12, @"com.apple.weather.poster", @"weather-poster", @"PRTimeFontIdentifierNewYork", 0);
      int v24 = v15[2](v15, @"com.apple.EmojiPoster.EmojiPosterExtension", 7, @"PRTimeFontIdentifierNewYork", 1);
      if ((v24 & 1) == 0) {
        v12[2](v12, @"com.apple.EmojiPoster.EmojiPosterExtension", &stru_1F2740B58, @"PRTimeFontIdentifierNewYork", 0);
      }
      uint64_t v25 = v24 ^ 1u;
      if ((v15[2](v15, @"com.apple.GradientPoster.GradientPosterExtension", 7, @"PRTimeFontIdentifierNewYork", v25) & 1) == 0)v12[2](v12, @"com.apple.GradientPoster.GradientPosterExtension", @"yellow", @"PRTimeFontIdentifierNewYork", v25); {
      goto LABEL_48;
      }
    case 8:
      if ((v15[2](v15, @"com.apple.WallpaperKit.CollectionsPoster", 8, &stru_1F2740B58, 1) & 1) == 0) {
        v12[2](v12, @"com.apple.WallpaperKit.CollectionsPoster", @"7365", &stru_1F2740B58, 1);
      }
      if ((v15[2](v15, @"com.apple.EmojiPoster.EmojiPosterExtension", 8, &stru_1F2740B58, 1) & 1) == 0) {
        v12[2](v12, @"com.apple.EmojiPoster.EmojiPosterExtension", &stru_1F2740B58, &stru_1F2740B58, 0);
      }
      if ((v15[2](v15, @"com.apple.GradientPoster.GradientPosterExtension", 8, &stru_1F2740B58, 0) & 1) == 0) {
        v12[2](v12, @"com.apple.GradientPoster.GradientPosterExtension", @"blue", &stru_1F2740B58, 0);
      }
      goto LABEL_48;
    case 9:
      if ((v15[2](v15, @"com.apple.WallpaperKit.CollectionsPoster", 9, &stru_1F2740B58, 1) & 1) == 0) {
        v12[2](v12, @"com.apple.weather.poster", @"weather-poster", &stru_1F2740B58, 0);
      }
      if ((v15[2](v15, @"com.apple.EmojiPoster.EmojiPosterExtension", 9, &stru_1F2740B58, 0) & 1) == 0) {
        v12[2](v12, @"com.apple.EmojiPoster.EmojiPosterExtension", &stru_1F2740B58, &stru_1F2740B58, 0);
      }
      if ((v15[2](v15, @"com.apple.GradientPoster.GradientPosterExtension", 9, &stru_1F2740B58, 0) & 1) == 0) {
LABEL_47:
      }
        v12[2](v12, @"com.apple.GradientPoster.GradientPosterExtension", @"cyan", &stru_1F2740B58, 0);
LABEL_48:
      if (!objc_msgSend(v8, "count", v29, v30, v31, v32, v33) && objc_msgSend(v17, "count"))
      {
        id v26 = __atxlog_handle_modes();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[ATXModeFaceSuggestionGenerator _posterCandidatesForModeType:allDescriptors:](v26);
        }

        uint64_t v27 = [v17 anyObject];
        (*((void (**)(id, void *, __CFString *, void))v16 + 2))(v16, v27, &stru_1F2740B58, 0);
      }
      id v21 = v8;
      break;
    default:
      long long v22 = __atxlog_handle_modes();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        DNDModeSemanticTypeToSuggestedFaceType_cold_1(0, v22);
      }

      id v21 = 0;
      break;
  }

  return v21;
}

BOOL __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (a2)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = a3;
    id v9 = a2;
    if ([v7 count] == 3) {
      [*(id *)(a1 + 32) removeObjectAtIndex:0];
    }
    id v10 = [[_ATXModePosterCandidate alloc] initWithDescriptor:v9 fontName:v8 isPreferredForGallery:a4];

    [*(id *)(a1 + 32) insertObject:v10 atIndex:0];
  }
  return a2 != 0;
}

uint64_t __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v9 = a1[5];
  uint64_t v8 = a1[6];
  id v10 = (void *)a1[4];
  id v11 = a4;
  CFAbsoluteTime v12 = [v10 _firstDescriptorWithExtension:a2 identifier:a3 allDescriptors:v9];
  uint64_t v13 = (*(uint64_t (**)(uint64_t, void *, id, uint64_t))(v8 + 16))(v8, v12, v11, a5);

  return v13;
}

uint64_t __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke_3(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v9 = a1[5];
  uint64_t v8 = a1[6];
  id v10 = (void *)a1[4];
  id v11 = a4;
  CFAbsoluteTime v12 = [v10 _firstDescriptorWithExtension:a2 focus:a3 allDescriptors:v9];
  uint64_t v13 = (*(uint64_t (**)(uint64_t, void *, id, uint64_t))(v8 + 16))(v8, v12, v11, a5);

  return v13;
}

uint64_t __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke_4(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v8 = (void *)a1[4];
  id v9 = a3;
  id v10 = [v8 _firstPhotosDescriptorMatchingSubtype:a2 allDescriptors:v7];
  uint64_t v11 = (*(uint64_t (**)(uint64_t, void *, id, uint64_t))(v6 + 16))(v6, v10, v9, a4);

  return v11;
}

- (NSDictionary)appLaunchCounts
{
  return self->_appLaunchCounts;
}

- (NSSet)suggestedApps
{
  return self->_suggestedApps;
}

- (ATXSuggestedPagesTunableConstants)tunableConstants
{
  return self->_tunableConstants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tunableConstants, 0);
  objc_storeStrong((id *)&self->_suggestedApps, 0);
  objc_storeStrong((id *)&self->_appLaunchCounts, 0);
}

- (void)facesForMode:(uint64_t)a1 allDescriptors:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXModeFaceSuggestionGenerator: could not look up mode semantic type for UUID: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_posterCandidatesForModeType:(os_log_t)log allDescriptors:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXModeFaceSuggestionGenerator: falling back to any descriptor because no poster from heuristics is available", v1, 2u);
}

@end