@interface ASFriend(SharingStringUtilities)
- (id)_competitionStartMessage:()SharingStringUtilities replacingNameAndDatePlaceholdersForCompetitionStartDate:;
- (id)as_competitionAcceptConfirmationMessageForCompetition:()SharingStringUtilities experienceType:;
- (id)as_competitionAcceptConfirmationTitle;
- (id)as_competitionAcceptErrorMessage;
- (id)as_competitionAcceptedNotificationMessageForCompetition:()SharingStringUtilities experienceType:;
- (id)as_competitionAcceptedNotificationTitle;
- (id)as_competitionLearnMoreDetailActionForExperienceType:()SharingStringUtilities;
- (id)as_competitionLearnMoreDetailMessageForExperienceType:()SharingStringUtilities;
- (id)as_competitionLearnMoreFullDescriptionForExperienceType:()SharingStringUtilities;
- (id)as_competitionLearnMoreIntroductionForExperienceType:()SharingStringUtilities;
- (id)as_competitionLearnMorePopupAction;
- (id)as_competitionLearnMoreTitleForExperienceType:()SharingStringUtilities;
- (id)as_competitionReceivedHidingAcceptAction;
- (id)as_competitionReceivedHidingWarningMessage;
- (id)as_competitionReceivedNotificationAcceptAction;
- (id)as_competitionReceivedNotificationMessageForExperienceType:()SharingStringUtilities;
- (id)as_competitionReceivedNotificationTitle;
- (id)as_competitionRequestDurationRemainingString;
- (id)as_competitionSendConfirmationMessageForExperienceType:()SharingStringUtilities;
- (id)as_competitionSendConfirmationSendAction;
- (id)as_competitionSendConfirmationTitle;
- (id)as_competitionSendErrorMessage;
- (id)as_competitionStageString;
- (id)as_competitionStatusBreadcrumbStringForExperienceType:()SharingStringUtilities;
- (id)as_detailedSharingDurationString;
- (id)as_friendListNameStringWithDotPrefix:()SharingStringUtilities keyColor:showAwaitingCompetitionResponse:;
- (id)as_invitedDurationString;
- (id)as_myCompetitionScoreStringWithContext:()SharingStringUtilities color:;
- (id)as_opponentCompetitionScoreStringWithContext:()SharingStringUtilities color:;
- (id)as_simpleHiddenFromString;
- (id)as_simpleSharingDurationString;
- (uint64_t)as_friendListNameStringWithDotPrefix:()SharingStringUtilities keyColor:;
@end

@implementation ASFriend(SharingStringUtilities)

- (uint64_t)as_friendListNameStringWithDotPrefix:()SharingStringUtilities keyColor:
{
  return objc_msgSend(a1, "as_friendListNameStringWithDotPrefix:keyColor:showAwaitingCompetitionResponse:", a3, a4, 0);
}

- (id)as_friendListNameStringWithDotPrefix:()SharingStringUtilities keyColor:showAwaitingCompetitionResponse:
{
  v19[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([a1 isMe])
  {
    v10 = [a1 displayName];
    v11 = _AttributedNameStringWithDotPrefix(v10, v8, v9);
LABEL_6:

    goto LABEL_8;
  }
  if (a5 && [a1 isAwaitingCompetitionResponseFromMe])
  {
    v10 = [a1 displayName];
    v12 = objc_msgSend(MEMORY[0x263F825C8], "as_lightCompetitionGold");
    v11 = _AttributedNameStringWithDotPrefix(v10, v8, v12);

    goto LABEL_6;
  }
  id v13 = objc_alloc(MEMORY[0x263F086A0]);
  v14 = [a1 displayName];
  v18[0] = *MEMORY[0x263F81500];
  v15 = [MEMORY[0x263F825C8] whiteColor];
  v18[1] = *MEMORY[0x263F814F0];
  v19[0] = v15;
  v19[1] = v8;
  v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  v11 = (void *)[v13 initWithString:v14 attributes:v16];

LABEL_8:
  return v11;
}

- (id)as_detailedSharingDurationString
{
  if ([a1 isMe])
  {
    v2 = 0;
    goto LABEL_23;
  }
  v3 = [a1 dateForLatestRelationshipStart];
  if (v3)
  {
    v4 = [a1 displayName];
    uint64_t v5 = ASDurationInDaysSinceDate(v3);
    v6 = ASSharingStartTimeStringFromDate(v3);
    if (v5)
    {
      v7 = ActivitySharingBundle();
      id v8 = [v7 localizedStringForKey:@"DAYS_OTHER" value:&stru_26E8035F0 table:@"Localizable"];

      if (v5 == 1)
      {
        id v9 = ActivitySharingBundle();
        uint64_t v10 = [v9 localizedStringForKey:@"DAYS_ONE" value:&stru_26E8035F0 table:@"Localizable"];

        id v8 = (void *)v10;
      }
      v11 = NSString;
      v12 = ActivitySharingBundle();
      id v13 = [v12 localizedStringForKey:@"DETAILED_SHARING_DURATION_INFO" value:&stru_26E8035F0 table:@"Localizable"];
      v14 = [NSNumber numberWithInteger:v5];
      v2 = objc_msgSend(v11, "stringWithFormat:", v13, v4, v14, v8, v6);
    }
    else
    {
      v15 = NSString;
      id v8 = ActivitySharingBundle();
      v12 = [v8 localizedStringForKey:@"DETAILED_SHARING_DURATION_INFO_ZERO_DAYS" value:&stru_26E8035F0 table:@"Localizable"];
      v2 = objc_msgSend(v15, "stringWithFormat:", v12, v4, v6);
    }

    v16 = [a1 dateForLatestDataHidden];
    if (([a1 canSeeMyActivityData] & 1) == 0 && v16)
    {
      uint64_t v17 = ASDurationInDaysSinceDate(v16);
      v18 = ASSharingStartTimeStringFromDate(v16);
      v19 = ActivitySharingBundle();
      v20 = v19;
      if (v17) {
        v21 = @"SHARING_HIDDEN_SINCE_INFO";
      }
      else {
        v21 = @"SHARING_HIDDEN_SINCE_INFO_ZERO_DAYS";
      }
      v22 = [v19 localizedStringForKey:v21 value:&stru_26E8035F0 table:@"Localizable"];

      v23 = objc_msgSend(NSString, "stringWithFormat:", v22, v4, v18);
      uint64_t v24 = [v2 stringByAppendingString:v23];

      v2 = (void *)v24;
    }
    v25 = [MEMORY[0x263F0A980] sharedBehavior];
    if ([v25 isStandalonePhoneFitnessMode])
    {
      uint64_t v26 = [a1 mostRecentSnapshot];
      if (v26)
      {
        v27 = (void *)v26;
        v28 = [a1 mostRecentSnapshot];
        v29 = [v28 activitySummary];
        char v30 = [v29 _isStandalonePhoneSummary];

        if (v30)
        {
LABEL_21:

          goto LABEL_22;
        }
        v31 = ActivitySharingBundle();
        v25 = [v31 localizedStringForKey:@"SHARING_STANDALONE_EXPLANATION_%@" value:&stru_26E8035F0 table:@"Localizable"];

        v32 = objc_msgSend(NSString, "stringWithFormat:", v25, v4);
        v33 = [NSString stringWithFormat:@" %@", v32];
        uint64_t v34 = [v2 stringByAppendingString:v33];

        v2 = (void *)v34;
      }
    }

    goto LABEL_21;
  }
  v2 = 0;
LABEL_22:

LABEL_23:
  return v2;
}

- (id)as_simpleSharingDurationString
{
  if ([a1 isMe])
  {
    v2 = 0;
  }
  else
  {
    v3 = [a1 dateForLatestRelationshipStart];
    if (v3)
    {
      v4 = [a1 displayName];
      uint64_t v5 = ASDurationInDaysSinceDate(v3);
      v6 = ASSharingStartTimeStringFromDate(v3);
      v7 = NSString;
      id v8 = ActivitySharingBundle();
      id v9 = v8;
      if (v5)
      {
        uint64_t v10 = [v8 localizedStringForKey:@"SIMPLE_SHARING_DURATION_INFO" value:&stru_26E8035F0 table:@"Localizable"];
        objc_msgSend(v7, "stringWithFormat:", v10, v4, v6);
      }
      else
      {
        uint64_t v10 = [v8 localizedStringForKey:@"SIMPLE_SHARING_DURATION_INFO_ZERO_DAYS" value:&stru_26E8035F0 table:@"Localizable"];
        objc_msgSend(v7, "stringWithFormat:", v10, v4, v12);
      v2 = };
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

- (id)as_simpleHiddenFromString
{
  if ([a1 isMe])
  {
    v2 = 0;
  }
  else
  {
    v3 = [a1 dateForLatestDataHiddenFromMe];
    v4 = v3;
    if (v3)
    {
      uint64_t v5 = ASSharingStartTimeStringFromDate(v3);
      uint64_t v6 = ASDurationInDaysSinceDate(v4);
      v7 = ActivitySharingBundle();
      id v8 = v7;
      if (v6) {
        id v9 = @"SHARING_HIDDEN_FROM_SINCE_INFO";
      }
      else {
        id v9 = @"SHARING_HIDDEN_FROM_SINCE_INFO_ZERO_DAYS";
      }
      uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_26E8035F0 table:@"Localizable"];

      v11 = NSString;
      uint64_t v12 = [a1 displayName];
      v2 = objc_msgSend(v11, "stringWithFormat:", v10, v12, v5);
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

- (id)as_invitedDurationString
{
  v1 = [a1 dateForLatestOutgoingInviteRequest];
  v2 = v1;
  if (!v1)
  {
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  uint64_t v3 = ASDurationInDaysSinceDate(v1);
  uint64_t v4 = v3;
  if (v3 == 1)
  {
    v7 = ActivitySharingBundle();
    id v8 = v7;
    id v9 = @"DAYS_ONE";
LABEL_8:
    uint64_t v5 = [v7 localizedStringForKey:v9 value:&stru_26E8035F0 table:@"Localizable"];

    uint64_t v10 = NSString;
    v11 = ActivitySharingBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"SHARING_INBOX_WAITING_INFO" value:&stru_26E8035F0 table:@"Localizable"];
    id v13 = [NSNumber numberWithInteger:v4];
    uint64_t v6 = objc_msgSend(v10, "stringWithFormat:", v12, v13, v5);

    goto LABEL_9;
  }
  if (v3)
  {
    v7 = ActivitySharingBundle();
    id v8 = v7;
    id v9 = @"DAYS_OTHER";
    goto LABEL_8;
  }
  uint64_t v5 = ActivitySharingBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"TODAY" value:&stru_26E8035F0 table:@"Localizable"];
LABEL_9:

LABEL_10:
  return v6;
}

- (id)as_competitionStatusBreadcrumbStringForExperienceType:()SharingStringUtilities
{
  v1 = a1;
  if ([a1 hasPendingCompetitionRequestFromMe])
  {
    v2 = [v1 dateForLatestOutgoingCompetitionRequest];
    uint64_t v3 = ASCompetitionRequestHoursUntilExpiration();

    if (v3 < 1)
    {
      uint64_t v24 = [v1 dateForLatestOutgoingCompetitionRequest];
      uint64_t v25 = ASCompetitionRequestMinutesUntilExpiration();

      uint64_t v26 = NSString;
      uint64_t v5 = ActivitySharingBundle();
      uint64_t v6 = [v5 localizedStringForKey:@"MINUTES" value:&stru_26E8035F0 table:@"Localizable"];
      objc_msgSend(v26, "localizedStringWithFormat:", v6, v25);
    }
    else
    {
      uint64_t v4 = NSString;
      uint64_t v5 = ActivitySharingBundle();
      uint64_t v6 = [v5 localizedStringForKey:@"HOURS" value:&stru_26E8035F0 table:@"Localizable"];
      objc_msgSend(v4, "localizedStringWithFormat:", v6, v3);
    id v9 = };

    v27 = NSString;
    uint64_t v12 = ActivitySharingBundle();
    uint64_t v17 = [v12 localizedStringForKey:@"COMPETITION_INVITE_SENT_BREADCRUMB" value:&stru_26E8035F0 table:@"Localizable"];
    v22 = [v1 displayName];
    objc_msgSend(v27, "stringWithFormat:", v17, v22, v9);
    v1 = LABEL_15:;
    goto LABEL_16;
  }
  if (![v1 isCompetitionActive])
  {
    v1 = 0;
    goto LABEL_18;
  }
  v7 = [v1 currentCompetition];
  id v8 = [v7 startDate];
  id v9 = FILocalizedDayName();

  uint64_t v10 = [v1 currentCompetition];
  v11 = [v10 lastDayOfCompetition];
  uint64_t v12 = FILocalizedDayName();

  id v13 = NSString;
  v14 = ActivitySharingBundle();
  v15 = [v14 localizedStringForKey:@"POINTS" value:&stru_26E8035F0 table:@"Localizable"];
  v16 = [v1 currentCompetition];
  uint64_t v17 = objc_msgSend(v13, "localizedStringWithFormat:", v15, objc_msgSend(v16, "maximumNumberOfPointsPerDay"));

  v18 = [v1 currentCompetition];
  uint64_t v19 = [v18 stage];

  if (v19 != 2)
  {
    if (v19 == 1)
    {
      v32 = ActivitySharingBundle();
      v33 = FILocalizationTableForExperienceType();
      v22 = FIRandomStringForPrefixWithTableName();

      v23 = NSString;
      v35 = v12;
      v36 = v17;
    }
    else
    {
      if (v19) {
        goto LABEL_17;
      }
      v20 = ActivitySharingBundle();
      v21 = FILocalizationTableForExperienceType();
      v22 = FIRandomStringForPrefixWithTableName();

      v23 = NSString;
      v35 = v9;
      v36 = v17;
    }
    objc_msgSend(v23, "stringWithFormat:", v22, v35, v36);
    goto LABEL_15;
  }
  v28 = ActivitySharingBundle();
  v29 = FILocalizationTableForExperienceType();
  v22 = FIRandomStringForPrefixWithTableName();

  char v30 = NSString;
  v31 = [v1 displayName];
  v1 = objc_msgSend(v30, "stringWithFormat:", v22, v12, v31);

LABEL_16:
LABEL_17:

LABEL_18:
  return v1;
}

- (id)as_competitionRequestDurationRemainingString
{
  v2 = [a1 dateForLatestOutgoingCompetitionRequest];
  if (!v2)
  {
    uint64_t v6 = 0;
    goto LABEL_13;
  }
  if ([a1 ignoredCompetitionRequestFromMe])
  {
    uint64_t v3 = ActivitySharingBundle();
    uint64_t v4 = v3;
    uint64_t v5 = @"DECLINED_COMPETITION_REQUEST";
  }
  else
  {
    if (!ASCompetitionRequestHasExpired())
    {
      uint64_t v7 = ASCompetitionRequestHoursUntilExpiration();
      if (v7 < 1)
      {
        uint64_t v8 = ASCompetitionRequestMinutesUntilExpiration();
        id v9 = NSString;
        uint64_t v10 = ActivitySharingBundle();
        uint64_t v4 = v10;
        v11 = @"MINUTES_REMAINING";
      }
      else
      {
        uint64_t v8 = v7;
        id v9 = NSString;
        uint64_t v10 = ActivitySharingBundle();
        uint64_t v4 = v10;
        v11 = @"HOURS_REMAINING";
      }
      uint64_t v12 = [v10 localizedStringForKey:v11 value:&stru_26E8035F0 table:@"Localizable"];
      uint64_t v6 = objc_msgSend(v9, "localizedStringWithFormat:", v12, v8);

      goto LABEL_12;
    }
    uint64_t v3 = ActivitySharingBundle();
    uint64_t v4 = v3;
    uint64_t v5 = @"EXPIRED_COMPETITION_REQUEST";
  }
  uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_26E8035F0 table:@"Localizable"];
LABEL_12:

LABEL_13:
  return v6;
}

- (id)as_competitionStageString
{
  v1 = [a1 currentCompetition];
  v2 = ASCompetitionStageStringWithCompetition(v1);

  return v2;
}

- (id)as_myCompetitionScoreStringWithContext:()SharingStringUtilities color:
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 currentCompetition];
  uint64_t v9 = [v8 myTotalScore];
  uint64_t v10 = [v7 multilineDataFont];
  v11 = [v7 multilineUnitFont];

  uint64_t v12 = ASAttributedNumberStringWithKey(v9, @"ABBREVIATED_POINTS", v10, v11, v6);

  return v12;
}

- (id)as_opponentCompetitionScoreStringWithContext:()SharingStringUtilities color:
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 currentCompetition];
  uint64_t v9 = [v8 opponentTotalScore];
  uint64_t v10 = [v7 multilineDataFont];
  v11 = [v7 multilineUnitFont];

  uint64_t v12 = ASAttributedNumberStringWithKey(v9, @"ABBREVIATED_POINTS", v10, v11, v6);

  return v12;
}

- (id)as_competitionSendConfirmationTitle
{
  v0 = ActivitySharingBundle();
  v1 = [v0 localizedStringForKey:@"COMPETITION_SEND_CONFIRMATION_TITLE" value:&stru_26E8035F0 table:@"Localizable"];

  return v1;
}

- (id)as_competitionSendConfirmationMessageForExperienceType:()SharingStringUtilities
{
  if ([a1 isMyActivityDataCurrentlyHidden])
  {
    v2 = NSString;
    uint64_t v3 = ActivitySharingBundle();
    uint64_t v4 = [v3 localizedStringForKey:@"COMPETITION_SEND_CONFIRMATION_MESSAGE_HIDING" value:&stru_26E8035F0 table:@"Localizable"];
    uint64_t v5 = [a1 displayName];
    id v6 = [a1 displayName];
    id v7 = objc_msgSend(v2, "stringWithFormat:", v4, v5, v6);
  }
  else
  {
    uint64_t v8 = ActivitySharingBundle();
    uint64_t v9 = FILocalizationTableForExperienceType();
    uint64_t v3 = FIRandomStringForPrefixWithTableName();

    uint64_t v10 = NSString;
    uint64_t v4 = [a1 displayName];
    id v7 = objc_msgSend(v10, "stringWithFormat:", v3, v4);
  }

  return v7;
}

- (id)as_competitionSendConfirmationSendAction
{
  if ([a1 isMyActivityDataCurrentlyHidden])
  {
    v2 = ActivitySharingBundle();
    uint64_t v3 = [v2 localizedStringForKey:@"COMPETITION_SEND_CONFIRMATION_SEND_ACTION_HIDING" value:&stru_26E8035F0 table:@"Localizable"];
  }
  else
  {
    uint64_t v4 = NSString;
    v2 = ActivitySharingBundle();
    uint64_t v5 = [v2 localizedStringForKey:@"COMPETITION_SEND_CONFIRMATION_SEND_ACTION" value:&stru_26E8035F0 table:@"Localizable"];
    id v6 = [a1 displayName];
    uint64_t v3 = objc_msgSend(v4, "stringWithFormat:", v5, v6);
  }
  return v3;
}

- (id)as_competitionSendErrorMessage
{
  v2 = NSString;
  uint64_t v3 = ActivitySharingBundle();
  uint64_t v4 = [v3 localizedStringForKey:@"COMPETITION_SEND_ERROR_MESSAGE" value:&stru_26E8035F0 table:@"Localizable"];
  uint64_t v5 = [a1 displayName];
  id v6 = objc_msgSend(v2, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)as_competitionReceivedNotificationTitle
{
  v0 = ActivitySharingBundle();
  v1 = [v0 localizedStringForKey:@"COMPETITION_RECEIVED_NOTIFICATION_TITLE" value:&stru_26E8035F0 table:@"Localizable"];

  return v1;
}

- (id)as_competitionReceivedNotificationMessageForExperienceType:()SharingStringUtilities
{
  v2 = ActivitySharingBundle();
  uint64_t v3 = FILocalizationTableForExperienceType();
  uint64_t v4 = FIRandomStringForPrefixWithTableName();

  uint64_t v5 = NSString;
  id v6 = [a1 displayName];
  id v7 = objc_msgSend(v5, "stringWithFormat:", v4, v6);

  return v7;
}

- (id)as_competitionReceivedHidingWarningMessage
{
  v2 = NSString;
  uint64_t v3 = ActivitySharingBundle();
  uint64_t v4 = [v3 localizedStringForKey:@"COMPETITION_RECEIVED_NOTIFICATION_MESSAGE_HIDING" value:&stru_26E8035F0 table:@"Localizable"];
  uint64_t v5 = [a1 displayName];
  id v6 = [a1 displayName];
  id v7 = objc_msgSend(v2, "stringWithFormat:", v4, v5, v6);

  return v7;
}

- (id)as_competitionReceivedNotificationAcceptAction
{
  v0 = ActivitySharingBundle();
  v1 = FIRandomStringForPrefixWithTableName();

  return v1;
}

- (id)as_competitionReceivedHidingAcceptAction
{
  v0 = ActivitySharingBundle();
  v1 = [v0 localizedStringForKey:@"COMPETITION_RECEIVED_NOTIFICATION_ACCEPT_ACTION_HIDING" value:&stru_26E8035F0 table:@"Localizable"];

  return v1;
}

- (id)as_competitionAcceptErrorMessage
{
  v2 = NSString;
  uint64_t v3 = ActivitySharingBundle();
  uint64_t v4 = [v3 localizedStringForKey:@"COMPETITION_ACCEPT_ERROR_MESSAGE" value:&stru_26E8035F0 table:@"Localizable"];
  uint64_t v5 = [a1 displayName];
  id v6 = objc_msgSend(v2, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)as_competitionAcceptedNotificationTitle
{
  v0 = ActivitySharingBundle();
  v1 = [v0 localizedStringForKey:@"COMPETITION_ACCEPTED_NOTIFICATION_TITLE" value:&stru_26E8035F0 table:@"Localizable"];

  return v1;
}

- (id)as_competitionAcceptedNotificationMessageForCompetition:()SharingStringUtilities experienceType:
{
  id v4 = a3;
  uint64_t v5 = ActivitySharingBundle();
  id v6 = FILocalizationTableForExperienceType();
  id v7 = FIRandomStringForPrefixWithTableName();

  uint64_t v8 = [v4 startDate];

  uint64_t v9 = [a1 _competitionStartMessage:v7 replacingNameAndDatePlaceholdersForCompetitionStartDate:v8];

  return v9;
}

- (id)as_competitionAcceptConfirmationTitle
{
  v0 = ActivitySharingBundle();
  v1 = [v0 localizedStringForKey:@"COMPETITION_ACCEPT_CONFIRMATION_TITLE" value:&stru_26E8035F0 table:@"Localizable"];

  return v1;
}

- (id)_competitionStartMessage:()SharingStringUtilities replacingNameAndDatePlaceholdersForCompetitionStartDate:
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 displayName];
  uint64_t v9 = [v7 stringByReplacingOccurrencesOfString:@"<friend-name>" withString:v8];

  uint64_t v10 = FILocalizedDayName();

  v11 = FIStringByReplacingDynamicPlaceholder();

  return v11;
}

- (id)as_competitionLearnMoreTitleForExperienceType:()SharingStringUtilities
{
  v0 = ActivitySharingBundle();
  v1 = FILocalizationTableForExperienceType();
  v2 = FIRandomStringForPrefixWithTableName();

  return v2;
}

- (id)as_competitionLearnMoreDetailActionForExperienceType:()SharingStringUtilities
{
  v0 = ActivitySharingBundle();
  v1 = FILocalizationTableForExperienceType();
  v2 = FIRandomStringForPrefixWithTableName();

  return v2;
}

- (id)as_competitionLearnMoreIntroductionForExperienceType:()SharingStringUtilities
{
  v0 = ActivitySharingBundle();
  v1 = FILocalizationTableForExperienceType();
  v2 = FIRandomStringForPrefixWithTableName();

  return v2;
}

- (id)as_competitionLearnMoreDetailMessageForExperienceType:()SharingStringUtilities
{
  v0 = ASCompetitionDurationDateComponentsForNewCompetitions();
  uint64_t v1 = [v0 day];

  uint64_t v2 = ASCompetitionMaximumPointsPerDayForNewCompetitions();
  uint64_t v3 = NSString;
  id v4 = ActivitySharingBundle();
  uint64_t v5 = [v4 localizedStringForKey:@"POINTS" value:&stru_26E8035F0 table:@"Localizable"];
  id v6 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v2);

  uint64_t v7 = v2 * v1;
  uint64_t v8 = NSString;
  uint64_t v9 = ActivitySharingBundle();
  uint64_t v10 = [v9 localizedStringForKey:@"POINTS" value:&stru_26E8035F0 table:@"Localizable"];
  v11 = objc_msgSend(v8, "localizedStringWithFormat:", v10, v7);

  uint64_t v12 = ActivitySharingBundle();
  id v13 = FILocalizationTableForExperienceType();
  v14 = FIRandomStringForPrefixWithTableName();

  v15 = objc_msgSend(NSString, "stringWithFormat:", v14, v6, v11);

  return v15;
}

- (id)as_competitionLearnMoreFullDescriptionForExperienceType:()SharingStringUtilities
{
  uint64_t v5 = NSString;
  id v6 = objc_msgSend(a1, "as_competitionLearnMoreIntroductionForExperienceType:");
  uint64_t v7 = objc_msgSend(a1, "as_competitionLearnMoreDetailMessageForExperienceType:", a3);
  uint64_t v8 = [v5 stringWithFormat:@"%@ %@", v6, v7];

  return v8;
}

- (id)as_competitionAcceptConfirmationMessageForCompetition:()SharingStringUtilities experienceType:
{
  id v4 = [a3 startDateComponents];
  uint64_t v5 = ASCompetitionCalculateStartDateComponentsForFriendWithProposedStartDate();

  id v6 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v7 = [v6 dateFromComponents:v5];

  uint64_t v8 = ActivitySharingBundle();
  uint64_t v9 = FILocalizationTableForExperienceType();
  uint64_t v10 = FIRandomStringForPrefixWithTableName();

  v11 = [a1 _competitionStartMessage:v10 replacingNameAndDatePlaceholdersForCompetitionStartDate:v7];

  return v11;
}

- (id)as_competitionLearnMorePopupAction
{
  v0 = ActivitySharingBundle();
  uint64_t v1 = [v0 localizedStringForKey:@"COMPETITION_LEARN_MORE_POPUP_ACTION" value:&stru_26E8035F0 table:@"Localizable"];

  return v1;
}

@end