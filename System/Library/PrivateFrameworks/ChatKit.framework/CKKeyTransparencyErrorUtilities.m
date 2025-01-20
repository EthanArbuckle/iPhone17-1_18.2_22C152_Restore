@interface CKKeyTransparencyErrorUtilities
+ (id)_getLearnMoreURL:(BOOL)a3;
+ (id)keyTransparencyIDFromID:(id)a3;
+ (id)ktClearWarningAlertControllerForChat:(id)a3 confirmationHandler:(id)a4;
+ (void)learnMorePressedFromError:(BOOL)a3;
+ (void)showKTContactVerificationUIForIMChat:(id)a3 fromViewController:(id)a4;
+ (void)showReportToAppleUIFromViewController:(id)a3;
@end

@implementation CKKeyTransparencyErrorUtilities

+ (id)_getLearnMoreURL:(BOOL)a3
{
  if (a3) {
    v3 = @"https://support.apple.com/ht213478";
  }
  else {
    v3 = @"https://support.apple.com/ht213465";
  }
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:v3];
}

+ (void)learnMorePressedFromError:(BOOL)a3
{
  id v4 = [a1 _getLearnMoreURL:a3];
  v3 = [MEMORY[0x1E4F42738] sharedApplication];
  [v3 openURL:v4 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

+ (void)showReportToAppleUIFromViewController:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v4 = (void *)getKTStatusClass_softClass;
  uint64_t v13 = getKTStatusClass_softClass;
  if (!getKTStatusClass_softClass)
  {
    location[0] = (id)MEMORY[0x1E4F143A8];
    location[1] = (id)3221225472;
    location[2] = __getKTStatusClass_block_invoke;
    location[3] = &unk_1E5620B90;
    location[4] = &v10;
    __getKTStatusClass_block_invoke((uint64_t)location);
    id v4 = (void *)v11[3];
  }
  v5 = v4;
  _Block_object_dispose(&v10, 8);
  v6 = (void *)[[v5 alloc] initWithApplication:@"IDS"];
  location[0] = 0;
  objc_initWeak(location, v3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__CKKeyTransparencyErrorUtilities_showReportToAppleUIFromViewController___block_invoke;
  v7[3] = &unk_1E562C0A0;
  objc_copyWeak(&v8, location);
  [v6 getCurrentStatus:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(location);
}

void __73__CKKeyTransparencyErrorUtilities_showReportToAppleUIFromViewController___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7 || ![v6 count])
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Unable to present Report to Apple UI due to error: %@ failure events: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v9 = (void *)getTUIKTReportToAppleContextClass_softClass;
    uint64_t v25 = getTUIKTReportToAppleContextClass_softClass;
    if (!getTUIKTReportToAppleContextClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getTUIKTReportToAppleContextClass_block_invoke;
      v27 = &unk_1E5620B90;
      v28 = &v22;
      __getTUIKTReportToAppleContextClass_block_invoke((uint64_t)buf);
      v9 = (void *)v23[3];
    }
    uint64_t v10 = v9;
    _Block_object_dispose(&v22, 8);
    id v11 = [v10 alloc];
    uint64_t v12 = [v6 firstObject];
    [v11 setFailingValidation:v12];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v14 = (void *)getTUIKTReportToAppleViewControllerClass_softClass;
    uint64_t v25 = getTUIKTReportToAppleViewControllerClass_softClass;
    if (!getTUIKTReportToAppleViewControllerClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getTUIKTReportToAppleViewControllerClass_block_invoke;
      v27 = &unk_1E5620B90;
      v28 = &v22;
      __getTUIKTReportToAppleViewControllerClass_block_invoke((uint64_t)buf);
      v14 = (void *)v23[3];
    }
    v15 = v14;
    _Block_object_dispose(&v22, 8);
    v16 = (void *)[[v15 alloc] initWithContext:v11];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__CKKeyTransparencyErrorUtilities_showReportToAppleUIFromViewController___block_invoke_2;
    v19[3] = &unk_1E5620AF8;
    id v20 = WeakRetained;
    id v21 = v16;
    id v17 = v16;
    id v18 = WeakRetained;
    dispatch_async(MEMORY[0x1E4F14428], v19);
  }
}

uint64_t __73__CKKeyTransparencyErrorUtilities_showReportToAppleUIFromViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:&__block_literal_global_243];
}

void __73__CKKeyTransparencyErrorUtilities_showReportToAppleUIFromViewController___block_invoke_3()
{
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_18EF18000, v0, OS_LOG_TYPE_INFO, "Presented Report To Apple KT UI", v1, 2u);
    }
  }
}

+ (void)showKTContactVerificationUIForIMChat:(id)a3 fromViewController:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v52 = a4;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Tapped KT verify conversation cell", buf, 2u);
    }
  }
  if ([v5 hasKnownParticipants])
  {
    id v7 = [v5 participants];
    BOOL v8 = [v7 count] == 1;

    if (v8)
    {
      v9 = [v5 participants];
      uint64_t v10 = [v9 firstObject];

      if (!v10)
      {
        v32 = IMLogHandleForCategory();
        v33 = v32;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          +[CKKeyTransparencyErrorUtilities showKTContactVerificationUIForIMChat:fromViewController:]((uint64_t)v5, v32);
          v33 = v32;
        }
        goto LABEL_64;
      }
      uint64_t v11 = *MEMORY[0x1E4F1ADC8];
      v67[0] = *MEMORY[0x1E4F1AEE0];
      v67[1] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
      v51 = [v10 cnContactWithKeys:v12];

      uint64_t v13 = [v51 phoneNumberStrings];
      v14 = [v51 emailAddressStrings];
      v15 = objc_opt_new();
      v16 = [v10 ID];
      id v17 = +[CKKeyTransparencyErrorUtilities keyTransparencyIDFromID:v16];
      [v15 addObject:v17];

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v18 = v13;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v58 != v20) {
              objc_enumerationMutation(v18);
            }
            uint64_t v22 = +[CKKeyTransparencyErrorUtilities keyTransparencyIDFromID:*(void *)(*((void *)&v57 + 1) + 8 * i)];
            [v15 addObject:v22];
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v57 objects:v66 count:16];
        }
        while (v19);
      }

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v23 = v14;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v53 objects:v65 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v54;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v54 != v25) {
              objc_enumerationMutation(v23);
            }
            v27 = +[CKKeyTransparencyErrorUtilities keyTransparencyIDFromID:*(void *)(*((void *)&v53 + 1) + 8 * j)];
            [v15 addObject:v27];
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v53 objects:v65 count:16];
        }
        while (v24);
      }

      if (![v15 count])
      {
        v28 = IMLogHandleForCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v51;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v18;
          *(_WORD *)&buf[22] = 2112;
          v69 = v23;
          _os_log_error_impl(&dword_18EF18000, v28, OS_LOG_TYPE_ERROR, "Unable to verify key transparency, no valid handles identified for contact: %@ with phoneNumbers: %@, emailAddresses: %@", buf, 0x20u);
        }
        goto LABEL_63;
      }
      v28 = objc_opt_new();
      uint64_t v29 = [v5 lastAddressedHandleID];
      v30 = v29;
      if (v29 && [v29 length])
      {
        v31 = v30;
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v34 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v5;
            _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "Unable to find a valid last addressed handle ID for chat:%@", buf, 0xCu);
          }
        }
        v35 = [v5 account];
        v36 = [v35 loginIMHandle];

        if (v36)
        {
          uint64_t v37 = [v36 displayID];

          v30 = (void *)v37;
        }
        else if (IMOSLoggingEnabled())
        {
          v38 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v5;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = 0;
            _os_log_impl(&dword_18EF18000, v38, OS_LOG_TYPE_INFO, "Unable to find a valid handle ID for chat:%@ login handle: %@", buf, 0x16u);
          }
        }
        v31 = v30;
        if (!v30)
        {
          uint64_t v48 = 0;
          goto LABEL_48;
        }
      }
      if (objc_msgSend(v31, "length", v31))
      {
        [v28 setObject:v48 forKeyedSubscript:@"lastUsedIdentifier"];
LABEL_52:
        v50 = [v51 identifier];
        if (v50)
        {
          v40 = [v51 identifier];
          [v28 setObject:v40 forKeyedSubscript:@"contactIdentifier"];

          v41 = [v15 array];
          if (IMOSLoggingEnabled())
          {
            v42 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v41;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v28;
              _os_log_impl(&dword_18EF18000, v42, OS_LOG_TYPE_INFO, "Attempting to present KT verification for handles: %@, options: %@", buf, 0x16u);
            }
          }
          uint64_t v61 = 0;
          v62 = &v61;
          uint64_t v63 = 0x2050000000;
          v43 = (void *)getTUIKTConversationViewControllerClass_softClass;
          uint64_t v64 = getTUIKTConversationViewControllerClass_softClass;
          if (!getTUIKTConversationViewControllerClass_softClass)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getTUIKTConversationViewControllerClass_block_invoke;
            v69 = &unk_1E5620B90;
            v70 = &v61;
            __getTUIKTConversationViewControllerClass_block_invoke((uint64_t)buf);
            v43 = (void *)v62[3];
          }
          v44 = v43;
          _Block_object_dispose(&v61, 8);
          v45 = (void *)[[v44 alloc] initForMembers:v41 options:v28];
          id v46 = v52;
          [v45 setDelegate:v46];
          v47 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v45];
          [v46 presentViewController:v47 animated:1 completion:0];
        }
        else
        {
          v41 = IMLogHandleForCategory();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            +[CKKeyTransparencyErrorUtilities showKTContactVerificationUIForIMChat:fromViewController:](v41);
          }
        }

LABEL_63:
        v33 = v51;
LABEL_64:

        goto LABEL_65;
      }
LABEL_48:
      if (IMOSLoggingEnabled())
      {
        v39 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v39, OS_LOG_TYPE_INFO, "Cannot set the lastUsedIdentifier.", buf, 2u);
        }
      }
      goto LABEL_52;
    }
    uint64_t v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[CKKeyTransparencyErrorUtilities showKTContactVerificationUIForIMChat:fromViewController:](v5, v10);
    }
  }
  else
  {
    uint64_t v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[CKKeyTransparencyErrorUtilities showKTContactVerificationUIForIMChat:fromViewController:].cold.4(v10);
    }
  }
LABEL_65:
}

+ (id)keyTransparencyIDFromID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 _stripFZIDPrefix];
  id v5 = IMChatCanonicalIDSIDsForAddress();

  if (v5)
  {
    id v6 = [@"im://" stringByAppendingString:v5];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        id v10 = v3;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "CKDetailsController_KT Could not get a canonical ID for the identifier: %@", (uint8_t *)&v9, 0xCu);
      }
    }
    id v6 = &stru_1EDE4CA38;
  }

  return v6;
}

+ (id)ktClearWarningAlertControllerForChat:(id)a3 confirmationHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = CKIsRunningInMacCatalyst();
  if (CKIsRunningInMacCatalyst())
  {
    BOOL v8 = CKFrameworkBundle();
    int v9 = [v8 localizedStringForKey:@"KT_CLEAR_ARE_YOU_SURE" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];

    id v10 = CKFrameworkBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"KT_CLEAR_YOU_WILL_SEE_A_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
  }
  else
  {
    uint64_t v11 = 0;
    int v9 = 0;
  }
  uint64_t v12 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v9 message:v11 preferredStyle:v7 != 0];
  uint64_t v13 = (void *)MEMORY[0x1E4F42720];
  v14 = CKFrameworkBundle();
  v15 = [v14 localizedStringForKey:@"KT_CLEAR_WARNING" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __92__CKKeyTransparencyErrorUtilities_ktClearWarningAlertControllerForChat_confirmationHandler___block_invoke;
  v24[3] = &unk_1E56280C8;
  id v25 = v5;
  id v26 = v6;
  id v16 = v6;
  id v17 = v5;
  id v18 = [v13 actionWithTitle:v15 style:2 handler:v24];

  uint64_t v19 = (void *)MEMORY[0x1E4F42720];
  uint64_t v20 = CKFrameworkBundle();
  id v21 = [v20 localizedStringForKey:@"KT_CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
  uint64_t v22 = [v19 actionWithTitle:v21 style:1 handler:&__block_literal_global_123_1];

  [v12 addAction:v18];
  [v12 addAction:v22];

  return v12;
}

uint64_t __92__CKKeyTransparencyErrorUtilities_ktClearWarningAlertControllerForChat_confirmationHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) ignoreKTFailure];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

+ (void)showKTContactVerificationUIForIMChat:(uint64_t)a1 fromViewController:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "There are no participants in the IMChat to verify. %@", (uint8_t *)&v2, 0xCu);
}

+ (void)showKTContactVerificationUIForIMChat:(os_log_t)log fromViewController:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Unable to form options dictionary for TUIKTConversationViewController due to missing contactIdentifier. contactIdentifier: %@", (uint8_t *)&v1, 0xCu);
}

+ (void)showKTContactVerificationUIForIMChat:(void *)a1 fromViewController:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 participants];
  int v5 = 134218242;
  uint64_t v6 = [v4 count];
  __int16 v7 = 2112;
  BOOL v8 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Invalid Chat. There is more than one participant in the IMChat to verify. Number of participants: %lu IMChat: %@", (uint8_t *)&v5, 0x16u);
}

+ (void)showKTContactVerificationUIForIMChat:(os_log_t)log fromViewController:.cold.4(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Unable to verify KT status for conversation with no known participants.", v1, 2u);
}

@end