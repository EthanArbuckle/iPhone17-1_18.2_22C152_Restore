@interface CKUtilities
+ (BOOL)isIMStickerSaveable:(id)a3;
+ (BOOL)isIpad;
+ (BOOL)isMessagePromotionsNotificationDisabled;
+ (BOOL)isMessageTransactionsNotificationDisabled;
+ (BOOL)isMessageUnknownSenderNotificationDisabled;
+ (BOOL)userDefaultBoolForKey:(id)a3;
+ (double)_daysSinceDate:(id)a3;
+ (double)_intervalSinceDate:(id)a3;
+ (id)deviceSpecificNameForKey:(id)a3;
+ (id)imDefaultsSharedInstance;
+ (id)imMessageForIMMessageItem:(id)a3;
+ (id)nsUserDefaultsStandardUserDefaults;
+ (id)quickSaveConfirmationAlertForMediaObjects:(id)a3 momentShareURL:(id)a4 popoverSource:(id)a5 metricsSource:(id)a6 cancelHandler:(id)a7 preSaveHandler:(id)a8 postSaveHandler:(id)a9;
+ (id)quickSaveConfirmationAlertForMediaObjects:(id)a3 momentShareURL:(id)a4 popoverSource:(id)a5 metricsSource:(id)a6 cancelHandler:(id)a7 preSaveHandler:(id)a8 postSaveHandler:(id)a9 postAnyActionHandler:(id)a10;
+ (id)quickSaveConfirmationAlertWithPhotoCount:(unint64_t)a3 videoCount:(unint64_t)a4 otherCount:(unint64_t)a5 alreadySavedCount:(unint64_t)a6 popoverSource:(id)a7 cancelHandler:(id)a8 saveHandler:(id)a9 navigationHandler:(id)a10;
+ (id)saveableStickerForMediaObject:(id)a3;
+ (id)saveableStickerFromChatItem:(id)a3;
+ (id)threadIdentifierForMessagePart:(id)a3;
+ (id)threadOriginatorForMessagePart:(id)a3;
+ (unint64_t)daysUntilJunkFilterDeletionForDate:(id)a3;
+ (unint64_t)daysUntilRecentlyDeletedDeletionForDate:(id)a3;
+ (unint64_t)indexOfChatItem:(id)a3 inChatItemsArray:(id)a4;
+ (unint64_t)messageJunkStatus;
+ (void)onboardRecentlyDeletedIfNeeded:(id)a3 actionHandler:(id)a4;
+ (void)openCKVSettings;
@end

@implementation CKUtilities

+ (BOOL)isIpad
{
  if (isIpad_onceToken != -1) {
    dispatch_once(&isIpad_onceToken, &__block_literal_global_1530);
  }
  return isIpad_isIpad;
}

void __21__CKUtilities_isIpad__block_invoke()
{
  v0 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  isIpad_isIpad = (v1 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

+ (id)imDefaultsSharedInstance
{
  return (id)[MEMORY[0x1E4F6E720] sharedInstance];
}

+ (id)nsUserDefaultsStandardUserDefaults
{
  return (id)[MEMORY[0x1E4F1CB18] standardUserDefaults];
}

+ (BOOL)userDefaultBoolForKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 nsUserDefaultsStandardUserDefaults];
  char v6 = [v5 BOOLForKey:v4];

  return v6;
}

+ (id)threadIdentifierForMessagePart:(id)a3
{
  id v3 = a3;
  id v4 = [v3 threadIdentifier];
  if (![v4 length])
  {
    v5 = [v3 message];
    char v6 = [v5 guid];

    [v3 originalMessagePartRange];
    [v3 index];
    uint64_t ThreadIdentifierWithOriginatorGUID = IMMessageCreateThreadIdentifierWithOriginatorGUID();

    id v4 = (void *)ThreadIdentifierWithOriginatorGUID;
  }

  return v4;
}

+ (id)threadOriginatorForMessagePart:(id)a3
{
  id v3 = a3;
  id v4 = [v3 threadIdentifier];
  if ([v4 length])
  {
    v5 = [v3 threadOriginator];
  }
  else
  {
    char v6 = [v3 message];

    v5 = [v6 _imMessageItem];
    id v3 = v6;
  }

  return v5;
}

+ (id)imMessageForIMMessageItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 account];
  v5 = _IMBestAccountForIMItem();

  IMMessageFromIMItem = (void *)_CreateIMMessageFromIMItem();

  return IMMessageFromIMItem;
}

+ (id)deviceSpecificNameForKey:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F61740] sharedInstance];
  uint64_t v5 = [v4 deviceType];

  if ((unint64_t)(v5 - 1) > 6)
  {
    id v6 = v3;
  }
  else
  {
    id v6 = [v3 stringByAppendingString:off_1E56246F0[v5 - 1]];
  }
  v7 = v6;

  return v7;
}

+ (unint64_t)messageJunkStatus
{
  if (!CKIsEligibleForBlackhole()) {
    return 28;
  }
  if ([MEMORY[0x1E4F6EA38] isFilterUnknownSendersEnabled]) {
    return 30;
  }
  return 29;
}

+ (BOOL)isMessageUnknownSenderNotificationDisabled
{
  if (CKMessageUnknownSenderNotificationDisabled_onceToken != -1) {
    dispatch_once(&CKMessageUnknownSenderNotificationDisabled_onceToken, &__block_literal_global_1884);
  }
  return sSMSDefaultAllowUnknownSendersDisabled;
}

+ (BOOL)isMessageTransactionsNotificationDisabled
{
  if (CKMessageTransactionsNotificationDisabled_onceToken != -1) {
    dispatch_once(&CKMessageTransactionsNotificationDisabled_onceToken, &__block_literal_global_1889);
  }
  return sSMSDefaultAllowTransactionsDisabled;
}

+ (BOOL)isMessagePromotionsNotificationDisabled
{
  if (CKMessagePromotionsNotificationDisabled_onceToken != -1) {
    dispatch_once(&CKMessagePromotionsNotificationDisabled_onceToken, &__block_literal_global_1894_0);
  }
  return sSMSDefaultAllowPromotionsDisabled;
}

+ (void)openCKVSettings
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=TRANSPARENCY"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

+ (id)quickSaveConfirmationAlertWithPhotoCount:(unint64_t)a3 videoCount:(unint64_t)a4 otherCount:(unint64_t)a5 alreadySavedCount:(unint64_t)a6 popoverSource:(id)a7 cancelHandler:(id)a8 saveHandler:(id)a9 navigationHandler:(id)a10
{
  id v80 = a7;
  id v82 = a8;
  id v79 = a9;
  id v15 = a10;
  v16 = v15;
  unint64_t v17 = a4 + a3 + a5;
  if (!a3 || a5 | a4)
  {
    BOOL v19 = a4 != 0;
    BOOL v20 = (a5 | a3) == 0;
    if (v19 && v20) {
      v18 = @"_VIDEO";
    }
    else {
      v18 = @"_ITEM";
    }
    if (v19 && v20) {
      a3 = a4;
    }
    else {
      a3 += a4 + a5;
    }
  }
  else
  {
    v18 = @"_PHOTO";
  }
  v81 = v15;
  if (a6)
  {
    if (v17 <= a6)
    {
      v28 = @"ALREADY_SAVED_CONFIRMATION_SINGLE";
      if (a3 > 1) {
        v28 = @"ALREADY_SAVED_CONFIRMATION_MULTIPLE";
      }
      v22 = v28;
      BOOL v21 = 0;
    }
    else
    {
      BOOL v21 = a6 > 1;
      if (a6 <= 1) {
        v22 = @"ALREADY_SAVED_CONFIRMATION_PARTIAL_SINGLE";
      }
      else {
        v22 = @"ALREADY_SAVED_CONFIRMATION_PARTIAL_MULTIPLE";
      }
    }
    char v29 = IMGetCachedDomainBoolForKeyWithDefaultValue();
LABEL_30:
    v30 = [MEMORY[0x1E4F39228] sharedPhotoLibrary];
    int v31 = [v30 isCloudPhotoLibraryEnabled];

    if (v31)
    {
      uint64_t v32 = [(__CFString *)v22 stringByAppendingString:@"_ICPL"];

      v22 = (__CFString *)v32;
    }
    v33 = v22;
    v34 = [(__CFString *)v22 stringByAppendingString:v18];

    char v78 = v29;
    if (v21)
    {
      v35 = NSString;
      v36 = v34;
      v37 = CKFrameworkBundle();
      v38 = [v37 localizedStringForKey:v36 value:&stru_1EDE4CA38 table:@"ChatKit"];

      v39 = objc_msgSend(v35, "localizedStringWithFormat:", v38, a6);

      v40 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v41 = [v40 userInterfaceLayoutDirection];

      if (v41 == 1) {
        v42 = @"\u200F";
      }
      else {
        v42 = @"\u200E";
      }
      uint64_t v43 = [(__CFString *)v42 stringByAppendingString:v39];
    }
    else
    {
      v39 = CKFrameworkBundle();
      uint64_t v43 = [v39 localizedStringForKey:v34 value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    v77 = (void *)v43;

    unint64_t v44 = v17 - a6;
    BOOL v75 = v17 == a6;
    v76 = v34;
    if (v17 == a6)
    {
      v45 = @"SAVE_MULTIPLE_DUPLICATES";
      if (a6 == 1) {
        v45 = @"SAVE_SINGLE_DUPLICATE";
      }
      v46 = v45;
      v47 = CKFrameworkBundle();
      uint64_t v48 = [v47 localizedStringForKey:v46 value:&stru_1EDE4CA38 table:@"ChatKit"];

      v49 = (void *)MEMORY[0x1E4F42720];
      v50 = CKFrameworkBundle();
      v51 = [v50 localizedStringForKey:@"SHOW_IN_PHOTOS" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __154__CKUtilities_quickSaveConfirmationAlertWithPhotoCount_videoCount_otherCount_alreadySavedCount_popoverSource_cancelHandler_saveHandler_navigationHandler___block_invoke;
      v89[3] = &unk_1E5621380;
      v52 = v81;
      id v90 = v81;
      v74 = [v49 actionWithTitle:v51 style:0 handler:v89];

      BOOL v53 = v17 == a6;
    }
    else
    {
      if (v44 >= v17)
      {
        if (v44 == 1) {
          v63 = @"SAVE_SINGLE";
        }
        else {
          v63 = @"SAVE_MULTIPLE";
        }
        v54 = [(__CFString *)v63 stringByAppendingString:v18];
        v58 = CKFrameworkBundle();
        uint64_t v62 = [v58 localizedStringForKey:v54 value:&stru_1EDE4CA38 table:@"ChatKit"];
      }
      else
      {
        v54 = [@"SAVE_COUNT" stringByAppendingString:v18];
        v55 = NSString;
        v56 = CKFrameworkBundle();
        v57 = [v56 localizedStringForKey:v54 value:&stru_1EDE4CA38 table:@"ChatKit"];
        v58 = objc_msgSend(v55, "localizedStringWithFormat:", v57, v44);

        v59 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v60 = [v59 userInterfaceLayoutDirection];

        if (v60 == 1) {
          v61 = @"\u200F";
        }
        else {
          v61 = @"\u200E";
        }
        uint64_t v62 = [(__CFString *)v61 stringByAppendingString:v58];
      }
      uint64_t v48 = v62;

      v74 = 0;
      v52 = v81;
      BOOL v53 = v75;
    }
    v64 = (void *)MEMORY[0x1E4F42720];
    v65 = CKFrameworkBundle();
    v66 = [v65 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __154__CKUtilities_quickSaveConfirmationAlertWithPhotoCount_videoCount_otherCount_alreadySavedCount_popoverSource_cancelHandler_saveHandler_navigationHandler___block_invoke_2;
    v87[3] = &unk_1E5621380;
    id v88 = v82;
    v67 = [v64 actionWithTitle:v66 style:1 handler:v87];

    v68 = (void *)MEMORY[0x1E4F42720];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __154__CKUtilities_quickSaveConfirmationAlertWithPhotoCount_videoCount_otherCount_alreadySavedCount_popoverSource_cancelHandler_saveHandler_navigationHandler___block_invoke_3;
    v83[3] = &unk_1E5624580;
    v25 = v79;
    id v84 = v79;
    BOOL v85 = v53;
    char v86 = v78;
    v69 = (void *)v48;
    v70 = [v68 actionWithTitle:v48 style:0 handler:v83];
    v71 = [MEMORY[0x1E4F42728] alertControllerWithTitle:0 message:v77 preferredStyle:0];
    v27 = v71;
    v16 = v52;
    if (v52 && v74) {
      [v71 addAction:v74];
    }
    [v27 addAction:v70];
    [v27 setPreferredAction:v70];
    [v27 addAction:v67];
    objc_opt_class();
    v24 = v80;
    v22 = v76;
    if (objc_opt_isKindOfClass())
    {
      v72 = [v27 popoverPresentationController];
      [v72 setBarButtonItem:v80];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_60:

        goto LABEL_61;
      }
      v72 = [v27 popoverPresentationController];
      [v72 setSourceView:v80];
    }

    v16 = v81;
    goto LABEL_60;
  }
  v23 = @"QUICK_SAVE_CONFIRMATION_SINGLE";
  if (a3 > 1) {
    v23 = @"QUICK_SAVE_CONFIRMATION_MULTIPLE";
  }
  v22 = v23;
  if (!IMGetCachedDomainBoolForKeyWithDefaultValue())
  {
    char v29 = 0;
    BOOL v21 = 0;
    goto LABEL_30;
  }
  v25 = v79;
  v24 = v80;
  if (IMOSLoggingEnabled())
  {
    v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Found that we did not need to show quick save confirmation alert. Calling save handler now instead.", buf, 2u);
    }
  }
  if (v79) {
    (*((void (**)(id, void))v79 + 2))(v79, 0);
  }
  v27 = 0;
LABEL_61:

  return v27;
}

uint64_t __154__CKUtilities_quickSaveConfirmationAlertWithPhotoCount_videoCount_otherCount_alreadySavedCount_popoverSource_cancelHandler_saveHandler_navigationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __154__CKUtilities_quickSaveConfirmationAlertWithPhotoCount_videoCount_otherCount_alreadySavedCount_popoverSource_cancelHandler_saveHandler_navigationHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __154__CKUtilities_quickSaveConfirmationAlertWithPhotoCount_videoCount_otherCount_alreadySavedCount_popoverSource_cancelHandler_saveHandler_navigationHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 40));
  }
  if (!*(unsigned char *)(a1 + 41)) {
    IMSetDomainBoolForKey();
  }
}

+ (id)quickSaveConfirmationAlertForMediaObjects:(id)a3 momentShareURL:(id)a4 popoverSource:(id)a5 metricsSource:(id)a6 cancelHandler:(id)a7 preSaveHandler:(id)a8 postSaveHandler:(id)a9
{
  return (id)[a1 quickSaveConfirmationAlertForMediaObjects:a3 momentShareURL:a4 popoverSource:a5 metricsSource:a6 cancelHandler:a7 preSaveHandler:a8 postSaveHandler:a9 postAnyActionHandler:0];
}

+ (id)quickSaveConfirmationAlertForMediaObjects:(id)a3 momentShareURL:(id)a4 popoverSource:(id)a5 metricsSource:(id)a6 cancelHandler:(id)a7 preSaveHandler:(id)a8 postSaveHandler:(id)a9 postAnyActionHandler:(id)a10
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v52 = a4;
  id v53 = a5;
  id v54 = a6;
  id v56 = a7;
  id v55 = a8;
  id v57 = a9;
  id v58 = a10;
  v50 = v16;
  v51 = (id *)[v16 count];
  if (v51)
  {
    id v49 = a1;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v17 = v16;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = [v17 countByEnumeratingWithState:&v99 objects:v106 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v100;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v100 != v22) {
            objc_enumerationMutation(v17);
          }
          v24 = [*(id *)(*((void *)&v99 + 1) + 8 * i) UTIType];
          if (IMUTITypeIsPhoto())
          {
            ++v18;
          }
          else if (IMUTITypeIsVideo())
          {
            ++v19;
          }
          else
          {
            ++v20;
          }
        }
        uint64_t v21 = [v17 countByEnumeratingWithState:&v99 objects:v106 count:16];
      }
      while (v21);
    }

    uint64_t v95 = 0;
    v96 = &v95;
    uint64_t v97 = 0x2020000000;
    uint64_t v98 = 0;
    uint64_t v89 = 0;
    id v90 = &v89;
    uint64_t v91 = 0x3032000000;
    v92 = __Block_byref_object_copy__17;
    v93 = __Block_byref_object_dispose__17;
    id v94 = 0;
    id v61 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    obuint64_t j = v17;
    uint64_t v25 = [obj countByEnumeratingWithState:&v85 objects:v105 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v86;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v86 != v26) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v85 + 1) + 8 * j);
          char v29 = [v28 syndicationIdentifier];
          if (v29)
          {
            [v61 addObject:v29];
          }
          else
          {
            v30 = IMLogHandleForCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v104 = v28;
              _os_log_error_impl(&dword_18EF18000, v30, OS_LOG_TYPE_ERROR, "syndicationIdentifier for media object was nil. %@", buf, 0xCu);
            }
          }
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v85 objects:v105 count:16];
      }
      while (v25);
    }

    if ((id *)[v61 count] == v51)
    {
      int v31 = dispatch_group_create();
      dispatch_group_enter(v31);
      uint64_t v32 = [MEMORY[0x1E4F6BD68] sharedInstance];
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke;
      v81[3] = &unk_1E56245A8;
      v83 = &v95;
      id v84 = &v89;
      v33 = v31;
      id v82 = v33;
      [v32 fetchInfoForSyndicationIdentifiersSavedToSystemPhotoLibrary:v61 completion:v81];

      if (v18)
      {
        v34 = [MEMORY[0x1E4F6EA88] sharedInstance];
        [v34 sendSavePhotoEvent];
      }
      dispatch_time_t v35 = dispatch_time(0, 1000000000);
      if (dispatch_group_wait(v33, v35))
      {
        v36 = IMLogHandleForCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          +[CKUtilities quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:postAnyActionHandler:]();
        }
      }
    }
    else
    {
      v33 = IMLogHandleForCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        +[CKUtilities quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:postAnyActionHandler:]((uint64_t)v61, (uint64_t)v51, v33);
      }
    }

    BOOL v39 = v96[3] == (void)v51;
    uint64_t v40 = v90[5];
    if (v40)
    {
      uint64_t v41 = v78;
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1626;
      v78[3] = &unk_1E56245D0;
      v79[1] = &v89;
      BOOL v80 = v39;
      v51 = (id *)v79;
      v79[0] = v58;
    }
    else
    {
      uint64_t v41 = 0;
    }
    v59 = _Block_copy(v41);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_2;
    aBlock[3] = &unk_1E56245F8;
    BOOL v77 = v39;
    id v75 = v56;
    id v42 = v58;
    id v76 = v42;
    uint64_t v43 = _Block_copy(aBlock);
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1627;
    v71[3] = &unk_1E5624620;
    id v62 = v61;
    id v72 = v62;
    id v73 = v57;
    unint64_t v44 = _Block_copy(v71);
    uint64_t v45 = v96[3];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_2_1629;
    v63[3] = &unk_1E5624648;
    id v67 = v55;
    id v64 = obj;
    id v65 = v52;
    id v46 = v44;
    id v68 = v46;
    id v66 = v54;
    id v69 = v42;
    BOOL v70 = v39;
    v38 = [v49 quickSaveConfirmationAlertWithPhotoCount:v18 videoCount:v19 otherCount:v20 alreadySavedCount:v45 popoverSource:v53 cancelHandler:v43 saveHandler:v63 navigationHandler:v59];
    if (!v38 && IMOSLoggingEnabled())
    {
      v47 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v47, OS_LOG_TYPE_INFO, "Save confirmation won't be presented", buf, 2u);
      }
    }
    if (v40) {

    }
    _Block_object_dispose(&v89, 8);
    _Block_object_dispose(&v95, 8);
  }
  else
  {
    v37 = IMLogHandleForCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      +[CKUtilities quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:postAnyActionHandler:]();
    }

    v38 = 0;
  }

  return v38;
}

void __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1626(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [@"photos://asset?uuid=" stringByAppendingString:v2];
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  id v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v11 = 0;
  int v6 = [v5 openSensitiveURL:v4 withOptions:0 error:&v11];
  id v7 = v11;

  v8 = IMLogHandleForCategory();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v2;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_DEFAULT, "Navigated to asset %{public}@ in Photos", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1626_cold_1((uint64_t)v2, (uint64_t)v7, v9);
  }

  _TrackSaveDialogOptionSelected((void *)*MEMORY[0x1E4F6DB20], *(unsigned __int8 *)(a1 + 48));
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_DEFAULT, "User canceled save.", v5, 2u);
  }

  _TrackSaveDialogOptionSelected((void *)*MEMORY[0x1E4F6DAF8], *(unsigned __int8 *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1627(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if (a2)
  {
    int v6 = objc_msgSend(MEMORY[0x1E4F6BD68], "sharedInstance", v5);
    id v7 = [*(id *)(a1 + 32) allObjects];
    [v6 cacheCompletedSaveForSyndicationIdentifiers:v7];

    id v5 = v9;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v9);
    id v5 = v9;
  }
}

void __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_2_1629(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Will save %tu items", buf, 0xCu);
    }
  }
  if (!*(void *)(a1 + 40)) {
    goto LABEL_17;
  }
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Will attempt to save through moment share", buf, 2u);
    }
  }
  if ((CKSaveMomentShareFromURL(*(void **)(a1 + 40), *(void **)(a1 + 32), *(void **)(a1 + 64)) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Moment share save failed. Will fallback to media object save", buf, 2u);
      }
    }
LABEL_17:
    v12 = [[CKMediaObjectExportManager alloc] initWithMediaObjects:*(void *)(a1 + 32)];
    id v13 = v12;
    if (a2)
    {
      [(CKMediaObjectExportManager *)v12 setIgnoreSyndicationIdentifiers:1];
      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Will save ignoring syndication state, since items are already saved", buf, 2u);
        }
      }
    }
    [(CKMediaObjectExportManager *)v13 setMetricsSource:*(void *)(a1 + 48)];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1631;
    v17[3] = &unk_1E5624620;
    id v18 = *(id *)(a1 + 32);
    id v19 = *(id *)(a1 + 64);
    [(CKMediaObjectExportManager *)v13 exportQueuedMediaObjectsWithCompletion:v17];
  }
  uint64_t v15 = *(void *)(a1 + 72);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 16))(v15, v8, v9, v10);
  }
  id v16 = (void **)MEMORY[0x1E4F6DB00];
  if (!a2) {
    id v16 = (void **)MEMORY[0x1E4F6DB10];
  }
  _TrackSaveDialogOptionSelected(*v16, *(unsigned __int8 *)(a1 + 80));
}

void __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1631(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    uint64_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1631_cold_1(a1, (uint64_t)v5, v6);
    }
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Save succeeded", v7, 2u);
    }
LABEL_7:
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (unint64_t)indexOfChatItem:(id)a3 inChatItemsArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v6 indexOfObject:v5];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_15;
  }
  id v8 = v5;
  if (![v6 count])
  {
LABEL_11:
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_14;
  }
  unint64_t v7 = 0;
  while (1)
  {
    uint64_t v9 = [v6 objectAtIndex:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 transferGUIDs];
      id v11 = [v8 transferGUID];
      char v12 = [v10 containsObject:v11];
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
LABEL_10:

    if (++v7 >= [v6 count]) {
      goto LABEL_11;
    }
  }
  uint64_t v10 = [v9 transferGUID];
  id v11 = [v8 transferGUID];
  char v12 = [v10 isEqualToString:v11];
LABEL_9:
  char v13 = v12;

  if ((v13 & 1) == 0) {
    goto LABEL_10;
  }

LABEL_14:
LABEL_15:

  return v7;
}

+ (void)onboardRecentlyDeletedIfNeeded:(id)a3 actionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  unint64_t v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v8 = [v7 integerForKey:@"CKRecentlyDeletedOnboardingVersion"];

  uint64_t v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v10 = [v9 BOOLForKey:@"CKRecentlyDeletedAlwaysShowOnboarding"];

  if (!v8 || (v10 & 1) != 0)
  {
    int Unlock = CKMessageUnknownFilteringEnabledUnderFirstUnlock(0);
    char v12 = CKFrameworkBundle();
    char v13 = v12;
    if (Unlock) {
      uint64_t v14 = @"RECENTLY_DELETED_INITIAL_DELETE_ONBOARDING_ALERT_FILTERS";
    }
    else {
      uint64_t v14 = @"RECENTLY_DELETED_INITIAL_DELETE_ONBOARDING_ALERT_EDIT_MENU";
    }
    uint64_t v15 = [v12 localizedStringForKey:v14 value:&stru_1EDE4CA38 table:@"ChatKit"];

    id v16 = CKFrameworkBundle();
    id v17 = [v16 localizedStringForKey:@"RECENTLY_DELETED_INITIAL_DELETE_ONBOARDING_ALERT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v18 = +[CKAlertController alertControllerWithTitle:v17 message:v15 preferredStyle:1];

    id v19 = CKFrameworkBundle();
    uint64_t v20 = [v19 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60__CKUtilities_onboardRecentlyDeletedIfNeeded_actionHandler___block_invoke;
    v22[3] = &unk_1E5621380;
    v23 = v6;
    uint64_t v21 = +[CKAlertAction actionWithTitle:v20 style:0 handler:v22];
    [v18 addAction:v21];

    [v18 presentFromViewController:v5 animated:1 completion:&__block_literal_global_1648];
  }
  else
  {
    v6[2](v6);
  }
}

uint64_t __60__CKUtilities_onboardRecentlyDeletedIfNeeded_actionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __60__CKUtilities_onboardRecentlyDeletedIfNeeded_actionHandler___block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 setInteger:1 forKey:@"CKRecentlyDeletedOnboardingVersion"];
}

+ (unint64_t)daysUntilRecentlyDeletedDeletionForDate:(id)a3
{
  [a1 _daysSinceDate:a3];
  return vcvtpd_u64_f64(30.0 - v3);
}

+ (unint64_t)daysUntilJunkFilterDeletionForDate:(id)a3
{
  [a1 _daysSinceDate:a3];
  return vcvtpd_u64_f64(90.0 - v3);
}

+ (double)_intervalSinceDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  double v4 = v3;
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  return v7 - v4;
}

+ (double)_daysSinceDate:(id)a3
{
  [a1 _intervalSinceDate:a3];
  return v3 / 86400.0;
}

+ (BOOL)isIMStickerSaveable:(id)a3
{
  id v3 = a3;
  double v4 = +[CKUIBehavior sharedBehaviors];
  char v5 = [v4 stickerSavingEnabled];

  if (v5)
  {
    double v6 = [v3 stickerPackGUID];
    if ([v6 containsString:*MEMORY[0x1E4F6CAF8]]) {
      char v7 = 1;
    }
    else {
      char v7 = [v6 containsString:*MEMORY[0x1E4F6CBD0]];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)char v10 = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Saving stickers is not supported.", v10, 2u);
      }
    }
    char v7 = 0;
  }

  return v7;
}

+ (id)saveableStickerFromChatItem:(id)a3
{
  id v4 = a3;
  char v5 = +[CKUIBehavior sharedBehaviors];
  char v6 = [v5 stickerSavingEnabled];

  if ((v6 & 1) == 0)
  {
    id v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Saving stickers is not supported.", buf, 2u);
    }
    goto LABEL_23;
  }
  if (!v4) {
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v4 mediaObject];
    uint64_t v8 = [v7 transfer];
    uint64_t v9 = [v8 attributionInfo];
    char v10 = [v9 objectForKey:*MEMORY[0x1E4F6D3C0]];

    if ([v10 isEqualToString:&stru_1EDE4CA38]
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
    {
      id v11 = [v7 sticker];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    id v7 = v4;
    char v10 = [v7 mediaObject];
    char v12 = [v10 transfer];
    char v13 = [v12 attributionInfo];
    uint64_t v14 = [v13 objectForKey:*MEMORY[0x1E4F6D3C0]];

    if ([v14 isEqualToString:&stru_1EDE4CA38])
    {
      id v11 = [v7 sticker];
    }
    else
    {
      id v11 = 0;
    }
  }
  if (!v11)
  {
LABEL_21:
    id v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CKUtilities saveableStickerFromChatItem:]();
    }
    goto LABEL_23;
  }
  if ([a1 isIMStickerSaveable:v11]) {
    goto LABEL_24;
  }
  uint64_t v15 = IMLogHandleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v17 = 0;
    _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Sticker is not saveable. (e.g. it is from a sticker pack)", v17, 2u);
  }

LABEL_23:
  id v11 = 0;
LABEL_24:

  return v11;
}

+ (id)saveableStickerForMediaObject:(id)a3
{
  id v4 = a3;
  char v5 = +[CKUIBehavior sharedBehaviors];
  char v6 = [v5 stickerSavingEnabled];

  if (v6)
  {
    id v7 = [v4 sticker];
    if (v7)
    {
      if ([a1 isIMStickerSaveable:v7])
      {
        id v7 = v7;
        uint64_t v8 = v7;
        goto LABEL_13;
      }
      uint64_t v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Sticker is not saveable. (e.g. it is from a sticker pack)", v11, 2u);
      }
    }
    else
    {
      uint64_t v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[CKUtilities saveableStickerForMediaObject:]();
      }
    }
  }
  else
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Saving stickers is not supported.", buf, 2u);
    }
  }
  uint64_t v8 = 0;
LABEL_13:

  return v8;
}

+ (void)quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:postAnyActionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Tried to create a quick save alert with no media objects.", v2, v3, v4, v5, v6);
}

+ (void)quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:postAnyActionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Timed out while fetching num saved. Assuming none are saved.", v2, v3, v4, v5, v6);
}

+ (void)quickSaveConfirmationAlertForMediaObjects:(NSObject *)a3 momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:postAnyActionHandler:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_2(&dword_18EF18000, a2, a3, "Discrepancy between the media objects and the syndication identifiers. Assuming none are saved. mediaObjects.count: %tu, syndicationIdentifiers: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1626_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2(&dword_18EF18000, a2, a3, "Failed to navigate to asset %@ in Photos. Error %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1631_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2(&dword_18EF18000, a2, a3, "Error quick saving media items: %@. Error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

+ (void)saveableStickerFromChatItem:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Could not extract IMSticker from chat item", v2, v3, v4, v5, v6);
}

+ (void)saveableStickerForMediaObject:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Could not extract IMSticker from emoji image media object", v2, v3, v4, v5, v6);
}

@end