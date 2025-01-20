@interface FCCDailyGoalLocalizer
+ (id)_keyForEventType:(id)a3 aboveAverage:(BOOL)a4;
+ (id)_keyForGoalType:(int64_t)a3;
+ (id)_keyForGoalTypes:(id)a3;
+ (id)_keyForTimeOfDayAtDate:(id)a3;
+ (id)_localizeCount:(double)a3 forKey:(id)a4 experienceType:(unint64_t)a5;
+ (id)localizedAppName;
+ (id)localizedDescriptionForGoalsCompleted:(id)a3 singleGoalExceeded:(BOOL)a4 date:(id)a5 firstName:(id)a6 isWheelchairUser:(BOOL)a7 experienceType:(unint64_t)a8 isStandalone:(BOOL)a9;
+ (id)localizedDescriptionForIncompleteGoalTypes:(id)a3 percentComplete:(double)a4 value:(double)a5 valueRemaining:(double)a6 date:(id)a7 firstName:(id)a8 moveUnit:(id)a9 isWheelchairUser:(BOOL)a10 progressEventIdentifier:(id)a11 minutesToWalkToCompleteRing:(int64_t)a12 hasCurrentMoveStreak:(BOOL)a13 experienceType:(unint64_t)a14 isStandalone:(BOOL)a15;
+ (id)localizedTitleForGoalsCompleted:(id)a3 isWheelchairUser:(BOOL)a4 experienceType:(unint64_t)a5;
+ (id)localizedTitleForIncompleteGoalTypes:(id)a3 percentComplete:(double)a4 valueRemaining:(double)a5 progressEventIdentifier:(id)a6 experienceType:(unint64_t)a7 isStandalone:(BOOL)a8;
@end

@implementation FCCDailyGoalLocalizer

+ (id)localizedAppName
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"FITNESS_APP_NAME" value:&stru_1F0E36308 table:0];

  return v3;
}

+ (id)localizedTitleForIncompleteGoalTypes:(id)a3 percentComplete:(double)a4 valueRemaining:(double)a5 progressEventIdentifier:(id)a6 experienceType:(unint64_t)a7 isStandalone:(BOOL)a8
{
  BOOL v8 = a8;
  v9 = objc_msgSend(a1, "_keyForEventType:aboveAverage:", a6, a5 < 0.0, a7, a4);
  v10 = v9;
  if (v8)
  {
    uint64_t v11 = [v9 stringByAppendingString:@"_STANDALONE"];

    v10 = (void *)v11;
  }
  v12 = [NSString stringWithFormat:@"GOAL_INCOMPLETE_TITLE_%@", v10];
  v13 = FILocalizationTableForExperienceType();
  v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v15 = FIRandomStringForPrefixWithTableName();

  return v15;
}

+ (id)localizedDescriptionForIncompleteGoalTypes:(id)a3 percentComplete:(double)a4 value:(double)a5 valueRemaining:(double)a6 date:(id)a7 firstName:(id)a8 moveUnit:(id)a9 isWheelchairUser:(BOOL)a10 progressEventIdentifier:(id)a11 minutesToWalkToCompleteRing:(int64_t)a12 hasCurrentMoveStreak:(BOOL)a13 experienceType:(unint64_t)a14 isStandalone:(BOOL)a15
{
  BOOL v104 = a10;
  v133[2] = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a8;
  id v112 = a9;
  id v22 = a11;
  v23 = [v20 firstObject];
  objc_msgSend(a1, "_keyForGoalType:", objc_msgSend(v23, "integerValue"));
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

  id v111 = a1;
  v107 = v20;
  if ([v20 count] == 3)
  {
    v25 = @"ALL";
LABEL_11:

    v36 = v25;
    goto LABEL_12;
  }
  id v26 = v22;
  v27 = [v20 lastObject];
  uint64_t v28 = [v27 integerValue];

  if (v28 == 4)
  {
    v25 = @"ALL";
LABEL_10:
    id v22 = v26;
    goto LABEL_11;
  }
  if ([v20 count] == 2)
  {
    v29 = NSString;
    v30 = [v20 firstObject];
    v31 = objc_msgSend(a1, "_keyForGoalType:", -[__CFString integerValue](v30, "integerValue"));
    v32 = [v107 lastObject];
    v33 = objc_msgSend(a1, "_keyForGoalType:", objc_msgSend(v32, "integerValue"));
    v25 = [v29 stringWithFormat:@"%@_%@", v31, v33];

    a1 = v111;
    v24 = v30;
    goto LABEL_10;
  }
  v34 = [v20 firstObject];
  int v35 = [v34 isEqual:&unk_1F0E3E228];

  if (v35 && a13)
  {
    v25 = @"MOVE_STREAK";
    goto LABEL_10;
  }
  id v22 = v26;
  v36 = v24;
LABEL_12:
  v106 = v22;
  v103 = [a1 _keyForEventType:v22 aboveAverage:a6 < 0.0];
  uint64_t v108 = [NSString stringWithFormat:@"GOAL_INCOMPLETE_DESCRIPTION_%@_%@", v36, v103];
  v37 = [v112 unitString];
  uint64_t v38 = [v37 uppercaseString];

  v39 = (void *)MEMORY[0x1E4F1CA48];
  v109 = (void *)v38;
  v40 = [NSString stringWithFormat:@"_%@", v38];
  v41 = objc_msgSend(v39, "arrayWithObjects:", &stru_1F0E36308, v40, 0);

  if (v21)
  {
    v42 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v43 = [v21 stringByTrimmingCharactersInSet:v42];

    if ([v43 length])
    {
      v133[0] = @"_NAME";
      v44 = [NSString stringWithFormat:@"_NAME_%@", v109];
      v133[1] = v44;
      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:2];
      [v41 addObjectsFromArray:v45];
    }
  }
  id v110 = v21;
  if (a12 >= 1)
  {
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id v46 = (id)[v41 copy];
    uint64_t v47 = [v46 countByEnumeratingWithState:&v125 objects:v132 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v126;
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v126 != v49) {
            objc_enumerationMutation(v46);
          }
          v51 = [*(id *)(*((void *)&v125 + 1) + 8 * i) stringByAppendingString:@"_WALK"];
          [v41 addObject:v51];
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v125 objects:v132 count:16];
      }
      while (v48);
    }

    id v21 = v110;
    a1 = v111;
  }
  v52 = (void *)v108;
  if (v104)
  {
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v53 = (id)[v41 copy];
    uint64_t v54 = [v53 countByEnumeratingWithState:&v121 objects:v131 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v122;
      do
      {
        for (uint64_t j = 0; j != v55; ++j)
        {
          if (*(void *)v122 != v56) {
            objc_enumerationMutation(v53);
          }
          v58 = [*(id *)(*((void *)&v121 + 1) + 8 * j) stringByAppendingString:@"_WHEELCHAIR"];
          [v41 addObject:v58];
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v121 objects:v131 count:16];
      }
      while (v55);
    }

    id v21 = v110;
    a1 = v111;
  }
  v105 = v36;
  if (a15)
  {
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v59 = (id)[v41 copy];
    uint64_t v60 = [v59 countByEnumeratingWithState:&v117 objects:v130 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v118;
      do
      {
        for (uint64_t k = 0; k != v61; ++k)
        {
          if (*(void *)v118 != v62) {
            objc_enumerationMutation(v59);
          }
          v64 = [*(id *)(*((void *)&v117 + 1) + 8 * k) stringByAppendingString:@"_STANDALONE"];
          [v41 addObject:v64];
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v117 objects:v130 count:16];
      }
      while (v61);
    }

    a1 = v111;
  }
  uint64_t v65 = FILocalizationTableForExperienceType();
  v66 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v67 = FIRandomStringWithKeyAndPossibleSuffixesWithTableName();

  if (![v67 containsString:@"<hours-remaining>"]) {
    goto LABEL_57;
  }
  _HKInitializeLogging();
  v68 = (os_log_t *)MEMORY[0x1E4F29F08];
  v69 = *MEMORY[0x1E4F29F08];
  v70 = v112;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEBUG)) {
    +[FCCDailyGoalLocalizer localizedDescriptionForIncompleteGoalTypes:percentComplete:value:valueRemaining:date:firstName:moveUnit:isWheelchairUser:progressEventIdentifier:minutesToWalkToCompleteRing:hasCurrentMoveStreak:experienceType:isStandalone:](v69, a6);
  }
  if (ceil(a6) == 1.0)
  {
    _HKInitializeLogging();
    v71 = *v68;
    if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEBUG)) {
      +[FCCDailyGoalLocalizer localizedDescriptionForIncompleteGoalTypes:percentComplete:value:valueRemaining:date:firstName:moveUnit:isWheelchairUser:progressEventIdentifier:minutesToWalkToCompleteRing:hasCurrentMoveStreak:experienceType:isStandalone:](v71);
    }
    v72 = [MEMORY[0x1E4F1CA48] array];
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v73 = v41;
    uint64_t v74 = [v73 countByEnumeratingWithState:&v113 objects:v129 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v114;
      do
      {
        for (uint64_t m = 0; m != v75; ++m)
        {
          if (*(void *)v114 != v76) {
            objc_enumerationMutation(v73);
          }
          v78 = [@"_SINGULAR" stringByAppendingString:*(void *)(*((void *)&v113 + 1) + 8 * m)];
          [v72 addObject:v78];
        }
        uint64_t v75 = [v73 countByEnumeratingWithState:&v113 objects:v129 count:16];
      }
      while (v75);
    }

    v79 = [MEMORY[0x1E4F1C978] arrayWithArray:v72];
    v80 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v52 = (void *)v108;
    id v21 = v110;
    uint64_t v81 = FIRandomStringWithKeyAndPossibleSuffixesWithTableName();

    a1 = v111;
    v67 = (void *)v81;
LABEL_57:
    v70 = v112;
  }
  v82 = [MEMORY[0x1E4F2B618] jouleUnitWithMetricPrefix:9];
  int v83 = [v70 isEqual:v82];

  v102 = (void *)v65;
  if (v83)
  {
    v84 = [v52 stringByAppendingString:@"_KILOJOULES_REMAINING"];
    unint64_t v85 = a14;
    v86 = [a1 _localizeCount:v84 forKey:a14 experienceType:a6];

    v87 = @"<kilojoules-remaining>";
  }
  else
  {
    v88 = [MEMORY[0x1E4F2B618] minuteUnit];
    int v89 = [v70 isEqual:v88];

    if (v89)
    {
      v90 = [v52 stringByAppendingString:@"_MOVE_MINUTES_REMAINING"];
      unint64_t v85 = a14;
      v86 = [a1 _localizeCount:v90 forKey:a14 experienceType:a6];

      v87 = @"<move-minutes-remaining>";
    }
    else
    {
      v91 = [v52 stringByAppendingString:@"_CALORIES_REMAINING"];
      unint64_t v85 = a14;
      v86 = [a1 _localizeCount:v91 forKey:a14 experienceType:a6];

      v87 = @"<calories-remaining>";
    }
  }
  [v67 stringByReplacingOccurrencesOfString:v87 withString:v86];
  v92 = v52;
  v94 = id v93 = a1;

  v95 = [v92 stringByAppendingString:@"_WALK_VALUE"];
  v96 = [v93 _localizeCount:v95 forKey:v85 experienceType:(double)a12];

  v97 = FILocalizeCount();
  v98 = [v94 stringByReplacingOccurrencesOfString:@"<walk-value>" withString:v96];

  v99 = [v98 stringByReplacingOccurrencesOfString:@"<hours-remaining>" withString:v97];

  if (!v99)
  {
    _HKInitializeLogging();
    v100 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      +[FCCDailyGoalLocalizer localizedDescriptionForIncompleteGoalTypes:percentComplete:value:valueRemaining:date:firstName:moveUnit:isWheelchairUser:progressEventIdentifier:minutesToWalkToCompleteRing:hasCurrentMoveStreak:experienceType:isStandalone:](v100);
    }
  }

  return v99;
}

+ (id)localizedTitleForGoalsCompleted:(id)a3 isWheelchairUser:(BOOL)a4 experienceType:(unint64_t)a5
{
  BOOL v5 = a4;
  id v6 = a3;
  if ([v6 count] == 3
    || ([v6 firstObject],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 integerValue],
        v7,
        v8 == 4))
  {
    v9 = @"ALL";
  }
  else if ([v6 count] == 2)
  {
    v9 = @"TWO";
  }
  else
  {
    v15 = [v6 firstObject];
    uint64_t v16 = [v15 unsignedIntegerValue];

    if (v16 == 3)
    {
      if (v5) {
        v18 = @"_WHEELCHAIR";
      }
      else {
        v18 = &stru_1F0E36308;
      }
      v9 = [@"STAND" stringByAppendingString:v18];
    }
    else
    {
      v17 = @"UNDEFINED";
      if (v16 == 1) {
        v17 = @"MOVE";
      }
      if (v16 == 2) {
        v9 = @"EXERCISE";
      }
      else {
        v9 = v17;
      }
    }
  }
  v10 = [@"GOAL_COMPLETE_TITLE_" stringByAppendingString:v9];
  uint64_t v11 = FILocalizationTableForExperienceType();
  v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v13 = FIRandomStringForPrefixWithTableName();

  return v13;
}

+ (id)localizedDescriptionForGoalsCompleted:(id)a3 singleGoalExceeded:(BOOL)a4 date:(id)a5 firstName:(id)a6 isWheelchairUser:(BOOL)a7 experienceType:(unint64_t)a8 isStandalone:(BOOL)a9
{
  BOOL v9 = a7;
  BOOL v12 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  if ((unint64_t)[v14 count] > 2)
  {
    uint64_t v17 = [a1 _keyForGoalType:4];
    BOOL v19 = 1;
  }
  else
  {
    uint64_t v17 = [a1 _keyForGoalTypes:v14];
    v18 = [v14 firstObject];
    BOOL v19 = [v18 integerValue] == 4;
  }
  if ([v14 count] == 2)
  {
    id v20 = &stru_1F0E36308;
  }
  else
  {
    id v20 = [a1 _keyForTimeOfDayAtDate:v15];
  }
  if ([v14 count] == 3
    && [(__CFString *)v20 isEqualToString:@"_LATEEVENING"])
  {

    id v20 = @"_EVENING";
  }
  char v21 = (unint64_t)[v14 count] > 1 || v19;
  if (v21)
  {
    id v22 = &stru_1F0E36308;
  }
  else
  {
    v23 = @"_MET";
    if (v12) {
      v23 = @"_EXCEEDED";
    }
    id v22 = v23;
  }
  v43 = v22;
  v44 = (void *)v17;
  v24 = [NSString stringWithFormat:@"GOAL_COMPLETE_DESCRIPTION_%@%@%@", v17, v20, v22];
  v25 = [MEMORY[0x1E4F1CA48] arrayWithObject:&stru_1F0E36308];
  id v26 = v25;
  if (v16) {
    [v25 addObject:@"_NAME"];
  }
  v45 = v16;
  id v46 = v15;
  if (v9)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v27 = (id)[v26 copy];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v52 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = [*(id *)(*((void *)&v51 + 1) + 8 * i) stringByAppendingString:@"_WHEELCHAIR"];
          [v26 addObject:v32];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v29);
    }

    id v15 = v46;
  }
  if (a9)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v33 = (id)[v26 copy];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v48 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = [*(id *)(*((void *)&v47 + 1) + 8 * j) stringByAppendingString:@"_STANDALONE"];
          [v26 addObject:v38];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v35);
    }

    id v15 = v46;
  }
  v39 = FILocalizationTableForExperienceType();
  v40 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v41 = FIRandomStringWithKeyAndPossibleSuffixesWithTableName();

  return v41;
}

+ (id)_keyForGoalType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return &stru_1F0E36308;
  }
  else {
    return off_1E6105BD0[a3 - 1];
  }
}

+ (id)_keyForTimeOfDayAtDate:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  BOOL v5 = [v3 currentCalendar];
  unint64_t v6 = [v5 component:32 fromDate:v4];

  if (v6 < 4) {
    return @"_MIDDLENIGHT";
  }
  if (v6 < 8) {
    return @"_EARLYMORNING";
  }
  if (v6 < 0xC) {
    return @"_LATEMORNING";
  }
  uint64_t v8 = @"_LATEEVENING";
  if (v6 < 0x13) {
    uint64_t v8 = @"_EVENING";
  }
  if (v6 >= 0x10) {
    return v8;
  }
  else {
    return @"_AFTERNOON";
  }
}

+ (id)_keyForGoalTypes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(a1, "_keyForGoalType:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "unsignedIntegerValue", (void)v14));
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  BOOL v12 = [v5 componentsJoinedByString:@"_"];

  return v12;
}

+ (id)_keyForEventType:(id)a3 aboveAverage:(BOOL)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:@"com.apple.nanolifestyle.NLCoachingProgressMorningUpdateEvent"]&& a4)
  {
    id v6 = @"EARLY_OVERACHIEVER";
  }
  else if ([v5 isEqualToString:@"com.apple.nanolifestyle.NLCoachingProgressMorningUpdateEvent"])
  {
    id v6 = @"EARLY";
  }
  else if ([v5 isEqualToString:@"com.apple.nanolifestyle.NLCoachingProgressEveningUpdateEvent"])
  {
    id v6 = @"LATE";
  }
  else
  {
    [v5 isEqualToString:@"com.apple.nanolifestyle.NLCoachingProgressAlmostThereEvent"];
    id v6 = @"ALMOST_THERE";
  }

  return v6;
}

+ (id)_localizeCount:(double)a3 forKey:(id)a4 experienceType:(unint64_t)a5
{
  id v7 = a4;
  id v8 = (id)*MEMORY[0x1E4F61C10];
  unint64_t v9 = a5 & 0xFFFFFFFFFFFFFFFELL;
  v10 = (void *)MEMORY[0x1E4F61C18];
  id v11 = v8;
  if (v9 == 2)
  {
    id v11 = (id)*MEMORY[0x1E4F61C18];
  }
  BOOL v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:v7 value:&stru_1F0E36308 table:v11];

  if ([v13 isEqualToString:v7]
    && [v11 isEqualToString:*v10])
  {
    id v14 = v8;

    long long v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:v7 value:&stru_1F0E36308 table:v14];

    id v11 = v14;
    v13 = (void *)v16;
  }
  long long v17 = objc_msgSend(NSString, "localizedStringWithFormat:", v13, vcvtpd_s64_f64(a3));

  return v17;
}

+ (void)localizedDescriptionForIncompleteGoalTypes:(os_log_t)log percentComplete:value:valueRemaining:date:firstName:moveUnit:isWheelchairUser:progressEventIdentifier:minutesToWalkToCompleteRing:hasCurrentMoveStreak:experienceType:isStandalone:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B55C0000, log, OS_LOG_TYPE_ERROR, "Trying to add or update a bulletin that we can't localize! PLEASE FILE A RADAR.", v1, 2u);
}

+ (void)localizedDescriptionForIncompleteGoalTypes:(os_log_t)log percentComplete:value:valueRemaining:date:firstName:moveUnit:isWheelchairUser:progressEventIdentifier:minutesToWalkToCompleteRing:hasCurrentMoveStreak:experienceType:isStandalone:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B55C0000, log, OS_LOG_TYPE_DEBUG, "Localization value is singular, trying singular suffixes", v1, 2u);
}

+ (void)localizedDescriptionForIncompleteGoalTypes:(os_log_t)log percentComplete:(double)a2 value:valueRemaining:date:firstName:moveUnit:isWheelchairUser:progressEventIdentifier:minutesToWalkToCompleteRing:hasCurrentMoveStreak:experienceType:isStandalone:.cold.3(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_1B55C0000, log, OS_LOG_TYPE_DEBUG, "Localization checking for singular using remaining value %lf", (uint8_t *)&v2, 0xCu);
}

@end