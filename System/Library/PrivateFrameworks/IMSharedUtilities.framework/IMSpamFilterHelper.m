@interface IMSpamFilterHelper
+ (BOOL)accountCountryIsCandidateForHawking:(id)a3;
+ (BOOL)accountCountryIsCandidateForSMSFilter:(id)a3;
+ (BOOL)accountCountryIsCandidateForiMessageJunk:(id)a3;
+ (BOOL)accountRegionIsCandidateForHawking:(id)a3;
+ (BOOL)anyParticipantIsCandidateForBlackhole:(id)a3;
+ (BOOL)anyParticipantIsKnownContact:(id)a3;
+ (BOOL)isBlackholeEnabledForEligibleAccounts:(BOOL)a3;
+ (BOOL)isChineseSpamFilteringEnabled;
+ (BOOL)isFilterUnknownSendersEnabled;
+ (BOOL)isInternationalSpamFilteringEnabled;
+ (BOOL)isKnownContact:(id)a3;
+ (BOOL)isiMessageJunkFilterEnabled;
+ (BOOL)receiverIsCandidateForAppleSMSFilterSubClassification:(id)a3;
+ (BOOL)receiverIsCandidateForAppleSMSFilterSubClassificationWithSimSlot:(int64_t)a3;
+ (BOOL)receiverIsCandidateForDefaultAppleSMSFilter:(id)a3;
+ (BOOL)receiverIsCandidateForDefaultAppleSMSFilterWithSimSlot:(int64_t)a3;
+ (BOOL)receiverIsCandidateForHawking:(id)a3;
+ (BOOL)receiverIsCandidateForSMSFilter:(id)a3;
+ (BOOL)receiverIsCandidateForSMSFilterWithSimSlot:(int64_t)a3;
+ (BOOL)receiverIsCandidateForiMessageJunk:(id)a3;
+ (BOOL)receiverIsEnabledForSMSFilter:(id)a3;
+ (BOOL)receivingID:(id)a3 isCountryCode:(id)a4;
+ (BOOL)senderIsCandidateForBlackhole:(id)a3;
+ (BOOL)senderIsCandidateForSMSDowngrade:(id)a3;
+ (BOOL)senderIsChinaHandle:(id)a3;
+ (BOOL)shouldBlackholeGroupMessageFromSender:(id)a3 toRecipient:(id)a4 ifRecipientIsCandidate:(BOOL)a5 withOtherParticipants:(id)a6 givenHistory:(BOOL)a7 forEligibleAccounts:(BOOL)a8;
+ (BOOL)shouldBlackholeMessageFromSender:(id)a3 toRecipient:(id)a4 ifRecipientIsCandidate:(BOOL)a5 givenHistory:(BOOL)a6 forEligibleAccounts:(BOOL)a7;
+ (BOOL)shouldDowngradeToRecipient:(id)a3 fromSender:(id)a4 ifCapableOfSMS:(BOOL)a5 withConversationDowngradeState:(BOOL)a6 andConversationHistoryState:(BOOL)a7;
+ (BOOL)shouldShowSMSWarningForSender:(id)a3 forRecipient:(id)a4 withConversationHistory:(BOOL)a5;
+ (id)_additionalAccountRegionsEligibleForJunkFiltering;
+ (id)_additionalTelephonyCountryCodesEligibleForJunkFiltering;
+ (id)_cnRecordForAliases:(id)a3;
+ (id)accountRegionsEligibleForJunkFiltering;
+ (id)defaultAccountRegionsEligibleForJunkFiltering;
+ (id)defaultTelephonyCountryCodesEligibleForJunkFiltering;
+ (id)internationalSpamFilterLearnMoreURL;
+ (id)mapID:(id)a3 usingKey:(id)a4;
+ (id)sanitizeParticipants:(id)a3 excludingHandles:(id)a4;
+ (id)telephonyCountryCodesEligibleForJunkFiltering;
+ (void)participantsAreiMessagable:(id)a3 completionBlock:(id)a4;
@end

@implementation IMSpamFilterHelper

+ (BOOL)receiverIsCandidateForiMessageJunk:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = IMGetCachedDomainValueForKey();
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Default set, country is a candidate for imessage junk.", buf, 2u);
      }
    }
LABEL_20:
    BOOL v11 = 1;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = objc_msgSend((id)objc_opt_class(), "telephonyCountryCodesEligibleForJunkFiltering", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (+[IMSpamFilterHelper receivingID:v3 isCountryCode:v10])
          {
            if (IMOSLoggingEnabled())
            {
              v12 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v19 = v3;
                __int16 v20 = 2112;
                uint64_t v21 = v10;
                _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for imessage junk.", buf, 0x16u);
              }
            }
            goto LABEL_20;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)receivingID:(id)a3 isCountryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    uint64_t v8 = MEMORY[0x1A62278F0](v6);
    v9 = [a1 mapID:v8 usingKey:@"mapReceivingIDForSpamFilter"];

    if (MEMORY[0x1A62278C0](v9))
    {
      uint64_t v10 = IMCountryCodeForNumber();
      char v11 = [v10 isEqualToString:v7];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

+ (id)mapID:(id)a3 usingKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = IMGetCachedDomainValueForKey();
  uint64_t v8 = v7;
  if (v7 && ([v7 objectForKey:v5], (id v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412546;
        id v13 = v5;
        __int16 v14 = 2112;
        id v15 = v9;
        _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Mapping id (%@) to (%@).", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

+ (id)telephonyCountryCodesEligibleForJunkFiltering
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:0];
  if (+[IMDeviceUtilities isInternalInstall])
  {
    v4 = [v3 objectForKey:@"telephony-imessage-junk-filter-internal"];
    if ([v4 count]) {
      goto LABEL_10;
    }
    id v5 = [v3 objectForKey:@"telephony-imessage-junk-filter-seed"];

    if (![v5 count])
    {
      v4 = [v3 objectForKey:@"telephony-imessage-junk-filter"];

      goto LABEL_10;
    }
LABEL_8:
    v4 = v5;
    goto LABEL_10;
  }
  if (+[IMDeviceUtilities isSeedInstall])
  {
    v4 = [v3 objectForKey:@"telephony-imessage-junk-filter-seed"];
    if ([v4 count]) {
      goto LABEL_10;
    }
    id v5 = [v3 objectForKey:@"telephony-imessage-junk-filter"];

    goto LABEL_8;
  }
  v4 = [v3 objectForKey:@"telephony-imessage-junk-filter"];
LABEL_10:
  if (![v4 count])
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Server bagged values for junk not found. Using local values of this release.", (uint8_t *)&v12, 2u);
      }
    }
    uint64_t v7 = [(id)objc_opt_class() defaultTelephonyCountryCodesEligibleForJunkFiltering];

    v4 = (void *)v7;
  }
  uint64_t v8 = [a1 _additionalTelephonyCountryCodesEligibleForJunkFiltering];
  id v9 = [v4 arrayByAddingObjectsFromArray:v8];

  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v9;
      _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "iMessage junk enabled for: %@", (uint8_t *)&v12, 0xCu);
    }
  }

  return v9;
}

+ (id)_additionalTelephonyCountryCodesEligibleForJunkFiltering
{
  v2 = IMGetCachedDomainValueForKey();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

+ (BOOL)accountCountryIsCandidateForiMessageJunk:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = objc_msgSend((id)objc_opt_class(), "accountRegionsEligibleForJunkFiltering", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([v3 isEqualToString:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v8 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v15 = v3;
              _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Country (%@) is a candidate for imessage junk.", buf, 0xCu);
            }
          }
          LOBYTE(v5) = 1;
          goto LABEL_15;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v5;
}

+ (id)accountRegionsEligibleForJunkFiltering
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:0];
  if (+[IMDeviceUtilities isInternalInstall])
  {
    v4 = [v3 objectForKey:@"accounts-imessage-junk-filter-internal"];
    if ([v4 count]) {
      goto LABEL_10;
    }
    uint64_t v5 = [v3 objectForKey:@"accounts-imessage-junk-filter-seed"];

    if (![v5 count])
    {
      v4 = [v3 objectForKey:@"accounts-imessage-junk-filter"];

      goto LABEL_10;
    }
LABEL_8:
    v4 = v5;
    goto LABEL_10;
  }
  if (+[IMDeviceUtilities isSeedInstall])
  {
    v4 = [v3 objectForKey:@"accounts-imessage-junk-filter-seed"];
    if ([v4 count]) {
      goto LABEL_10;
    }
    uint64_t v5 = [v3 objectForKey:@"accounts-imessage-junk-filter"];

    goto LABEL_8;
  }
  v4 = [v3 objectForKey:@"accounts-imessage-junk-filter"];
LABEL_10:
  if (![v4 count])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Server bagged values for junk not found. Using local values of this release.", (uint8_t *)&v12, 2u);
      }
    }
    uint64_t v7 = [(id)objc_opt_class() defaultAccountRegionsEligibleForJunkFiltering];

    v4 = (void *)v7;
  }
  uint64_t v8 = [a1 _additionalAccountRegionsEligibleForJunkFiltering];
  id v9 = [v4 arrayByAddingObjectsFromArray:v8];

  if (IMOSLoggingEnabled())
  {
    long long v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      long long v13 = v9;
      _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "iMessage junk enabled for: %@", (uint8_t *)&v12, 0xCu);
    }
  }

  return v9;
}

+ (id)_additionalAccountRegionsEligibleForJunkFiltering
{
  v2 = IMGetCachedDomainValueForKey();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

+ (id)defaultTelephonyCountryCodesEligibleForJunkFiltering
{
  if (qword_1E94FF630 != -1) {
    dispatch_once(&qword_1E94FF630, &unk_1EF2BF660);
  }
  v2 = (void *)qword_1E94FF628;

  return v2;
}

+ (id)defaultAccountRegionsEligibleForJunkFiltering
{
  if (qword_1E94FF640 != -1) {
    dispatch_once(&qword_1E94FF640, &unk_1EF2BE5D8);
  }
  v2 = (void *)qword_1E94FF638;

  return v2;
}

+ (BOOL)isiMessageJunkFilterEnabled
{
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:0];
  id v3 = [v2 objectForKey:@"apply-imessage-junk-filter"];
  v4 = v3;
  if (v3 && (unint64_t)[v3 unsignedIntegerValue] <= 1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A080E9CC;
    block[3] = &unk_1E5A11D40;
    id v14 = v4;
    if (qword_1E94FE948 != -1) {
      dispatch_once(&qword_1E94FE948, block);
    }

    char v5 = 1;
  }
  else
  {
    char v5 = 0;
  }
  uint64_t v6 = IMGetCachedDomainValueForKey();
  if (v6)
  {
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    long long v10 = sub_1A080EAE0;
    long long v11 = &unk_1E5A11D40;
    id v12 = v4;
    if (qword_1E94FF648 != -1) {
      dispatch_once(&qword_1E94FF648, &v8);
    }
    char v5 = objc_msgSend(v6, "BOOLValue", v8, v9, v10, v11);
  }
  return v5;
}

+ (BOOL)shouldDowngradeToRecipient:(id)a3 fromSender:(id)a4 ifCapableOfSMS:(BOOL)a5 withConversationDowngradeState:(BOOL)a6 andConversationHistoryState:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (![a1 isInternationalSpamFilteringEnabled]
    || ![a1 receiverIsCandidateForHawking:v12])
  {
    goto LABEL_35;
  }
  if (!a5)
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412290;
        id v21 = v13;
        _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Sender (%@) incapable of sending SMS, ineligible for downgrade.", (uint8_t *)&v20, 0xCu);
      }
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (([a1 senderIsCandidateForSMSDowngrade:v13] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412546;
        id v21 = v13;
        __int16 v22 = 2112;
        id v23 = v12;
        _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Conversation from (%@) to (%@) is not eligible for SMS downgrade.", (uint8_t *)&v20, 0x16u);
      }
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (v7)
  {
    if (!v8)
    {
      if (IMOSLoggingEnabled())
      {
        id v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v20 = 138412546;
          id v21 = v13;
          __int16 v22 = 2112;
          id v23 = v12;
          _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Conversation from (%@) to (%@) has history, not eligible for SMS downgrade.", (uint8_t *)&v20, 0x16u);
        }
        goto LABEL_34;
      }
LABEL_35:
      BOOL v18 = 0;
      goto LABEL_36;
    }
    if ([a1 isChineseSpamFilteringEnabled]
      && [a1 senderIsChinaHandle:v13])
    {
      if (IMOSLoggingEnabled())
      {
        id v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v20 = 138412546;
          id v21 = v13;
          __int16 v22 = 2112;
          id v23 = v12;
          _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Conversation from (%@) to (%@) has history and was downgraded, but overriding for CN-CN filtering.", (uint8_t *)&v20, 0x16u);
        }
LABEL_34:

        goto LABEL_35;
      }
      goto LABEL_35;
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = @"NO";
      int v20 = 138413058;
      id v21 = v13;
      if (v8) {
        uint64_t v17 = @"YES";
      }
      else {
        uint64_t v17 = @"NO";
      }
      __int16 v22 = 2112;
      id v23 = v12;
      if (v7) {
        uint64_t v16 = @"YES";
      }
      __int16 v24 = 2112;
      v25 = v17;
      __int16 v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Initiating SMS downgrade for conversation from (%@) to (%@): conversationWasDowngraded: %@, hasHistoryWithSender: %@.", (uint8_t *)&v20, 0x2Au);
    }
  }
  BOOL v18 = 1;
LABEL_36:

  return v18;
}

+ (BOOL)shouldShowSMSWarningForSender:(id)a3 forRecipient:(id)a4 withConversationHistory:(BOOL)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    goto LABEL_2;
  }
  if (([a1 isInternationalSpamFilteringEnabled] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "International spam filtering not enabled.", (uint8_t *)&v14, 2u);
      }
    }
    goto LABEL_2;
  }
  if (!v9
    || ![a1 receiverIsCandidateForHawking:v9]
    || ![v8 length]
    || !IMStringIsEmail())
  {
LABEL_2:
    BOOL v10 = 0;
    goto LABEL_3;
  }
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Should show blackhole warning for conversation from (%@) to (%@).", (uint8_t *)&v14, 0x16u);
    }
  }
  BOOL v10 = 1;
LABEL_3:

  return v10;
}

+ (BOOL)shouldBlackholeMessageFromSender:(id)a3 toRecipient:(id)a4 ifRecipientIsCandidate:(BOOL)a5 givenHistory:(BOOL)a6 forEligibleAccounts:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (([a1 isBlackholeEnabledForEligibleAccounts:v7] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      int v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "User ineligible for blackhole.", (uint8_t *)&v20, 2u);
      }
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (!a5)
  {
    if (IMOSLoggingEnabled())
    {
      int v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412290;
        id v21 = v13;
        _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Receiver (%@) is not a candidate for blackhole.", (uint8_t *)&v20, 0xCu);
      }
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      int v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412546;
        id v21 = v12;
        __int16 v22 = 2112;
        id v23 = v13;
        _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Sender (%@) has history with recipient (%@).", (uint8_t *)&v20, 0x16u);
      }
LABEL_25:

      goto LABEL_26;
    }
    goto LABEL_26;
  }
  if (([a1 senderIsCandidateForBlackhole:v12] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      int v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412546;
        id v21 = v12;
        __int16 v22 = 2112;
        id v23 = v13;
        _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Sender (%@) to (%@) is not a candidate for blackhole.", (uint8_t *)&v20, 0x16u);
      }
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  int v15 = [a1 senderIsKnownContact:v12];
  int v16 = IMOSLoggingEnabled();
  if (v15)
  {
    if (v16)
    {
      int v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412546;
        id v21 = v12;
        __int16 v22 = 2112;
        id v23 = v13;
        _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Known contact, will not black hole message from (%@) to (%@).", (uint8_t *)&v20, 0x16u);
      }
      goto LABEL_25;
    }
LABEL_26:
    BOOL v17 = 0;
    goto LABEL_27;
  }
  if (v16)
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412546;
      id v21 = v12;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "Should blackhole message from (%@) to (%@).", (uint8_t *)&v20, 0x16u);
    }
  }
  BOOL v17 = 1;
LABEL_27:

  return v17;
}

+ (BOOL)shouldBlackholeGroupMessageFromSender:(id)a3 toRecipient:(id)a4 ifRecipientIsCandidate:(BOOL)a5 withOtherParticipants:(id)a6 givenHistory:(BOOL)a7 forEligibleAccounts:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  if (([a1 isBlackholeEnabledForEligibleAccounts:v8] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "User ineligible for blackhole.", (uint8_t *)&v22, 2u);
      }
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (!a5)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412290;
        id v23 = v15;
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "Receiver (%@) is not a candidate for blackhole.", (uint8_t *)&v22, 0xCu);
      }
      goto LABEL_15;
    }
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412290;
        id v23 = v14;
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "Sender (%@) has history with someone in group conversation.", (uint8_t *)&v22, 0xCu);
      }
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  int v20 = [v16 arrayByAddingObject:v14];
  if ([a1 anyParticipantIsCandidateForBlackhole:v20]
    && ([a1 anyParticipantIsKnownContact:v20] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412546;
        id v23 = v14;
        __int16 v24 = 2112;
        id v25 = v15;
        _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "Should blackhole group message from (%@) to (%@).", (uint8_t *)&v22, 0x16u);
      }
    }
    BOOL v18 = 1;
  }
  else
  {
    BOOL v18 = 0;
  }

LABEL_17:
  return v18;
}

+ (BOOL)isBlackholeEnabledForEligibleAccounts:(BOOL)a3
{
  BOOL v3 = a3;
  if (([a1 isInternationalSpamFilteringEnabled] & 1) == 0)
  {
    int v6 = IMOSLoggingEnabled();
    if (!v6) {
      return v6;
    }
    BOOL v8 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    __int16 v15 = 0;
    BOOL v9 = "Blackhole disabled; international spam filtering not enabled.";
    BOOL v10 = (uint8_t *)&v15;
LABEL_18:
    _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
    goto LABEL_19;
  }
  char v5 = [a1 isFilterUnknownSendersEnabled];
  int v6 = IMOSLoggingEnabled();
  if ((v5 & 1) == 0)
  {
    if (!v6) {
      return v6;
    }
    BOOL v8 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    __int16 v14 = 0;
    BOOL v9 = "Blackhole disabled; user has disabled filtering unknown senders.";
    BOOL v10 = (uint8_t *)&v14;
    goto LABEL_18;
  }
  if (!v3)
  {
    if (!v6) {
      return v6;
    }
    BOOL v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = 0;
      BOOL v9 = "Blackhole disabled; active accounts ineligble.";
      BOOL v10 = (uint8_t *)&v12;
      goto LABEL_18;
    }
LABEL_19:

    LOBYTE(v6) = 0;
    return v6;
  }
  if (v6)
  {
    BOOL v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Blackhole enabled; active accounts eligible.", buf, 2u);
    }
  }
  LOBYTE(v6) = 1;
  return v6;
}

+ (BOOL)receiverIsCandidateForHawking:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = +[IMSpamFilterHelper receivingID:v3 isCountryCode:@"cn"];
  if (v4 && IMOSLoggingEnabled())
  {
    char v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = v3;
      __int16 v9 = 2112;
      BOOL v10 = @"cn";
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for hawking.", (uint8_t *)&v7, 0x16u);
    }
  }
  return v4;
}

+ (BOOL)receiverIsEnabledForSMSFilter:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"us"])
  {
    BOOL v4 = +[IMFeatureFlags sharedFeatureFlags];
    char v5 = [v4 isSMSFilterEnabledForUS];
  }
  else
  {
    if (![v3 isEqualToString:@"gb"])
    {
      BOOL v6 = 1;
      goto LABEL_7;
    }
    BOOL v4 = +[IMFeatureFlags sharedFeatureFlags];
    char v5 = [v4 isSMSFilterEnabledForUK];
  }
  BOOL v6 = v5;

LABEL_7:
  return v6;
}

+ (BOOL)receiverIsCandidateForSMSFilter:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [&unk_1EF305C58 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(&unk_1EF305C58);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (+[IMSpamFilterHelper receivingID:v3 isCountryCode:v7])
        {
          if (IMOSLoggingEnabled())
          {
            __int16 v9 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v16 = v3;
              __int16 v17 = 2112;
              uint64_t v18 = v7;
              _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for load but set to none filter.", buf, 0x16u);
            }
          }
          BOOL v8 = +[IMSpamFilterHelper receiverIsEnabledForSMSFilter:v7];
          goto LABEL_15;
        }
      }
      uint64_t v4 = [&unk_1EF305C58 countByEnumeratingWithState:&v11 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

+ (BOOL)receiverIsCandidateForDefaultAppleSMSFilter:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [&unk_1EF305C70 countByEnumeratingWithState:&v10 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(&unk_1EF305C70);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (+[IMSpamFilterHelper receivingID:v3 isCountryCode:v7])
        {
          if (IMOSLoggingEnabled())
          {
            BOOL v8 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v15 = v3;
              __int16 v16 = 2112;
              uint64_t v17 = v7;
              _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for first party sms filtering.", buf, 0x16u);
            }
          }
          LOBYTE(v4) = 1;
          goto LABEL_15;
        }
      }
      uint64_t v4 = [&unk_1EF305C70 countByEnumeratingWithState:&v10 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v4;
}

+ (BOOL)receiverIsCandidateForAppleSMSFilterSubClassification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [&unk_1EF305C88 countByEnumeratingWithState:&v10 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(&unk_1EF305C88);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (+[IMSpamFilterHelper receivingID:v3 isCountryCode:v7])
        {
          if (IMOSLoggingEnabled())
          {
            BOOL v8 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v15 = v3;
              __int16 v16 = 2112;
              uint64_t v17 = v7;
              _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for SMS subclassification.", buf, 0x16u);
            }
          }
          LOBYTE(v4) = 1;
          goto LABEL_15;
        }
      }
      uint64_t v4 = [&unk_1EF305C88 countByEnumeratingWithState:&v10 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v4;
}

+ (BOOL)receiverIsCandidateForSMSFilterWithSimSlot:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[IMCTSMSUtilities IMCountryCodeForSimSlot:](IMCTSMSUtilities, "IMCountryCodeForSimSlot:");
  if (v4 && [&unk_1EF305C58 containsObject:v4])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v8 = 134218242;
        int64_t v9 = a3;
        __int16 v10 = 2112;
        long long v11 = v4;
        _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Receiving sim slot (%ld) with country code (%@) is a candidate for load but set to none filter.", (uint8_t *)&v8, 0x16u);
      }
    }
    BOOL v6 = +[IMSpamFilterHelper receiverIsEnabledForSMSFilter:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)receiverIsCandidateForDefaultAppleSMSFilterWithSimSlot:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[IMCTSMSUtilities IMCountryCodeForSimSlot:](IMCTSMSUtilities, "IMCountryCodeForSimSlot:");
  if (v4 && [&unk_1EF305C70 containsObject:v4])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v8 = 134218242;
        int64_t v9 = a3;
        __int16 v10 = 2112;
        long long v11 = v4;
        _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Receiving sim slot (%ld) with country code (%@) is a candidate for first party sms filtering.", (uint8_t *)&v8, 0x16u);
      }
    }
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)receiverIsCandidateForAppleSMSFilterSubClassificationWithSimSlot:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[IMCTSMSUtilities IMCountryCodeForSimSlot:](IMCTSMSUtilities, "IMCountryCodeForSimSlot:");
  if (v4 && [&unk_1EF305C88 containsObject:v4])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v8 = 134218242;
        int64_t v9 = a3;
        __int16 v10 = 2112;
        long long v11 = v4;
        _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Receiving sim slot (%ld) with country code (%@) is a candidate for SMS subclassification.", (uint8_t *)&v8, 0x16u);
      }
    }
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)accountRegionIsCandidateForHawking:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (__CFString *)a3;
  if ([(__CFString *)v3 isEqualToString:@"R:CN"])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        int v8 = v3;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Region (%@) is a candidate for spam filtering.", (uint8_t *)&v7, 0xCu);
      }
LABEL_10:
    }
  }
  else
  {
    if (!IMGetDomainBoolForKey())
    {
      BOOL v5 = 0;
      goto LABEL_13;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        int v8 = @"is";
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Region %@ a candidate for spam filtering.", (uint8_t *)&v7, 0xCu);
      }
      goto LABEL_10;
    }
  }
  BOOL v5 = 1;
LABEL_13:

  return v5;
}

+ (BOOL)accountCountryIsCandidateForHawking:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"cn"])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v3;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Country (%@) is a candidate for hawking.", (uint8_t *)&v7, 0xCu);
      }
LABEL_10:
    }
  }
  else
  {
    if (!IMGetDomainBoolForKey())
    {
      BOOL v5 = 0;
      goto LABEL_13;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Country is a candidate for hawking.", (uint8_t *)&v7, 2u);
      }
      goto LABEL_10;
    }
  }
  BOOL v5 = 1;
LABEL_13:

  return v5;
}

+ (BOOL)accountCountryIsCandidateForSMSFilter:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [&unk_1EF305C58 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(&unk_1EF305C58);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if ([v3 isEqualToString:v8])
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v20 = v3;
              _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Country (%@) is a candidate for first party sms filtering.", buf, 0xCu);
            }
          }
          BOOL v11 = +[IMSpamFilterHelper receiverIsEnabledForSMSFilter:v8];
          goto LABEL_22;
        }
        uint64_t v9 = [&unk_1EF305C40 objectAtIndex:v5 + i];
        int v10 = IMGetDomainBoolForKey();

        if (v10)
        {
          if (IMOSLoggingEnabled())
          {
            long long v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Country is a candidate for first party sms filtering.", buf, 2u);
            }
          }
          BOOL v11 = 1;
          goto LABEL_22;
        }
      }
      uint64_t v4 = [&unk_1EF305C58 countByEnumeratingWithState:&v15 objects:v21 count:16];
      BOOL v11 = 0;
      v5 += i;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_22:

  return v11;
}

+ (BOOL)senderIsCandidateForSMSDowngrade:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = MEMORY[0x1A62278F0](v4);
    uint64_t v6 = [a1 mapID:v5 usingKey:@"mapSendingIDForSpamFilter"];

    if (IMStringIsEmail())
    {
      if (IMOSLoggingEnabled())
      {
        int v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v14 = 138412290;
          long long v15 = v6;
          _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Sender (%@) is an email, cannot downgrade to SMS.", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    else
    {
      if (MEMORY[0x1A62278C0](v6))
      {
        uint64_t v9 = IMCountryCodeForNumber();
        if ([v9 isEqualToString:@"cn"]
          && ![a1 isChineseSpamFilteringEnabled])
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              int v14 = 138412546;
              long long v15 = v6;
              __int16 v16 = 2112;
              long long v17 = v9;
              _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Sender (%@) with country code (%@) should not be downgraded to SMS.", (uint8_t *)&v14, 0x16u);
            }
          }
          BOOL v8 = 0;
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            int v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              int v14 = 138412546;
              long long v15 = v6;
              __int16 v16 = 2112;
              long long v17 = v9;
              _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Sender (%@) with country code (%@) should be downgraded to SMS.", (uint8_t *)&v14, 0x16u);
            }
          }
          BOOL v8 = 1;
        }

        goto LABEL_26;
      }
      BOOL v11 = IMLogHandleForCategory("SpamFilter");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1A09F14CC((uint64_t)v6, v11);
      }
    }
    BOOL v8 = 0;
LABEL_26:

    goto LABEL_27;
  }
  BOOL v8 = 1;
LABEL_27:

  return v8;
}

+ (BOOL)senderIsChinaHandle:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = MEMORY[0x1A62278F0](v4);
    uint64_t v6 = [a1 mapID:v5 usingKey:@"mapSendingIDForSpamFilter"];

    if ((IMStringIsEmail() & 1) != 0 || !MEMORY[0x1A62278C0](v6))
    {
      char v8 = 0;
    }
    else
    {
      int v7 = IMCountryCodeForNumber();
      char v8 = [v7 isEqualToString:@"cn"];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)senderIsCandidateForBlackhole:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = MEMORY[0x1A62278F0](v4);
    uint64_t v6 = [a1 mapID:v5 usingKey:@"mapSendingIDForSpamFilter"];

    if (IMStringIsEmail())
    {
      if (IMOSLoggingEnabled())
      {
        int v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412546;
          __int16 v16 = v6;
          __int16 v17 = 2112;
          uint64_t v18 = @"R:CN";
          _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Sender (%@) should be blackholed for (%@) receiver.", (uint8_t *)&v15, 0x16u);
        }
      }
    }
    else
    {
      if (MEMORY[0x1A62278C0](v6))
      {
        IMCountryCodeForNumber();
        uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if ([(__CFString *)v9 isEqualToString:@"cn"]
          && !+[IMSpamFilterHelper isChineseSpamFilteringEnabled])
        {
          if (IMOSLoggingEnabled())
          {
            long long v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              int v15 = 138412546;
              __int16 v16 = v6;
              __int16 v17 = 2112;
              uint64_t v18 = v9;
              _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Sender (%@) with country code (%@) should not be blackholed.", (uint8_t *)&v15, 0x16u);
            }
          }
          BOOL v8 = 0;
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            int v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              int v15 = 138412546;
              __int16 v16 = v6;
              __int16 v17 = 2112;
              uint64_t v18 = v9;
              _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Sender (%@) with country code (%@) should be blackholed.", (uint8_t *)&v15, 0x16u);
            }
          }
          BOOL v8 = 1;
        }

        goto LABEL_32;
      }
      if (MEMORY[0x1A62278A0](v6))
      {
        if (IMOSLoggingEnabled())
        {
          BOOL v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            int v15 = 138412290;
            __int16 v16 = v6;
            _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Sender (%@) is business chat, should not be blackholed.", (uint8_t *)&v15, 0xCu);
          }
        }
        BOOL v8 = 0;
        goto LABEL_32;
      }
      uint64_t v12 = IMLogHandleForCategory("SpamFilter");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1A09F1544((uint64_t)v6, v12);
      }
    }
    BOOL v8 = 1;
LABEL_32:

    goto LABEL_33;
  }
  BOOL v8 = 1;
LABEL_33:

  return v8;
}

+ (BOOL)anyParticipantIsCandidateForBlackhole:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(a1, "senderIsCandidateForBlackhole:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
          {

            BOOL v10 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v5;
        _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "No participants are candidates for blackhole: (%@)", buf, 0xCu);
      }
    }
  }
  BOOL v10 = 0;
LABEL_16:

  return v10;
}

+ (BOOL)anyParticipantIsKnownContact:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(a1, "isKnownContact:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
          {

            BOOL v10 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v5;
        _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "No known contacts in participants list: (%@)", buf, 0xCu);
      }
    }
  }
  BOOL v10 = 0;
LABEL_16:

  return v10;
}

+ (void)participantsAreiMessagable:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F6AA78];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A0829F78;
  v8[3] = &unk_1E5A13290;
  id v9 = v5;
  id v7 = v5;
  +[IMIDSIDQueryController refreshIDStatusForDestinations:a3 service:v6 listenerID:@"IMChatServiceForSendingIDSQueryControllerListenerID" queue:MEMORY[0x1E4F14428] completionBlock:v8];
}

+ (id)sanitizeParticipants:(id)a3 excludingHandles:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    v32 = v5;
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v31 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v48;
      long long v12 = (long long *)MEMORY[0x1E4F5CC30];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v48 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v14 = [*(id *)(*((void *)&v47 + 1) + 8 * i) _stripFZIDPrefix];
          if (MEMORY[0x1A62278C0]())
          {
            long long v15 = IMCountryCodeForNumber();
            long long v16 = v12[1];
            long long v43 = *v12;
            long long v44 = v16;
            long long v17 = v12[3];
            long long v45 = v12[2];
            long long v46 = v17;
            [v14 UTF8String];
            PNDecomposeForCountry();
            if ((void)v45 && DWORD2(v45))
            {
              uint64_t v18 = objc_msgSend(NSString, "stringWithUTF8String:");
              if (v18) {
                [v7 addObject:v18];
              }
            }
          }
          else
          {
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v10);
    }

    id v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v32, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = v32;
    uint64_t v19 = [obj countByEnumeratingWithState:&v39 objects:v52 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(obj);
          }
          id v23 = [*(id *)(*((void *)&v39 + 1) + 8 * j) _stripFZIDPrefix];
          __int16 v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ ENDSWITH SELF", v23];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v25 = v7;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v51 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v36;
            while (2)
            {
              for (uint64_t k = 0; k != v27; ++k)
              {
                if (*(void *)v36 != v28) {
                  objc_enumerationMutation(v25);
                }
                if ([v24 evaluateWithObject:*(void *)(*((void *)&v35 + 1) + 8 * k)])
                {

                  goto LABEL_32;
                }
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v51 count:16];
              if (v27) {
                continue;
              }
              break;
            }
          }

          [v33 addObject:v23];
LABEL_32:
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v39 objects:v52 count:16];
      }
      while (v20);
    }

    id v6 = v31;
    id v5 = v32;
  }
  else
  {
    objc_msgSend(v5, "__imArrayByApplyingBlock:", &unk_1EF2BF820);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v33;
}

+ (BOOL)isKnownContact:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = MEMORY[0x1A62278F0](v3);
    id v5 = objc_opt_class();
    v19[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v7 = [v5 _cnRecordForAliases:v6];

    id v8 = [v7 objectForKey:v4];
    if (!qword_1E94FF7E0)
    {
      uint64_t v9 = (void **)MEMORY[0x1A6227920]("IMDCNPersonNotFound", @"IMDPersistence");
      if (v9) {
        uint64_t v10 = *v9;
      }
      else {
        uint64_t v10 = 0;
      }
      objc_storeStrong((id *)&qword_1E94FF7E0, v10);
    }
    if (v8 && ([v8 containsString:qword_1E94FF7E0] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        long long v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412546;
          long long v16 = v4;
          __int16 v17 = 2112;
          uint64_t v18 = v8;
          _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Identified known alias (%@) which maps to cnRecordID (%@).", (uint8_t *)&v15, 0x16u);
        }
      }
      BOOL v11 = 1;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        long long v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412290;
          long long v16 = v4;
          _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Sender (%@) is not a known contact", (uint8_t *)&v15, 0xCu);
        }
      }
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (id)_cnRecordForAliases:(id)a3
{
  id v3 = a3;
  if (qword_1E94FF7F0 != -1) {
    dispatch_once(&qword_1E94FF7F0, &unk_1EF2BE1B8);
  }
  if (off_1E94FF7E8)
  {
    id v4 = off_1E94FF7E8(v3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (BOOL)isInternationalSpamFilteringEnabled
{
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"apply-international-spam-filter"];
  id v4 = v3;
  if (v3 && (unint64_t)[v3 unsignedIntegerValue] <= 1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A082AA30;
    block[3] = &unk_1E5A11D40;
    id v14 = v4;
    if (qword_1EB4A6248 != -1) {
      dispatch_once(&qword_1EB4A6248, block);
    }

    char v5 = 1;
  }
  else
  {
    char v5 = 0;
  }
  id v6 = IMGetCachedDomainValueForKey();
  if (v6)
  {
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = sub_1A082AB44;
    BOOL v11 = &unk_1E5A11D40;
    id v12 = v4;
    if (qword_1E94FF7F8 != -1) {
      dispatch_once(&qword_1E94FF7F8, &v8);
    }
    char v5 = objc_msgSend(v6, "BOOLValue", v8, v9, v10, v11);
  }
  return v5;
}

+ (BOOL)isChineseSpamFilteringEnabled
{
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"apply-chinese-spam-filter"];
  id v4 = v3;
  if (v3 && (unint64_t)[v3 unsignedIntegerValue] <= 1)
  {
    if (qword_1E94FF808 != -1) {
      dispatch_once(&qword_1E94FF808, &unk_1EF2BE258);
    }
    byte_1E94FF800 = 1;
  }
  char v5 = IMGetCachedDomainValueForKey();
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A082AE64;
    block[3] = &unk_1E5A11D40;
    id v9 = v4;
    if (qword_1E94FF810 != -1) {
      dispatch_once(&qword_1E94FF810, block);
    }
    char v6 = [v5 BOOLValue];
  }
  else
  {
    char v6 = byte_1E94FF800;
  }

  return v6;
}

+ (BOOL)isFilterUnknownSendersEnabled
{
  return IMGetDomainBoolForKey();
}

+ (id)internationalSpamFilterLearnMoreURL
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"international-spam-filter-learn-more-url"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (IMOSLoggingEnabled())
      {
        id v4 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          int v7 = 138412290;
          uint64_t v8 = v3;
          _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Received learn more URL from server: %@", (uint8_t *)&v7, 0xCu);
        }
      }
      objc_storeStrong((id *)&qword_1E94F7F98, v3);
    }
  }
  char v5 = [MEMORY[0x1E4F1CB10] URLWithString:qword_1E94F7F98];

  return v5;
}

@end