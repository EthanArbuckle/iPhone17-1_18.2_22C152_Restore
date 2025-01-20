@interface CKKTDetailsViewUtilities
+ (BOOL)shouldHighlightCell:(id)a3 forConversation:(id)a4;
+ (id)_commaSeparatedNamesForHandles:(id)a3;
+ (id)enableKTCellText;
+ (id)ktSecuritySectionFooterTextViewForKTStatus:(unint64_t)a3 withHandles:(id)a4;
+ (id)namesFromHandles:(id)a3 shouldUseShortFormat:(BOOL)a4;
+ (id)securityDescriptionWithPlaceholder:(id)a3 handles:(id)a4;
+ (id)securityFooterStringForKTChatState:(unint64_t)a3 handles:(id)a4;
+ (id)securityHeaderString;
+ (id)verifiedHandlesInChat:(id)a3;
+ (int64_t)numberOfRowsInKTSectionForStatus:(unint64_t)a3 isGroupChat:(BOOL)a4;
@end

@implementation CKKTDetailsViewUtilities

+ (id)ktSecuritySectionFooterTextViewForKTStatus:(unint64_t)a3 withHandles:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F42F58];
  id v6 = a4;
  id v7 = [v5 alloc];
  v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v8 setEditable:0];
  [v8 _setInteractiveTextSelectionDisabled:1];
  v9 = [v8 textContainer];
  [v9 setLineFragmentPadding:0.0];

  [v8 setBackgroundColor:0];
  v10 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [v8 setTextColor:v10];

  [v8 setScrollEnabled:0];
  v11 = +[CKUIBehavior sharedBehaviors];
  v12 = [v11 headerFont];
  [v8 setFont:v12];

  [v8 setAdjustsFontForContentSizeCategory:1];
  v13 = +[CKKTDetailsViewUtilities securityFooterStringForKTChatState:a3 handles:v6];

  [v8 setAttributedText:v13];

  return v8;
}

+ (BOOL)shouldHighlightCell:(id)a3 forConversation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 chat];
    char v8 = [v7 hasKnownParticipants];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v8 = 1;
    }
    else
    {
      objc_opt_class();
      char v8 = objc_opt_isKindOfClass() ^ 1;
    }
  }

  return v8 & 1;
}

+ (int64_t)numberOfRowsInKTSectionForStatus:(unint64_t)a3 isGroupChat:(BOOL)a4
{
  if (a3 - 9 < 0xFFFFFFFFFFFFFFFBLL || a4) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (id)verifiedHandlesInChat:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [a3 participants];
  v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isKTVerified", (void)v13)) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v4 copy];

  return v11;
}

+ (id)namesFromHandles:(id)a3 shouldUseShortFormat:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = v7;
  if (v4) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 3;
  }
  [v7 setStyle:v9];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v16 = objc_opt_new();
        v17 = objc_msgSend(v15, "firstName", (void)v26);

        if (v17)
        {
          uint64_t v18 = [v15 firstName];
        }
        else
        {
          v19 = [v15 displayID];

          if (!v19) {
            goto LABEL_14;
          }
          uint64_t v18 = [v15 displayID];
        }
        v20 = (void *)v18;
        [v16 setGivenName:v18];

LABEL_14:
        v21 = [v15 lastName];

        if (v21)
        {
          v22 = [v15 lastName];
          [v16 setFamilyName:v22];
        }
        v23 = [v8 stringFromPersonNameComponents:v16];
        [v6 addObject:v23];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  v24 = (void *)[v6 copy];

  return v24;
}

+ (id)_commaSeparatedNamesForHandles:(id)a3
{
  v3 = +[CKKTDetailsViewUtilities namesFromHandles:a3 shouldUseShortFormat:1];
  if ([v3 count])
  {
    BOOL v4 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v3];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)securityDescriptionWithPlaceholder:(id)a3 handles:(id)a4
{
  id v5 = a3;
  id v6 = +[CKKTDetailsViewUtilities _commaSeparatedNamesForHandles:a4];
  uint64_t v7 = NSString;
  uint64_t v8 = CKFrameworkBundle();
  uint64_t v9 = [v8 localizedStringForKey:v5 value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];

  id v10 = CKFrameworkBundle();
  uint64_t v11 = [v10 localizedStringForKey:@"KT_LEARN_MORE_FOOTER_BUTTON_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
  uint64_t v12 = objc_msgSend(v7, "localizedStringWithFormat:", v9, v6, v11);

  return v12;
}

+ (id)securityFooterStringForKTChatState:(unint64_t)a3 handles:(id)a4
{
  id v5 = a4;
  v45 = v5;
  id v6 = v5;
  switch(a3)
  {
    case 0uLL:
      v20 = CKFrameworkBundle();
      uint64_t v11 = v20;
      v21 = @"KT_TURN_ON_FOOTER_TEXT";
      goto LABEL_22;
    case 1uLL:
    case 0xAuLL:
    case 0xDuLL:
    case 0xEuLL:
      int v7 = CKIsRunningInMacCatalyst();
      uint64_t v8 = CKFrameworkBundle();
      uint64_t v9 = v8;
      if (v7) {
        id v10 = @"SYSTEM_SETTINGS";
      }
      else {
        id v10 = @"SETTINGS";
      }
      uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];

      uint64_t v12 = +[CKKTDetailsViewUtilities _commaSeparatedNamesForHandles:v6];
      uint64_t v13 = [v6 count];
      long long v14 = NSString;
      long long v15 = CKFrameworkBundle();
      long long v16 = v15;
      if (v13 == 1) {
        v17 = @"KT_FOOTER_VIEW_TEXT_DISABLED";
      }
      else {
        v17 = @"KT_FOOTER_VIEW_TEXT_DISABLED_PLURAL";
      }
      v22 = [v15 localizedStringForKey:v17 value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
      v23 = CKFrameworkBundle();
      v24 = [v23 localizedStringForKey:@"KT_LEARN_MORE_FOOTER_BUTTON_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
      uint64_t v19 = objc_msgSend(v14, "localizedStringWithFormat:", v22, v12, v11, v24);

      goto LABEL_23;
    case 2uLL:
    case 0xBuLL:
    case 0xCuLL:
      v20 = CKFrameworkBundle();
      uint64_t v11 = v20;
      v21 = @"KT_FOOTER_VIEW_TEXT_UNAVAILABLE";
      goto LABEL_22;
    case 3uLL:
      if ([v5 count] == 1) {
        uint64_t v18 = @"KT_FOOTER_TEXT_NOT_VERIFIED";
      }
      else {
        uint64_t v18 = @"KT_FOOTER_TEXT_NOT_VERIFIED_GROUP";
      }
      goto LABEL_8;
    case 4uLL:
      if ([v5 count] == 1)
      {
        uint64_t v18 = @"KT_FOOTER_TEXT_VERIFIED";
LABEL_8:
        uint64_t v19 = +[CKKTDetailsViewUtilities securityDescriptionWithPlaceholder:v18 handles:v6];
      }
      else
      {
        v20 = CKFrameworkBundle();
        uint64_t v11 = v20;
        v21 = @"KT_FOOTER_TEXT_VERIFIED_GROUP";
LABEL_22:
        uint64_t v19 = [v20 localizedStringForKey:v21 value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
LABEL_23:
      }
LABEL_24:
      v44 = (void *)v19;
      v25 = CKFrameworkBundle();
      long long v26 = [v25 localizedStringForKey:@"KT_LEARN_MORE_FOOTER_BUTTON_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];

      long long v27 = objc_msgSend(NSString, "localizedStringWithFormat:", v19, v26);
      uint64_t v28 = [v27 rangeOfString:v26];
      uint64_t v30 = v29;
      uint64_t v31 = [v27 length];
      v32 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v27];
      v33 = +[CKUIBehavior sharedBehaviors];
      v34 = [v33 headerFont];
      v35 = +[CKUIBehavior font:v34 adjustedForMaxSizeCategory:*MEMORY[0x1E4F43768]];

      objc_msgSend(v32, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v35, 0, v31);
      uint64_t v36 = *MEMORY[0x1E4FB0700];
      v37 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
      objc_msgSend(v32, "addAttribute:value:range:", v36, v37, 0, v31);

      v38 = +[CKUIBehavior sharedBehaviors];
      v39 = [v38 theme];
      v40 = [v39 appTintColor];
      objc_msgSend(v32, "addAttribute:value:range:", v36, v40, v28, v30);

      uint64_t v41 = *MEMORY[0x1E4FB0720];
      v42 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1EDE4CA38];
      objc_msgSend(v32, "addAttribute:value:range:", v41, v42, v28, v30);

      objc_msgSend(v32, "addAttribute:value:range:", *MEMORY[0x1E4FB0808], MEMORY[0x1E4F1CC28], v28, v30);
      return v32;
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      uint64_t v18 = @"KT_FOOTER_VIEW_TEXT_VERIFICATION_FAILURE";
      goto LABEL_8;
    case 9uLL:
      if ([v5 count] == 1) {
        uint64_t v18 = @"KT_FOOTER_VIEW_TEXT_TURNED_OFF";
      }
      else {
        uint64_t v18 = @"KT_FOOTER_VIEW_TEXT_TURNED_OFF_PLURAL";
      }
      goto LABEL_8;
    default:
      uint64_t v19 = 0;
      goto LABEL_24;
  }
}

+ (id)securityHeaderString
{
  v2 = CKFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"KT_HEADER_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];

  return v3;
}

+ (id)enableKTCellText
{
  v2 = CKFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"KT_ENABLE_KT_CELL_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];

  return v3;
}

@end