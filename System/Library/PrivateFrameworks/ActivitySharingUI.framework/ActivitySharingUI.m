void sub_234DE57F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234DE590C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_234DE5A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ASActivitySummaryGoalFormatString()
{
  v0 = ActivitySharingBundle();
  v1 = [v0 localizedStringForKey:@"LIST_VIEW_GOAL_FORMAT_WITH_UNITS_%@_%@_%@" value:&stru_26E8035F0 table:@"Localizable"];

  return v1;
}

id SmallCapsFontForFont(void *a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v19 = *MEMORY[0x263F81748];
  uint64_t v1 = *MEMORY[0x263F817B0];
  uint64_t v14 = *MEMORY[0x263F817B8];
  uint64_t v15 = v1;
  v16 = &unk_26E806E68;
  v17 = &unk_26E806E80;
  uint64_t v2 = NSDictionary;
  id v3 = a1;
  v4 = [v2 dictionaryWithObjects:&v16 forKeys:&v14 count:2];
  v18 = v4;
  v5 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v18, 1, v14, v15, v16, v17);
  v20[0] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];

  v7 = [v3 fontDescriptor];
  v8 = [v7 fontDescriptorByAddingAttributes:v6];

  v9 = (void *)MEMORY[0x263F81708];
  [v3 pointSize];
  double v11 = v10;

  v12 = [v9 fontWithDescriptor:v8 size:v11];

  return v12;
}

void sub_234DE6E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234DE7F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void _DrawPathWithColor(CGContext *a1, const CGPath *a2, void *a3)
{
  id v5 = a3;
  CGContextSaveGState(a1);
  id v6 = v5;
  v7 = (CGColor *)[v6 CGColor];

  CGContextSetFillColorWithColor(a1, v7);
  CGContextAddPath(a1, a2);
  CGContextDrawPath(a1, kCGPathFill);
  CGContextRestoreGState(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_234DEC6EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234DED104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void ASLaunchToMessagesWithRecipients(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 componentsJoinedByString:@","];
  uint64_t v2 = [NSString stringWithFormat:@"sms://open?recipients=%@&allowRetargeting=true", v1];
  ASLoggingInitialize();
  id v3 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v2;
    _os_log_impl(&dword_234DE2000, v3, OS_LOG_TYPE_DEFAULT, "Launching to messages app. URL String is %@", buf, 0xCu);
  }
  v4 = [MEMORY[0x263F82438] sharedApplication];
  id v5 = [NSURL URLWithString:v2];
  [v4 openURL:v5 options:MEMORY[0x263EFFA78] completionHandler:0];
}

__CFString *ASBreadcrumbKeyForBulletinType(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  id v5 = @"GOAL_COMPLETION_BREADCRUMB";
  switch(a1)
  {
    case 0:
      ASLoggingInitialize();
      id v6 = *MEMORY[0x263F23AD0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
        ASBreadcrumbKeyForBulletinType_cold_1(v6);
      }
      goto LABEL_9;
    case 2:
      id v5 = @"WORKOUT_BREADCRUMB";
      break;
    case 3:
      id v5 = @"ACHIEVEMENT_BREADCRUMB";
      break;
    case 4:
    case 8:
      id v5 = @"COMPETITION_IN_PROGRESS_BREADCRUMB";
      break;
    case 5:
      ASLoggingInitialize();
      v7 = *MEMORY[0x263F23AD0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
        ASBreadcrumbKeyForBulletinType_cold_2(v7);
      }
LABEL_9:
      id v5 = 0;
      break;
    case 6:
      id v5 = @"COMPETITION_ACCEPT_BREADCRUMB";
      break;
    case 7:
      int v8 = [v3 isScoreTied];
      uint64_t v9 = @"COMPETITION_END_BREADCRUMB";
      if (v8) {
        uint64_t v9 = @"COMPETITION_TIE_BREADCRUMB";
      }
      id v5 = v9;
      break;
    default:
      break;
  }

  return v5;
}

id MessageBubbleBackgroundPlatter()
{
  if (MessageBubbleBackgroundPlatter_onceToken != -1) {
    dispatch_once(&MessageBubbleBackgroundPlatter_onceToken, &__block_literal_global_0);
  }
  v0 = [(id)MessageBubbleBackgroundPlatter_imageCache objectForKey:@"MessageBubbleBackgroundPlatter"];
  if (!v0)
  {
    v6.width = 30.0;
    v6.height = 30.0;
    UIGraphicsBeginImageContextWithOptions(v6, 0, 0.0);
    uint64_t v1 = objc_msgSend(MEMORY[0x263F825C8], "as_competitionNotificationAccentGold");
    [v1 setFill];

    uint64_t v2 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 30.0, 30.0, 15.0);
    [v2 fill];
    v0 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    if (v0) {
      [(id)MessageBubbleBackgroundPlatter_imageCache setObject:v0 forKey:@"MessageBubbleBackgroundPlatter"];
    }
  }
  id v3 = v0;

  return v3;
}

uint64_t __MessageBubbleBackgroundPlatter_block_invoke()
{
  MessageBubbleBackgroundPlatter_imageCache = (uint64_t)objc_alloc_init(MEMORY[0x263EFF8E0]);
  return MEMORY[0x270F9A758]();
}

id _ASCompetitionEndedWinnerSuffixForFriend(void *a1, uint64_t a2)
{
  id v3 = a1;
  v4 = [v3 currentOrMostRecentCompetition];
  id v5 = v4;
  if (a2 == 1)
  {
    CGSize v6 = [v4 daysWonByParticipant:0];
    unint64_t v7 = [v6 count];

    if (v7 < 6)
    {
      if (ASCompetitionScoresAreWithinClosenessThreshold())
      {
        int v8 = (id *)MEMORY[0x263F239F8];
      }
      else if (ASDidLosePreviousCompetitionWithFriend())
      {
        int v8 = (id *)MEMORY[0x263F23A10];
      }
      else
      {
        v12 = ASCompetitionDayWithHighestScoreForParticipant();

        if (v12) {
          int v8 = (id *)MEMORY[0x263F239F0];
        }
        else {
          int v8 = (id *)MEMORY[0x263F23A00];
        }
      }
    }
    else
    {
      int v8 = (id *)MEMORY[0x263F23A18];
    }
  }
  else
  {
    int v9 = ASCompetitionScoresAreWithinClosenessThreshold();
    int v8 = (id *)MEMORY[0x263F239F8];
    if (!v9) {
      int v8 = (id *)MEMORY[0x263F23A00];
    }
  }
  id v10 = *v8;

  return v10;
}

id _ASCompetitionEndedLoserSuffixForFriend(void *a1, uint64_t a2)
{
  id v3 = [a1 currentOrMostRecentCompetition];
  int v4 = ASCompetitionScoresAreWithinClosenessThreshold();
  if (a2 == 1)
  {
    if (v4)
    {
      id v5 = (id *)MEMORY[0x263F239F8];
    }
    else
    {
      CGSize v6 = ASCompetitionWinningDayWithHighestScoreForParticipant();

      if (v6)
      {
        id v5 = (id *)MEMORY[0x263F23A30];
      }
      else
      {
        unint64_t v7 = ASCompetitionDayWithHighestScoreForParticipant();

        if (v7) {
          id v5 = (id *)MEMORY[0x263F239F0];
        }
        else {
          id v5 = (id *)MEMORY[0x263F23A00];
        }
      }
    }
  }
  else
  {
    id v5 = (id *)MEMORY[0x263F239F8];
    if (!v4) {
      id v5 = (id *)MEMORY[0x263F23A00];
    }
  }
  id v8 = *v5;

  return v8;
}

id _ASCompetitionEndedKeyForFriend(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v4 = [v3 currentOrMostRecentCompetition];
  id v5 = (void *)*MEMORY[0x263F239E8];
  if ([v4 isScoreTied])
  {
    CGSize v6 = [v5 stringByAppendingString:*MEMORY[0x263F23A20]];
  }
  else
  {
    if ([v4 isParticipantWinning:0])
    {
      unint64_t v7 = [v5 stringByAppendingString:*MEMORY[0x263F23A28]];
      _ASCompetitionEndedWinnerSuffixForFriend(v3, a2);
    }
    else
    {
      unint64_t v7 = [v5 stringByAppendingString:*MEMORY[0x263F23A08]];
      _ASCompetitionEndedLoserSuffixForFriend(v3, a2);
    id v8 = };
    CGSize v6 = [v7 stringByAppendingString:v8];
  }
  return v6;
}

id ASCompetitionEndedDemoKey()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)[v0 initWithSuiteName:*MEMORY[0x263F23CC8]];
  uint64_t v2 = [v1 stringForKey:@"CompetitionEndDescription"];

  return v2;
}

id ASCompetitionEndedDescriptionForFriend(void *a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a1;
  int v4 = [v3 currentOrMostRecentCompetition];
  id v5 = ASCompetitionEndedDemoKey();
  if (v5)
  {
    ASLoggingInitialize();
    CGSize v6 = *MEMORY[0x263F23AD0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      v25 = v5;
      _os_log_impl(&dword_234DE2000, v6, OS_LOG_TYPE_DEFAULT, "Found Competition End Description Key in user defaults: %@", (uint8_t *)&v24, 0xCu);
    }
    unint64_t v7 = ActivitySharingBundle();
    id v8 = [v7 localizedStringForKey:v5 value:&stru_26E8035F0 table:0];
  }
  else
  {
    unint64_t v7 = _ASCompetitionEndedKeyForFriend(v3, a2);
    int v9 = ActivitySharingBundle();
    id v10 = FILocalizationTableForExperienceType();
    id v8 = FIRandomStringForPrefixWithTableName();
  }
  double v11 = [v3 contact];

  v12 = [v11 displayName];

  v13 = [v4 daysWonByParticipant:0];
  [v13 count];
  uint64_t v14 = FILocalizeCount();

  uint64_t v15 = ASCompetitionDayWithHighestScoreForParticipant();
  v16 = FILocalizedDayName();
  v17 = ASCompetitionWinningDayWithHighestScoreForParticipant();
  v18 = FILocalizedDayName();
  if (v12)
  {
    uint64_t v19 = [v8 stringByReplacingOccurrencesOfString:@"<friend-name>" withString:v12];

    id v8 = (void *)v19;
  }
  if (v14)
  {
    uint64_t v20 = [v8 stringByReplacingOccurrencesOfString:@"<num-days>" withString:v14];

    id v8 = (void *)v20;
  }
  v21 = FIStringByReplacingDynamicPlaceholder();

  v22 = FIStringByReplacingDynamicPlaceholder();

  return v22;
}

id ASCompetitionEndedTitleForFriend(void *a1)
{
  uint64_t v1 = [a1 currentOrMostRecentCompetition];
  if ([v1 isScoreTied])
  {
    uint64_t v2 = ActivitySharingBundle();
    id v3 = v2;
    int v4 = @"COMPETITION_ENDED_TIED";
  }
  else
  {
    int v5 = [v1 isParticipantWinning:0];
    uint64_t v2 = ActivitySharingBundle();
    id v3 = v2;
    if (v5) {
      int v4 = @"COMPETITION_ENDED_WINNER";
    }
    else {
      int v4 = @"COMPETITION_ENDED_LOSER";
    }
  }
  CGSize v6 = [v2 localizedStringForKey:v4 value:&stru_26E8035F0 table:@"Localizable"];

  return v6;
}

id ASCompetitionFirstGlanceDescriptionForTypeWithFriends(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (a1)
  {
    int v5 = (void *)MEMORY[0x263F23A80];
    if (a1 == 1) {
      int v5 = (void *)MEMORY[0x263F23A88];
    }
    CGSize v6 = [(id)*MEMORY[0x263F23A38] stringByAppendingString:*v5];
    if (a1 == 1) {
      ASFriendsWithCompetitionsStartingToday();
    }
    else {
    int v9 = ASFriendsWithCompetitionsEndingToday();
    }
    uint64_t v10 = [v9 count];
    unint64_t v11 = v10;
    v12 = (id *)MEMORY[0x263F23A48];
    v13 = (id *)MEMORY[0x263F23A78];
    uint64_t v14 = (id *)MEMORY[0x263F23A70];
    if (v10 != 3) {
      uint64_t v14 = (id *)MEMORY[0x263F23A40];
    }
    if (v10 != 2) {
      v13 = v14;
    }
    if (v10 != 1) {
      v12 = v13;
    }
    id v15 = *v12;
    v16 = [v6 stringByAppendingString:v15];

    if (a1 != 1 && v11 == 1)
    {
      v17 = [v9 lastObject];
      v18 = [v17 currentCompetition];
      if (ASCompetitionScoresAreWithinClosenessThreshold())
      {
        uint64_t v19 = (id *)MEMORY[0x263F23A60];
      }
      else if ([v18 isParticipantWinning:0])
      {
        uint64_t v19 = (id *)MEMORY[0x263F23A50];
      }
      else
      {
        int HasCrossedMercyThresholdOnLastDayForCompetition = ASCompetitionParticipantHasCrossedMercyThresholdOnLastDayForCompetition();
        uint64_t v19 = (id *)MEMORY[0x263F23A58];
        if (HasCrossedMercyThresholdOnLastDayForCompetition) {
          uint64_t v19 = (id *)MEMORY[0x263F23A68];
        }
      }
      id v21 = *v19;
      uint64_t v22 = [v16 stringByAppendingString:v21];

      v16 = (void *)v22;
    }
    uint64_t v23 = FILocalizationTableForExperienceType();
    int v24 = ActivitySharingBundle();
    v49 = v16;
    id v8 = FIRandomStringForPrefixWithTableName();

    v50 = v15;
    id v51 = v4;
    v48 = (void *)v23;
    if (v11)
    {
      v25 = [v9 objectAtIndexedSubscript:0];
      uint64_t v26 = [v25 displayName];

      if (v11 == 1)
      {
        v27 = v9;
        v46 = 0;
        v47 = 0;
      }
      else
      {
        v28 = [v9 objectAtIndexedSubscript:1];
        v46 = [v28 displayName];

        v27 = v9;
        if (v11 < 3)
        {
          v47 = 0;
        }
        else
        {
          v29 = [v9 objectAtIndexedSubscript:2];
          v47 = [v29 displayName];
        }
      }
    }
    else
    {
      v27 = v9;
      v46 = 0;
      v47 = 0;
      uint64_t v26 = 0;
    }
    v30 = NSString;
    v31 = ActivitySharingBundle();
    v32 = [v31 localizedStringForKey:@"COMPETITIONS" value:&stru_26E8035F0 table:@"Localizable"];
    v33 = objc_msgSend(v30, "localizedStringWithFormat:", v32, v11);

    v34 = NSString;
    v35 = ActivitySharingBundle();
    v36 = [v35 localizedStringForKey:@"POINTS" value:&stru_26E8035F0 table:@"Localizable"];
    v37 = [v27 objectAtIndexedSubscript:0];
    v38 = [v37 currentCompetition];
    v39 = objc_msgSend(v34, "localizedStringWithFormat:", v36, ASCompetitionCurrentScoreDelta());

    if (v26)
    {
      uint64_t v40 = [v8 stringByReplacingOccurrencesOfString:@"<first-friend-name>" withString:v26];

      id v8 = (void *)v40;
    }
    if (v46)
    {
      uint64_t v41 = [v8 stringByReplacingOccurrencesOfString:@"<second-friend-name>" withString:v46];

      id v8 = (void *)v41;
    }
    if (v47)
    {
      uint64_t v42 = [v8 stringByReplacingOccurrencesOfString:@"<third-friend-name>" withString:v47];

      id v8 = (void *)v42;
    }
    if (v33)
    {
      uint64_t v43 = [v8 stringByReplacingOccurrencesOfString:@"<num-competitions>" withString:v33];

      id v8 = (void *)v43;
    }
    if (v39)
    {
      uint64_t v44 = [v8 stringByReplacingOccurrencesOfString:@"<num-points>" withString:v39];

      id v8 = (void *)v44;
    }
    id v4 = v51;
  }
  else
  {
    ASLoggingInitialize();
    unint64_t v7 = *MEMORY[0x263F23AD0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
      ASCompetitionFirstGlanceDescriptionForTypeWithFriends_cold_1(v7);
    }
    id v8 = 0;
  }

  return v8;
}

id ASCompetitionFirstGlanceSectionHeaderForType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 2)
  {
    uint64_t v2 = ActivitySharingBundle();
    id v3 = v2;
    id v4 = @"COMPETITION_MORE_COMPETITIONS_HEADER";
LABEL_6:
    int v5 = [v2 localizedStringForKey:v4 value:&stru_26E8035F0 table:@"Localizable"];
    uint64_t v1 = [v5 localizedUppercaseString];

    goto LABEL_10;
  }
  if (a1)
  {
    if (a1 != 3) {
      goto LABEL_10;
    }
    uint64_t v2 = ActivitySharingBundle();
    id v3 = v2;
    id v4 = @"COMPETITION_ALL_COMPETITIONS_HEADER";
    goto LABEL_6;
  }
  ASLoggingInitialize();
  CGSize v6 = *MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
    ASCompetitionFirstGlanceSectionHeaderForType_cold_1(v6);
  }
  uint64_t v1 = 0;
LABEL_10:
  return v1;
}

id ASCompetitionScoreCapCelebrationTitle()
{
  id v0 = ActivitySharingBundle();
  uint64_t v1 = [v0 localizedStringForKey:@"COMPETITION_SCORE_CAP_CELEBRATION_TITLE" value:&stru_26E8035F0 table:@"Localizable"];

  return v1;
}

id ASCompetitionScoreCapCelebrationDescription()
{
  id v0 = ActivitySharingBundle();
  uint64_t v1 = FIRandomStringForPrefixWithTableName();

  return v1;
}

id _ASCompetitionLearnMoreTextAttributes()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F81500];
  id v0 = objc_msgSend(MEMORY[0x263F825C8], "as_lightCompetitionGold");
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

id ASCompetitionLearnMoreIntroductionAttributedStringForFriend(void *a1, uint64_t a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F086A0];
  id v4 = a1;
  id v5 = [v3 alloc];
  CGSize v6 = objc_msgSend(v4, "as_competitionLearnMoreIntroductionForExperienceType:", a2);

  unint64_t v7 = _ASCompetitionLearnMoreTextAttributes();
  id v8 = (void *)[v5 initWithString:v6 attributes:v7];

  return v8;
}

id ASCompetitionLearnMoreDetailsAttributedStringForFriend(void *a1, uint64_t a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F086A0];
  id v4 = a1;
  id v5 = [v3 alloc];
  CGSize v6 = objc_msgSend(v4, "as_competitionLearnMoreDetailMessageForExperienceType:", a2);

  unint64_t v7 = _ASCompetitionLearnMoreTextAttributes();
  id v8 = (void *)[v5 initWithString:v6 attributes:v7];

  return v8;
}

id ASCompetitionZeroPaddedScoreString(uint64_t a1)
{
  if (ASCompetitionZeroPaddedScoreString_onceToken != -1) {
    dispatch_once(&ASCompetitionZeroPaddedScoreString_onceToken, &__block_literal_global_1);
  }
  uint64_t v2 = (void *)ASCompetitionZeroPaddedScoreString_formatter;
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1];
  id v4 = [v2 stringFromNumber:v3];

  return v4;
}

uint64_t __ASCompetitionZeroPaddedScoreString_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v1 = (void *)ASCompetitionZeroPaddedScoreString_formatter;
  ASCompetitionZeroPaddedScoreString_formatter = (uint64_t)v0;

  [(id)ASCompetitionZeroPaddedScoreString_formatter setMinimumIntegerDigits:2];
  [(id)ASCompetitionZeroPaddedScoreString_formatter setMaximumFractionDigits:0];
  uint64_t v2 = (void *)ASCompetitionZeroPaddedScoreString_formatter;
  return [v2 setNumberStyle:1];
}

id ASCompetitionStageStringWithCompetition(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 stage];
  if (v2 == 2)
  {
    unint64_t v11 = ActivitySharingBundle();
    id v3 = v11;
    v12 = @"COMPETITION_TALLYING_POINTS";
LABEL_8:
    uint64_t v10 = [v11 localizedStringForKey:v12 value:&stru_26E8035F0 table:@"Localizable"];
    goto LABEL_11;
  }
  if (v2 == 1)
  {
    if (![v1 isLastDayOfCompetition])
    {
      uint64_t v13 = [v1 numberOfDaysRemaining];
      uint64_t v14 = (void *)MEMORY[0x263F3F170];
      id v15 = [NSNumber numberWithUnsignedInteger:v13];
      id v3 = [v14 stringWithNumber:v15 decimalPrecision:1];

      v16 = NSString;
      v17 = ActivitySharingBundle();
      v18 = [v17 localizedStringForKey:@"DAYS_REMAINING" value:&stru_26E8035F0 table:@"Localizable"];
      uint64_t v10 = objc_msgSend(v16, "stringWithFormat:", v18, v13, v3);

      goto LABEL_11;
    }
    unint64_t v11 = ActivitySharingBundle();
    id v3 = v11;
    v12 = @"COMPETITION_ENDS_TODAY";
    goto LABEL_8;
  }
  if (v2)
  {
    uint64_t v10 = 0;
    goto LABEL_12;
  }
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  [v3 setDateFormat:@"EEEE"];
  id v4 = [v1 startDate];
  id v5 = [v3 stringFromDate:v4];
  CGSize v6 = [v5 capitalizedString];

  unint64_t v7 = NSString;
  id v8 = ActivitySharingBundle();
  int v9 = [v8 localizedStringForKey:@"COMPETITION_START_DATE" value:&stru_26E8035F0 table:@"Localizable"];
  uint64_t v10 = objc_msgSend(v7, "stringWithFormat:", v9, v6);

LABEL_11:
LABEL_12:

  return v10;
}

id ASAttributedNumberStringWithKey(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v31[2] = *MEMORY[0x263EF8340];
  int v9 = (void *)MEMORY[0x263F3F170];
  uint64_t v10 = NSNumber;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = a2;
  id v15 = [v10 numberWithUnsignedInteger:a1];
  v16 = [v9 stringWithNumber:v15 decimalPrecision:1];

  v17 = NSString;
  v18 = ActivitySharingBundle();
  uint64_t v19 = [v18 localizedStringForKey:v14 value:&stru_26E8035F0 table:@"Localizable"];

  uint64_t v20 = objc_msgSend(v17, "stringWithFormat:", v19, a1, v16);

  id v21 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v23 = *MEMORY[0x263F81500];
  v30[0] = *MEMORY[0x263F814F0];
  uint64_t v22 = v30[0];
  v30[1] = v23;
  v31[0] = v12;
  v31[1] = v11;
  int v24 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];

  v25 = (void *)[v21 initWithString:v20 attributes:v24];
  uint64_t v26 = [v25 string];
  uint64_t v27 = [v26 rangeOfString:v16];
  objc_msgSend(v25, "addAttribute:value:range:", v22, v13, v27, v28);

  return v25;
}

id ASPointsStringWithScore(uint64_t a1, void *a2, void *a3, void *a4)
{
  return ASAttributedNumberStringWithKey(a1, @"ABBREVIATED_POINTS", a2, a3, a4);
}

id ASDailyAverageStringWithScore(uint64_t a1, void *a2, void *a3, void *a4)
{
  return ASAttributedNumberStringWithKey(a1, @"DAILY_AVERAGE", a2, a3, a4);
}

id _AttributedNameStringWithDotPrefix(void *a1, void *a2, void *a3)
{
  v22[2] = *MEMORY[0x263EF8340];
  id v5 = (objc_class *)MEMORY[0x263F089B8];
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  id v9 = objc_alloc_init(v5);
  id v10 = objc_alloc_init(MEMORY[0x263F81678]);
  id v11 = [MEMORY[0x263F82818] configurationWithFont:v7 scale:1];
  id v12 = [MEMORY[0x263F827E8] systemImageNamed:@"circlebadge.fill" withConfiguration:v11];
  id v13 = [v12 imageWithTintColor:v6];

  [v10 setImage:v13];
  id v14 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v10];
  [v9 appendAttributedString:v14];
  id v15 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
  [v9 appendAttributedString:v15];

  id v16 = objc_alloc(MEMORY[0x263F086A0]);
  v21[0] = *MEMORY[0x263F81500];
  v17 = [MEMORY[0x263F825C8] whiteColor];
  v21[1] = *MEMORY[0x263F814F0];
  v22[0] = v17;
  v22[1] = v7;
  v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

  uint64_t v19 = (void *)[v16 initWithString:v8 attributes:v18];
  [v9 appendAttributedString:v19];

  return v9;
}

uint64_t ASDurationInDaysSinceDate(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF8F0];
  id v2 = a1;
  id v3 = objc_msgSend(v1, "hk_gregorianCalendar");
  id v4 = [v3 startOfDayForDate:v2];

  id v5 = [MEMORY[0x263EFF910] date];
  id v6 = [v3 startOfDayForDate:v5];

  id v7 = [v3 components:16 fromDate:v4 toDate:v6 options:0];
  uint64_t v8 = [v7 day];

  return v8;
}

id ASSharingStartTimeStringFromDate(void *a1)
{
  id v1 = a1;
  if (ASSharingStartTimeStringFromDate_onceToken != -1) {
    dispatch_once(&ASSharingStartTimeStringFromDate_onceToken, &__block_literal_global_2);
  }
  id v2 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  int v3 = [v2 isDateInToday:v1];

  id v4 = &ASSharingStartTimeStringFromDate___todayFormatter;
  if (!v3) {
    id v4 = &ASSharingStartTimeStringFromDate___notTodayFormatter;
  }
  id v5 = [(id)*v4 stringFromDate:v1];

  return v5;
}

uint64_t __ASSharingStartTimeStringFromDate_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  id v1 = (void *)ASSharingStartTimeStringFromDate___todayFormatter;
  ASSharingStartTimeStringFromDate___todayFormatter = (uint64_t)v0;

  [(id)ASSharingStartTimeStringFromDate___todayFormatter setDateStyle:0];
  [(id)ASSharingStartTimeStringFromDate___todayFormatter setTimeStyle:1];
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  int v3 = (void *)ASSharingStartTimeStringFromDate___notTodayFormatter;
  ASSharingStartTimeStringFromDate___notTodayFormatter = (uint64_t)v2;

  [(id)ASSharingStartTimeStringFromDate___notTodayFormatter setDateStyle:4];
  [(id)ASSharingStartTimeStringFromDate___notTodayFormatter setTimeStyle:0];
  id v4 = (void *)ASSharingStartTimeStringFromDate___notTodayFormatter;
  return [v4 setFormattingContext:5];
}

id _BackgroundColorForDetailViewType(void *a1)
{
  if ((unint64_t)a1 < 5) {
    goto LABEL_2;
  }
  if (a1 == (void *)5)
  {
    a1 = objc_msgSend(MEMORY[0x263F825C8], "as_competitionFriendListPlatterGold");
  }
  else if (a1 == (void *)6)
  {
LABEL_2:
    a1 = objc_msgSend(MEMORY[0x263F825C8], "as_competitionNotificationPlatterGold");
  }
  return a1;
}

uint64_t _ViewModulesForDetailViewType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return 29;
  }
  else {
    return qword_234E0DF48[a1 - 1];
  }
}

id _CreateSeparatorView()
{
  id v0 = objc_alloc(MEMORY[0x263F82E00]);
  id v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v2 = objc_msgSend(MEMORY[0x263F825C8], "as_competitionNotificationAccentGold");
  [v1 setBackgroundColor:v2];

  int v3 = [v1 layer];
  [v3 setCornerRadius:1.0];

  return v1;
}

id ASDisplayModeToString(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      id v1 = ActivitySharingBundle();
      id v2 = v1;
      int v3 = @"SORT_NAME";
      goto LABEL_9;
    case 1:
      id v1 = ActivitySharingBundle();
      id v2 = v1;
      int v3 = @"SORT_MOVE";
      goto LABEL_9;
    case 2:
      id v1 = ActivitySharingBundle();
      id v2 = v1;
      int v3 = @"SORT_EXERCISE";
      goto LABEL_9;
    case 3:
      id v1 = ActivitySharingBundle();
      id v2 = v1;
      int v3 = @"SORT_STEPS";
      goto LABEL_9;
    case 4:
      id v1 = ActivitySharingBundle();
      id v2 = v1;
      int v3 = @"SORT_WORKOUTS";
      goto LABEL_9;
    case 5:
      id v1 = ActivitySharingBundle();
      id v2 = v1;
      int v3 = @"SORT_PUSHES";
LABEL_9:
      id v4 = [v1 localizedStringForKey:v3 value:&stru_26E8035F0 table:@"Localizable"];

      break;
    default:
      id v4 = 0;
      break;
  }
  return v4;
}

uint64_t ASActivitySharingReplyContextTypeFromBulletinType(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = 1;
  switch(a1)
  {
    case 0:
    case 5:
      uint64_t v5 = 7;
      break;
    case 1:
    case 2:
    case 3:
      id v6 = [v3 currentCompetition];
      uint64_t v5 = [v6 stage] == 1;
      goto LABEL_10;
    case 6:
      uint64_t v5 = 2;
      break;
    case 7:
      id v6 = [v3 currentOrMostRecentCompetition];
      unint64_t v7 = [v6 myTotalScore];
      unint64_t v8 = [v6 opponentTotalScore];
      uint64_t v9 = 3;
      if (v7 <= v8) {
        uint64_t v9 = 4;
      }
      if (v7 == v8) {
        uint64_t v5 = 5;
      }
      else {
        uint64_t v5 = v9;
      }
LABEL_10:

      break;
    case 8:
      uint64_t v5 = 6;
      break;
    default:
      break;
  }

  return v5;
}

id _ASActivitySharingSuffixesByTextType()
{
  v2[6] = *MEMORY[0x263EF8340];
  v2[0] = @"_TEXT_EMOJI";
  v2[1] = @"_TEXT_ONLY";
  v2[2] = @"_EMOJI_ONLY";
  v2[3] = @"_TEXT_ONLY";
  v2[4] = @"_EMOJI_ONLY";
  v2[5] = @"_TEXT_EMOJI";
  id v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:6];
  return v0;
}

id _ASActivitySharingSuffixesByMessageToneForReplyContextType(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = [@"_ENCOURAGING" stringByAppendingString:@"_TEXT_EMOJI"];
  id v3 = [@"_ENCOURAGING" stringByAppendingString:@"_EMOJI_ONLY"];
  id v4 = [@"_SMACK" stringByAppendingString:@"_TEXT_EMOJI"];
  uint64_t v5 = [@"_ENCOURAGING" stringByAppendingString:@"_TEXT_ONLY"];
  id v6 = [@"_SMACK" stringByAppendingString:@"_EMOJI_ONLY"];
  unint64_t v7 = [@"_ENCOURAGING" stringByAppendingString:@"_TEXT_ONLY"];
  uint64_t v8 = [@"_SMACK" stringByAppendingString:@"_TEXT_ONLY"];
  uint64_t v9 = (void *)v8;
  if (a1)
  {
    id v15 = v2;
    uint64_t v16 = v8;
    v17 = v3;
    v18 = v5;
    uint64_t v19 = v4;
    uint64_t v20 = v6;
    id v10 = (void *)MEMORY[0x263EFF8C0];
    id v11 = &v15;
    uint64_t v12 = 6;
  }
  else
  {
    id v21 = v2;
    uint64_t v22 = v3;
    uint64_t v23 = v4;
    int v24 = v5;
    v25 = v6;
    uint64_t v26 = v7;
    uint64_t v27 = v8;
    id v10 = (void *)MEMORY[0x263EFF8C0];
    id v11 = &v21;
    uint64_t v12 = 7;
  }
  id v13 = objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);

  return v13;
}

__CFString *_ASActivitySharingSuffixForWorkoutType(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 workoutActivityType];
  id v3 = [MEMORY[0x263F3F188] activityTypeWithWorkout:v1];
  id v4 = v3;
  uint64_t v5 = 0;
  if (v2 <= 56)
  {
    if (v2 > 34)
    {
      switch(v2)
      {
        case ',':
          uint64_t v5 = @"_STAIR_STEPPER";
          goto LABEL_41;
        case '-':
        case '/':
        case '0':
        case '1':
        case '3':
          goto LABEL_41;
        case '.':
          uint64_t v13 = objc_msgSend(v1, "fiui_swimmingLocationType");
          id v11 = @"_POOL_SWIM";
          if (v13 == 2) {
            id v11 = @"_OPEN_WATER_SWIM";
          }
          goto LABEL_40;
        case '2':
          uint64_t v5 = @"_TRADITIONAL_STRENGTH_TRAINING";
          goto LABEL_41;
        case '4':
          int v10 = [v3 isIndoor];
          id v11 = @"_OUTDOOR_WALK";
          uint64_t v12 = @"_INDOOR_WALK";
          break;
        default:
          if (v2 == 35)
          {
            int v10 = [v3 isIndoor];
            id v11 = @"_OUTDOOR_ROWING";
            uint64_t v12 = @"_INDOOR_ROWING";
          }
          else
          {
            if (v2 != 37) {
              goto LABEL_41;
            }
            int v10 = [v3 isIndoor];
            id v11 = @"_OUTDOOR_RUN";
            uint64_t v12 = @"_INDOOR_RUN";
          }
          break;
      }
LABEL_38:
      if (v10) {
        id v11 = v12;
      }
LABEL_40:
      uint64_t v5 = v11;
      goto LABEL_41;
    }
    if (v2 <= 19)
    {
      if (v2 != 13)
      {
        if (v2 == 16) {
          uint64_t v5 = @"_ELLIPTICAL";
        }
        else {
          uint64_t v5 = 0;
        }
        goto LABEL_41;
      }
      int v10 = [v3 isIndoor];
      id v11 = @"_OUTDOOR_CYCLE";
      uint64_t v12 = @"_INDOOR_CYCLE";
      goto LABEL_38;
    }
    id v6 = @"_FUNCTIONAL_STRENGTH_TRAINING";
    unint64_t v7 = @"_HIKING";
    if (v2 != 24) {
      unint64_t v7 = 0;
    }
    BOOL v9 = v2 == 20;
LABEL_21:
    if (v9) {
      uint64_t v5 = v6;
    }
    else {
      uint64_t v5 = v7;
    }
    goto LABEL_41;
  }
  if (v2 > 71)
  {
    id v6 = @"_TAICHI";
    unint64_t v7 = @"_CARDIO_DANCE";
    uint64_t v8 = @"_COOLDOWN";
    if (v2 != 80) {
      uint64_t v8 = 0;
    }
    if (v2 != 77) {
      unint64_t v7 = v8;
    }
    BOOL v9 = v2 == 72;
    goto LABEL_21;
  }
  switch(v2)
  {
    case '9':
      uint64_t v5 = @"_YOGA";
      break;
    case ';':
      uint64_t v5 = @"_CORE_TRAINING";
      break;
    case '?':
      uint64_t v5 = @"_HIIT";
      break;
    case 'A':
      uint64_t v5 = @"_KICKBOXING";
      break;
    case 'B':
      uint64_t v5 = @"_PILATES";
      break;
    default:
      break;
  }
LABEL_41:

  return v5;
}

id _ASActivitySharingWorkoutKey(void *a1)
{
  id v1 = _ASActivitySharingSuffixForWorkoutType(a1);
  if (v1)
  {
    uint64_t v2 = [@"_WORKOUT" stringByAppendingString:v1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id _ASActivitySharingOrderedSuffixesForReplyContextType(unint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 > 6)
  {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    if (((1 << a1) & 0x7A) != 0) {
      _ASActivitySharingSuffixesByTextType();
    }
    else {
    id v4 = _ASActivitySharingSuffixesByMessageToneForReplyContextType(a1);
    }
  }

  return v4;
}

id _ASActivitySharingPrefixForReplyContextType(unint64_t a1)
{
  if (a1 > 6)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = objc_msgSend(@"FRIEND_REPLY", "stringByAppendingString:", off_264C19D88[a1], v1);
  }
  return v3;
}

uint64_t ASWatchRepliesCategoryForFitnessExperienceType(unint64_t a1)
{
  if (a1 > 2) {
    return 7;
  }
  else {
    return qword_234E0DF78[a1];
  }
}

id ASActivitySharingBaseKeysForReplyContextType(unint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1 == 7)
  {
    ASLoggingInitialize();
    id v4 = *MEMORY[0x263F23AD0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR)) {
      ASActivitySharingBaseKeysForReplyContextType_cold_1(v4);
    }
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = _ASActivitySharingPrefixForReplyContextType(a1);
    unint64_t v7 = _ASActivitySharingOrderedSuffixesForReplyContextType(a1, v3);
    id v8 = objc_alloc(MEMORY[0x263EFF980]);
    BOOL v9 = (void *)[v8 initWithArray:MEMORY[0x263EFFA68]];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = objc_msgSend(v6, "stringByAppendingString:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
          [v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    if (a1 <= 1 && v3)
    {
      uint64_t v16 = _ASActivitySharingWorkoutKey(v3);
      if (v16)
      {
        unint64_t v17 = a1 == 0;
        v18 = [@"FRIEND_REPLY" stringByAppendingString:v16];
        unint64_t v19 = [v9 count];
        if (v19 >= v17) {
          unint64_t v20 = v17;
        }
        else {
          unint64_t v20 = v19;
        }
        objc_msgSend(v9, "insertObject:atIndex:", v18, v20, (void)v22);
      }
    }
    uint64_t v5 = objc_msgSend(v9, "copy", (void)v22);
  }
  return v5;
}

id ASAllValidLocalizationKeysForPrefix(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = 0;
  for (uint64_t i = (void *)MEMORY[0x263EFFA68]; ; uint64_t i = (void *)v9)
  {
    unint64_t v7 = [NSString stringWithFormat:@"%@_%d", v3, v5];
    id v8 = WRLocalizedCategoryString();
    if ([v8 isEqualToString:v7]) {
      break;
    }
    uint64_t v5 = (v5 + 1);
    uint64_t v9 = [i arrayByAddingObject:v7];
  }
  return i;
}

id ASActivitySharingRandomizedReplyKeysForReplyContextType(unint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  unint64_t v19 = v5;
  ASActivitySharingBaseKeysForReplyContextType(a1, v5);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    id v10 = (id)MEMORY[0x263EFFA68];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v13 = ASAllValidLocalizationKeysForPrefix(v12, v6);
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        void v21[2] = __ASActivitySharingRandomizedReplyKeysForReplyContextType_block_invoke;
        v21[3] = &unk_264C19D68;
        id v10 = v10;
        id v22 = v10;
        id v14 = objc_msgSend(v13, "hk_filter:", v21);

        if ([v14 count])
        {
          id v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", (int)arc4random_uniform(objc_msgSend(v14, "count")));
          uint64_t v16 = [v10 arrayByAddingObject:v15];

          id v10 = (id)v16;
        }
        else
        {
          ASLoggingInitialize();
          unint64_t v17 = *MEMORY[0x263F23AD0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v28 = v12;
            _os_log_error_impl(&dword_234DE2000, v17, OS_LOG_TYPE_ERROR, "Didn't find reply keys for base reply key %@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v8);
  }
  else
  {
    id v10 = (id)MEMORY[0x263EFFA68];
  }

  return v10;
}

uint64_t __ASActivitySharingRandomizedReplyKeysForReplyContextType_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

id ASActivitySharingRandomizedLocalizedReplyForReplyContextType(unint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = ASActivitySharingRandomizedReplyKeysForReplyContextType(a1, a2, v5);
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = WRLocalizedCategoryString();
        objc_msgSend(v7, "addObject:", v13, v15);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

id _ASWorkoutCountString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 count];
  id v3 = ActivitySharingBundle();
  id v4 = v3;
  if (v2 == 1) {
    id v5 = @"WORKOUT";
  }
  else {
    id v5 = @"WORKOUTS";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_26E8035F0 table:@"Localizable"];

  uint64_t v7 = (void *)MEMORY[0x263F3F170];
  id v8 = NSNumber;
  uint64_t v9 = [v1 count];

  uint64_t v10 = [v8 numberWithUnsignedInteger:v9];
  uint64_t v11 = [v7 stringWithNumber:v10 decimalPrecision:1];

  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", v6, v11);

  return v12;
}

id ASWorkoutNameString(void *a1, void *a2)
{
  v16[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = a1;
  id v5 = [v3 keyColorForDisplayMode:4];
  if ([v4 count] == 1)
  {
    id v6 = [v4 anyObject];

    id v4 = [v6 hkWorkoutFromFriendWorkout];

    uint64_t v7 = [v4 metadata];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F09AA0]];
    [v8 BOOLValue];

    [v4 workoutActivityType];
    objc_msgSend(v4, "fi_swimmingLocationType");
    FILocalizedNameForActivityType();
  }
  else
  {
    _ASWorkoutCountString(v4);
  uint64_t v9 = };

  id v10 = objc_alloc(MEMORY[0x263F089B8]);
  v15[0] = *MEMORY[0x263F814F0];
  uint64_t v11 = [v3 descriptionFont];

  v15[1] = *MEMORY[0x263F81500];
  v16[0] = v11;
  v16[1] = v5;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v13 = (void *)[v10 initWithString:v9 attributes:v12];

  return v13;
}

id ASWorkoutCountString(void *a1, void *a2)
{
  v13[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = a1;
  id v5 = [v3 keyColorForDisplayMode:4];
  id v6 = _ASWorkoutCountString(v4);

  id v7 = objc_alloc(MEMORY[0x263F089B8]);
  v12[0] = *MEMORY[0x263F814F0];
  id v8 = [v3 multilineDataFont];

  v12[1] = *MEMORY[0x263F81500];
  v13[0] = v8;
  v13[1] = v5;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v10 = (void *)[v7 initWithString:v6 attributes:v9];

  return v10;
}

id ASWorkoutCaloriesString(void *a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v6 keyColorForDisplayMode:4];
  uint64_t v9 = (void *)MEMORY[0x263F0A630];
  id v10 = [MEMORY[0x263F0A830] kilocalorieUnit];
  uint64_t v11 = [v9 quantityWithUnit:v10 doubleValue:0.0];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v39;
    do
    {
      uint64_t v16 = 0;
      long long v17 = v11;
      do
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v18 = [*(id *)(*((void *)&v38 + 1) + 8 * v16) totalEnergyBurned];
        uint64_t v11 = [v17 _quantityByAddingQuantity:v18];

        ++v16;
        long long v17 = v11;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v14);
  }

  v37 = [v7 localizedStringWithActiveEnergy:v11];
  id v19 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v20 = [NSString stringWithFormat:@"%@", v37];
  uint64_t v44 = *MEMORY[0x263F814F0];
  uint64_t v21 = v44;
  [v6 multilineDataFont];
  id v22 = v7;
  long long v23 = v36 = v7;
  uint64_t v45 = *MEMORY[0x263F81500];
  uint64_t v24 = v45;
  v46[0] = v23;
  v46[1] = v8;
  [NSDictionary dictionaryWithObjects:v46 forKeys:&v44 count:2];
  long long v25 = v35 = (void *)v8;
  long long v26 = (void *)[v19 initWithString:v20 attributes:v25];

  uint64_t v27 = [v22 localizedShortActiveEnergyUnitString];
  id v28 = objc_alloc(MEMORY[0x263F086A0]);
  v29 = [v27 localizedUppercaseString];
  v42[0] = v21;
  uint64_t v30 = v6;
  v31 = [v6 multilineUnitFont];
  v42[1] = v24;
  v43[0] = v31;
  v43[1] = v35;
  v32 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
  v33 = (void *)[v28 initWithString:v29 attributes:v32];
  [v26 appendAttributedString:v33];

  return v26;
}

uint64_t sub_234DF787C()
{
  sub_234DF7BF8();
  uint64_t result = sub_234E0BF80();
  qword_2687ED718 = result;
  return result;
}

uint64_t variable initialization expression of ReplyBubbleView.delegate()
{
  return 0;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_234DF7904(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_234DF7924(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for ASRichMessageType(uint64_t a1)
{
}

uint64_t sub_234DF7974(uint64_t a1, uint64_t a2)
{
  return sub_234DF7AE0(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_234DF798C(uint64_t a1, id *a2)
{
  uint64_t result = sub_234E0BDB0();
  *a2 = 0;
  return result;
}

uint64_t sub_234DF7A04(uint64_t a1, id *a2)
{
  char v3 = sub_234E0BDC0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_234DF7A84@<X0>(uint64_t *a1@<X8>)
{
  sub_234E0BDD0();
  uint64_t v2 = sub_234E0BDA0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_234DF7AC8(uint64_t a1, uint64_t a2)
{
  return sub_234DF7AE0(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_234DF7AE0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_234E0BDD0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_234DF7B24()
{
  sub_234E0BDD0();
  sub_234E0BE20();
  return swift_bridgeObjectRelease();
}

uint64_t sub_234DF7B78()
{
  sub_234E0BDD0();
  sub_234E0C0A0();
  sub_234E0BE20();
  uint64_t v0 = sub_234E0C0C0();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_234DF7BEC(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_234DF7BF8()
{
  unint64_t result = qword_2687ED748;
  if (!qword_2687ED748)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2687ED748);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ReplyLayoutValues(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_234DF7C78(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_234DF7C98(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for Key(uint64_t a1)
{
}

uint64_t sub_234DF7CEC()
{
  uint64_t v0 = sub_234E0BDD0();
  uint64_t v2 = v1;
  if (v0 == sub_234E0BDD0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_234E0C060();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_234DF7D78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_234E0BDA0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_234DF7DC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_234E0BDD0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_234DF7DEC(uint64_t a1)
{
  uint64_t v2 = sub_234DF7EEC((unint64_t *)&qword_2687ED778);
  uint64_t v3 = sub_234DF7EEC(&qword_2687ED780);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_234DF7E84()
{
  return sub_234DF7EEC(&qword_2687ED760);
}

uint64_t sub_234DF7EB8()
{
  return sub_234DF7EEC(&qword_2687ED768);
}

uint64_t sub_234DF7EEC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_234DF7F30()
{
  return sub_234DF7EEC(&qword_2687ED770);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_234DF7F78(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void **sub_234DF7FCC(void **a1, void **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    id v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    id v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    id v10 = (char *)a2 + v8;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    *(void *)uint64_t v9 = *(void **)((char *)a2 + v8);
    *((void *)v9 + 1) = v11;
    v9[16] = *((unsigned char *)a2 + v8 + 16);
    id v12 = (int *)type metadata accessor for Reply();
    uint64_t v13 = v12[6];
    long long v39 = &v10[v13];
    long long v40 = &v9[v13];
    uint64_t v14 = sub_234E0BCA0();
    long long v38 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
    uint64_t v15 = v4;
    swift_bridgeObjectRetain();
    v38(v40, v39, v14);
    uint64_t v16 = v12[7];
    long long v17 = &v9[v16];
    long long v18 = &v10[v16];
    uint64_t v19 = *((void *)v18 + 1);
    *(void *)long long v17 = *(void *)v18;
    *((void *)v17 + 1) = v19;
    uint64_t v20 = v12[8];
    uint64_t v21 = &v9[v20];
    id v22 = &v10[v20];
    uint64_t v23 = sub_234E0BC50();
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
    swift_bridgeObjectRetain();
    v24(v21, v22, v23);
    uint64_t v25 = a3[6];
    uint64_t v26 = a3[7];
    uint64_t v27 = *(void **)((char *)a2 + v25);
    *(void **)((char *)v7 + v25) = v27;
    id v28 = *(void **)((char *)a2 + v26);
    *(void **)((char *)v7 + v26) = v28;
    uint64_t v29 = a3[8];
    uint64_t v30 = a3[9];
    v31 = *(void **)((char *)a2 + v29);
    *(void **)((char *)v7 + v29) = v31;
    v32 = *(void **)((char *)a2 + v30);
    *(void **)((char *)v7 + v30) = v32;
    id v33 = v27;
    id v34 = v28;
    id v35 = v31;
    id v36 = v32;
  }
  return v7;
}

void sub_234DF819C(id *a1, int *a2)
{
  uint64_t v4 = (char *)a1 + a2[5];
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for Reply();
  id v6 = &v4[*(int *)(v5 + 24)];
  uint64_t v7 = sub_234E0BCA0();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = &v4[*(int *)(v5 + 32)];
  uint64_t v9 = sub_234E0BC50();
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  id v10 = *(id *)((char *)a1 + a2[9]);
}

void **sub_234DF82C0(void **a1, void **a2, int *a3)
{
  id v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(uint64_t *)((char *)a2 + v7 + 8);
  *(void *)uint64_t v8 = *(void **)((char *)a2 + v7);
  *((void *)v8 + 1) = v10;
  v8[16] = *((unsigned char *)a2 + v7 + 16);
  uint64_t v11 = (int *)type metadata accessor for Reply();
  uint64_t v12 = v11[6];
  long long v38 = &v9[v12];
  long long v39 = &v8[v12];
  uint64_t v13 = sub_234E0BCA0();
  v37 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
  id v14 = v6;
  swift_bridgeObjectRetain();
  v37(v39, v38, v13);
  uint64_t v15 = v11[7];
  uint64_t v16 = &v8[v15];
  long long v17 = &v9[v15];
  uint64_t v18 = *((void *)v17 + 1);
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = v18;
  uint64_t v19 = v11[8];
  uint64_t v20 = &v8[v19];
  uint64_t v21 = &v9[v19];
  uint64_t v22 = sub_234E0BC50();
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
  swift_bridgeObjectRetain();
  v23(v20, v21, v22);
  uint64_t v24 = a3[6];
  uint64_t v25 = a3[7];
  uint64_t v26 = *(void **)((char *)a2 + v24);
  *(void **)((char *)a1 + v24) = v26;
  uint64_t v27 = *(void **)((char *)a2 + v25);
  *(void **)((char *)a1 + v25) = v27;
  uint64_t v28 = a3[8];
  uint64_t v29 = a3[9];
  uint64_t v30 = *(void **)((char *)a2 + v28);
  *(void **)((char *)a1 + v28) = v30;
  v31 = *(void **)((char *)a2 + v29);
  *(void **)((char *)a1 + v29) = v31;
  id v32 = v26;
  id v33 = v27;
  id v34 = v30;
  id v35 = v31;
  return a1;
}

void **sub_234DF8444(void **a1, void **a2, int *a3)
{
  id v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  *(void *)uint64_t v10 = *(void **)((char *)a2 + v9);
  *((void *)v10 + 1) = *(void **)((char *)a2 + v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[16] = v11[16];
  uint64_t v12 = (int *)type metadata accessor for Reply();
  uint64_t v13 = v12[6];
  id v14 = &v10[v13];
  uint64_t v15 = &v11[v13];
  uint64_t v16 = sub_234E0BCA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  uint64_t v17 = v12[7];
  uint64_t v18 = &v10[v17];
  uint64_t v19 = &v11[v17];
  *(void *)uint64_t v18 = *(void *)v19;
  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = v12[8];
  uint64_t v21 = &v10[v20];
  uint64_t v22 = &v11[v20];
  uint64_t v23 = sub_234E0BC50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  uint64_t v24 = a3[6];
  uint64_t v25 = *(void **)((char *)a2 + v24);
  uint64_t v26 = *(void **)((char *)a1 + v24);
  *(void **)((char *)a1 + v24) = v25;
  id v27 = v25;

  uint64_t v28 = a3[7];
  uint64_t v29 = *(void **)((char *)a2 + v28);
  uint64_t v30 = *(void **)((char *)a1 + v28);
  *(void **)((char *)a1 + v28) = v29;
  id v31 = v29;

  uint64_t v32 = a3[8];
  id v33 = *(void **)((char *)a2 + v32);
  id v34 = *(void **)((char *)a1 + v32);
  *(void **)((char *)a1 + v32) = v33;
  id v35 = v33;

  uint64_t v36 = a3[9];
  v37 = *(void **)((char *)a1 + v36);
  long long v38 = *(void **)((char *)a2 + v36);
  *(void **)((char *)a1 + v36) = v38;
  id v39 = v38;

  return a1;
}

void *sub_234DF85F8(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  *(_OWORD *)uint64_t v7 = *(_OWORD *)((char *)a2 + v6);
  v7[16] = *((unsigned char *)a2 + v6 + 16);
  uint64_t v9 = (int *)type metadata accessor for Reply();
  uint64_t v10 = v9[6];
  uint64_t v11 = &v7[v10];
  uint64_t v12 = &v8[v10];
  uint64_t v13 = sub_234E0BCA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  *(_OWORD *)&v7[v9[7]] = *(_OWORD *)&v8[v9[7]];
  uint64_t v14 = v9[8];
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  uint64_t v17 = sub_234E0BC50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  uint64_t v18 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v18) = *(void *)((char *)a2 + v18);
  uint64_t v19 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *(void *)((char *)a1 + v19) = *(void *)((char *)a2 + v19);
  return a1;
}

void **sub_234DF8730(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a3[5];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(uint64_t *)((char *)a2 + v7 + 8);
  *(void *)id v8 = *(void **)((char *)a2 + v7);
  *((void *)v8 + 1) = v10;
  swift_bridgeObjectRelease();
  v8[16] = v9[16];
  uint64_t v11 = (int *)type metadata accessor for Reply();
  uint64_t v12 = v11[6];
  uint64_t v13 = &v8[v12];
  uint64_t v14 = &v9[v12];
  uint64_t v15 = sub_234E0BCA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = v11[7];
  uint64_t v17 = &v8[v16];
  uint64_t v18 = &v9[v16];
  uint64_t v20 = *(void *)v18;
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)uint64_t v17 = v20;
  *((void *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = v11[8];
  uint64_t v22 = &v8[v21];
  uint64_t v23 = &v9[v21];
  uint64_t v24 = sub_234E0BC50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 40))(v22, v23, v24);
  uint64_t v25 = a3[6];
  uint64_t v26 = *(void **)((char *)a1 + v25);
  *(void **)((char *)a1 + v25) = *(void **)((char *)a2 + v25);

  uint64_t v27 = a3[7];
  uint64_t v28 = *(void **)((char *)a1 + v27);
  *(void **)((char *)a1 + v27) = *(void **)((char *)a2 + v27);

  uint64_t v29 = a3[8];
  uint64_t v30 = *(void **)((char *)a1 + v29);
  *(void **)((char *)a1 + v29) = *(void **)((char *)a2 + v29);

  uint64_t v31 = a3[9];
  uint64_t v32 = *(void **)((char *)a1 + v31);
  *(void **)((char *)a1 + v31) = *(void **)((char *)a2 + v31);

  return a1;
}

uint64_t sub_234DF88B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_234DF88C4);
}

uint64_t sub_234DF88C4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Reply();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_234DF8974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_234DF8988);
}

void *sub_234DF8988(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Reply();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for WorkoutRenderer()
{
  uint64_t result = qword_2687ED910;
  if (!qword_2687ED910) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_234DF8A7C()
{
  uint64_t result = type metadata accessor for Reply();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_234DF8B28(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  uint64_t v6 = type metadata accessor for WorkoutRenderer();
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v109 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v9 = a1;
  v122 = (int *)v7;
  sub_234DF9E1C(a2, (uint64_t)&v9[*(int *)(v7 + 20)]);
  uint64_t v10 = qword_2687ED728;
  id v11 = a1;
  if (v10 != -1) {
    swift_once();
  }
  sub_234DF9E80((uint64_t)&qword_2687EE0B8, (uint64_t)v128);
  uint64_t v12 = v129;
  uint64_t v13 = v130;
  __swift_project_boxed_opaque_existential_1(v128, v129);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v13 + 8))(v124, v12, v13);
  id v14 = objc_msgSend(v11, sel_hkWorkoutFromFriendWorkout);
  if (!v14) {
    goto LABEL_40;
  }
  uint64_t v15 = v14;
  id v110 = objc_msgSend(v14, sel_workoutActivityType);
  if (v110 == (id)84)
  {
    id v16 = objc_msgSend(self, sel_diveColors);
    if (!v16)
    {
      __break(1u);
      goto LABEL_43;
    }
    uint64_t v17 = v16;
    id v18 = objc_msgSend(v16, sel_nonGradientTextColor);

    if (v18) {
      goto LABEL_9;
    }
    __break(1u);
  }
  id v19 = objc_msgSend(self, sel_metricColorsForGoalTypeIdentifier_, objc_msgSend(v11, sel_goalType));
  id v18 = objc_msgSend(v19, sel_nonGradientTextColor);

  if (!v18)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
LABEL_9:
  uint64_t v20 = v129;
  uint64_t v21 = v130;
  __swift_project_boxed_opaque_existential_1(v128, v129);
  char v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 40))(v20, v21);
  uint64_t v119 = a2;
  v120 = v15;
  id v117 = v11;
  uint64_t v118 = a3;
  id v116 = v18;
  if ((v22 & 1) == 0)
  {
    id v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
    v111 = 0;
    v112 = 0;
    v52 = v122;
    *(void *)&v9[v122[6]] = v53;
LABEL_14:
    uint64_t v54 = v129;
    uint64_t v55 = v130;
    __swift_project_boxed_opaque_existential_1(v128, v129);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 96))(a2, v54, v55);
    id v56 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    *(void *)&v9[v52[7]] = v56;
    uint64_t v57 = v129;
    uint64_t v58 = v130;
    __swift_project_boxed_opaque_existential_1(v128, v129);
    v121 = v9;
    v59 = *(uint64_t (**)(uint64_t, uint64_t))(v58 + 24);
    id v60 = v56;
    uint64_t v61 = v59(v57, v58);
    sub_234DF97FC(v61);
    swift_bridgeObjectRelease();
    id v62 = objc_allocWithZone(MEMORY[0x263F086A0]);
    v63 = (void *)sub_234E0BDA0();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    v65 = v64;
    unint64_t v114 = sub_234DF9F28();
    id v115 = v65;
    uint64_t v113 = MEMORY[0x263F8EE58] + 8;
    v66 = (void *)sub_234E0BD90();
    swift_bridgeObjectRelease();
    id v67 = objc_msgSend(v62, sel_initWithString_attributes_, v63, v66);

    objc_msgSend(v60, sel_setAttributedText_, v67);
    objc_msgSend(v60, sel_setNumberOfLines_, 1);
    v68 = v120;
    _HKWorkoutIsIndoor(v120);
    objc_msgSend(v68, sel_workoutActivityType);
    objc_msgSend(v68, sel_fi_swimmingLocationType);
    id v69 = (id)FILocalizedNameForActivityType();
    if (v69)
    {
      v70 = v69;
      sub_234E0BDD0();

      id v71 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
      *(void *)&v121[v122[8]] = v71;
      uint64_t v73 = v129;
      uint64_t v72 = v130;
      __swift_project_boxed_opaque_existential_1(v128, v129);
      v74 = *(uint64_t (**)(uint64_t, uint64_t))(v72 + 32);
      id v75 = v71;
      uint64_t v76 = v74(v73, v72);
      sub_234DF97FC(v76);
      swift_bridgeObjectRelease();
      id v77 = objc_allocWithZone(MEMORY[0x263F086A0]);
      v78 = (void *)sub_234E0BDA0();
      swift_bridgeObjectRelease();
      v79 = (void *)sub_234E0BD90();
      swift_bridgeObjectRelease();
      id v80 = objc_msgSend(v77, sel_initWithString_attributes_, v78, v79);

      objc_msgSend(v75, sel_setAttributedText_, v80);
      objc_msgSend(v75, sel_setNumberOfLines_, 2);
      if ((v127 & 1) == 0)
      {

        sub_234DF9FE8((uint64_t)v124);
        sub_234DFA014(v119);
        uint64_t v81 = (uint64_t)v121;
        *(void *)&v121[v122[9]] = 0;
        uint64_t v82 = v118;
LABEL_38:
        uint64_t v108 = (uint64_t)v111;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v128);
        sub_234DFA0C0(v81, v82);
        sub_234DFA124(v108);
        return;
      }
      id v83 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A410]), sel_init);
      id v84 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3F180]), sel_initWithHealthStore_, v83);
      id v85 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3F170]), sel_initWithUnitManager_, v84);
      id v86 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
      v87 = v86;
      *(void *)&v121[v122[9]] = v86;
      if (v110 == (id)84)
      {
        if (v85)
        {
          id v88 = v85;
          objc_msgSend(v120, sel_duration);
          id v89 = objc_msgSend(v88, sel_stringWithDuration_durationFormat_, 2);

          if (v89)
          {
            sub_234E0BDD0();
            uint64_t v91 = v90;

            id v92 = 0;
            goto LABEL_29;
          }
          id v92 = 0;
          goto LABEL_28;
        }
      }
      else if (v85)
      {
        v123[0] = 0;
        id v93 = objc_msgSend(v85, sel_localizedGoalDescriptionForWorkout_withValue_appendActivityType_, v120, v123, 0);
        id v94 = v123[0];
        if (v93)
        {
          v95 = v93;
          sub_234E0BDD0();
          uint64_t v91 = v96;
          id v92 = v94;

          goto LABEL_29;
        }
        id v92 = v123[0];
LABEL_28:
        uint64_t v91 = 0;
LABEL_29:
        if (v87) {
          goto LABEL_30;
        }
        goto LABEL_25;
      }
      id v92 = 0;
      uint64_t v91 = 0;
      if (v86)
      {
LABEL_30:
        id v98 = v87;
        if (v91)
        {
          v99 = (void *)sub_234E0BDA0();
          swift_bridgeObjectRelease();
        }
        else
        {
          v99 = 0;
        }
        uint64_t v100 = v119;
        id v101 = v117;
        objc_msgSend(v87, sel_setText_, v99);

        objc_msgSend(v87, sel_setNumberOfLines_, 1);
        if (v110 == (id)84)
        {
          v102 = self;
          id v103 = v87;
          id v104 = objc_msgSend(v102, sel_metricColorsForGoalTypeIdentifier_, 2);
          id v105 = objc_msgSend(v104, sel_nonGradientTextColor);

          id v106 = v116;
        }
        else
        {
          id v107 = v87;
          id v106 = v116;
          id v105 = v116;
        }
        objc_msgSend(v87, sel_setTextColor_, v105);

        objc_msgSend(v87, sel_setFont_, v126);
        sub_234DF9FE8((uint64_t)v124);

        uint64_t v97 = v100;
        goto LABEL_37;
      }
LABEL_25:

      swift_bridgeObjectRelease();
      sub_234DF9FE8((uint64_t)v124);

      uint64_t v97 = v119;
LABEL_37:
      sub_234DFA014(v97);

      uint64_t v82 = v118;
      uint64_t v81 = (uint64_t)v121;
      goto LABEL_38;
    }
LABEL_41:
    __break(1u);
  }
  uint64_t v23 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x263F23970]), sel_initWithNumberOfRings_, 1);
  id v24 = objc_allocWithZone(MEMORY[0x263F23980]);
  v121 = v23;
  id v25 = objc_msgSend(v24, sel_initWithRingGroupController_, v23);
  objc_msgSend(v15, sel_fiui_completionFactor);
  double v27 = v26;
  uint64_t v28 = self;
  id v115 = v25;
  id v29 = objc_msgSend(v28, sel_renderSingleRingUsingRingsView_forPercentage_withDiameter_thickness_topColor_bottomColor_, v25, v18, v18, v27, *(double *)&v124[9], *(double *)&v124[16]);
  id v30 = objc_msgSend(v15, sel_fiui_activityType);
  id v31 = (id)FIUIStaticWorkoutIconImage();

  if (v31)
  {
    id v32 = objc_msgSend(v31, sel_imageWithRenderingMode_, 2);

    id v33 = objc_msgSend(v32, sel_imageWithTintColor_, v18);
    objc_msgSend(v29, sel_size);
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    v132.origin.CGFloat x = 0.0;
    v132.origin.CGFloat y = 0.0;
    v132.size.CGFloat width = v35;
    v132.size.CGFloat height = v37;
    CGRect v133 = CGRectInset(v132, v125, v125);
    CGFloat x = v133.origin.x;
    CGFloat y = v133.origin.y;
    CGFloat width = v133.size.width;
    CGFloat height = v133.size.height;
    objc_msgSend(v29, sel_size);
    id v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827A0]), sel_initWithSize_, v42, v43);
    uint64_t v45 = (CGFloat *)swift_allocObject();
    v45[3] = 0.0;
    v45[4] = 0.0;
    *((void *)v45 + 2) = v29;
    v45[5] = v35;
    v45[6] = v37;
    *((void *)v45 + 7) = v33;
    v45[8] = x;
    v45[9] = y;
    v45[10] = width;
    v45[11] = height;
    v46 = (void *)swift_allocObject();
    void v46[2] = sub_234DFA174;
    v46[3] = v45;
    v123[4] = sub_234DFA1FC;
    v123[5] = v46;
    v123[0] = (id)MEMORY[0x263EF8330];
    v123[1] = (id)1107296256;
    v123[2] = sub_234DF97B0;
    v123[3] = &block_descriptor;
    v47 = _Block_copy(v123);
    id v48 = v29;
    id v49 = v33;
    swift_retain();
    swift_release();
    id v50 = objc_msgSend(v44, sel_imageWithActions_, v47);
    _Block_release(v47);
    LOBYTE(v47) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v47 & 1) == 0)
    {
      v112 = v45;
      id v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v50);
      v52 = v122;
      *(void *)&v9[v122[6]] = v51;
      objc_msgSend(v51, sel_setContentMode_, 1);

      v111 = sub_234DFA174;
      a2 = v119;
      goto LABEL_14;
    }
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_44:
  __break(1u);
}

void sub_234DF97B0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_234DF97FC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED928);
    uint64_t v2 = sub_234E0C030();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v28 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v28 << 6);
      goto LABEL_28;
    }
    int64_t v11 = v28 + 1;
    if (__OFADD__(v28, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v26) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v11);
    int64_t v13 = v28 + 1;
    if (!v12)
    {
      int64_t v13 = v28 + 2;
      if (v28 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v12 = *(void *)(v27 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v28 + 3;
        if (v28 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v12 = *(void *)(v27 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v28 + 4;
          if (v28 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v12 = *(void *)(v27 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v28 = v13;
LABEL_28:
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8 * v10);
    *(void *)&v31[0] = *(void *)(*(void *)(a1 + 48) + 8 * v10);
    *(void *)&v30[0] = v15;
    id v16 = *(id *)&v31[0];
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v17 = *(void *)&v31[0];
    sub_234DFA23C((_OWORD *)((char *)v31 + 8), v29);
    sub_234DFA23C(v29, v31);
    sub_234DFA23C(v31, v30);
    sub_234E0BDD0();
    sub_234E0C0A0();
    sub_234E0BE20();
    uint64_t v18 = sub_234E0C0C0();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = v18 & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v8 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v8 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v8) = v17;
    uint64_t result = (uint64_t)sub_234DFA23C(v30, (_OWORD *)(*(void *)(v2 + 56) + 32 * v8));
    ++*(void *)(v2 + 16);
  }
  int64_t v14 = v28 + 5;
  if (v28 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_234DFA24C();
    return v2;
  }
  unint64_t v12 = *(void *)(v27 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v28 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_234DF9BA4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED920);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_234E0E160;
  uint64_t v2 = (int *)type metadata accessor for WorkoutRenderer();
  uint64_t v3 = *(void **)(v0 + v2[7]);
  *(void *)(v1 + 32) = v3;
  uint64_t v4 = *(void **)(v0 + v2[8]);
  *(void *)(v1 + 40) = v4;
  sub_234E0BE90();
  unint64_t v5 = *(void **)(v0 + v2[9]);
  if (v5)
  {
    id v6 = v5;
    id v7 = v3;
    id v8 = v4;
    uint64_t v9 = swift_bridgeObjectRetain();
    MEMORY[0x237DD1BC0](v9);
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_234E0BEA0();
    }
    sub_234E0BEB0();
    sub_234E0BE90();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = v3;
    id v11 = v4;
  }
  return v1;
}

id sub_234DF9CE0(uint64_t a1)
{
  return *(id *)(v1 + *(int *)(a1 + 24));
}

void sub_234DF9CF0()
{
  id v1 = objc_msgSend(*v0, sel_endDate);
  sub_234E0BC30();
}

uint64_t sub_234DF9D50()
{
  return 0;
}

uint64_t sub_234DF9D58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = v4 + *(int *)(type metadata accessor for Reply() + 24);
  uint64_t v6 = sub_234E0BCA0();
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  return v7(a2, v5, v6);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_234DF9E1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Reply();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_234DF9E80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_234DF9F28()
{
  unint64_t result = qword_2687ED778;
  if (!qword_2687ED778)
  {
    type metadata accessor for Key(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687ED778);
  }
  return result;
}

uint64_t _HKWorkoutIsIndoor(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 metadata];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F09AA0]];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

uint64_t sub_234DF9FE8(uint64_t a1)
{
  return a1;
}

uint64_t sub_234DFA014(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Reply();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_234DFA0C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WorkoutRenderer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_234DFA124(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_234DFA134()
{
  return MEMORY[0x270FA0238](v0, 96, 7);
}

id sub_234DFA174()
{
  uint64_t v1 = *(void **)(v0 + 56);
  double v2 = *(double *)(v0 + 64);
  double v3 = *(double *)(v0 + 72);
  double v4 = *(double *)(v0 + 80);
  double v5 = *(double *)(v0 + 88);
  objc_msgSend(*(id *)(v0 + 16), sel_drawInRect_, *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
  return objc_msgSend(v1, sel_drawInRect_, v2, v3, v4, v5);
}

uint64_t sub_234DFA1EC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_234DFA1FC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

_OWORD *sub_234DFA23C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_234DFA24C()
{
  return swift_release();
}

char *sub_234DFA254(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  double v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    id v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    id v7 = a1;
    id v8 = a2[1];
    *((void *)a1 + 1) = v8;
    uint64_t v9 = a3[6];
    id v10 = &a1[v9];
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = *(uint64_t *)((char *)a2 + v9 + 8);
    *(void *)id v10 = *(char **)((char *)a2 + v9);
    *((void *)v10 + 1) = v12;
    v10[16] = *((unsigned char *)a2 + v9 + 16);
    int64_t v13 = (int *)type metadata accessor for Reply();
    uint64_t v14 = v13[6];
    uint64_t v38 = v11 + v14;
    id v39 = &v10[v14];
    uint64_t v15 = sub_234E0BCA0();
    CGFloat v37 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
    id v16 = v4;
    uint64_t v17 = v8;
    swift_bridgeObjectRetain();
    v37(v39, v38, v15);
    uint64_t v18 = v13[7];
    uint64_t v19 = &v10[v18];
    unint64_t v20 = (void *)(v11 + v18);
    uint64_t v21 = v20[1];
    *(void *)uint64_t v19 = *v20;
    *((void *)v19 + 1) = v21;
    uint64_t v22 = v13[8];
    unint64_t v23 = &v10[v22];
    uint64_t v24 = v11 + v22;
    uint64_t v25 = sub_234E0BC50();
    int64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16);
    swift_bridgeObjectRetain();
    v26(v23, v24, v25);
    uint64_t v27 = a3[7];
    uint64_t v28 = a3[8];
    id v29 = *(char **)((char *)a2 + v27);
    *(void *)&v7[v27] = v29;
    id v30 = *(char **)((char *)a2 + v28);
    *(void *)&v7[v28] = v30;
    uint64_t v31 = a3[9];
    id v32 = *(char **)((char *)a2 + v31);
    *(void *)&v7[v31] = v32;
    id v33 = v29;
    id v34 = v30;
    id v35 = v32;
  }
  return v7;
}

void sub_234DFA420(id *a1, int *a2)
{
  double v4 = (char *)a1 + a2[6];
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for Reply();
  uint64_t v6 = &v4[*(int *)(v5 + 24)];
  uint64_t v7 = sub_234E0BCA0();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  id v8 = &v4[*(int *)(v5 + 32)];
  uint64_t v9 = sub_234E0BC50();
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  id v10 = *(id *)((char *)a1 + a2[9]);
}

void *sub_234DFA540(void *a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v6 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *(void *)id v8 = *(void *)(a2 + v7);
  *((void *)v8 + 1) = v10;
  v8[16] = *(unsigned char *)(a2 + v7 + 16);
  uint64_t v11 = (int *)type metadata accessor for Reply();
  uint64_t v12 = v11[6];
  uint64_t v36 = v9 + v12;
  CGFloat v37 = &v8[v12];
  uint64_t v13 = sub_234E0BCA0();
  id v35 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  id v14 = v5;
  id v15 = v6;
  swift_bridgeObjectRetain();
  v35(v37, v36, v13);
  uint64_t v16 = v11[7];
  uint64_t v17 = &v8[v16];
  uint64_t v18 = (void *)(v9 + v16);
  uint64_t v19 = v18[1];
  *(void *)uint64_t v17 = *v18;
  *((void *)v17 + 1) = v19;
  uint64_t v20 = v11[8];
  uint64_t v21 = &v8[v20];
  uint64_t v22 = v9 + v20;
  uint64_t v23 = sub_234E0BC50();
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16);
  swift_bridgeObjectRetain();
  v24(v21, v22, v23);
  uint64_t v25 = a3[7];
  uint64_t v26 = a3[8];
  uint64_t v27 = *(void **)(a2 + v25);
  *(void *)((char *)a1 + v25) = v27;
  uint64_t v28 = *(void **)(a2 + v26);
  *(void *)((char *)a1 + v26) = v28;
  uint64_t v29 = a3[9];
  id v30 = *(void **)(a2 + v29);
  *(void *)((char *)a1 + v29) = v30;
  id v31 = v27;
  id v32 = v28;
  id v33 = v30;
  return a1;
}

uint64_t sub_234DFA6C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  uint64_t v9 = *(void **)(a2 + 8);
  uint64_t v10 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v9;
  id v11 = v9;

  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(void *)uint64_t v13 = *(void *)(a2 + v12);
  *(void *)(v13 + 8) = *(void *)(a2 + v12 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v13 + 16) = *(unsigned char *)(v14 + 16);
  id v15 = (int *)type metadata accessor for Reply();
  uint64_t v16 = v15[6];
  uint64_t v17 = v13 + v16;
  uint64_t v18 = v14 + v16;
  uint64_t v19 = sub_234E0BCA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  uint64_t v20 = v15[7];
  uint64_t v21 = (void *)(v13 + v20);
  uint64_t v22 = (void *)(v14 + v20);
  void *v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = v15[8];
  uint64_t v24 = v13 + v23;
  uint64_t v25 = v14 + v23;
  uint64_t v26 = sub_234E0BC50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 24))(v24, v25, v26);
  uint64_t v27 = a3[7];
  uint64_t v28 = *(void **)(a2 + v27);
  uint64_t v29 = *(void **)(a1 + v27);
  *(void *)(a1 + v27) = v28;
  id v30 = v28;

  uint64_t v31 = a3[8];
  id v32 = *(void **)(a2 + v31);
  id v33 = *(void **)(a1 + v31);
  *(void *)(a1 + v31) = v32;
  id v34 = v32;

  uint64_t v35 = a3[9];
  uint64_t v36 = *(void **)(a2 + v35);
  CGFloat v37 = *(void **)(a1 + v35);
  *(void *)(a1 + v35) = v36;
  id v38 = v36;

  return a1;
}

_OWORD *sub_234DFA874(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  *(_OWORD *)uint64_t v7 = *(_OWORD *)((char *)a2 + v6);
  v7[16] = *((unsigned char *)a2 + v6 + 16);
  uint64_t v9 = (int *)type metadata accessor for Reply();
  uint64_t v10 = v9[6];
  id v11 = &v7[v10];
  uint64_t v12 = &v8[v10];
  uint64_t v13 = sub_234E0BCA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  *(_OWORD *)&v7[v9[7]] = *(_OWORD *)&v8[v9[7]];
  uint64_t v14 = v9[8];
  id v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  uint64_t v17 = sub_234E0BC50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  uint64_t v18 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v18) = *(void *)((char *)a2 + v18);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  return a1;
}

uint64_t sub_234DFA9A4(uint64_t a1, void *a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = a2[1];

  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = *(void *)((char *)a2 + v8 + 8);
  *(void *)uint64_t v9 = *(void *)((char *)a2 + v8);
  *(void *)(v9 + 8) = v11;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v9 + 16) = v10[16];
  uint64_t v12 = (int *)type metadata accessor for Reply();
  uint64_t v13 = v12[6];
  uint64_t v14 = v9 + v13;
  id v15 = &v10[v13];
  uint64_t v16 = sub_234E0BCA0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  uint64_t v17 = v12[7];
  uint64_t v18 = (void *)(v9 + v17);
  uint64_t v19 = &v10[v17];
  uint64_t v21 = *(void *)v19;
  uint64_t v20 = *((void *)v19 + 1);
  void *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = v12[8];
  uint64_t v23 = v9 + v22;
  uint64_t v24 = &v10[v22];
  uint64_t v25 = sub_234E0BC50();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v25 - 8) + 40))(v23, v24, v25);
  uint64_t v26 = a3[7];
  uint64_t v27 = *(void **)(a1 + v26);
  *(void *)(a1 + v26) = *(void *)((char *)a2 + v26);

  uint64_t v28 = a3[8];
  uint64_t v29 = *(void **)(a1 + v28);
  *(void *)(a1 + v28) = *(void *)((char *)a2 + v28);

  uint64_t v30 = a3[9];
  uint64_t v31 = *(void **)(a1 + v30);
  *(void *)(a1 + v30) = *(void *)((char *)a2 + v30);

  return a1;
}

uint64_t sub_234DFAB20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_234DFAB34);
}

uint64_t sub_234DFAB34(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Reply();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_234DFABE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_234DFABF8);
}

void *sub_234DFABF8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Reply();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for CompetitionAcceptedRenderer()
{
  uint64_t result = qword_2687ED930;
  if (!qword_2687ED930) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_234DFACEC()
{
  uint64_t result = type metadata accessor for Reply();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_234DFAD8C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = sub_234E0BC50();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v108 = (char *)&v88 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED948);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  id v106 = (char *)&v88 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v88 - v14;
  *a4 = a1;
  uint64_t v109 = (int *)type metadata accessor for CompetitionAcceptedRenderer();
  sub_234DF9E1C(a2, (uint64_t)a4 + v109[6]);
  id v110 = a4;
  a4[1] = a3;
  uint64_t v16 = qword_2687ED728;
  id v17 = a1;
  id v103 = a3;
  if (v16 != -1) {
    swift_once();
  }
  sub_234DF9E80((uint64_t)&qword_2687EE0B8, (uint64_t)v111);
  uint64_t v18 = v112;
  uint64_t v19 = v113;
  __swift_project_boxed_opaque_existential_1(v111, v112);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v19 + 8))(v114, v18, v19);
  objc_msgSend(v17, sel_victoryBadgeStyle);
  type metadata accessor for Reply();
  uint64_t v20 = (void *)sub_234E0BC70();
  id v21 = (id)ASEphemeralCompetitionVictoryAchievementForStyle();

  id v22 = objc_msgSend(v17, sel_endDate);
  if (!v22)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v15, 1, 1, v8);
    goto LABEL_13;
  }
  uint64_t v23 = v22;
  uint64_t v98 = a2;
  uint64_t v24 = v108;
  sub_234E0BC30();

  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  uint64_t v102 = v9 + 32;
  id v101 = v25;
  v25(v15, v24, v8);
  uint64_t v26 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  uint64_t v105 = v9 + 56;
  id v104 = v26;
  v26(v15, 0, 1, v8);
  uint64_t v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
  uint64_t v100 = v9 + 48;
  v99 = v27;
  if (v27(v15, 1, v8) == 1)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    uint64_t result = v104(v106, 1, 1, v8);
    goto LABEL_15;
  }
  uint64_t v28 = (void *)sub_234E0BC20();
  id v93 = *(void (**)(char *, uint64_t))(v9 + 8);
  v93(v15, v8);
  id v29 = objc_msgSend(v17, sel_victoryBadgeStyle);
  id v30 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, v29);
  id v97 = v21;
  id v31 = (id)ASEphemeralEarnedAchievement();

  id v95 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F238B0]), sel_init);
  id v96 = v31;
  id v32 = objc_msgSend(v95, sel_thumbnailImageForAchievement_size_, v31, v115, v115);
  id v33 = objc_allocWithZone(MEMORY[0x263F82828]);
  id v94 = v32;
  id v34 = objc_msgSend(v33, sel_initWithImage_, v32);
  *(void *)((char *)v110 + v109[7]) = v34;
  objc_msgSend(v34, sel_setContentMode_, 1);
  type metadata accessor for ReplyBubbleView();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v89 = self;
  uint64_t v90 = ObjCClassFromMetadata;
  id v36 = objc_msgSend(v89, sel_bundleForClass_, ObjCClassFromMetadata);
  CGFloat v37 = (void *)sub_234E0BDA0();
  id v38 = objc_msgSend(v36, sel_localizedStringForKey_value_table_, v37, 0, 0);

  uint64_t v39 = sub_234E0BDD0();
  id v107 = v17;
  unint64_t v40 = v39;
  unint64_t v42 = v41;

  id v43 = objc_msgSend(self, sel_as_lightCompetitionGold);
  uint64_t v44 = v112;
  uint64_t v45 = v113;
  __swift_project_boxed_opaque_existential_1(v111, v112);
  v46 = *(uint64_t (**)(uint64_t, uint64_t))(v45 + 24);
  swift_bridgeObjectRetain();
  uint64_t v47 = v46(v44, v45);
  sub_234DF97FC(v47);
  swift_bridgeObjectRelease();
  id v48 = objc_allocWithZone(MEMORY[0x263F089B8]);
  id v49 = (void *)sub_234E0BDA0();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  uint64_t v51 = v50;
  unint64_t v52 = sub_234DF9F28();
  uint64_t v92 = v51;
  unint64_t v91 = v52;
  id v53 = (void *)sub_234E0BD90();
  swift_bridgeObjectRelease();
  id v54 = objc_msgSend(v48, sel_initWithString_attributes_, v49, v53);

  uint64_t v55 = *MEMORY[0x263F81500];
  uint64_t v56 = HIBYTE(v42) & 0xF;
  if ((v42 & 0x2000000000000000) == 0) {
    uint64_t v56 = v40;
  }
  uint64_t v57 = 7;
  if (((v42 >> 60) & ((v40 & 0x800000000000000) == 0)) != 0) {
    uint64_t v57 = 11;
  }
  unint64_t v58 = sub_234DFBC20(0xFuLL, v57 | (v56 << 16), v40, v42);
  id v59 = v43;
  swift_bridgeObjectRelease();
  objc_msgSend(v54, sel_addAttribute_value_range_, v55, v59, 0, v58);

  id v60 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(void *)((char *)v110 + v109[8]) = v60;
  id v61 = v60;
  objc_msgSend(v61, sel_setAttributedText_, v54);
  objc_msgSend(v61, sel_setNumberOfLines_, v116);
  objc_msgSend(v61, sel_setAllowsDefaultTighteningForTruncation_, 1);
  objc_msgSend(v61, sel_setLineBreakMode_, 4);

  id v62 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  v63 = (void *)sub_234E0BDA0();
  objc_msgSend(v62, sel_setDateFormat_, v63);

  id v64 = objc_msgSend(v107, sel_startDate);
  if (!v64) {
    goto LABEL_14;
  }
  v65 = v64;
  id v88 = v54;
  v66 = v108;
  sub_234E0BC30();

  id v67 = v106;
  v101(v106, v66, v8);
  v104(v67, 0, 1, v8);
  uint64_t result = v99(v67, 1, v8);
  if (result != 1)
  {
    id v69 = (void *)sub_234E0BC20();
    v93(v67, v8);
    id v70 = objc_msgSend(v62, sel_stringFromDate_, v69);

    uint64_t v71 = sub_234E0BDD0();
    uint64_t v73 = v72;

    id v74 = objc_msgSend(v89, sel_bundleForClass_, v90);
    id v75 = (void *)sub_234E0BDA0();
    id v76 = objc_msgSend(v74, sel_localizedStringForKey_value_table_, v75, 0, 0);

    sub_234E0BDD0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
    uint64_t v77 = swift_allocObject();
    *(_OWORD *)(v77 + 16) = xmmword_234E0E1D0;
    *(void *)(v77 + 56) = MEMORY[0x263F8D310];
    *(void *)(v77 + 64) = sub_234DFBE34();
    *(void *)(v77 + 32) = v71;
    *(void *)(v77 + 40) = v73;
    sub_234E0BDE0();
    swift_bridgeObjectRelease();
    id v78 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    *(void *)((char *)v110 + v109[9]) = v78;
    uint64_t v79 = v112;
    uint64_t v80 = v113;
    __swift_project_boxed_opaque_existential_1(v111, v112);
    uint64_t v81 = *(uint64_t (**)(uint64_t, uint64_t))(v80 + 32);
    id v82 = v78;
    uint64_t v83 = v81(v79, v80);
    sub_234DF97FC(v83);
    swift_bridgeObjectRelease();
    id v84 = objc_allocWithZone(MEMORY[0x263F086A0]);
    id v85 = (void *)sub_234E0BDA0();
    swift_bridgeObjectRelease();
    id v86 = (void *)sub_234E0BD90();
    swift_bridgeObjectRelease();
    id v87 = objc_msgSend(v84, sel_initWithString_attributes_, v85, v86);

    objc_msgSend(v82, sel_setAttributedText_, v87);
    objc_msgSend(v82, sel_setNumberOfLines_, 2);
    objc_msgSend(v82, sel_setAllowsDefaultTighteningForTruncation_, 1);
    objc_msgSend(v82, sel_setLineBreakMode_, 4);

    sub_234DF9FE8((uint64_t)v114);
    sub_234DFA014(v98);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v111);
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_234DFB948@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_234E0BCA0();
  uint64_t v16 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED940);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1 + *(int *)(type metadata accessor for CompetitionAcceptedRenderer() + 24);
  if (*(unsigned char *)(v8 + 16) == 1)
  {
    uint64_t v9 = v8 + *(int *)(type metadata accessor for Reply() + 24);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
    return v10(a1, v9, v3);
  }
  else
  {
    id v12 = objc_msgSend(*(id *)(v1 + 8), sel_UUID);
    if (v12)
    {
      uint64_t v13 = v12;
      sub_234E0BC80();

      uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
      v14(v7, v5, v3);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v7, 0, 1, v3);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v7, 1, v3);
      if (result != 1) {
        return ((uint64_t (*)(uint64_t, char *, uint64_t))v14)(a1, v7, v3);
      }
    }
    else
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v7, 1, 1, v3);
    }
    __break(1u);
  }
  return result;
}

id sub_234DFBB84(uint64_t a1)
{
  return *(id *)(v1 + *(int *)(a1 + 28));
}

uint64_t sub_234DFBB90(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED920);
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = *(int *)(a1 + 36);
  uint64_t v5 = *(void **)(v1 + *(int *)(a1 + 32));
  *(_OWORD *)(v3 + 16) = xmmword_234E0E160;
  uint64_t v6 = *(void **)(v1 + v4);
  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 40) = v6;
  uint64_t v10 = v3;
  sub_234E0BE90();
  id v7 = v5;
  id v8 = v6;
  return v10;
}

uint64_t sub_234DFBC14()
{
  return 1;
}

unint64_t sub_234DFBC20(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = sub_234DFC018(a1, a3, a4);
  unint64_t result = sub_234DFC018(a2, a3, a4);
  unint64_t v9 = result >> 14;
  if (v7 >> 14 < result >> 14)
  {
    for (uint64_t i = 0; ; ++i)
    {
      uint64_t v11 = i + 1;
      if (__OFADD__(i, 1)) {
        break;
      }
      if ((a4 & 0x1000000000000000) != 0)
      {
        unint64_t result = sub_234E0BE00();
        unint64_t v7 = result;
      }
      else
      {
        unint64_t v12 = v7 >> 16;
        if ((a4 & 0x2000000000000000) != 0)
        {
          unint64_t v22 = a3;
          uint64_t v23 = a4 & 0xFFFFFFFFFFFFFFLL;
          int v13 = *((unsigned __int8 *)&v22 + v12);
        }
        else
        {
          unint64_t result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a3 & 0x1000000000000000) == 0) {
            unint64_t result = sub_234E0BFF0();
          }
          int v13 = *(unsigned __int8 *)(result + v12);
        }
        int v14 = (char)v13;
        unsigned int v15 = __clz(v13 ^ 0xFF) - 24;
        if (v14 >= 0) {
          LOBYTE(v15) = 1;
        }
        unint64_t v7 = ((v12 + v15) << 16) | 5;
      }
      if (v9 <= v7 >> 14) {
        return v11;
      }
    }
    __break(1u);
LABEL_36:
    __break(1u);
    return result;
  }
  if (v9 < v7 >> 14)
  {
    uint64_t v11 = 0;
    while (!__OFSUB__(v11--, 1))
    {
      if ((a4 & 0x1000000000000000) != 0)
      {
        unint64_t result = sub_234E0BE10();
        unint64_t v7 = result;
      }
      else
      {
        if ((a4 & 0x2000000000000000) != 0)
        {
          unint64_t v22 = a3;
          uint64_t v23 = a4 & 0xFFFFFFFFFFFFFFLL;
          if ((*((unsigned char *)&v22 + (v7 >> 16) - 1) & 0xC0) == 0x80)
          {
            uint64_t v20 = 0;
            do
              int v21 = *((unsigned char *)&v22 + (v7 >> 16) + v20-- - 2) & 0xC0;
            while (v21 == 128);
            uint64_t v19 = 1 - v20;
          }
          else
          {
            uint64_t v19 = 1;
          }
        }
        else
        {
          unint64_t result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a3 & 0x1000000000000000) == 0) {
            unint64_t result = sub_234E0BFF0();
          }
          uint64_t v17 = 0;
          do
            int v18 = *(unsigned char *)(result + (v7 >> 16) - 1 + v17--) & 0xC0;
          while (v18 == 128);
          uint64_t v19 = -v17;
        }
        unint64_t v7 = (v7 - (v19 << 16)) & 0xFFFFFFFFFFFF0000 | 5;
      }
      if (v9 >= v7 >> 14) {
        return v11;
      }
    }
    goto LABEL_36;
  }
  return 0;
}

unint64_t sub_234DFBE34()
{
  unint64_t result = qword_2687ED958;
  if (!qword_2687ED958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687ED958);
  }
  return result;
}

unint64_t sub_234DFBE88(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    unint64_t v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      v13[2] = v3;
      void v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((unsigned char *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            unint64_t v10 = v5 - 1;
            int v11 = *((unsigned char *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          unint64_t v5 = v10;
        }
        return v5 << 16;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 != (a2 & 0xFFFFFFFFFFFFLL))
        {
          do
LABEL_9:
            int v7 = *(unsigned char *)(v6 + v5--) & 0xC0;
          while (v7 == 128);
          ++v5;
        }
      }
      else
      {
        unint64_t v12 = result >> 16;
        uint64_t v6 = sub_234E0BFF0();
        unint64_t v5 = v12;
        if (v12 != v9) {
          goto LABEL_9;
        }
      }
      return v5 << 16;
    }
    uint64_t v8 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v8 = a2 & 0xFFFFFFFFFFFFLL;
    }
    if (v5 != v8)
    {
      return MEMORY[0x270F9E998]();
    }
  }
  return result;
}

uint64_t sub_234DFBF9C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_234E0BE50();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x237DD1BA0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unint64_t sub_234DFC018(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 < result >> 16)
  {
    __break(1u);
LABEL_9:
    unint64_t result = sub_234DFC0B8(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_234DFBE88(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_234DFC0B8(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    unint64_t result = sub_234DFBF9C(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 < result >> 16) {
    __break(1u);
  }
  return result;
}

unint64_t sub_234DFC128(void *a1, uint64_t a2, char a3)
{
  type metadata accessor for Reply();
  MEMORY[0x270FA5388]();
  unint64_t v8 = (char *)&v42[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234DF9E80((uint64_t)a1, (uint64_t)v3 + OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer);
  id v9 = objc_allocWithZone(MEMORY[0x263F82E00]);
  uint64_t v10 = v3;
  id v11 = objc_msgSend(v9, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(void *)&v10[OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_separatorView] = v11;

  uint64_t v41 = a2;
  sub_234DF9E1C(a2, (uint64_t)v8);
  unint64_t v12 = sub_234E052D0((uint64_t)v8, a3);
  uint64_t v13 = qword_2687ED728;
  int v14 = v12;
  if (v13 != -1) {
    swift_once();
  }
  sub_234DF9E80((uint64_t)&qword_2687EE0B8, (uint64_t)v42);
  uint64_t v15 = v43;
  uint64_t v16 = v44;
  __swift_project_boxed_opaque_existential_1(v42, v43);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v16 + 8))(v45, v15, v16);
  uint64_t v17 = OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_separatorView;
  int v18 = *(void **)&v14[OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_separatorView];
  double v19 = *(double *)&v45[6];
  id v20 = objc_allocWithZone(MEMORY[0x263F825C8]);
  id v21 = v18;
  id v22 = objc_msgSend(v20, sel_initWithWhite_alpha_, v19, 1.0);
  objc_msgSend(v21, sel_setBackgroundColor_, v22);

  objc_msgSend(v14, sel_addSubview_, *(void *)&v14[v17]);
  uint64_t v23 = v43;
  uint64_t v24 = v44;
  __swift_project_boxed_opaque_existential_1(v42, v43);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v24 + 40))(v23, v24))
  {
    uint64_t v25 = a1[3];
    uint64_t v26 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v25);
    uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t))(v26 + 8);
    uint64_t v28 = v14;
    id v29 = (void *)v27(v25, v26);
    objc_msgSend(v28, sel_addSubview_, v29);
  }
  uint64_t v30 = a1[3];
  uint64_t v31 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v30);
  unint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 16))(v30, v31);
  unint64_t v33 = result;
  if (result >> 62)
  {
    unint64_t result = sub_234E0C020();
    uint64_t v34 = result;
    if (!result) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v34 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v34) {
      goto LABEL_14;
    }
  }
  if (v34 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v34; ++i)
  {
    if ((v33 & 0xC000000000000001) != 0) {
      id v36 = (id)MEMORY[0x237DD1D30](i, v33);
    }
    else {
      id v36 = *(id *)(v33 + 8 * i + 32);
    }
    CGFloat v37 = v36;
    objc_msgSend(v14, sel_addSubview_, v36);
  }
LABEL_14:
  swift_bridgeObjectRelease();
  if ((v46 & 1) != 0 && (a3 & 1) == 0)
  {
    id v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82938]), sel_initWithTarget_action_, v14, 0);
    objc_msgSend(v14, sel_addGestureRecognizer_, v38);
    id v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CB0]), sel_initWithTarget_action_, v14, 0);
    objc_msgSend(v39, sel_setNumberOfTapsRequired_, 2);
    objc_msgSend(v14, sel_addGestureRecognizer_, v39);
    id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CB0]), sel_initWithTarget_action_, v14, sel_handleTapGesture_);
    objc_msgSend(v40, sel_requireGestureRecognizerToFail_, v39);
    objc_msgSend(v40, sel_requireGestureRecognizerToFail_, v38);
    objc_msgSend(v14, sel_addGestureRecognizer_, v40);
    objc_msgSend(v14, sel_setUserInteractionEnabled_, 1);
  }
  sub_234DF9FE8((uint64_t)v45);
  sub_234DFA014(v41);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return (unint64_t)v14;
}

unint64_t sub_234DFC66C()
{
  uint64_t v1 = v0;
  v238.receiver = v0;
  v238.super_class = (Class)type metadata accessor for ActivityReplyBubbleView();
  objc_msgSendSuper2(&v238, sel_layoutSubviews);
  objc_msgSend(v0, sel_bounds);
  double v3 = v2;
  double v5 = v4;
  unint64_t v6 = (double *)&v0[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_fittingSize];
  unint64_t result = swift_beginAccess();
  if (v3 == *v6 && v5 == v6[1]) {
    return result;
  }
  if (qword_2687ED728 != -1) {
    swift_once();
  }
  sub_234DF9E80((uint64_t)&qword_2687EE0B8, (uint64_t)v235);
  uint64_t v9 = v236;
  uint64_t v10 = v237;
  __swift_project_boxed_opaque_existential_1(v235, v236);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v10 + 8))(v239, v9, v10);
  uint64_t v11 = v236;
  uint64_t v12 = v237;
  __swift_project_boxed_opaque_existential_1(v235, v236);
  objc_msgSend(v1, sel_bounds);
  double v17 = sub_234E098E0(v1[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_reply + 16], v11, v12, v13, v14, v15, v16);
  double v19 = v18;
  double i = v20;
  CGFloat v23 = v22;
  uint64_t v24 = v236;
  uint64_t v25 = v237;
  __swift_project_boxed_opaque_existential_1(v235, v236);
  uint64_t v26 = *(char **)&v1[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_userMessageLabel];
  unint64_t result = (unint64_t)objc_msgSend(v26, sel_font);
  if (!result) {
    goto LABEL_133;
  }
  uint64_t v27 = (void *)result;
  double v28 = (*(double (**)(unint64_t, uint64_t, uint64_t))(v25 + 56))(result, v24, v25);

  v250.origin.CGFloat x = v17;
  v250.origin.CGFloat y = v19;
  v250.size.CGFloat width = i;
  v250.size.double height = v23;
  double MinX = CGRectGetMinX(v250);
  double v222 = v242;
  objc_msgSend(v26, sel__lastLineBaselineFrameOriginY);
  double v30 = v29;
  uint64_t v31 = v236;
  uint64_t v32 = v237;
  __swift_project_boxed_opaque_existential_1(v235, v236);
  char v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 40))(v31, v32);
  double v34 = v240;
  double v35 = v249;
  if (v33) {
    double v36 = v249;
  }
  else {
    double v36 = v240;
  }
  double v217 = v36;
  uint64_t v37 = v236;
  uint64_t v38 = v237;
  __swift_project_boxed_opaque_existential_1(v235, v236);
  LOBYTE(v37) = (*(uint64_t (**)(uint64_t, uint64_t))(v38 + 40))(v37, v38);
  CGFloat rect = v17;
  v251.origin.CGFloat x = v17;
  CGFloat rect_24 = i;
  CGFloat v232 = v19;
  v251.origin.CGFloat y = v19;
  v251.size.CGFloat width = i;
  CGFloat rect_16 = v23;
  v251.size.double height = v23;
  double v39 = CGRectGetMinX(v251);
  double v223 = v34;
  if (v37)
  {
    double v40 = v39 + v245 + v244 + v248;
  }
  else
  {
    double v35 = v34;
    double v40 = v39 + v34;
  }
  v252.origin.CGFloat x = v17;
  v252.size.CGFloat width = i;
  v252.origin.CGFloat y = v19;
  v252.size.double height = v23;
  double MaxX = CGRectGetMaxX(v252);
  unint64_t v42 = &v1[OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer];
  uint64_t v43 = *(void *)&v1[OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer + 24];
  uint64_t v44 = *(void *)&v1[OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer + 32];
  __swift_project_boxed_opaque_existential_1(&v1[OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer], v43);
  unint64_t v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 16))(v43, v44);
  unint64_t v46 = v45;
  if (v45 >> 62)
  {
    unint64_t v47 = sub_234E0C020();
    if (v47) {
      goto LABEL_16;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    id v49 = v26;
    goto LABEL_22;
  }
  unint64_t v47 = *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v47) {
    goto LABEL_21;
  }
LABEL_16:
  if ((v46 & 0xC000000000000001) != 0)
  {
    id v48 = (char *)MEMORY[0x237DD1D30](0, v46);
  }
  else
  {
    if (!*(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_59;
    }
    id v48 = (char *)*(id *)(v46 + 32);
  }
  id v49 = v48;
  swift_bridgeObjectRelease();
LABEL_22:
  uint64_t v50 = v236;
  uint64_t v51 = v237;
  __swift_project_boxed_opaque_existential_1(v235, v236);
  v226 = v49;
  unint64_t result = (unint64_t)objc_msgSend(v49, sel_font);
  if (!result)
  {
LABEL_134:
    __break(1u);
    goto LABEL_135;
  }
  unint64_t v52 = (void *)result;
  double v17 = v28 + v30;
  double v19 = v243;
  double v53 = (*(double (**)(unint64_t, uint64_t, uint64_t))(v51 + 88))(result, v50, v51);

  uint64_t v54 = *((void *)v42 + 3);
  uint64_t v55 = *((void *)v42 + 4);
  __swift_project_boxed_opaque_existential_1(v42, v54);
  unint64_t v56 = (*(uint64_t (**)(uint64_t, uint64_t))(v55 + 16))(v54, v55);
  unint64_t v57 = v56;
  v227 = v26;
  rect_8 = (double *)v1;
  v220 = v6;
  v224 = v42;
  if (v56 >> 62) {
    goto LABEL_54;
  }
  uint64_t v58 = *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10);
  for (double i = v17 + v19; v58; double i = v17 + v19)
  {
    double MaxX = MaxX - v35 - v40;
    double v59 = i + v53;
    double v53 = 1.79769313e308;
    uint64_t v60 = 4;
    while (1)
    {
      id v61 = (v57 & 0xC000000000000001) != 0
          ? (char *)MEMORY[0x237DD1D30](v60 - 4, v57)
          : (char *)*(id *)(v57 + 8 * v60);
      id v62 = v61;
      uint64_t v63 = v60 - 3;
      if (__OFADD__(v60 - 4, 1)) {
        break;
      }
      objc_msgSend(v61, sel_sizeThatFits_, MaxX, 1.79769313e308);
      objc_msgSend(v62, sel_setFrame_, v40, 0.0, fmin(v64, MaxX), v65);
      objc_msgSend(v62, sel__setFirstLineBaselineFrameOriginY_, v59);
      objc_msgSend(v62, sel__lastLineBaselineFrameOriginY);
      double v67 = v66;
      uint64_t v68 = v236;
      uint64_t v69 = v237;
      __swift_project_boxed_opaque_existential_1(v235, v236);
      unint64_t result = (unint64_t)objc_msgSend(v62, sel_font);
      if (!result) {
        goto LABEL_132;
      }
      id v70 = (void *)result;
      double v35 = (*(double (**)(unint64_t, uint64_t, uint64_t))(v69 + 80))(result, v68, v69);

      double v59 = v67 + v35;
      ++v60;
      if (v63 == v58) {
        goto LABEL_32;
      }
    }
    __break(1u);
LABEL_54:
    uint64_t v58 = sub_234E0C020();
  }
LABEL_32:
  swift_bridgeObjectRelease();
  unint64_t v42 = v224;
  uint64_t v71 = *((void *)v224 + 3);
  uint64_t v72 = *((void *)v224 + 4);
  __swift_project_boxed_opaque_existential_1(v224, v71);
  unint64_t v73 = (*(uint64_t (**)(uint64_t, uint64_t))(v72 + 16))(v71, v72);
  unint64_t v46 = v73;
  if (v73 >> 62) {
    uint64_t v74 = sub_234E0C020();
  }
  else {
    uint64_t v74 = *(void *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  double v40 = rect;
  unint64_t v6 = rect_8;
  if (v74)
  {
    BOOL v75 = __OFSUB__(v74, 1);
    unint64_t v47 = v74 - 1;
    if (!v75)
    {
      if ((v46 & 0xC000000000000001) == 0)
      {
        if ((v47 & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (v47 < *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v76 = (char *)*(id *)(v46 + 8 * v47 + 32);
LABEL_40:
          uint64_t v77 = v76;
          swift_bridgeObjectRelease();
          goto LABEL_42;
        }
        __break(1u);
        goto LABEL_63;
      }
LABEL_60:
      id v76 = (char *)MEMORY[0x237DD1D30](v47, v46);
      goto LABEL_40;
    }
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  swift_bridgeObjectRelease();
  uint64_t v77 = v26;
LABEL_42:
  double v218 = v19;
  double v219 = v17;
  uint64_t v78 = v236;
  uint64_t v79 = v237;
  __swift_project_boxed_opaque_existential_1(v235, v236);
  unint64_t result = (unint64_t)objc_msgSend(v77, sel_font);
  if (!result)
  {
LABEL_135:
    __break(1u);
    return result;
  }
  uint64_t v80 = (void *)result;
  double MaxX = (*(double (**)(unint64_t, uint64_t, uint64_t))(v79 + 72))(result, v78, v79);

  uint64_t v81 = v236;
  uint64_t v82 = v237;
  __swift_project_boxed_opaque_existential_1(v235, v236);
  unint64_t v57 = (unint64_t)&selRef__allScores;
  v225 = v77;
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v82 + 40))(v81, v82))
  {
    objc_msgSend(v226, sel__firstLineCapFrameOriginY);
    double v84 = v83;
    objc_msgSend(v77, sel__lastLineBaselineFrameOriginY);
    double v86 = v85;
    double v216 = MaxX;
    double v87 = v244;
    uint64_t v88 = *((void *)v42 + 3);
    uint64_t v89 = *((void *)v42 + 4);
    __swift_project_boxed_opaque_existential_1(v42, v88);
    uint64_t v90 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v89 + 8))(v88, v89);
    objc_msgSend(v90, sel_frame);
    CGFloat v92 = v91;
    CGFloat v94 = v93;
    CGFloat v96 = v95;
    double v215 = i;
    CGFloat v98 = v97;

    v253.origin.CGFloat x = v92;
    v253.origin.CGFloat y = v94;
    v253.size.CGFloat width = v96;
    v253.size.double height = v98;
    CGFloat Width = CGRectGetWidth(v253);
    uint64_t v100 = *((void *)v42 + 3);
    uint64_t v101 = *((void *)v42 + 4);
    double v102 = v87 / Width;
    __swift_project_boxed_opaque_existential_1(v42, v100);
    id v103 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v101 + 8))(v100, v101);
    objc_msgSend(v103, sel_frame);
    CGFloat v105 = v104;
    CGFloat v107 = v106;
    CGFloat v109 = v108;
    CGFloat v111 = v110;

    v254.origin.CGFloat x = v105;
    v254.origin.CGFloat y = v107;
    v254.size.CGFloat width = v109;
    v254.size.double height = v111;
    double v112 = v102 * CGRectGetHeight(v254);
    double v40 = rect;
    v255.origin.CGFloat x = rect;
    v255.size.CGFloat width = rect_24;
    v255.origin.CGFloat y = v232;
    v255.size.double height = rect_16;
    CGFloat v113 = CGRectGetMinX(v255) + v245;
    double v114 = (v84 + v86 - v112) * 0.5;
    uint64_t v115 = *((void *)v42 + 3);
    uint64_t v116 = *((void *)v42 + 4);
    __swift_project_boxed_opaque_existential_1(v42, v115);
    id v117 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v116 + 8))(v115, v116);
    double v118 = v87;
    double MaxX = v216;
    objc_msgSend(v117, sel_setFrame_, v113, v114, v118, v112);

    double v19 = v215 + v246 - v114;
    if (v19 > 0.0)
    {
      uint64_t v119 = *((void *)v42 + 3);
      uint64_t v120 = *((void *)v42 + 4);
      __swift_project_boxed_opaque_existential_1(v42, v119);
      unint64_t result = sub_234E0A00C(v119, v120);
      unint64_t v46 = result;
      if (!(result >> 62))
      {
        uint64_t v121 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v121)
        {
LABEL_47:
          if (v121 < 1) {
            goto LABEL_131;
          }
          uint64_t v122 = 0;
          do
          {
            if ((v46 & 0xC000000000000001) != 0) {
              id v123 = (id)MEMORY[0x237DD1D30](v122, v46);
            }
            else {
              id v123 = *(id *)(v46 + 8 * v122 + 32);
            }
            v124 = v123;
            ++v122;
            [v123 *(SEL *)(v57 + 1456)];
            double v125 = v19 + CGRectGetMinY(v256);
            [v124 *(SEL *)(v57 + 1456)];
            double v126 = CGRectGetMinX(v257);
            [v124 *(SEL *)(v57 + 1456)];
            objc_msgSend(v124, sel_setFrame_, v126, v125);
          }
          while (v121 != v122);
        }
LABEL_64:
        swift_bridgeObjectRelease();
        unint64_t v6 = rect_8;
        uint64_t v77 = v225;
        goto LABEL_65;
      }
LABEL_63:
      unint64_t result = sub_234E0C020();
      uint64_t v121 = result;
      if (result) {
        goto LABEL_47;
      }
      goto LABEL_64;
    }
  }
LABEL_65:
  objc_msgSend(v77, sel__lastLineBaselineFrameOriginY);
  double v128 = MaxX + v127 + *(double *)&v239[2];
  uint64_t v129 = *((void *)v42 + 3);
  uint64_t v130 = *((void *)v42 + 4);
  __swift_project_boxed_opaque_existential_1(v42, v129);
  uint64_t v131 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v130 + 8))(v129, v130);
  [v131 *(SEL *)(v57 + 1456)];
  CGFloat v133 = v132;
  CGFloat v135 = v134;
  double v137 = v136;
  CGFloat v139 = v138;

  v258.origin.CGFloat x = v133;
  v258.origin.CGFloat y = v135;
  v258.size.CGFloat width = v137;
  v258.size.double height = v139;
  double v140 = v247 - (v128 - CGRectGetMaxY(v258));
  if (v140 < 0.0) {
    double v141 = 0.0;
  }
  else {
    double v141 = v140;
  }
  if (*((unsigned char *)v6 + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_isPending)) {
    double v142 = v241;
  }
  else {
    double v142 = v223;
  }
  [v26 *(SEL *)(v57 + 1456)];
  double v143 = CGRectGetMaxX(v259);
  uint64_t v144 = *((void *)v42 + 3);
  uint64_t v145 = *((void *)v42 + 4);
  __swift_project_boxed_opaque_existential_1(v42, v144);
  unint64_t v146 = (*(uint64_t (**)(uint64_t, uint64_t))(v145 + 16))(v144, v145);
  unint64_t v147 = v146;
  if (v146 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v148 = sub_234E0C020();
    double v149 = v142 + v143;
    if (!v148) {
      goto LABEL_82;
    }
  }
  else
  {
    uint64_t v148 = *(void *)((v146 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    double v149 = v142 + v143;
    if (!v148) {
      goto LABEL_82;
    }
  }
  if (v148 < 1)
  {
    __break(1u);
LABEL_95:
    sub_234E0BEA0();
    goto LABEL_84;
  }
  for (uint64_t j = 0; j != v148; ++j)
  {
    if ((v147 & 0xC000000000000001) != 0) {
      id v151 = (id)MEMORY[0x237DD1D30](j, v147);
    }
    else {
      id v151 = *(id *)(v147 + 8 * j + 32);
    }
    v152 = v151;
    [v151 *(SEL *)(v57 + 1456)];
    double v153 = CGRectGetMaxX(v260);

    if (v149 <= v217 + v153) {
      double v149 = v217 + v153;
    }
  }
LABEL_82:
  double v128 = v128 + v141;
  swift_bridgeObjectRelease_n();
  v154 = rect_8;
  uint64_t v148 = *(void *)((char *)rect_8 + OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_separatorView);
  objc_msgSend((id)v148, sel_setFrame_, MinX + v222, v219, v149 - (v222 + v222), v218);
  v261.origin.CGFloat x = v40;
  v261.size.CGFloat width = rect_24;
  v261.origin.CGFloat y = v232;
  v261.size.double height = rect_16;
  if (CGRectGetHeight(v261) >= v128) {
    goto LABEL_99;
  }
  v262.origin.CGFloat x = v40;
  v262.size.CGFloat width = rect_24;
  v262.origin.CGFloat y = v232;
  v262.size.double height = rect_16;
  double v137 = v128 - CGRectGetHeight(v262);
  [v227 *(SEL *)(v57 + 1456)];
  CGRectGetHeight(v263);
  [v227 *(SEL *)(v57 + 1456)];
  CGRectGetWidth(v264);
  [v227 *(SEL *)(v57 + 1456)];
  objc_msgSend(v227, sel_setFrame_);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED920);
  uint64_t v155 = swift_allocObject();
  *(_OWORD *)(v155 + 16) = xmmword_234E0E230;
  *(void *)(v155 + 32) = v148;
  unint64_t v233 = v155;
  sub_234E0BE90();
  uint64_t v156 = *((void *)v42 + 3);
  uint64_t v157 = *((void *)v42 + 4);
  __swift_project_boxed_opaque_existential_1(v42, v156);
  uint64_t v26 = v42;
  v158 = *(uint64_t (**)(uint64_t, uint64_t))(v157 + 8);
  id v159 = (id)v148;
  v160 = (void *)v158(v156, v157);
  swift_bridgeObjectRetain();
  uint64_t v77 = v160;
  MEMORY[0x237DD1BC0]();
  if (*(void *)((v233 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v233 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_95;
  }
LABEL_84:
  sub_234E0BEB0();
  sub_234E0BE90();
  swift_bridgeObjectRelease();

  uint64_t v161 = *((void *)v26 + 3);
  uint64_t v162 = *((void *)v26 + 4);
  __swift_project_boxed_opaque_existential_1(v26, v161);
  unint64_t v163 = (*(uint64_t (**)(uint64_t, uint64_t))(v162 + 16))(v161, v162);
  unint64_t v42 = v26;
  if (v163 >> 62)
  {
    sub_234DFE770();
    unint64_t v164 = sub_234E0C010();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_234E0C070();
    sub_234DFE770();
    unint64_t v164 = v163;
  }
  swift_bridgeObjectRelease();
  unint64_t result = sub_234DFDFC8(v164);
  if (v233 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v165 = sub_234E0C020();
    unint64_t result = swift_bridgeObjectRelease();
    if (v165) {
      goto LABEL_88;
    }
  }
  else
  {
    uint64_t v165 = *(void *)((v233 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v165)
    {
LABEL_88:
      if (v165 < 1)
      {
LABEL_129:
        __break(1u);
        goto LABEL_130;
      }
      uint64_t v166 = 0;
      do
      {
        if ((v233 & 0xC000000000000001) != 0) {
          id v167 = (id)MEMORY[0x237DD1D30](v166, v233);
        }
        else {
          id v167 = *(id *)(v233 + 8 * v166 + 32);
        }
        v168 = v167;
        ++v166;
        [v167 *(SEL *)(v57 + 1456)];
        double v170 = v169 - v137;
        [v168 *(SEL *)(v57 + 1456)];
        double v172 = v171;
        [v168 *(SEL *)(v57 + 1456)];
        objc_msgSend(v168, sel_setFrame_, v172, v170);
      }
      while (v165 != v166);
    }
  }
  swift_bridgeObjectRelease();
  v154 = rect_8;
  uint64_t v77 = v225;
LABEL_99:
  if (objc_msgSend(v154, sel_effectiveUserInterfaceLayoutDirection) != (id)1) {
    goto LABEL_110;
  }
  uint64_t v173 = *((void *)v42 + 3);
  uint64_t v174 = *((void *)v42 + 4);
  __swift_project_boxed_opaque_existential_1(v42, v173);
  unint64_t result = sub_234E0A00C(v173, v174);
  unint64_t v175 = result;
  if (result >> 62)
  {
    unint64_t result = sub_234E0C020();
    uint64_t v176 = result;
    if (result) {
      goto LABEL_102;
    }
  }
  else
  {
    uint64_t v176 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v176)
    {
LABEL_102:
      if (v176 < 1)
      {
LABEL_130:
        __break(1u);
LABEL_131:
        __break(1u);
LABEL_132:
        __break(1u);
LABEL_133:
        __break(1u);
        goto LABEL_134;
      }
      uint64_t v177 = 0;
      do
      {
        if ((v175 & 0xC000000000000001) != 0) {
          id v178 = (id)MEMORY[0x237DD1D30](v177, v175);
        }
        else {
          id v178 = *(id *)(v175 + 8 * v177 + 32);
        }
        v179 = v178;
        ++v177;
        [v178 *(SEL *)(v57 + 1456)];
        CGFloat x = v265.origin.x;
        CGFloat y = v265.origin.y;
        double v182 = v265.size.width;
        double height = v265.size.height;
        double v184 = v149 - CGRectGetMinX(v265);
        v266.origin.CGFloat x = x;
        v266.origin.CGFloat y = y;
        v266.size.CGFloat width = v182;
        v266.size.double height = height;
        double v185 = v184 - CGRectGetWidth(v266);
        v267.origin.CGFloat x = x;
        v267.origin.CGFloat y = y;
        v267.size.CGFloat width = v182;
        v267.size.double height = height;
        objc_msgSend(v179, sel_setFrame_, v185, CGRectGetMinY(v267), v182, height);
      }
      while (v176 != v177);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v77 = v225;
LABEL_110:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED920);
  uint64_t v186 = swift_allocObject();
  *(_OWORD *)(v186 + 16) = xmmword_234E0E230;
  *(void *)(v186 + 32) = v227;
  unint64_t v234 = v186;
  sub_234E0BE90();
  id v187 = (id)v148;
  v188 = v227;
  id v189 = v187;
  uint64_t v190 = swift_bridgeObjectRetain();
  MEMORY[0x237DD1BC0](v190);
  if (*(void *)((v234 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v234 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_234E0BEA0();
  }
  sub_234E0BEB0();
  sub_234E0BE90();
  swift_bridgeObjectRelease();

  uint64_t v191 = *((void *)v42 + 3);
  uint64_t v192 = *((void *)v42 + 4);
  __swift_project_boxed_opaque_existential_1(v42, v191);
  unint64_t v193 = sub_234E0A00C(v191, v192);
  unint64_t result = sub_234DFDFC8(v193);
  if (v234 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v194 = sub_234E0C020();
    unint64_t result = swift_bridgeObjectRelease();
    if (v194) {
      goto LABEL_114;
    }
  }
  else
  {
    uint64_t v194 = *(void *)((v234 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v194)
    {
LABEL_114:
      if (v194 >= 1)
      {
        uint64_t v195 = 0;
        do
        {
          if ((v234 & 0xC000000000000001) != 0) {
            id v196 = (id)MEMORY[0x237DD1D30](v195, v234);
          }
          else {
            id v196 = *(id *)(v234 + 8 * v195 + 32);
          }
          v197 = v196;
          ++v195;
          [v196 *(SEL *)(v57 + 1456)];
          UIRoundToViewScale();
          double v199 = v198;
          UIRoundToViewScale();
          double v201 = v200;
          UIRoundToViewScale();
          double v203 = v202;
          UIRoundToViewScale();
          objc_msgSend(v197, sel_setFrame_, v199, v201, v203, v204);
        }
        while (v194 != v195);
        goto LABEL_121;
      }
      __break(1u);
      goto LABEL_129;
    }
  }
LABEL_121:
  swift_bridgeObjectRelease();
  double v205 = v149 + *(double *)&v239[1];
  v268.origin.CGFloat x = v40;
  v268.size.CGFloat width = rect_24;
  v268.origin.CGFloat y = v232;
  v268.size.double height = rect_16;
  double v206 = CGRectGetHeight(v268);
  if (v128 >= v206) {
    double v207 = v206;
  }
  else {
    double v207 = v128;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED980);
  uint64_t v208 = swift_allocObject();
  *(_OWORD *)(v208 + 16) = xmmword_234E0E1D0;
  uint64_t v209 = sub_234E0BF40();
  uint64_t v211 = v210;
  *(void *)(v208 + 56) = MEMORY[0x263F8D310];
  *(void *)(v208 + 64) = sub_234DFBE34();
  *(void *)(v208 + 32) = v209;
  *(void *)(v208 + 40) = v211;
  sub_234E0BF00();
  if (qword_2687ED710 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
  uint64_t v212 = swift_allocObject();
  *(_OWORD *)(v212 + 16) = xmmword_234E0E1D0;
  *(void *)(v212 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED988);
  *(void *)(v212 + 64) = sub_234DFE7B0((unint64_t *)&qword_2687ED990, &qword_2687ED988);
  *(void *)(v212 + 32) = v208;
  swift_bridgeObjectRetain();
  sub_234E0BD30();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  double v213 = CGCeiling(v205);
  double v214 = CGCeiling(v207);
  sub_234DF9FE8((uint64_t)v239);
  double *v220 = v213;
  v220[1] = v214;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v235);
}

uint64_t sub_234DFDA84()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer;
  return __swift_destroy_boxed_opaque_existential_1(v1);
}

id sub_234DFDAC4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityReplyBubbleView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static ReplyBubbleView.bubbleViewFor(reply:payload:isPending:)(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 176) = a3;
  *(void *)(v3 + 136) = a1;
  type metadata accessor for Reply();
  *(void *)(v3 + 144) = swift_task_alloc();
  *(void *)(v3 + 152) = sub_234E0BEE0();
  *(void *)(v3 + 160) = sub_234E0BED0();
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 168) = v6;
  void *v6 = v3;
  v6[1] = sub_234DFDC48;
  return static ActivityRendererFactory.activityRenderer(for:payload:)(v3 + 56, a1, a2);
}

uint64_t sub_234DFDC48()
{
  swift_task_dealloc();
  uint64_t v1 = sub_234E0BEC0();
  return MEMORY[0x270FA2498](sub_234DFDD84, v1, v0);
}

uint64_t sub_234DFDD84()
{
  swift_release();
  if (*(void *)(v0 + 80))
  {
    char v1 = *(unsigned char *)(v0 + 176);
    uint64_t v3 = *(void *)(v0 + 136);
    uint64_t v2 = *(void *)(v0 + 144);
    sub_234DFDF0C((long long *)(v0 + 56), v0 + 16);
    sub_234DF9E80(v0 + 16, v0 + 96);
    sub_234DF9E1C(v3, v2);
    id v4 = objc_allocWithZone((Class)type metadata accessor for ActivityReplyBubbleView());
    unint64_t v5 = sub_234DFC128((void *)(v0 + 96), v2, v1);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  }
  else
  {
    char v6 = *(unsigned char *)(v0 + 176);
    uint64_t v8 = *(void *)(v0 + 136);
    uint64_t v7 = *(void *)(v0 + 144);
    sub_234DFDEAC(v0 + 56);
    sub_234DF9E1C(v8, v7);
    id v9 = objc_allocWithZone((Class)type metadata accessor for ReplyBubbleView());
    unint64_t v5 = (unint64_t)sub_234E052D0(v7, v6);
  }
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(unint64_t))(v0 + 8);
  return v10(v5);
}

uint64_t sub_234DFDEAC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED968);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_234DFDF0C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for ActivityReplyBubbleView()
{
  uint64_t result = qword_2687ED970;
  if (!qword_2687ED970) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_234DFDF70()
{
  return type metadata accessor for ActivityReplyBubbleView();
}

uint64_t sub_234DFDF78()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_234DFDFC8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_234E0C020();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_234E0C020();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x237DD1D40](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_234DFE2CC(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_234E0C020();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_234E0BE90();
}

void (*sub_234DFE194(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_234DFE244(v6, a2, a3);
  return sub_234DFE1FC;
}

void sub_234DFE1FC(void *a1)
{
  char v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_234DFE244(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x237DD1D30](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_234DFE2C4;
  }
  __break(1u);
  return result;
}

void sub_234DFE2C4(id *a1)
{
}

uint64_t sub_234DFE2CC(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_234E0C020();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_234E0C020();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_234DFE7B0(&qword_2687ED9A8, &qword_2687ED9A0);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED9A0);
            uint64_t v10 = sub_234DFE194(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_234DFE770();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_234DFE48C()
{
  uint64_t v1 = sub_234E0BC50();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  id v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_234E0BCA0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v0 + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x237DD2A40](v9);
  if (result)
  {
    uint64_t v11 = *(void *)(v9 + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v21 = v0 + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_reply;
    id v12 = (void *)(v0 + OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer);
    uint64_t v23 = v1;
    uint64_t v24 = v5;
    uint64_t v14 = *(void *)(v0 + OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer + 24);
    uint64_t v13 = *(void *)(v0 + OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer + 32);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer), v14);
    (*(void (**)(uint64_t, uint64_t))(v13 + 40))(v14, v13);
    uint64_t v15 = v12[3];
    uint64_t v16 = v12[4];
    __swift_project_boxed_opaque_existential_1(v12, v15);
    (*(void (**)(uint64_t, uint64_t))(v16 + 24))(v15, v16);
    uint64_t v17 = v12[3];
    uint64_t v18 = v12[4];
    __swift_project_boxed_opaque_existential_1(v12, v17);
    char v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 32))(v17, v18);
    (*(void (**)(uint64_t, char *, char *, void, uint64_t, uint64_t))(v11 + 8))(v21, v8, v4, v19 & 1, ObjectType, v11);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v23);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v24);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

double CGCeiling(double a1)
{
  return ceil(a1);
}

unint64_t sub_234DFE770()
{
  unint64_t result = qword_2687ED998;
  if (!qword_2687ED998)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2687ED998);
  }
  return result;
}

uint64_t sub_234DFE7B0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void **sub_234DFE7F4(void **a1, void **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  id v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    *(void *)uint64_t v9 = *(void **)((char *)a2 + v8);
    *((void *)v9 + 1) = v11;
    v9[16] = *((unsigned char *)a2 + v8 + 16);
    id v12 = (int *)type metadata accessor for Reply();
    uint64_t v13 = v12[6];
    double v36 = &v10[v13];
    uint64_t v37 = &v9[v13];
    uint64_t v14 = sub_234E0BCA0();
    double v35 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
    uint64_t v15 = v4;
    swift_bridgeObjectRetain();
    v35(v37, v36, v14);
    uint64_t v16 = v12[7];
    uint64_t v17 = &v9[v16];
    uint64_t v18 = &v10[v16];
    uint64_t v19 = *((void *)v18 + 1);
    *(void *)uint64_t v17 = *(void *)v18;
    *((void *)v17 + 1) = v19;
    uint64_t v20 = v12[8];
    uint64_t v21 = &v9[v20];
    double v22 = &v10[v20];
    uint64_t v23 = sub_234E0BC50();
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
    swift_bridgeObjectRetain();
    v24(v21, v22, v23);
    uint64_t v25 = a3[6];
    uint64_t v26 = a3[7];
    uint64_t v27 = *(void **)((char *)a2 + v25);
    *(void **)((char *)v7 + v25) = v27;
    double v28 = *(void **)((char *)a2 + v26);
    *(void **)((char *)v7 + v26) = v28;
    uint64_t v29 = a3[8];
    double v30 = *(void **)((char *)a2 + v29);
    *(void **)((char *)v7 + v29) = v30;
    id v31 = v27;
    id v32 = v28;
    id v33 = v30;
  }
  return v7;
}

void sub_234DFE9B8(id *a1, int *a2)
{
  id v4 = (char *)a1 + a2[5];
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for Reply();
  uint64_t v6 = &v4[*(int *)(v5 + 24)];
  uint64_t v7 = sub_234E0BCA0();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = &v4[*(int *)(v5 + 32)];
  uint64_t v9 = sub_234E0BC50();
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  uint64_t v10 = *(id *)((char *)a1 + a2[8]);
}

void **sub_234DFEAD0(void **a1, void **a2, int *a3)
{
  uint64_t v5 = *a2;
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = *(uint64_t *)((char *)a2 + v6 + 8);
  *(void *)uint64_t v7 = *(void **)((char *)a2 + v6);
  *((void *)v7 + 1) = v9;
  v7[16] = *((unsigned char *)a2 + v6 + 16);
  uint64_t v10 = (int *)type metadata accessor for Reply();
  uint64_t v11 = v10[6];
  double v34 = &v8[v11];
  double v35 = &v7[v11];
  uint64_t v12 = sub_234E0BCA0();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  id v14 = v5;
  swift_bridgeObjectRetain();
  v13(v35, v34, v12);
  uint64_t v15 = v10[7];
  uint64_t v16 = &v7[v15];
  uint64_t v17 = &v8[v15];
  uint64_t v18 = *((void *)v17 + 1);
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = v18;
  uint64_t v19 = v10[8];
  uint64_t v20 = &v7[v19];
  uint64_t v21 = &v8[v19];
  uint64_t v22 = sub_234E0BC50();
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
  swift_bridgeObjectRetain();
  v23(v20, v21, v22);
  uint64_t v24 = a3[6];
  uint64_t v25 = a3[7];
  uint64_t v26 = *(void **)((char *)a2 + v24);
  *(void **)((char *)a1 + v24) = v26;
  uint64_t v27 = *(void **)((char *)a2 + v25);
  *(void **)((char *)a1 + v25) = v27;
  uint64_t v28 = a3[8];
  uint64_t v29 = *(void **)((char *)a2 + v28);
  *(void **)((char *)a1 + v28) = v29;
  id v30 = v26;
  id v31 = v27;
  id v32 = v29;
  return a1;
}

void **sub_234DFEC48(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  *(void *)uint64_t v10 = *(void **)((char *)a2 + v9);
  *((void *)v10 + 1) = *(void **)((char *)a2 + v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[16] = v11[16];
  uint64_t v12 = (int *)type metadata accessor for Reply();
  uint64_t v13 = v12[6];
  id v14 = &v10[v13];
  uint64_t v15 = &v11[v13];
  uint64_t v16 = sub_234E0BCA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  uint64_t v17 = v12[7];
  uint64_t v18 = &v10[v17];
  uint64_t v19 = &v11[v17];
  *(void *)uint64_t v18 = *(void *)v19;
  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = v12[8];
  uint64_t v21 = &v10[v20];
  uint64_t v22 = &v11[v20];
  uint64_t v23 = sub_234E0BC50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  uint64_t v24 = a3[6];
  uint64_t v25 = *(void **)((char *)a2 + v24);
  uint64_t v26 = *(void **)((char *)a1 + v24);
  *(void **)((char *)a1 + v24) = v25;
  id v27 = v25;

  uint64_t v28 = a3[7];
  uint64_t v29 = *(void **)((char *)a2 + v28);
  id v30 = *(void **)((char *)a1 + v28);
  *(void **)((char *)a1 + v28) = v29;
  id v31 = v29;

  uint64_t v32 = a3[8];
  id v33 = *(void **)((char *)a2 + v32);
  double v34 = *(void **)((char *)a1 + v32);
  *(void **)((char *)a1 + v32) = v33;
  id v35 = v33;

  return a1;
}

void *sub_234DFEDE4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  *(_OWORD *)uint64_t v7 = *(_OWORD *)((char *)a2 + v6);
  v7[16] = *((unsigned char *)a2 + v6 + 16);
  uint64_t v9 = (int *)type metadata accessor for Reply();
  uint64_t v10 = v9[6];
  uint64_t v11 = &v7[v10];
  uint64_t v12 = &v8[v10];
  uint64_t v13 = sub_234E0BCA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  *(_OWORD *)&v7[v9[7]] = *(_OWORD *)&v8[v9[7]];
  uint64_t v14 = v9[8];
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  uint64_t v17 = sub_234E0BC50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  uint64_t v18 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v18) = *(void *)((char *)a2 + v18);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  return a1;
}

void **sub_234DFEF14(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a3[5];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(uint64_t *)((char *)a2 + v7 + 8);
  *(void *)id v8 = *(void **)((char *)a2 + v7);
  *((void *)v8 + 1) = v10;
  swift_bridgeObjectRelease();
  v8[16] = v9[16];
  uint64_t v11 = (int *)type metadata accessor for Reply();
  uint64_t v12 = v11[6];
  uint64_t v13 = &v8[v12];
  uint64_t v14 = &v9[v12];
  uint64_t v15 = sub_234E0BCA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = v11[7];
  uint64_t v17 = &v8[v16];
  uint64_t v18 = &v9[v16];
  uint64_t v20 = *(void *)v18;
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)uint64_t v17 = v20;
  *((void *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = v11[8];
  uint64_t v22 = &v8[v21];
  uint64_t v23 = &v9[v21];
  uint64_t v24 = sub_234E0BC50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 40))(v22, v23, v24);
  uint64_t v25 = a3[6];
  uint64_t v26 = *(void **)((char *)a1 + v25);
  *(void **)((char *)a1 + v25) = *(void **)((char *)a2 + v25);

  uint64_t v27 = a3[7];
  uint64_t v28 = *(void **)((char *)a1 + v27);
  *(void **)((char *)a1 + v27) = *(void **)((char *)a2 + v27);

  uint64_t v29 = a3[8];
  id v30 = *(void **)((char *)a1 + v29);
  *(void **)((char *)a1 + v29) = *(void **)((char *)a2 + v29);

  return a1;
}

uint64_t sub_234DFF080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_234DFF094);
}

uint64_t sub_234DFF094(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Reply();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_234DFF144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_234DFF158);
}

void *sub_234DFF158(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Reply();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for AchievementRenderer()
{
  uint64_t result = qword_2687ED9B0;
  if (!qword_2687ED9B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_234DFF24C()
{
  uint64_t result = type metadata accessor for Reply();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_234DFF2EC(void *a1)
{
  aBlock[6] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_234E0BD40();
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (id *)((char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_234E0BD70();
  uint64_t v73 = *(void *)(v6 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v64 - v10;
  id v12 = objc_msgSend(a1, sel_templateUniqueName);
  int v13 = ASIsCompetitionVictoryTemplate();

  sub_234E0BF00();
  if (v13)
  {
    if (qword_2687ED710 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_234E0E1D0;
    *(void *)(v14 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED988);
    *(void *)(v14 + 64) = sub_234E00B9C();
    *(void *)(v14 + 32) = MEMORY[0x263F8EE78];
    sub_234E0BD30();
    swift_bridgeObjectRelease();
    return (id)ASEphemeralCompetitionVictoryAchievementForFriendAchievement();
  }
  uint64_t v68 = v3;
  if (qword_2687ED710 != -1) {
    swift_once();
  }
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
  uint64_t v16 = swift_allocObject();
  long long v72 = xmmword_234E0E1D0;
  *(_OWORD *)(v16 + 16) = xmmword_234E0E1D0;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED988);
  *(void *)(v16 + 56) = v70;
  unint64_t v69 = sub_234E00B9C();
  *(void *)(v16 + 64) = v69;
  *(void *)(v16 + 32) = MEMORY[0x263F8EE78];
  sub_234E0BD30();
  swift_bridgeObjectRelease();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = 0;
  if (!ACHShouldUseNewAwardsSystem())
  {
    uint64_t v66 = v2;
    dispatch_semaphore_t v67 = dispatch_semaphore_create(0);
    id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A410]), sel_init);
    id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F23658]), sel_initWithHealthStore_, v33);

    if (v34)
    {
      id v65 = v34;
      id v64 = objc_msgSend(a1, sel_templateUniqueName);
      id v35 = (void *)swift_allocObject();
      dispatch_semaphore_t v36 = v67;
      v35[2] = v17;
      v35[3] = v36;
      aBlock[4] = sub_234E00C70;
      aBlock[5] = v35;
      aBlock[0] = (id)MEMORY[0x263EF8330];
      aBlock[1] = (id)1107296256;
      aBlock[2] = sub_234DFFED8;
      aBlock[3] = &block_descriptor_0;
      uint64_t v37 = v17;
      uint64_t v38 = _Block_copy(aBlock);
      swift_retain();
      double v39 = v36;
      swift_release();
      uint64_t v41 = v64;
      id v40 = v65;
      objc_msgSend(v65, sel_fetchEphemeralAchievementWithTemplateUniqueName_completion_, v64, v38);
      unint64_t v42 = v38;
      uint64_t v17 = v37;
      _Block_release(v42);
    }
    id v65 = v34;
    sub_234E0BD60();
    void *v5 = 10;
    uint64_t v43 = v68;
    uint64_t v44 = v66;
    (*(void (**)(void *, void, uint64_t))(v68 + 104))(v5, *MEMORY[0x263F8F018], v66);
    MEMORY[0x237DD1AE0](v9, v5);
    (*(void (**)(void *, uint64_t))(v43 + 8))(v5, v44);
    unint64_t v45 = *(void (**)(char *, uint64_t))(v73 + 8);
    v45(v9, v6);
    dispatch_semaphore_t v46 = v67;
    sub_234E0BF10();
    v45(v11, v6);
    if (sub_234E0BD50())
    {

LABEL_24:
      swift_beginAccess();
      uint64_t v15 = *(void **)(v17 + 16);
      id v63 = v15;
      swift_release();
      return v15;
    }
    sub_234E0BEF0();
    uint64_t v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = v72;
    unint64_t v48 = v69;
    *(void *)(v47 + 56) = v70;
    *(void *)(v47 + 64) = v48;
    *(void *)(v47 + 32) = MEMORY[0x263F8EE78];
    sub_234E0BD30();

LABEL_23:
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  uint64_t v18 = (void **)(v17 + 16);
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F238D8]), sel_init);
  id result = objc_msgSend(a1, sel_templateUniqueName);
  if (result)
  {
    uint64_t v21 = result;
    aBlock[0] = 0;
    id v22 = objc_msgSend(v19, sel_ephemeralAchievementWithTemplateUniqueName_error_, result, aBlock);

    if (aBlock[0])
    {
      uint64_t v23 = v17;
      id v24 = aBlock[0];

      swift_willThrow();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED980);
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_234E0E290;
      id v26 = objc_msgSend(a1, sel_templateUniqueName);
      uint64_t v27 = MEMORY[0x263F8D310];
      if (v26)
      {
        uint64_t v28 = v26;
        uint64_t v29 = sub_234E0BDD0();
        uint64_t v31 = v30;

        uint64_t v32 = MEMORY[0x263F8D310];
        id v26 = (id)sub_234DFBE34();
      }
      else
      {
        uint64_t v29 = 0;
        uint64_t v31 = 0;
        uint64_t v32 = 0;
        *(void *)(v25 + 48) = 0;
      }
      *(void *)(v25 + 32) = v29;
      *(void *)(v25 + 40) = v31;
      *(void *)(v25 + 56) = v32;
      *(void *)(v25 + 64) = v26;
      aBlock[0] = v24;
      id v54 = v24;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED9D0);
      uint64_t v55 = sub_234E0BDF0();
      uint64_t v57 = v56;
      *(void *)(v25 + 96) = v27;
      *(void *)(v25 + 104) = sub_234DFBE34();
      *(void *)(v25 + 72) = v55;
      *(void *)(v25 + 80) = v57;
      sub_234E0BF00();
      uint64_t v58 = swift_allocObject();
      *(_OWORD *)(v58 + 16) = v72;
      unint64_t v59 = v69;
      *(void *)(v58 + 56) = v70;
      *(void *)(v58 + 64) = v59;
      *(void *)(v58 + 32) = v25;
      swift_bridgeObjectRetain();
      sub_234E0BD30();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v17 = v23;
      goto LABEL_24;
    }
    id v49 = *v18;
    char *v18 = v22;

    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED980);
    uint64_t v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = v72;
    uint64_t v51 = *v18;
    if (*v18)
    {
      unint64_t v52 = sub_234E00C90();
      uint64_t v53 = sub_234E00CD0(&qword_2687ED9C8, (void (*)(uint64_t))sub_234E00C90);
    }
    else
    {
      unint64_t v52 = 0;
      uint64_t v53 = 0;
      *(void *)(v50 + 40) = 0;
      *(void *)(v50 + 48) = 0;
    }
    *(void *)(v50 + 32) = v51;
    *(void *)(v50 + 56) = v52;
    *(void *)(v50 + 64) = v53;
    id v60 = v51;
    sub_234E0BF00();
    uint64_t v61 = swift_allocObject();
    *(_OWORD *)(v61 + 16) = v72;
    unint64_t v62 = v69;
    *(void *)(v61 + 56) = v70;
    *(void *)(v61 + 64) = v62;
    *(void *)(v61 + 32) = v50;
    swift_bridgeObjectRetain();
    sub_234E0BD30();
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

uint64_t sub_234DFFC04(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    swift_beginAccess();
    uint64_t v5 = *(void **)(a3 + 16);
    *(void *)(a3 + 16) = a1;
    id v6 = a1;

    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED980);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_234E0E1D0;
    *(void *)(v7 + 56) = sub_234E00C90();
    *(void *)(v7 + 64) = sub_234E00CD0(&qword_2687ED9C8, (void (*)(uint64_t))sub_234E00C90);
    *(void *)(v7 + 32) = v6;
    id v8 = v6;
    sub_234E0BF00();
    if (qword_2687ED710 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_234E0E1D0;
    *(void *)(v9 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED988);
    *(void *)(v9 + 64) = sub_234E00B9C();
    *(void *)(v9 + 32) = v7;
    swift_bridgeObjectRetain();
    sub_234E0BD30();
  }
  else
  {
    sub_234E0BEF0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED980);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_234E0E1D0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED9D8);
    uint64_t v11 = sub_234E0BF90();
    uint64_t v13 = v12;
    *(void *)(v10 + 56) = MEMORY[0x263F8D310];
    *(void *)(v10 + 64) = sub_234DFBE34();
    *(void *)(v10 + 32) = v11;
    *(void *)(v10 + 40) = v13;
    if (qword_2687ED710 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_234E0E1D0;
    *(void *)(v14 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED988);
    *(void *)(v14 + 64) = sub_234E00B9C();
    *(void *)(v14 + 32) = v10;
    swift_bridgeObjectRetain();
    sub_234E0BD30();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_234E0BF20();
}

void sub_234DFFED8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_234DFFF64@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v79 = sub_234E0BC50();
  uint64_t v78 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  id v76 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED948);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v77 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a4 = a1;
  uint64_t v11 = (int *)type metadata accessor for AchievementRenderer();
  uint64_t v12 = (uint64_t)a4 + v11[5];
  uint64_t v81 = a3;
  sub_234DF9E1C(a3, v12);
  uint64_t v13 = qword_2687ED728;
  id v14 = a1;
  if (v13 != -1) {
    swift_once();
  }
  sub_234DF9E80((uint64_t)&qword_2687EE0B8, (uint64_t)v82);
  uint64_t v15 = v83;
  uint64_t v16 = v84;
  __swift_project_boxed_opaque_existential_1(v82, v83);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v16 + 8))(v85, v15, v16);
  id v80 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F23638]), sel_init);
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(void *)((char *)a4 + v11[7]) = v17;
  uint64_t v18 = v85[20];
  id v19 = v17;
  objc_msgSend(v19, sel_setNumberOfLines_, v18);
  objc_msgSend(v19, sel_setAllowsDefaultTighteningForTruncation_, 1);
  id v74 = v19;
  objc_msgSend(v19, sel_setLineBreakMode_, 4);
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  unint64_t v69 = v11;
  *(void *)((char *)a4 + v11[8]) = v20;
  id v21 = v20;
  objc_msgSend(v21, sel_setNumberOfLines_, 2);
  objc_msgSend(v21, sel_setAllowsDefaultTighteningForTruncation_, 1);
  id v75 = v21;
  objc_msgSend(v21, sel_setLineBreakMode_, 4);
  id v22 = (id)ASEphemeralEarnedAchievementForFriendAchievement();
  id v23 = objc_msgSend(v14, sel_templateUniqueName);
  LODWORD(v21) = ASIsCompetitionVictoryTemplate();

  id v72 = a2;
  uint64_t v71 = a4;
  if (v21)
  {
    type metadata accessor for ReplyBubbleView();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v25 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    id v26 = (void *)sub_234E0BDA0();
    id v27 = objc_msgSend(v25, sel_localizedStringForKey_value_table_, v26, 0, 0);

LABEL_6:
    uint64_t v28 = sub_234E0BDD0();
    uint64_t v30 = v29;

    goto LABEL_7;
  }
  id v27 = objc_msgSend(v80, sel_titleForAchievement_, v22);
  if (v27) {
    goto LABEL_6;
  }
  uint64_t v28 = 0;
  uint64_t v30 = 0;
LABEL_7:
  uint64_t v31 = v84;
  __swift_project_boxed_opaque_existential_1(v82, v83);
  id v68 = v22;
  id v32 = objc_msgSend(v22, sel_template);
  uint64_t v33 = v81;
  uint64_t v73 = (*(uint64_t (**)(void))(v31 + 104))();

  uint64_t v34 = v83;
  uint64_t v35 = v84;
  __swift_project_boxed_opaque_existential_1(v82, v83);
  id v70 = v14;
  id v36 = objc_msgSend(v14, sel_completedDate);
  if (!v36)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v78 + 56))(v77, 1, 1, v79);
    goto LABEL_15;
  }
  uint64_t v37 = v36;
  sub_234E0BC30();

  uint64_t v38 = v78;
  double v39 = v77;
  uint64_t v40 = v79;
  (*(void (**)(void))(v78 + 32))();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v39, 0, 1, v40);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48))(v39, 1, v40);
  if (result == 1)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  id v76 = (char *)(*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 112))(v33, v39, v28, v30, v34, v35);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
  uint64_t v42 = v83;
  uint64_t v43 = v84;
  __swift_project_boxed_opaque_existential_1(v82, v83);
  uint64_t v44 = (*(uint64_t (**)(uint64_t, uint64_t))(v43 + 24))(v42, v43);
  sub_234DF97FC(v44);
  swift_bridgeObjectRelease();
  id v45 = objc_allocWithZone(MEMORY[0x263F086A0]);
  dispatch_semaphore_t v46 = (void *)sub_234E0BDA0();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_234E00CD0((unint64_t *)&qword_2687ED778, type metadata accessor for Key);
  uint64_t v47 = (void *)sub_234E0BD90();
  swift_bridgeObjectRelease();
  id v48 = objc_msgSend(v45, sel_initWithString_attributes_, v46, v47);

  id v49 = v74;
  objc_msgSend(v74, sel_setAttributedText_, v48);

  uint64_t v50 = v83;
  uint64_t v51 = v84;
  __swift_project_boxed_opaque_existential_1(v82, v83);
  uint64_t v52 = (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 32))(v50, v51);
  sub_234DF97FC(v52);
  swift_bridgeObjectRelease();
  id v53 = objc_allocWithZone(MEMORY[0x263F086A0]);
  id v54 = (void *)sub_234E0BDA0();
  swift_bridgeObjectRelease();
  uint64_t v55 = (void *)sub_234E0BD90();
  swift_bridgeObjectRelease();
  id v56 = objc_msgSend(v53, sel_initWithString_attributes_, v54, v55);

  id v57 = v75;
  objc_msgSend(v75, sel_setAttributedText_, v56);

  uint64_t v58 = v83;
  uint64_t v59 = v84;
  __swift_project_boxed_opaque_existential_1(v82, v83);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v59 + 40))(v58, v59))
  {
    id v60 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F238B0]), sel_init);
    double v61 = *(double *)&v85[9];
    id v62 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithFrame_, 0.0, 0.0, v61, v61);
    *(void *)((char *)v71 + v69[6]) = v62;
    id v63 = v62;
    objc_msgSend(v63, sel_setContentMode_, 1);
    id v64 = v68;
    id v65 = objc_msgSend(v60, sel_thumbnailImageForAchievement_size_, v68, v61 + 10.0, v61 + 10.0);
    objc_msgSend(v63, sel_setImage_, v65);

    sub_234DF9FE8((uint64_t)v85);
    sub_234DFA014(v81);
  }
  else
  {
    id v66 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);

    sub_234DF9FE8((uint64_t)v85);
    sub_234DFA014(v81);
    *(void *)((char *)v71 + v69[6]) = v66;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
}

uint64_t sub_234E0094C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_234E0BC50();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED948);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(*v1, sel_completedDate);
  if (v10)
  {
    uint64_t v11 = v10;
    sub_234E0BC30();

    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v12(v9, v6, v3);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v9, 0, 1, v3);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3);
    if (result != 1) {
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v12)(a1, v9, v3);
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v9, 1, 1, v3);
  }
  __break(1u);
  return result;
}

uint64_t sub_234E00B18(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED920);
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = *(int *)(a1 + 32);
  uint64_t v5 = *(void **)(v1 + *(int *)(a1 + 28));
  *(_OWORD *)(v3 + 16) = xmmword_234E0E160;
  id v6 = *(void **)(v1 + v4);
  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 40) = v6;
  uint64_t v10 = v3;
  sub_234E0BE90();
  id v7 = v5;
  id v8 = v6;
  return v10;
}

unint64_t sub_234E00B9C()
{
  unint64_t result = qword_2687ED990;
  if (!qword_2687ED990)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687ED988);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687ED990);
  }
  return result;
}

uint64_t sub_234E00BF8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_234E00C30()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_234E00C70(void *a1, uint64_t a2)
{
  return sub_234DFFC04(a1, a2, *(void *)(v2 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_234E00C90()
{
  unint64_t result = qword_2687ED9C0;
  if (!qword_2687ED9C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2687ED9C0);
  }
  return result;
}

uint64_t sub_234E00CD0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_234E00D18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_234E00D2C);
}

uint64_t sub_234E00D2C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Reply();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_234E00DDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_234E00DF0);
}

void *sub_234E00DF0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Reply();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for GoalCompletionRenderer()
{
  uint64_t result = qword_2687ED9E0;
  if (!qword_2687ED9E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_234E00EE4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  id v6 = (int *)type metadata accessor for GoalCompletionRenderer();
  sub_234DF9E1C(a2, (uint64_t)a3 + v6[5]);
  id v7 = a1;
  id v8 = objc_msgSend(v7, sel_activitySummary);
  if (qword_2687ED728 != -1) {
    swift_once();
  }
  sub_234DF9E80((uint64_t)&qword_2687EE0B8, (uint64_t)v46);
  uint64_t v9 = v47;
  uint64_t v10 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v10 + 8))(v49, v9, v10);
  id v11 = objc_msgSend(self, sel_activityRingGroup);
  HIDWORD(v12) = HIDWORD(v50);
  *(float *)&double v12 = v50;
  objc_msgSend(v11, sel_setGroupDiameter_, v12);
  HIDWORD(v13) = HIDWORD(v51);
  *(float *)&double v13 = v51;
  objc_msgSend(v11, sel_setThickness_, v13);
  HIDWORD(v14) = HIDWORD(v52);
  *(float *)&double v14 = v52;
  objc_msgSend(v11, sel_setInterspacing_, v14);
  objc_msgSend(v11, sel_hk_configureWithActivitySummary_animated_, v8, 0);
  id v45 = v11;
  id v44 = objc_msgSend(self, sel_renderRingGroup_withRenderer_, v11, 0);
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v44);
  *(void *)((char *)a3 + v6[6]) = v15;
  objc_msgSend(v15, sel_setContentMode_, 1);
  uint64_t v43 = v8;
  if (v8) {
    id v16 = objc_msgSend(v8, sel__isStandalonePhoneSummary);
  }
  else {
    id v16 = 0;
  }
  uint64_t v17 = v47;
  uint64_t v18 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v18 + 120))(a2, v16, v17, v18);
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(void *)((char *)a3 + v6[7]) = v19;
  uint64_t v20 = v53;
  id v21 = v19;
  objc_msgSend(v21, sel_setNumberOfLines_, v20);
  uint64_t v41 = v6;
  uint64_t v22 = v47;
  uint64_t v23 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 24))(v22, v23);
  sub_234DF97FC(v24);
  swift_bridgeObjectRelease();
  id v25 = objc_allocWithZone(MEMORY[0x263F086A0]);
  uint64_t v42 = a2;
  id v26 = (void *)sub_234E0BDA0();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_234DF9F28();
  id v27 = (void *)sub_234E0BD90();
  swift_bridgeObjectRelease();
  id v28 = objc_msgSend(v25, sel_initWithString_attributes_, v26, v27);

  objc_msgSend(v21, sel_setAttributedText_, v28);
  objc_msgSend(v21, sel_setLineBreakMode_, 4);

  uint64_t v29 = v47;
  uint64_t v30 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  (*(void (**)(id, uint64_t, uint64_t))(v30 + 128))(v7, v29, v30);
  id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(void *)((char *)a3 + v41[8]) = v31;
  id v32 = v31;
  objc_msgSend(v32, sel_setNumberOfLines_, 2);
  uint64_t v33 = v47;
  uint64_t v34 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  uint64_t v35 = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 32))(v33, v34);
  sub_234DF97FC(v35);
  swift_bridgeObjectRelease();
  id v36 = objc_allocWithZone(MEMORY[0x263F086A0]);
  uint64_t v37 = (void *)sub_234E0BDA0();
  swift_bridgeObjectRelease();
  uint64_t v38 = (void *)sub_234E0BD90();
  swift_bridgeObjectRelease();
  id v39 = objc_msgSend(v36, sel_initWithString_attributes_, v37, v38);

  objc_msgSend(v32, sel_setAttributedText_, v39);
  objc_msgSend(v32, sel_setLineBreakMode_, 4);

  sub_234DF9FE8((uint64_t)v49);
  sub_234DFA014(v42);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
}

uint64_t sub_234E01424@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v2 = sub_234E0BD00();
  uint64_t v28 = *(void *)(v2 - 8);
  uint64_t v29 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED9F0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  id v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v27 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED948);
  MEMORY[0x270FA5388](v11 - 8);
  double v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_234E0BC50();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v27 - v19;
  objc_msgSend(*v1, sel_snapshotIndex);
  id v21 = (id)_HKActivityCacheDateComponentsFromCacheIndex();
  if (v21)
  {
    uint64_t v22 = v21;
    sub_234E0BBB0();

    uint64_t v23 = sub_234E0BBD0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v8, 0, 1, v23);
  }
  else
  {
    uint64_t v23 = sub_234E0BBD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v8, 1, 1, v23);
  }
  sub_234E01868((uint64_t)v8, (uint64_t)v10);
  sub_234E0BBD0();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v10, 1, v23) == 1)
  {
    sub_234E018D0((uint64_t)v10, &qword_2687ED9F0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
LABEL_7:
    sub_234E018D0((uint64_t)v13, &qword_2687ED948);
    return sub_234E0BC40();
  }
  sub_234E0BBC0();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1) {
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v13, v14);
  sub_234E0BCF0();
  sub_234E0BC40();
  sub_234E0BCD0();
  id v26 = *(void (**)(char *, uint64_t))(v15 + 8);
  v26(v18, v14);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v4, v29);
  sub_234E0BC10();
  return ((uint64_t (*)(char *, uint64_t))v26)(v20, v14);
}

uint64_t sub_234E01868(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED9F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_234E018D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t Reply.message.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Reply.isFromMe.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t Reply.friend.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Reply() + 24);
  uint64_t v4 = sub_234E0BCA0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for Reply()
{
  uint64_t result = qword_2687EDA08;
  if (!qword_2687EDA08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t Reply.recipientAddress.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for Reply() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Reply.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Reply() + 32);
  uint64_t v4 = sub_234E0BC50();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t Reply.debugDescription.getter()
{
  return 0;
}

uint64_t sub_234E01D4C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t Reply.init(message:isFromMe:friend:recipientAddress:timestamp:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  *(void *)a8 = a1;
  *(void *)(a8 + 8) = a2;
  *(unsigned char *)(a8 + 16) = a3;
  double v13 = (int *)type metadata accessor for Reply();
  uint64_t v14 = a8 + v13[6];
  uint64_t v15 = sub_234E0BCA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14, a4, v15);
  uint64_t v16 = (void *)(a8 + v13[7]);
  void *v16 = a5;
  v16[1] = a6;
  uint64_t v17 = a8 + v13[8];
  uint64_t v18 = sub_234E0BC50();
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32);
  return v19(v17, a7, v18);
}

uint64_t static Reply.reply(from:isFromMe:)@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  int v55 = a1;
  uint64_t v58 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED940);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_234E0BCA0();
  uint64_t v56 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  id v54 = (char *)&v49 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED948);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_234E0BC50();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  id v57 = (char *)&v49 - v18;
  uint64_t v19 = (void *)sub_234E0BBF0();
  id v20 = (id)ASMessageFromRichMessagePayload();

  if (!v20)
  {
    sub_234E0BEF0();
    if (qword_2687ED710 == -1) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
  uint64_t v53 = v8;
  uint64_t v52 = sub_234E0BDD0();
  uint64_t v22 = v21;

  uint64_t v23 = (void *)sub_234E0BBF0();
  id v24 = (id)ASRecipientAddressFromRichMessagePayload();

  if (v24)
  {
    uint64_t v51 = v22;
    uint64_t v25 = sub_234E0BDD0();
    uint64_t v49 = v26;
    uint64_t v50 = v25;

    uint64_t v27 = (void *)sub_234E0BBF0();
    id v28 = (id)ASTimestampFromRichMessagePayload();

    if (v28)
    {
      sub_234E0BC30();

      uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
      v29(v12, v17, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
      int v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
      uint64_t v31 = v56;
      id v32 = v53;
      if (v30 != 1)
      {
        v29(v57, v12, v13);
        goto LABEL_14;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
      uint64_t v31 = v56;
      id v32 = v53;
    }
    sub_234E0BC40();
    sub_234E018D0((uint64_t)v12, &qword_2687ED948);
LABEL_14:
    uint64_t v39 = v58;
    char v40 = v55;
    uint64_t v41 = (void *)sub_234E0BBF0();
    id v42 = (id)ASFriendUUIDFromRichMessagePayload();

    if (v42)
    {
      sub_234E0BC80();

      uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
      v43(v4, v32, v5);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v4, 0, 1, v5);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v4, 1, v5) != 1)
      {
        id v44 = v54;
        v43(v54, v4, v5);
LABEL_19:
        uint64_t v45 = v51;
        *(void *)uint64_t v39 = v52;
        *(void *)(v39 + 8) = v45;
        *(unsigned char *)(v39 + 16) = v40 & 1;
        dispatch_semaphore_t v46 = (int *)type metadata accessor for Reply();
        (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))(v39 + v46[6], v44, v5);
        uint64_t v47 = (uint64_t *)(v39 + v46[7]);
        uint64_t v48 = v49;
        uint64_t *v47 = v50;
        v47[1] = v48;
        (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v39 + v46[8], v57, v13);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, int *))(*((void *)v46 - 1) + 56))(v39, 0, 1, v46);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56))(v4, 1, 1, v5);
    }
    id v44 = v54;
    sub_234E0BC90();
    sub_234E018D0((uint64_t)v4, &qword_2687ED940);
    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
  sub_234E0BEF0();
  if (qword_2687ED710 != -1) {
LABEL_20:
  }
    swift_once();
LABEL_9:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_234E0E1D0;
  *(void *)(v33 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED988);
  *(void *)(v33 + 64) = sub_234E00B9C();
  *(void *)(v33 + 32) = MEMORY[0x263F8EE78];
  sub_234E0BD30();
  swift_bridgeObjectRelease();
  uint64_t v34 = type metadata accessor for Reply();
  uint64_t v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56);
  uint64_t v36 = v34;
  uint64_t v37 = v58;
  return v35(v37, 1, 1, v36);
}

void *initializeBufferWithCopyOfBuffer for Reply(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v8 = a3[6];
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_234E0BCA0();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = a3[8];
    uint64_t v15 = (void *)((char *)v4 + v13);
    uint64_t v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (char *)v4 + v14;
    uint64_t v19 = (uint64_t)a2 + v14;
    uint64_t v20 = sub_234E0BC50();
    uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16);
    swift_bridgeObjectRetain();
    v21(v18, v19, v20);
  }
  return v4;
}

uint64_t destroy for Reply(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_234E0BCA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  uint64_t v7 = sub_234E0BC50();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

uint64_t initializeWithCopy for Reply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_234E0BCA0();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = a1 + v13;
  uint64_t v18 = a2 + v13;
  uint64_t v19 = sub_234E0BC50();
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16);
  swift_bridgeObjectRetain();
  v20(v17, v18, v19);
  return a1;
}

uint64_t assignWithCopy for Reply(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_234E0BCA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[8];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_234E0BC50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

uint64_t initializeWithTake for Reply(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_234E0BCA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_234E0BC50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

uint64_t assignWithTake for Reply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_234E0BCA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  void *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_234E0BC50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for Reply(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_234E02BFC);
}

uint64_t sub_234E02BFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_234E0BCA0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_234E0BC50();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for Reply(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_234E02D3C);
}

uint64_t sub_234E02D3C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_234E0BCA0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_234E0BC50();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 32);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_234E02E68()
{
  uint64_t result = sub_234E0BCA0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_234E0BC50();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

long long *ReplyLayoutValues.phoneValues.unsafeMutableAddressor()
{
  if (qword_2687ED720 != -1) {
    swift_once();
  }
  return &static ReplyLayoutValues.phoneValues;
}

uint64_t sub_234E02F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v27 = a3;
  }
  else
  {
    type metadata accessor for ReplyBubbleView();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v6 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v7 = (void *)sub_234E0BDA0();
    uint64_t v8 = a1;
    id v9 = objc_msgSend(v6, sel_localizedStringForKey_value_table_, v7, 0, 0);

    a2 = sub_234E0BDD0();
    uint64_t v27 = v10;

    a1 = v8;
  }
  swift_bridgeObjectRetain();
  ACHTemplateIsMonthlyChallenge();
  int v11 = *(unsigned __int8 *)(a1 + 16);
  type metadata accessor for ReplyBubbleView();
  uint64_t v12 = swift_getObjCClassFromMetadata();
  id v13 = objc_msgSend(self, sel_bundleForClass_, v12);
  uint64_t v14 = (void *)sub_234E0BDA0();
  id v15 = objc_msgSend(v13, (SEL)&selRef_fontDescriptorWithSymbolicTraits_, v14, 0, 0);

  sub_234E0BDD0();
  swift_bridgeObjectRelease();

  if (v11 == 1)
  {
    uint64_t v16 = type metadata accessor for Reply();
    uint64_t v17 = sub_234E04D10(*(void *)(a1 + *(int *)(v16 + 28)), *(void *)(a1 + *(int *)(v16 + 28) + 8), 1);
    uint64_t v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_234E0E290;
    uint64_t v21 = MEMORY[0x263F8D310];
    *(void *)(v20 + 56) = MEMORY[0x263F8D310];
    unint64_t v22 = sub_234DFBE34();
    *(void *)(v20 + 32) = v17;
    *(void *)(v20 + 40) = v19;
    *(void *)(v20 + 96) = v21;
    *(void *)(v20 + 104) = v22;
    uint64_t v23 = (void *)(v20 + 80);
    *(void *)(v20 + 64) = v22;
    *(void *)(v20 + 72) = a2;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_234E0E1D0;
    *(void *)(v24 + 56) = MEMORY[0x263F8D310];
    *(void *)(v24 + 64) = sub_234DFBE34();
    *(void *)(v24 + 32) = a2;
    uint64_t v23 = (void *)(v24 + 40);
  }
  *uint64_t v23 = v27;
  uint64_t v25 = sub_234E0BDE0();
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t sub_234E032A0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16) == 1)
  {
    uint64_t v2 = type metadata accessor for Reply();
    uint64_t v3 = sub_234E04D10(*(void *)(a1 + *(int *)(v2 + 28)), *(void *)(a1 + *(int *)(v2 + 28) + 8), 1);
    uint64_t v5 = v4;
    type metadata accessor for ReplyBubbleView();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    int v11 = (void *)sub_234E0BDA0();
    id v12 = objc_msgSend(v7, sel_localizedStringForKey_value_table_, v11, 0, 0);

    sub_234E0BDD0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_234E0E1D0;
    *(void *)(v13 + 56) = MEMORY[0x263F8D310];
    *(void *)(v13 + 64) = sub_234DFBE34();
    *(void *)(v13 + 32) = v3;
    *(void *)(v13 + 40) = v5;
    uint64_t v14 = sub_234E0BDE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for ReplyBubbleView();
    uint64_t v8 = swift_getObjCClassFromMetadata();
    id v9 = objc_msgSend(self, sel_bundleForClass_, v8);
    uint64_t v10 = (void *)sub_234E0BDA0();
    id v15 = objc_msgSend(v9, sel_localizedStringForKey_value_table_, v10, 0, 0);

    uint64_t v14 = sub_234E0BDD0();
  }
  return v14;
}

uint64_t sub_234E03510@<X0>(uint64_t a1@<X8>)
{
  return sub_234E04938(v1 + 8, a1);
}

unint64_t sub_234E0351C(uint64_t a1, uint64_t a2)
{
  return sub_234E0353C(a1, a2, MEMORY[0x263F835F0], 0x4032000000000000);
}

unint64_t sub_234E0352C(uint64_t a1, uint64_t a2)
{
  return sub_234E0353C(a1, a2, MEMORY[0x263F83588], 0x402C000000000000);
}

unint64_t sub_234E0353C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  id v6 = objc_msgSend(self, sel_whiteColor);
  unint64_t v7 = sub_234E03ED0(v6, *a3, a4, 0);

  return v7;
}

unint64_t sub_234E035A8()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithWhite_alpha_, *(double *)(v0 + 128), 1.0);
  unint64_t v2 = sub_234E03ED0(v1, *MEMORY[0x263F83588], 0, 1);

  return v2;
}

id sub_234E03618(void *a1)
{
  return objc_msgSend(a1, sel__scaledValueForValue_, 26.0);
}

id sub_234E03628(void *a1)
{
  return objc_msgSend(a1, sel__scaledValueForValue_, 12.0);
}

id sub_234E03638(void *a1)
{
  return objc_msgSend(a1, sel__scaledValueForValue_, 16.0);
}

id sub_234E03648(void *a1)
{
  return objc_msgSend(a1, sel__scaledValueForValue_, 21.0);
}

id sub_234E03658(void *a1)
{
  return objc_msgSend(a1, sel__scaledValueForValue_, 14.0);
}

id sub_234E03668(void *a1)
{
  return objc_msgSend(a1, sel__scaledValueForValue_, 24.0);
}

uint64_t sub_234E03678(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Reply();
  return sub_234E04A80(*(void *)(a1 + *(int *)(v2 + 28)), *(void *)(a1 + *(int *)(v2 + 28) + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_234E036C8()
{
  id v0 = sub_234E050A8();
  id v1 = (id)ASShortNameForContactStoreContact();

  if (!v1) {
    return sub_234E04994();
  }
  uint64_t v2 = sub_234E0BDD0();

  return v2;
}

uint64_t sub_234E03734(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Reply();
  return sub_234E04D10(*(void *)(a1 + *(int *)(v2 + 28)), *(void *)(a1 + *(int *)(v2 + 28) + 8), 1);
}

double sub_234E03774()
{
  id v0 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F83588]);
  static ReplyLayoutValues.phoneValues = xmmword_234E0E3A0;
  *(_OWORD *)algn_2687EDFF0 = xmmword_234E0E3B0;
  xmmword_2687EE000 = 0x403E000000000000uLL;
  xmmword_2687EE010 = xmmword_234E0E3C0;
  xmmword_2687EE020 = xmmword_234E0E3D0;
  xmmword_2687EE030 = xmmword_234E0E3E0;
  xmmword_2687EE040 = xmmword_234E0E3F0;
  xmmword_2687EE050 = xmmword_234E0E400;
  xmmword_2687EE060 = xmmword_234E0E410;
  qword_2687EE070 = (uint64_t)v0;
  byte_2687EE078 = 1;
  *(void *)&xmmword_2687EE080 = 3;
  double result = 4.0;
  *(long long *)((char *)&xmmword_2687EE080 + 8) = xmmword_234E0E420;
  qword_2687EE098 = 2;
  byte_2687EE0A0 = 1;
  return result;
}

__n128 static ReplyLayoutValues.phoneValues.getter@<Q0>(uint64_t a1@<X8>)
{
  if (qword_2687ED720 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v18 = *(_OWORD *)&qword_2687EE070;
  long long v19 = xmmword_2687EE080;
  long long v20 = unk_2687EE090;
  char v21 = byte_2687EE0A0;
  long long v16 = xmmword_2687EE050;
  long long v17 = xmmword_2687EE060;
  long long v11 = xmmword_2687EE000;
  long long v12 = xmmword_2687EE010;
  long long v14 = xmmword_2687EE030;
  long long v15 = xmmword_2687EE040;
  long long v13 = xmmword_2687EE020;
  long long v9 = static ReplyLayoutValues.phoneValues;
  __n128 v10 = *(__n128 *)algn_2687EDFF0;
  sub_234E03940((uint64_t)&v9);
  long long v2 = v18;
  long long v3 = v20;
  *(_OWORD *)(a1 + 160) = v19;
  *(_OWORD *)(a1 + 176) = v3;
  long long v4 = v16;
  long long v5 = v17;
  *(_OWORD *)(a1 + 96) = v15;
  *(_OWORD *)(a1 + 112) = v4;
  *(unsigned char *)(a1 + 192) = v21;
  *(_OWORD *)(a1 + 128) = v5;
  *(_OWORD *)(a1 + 144) = v2;
  long long v6 = v12;
  *(_OWORD *)(a1 + 32) = v11;
  *(_OWORD *)(a1 + 48) = v6;
  long long v7 = v14;
  *(_OWORD *)(a1 + 64) = v13;
  *(_OWORD *)(a1 + 80) = v7;
  __n128 result = v10;
  *(_OWORD *)a1 = v9;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_234E03940(uint64_t a1)
{
  id v2 = *(id *)(a1 + 144);
  return a1;
}

uint64_t static ReplyLayoutValues.phoneValues.setter(uint64_t a1)
{
  if (qword_2687ED720 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v9[9] = *(_OWORD *)&qword_2687EE070;
  v9[10] = xmmword_2687EE080;
  v9[11] = unk_2687EE090;
  char v10 = byte_2687EE0A0;
  v9[7] = xmmword_2687EE050;
  v9[8] = xmmword_2687EE060;
  v9[2] = xmmword_2687EE000;
  v9[3] = xmmword_2687EE010;
  v9[5] = xmmword_2687EE030;
  v9[6] = xmmword_2687EE040;
  v9[4] = xmmword_2687EE020;
  v9[0] = static ReplyLayoutValues.phoneValues;
  v9[1] = *(_OWORD *)algn_2687EDFF0;
  long long v2 = *(_OWORD *)(a1 + 176);
  xmmword_2687EE080 = *(_OWORD *)(a1 + 160);
  unk_2687EE090 = v2;
  byte_2687EE0A0 = *(unsigned char *)(a1 + 192);
  long long v3 = *(_OWORD *)(a1 + 112);
  xmmword_2687EE040 = *(_OWORD *)(a1 + 96);
  xmmword_2687EE050 = v3;
  long long v4 = *(_OWORD *)(a1 + 144);
  xmmword_2687EE060 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)&qword_2687EE070 = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  xmmword_2687EE000 = *(_OWORD *)(a1 + 32);
  xmmword_2687EE010 = v5;
  long long v6 = *(_OWORD *)(a1 + 80);
  xmmword_2687EE020 = *(_OWORD *)(a1 + 64);
  xmmword_2687EE030 = v6;
  long long v7 = *(_OWORD *)(a1 + 16);
  static ReplyLayoutValues.phoneValues = *(_OWORD *)a1;
  *(_OWORD *)algn_2687EDFF0 = v7;
  sub_234E03940(a1);
  sub_234DF9FE8((uint64_t)v9);
  return sub_234DF9FE8(a1);
}

uint64_t (*static ReplyLayoutValues.phoneValues.modify())()
{
  if (qword_2687ED720 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

void destroy for ReplyLayoutPhone(uint64_t a1)
{
  swift_release();
  long long v2 = *(void **)(a1 + 152);
}

uint64_t initializeWithCopy for ReplyLayoutPhone(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  long long v3 = *(void **)(a2 + 152);
  *(void *)(a1 + 152) = v3;
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(unsigned char *)(a1 + 200) = *(unsigned char *)(a2 + 200);
  swift_retain();
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for ReplyLayoutPhone(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  id v4 = *(void **)(a2 + 152);
  long long v5 = *(void **)(a1 + 152);
  *(void *)(a1 + 152) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(unsigned char *)(a1 + 200) = *(unsigned char *)(a2 + 200);
  return a1;
}

__n128 __swift_memcpy201_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  long long v5 = *(_OWORD *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  __n128 result = *(__n128 *)(a2 + 144);
  long long v9 = *(_OWORD *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 185) = *(_OWORD *)(a2 + 185);
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 144) = result;
  return result;
}

uint64_t assignWithTake for ReplyLayoutPhone(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  long long v4 = *(void **)(a1 + 152);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);

  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(unsigned char *)(a1 + 200) = *(unsigned char *)(a2 + 200);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReplyLayoutPhone(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 201)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ReplyLayoutPhone(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 200) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 201) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 201) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ReplyLayoutPhone()
{
  return &type metadata for ReplyLayoutPhone;
}

unint64_t sub_234E03ED0(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  id v7 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_, a2);
  id v8 = objc_msgSend(v7, sel_fontDescriptorWithSymbolicTraits_, 0x8000);

  if (v8)
  {
    long long v9 = self;
    id v10 = objc_msgSend(v9, sel_fontWithDescriptor_size_, v8, 0.0);
    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F81650]), sel_init);
    id v12 = objc_msgSend(self, sel_defaultParagraphStyle);
    objc_msgSend(v11, sel_setParagraphStyle_, v12);

    if ((a4 & 1) == 0)
    {
      double v13 = *(double *)&a3;
      id v14 = objc_msgSend(v9, sel_fontWithDescriptor_size_, v8, 0.0);
      objc_msgSend(v14, sel__scaledValueForValue_, v13);
      double v16 = v15;
      objc_msgSend(v11, sel_setLineSpacing_, 0.0);
      objc_msgSend(v11, sel_setMinimumLineHeight_, v16);
      objc_msgSend(v11, sel_setMaximumLineHeight_, v16);
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687EDA20);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_234E0E430;
    long long v18 = (void *)*MEMORY[0x263F81540];
    *(void *)(inited + 32) = *MEMORY[0x263F81540];
    *(void *)(inited + 40) = v11;
    long long v19 = (void *)*MEMORY[0x263F814F0];
    *(void *)(inited + 48) = *MEMORY[0x263F814F0];
    *(void *)(inited + 56) = v10;
    long long v20 = (void *)*MEMORY[0x263F81500];
    *(void *)(inited + 64) = *MEMORY[0x263F81500];
    *(void *)(inited + 72) = a1;
    id v21 = v18;
    id v22 = v19;
    id v23 = v20;
    id v24 = a1;
    unint64_t v25 = sub_234E07C4C(inited);

    return v25;
  }
  else
  {
    sub_234E0BEF0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED980);
    uint64_t v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_234E0E1D0;
    uint64_t v28 = sub_234E0BDD0();
    uint64_t v30 = v29;
    *(void *)(v27 + 56) = MEMORY[0x263F8D310];
    *(void *)(v27 + 64) = sub_234DFBE34();
    *(void *)(v27 + 32) = v28;
    *(void *)(v27 + 40) = v30;
    if (qword_2687ED710 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_234E0E1D0;
    *(void *)(v31 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED988);
    *(void *)(v31 + 64) = sub_234E00B9C();
    *(void *)(v31 + 32) = v27;
    swift_bridgeObjectRetain();
    sub_234E0BD30();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v32 = MEMORY[0x263F8EE78];
    return sub_234E07C4C(v32);
  }
}

uint64_t sub_234E04244()
{
  uint64_t v0 = sub_234E0BD00();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  long long v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234E0BCF0();
  if (qword_2687ED730 != -1) {
    swift_once();
  }
  id v4 = (id)qword_2687EDB70;
  long long v5 = (void *)sub_234E0BCE0();
  objc_msgSend(v4, sel_setTimeZone_, v5);

  id v6 = (id)qword_2687EDB70;
  id v7 = (void *)sub_234E0BC20();
  id v8 = objc_msgSend(v6, sel_stringFromDate_, v7);

  uint64_t v9 = sub_234E0BDD0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v9;
}

uint64_t sub_234E043DC(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687EDA18);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_234E0BD00();
  uint64_t v34 = *(void *)(v5 - 8);
  uint64_t v35 = v5;
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED9F0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  double v13 = (char *)&v34 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED948);
  MEMORY[0x270FA5388](v14 - 8);
  double v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_234E0BC50();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  long long v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, sel_snapshotIndex);
  id v21 = (id)_HKActivityCacheDateComponentsFromCacheIndex();
  if (v21)
  {
    id v22 = v21;
    sub_234E0BBB0();

    uint64_t v23 = sub_234E0BBD0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v11, 0, 1, v23);
  }
  else
  {
    uint64_t v23 = sub_234E0BBD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v11, 1, 1, v23);
  }
  sub_234E01868((uint64_t)v11, (uint64_t)v13);
  sub_234E0BBD0();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v13, 1, v23) == 1)
  {
    sub_234E018D0((uint64_t)v13, &qword_2687ED9F0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
LABEL_7:
    sub_234E018D0((uint64_t)v16, &qword_2687ED948);
    return 0;
  }
  sub_234E0BBC0();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1) {
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v16, v17);
  sub_234E0BCC0();
  uint64_t v27 = v34;
  uint64_t v26 = v35;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v4, 1, v35) == 1)
  {
    sub_234E0BCF0();
    sub_234E018D0((uint64_t)v4, &qword_2687EDA18);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v7, v4, v26);
  }
  if (qword_2687ED730 != -1) {
    swift_once();
  }
  id v28 = (id)qword_2687EDB70;
  uint64_t v29 = (void *)sub_234E0BCE0();
  objc_msgSend(v28, sel_setTimeZone_, v29);

  id v30 = (id)qword_2687EDB70;
  uint64_t v31 = (void *)sub_234E0BC20();
  id v32 = objc_msgSend(v30, sel_stringFromDate_, v31);

  uint64_t v25 = sub_234E0BDD0();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v26);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  return v25;
}

uint64_t sub_234E04938(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_234E04994()
{
  if (*(void *)(v0 + 24))
  {
    uint64_t v1 = *(void *)(v0 + 16);
  }
  else
  {
    type metadata accessor for ReplyBubbleView();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    id v4 = (void *)sub_234E0BDA0();
    id v5 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, 0);

    uint64_t v1 = sub_234E0BDD0();
    uint64_t v7 = v6;

    *(void *)(v0 + 16) = v1;
    *(void *)(v0 + 24) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_234E04A80(uint64_t a1, uint64_t a2, char a3)
{
  v23[1] = *(id *)MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = (void *)sub_234E0BDA0();
    id v5 = (id)ASContactStorePredicateForDestination();

    id v6 = sub_234E04F78();
    sub_234E04FE4();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687EDA90);
    uint64_t v7 = (void *)sub_234E0BE70();
    swift_bridgeObjectRelease();
    v23[0] = 0;
    id v8 = objc_msgSend(v6, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v5, v7, v23);

    id v9 = v23[0];
    if (!v8)
    {
      id v19 = v23[0];
      long long v20 = (void *)sub_234E0BBE0();

      swift_willThrow();
      goto LABEL_18;
    }
    sub_234E05290();
    unint64_t v10 = sub_234E0BE80();
    id v11 = v9;

    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_234E0C020();
      swift_bridgeObjectRelease();
      if (v21) {
        goto LABEL_5;
      }
    }
    else if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_5:
      if ((v10 & 0xC000000000000001) != 0)
      {
        id v12 = (id)MEMORY[0x237DD1D30](0, v10);
      }
      else
      {
        if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          __break(1u);
        }
        id v12 = *(id *)(v10 + 32);
      }
      double v13 = v12;
      swift_bridgeObjectRelease();
      id v14 = (id)ASFullNameForContactStoreContact();
      if (v14)
      {
        uint64_t v15 = v14;
        a1 = sub_234E0BDD0();

        return a1;
      }

LABEL_18:
      swift_bridgeObjectRetain();
      return a1;
    }

    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  id v16 = sub_234E050A8();
  id v17 = (id)ASFullNameForContactStoreContact();

  if (!v17)
  {
    id v18 = sub_234E050A8();
    id v17 = (id)ASShortNameForContactStoreContact();

    if (!v17) {
      return sub_234E04994();
    }
  }
  a1 = sub_234E0BDD0();

  return a1;
}

uint64_t sub_234E04D10(uint64_t a1, uint64_t a2, char a3)
{
  v21[1] = *(id *)MEMORY[0x263EF8340];
  if ((a3 & 1) == 0)
  {
    id v15 = sub_234E050A8();
    id v16 = (id)ASShortNameForContactStoreContact();

    if (!v16) {
      return sub_234E04994();
    }
    a1 = sub_234E0BDD0();

    return a1;
  }
  id v4 = (void *)sub_234E0BDA0();
  id v5 = (id)ASContactStorePredicateForDestination();

  id v6 = sub_234E04F78();
  sub_234E04FE4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687EDA90);
  uint64_t v7 = (void *)sub_234E0BE70();
  swift_bridgeObjectRelease();
  v21[0] = 0;
  id v8 = objc_msgSend(v6, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v5, v7, v21);

  id v9 = v21[0];
  if (!v8)
  {
    id v17 = v21[0];
    id v18 = (void *)sub_234E0BBE0();

    swift_willThrow();
LABEL_15:
    swift_bridgeObjectRetain();
    return a1;
  }
  sub_234E05290();
  unint64_t v10 = sub_234E0BE80();
  id v11 = v9;

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_234E0C020();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
  if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_14:

    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
LABEL_5:
  if ((v10 & 0xC000000000000001) != 0)
  {
    id v12 = (id)MEMORY[0x237DD1D30](0, v10);
  }
  else
  {
    if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      __break(1u);
    }
    id v12 = *(id *)(v10 + 32);
  }
  double v13 = v12;
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v13, sel_givenName);
  a1 = sub_234E0BDD0();

  return a1;
}

id sub_234E04F78()
{
  uint64_t v1 = *(void **)(v0 + 32);
  if (v1)
  {
    id v2 = *(id *)(v0 + 32);
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEA58]), sel_init);
    id v4 = *(void **)(v0 + 32);
    *(void *)(v0 + 32) = v3;
    id v2 = v3;

    uint64_t v1 = 0;
  }
  id v5 = v1;
  return v2;
}

uint64_t sub_234E04FE4()
{
  if (*(void *)(v0 + 40))
  {
    uint64_t v1 = *(void *)(v0 + 40);
  }
  else
  {
    uint64_t v2 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED920);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_234E0E230;
    *(void *)(v1 + 32) = objc_msgSend(self, sel_descriptorForRequiredKeysForStyle_, 0);
    sub_234E0BE90();
    *(void *)(v2 + 40) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

id sub_234E050A8()
{
  uint64_t v1 = *(void **)(v0 + 48);
  id v2 = v1;
  if (v1 == (void *)1)
  {
    id v2 = sub_234E05108();
    id v3 = *(void **)(v0 + 48);
    *(void *)(v0 + 48) = v2;
    id v4 = v2;
    sub_234E05270(v3);
  }
  sub_234E05280(v1);
  return v2;
}

id sub_234E05108()
{
  v7[1] = *(id *)MEMORY[0x263EF8340];
  id v0 = sub_234E04F78();
  sub_234E04FE4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687EDA90);
  uint64_t v1 = (void *)sub_234E0BE70();
  swift_bridgeObjectRelease();
  v7[0] = 0;
  id v2 = objc_msgSend(v0, sel__ios_meContactWithKeysToFetch_error_, v1, v7);

  id v3 = v7[0];
  if (!v2)
  {
    id v4 = v3;
    id v5 = (void *)sub_234E0BBE0();

    swift_willThrow();
    return 0;
  }
  return v2;
}

uint64_t sub_234E051FC()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_234E05270(*(id *)(v0 + 48));
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for ContactFormatter()
{
  return self;
}

void sub_234E05270(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_234E05280(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

unint64_t sub_234E05290()
{
  unint64_t result = qword_2687EDAA0;
  if (!qword_2687EDAA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2687EDAA0);
  }
  return result;
}

char *sub_234E052D0(uint64_t a1, char a2)
{
  *(void *)&v2[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  sub_234DF9E1C(a1, (uint64_t)&v2[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_reply]);
  id v5 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v6 = v2;
  id v7 = objc_msgSend(v5, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(void *)&v6[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_userMessageLabel] = v7;
  id v8 = &v6[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_fittingSize];
  *(void *)id v8 = 0;
  *((void *)v8 + 1) = 0;
  v6[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_isPending] = a2;

  v35.receiver = v6;
  v35.super_class = (Class)type metadata accessor for ReplyBubbleView();
  id v9 = objc_msgSendSuper2(&v35, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v10 = qword_2687ED728;
  id v11 = v9;
  if (v10 != -1) {
    swift_once();
  }
  sub_234DF9E80((uint64_t)&qword_2687EE0B8, (uint64_t)v32);
  uint64_t v12 = v33;
  uint64_t v13 = v34;
  __swift_project_boxed_opaque_existential_1(v32, v33);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v13 + 8))(v36, v12, v13);
  double v14 = *(double *)v36;
  id v15 = objc_allocWithZone(MEMORY[0x263F825C8]);
  id v16 = (char *)v11;
  id v17 = objc_msgSend(v15, sel_initWithWhite_alpha_, v14, 1.0);
  objc_msgSend(v16, sel_setBackgroundColor_, v17);

  uint64_t v18 = OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_userMessageLabel;
  uint64_t v19 = *(void **)&v16[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_userMessageLabel];
  uint64_t v20 = v33;
  uint64_t v21 = v34;
  __swift_project_boxed_opaque_existential_1(v32, v33);
  uint64_t v31 = a1;
  id v22 = *(uint64_t (**)(uint64_t, uint64_t))(v21 + 16);
  id v23 = v19;
  swift_bridgeObjectRetain();
  uint64_t v24 = v22(v20, v21);
  sub_234DF97FC(v24);
  swift_bridgeObjectRelease();
  id v25 = objc_allocWithZone(MEMORY[0x263F086A0]);
  uint64_t v26 = (void *)sub_234E0BDA0();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_234DF9F28();
  uint64_t v27 = (void *)sub_234E0BD90();
  swift_bridgeObjectRelease();
  id v28 = objc_msgSend(v25, sel_initWithString_attributes_, v26, v27);

  objc_msgSend(v23, sel_setAttributedText_, v28);
  uint64_t v29 = *(void **)&v16[v18];
  objc_msgSend(v29, sel_setNumberOfLines_, v36[5]);
  objc_msgSend(v29, sel_setAllowsDefaultTighteningForTruncation_, 1);
  objc_msgSend(v29, sel_setLineBreakMode_, 4);
  objc_msgSend(v16, sel_addSubview_, v29);

  sub_234DF9FE8((uint64_t)v36);
  sub_234DFA014(v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  return v16;
}

uint64_t ReplyBubbleView.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate;
  swift_beginAccess();
  return MEMORY[0x237DD2A40](v1);
}

uint64_t ReplyBubbleView.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*ReplyBubbleView.delegate.modify(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x237DD2A40](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_234E05768;
}

void sub_234E05768(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

double ReplyBubbleView.fittingSize.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_fittingSize;
  swift_beginAccess();
  return *(double *)v1;
}

BOOL static ReplyBubbleViewTapBehavior.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t ReplyBubbleViewTapBehavior.hash(into:)()
{
  return sub_234E0C0B0();
}

uint64_t ReplyBubbleViewTapBehavior.hashValue.getter()
{
  return sub_234E0C0C0();
}

BOOL sub_234E058B8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_234E058D0()
{
  return sub_234E0C0C0();
}

uint64_t sub_234E05918()
{
  return sub_234E0C0B0();
}

uint64_t sub_234E05944()
{
  return sub_234E0C0C0();
}

Swift::Void __swiftcall ReplyBubbleView.layoutSubviews()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED980);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_234E0E1D0;
  objc_msgSend(v1, sel_bounds);
  uint64_t v3 = sub_234E0BF30();
  uint64_t v5 = v4;
  *(void *)(v2 + 56) = MEMORY[0x263F8D310];
  *(void *)(v2 + 64) = sub_234DFBE34();
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v5;
  sub_234E0BF00();
  if (qword_2687ED710 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_234E0E1D0;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED988);
  *(void *)(v6 + 56) = v7;
  unint64_t v8 = sub_234E00B9C();
  *(void *)(v6 + 64) = v8;
  *(void *)(v6 + 32) = v2;
  swift_bridgeObjectRetain();
  sub_234E0BD30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_bounds);
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = (double *)&v1[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_fittingSize];
  swift_beginAccess();
  if (v10 == *v13 && v12 == v13[1])
  {
    sub_234E0BF00();
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_234E0E1D0;
    *(void *)(v14 + 56) = v7;
    *(void *)(v14 + 64) = v8;
    *(void *)(v14 + 32) = MEMORY[0x263F8EE78];
    sub_234E0BD30();
    swift_bridgeObjectRelease();
    return;
  }
  if (qword_2687ED728 != -1) {
    swift_once();
  }
  sub_234DF9E80((uint64_t)&qword_2687EE0B8, (uint64_t)v68);
  uint64_t v15 = v69;
  uint64_t v16 = v70;
  __swift_project_boxed_opaque_existential_1(v68, v69);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v16 + 8))(v71, v15, v16);
  uint64_t v17 = v69;
  uint64_t v18 = v70;
  __swift_project_boxed_opaque_existential_1(v68, v69);
  objc_msgSend(v1, sel_bounds);
  double v23 = sub_234E098E0(v1[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_reply + 16], v17, v18, v19, v20, v21, v22);
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  double v30 = v72;
  if (v1[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_isPending]) {
    double v31 = v73;
  }
  else {
    double v31 = v72;
  }
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_234E0E1D0;
  *(void *)(v32 + 56) = MEMORY[0x263F8EF38];
  *(void *)(v32 + 64) = sub_234E0617C();
  *(double *)(v32 + 32) = v31;
  sub_234E0BF00();
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_234E0E1D0;
  *(void *)(v33 + 56) = v7;
  *(void *)(v33 + 64) = v8;
  *(void *)(v33 + 32) = v32;
  swift_bridgeObjectRetain();
  sub_234E0BD30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v74.origin.CGFloat x = v23;
  v74.origin.CGFloat y = v25;
  v74.size.CGFloat width = v27;
  v74.size.double height = v29;
  CGFloat Width = CGRectGetWidth(v74);
  objc_super v35 = *(void **)&v1[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_userMessageLabel];
  objc_msgSend(v35, sel_sizeThatFits_, Width - v30 - v31, 1.79769313e308);
  double v37 = v36;
  double v39 = v38;
  v75.origin.CGFloat x = v23;
  v75.origin.CGFloat y = v25;
  v75.size.CGFloat width = v27;
  v75.size.double height = v29;
  objc_msgSend(v35, sel_setFrame_, v30 + CGRectGetMinX(v75), 0.0, v37, v39);
  uint64_t v40 = v69;
  uint64_t v41 = v70;
  __swift_project_boxed_opaque_existential_1(v68, v69);
  id v42 = objc_msgSend(v35, sel_font);
  if (!v42)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v43 = v42;
  CGFloat v66 = v27;
  CGFloat v67 = v25;
  double v44 = (*(double (**)(id, uint64_t, uint64_t))(v41 + 48))(v42, v40, v41);

  objc_msgSend(v35, sel__setFirstLineBaselineFrameOriginY_, v44);
  objc_msgSend(v35, sel_frame);
  double MaxX = CGRectGetMaxX(v76);
  objc_msgSend(v35, sel__lastLineBaselineFrameOriginY);
  double v47 = v46;
  uint64_t v48 = v69;
  uint64_t v49 = v70;
  __swift_project_boxed_opaque_existential_1(v68, v69);
  id v50 = objc_msgSend(v35, sel_font);
  if (!v50)
  {
LABEL_17:
    __break(1u);
    return;
  }
  uint64_t v51 = v50;
  double v52 = v31 + MaxX;
  double v53 = (*(double (**)(id, uint64_t, uint64_t))(v49 + 64))(v50, v48, v49);

  double v54 = v47 + v53;
  if (objc_msgSend(v1, sel_effectiveUserInterfaceLayoutDirection) == (id)1)
  {
    objc_msgSend(v35, sel_frame);
    CGFloat v56 = v55;
    CGFloat v58 = v57;
    double v60 = v59;
    double v62 = v61;
    v77.origin.CGFloat x = v23;
    v77.size.CGFloat width = v66;
    v77.origin.CGFloat y = v67;
    v77.size.double height = v29;
    double v63 = CGRectGetWidth(v77);
    v78.origin.CGFloat x = v56;
    v78.origin.CGFloat y = v58;
    v78.size.CGFloat width = v60;
    v78.size.double height = v62;
    double v64 = v63 - CGRectGetMinX(v78);
    v79.origin.CGFloat x = v56;
    v79.origin.CGFloat y = v58;
    v79.size.CGFloat width = v60;
    v79.size.double height = v62;
    double v65 = v64 - CGRectGetWidth(v79);
    v80.origin.CGFloat x = v56;
    v80.origin.CGFloat y = v58;
    v80.size.CGFloat width = v60;
    v80.size.double height = v62;
    objc_msgSend(v35, sel_setFrame_, v65, CGRectGetMinY(v80), v60, v62);
  }
  sub_234DF9FE8((uint64_t)v71);
  double *v13 = v52;
  v13[1] = v54;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
}

id ReplyBubbleView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReplyBubbleView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_234E0617C()
{
  unint64_t result = qword_2687EDAC0;
  if (!qword_2687EDAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687EDAC0);
  }
  return result;
}

uint64_t type metadata accessor for ReplyBubbleView()
{
  uint64_t result = qword_2687EDAD8;
  if (!qword_2687EDAD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_234E06220()
{
  unint64_t result = qword_2687EDAD0;
  if (!qword_2687EDAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687EDAD0);
  }
  return result;
}

__n128 sub_234E06274@<Q0>(void *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_fittingSize);
  swift_beginAccess();
  __n128 result = *v3;
  *a2 = *v3;
  return result;
}

uint64_t sub_234E062C8(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_fittingSize);
  uint64_t result = swift_beginAccess();
  void *v4 = v2;
  v4[1] = v3;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ReplyBubbleViewTapBehavior(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ReplyBubbleViewTapBehavior(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x234E06488);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_234E064B0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_234E064BC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ReplyBubbleViewTapBehavior()
{
  return &type metadata for ReplyBubbleViewTapBehavior;
}

uint64_t sub_234E064D8()
{
  return type metadata accessor for ReplyBubbleView();
}

uint64_t sub_234E064E0()
{
  uint64_t result = type metadata accessor for Reply();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_234E0659C(uint64_t a1)
{
  return a1;
}

char *sub_234E065C4(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  unsigned int v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    BOOL v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    BOOL v7 = a1;
    int v8 = a2[1];
    *((void *)a1 + 1) = v8;
    uint64_t v9 = a3[6];
    double v10 = &a1[v9];
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = *(uint64_t *)((char *)a2 + v9 + 8);
    *(void *)double v10 = *(char **)((char *)a2 + v9);
    *((void *)v10 + 1) = v12;
    v10[16] = *((unsigned char *)a2 + v9 + 16);
    uint64_t v13 = (int *)type metadata accessor for Reply();
    uint64_t v14 = v13[6];
    uint64_t v41 = v11 + v14;
    id v42 = &v10[v14];
    uint64_t v15 = sub_234E0BCA0();
    uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
    uint64_t v16 = v4;
    uint64_t v17 = v8;
    swift_bridgeObjectRetain();
    v40(v42, v41, v15);
    uint64_t v18 = v13[7];
    CGFloat v19 = &v10[v18];
    CGFloat v20 = (void *)(v11 + v18);
    uint64_t v21 = v20[1];
    *(void *)CGFloat v19 = *v20;
    *((void *)v19 + 1) = v21;
    uint64_t v22 = v13[8];
    double v23 = &v10[v22];
    uint64_t v24 = v11 + v22;
    uint64_t v25 = sub_234E0BC50();
    double v26 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16);
    swift_bridgeObjectRetain();
    v26(v23, v24, v25);
    uint64_t v27 = a3[7];
    uint64_t v28 = a3[8];
    CGFloat v29 = *(char **)((char *)a2 + v27);
    *(void *)&v7[v27] = v29;
    double v30 = *(char **)((char *)a2 + v28);
    *(void *)&v7[v28] = v30;
    uint64_t v31 = a3[9];
    uint64_t v32 = a3[10];
    uint64_t v33 = *(char **)((char *)a2 + v31);
    *(void *)&v7[v31] = v33;
    uint64_t v34 = *(char **)((char *)a2 + v32);
    *(void *)&v7[v32] = v34;
    id v35 = v29;
    id v36 = v30;
    id v37 = v33;
    id v38 = v34;
  }
  return v7;
}

void sub_234E0679C(id *a1, int *a2)
{
  unsigned int v4 = (char *)a1 + a2[6];
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for Reply();
  unsigned int v6 = &v4[*(int *)(v5 + 24)];
  uint64_t v7 = sub_234E0BCA0();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  int v8 = &v4[*(int *)(v5 + 32)];
  uint64_t v9 = sub_234E0BC50();
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  double v10 = *(id *)((char *)a1 + a2[10]);
}

void *sub_234E068C8(void *a1, uint64_t a2, int *a3)
{
  unsigned int v6 = *(void **)a2;
  uint64_t v7 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v7;
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = *(void *)(a2 + v8 + 8);
  *(void *)uint64_t v9 = *(void *)(a2 + v8);
  *((void *)v9 + 1) = v11;
  v9[16] = *(unsigned char *)(a2 + v8 + 16);
  uint64_t v12 = (int *)type metadata accessor for Reply();
  uint64_t v13 = v12[6];
  uint64_t v40 = v10 + v13;
  uint64_t v41 = &v9[v13];
  uint64_t v14 = sub_234E0BCA0();
  double v39 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  id v15 = v6;
  id v16 = v7;
  swift_bridgeObjectRetain();
  v39(v41, v40, v14);
  uint64_t v17 = v12[7];
  uint64_t v18 = &v9[v17];
  CGFloat v19 = (void *)(v10 + v17);
  uint64_t v20 = v19[1];
  *(void *)uint64_t v18 = *v19;
  *((void *)v18 + 1) = v20;
  uint64_t v21 = v12[8];
  uint64_t v22 = &v9[v21];
  uint64_t v23 = v10 + v21;
  uint64_t v24 = sub_234E0BC50();
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16);
  swift_bridgeObjectRetain();
  v25(v22, v23, v24);
  uint64_t v26 = a3[7];
  uint64_t v27 = a3[8];
  uint64_t v28 = *(void **)(a2 + v26);
  *(void *)((char *)a1 + v26) = v28;
  CGFloat v29 = *(void **)(a2 + v27);
  *(void *)((char *)a1 + v27) = v29;
  uint64_t v30 = a3[9];
  uint64_t v31 = a3[10];
  uint64_t v32 = *(void **)(a2 + v30);
  *(void *)((char *)a1 + v30) = v32;
  uint64_t v33 = *(void **)(a2 + v31);
  *(void *)((char *)a1 + v31) = v33;
  id v34 = v28;
  id v35 = v29;
  id v36 = v32;
  id v37 = v33;
  return a1;
}

uint64_t sub_234E06A4C(uint64_t a1, uint64_t a2, int *a3)
{
  unsigned int v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  uint64_t v9 = *(void **)(a2 + 8);
  uint64_t v10 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v9;
  id v11 = v9;

  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(void *)uint64_t v13 = *(void *)(a2 + v12);
  *(void *)(v13 + 8) = *(void *)(a2 + v12 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v13 + 16) = *(unsigned char *)(v14 + 16);
  id v15 = (int *)type metadata accessor for Reply();
  uint64_t v16 = v15[6];
  uint64_t v17 = v13 + v16;
  uint64_t v18 = v14 + v16;
  uint64_t v19 = sub_234E0BCA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  uint64_t v20 = v15[7];
  uint64_t v21 = (void *)(v13 + v20);
  uint64_t v22 = (void *)(v14 + v20);
  void *v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = v15[8];
  uint64_t v24 = v13 + v23;
  uint64_t v25 = v14 + v23;
  uint64_t v26 = sub_234E0BC50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 24))(v24, v25, v26);
  uint64_t v27 = a3[7];
  uint64_t v28 = *(void **)(a2 + v27);
  CGFloat v29 = *(void **)(a1 + v27);
  *(void *)(a1 + v27) = v28;
  id v30 = v28;

  uint64_t v31 = a3[8];
  uint64_t v32 = *(void **)(a2 + v31);
  uint64_t v33 = *(void **)(a1 + v31);
  *(void *)(a1 + v31) = v32;
  id v34 = v32;

  uint64_t v35 = a3[9];
  id v36 = *(void **)(a2 + v35);
  id v37 = *(void **)(a1 + v35);
  *(void *)(a1 + v35) = v36;
  id v38 = v36;

  uint64_t v39 = a3[10];
  uint64_t v40 = *(void **)(a1 + v39);
  uint64_t v41 = *(void **)(a2 + v39);
  *(void *)(a1 + v39) = v41;
  id v42 = v41;

  return a1;
}

_OWORD *sub_234E06C14(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  *(_OWORD *)uint64_t v7 = *(_OWORD *)((char *)a2 + v6);
  v7[16] = *((unsigned char *)a2 + v6 + 16);
  uint64_t v9 = (int *)type metadata accessor for Reply();
  uint64_t v10 = v9[6];
  id v11 = &v7[v10];
  uint64_t v12 = &v8[v10];
  uint64_t v13 = sub_234E0BCA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  *(_OWORD *)&v7[v9[7]] = *(_OWORD *)&v8[v9[7]];
  uint64_t v14 = v9[8];
  id v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  uint64_t v17 = sub_234E0BC50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  uint64_t v18 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v18) = *(void *)((char *)a2 + v18);
  uint64_t v19 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v19) = *(void *)((char *)a2 + v19);
  return a1;
}

uint64_t sub_234E06D4C(uint64_t a1, void *a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = a2[1];

  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = *(void *)((char *)a2 + v8 + 8);
  *(void *)uint64_t v9 = *(void *)((char *)a2 + v8);
  *(void *)(v9 + 8) = v11;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v9 + 16) = v10[16];
  uint64_t v12 = (int *)type metadata accessor for Reply();
  uint64_t v13 = v12[6];
  uint64_t v14 = v9 + v13;
  id v15 = &v10[v13];
  uint64_t v16 = sub_234E0BCA0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  uint64_t v17 = v12[7];
  uint64_t v18 = (void *)(v9 + v17);
  uint64_t v19 = &v10[v17];
  uint64_t v21 = *(void *)v19;
  uint64_t v20 = *((void *)v19 + 1);
  void *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = v12[8];
  uint64_t v23 = v9 + v22;
  uint64_t v24 = &v10[v22];
  uint64_t v25 = sub_234E0BC50();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v25 - 8) + 40))(v23, v24, v25);
  uint64_t v26 = a3[7];
  uint64_t v27 = *(void **)(a1 + v26);
  *(void *)(a1 + v26) = *(void *)((char *)a2 + v26);

  uint64_t v28 = a3[8];
  CGFloat v29 = *(void **)(a1 + v28);
  *(void *)(a1 + v28) = *(void *)((char *)a2 + v28);

  uint64_t v30 = a3[9];
  uint64_t v31 = *(void **)(a1 + v30);
  *(void *)(a1 + v30) = *(void *)((char *)a2 + v30);

  uint64_t v32 = a3[10];
  uint64_t v33 = *(void **)(a1 + v32);
  *(void *)(a1 + v32) = *(void *)((char *)a2 + v32);

  return a1;
}

uint64_t sub_234E06EDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_234E06EF0);
}

uint64_t sub_234E06EF0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Reply();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_234E06FA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_234E06FB4);
}

void *sub_234E06FB4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Reply();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for CompetitionScoreRenderer()
{
  uint64_t result = qword_2687EDAE8;
  if (!qword_2687EDAE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_234E070A8()
{
  uint64_t result = type metadata accessor for Reply();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_234E07154(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  return MEMORY[0x270FA2498](sub_234E07174, 0, 0);
}

uint64_t sub_234E07174()
{
  if (*(unsigned char *)(v0[6] + 16) == 1)
  {
    uint64_t v1 = MEMORY[0x263F8EE78];
    sub_234E07D58(MEMORY[0x263F8EE78]);
    sub_234E07E64(v1, &qword_2687EDB58);
    sub_234E07E64(v1, &qword_2687EDB50);
    id v2 = objc_allocWithZone(MEMORY[0x263F23BD0]);
    sub_234E09538(0, &qword_2687EDB20);
    sub_234E09538(0, &qword_2687EDB28);
    sub_234E094D0();
    int v3 = (void *)sub_234E0BD90();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687EDB38);
    uint64_t v4 = (void *)sub_234E0BD90();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687EDB40);
    uint64_t v5 = (void *)sub_234E0BD90();
    swift_bridgeObjectRelease();
    sub_234E09538(0, &qword_2687EDB48);
    uint64_t v6 = (void *)sub_234E0BE70();
    id v7 = objc_msgSend(v2, sel_initWithActivitySnapshots_friendAchievements_friendWorkouts_contact_competitions_, v3, v4, v5, 0, v6);

    uint64_t v8 = (uint64_t (*)(id))v0[1];
    return v8(v7);
  }
  else
  {
    sub_234E0BD20();
    v0[7] = sub_234E0BD10();
    uint64_t v11 = (uint64_t (*)(void))((int)*MEMORY[0x263F23F98] + MEMORY[0x263F23F98]);
    uint64_t v10 = (void *)swift_task_alloc();
    v0[8] = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_234E07400;
    return v11();
  }
}

uint64_t sub_234E07400()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_234E074FC, 0, 0);
}

uint64_t sub_234E074FC()
{
  type metadata accessor for Reply();
  uint64_t v1 = sub_234E0BC60();
  uint64_t v3 = v2;
  *(void *)(v0 + 72) = v2;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))((int)*MEMORY[0x263F23F90] + MEMORY[0x263F23F90]);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v4;
  void *v4 = v0;
  v4[1] = sub_234E075D4;
  return v6(v1, v3);
}

uint64_t sub_234E075D4(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[11] = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_234E078D0, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    v4[12] = a1;
    uint64_t v7 = (uint64_t (*)(void))((int)*MEMORY[0x263F23F88] + MEMORY[0x263F23F88]);
    uint64_t v5 = (void *)swift_task_alloc();
    v4[13] = v5;
    void *v5 = v4;
    v5[1] = sub_234E07770;
    return v7();
  }
}

uint64_t sub_234E07770()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_234E0786C, 0, 0);
}

uint64_t sub_234E0786C()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_234E078D0()
{
  swift_bridgeObjectRelease();
  sub_234E0BEF0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED980);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_234E0E1D0;
  swift_getErrorValue();
  uint64_t v2 = sub_234E0C090();
  uint64_t v4 = v3;
  *(void *)(v1 + 56) = MEMORY[0x263F8D310];
  *(void *)(v1 + 64) = sub_234DFBE34();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v4;
  if (qword_2687ED710 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_234E0E1D0;
  *(void *)(v5 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED988);
  *(void *)(v5 + 64) = sub_234DFE7B0((unint64_t *)&qword_2687ED990, &qword_2687ED988);
  *(void *)(v5 + 32) = v1;
  swift_bridgeObjectRetain();
  sub_234E0BD30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = (uint64_t (*)(void))((int)*MEMORY[0x263F23F88] + MEMORY[0x263F23F88]);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v6;
  void *v6 = v0;
  v6[1] = sub_234E07AE4;
  return v8();
}

uint64_t sub_234E07AE4()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_234E07BE0, 0, 0);
}

uint64_t sub_234E07BE0()
{
  uint64_t v1 = *(void **)(v0 + 56);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2(0);
}

unint64_t sub_234E07C4C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687EDB68);
  uint64_t v2 = (void *)sub_234E0C030();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_unknownObjectRetain();
    unint64_t result = sub_234E09574((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_234E07D58(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687EDB60);
  uint64_t v2 = (void *)sub_234E0C030();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_234E09608((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_234E07E64(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_234E0C030();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v6 = *v5;
    id v7 = (id)*(v5 - 1);
    swift_bridgeObjectRetain();
    unint64_t result = sub_234E09608((uint64_t)v7);
    if (v9) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v3[6] + v10) = v7;
    *(void *)(v3[7] + v10) = v6;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v3[2] = v13;
    v5 += 2;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_234E07F6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v43 = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687EDAF8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v12 = self;
  id v13 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, a3);
  id v14 = objc_msgSend(v12, sel_stringWithNumber_decimalPrecision_, v13, 1);

  if (v14)
  {
    uint64_t v15 = sub_234E0BDD0();
    uint64_t v17 = v16;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
    uint64_t v18 = swift_allocObject();
    uint64_t v19 = MEMORY[0x263F8D9D0];
    *(_OWORD *)(v18 + 16) = xmmword_234E0E1D0;
    uint64_t v20 = MEMORY[0x263F8DA20];
    *(void *)(v18 + 56) = v19;
    *(void *)(v18 + 64) = v20;
    *(void *)(v18 + 32) = a3;
    uint64_t v15 = sub_234E0BDE0();
    uint64_t v17 = v21;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_234E0E290;
  uint64_t v23 = MEMORY[0x263F8D310];
  *(void *)(v22 + 56) = MEMORY[0x263F8D310];
  unint64_t v24 = sub_234DFBE34();
  *(void *)(v22 + 32) = a1;
  *(void *)(v22 + 40) = a2;
  *(void *)(v22 + 96) = v23;
  *(void *)(v22 + 104) = v24;
  *(void *)(v22 + 64) = v24;
  *(void *)(v22 + 72) = v15;
  *(void *)(v22 + 80) = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_234E0BDE0();
  uint64_t v27 = v26;
  swift_bridgeObjectRetain();
  sub_234DF97FC(a5);
  id v28 = objc_allocWithZone(MEMORY[0x263F089B8]);
  CGFloat v29 = (void *)sub_234E0BDA0();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_234DF9F28();
  uint64_t v30 = sub_234E0BD90();
  swift_bridgeObjectRelease();
  id v31 = objc_msgSend(v28, sel_initWithString_attributes_, v29, v30);

  uint64_t v46 = v25;
  uint64_t v47 = v27;
  uint64_t v44 = v15;
  uint64_t v45 = v17;
  uint64_t v32 = sub_234E0BCB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v11, 1, 1, v32);
  sub_234E0941C();
  uint64_t v33 = sub_234E0BFA0();
  uint64_t v35 = v34;
  LOBYTE(v30) = v36;
  sub_234E09470((uint64_t)v11);
  swift_bridgeObjectRelease();
  if (v30)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v37 = *MEMORY[0x263F81500];
    uint64_t v46 = v33;
    uint64_t v47 = v35;
    uint64_t v44 = v25;
    uint64_t v45 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687EDB08);
    sub_234DFE7B0(&qword_2687EDB10, &qword_2687EDB08);
    uint64_t v38 = sub_234E0BF70();
    objc_msgSend(v31, sel_addAttribute_value_range_, v37, v43, v38, v39);
  }
  id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v40, sel_setAttributedText_, v31);
  objc_msgSend(v40, sel_setNumberOfLines_, 1);

  return v40;
}

id sub_234E08378@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = sub_234E0BC50();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v93 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED948);
  MEMORY[0x270FA5388](v12 - 8);
  id v14 = (char *)&v93 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a4 = a1;
  CGFloat v107 = (int *)type metadata accessor for CompetitionScoreRenderer();
  sub_234DF9E1C(a2, (uint64_t)a4 + v107[6]);
  double v108 = a4;
  a4[1] = a3;
  uint64_t v15 = qword_2687ED728;
  id v16 = a1;
  id v17 = a3;
  if (v15 != -1) {
    swift_once();
  }
  sub_234DF9E80((uint64_t)&qword_2687EE0B8, (uint64_t)v109);
  uint64_t v18 = v110;
  uint64_t v19 = v111;
  __swift_project_boxed_opaque_existential_1(v109, v110);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v19 + 8))(v112, v18, v19);
  objc_msgSend(v16, sel_victoryBadgeStyle);
  uint64_t v102 = type metadata accessor for Reply();
  uint64_t v20 = (void *)sub_234E0BC70();
  id v106 = (id)ASEphemeralCompetitionVictoryAchievementForStyle();

  id v21 = objc_msgSend(v16, sel_endDate);
  if (!v21)
  {
    id result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v14, 1, 1, v8);
    goto LABEL_32;
  }
  uint64_t v22 = v21;
  sub_234E0BC30();

  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v11, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v14, 0, 1, v8);
  id result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8);
  if (result == 1)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  unint64_t v24 = (void *)sub_234E0BC20();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  id v25 = objc_msgSend(v16, sel_victoryBadgeStyle);
  id v26 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, v25);
  id v27 = (id)ASEphemeralEarnedAchievement();

  id v99 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F238B0]), sel_init);
  id v28 = objc_msgSend(v99, sel_thumbnailImageForAchievement_size_, v27, v113, v113);
  id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v28);
  *(void *)((char *)v108 + v107[7]) = v29;
  objc_msgSend(v29, sel_setContentMode_, 1);
  uint64_t v30 = v110;
  uint64_t v31 = v111;
  __swift_project_boxed_opaque_existential_1(v109, v110);
  uint64_t v104 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 136))(a2, v30, v31);
  uint64_t v105 = v32;
  char v33 = *(unsigned char *)(a2 + 16);
  id v101 = v27;
  id v100 = v28;
  if (v33)
  {
    uint64_t v34 = v110;
    uint64_t v35 = v111;
    __swift_project_boxed_opaque_existential_1(v109, v110);
    uint64_t v36 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 144))(a2, v34, v35);
    uint64_t v95 = v37;
    uint64_t v38 = 0;
    uint64_t v39 = &selRef_opponentTotalScore;
    uint64_t v40 = 1;
    uint64_t v41 = &selRef_myTotalScore;
    goto LABEL_11;
  }
  id result = objc_msgSend(v17, sel_contact);
  if (!result) {
    goto LABEL_33;
  }
  uint64_t v42 = result;
  id v43 = objc_msgSend(result, sel_shortName);

  if (v43 || (result = objc_msgSend(v17, sel_displayName), (id v43 = result) != 0))
  {
    uint64_t v36 = sub_234E0BDD0();
    uint64_t v95 = v44;

    uint64_t v40 = 0;
    uint64_t v39 = &selRef_myTotalScore;
    uint64_t v38 = 1;
    uint64_t v41 = &selRef_opponentTotalScore;
LABEL_11:
    id v98 = v17;
    id v45 = [v16 *v41];
    id v46 = [v16 *v39];
    uint64_t v47 = self;
    uint64_t v93 = v38;
    id v48 = objc_msgSend(v47, sel_as_colorForParticipant_competition_, v38, v16);
    id v49 = objc_msgSend(v47, sel_as_colorForParticipant_competition_, v40, v16);
    uint64_t v50 = v110;
    uint64_t v51 = v111;
    __swift_project_boxed_opaque_existential_1(v109, v110);
    uint64_t v52 = (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 24))(v50, v51);
    uint64_t v94 = v36;
    uint64_t v53 = v36;
    uint64_t v54 = v95;
    id v96 = v49;
    id v55 = sub_234E07F6C(v53, v95, (uint64_t)v46, (uint64_t)v49, v52);
    CGFloat v56 = v107;
    double v57 = v108;
    *(void *)((char *)v108 + v107[8]) = v55;
    id v97 = v48;
    id v58 = sub_234E07F6C(v104, v105, (uint64_t)v45, (uint64_t)v48, v52);
    swift_bridgeObjectRelease();
    *(void *)((char *)v57 + v56[9]) = v58;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED980);
    uint64_t v59 = swift_allocObject();
    long long v103 = xmmword_234E0E1D0;
    *(_OWORD *)(v59 + 16) = xmmword_234E0E1D0;
    uint64_t v102 = a2;
    uint64_t v60 = sub_234E0BC00();
    uint64_t v62 = v61;
    *(void *)(v59 + 56) = MEMORY[0x263F8D310];
    unint64_t v63 = sub_234DFBE34();
    *(void *)(v59 + 64) = v63;
    *(void *)(v59 + 32) = v60;
    *(void *)(v59 + 40) = v62;
    sub_234E0BF00();
    if (qword_2687ED710 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
    uint64_t v64 = swift_allocObject();
    *(_OWORD *)(v64 + 16) = v103;
    *(void *)(v64 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED988);
    *(void *)(v64 + 64) = sub_234DFE7B0((unint64_t *)&qword_2687ED990, &qword_2687ED988);
    *(void *)(v64 + 32) = v59;
    swift_bridgeObjectRetain();
    sub_234E0BD30();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v65 = (void *)sub_234E0BC20();
    objc_msgSend(v16, sel_setCurrentDateOverride_, v65);

    if (objc_msgSend(v16, sel_stage) == (id)1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v66 = ASCompetitionStageStringWithCompetition(v16);
      CGFloat v67 = v98;
      if (!v66)
      {

        sub_234DF9FE8((uint64_t)v112);
        sub_234DFA014(v102);
        *(void *)((char *)v108 + v107[10]) = 0;
        return (id)__swift_destroy_boxed_opaque_existential_1((uint64_t)v109);
      }
      id v68 = v66;
      sub_234E0BDD0();
    }
    else
    {
      unsigned int v69 = objc_msgSend(v16, sel_isScoreTied);
      CGFloat v67 = v98;
      if (v69)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        type metadata accessor for ReplyBubbleView();
        uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
        id v71 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
        double v72 = (void *)sub_234E0BDA0();
        id v73 = objc_msgSend(v71, sel_localizedStringForKey_value_table_, v72, 0, 0);

        sub_234E0BDD0();
      }
      else
      {
        BOOL v74 = objc_msgSend(v16, sel_isParticipantWinning_, v93) == 0;
        if (v74) {
          uint64_t v75 = v94;
        }
        else {
          uint64_t v75 = v104;
        }
        if (v74) {
          uint64_t v76 = v54;
        }
        else {
          uint64_t v76 = v105;
        }
        swift_bridgeObjectRelease();
        type metadata accessor for ReplyBubbleView();
        uint64_t v77 = swift_getObjCClassFromMetadata();
        id v78 = objc_msgSend(self, sel_bundleForClass_, v77);
        CGRect v79 = (void *)sub_234E0BDA0();
        id v80 = objc_msgSend(v78, sel_localizedStringForKey_value_table_, v79, 0, 0);

        sub_234E0BDD0();
        uint64_t v81 = swift_allocObject();
        *(_OWORD *)(v81 + 16) = v103;
        *(void *)(v81 + 56) = MEMORY[0x263F8D310];
        *(void *)(v81 + 64) = v63;
        *(void *)(v81 + 32) = v75;
        *(void *)(v81 + 40) = v76;
        sub_234E0BDE0();
        swift_bridgeObjectRelease();
      }
    }
    id v82 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    *(void *)((char *)v108 + v107[10]) = v82;
    if (v82)
    {
      uint64_t v83 = v82;
      objc_msgSend(v82, sel_setNumberOfLines_, 1);
      objc_msgSend(v83, sel_setLineBreakMode_, 4);
      uint64_t v84 = v110;
      uint64_t v85 = v111;
      __swift_project_boxed_opaque_existential_1(v109, v110);
      double v86 = *(uint64_t (**)(uint64_t, uint64_t))(v85 + 32);
      id v87 = v83;
      uint64_t v88 = v86(v84, v85);
      sub_234DF97FC(v88);
      swift_bridgeObjectRelease();
      id v89 = objc_allocWithZone(MEMORY[0x263F086A0]);
      uint64_t v90 = (void *)sub_234E0BDA0();
      swift_bridgeObjectRelease();
      type metadata accessor for Key(0);
      sub_234DF9F28();
      double v91 = (void *)sub_234E0BD90();
      swift_bridgeObjectRelease();
      id v92 = objc_msgSend(v89, sel_initWithString_attributes_, v90, v91);

      objc_msgSend(v87, sel_setAttributedText_, v92);
      sub_234DF9FE8((uint64_t)v112);
    }
    else
    {

      sub_234DF9FE8((uint64_t)v112);
      swift_bridgeObjectRelease();
    }
    sub_234DFA014(v102);
    return (id)__swift_destroy_boxed_opaque_existential_1((uint64_t)v109);
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_234E0909C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED920);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_234E0E160;
  uint64_t v2 = (int *)type metadata accessor for CompetitionScoreRenderer();
  uint64_t v3 = *(void **)(v0 + v2[8]);
  *(void *)(v1 + 32) = v3;
  uint64_t v4 = *(void **)(v0 + v2[9]);
  *(void *)(v1 + 40) = v4;
  sub_234E0BE90();
  uint64_t v5 = *(void **)(v0 + v2[10]);
  if (v5)
  {
    id v6 = v5;
    id v7 = v3;
    id v8 = v4;
    uint64_t v9 = swift_bridgeObjectRetain();
    MEMORY[0x237DD1BC0](v9);
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_234E0BEA0();
    }
    sub_234E0BEB0();
    sub_234E0BE90();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = v3;
    id v11 = v4;
  }
  return v1;
}

uint64_t sub_234E091D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_234E0BCA0();
  uint64_t v17 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED940);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v1 + *(int *)(type metadata accessor for CompetitionScoreRenderer() + 24);
  if (*(unsigned char *)(v9 + 16) == 1)
  {
    uint64_t v10 = v9 + *(int *)(type metadata accessor for Reply() + 24);
    id v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
    return v11(a1, v10, v3);
  }
  else
  {
    id v13 = objc_msgSend(*(id *)(v1 + 8), sel_UUID);
    if (v13)
    {
      id v14 = v13;
      sub_234E0BC80();

      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
      v15(v8, v5, v3);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v8, 0, 1, v3);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v8, 1, v3);
      if (result != 1) {
        return ((uint64_t (*)(uint64_t, char *, uint64_t))v15)(a1, v8, v3);
      }
    }
    else
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v8, 1, 1, v3);
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_234E0941C()
{
  unint64_t result = qword_2687EDB00;
  if (!qword_2687EDB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687EDB00);
  }
  return result;
}

uint64_t sub_234E09470(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687EDAF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_234E094D0()
{
  unint64_t result = qword_2687EDB30;
  if (!qword_2687EDB30)
  {
    sub_234E09538(255, &qword_2687EDB20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687EDB30);
  }
  return result;
}

uint64_t sub_234E09538(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_234E09574(uint64_t a1)
{
  sub_234E0BDD0();
  sub_234E0C0A0();
  sub_234E0BE20();
  uint64_t v2 = sub_234E0C0C0();
  swift_bridgeObjectRelease();
  return sub_234E0964C(a1, v2);
}

unint64_t sub_234E09608(uint64_t a1)
{
  uint64_t v2 = sub_234E0BF50();
  return sub_234E097C4(a1, v2);
}

unint64_t sub_234E0964C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_234E0BDD0();
    uint64_t v8 = v7;
    if (v6 == sub_234E0BDD0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_234E0C060();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_234E0BDD0();
          uint64_t v15 = v14;
          if (v13 == sub_234E0BDD0() && v15 == v16) {
            break;
          }
          char v18 = sub_234E0C060();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_234E097C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_234E09538(0, &qword_2687EDB20);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_234E0BF60();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_234E0BF60();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

double sub_234E098E0(char a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  double v13 = 0.0;
  if ((a1 & 1) == 0)
  {
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(a3 + 8))(v16, a2, a3);
    sub_234DF9FE8((uint64_t)v16);
    double v13 = *(double *)&v16[1];
  }
  v18.origin.CGFloat x = a4;
  v18.origin.CGFloat y = a5;
  v18.size.CGFloat width = a6;
  v18.size.double height = a7;
  double v14 = v13 + CGRectGetMinX(v18);
  v19.origin.CGFloat x = a4;
  v19.origin.CGFloat y = a5;
  v19.size.CGFloat width = a6;
  v19.size.double height = a7;
  CGRectGetWidth(v19);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a3 + 8))(&v17, a2, a3);
  sub_234DF9FE8((uint64_t)&v17);
  v20.origin.CGFloat x = a4;
  v20.origin.CGFloat y = a5;
  v20.size.CGFloat width = a6;
  v20.size.double height = a7;
  CGRectGetMinY(v20);
  v21.origin.CGFloat x = a4;
  v21.origin.CGFloat y = a5;
  v21.size.CGFloat width = a6;
  v21.size.double height = a7;
  CGRectGetHeight(v21);
  return v14;
}

uint64_t sub_234E09A14()
{
  type metadata accessor for ContactFormatter();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 1;
  if (qword_2687ED720 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v9[9] = *(_OWORD *)&qword_2687EE070;
  v9[10] = xmmword_2687EE080;
  v9[11] = unk_2687EE090;
  char v10 = byte_2687EE0A0;
  v9[7] = xmmword_2687EE050;
  v9[8] = xmmword_2687EE060;
  v9[2] = xmmword_2687EE000;
  v9[3] = xmmword_2687EE010;
  v9[5] = xmmword_2687EE030;
  v9[6] = xmmword_2687EE040;
  v9[4] = xmmword_2687EE020;
  v9[0] = static ReplyLayoutValues.phoneValues;
  v9[1] = *(_OWORD *)algn_2687EDFF0;
  qword_2687EE0D0 = (uint64_t)&type metadata for ReplyLayoutPhone;
  unk_2687EE0D8 = &off_26E803350;
  uint64_t v1 = swift_allocObject();
  long long v2 = xmmword_2687EE060;
  *(_OWORD *)(v1 + 168) = *(_OWORD *)&qword_2687EE070;
  long long v3 = unk_2687EE090;
  *(_OWORD *)(v1 + 184) = xmmword_2687EE080;
  *(_OWORD *)(v1 + 200) = v3;
  long long v4 = xmmword_2687EE020;
  *(_OWORD *)(v1 + 104) = xmmword_2687EE030;
  long long v5 = xmmword_2687EE050;
  *(_OWORD *)(v1 + 120) = xmmword_2687EE040;
  *(_OWORD *)(v1 + 136) = v5;
  *(_OWORD *)(v1 + 152) = v2;
  long long v6 = static ReplyLayoutValues.phoneValues;
  *(_OWORD *)(v1 + 40) = *(_OWORD *)algn_2687EDFF0;
  long long v7 = xmmword_2687EE010;
  *(_OWORD *)(v1 + 56) = xmmword_2687EE000;
  *(_OWORD *)(v1 + 72) = v7;
  *(_OWORD *)(v1 + 88) = v4;
  qword_2687EE0B8 = v1;
  *(void *)(v1 + 16) = v0;
  *(unsigned char *)(v1 + 216) = byte_2687EE0A0;
  *(_OWORD *)(v1 + 24) = v6;
  return sub_234E03940((uint64_t)v9);
}

double ReplyLayoutValues.bubbleBackgroundWhite.getter()
{
  return *(double *)v0;
}

double ReplyLayoutValues.bubbleTailHorizontalInset.getter()
{
  return *(double *)(v0 + 8);
}

double ReplyLayoutValues.bubbleTailVerticalInset.getter()
{
  return *(double *)(v0 + 16);
}

double ReplyLayoutValues.userMessageHorizontalInset.getter()
{
  return *(double *)(v0 + 24);
}

double ReplyLayoutValues.pendingUserMessageTrailingInset.getter()
{
  return *(double *)(v0 + 32);
}

uint64_t ReplyLayoutValues.userMessageNumberOfLines.getter()
{
  return *(void *)(v0 + 40);
}

double ReplyLayoutValues.separatorWhite.getter()
{
  return *(double *)(v0 + 48);
}

double ReplyLayoutValues.separatorHorizontalInset.getter()
{
  return *(double *)(v0 + 56);
}

double ReplyLayoutValues.separatorThickness.getter()
{
  return *(double *)(v0 + 64);
}

double ReplyLayoutValues.activityIconWidth.getter()
{
  return *(double *)(v0 + 72);
}

double ReplyLayoutValues.activityIconHorizontalInset.getter()
{
  return *(double *)(v0 + 80);
}

double ReplyLayoutValues.activityIconMinimumTopPadding.getter()
{
  return *(double *)(v0 + 88);
}

double ReplyLayoutValues.activityIconMinimumBottomPadding.getter()
{
  return *(double *)(v0 + 96);
}

double ReplyLayoutValues.activityTextLeftInset.getter()
{
  return *(double *)(v0 + 104);
}

double ReplyLayoutValues.activityTextRightInset.getter()
{
  return *(double *)(v0 + 112);
}

double ReplyLayoutValues.activityTextInfoWhite.getter()
{
  return *(double *)(v0 + 120);
}

double ReplyLayoutValues.workoutRingThickness.getter()
{
  return *(double *)(v0 + 128);
}

double ReplyLayoutValues.workoutTypeIconInset.getter()
{
  return *(double *)(v0 + 136);
}

id ReplyLayoutValues.workoutDetailFont.getter()
{
  return *(id *)(v0 + 144);
}

uint64_t ReplyLayoutValues.shouldRenderWorkoutDetail.getter()
{
  return *(unsigned __int8 *)(v0 + 152);
}

uint64_t ReplyLayoutValues.achievementTitleNumberOfLines.getter()
{
  return *(void *)(v0 + 160);
}

double ReplyLayoutValues.goalCompletionRingThickness.getter()
{
  return *(double *)(v0 + 168);
}

double ReplyLayoutValues.goalCompletionRingSpacing.getter()
{
  return *(double *)(v0 + 176);
}

uint64_t ReplyLayoutValues.goalCompletionTitleNumberOfLines.getter()
{
  return *(void *)(v0 + 184);
}

uint64_t ReplyLayoutValues.isBubbleInteractive.getter()
{
  return *(unsigned __int8 *)(v0 + 192);
}

void destroy for ReplyLayoutValues(uint64_t a1)
{
}

uint64_t initializeWithCopy for ReplyLayoutValues(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  long long v6 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v6;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  long long v7 = *(void **)(a2 + 144);
  *(void *)(a1 + 144) = v7;
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  long long v8 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v8;
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  id v9 = v7;
  return a1;
}

uint64_t assignWithCopy for ReplyLayoutValues(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  long long v4 = *(void **)(a2 + 144);
  long long v5 = *(void **)(a1 + 144);
  *(void *)(a1 + 144) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  return a1;
}

__n128 __swift_memcpy193_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  long long v5 = *(_OWORD *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  __n128 result = *(__n128 *)(a2 + 144);
  long long v9 = *(_OWORD *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 176);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 144) = result;
  return result;
}

uint64_t assignWithTake for ReplyLayoutValues(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  long long v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  long long v8 = *(void **)(a1 + 144);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);

  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReplyLayoutValues(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 193)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 144);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ReplyLayoutValues(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 184) = 0;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 192) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 193) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 144) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 193) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ReplyLayoutValues()
{
  return &type metadata for ReplyLayoutValues;
}

uint64_t sub_234E09F68()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 217, 7);
}

id sub_234E09FA8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 1);
  id result = objc_msgSend(v0, sel_setTimeStyle_, 0);
  qword_2687EDB70 = (uint64_t)v0;
  return result;
}

uint64_t sub_234E0A00C(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED920);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_234E0E230;
  *(void *)(v4 + 32) = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  sub_234E0BE90();
  unint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  if (v5 >> 62)
  {
    sub_234DFE770();
    unint64_t v6 = sub_234E0C010();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_234E0C070();
    sub_234DFE770();
    unint64_t v6 = v5;
  }
  swift_bridgeObjectRelease();
  sub_234DFDFC8(v6);
  return v4;
}

uint64_t static ActivityRendererFactory.activityRenderer(for:payload:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  v3[6] = type metadata accessor for CompetitionScoreRenderer();
  v3[7] = swift_task_alloc();
  v3[8] = type metadata accessor for CompetitionAcceptedRenderer();
  v3[9] = swift_task_alloc();
  v3[10] = type metadata accessor for GoalCompletionRenderer();
  v3[11] = swift_task_alloc();
  v3[12] = type metadata accessor for AchievementRenderer();
  v3[13] = swift_task_alloc();
  type metadata accessor for Reply();
  v3[14] = swift_task_alloc();
  v3[15] = type metadata accessor for WorkoutRenderer();
  v3[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_234E0A2B4, 0, 0);
}

uint64_t sub_234E0A2B4()
{
  uint64_t v1 = (void *)sub_234E0BBF0();
  uint64_t v2 = ASRichMessageTypeFromRichMessagePayload();

  switch(v2)
  {
    case -1:
      sub_234E0BEF0();
      if (qword_2687ED710 != -1) {
        goto LABEL_38;
      }
      goto LABEL_31;
    case 0:
      sub_234E0BF00();
      if (qword_2687ED710 != -1) {
        swift_once();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
      uint64_t v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_234E0E1D0;
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED988);
      *(void *)(v5 + 56) = v6;
      unint64_t v7 = sub_234E00B9C();
      *(void *)(v5 + 64) = v7;
      uint64_t v8 = MEMORY[0x263F8EE78];
      *(void *)(v5 + 32) = MEMORY[0x263F8EE78];
      sub_234E0BD30();
      swift_bridgeObjectRelease();
      long long v9 = (void *)sub_234E0BBF0();
      id v10 = (id)ASSnapshotFromRichMessagePayload();
      v0[22] = v10;

      if (!v10) {
        goto LABEL_32;
      }
      sub_234E0BEE0();
      v0[23] = sub_234E0BED0();
      uint64_t v11 = sub_234E0BEC0();
      uint64_t v13 = v12;
      double v14 = sub_234E0AE94;
      goto LABEL_20;
    case 1:
      sub_234E0BF00();
      if (qword_2687ED710 != -1) {
        swift_once();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
      uint64_t v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_234E0E1D0;
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED988);
      *(void *)(v15 + 56) = v6;
      unint64_t v7 = sub_234E00B9C();
      *(void *)(v15 + 64) = v7;
      uint64_t v8 = MEMORY[0x263F8EE78];
      *(void *)(v15 + 32) = MEMORY[0x263F8EE78];
      sub_234E0BD30();
      swift_bridgeObjectRelease();
      uint64_t v16 = (void *)sub_234E0BBF0();
      id v17 = (id)ASAchievementFromRichMessagePayload();
      v0[19] = v17;

      if (!v17) {
        goto LABEL_32;
      }
      id v18 = sub_234DFF2EC(v17);
      v0[20] = v18;
      if (v18)
      {
        sub_234E0BEE0();
        v0[21] = sub_234E0BED0();
        uint64_t v11 = sub_234E0BEC0();
        uint64_t v13 = v19;
        double v14 = sub_234E0ACF8;
        goto LABEL_20;
      }

      goto LABEL_34;
    case 2:
      sub_234E0BF00();
      if (qword_2687ED710 != -1) {
        swift_once();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_234E0E1D0;
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED988);
      *(void *)(v20 + 56) = v6;
      unint64_t v7 = sub_234E00B9C();
      *(void *)(v20 + 64) = v7;
      uint64_t v8 = MEMORY[0x263F8EE78];
      *(void *)(v20 + 32) = MEMORY[0x263F8EE78];
      sub_234E0BD30();
      swift_bridgeObjectRelease();
      CGRect v21 = (void *)sub_234E0BBF0();
      id v22 = (id)ASWorkoutFromRichMessagePayload();
      v0[17] = v22;

      if (!v22)
      {
LABEL_32:
        sub_234E0BEF0();
        uint64_t v32 = swift_allocObject();
        *(_OWORD *)(v32 + 16) = xmmword_234E0E1D0;
        *(void *)(v32 + 56) = v6;
        *(void *)(v32 + 64) = v7;
        *(void *)(v32 + 32) = v8;
        goto LABEL_33;
      }
      sub_234E0BEE0();
      v0[18] = sub_234E0BED0();
      uint64_t v11 = sub_234E0BEC0();
      uint64_t v13 = v23;
      double v14 = sub_234E0AB78;
LABEL_20:
      uint64_t result = MEMORY[0x270FA2498](v14, v11, v13);
      break;
    case 3:
      unint64_t v24 = (void *)sub_234E0BBF0();
      id v25 = (id)ASCompetitionFromRichMessagePayload();
      v0[24] = v25;

      if (!v25) {
        goto LABEL_30;
      }
      id v26 = (void *)swift_task_alloc();
      v0[25] = v26;
      *id v26 = v0;
      id v27 = sub_234E0B014;
      goto LABEL_27;
    case 4:
      id v28 = (void *)sub_234E0BBF0();
      id v29 = (id)ASCompetitionFromRichMessagePayload();
      v0[28] = v29;

      if (v29)
      {
        id v26 = (void *)swift_task_alloc();
        v0[29] = v26;
        *id v26 = v0;
        id v27 = sub_234E0B3F4;
LABEL_27:
        v26[1] = v27;
        uint64_t v30 = v0[4];
        uint64_t result = sub_234E07154(v30);
      }
      else
      {
LABEL_30:
        sub_234E0BEF0();
        if (qword_2687ED710 != -1) {
LABEL_38:
        }
          swift_once();
LABEL_31:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED950);
        uint64_t v31 = swift_allocObject();
        *(_OWORD *)(v31 + 16) = xmmword_234E0E1D0;
        *(void *)(v31 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2687ED988);
        *(void *)(v31 + 64) = sub_234E00B9C();
        *(void *)(v31 + 32) = MEMORY[0x263F8EE78];
LABEL_33:
        sub_234E0BD30();
        swift_bridgeObjectRelease();
LABEL_34:
        uint64_t v33 = v0[3];
        *(void *)(v33 + 32) = 0;
        *(_OWORD *)uint64_t v33 = 0u;
        *(_OWORD *)(v33 + 16) = 0u;
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v34 = (uint64_t (*)(void))v0[1];
        uint64_t result = v34();
      }
      break;
    default:
      type metadata accessor for ASRichMessageType(0);
      v0[2] = v2;
      uint64_t v4 = MEMORY[0x263F8D6C8];
      return MEMORY[0x270F9FA68](v3, v0 + 2, v3, v4);
  }
  return result;
}

uint64_t sub_234E0AB78()
{
  uint64_t v1 = (void *)v0[17];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[4];
  swift_release();
  sub_234DF9E1C(v4, v3);
  sub_234DF8B28(v1, v3, v2);
  return MEMORY[0x270FA2498](sub_234E0AC10, 0, 0);
}

uint64_t sub_234E0AC10()
{
  uint64_t v2 = v0[16];
  uint64_t v1 = (void *)v0[17];
  uint64_t v3 = (uint64_t *)v0[3];
  v3[3] = v0[15];
  v3[4] = (uint64_t)&off_26E803120;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v3);
  sub_234E0B838(v2, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for WorkoutRenderer);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_234E0ACF8()
{
  uint64_t v1 = (void *)v0[20];
  uint64_t v2 = (void *)v0[19];
  uint64_t v3 = (void *)v0[13];
  uint64_t v4 = v0[14];
  uint64_t v5 = v0[4];
  swift_release();
  sub_234DF9E1C(v5, v4);
  sub_234DFFF64(v2, v1, v4, v3);
  return MEMORY[0x270FA2498](sub_234E0ADA8, 0, 0);
}

uint64_t sub_234E0ADA8()
{
  uint64_t v2 = (void *)v0[19];
  uint64_t v1 = (void *)v0[20];
  uint64_t v3 = v0[13];
  uint64_t v4 = (uint64_t *)v0[3];
  v4[3] = v0[12];
  v4[4] = (uint64_t)&off_26E8031F8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v4);
  sub_234E0B838(v3, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for AchievementRenderer);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_234E0AE94()
{
  uint64_t v1 = (void *)v0[22];
  uint64_t v2 = v0[14];
  uint64_t v3 = (void *)v0[11];
  uint64_t v4 = v0[4];
  swift_release();
  sub_234DF9E1C(v4, v2);
  sub_234E00EE4(v1, v2, v3);
  return MEMORY[0x270FA2498](sub_234E0AF2C, 0, 0);
}

uint64_t sub_234E0AF2C()
{
  uint64_t v1 = (void *)v0[22];
  uint64_t v2 = v0[11];
  uint64_t v3 = (uint64_t *)v0[3];
  v3[3] = v0[10];
  v3[4] = (uint64_t)&off_26E8032A0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v3);
  sub_234E0B838(v2, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for GoalCompletionRenderer);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_234E0B014(uint64_t a1)
{
  *(void *)(*(void *)v1 + 208) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_234E0B114, 0, 0);
}

uint64_t sub_234E0B114()
{
  if (*(void *)(v0 + 208))
  {
    sub_234E0BEE0();
    *(void *)(v0 + 216) = sub_234E0BED0();
    uint64_t v2 = sub_234E0BEC0();
    return MEMORY[0x270FA2498](sub_234E0B250, v2, v1);
  }
  else
  {

    uint64_t v3 = *(void *)(v0 + 24);
    *(void *)(v3 + 32) = 0;
    *(_OWORD *)uint64_t v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_234E0B250()
{
  uint64_t v1 = (void *)v0[26];
  uint64_t v2 = (void *)v0[24];
  uint64_t v3 = v0[14];
  uint64_t v4 = (void *)v0[9];
  uint64_t v5 = v0[4];
  swift_release();
  sub_234DF9E1C(v5, v3);
  sub_234DFAD8C(v2, v3, v1, v4);
  return MEMORY[0x270FA2498](sub_234E0B304, 0, 0);
}

uint64_t sub_234E0B304()
{
  uint64_t v1 = (void *)v0[26];
  uint64_t v2 = (void *)v0[24];
  uint64_t v3 = v0[9];
  uint64_t v4 = (uint64_t *)v0[3];
  v4[3] = v0[8];
  v4[4] = (uint64_t)&off_26E8031C8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v4);
  sub_234E0B838(v3, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for CompetitionAcceptedRenderer);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_234E0B3F4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 240) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_234E0B4F4, 0, 0);
}

uint64_t sub_234E0B4F4()
{
  if (*(void *)(v0 + 240))
  {
    sub_234E0BEE0();
    *(void *)(v0 + 248) = sub_234E0BED0();
    uint64_t v2 = sub_234E0BEC0();
    return MEMORY[0x270FA2498](sub_234E0B630, v2, v1);
  }
  else
  {

    uint64_t v3 = *(void *)(v0 + 24);
    *(void *)(v3 + 32) = 0;
    *(_OWORD *)uint64_t v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_234E0B630()
{
  uint64_t v1 = (void *)v0[30];
  uint64_t v2 = (void *)v0[28];
  uint64_t v3 = v0[14];
  uint64_t v4 = (void *)v0[7];
  uint64_t v5 = v0[4];
  swift_release();
  sub_234DF9E1C(v5, v3);
  sub_234E08378(v2, v3, v1, v4);
  return MEMORY[0x270FA2498](sub_234E0B6E4, 0, 0);
}

uint64_t sub_234E0B6E4()
{
  uint64_t v1 = (void *)v0[30];
  uint64_t v2 = (void *)v0[28];
  uint64_t v3 = v0[7];
  uint64_t v4 = (uint64_t *)v0[3];
  v4[3] = v0[6];
  v4[4] = (uint64_t)&off_26E803478;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v4);
  sub_234E0B838(v3, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(void))type metadata accessor for CompetitionScoreRenderer);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_234E0B838(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for ActivityRendererFactory()
{
  return &type metadata for ActivityRendererFactory;
}

void ASBreadcrumbKeyForBulletinType_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_234DE2000, log, OS_LOG_TYPE_ERROR, "Trying to find a breadcrumb key for an undefined notification type", v1, 2u);
}

void ASBreadcrumbKeyForBulletinType_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_234DE2000, log, OS_LOG_TYPE_ERROR, "Trying to find a breadcrumb key for a competition accept request", v1, 2u);
}

void ASCompetitionFirstGlanceDescriptionForTypeWithFriends_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_234DE2000, log, OS_LOG_TYPE_ERROR, "Trying to create a description for a competition first glance type that does not exist.", v1, 2u);
}

void ASCompetitionFirstGlanceSectionHeaderForType_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_234DE2000, log, OS_LOG_TYPE_ERROR, "Trying to find a header label for a competition first glance type that doesn't exist", v1, 2u);
}

void ASActivitySharingBaseKeysForReplyContextType_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_234DE2000, log, OS_LOG_TYPE_ERROR, "Trying to create a reply key for type ASActivitySharingReplyContextTypeUndefined", v1, 2u);
}

uint64_t sub_234E0BBB0()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_234E0BBC0()
{
  return MEMORY[0x270EEE7B0]();
}

uint64_t sub_234E0BBD0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_234E0BBE0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_234E0BBF0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_234E0BC00()
{
  return MEMORY[0x270EF06F8]();
}

uint64_t sub_234E0BC10()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_234E0BC20()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_234E0BC30()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_234E0BC40()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_234E0BC50()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_234E0BC60()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_234E0BC70()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_234E0BC80()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_234E0BC90()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_234E0BCA0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_234E0BCB0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_234E0BCC0()
{
  return MEMORY[0x270EF1570]();
}

uint64_t sub_234E0BCD0()
{
  return MEMORY[0x270EF15A0]();
}

uint64_t sub_234E0BCE0()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_234E0BCF0()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_234E0BD00()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_234E0BD10()
{
  return MEMORY[0x270F0B168]();
}

uint64_t sub_234E0BD20()
{
  return MEMORY[0x270F0B170]();
}

uint64_t sub_234E0BD30()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_234E0BD40()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_234E0BD50()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_234E0BD60()
{
  return MEMORY[0x270FA0B08]();
}

uint64_t sub_234E0BD70()
{
  return MEMORY[0x270FA0B20]();
}

uint64_t sub_234E0BD80()
{
  return MEMORY[0x270FA0BD0]();
}

uint64_t sub_234E0BD90()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_234E0BDA0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_234E0BDB0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_234E0BDC0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_234E0BDD0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_234E0BDE0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_234E0BDF0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_234E0BE00()
{
  return MEMORY[0x270F9D678]();
}

uint64_t sub_234E0BE10()
{
  return MEMORY[0x270F9D680]();
}

uint64_t sub_234E0BE20()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_234E0BE30()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_234E0BE40()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_234E0BE50()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_234E0BE60()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_234E0BE70()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_234E0BE80()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_234E0BE90()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_234E0BEA0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_234E0BEB0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_234E0BEC0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_234E0BED0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_234E0BEE0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_234E0BEF0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_234E0BF00()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_234E0BF10()
{
  return MEMORY[0x270FA0EF8]();
}

uint64_t sub_234E0BF20()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_234E0BF30()
{
  return MEMORY[0x270EE5908]();
}

uint64_t sub_234E0BF40()
{
  return MEMORY[0x270EE5910]();
}

uint64_t sub_234E0BF50()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_234E0BF60()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_234E0BF70()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_234E0BF80()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_234E0BF90()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_234E0BFA0()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_234E0BFC0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_234E0BFD0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_234E0BFE0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_234E0BFF0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_234E0C000()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_234E0C010()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_234E0C020()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_234E0C030()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_234E0C050()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_234E0C060()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_234E0C070()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_234E0C090()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_234E0C0A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_234E0C0B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_234E0C0C0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t ACHShouldUseNewAwardsSystem()
{
  return MEMORY[0x270F0A7B0]();
}

uint64_t ACHTemplateIsMonthlyChallenge()
{
  return MEMORY[0x270F0A808]();
}

uint64_t ASAchievementFromRichMessagePayload()
{
  return MEMORY[0x270F0ABB0]();
}

uint64_t ASAchievementThumbnailPathForStyle()
{
  return MEMORY[0x270F0ABC0]();
}

uint64_t ASCompetitionCalculateStartDateComponentsForFriendWithProposedStartDate()
{
  return MEMORY[0x270F0AC50]();
}

uint64_t ASCompetitionCurrentScoreDelta()
{
  return MEMORY[0x270F0AC60]();
}

uint64_t ASCompetitionDayWithHighestScoreForParticipant()
{
  return MEMORY[0x270F0AC70]();
}

uint64_t ASCompetitionDurationDateComponentsForNewCompetitions()
{
  return MEMORY[0x270F0AC78]();
}

uint64_t ASCompetitionFromRichMessagePayload()
{
  return MEMORY[0x270F0AC80]();
}

uint64_t ASCompetitionMaximumPointsPerDayForNewCompetitions()
{
  return MEMORY[0x270F0AC90]();
}

uint64_t ASCompetitionParticipantHasCrossedMercyThresholdOnLastDayForCompetition()
{
  return MEMORY[0x270F0ACA0]();
}

uint64_t ASCompetitionRequestHasExpired()
{
  return MEMORY[0x270F0ACB8]();
}

uint64_t ASCompetitionRequestHoursUntilExpiration()
{
  return MEMORY[0x270F0ACC0]();
}

uint64_t ASCompetitionRequestIsStillVisible()
{
  return MEMORY[0x270F0ACC8]();
}

uint64_t ASCompetitionRequestMinutesUntilExpiration()
{
  return MEMORY[0x270F0ACD0]();
}

uint64_t ASCompetitionScoresAreWithinClosenessThreshold()
{
  return MEMORY[0x270F0ACD8]();
}

uint64_t ASCompetitionWinningDayWithHighestScoreForParticipant()
{
  return MEMORY[0x270F0AD00]();
}

uint64_t ASContactStorePredicateForDestination()
{
  return MEMORY[0x270F0AD18]();
}

uint64_t ASDidLosePreviousCompetitionWithFriend()
{
  return MEMORY[0x270F0AD30]();
}

uint64_t ASEphemeralCompetitionVictoryAchievementForFriendAchievement()
{
  return MEMORY[0x270F0AD38]();
}

uint64_t ASEphemeralCompetitionVictoryAchievementForStyle()
{
  return MEMORY[0x270F0AD40]();
}

uint64_t ASEphemeralEarnedAchievement()
{
  return MEMORY[0x270F0AD48]();
}

uint64_t ASEphemeralEarnedAchievementForFriendAchievement()
{
  return MEMORY[0x270F0AD50]();
}

uint64_t ASFriendUUIDFromRichMessagePayload()
{
  return MEMORY[0x270F0AD68]();
}

uint64_t ASFriendsWithCompetitionsEndingToday()
{
  return MEMORY[0x270F0AD80]();
}

uint64_t ASFriendsWithCompetitionsStartingToday()
{
  return MEMORY[0x270F0AD88]();
}

uint64_t ASFullNameForContactStoreContact()
{
  return MEMORY[0x270F0AD90]();
}

uint64_t ASIsCompetitionVictoryTemplate()
{
  return MEMORY[0x270F0ADA0]();
}

uint64_t ASLoggingInitialize()
{
  return MEMORY[0x270F0ADA8]();
}

uint64_t ASMessageFromRichMessagePayload()
{
  return MEMORY[0x270F0ADB8]();
}

uint64_t ASNumberOfNewFriendsAllowedForFriends()
{
  return MEMORY[0x270F0ADC8]();
}

uint64_t ASRecipientAddressFromRichMessagePayload()
{
  return MEMORY[0x270F0ADE0]();
}

uint64_t ASRichMessageTypeFromRichMessagePayload()
{
  return MEMORY[0x270F0AE08]();
}

uint64_t ASShortNameForContactStoreContact()
{
  return MEMORY[0x270F0AE38]();
}

uint64_t ASSnapshotFromRichMessagePayload()
{
  return MEMORY[0x270F0AE48]();
}

uint64_t ASTimestampFromRichMessagePayload()
{
  return MEMORY[0x270F0AE50]();
}

uint64_t ASWorkoutFromRichMessagePayload()
{
  return MEMORY[0x270F0AE80]();
}

uint64_t ActivitySharingBundle()
{
  return MEMORY[0x270F0AEA0]();
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddRoundedRect(CGMutablePathRef path, const CGAffineTransform *transform, CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

void CGPathRelease(CGPathRef path)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

uint64_t FILocalizationTableForExperienceType()
{
  return MEMORY[0x270F29A60]();
}

uint64_t FILocalizeCount()
{
  return MEMORY[0x270F29A68]();
}

uint64_t FILocalizedDayName()
{
  return MEMORY[0x270F29A98]();
}

uint64_t FILocalizedNameForActivityType()
{
  return MEMORY[0x270F29AA8]();
}

uint64_t FIRandomStringForPrefixWithTableName()
{
  return MEMORY[0x270F29B08]();
}

uint64_t FIStringByReplacingDynamicPlaceholder()
{
  return MEMORY[0x270F29B68]();
}

uint64_t FIUIIsWheelchairUserForWheelchairUse()
{
  return MEMORY[0x270F2CC58]();
}

uint64_t FIUIStaticWorkoutIconImage()
{
  return MEMORY[0x270F2CCA8]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F82F00]();
}

uint64_t WRLocalizedCategoryString()
{
  return MEMORY[0x270F84A78]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKActivityCacheDateComponentsFromCacheIndex()
{
  return MEMORY[0x270EF38F8]();
}

uint64_t _HKActivityCacheDateComponentsFromDate()
{
  return MEMORY[0x270EF3900]();
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return MEMORY[0x270EF3928]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}