@interface IMUnknownSenderHelper
+ (BOOL)accountCountryIsCandidateForInternationalFiltering:(id)a3;
+ (BOOL)accountRegionIsCandidateForInternationalFiltering:(id)a3;
+ (BOOL)receiverIsCandidateForInternationalFiltering:(id)a3;
+ (BOOL)receivingID:(id)a3 isCountryCode:(id)a4;
+ (BOOL)shouldShowInternationalSenderWarningForHandleID:(id)a3;
+ (id)mapID:(id)a3 usingKey:(id)a4;
@end

@implementation IMUnknownSenderHelper

+ (BOOL)receiverIsCandidateForInternationalFiltering:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = +[IMUnknownSenderHelper receivingID:v3 isCountryCode:@"tw"];
  if (v4 && IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = v3;
      __int16 v9 = 2112;
      v10 = @"tw";
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for international filtering.", (uint8_t *)&v7, 0x16u);
    }
  }
  return v4;
}

+ (BOOL)accountRegionIsCandidateForInternationalFiltering:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"R:TW"])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v3;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Region (%@) is a candidate for international filtering.", (uint8_t *)&v7, 0xCu);
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
      BOOL v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Region is a candidate for international filtering.", (uint8_t *)&v7, 2u);
      }
      goto LABEL_10;
    }
  }
  BOOL v5 = 1;
LABEL_13:

  return v5;
}

+ (BOOL)accountCountryIsCandidateForInternationalFiltering:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"tw"])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v3;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Country (%@) is a candidate for international filtering.", (uint8_t *)&v7, 0xCu);
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
      BOOL v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Country is a candidate for international filtering.", (uint8_t *)&v7, 2u);
      }
      goto LABEL_10;
    }
  }
  BOOL v5 = 1;
LABEL_13:

  return v5;
}

+ (BOOL)shouldShowInternationalSenderWarningForHandleID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    BOOL v5 = MEMORY[0x1A62278F0](v4);
    v6 = [a1 mapID:v5 usingKey:@"mapSendingIDForSpamFilter"];

    if ((IMStringIsEmail() & 1) != 0 || !MEMORY[0x1A62278C0](v6))
    {
      BOOL v8 = 0;
    }
    else
    {
      int v7 = IMCountryCodeForNumber();
      BOOL v8 = v7 != 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)receivingID:(id)a3 isCountryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    BOOL v8 = MEMORY[0x1A62278F0](v6);
    uint64_t v9 = [a1 mapID:v8 usingKey:@"mapSendingIDForSpamFilter"];

    if (MEMORY[0x1A62278C0](v9))
    {
      v10 = IMCountryCodeForNumber();
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
  BOOL v8 = v7;
  if (v7 && ([v7 objectForKey:v5], (id v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
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

@end