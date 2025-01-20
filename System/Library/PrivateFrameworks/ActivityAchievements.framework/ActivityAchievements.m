uint64_t ACHTemplateIsMonthlyChallenge(void *a1)
{
  return ACHTemplateSourceNameIsEqualToIdentifier(a1, @"MonthlyChallenges");
}

uint64_t ACHTemplateIsRemote(void *a1)
{
  return ACHTemplateSourceNameIsEqualToIdentifier(a1, @"Remote");
}

id ACHYearMonthDayDateComponentsFromString(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = [v1 componentsSeparatedByString:@"-"];
    if ([v3 count] == 3)
    {
      id v4 = objc_alloc_init(MEMORY[0x263EFF918]);
      v5 = [v3 objectAtIndexedSubscript:0];
      objc_msgSend(v4, "setYear:", objc_msgSend(v5, "integerValue"));

      v6 = [v3 objectAtIndexedSubscript:1];
      objc_msgSend(v4, "setMonth:", objc_msgSend(v6, "integerValue"));

      v7 = [v3 objectAtIndexedSubscript:2];
      objc_msgSend(v4, "setDay:", objc_msgSend(v7, "integerValue"));

      if ([v4 year] && objc_msgSend(v4, "month") && objc_msgSend(v4, "day")) {
        goto LABEL_8;
      }
    }
    id v4 = 0;
LABEL_8:

    goto LABEL_10;
  }
  id v4 = 0;
LABEL_10:

  return v4;
}

id ACHDateComponentsForYearMonthDay(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v6 setYear:a1];
  [v6 setMonth:a2];
  [v6 setDay:a3];

  return v6;
}

id ACHYearMonthDayStringFromDateComponents(void *a1)
{
  if (a1)
  {
    v2 = NSString;
    id v3 = a1;
    uint64_t v4 = [v3 year];
    uint64_t v5 = [v3 month];
    uint64_t v6 = [v3 day];

    a1 = objc_msgSend(v2, "stringWithFormat:", @"%04ld-%02ld-%02ld", v4, v5, v6);
    uint64_t v1 = vars8;
  }
  return a1;
}

ACHCodableTemplate *ACHCodableFromTemplate(void *a1)
{
  id v1 = a1;
  v2 = objc_alloc_init(ACHCodableTemplate);
  -[ACHCodableTemplate setKey:](v2, "setKey:", [v1 key]);
  id v3 = [v1 uniqueName];
  uint64_t v4 = (void *)[v3 copy];
  [(ACHCodableTemplate *)v2 setUniqueName:v4];

  -[ACHCodableTemplate setVersion:](v2, "setVersion:", [v1 version]);
  -[ACHCodableTemplate setMinimumEngineVersion:](v2, "setMinimumEngineVersion:", [v1 minimumEngineVersion]);
  uint64_t v5 = [v1 createdDate];
  [v5 timeIntervalSinceReferenceDate];
  -[ACHCodableTemplate setCreatedDate:](v2, "setCreatedDate:");

  -[ACHCodableTemplate setCreatorDevice:](v2, "setCreatorDevice:", [v1 creatorDevice]);
  uint64_t v6 = [v1 sourceName];
  v7 = (void *)[v6 copy];
  [(ACHCodableTemplate *)v2 setSourceName:v7];

  v8 = [v1 predicate];
  v9 = (void *)[v8 copy];
  [(ACHCodableTemplate *)v2 setPredicate:v9];

  v10 = [v1 gracePredicate];
  v11 = (void *)[v10 copy];
  [(ACHCodableTemplate *)v2 setGracePredicate:v11];

  v12 = [v1 valueExpression];
  v13 = (void *)[v12 copy];
  [(ACHCodableTemplate *)v2 setValueExpression:v13];

  v14 = [v1 graceValueExpression];
  v15 = (void *)[v14 copy];
  [(ACHCodableTemplate *)v2 setGraceValueExpression:v15];

  v16 = [v1 progressExpression];
  v17 = (void *)[v16 copy];
  [(ACHCodableTemplate *)v2 setProgressExpression:v17];

  v18 = [v1 graceProgressExpression];
  v19 = (void *)[v18 copy];
  [(ACHCodableTemplate *)v2 setGraceProgressExpression:v19];

  v20 = [v1 goalExpression];
  v21 = (void *)[v20 copy];
  [(ACHCodableTemplate *)v2 setGoalExpression:v21];

  v22 = [v1 graceGoalExpression];
  v23 = (void *)[v22 copy];
  [(ACHCodableTemplate *)v2 setGraceGoalExpression:v23];

  -[ACHCodableTemplate setTriggers:](v2, "setTriggers:", [v1 triggers]);
  -[ACHCodableTemplate setEarnLimit:](v2, "setEarnLimit:", [v1 earnLimit]);
  v24 = [v1 visibilityPredicate];
  v25 = (void *)[v24 copy];
  [(ACHCodableTemplate *)v2 setVisibilityPredicate:v25];

  v26 = [v1 graceVisibilityPredicate];
  v27 = (void *)[v26 copy];
  [(ACHCodableTemplate *)v2 setGraceVisibilityPredicate:v27];

  v28 = [v1 visibilityStart];
  v29 = ACHYearMonthDayStringFromDateComponents(v28);
  [(ACHCodableTemplate *)v2 setVisibilityStartDate:v29];

  v30 = [v1 visibilityEnd];
  v31 = ACHYearMonthDayStringFromDateComponents(v30);
  [(ACHCodableTemplate *)v2 setVisibilityEndDate:v31];

  v32 = [v1 availabilityPredicate];
  v33 = (void *)[v32 copy];
  [(ACHCodableTemplate *)v2 setAvailabilityPredicate:v33];

  v34 = [v1 availabilityStart];
  v35 = ACHYearMonthDayStringFromDateComponents(v34);
  [(ACHCodableTemplate *)v2 setAvailabilityStartDate:v35];

  v36 = [v1 availabilityEnd];
  v37 = ACHYearMonthDayStringFromDateComponents(v36);
  [(ACHCodableTemplate *)v2 setAvailabilityEndDate:v37];

  v38 = [v1 availableCountryCodes];
  v40 = ACHTemplateAvailableCountryCodesStringFromStrings(v38, v39);
  [(ACHCodableTemplate *)v2 setAvailableCountryCodes:v40];

  v41 = [v1 alertabilityPredicate];
  v42 = (void *)[v41 copy];
  [(ACHCodableTemplate *)v2 setAlertabilityPredicate:v42];

  v43 = [v1 alertDates];
  v44 = ACHTemplateAlertDatesStringFromDates(v43);
  [(ACHCodableTemplate *)v2 setAlertDates:v44];

  -[ACHCodableTemplate setDuplicateRemovalStrategy:](v2, "setDuplicateRemovalStrategy:", [v1 duplicateRemovalStrategy]);
  -[ACHCodableTemplate setDuplicateRemovalCalendarUnit:](v2, "setDuplicateRemovalCalendarUnit:", [v1 duplicateRemovalCalendarUnit]);
  -[ACHCodableTemplate setEarnDateStrategy:](v2, "setEarnDateStrategy:", [v1 earnDateStrategy]);
  v45 = [v1 canonicalUnit];
  v46 = [v45 unitString];
  [(ACHCodableTemplate *)v2 setCanonicalUnit:v46];

  -[ACHCodableTemplate setDisplayOrder:](v2, "setDisplayOrder:", [v1 displayOrder]);
  -[ACHCodableTemplate setDisplaysEarnedInstanceCount:](v2, "setDisplaysEarnedInstanceCount:", [v1 displaysEarnedInstanceCount]);
  v47 = [v1 availableSuffixes];
  v49 = ACHTemplateAvailableSuffixesStringFromStrings(v47, v48);
  [(ACHCodableTemplate *)v2 setAvailableSuffixes:v49];

  -[ACHCodableTemplate setAvailableOnPairedDevice:](v2, "setAvailableOnPairedDevice:", [v1 availableOnPairedDevice]);
  -[ACHCodableTemplate setMobileAssetVersion:](v2, "setMobileAssetVersion:", [v1 mobileAssetVersion]);
  [v1 dailyTarget];
  -[ACHCodableTemplate setDailyTarget:](v2, "setDailyTarget:");
  v50 = [v1 dailyTargetCanonicalUnit];
  v51 = [v50 unitString];
  [(ACHCodableTemplate *)v2 setDailyTargetCanonicalUnit:v51];

  v52 = [v1 syncIdentity];

  if (v52)
  {
    v53 = objc_alloc_init(ACHCodableSyncIdentity);
    v54 = [v1 syncIdentity];
    v55 = [v54 hardwareIdentifier];
    [(ACHCodableSyncIdentity *)v53 setHardwareIdentifier:v55];

    v56 = [v1 syncIdentity];
    v57 = [v56 databaseIdentifier];
    [(ACHCodableSyncIdentity *)v53 setDatabaseIdentifier:v57];

    v58 = [v1 syncIdentity];
    v59 = [v58 instanceDiscriminator];
    [(ACHCodableSyncIdentity *)v53 setInstanceDiscriminator:v59];

    [(ACHCodableTemplate *)v2 setSyncIdentity:v53];
  }
  v60 = [v1 prerequisiteTemplateName];
  [(ACHCodableTemplate *)v2 setPrerequisiteTemplateName:v60];

  return v2;
}

uint64_t ACHTemplateSourceNameIsEqualToIdentifier(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 sourceName];
  uint64_t v5 = [v4 isEqualToString:v3];

  return v5;
}

id ACHLogDefault()
{
  if (ACHLogDefault_onceToken != -1) {
    dispatch_once(&ACHLogDefault_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)ACHLogDefault_category;

  return v0;
}

id ACHLogAssets()
{
  if (ACHLogAssets_onceToken != -1) {
    dispatch_once(&ACHLogAssets_onceToken, &__block_literal_global_281);
  }
  v0 = (void *)ACHLogAssets_category;

  return v0;
}

uint64_t ACHTemplateAvailableSuffixesStringFromStrings(void *a1, const char *a2)
{
  return [a1 componentsJoinedByString:@"|"];
}

uint64_t ACHTemplateAvailableCountryCodesStringFromStrings(void *a1, const char *a2)
{
  return [a1 componentsJoinedByString:@"|"];
}

id ACHTemplateAlertDatesStringFromDates(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = ACHYearMonthDayStringFromDateComponents(*(void **)(*((void *)&v11 + 1) + 8 * i));
        objc_msgSend(v2, "addObject:", v8, (void)v11);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v9 = [v2 componentsJoinedByString:@"|"];

  return v9;
}

uint64_t ACHTemplateAvailableSuffixesFromString(void *a1, const char *a2)
{
  return [a1 componentsSeparatedByString:@"|"];
}

uint64_t ACHTemplateAvailableCountryCodesFromString(void *a1, const char *a2)
{
  return [a1 componentsSeparatedByString:@"|"];
}

uint64_t ACHShouldUseNewAwardsSystem()
{
  return 1;
}

id ACHHKQuantityWithValueAndUnit(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    v7 = (void *)MEMORY[0x263F0A630];
    [v3 doubleValue];
    uint64_t v6 = objc_msgSend(v7, "quantityWithUnit:doubleValue:", v4);
  }

  return v6;
}

float ACHAchievementColorFromACHCodableColor(void *a1)
{
  id v1 = a1;
  [v1 red];
  float v3 = v2;
  [v1 green];
  [v1 blue];

  return v3;
}

ACHCodableAchievement *ACHCodableFromAchievement(void *a1)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v1 = a1;
  double v2 = [v1 template];
  float v3 = ACHCodableFromTemplate(v2);

  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v5 = [v1 earnedInstances];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v84 objects:v89 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v85 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = ACHCodableFromEarnedInstance(*(void **)(*((void *)&v84 + 1) + 8 * i));
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v84 objects:v89 count:16];
    }
    while (v7);
  }

  long long v11 = objc_alloc_init(ACHCodableAchievement);
  [(ACHCodableAchievement *)v11 setAchievementTemplate:v3];
  long long v12 = [v1 relevantEarnedInstance];

  if (v12)
  {
    long long v13 = [v1 relevantEarnedInstance];
    long long v14 = ACHCodableFromEarnedInstance(v13);
    [(ACHCodableAchievement *)v11 setRelevantEarnedInstance:v14];
  }
  -[ACHCodableAchievement setEarnedInstanceCount:](v11, "setEarnedInstanceCount:", [v1 earnedInstanceCount]);
  [(ACHCodableAchievement *)v11 setEarnedInstances:v4];
  v15 = [v1 localizationBundleURLString];
  [(ACHCodableAchievement *)v11 setLocalizationBundleURL:v15];

  uint64_t v16 = [v1 resourceBundleURLString];
  [(ACHCodableAchievement *)v11 setResourceBundleURL:v16];

  v17 = [v1 propertyListBundleURLString];
  [(ACHCodableAchievement *)v11 setPropertyListBundleURL:v17];

  v18 = [v1 stickerBundleURLString];
  [(ACHCodableAchievement *)v11 setStickerBundleURL:v18];

  id v19 = objc_alloc(MEMORY[0x263EFF980]);
  v20 = [v1 textureFilenames];
  v21 = (void *)[v19 initWithArray:v20];
  [(ACHCodableAchievement *)v11 setTextureFilenames:v21];

  v22 = [v1 glyphTextureFilename];
  [(ACHCodableAchievement *)v11 setGlyphTextureFilename:v22];

  [v1 glyphPositionOffsetX];
  -[ACHCodableAchievement setGlyphPositionOffsetX:](v11, "setGlyphPositionOffsetX:");
  [v1 glyphPositionOffsetY];
  -[ACHCodableAchievement setGlyphPositionOffsetY:](v11, "setGlyphPositionOffsetY:");
  id v23 = objc_alloc(MEMORY[0x263EFF980]);
  v24 = [v1 badgeModelFilenames];
  v25 = (void *)[v23 initWithArray:v24];
  [(ACHCodableAchievement *)v11 setBadgeModelFilenames:v25];

  [v1 glyphTextureScale];
  -[ACHCodableAchievement setGlyphTextureScale:](v11, "setGlyphTextureScale:");
  v26 = [v1 badgeShapeName];
  [(ACHCodableAchievement *)v11 setBadgeShapeName:v26];

  [v1 badgeMetalColor];
  v30 = ACHCodableColorFromACHAchievementColor(v27, v28, v29);
  [(ACHCodableAchievement *)v11 setBadgeMetalColor:v30];

  -[ACHCodableAchievement setBadgeUsesFullColorEnamel:](v11, "setBadgeUsesFullColorEnamel:", [v1 badgeUsesFullColorEnamel]);
  -[ACHCodableAchievement setUnearnedUsesTwoToneEnamel:](v11, "setUnearnedUsesTwoToneEnamel:", [v1 unearnedUsesTwoToneEnamel]);
  -[ACHCodableAchievement setFaceHasMetalInlay:](v11, "setFaceHasMetalInlay:", [v1 faceHasMetalInlay]);
  [v1 badgeEnamelColor];
  v34 = ACHCodableColorFromACHAchievementColor(v31, v32, v33);
  [(ACHCodableAchievement *)v11 setBadgeEnamelColor:v34];

  v35 = [v1 section];
  [(ACHCodableAchievement *)v11 setSection:v35];

  -[ACHCodableAchievement setBadgeUsesTriColorEnamel:](v11, "setBadgeUsesTriColorEnamel:", [v1 badgeUsesTriColorEnamel]);
  if ([v1 badgeUsesTriColorEnamel])
  {
    [v1 enamelTriColor1];
    v39 = ACHCodableColorFromACHAchievementColor(v36, v37, v38);
    [(ACHCodableAchievement *)v11 setEnamelTriColor1:v39];

    [v1 enamelTriColor2];
    v43 = ACHCodableColorFromACHAchievementColor(v40, v41, v42);
    [(ACHCodableAchievement *)v11 setEnamelTriColor2:v43];

    [v1 enamelTriColor3];
    v47 = ACHCodableColorFromACHAchievementColor(v44, v45, v46);
    [(ACHCodableAchievement *)v11 setEnamelTriColor3:v47];
  }
  v48 = [v1 progress];

  if (v48)
  {
    v49 = [v1 progress];
    v50 = [v1 template];
    v51 = [v50 canonicalUnit];
    [v49 doubleValueForUnit:v51];
    -[ACHCodableAchievement setProgressValue:](v11, "setProgressValue:");

    v52 = [v1 template];
    v53 = [v52 canonicalUnit];
    v54 = [v53 unitString];
    [(ACHCodableAchievement *)v11 setProgressUnitString:v54];
  }
  v55 = [v1 goal];

  if (v55)
  {
    v56 = [v1 goal];
    v57 = [v1 template];
    v58 = [v57 canonicalUnit];
    [v56 doubleValueForUnit:v58];
    -[ACHCodableAchievement setGoalValue:](v11, "setGoalValue:");

    v59 = [v1 template];
    v60 = [v59 canonicalUnit];
    v61 = [v60 unitString];
    [(ACHCodableAchievement *)v11 setGoalUnitString:v61];
  }
  v62 = [v1 customPlaceholderValues];

  if (v62)
  {
    v77 = v11;
    id v78 = v4;
    v79 = v3;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v63 = [v1 customPlaceholderValues];
    uint64_t v64 = [v63 countByEnumeratingWithState:&v80 objects:v88 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v81;
      v67 = (void *)MEMORY[0x263EFFA68];
      do
      {
        uint64_t v68 = 0;
        v69 = v67;
        do
        {
          if (*(void *)v81 != v66) {
            objc_enumerationMutation(v63);
          }
          uint64_t v70 = *(void *)(*((void *)&v80 + 1) + 8 * v68);
          v71 = objc_alloc_init(ACHCodablePlaceholderValue);
          [(ACHCodablePlaceholderValue *)v71 setPlaceholder:v70];
          [v1 customPlaceholderValues];
          v73 = id v72 = v1;
          v74 = [v73 objectForKeyedSubscript:v70];
          [(ACHCodablePlaceholderValue *)v71 setValue:v74];

          id v1 = v72;
          v67 = [v69 arrayByAddingObject:v71];

          ++v68;
          v69 = v67;
        }
        while (v65 != v68);
        uint64_t v65 = [v63 countByEnumeratingWithState:&v80 objects:v88 count:16];
      }
      while (v65);
    }
    else
    {
      v67 = (void *)MEMORY[0x263EFFA68];
    }

    v75 = (void *)[v67 mutableCopy];
    long long v11 = v77;
    [(ACHCodableAchievement *)v77 setCustomPlaceholderValues:v75];

    id v4 = v78;
    float v3 = v79;
  }
  -[ACHCodableAchievement setBadgeModelVersion:](v11, "setBadgeModelVersion:", [v1 badgeModelVersion]);
  -[ACHCodableAchievement setPrerequisiteMet:](v11, "setPrerequisiteMet:", [v1 prerequisiteMet]);

  return v11;
}

ACHCodableColor *ACHCodableColorFromACHAchievementColor(float a1, float a2, float a3)
{
  uint64_t v6 = objc_alloc_init(ACHCodableColor);
  [(ACHCodableColor *)v6 setRed:a1];
  [(ACHCodableColor *)v6 setGreen:a2];
  [(ACHCodableColor *)v6 setBlue:a3];

  return v6;
}

id ACHTemplateAlertDatesFromString(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = [a1 componentsSeparatedByString:@"|"];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = ACHYearMonthDayDateComponentsFromString(*(void **)(*((void *)&v11 + 1) + 8 * i));
        if (v8) {
          objc_msgSend(v2, "addObject:", v8, (void)v11);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v9 = (void *)[v2 copy];

  return v9;
}

BOOL ACHAchievementColorsAreEqual(float a1, float a2, float a3, float a4, float a5, float a6)
{
  float v6 = a1 - a4;
  if (v6 < 0.0) {
    float v6 = -v6;
  }
  if (v6 >= 0.00000011921) {
    return 0;
  }
  float v7 = a2 - a5;
  float v8 = -(float)(a2 - a5);
  if (v7 < 0.0) {
    float v7 = v8;
  }
  if (v7 >= 0.00000011921) {
    return 0;
  }
  float v9 = a3 - a6;
  if ((float)(a3 - a6) < 0.0) {
    float v9 = -(float)(a3 - a6);
  }
  return v9 < 0.00000011921;
}

uint64_t ACHStartOfFitnessWeekBeforeDateInCalendar(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hk_startOfFitnessWeekBeforeDate:", a1);
}

id ACHPairedWatchCountryCode()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@".GlobalPreferences"];
  id v1 = (id)[v0 synchronize];
  id v2 = [v0 objectForKey:@"AppleLocale"];
  id v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v2];
  uint64_t v4 = ACHCountryCode(v3);

  return v4;
}

id ACHCountryCode(void *a1)
{
  id v1 = a1;
  id v2 = [v1 regionCode];
  if ([v2 isEqualToString:@"en"])
  {
    id v3 = ACHLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ACHCountryCode_cold_2((uint64_t)v2, (uint64_t)v1, v3);
    }
  }
  if (!v2)
  {
    uint64_t v4 = ACHLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ACHCountryCode_cold_1(v4);
    }
  }

  return v2;
}

void ACHCountryCode_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_21F582000, log, OS_LOG_TYPE_ERROR, "Country code came back as nil!", v1, 2u);
}

uint64_t ACHCodableAchievementProgressUpdateArrayReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    float v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(ACHCodableAchievementProgressUpdate);
        [a1 addAchievementProgressUpdate:v17];
        if (!PBReaderPlaceMark()
          || (ACHCodableAchievementProgressUpdateReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ACHCodableAchievementProgressUpdateReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    float v7 = (int *)MEMORY[0x263F62268];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          if (v9++ >= 9)
          {
            unint64_t v10 = 0;
            int v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        if (v16) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = (v10 & 7) == 4;
        }
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 40;
              goto LABEL_25;
            case 2u:
              *(unsigned char *)(a1 + 48) |= 2u;
              uint64_t v25 = *v3;
              unint64_t v26 = *(void *)(a2 + v25);
              if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v26);
                *(void *)(a2 + v25) = v26 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v22 = 0;
              }
              uint64_t v27 = 16;
              goto LABEL_35;
            case 3u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 32;
              goto LABEL_25;
            case 4u:
              *(unsigned char *)(a1 + 48) |= 1u;
              uint64_t v20 = *v3;
              unint64_t v21 = *(void *)(a2 + v20);
              if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
                *(void *)(a2 + v20) = v21 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v22 = 0;
              }
              uint64_t v27 = 8;
LABEL_35:
              *(void *)(a1 + v27) = v22;
              goto LABEL_36;
            case 5u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 24;
LABEL_25:
              id v23 = *(void **)(a1 + v19);
              *(void *)(a1 + v19) = v18;

              goto LABEL_36;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_36:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ACHCodableAchievementArrayReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    float v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        BOOL v17 = objc_alloc_init(ACHCodableAchievement);
        [a1 addAchievements:v17];
        if (!PBReaderPlaceMark() || (ACHCodableAchievementReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ACHCodableAchievementReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  float v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = objc_alloc_init(ACHCodableTemplate);
        objc_storeStrong((id *)(a1 + 64), v18);
        if PBReaderPlaceMark() && (ACHCodableTemplateReadFrom((uint64_t)v18, a2)) {
          goto LABEL_113;
        }
        goto LABEL_165;
      case 2u:
        uint64_t v18 = objc_alloc_init(ACHCodableEarnedInstance);
        [(id)a1 addEarnedInstances:v18];
        goto LABEL_88;
      case 3u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 160;
        goto LABEL_104;
      case 4u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 192;
        goto LABEL_104;
      case 5u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 208;
        goto LABEL_104;
      case 6u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 96;
        goto LABEL_104;
      case 7u:
        uint64_t v18 = objc_alloc_init(ACHCodableColor);
        uint64_t v22 = 80;
        goto LABEL_77;
      case 8u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(_WORD *)(a1 + 240) |= 0x80u;
        while (2)
        {
          uint64_t v26 = *v3;
          uint64_t v27 = *(void *)(a2 + v26);
          unint64_t v28 = v27 + 1;
          if (v27 == -1 || v28 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if (v29 < 0)
            {
              v23 += 7;
              BOOL v15 = v24++ >= 9;
              if (v15)
              {
                uint64_t v25 = 0;
                goto LABEL_125;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_125:
        BOOL v83 = v25 != 0;
        uint64_t v84 = 232;
        goto LABEL_151;
      case 9u:
        uint64_t v18 = objc_alloc_init(ACHCodableColor);
        uint64_t v22 = 72;
        goto LABEL_77;
      case 0xAu:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 176;
        goto LABEL_104;
      case 0xBu:
        *(_WORD *)(a1 + 240) |= 0x40u;
        uint64_t v30 = *v3;
        unint64_t v31 = *(void *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v32 = *(void *)(*(void *)(a2 + *v7) + v31);
          *(void *)(a2 + v30) = v31 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v32 = 0;
        }
        uint64_t v86 = 56;
        goto LABEL_162;
      case 0xCu:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 168;
        goto LABEL_104;
      case 0xDu:
        *(_WORD *)(a1 + 240) |= 0x20u;
        uint64_t v33 = *v3;
        unint64_t v34 = *(void *)(a2 + v33);
        if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v32 = *(void *)(*(void *)(a2 + *v7) + v34);
          *(void *)(a2 + v33) = v34 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v32 = 0;
        }
        uint64_t v86 = 48;
        goto LABEL_162;
      case 0xEu:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 152;
        goto LABEL_104;
      case 0xFu:
        uint64_t v18 = objc_alloc_init(ACHCodablePlaceholderValue);
        [(id)a1 addCustomPlaceholderValues:v18];
        if (!PBReaderPlaceMark() || !ACHCodablePlaceholderValueReadFrom((uint64_t)v18, a2)) {
          goto LABEL_165;
        }
        goto LABEL_113;
      case 0x10u:
        PBReaderReadString();
        uint64_t v18 = (ACHCodableTemplate *)objc_claimAutoreleasedReturnValue();
        if (v18) {
          [(id)a1 addTextureFilenames:v18];
        }
        goto LABEL_114;
      case 0x11u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v37 = 0;
        *(_WORD *)(a1 + 240) |= 0x800u;
        while (2)
        {
          uint64_t v38 = *v3;
          uint64_t v39 = *(void *)(a2 + v38);
          unint64_t v40 = v39 + 1;
          if (v39 == -1 || v40 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
            *(void *)(a2 + v38) = v40;
            v37 |= (unint64_t)(v41 & 0x7F) << v35;
            if (v41 < 0)
            {
              v35 += 7;
              BOOL v15 = v36++ >= 9;
              if (v15)
              {
                uint64_t v37 = 0;
                goto LABEL_129;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v37 = 0;
        }
LABEL_129:
        BOOL v83 = v37 != 0;
        uint64_t v84 = 236;
        goto LABEL_151;
      case 0x12u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 200;
        goto LABEL_104;
      case 0x13u:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v44 = 0;
        *(_WORD *)(a1 + 240) |= 0x200u;
        while (2)
        {
          uint64_t v45 = *v3;
          uint64_t v46 = *(void *)(a2 + v45);
          unint64_t v47 = v46 + 1;
          if (v46 == -1 || v47 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
            *(void *)(a2 + v45) = v47;
            v44 |= (unint64_t)(v48 & 0x7F) << v42;
            if (v48 < 0)
            {
              v42 += 7;
              BOOL v15 = v43++ >= 9;
              if (v15)
              {
                uint64_t v44 = 0;
                goto LABEL_133;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v44 = 0;
        }
LABEL_133:
        BOOL v83 = v44 != 0;
        uint64_t v84 = 234;
        goto LABEL_151;
      case 0x14u:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v51 = 0;
        *(_WORD *)(a1 + 240) |= 0x100u;
        while (2)
        {
          uint64_t v52 = *v3;
          uint64_t v53 = *(void *)(a2 + v52);
          unint64_t v54 = v53 + 1;
          if (v53 == -1 || v54 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
            *(void *)(a2 + v52) = v54;
            v51 |= (unint64_t)(v55 & 0x7F) << v49;
            if (v55 < 0)
            {
              v49 += 7;
              BOOL v15 = v50++ >= 9;
              if (v15)
              {
                uint64_t v51 = 0;
                goto LABEL_137;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v51 = 0;
        }
LABEL_137:
        BOOL v83 = v51 != 0;
        uint64_t v84 = 233;
        goto LABEL_151;
      case 0x15u:
        uint64_t v18 = objc_alloc_init(ACHCodableColor);
        uint64_t v22 = 120;
        goto LABEL_77;
      case 0x16u:
        uint64_t v18 = objc_alloc_init(ACHCodableColor);
        uint64_t v22 = 128;
        goto LABEL_77;
      case 0x17u:
        uint64_t v18 = objc_alloc_init(ACHCodableColor);
        uint64_t v22 = 136;
LABEL_77:
        objc_storeStrong((id *)(a1 + v22), v18);
        if (!PBReaderPlaceMark() || !ACHCodableColorReadFrom((uint64_t)v18, a2)) {
          goto LABEL_165;
        }
        goto LABEL_113;
      case 0x18u:
        char v56 = 0;
        unsigned int v57 = 0;
        uint64_t v58 = 0;
        *(_WORD *)(a1 + 240) |= 1u;
        while (2)
        {
          uint64_t v59 = *v3;
          uint64_t v60 = *(void *)(a2 + v59);
          unint64_t v61 = v60 + 1;
          if (v60 == -1 || v61 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v62 = *(unsigned char *)(*(void *)(a2 + *v7) + v60);
            *(void *)(a2 + v59) = v61;
            v58 |= (unint64_t)(v62 & 0x7F) << v56;
            if (v62 < 0)
            {
              v56 += 7;
              BOOL v15 = v57++ >= 9;
              if (v15)
              {
                uint64_t v58 = 0;
                goto LABEL_141;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v58 = 0;
        }
LABEL_141:
        uint64_t v85 = 8;
        goto LABEL_146;
      case 0x19u:
        uint64_t v18 = objc_alloc_init(ACHCodableEarnedInstance);
        objc_storeStrong((id *)(a1 + 184), v18);
LABEL_88:
        if (!PBReaderPlaceMark() || (ACHCodableEarnedInstanceReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_165;
        }
        goto LABEL_113;
      case 0x1Au:
        char v63 = 0;
        unsigned int v64 = 0;
        uint64_t v58 = 0;
        *(_WORD *)(a1 + 240) |= 2u;
        while (2)
        {
          uint64_t v65 = *v3;
          uint64_t v66 = *(void *)(a2 + v65);
          unint64_t v67 = v66 + 1;
          if (v66 == -1 || v67 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v68 = *(unsigned char *)(*(void *)(a2 + *v7) + v66);
            *(void *)(a2 + v65) = v67;
            v58 |= (unint64_t)(v68 & 0x7F) << v63;
            if (v68 < 0)
            {
              v63 += 7;
              BOOL v15 = v64++ >= 9;
              if (v15)
              {
                uint64_t v58 = 0;
                goto LABEL_145;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v58 = 0;
        }
LABEL_145:
        uint64_t v85 = 16;
LABEL_146:
        *(void *)(a1 + v85) = v58;
        goto LABEL_163;
      case 0x1Bu:
        PBReaderReadString();
        uint64_t v18 = (ACHCodableTemplate *)objc_claimAutoreleasedReturnValue();
        if (v18) {
          [(id)a1 addBadgeModelFilenames:v18];
        }
        goto LABEL_114;
      case 0x1Cu:
        *(_WORD *)(a1 + 240) |= 0x10u;
        uint64_t v69 = *v3;
        unint64_t v70 = *(void *)(a2 + v69);
        if (v70 <= 0xFFFFFFFFFFFFFFF7 && v70 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v32 = *(void *)(*(void *)(a2 + *v7) + v70);
          *(void *)(a2 + v69) = v70 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v32 = 0;
        }
        uint64_t v86 = 40;
        goto LABEL_162;
      case 0x1Du:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 144;
LABEL_104:
        v71 = *(void **)(a1 + v21);
        *(void *)(a1 + v21) = v20;

        goto LABEL_163;
      case 0x1Eu:
        *(_WORD *)(a1 + 240) |= 4u;
        uint64_t v72 = *v3;
        unint64_t v73 = *(void *)(a2 + v72);
        if (v73 <= 0xFFFFFFFFFFFFFFF7 && v73 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v32 = *(void *)(*(void *)(a2 + *v7) + v73);
          *(void *)(a2 + v72) = v73 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v32 = 0;
        }
        uint64_t v86 = 24;
        goto LABEL_162;
      case 0x1Fu:
        *(_WORD *)(a1 + 240) |= 8u;
        uint64_t v74 = *v3;
        unint64_t v75 = *(void *)(a2 + v74);
        if (v75 <= 0xFFFFFFFFFFFFFFF7 && v75 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v32 = *(void *)(*(void *)(a2 + *v7) + v75);
          *(void *)(a2 + v74) = v75 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v32 = 0;
        }
        uint64_t v86 = 32;
LABEL_162:
        *(void *)(a1 + v86) = v32;
        goto LABEL_163;
      case 0x20u:
        uint64_t v18 = objc_alloc_init(ACHCodableSyncIdentity);
        objc_storeStrong((id *)(a1 + 216), v18);
        if (PBReaderPlaceMark() && ACHCodableSyncIdentityReadFrom((uint64_t)v18, a2))
        {
LABEL_113:
          PBReaderRecallMark();
LABEL_114:

LABEL_163:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_165:

        return 0;
      case 0x21u:
        char v76 = 0;
        unsigned int v77 = 0;
        uint64_t v78 = 0;
        *(_WORD *)(a1 + 240) |= 0x400u;
        while (2)
        {
          uint64_t v79 = *v3;
          uint64_t v80 = *(void *)(a2 + v79);
          unint64_t v81 = v80 + 1;
          if (v80 == -1 || v81 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v82 = *(unsigned char *)(*(void *)(a2 + *v7) + v80);
            *(void *)(a2 + v79) = v81;
            v78 |= (unint64_t)(v82 & 0x7F) << v76;
            if (v82 < 0)
            {
              v76 += 7;
              BOOL v15 = v77++ >= 9;
              if (v15)
              {
                uint64_t v78 = 0;
                goto LABEL_150;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v78 = 0;
        }
LABEL_150:
        BOOL v83 = v78 != 0;
        uint64_t v84 = 235;
LABEL_151:
        *(unsigned char *)(a1 + v84) = v83;
        goto LABEL_163;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_163;
    }
  }
}

BOOL ACHCodableColorReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    float v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(unsigned char *)(a1 + 32) |= 1u;
        uint64_t v22 = *v3;
        unint64_t v23 = *(void *)(a2 + v22);
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v21 = 0;
        }
        uint64_t v26 = &OBJC_IVAR___ACHCodableColor__blue;
        goto LABEL_38;
      }
      if (v18 == 2) {
        break;
      }
      if (v18 == 1)
      {
        *(unsigned char *)(a1 + 32) |= 4u;
        uint64_t v19 = *v3;
        unint64_t v20 = *(void *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
          *(void *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v21 = 0;
        }
        uint64_t v26 = &OBJC_IVAR___ACHCodableColor__red;
LABEL_38:
        *(void *)(a1 + *v26) = v21;
        goto LABEL_39;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_39:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    *(unsigned char *)(a1 + 32) |= 2u;
    uint64_t v24 = *v3;
    unint64_t v25 = *(void *)(a2 + v24);
    if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)(a2 + *v4))
    {
      uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v25);
      *(void *)(a2 + v24) = v25 + 8;
    }
    else
    {
      *(unsigned char *)(a2 + *v5) = 1;
      uint64_t v21 = 0;
    }
    uint64_t v26 = &OBJC_IVAR___ACHCodableColor__green;
    goto LABEL_38;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ACHCodableTemplateReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  float v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 272;
        goto LABEL_145;
      case 2u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x1000u;
        while (2)
        {
          uint64_t v24 = *v3;
          uint64_t v25 = *(void *)(a2 + v24);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              BOOL v15 = v22++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_149;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_149:
        uint64_t v109 = 104;
        goto LABEL_199;
      case 3u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x200u;
        while (2)
        {
          uint64_t v30 = *v3;
          uint64_t v31 = *(void *)(a2 + v30);
          unint64_t v32 = v31 + 1;
          if (v31 == -1 || v32 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v32;
            v23 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              BOOL v15 = v29++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_153;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_153:
        uint64_t v109 = 80;
        goto LABEL_199;
      case 4u:
        *(_WORD *)(a1 + 316) |= 1u;
        uint64_t v34 = *v3;
        unint64_t v35 = *(void *)(a2 + v34);
        if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v36 = *(void *)(*(void *)(a2 + *v7) + v35);
          *(void *)(a2 + v34) = v35 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v36 = 0;
        }
        uint64_t v112 = 8;
        goto LABEL_206;
      case 5u:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v23 = 0;
        *(_WORD *)(a1 + 316) |= 2u;
        while (2)
        {
          uint64_t v39 = *v3;
          uint64_t v40 = *(void *)(a2 + v39);
          unint64_t v41 = v40 + 1;
          if (v40 == -1 || v41 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
            *(void *)(a2 + v39) = v41;
            v23 |= (unint64_t)(v42 & 0x7F) << v37;
            if (v42 < 0)
            {
              v37 += 7;
              BOOL v15 = v38++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_157;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_157:
        uint64_t v109 = 16;
        goto LABEL_199;
      case 6u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 256;
        goto LABEL_145;
      case 7u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 232;
        goto LABEL_145;
      case 8u:
        char v43 = 0;
        unsigned int v44 = 0;
        uint64_t v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x800u;
        while (2)
        {
          uint64_t v45 = *v3;
          uint64_t v46 = *(void *)(a2 + v45);
          unint64_t v47 = v46 + 1;
          if (v46 == -1 || v47 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
            *(void *)(a2 + v45) = v47;
            v23 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              v43 += 7;
              BOOL v15 = v44++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_161;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_161:
        uint64_t v109 = 96;
        goto LABEL_199;
      case 9u:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x80u;
        while (2)
        {
          uint64_t v51 = *v3;
          uint64_t v52 = *(void *)(a2 + v51);
          unint64_t v53 = v52 + 1;
          if (v52 == -1 || v53 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v52);
            *(void *)(a2 + v51) = v53;
            v23 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              BOOL v15 = v50++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_165;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_165:
        uint64_t v109 = 64;
        goto LABEL_199;
      case 0xAu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 296;
        goto LABEL_145;
      case 0xBu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 304;
        goto LABEL_145;
      case 0xCu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 288;
        goto LABEL_145;
      case 0xDu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 136;
        goto LABEL_145;
      case 0xEu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 144;
        goto LABEL_145;
      case 0xFu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 128;
        goto LABEL_145;
      case 0x10u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 120;
        goto LABEL_145;
      case 0x11u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 112;
        goto LABEL_145;
      case 0x12u:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x20u;
        while (2)
        {
          uint64_t v57 = *v3;
          uint64_t v58 = *(void *)(a2 + v57);
          unint64_t v59 = v58 + 1;
          if (v58 == -1 || v59 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v60 = *(unsigned char *)(*(void *)(a2 + *v7) + v58);
            *(void *)(a2 + v57) = v59;
            v23 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              BOOL v15 = v56++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_169;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_169:
        uint64_t v109 = 48;
        goto LABEL_199;
      case 0x13u:
        char v61 = 0;
        unsigned int v62 = 0;
        uint64_t v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x10u;
        while (2)
        {
          uint64_t v63 = *v3;
          uint64_t v64 = *(void *)(a2 + v63);
          unint64_t v65 = v64 + 1;
          if (v64 == -1 || v65 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v66 = *(unsigned char *)(*(void *)(a2 + *v7) + v64);
            *(void *)(a2 + v63) = v65;
            v23 |= (unint64_t)(v66 & 0x7F) << v61;
            if (v66 < 0)
            {
              v61 += 7;
              BOOL v15 = v62++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_173;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_173:
        uint64_t v109 = 40;
        goto LABEL_199;
      case 0x14u:
        char v67 = 0;
        unsigned int v68 = 0;
        uint64_t v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x40u;
        while (2)
        {
          uint64_t v69 = *v3;
          uint64_t v70 = *(void *)(a2 + v69);
          unint64_t v71 = v70 + 1;
          if (v70 == -1 || v71 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v72 = *(unsigned char *)(*(void *)(a2 + *v7) + v70);
            *(void *)(a2 + v69) = v71;
            v23 |= (unint64_t)(v72 & 0x7F) << v67;
            if (v72 < 0)
            {
              v67 += 7;
              BOOL v15 = v68++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_177;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_177:
        uint64_t v109 = 56;
        goto LABEL_199;
      case 0x15u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 168;
        goto LABEL_145;
      case 0x16u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 280;
        goto LABEL_145;
      case 0x17u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 248;
        goto LABEL_145;
      case 0x18u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 184;
        goto LABEL_145;
      case 0x19u:
        char v73 = 0;
        unsigned int v74 = 0;
        uint64_t v23 = 0;
        *(_WORD *)(a1 + 316) |= 8u;
        while (2)
        {
          uint64_t v75 = *v3;
          uint64_t v76 = *(void *)(a2 + v75);
          unint64_t v77 = v76 + 1;
          if (v76 == -1 || v77 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v78 = *(unsigned char *)(*(void *)(a2 + *v7) + v76);
            *(void *)(a2 + v75) = v77;
            v23 |= (unint64_t)(v78 & 0x7F) << v73;
            if (v78 < 0)
            {
              v73 += 7;
              BOOL v15 = v74++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_181;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_181:
        uint64_t v109 = 32;
        goto LABEL_199;
      case 0x1Au:
        char v79 = 0;
        unsigned int v80 = 0;
        uint64_t v81 = 0;
        *(_WORD *)(a1 + 316) |= 0x4000u;
        while (2)
        {
          uint64_t v82 = *v3;
          uint64_t v83 = *(void *)(a2 + v82);
          unint64_t v84 = v83 + 1;
          if (v83 == -1 || v84 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v85 = *(unsigned char *)(*(void *)(a2 + *v7) + v83);
            *(void *)(a2 + v82) = v84;
            v81 |= (unint64_t)(v85 & 0x7F) << v79;
            if (v85 < 0)
            {
              v79 += 7;
              BOOL v15 = v80++ >= 9;
              if (v15)
              {
                uint64_t v81 = 0;
                goto LABEL_185;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v81 = 0;
        }
LABEL_185:
        BOOL v110 = v81 != 0;
        uint64_t v111 = 313;
        goto LABEL_190;
      case 0x1Bu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 152;
        goto LABEL_145;
      case 0x1Cu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 160;
        goto LABEL_145;
      case 0x1Du:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 200;
        goto LABEL_145;
      case 0x1Eu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 224;
        goto LABEL_145;
      case 0x1Fu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 216;
        goto LABEL_145;
      case 0x20u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 208;
        goto LABEL_145;
      case 0x21u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 192;
        goto LABEL_145;
      case 0x22u:
        char v86 = 0;
        unsigned int v87 = 0;
        uint64_t v88 = 0;
        *(_WORD *)(a1 + 316) |= 0x2000u;
        while (2)
        {
          uint64_t v89 = *v3;
          uint64_t v90 = *(void *)(a2 + v89);
          unint64_t v91 = v90 + 1;
          if (v90 == -1 || v91 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v92 = *(unsigned char *)(*(void *)(a2 + *v7) + v90);
            *(void *)(a2 + v89) = v91;
            v88 |= (unint64_t)(v92 & 0x7F) << v86;
            if (v92 < 0)
            {
              v86 += 7;
              BOOL v15 = v87++ >= 9;
              if (v15)
              {
                uint64_t v88 = 0;
                goto LABEL_189;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v88 = 0;
        }
LABEL_189:
        BOOL v110 = v88 != 0;
        uint64_t v111 = 312;
LABEL_190:
        *(unsigned char *)(a1 + v111) = v110;
        goto LABEL_200;
      case 0x23u:
        char v93 = 0;
        unsigned int v94 = 0;
        uint64_t v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x400u;
        while (2)
        {
          uint64_t v95 = *v3;
          uint64_t v96 = *(void *)(a2 + v95);
          unint64_t v97 = v96 + 1;
          if (v96 == -1 || v97 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v98 = *(unsigned char *)(*(void *)(a2 + *v7) + v96);
            *(void *)(a2 + v95) = v97;
            v23 |= (unint64_t)(v98 & 0x7F) << v93;
            if (v98 < 0)
            {
              v93 += 7;
              BOOL v15 = v94++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_194;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_194:
        uint64_t v109 = 88;
        goto LABEL_199;
      case 0x24u:
        char v99 = 0;
        unsigned int v100 = 0;
        uint64_t v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x100u;
        while (2)
        {
          uint64_t v101 = *v3;
          uint64_t v102 = *(void *)(a2 + v101);
          unint64_t v103 = v102 + 1;
          if (v102 == -1 || v103 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v104 = *(unsigned char *)(*(void *)(a2 + *v7) + v102);
            *(void *)(a2 + v101) = v103;
            v23 |= (unint64_t)(v104 & 0x7F) << v99;
            if (v104 < 0)
            {
              v99 += 7;
              BOOL v15 = v100++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_198;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_198:
        uint64_t v109 = 72;
LABEL_199:
        *(void *)(a1 + v109) = v23;
        goto LABEL_200;
      case 0x25u:
        *(_WORD *)(a1 + 316) |= 4u;
        uint64_t v105 = *v3;
        unint64_t v106 = *(void *)(a2 + v105);
        if (v106 <= 0xFFFFFFFFFFFFFFF7 && v106 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v36 = *(void *)(*(void *)(a2 + *v7) + v106);
          *(void *)(a2 + v105) = v106 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v36 = 0;
        }
        uint64_t v112 = 24;
LABEL_206:
        *(void *)(a1 + v112) = v36;
        goto LABEL_200;
      case 0x26u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 176;
        goto LABEL_145;
      case 0x27u:
        v107 = objc_alloc_init(ACHCodableSyncIdentity);
        objc_storeStrong((id *)(a1 + 264), v107);
        if (PBReaderPlaceMark() && ACHCodableSyncIdentityReadFrom((uint64_t)v107, a2))
        {
          PBReaderRecallMark();

LABEL_200:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 0x28u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 240;
LABEL_145:
        v108 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_200;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_200;
    }
  }
}

BOOL ACHCodableSyncIdentityReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    float v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 8;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 16;
LABEL_24:
        unint64_t v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    uint64_t v19 = 24;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

ACHCodableAchievementProgressUpdate *ACHCodableFromAchievementProgressUpdate(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(ACHCodableAchievementProgressUpdate);
  id v3 = [v1 templateUniqueName];
  [(ACHCodableAchievementProgressUpdate *)v2 setTemplateUniqueName:v3];

  uint64_t v4 = [v1 progressQuantity];
  uint64_t v5 = [v4 _unit];
  float v6 = [v5 unitString];
  [(ACHCodableAchievementProgressUpdate *)v2 setProgressQuantityUnit:v6];

  float v7 = [v1 progressQuantity];
  char v8 = [v1 progressQuantity];
  unsigned int v9 = [v8 _unit];
  [v7 doubleValueForUnit:v9];
  -[ACHCodableAchievementProgressUpdate setProgressQuantityValue:](v2, "setProgressQuantityValue:");

  unint64_t v10 = [v1 goalQuantity];
  uint64_t v11 = [v10 _unit];
  unint64_t v12 = [v11 unitString];
  [(ACHCodableAchievementProgressUpdate *)v2 setGoalQuantityUnit:v12];

  char v13 = [v1 goalQuantity];
  char v14 = [v1 goalQuantity];

  int v15 = [v14 _unit];
  [v13 doubleValueForUnit:v15];
  -[ACHCodableAchievementProgressUpdate setGoalQuantityValue:](v2, "setGoalQuantityValue:");

  return v2;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

id ACHLogAwardEngine()
{
  if (ACHLogAwardEngine_onceToken != -1) {
    dispatch_once(&ACHLogAwardEngine_onceToken, &__block_literal_global_284);
  }
  v0 = (void *)ACHLogAwardEngine_category;

  return v0;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id ACHLogProgress()
{
  if (ACHLogProgress_onceToken != -1) {
    dispatch_once(&ACHLogProgress_onceToken, &__block_literal_global_314);
  }
  v0 = (void *)ACHLogProgress_category;

  return v0;
}

void sub_21F58F26C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

BOOL ACHMonthlyChallengeShouldUseAvailableSuffixes(void *a1)
{
  id v1 = a1;
  id v2 = [v1 template];
  id v3 = [v2 uniqueName];
  uint64_t v4 = ACHMonthlyChallengeTypeFromTemplateUniqueName(v3);

  if (v4)
  {
    uint64_t v5 = [v1 template];
    float v6 = [v5 uniqueName];
    unint64_t v7 = ACHMonthlyChallengeTypeFromTemplateUniqueName(v6);

    BOOL v8 = 1;
    if (v7 <= 0x16)
    {
      if (((1 << v7) & 0x500060) != 0)
      {
        unsigned int v9 = [v1 customPlaceholderValues];
        unint64_t v10 = [v9 objectForKeyedSubscript:@"reference_progress_value"];

        [v10 doubleValue];
        BOOL v8 = v11 > 0.0;
      }
      else
      {
        BOOL v8 = v7 != 0;
      }
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

uint64_t ACHMonthlyChallengeTypeFromTemplateUniqueName(void *a1)
{
  id v1 = ACHMonthlyChallengeTypeNameFromUniqueName(a1);
  if ([v1 isEqualToString:@"MonthlyChallengeTypeAllThreeRings"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeMoveRing"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeExerciseRing"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeStandRing"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalEnergyBurn"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalExerciseMinutes"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalWorkouts"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutRunning"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutOpenWaterSwimming"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutPoolSwimming"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutOutdoorCycling"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutIndoorCycling"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutHIIT"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutYoga"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutHiking"])
  {
    uint64_t v2 = 15;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutElliptical"])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutRowing"])
  {
    uint64_t v2 = 17;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutStairs"])
  {
    uint64_t v2 = 18;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutWalking"])
  {
    uint64_t v2 = 19;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalDistance"])
  {
    uint64_t v2 = 20;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeDaysDoublingMoveGoal"])
  {
    uint64_t v2 = 21;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalMoveTime"])
  {
    uint64_t v2 = 22;
  }
  else if ([v1 isEqual:@"MonthlyChallengeTypeDaysDoublingExerciseGoal"])
  {
    uint64_t v2 = 23;
  }
  else if ([v1 isEqual:@"MonthlyChallengeTypeMoveStreak"])
  {
    uint64_t v2 = 24;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeDailyEnergyBurnTarget"])
  {
    uint64_t v2 = 25;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeDailyExerciseMinutesTarget"])
  {
    uint64_t v2 = 26;
  }
  else if ([v1 isEqual:@"MonthlyChallengeTypeDailyDistanceTarget"])
  {
    uint64_t v2 = 27;
  }
  else if ([v1 isEqual:@"MonthlyChallengeTypeDailyAppleMoveTimeTarget"])
  {
    uint64_t v2 = 28;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id ACHMonthlyChallengeTypeNameFromUniqueName(void *a1)
{
  id v1 = [a1 componentsSeparatedByString:@"_"];
  uint64_t v2 = [v1 firstObject];

  return v2;
}

void sub_21F590598(_Unwind_Exception *a1)
{
}

id ACHFormatCount(void *a1)
{
  uint64_t v1 = ACHFormatCount_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&ACHFormatCount_onceToken, &__block_literal_global_452);
  }
  id v3 = [(id)ACHFormatCount__formatter stringFromNumber:v2];

  return v3;
}

BOOL ACHIsActivityAchievementPrerelease(void *a1)
{
  uint64_t v1 = [a1 template];
  unsigned int v2 = [v1 minimumEngineVersion];

  id v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.nanolifestyle"];
  uint64_t v4 = [v3 valueForKey:@"AchievementsReleaseEngineVersion"];
  uint64_t v5 = v4;
  if (v4) {
    unsigned int v6 = [v4 integerValue];
  }
  else {
    unsigned int v6 = 14;
  }
  BOOL v7 = v6 < v2;

  return v7;
}

uint64_t __ACHFormatCount_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v1 = (void *)ACHFormatCount__formatter;
  ACHFormatCount__formatter = (uint64_t)v0;

  [(id)ACHFormatCount__formatter setNumberStyle:1];
  [(id)ACHFormatCount__formatter setRoundingMode:3];
  unsigned int v2 = (void *)ACHFormatCount__formatter;

  return [v2 setMaximumFractionDigits:0];
}

uint64_t __ACHLogDefault_block_invoke()
{
  ACHLogDefault_category = (uint64_t)os_log_create("com.apple.ActivityAchievements", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __ACHLogAssets_block_invoke()
{
  ACHLogAssets_category = (uint64_t)os_log_create("com.apple.ActivityAchievements", "assets");

  return MEMORY[0x270F9A758]();
}

id ACHLegacyDefinitionIdentifierForTemplateUniqueName(void *a1)
{
  uint64_t v1 = ACHStrippedTemplateUniqueName(a1);
  if (ACHLegacyDefinitionIdentifierForTemplateUniqueName_onceToken != -1) {
    dispatch_once(&ACHLegacyDefinitionIdentifierForTemplateUniqueName_onceToken, &__block_literal_global);
  }
  unsigned int v2 = [(id)ACHLegacyDefinitionIdentifierForTemplateUniqueName_mappingDictionary objectForKeyedSubscript:v1];

  return v2;
}

__CFString *ACHStrippedTemplateUniqueName(void *a1)
{
  id v1 = a1;
  if ([v1 containsString:@"FirstWorkout-"])
  {
    unsigned int v2 = @"FirstWorkout";
  }
  else if ([v1 containsString:@"BestWorkout-"])
  {
    unsigned int v2 = @"BestWorkout";
  }
  else if ([v1 containsString:@"PerfectMonth-"])
  {
    unsigned int v2 = @"PerfectMonth";
  }
  else
  {
    unsigned int v2 = (__CFString *)v1;
  }

  return v2;
}

void __ACHLegacyDefinitionIdentifierForTemplateUniqueName_block_invoke()
{
  id v0 = (void *)ACHLegacyDefinitionIdentifierForTemplateUniqueName_mappingDictionary;
  ACHLegacyDefinitionIdentifierForTemplateUniqueName_mappingDictionary = (uint64_t)&unk_26D0FAF38;
}

id ACHTemplateUniqueNameForLegacyAchievementInfo(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a1;
  BOOL v8 = a3;
  id v9 = a4;
  if (([v7 isEqualToString:@"HKAchievementTypeBestSessionCalories"] & 1) != 0
    || [v7 isEqualToString:@"HKAchievementTypeFirstSessionOfType"])
  {
    if ([v7 isEqualToString:@"HKAchievementTypeBestSessionCalories"]) {
      unint64_t v10 = @"BestWorkout";
    }
    else {
      unint64_t v10 = @"FirstWorkout";
    }
    double v11 = [MEMORY[0x263F0A8F8] _stringFromWorkoutActivityType:a2];
    unint64_t v12 = [NSString stringWithFormat:@"%@-%@", v10, v11];
LABEL_7:
    char v13 = v12;
    goto LABEL_8;
  }
  if ([v7 containsString:@"MonthlyChallenge"])
  {
    uint64_t v15 = @"MonthlyChallengeTypeAllThreeRings";
    if (v8) {
      uint64_t v15 = v8;
    }
    double v11 = v15;
    int v16 = [v7 componentsSeparatedByString:@"_"];
    if ([v16 count] == 3)
    {
      unint64_t v17 = ACHMonthlyChallengeTypeFromLegacyString(v11);
      uint64_t v30 = [v16 objectAtIndexedSubscript:1];
      unsigned int v29 = [v16 objectAtIndexedSubscript:2];
      uint64_t v18 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
      unint64_t v26 = ACHDateComponentsForYearMonthDay([v30 integerValue], objc_msgSend(v29, "integerValue"), 1);
      char v28 = [v18 dateFromComponents:v26];
      char v27 = objc_msgSend(v18, "hk_startOfMonthForDate:addingMonths:", v28, 1);
      uint64_t v19 = objc_msgSend(v18, "hk_startOfDateBySubtractingDays:fromDate:", 1, v27);
      unint64_t v20 = [v18 components:28 fromDate:v19];
      char v21 = [[ACHDateComponentInterval alloc] initWithStartDateComponents:v26 endDateComponents:v20];
      unsigned int v22 = ACHMonthlyChallengeTemplate(v17, v21, 0.0);
      char v13 = [v22 uniqueName];
    }
    else
    {
      char v13 = 0;
    }

    BOOL v8 = v11;
  }
  else
  {
    if (![v7 containsString:@"HKAchievementTypeDailyGoalCompleteMonth"])
    {
      double v11 = (__CFString *)v7;
      if (ACHActivityTemplateUniqueName_onceToken != -1) {
        dispatch_once(&ACHActivityTemplateUniqueName_onceToken, &__block_literal_global_434);
      }
      unint64_t v12 = [(id)ACHActivityTemplateUniqueName_mappingDictionary objectForKeyedSubscript:v11];
      if (!v12)
      {
        unint64_t v12 = v11;
        double v11 = v12;
      }
      goto LABEL_7;
    }
    uint64_t v23 = ACHPerfectMonthUniqueName_onceToken;
    id v24 = v9;
    if (v23 != -1) {
      dispatch_once(&ACHPerfectMonthUniqueName_onceToken, &__block_literal_global_429);
    }
    objc_msgSend((id)ACHPerfectMonthUniqueName_utcCalendar, "hk_dateBySubtractingDays:fromDate:", 1, v24);
    double v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v25 = [(id)ACHPerfectMonthUniqueName_utcCalendar components:12 fromDate:v11];
    char v13 = objc_msgSend(NSString, "stringWithFormat:", @"PerfectMonth_%04ld_%02ld", objc_msgSend(v25, "year"), objc_msgSend(v25, "month"));
  }
LABEL_8:

  return v13;
}

uint64_t ACHWorkoutActivityTypeForTemplateUniqueName(void *a1)
{
  id v1 = a1;
  if ([v1 containsString:@"Workout"])
  {
    unsigned int v2 = [v1 componentsSeparatedByString:@"-"];
    id v3 = (void *)MEMORY[0x263F0A8F8];
    uint64_t v4 = [v2 lastObject];
    uint64_t v5 = [v3 _workoutActivityTypeFromString:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

ACHCodableLegacyAchievement *ACHBackCompatCodableAchievement(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  BOOL v8 = [v6 uniqueName];
  id v9 = ACHLegacyDefinitionIdentifierForTemplateUniqueName(v8);

  if (v9)
  {
    unint64_t v10 = objc_alloc_init(ACHCodableLegacyAchievement);
    double v11 = [MEMORY[0x263F08C38] UUID];
    unint64_t v12 = objc_msgSend(v11, "hk_dataForUUIDBytes");
    [(ACHCodableLegacyAchievement *)v10 setUuid:v12];

    [(ACHCodableLegacyAchievement *)v10 setDefinitionIdentifier:v9];
    char v13 = [v5 earnedDateComponents];
    char v14 = [v7 dateFromComponents:v13];
    [v14 timeIntervalSinceReferenceDate];
    -[ACHCodableLegacyAchievement setCompletedDate:](v10, "setCompletedDate:");

    uint64_t v15 = [v6 uniqueName];
    [(ACHCodableLegacyAchievement *)v10 setWorkoutActivityType:ACHWorkoutActivityTypeForTemplateUniqueName(v15)];

    [(ACHCodableLegacyAchievement *)v10 setAlerted:1];
    int v16 = [v6 canonicalUnit];

    if (v16)
    {
      unint64_t v17 = [v5 value];
      uint64_t v18 = [v6 canonicalUnit];
      [v17 doubleValueForUnit:v18];
      double v20 = v19;

      [(ACHCodableLegacyAchievement *)v10 setDoubleValue:v20];
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

ACHEarnedInstance *ACHEarnedInstanceFromBackCompatCodableAchievement(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 definitionIdentifier];
  uint64_t v6 = [v3 workoutActivityType];
  id v7 = (void *)MEMORY[0x263EFF910];
  [v3 completedDate];
  BOOL v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  id v9 = ACHTemplateUniqueNameForLegacyAchievementInfo(v5, v6, 0, v8);

  if (!v9)
  {
    unint64_t v10 = 0;
    goto LABEL_12;
  }
  unint64_t v10 = objc_alloc_init(ACHEarnedInstance);
  [(ACHEarnedInstance *)v10 setTemplateUniqueName:v9];
  double v11 = (void *)MEMORY[0x263EFF910];
  [v3 completedDate];
  unint64_t v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
  char v13 = [v4 components:28 fromDate:v12];
  [(ACHEarnedInstance *)v10 setEarnedDateComponents:v13];

  char v14 = [MEMORY[0x263EFF910] date];
  [(ACHEarnedInstance *)v10 setCreatedDate:v14];

  [(ACHEarnedInstance *)v10 setCreatorDevice:1];
  uint64_t v15 = ACHStrippedTemplateUniqueName(v9);
  if (ACHCanonicalUnitForTemplateUniqueName_onceToken != -1) {
    dispatch_once(&ACHCanonicalUnitForTemplateUniqueName_onceToken, &__block_literal_global_440);
  }
  int v16 = [(id)ACHCanonicalUnitForTemplateUniqueName_mappingDictionary objectForKeyedSubscript:v15];

  if (v16)
  {
    if ([v3 hasDoubleValue])
    {
      unint64_t v17 = (void *)MEMORY[0x263F0A630];
      [v3 doubleValue];
LABEL_10:
      double v19 = [v17 quantityWithUnit:v16 doubleValue:v18];
      [(ACHEarnedInstance *)v10 setValue:v19];

      goto LABEL_11;
    }
    if ([v3 hasIntValue])
    {
      unint64_t v17 = (void *)MEMORY[0x263F0A630];
      double v18 = (double)[v3 intValue];
      goto LABEL_10;
    }
  }
LABEL_11:

LABEL_12:

  return v10;
}

uint64_t __ACHPerfectMonthUniqueName_block_invoke()
{
  ACHPerfectMonthUniqueName_utcCalendar = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithUTCTimeZone");

  return MEMORY[0x270F9A758]();
}

void __ACHActivityTemplateUniqueName_block_invoke()
{
  id v0 = (void *)ACHActivityTemplateUniqueName_mappingDictionary;
  ACHActivityTemplateUniqueName_mappingDictionary = (uint64_t)&unk_26D0FAF60;
}

void __ACHCanonicalUnitForTemplateUniqueName_block_invoke()
{
  v20[17] = *MEMORY[0x263EF8340];
  v19[0] = @"NewMoveGoalAchieved";
  double v18 = [MEMORY[0x263F0A830] kilocalorieUnit];
  v20[0] = v18;
  v19[1] = @"NewMoveRecord";
  unint64_t v17 = [MEMORY[0x263F0A830] kilocalorieUnit];
  v20[1] = v17;
  v19[2] = @"NewExerciseRecord";
  int v16 = [MEMORY[0x263F0A830] minuteUnit];
  v20[2] = v16;
  v19[3] = @"LongestMoveStreak";
  uint64_t v15 = [MEMORY[0x263F0A830] countUnit];
  v20[3] = v15;
  v19[4] = @"MoveGoal200Percent";
  char v14 = [MEMORY[0x263F0A830] kilocalorieUnit];
  v20[4] = v14;
  v19[5] = @"MoveGoal300Percent";
  char v13 = [MEMORY[0x263F0A830] kilocalorieUnit];
  v20[5] = v13;
  v19[6] = @"MoveGoal400Percent";
  unint64_t v12 = [MEMORY[0x263F0A830] kilocalorieUnit];
  v20[6] = v12;
  v19[7] = @"PerfectWeekMove";
  id v0 = [MEMORY[0x263F0A830] countUnit];
  v20[7] = v0;
  v19[8] = @"PerfectWeekExercise";
  id v1 = [MEMORY[0x263F0A830] countUnit];
  v20[8] = v1;
  v19[9] = @"PerfectWeekStand";
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  v20[9] = v2;
  v19[10] = @"PerfectWeekAll";
  id v3 = [MEMORY[0x263F0A830] countUnit];
  v20[10] = v3;
  v19[11] = @"100MoveGoals";
  id v4 = [MEMORY[0x263F0A830] countUnit];
  v20[11] = v4;
  v19[12] = @"365MoveGoals";
  id v5 = [MEMORY[0x263F0A830] countUnit];
  v20[12] = v5;
  v19[13] = @"500MoveGoals";
  uint64_t v6 = [MEMORY[0x263F0A830] countUnit];
  v20[13] = v6;
  v19[14] = @"1000MoveGoals";
  id v7 = [MEMORY[0x263F0A830] countUnit];
  v20[14] = v7;
  v19[15] = @"7WorkoutWeek";
  BOOL v8 = [MEMORY[0x263F0A830] countUnit];
  v20[15] = v8;
  v19[16] = @"BestWorkout";
  id v9 = [MEMORY[0x263F0A830] kilocalorieUnit];
  v20[16] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:17];
  double v11 = (void *)ACHCanonicalUnitForTemplateUniqueName_mappingDictionary;
  ACHCanonicalUnitForTemplateUniqueName_mappingDictionary = v10;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t __ACHLogAwardEngine_block_invoke()
{
  ACHLogAwardEngine_category = (uint64_t)os_log_create("com.apple.ActivityAchievements", "awarding");

  return MEMORY[0x270F9A758]();
}

id ACHLogAwardScheduling()
{
  if (ACHLogAwardScheduling_onceToken != -1) {
    dispatch_once(&ACHLogAwardScheduling_onceToken, &__block_literal_global_287);
  }
  id v0 = (void *)ACHLogAwardScheduling_category;

  return v0;
}

uint64_t __ACHLogAwardScheduling_block_invoke()
{
  ACHLogAwardScheduling_category = (uint64_t)os_log_create("com.apple.ActivityAchievements", "award_scheduling");

  return MEMORY[0x270F9A758]();
}

id ACHLogDatabase()
{
  if (ACHLogDatabase_onceToken != -1) {
    dispatch_once(&ACHLogDatabase_onceToken, &__block_literal_global_290);
  }
  id v0 = (void *)ACHLogDatabase_category;

  return v0;
}

uint64_t __ACHLogDatabase_block_invoke()
{
  ACHLogDatabase_category = (uint64_t)os_log_create("com.apple.ActivityAchievements", "database");

  return MEMORY[0x270F9A758]();
}

id ACHLogMonthlyChallenges()
{
  if (ACHLogMonthlyChallenges_onceToken != -1) {
    dispatch_once(&ACHLogMonthlyChallenges_onceToken, &__block_literal_global_293);
  }
  id v0 = (void *)ACHLogMonthlyChallenges_category;

  return v0;
}

uint64_t __ACHLogMonthlyChallenges_block_invoke()
{
  ACHLogMonthlyChallenges_category = (uint64_t)os_log_create("com.apple.ActivityAchievements", "monthly_challenges");

  return MEMORY[0x270F9A758]();
}

id ACHLogSync()
{
  if (ACHLogSync_onceToken != -1) {
    dispatch_once(&ACHLogSync_onceToken, &__block_literal_global_296);
  }
  id v0 = (void *)ACHLogSync_category;

  return v0;
}

uint64_t __ACHLogSync_block_invoke()
{
  ACHLogSync_category = (uint64_t)os_log_create("com.apple.ActivityAchievements", "sync");

  return MEMORY[0x270F9A758]();
}

id ACHLogTemplates()
{
  if (ACHLogTemplates_onceToken != -1) {
    dispatch_once(&ACHLogTemplates_onceToken, &__block_literal_global_299);
  }
  id v0 = (void *)ACHLogTemplates_category;

  return v0;
}

uint64_t __ACHLogTemplates_block_invoke()
{
  ACHLogTemplates_category = (uint64_t)os_log_create("com.apple.ActivityAchievements", "templates");

  return MEMORY[0x270F9A758]();
}

id ACHLogWorkouts()
{
  if (ACHLogWorkouts_onceToken != -1) {
    dispatch_once(&ACHLogWorkouts_onceToken, &__block_literal_global_302);
  }
  id v0 = (void *)ACHLogWorkouts_category;

  return v0;
}

uint64_t __ACHLogWorkouts_block_invoke()
{
  ACHLogWorkouts_category = (uint64_t)os_log_create("com.apple.ActivityAchievements", "workouts");

  return MEMORY[0x270F9A758]();
}

id ACHLogXPC()
{
  if (ACHLogXPC_onceToken != -1) {
    dispatch_once(&ACHLogXPC_onceToken, &__block_literal_global_305);
  }
  id v0 = (void *)ACHLogXPC_category;

  return v0;
}

uint64_t __ACHLogXPC_block_invoke()
{
  ACHLogXPC_category = (uint64_t)os_log_create("com.apple.ActivityAchievements", "xpc");

  return MEMORY[0x270F9A758]();
}

id ACHLogUI()
{
  if (ACHLogUI_onceToken != -1) {
    dispatch_once(&ACHLogUI_onceToken, &__block_literal_global_308);
  }
  id v0 = (void *)ACHLogUI_category;

  return v0;
}

uint64_t __ACHLogUI_block_invoke()
{
  ACHLogUI_category = (uint64_t)os_log_create("com.apple.ActivityAchievements", "ui");

  return MEMORY[0x270F9A758]();
}

id ACHLogMetrics()
{
  if (ACHLogMetrics_onceToken != -1) {
    dispatch_once(&ACHLogMetrics_onceToken, &__block_literal_global_311);
  }
  id v0 = (void *)ACHLogMetrics_category;

  return v0;
}

uint64_t __ACHLogMetrics_block_invoke()
{
  ACHLogMetrics_category = (uint64_t)os_log_create("com.apple.ActivityAchievements", "metrics");

  return MEMORY[0x270F9A758]();
}

uint64_t __ACHLogProgress_block_invoke()
{
  ACHLogProgress_category = (uint64_t)os_log_create("com.apple.ActivityAchievements", "progress");

  return MEMORY[0x270F9A758]();
}

id ACHLogCleanup()
{
  if (ACHLogCleanup_onceToken != -1) {
    dispatch_once(&ACHLogCleanup_onceToken, &__block_literal_global_317);
  }
  id v0 = (void *)ACHLogCleanup_category;

  return v0;
}

uint64_t __ACHLogCleanup_block_invoke()
{
  ACHLogCleanup_category = (uint64_t)os_log_create("com.apple.ActivityAchievements", "cleanup");

  return MEMORY[0x270F9A758]();
}

BOOL ACHCodablePlaceholderValueReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        double v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

ACHTemplate *NewMoveGoalAchievedTemplate()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"NewMoveGoalAchieved"];
  [(ACHTemplate *)v0 setVersion:7];
  [(ACHTemplate *)v0 setMinimumEngineVersion:12];
  [(ACHTemplate *)v0 setPredicate:@"todayMoveValue >= todayMoveGoal && todayMoveGoal > previousBestMoveGoal"];
  [(ACHTemplate *)v0 setGracePredicate:@"todayActivityMoveMode != 2 && todayMoveValue >= todayMoveGoal && todayMoveGoal > previousBestMoveGoal"];
  [(ACHTemplate *)v0 setValueExpression:@"todayMoveGoal"];
  [(ACHTemplate *)v0 setProgressExpression:@"todayMoveValue"];
  [(ACHTemplate *)v0 setGoalExpression:@"todayMoveGoal"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"TRUEPREDICATE"];
  id v1 = [NSString stringWithFormat:@"activityMoveMode != 2 && %@", @"earnedInstanceCount == 0"];
  [(ACHTemplate *)v0 setGraceVisibilityPredicate:v1];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:16];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] kilocalorieUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:6];

  return v0;
}

ACHTemplate *DailyMoveRecordTemplate()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"NewMoveRecord"];
  [(ACHTemplate *)v0 setVersion:6];
  [(ACHTemplate *)v0 setMinimumEngineVersion:2];
  [(ACHTemplate *)v0 setPredicate:@"todayMoveValue > bestMoveValue && bestMoveValue >= 10 && totalDaysOfMoveHistory >= requiredDaysOfActivityHistoryForRecords"];
  [(ACHTemplate *)v0 setGracePredicate:@"todayActivityMoveMode != 2 && todayMoveValue > bestMoveValue && bestMoveValue >= 10 && totalDaysOfMoveHistory >= requiredDaysOfActivityHistoryForRecords"];
  [(ACHTemplate *)v0 setValueExpression:@"todayMoveValue"];
  [(ACHTemplate *)v0 setProgressExpression:@"todayMoveValue"];
  [(ACHTemplate *)v0 setGoalExpression:@"bestMoveValue"];
  [(ACHTemplate *)v0 setTriggers:128];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"TRUEPREDICATE"];
  [(ACHTemplate *)v0 setGraceVisibilityPredicate:@"activityMoveMode != 2"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:2];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:16];
  [(ACHTemplate *)v0 setEarnDateStrategy:2];
  id v1 = [MEMORY[0x263F0A830] kilocalorieUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplayOrder:1];

  return v0;
}

ACHTemplate *NewMoveTimeGoalAchievedTemplate()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"NewMoveTimeGoalAchieved"];
  [(ACHTemplate *)v0 setVersion:6];
  [(ACHTemplate *)v0 setMinimumEngineVersion:12];
  [(ACHTemplate *)v0 setPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setGracePredicate:@"todayActivityMoveMode == 2 && todayMoveTimeValue >= todayMoveTimeGoal && todayMoveTimeGoal > previousBestMoveTimeGoal"];
  [(ACHTemplate *)v0 setGraceValueExpression:@"todayMoveTimeGoal"];
  [(ACHTemplate *)v0 setGraceProgressExpression:@"todayMoveTimeValue"];
  [(ACHTemplate *)v0 setGraceGoalExpression:@"todayMoveTimeGoal"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  id v1 = [NSString stringWithFormat:@"activityMoveMode == 2 && %@", @"earnedInstanceCount == 0"];
  [(ACHTemplate *)v0 setGraceVisibilityPredicate:v1];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:16];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] minuteUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:6];

  return v0;
}

ACHTemplate *DailyMoveTimeRecordTemplate()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"NewMoveTimeRecord"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:2];
  [(ACHTemplate *)v0 setPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setGracePredicate:@"todayActivityMoveMode == 2 && todayMoveTimeValue > bestMoveTimeValue && bestMoveTimeValue >= 10 && totalDaysOfMoveHistory >= requiredDaysOfActivityHistoryForRecords"];
  [(ACHTemplate *)v0 setGraceValueExpression:@"todayMoveTimeValue"];
  [(ACHTemplate *)v0 setGraceProgressExpression:@"todayMoveTimeValue"];
  [(ACHTemplate *)v0 setGraceGoalExpression:@"bestMoveTimeValue"];
  [(ACHTemplate *)v0 setTriggers:512];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setGraceVisibilityPredicate:@"activityMoveMode == 2"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:2];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:16];
  [(ACHTemplate *)v0 setEarnDateStrategy:2];
  id v1 = [MEMORY[0x263F0A830] minuteUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplayOrder:1];

  return v0;
}

ACHTemplate *DailyExerciseRecordTemplate()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"NewExerciseRecord"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:6];
  [(ACHTemplate *)v0 setPredicate:@"todayExerciseValue > bestExerciseValue && totalDaysOfExerciseHistory >= requiredDaysOfActivityHistoryForRecords && todayIsStandalonePhoneFitnessMode == NO"];
  [(ACHTemplate *)v0 setValueExpression:@"todayExerciseValue"];
  [(ACHTemplate *)v0 setProgressExpression:@"todayExerciseValue"];
  [(ACHTemplate *)v0 setGoalExpression:@"bestExerciseValue"];
  [(ACHTemplate *)v0 setTriggers:256];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"isStandalonePhoneFitnessMode == NO"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:2];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:16];
  [(ACHTemplate *)v0 setEarnDateStrategy:2];
  id v1 = [MEMORY[0x263F0A830] minuteUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplayOrder:2];

  return v0;
}

ACHTemplate *LongestMoveStreakTemplate()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"LongestMoveStreak"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:1];
  [(ACHTemplate *)v0 setPredicate:@"currentMoveStreak > previousBestMoveStreak && currentMoveStreak >= requiredDaysOfActivityHistoryForStreaks"];
  [(ACHTemplate *)v0 setValueExpression:@"currentMoveStreak"];
  [(ACHTemplate *)v0 setProgressExpression:@"currentMoveStreak"];
  [(ACHTemplate *)v0 setGoalExpression:@"TERNARY(bestMoveStreak + 1 > 8, bestMoveStreak + 1, 8)"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"TRUEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:2];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:16];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplayOrder:7];

  return v0;
}

ACHTemplate *MoveGoal200PercentTemplate()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"MoveGoal200Percent"];
  [(ACHTemplate *)v0 setVersion:5];
  [(ACHTemplate *)v0 setMinimumEngineVersion:1];
  id v1 = [NSString stringWithFormat:@"currentMovePercentage >= %@ && previousMovePercentage < %@", @"2.0", @"2.0"];
  [(ACHTemplate *)v0 setPredicate:v1];

  [(ACHTemplate *)v0 setValueExpression:@"2.0*todayMoveGoal"];
  [(ACHTemplate *)v0 setProgressExpression:@"todayMoveValue"];
  [(ACHTemplate *)v0 setGoalExpression:@"2.0*todayMoveGoal"];
  [(ACHTemplate *)v0 setGraceValueExpression:@"2.0*todayAgnosticMoveGoal"];
  [(ACHTemplate *)v0 setGraceProgressExpression:@"todayAgnosticMoveValue"];
  [(ACHTemplate *)v0 setGraceGoalExpression:@"2.0*todayAgnosticMoveGoal"];
  [(ACHTemplate *)v0 setTriggers:8];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"TRUEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:16];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] kilocalorieUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:3];

  return v0;
}

ACHTemplate *MoveGoal300PercentTemplate()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"MoveGoal300Percent"];
  [(ACHTemplate *)v0 setVersion:6];
  [(ACHTemplate *)v0 setMinimumEngineVersion:13];
  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"MoveGoal200Percent"];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  id v1 = [NSString stringWithFormat:@"currentMovePercentage >= %@ && previousMovePercentage < %@", @"3.0", @"3.0"];
  [(ACHTemplate *)v0 setPredicate:v1];

  [(ACHTemplate *)v0 setValueExpression:@"3.0*todayMoveGoal"];
  [(ACHTemplate *)v0 setProgressExpression:@"todayMoveValue"];
  [(ACHTemplate *)v0 setGoalExpression:@"3.0*todayMoveGoal"];
  [(ACHTemplate *)v0 setGraceValueExpression:@"3.0*todayAgnosticMoveGoal"];
  [(ACHTemplate *)v0 setGraceProgressExpression:@"todayAgnosticMoveValue"];
  [(ACHTemplate *)v0 setGraceGoalExpression:@"3.0*todayAgnosticMoveGoal"];
  [(ACHTemplate *)v0 setTriggers:8];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:16];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] kilocalorieUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:4];

  return v0;
}

ACHTemplate *MoveGoal400PercentTemplate()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"MoveGoal400Percent"];
  [(ACHTemplate *)v0 setVersion:5];
  [(ACHTemplate *)v0 setMinimumEngineVersion:13];
  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"MoveGoal300Percent"];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  id v1 = [NSString stringWithFormat:@"currentMovePercentage >= %@ && previousMovePercentage < %@", @"4.0", @"4.0"];
  [(ACHTemplate *)v0 setPredicate:v1];

  [(ACHTemplate *)v0 setValueExpression:@"4.0*todayMoveGoal"];
  [(ACHTemplate *)v0 setProgressExpression:@"todayMoveValue"];
  [(ACHTemplate *)v0 setGoalExpression:@"4.0*todayMoveGoal"];
  [(ACHTemplate *)v0 setGraceValueExpression:@"4.0*todayAgnosticMoveGoal"];
  [(ACHTemplate *)v0 setGraceProgressExpression:@"todayAgnosticMoveValue"];
  [(ACHTemplate *)v0 setGraceGoalExpression:@"4.0*todayAgnosticMoveGoal"];
  [(ACHTemplate *)v0 setTriggers:8];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"TRUEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:16];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] kilocalorieUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:5];

  return v0;
}

ACHTemplate *PerfectWeekMoveTemplate()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"PerfectWeekMove"];
  [(ACHTemplate *)v0 setVersion:3];
  [(ACHTemplate *)v0 setMinimumEngineVersion:12];
  [(ACHTemplate *)v0 setPredicate:@"currentMoveStreak >= 7 && dayOfWeekForToday == dayOfWeekForLastDayOfFitnessWeek"];
  [(ACHTemplate *)v0 setProgressExpression:@"currentWeekMoveStreak"];
  [(ACHTemplate *)v0 setGoalExpression:@"7"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"TRUEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:0x2000];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:8];

  return v0;
}

ACHTemplate *PerfectWeekExerciseTemplate()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"PerfectWeekExercise"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:12];
  [(ACHTemplate *)v0 setPredicate:@"currentExerciseStreak >= 7 && dayOfWeekForToday == dayOfWeekForLastDayOfFitnessWeek && todayIsStandalonePhoneFitnessMode == NO"];
  [(ACHTemplate *)v0 setProgressExpression:@"currentWeekExerciseStreak"];
  [(ACHTemplate *)v0 setGoalExpression:@"7"];
  [(ACHTemplate *)v0 setTriggers:16];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"isStandalonePhoneFitnessMode == NO"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:0x2000];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:9];

  return v0;
}

ACHTemplate *PerfectWeekStandTemplate()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"PerfectWeekStand"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:12];
  [(ACHTemplate *)v0 setPredicate:@"currentStandStreak >= 7 && dayOfWeekForToday == dayOfWeekForLastDayOfFitnessWeek && todayIsStandalonePhoneFitnessMode == NO"];
  [(ACHTemplate *)v0 setProgressExpression:@"currentWeekStandStreak"];
  [(ACHTemplate *)v0 setGoalExpression:@"7"];
  [(ACHTemplate *)v0 setTriggers:32];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"isStandalonePhoneFitnessMode == NO"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:0x2000];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:10];

  return v0;
}

ACHTemplate *PerfectWeekAllTemplate()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"PerfectWeekAll"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:12];
  [(ACHTemplate *)v0 setPredicate:@"currentStreakForAllActivity >= 7 && dayOfWeekForToday == dayOfWeekForLastDayOfFitnessWeek && todayIsStandalonePhoneFitnessMode == NO"];
  [(ACHTemplate *)v0 setProgressExpression:@"currentWeekStreakForAllActivity"];
  [(ACHTemplate *)v0 setGoalExpression:@"7"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"isStandalonePhoneFitnessMode == NO"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:0x2000];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:11];

  return v0;
}

ACHTemplate *HundredMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"100MoveGoals"];
  [(ACHTemplate *)v0 setVersion:3];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 100"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"100"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:100];

  return v0;
}

ACHTemplate *ThreeHundredSixtyFiveMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"365MoveGoals"];
  [(ACHTemplate *)v0 setVersion:3];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 365"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"365"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"100MoveGoals"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:101];

  return v0;
}

ACHTemplate *FiveHundredMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"500MoveGoals"];
  [(ACHTemplate *)v0 setVersion:3];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 500"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"500"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"365MoveGoals"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:102];

  return v0;
}

ACHTemplate *ThousandMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"1000MoveGoals"];
  [(ACHTemplate *)v0 setVersion:3];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 1000"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"1000"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"500MoveGoals"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:103];

  return v0;
}

ACHTemplate *TwelveFiftyMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"1250MoveGoals"];
  [(ACHTemplate *)v0 setVersion:3];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 1250"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"1250"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"1000MoveGoals"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:104];

  return v0;
}

ACHTemplate *FifteenHundredMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"1500MoveGoals"];
  [(ACHTemplate *)v0 setVersion:3];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 1500"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"1500"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"1250MoveGoals"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:105];

  return v0;
}

ACHTemplate *SeventeenFiftyMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"1750MoveGoals"];
  [(ACHTemplate *)v0 setVersion:3];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 1750"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"1750"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"1500MoveGoals"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:106];

  return v0;
}

ACHTemplate *TwoThousandMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"2000MoveGoals"];
  [(ACHTemplate *)v0 setVersion:3];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 2000"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"2000"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"1750MoveGoals"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:107];

  return v0;
}

ACHTemplate *TwentyTwoFiftyMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"2250MoveGoals"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 2250"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"2250"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"2000MoveGoals"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:108];

  return v0;
}

ACHTemplate *TwentyFiveHundredMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"2500MoveGoals"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 2500"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"2500"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"2250MoveGoals"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:109];

  return v0;
}

ACHTemplate *TwentySevenFiftyMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"2750MoveGoals"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 2750"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"2750"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"2500MoveGoals"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:110];

  return v0;
}

ACHTemplate *ThreeThousandMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"3000MoveGoals"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 3000"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"3000"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"2750MoveGoals"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:111];

  return v0;
}

ACHTemplate *ThreeThousandTwoHundredFiftyMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"3250MoveGoals"];
  [(ACHTemplate *)v0 setVersion:3];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 3250"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"3250"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"3000MoveGoals"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:112];

  return v0;
}

ACHTemplate *ThreeThousandFiveHundredMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"3500MoveGoals"];
  [(ACHTemplate *)v0 setVersion:3];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 3500"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"3500"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"3250MoveGoals"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:113];

  return v0;
}

ACHTemplate *ThreeThousandSevenHundredFiftyMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"3750MoveGoals"];
  [(ACHTemplate *)v0 setVersion:3];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 3750"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"3750"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"3500MoveGoals"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:114];

  return v0;
}

ACHTemplate *FourThousandMoveGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"4000MoveGoals"];
  [(ACHTemplate *)v0 setVersion:3];
  [(ACHTemplate *)v0 setMinimumEngineVersion:11];
  [(ACHTemplate *)v0 setPredicate:@"totalMoveGoalsMet == 4000"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalMoveGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"4000"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"3750MoveGoals"];
  [(ACHTemplate *)v0 setTriggers:4];
  [(ACHTemplate *)v0 setEarnLimit:1];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:115];

  return v0;
}

ACHTemplate *HundredAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"100AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 100"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"100"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:12];

  return v0;
}

ACHTemplate *ThreeHundredSixtyFiveAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"365AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 365"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"365"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"100AllGoals"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:13];

  return v0;
}

ACHTemplate *FiveHundredAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"500AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 500"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"500"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"365AllGoals"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:14];

  return v0;
}

ACHTemplate *ThousandAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"1000AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 1000"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"1000"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"500AllGoals"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:15];

  return v0;
}

ACHTemplate *TwelveFiftyAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"1250AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 1250"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"1250"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"1000AllGoals"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:16];

  return v0;
}

ACHTemplate *FifteenHundredAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"1500AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 1500"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"1500"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"1250AllGoals"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:17];

  return v0;
}

ACHTemplate *SeventeenFiftyAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"1750AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 1750"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"1750"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"1500AllGoals"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:18];

  return v0;
}

ACHTemplate *TwoThousandAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"2000AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 2000"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"2000"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"1750AllGoals"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:19];

  return v0;
}

ACHTemplate *TwentyTwoFiftyAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"2250AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 2250"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"2250"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"2000AllGoals"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:20];

  return v0;
}

ACHTemplate *TwentyFiveHundredAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"2500AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 2500"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"2500"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"2250AllGoals"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:21];

  return v0;
}

ACHTemplate *TwentySevenFiftyAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"2750AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 2750"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"2750"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"2500AllGoals"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:22];

  return v0;
}

ACHTemplate *ThreeThousandAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"3000AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 3000"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"3000"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"2750AllGoals"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:23];

  return v0;
}

ACHTemplate *ThreeThousandTwoHundredFiftyAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"3250AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 3250"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"3250"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"3000AllGoals"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:24];

  return v0;
}

ACHTemplate *ThreeThousandFiveHundredAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"3500AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 3500"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"3500"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"3250AllGoals"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:25];

  return v0;
}

ACHTemplate *ThreeThousandSevenHundredFiftyAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"3750AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 3750"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"3750"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"3500AllGoals"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:26];

  return v0;
}

ACHTemplate *FourThousandAllGoals()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"4000AllGoals"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:14];
  [(ACHTemplate *)v0 setPredicate:@"totalAllGoalsMet == 4000"];
  [(ACHTemplate *)v0 setProgressExpression:@"totalAllGoalsMet"];
  [(ACHTemplate *)v0 setGoalExpression:@"4000"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setPrerequisiteTemplateName:@"3750AllGoals"];
  [(ACHTemplate *)v0 setTriggers:64];
  [(ACHTemplate *)v0 setEarnLimit:1];
  unsigned int v2 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && %@", @"prerequisiteMet == YES"];
  [(ACHTemplate *)v0 setVisibilityPredicate:v2];

  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v3 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v3];

  [(ACHTemplate *)v0 setDisplayOrder:27];

  return v0;
}

ACHTemplate *SevenWorkoutWeekTemplate()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"7WorkoutWeek"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:3];
  [(ACHTemplate *)v0 setPredicate:@"numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek == 7"];
  [(ACHTemplate *)v0 setProgressExpression:@"numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek"];
  [(ACHTemplate *)v0 setGoalExpression:@"7"];
  id v1 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"TRUEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:0x2000];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:800];

  return v0;
}

ACHTemplate *FirstWorkoutTemplateForWorkoutActivityType(uint64_t a1)
{
  unsigned int v2 = objc_alloc_init(ACHTemplate);
  id v3 = NSString;
  id v4 = [MEMORY[0x263F0A8F8] _stringFromWorkoutActivityType:a1];
  id v5 = [v3 stringWithFormat:@"FirstWorkout-%@", v4];
  [(ACHTemplate *)v2 setUniqueName:v5];

  [(ACHTemplate *)v2 setVersion:4];
  [(ACHTemplate *)v2 setMinimumEngineVersion:13];
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"workout.isFirstParty == YES && workout.type == %lu && workout.duration >= 5*60 && numberOfFirstPartyWorkoutsOver5MinutesWithType == 1", a1);
  [(ACHTemplate *)v2 setPredicate:v6];

  [(ACHTemplate *)v2 setTriggers:2];
  [(ACHTemplate *)v2 setEarnLimit:1];
  id v7 = @"NO";
  if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 0x46) {
    id v7 = @"YES";
  }
  char v8 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && isWheelchairUser == %@", v7];
  [(ACHTemplate *)v2 setVisibilityPredicate:v8];

  [(ACHTemplate *)v2 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v2 setEarnDateStrategy:1];
  [(ACHTemplate *)v2 setDisplayOrder:a1 + 700];

  return v2;
}

ACHTemplate *BestWorkoutEnergyBurnedTemplateForWorkoutActivityType(uint64_t a1)
{
  unsigned int v2 = objc_alloc_init(ACHTemplate);
  id v3 = NSString;
  id v4 = [MEMORY[0x263F0A8F8] _stringFromWorkoutActivityType:a1];
  id v5 = [v3 stringWithFormat:@"BestWorkout-%@", v4];
  [(ACHTemplate *)v2 setUniqueName:v5];

  [(ACHTemplate *)v2 setVersion:3];
  [(ACHTemplate *)v2 setMinimumEngineVersion:10];
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"workout.isFirstParty == YES && workout.type == %lu && workout.duration >= 5*60 && numberOfFirstPartyWorkoutsOver5MinutesWithType >= 5 && workout.kilocalories > bestKilocaloriesForType", a1);
  [(ACHTemplate *)v2 setPredicate:v6];

  [(ACHTemplate *)v2 setValueExpression:@"workout.kilocalories"];
  [(ACHTemplate *)v2 setTriggers:2];
  [(ACHTemplate *)v2 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v2 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v2 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v2 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v2 setEarnDateStrategy:1];
  id v7 = [MEMORY[0x263F0A830] kilocalorieUnit];
  [(ACHTemplate *)v2 setCanonicalUnit:v7];

  [(ACHTemplate *)v2 setDisplayOrder:a1 + 700];

  return v2;
}

ACHTemplate *FiftyKilometersCyclingWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"FiftyKilometersCyclingWorkout"];
  [(ACHTemplate *)v0 setVersion:6];
  [(ACHTemplate *)v0 setMinimumEngineVersion:9];
  [(ACHTemplate *)v0 setPredicate:@"workout.isFirstParty == YES && workout.isIndoor == NO && workout.type == 13 && isMetricLocale == YES && workout.kilometers >= 50.0 && workout.kilometers < 100.0"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:9];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:801];

  return v0;
}

ACHTemplate *FiftyMilesCyclingWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"FiftyMilesCyclingWorkout"];
  [(ACHTemplate *)v0 setVersion:5];
  [(ACHTemplate *)v0 setMinimumEngineVersion:9];
  [(ACHTemplate *)v0 setPredicate:@"workout.isFirstParty == YES && workout.isIndoor == NO && workout.type == 13 && isMetricLocale == NO && workout.kilometers >= 80.4672 && workout.kilometers < 100.0"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] mileUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:802];

  return v0;
}

ACHTemplate *OneHundredKilometersCyclingWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"OneHundredKilometersCyclingWorkout"];
  [(ACHTemplate *)v0 setVersion:5];
  [(ACHTemplate *)v0 setMinimumEngineVersion:9];
  [(ACHTemplate *)v0 setPredicate:@"workout.isFirstParty == YES && workout.isIndoor == NO && workout.type == 13 && workout.kilometers >= 100.0 && workout.kilometers < 160.934"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:9];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:803];

  return v0;
}

ACHTemplate *OneHundredMilesCyclingWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"OneHundredMilesCyclingWorkout"];
  [(ACHTemplate *)v0 setVersion:5];
  [(ACHTemplate *)v0 setMinimumEngineVersion:9];
  [(ACHTemplate *)v0 setPredicate:@"workout.isFirstParty == YES && workout.isIndoor == NO && workout.type == 13 && workout.kilometers >= 160.934"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] mileUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:804];

  return v0;
}

ACHTemplate *HalfMarathonWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"HalfMarathonWorkout"];
  [(ACHTemplate *)v0 setVersion:6];
  [(ACHTemplate *)v0 setMinimumEngineVersion:9];
  id v1 = objc_msgSend(NSString, "stringWithFormat:", @"workout.isFirstParty == YES && workout.type == 37 && workout.kilometers >= %f && workout.kilometers < %f", 0x4034EBE0DED288CELL, 0x4044C2B020C49BA6);
  [(ACHTemplate *)v0 setPredicate:v1];

  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] mileUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:850];

  return v0;
}

ACHTemplate *WheelchairHalfMarathonWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"WheelchairHalfMarathonWorkout"];
  [(ACHTemplate *)v0 setVersion:5];
  [(ACHTemplate *)v0 setMinimumEngineVersion:9];
  id v1 = objc_msgSend(NSString, "stringWithFormat:", @"workout.isFirstParty == YES && workout.type == 71 && workout.kilometers >= %f && workout.kilometers < %f", 0x4034EBE0DED288CELL, 0x4044C2B020C49BA6);
  [(ACHTemplate *)v0 setPredicate:v1];

  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] mileUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:851];

  return v0;
}

ACHTemplate *FastestHalfMarathonWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"FastestHalfMarathonWorkout"];
  [(ACHTemplate *)v0 setVersion:3];
  [(ACHTemplate *)v0 setMinimumEngineVersion:8];
  id v1 = objc_msgSend(NSString, "stringWithFormat:", @"workout.isFirstParty == YES && workout.type == 37 && workout.kilometers >= %f && workout.bestHalfMarathonDuration < bestHalfMarathonDuration", 0x4034EBE0DED288CELL);
  [(ACHTemplate *)v0 setPredicate:v1];

  [(ACHTemplate *)v0 setValueExpression:@"workout.bestHalfMarathonDuration"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] secondUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:852];

  return v0;
}

ACHTemplate *FastestWheelchairHalfMarathonWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"FastestWheelchairHalfMarathonWorkout"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:8];
  id v1 = objc_msgSend(NSString, "stringWithFormat:", @"workout.isFirstParty == YES && workout.type == 71 && workout.kilometers >= %f && workout.bestWheelchairHalfMarathonDuration < bestWheelchairHalfMarathonDuration", 0x4034EBE0DED288CELL);
  [(ACHTemplate *)v0 setPredicate:v1];

  [(ACHTemplate *)v0 setValueExpression:@"workout.bestWheelchairHalfMarathonDuration"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] secondUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:853];

  return v0;
}

ACHTemplate *MarathonWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"MarathonWorkout"];
  [(ACHTemplate *)v0 setVersion:5];
  [(ACHTemplate *)v0 setMinimumEngineVersion:9];
  id v1 = objc_msgSend(NSString, "stringWithFormat:", @"workout.isFirstParty == YES && workout.type == 37 && workout.kilometers >= %f", 0x4044C2B020C49BA6);
  [(ACHTemplate *)v0 setPredicate:v1];

  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] mileUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:854];

  return v0;
}

ACHTemplate *WheelchairMarathonWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"WheelchairMarathonWorkout"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:9];
  id v1 = objc_msgSend(NSString, "stringWithFormat:", @"workout.isFirstParty == YES && workout.type == 71 && workout.kilometers >= %f", 0x4044C2B020C49BA6);
  [(ACHTemplate *)v0 setPredicate:v1];

  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] mileUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:855];

  return v0;
}

ACHTemplate *FastestMarathonWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"FastestMarathonWorkout"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:8];
  id v1 = objc_msgSend(NSString, "stringWithFormat:", @"workout.isFirstParty == YES && workout.type == 37 && workout.kilometers >= %f && workout.bestMarathonDuration < bestMarathonDuration", 0x4044C2B020C49BA6);
  [(ACHTemplate *)v0 setPredicate:v1];

  [(ACHTemplate *)v0 setValueExpression:@"workout.bestMarathonDuration"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] secondUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:856];

  return v0;
}

ACHTemplate *FastestWheelchairMarathonWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"FastestWheelchairMarathonWorkout"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:8];
  id v1 = objc_msgSend(NSString, "stringWithFormat:", @"workout.isFirstParty == YES && workout.type == 71 && workout.kilometers >= %f && workout.bestWheelchairMarathonDuration < bestWheelchairMarathonDuration", 0x4044C2B020C49BA6);
  [(ACHTemplate *)v0 setPredicate:v1];

  [(ACHTemplate *)v0 setValueExpression:@"workout.bestWheelchairMarathonDuration"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  unsigned int v2 = [MEMORY[0x263F0A830] secondUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:857];

  return v0;
}

ACHTemplate *DuathlonWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"DuathlonWorkout"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:9];
  [(ACHTemplate *)v0 setPredicate:@"workout.isFirstParty == YES && workout.isDuathlon == YES"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] mileUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:820];

  return v0;
}

ACHTemplate *SprintTriathlonWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"SprintTriathlonWorkout"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:9];
  [(ACHTemplate *)v0 setPredicate:@"workout.isFirstParty == YES && workout.isSprintTriathlon == YES"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] mileUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:821];

  return v0;
}

ACHTemplate *FiftyKilometerTriathlonWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"FiftyKilometerTriathlonWorkout"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:9];
  [(ACHTemplate *)v0 setPredicate:@"workout.isFirstParty == YES && workout.isFiftyKilometerTriathlon == YES"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] mileUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:822];

  return v0;
}

ACHTemplate *HalfDistanceTriathlonWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"HalfDistanceTriathlonWorkout"];
  [(ACHTemplate *)v0 setVersion:5];
  [(ACHTemplate *)v0 setMinimumEngineVersion:9];
  [(ACHTemplate *)v0 setPredicate:@"workout.isFirstParty == YES && workout.isHalfDistanceTriathlon == YES"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] mileUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:823];

  return v0;
}

ACHTemplate *FullDistanceTriathlonWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"FullDistanceTriathlonWorkout"];
  [(ACHTemplate *)v0 setVersion:5];
  [(ACHTemplate *)v0 setMinimumEngineVersion:9];
  [(ACHTemplate *)v0 setPredicate:@"workout.isFirstParty == YES && workout.isFullDistanceTriathlon == YES"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] mileUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  [(ACHTemplate *)v0 setDisplayOrder:824];

  return v0;
}

ACHTemplate *FiveKilometerWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"FiveKilometerWorkout"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:13];
  [(ACHTemplate *)v0 setPredicate:@"workout.isFirstParty == YES && workout.type == 37 && workout.kilometers >= 5.0 && workout.kilometers < 10.0"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"isStandalonePhoneFitnessMode == NO && isWheelchairUser == NO"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  id v1 = [MEMORY[0x263F0A830] mileUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplayOrder:840];

  return v0;
}

ACHTemplate *FiveKilometerWheelchairWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"FiveKilometerWheelchairWorkout"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:13];
  [(ACHTemplate *)v0 setPredicate:@"workout.isFirstParty == YES && workout.type == 71 && workout.kilometers >= 5.0 && workout.kilometers < 10.0"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"isStandalonePhoneFitnessMode == NO && isWheelchairUser == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  id v1 = [MEMORY[0x263F0A830] mileUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplayOrder:841];

  return v0;
}

ACHTemplate *TenKilometerWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"TenKilometerWorkout"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:13];
  id v1 = objc_msgSend(NSString, "stringWithFormat:", @"workout.isFirstParty == YES && workout.type == 37 && workout.kilometers >= 10.0 && workout.kilometers < %f", 0x4034EBE0DED288CELL);
  [(ACHTemplate *)v0 setPredicate:v1];

  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"isStandalonePhoneFitnessMode == NO && isWheelchairUser == NO"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  unsigned int v2 = [MEMORY[0x263F0A830] mileUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:842];

  return v0;
}

ACHTemplate *TenKilometerWheelchairWorkout()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"TenKilometerWheelchairWorkout"];
  [(ACHTemplate *)v0 setVersion:4];
  [(ACHTemplate *)v0 setMinimumEngineVersion:13];
  id v1 = objc_msgSend(NSString, "stringWithFormat:", @"workout.isFirstParty == YES && workout.type == 71 && workout.kilometers >= 10.0 && workout.kilometers < %f", 0x4034EBE0DED288CELL);
  [(ACHTemplate *)v0 setPredicate:v1];

  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"isStandalonePhoneFitnessMode == NO && isWheelchairUser == YES"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:4];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  [(ACHTemplate *)v0 setDisplaysEarnedInstanceCount:1];
  unsigned int v2 = [MEMORY[0x263F0A830] mileUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v2];

  [(ACHTemplate *)v0 setDisplayOrder:843];

  return v0;
}

ACHTemplate *Best5KDuration()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"Best5KDuration"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:7];
  [(ACHTemplate *)v0 setPredicate:@"workout.isFirstParty == YES && workout.type == 37 && workout.best5KDuration < best5KDuration"];
  [(ACHTemplate *)v0 setValueExpression:@"workout.best5KDuration"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] secondUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplayOrder:844];

  return v0;
}

ACHTemplate *BestWheelchair5KDuration()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"BestWheelchair5KDuration"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:8];
  [(ACHTemplate *)v0 setPredicate:@"workout.isFirstParty == YES && workout.type == 71 && workout.bestWheelchair5KDuration < bestWheelchair5KDuration"];
  [(ACHTemplate *)v0 setValueExpression:@"workout.bestWheelchair5KDuration"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] secondUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplayOrder:845];

  return v0;
}

ACHTemplate *Best10KDuration()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"Best10KDuration"];
  [(ACHTemplate *)v0 setVersion:2];
  [(ACHTemplate *)v0 setMinimumEngineVersion:7];
  [(ACHTemplate *)v0 setPredicate:@"workout.isFirstParty == YES && workout.type == 37 && workout.best10KDuration < best10KDuration"];
  [(ACHTemplate *)v0 setValueExpression:@"workout.best10KDuration"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] secondUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplayOrder:846];

  return v0;
}

ACHTemplate *BestWheelchair10KDuration()
{
  id v0 = objc_alloc_init(ACHTemplate);
  [(ACHTemplate *)v0 setUniqueName:@"BestWheelchair10KDuration"];
  [(ACHTemplate *)v0 setVersion:3];
  [(ACHTemplate *)v0 setMinimumEngineVersion:8];
  [(ACHTemplate *)v0 setPredicate:@"workout.isFirstParty == YES && workout.type == 71 && workout.bestWheelchair10KDuration < bestWheelchair10KDuration"];
  [(ACHTemplate *)v0 setValueExpression:@"workout.bestWheelchair10KDuration"];
  [(ACHTemplate *)v0 setTriggers:2];
  [(ACHTemplate *)v0 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  [(ACHTemplate *)v0 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v0 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v0 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v0 setEarnDateStrategy:1];
  id v1 = [MEMORY[0x263F0A830] secondUnit];
  [(ACHTemplate *)v0 setCanonicalUnit:v1];

  [(ACHTemplate *)v0 setDisplayOrder:847];

  return v0;
}

ACHTemplate *BestWorkoutDistanceTemplateForWorkoutActivityType(uint64_t a1)
{
  unsigned int v2 = objc_alloc_init(ACHTemplate);
  id v3 = NSString;
  id v4 = [MEMORY[0x263F0A8F8] _stringFromWorkoutActivityType:a1];
  id v5 = [v3 stringWithFormat:@"BestWorkoutDistance-%@", v4];
  [(ACHTemplate *)v2 setUniqueName:v5];

  [(ACHTemplate *)v2 setVersion:3];
  [(ACHTemplate *)v2 setMinimumEngineVersion:13];
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"workout.isFirstParty == YES && workout.type == %lu && workout.duration >= 5*60 && numberOfFirstPartyWorkoutsOver5MinutesWithType >= 5 && workout.kilometers > bestKilometersForType", a1);
  [(ACHTemplate *)v2 setPredicate:v6];

  [(ACHTemplate *)v2 setValueExpression:@"workout.meters"];
  [(ACHTemplate *)v2 setTriggers:2];
  [(ACHTemplate *)v2 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  id v7 = @"NO";
  if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 0x46) {
    id v7 = @"YES";
  }
  char v8 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && isWheelchairUser == %@", v7];
  [(ACHTemplate *)v2 setVisibilityPredicate:v8];

  [(ACHTemplate *)v2 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v2 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v2 setEarnDateStrategy:1];
  unsigned int v9 = [MEMORY[0x263F0A830] meterUnit];
  [(ACHTemplate *)v2 setCanonicalUnit:v9];

  [(ACHTemplate *)v2 setDisplayOrder:a1 + 1100];

  return v2;
}

ACHTemplate *BestWorkoutElevationGainedTemplateForWorkoutActivityType(uint64_t a1)
{
  unsigned int v2 = objc_alloc_init(ACHTemplate);
  id v3 = NSString;
  id v4 = [MEMORY[0x263F0A8F8] _stringFromWorkoutActivityType:a1];
  id v5 = [v3 stringWithFormat:@"BestWorkoutElevationGained-%@", v4];
  [(ACHTemplate *)v2 setUniqueName:v5];

  [(ACHTemplate *)v2 setVersion:3];
  [(ACHTemplate *)v2 setMinimumEngineVersion:13];
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"workout.isFirstParty == YES && workout.type == %lu && workout.duration >= 5*60 && numberOfFirstPartyWorkoutsOver5MinutesWithType >= 5 && workout.elevationGained > bestElevationGainedForType", a1);
  [(ACHTemplate *)v2 setPredicate:v6];

  [(ACHTemplate *)v2 setValueExpression:@"workout.elevationGainedInMeters"];
  [(ACHTemplate *)v2 setTriggers:2];
  [(ACHTemplate *)v2 setEarnLimit:ACHTemplateEarnLimitNoLimit];
  id v7 = @"NO";
  if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 0x46) {
    id v7 = @"YES";
  }
  char v8 = [NSString stringWithFormat:@"isStandalonePhoneFitnessMode == NO && isWheelchairUser == %@", v7];
  [(ACHTemplate *)v2 setVisibilityPredicate:v8];

  [(ACHTemplate *)v2 setDuplicateRemovalStrategy:3];
  [(ACHTemplate *)v2 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v2 setEarnDateStrategy:1];
  unsigned int v9 = [MEMORY[0x263F0A830] meterUnit];
  [(ACHTemplate *)v2 setCanonicalUnit:v9];

  [(ACHTemplate *)v2 setDisplayOrder:a1 + 1200];

  return v2;
}

id ACHMonthlyChallengeTemplate(unint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  switch(a1)
  {
    case 1uLL:
      uint64_t v7 = ACHMonthlyChallengeTypeAllThreeRingsTemplate(v5, a3);
      goto LABEL_3;
    case 2uLL:
      uint64_t v7 = ACHMonthlyChallengeTypeMoveRingTemplate(v5, a3);
      goto LABEL_3;
    case 3uLL:
      uint64_t v7 = ACHMonthlyChallengeTypeExerciseRingTemplate(v5, a3);
      goto LABEL_3;
    case 4uLL:
      uint64_t v7 = ACHMonthlyChallengeTypeStandRingTemplate(v5, a3);
      goto LABEL_3;
    case 5uLL:
      uint64_t v7 = ACHMonthlyChallengeTypeTotalEnergyBurnTemplate(v5, a3);
      goto LABEL_3;
    case 6uLL:
      uint64_t v7 = ACHMonthlyChallengeTypeTotalExerciseMinutesTemplate(v5, a3);
      goto LABEL_3;
    case 7uLL:
      uint64_t v7 = ACHMonthlyChallengeTypeTotalWorkoutsTemplate(v5, a3);
      goto LABEL_3;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
      uint64_t v7 = ACHMonthlyChallengeTypeTotalSpecificWorkoutTemplate(v5, a1, a3);
      goto LABEL_3;
    case 0x14uLL:
      uint64_t v7 = ACHMonthlyChallengeTypeTotalDistanceTemplate(v5, a3);
      goto LABEL_3;
    case 0x15uLL:
      uint64_t v7 = ACHMonthlyChallengeTypeDaysDoublingMoveGoalTemplate(v5, a3);
      goto LABEL_3;
    case 0x16uLL:
      uint64_t v7 = ACHMonthlyChallengeTypeTotalAppleMoveTimeTemplate(v5, a3);
      goto LABEL_3;
    case 0x17uLL:
      uint64_t v7 = ACHMonthlyChallengeTypeDaysDoublingExerciseGoalTemplate(v5, a3);
      goto LABEL_3;
    case 0x18uLL:
      uint64_t v7 = ACHMonthlyChallengeTypeMoveStreakTemplate(v5, a3);
      goto LABEL_3;
    case 0x19uLL:
      uint64_t v7 = ACHMonthlyChallengeTypeDailyEnergyBurnTargetTemplate(v5, a3);
      goto LABEL_3;
    case 0x1AuLL:
      uint64_t v7 = ACHMonthlyChallengeTypeDailyExerciseMinutesTargetTemplate(v5, a3);
      goto LABEL_3;
    case 0x1BuLL:
      uint64_t v7 = ACHMonthlyChallengeTypeDailyDistanceTargetTemplate(v5, a3);
      goto LABEL_3;
    case 0x1CuLL:
      uint64_t v7 = ACHMonthlyChallengeTypeDailyAppleMoveTimeTargetTemplate(v5, a3);
LABEL_3:
      char v8 = (void *)v7;
      break;
    default:
      char v8 = 0;
      break;
  }

  return v8;
}

ACHTemplate *ACHMonthlyChallengeTypeAllThreeRingsTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeAllThreeRings_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:1];
  [(ACHTemplate *)v4 setMinimumEngineVersion:1];
  unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"numberOfDaysClosingAllThreeRingsInCurrentMonth >= %ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setPredicate:v10];

  [(ACHTemplate *)v4 setValueExpression:@"numberOfDaysClosingAllThreeRingsInCurrentMonth"];
  [(ACHTemplate *)v4 setProgressExpression:@"numberOfDaysClosingAllThreeRingsInCurrentMonth"];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setGoalExpression:v11];

  unint64_t v12 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v12];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  char v13 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v13];

  char v14 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v14];

  int v15 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v15];

  int v16 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v16];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  uint64_t v17 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v17, 0)];

  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeMoveRingTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeMoveRing_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:1];
  [(ACHTemplate *)v4 setMinimumEngineVersion:1];
  unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"numberOfDaysClosingMoveRingInCurrentMonth >= %ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setPredicate:v10];

  [(ACHTemplate *)v4 setValueExpression:@"numberOfDaysClosingMoveRingInCurrentMonth"];
  [(ACHTemplate *)v4 setProgressExpression:@"numberOfDaysClosingMoveRingInCurrentMonth"];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setGoalExpression:v11];

  unint64_t v12 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v12];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  char v13 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v13];

  char v14 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v14];

  int v15 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v15];

  int v16 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v16];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  uint64_t v17 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v17, 0)];

  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeExerciseRingTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeExerciseRing_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:1];
  [(ACHTemplate *)v4 setMinimumEngineVersion:1];
  unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"numberOfDaysClosingExerciseRingInCurrentMonth >= %ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setPredicate:v10];

  [(ACHTemplate *)v4 setValueExpression:@"numberOfDaysClosingExerciseRingInCurrentMonth"];
  [(ACHTemplate *)v4 setProgressExpression:@"numberOfDaysClosingExerciseRingInCurrentMonth"];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setGoalExpression:v11];

  unint64_t v12 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v12];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  char v13 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v13];

  char v14 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v14];

  int v15 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v15];

  int v16 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v16];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  uint64_t v17 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v17, 0)];

  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeStandRingTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeStandRing_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:1];
  [(ACHTemplate *)v4 setMinimumEngineVersion:1];
  unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"numberOfDaysClosingStandRingInCurrentMonth >= %ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setPredicate:v10];

  [(ACHTemplate *)v4 setValueExpression:@"numberOfDaysClosingStandRingInCurrentMonth"];
  [(ACHTemplate *)v4 setProgressExpression:@"numberOfDaysClosingStandRingInCurrentMonth"];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setGoalExpression:v11];

  unint64_t v12 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v12];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  char v13 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v13];

  char v14 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v14];

  int v15 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v15];

  int v16 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v16];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  uint64_t v17 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v17, 0)];

  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeTotalEnergyBurnTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeTotalEnergyBurn_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:3];
  [(ACHTemplate *)v4 setMinimumEngineVersion:2];
  unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"totalEnergyBurnInCurrentMonth >= %f", *(void *)&a2);
  [(ACHTemplate *)v4 setPredicate:v10];

  [(ACHTemplate *)v4 setValueExpression:@"totalEnergyBurnInCurrentMonth"];
  [(ACHTemplate *)v4 setProgressExpression:@"totalEnergyBurnInCurrentMonth"];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setGoalExpression:v11];

  unint64_t v12 = [MEMORY[0x263F0A830] kilocalorieUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v12];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  [(ACHTemplate *)v4 setGraceVisibilityPredicate:@"activityMoveMode != 2"];
  char v13 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v13];

  char v14 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v14];

  int v15 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v15];

  int v16 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v16];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  uint64_t v17 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v17, 0)];

  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeTotalExerciseMinutesTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeTotalExerciseMinutes_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:1];
  [(ACHTemplate *)v4 setMinimumEngineVersion:1];
  unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"totalExerciseMinutesInCurrentMonth >= %f", *(void *)&a2);
  [(ACHTemplate *)v4 setPredicate:v10];

  [(ACHTemplate *)v4 setValueExpression:@"totalExerciseMinutesInCurrentMonth"];
  [(ACHTemplate *)v4 setProgressExpression:@"totalExerciseMinutesInCurrentMonth"];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setGoalExpression:v11];

  unint64_t v12 = [MEMORY[0x263F0A830] minuteUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v12];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  char v13 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v13];

  char v14 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v14];

  int v15 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v15];

  int v16 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v16];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  uint64_t v17 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v17, 0)];

  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeTotalWorkoutsTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeTotalWorkouts_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:3];
  [(ACHTemplate *)v4 setMinimumEngineVersion:2];
  unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"numberOfWorkoutsCompletedInCurrentMonth >= %ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setPredicate:v10];

  [(ACHTemplate *)v4 setValueExpression:@"numberOfWorkoutsCompletedInCurrentMonth"];
  [(ACHTemplate *)v4 setProgressExpression:@"numberOfWorkoutsCompletedInCurrentMonth"];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setGoalExpression:v11];

  unint64_t v12 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v12];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  [(ACHTemplate *)v4 setGraceVisibilityPredicate:@"activityMoveMode != 2"];
  char v13 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v13];

  char v14 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v14];

  int v15 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v15];

  int v16 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v16];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  uint64_t v17 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v17, 0)];

  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeTotalDistanceTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeTotalDistance_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:3];
  [(ACHTemplate *)v4 setMinimumEngineVersion:2];
  unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"totalWalkingRunningDistanceInCurrentMonth >= %f", *(void *)&a2);
  [(ACHTemplate *)v4 setPredicate:v10];

  [(ACHTemplate *)v4 setValueExpression:@"totalWalkingRunningDistanceInCurrentMonth"];
  [(ACHTemplate *)v4 setProgressExpression:@"totalWalkingRunningDistanceInCurrentMonth"];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setGoalExpression:v11];

  unint64_t v12 = [MEMORY[0x263F0A830] meterUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v12];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  [(ACHTemplate *)v4 setGraceVisibilityPredicate:@"activityMoveMode != 2"];
  char v13 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v13];

  char v14 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v14];

  int v15 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v15];

  int v16 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v16];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  uint64_t v17 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v17, 0)];

  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeDaysDoublingMoveGoalTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeDaysDoublingMoveGoal_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:1];
  [(ACHTemplate *)v4 setMinimumEngineVersion:1];
  unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"numberOfDaysDoublingMoveGoalInCurrentMonth >= %ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setPredicate:v10];

  [(ACHTemplate *)v4 setValueExpression:@"numberOfDaysDoublingMoveGoalInCurrentMonth"];
  [(ACHTemplate *)v4 setProgressExpression:@"numberOfDaysDoublingMoveGoalInCurrentMonth"];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setGoalExpression:v11];

  unint64_t v12 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v12];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  char v13 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v13];

  char v14 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v14];

  int v15 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v15];

  int v16 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v16];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  uint64_t v17 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v17, 0)];

  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeTotalAppleMoveTimeTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeTotalMoveTime_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:1];
  [(ACHTemplate *)v4 setMinimumEngineVersion:2];
  [(ACHTemplate *)v4 setPredicate:@"FALSEPREDICATE"];
  unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"totalMoveTimeInCurrentMonth >= %f", *(void *)&a2);
  [(ACHTemplate *)v4 setGracePredicate:v10];

  [(ACHTemplate *)v4 setValueExpression:@"totalMoveTimeInCurrentMonth"];
  [(ACHTemplate *)v4 setProgressExpression:@"totalMoveTimeInCurrentMonth"];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setGoalExpression:v11];

  unint64_t v12 = [MEMORY[0x263F0A830] minuteUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v12];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  [(ACHTemplate *)v4 setVisibilityPredicate:@"FALSEPREDICATE"];
  [(ACHTemplate *)v4 setGraceVisibilityPredicate:@"activityMoveMode == 2"];
  char v13 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v13];

  char v14 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v14];

  int v15 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v15];

  int v16 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v16];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  uint64_t v17 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v17, 0)];

  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeDaysDoublingExerciseGoalTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeDaysDoublingExerciseGoal_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:1];
  [(ACHTemplate *)v4 setMinimumEngineVersion:4];
  unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"numberOfDaysDoublingExerciseGoalInCurrentMonth >= %ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setPredicate:v10];

  [(ACHTemplate *)v4 setValueExpression:@"numberOfDaysDoublingExerciseGoalInCurrentMonth"];
  [(ACHTemplate *)v4 setProgressExpression:@"numberOfDaysDoublingExerciseGoalInCurrentMonth"];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setGoalExpression:v11];

  unint64_t v12 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v12];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  char v13 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v13];

  char v14 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v14];

  int v15 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v15];

  int v16 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v16];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  uint64_t v17 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v17, 0)];

  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeTotalSpecificWorkoutTemplate(void *a1, unint64_t a2, double a3)
{
  id v5 = a1;
  uint64_t v6 = objc_alloc_init(ACHTemplate);
  uint64_t v7 = ACHMonthlyChallengeNameFromChallengeType(a2);
  char v8 = [v7 stringByReplacingOccurrencesOfString:@"ACH" withString:&stru_26D0EC7B0];

  unsigned int v9 = NSString;
  unint64_t v10 = [v5 startDateComponents];
  uint64_t v11 = [v10 year];
  unint64_t v12 = [v5 startDateComponents];
  char v13 = [v9 stringWithFormat:@"%@_%04ld_%02ld", v8, v11, objc_msgSend(v12, "month")];

  [(ACHTemplate *)v6 setUniqueName:v13];
  [(ACHTemplate *)v6 setVersion:1];
  [(ACHTemplate *)v6 setMinimumEngineVersion:4];
  char v14 = NSString;
  int v15 = [NSNumber numberWithUnsignedInteger:a2];
  int v16 = [v14 stringWithFormat:@"FUNCTION(SELF, 'numberOfCompletedWorkoutsInCurrentMonthForChallengeType:', %@)", v15];

  uint64_t v17 = [NSString stringWithFormat:@"%@ >= %ld", v16, (uint64_t)a3];
  [(ACHTemplate *)v6 setPredicate:v17];

  [(ACHTemplate *)v6 setValueExpression:v16];
  [(ACHTemplate *)v6 setProgressExpression:v16];
  uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)a3);
  [(ACHTemplate *)v6 setGoalExpression:v18];

  double v19 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v6 setCanonicalUnit:v19];

  [(ACHTemplate *)v6 setTriggers:0];
  [(ACHTemplate *)v6 setEarnLimit:1];
  [(ACHTemplate *)v6 setGraceVisibilityPredicate:@"activityMoveMode != 2"];
  double v20 = [v5 startDateComponents];
  [(ACHTemplate *)v6 setVisibilityStart:v20];

  char v21 = [v5 endDateComponents];
  [(ACHTemplate *)v6 setVisibilityEnd:v21];

  unsigned int v22 = [v5 startDateComponents];
  [(ACHTemplate *)v6 setAvailabilityStart:v22];

  uint64_t v23 = [v5 endDateComponents];
  [(ACHTemplate *)v6 setAvailabilityEnd:v23];

  [(ACHTemplate *)v6 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v6 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v6 setEarnDateStrategy:1];
  id v24 = [v5 startDateComponents];

  [(ACHTemplate *)v6 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v24, 0)];

  return v6;
}

ACHTemplate *ACHMonthlyChallengeTypeMoveStreakTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeMoveStreak_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:1];
  [(ACHTemplate *)v4 setMinimumEngineVersion:4];
  unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"currentMoveStreakInCurrentMonth >= %ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setPredicate:v10];

  [(ACHTemplate *)v4 setValueExpression:@"currentMoveStreakInCurrentMonth"];
  [(ACHTemplate *)v4 setProgressExpression:@"currentMoveStreakInCurrentMonth"];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)a2);
  [(ACHTemplate *)v4 setGoalExpression:v11];

  unint64_t v12 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v12];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  char v13 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v13];

  char v14 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v14];

  int v15 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v15];

  int v16 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v16];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  uint64_t v17 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v17, 0)];

  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeDailyEnergyBurnTargetTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeDailyEnergyBurnTarget_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:1];
  [(ACHTemplate *)v4 setMinimumEngineVersion:5];
  unint64_t v10 = NSString;
  uint64_t v11 = [NSNumber numberWithDouble:a2];
  unint64_t v12 = [v10 stringWithFormat:@"FUNCTION(SELF, 'numberOfDaysWithCaloriesBurnedOver:', %@)", v11];

  char v13 = [NSString stringWithFormat:@"%@ >= 14", v12];
  [(ACHTemplate *)v4 setPredicate:v13];

  [(ACHTemplate *)v4 setValueExpression:v12];
  [(ACHTemplate *)v4 setProgressExpression:v12];
  [(ACHTemplate *)v4 setGoalExpression:@"14"];
  char v14 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v14];

  [(ACHTemplate *)v4 setDailyTarget:a2];
  int v15 = [MEMORY[0x263F0A830] largeCalorieUnit];
  [(ACHTemplate *)v4 setDailyTargetCanonicalUnit:v15];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  [(ACHTemplate *)v4 setGraceVisibilityPredicate:@"activityMoveMode != 2"];
  int v16 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v16];

  uint64_t v17 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v17];

  uint64_t v18 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v18];

  double v19 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v19];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  double v20 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v20, 0)];

  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeDailyExerciseMinutesTargetTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeDailyExerciseMinutesTarget_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:1];
  [(ACHTemplate *)v4 setMinimumEngineVersion:5];
  unint64_t v10 = NSString;
  uint64_t v11 = [NSNumber numberWithDouble:a2];
  unint64_t v12 = [v10 stringWithFormat:@"FUNCTION(SELF, 'numberOfDaysWithExerciseMinutesOver:', %@)", v11];

  char v13 = [NSString stringWithFormat:@"%@ >= 14", v12];
  [(ACHTemplate *)v4 setPredicate:v13];

  [(ACHTemplate *)v4 setValueExpression:v12];
  [(ACHTemplate *)v4 setProgressExpression:v12];
  [(ACHTemplate *)v4 setGoalExpression:@"14"];
  char v14 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v14];

  [(ACHTemplate *)v4 setDailyTarget:a2];
  int v15 = [MEMORY[0x263F0A830] minuteUnit];
  [(ACHTemplate *)v4 setDailyTargetCanonicalUnit:v15];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  [(ACHTemplate *)v4 setGraceVisibilityPredicate:@"activityMoveMode != 2"];
  int v16 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v16];

  uint64_t v17 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v17];

  uint64_t v18 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v18];

  double v19 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v19];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  double v20 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v20, 0)];

  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeDailyDistanceTargetTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeDailyDistanceTarget_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:1];
  [(ACHTemplate *)v4 setMinimumEngineVersion:5];
  unint64_t v10 = NSString;
  uint64_t v11 = [NSNumber numberWithDouble:a2];
  unint64_t v12 = [v10 stringWithFormat:@"FUNCTION(SELF, 'numberOfDaysWithDistanceOver:', %@)", v11];

  char v13 = [NSString stringWithFormat:@"%@ >= 14", v12];
  [(ACHTemplate *)v4 setPredicate:v13];

  [(ACHTemplate *)v4 setValueExpression:v12];
  [(ACHTemplate *)v4 setProgressExpression:v12];
  [(ACHTemplate *)v4 setGoalExpression:@"14"];
  char v14 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v14];

  [(ACHTemplate *)v4 setDailyTarget:a2];
  int v15 = [MEMORY[0x263F0A830] meterUnit];
  [(ACHTemplate *)v4 setDailyTargetCanonicalUnit:v15];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  [(ACHTemplate *)v4 setGraceVisibilityPredicate:@"activityMoveMode != 2"];
  int v16 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v16];

  uint64_t v17 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v17];

  uint64_t v18 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v18];

  double v19 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v19];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  double v20 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v20, 0)];

  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeDailyAppleMoveTimeTargetTemplate(void *a1, double a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(ACHTemplate);
  id v5 = NSString;
  uint64_t v6 = [v3 startDateComponents];
  uint64_t v7 = [v6 year];
  char v8 = [v3 startDateComponents];
  unsigned int v9 = objc_msgSend(v5, "stringWithFormat:", @"MonthlyChallengeTypeDailyAppleMoveTimeTarget_%04ld_%02ld", v7, objc_msgSend(v8, "month"));

  [(ACHTemplate *)v4 setUniqueName:v9];
  [(ACHTemplate *)v4 setVersion:1];
  [(ACHTemplate *)v4 setMinimumEngineVersion:5];
  unint64_t v10 = NSString;
  uint64_t v11 = [NSNumber numberWithDouble:a2];
  unint64_t v12 = [v10 stringWithFormat:@"FUNCTION(SELF, 'numberOfDaysWithAppleMoveTimeOver:', %@)", v11];

  char v13 = [NSString stringWithFormat:@"%@ >= 14", v12];
  [(ACHTemplate *)v4 setPredicate:v13];

  [(ACHTemplate *)v4 setValueExpression:v12];
  [(ACHTemplate *)v4 setProgressExpression:v12];
  [(ACHTemplate *)v4 setGoalExpression:@"14"];
  char v14 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v4 setCanonicalUnit:v14];

  [(ACHTemplate *)v4 setDailyTarget:a2];
  int v15 = [MEMORY[0x263F0A830] minuteUnit];
  [(ACHTemplate *)v4 setDailyTargetCanonicalUnit:v15];

  [(ACHTemplate *)v4 setTriggers:0];
  [(ACHTemplate *)v4 setEarnLimit:1];
  [(ACHTemplate *)v4 setGraceVisibilityPredicate:@"activityMoveMode == 2"];
  int v16 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setVisibilityStart:v16];

  uint64_t v17 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setVisibilityEnd:v17];

  uint64_t v18 = [v3 startDateComponents];
  [(ACHTemplate *)v4 setAvailabilityStart:v18];

  double v19 = [v3 endDateComponents];
  [(ACHTemplate *)v4 setAvailabilityEnd:v19];

  [(ACHTemplate *)v4 setDuplicateRemovalStrategy:1];
  [(ACHTemplate *)v4 setDuplicateRemovalCalendarUnit:2];
  [(ACHTemplate *)v4 setEarnDateStrategy:1];
  double v20 = [v3 startDateComponents];

  [(ACHTemplate *)v4 setDisplayOrder:ACHMonthlyTemplateDisplayOrder(v20, 0)];

  return v4;
}

id ACHMonthlyChallengeTemplateFromTemplate(void *a1)
{
  id v1 = a1;
  unsigned int v2 = [v1 uniqueName];
  unint64_t v3 = ACHMonthlyChallengeTypeFromTemplateUniqueName(v2);

  id v4 = [ACHDateComponentInterval alloc];
  id v5 = [v1 availabilityStart];
  uint64_t v6 = [v1 availabilityEnd];
  uint64_t v7 = [(ACHDateComponentInterval *)v4 initWithStartDateComponents:v5 endDateComponents:v6];

  if (v3 - 1 >= 0x18)
  {
    if (v3 - 25 >= 4)
    {
      char v13 = 0;
    }
    else
    {
      [v1 dailyTarget];
      char v13 = ACHMonthlyChallengeTemplate(v3, v7, v15);
    }
  }
  else
  {
    char v8 = [v1 graceGoalExpression];
    unsigned int v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [v1 goalExpression];
    }
    uint64_t v11 = v10;

    [v11 doubleValue];
    char v13 = ACHMonthlyChallengeTemplate(v3, v7, v12);
  }

  return v13;
}

id ACHAwardsWorkoutServerInterface()
{
  v5[2] = *MEMORY[0x263EF8340];
  id v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D106630];
  id v1 = objc_alloc(MEMORY[0x263EFFA08]);
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  unsigned int v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  unint64_t v3 = (void *)[v1 initWithArray:v2];

  [v0 setClasses:v3 forSelector:sel_remote_workoutsInDateInterval_completion_ argumentIndex:0 ofReply:1];

  return v0;
}

uint64_t ACHCompareYearMonthDayDateComponents(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 year];
  if (v5 == [v4 year])
  {
    uint64_t v6 = [v3 month];
    if (v6 == [v4 month])
    {
      uint64_t v7 = [v3 day];
      uint64_t v8 = [v4 day];
    }
    else
    {
      uint64_t v7 = [v3 month];
      uint64_t v8 = [v4 month];
    }
  }
  else
  {
    uint64_t v7 = [v3 year];
    uint64_t v8 = [v4 year];
  }
  if (v7 > v8) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = (uint64_t)((unint64_t)(v7 < v8) << 63) >> 63;
  }

  return v9;
}

uint64_t ACHFirstDayOfWeekForWeeklyGoalCalculations()
{
  return MEMORY[0x270EF36E8]();
}

uint64_t ACHLastDayOfWeekForWeeklyGoalCalculations()
{
  return MEMORY[0x270EF3738]();
}

uint64_t ACHStartOfFitnessWeekBeforeDateWithFirstWeekdayInCalendar(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", a2, a1, 0);
}

BOOL ACHDateComponentsAreEqualForYearMonthDay(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 year];
  if (v5 == [v4 year] && (uint64_t v6 = objc_msgSend(v3, "month"), v6 == objc_msgSend(v4, "month")))
  {
    uint64_t v7 = [v3 day];
    BOOL v8 = v7 == [v4 day];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

ACHTemplate *RemoteAchievementTemplateFromTemplateAssetAndBuildVersion(void *a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 getLocalFileUrl];
  uint64_t v6 = [v5 URLByAppendingPathComponent:@"Definition.plist"];

  uint64_t v7 = [NSDictionary dictionaryWithContentsOfURL:v6];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"identifier"];
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    uint64_t v46 = v3;
    unint64_t v47 = (void *)v8;
    uint64_t v45 = v6;
    char v48 = v7;
    [v7 objectForKeyedSubscript:@"disabledBuildRanges"];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v50;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v50 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          int v16 = [v15 objectForKeyedSubscript:@"firstUnavailableBuild"];
          uint64_t v17 = [v15 objectForKeyedSubscript:@"firstAvailableBuild"];
          if (objc_msgSend(v4, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", v16, v17))
          {
            uint64_t v23 = ACHLogTemplates();
            unsigned int v44 = v23;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v9 = v47;
              char v54 = v47;
              __int16 v55 = 2114;
              id v56 = v4;
              _os_log_impl(&dword_21F582000, v23, OS_LOG_TYPE_DEFAULT, "Not creating template for remote asset %{public}@, it has been disabled for build %{public}@", buf, 0x16u);
              uint64_t v18 = 0;
              id v24 = v10;
              uint64_t v6 = v45;
              id v3 = v46;
            }
            else
            {
              uint64_t v18 = 0;
              id v24 = v10;
              uint64_t v6 = v45;
              id v3 = v46;
              uint64_t v9 = v47;
            }
            uint64_t v7 = v48;
            goto LABEL_23;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    uint64_t v18 = objc_alloc_init(ACHTemplate);
    [(ACHTemplate *)v18 setUniqueName:v47];
    id v3 = v46;
    double v19 = [v46 attributes];
    double v20 = [v19 objectForKeyedSubscript:*MEMORY[0x263F55880]];
    -[ACHTemplate setVersion:](v18, "setVersion:", [v20 integerValue]);

    char v21 = [v48 objectForKeyedSubscript:@"minimumEngineVersion"];
    char v43 = v21;
    if (v21) {
      unsigned __int8 v22 = [v21 unsignedIntegerValue];
    }
    else {
      unsigned __int8 v22 = 1;
    }
    [(ACHTemplate *)v18 setMinimumEngineVersion:v22];
    int v16 = [v48 objectForKeyedSubscript:@"predicate"];
    [(ACHTemplate *)v18 setPredicate:v16];
    uint64_t v17 = [v48 objectForKeyedSubscript:@"progressExpression"];
    [(ACHTemplate *)v18 setProgressExpression:v17];
    unsigned int v44 = [v48 objectForKeyedSubscript:@"goalExpression"];
    -[ACHTemplate setGoalExpression:](v18, "setGoalExpression:");
    char v42 = [v48 objectForKeyedSubscript:@"canonicalUnit"];
    uint64_t v25 = objc_msgSend(MEMORY[0x263F0A830], "unitFromString:");
    [(ACHTemplate *)v18 setCanonicalUnit:v25];

    unint64_t v26 = [v48 objectForKeyedSubscript:@"triggers"];
    uint64_t v27 = [v26 unsignedIntegerValue];

    [(ACHTemplate *)v18 setTriggers:v27];
    [(ACHTemplate *)v18 setEarnLimit:1];
    unint64_t v41 = [v48 objectForKeyedSubscript:@"visibilityStart"];
    uint64_t v40 = ACHYearMonthDayDateComponentsFromString(v41);
    -[ACHTemplate setVisibilityStart:](v18, "setVisibilityStart:");
    uint64_t v39 = [v48 objectForKeyedSubscript:@"visibilityEnd"];
    unsigned int v38 = ACHYearMonthDayDateComponentsFromString(v39);
    -[ACHTemplate setVisibilityEnd:](v18, "setVisibilityEnd:");
    char v37 = [v48 objectForKeyedSubscript:@"availabilityStart"];
    uint64_t v36 = ACHYearMonthDayDateComponentsFromString(v37);
    -[ACHTemplate setAvailabilityStart:](v18, "setAvailabilityStart:");
    unint64_t v35 = [v48 objectForKeyedSubscript:@"availabilityEnd"];
    uint64_t v34 = ACHYearMonthDayDateComponentsFromString(v35);
    -[ACHTemplate setAvailabilityEnd:](v18, "setAvailabilityEnd:");
    char v28 = [v48 objectForKeyedSubscript:@"availableCountryCodes"];
    if ([v28 count]) {
      [(ACHTemplate *)v18 setAvailableCountryCodes:v28];
    }
    unsigned int v29 = [v48 objectForKeyedSubscript:@"alertDates"];
    uint64_t v30 = objc_msgSend(v29, "hk_map:", &__block_literal_global_1);
    uint64_t v31 = [MEMORY[0x263EFFA08] setWithArray:v30];
    [(ACHTemplate *)v18 setAlertDates:v31];

    unint64_t v32 = [v48 objectForKeyedSubscript:@"displayOrder"];
    -[ACHTemplate setDisplayOrder:](v18, "setDisplayOrder:", [v32 integerValue]);
    [(ACHTemplate *)v18 setDuplicateRemovalStrategy:1];
    [(ACHTemplate *)v18 setEarnDateStrategy:1];

    uint64_t v7 = v48;
    uint64_t v6 = v45;
    uint64_t v9 = v47;
    id v24 = v43;
LABEL_23:
  }
  else
  {
    id v10 = ACHLogTemplates();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      RemoteAchievementTemplateFromTemplateAssetAndBuildVersion_cold_1((uint64_t)v6, v10);
    }
    uint64_t v18 = 0;
  }

  return v18;
}

id __RemoteAchievementTemplateFromTemplateAssetAndBuildVersion_block_invoke(uint64_t a1, void *a2)
{
  return ACHYearMonthDayDateComponentsFromString(a2);
}

uint64_t ACHCodableTemplateArrayReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(ACHCodableTemplate);
        [a1 addTemplates:v17];
        if (!PBReaderPlaceMark() || (ACHCodableTemplateReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id ACHBadgePropertiesListPathForAchievement(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v1 = a1;
  unsigned int v2 = [v1 propertyListBundleURL];

  if (v2)
  {
    id v3 = (void *)MEMORY[0x263F086E0];
    id v4 = [v1 propertyListBundleURL];
    uint64_t v5 = [v3 bundleWithURL:v4];
  }
  else
  {
    uint64_t v6 = ACHLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v1;
      _os_log_impl(&dword_21F582000, v6, OS_LOG_TYPE_DEFAULT, "propertyListBundleURL is nil for achievement: %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v5 = 0;
  }

  uint64_t v7 = [v5 pathForResource:@"BadgeModel" ofType:@"plist"];

  return v7;
}

void ACHApplyBadgePropertiesToAchievement(void *a1)
{
  v86[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  unsigned int v2 = [v1 template];
  if (ACHTemplateIsMonthlyChallenge(v2))
  {

LABEL_4:
    uint64_t v5 = [v1 template];
    uint64_t v6 = [v5 uniqueName];
    uint64_t v7 = [v6 componentsSeparatedByString:@"_"];

    char v8 = [v7 objectAtIndexedSubscript:1];
    char v79 = v7;
    int v9 = [v7 objectAtIndexedSubscript:2];
    int v10 = [v8 intValue];
    uint64_t v11 = [v9 intValue];
    uint64_t v12 = v10;
    if (v10 <= 2028)
    {
      v84[0] = @"MONTH_BACK";
      uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"MONTH_%d", v11);
      v84[1] = v17;
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"YEAR_%d", v12);
      v84[2] = v18;
      double v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:3];
      [v1 setBadgeModelFilenames:v19];

      int v15 = objc_msgSend(NSString, "stringWithFormat:", @"MONTH_%d", v11);
      v83[0] = v15;
      int v16 = objc_msgSend(NSString, "stringWithFormat:", @"YEAR_%d", v12);
      v83[1] = v16;
      double v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:2];
      [v1 setTextureFilenames:v20];
    }
    else
    {
      char v13 = objc_msgSend(NSString, "stringWithFormat:", @"Fallback_%d", v11);
      v86[0] = v13;
      char v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:1];
      [v1 setBadgeModelFilenames:v14];

      int v15 = objc_msgSend(NSString, "stringWithFormat:", @"Fallback_%d", v11);
      char v85 = v15;
      int v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v85 count:1];
      [v1 setTextureFilenames:v16];
    }

    [v1 setBadgeUsesFullColorEnamel:v12 > 2028];
    [v1 setBadgeShapeName:@"hexagon"];
    id v21 = v1;
    unsigned __int8 v22 = v9;
    int v23 = [v9 intValue] - 1;
    if ([&unk_26D0FB020 count] <= (unint64_t)v23)
    {
      uint64_t v30 = ACHLogAssets();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        ACHApplyBadgePropertiesToAchievement_cold_1(v21, v30);
      }

      float v25 = _ColorForString(@"0.0 0.0 0.0");
      int v27 = v31;
      int v29 = v32;
    }
    else
    {
      id v24 = [&unk_26D0FB020 objectAtIndexedSubscript:v23];
      float v25 = _ColorForString(v24);
      int v27 = v26;
      int v29 = v28;
    }
    char v33 = v79;

    *(float *)&double v34 = v25;
    LODWORD(v35) = v27;
    LODWORD(v36) = v29;
    objc_msgSend(v21, "setBadgeEnamelColor:", v34, v35, v36);
    char v37 = [v21 template];
    if (ACHTemplateIsPerfectMonth(v37)) {
      unsigned int v38 = @"gold";
    }
    else {
      unsigned int v38 = @"silver";
    }
    *(float *)&double v39 = _ColorForString(v38);
    [v21 setBadgeMetalColor:v39];

    [v21 setUnearnedUsesTwoToneEnamel:1];
    uint64_t v40 = [v21 template];
    if (ACHTemplateIsPerfectMonth(v40)) {
      unint64_t v41 = @"ACTIVITY";
    }
    else {
      unint64_t v41 = @"MONTHLY_CHALLENGES";
    }
    [v21 setSection:v41];

    [v21 setBadgeModelVersion:2];
    goto LABEL_41;
  }
  id v3 = [v1 template];
  int IsPerfectMonth = ACHTemplateIsPerfectMonth(v3);

  if (IsPerfectMonth) {
    goto LABEL_4;
  }
  char v33 = ACHBadgePropertiesListPathForAchievement(v1);
  uint64_t v42 = [NSDictionary dictionaryWithContentsOfFile:v33];
  char v8 = (void *)v42;
  if (v33 && !v42)
  {
    char v43 = ACHLogAssets();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      ACHApplyBadgePropertiesToAchievement_cold_2((uint64_t)v1, (uint64_t)v33, v43);
    }
  }
  unsigned __int8 v22 = [v8 objectForKeyedSubscript:@"shape"];
  [v1 setBadgeShapeName:v22];
  *(float *)&double v44 = _ColorForKey(@"metalColor", v8);
  [v1 setBadgeMetalColor:v44];
  uint64_t v45 = [v8 objectForKeyedSubscript:@"fullColorEnamel"];
  objc_msgSend(v1, "setBadgeUsesFullColorEnamel:", objc_msgSend(v45, "BOOLValue"));
  uint64_t v46 = [v8 objectForKeyedSubscript:@"unearnedTwoToneEnamel"];
  objc_msgSend(v1, "setUnearnedUsesTwoToneEnamel:", objc_msgSend(v46, "BOOLValue"));
  unint64_t v47 = [v8 objectForKeyedSubscript:@"faceHasMetalInlay"];
  objc_msgSend(v1, "setFaceHasMetalInlay:", objc_msgSend(v47, "BOOLValue"));
  *(float *)&double v48 = _ColorForKey(@"enamelColor", v8);
  [v1 setBadgeEnamelColor:v48];
  long long v49 = [v8 objectForKeyedSubscript:@"triColorEnamel"];
  uint64_t v50 = [v49 BOOLValue];
  [v1 setBadgeUsesTriColorEnamel:v50];
  if (v50)
  {
    *(float *)&double v51 = _ColorForKey(@"enamelTriColor1", v8);
    [v1 setEnamelTriColor1:v51];
    *(float *)&double v52 = _ColorForKey(@"enamelTriColor2", v8);
    [v1 setEnamelTriColor2:v52];
    *(float *)&double v53 = _ColorForKey(@"enamelTriColor3", v8);
    [v1 setEnamelTriColor3:v53];
  }
  char v54 = [v8 objectForKeyedSubscript:@"section"];
  [v1 setSection:v54];

  uint64_t v76 = [v8 objectForKeyedSubscript:@"badgeModelVersion"];
  objc_msgSend(v1, "setBadgeModelVersion:", objc_msgSend(v76, "integerValue"));
  uint64_t v55 = [v8 objectForKeyedSubscript:@"textureFilenames"];
  uint64_t v56 = [v8 objectForKeyedSubscript:@"textureFilename"];
  char v78 = (void *)v56;
  if (v55)
  {
    [v1 setTextureFilenames:v55];
  }
  else if (v56)
  {
    uint64_t v82 = v56;
    uint64_t v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v82 count:1];
    [v1 setTextureFilenames:v57];
  }
  uint64_t v58 = [v8 objectForKeyedSubscript:@"badgeModelFilenames"];
  uint64_t v59 = [v8 objectForKeyedSubscript:@"badgeModelFilename"];
  unsigned int v74 = (void *)v58;
  uint64_t v75 = (void *)v55;
  unint64_t v77 = (void *)v59;
  if (v58)
  {
    [v1 setBadgeModelFilenames:v58];
  }
  else if (v59)
  {
    uint64_t v81 = v59;
    char v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v81 count:1];
    [v1 setBadgeModelFilenames:v60];
  }
  char v61 = [v8 objectForKeyedSubscript:@"glyphScale"];
  unsigned int v62 = v61;
  if (v61) {
    [v61 doubleValue];
  }
  else {
    double v63 = 1.0;
  }
  [v1 setGlyphTextureScale:v63];
  uint64_t v64 = [v8 objectForKeyedSubscript:@"glyphTextureFilename"];
  [v1 setGlyphTextureFilename:v64];

  unint64_t v65 = [v8 objectForKeyedSubscript:@"glyphPositionOffset"];
  char v66 = v65;
  if (v65)
  {
    [v65 componentsSeparatedByString:@" "];
    char v73 = v47;
    unsigned int v80 = v33;
    unsigned int v68 = v67 = v46;
    [v68 objectAtIndexedSubscript:0];
    uint64_t v69 = v49;
    v71 = uint64_t v70 = v45;
    [v71 doubleValue];
    objc_msgSend(v1, "setGlyphPositionOffsetX:");

    char v72 = [v68 objectAtIndexedSubscript:1];
    [v72 doubleValue];
    objc_msgSend(v1, "setGlyphPositionOffsetY:");

    uint64_t v45 = v70;
    long long v49 = v69;

    uint64_t v46 = v67;
    char v33 = v80;
    unint64_t v47 = v73;
  }
  else
  {
    [v1 setGlyphPositionOffsetX:0.0];
    [v1 setGlyphPositionOffsetY:0.0];
  }

LABEL_41:
}

float _ColorForString(void *a1)
{
  id v1 = (void *)MEMORY[0x263F08708];
  id v2 = a1;
  id v3 = [v1 whitespaceAndNewlineCharacterSet];
  id v4 = [v2 stringByTrimmingCharactersInSet:v3];

  if ([v4 length])
  {
    uint64_t v5 = [&unk_26D0FAF88 objectForKey:v4];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;

      id v4 = v7;
    }
    char v8 = [v4 componentsSeparatedByString:@" "];
    float v9 = 0.0;
    if ([v8 count] == 3)
    {
      int v10 = [v8 objectAtIndex:0];
      [v10 floatValue];
      float v9 = v11;

      uint64_t v12 = [v8 objectAtIndex:1];
      [v12 floatValue];

      char v13 = [v8 objectAtIndex:2];
      [v13 floatValue];
    }
  }
  else
  {
    float v9 = 0.0;
  }

  return v9;
}

float _ColorForKey(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKeyedSubscript:a1];
  float v3 = _ColorForString(v2);

  return v3;
}

void sub_21F5A2B98(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A2E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A3118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A33A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A3638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A3930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A3CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A3FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A4254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

ACHTemplate *PerfectMonthTemplateForDateComponents(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = objc_alloc_init(ACHTemplate);
  uint64_t v6 = [NSString stringWithFormat:@"%@%04ld_%02ld", @"PerfectMonth_", objc_msgSend(v4, "year"), objc_msgSend(v4, "month")];
  [(ACHTemplate *)v5 setUniqueName:v6];
  [(ACHTemplate *)v5 setVersion:3];
  [(ACHTemplate *)v5 setMinimumEngineVersion:11];
  [(ACHTemplate *)v5 setPredicate:@"currentMoveStreak >= numberOfDaysInThisMonth && dayOfMonthForToday == numberOfDaysInThisMonth"];
  [(ACHTemplate *)v5 setProgressExpression:@"currentMonthMoveStreak"];
  [(ACHTemplate *)v5 setGoalExpression:@"numberOfDaysInThisMonth"];
  id v7 = [MEMORY[0x263F0A830] countUnit];
  [(ACHTemplate *)v5 setCanonicalUnit:v7];

  [(ACHTemplate *)v5 setTriggers:4];
  [(ACHTemplate *)v5 setEarnLimit:1];
  [(ACHTemplate *)v5 setVisibilityStart:v4];
  char v8 = [(ACHTemplate *)v5 visibilityStart];
  float v9 = [v3 dateFromComponents:v8];

  int v10 = objc_msgSend(v3, "hk_startOfMonthForDate:addingMonths:", v9, 1);
  float v11 = objc_msgSend(v3, "hk_startOfDateBySubtractingDays:fromDate:", 1, v10);
  uint64_t v12 = [v3 components:PerfectMonthCalendarUnits fromDate:v11];

  [(ACHTemplate *)v5 setVisibilityEnd:v12];
  [(ACHTemplate *)v5 setAvailabilityStart:v4];
  [(ACHTemplate *)v5 setAvailabilityEnd:v12];
  [(ACHTemplate *)v5 setDuplicateRemovalStrategy:2];
  [(ACHTemplate *)v5 setDuplicateRemovalCalendarUnit:8];
  [(ACHTemplate *)v5 setEarnDateStrategy:1];
  uint64_t v13 = ACHMonthlyTemplateDisplayOrder(v4, 0);

  [(ACHTemplate *)v5 setDisplayOrder:v13];

  return v5;
}

BOOL ACHIsActivityAchievementSharable(void *a1)
{
  uint64_t v1 = [a1 template];
  unsigned int v2 = [v1 minimumEngineVersion];

  id v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.nanolifestyle"];
  id v4 = [v3 valueForKey:@"AchievementsMaxmiumSharableEngineVersion"];
  uint64_t v5 = v4;
  if (v4) {
    unsigned int v6 = [v4 integerValue];
  }
  else {
    unsigned int v6 = 14;
  }
  BOOL v7 = v6 >= v2;

  return v7;
}

BOOL ACHIsActivityAchievementsAssetServerURLExplicitlySet()
{
  return CFPreferencesGetAppBooleanValue(@"ActivityChallengeAssetsServerExplicitlyChosen", @"com.apple.activityawardsd", 0) != 0;
}

void ACHSetActivityAchievementsAssetServerURLExplicitlySet()
{
}

__CFString *ACHTriggerOptionsToString(uint64_t a1)
{
  if (!a1)
  {
    id v3 = @"None";
    goto LABEL_19;
  }
  __int16 v1 = a1;
  if (a1)
  {
    unsigned int v2 = [MEMORY[0x263EFFA68] arrayByAddingObject:@"Day Changed"];
    if ((v1 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  unsigned int v2 = (void *)MEMORY[0x263EFFA68];
  if ((a1 & 2) != 0)
  {
LABEL_7:
    uint64_t v4 = [v2 arrayByAddingObject:@"Workout Added"];

    unsigned int v2 = (void *)v4;
  }
LABEL_8:
  if ((v1 & 4) != 0)
  {
    uint64_t v7 = [v2 arrayByAddingObject:@"Move Goal Achieved"];

    unsigned int v2 = (void *)v7;
    if ((v1 & 8) == 0)
    {
LABEL_10:
      if ((v1 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_24;
    }
  }
  else if ((v1 & 8) == 0)
  {
    goto LABEL_10;
  }
  uint64_t v8 = [v2 arrayByAddingObject:@"Move Goal Multiple Achieved"];

  unsigned int v2 = (void *)v8;
  if ((v1 & 0x10) == 0)
  {
LABEL_11:
    if ((v1 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v9 = [v2 arrayByAddingObject:@"Exercise Goal Achieved"];

  unsigned int v2 = (void *)v9;
  if ((v1 & 0x20) == 0)
  {
LABEL_12:
    if ((v1 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v10 = [v2 arrayByAddingObject:@"Stand Goal Achieved"];

  unsigned int v2 = (void *)v10;
  if ((v1 & 0x40) == 0)
  {
LABEL_13:
    if ((v1 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v11 = [v2 arrayByAddingObject:@"All Goals Achieved"];

  unsigned int v2 = (void *)v11;
  if ((v1 & 0x80) == 0)
  {
LABEL_14:
    if ((v1 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v12 = [v2 arrayByAddingObject:@"Best Move Value Achieved"];

  unsigned int v2 = (void *)v12;
  if ((v1 & 0x100) == 0)
  {
LABEL_15:
    if ((v1 & 0x200) == 0) {
      goto LABEL_16;
    }
LABEL_29:
    uint64_t v14 = [v2 arrayByAddingObject:@"Best Move Time Value Achieved"];

    unsigned int v2 = (void *)v14;
    if ((v1 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_28:
  uint64_t v13 = [v2 arrayByAddingObject:@"Best Exercise Value Achieved"];

  unsigned int v2 = (void *)v13;
  if ((v1 & 0x200) != 0) {
    goto LABEL_29;
  }
LABEL_16:
  if ((v1 & 0x400) != 0)
  {
LABEL_17:
    uint64_t v5 = [v2 arrayByAddingObject:@"Mindful Minutes Changed"];

    unsigned int v2 = (void *)v5;
  }
LABEL_18:
  id v3 = [v2 componentsJoinedByString:@"|"];

LABEL_19:

  return v3;
}

id ACHUnitForTemplateAndActivityMoveMode(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 canonicalUnit];
  if (ACHUnitForTemplateAndActivityMoveMode_onceToken != -1) {
    dispatch_once(&ACHUnitForTemplateAndActivityMoveMode_onceToken, &__block_literal_global_2);
  }
  if (a2 == 2)
  {
    uint64_t v5 = (void *)ACHUnitForTemplateAndActivityMoveMode_moveModeOverridenTemplates;
    unsigned int v6 = [v3 uniqueName];
    LODWORD(v5) = [v5 containsObject:v6];

    if (v5)
    {
      uint64_t v7 = [MEMORY[0x263F0A830] minuteUnit];

      uint64_t v4 = (void *)v7;
    }
  }

  return v4;
}

uint64_t __ACHUnitForTemplateAndActivityMoveMode_block_invoke()
{
  ACHUnitForTemplateAndActivityMoveMode_moveModeOverridenTemplates = [MEMORY[0x263EFFA08] setWithArray:&unk_26D0FB038];

  return MEMORY[0x270F9A758]();
}

void ACHEncodeAchievementIntoUserInfoDictionary(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = 0;
  uint64_t v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v7];
  id v5 = v7;
  if (!v4)
  {
    unsigned int v6 = ACHLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ACHEncodeAchievementIntoUserInfoDictionary_cold_1((uint64_t)v5, v6);
    }
  }
  [v3 setObject:v4 forKeyedSubscript:@"ACHUserInfoDictionaryEncodedAchievementKey"];
}

id ACHDecodeAchievementFromUserInfoDictionary(void *a1)
{
  __int16 v1 = [a1 objectForKeyedSubscript:@"ACHUserInfoDictionaryEncodedAchievementKey"];
  if (v1)
  {
    id v6 = 0;
    unsigned int v2 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v1 error:&v6];
    id v3 = v6;
    if (!v2)
    {
      uint64_t v4 = ACHLogDefault();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        ACHDecodeAchievementFromUserInfoDictionary_cold_2((uint64_t)v3, v4);
      }
    }
  }
  else
  {
    id v3 = ACHLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ACHDecodeAchievementFromUserInfoDictionary_cold_1(v3);
    }
    unsigned int v2 = 0;
  }

  return v2;
}

id _ACHLengthFormatter(uint64_t a1)
{
  unsigned int v2 = (void *)_ACHLengthFormatter__formatter;
  if (!_ACHLengthFormatter__formatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v3 setNumberStyle:1];
    [v3 setMinimumFractionDigits:2];
    [v3 setMaximumFractionDigits:2];
    [v3 setRoundingMode:3];
    id v4 = objc_alloc_init(MEMORY[0x263F08940]);
    id v5 = (void *)_ACHLengthFormatter__formatter;
    _ACHLengthFormatter__formatter = (uint64_t)v4;

    [(id)_ACHLengthFormatter__formatter setNumberFormatter:v3];
    [(id)_ACHLengthFormatter__formatter setUnitStyle:a1];

    unsigned int v2 = (void *)_ACHLengthFormatter__formatter;
  }

  return v2;
}

id _ACHLengthFormatterNoDigits(uint64_t a1)
{
  unsigned int v2 = (void *)_ACHLengthFormatterNoDigits__formatterNoDigits;
  if (!_ACHLengthFormatterNoDigits__formatterNoDigits)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v3 setNumberStyle:1];
    [v3 setMinimumFractionDigits:0];
    [v3 setMaximumFractionDigits:0];
    [v3 setRoundingMode:2];
    id v4 = objc_alloc_init(MEMORY[0x263F08940]);
    id v5 = (void *)_ACHLengthFormatterNoDigits__formatterNoDigits;
    _ACHLengthFormatterNoDigits__formatterNoDigits = (uint64_t)v4;

    [(id)_ACHLengthFormatterNoDigits__formatterNoDigits setNumberFormatter:v3];
    [(id)_ACHLengthFormatterNoDigits__formatterNoDigits setUnitStyle:a1];

    unsigned int v2 = (void *)_ACHLengthFormatterNoDigits__formatterNoDigits;
  }

  return v2;
}

id ACHFormatOrdinal(void *a1)
{
  uint64_t v1 = ACHFormatOrdinal_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&ACHFormatOrdinal_onceToken, &__block_literal_global_454);
  }
  id v3 = [(id)ACHFormatOrdinal__formatter stringFromNumber:v2];

  return v3;
}

uint64_t __ACHFormatOrdinal_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v1 = (void *)ACHFormatOrdinal__formatter;
  ACHFormatOrdinal__formatter = (uint64_t)v0;

  id v2 = (void *)ACHFormatOrdinal__formatter;

  return [v2 setNumberStyle:6];
}

id ACHFormatPercent(void *a1)
{
  uint64_t v1 = ACHFormatPercent_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&ACHFormatPercent_onceToken, &__block_literal_global_456);
  }
  id v3 = [(id)ACHFormatPercent__formatter stringFromNumber:v2];

  return v3;
}

uint64_t __ACHFormatPercent_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v1 = (void *)ACHFormatPercent__formatter;
  ACHFormatPercent__formatter = (uint64_t)v0;

  id v2 = (void *)ACHFormatPercent__formatter;

  return [v2 setNumberStyle:3];
}

uint64_t ACHFormatDuration(void *a1)
{
  uint64_t v1 = ACHFormatDuration_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&ACHFormatDuration_onceToken, &__block_literal_global_458);
  }
  [v2 doubleValue];
  double v4 = v3;

  id v5 = (void *)ACHFormatDuration__formatter;

  return [v5 stringFromTimeInterval:v4];
}

uint64_t __ACHFormatDuration_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08780]);
  uint64_t v1 = (void *)ACHFormatDuration__formatter;
  ACHFormatDuration__formatter = (uint64_t)v0;

  [(id)ACHFormatDuration__formatter setUnitsStyle:0];
  [(id)ACHFormatDuration__formatter setAllowedUnits:224];
  id v2 = (void *)ACHFormatDuration__formatter;

  return [v2 setZeroFormattingBehavior:0x10000];
}

id ACHFormatMinutes(void *a1)
{
  uint64_t v1 = ACHFormatMinutes_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&ACHFormatMinutes_onceToken, &__block_literal_global_461);
  }
  id v3 = objc_alloc_init(MEMORY[0x263EFF918]);
  uint64_t v4 = [v2 integerValue];

  [v3 setMinute:v4];
  id v5 = [(id)ACHFormatMinutes__formatter stringFromDateComponents:v3];

  return v5;
}

uint64_t __ACHFormatMinutes_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08780]);
  uint64_t v1 = (void *)ACHFormatMinutes__formatter;
  ACHFormatMinutes__formatter = (uint64_t)v0;

  [(id)ACHFormatMinutes__formatter setUnitsStyle:3];
  id v2 = (void *)ACHFormatMinutes__formatter;

  return [v2 setAllowedUnits:64];
}

id ACHFormatNumberOfDays(void *a1)
{
  uint64_t v1 = ACHFormatNumberOfDays_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&ACHFormatNumberOfDays_onceToken, &__block_literal_global_464);
  }
  id v3 = objc_alloc_init(MEMORY[0x263EFF918]);
  uint64_t v4 = [v2 integerValue];

  [v3 setDay:v4];
  id v5 = [(id)ACHFormatNumberOfDays__formatter stringFromDateComponents:v3];

  return v5;
}

uint64_t __ACHFormatNumberOfDays_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08780]);
  uint64_t v1 = (void *)ACHFormatNumberOfDays__formatter;
  ACHFormatNumberOfDays__formatter = (uint64_t)v0;

  [(id)ACHFormatNumberOfDays__formatter setUnitsStyle:3];
  id v2 = (void *)ACHFormatNumberOfDays__formatter;

  return [v2 setAllowedUnits:16];
}

id ACHFormatDateWithStyle(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setFormattingContext:1];
  switch(a2)
  {
    case 0:
      [v4 setDateStyle:1];
      break;
    case 1:
      id v5 = @"MMMMy";
      goto LABEL_9;
    case 2:
      id v5 = @"MMMy";
      goto LABEL_9;
    case 3:
      id v5 = @"My";
      goto LABEL_9;
    case 4:
      id v5 = @"MMMM d";
      goto LABEL_9;
    case 5:
      id v5 = @"LLLL";
      goto LABEL_9;
    case 6:
      id v5 = @"y";
LABEL_9:
      [v4 setLocalizedDateFormatFromTemplate:v5];
      break;
    default:
      break;
  }
  id v6 = [v4 stringFromDate:v3];

  return v6;
}

id ACHFormatDistance(void *a1)
{
  id v1 = a1;
  id v2 = _ACHLengthFormatter(2);
  [v1 doubleValue];
  double v4 = v3;

  id v5 = [v2 stringFromMeters:v4];

  return v5;
}

id ACHFormatDistanceWithUserUnit(void *a1, uint64_t a2)
{
  id v3 = a1;
  double v4 = _ACHLengthFormatter(2);
  [v3 doubleValue];
  double v6 = v5;

  id v7 = [v4 stringFromValue:a2 unit:v6];

  return v7;
}

id ACHFormatDistanceWithUserUnitAndUnitStyle(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  id v7 = a1;
  if (a4) {
    _ACHLengthFormatter(a3);
  }
  else {
  uint64_t v8 = _ACHLengthFormatterNoDigits(a3);
  }
  [v7 doubleValue];
  double v10 = v9;

  uint64_t v11 = [v8 stringFromValue:a2 unit:v10];

  return v11;
}

uint64_t ACHFormatEnergyWithUserUnit(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = ACHFormatEnergyWithUserUnit_onceToken;
  id v6 = a1;
  if (v5 != -1) {
    dispatch_once(&ACHFormatEnergyWithUserUnit_onceToken, &__block_literal_global_485);
  }
  [(id)ACHFormatEnergyWithUserUnit__formatter setUnitStyle:a3];
  id v7 = (void *)ACHFormatEnergyWithUserUnit__formatter;
  [v6 doubleValue];
  double v9 = v8;

  double v10 = round(v9);

  return [v7 stringFromValue:a2 unit:v10];
}

void __ACHFormatEnergyWithUserUnit_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F087D8]);
  id v1 = (void *)ACHFormatEnergyWithUserUnit__formatter;
  ACHFormatEnergyWithUserUnit__formatter = (uint64_t)v0;

  id v2 = [(id)ACHFormatEnergyWithUserUnit__formatter numberFormatter];
  [v2 setFormattingContext:1];
}

id ACHFormatEnergyWithUserUnitAndFormatterUnit(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  if (ACHFormatEnergyWithUserUnitAndFormatterUnit_onceToken != -1) {
    dispatch_once(&ACHFormatEnergyWithUserUnitAndFormatterUnit_onceToken, &__block_literal_global_488);
  }
  [(id)ACHFormatEnergyWithUserUnitAndFormatterUnit__formatter setUnitStyle:a4];
  double v9 = [MEMORY[0x263F0A830] largeCalorieUnit];
  uint64_t v10 = [v8 isEqual:v9];

  [(id)ACHFormatEnergyWithUserUnitAndFormatterUnit__formatter setForFoodEnergyUse:v10];
  uint64_t v11 = (void *)ACHFormatEnergyWithUserUnitAndFormatterUnit__formatter;
  [v7 doubleValue];
  uint64_t v13 = [v11 stringFromValue:a3 unit:round(v12)];

  return v13;
}

void __ACHFormatEnergyWithUserUnitAndFormatterUnit_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F087D8]);
  id v1 = (void *)ACHFormatEnergyWithUserUnitAndFormatterUnit__formatter;
  ACHFormatEnergyWithUserUnitAndFormatterUnit__formatter = (uint64_t)v0;

  id v2 = [(id)ACHFormatEnergyWithUserUnitAndFormatterUnit__formatter numberFormatter];
  [v2 setFormattingContext:1];
}

uint64_t ACHFormatEnergyUnit(uint64_t a1)
{
  if (ACHFormatEnergyUnit_onceToken != -1) {
    dispatch_once(&ACHFormatEnergyUnit_onceToken, &__block_literal_global_490);
  }
  id v2 = (void *)ACHFormatEnergyUnit__formatter;

  return [v2 unitStringFromValue:a1 unit:2.0];
}

void __ACHFormatEnergyUnit_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F087D8]);
  id v1 = (void *)ACHFormatEnergyUnit__formatter;
  ACHFormatEnergyUnit__formatter = (uint64_t)v0;

  [(id)ACHFormatEnergyUnit__formatter setUnitStyle:3];
  id v2 = [(id)ACHFormatEnergyUnit__formatter numberFormatter];
  [v2 setFormattingContext:1];
}

id ACHFormatMoveMinutes(void *a1)
{
  uint64_t v1 = [a1 unsignedIntegerValue];
  id v2 = ACHBundle();
  id v3 = [v2 localizedStringForKey:@"MOVE_MINUTES" value:&stru_26D0EC7B0 table:@"Localizable-tinker"];

  double v4 = objc_msgSend(NSString, "localizedStringWithFormat:", v3, v1);

  return v4;
}

id ACHBundle()
{
  if (ACHBundle_onceToken != -1) {
    dispatch_once(&ACHBundle_onceToken, &__block_literal_global_507);
  }
  id v0 = (void *)ACHBundle___bundle;

  return v0;
}

uint64_t ACHSystemRootDirectory()
{
  if (ACHSystemRootDirectory_onceToken != -1) {
    dispatch_once(&ACHSystemRootDirectory_onceToken, &__block_literal_global_502);
  }
  return ACHSystemRootDirectory_systemRootDirectory;
}

void __ACHSystemRootDirectory_block_invoke()
{
  ACHSystemRootDirectory_systemRootDirectory = @"/";
}

void __ACHBundle_block_invoke()
{
  if (ACHSystemRootDirectory_onceToken != -1) {
    dispatch_once(&ACHSystemRootDirectory_onceToken, &__block_literal_global_502);
  }
  id v2 = [(id)ACHSystemRootDirectory_systemRootDirectory stringByAppendingPathComponent:@"/System/Library/PrivateFrameworks/ActivityAchievementsUI.framework"];
  uint64_t v0 = [MEMORY[0x263F086E0] bundleWithPath:v2];
  uint64_t v1 = (void *)ACHBundle___bundle;
  ACHBundle___bundle = v0;
}

void sub_21F5A652C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A6828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t ACHTemplateStringFromStrings(void *a1, const char *a2)
{
  return [a1 componentsJoinedByString:a2];
}

uint64_t ACHTemplateStringsFromString(void *a1, const char *a2)
{
  return [a1 componentsSeparatedByString:a2];
}

id ACHEndOfMonthDateComponentsForStartOfMonth(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263EFF8F0];
  id v2 = a1;
  id v3 = objc_msgSend(v1, "hk_gregorianCalendarWithLocalTimeZone");
  double v4 = [v3 dateFromComponents:v2];

  uint64_t v5 = [v3 startOfDayForDate:v4];

  id v6 = [v3 dateByAddingUnit:8 value:1 toDate:v5 options:0];
  id v7 = [v3 dateByAddingUnit:128 value:-1 toDate:v6 options:0];
  id v8 = [v3 components:28 fromDate:v7];

  return v8;
}

uint64_t ACHCodableEarnedInstanceArrayReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  double v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(ACHCodableEarnedInstance);
        [a1 addEarnedInstances:v17];
        if (!PBReaderPlaceMark() || (ACHCodableEarnedInstanceReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21F5A82B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A85B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A885C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A8B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A8E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A914C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A9484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A9818(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A9A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F5A9D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F5AA038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F5AA2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F5AA5D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F5AA824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21F5AAAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F5AAD40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F5AB038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21F5AB330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F5AB584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21F5AB810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F5ABB40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F5ABE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F5AC284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_21F5AC5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F5AC89C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F5ACBE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

id ACHLegacyKeyTransformations()
{
  if (ACHLegacyKeyTransformations_onceToken != -1) {
    dispatch_once(&ACHLegacyKeyTransformations_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)ACHLegacyKeyTransformations_ACHBackCompatKeyValueMappingDictionary;

  return v0;
}

void __ACHLegacyKeyTransformations_block_invoke()
{
  uint64_t v0 = (void *)ACHLegacyKeyTransformations_ACHBackCompatKeyValueMappingDictionary;
  ACHLegacyKeyTransformations_ACHBackCompatKeyValueMappingDictionary = (uint64_t)&unk_26D0FAFB0;
}

id ACHLegacyKeyValueRepresentationFromProperties(void *a1)
{
  id v1 = a1;
  id v2 = ACHLegacyKeyTransformations();
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  unint64_t v10 = __ACHLegacyKeyValueRepresentationFromProperties_block_invoke;
  uint64_t v11 = &unk_264512810;
  id v12 = v2;
  id v4 = v3;
  id v13 = v4;
  id v5 = v2;
  [v1 enumerateKeysAndObjectsUsingBlock:&v8];

  if (objc_msgSend(v4, "count", v8, v9, v10, v11)) {
    id v6 = (void *)[v4 copy];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

void __ACHLegacyKeyValueRepresentationFromProperties_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v5];
  }
}

id ACHAwardsServerInterface()
{
  v25[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D106870];
  id v1 = objc_alloc(MEMORY[0x263EFFA08]);
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  id v3 = (void *)[v1 initWithArray:v2];

  [v0 setClasses:v3 forSelector:sel_remote_addTemplates_completion_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v3 forSelector:sel_remote_addTemplates_removingTemplates_completion_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v3 forSelector:sel_remote_addTemplates_removingTemplates_completion_ argumentIndex:1 ofReply:0];
  [v0 setClasses:v3 forSelector:sel_remote_removeTemplates_completion_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v3 forSelector:sel_remote_fetchAllTemplatesWithCompletion_ argumentIndex:0 ofReply:1];
  id v4 = objc_alloc(MEMORY[0x263EFFA08]);
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  id v6 = (void *)[v4 initWithArray:v5];

  [v0 setClasses:v6 forSelector:sel_remote_addEarnedInstances_completion_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v6 forSelector:sel_remote_fetchEarnedInstancesForTemplateUniqueName_completion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v6 forSelector:sel_remote_fetchEarnedInstancesForEarnedDateComponentsString_completion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v6 forSelector:sel_remote_removeEarnedInstances_completion_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v6 forSelector:sel_remote_fetchAllEarnedInstancesWithCompletion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v6 forSelector:sel_remote_addEarnedInstances_removingEarnedInstances_completion_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v6 forSelector:sel_remote_addEarnedInstances_removingEarnedInstances_completion_ argumentIndex:1 ofReply:0];
  [v0 setClasses:v6 forSelector:sel_remote_addEarnedInstances_removingEarnedInstances_completion_ argumentIndex:0 ofReply:1];
  id v7 = objc_alloc(MEMORY[0x263EFFA08]);
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  uint64_t v9 = (void *)[v7 initWithArray:v8];

  id v10 = objc_alloc(MEMORY[0x263EFFA08]);
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  id v12 = (void *)[v10 initWithArray:v11];

  [v0 setClasses:v9 forSelector:sel_remote_countOfEarnedInstancesForUniqueNames_completion_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v12 forSelector:sel_remote_countOfEarnedInstancesForUniqueNames_completion_ argumentIndex:0 ofReply:1];
  id v13 = objc_alloc(MEMORY[0x263EFFA08]);
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  uint64_t v15 = (void *)[v13 initWithArray:v14];

  id v16 = objc_alloc(MEMORY[0x263EFFA08]);
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
  uint64_t v18 = (void *)[v16 initWithArray:v17];

  [v0 setClasses:v15 forSelector:sel_remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames_completion_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v18 forSelector:sel_remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames_completion_ argumentIndex:0 ofReply:1];

  return v0;
}

uint64_t ACHCodableEarnedInstanceReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = 0x267EE2000uLL;
  unint64_t v8 = 0x267EE2000uLL;
  unint64_t v9 = 0x267EE2000uLL;
  id v10 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v3;
      uint64_t v15 = *(void *)(a2 + v14);
      unint64_t v16 = v15 + 1;
      if (v15 == -1 || v16 > *(void *)(a2 + *v4)) {
        break;
      }
      char v17 = *(unsigned char *)(*(void *)(a2 + *v10) + v15);
      *(void *)(a2 + v14) = v16;
      v13 |= (unint64_t)(v17 & 0x7F) << v11;
      if ((v17 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v18 = v12++ >= 9;
      if (v18)
      {
        unint64_t v13 = 0;
        int v19 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v19 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    if (v19 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = *(int *)(v7 + 2292);
        goto LABEL_45;
      case 2u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = *(int *)(v8 + 2296);
        goto LABEL_45;
      case 3u:
        *(unsigned char *)(a1 + *(int *)(v9 + 2300)) |= 1u;
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v26 = *(void *)(*(void *)(a2 + *v10) + v25);
          *(void *)(a2 + v24) = v25 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v26 = 0;
        }
        uint64_t v48 = 8;
        goto LABEL_62;
      case 4u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + *(int *)(v9 + 2300)) |= 2u;
        while (2)
        {
          uint64_t v30 = *v3;
          uint64_t v31 = *(void *)(a2 + v30);
          unint64_t v32 = v31 + 1;
          if (v31 == -1 || v32 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)(a2 + *v10) + v31);
            *(void *)(a2 + v30) = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if (v33 < 0)
            {
              v27 += 7;
              BOOL v18 = v28++ >= 9;
              if (v18)
              {
                uint64_t v29 = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v29 = 0;
        }
LABEL_52:
        uint64_t v47 = 16;
        goto LABEL_57;
      case 5u:
        *(unsigned char *)(a1 + *(int *)(v9 + 2300)) |= 8u;
        uint64_t v34 = *v3;
        unint64_t v35 = *(void *)(a2 + v34);
        if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v26 = *(void *)(*(void *)(a2 + *v10) + v35);
          *(void *)(a2 + v34) = v35 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v26 = 0;
        }
        uint64_t v48 = 32;
LABEL_62:
        *(void *)(a1 + v48) = v26;
        goto LABEL_63;
      case 6u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 72;
        goto LABEL_45;
      case 7u:
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + *(int *)(v9 + 2300)) |= 4u;
        while (2)
        {
          uint64_t v38 = *v3;
          uint64_t v39 = *(void *)(a2 + v38);
          unint64_t v40 = v39 + 1;
          if (v39 == -1 || v40 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)(a2 + *v10) + v39);
            *(void *)(a2 + v38) = v40;
            v29 |= (unint64_t)(v41 & 0x7F) << v36;
            if (v41 < 0)
            {
              v36 += 7;
              BOOL v18 = v37++ >= 9;
              if (v18)
              {
                uint64_t v29 = 0;
                goto LABEL_56;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v29 = 0;
        }
LABEL_56:
        uint64_t v47 = 24;
LABEL_57:
        *(void *)(a1 + v47) = v29;
        goto LABEL_63;
      case 8u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 48;
LABEL_45:
        uint64_t v42 = *(void **)(a1 + v22);
        *(void *)(a1 + v22) = v21;

        goto LABEL_63;
      case 9u:
        unint64_t v43 = v9;
        unint64_t v44 = v8;
        unint64_t v45 = v7;
        uint64_t v46 = objc_alloc_init(ACHCodableSyncIdentity);
        objc_storeStrong((id *)(a1 + 56), v46);
        if (PBReaderPlaceMark() && ACHCodableSyncIdentityReadFrom((uint64_t)v46, a2))
        {
          PBReaderRecallMark();

          unint64_t v7 = v45;
          unint64_t v8 = v44;
          unint64_t v9 = v43;
LABEL_63:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_63;
    }
  }
}

BOOL ACHTemplateUniqueNameIsMonthlyChallenge(void *a1)
{
  return ACHMonthlyChallengeTypeFromTemplateUniqueName(a1) != 0;
}

__CFString *ACHMonthlyChallengeNameFromChallengeType(unint64_t a1)
{
  if (a1 > 0x1D) {
    return 0;
  }
  else {
    return off_2645128B8[a1];
  }
}

uint64_t ACHMonthlyChallengeTypeFromMonthlyChallengeName(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeAllThreeRings"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeMoveRing"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeExerciseRing"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeStandRing"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalEnergyBurn"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalExerciseMinutes"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalWorkouts"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutRunning"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutOpenWaterSwimming"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutPoolSwimming"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutOutdoorCycling"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutIndoorCycling"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutHIIT"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutYoga"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutHiking"])
  {
    uint64_t v2 = 15;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutElliptical"])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutRowing"])
  {
    uint64_t v2 = 17;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutStairs"])
  {
    uint64_t v2 = 18;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutWalking"])
  {
    uint64_t v2 = 19;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalDistance"])
  {
    uint64_t v2 = 20;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeDaysDoublingMoveGoal"])
  {
    uint64_t v2 = 21;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalAppleMoveTime"])
  {
    uint64_t v2 = 22;
  }
  else if ([v1 isEqual:@"ACHMonthlyChallengeTypeDaysDoublingExerciseGoal"])
  {
    uint64_t v2 = 23;
  }
  else if ([v1 isEqual:@"ACHMonthlyChallengeTypeMoveStreak"])
  {
    uint64_t v2 = 24;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeDailyEnergyBurnTarget"])
  {
    uint64_t v2 = 25;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeDailyExerciseMinutesTarget"])
  {
    uint64_t v2 = 26;
  }
  else if ([v1 isEqual:@"ACHMonthlyChallengeTypeDailyDistanceTarget"])
  {
    uint64_t v2 = 27;
  }
  else if ([v1 isEqual:@"ACHMonthlyChallengeTypeDailyAppleMoveTimeTarget"])
  {
    uint64_t v2 = 28;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t ACHMonthlyChallengeTypeFromLegacyString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"MonthlyChallengeTypeAllThreeRings"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeMoveRing"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeExerciseRing"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeStandRing"])
  {
    uint64_t v2 = 4;
  }
  else if (([v1 isEqualToString:@"MonthlyChallengeTypeAverageDailyEnergyBurn"] & 1) != 0 {
         || ([v1 isEqualToString:@"MonthlyChallengeTypeTotalEnergyBurn"] & 1) != 0)
  }
  {
    uint64_t v2 = 5;
  }
  else if (([v1 isEqualToString:@"MonthlyChallengeTypeAverageDailyExerciseMinutes"] & 1) != 0 {
         || ([v1 isEqualToString:@"MonthlyChallengeTypeTotalExerciseMinutes"] & 1) != 0)
  }
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalWorkouts"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutRunning"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutOpenWaterSwimming"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutPoolSwimming"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutOutdoorCycling"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"ACHMonthlyChallengeTypeTotalSpecificWorkoutIndoorCycling"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutHIIT"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutYoga"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutHiking"])
  {
    uint64_t v2 = 15;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutElliptical"])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutRowing"])
  {
    uint64_t v2 = 17;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutStairs"])
  {
    uint64_t v2 = 18;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalSpecificWorkoutWalking"])
  {
    uint64_t v2 = 19;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeTotalDistance"])
  {
    uint64_t v2 = 20;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeDaysDoublingMoveGoal"])
  {
    uint64_t v2 = 21;
  }
  else if ([v1 isEqual:@"MonthlyChallengeTypeDaysDoublingExerciseGoal"])
  {
    uint64_t v2 = 23;
  }
  else if ([v1 isEqual:@"MonthlyChallengeTypeMoveStreak"])
  {
    uint64_t v2 = 24;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeDailyEnergyBurnTarget"])
  {
    uint64_t v2 = 25;
  }
  else if ([v1 isEqualToString:@"MonthlyChallengeTypeDailyExerciseMinutesTarget"])
  {
    uint64_t v2 = 26;
  }
  else if ([v1 isEqual:@"MonthlyChallengeTypeDailyDistanceTarget"])
  {
    uint64_t v2 = 27;
  }
  else if ([v1 isEqual:@"MonthlyChallengeTypeDailyAppleMoveTimeTarget"])
  {
    uint64_t v2 = 28;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t ACHMonthlyChallengeAchievementIsDayBased(void *a1)
{
  id v1 = [a1 template];
  uint64_t v2 = [v1 uniqueName];
  char v3 = ACHMonthlyChallengeTypeFromTemplateUniqueName(v2);

  return (0x1FA0001Eu >> v3) & 1;
}

id ACHMonthlyChallengeAchievementFromAchievementsForDate(void *a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a3;
  unint64_t v7 = objc_msgSend(v6, "hk_startOfMonthForDate:", a2);
  unint64_t v8 = [v6 components:28 fromDate:v7];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v5;
  id v10 = (id)[v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    int v19 = v7;
    id v20 = v6;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "template", v19, v20, (void)v21);
        if (ACHTemplateIsMonthlyChallenge(v14))
        {
          uint64_t v15 = [v13 template];
          unint64_t v16 = [v15 availabilityStart];
          int v17 = [v16 isEqual:v8];

          if (v17)
          {
            id v10 = v13;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
LABEL_12:
    unint64_t v7 = v19;
    id v6 = v20;
  }

  return v10;
}

id ACHMonthlyChallengeCacheValue(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 uniqueName];
  unint64_t v3 = ACHMonthlyChallengeTypeFromTemplateUniqueName(v2);

  id v4 = [v1 availabilityStart];
  id v5 = objc_alloc_init(ACHPredicateExpressionValidator);
  id v6 = [v1 goalExpression];
  unint64_t v7 = [(ACHPredicateExpressionValidator *)v5 validateExpressionString:v6];

  if ([v7 isValid])
  {
    unint64_t v8 = (void *)MEMORY[0x263F087F0];
    id v9 = [v1 goalExpression];
    id v10 = [v8 expressionWithFormat:v9];

    uint64_t v11 = [v10 expressionValueWithObject:0 context:0];
    [v1 dailyTarget];
    if (v12 > 0.0)
    {
      unint64_t v13 = [v1 dailyTargetCanonicalUnit];

      if (v13)
      {
        uint64_t v14 = NSNumber;
        [v1 dailyTarget];
        uint64_t v15 = objc_msgSend(v14, "numberWithDouble:");

        uint64_t v11 = (void *)v15;
      }
    }
    unint64_t v16 = [v1 availableSuffixes];
    int v17 = v16;
    if (v16)
    {
      [v16 componentsJoinedByString:@"|"];
      v18 = unsigned int v28 = v10;
      int v19 = [v18 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

      id v20 = NSString;
      long long v21 = ACHMonthlyChallengeNameFromChallengeType(v3);
      uint64_t v22 = [v4 year];
      uint64_t v27 = [v4 month];
      long long v23 = v20;
      id v10 = v28;
      long long v24 = [v23 stringWithFormat:@"%@_%04ld_%02ld_%@_%@", v21, v22, v27, v11, v19];
    }
    else
    {
      unint64_t v25 = NSString;
      int v19 = ACHMonthlyChallengeNameFromChallengeType(v3);
      long long v24 = [v25 stringWithFormat:@"%@_%04ld_%02ld_%@", v19, objc_msgSend(v4, "year"), objc_msgSend(v4, "month"), v11];
    }
  }
  else
  {
    long long v24 = 0;
  }

  return v24;
}

uint64_t ACHMonthlyTemplateDisplayOrder(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 year];
  uint64_t v5 = [v3 month];

  return v5 + a2 + 100 * v4;
}

uint64_t ACHWorkoutActivityTypeForMonthlyChallengeType(unint64_t a1)
{
  if (a1 - 8 >= 0xC)
  {
    id v3 = ACHLogTemplates();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      ACHWorkoutActivityTypeForMonthlyChallengeType_cold_1(a1, v3);
    }

    id v1 = (char *)MEMORY[0x263F0AC20];
  }
  else
  {
    id v1 = (char *)&unk_21F5C2820 + 8 * a1 - 64;
  }
  return *(void *)v1;
}

uint64_t ACHWorkoutLocationTypeForMonthlyChallengeType(uint64_t a1)
{
  if (a1 == 12) {
    return 1;
  }
  else {
    return 2 * (a1 == 11);
  }
}

double ACHLowRuleThresholdForChallenge(uint64_t a1)
{
  double result = 0.0;
  if ((unint64_t)(a1 - 1) <= 0x17) {
    return dbl_21F5C2880[a1 - 1];
  }
  return result;
}

id ACHDeviceCapabilitiesForMonthlyChallenges()
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"06943DC7-5853-4025-B160-D33A8C0D0449"];
  v3[0] = v0;
  id v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];

  return v1;
}

uint64_t ACHMonthlyChallengeHasRequiredDeviceCapability(unint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 > 0x1D)
  {
    uint64_t v6 = 0;
  }
  else if (((1 << a1) & 0x1F8FFF80) != 0)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"06943DC7-5853-4025-B160-D33A8C0D0449"];
    uint64_t v5 = [v3 objectForKeyedSubscript:v4];
    uint64_t v6 = [v5 BOOLValue];
  }
  else
  {
    uint64_t v6 = ((1 << a1) & 0x20500061) == 0;
  }

  return v6;
}

__CFString *ACHDuplicateRemovalStrategyToString(char a1)
{
  if ((a1 - 1) > 3u) {
    return 0;
  }
  else {
    return off_264512C20[(char)(a1 - 1)];
  }
}

__CFString *ACHEarnDateStrategyToString(int a1)
{
  id v1 = @"Current Date";
  if (a1 != 1) {
    id v1 = 0;
  }
  if (a1 == 2) {
    return @"Yesterday";
  }
  else {
    return v1;
  }
}

id ACHSortedTemplates(void *a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263F08B30];
  id v2 = a1;
  id v3 = [v1 sortDescriptorWithKey:@"key" ascending:1];
  v7[0] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  uint64_t v5 = [v2 sortedArrayUsingDescriptors:v4];

  return v5;
}

uint64_t ACHTemplateIsBuiltIn(void *a1)
{
  return ACHTemplateSourceNameIsEqualToIdentifier(a1, @"BuiltIn");
}

uint64_t ACHTemplateIsPerfectMonth(void *a1)
{
  return ACHTemplateSourceNameIsEqualToIdentifier(a1, @"PerfectMonth");
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id ACHServerInterface()
{
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1068D0];
  id v1 = objc_alloc(MEMORY[0x263EFFA08]);
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  id v3 = (void *)[v1 initWithArray:v2];

  [v0 setClasses:v3 forSelector:sel_remote_fetchAllTemplatesWithCompletion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v3 forSelector:sel_remote_removeTemplate_completion_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v3 forSelector:sel_remote_addTemplate_completion_ argumentIndex:0 ofReply:0];
  id v4 = objc_alloc(MEMORY[0x263EFFA08]);
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  uint64_t v6 = (void *)[v4 initWithArray:v5];

  unint64_t v7 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v0 setClasses:v6 forSelector:sel_remote_fetchAllEarnedInstancesWithCompletion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v7 forSelector:sel_remote_addEarnedInstance_completion_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v7 forSelector:sel_remote_removeEarnedInstance_completion_ argumentIndex:0 ofReply:0];
  id v8 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v17 = objc_opt_class();
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  id v10 = (void *)[v8 initWithArray:v9];

  uint64_t v11 = [v10 setByAddingObject:objc_opt_class()];
  [v0 setClasses:v11 forSelector:sel_remote_fetchAllAchievementsWithCompletion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_remote_fetchAchievementWithTemplateUniqueName_completion_ argumentIndex:1 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_remote_fetchEphemeralAchievementWithTemplateUniqueName_completion_ argumentIndex:1 ofReply:1];
  id v12 = objc_alloc(MEMORY[0x263EFFA08]);
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  unint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  uint64_t v14 = objc_msgSend(v12, "initWithArray:", v13, v16[0]);

  [v0 setClasses:v14 forSelector:sel_remote_availableMobileAssetsWithCompletion_ argumentIndex:0 ofReply:1];

  return v0;
}

uint64_t ACHCodableLegacyAchievementReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 56;
          goto LABEL_50;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 68) |= 1u;
          while (2)
          {
            uint64_t v23 = *v3;
            uint64_t v24 = *(void *)(a2 + v23);
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                BOOL v15 = v21++ >= 9;
                if (v15)
                {
                  uint64_t v22 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_61:
          uint64_t v53 = 8;
          goto LABEL_74;
        case 3u:
          *(unsigned char *)(a1 + 68) |= 2u;
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v29 = *(void *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v29 = 0;
          }
          uint64_t v54 = 16;
          goto LABEL_79;
        case 4u:
          *(unsigned char *)(a1 + 68) |= 4u;
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v29 = *(void *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v31 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v29 = 0;
          }
          uint64_t v54 = 24;
LABEL_79:
          *(void *)(a1 + v54) = v29;
          continue;
        case 5u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 68) |= 8u;
          while (2)
          {
            uint64_t v34 = *v3;
            uint64_t v35 = *(void *)(a2 + v34);
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v36;
              v22 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v15 = v33++ >= 9;
                if (v15)
                {
                  uint64_t v22 = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_65:
          uint64_t v53 = 32;
          goto LABEL_74;
        case 7u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          *(unsigned char *)(a1 + 68) |= 0x20u;
          while (2)
          {
            uint64_t v42 = *v3;
            uint64_t v43 = *(void *)(a2 + v42);
            unint64_t v44 = v43 + 1;
            if (v43 == -1 || v44 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
              *(void *)(a2 + v42) = v44;
              v41 |= (unint64_t)(v45 & 0x7F) << v39;
              if (v45 < 0)
              {
                v39 += 7;
                BOOL v15 = v40++ >= 9;
                if (v15)
                {
                  uint64_t v41 = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v41 = 0;
          }
LABEL_69:
          *(unsigned char *)(a1 + 64) = v41 != 0;
          continue;
        case 8u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 48;
LABEL_50:
          uint64_t v46 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        case 9u:
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 68) |= 0x10u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v49 = *v3;
        uint64_t v50 = *(void *)(a2 + v49);
        unint64_t v51 = v50 + 1;
        if (v50 == -1 || v51 > *(void *)(a2 + *v4)) {
          break;
        }
        char v52 = *(unsigned char *)(*(void *)(a2 + *v7) + v50);
        *(void *)(a2 + v49) = v51;
        v22 |= (unint64_t)(v52 & 0x7F) << v47;
        if ((v52 & 0x80) == 0) {
          goto LABEL_71;
        }
        v47 += 7;
        BOOL v15 = v48++ >= 9;
        if (v15)
        {
          uint64_t v22 = 0;
          goto LABEL_73;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_71:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v22 = 0;
      }
LABEL_73:
      uint64_t v53 = 40;
LABEL_74:
      *(void *)(a1 + v53) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id ACHSortedEarnedInstances(void *a1)
{
  id v1 = [a1 allObjects];
  id v2 = [v1 sortedArrayUsingComparator:&__block_literal_global_6];

  return v2;
}

uint64_t __ACHSortedEarnedInstances_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 earnedDateComponents];
  unint64_t v7 = [v5 earnedDateComponents];
  uint64_t v8 = ACHCompareYearMonthDayDateComponents(v6, v7);

  if (!v8)
  {
    uint64_t v9 = [v4 key];
    uint64_t v10 = [v5 key];
    if (v9 >= v10) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = -1;
    }
    if (v9 > v10) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v11;
    }
  }

  return v8;
}

id ACHCanonicalEarnedInstanceUnitForQuantity(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x263F0A830] countUnit];
  int v3 = [v1 isCompatibleWithUnit:v2];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F0A830] countUnit];
LABEL_9:
    uint64_t v11 = (void *)v4;
    goto LABEL_10;
  }
  id v5 = [MEMORY[0x263F0A830] kilocalorieUnit];
  int v6 = [v1 isCompatibleWithUnit:v5];

  if (v6)
  {
    uint64_t v4 = [MEMORY[0x263F0A830] kilocalorieUnit];
    goto LABEL_9;
  }
  unint64_t v7 = [MEMORY[0x263F0A830] minuteUnit];
  int v8 = [v1 isCompatibleWithUnit:v7];

  if (v8)
  {
    uint64_t v4 = [MEMORY[0x263F0A830] minuteUnit];
    goto LABEL_9;
  }
  uint64_t v9 = [MEMORY[0x263F0A830] meterUnit];
  int v10 = [v1 isCompatibleWithUnit:v9];

  if (v10)
  {
    uint64_t v4 = [MEMORY[0x263F0A830] meterUnit];
    goto LABEL_9;
  }
  uint64_t v11 = 0;
LABEL_10:

  return v11;
}

ACHCodableEarnedInstance *ACHCodableFromEarnedInstance(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(ACHCodableEarnedInstance);
  -[ACHCodableEarnedInstance setKey:](v2, "setKey:", [v1 key]);
  int v3 = [v1 templateUniqueName];
  [(ACHCodableEarnedInstance *)v2 setTemplateUniqueName:v3];

  uint64_t v4 = [v1 createdDate];
  [v4 timeIntervalSinceReferenceDate];
  -[ACHCodableEarnedInstance setCreatedDate:](v2, "setCreatedDate:");

  id v5 = [v1 earnedDateComponents];
  int v6 = ACHYearMonthDayStringFromDateComponents(v5);
  [(ACHCodableEarnedInstance *)v2 setEarnedDateComponents:v6];

  -[ACHCodableEarnedInstance setCreatorDevice:](v2, "setCreatorDevice:", [v1 creatorDevice]);
  unint64_t v7 = [v1 value];

  if (v7)
  {
    int v8 = [v1 value];
    uint64_t v9 = ACHCanonicalEarnedInstanceUnitForQuantity(v8);

    int v10 = [v1 value];
    [v10 doubleValueForUnit:v9];
    -[ACHCodableEarnedInstance setValue:](v2, "setValue:");

    uint64_t v11 = [v9 unitString];
    [(ACHCodableEarnedInstance *)v2 setValueUnitString:v11];
  }
  uint64_t v12 = [v1 externalIdentifier];

  if (v12)
  {
    unint64_t v13 = [v1 externalIdentifier];
    [(ACHCodableEarnedInstance *)v2 setExternalIdentifier:v13];
  }
  char v14 = [v1 syncIdentity];

  if (v14)
  {
    BOOL v15 = objc_alloc_init(ACHCodableSyncIdentity);
    int v16 = [v1 syncIdentity];
    uint64_t v17 = [v16 hardwareIdentifier];
    [(ACHCodableSyncIdentity *)v15 setHardwareIdentifier:v17];

    uint64_t v18 = [v1 syncIdentity];
    uint64_t v19 = [v18 databaseIdentifier];
    [(ACHCodableSyncIdentity *)v15 setDatabaseIdentifier:v19];

    char v20 = [v1 syncIdentity];
    unsigned int v21 = [v20 instanceDiscriminator];
    [(ACHCodableSyncIdentity *)v15 setInstanceDiscriminator:v21];

    [(ACHCodableEarnedInstance *)v2 setSyncIdentity:v15];
  }

  return v2;
}

ACHCodableAchievementArray *ACHCodableFromAchievementArray(void *a1)
{
  id v1 = objc_msgSend(a1, "hk_map:", &__block_literal_global_7);
  id v2 = (void *)[v1 mutableCopy];

  int v3 = objc_alloc_init(ACHCodableAchievementArray);
  [(ACHCodableAchievementArray *)v3 setAchievements:v2];

  return v3;
}

ACHCodableAchievement *__ACHCodableFromAchievementArray_block_invoke(uint64_t a1, void *a2)
{
  return ACHCodableFromAchievement(a2);
}

uint64_t ACHSetMobileAssetServerURL(uint64_t a1)
{
  return MEMORY[0x270F4A8D8](a1, @"com.apple.MobileAsset.ActivityChallengeAssets");
}

uint64_t ACHMobileAssetServerURLWithError(uint64_t a1)
{
  return MEMORY[0x270F4A8D0](@"com.apple.MobileAsset.ActivityChallengeAssets", a1);
}

void RemoteAchievementTemplateFromTemplateAssetAndBuildVersion_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F582000, a2, OS_LOG_TYPE_ERROR, "Remote Template unique name is nil! Identifier key not found at: %{public}@", (uint8_t *)&v2, 0xCu);
}

void ACHApplyBadgePropertiesToAchievement_cold_1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 template];
  uint64_t v4 = [v3 uniqueName];
  int v5 = 138412290;
  int v6 = v4;
  _os_log_error_impl(&dword_21F582000, a2, OS_LOG_TYPE_ERROR, "Could not determine color for monthly achievement %@.", (uint8_t *)&v5, 0xCu);
}

void ACHApplyBadgePropertiesToAchievement_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21F582000, log, OS_LOG_TYPE_ERROR, "Unable to read the badge properties for achievement: %@. BadgePropertiesListPath: %@", (uint8_t *)&v3, 0x16u);
}

void ACHCountryCode_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21F582000, log, OS_LOG_TYPE_ERROR, "Got an invalid country code of %{public}@ from locale %{public}@!", (uint8_t *)&v3, 0x16u);
}

void ACHEncodeAchievementIntoUserInfoDictionary_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F582000, a2, OS_LOG_TYPE_ERROR, "Error encoding achievement for user info dictionary: %{public}@", (uint8_t *)&v2, 0xCu);
}

void ACHDecodeAchievementFromUserInfoDictionary_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_21F582000, log, OS_LOG_TYPE_ERROR, "No encoded achievement found in user info dictionary", v1, 2u);
}

void ACHDecodeAchievementFromUserInfoDictionary_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F582000, a2, OS_LOG_TYPE_ERROR, "Error decoding achievement for user info dictionary: %{public}@", (uint8_t *)&v2, 0xCu);
}

void ACHWorkoutActivityTypeForMonthlyChallengeType_cold_1(unint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = ACHMonthlyChallengeNameFromChallengeType(a1);
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_fault_impl(&dword_21F582000, a2, OS_LOG_TYPE_FAULT, "Could not determine HKWorkoutActivityType for monthly challenge with type: %@", (uint8_t *)&v4, 0xCu);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural()
{
  return MEMORY[0x270F29A88]();
}

uint64_t FIRandomStringForPrefixWithTableName()
{
  return MEMORY[0x270F29B08]();
}

uint64_t HKCompareDoubles()
{
  return MEMORY[0x270EF3638]();
}

uint64_t HKCreateSerialDispatchQueueWithQOSClass()
{
  return MEMORY[0x270EF3668]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x270F58568]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x270F585E0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}