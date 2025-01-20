@interface IPEventClassificationType
+ (double)_averageDistanceBetweenFeatureKeyword:(id)a3 featureDates:(id)a4 subjectLength:(unint64_t)a5 inSubject:(BOOL)a6;
+ (double)_scoreForKeywordsInSubject:(BOOL)a3 distanceToDates:(double)a4 polarity:(unint64_t)a5 matchedRatio:(double)a6 keywordType:(unint64_t)a7;
+ (id)_dateComponentsFromTaxonomyHHMMString:(id)a3;
+ (id)_identifierForCluster:(unint64_t)a3;
+ (id)_identifiersForClusters:(id)a3;
+ (id)_loadTaxonomyForLanguageID:(id)a3 clusterIdentifier:(id)a4 error:(id *)a5;
+ (id)_parentFromIdentifier:(id)a3;
+ (id)allClusterIdentifiers;
+ (id)cleanSubject:(id)a3;
+ (id)eventClassificationTypeFromMessageUnit:(id)a3 detectedStartDate:(id)a4;
+ (id)eventClassificationTypeFromMessageUnit:(id)a3 features:(id)a4;
+ (id)eventClassificationTypeFromMessageUnit:(id)a3 features:(id)a4 datafeatures:(id)a5;
+ (id)eventClassificationTypeFromMessageUnit:(id)a3 keywordFeatures:(id)a4 datafeatures:(id)a5;
+ (id)eventTypeForCultureAndLanguageID:(id)a3;
+ (id)eventTypeForEntertainmentAndLanguageID:(id)a3;
+ (id)eventTypeForGenericEventAndLanguageID:(id)a3;
+ (id)eventTypeForMealsAndLanguageID:(id)a3;
+ (id)eventTypeForMoviesAndLanguageID:(id)a3;
+ (id)eventTypeForSportAndLanguageID:(id)a3;
+ (id)fallbackEventTitleForMessageUnits:(id)a3 subject:(id)a4 checkForDateInSubject:(BOOL)a5;
+ (id)humanReadableClusterType:(unint64_t)a3;
+ (id)morePreciseEventClassificationTypeBetweenType:(id)a3 and:(id)a4;
+ (id)taxonomyForLanguageID:(id)a3 clusterIdentifier:(id)a4;
+ (id)taxonomyForLanguageID:(id)a3 clusterType:(unint64_t)a4;
+ (id)titleGenerationModelPredictionForMessageUnits:(id)a3;
- (BOOL)_isAParentOf:(id)a3;
- (BOOL)allowGenericKeywordsForLanguage:(id)a3;
- (BOOL)isAllDayAllowed;
- (BOOL)isAppointment;
- (BOOL)isCultureRelated;
- (BOOL)isDateWithinRange:(id)a3;
- (BOOL)isFairlyGeneric;
- (BOOL)isHighPriority;
- (BOOL)isLowPriority;
- (BOOL)isMealRelated;
- (BOOL)isMovieRelated;
- (BOOL)isSportRelated;
- (BOOL)prefersTitleSenderDecoration;
- (BOOL)questionMarkInString:(id)a3;
- (BOOL)useForTimeAdjustement;
- (IPEventClassificationType)init;
- (IPEventClassificationType)initWithIdentifier:(id)a3 language:(id)a4 patternKeywords:(id)a5 titleKeywords:(id)a6 subjectKeywords:(id)a7 defaultTitle:(id)a8 titleSenderTemplate:(id)a9 defaultStartingTimeHour:(int)a10 defaultStartingTimeMinutes:(int)a11 defaultDuration:(double)a12 preferedMeridian:(unint64_t)a13 parent:(id)a14 children:(id)a15 useForTimeAdjustement:(BOOL)a16 minutesBeforeDefaultStartingTime:(double)a17 minutesAfterDefaultStartingTime:(double)a18 allDayAllowed:(BOOL)a19 useGenericPatternsInClassification:(BOOL)a20 movieRelated:(BOOL)a21 mealRelated:(BOOL)a22 cultureRelated:(BOOL)a23 sportRelated:(BOOL)a24 fairlyGeneric:(BOOL)a25 appointmentRelated:(BOOL)a26;
- (IPEventClassificationType)parent;
- (NSMutableArray)children;
- (NSMutableArray)genericPatternKeywords;
- (NSMutableArray)patternKeywords;
- (NSMutableArray)subjectKeywords;
- (NSMutableArray)titleKeywords;
- (NSMutableDictionary)upperPriorityEventTypesIdentifiers;
- (NSString)defaultTitle;
- (NSString)identifier;
- (NSString)language;
- (NSString)titleSenderTemplate;
- (double)_hasPriorityOverEventType:(id)a3;
- (double)defaultDuration;
- (double)minutesAfterDefaultStartingTime;
- (double)minutesBeforeDefaultStartingTime;
- (id)_mealClassificationTypeUsingStartDate:(id)a3;
- (id)adjustedEventClassificationTypeWithStartDate:(id)a3;
- (id)adjustedEventTitleForMessageUnits:(id)a3;
- (id)adjustedEventTitleForMessageUnits:(id)a3 subject:(id)a4 dateInSubject:(id)a5 eventStartDate:(id)a6 isGeneratedFromSubject:(BOOL *)a7;
- (id)adjustedEventTitleForMessageUnits:(id)a3 subject:(id)a4 dateInSubject:(id)a5 eventStartDate:(id)a6 useTitleGenerationModel:(BOOL)a7 isGeneratedFromSubject:(BOOL *)a8;
- (id)adjustedEventTitleForMessageUnits:(id)a3 subject:(id)a4 dateInSubject:(id)a5 eventStartDate:(id)a6 useTitleGenerationModel:(BOOL)a7 isGeneratedFromSubject:(BOOL *)a8 isGeneratedFromTitleGenerationModel:(BOOL *)a9;
- (id)adjustedEventTitleForMessageUnits:(id)a3 subject:(id)a4 isDateInSubject:(BOOL)a5;
- (id)dateWithoutTime:(id)a3;
- (id)decoratedTitleFromTitle:(id)a3 participantName:(id)a4 isTitleSenderDecorated:(BOOL *)a5;
- (id)description;
- (id)properCasedTitleForTitle:(id)a3 locale:(id)a4;
- (int)defaultCumulativeMinutes;
- (int)defaultStartingTimeHour;
- (int)defaultStartingTimeMinutes;
- (unint64_t)classificationDepth;
- (unint64_t)preferedMeridian;
- (void)_addChild:(id)a3;
- (void)_addParent:(id)a3;
- (void)_addUpperPriorityEventTypeIdentifier:(id)a3 weight:(id)a4;
- (void)addEventPatterns:(id)a3;
- (void)setAllDayAllowed:(BOOL)a3;
- (void)setChildren:(id)a3;
- (void)setClassificationDepth:(unint64_t)a3;
- (void)setDefaultCumulativeMinutes:(int)a3;
- (void)setDefaultDuration:(double)a3;
- (void)setDefaultStartingTimeHour:(int)a3;
- (void)setDefaultStartingTimeMinutes:(int)a3;
- (void)setDefaultTitle:(id)a3;
- (void)setGenericPatternKeywords:(id)a3;
- (void)setHighPriority:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLowPriority:(BOOL)a3;
- (void)setMinutesAfterDefaultStartingTime:(double)a3;
- (void)setMinutesBeforeDefaultStartingTime:(double)a3;
- (void)setParent:(id)a3;
- (void)setPatternKeywords:(id)a3;
- (void)setPreferedMeridian:(unint64_t)a3;
- (void)setSubjectKeywords:(id)a3;
- (void)setTitleKeywords:(id)a3;
- (void)setTitleSenderTemplate:(id)a3;
- (void)setUpperPriorityEventTypesIdentifiers:(id)a3;
- (void)setUseForTimeAdjustement:(BOOL)a3;
@end

@implementation IPEventClassificationType

- (IPEventClassificationType)init
{
  LOBYTE(v3) = 0;
  return -[IPEventClassificationType initWithIdentifier:language:patternKeywords:titleKeywords:subjectKeywords:defaultTitle:titleSenderTemplate:defaultStartingTimeHour:defaultStartingTimeMinutes:defaultDuration:preferedMeridian:parent:children:useForTimeAdjustement:minutesBeforeDefaultStartingTime:minutesAfterDefaultStartingTime:allDayAllowed:useGenericPatternsInClassification:movieRelated:mealRelated:cultureRelated:sportRelated:fairlyGeneric:appointmentRelated:](self, "initWithIdentifier:language:patternKeywords:titleKeywords:subjectKeywords:defaultTitle:titleSenderTemplate:defaultStartingTimeHour:defaultStartingTimeMinutes:defaultDuration:preferedMeridian:parent:children:useForTimeAdjustement:minutesBeforeDefaultStartingTime:minutesAfterDefaultStartingTime:allDayAllowed:useGenericPatternsInClassification:movieRelated:mealRelated:cultureRelated:sportRelated:fairlyGeneric:appointmentRelated:", 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0,
           0,
           v3);
}

- (IPEventClassificationType)initWithIdentifier:(id)a3 language:(id)a4 patternKeywords:(id)a5 titleKeywords:(id)a6 subjectKeywords:(id)a7 defaultTitle:(id)a8 titleSenderTemplate:(id)a9 defaultStartingTimeHour:(int)a10 defaultStartingTimeMinutes:(int)a11 defaultDuration:(double)a12 preferedMeridian:(unint64_t)a13 parent:(id)a14 children:(id)a15 useForTimeAdjustement:(BOOL)a16 minutesBeforeDefaultStartingTime:(double)a17 minutesAfterDefaultStartingTime:(double)a18 allDayAllowed:(BOOL)a19 useGenericPatternsInClassification:(BOOL)a20 movieRelated:(BOOL)a21 mealRelated:(BOOL)a22 cultureRelated:(BOOL)a23 sportRelated:(BOOL)a24 fairlyGeneric:(BOOL)a25 appointmentRelated:(BOOL)a26
{
  id v35 = a3;
  id v36 = a4;
  id v37 = a5;
  id v38 = a6;
  id v39 = a7;
  id v40 = a8;
  id v41 = a9;
  id v42 = a14;
  id v43 = a15;
  v61.receiver = self;
  v61.super_class = (Class)IPEventClassificationType;
  v44 = [(IPEventClassificationType *)&v61 init];
  v45 = v44;
  if (v44)
  {
    id v60 = v39;
    [(IPEventClassificationType *)v44 setClassificationDepth:0];
    id v59 = v35;
    [(IPEventClassificationType *)v45 setIdentifier:v35];
    id v58 = v36;
    [(IPEventClassificationType *)v45 setLanguage:v36];
    v46 = (void *)[v37 mutableCopy];
    [(IPEventClassificationType *)v45 setPatternKeywords:v46];

    id v57 = v38;
    [(IPEventClassificationType *)v45 setTitleKeywords:v38];
    v47 = v40;
    [(IPEventClassificationType *)v45 setDefaultTitle:v40];
    [(IPEventClassificationType *)v45 setTitleSenderTemplate:v41];
    [(IPEventClassificationType *)v45 setDefaultStartingTimeHour:a10];
    [(IPEventClassificationType *)v45 setDefaultStartingTimeMinutes:a11];
    [(IPEventClassificationType *)v45 setDefaultCumulativeMinutes:(a11 + 60 * a10)];
    [(IPEventClassificationType *)v45 setDefaultDuration:a12];
    [(IPEventClassificationType *)v45 setPreferedMeridian:a13];
    [(IPEventClassificationType *)v45 setParent:v42];
    if (v43) {
      id v48 = (id)[v43 mutableCopy];
    }
    else {
      id v48 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    v49 = v48;
    [(IPEventClassificationType *)v45 setChildren:v48];

    [(IPEventClassificationType *)v45 setUseForTimeAdjustement:a16];
    [(IPEventClassificationType *)v45 setMinutesBeforeDefaultStartingTime:a17];
    [(IPEventClassificationType *)v45 setMinutesAfterDefaultStartingTime:a18];
    [(IPEventClassificationType *)v45 setAllDayAllowed:a19];
    v50 = (void *)[v39 mutableCopy];
    [(IPEventClassificationType *)v45 setSubjectKeywords:v50];

    v51 = objc_opt_new();
    [(IPEventClassificationType *)v45 setUpperPriorityEventTypesIdentifiers:v51];

    v52 = objc_opt_new();
    [(IPEventClassificationType *)v45 setGenericPatternKeywords:v52];

    id v40 = v47;
    if (v47 && a20 && [v47 length])
    {
      v53 = [(IPEventClassificationType *)v45 genericPatternKeywords];
      v54 = [(IPEventClassificationType *)v45 defaultTitle];
      v55 = [v54 lowercaseString];
      [v53 addObject:v55];

      id v39 = v60;
      id v40 = v47;
    }
    v45->_movieRelated = a21;
    v45->_mealRelated = a22;
    v45->_cultureRelated = a23;
    v45->_sportRelated = a24;
    v45->_fairlyGeneric = a25;
    v45->_isAppointment = a26;
    id v36 = v58;
    id v35 = v59;
    id v38 = v57;
  }

  return v45;
}

- (BOOL)allowGenericKeywordsForLanguage:(id)a3
{
  return [&unk_26D8D4AA0 containsObject:a3] ^ 1;
}

- (void)addEventPatterns:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", 2 * objc_msgSend(v3, "count"));
  [v4 addObjectsFromArray:v3];
  v5 = objc_opt_new();
  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = (void *)MEMORY[0x22A632550]();
      v8 = [v3 objectAtIndexedSubscript:v6];
      if ((unint64_t)[v8 length] <= 0x11
        && ([v8 containsString:@"{"] & 1) == 0)
      {
        if ([v8 containsString:@" "])
        {
          v9 = [v8 stringByReplacingOccurrencesOfString:@" " withString:@"()"];
          [v5 addObject:v9];
        }
        else
        {
          v9 = [@"#?" stringByAppendingString:v8];
          [v4 setObject:v9 atIndexedSubscript:v6];
        }
      }
      ++v6;
    }
    while (v6 < [v3 count]);
  }
  if ((unint64_t)[v5 count] >= 6)
  {
    v18 = (void *)MEMORY[0x22A632550]();
    v19 = +[IPRegexToolbox regexPatternWithPrefix:suffix:choices:](IPRegexToolbox, "regexPatternWithPrefix:suffix:choices:", @"#(?:"), CFSTR(")", v5);
    [v4 addObject:v19];
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x22A632550]();
          v17 = [@"#" stringByAppendingString:v15];
          [v4 addObject:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }
  }
  v20 = [(IPEventClassificationType *)self titleKeywords];

  if (!v20)
  {
    v21 = objc_opt_new();
    [(IPEventClassificationType *)self setTitleKeywords:v21];
  }
  v22 = [(IPEventClassificationType *)self titleKeywords];
  [v22 addObjectsFromArray:v4];
}

- (id)description
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v6 = [(IPEventClassificationType *)self parent];

  if (v6)
  {
    v7 = [(IPEventClassificationType *)self parent];
    v8 = [v7 identifier];
    [v3 addObject:v8];
  }
  id v38 = v3;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v9 = [(IPEventClassificationType *)self children];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v43 + 1) + 8 * i) identifier];
        [v4 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v11);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v15 = [(IPEventClassificationType *)self upperPriorityEventTypesIdentifiers];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(v15);
        }
        [v5 addObject:*(void *)(*((void *)&v39 + 1) + 8 * j)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v17);
  }

  id v36 = (id)NSString;
  id v35 = [(IPEventClassificationType *)self identifier];
  v34 = [(IPEventClassificationType *)self language];
  v33 = [(IPEventClassificationType *)self defaultTitle];
  uint64_t v32 = [(IPEventClassificationType *)self defaultStartingTimeHour];
  uint64_t v31 = [(IPEventClassificationType *)self defaultStartingTimeMinutes];
  [(IPEventClassificationType *)self defaultDuration];
  uint64_t v30 = (int)(v20 / 60.0);
  BOOL v29 = [(IPEventClassificationType *)self isHighPriority];
  BOOL v21 = [(IPEventClassificationType *)self isLowPriority];
  BOOL v22 = [(IPEventClassificationType *)self isAllDayAllowed];
  BOOL v23 = [(IPEventClassificationType *)self useForTimeAdjustement];
  long long v24 = [(IPEventClassificationType *)self patternKeywords];
  long long v25 = [(IPEventClassificationType *)self titleKeywords];
  long long v26 = [(IPEventClassificationType *)self subjectKeywords];
  long long v27 = [(IPEventClassificationType *)self genericPatternKeywords];
  objc_msgSend(v36, "stringWithFormat:", @"Identifier : %@\nLanguage : %@\nTitle : %@\nStartHour : %d, StartMin : %d\nDuration : %d min\nParents : %@\nChildren : %@\nUpper Priorities : %@\nHigh Priority : %d\nLow Priority : %d\nAll Day Allowed : %d\nUse for time adjustement : %d\nPattern Keywords : %@\nTitle Keywords : %@\nSubject keywords : %@\nGeneric Keywords : %@", v35, v34, v33, v32, v31, v30, v38, v4, v5, v29, v21, v22, v23, v24, v25, v26,
    v27);
  id v37 = (id)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (void)_addChild:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(IPEventClassificationType *)self children];
    [v5 addObject:v4];
  }
}

- (void)_addParent:(id)a3
{
  if (a3) {
    -[IPEventClassificationType setParent:](self, "setParent:");
  }
}

- (void)_addUpperPriorityEventTypeIdentifier:(id)a3 weight:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(IPEventClassificationType *)self upperPriorityEventTypesIdentifiers];
    [v8 setObject:v6 forKeyedSubscript:v7];
  }
}

- (id)adjustedEventClassificationTypeWithStartDate:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(IPEventClassificationType *)self identifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:@"GATHERING::MEAL"],
        v5,
        v6))
  {
    id v7 = [(IPEventClassificationType *)self _mealClassificationTypeUsingStartDate:v4];
  }
  else
  {
    id v7 = self;
  }
  id v8 = v7;

  return v8;
}

- (id)adjustedEventTitleForMessageUnits:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  int v6 = [v5 originalMessage];

  id v7 = [v6 subject];
  id v8 = [(IPEventClassificationType *)self adjustedEventTitleForMessageUnits:v4 subject:v7 dateInSubject:0 eventStartDate:0 isGeneratedFromSubject:0];

  return v8;
}

- (BOOL)prefersTitleSenderDecoration
{
  if ([(IPEventClassificationType *)self isMealRelated]) {
    return 1;
  }
  id v4 = [(IPEventClassificationType *)self identifier];
  if ([v4 hasPrefix:@"GATHERING::PARTY"])
  {
    char v3 = 1;
  }
  else
  {
    id v5 = [(IPEventClassificationType *)self identifier];
    if ([v5 hasPrefix:@"GATHERING::DRINKS"])
    {
      char v3 = 1;
    }
    else
    {
      int v6 = [(IPEventClassificationType *)self identifier];
      char v3 = [v6 hasPrefix:@"GATHERING::BBQ"];
    }
  }

  return v3;
}

- (id)decoratedTitleFromTitle:(id)a3 participantName:(id)a4 isTitleSenderDecorated:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![v9 length] || !objc_msgSend(v8, "length"))
  {
    id v16 = v8;
    goto LABEL_22;
  }
  uint64_t v10 = self;
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = v10;
    do
    {
      uint64_t v13 = v12;
      v14 = [v12 titleSenderTemplate];
      uint64_t v12 = [v12 parent];

      BOOL v15 = v14 == 0;
    }
    while (!v14 && v12);
  }
  else
  {
    v14 = 0;
    uint64_t v12 = 0;
    BOOL v15 = 1;
  }
  if (v15 && !v12)
  {
    uint64_t v17 = [(IPEventClassificationType *)v11 language];
    uint64_t v12 = +[IPEventClassificationType eventTypeForGenericEventAndLanguageID:v17];

    v14 = [v12 titleSenderTemplate];
  }
  uint64_t v18 = [(IPEventClassificationType *)v11 titleSenderTemplate];

  if (!v18 && v14)
  {
    [(IPEventClassificationType *)v11 setTitleSenderTemplate:v14];
LABEL_17:
    if (a5) {
      *a5 = 1;
    }
    _PASValidatedFormat(v14, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v8);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (v14) {
    goto LABEL_17;
  }
  id v26 = v8;
LABEL_21:
  id v16 = v26;

LABEL_22:
  return v16;
}

- (id)properCasedTitleForTitle:(id)a3 locale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [v5 hasPrefix:@"#"];
  id v8 = v5;
  id v9 = v8;
  uint64_t v10 = v8;
  if ((v7 & 1) == 0)
  {
    uint64_t v11 = [v8 lowercaseStringWithLocale:v6];
    int v12 = [v11 isEqualToString:v9];

    uint64_t v10 = v9;
    if (v12)
    {
      uint64_t v10 = [v9 capitalizedStringWithLocale:v6];
    }
  }

  return v10;
}

- (id)adjustedEventTitleForMessageUnits:(id)a3 subject:(id)a4 dateInSubject:(id)a5 eventStartDate:(id)a6 isGeneratedFromSubject:(BOOL *)a7
{
  return [(IPEventClassificationType *)self adjustedEventTitleForMessageUnits:a3 subject:a4 dateInSubject:a5 eventStartDate:a6 useTitleGenerationModel:0 isGeneratedFromSubject:a7 isGeneratedFromTitleGenerationModel:0];
}

- (id)adjustedEventTitleForMessageUnits:(id)a3 subject:(id)a4 dateInSubject:(id)a5 eventStartDate:(id)a6 useTitleGenerationModel:(BOOL)a7 isGeneratedFromSubject:(BOOL *)a8
{
  return [(IPEventClassificationType *)self adjustedEventTitleForMessageUnits:a3 subject:a4 dateInSubject:a5 eventStartDate:a6 useTitleGenerationModel:a7 isGeneratedFromSubject:a8 isGeneratedFromTitleGenerationModel:0];
}

- (id)adjustedEventTitleForMessageUnits:(id)a3 subject:(id)a4 dateInSubject:(id)a5 eventStartDate:(id)a6 useTitleGenerationModel:(BOOL)a7 isGeneratedFromSubject:(BOOL *)a8 isGeneratedFromTitleGenerationModel:(BOOL *)a9
{
  BOOL v9 = a7;
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (!v9
    || (+[IPEventClassificationType titleGenerationModelPredictionForMessageUnits:v14], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v102 = [(IPEventClassificationType *)self defaultTitle];
    uint64_t v20 = [v14 firstObject];
    uint64_t v21 = [v20 originalMessage];

    uint64_t v22 = (void *)MEMORY[0x263EFF960];
    uint64_t v23 = [(IPEventClassificationType *)self language];
    uint64_t v24 = [v22 localeWithLocaleIdentifier:v23];

    v101 = v21;
    uint64_t v25 = [v21 type];
    id v26 = IPMessageTypeShortMessage;

    long long v27 = [(IPEventClassificationType *)self defaultTitle];
    v28 = v27;
    if (v27)
    {
      if (!v15 || v16 || v25 == v26)
      {

LABEL_20:
        char v41 = 0;
        BOOL v42 = 0;
        goto LABEL_25;
      }
      BOOL v29 = [(IPEventClassificationType *)self questionMarkInString:v15];

      if (v29) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v30 = v24;
      id v31 = v17;
      uint64_t v32 = [(IPEventClassificationType *)self subjectKeywords];
      uint64_t v33 = [v32 count];
      if (!v15 || !v33 || v16 || v25 == v26)
      {

        char v41 = 0;
        BOOL v42 = 0;
        id v17 = v31;
        uint64_t v24 = v30;
        goto LABEL_25;
      }
      BOOL v34 = [(IPEventClassificationType *)self questionMarkInString:v15];

      id v17 = v31;
      uint64_t v24 = v30;
      if (v34) {
        goto LABEL_20;
      }
    }
    id v35 = [(id)objc_opt_class() cleanSubject:v15];

    if ((unint64_t)([v35 length] - 5) > 0x2D)
    {
      char v41 = 0;
      BOOL v42 = 0;
      id v15 = v35;
    }
    else
    {
      v98 = v24;
      id v36 = v17;
      id v37 = [v35 lowercaseString];
      id v38 = [(IPEventClassificationType *)self defaultTitle];
      long long v39 = [v38 lowercaseString];
      char v40 = [v37 isEqualToString:v39];

      if (v40)
      {
        char v41 = 0;
        BOOL v42 = 0;
      }
      else
      {
        long long v43 = NSString;
        long long v44 = [(IPEventClassificationType *)self identifier];
        long long v45 = [(IPEventClassificationType *)self language];
        long long v46 = [v43 stringWithFormat:@"%@-%@-%@", v44, v45, @"subject"];

        v107[0] = MEMORY[0x263EF8330];
        v107[1] = 3221225472;
        v107[2] = __183__IPEventClassificationType_adjustedEventTitleForMessageUnits_subject_dateInSubject_eventStartDate_useTitleGenerationModel_isGeneratedFromSubject_isGeneratedFromTitleGenerationModel___block_invoke;
        v107[3] = &unk_2647232F0;
        v107[4] = self;
        v47 = +[IPRegexToolbox regularExpressionWithKey:v46 generator:v107];
        id v48 = +[IPRegexToolbox firstMatchingKeywordForRegex:v47 inString:v35 needsToLowercase:1];
        BOOL v42 = v48 != 0;

        char v41 = 1;
      }
      id v17 = v36;
      id v15 = v35;
      uint64_t v24 = v98;
    }
LABEL_25:
    id v103 = v15;
    if (v42 || !v15)
    {
      if (v42)
      {
        id v59 = 0;
LABEL_48:
        uint64_t v19 = [(IPEventClassificationType *)self properCasedTitleForTitle:v103 locale:v24];

        if (IPDebuggingModeEnabled_once_2 != -1) {
          dispatch_once(&IPDebuggingModeEnabled_once_2, &__block_literal_global_549);
        }
        if (IPDebuggingModeEnabled_sEnabled_2)
        {
          v65 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v65 = _IPLogHandle;
          }
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            v66 = v65;
            v67 = [(IPEventClassificationType *)self defaultTitle];
            *(_DWORD *)buf = 138412546;
            v109 = v67;
            __int16 v110 = 2112;
            id v111 = v103;
            _os_log_impl(&dword_225684000, v66, OS_LOG_TYPE_INFO, "Enriched using subject from %@ to %@ #EventClassification", buf, 0x16u);
          }
        }
        if (a8) {
          *a8 = 1;
        }
        goto LABEL_70;
      }
    }
    else
    {
      char v94 = v41;
      id v97 = v16;
      id v96 = v17;
      uint64_t v49 = NSString;
      v50 = [(IPEventClassificationType *)self identifier];
      v51 = [(IPEventClassificationType *)self language];
      uint64_t v52 = [v49 stringWithFormat:@"%@-%@-%@", v50, v51, @"events"];

      v106[0] = MEMORY[0x263EF8330];
      v106[1] = 3221225472;
      v106[2] = __183__IPEventClassificationType_adjustedEventTitleForMessageUnits_subject_dateInSubject_eventStartDate_useTitleGenerationModel_isGeneratedFromSubject_isGeneratedFromTitleGenerationModel___block_invoke_2;
      v106[3] = &unk_2647232F0;
      v106[4] = self;
      v95 = (void *)v52;
      v53 = +[IPRegexToolbox regularExpressionWithKey:v52 generator:v106];
      v54 = +[IPRegexToolbox firstMatchingKeywordForRegex:v53 inString:v15 needsToLowercase:1];
      unint64_t v55 = [v14 count];
      if ([v54 length]) {
        BOOL v56 = 1;
      }
      else {
        BOOL v56 = v55 == 0;
      }
      char v57 = v56;
      char v93 = v57;
      if (v56)
      {
        id v58 = v54;
      }
      else
      {
        unint64_t v60 = 1;
        do
        {
          objc_super v61 = [v14 objectAtIndexedSubscript:v60 - 1];
          v62 = [v61 text];
          id v58 = +[IPRegexToolbox firstMatchingKeywordForRegex:v53 inString:v62 needsToLowercase:1];

          if ([v58 length]) {
            BOOL v63 = 1;
          }
          else {
            BOOL v63 = v60 >= v55;
          }
          ++v60;
          v54 = v58;
        }
        while (!v63);
      }
      if ([v58 length])
      {
        id v59 = v58;
        char v64 = v94 & v93;
      }
      else
      {
        char v64 = 0;
        id v59 = 0;
      }
      id v16 = v97;

      if (v64)
      {
        id v17 = v96;
        goto LABEL_48;
      }
      id v17 = v96;
      if (v59)
      {
        if (IPDebuggingModeEnabled_once_2 != -1) {
          dispatch_once(&IPDebuggingModeEnabled_once_2, &__block_literal_global_549);
        }
        if (IPDebuggingModeEnabled_sEnabled_2)
        {
          v68 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v68 = _IPLogHandle;
          }
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            v69 = v68;
            v70 = [(IPEventClassificationType *)self defaultTitle];
            *(_DWORD *)buf = 138412546;
            v109 = v70;
            __int16 v110 = 2112;
            id v111 = v59;
            _os_log_impl(&dword_225684000, v69, OS_LOG_TYPE_INFO, "Enrichment from %@ to %@ #EventClassification", buf, 0x16u);
          }
        }
        v71 = [v24 localeIdentifier];
        int v72 = [v71 isEqualToString:@"fr"];

        if (v72)
        {
          v73 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"^[dl]('|’)" options:1 error:0];
          uint64_t v74 = objc_msgSend(v73, "stringByReplacingMatchesInString:options:range:withTemplate:", v59, 0, 0, objc_msgSend(v59, "length"), &stru_26D895C60);

          id v59 = (id)v74;
        }
        uint64_t v19 = [(IPEventClassificationType *)self properCasedTitleForTitle:v59 locale:v24];

        goto LABEL_70;
      }
    }
    uint64_t v19 = v102;
    if ([v102 length])
    {
      id v59 = 0;
    }
    else
    {
      if (!v16
        || ([(IPEventClassificationType *)self dateWithoutTime:v17],
            v77 = objc_claimAutoreleasedReturnValue(),
            [(IPEventClassificationType *)self dateWithoutTime:v16],
            v78 = objc_claimAutoreleasedReturnValue(),
            int v79 = [v77 isEqualToDate:v78],
            v78,
            v77,
            v79))
      {
        v99 = v24;
        id v80 = v17;
        v81 = objc_opt_class();
        v82 = [(IPEventClassificationType *)self language];
        v83 = [v81 taxonomyForLanguageID:v82 clusterType:5];

        v84 = NSString;
        v85 = [v83 identifier];
        v86 = [(IPEventClassificationType *)self language];
        v87 = [v84 stringWithFormat:@"%@-%@-%@", v85, v86, @"generic-events"];

        v88 = [v83 subjectKeywords];
        uint64_t v89 = [v88 count];

        if (v89)
        {
          v104[0] = MEMORY[0x263EF8330];
          v104[1] = 3221225472;
          v104[2] = __183__IPEventClassificationType_adjustedEventTitleForMessageUnits_subject_dateInSubject_eventStartDate_useTitleGenerationModel_isGeneratedFromSubject_isGeneratedFromTitleGenerationModel___block_invoke_167;
          v104[3] = &unk_264722F50;
          v104[4] = self;
          id v105 = v83;
          v90 = +[IPRegexToolbox regularExpressionWithKey:v87 generator:v104];
          v91 = +[IPRegexToolbox firstMatchingKeywordForRegex:v90 inString:v103 needsToLowercase:1];
          if ([v91 length])
          {
            uint64_t v92 = [(id)objc_opt_class() cleanSubject:v103];

            v102 = (void *)v92;
          }
          v75 = v101;
        }
        else
        {
          v75 = v101;
        }

        id v59 = 0;
        uint64_t v19 = v102;
        id v17 = v80;
        uint64_t v24 = v99;
        goto LABEL_71;
      }
      id v59 = 0;
      uint64_t v19 = v102;
    }
LABEL_70:
    v75 = v101;
LABEL_71:

    id v15 = v103;
    goto LABEL_72;
  }
  uint64_t v19 = (void *)v18;
  if (a9) {
    *a9 = 1;
  }
LABEL_72:

  return v19;
}

id __183__IPEventClassificationType_adjustedEventTitleForMessageUnits_subject_dateInSubject_eventStartDate_useTitleGenerationModel_isGeneratedFromSubject_isGeneratedFromTitleGenerationModel___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) language];
  char v3 = [*(id *)(a1 + 32) subjectKeywords];
  id v4 = +[IPRegexToolbox regexPatternForLanguageID:v2 eventVocabularyArray:v3];

  id v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v4 options:64 error:0];

  return v5;
}

id __183__IPEventClassificationType_adjustedEventTitleForMessageUnits_subject_dateInSubject_eventStartDate_useTitleGenerationModel_isGeneratedFromSubject_isGeneratedFromTitleGenerationModel___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) language];
  char v3 = [*(id *)(a1 + 32) titleKeywords];
  id v4 = +[IPRegexToolbox regexPatternForLanguageID:v2 eventVocabularyArray:v3];

  id v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v4 options:65 error:0];

  return v5;
}

id __183__IPEventClassificationType_adjustedEventTitleForMessageUnits_subject_dateInSubject_eventStartDate_useTitleGenerationModel_isGeneratedFromSubject_isGeneratedFromTitleGenerationModel___block_invoke_167(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) language];
  char v3 = [*(id *)(a1 + 40) subjectKeywords];
  id v4 = +[IPRegexToolbox regexPatternForLanguageID:v2 eventVocabularyArray:v3];

  id v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v4 options:65 error:0];

  return v5;
}

+ (id)titleGenerationModelPredictionForMessageUnits:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (_os_feature_enabled_impl())
  {
    id v4 = [v3 firstObject];
    id v5 = [v4 bestLanguageID];

    if ([&unk_26D8D4AB8 containsObject:v5])
    {
      id v6 = [v3 firstObject];
      char v7 = [v6 originalMessage];

      id v8 = [MEMORY[0x263F38260] messageWithIPMessage:v7];
      BOOL v9 = [MEMORY[0x263F38270] serviceForIpsos];
      uint64_t v10 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        uint64_t v10 = _IPLogHandle;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_225684000, v10, OS_LOG_TYPE_DEFAULT, "Getting suggested title from title generation model #EventClassification", (uint8_t *)&v15, 2u);
      }
      uint64_t v11 = [v9 titleSuggestionForMessage:v8 error:0];
      int v12 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        int v12 = _IPLogHandle;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 138478083;
        id v16 = v11;
        __int16 v17 = 2113;
        uint64_t v18 = v5;
        _os_log_impl(&dword_225684000, v12, OS_LOG_TYPE_DEBUG, "Suggested title=%{private}@ for dominant language=%{private}@ #EventClassification", (uint8_t *)&v15, 0x16u);
      }
    }
    else
    {
      uint64_t v13 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        uint64_t v13 = _IPLogHandle;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v5;
        _os_log_impl(&dword_225684000, v13, OS_LOG_TYPE_DEFAULT, "Title generation not supported for language %@ #EventClassification", (uint8_t *)&v15, 0xCu);
      }
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)dateWithoutTime:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFF910] date];
  }
  id v4 = getCalendar();
  id v5 = [v4 components:28 fromDate:v3];

  id v6 = getCalendar();
  char v7 = [v6 dateFromComponents:v5];

  return v7;
}

- (BOOL)questionMarkInString:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x22A632550]();
  id v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"¿?？"];
  BOOL v6 = [v3 rangeOfCharacterFromSet:v5] != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

+ (id)fallbackEventTitleForMessageUnits:(id)a3 subject:(id)a4 checkForDateInSubject:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 firstObject];
  uint64_t v11 = [v10 bestLanguageID];
  if (v11)
  {
    if (([&unk_26D8D4AD0 containsObject:v11] & 1) == 0)
    {
      if (!v5) {
        goto LABEL_5;
      }
      uint64_t v20 = 0;
      uint64_t v21 = &v20;
      uint64_t v22 = 0x2020000000;
      char v23 = 0;
      id v19 = 0;
      int v12 = [MEMORY[0x263F08770] dataDetectorWithTypes:8 error:&v19];
      id v13 = v19;
      uint64_t v14 = [v9 length];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __93__IPEventClassificationType_fallbackEventTitleForMessageUnits_subject_checkForDateInSubject___block_invoke;
      v18[3] = &unk_264723318;
      v18[4] = &v20;
      objc_msgSend(v12, "enumerateMatchesInString:options:range:usingBlock:", v9, 0, 0, v14, v18);
      int v15 = *((unsigned __int8 *)v21 + 24);

      _Block_object_dispose(&v20, 8);
      if (!v15)
      {
LABEL_5:
        id v16 = [a1 cleanSubject:v9];
        if ((unint64_t)([v16 length] - 51) > 0xFFFFFFFFFFFFFFD1) {
          goto LABEL_8;
        }
      }
    }
  }
  id v16 = 0;
LABEL_8:

  return v16;
}

uint64_t __93__IPEventClassificationType_fallbackEventTitleForMessageUnits_subject_checkForDateInSubject___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

+ (id)eventClassificationTypeFromMessageUnit:(id)a3 keywordFeatures:(id)a4 datafeatures:(id)a5
{
  uint64_t v232 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v9;
  id v163 = v10;
  if (![v9 count])
  {
    id v103 = 0;
    goto LABEL_123;
  }
  int v12 = objc_opt_new();
  v179 = objc_opt_new();
  v178 = objc_opt_new();
  v180 = objc_opt_new();
  id v13 = [v8 text];
  uint64_t v14 = v11;
  uint64_t v15 = [v13 length];
  id v16 = [v8 originalMessage];
  __int16 v17 = [v16 subject];
  uint64_t v18 = [v17 length];

  id v19 = [v8 originalMessage];
  uint64_t v20 = [v19 subject];
  uint64_t v164 = [v20 length];

  uint64_t v21 = [v8 originalMessage];
  uint64_t v22 = [v21 type];
  int v167 = [v22 isEqualToString:IPMessageTypeShortMessage];

  v159 = v8;
  char v23 = [v8 originalMessage];
  int v24 = [v23 isReply];

  long long v207 = 0u;
  long long v208 = 0u;
  long long v205 = 0u;
  long long v206 = 0u;
  v158 = v14;
  id v25 = v14;
  uint64_t v172 = [v25 countByEnumeratingWithState:&v205 objects:v231 count:16];
  if (v172)
  {
    uint64_t v170 = *(void *)v206;
    double v26 = (double)(unint64_t)(v18 + v15);
    id v162 = a1;
    int v161 = v24;
    id v160 = v25;
    do
    {
      for (uint64_t i = 0; i != (char *)v172; uint64_t i = v33 + 1)
      {
        if (*(void *)v206 != v170) {
          objc_enumerationMutation(v25);
        }
        obuint64_t j = i;
        v28 = *(void **)(*((void *)&v205 + 1) + 8 * i);
        BOOL v29 = [v28 contextDictionary];
        uint64_t v30 = [v29 objectForKeyedSubscript:@"IPFeatureKeywordContextExtractedFromSubject"];
        uint64_t v31 = [v30 isEqual:MEMORY[0x263EFFA88]];

        if ((v31 & v24) == 1)
        {
          uint64_t v32 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            uint64_t v32 = _IPLogHandle;
          }
          uint64_t v33 = obj;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            BOOL v34 = v32;
            id v35 = [v28 keywordString];
            *(_DWORD *)buf = 138412290;
            v216 = v35;
            id v36 = v34;
            id v37 = "      --> ignore matched string: [%@] in subject since message is a reply #EventClassification";
LABEL_22:
            _os_log_impl(&dword_225684000, v36, OS_LOG_TYPE_DEBUG, v37, buf, 0xCu);

            continue;
          }
        }
        else
        {
          if ([v28 type] == 1) {
            int v38 = v31;
          }
          else {
            int v38 = 1;
          }
          if ((v38 | v167))
          {
            [a1 _averageDistanceBetweenFeatureKeyword:v28 featureDates:v163 subjectLength:v164 inSubject:v31];
            double v40 = (v26 - v39) / v26;
            char v41 = [NSNumber numberWithDouble:v40];
            BOOL v42 = [v28 contextDictionary];
            [v42 setObject:v41 forKeyedSubscript:@"IPFeatureKeywordContextDistanceToDate"];

            if (v31)
            {
              uint64_t v43 = 1;
            }
            else
            {
              long long v45 = [v159 rejectionRanges];
              uint64_t v46 = [v28 matchRange];
              char v48 = objc_msgSend(v45, "intersectsIndexesInRange:", v46, v47);

              if (v48)
              {
                uint64_t v43 = 4;
              }
              else
              {
                uint64_t v49 = [v159 proposalAndAcceptationRanges];
                uint64_t v50 = [v28 matchRange];
                int v52 = objc_msgSend(v49, "intersectsIndexesInRange:", v50, v51);

                if (v52) {
                  uint64_t v43 = 2;
                }
                else {
                  uint64_t v43 = 1;
                }
              }
            }
            v53 = [v28 keywordString];
            unint64_t v54 = [v53 length];

            double v55 = (double)v54 / v26;
            BOOL v56 = [NSNumber numberWithDouble:v55];
            char v57 = [v28 contextDictionary];
            [v57 setObject:v56 forKeyedSubscript:@"IPFeatureKeywordContextMatchedRatio"];

            objc_msgSend(a1, "_scoreForKeywordsInSubject:distanceToDates:polarity:matchedRatio:keywordType:", v31, v43, objc_msgSend(v28, "type"), v40, v55);
            double v59 = v58;
            unint64_t v60 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              unint64_t v60 = _IPLogHandle;
            }
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            {
              objc_super v61 = v60;
              v62 = [v28 keywordString];
              BOOL v63 = [v28 eventTypes];
              char v64 = [v63 lastObject];
              v65 = [v64 identifier];
              v66 = +[IPFeatureSentence humanReadableFeaturePolarity:v43];
              uint64_t v67 = [v28 type];
              *(_DWORD *)buf = 138414082;
              v216 = v62;
              __int16 v217 = 2112;
              v218 = v65;
              __int16 v219 = 2048;
              double v220 = v59;
              __int16 v221 = 1024;
              int v222 = v31;
              __int16 v223 = 2048;
              double v224 = v40;
              __int16 v225 = 2112;
              v226 = v66;
              __int16 v227 = 2048;
              double v228 = v55 * 100.0;
              __int16 v229 = 2048;
              uint64_t v230 = v67;
              _os_log_impl(&dword_225684000, v61, OS_LOG_TYPE_DEBUG, "      --> matched string: [%@] type:%@ score:%f subject:%d distance:%.2f polarity:%@ matchedRatio:%.2f%% type:%lu #EventClassification", buf, 0x4Eu);
            }
            long long v203 = 0u;
            long long v204 = 0u;
            long long v201 = 0u;
            long long v202 = 0u;
            v68 = [v28 eventTypes];
            uint64_t v69 = [v68 countByEnumeratingWithState:&v201 objects:v214 count:16];
            if (v69)
            {
              uint64_t v70 = v69;
              uint64_t v71 = *(void *)v202;
              do
              {
                for (uint64_t j = 0; j != v70; ++j)
                {
                  if (*(void *)v202 != v71) {
                    objc_enumerationMutation(v68);
                  }
                  v73 = *(void **)(*((void *)&v201 + 1) + 8 * j);
                  uint64_t v74 = [v73 identifier];
                  v75 = [v12 objectForKeyedSubscript:v74];
                  double v76 = v59;
                  if (v75)
                  {
                    v77 = [v73 identifier];
                    v78 = [v12 objectForKeyedSubscript:v77];
                    [v78 doubleValue];
                    double v76 = v59 + v79;
                  }
                  if (v76 > 0.0)
                  {
                    id v80 = [NSNumber numberWithDouble:v76];
                    v81 = [v73 identifier];
                    [v12 setObject:v80 forKeyedSubscript:v81];

                    v82 = [v73 identifier];
                    [v180 setObject:v73 forKeyedSubscript:v82];

                    if ([v73 classificationDepth] == 1)
                    {
                      v83 = [NSNumber numberWithDouble:v76];
                      v84 = [v73 identifier];
                      [v179 setObject:v83 forKeyedSubscript:v84];

                      v85 = [v73 identifier];
                      [v178 setObject:v73 forKeyedSubscript:v85];
                    }
                  }
                }
                uint64_t v70 = [v68 countByEnumeratingWithState:&v201 objects:v214 count:16];
              }
              while (v70);
            }

            a1 = v162;
            int v24 = v161;
            id v25 = v160;
            uint64_t v33 = obj;
          }
          else
          {
            long long v44 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              long long v44 = _IPLogHandle;
            }
            uint64_t v33 = obj;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              BOOL v34 = v44;
              id v35 = [v28 keywordString];
              *(_DWORD *)buf = 138412290;
              v216 = v35;
              id v36 = v34;
              id v37 = "      --> ignore generic matched string: [%@] #EventClassification";
              goto LABEL_22;
            }
          }
        }
      }
      uint64_t v172 = [v25 countByEnumeratingWithState:&v205 objects:v231 count:16];
    }
    while (v172);
  }

  v165 = objc_opt_new();
  long long v197 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  id obja = v12;
  uint64_t v86 = [obja countByEnumeratingWithState:&v197 objects:v213 count:16];
  if (!v86) {
    goto LABEL_70;
  }
  uint64_t v87 = v86;
  uint64_t v173 = *(void *)v198;
  do
  {
    for (uint64_t k = 0; k != v87; ++k)
    {
      if (*(void *)v198 != v173) {
        objc_enumerationMutation(obja);
      }
      uint64_t v89 = *(void **)(*((void *)&v197 + 1) + 8 * k);
      if ((unint64_t)[obja count] < 2
        || ([v89 isEqualToString:@"EVENT"] & 1) == 0)
      {
        v90 = [v180 objectForKeyedSubscript:v89];
        long long v193 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        long long v196 = 0u;
        v91 = [v90 children];
        uint64_t v92 = [v91 countByEnumeratingWithState:&v193 objects:v212 count:16];
        if (v92)
        {
          uint64_t v93 = v92;
          uint64_t v94 = *(void *)v194;
LABEL_56:
          uint64_t v95 = 0;
          while (1)
          {
            if (*(void *)v194 != v94) {
              objc_enumerationMutation(v91);
            }
            id v96 = [*(id *)(*((void *)&v193 + 1) + 8 * v95) identifier];
            id v97 = [obja objectForKey:v96];

            if (v97) {
              break;
            }
            if (v93 == ++v95)
            {
              uint64_t v93 = [v91 countByEnumeratingWithState:&v193 objects:v212 count:16];
              if (v93) {
                goto LABEL_56;
              }
              goto LABEL_62;
            }
          }
LABEL_66:
        }
        else
        {
LABEL_62:

          v98 = [obja objectForKeyedSubscript:v89];
          [v165 setObject:v98 forKeyedSubscript:v89];

          v99 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v99 = _IPLogHandle;
          }
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
          {
            v91 = v99;
            v100 = [v165 objectForKeyedSubscript:v89];
            *(_DWORD *)buf = 138412546;
            v216 = v89;
            __int16 v217 = 2112;
            v218 = v100;
            _os_log_impl(&dword_225684000, v91, OS_LOG_TYPE_DEBUG, "%@ score : %@ #EventClassification", buf, 0x16u);

            goto LABEL_66;
          }
        }

        continue;
      }
    }
    uint64_t v87 = [obja countByEnumeratingWithState:&v197 objects:v213 count:16];
  }
  while (v87);
LABEL_70:

  if ([v165 count] != 1)
  {
    id v105 = objc_opt_new();
    long long v189 = 0u;
    long long v190 = 0u;
    long long v191 = 0u;
    long long v192 = 0u;
    id v107 = v165;
    uint64_t v169 = [v107 countByEnumeratingWithState:&v189 objects:v211 count:16];
    id v171 = v107;
    if (v169)
    {
      v168 = 0;
      uint64_t v166 = *(void *)v190;
      double v108 = 0.0;
      do
      {
        uint64_t v109 = 0;
        do
        {
          if (*(void *)v190 != v166) {
            objc_enumerationMutation(v107);
          }
          uint64_t v110 = *(void *)(*((void *)&v189 + 1) + 8 * v109);
          id v111 = [v180 objectForKeyedSubscript:v110];
          uint64_t v112 = [v107 objectForKeyedSubscript:v110];
          [v112 doubleValue];
          double v114 = v113;

          uint64_t v174 = v109;
          if (v114 > v108)
          {
            v115 = [v107 objectForKeyedSubscript:v110];
            [v115 doubleValue];
            double v108 = v116;

            id v117 = v111;
            v168 = v117;
          }
          long long v187 = 0u;
          long long v188 = 0u;
          long long v185 = 0u;
          long long v186 = 0u;
          id v118 = v107;
          uint64_t v119 = [v118 countByEnumeratingWithState:&v185 objects:v210 count:16];
          if (v119)
          {
            uint64_t v120 = v119;
            uint64_t v121 = *(void *)v186;
            do
            {
              for (uint64_t m = 0; m != v120; ++m)
              {
                if (*(void *)v186 != v121) {
                  objc_enumerationMutation(v118);
                }
                uint64_t v123 = *(void *)(*((void *)&v185 + 1) + 8 * m);
                v124 = [v180 objectForKeyedSubscript:v123];
                [v111 _hasPriorityOverEventType:v124];
                if (v125 > 0.0)
                {
                  double v126 = v125;
                  v127 = [v105 objectForKeyedSubscript:v123];

                  if (!v127)
                  {
                    v128 = objc_opt_new();
                    [v105 setObject:v128 forKeyedSubscript:v123];
                  }
                  v129 = [NSNumber numberWithDouble:v126];
                  v130 = [v105 objectForKeyedSubscript:v123];
                  [v130 setObject:v129 forKeyedSubscript:v110];
                }
              }
              uint64_t v120 = [v118 countByEnumeratingWithState:&v185 objects:v210 count:16];
            }
            while (v120);
          }

          uint64_t v109 = v174 + 1;
          id v107 = v171;
        }
        while (v174 + 1 != v169);
        uint64_t v169 = [v118 countByEnumeratingWithState:&v189 objects:v211 count:16];
      }
      while (v169);
    }
    else
    {
      v168 = 0;
      double v108 = 0.0;
    }

    uint64_t v131 = 5;
    v132 = v168;
    while (2)
    {
      v133 = [v132 identifier];
      uint64_t v134 = [v105 objectForKeyedSubscript:v133];
      if (v134)
      {
        v135 = (void *)v134;
        v136 = [v132 identifier];
        v137 = [v105 objectForKeyedSubscript:v136];
        uint64_t v138 = [v137 count];

        if (!v138)
        {
LABEL_113:
          id v153 = v132;
          if (!v153)
          {
            id v103 = 0;
            goto LABEL_121;
          }
          v106 = v153;
          v154 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v154 = _IPLogHandle;
          }
          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
          {
            v155 = v154;
            v156 = [v106 identifier];
            *(_DWORD *)buf = 138412290;
            v216 = v156;
            _os_log_impl(&dword_225684000, v155, OS_LOG_TYPE_DEBUG, "Final event type : %@ #EventClassification", buf, 0xCu);
          }
          id v103 = v106;
LABEL_119:

LABEL_121:
          goto LABEL_122;
        }
        long long v183 = 0u;
        long long v184 = 0u;
        long long v181 = 0u;
        long long v182 = 0u;
        v139 = [v132 identifier];
        v133 = [v105 objectForKeyedSubscript:v139];

        uint64_t v140 = [v133 countByEnumeratingWithState:&v181 objects:v209 count:16];
        if (v140)
        {
          uint64_t v141 = v140;
          uint64_t v175 = v131;
          uint64_t v142 = *(void *)v182;
LABEL_103:
          uint64_t v143 = 0;
          while (1)
          {
            if (*(void *)v182 != v142) {
              objc_enumerationMutation(v133);
            }
            uint64_t v144 = *(void *)(*((void *)&v181 + 1) + 8 * v143);
            v145 = [v107 objectForKeyedSubscript:v144];
            [v145 doubleValue];
            double v147 = v146;

            v148 = [v132 identifier];
            v149 = [v105 objectForKeyedSubscript:v148];
            v150 = [v149 objectForKeyedSubscript:v144];
            [v150 doubleValue];
            double v152 = v151;

            if (v147 > v108 * (0.6 / v152)) {
              break;
            }
            ++v143;
            id v107 = v171;
            if (v141 == v143)
            {
              uint64_t v141 = [v133 countByEnumeratingWithState:&v181 objects:v209 count:16];
              if (v141) {
                goto LABEL_103;
              }
              goto LABEL_112;
            }
          }
          v106 = [v180 objectForKeyedSubscript:v144];

          uint64_t v131 = v175 - 1;
          double v108 = v147;
          v132 = v106;
          id v107 = v171;
          if (v175 != 1) {
            continue;
          }
          id v103 = 0;
          goto LABEL_119;
        }
      }
      break;
    }
LABEL_112:

    goto LABEL_113;
  }
  v101 = [v165 allKeys];
  v102 = [v101 firstObject];
  id v103 = [v180 objectForKeyedSubscript:v102];

  v104 = _IPLogHandle;
  if (!_IPLogHandle)
  {
    IPInitLogging();
    v104 = _IPLogHandle;
  }
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
  {
    id v105 = v104;
    v106 = [v103 identifier];
    *(_DWORD *)buf = 138412290;
    v216 = v106;
    _os_log_impl(&dword_225684000, v105, OS_LOG_TYPE_DEBUG, "Final event type : %@ #EventClassification", buf, 0xCu);
    goto LABEL_119;
  }
LABEL_122:
  id v8 = v159;
  uint64_t v11 = v158;

LABEL_123:
  return v103;
}

+ (id)eventClassificationTypeFromMessageUnit:(id)a3 features:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  char v7 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  uint64_t v8 = [v5 interactedDateRange];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          if (objc_opt_isKindOfClass()) {
            [v7 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v11);
    }
  }
  else
  {
    uint64_t v15 = v8;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = v6;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v21 matchRange] == v15)
          {
            [v7 addObject:v21];
            goto LABEL_23;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
  }
LABEL_23:

  uint64_t v22 = [a1 eventClassificationTypeFromMessageUnit:v5 features:v6 datafeatures:v7];

  return v22;
}

+ (id)eventClassificationTypeFromMessageUnit:(id)a3 features:(id)a4 datafeatures:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v11, "addObject:", v17, (void)v20);
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [a1 eventClassificationTypeFromMessageUnit:v8 keywordFeatures:v11 datafeatures:v10];

  return v18;
}

+ (double)_scoreForKeywordsInSubject:(BOOL)a3 distanceToDates:(double)a4 polarity:(unint64_t)a5 matchedRatio:(double)a6 keywordType:(unint64_t)a7
{
  if (a5 == 4)
  {
    double v7 = 0.0;
  }
  else
  {
    if (a5 != 2) {
      goto LABEL_6;
    }
    double v7 = 1.5;
  }
  a4 = a4 * v7;
LABEL_6:
  if (a4 <= 0.0) {
    a6 = -0.0;
  }
  return a4 + a6;
}

+ (double)_averageDistanceBetweenFeatureKeyword:(id)a3 featureDates:(id)a4 subjectLength:(unint64_t)a5 inSubject:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 matchRange];
  unint64_t v12 = v11;
  unint64_t v45 = a5;
  if (v6)
  {
    uint64_t v13 = [v9 matchRange];
    [v9 matchRange];
    unint64_t v15 = v14 + v13;
  }
  else
  {
    unint64_t v12 = v11 + a5;
    uint64_t v16 = [v9 matchRange];
    [v9 matchRange];
    unint64_t v15 = v16 + a5 + v17;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v10;
  uint64_t v18 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v47 = *(void *)v49;
    double v20 = (double)v12;
    double v21 = (double)v15;
    double v22 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v49 != v47) {
          objc_enumerationMutation(obj);
        }
        int v24 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v25 = [v24 contextDictionary];
        long long v26 = [v25 objectForKeyedSubscript:@"IPFeatureKeywordContextExtractedFromSubject"];
        if (v26)
        {
          [v24 contextDictionary];
          v28 = id v27 = v9;
          long long v29 = [v28 objectForKeyedSubscript:@"IPFeatureKeywordContextExtractedFromSubject"];
          char v30 = [v29 BOOLValue] ^ 1;

          id v9 = v27;
        }
        else
        {
          char v30 = 1;
        }

        NSUInteger v31 = [v24 matchRange];
        NSUInteger v33 = v32;
        v55.location = [v9 matchRange];
        v55.length = v34;
        v54.location = v31;
        v54.length = v33;
        if (!NSIntersectionRange(v54, v55).length)
        {
          uint64_t v35 = [v24 matchRange];
          unint64_t v36 = v35;
          if (v30)
          {
            unint64_t v36 = v35 + v45;
            uint64_t v37 = [v24 matchRange];
            [v24 matchRange];
            unint64_t v39 = v37 + v45 + v38;
          }
          else
          {
            uint64_t v40 = [v24 matchRange];
            [v24 matchRange];
            unint64_t v39 = v41 + v40;
          }
          double v42 = (double)v39 - v20;
          if (v42 >= v21 - (double)v36) {
            double v42 = v21 - (double)v36;
          }
          if (v42 < 0.0) {
            double v42 = -v42;
          }
          double v22 = v22 + v42;
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v19);
  }
  else
  {
    double v22 = 0.0;
  }

  unint64_t v43 = [obj count];
  return v22 / (double)v43;
}

- (double)_hasPriorityOverEventType:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(IPEventClassificationType *)self identifier];
  BOOL v6 = [v4 identifier];
  char v7 = [v5 isEqual:v6];

  double v8 = 0.0;
  if ((v7 & 1) == 0)
  {
    if ([(IPEventClassificationType *)self isHighPriority]
      && ([v4 isHighPriority] & 1) == 0)
    {
      double v22 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        double v22 = _IPLogHandle;
      }
      double v8 = 1.0;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        id v10 = v22;
        uint64_t v11 = [(IPEventClassificationType *)self identifier];
        unint64_t v12 = [v4 identifier];
        int v28 = 138412802;
        long long v29 = v11;
        __int16 v30 = 2112;
        NSUInteger v31 = v12;
        __int16 v32 = 2048;
        uint64_t v33 = 0x3FF0000000000000;
        uint64_t v13 = "%@ has priority over %@ (high priority flag - weight %f) #EventClassification";
        goto LABEL_23;
      }
    }
    else if ([v4 _isAParentOf:self])
    {
      id v9 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        id v9 = _IPLogHandle;
      }
      double v8 = 1.0;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = v9;
        uint64_t v11 = [(IPEventClassificationType *)self identifier];
        unint64_t v12 = [v4 identifier];
        int v28 = 138412802;
        long long v29 = v11;
        __int16 v30 = 2112;
        NSUInteger v31 = v12;
        __int16 v32 = 2048;
        uint64_t v33 = 0x3FF0000000000000;
        uint64_t v13 = "%@ has priority over %@ (parent priority - weight %f) #EventClassification";
LABEL_23:
        _os_log_impl(&dword_225684000, v10, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v28, 0x20u);
      }
    }
    else
    {
      uint64_t v14 = [v4 upperPriorityEventTypesIdentifiers];
      unint64_t v15 = [(IPEventClassificationType *)self identifier];
      uint64_t v16 = [v14 objectForKeyedSubscript:v15];

      if (v16)
      {
        uint64_t v17 = [v4 upperPriorityEventTypesIdentifiers];
        uint64_t v18 = [(IPEventClassificationType *)self identifier];
        uint64_t v19 = [v17 objectForKeyedSubscript:v18];
        [v19 doubleValue];
        double v8 = v20;

        double v21 = _IPLogHandle;
        if (!_IPLogHandle)
        {
          IPInitLogging();
          double v21 = _IPLogHandle;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          id v10 = v21;
          uint64_t v11 = [(IPEventClassificationType *)self identifier];
          unint64_t v12 = [v4 identifier];
          int v28 = 138412802;
          long long v29 = v11;
          __int16 v30 = 2112;
          NSUInteger v31 = v12;
          __int16 v32 = 2048;
          uint64_t v33 = *(void *)&v8;
          uint64_t v13 = "%@ has priority over %@ (explicit priority rule - weight %f) #EventClassification";
          goto LABEL_23;
        }
      }
      else if ([v4 isLowPriority])
      {
        long long v23 = _IPLogHandle;
        if (!_IPLogHandle)
        {
          IPInitLogging();
          long long v23 = _IPLogHandle;
        }
        double v8 = 1.0;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          id v10 = v23;
          uint64_t v11 = [(IPEventClassificationType *)self identifier];
          unint64_t v12 = [v4 identifier];
          int v28 = 138412802;
          long long v29 = v11;
          __int16 v30 = 2112;
          NSUInteger v31 = v12;
          __int16 v32 = 2048;
          uint64_t v33 = 0x3FF0000000000000;
          uint64_t v13 = "%@ has priority over %@ (low priority flag - weight %f) #EventClassification";
          goto LABEL_23;
        }
      }
      else if ([(IPEventClassificationType *)self classificationDepth] >= 2 {
             && [v4 classificationDepth] == 1)
      }
      {
        uint64_t v25 = IPSOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          long long v26 = [(IPEventClassificationType *)self identifier];
          id v27 = [v4 identifier];
          int v28 = 138412802;
          long long v29 = v26;
          __int16 v30 = 2112;
          NSUInteger v31 = v27;
          __int16 v32 = 2048;
          uint64_t v33 = 0x3FF0000000000000;
          _os_log_impl(&dword_225684000, v25, OS_LOG_TYPE_DEBUG, "%@ has priority over %@ (cluster is low priority - weight %f) #EventClassification", (uint8_t *)&v28, 0x20u);
        }
        double v8 = 1.0;
      }
    }
  }

  return v8;
}

- (BOOL)_isAParentOf:(id)a3
{
  uint64_t v4 = [a3 parent];
  id v5 = (IPEventClassificationType *)v4;
  for (BOOL i = v4 != 0; v5 != self && v5; BOOL i = v5 != 0)
  {
    char v7 = v5;
    id v5 = [(IPEventClassificationType *)v5 parent];
  }
  return i;
}

+ (id)taxonomyForLanguageID:(id)a3 clusterType:(unint64_t)a4
{
  id v6 = a3;
  char v7 = [a1 _identifierForCluster:a4];
  double v8 = [a1 taxonomyForLanguageID:v6 clusterIdentifier:v7];

  return v8;
}

+ (id)taxonomyForLanguageID:(id)a3 clusterIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (taxonomyForLanguageID_clusterIdentifier___pasOnceToken18 != -1) {
      dispatch_once(&taxonomyForLanguageID_clusterIdentifier___pasOnceToken18, &__block_literal_global_9);
    }
    double v8 = [(id)taxonomyForLanguageID_clusterIdentifier___pasExprOnceResult result];
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__4;
    double v20 = __Block_byref_object_dispose__4;
    id v21 = 0;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __69__IPEventClassificationType_taxonomyForLanguageID_clusterIdentifier___block_invoke_211;
    v11[3] = &unk_264723340;
    uint64_t v14 = &v16;
    id v12 = v7;
    id v15 = a1;
    id v13 = v6;
    [v8 runWithLockAcquired:v11];
    id v9 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __69__IPEventClassificationType_taxonomyForLanguageID_clusterIdentifier___block_invoke()
{
  v0 = (void *)MEMORY[0x22A632550]();
  uint64_t v1 = [objc_alloc(MEMORY[0x263F61E60]) initWithBlock:&__block_literal_global_208 idleTimeout:1.0];
  v2 = (void *)taxonomyForLanguageID_clusterIdentifier___pasExprOnceResult;
  taxonomyForLanguageID_clusterIdentifier___pasExprOnceResult = v1;
}

id __69__IPEventClassificationType_taxonomyForLanguageID_clusterIdentifier___block_invoke_2()
{
  id v0 = objc_alloc(MEMORY[0x263F61E70]);
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x263F61E50]) initWithCountLimit:5];
  v2 = (void *)[v0 initWithGuardedData:v1];

  return v2;
}

void __69__IPEventClassificationType_taxonomyForLanguageID_clusterIdentifier___block_invoke_211(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = v13;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = (void *)MEMORY[0x22A632550](v13);
    double v8 = [*(id *)(a1 + 56) _loadTaxonomyForLanguageID:*(void *)(a1 + 40) clusterIdentifier:*(void *)(a1 + 32) error:0];
    uint64_t v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v12) {
      [v13 setObject:v12 forKey:*(void *)(a1 + 32)];
    }
    id v6 = v13;
  }
}

+ (id)_dateComponentsFromTaxonomyHHMMString:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F08B08];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithString:v4];

  int v12 = 0;
  if ([v5 scanInt:&v12]) {
    BOOL v6 = v12 < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6 || v12 > 12)
  {
    double v8 = 0;
    goto LABEL_20;
  }
  double v8 = 0;
  if ([v5 scanString:@":" intoString:0])
  {
    int v11 = 0;
    double v8 = 0;
    if ([v5 scanInt:&v11])
    {
      if ((v11 & 0x80000000) == 0 && v11 <= 59)
      {
        if (([v5 scanString:@"am" intoString:0] & 1) != 0
          || ([v5 scanString:@"AM" intoString:0] & 1) != 0)
        {
          int v9 = v12 % 12;
LABEL_19:
          int v12 = v9;
          double v8 = objc_opt_new();
          [v8 setHour:v12];
          [v8 setMinute:v11];
          goto LABEL_20;
        }
        if (([v5 scanString:@"pm" intoString:0] & 1) != 0
          || (double v8 = 0, [v5 scanString:@"PM" intoString:0]))
        {
          int v9 = v12 % 12 + 12;
          goto LABEL_19;
        }
      }
    }
  }
LABEL_20:

  return v8;
}

+ (id)_loadTaxonomyForLanguageID:(id)a3 clusterIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v311 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v265 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v236 = objc_alloc_init(MEMORY[0x263EFF980]);
  context = (void *)MEMORY[0x22A632550]();
  v235 = v8;
  v243 = v7;
  uint64_t v10 = [NSString stringWithFormat:@"%@-%@-%@-expanded", @"Patterns-EventType", v8, v7];
  int v11 = +[X objectForKeyedSubscript:v10];
  if (!v11)
  {
    int v12 = [NSString stringWithFormat:@"Can't load taxonomy from file %@", v10];
    [v9 setObject:v12 forKeyedSubscript:v10];
  }
  v233 = (void *)v10;
  id v237 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v238 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v296 = 0u;
  long long v297 = 0u;
  long long v298 = 0u;
  long long v299 = 0u;
  id v13 = v11;
  v270 = v9;
  uint64_t v241 = [v13 countByEnumeratingWithState:&v296 objects:v310 count:16];
  v242 = v13;
  if (v241)
  {
    uint64_t v239 = *(void *)v297;
    id v240 = a1;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v297 != v239) {
          objc_enumerationMutation(v13);
        }
        uint64_t v15 = *(void *)(*((void *)&v296 + 1) + 8 * v14);
        uint64_t v16 = [v13 objectForKeyedSubscript:v15];
        uint64_t v17 = [v16 objectForKeyedSubscript:@"KEYWORDS"];

        if (v17)
        {
          [v238 setObject:v17 forKeyedSubscript:v15];
          if (!a5 || [v17 count]) {
            goto LABEL_16;
          }
        }
        else if (!a5)
        {
          goto LABEL_16;
        }
        uint64_t v18 = [v9 objectForKeyedSubscript:@"KEYWORDS"];

        if (!v18)
        {
          id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v9 setObject:v19 forKeyedSubscript:@"KEYWORDS"];
        }
        double v20 = [v9 objectForKeyedSubscript:@"KEYWORDS"];
        id v21 = [NSString stringWithFormat:@"No keywords associated to identifier : %@", v15];
        [v20 addObject:v21];

LABEL_16:
        double v22 = [v13 objectForKeyedSubscript:v15];
        long long v23 = [v22 objectForKeyedSubscript:@"START_TIME"];

        v256 = v17;
        uint64_t v258 = v14;
        v254 = v23;
        if (!v23 || ![v23 length])
        {
          int v28 = 0;
LABEL_22:
          int v26 = -1;
          int v27 = -1;
          goto LABEL_23;
        }
        int v24 = [a1 _dateComponentsFromTaxonomyHHMMString:v23];
        if (!v24)
        {
          int v28 = (int)a5;
          if (a5)
          {
            uint64_t v142 = (void *)_IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              uint64_t v142 = (void *)_IPLogHandle;
            }
            uint64_t v143 = v142;
            if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v307 = v23;
              __int16 v308 = 2114;
              uint64_t v309 = v15;
              _os_log_impl(&dword_225684000, v143, OS_LOG_TYPE_ERROR, "ERROR: Invalid start time string: '%{public}@' for identifier: %{public}@ #EventClassification", buf, 0x16u);
            }

            uint64_t v144 = [v9 objectForKeyedSubscript:@"START_TIME"];

            if (!v144)
            {
              id v145 = objc_alloc_init(MEMORY[0x263EFF980]);
              [v9 setObject:v145 forKeyedSubscript:@"START_TIME"];
            }
            double v146 = [v9 objectForKeyedSubscript:@"START_TIME"];
            double v147 = [NSString stringWithFormat:@"Invalid start time string: '%@' for identifier: %@", v23, v15];
            [v146 addObject:v147];

            int v28 = 0;
            int v26 = -1;
            int v27 = -1;
            goto LABEL_23;
          }
          goto LABEL_22;
        }
        uint64_t v25 = v24;
        int v26 = [v24 hour];
        int v27 = [v25 minute];

        int v28 = v26 > 0;
        if (v26 > 11)
        {
          uint64_t v29 = 2;
          goto LABEL_24;
        }
LABEL_23:
        uint64_t v29 = 1;
LABEL_24:
        if (v28) {
          uint64_t v30 = v29;
        }
        else {
          uint64_t v30 = 0;
        }
        uint64_t v252 = v30;
        NSUInteger v31 = [v13 objectForKeyedSubscript:v15];
        __int16 v32 = [v31 objectForKeyedSubscript:@"USE_DEFAULT_TIME"];
        int v33 = [v32 BOOLValue];

        if (v33) {
          int v34 = v27;
        }
        else {
          int v34 = -1;
        }
        int v262 = v34;
        if (v33) {
          int v35 = v26;
        }
        else {
          int v35 = -1;
        }
        int v260 = v35;
        unint64_t v36 = [v13 objectForKeyedSubscript:v15];
        uint64_t v37 = [v36 objectForKeyedSubscript:@"DURATION"];

        double v38 = -1.0;
        if (v37)
        {
          unint64_t v39 = [v13 objectForKeyedSubscript:v15];
          uint64_t v40 = [v39 objectForKeyedSubscript:@"DURATION"];
          [v40 doubleValue];
          double v42 = v41;

          if (v42 <= 0.0 || v42 > 1440.0)
          {
            if (a5)
            {
              unint64_t v43 = [v9 objectForKeyedSubscript:@"DURATION"];

              if (!v43)
              {
                id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
                [v9 setObject:v44 forKeyedSubscript:@"DURATION"];
              }
              unint64_t v45 = [v9 objectForKeyedSubscript:@"DURATION"];
              uint64_t v46 = NSString;
              uint64_t v47 = [v13 objectForKeyedSubscript:v15];
              long long v48 = [v47 objectForKeyedSubscript:@"DURATION"];
              long long v49 = [v46 stringWithFormat:@"Invalid duration time string: '%@' for identifier: %@", v48, v15];
              [v45 addObject:v49];
            }
          }
          else
          {
            double v38 = v42 * 60.0;
          }
        }
        long long v50 = [v13 objectForKeyedSubscript:v15];
        long long v51 = [v50 objectForKeyedSubscript:@"TITLE"];

        if (a5 && v51)
        {
          if ((unint64_t)[v51 length] >= 0xC9)
          {
            int v52 = [v9 objectForKeyedSubscript:@"TITLE"];

            if (!v52)
            {
              id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
              [v9 setObject:v53 forKeyedSubscript:@"TITLE"];
            }
            NSRange v54 = [v9 objectForKeyedSubscript:@"TITLE"];
            NSRange v55 = [NSString stringWithFormat:@"Too long title string: '%@' for identifier: %@", v51, v15];
            [v54 addObject:v55];
          }
          if (![v51 length])
          {
            BOOL v56 = [v9 objectForKeyedSubscript:@"TITLE"];

            if (!v56)
            {
              id v57 = objc_alloc_init(MEMORY[0x263EFF980]);
              [v9 setObject:v57 forKeyedSubscript:@"TITLE"];
            }
            double v58 = [v9 objectForKeyedSubscript:@"TITLE"];
            double v59 = [NSString stringWithFormat:@"Empty title string: '%@' for identifier: %@", v51, v15];
            [v58 addObject:v59];
          }
        }
        if (![v51 length])
        {

          long long v51 = 0;
        }
        uint64_t v60 = [a1 _parentFromIdentifier:v15];
        v251 = (void *)v60;
        if (v60) {
          [v237 setObject:v60 forKeyedSubscript:v15];
        }
        else {
          [v236 addObject:v15];
        }
        v268 = v51;
        objc_super v61 = [v13 objectForKeyedSubscript:v15];
        v62 = [v61 objectForKeyedSubscript:@"USE_FOR_TIME_ADJUSTMENT"];
        if (v62)
        {
          BOOL v63 = [v13 objectForKeyedSubscript:v15];
          char v64 = [v63 objectForKeyedSubscript:@"USE_FOR_TIME_ADJUSTMENT"];
          char v250 = [v64 BOOLValue];
        }
        else
        {
          char v250 = 0;
        }

        v65 = [v13 objectForKeyedSubscript:v15];
        v66 = [v65 objectForKeyedSubscript:@"START_TIME_MIN"];

        double v67 = 0.0;
        double v68 = 0.0;
        if (v66)
        {
          uint64_t v69 = [v13 objectForKeyedSubscript:v15];
          uint64_t v70 = [v69 objectForKeyedSubscript:@"START_TIME_MIN"];
          uint64_t v71 = [a1 _dateComponentsFromTaxonomyHHMMString:v70];

          if (v71)
          {
            uint64_t v72 = [v71 hour];
            double v68 = (double)(-[v71 minute] - 60 * v72 + v262 + 60 * v260);
          }
          BOOL v74 = v68 < 0.0 || v71 == 0;
          if (a5 && v74)
          {
            v75 = [v9 objectForKeyedSubscript:@"START_TIME_MIN"];

            if (!v75)
            {
              id v76 = objc_alloc_init(MEMORY[0x263EFF980]);
              [v9 setObject:v76 forKeyedSubscript:@"START_TIME_MIN"];
            }
            v77 = [v9 objectForKeyedSubscript:@"START_TIME_MIN"];
            v78 = NSString;
            double v79 = [v13 objectForKeyedSubscript:v15];
            id v80 = [v79 objectForKeyedSubscript:@"START_TIME_MIN"];
            v81 = [v78 stringWithFormat:@"Invalid start time  min string: '%@' for identifier: %@", v80, v15];
            [v77 addObject:v81];

            double v68 = 0.0;
          }
        }
        v82 = [v13 objectForKeyedSubscript:v15];
        v83 = [v82 objectForKeyedSubscript:@"START_TIME_MAX"];

        if (v83)
        {
          v84 = [v13 objectForKeyedSubscript:v15];
          v85 = [v84 objectForKeyedSubscript:@"START_TIME_MAX"];
          uint64_t v86 = [a1 _dateComponentsFromTaxonomyHHMMString:v85];

          if (v86)
          {
            uint64_t v87 = [v86 hour];
            double v67 = (double)([v86 minute] - (v262 + 60 * v260) + 60 * v87);
          }
          BOOL v89 = v67 < 0.0 || v86 == 0;
          if (a5 && v89)
          {
            v90 = [v9 objectForKeyedSubscript:@"START_TIME_MAX"];

            if (!v90)
            {
              id v91 = objc_alloc_init(MEMORY[0x263EFF980]);
              [v9 setObject:v91 forKeyedSubscript:@"START_TIME_MAX"];
            }
            uint64_t v92 = [v9 objectForKeyedSubscript:@"START_TIME_MAX"];
            uint64_t v93 = NSString;
            uint64_t v94 = [v13 objectForKeyedSubscript:v15];
            uint64_t v95 = [v94 objectForKeyedSubscript:@"START_TIME_MAX"];
            id v96 = [v93 stringWithFormat:@"Invalid start time  max string: '%@' for identifier: %@", v95, v15];
            [v92 addObject:v96];

            double v67 = 0.0;
          }
        }
        id v97 = [v13 objectForKeyedSubscript:v15];
        v98 = [v97 objectForKeyedSubscript:@"ALLDAY_ALLOWED"];
        if (v98)
        {
          v99 = [v13 objectForKeyedSubscript:v15];
          v100 = [v99 objectForKeyedSubscript:@"ALLDAY_ALLOWED"];
          char v248 = [v100 BOOLValue];
        }
        else
        {
          char v248 = 0;
        }

        v101 = [v13 objectForKeyedSubscript:v15];
        v102 = [v101 objectForKeyedSubscript:@"SUBJECT_KEYWORDS"];

        id v103 = objc_opt_new();
        if ([v102 length]) {
          [v103 addObject:v102];
        }
        v249 = v102;
        if (v268 && [v268 length])
        {
          v104 = [v268 lowercaseString];
          [v103 addObject:v104];
        }
        id v105 = [v13 objectForKeyedSubscript:v15];
        v247 = [v105 objectForKeyedSubscript:@"TITLE_SENDER_TEMPLATE"];

        v106 = [v13 objectForKeyedSubscript:v15];
        id v107 = [v106 objectForKeyedSubscript:@"ALLOW_GENERIC_PATTERNS_KEYWORDS"];
        if (v107)
        {
          double v108 = [v13 objectForKeyedSubscript:v15];
          uint64_t v109 = [v108 objectForKeyedSubscript:@"ALLOW_GENERIC_PATTERNS_KEYWORDS"];
          char v246 = [v109 BOOLValue];
        }
        else
        {
          char v246 = 1;
        }

        uint64_t v110 = [v13 objectForKeyedSubscript:v15];
        id v111 = [v110 objectForKeyedSubscript:@"MOVIE_RELATED"];
        if (v111)
        {
          uint64_t v112 = [v13 objectForKeyedSubscript:v15];
          double v113 = [v112 objectForKeyedSubscript:@"MOVIE_RELATED"];
          char v245 = [v113 BOOLValue];
        }
        else
        {
          char v245 = 0;
        }

        double v114 = [v13 objectForKeyedSubscript:v15];
        v115 = [v114 objectForKeyedSubscript:@"MEAL_RELATED"];
        if (v115)
        {
          double v116 = [v13 objectForKeyedSubscript:v15];
          id v117 = [v116 objectForKeyedSubscript:@"MEAL_RELATED"];
          char v244 = [v117 BOOLValue];
        }
        else
        {
          char v244 = 0;
        }

        id v118 = [v13 objectForKeyedSubscript:v15];
        uint64_t v119 = [v118 objectForKeyedSubscript:@"CULTURE_RELATED"];
        if (v119)
        {
          uint64_t v120 = [v13 objectForKeyedSubscript:v15];
          uint64_t v121 = [v120 objectForKeyedSubscript:@"CULTURE_RELATED"];
          char v122 = [v121 BOOLValue];
        }
        else
        {
          char v122 = 0;
        }

        uint64_t v123 = [v13 objectForKeyedSubscript:v15];
        v124 = [v123 objectForKeyedSubscript:@"SPORT_RELATED"];
        if (v124)
        {
          double v125 = [v13 objectForKeyedSubscript:v15];
          double v126 = [v125 objectForKeyedSubscript:@"SPORT_RELATED"];
          char v127 = [v126 BOOLValue];

          id v13 = v242;
        }
        else
        {
          char v127 = 0;
        }

        v128 = [v13 objectForKeyedSubscript:v15];
        v129 = [v128 objectForKeyedSubscript:@"FAIRLY_GENERIC"];
        if (v129)
        {
          v130 = [v13 objectForKeyedSubscript:v15];
          uint64_t v131 = [v130 objectForKeyedSubscript:@"FAIRLY_GENERIC"];
          v132 = v13;
          char v133 = [v131 BOOLValue];
        }
        else
        {
          v132 = v13;
          char v133 = 0;
        }

        uint64_t v134 = [v132 objectForKeyedSubscript:v15];
        v135 = [v134 objectForKeyedSubscript:@"APPOINTMENT_RELATED"];
        if (v135)
        {
          v136 = [v132 objectForKeyedSubscript:v15];
          v137 = [v136 objectForKeyedSubscript:@"APPOINTMENT_RELATED"];
          char v138 = [v137 BOOLValue];
        }
        else
        {
          char v138 = 0;
        }
        id v9 = v270;

        v139 = [IPEventClassificationType alloc];
        uint64_t v140 = objc_opt_new();
        LOBYTE(v232) = v138;
        HIBYTE(v231) = v133;
        BYTE6(v231) = v127;
        BYTE5(v231) = v122;
        BYTE4(v231) = v244;
        BYTE3(v231) = v245;
        BYTE2(v231) = v246;
        BYTE1(v231) = v248;
        LOBYTE(v231) = v250;
        uint64_t v141 = -[IPEventClassificationType initWithIdentifier:language:patternKeywords:titleKeywords:subjectKeywords:defaultTitle:titleSenderTemplate:defaultStartingTimeHour:defaultStartingTimeMinutes:defaultDuration:preferedMeridian:parent:children:useForTimeAdjustement:minutesBeforeDefaultStartingTime:minutesAfterDefaultStartingTime:allDayAllowed:useGenericPatternsInClassification:movieRelated:mealRelated:cultureRelated:sportRelated:fairlyGeneric:appointmentRelated:](v139, "initWithIdentifier:language:patternKeywords:titleKeywords:subjectKeywords:defaultTitle:titleSenderTemplate:defaultStartingTimeHour:defaultStartingTimeMinutes:defaultDuration:preferedMeridian:parent:children:useForTimeAdjustement:minutesBeforeDefaultStartingTime:minutesAfterDefaultStartingTime:allDayAllowed:useGenericPatternsInClassification:movieRelated:mealRelated:cultureRelated:sportRelated:fairlyGeneric:appointmentRelated:", v15, v243, v256, v140, v103, v268, v38, v68, v67, v247, __PAIR64__(v262, v260), v252, 0,
                 0,
                 v231,
                 v232);

        [v265 setObject:v141 forKeyedSubscript:v15];
        uint64_t v14 = v258 + 1;
        id v13 = v242;
        a1 = v240;
      }
      while (v241 != v258 + 1);
      uint64_t v148 = [v242 countByEnumeratingWithState:&v296 objects:v310 count:16];
      uint64_t v241 = v148;
    }
    while (v148);
  }

  long long v294 = 0u;
  long long v295 = 0u;
  long long v292 = 0u;
  long long v293 = 0u;
  id v149 = v237;
  uint64_t v150 = [v149 countByEnumeratingWithState:&v292 objects:v305 count:16];
  v257 = v149;
  if (!v150) {
    goto LABEL_145;
  }
  uint64_t v151 = v150;
  uint64_t v152 = *(void *)v293;
  do
  {
    for (uint64_t i = 0; i != v151; ++i)
    {
      if (*(void *)v293 != v152) {
        objc_enumerationMutation(v149);
      }
      uint64_t v154 = *(void *)(*((void *)&v292 + 1) + 8 * i);
      v155 = [v149 objectForKeyedSubscript:v154];
      if (v155
        && ([v265 objectForKeyedSubscript:v154], (uint64_t v156 = objc_claimAutoreleasedReturnValue()) != 0)
        && (v157 = (void *)v156,
            [v265 objectForKeyedSubscript:v155],
            v158 = objc_claimAutoreleasedReturnValue(),
            v158,
            v157,
            v158))
      {
        v159 = [v265 objectForKeyedSubscript:v154];
        id v160 = [v265 objectForKeyedSubscript:v155];
        [v159 _addParent:v160];

        int v161 = [v265 objectForKeyedSubscript:v155];
        id v149 = v257;
        id v162 = [v265 objectForKeyedSubscript:v154];
        [v161 _addChild:v162];
      }
      else
      {
        if (!a5) {
          goto LABEL_143;
        }
        id v163 = [v9 objectForKeyedSubscript:@"PARENT"];

        if (!v163)
        {
          id v164 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v9 setObject:v164 forKeyedSubscript:@"PARENT"];
        }
        int v161 = [v9 objectForKeyedSubscript:@"PARENT"];
        id v162 = [NSString stringWithFormat:@"Invalid parent %@ for node %@", v155, v154];
        [v161 addObject:v162];
      }

LABEL_143:
    }
    uint64_t v151 = [v149 countByEnumeratingWithState:&v292 objects:v305 count:16];
  }
  while (v151);
LABEL_145:

  v253 = [NSString stringWithFormat:@"%@-%@-%@-expanded", @"Events-EventType", v235, v243];
  v255 = +[X objectForKeyedSubscript:](&unk_26D8DF498, "objectForKeyedSubscript:");
  if (v255)
  {
    long long v290 = 0u;
    long long v291 = 0u;
    long long v288 = 0u;
    long long v289 = 0u;
    id v165 = v255;
    uint64_t v166 = [v165 countByEnumeratingWithState:&v288 objects:v304 count:16];
    if (v166)
    {
      uint64_t v167 = v166;
      uint64_t v168 = *(void *)v289;
      do
      {
        for (uint64_t j = 0; j != v167; ++j)
        {
          if (*(void *)v289 != v168) {
            objc_enumerationMutation(v165);
          }
          uint64_t v170 = *(void *)(*((void *)&v288 + 1) + 8 * j);
          id v171 = [v165 objectForKeyedSubscript:v170];
          if ([v171 count])
          {
            uint64_t v172 = [v265 objectForKeyedSubscript:v170];

            if (v172)
            {
              uint64_t v173 = [v265 objectForKeyedSubscript:v170];
              [v173 addEventPatterns:v171];
            }
          }
        }
        uint64_t v167 = [v165 countByEnumeratingWithState:&v288 objects:v304 count:16];
      }
      while (v167);
    }
  }
  long long v286 = 0u;
  long long v287 = 0u;
  long long v284 = 0u;
  long long v285 = 0u;
  id v174 = v265;
  uint64_t v175 = [v174 countByEnumeratingWithState:&v284 objects:v303 count:16];
  if (v175)
  {
    uint64_t v176 = v175;
    uint64_t v177 = *(void *)v285;
    do
    {
      for (uint64_t k = 0; k != v176; ++k)
      {
        if (*(void *)v285 != v177) {
          objc_enumerationMutation(v174);
        }
        v179 = [v174 objectForKeyedSubscript:*(void *)(*((void *)&v284 + 1) + 8 * k)];
        uint64_t v180 = [v179 parent];
        if (v180)
        {
          long long v181 = (void *)v180;
          do
          {
            long long v182 = [v181 patternKeywords];
            long long v183 = [v179 patternKeywords];
            [v182 addObjectsFromArray:v183];

            long long v184 = [v181 titleKeywords];
            long long v185 = [v179 titleKeywords];
            [v184 addObjectsFromArray:v185];

            long long v186 = [v181 genericPatternKeywords];
            long long v187 = [v179 genericPatternKeywords];
            [v186 addObjectsFromArray:v187];

            long long v188 = [v179 subjectKeywords];
            long long v189 = [v181 subjectKeywords];
            [v188 addObjectsFromArray:v189];

            uint64_t v190 = [v181 parent];

            long long v181 = (void *)v190;
          }
          while (v190);
        }
      }
      uint64_t v176 = [v174 countByEnumeratingWithState:&v284 objects:v303 count:16];
    }
    while (v176);
  }

  v269 = [NSString stringWithFormat:@"%@-%@", @"Events-Priorities", v243];
  long long v191 = +[X objectForKeyedSubscript:](&unk_26D8DF498, "objectForKeyedSubscript:");
  if (!v191)
  {
    long long v192 = [NSString stringWithFormat:@"Can't load priority rules from file %@", v269];
    [v9 setObject:v192 forKeyedSubscript:v269];
  }
  long long v282 = 0u;
  long long v283 = 0u;
  long long v280 = 0u;
  long long v281 = 0u;
  id v193 = v191;
  v261 = v193;
  uint64_t v263 = [v193 countByEnumeratingWithState:&v280 objects:v302 count:16];
  if (v263)
  {
    uint64_t v259 = *(void *)v281;
    do
    {
      uint64_t v194 = 0;
      do
      {
        if (*(void *)v281 != v259) {
          objc_enumerationMutation(v193);
        }
        uint64_t v266 = v194;
        long long v195 = *(void **)(*((void *)&v280 + 1) + 8 * v194);
        long long v196 = [v193 objectForKeyedSubscript:v195];
        long long v276 = 0u;
        long long v277 = 0u;
        long long v278 = 0u;
        long long v279 = 0u;
        id v197 = v196;
        uint64_t v198 = [v197 countByEnumeratingWithState:&v276 objects:v301 count:16];
        if (v198)
        {
          uint64_t v199 = v198;
          uint64_t v200 = *(void *)v277;
          do
          {
            for (uint64_t m = 0; m != v199; ++m)
            {
              if (*(void *)v277 != v200) {
                objc_enumerationMutation(v197);
              }
              long long v202 = *(void **)(*((void *)&v276 + 1) + 8 * m);
              long long v203 = [v197 objectForKeyedSubscript:v202];
              if ([v202 isEqualToString:@"ALL"]
                && ([v174 objectForKeyedSubscript:v195],
                    long long v204 = objc_claimAutoreleasedReturnValue(),
                    v204,
                    v204))
              {
                long long v205 = [v174 objectForKeyedSubscript:v195];
                [v205 setHighPriority:1];
              }
              else if ([v195 isEqualToString:@"ALL"] {
                     && ([v174 objectForKeyedSubscript:v202],
              }
                         long long v206 = objc_claimAutoreleasedReturnValue(),
                         v206,
                         v206))
              {
                long long v205 = [v174 objectForKeyedSubscript:v202];
                [v205 setLowPriority:1];
              }
              else
              {
                long long v207 = [v174 objectForKeyedSubscript:v202];

                if (v207)
                {
                  long long v205 = [v174 objectForKeyedSubscript:v202];
                  [v205 _addUpperPriorityEventTypeIdentifier:v195 weight:v203];
                }
                else
                {
                  if (!a5) {
                    goto LABEL_190;
                  }
                  long long v205 = [v270 objectForKeyedSubscript:v269];
                  long long v208 = [NSString stringWithFormat:@"Odd priority rule : %@ > %@", v195, v202];
                  [v205 addObject:v208];
                }
              }

LABEL_190:
            }
            uint64_t v199 = [v197 countByEnumeratingWithState:&v276 objects:v301 count:16];
          }
          while (v199);
        }

        uint64_t v194 = v266 + 1;
        id v193 = v261;
      }
      while (v266 + 1 != v263);
      uint64_t v263 = [v261 countByEnumeratingWithState:&v280 objects:v302 count:16];
    }
    while (v263);
  }

  if (a5)
  {
    long long v274 = 0u;
    long long v275 = 0u;
    long long v272 = 0u;
    long long v273 = 0u;
    id v209 = v174;
    uint64_t v267 = [v209 countByEnumeratingWithState:&v272 objects:v300 count:16];
    if (v267)
    {
      uint64_t v210 = *(void *)v273;
      id v264 = v209;
      do
      {
        for (uint64_t n = 0; n != v267; ++n)
        {
          if (*(void *)v273 != v210) {
            objc_enumerationMutation(v209);
          }
          uint64_t v212 = *(void *)(*((void *)&v272 + 1) + 8 * n);
          v213 = [v209 objectForKeyedSubscript:v212];
          v214 = [v213 patternKeywords];

          v215 = +[IPRegexToolbox regexPatternForLanguageID:v243 eventVocabularyArray:v214];
          v216 = [v215 lowercaseString];
          char v217 = [v216 isEqualToString:v215];

          if ((v217 & 1) == 0)
          {
            v218 = [v270 objectForKeyedSubscript:@"REGEX"];

            if (!v218)
            {
              __int16 v219 = objc_opt_new();
              [v270 setObject:v219 forKeyedSubscript:@"REGEX"];
            }
            double v220 = [v270 objectForKeyedSubscript:@"REGEX"];
            __int16 v221 = [NSString stringWithFormat:@"Upper case characters in regex for : %@ : %@", v212, v215];
            [v220 addObject:v221];
          }
          int v222 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v215 options:0 error:0];
          if (!v222)
          {
            uint64_t v223 = v210;
            double v224 = [v270 objectForKeyedSubscript:@"REGEX"];

            if (!v224)
            {
              __int16 v225 = objc_opt_new();
              [v270 setObject:v225 forKeyedSubscript:@"REGEX"];
            }
            v226 = [v270 objectForKeyedSubscript:@"REGEX"];
            __int16 v227 = [NSString stringWithFormat:@"Invalid regex for : %@ : %@", v212, v215];
            [v226 addObject:v227];

            uint64_t v210 = v223;
            id v209 = v264;
          }
        }
        uint64_t v267 = [v209 countByEnumeratingWithState:&v272 objects:v300 count:16];
      }
      while (v267);
    }

    double v228 = v270;
    *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IPEventClassification" code:-1 userInfo:v270];
  }
  else
  {

    double v228 = v270;
  }
  id v229 = v174;

  return v229;
}

+ (id)allClusterIdentifiers
{
  v4[5] = *MEMORY[0x263EF8340];
  v4[0] = @"GATHERING";
  v4[1] = @"APPOINTMENT";
  v4[2] = @"ENTERTAINMENT";
  v4[3] = @"ARRANGEMENT";
  v4[4] = @"EVENT";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  return v2;
}

+ (id)_parentFromIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263EFF980]);
    id v5 = [v3 componentsSeparatedByString:@"::"];
    BOOL v6 = (void *)[v4 initWithArray:v5];

    if ((unint64_t)[v6 count] >= 2)
    {
      [v6 removeLastObject];
      id v7 = objc_msgSend(v6, "_pas_componentsJoinedByString:", @"::");
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_identifierForCluster:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"None";
  }
  else {
    return off_264723360[a3 - 1];
  }
}

+ (id)_identifiersForClusters:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = objc_msgSend(a1, "_identifierForCluster:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "integerValue", (void)v13));
        [v5 appendString:v11];

        [v5 appendString:@" "];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_mealClassificationTypeUsingStartDate:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = getCalendar();
  id v6 = [v5 components:96 fromDate:v4];

  uint64_t v7 = [v6 hour];
  uint64_t v8 = [v6 minute];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v9 = [(IPEventClassificationType *)self children];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v12 = v8 + 60 * v7;
    uint64_t v13 = *(void *)v29;
    double v14 = (double)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v9);
        }
        long long v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v16 useForTimeAdjustement])
        {
          double v17 = (double)(int)[v16 defaultCumulativeMinutes];
          [v16 minutesBeforeDefaultStartingTime];
          if (v17 - v18 <= v14)
          {
            double v19 = (double)(int)[v16 defaultCumulativeMinutes];
            [v16 minutesAfterDefaultStartingTime];
            if (v20 + v19 >= v14)
            {
              if (IPDebuggingModeEnabled_once_2 != -1) {
                dispatch_once(&IPDebuggingModeEnabled_once_2, &__block_literal_global_549);
              }
              if (IPDebuggingModeEnabled_sEnabled_2)
              {
                long long v23 = _IPLogHandle;
                if (!_IPLogHandle)
                {
                  IPInitLogging();
                  long long v23 = _IPLogHandle;
                }
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  int v24 = v23;
                  uint64_t v25 = [(IPEventClassificationType *)self identifier];
                  int v26 = [v16 identifier];
                  *(_DWORD *)buf = 138412802;
                  id v33 = v25;
                  __int16 v34 = 2112;
                  int v35 = v26;
                  __int16 v36 = 2112;
                  id v37 = v4;
                  _os_log_impl(&dword_225684000, v24, OS_LOG_TYPE_INFO, "Adjustment from %@ to %@ using starting time %@ #EventClassification", buf, 0x20u);
                }
              }
              double v22 = v16;

              goto LABEL_27;
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (IPDebuggingModeEnabled_once_2 != -1) {
    dispatch_once(&IPDebuggingModeEnabled_once_2, &__block_literal_global_549);
  }
  if (IPDebuggingModeEnabled_sEnabled_2)
  {
    id v21 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      id v21 = _IPLogHandle;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v4;
      _os_log_impl(&dword_225684000, v21, OS_LOG_TYPE_INFO, "No Adjustment possible using starting time %@ #EventClassification", buf, 0xCu);
    }
  }
  double v22 = self;
LABEL_27:

  return v22;
}

- (unint64_t)classificationDepth
{
  unint64_t result = self->_classificationDepth;
  if (!result)
  {
    id v4 = self;
    id v5 = [(IPEventClassificationType *)v4 parent];

    unint64_t v6 = 1;
    if (v5)
    {
      uint64_t v7 = v4;
      do
      {
        id v4 = [(IPEventClassificationType *)v7 parent];

        ++v6;
        uint64_t v8 = [(IPEventClassificationType *)v4 parent];

        uint64_t v7 = v4;
      }
      while (v8);
    }
    self->_classificationDepth = v6;

    return self->_classificationDepth;
  }
  return result;
}

+ (id)morePreciseEventClassificationTypeBetweenType:(id)a3 and:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v5;
  if (v5 != v6)
  {
    uint64_t v8 = [v5 defaultTitle];
    if (!v8
      || (uint64_t v9 = (void *)v8,
          [v6 defaultTitle],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          uint64_t v7 = v5,
          v10))
    {
      uint64_t v11 = [v6 defaultTitle];
      if (!v11
        || (unint64_t v12 = (void *)v11,
            [v5 defaultTitle],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            v13,
            v12,
            uint64_t v7 = v6,
            v13))
      {
        unint64_t v14 = [v5 classificationDepth];
        if (v14 >= [v6 classificationDepth]) {
          uint64_t v7 = v5;
        }
        else {
          uint64_t v7 = v6;
        }
      }
    }
  }
  id v15 = v7;

  return v15;
}

+ (id)cleanSubject:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x22A632550]();
  id v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  id v6 = (void *)[v5 mutableCopy];

  [v6 addCharactersInString:@",.;:：。"];
  uint64_t v7 = +[IPRegexToolbox emailSubjectPrefixRegex];
  uint64_t v8 = objc_msgSend(v7, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), &stru_26D895C60);

  uint64_t v9 = [v8 stringByTrimmingCharactersInSet:v6];

  return v9;
}

- (BOOL)isDateWithinRange:(id)a3
{
  id v4 = a3;
  [(IPEventClassificationType *)self minutesBeforeDefaultStartingTime];
  if (v5 == 0.0
    || ([(IPEventClassificationType *)self minutesAfterDefaultStartingTime], v6 == 0.0))
  {
    BOOL v13 = 1;
  }
  else
  {
    uint64_t v7 = getCalendar();
    uint64_t v8 = [v7 components:96 fromDate:v4];

    uint64_t v9 = [v8 hour];
    double v10 = (double)([v8 minute] + 60 * v9);
    double v11 = (double)[(IPEventClassificationType *)self defaultCumulativeMinutes];
    [(IPEventClassificationType *)self minutesBeforeDefaultStartingTime];
    if (v11 - v12 <= v10)
    {
      double v14 = (double)[(IPEventClassificationType *)self defaultCumulativeMinutes];
      [(IPEventClassificationType *)self minutesAfterDefaultStartingTime];
      BOOL v13 = v15 + v14 >= v10;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  return v13;
}

+ (id)eventTypeForMoviesAndLanguageID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [a1 taxonomyForLanguageID:a3 clusterType:2];
  id v4 = [v3 children];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v11 = objc_msgSend(v10, "identifier", (void)v15);
        char v12 = [v11 isEqualToString:@"ENTERTAINMENT::MOVIES"];

        if (v12)
        {
          id v13 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

+ (id)eventTypeForSportAndLanguageID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [a1 taxonomyForLanguageID:a3 clusterType:2];
  id v4 = [v3 children];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v11 = objc_msgSend(v10, "identifier", (void)v15);
        char v12 = [v11 isEqualToString:@"ENTERTAINMENT::SPORT"];

        if (v12)
        {
          id v13 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

+ (id)eventTypeForCultureAndLanguageID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [a1 taxonomyForLanguageID:a3 clusterType:2];
  id v4 = [v3 children];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v11 = objc_msgSend(v10, "identifier", (void)v15);
        char v12 = [v11 isEqualToString:@"ENTERTAINMENT::CULTURE"];

        if (v12)
        {
          id v13 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

+ (id)eventTypeForMealsAndLanguageID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [a1 taxonomyForLanguageID:a3 clusterType:1];
  id v4 = [v3 children];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v11 = objc_msgSend(v10, "identifier", (void)v15);
        char v12 = [v11 isEqualToString:@"GATHERING::MEAL"];

        if (v12)
        {
          id v13 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

+ (id)eventTypeForEntertainmentAndLanguageID:(id)a3
{
  return (id)[a1 taxonomyForLanguageID:a3 clusterType:2];
}

+ (id)eventTypeForGenericEventAndLanguageID:(id)a3
{
  return (id)[a1 taxonomyForLanguageID:a3 clusterType:5];
}

+ (id)eventClassificationTypeFromMessageUnit:(id)a3 detectedStartDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 features];
  uint64_t v9 = [a1 eventClassificationTypeFromMessageUnit:v7 features:v8];

  double v10 = [v9 adjustedEventClassificationTypeWithStartDate:v6];

  return v10;
}

- (id)adjustedEventTitleForMessageUnits:(id)a3 subject:(id)a4 isDateInSubject:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    double v10 = [MEMORY[0x263EFF910] date];
  }
  else
  {
    double v10 = 0;
  }
  double v11 = [(IPEventClassificationType *)self adjustedEventTitleForMessageUnits:v8 subject:v9 dateInSubject:v10 eventStartDate:0 isGeneratedFromSubject:0];

  return v11;
}

+ (id)humanReadableClusterType:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return @"None";
  }
  else {
    return off_264723388[a3 - 1];
  }
}

- (BOOL)isMovieRelated
{
  return self->_movieRelated;
}

- (BOOL)isMealRelated
{
  return self->_mealRelated;
}

- (BOOL)isCultureRelated
{
  return self->_cultureRelated;
}

- (BOOL)isSportRelated
{
  return self->_sportRelated;
}

- (BOOL)isFairlyGeneric
{
  return self->_fairlyGeneric;
}

- (BOOL)isAppointment
{
  return self->_isAppointment;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)defaultTitle
{
  return self->_defaultTitle;
}

- (void)setDefaultTitle:(id)a3
{
}

- (NSString)titleSenderTemplate
{
  return self->_titleSenderTemplate;
}

- (void)setTitleSenderTemplate:(id)a3
{
}

- (int)defaultStartingTimeHour
{
  return self->_defaultStartingTimeHour;
}

- (void)setDefaultStartingTimeHour:(int)a3
{
  self->_defaultStartingTimeHour = a3;
}

- (int)defaultStartingTimeMinutes
{
  return self->_defaultStartingTimeMinutes;
}

- (void)setDefaultStartingTimeMinutes:(int)a3
{
  self->_defaultStartingTimeMinutes = a3;
}

- (double)defaultDuration
{
  return self->_defaultDuration;
}

- (void)setDefaultDuration:(double)a3
{
  self->_defaultDuratiouint64_t n = a3;
}

- (unint64_t)preferedMeridian
{
  return self->_preferedMeridian;
}

- (void)setPreferedMeridian:(unint64_t)a3
{
  self->_preferedMeridiauint64_t n = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (BOOL)isAllDayAllowed
{
  return self->_allDayAllowed;
}

- (void)setAllDayAllowed:(BOOL)a3
{
  self->_allDayAllowed = a3;
}

- (void)setClassificationDepth:(unint64_t)a3
{
  self->_classificationDepth = a3;
}

- (int)defaultCumulativeMinutes
{
  return self->_defaultCumulativeMinutes;
}

- (void)setDefaultCumulativeMinutes:(int)a3
{
  self->_defaultCumulativeMinutes = a3;
}

- (BOOL)useForTimeAdjustement
{
  return self->_useForTimeAdjustement;
}

- (void)setUseForTimeAdjustement:(BOOL)a3
{
  self->_useForTimeAdjustement = a3;
}

- (double)minutesBeforeDefaultStartingTime
{
  return self->_minutesBeforeDefaultStartingTime;
}

- (void)setMinutesBeforeDefaultStartingTime:(double)a3
{
  self->_minutesBeforeDefaultStartingTime = a3;
}

- (double)minutesAfterDefaultStartingTime
{
  return self->_minutesAfterDefaultStartingTime;
}

- (void)setMinutesAfterDefaultStartingTime:(double)a3
{
  self->_minutesAfterDefaultStartingTime = a3;
}

- (NSMutableArray)patternKeywords
{
  return self->_patternKeywords;
}

- (void)setPatternKeywords:(id)a3
{
}

- (NSMutableArray)genericPatternKeywords
{
  return self->_genericPatternKeywords;
}

- (void)setGenericPatternKeywords:(id)a3
{
}

- (NSMutableArray)titleKeywords
{
  return self->_titleKeywords;
}

- (void)setTitleKeywords:(id)a3
{
}

- (NSMutableArray)subjectKeywords
{
  return self->_subjectKeywords;
}

- (void)setSubjectKeywords:(id)a3
{
}

- (IPEventClassificationType)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (IPEventClassificationType *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (NSMutableDictionary)upperPriorityEventTypesIdentifiers
{
  return self->_upperPriorityEventTypesIdentifiers;
}

- (void)setUpperPriorityEventTypesIdentifiers:(id)a3
{
}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
}

- (BOOL)isLowPriority
{
  return self->_lowPriority;
}

- (void)setLowPriority:(BOOL)a3
{
  self->_lowPriority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upperPriorityEventTypesIdentifiers, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_subjectKeywords, 0);
  objc_storeStrong((id *)&self->_titleKeywords, 0);
  objc_storeStrong((id *)&self->_genericPatternKeywords, 0);
  objc_storeStrong((id *)&self->_patternKeywords, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_titleSenderTemplate, 0);
  objc_storeStrong((id *)&self->_defaultTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end