@interface CKCollaborationNoticeSuggestion
+ (id)suggestionWithNotice:(id)a3 delegate:(id)a4 wantsInlineReplyStyle:(BOOL)a5;
- (BOOL)suggestionListSupportsDismissal;
- (BOOL)wantsInlineReplyStyle;
- (CKCollaborationNoticeSuggestion)initWithNotice:(id)a3 wantsInlineReplyStyle:(BOOL)a4;
- (CKCollaborationNoticeSuggestionDelegate)delegate;
- (CKEntity)senderEntity;
- (IMCollaborationNotice)notice;
- (SGSuggestionDelegate)suggestionDelegate;
- (id)aggregateUTTypeForItems:(id)a3 withAggregateNoticeType:(int64_t)a4;
- (id)collaborationNoticeSuggestionsForItems:(id)a3;
- (id)collaborationTitleForUTType:(id)a3 numberOfFiles:(int64_t)a4;
- (id)suggestionBackgroundVisualEffectView;
- (id)suggestionCategoryId;
- (id)suggestionCategoryImage;
- (id)suggestionCategoryLocalizedCountOfItems:(id)a3;
- (id)suggestionCategorySubtitleForItems:(id)a3;
- (id)suggestionCategoryTitle;
- (id)suggestionCategoryTitleForItems:(id)a3;
- (id)suggestionCategoryTitleWithSenderName:(id)a3 documentTitle:(id)a4 noticeType:(int64_t)a5;
- (id)suggestionCategoryTitleWithSenderName:(id)a3 numberOfFiles:(int64_t)a4 numberOfItems:(int64_t)a5 aggregateContentType:(id)a6 aggregateNoticeType:(int64_t)a7;
- (id)suggestionDismissAction;
- (id)suggestionDivider;
- (id)suggestionHandlesForItems:(id)a3;
- (id)suggestionImageSGView;
- (id)suggestionListTitle;
- (id)suggestionPrimaryAction;
- (id)suggestionSubtitle;
- (id)suggestionTitle;
- (id)suggestionURLsForItems:(id)a3;
- (int64_t)aggregateCollaborationNoticeTypeForItems:(id)a3;
- (int64_t)suggestionActionButtonType;
- (int64_t)suggestionCategoryActionButtonType;
- (void)setDelegate:(id)a3;
- (void)setSuggestionDelegate:(id)a3;
- (void)setWantsInlineReplyStyle:(BOOL)a3;
- (void)suggestionImageSGView;
@end

@implementation CKCollaborationNoticeSuggestion

+ (id)suggestionWithNotice:(id)a3 delegate:(id)a4 wantsInlineReplyStyle:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[CKCollaborationNoticeSuggestion alloc] initWithNotice:v8 wantsInlineReplyStyle:v5];

  [(CKCollaborationNoticeSuggestion *)v9 setDelegate:v7];

  return v9;
}

- (CKCollaborationNoticeSuggestion)initWithNotice:(id)a3 wantsInlineReplyStyle:(BOOL)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKCollaborationNoticeSuggestion;
  id v8 = [(CKCollaborationNoticeSuggestion *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notice, a3);
    v10 = [v7 senderHandle];
    uint64_t v11 = +[CKEntity entityForAddress:v10];
    senderEntity = v9->_senderEntity;
    v9->_senderEntity = (CKEntity *)v11;

    v9->_wantsInlineReplyStyle = a4;
  }

  return v9;
}

- (id)suggestionListTitle
{
  v2 = CKFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"UPDATES" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

- (BOOL)suggestionListSupportsDismissal
{
  return 1;
}

- (id)suggestionPrimaryAction
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke;
  aBlock[3] = &unk_1E5620C40;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  v4 = [(CKCollaborationNoticeSuggestion *)self notice];
  BOOL v5 = [v4 metadata];
  unint64_t v6 = [v5 type];

  if (v6 < 8)
  {
    id v7 = CKFrameworkBundle();
    id v8 = [v7 localizedStringForKey:@"SHOW" value:&stru_1EDE4CA38 table:@"ChatKit"];

    v9 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v10 = __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_3;
LABEL_3:
    v9[2] = v10;
    v9[3] = &unk_1E562BFE0;
    v9[4] = self;
    v9[5] = v3;
    uint64_t v11 = _Block_copy(v9);

    goto LABEL_4;
  }
  if (v6 == 8)
  {
    v15 = CKFrameworkBundle();
    id v8 = [v15 localizedStringForKey:@"ADD_TO_DOCUMENT_ACTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

    v9 = v17;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v10 = __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_4;
    goto LABEL_3;
  }
  if (v6 == 9)
  {
    objc_super v14 = CKFrameworkBundle();
    id v8 = [v14 localizedStringForKey:@"REMOVE_FROM_DOCUMENT_ACTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

    v9 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v10 = __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_5;
    goto LABEL_3;
  }
  id v8 = 0;
  uint64_t v11 = 0;
LABEL_4:
  v12 = [MEMORY[0x1E4F5DFF8] actionWithTitle:v8 handler:v11];

  return v12;
}

void __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_2;
  block[3] = &unk_1E5620C40;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) suggestionDismissAction];
  [v1 execute];
}

uint64_t __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) notice];
  v3 = [v2 metadata];
  v4 = [v3 contentURL];

  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F42738] sharedApplication];
    unint64_t v6 = [*(id *)(a1 + 32) notice];
    id v7 = [v6 metadata];
    id v8 = [v7 contentURL];
    [v5 openURL:v8 withCompletionHandler:0];
  }
  v9 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v9();
}

uint64_t __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 addToCollaboration:*(void *)(a1 + 32)];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 removeFromCollaboration:*(void *)(a1 + 32)];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (id)suggestionDismissAction
{
  v3 = [(CKCollaborationNoticeSuggestion *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    BOOL v5 = (void *)MEMORY[0x1E4F5DFF8];
    unint64_t v6 = CKFrameworkBundle();
    id v7 = [v6 localizedStringForKey:@"IGNORE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__CKCollaborationNoticeSuggestion_suggestionDismissAction__block_invoke;
    v10[3] = &unk_1E56298F8;
    v10[4] = self;
    id v8 = [v5 actionWithTitle:v7 handler:v10];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __58__CKCollaborationNoticeSuggestion_suggestionDismissAction__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 collaborationNoticeSuggestionWillDismiss:*(void *)(a1 + 32)];
}

- (id)suggestionBackgroundVisualEffectView
{
  if (self->_wantsInlineReplyStyle)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F43028]);
    v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    char v4 = +[CKUIBehavior sharedBehaviors];
    BOOL v5 = [v4 theme];
    unint64_t v6 = [v5 replyTranscriptBlurBackgroundEffects];
    [v3 setBackgroundEffects:v6];

    id v7 = +[CKUIBehavior sharedBehaviors];
    id v8 = [v7 theme];
    v9 = [v8 replyTranscriptBlurBackgroundColor];
    [v3 setBackgroundColor:v9];

    [v3 _setGroupName:@"inlineReplyVisualEffectViewGroup"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)suggestionDivider
{
  if (self->_wantsInlineReplyStyle)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F5DFE0]);
    v3 = +[CKUIBehavior sharedBehaviors];
    char v4 = [v3 theme];
    BOOL v5 = [v4 entryFieldBorderColor];
    unint64_t v6 = (void *)[v2 initWithPosition:3 color:v5];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)suggestionSubtitle
{
  v3 = [(CKCollaborationNoticeSuggestion *)self notice];
  char v4 = [v3 metadata];
  unint64_t v5 = [v4 type];

  if (v5 > 9)
  {
    uint64_t v11 = 0;
  }
  else
  {
    unint64_t v6 = [(CKCollaborationNoticeSuggestion *)self notice];
    id v7 = [v6 date];

    id v8 = [MEMORY[0x1E4F1C9C8] date];
    [v8 timeIntervalSinceDate:v7];
    if (v9 <= -3.0)
    {
      uint64_t v11 = 0;
    }
    else
    {
      if ((uint64_t)v9 / 60 % 60 <= 0)
      {
        CKFrameworkBundle();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        [v10 localizedStringForKey:@"TIME_STATUS_JUST_NOW" value:&stru_1EDE4CA38 table:@"ChatKit"];
      }
      else
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F28FE0]);
        [v10 localizedStringForDate:v7 relativeToDate:v8];
      uint64_t v11 = };
    }
  }

  return v11;
}

- (id)suggestionImageSGView
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6E6D8] sharedInstance];
  char v4 = [(CKCollaborationNoticeSuggestion *)self notice];
  unint64_t v5 = [v4 senderHandle];
  unint64_t v6 = [MEMORY[0x1E4F1BBE8] descriptorForRequiredKeysIncludingImage:1];
  v23[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v8 = [v3 fetchCNContactForHandleID:v5 withKeys:v7];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1BB68]);
  if (v8)
  {
    v22 = v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    [v9 setContacts:v10];
  }
  else
  {
    id v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(CKCollaborationNoticeSuggestion *)self suggestionImageSGView];
    }
  }

  id v11 = objc_alloc_init(MEMORY[0x1E4F1BB60]);
  [v11 setPosition:2];
  [v11 setCropStyle:1];
  [v9 setBadgeStyleSettings:v11];
  v12 = [(CKCollaborationNoticeSuggestion *)self notice];
  v13 = [v12 metadata];
  objc_super v14 = [v13 bundleIdentifier];

  if (v14)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v14];
    v16 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F298]];
    v17 = [v15 prepareImageForDescriptor:v16];
    uint64_t v18 = [v17 CGImage];

    v19 = [MEMORY[0x1E4F42A80] imageWithCGImage:v18];
    [v9 setBadgeImage:v19];
  }
  v20 = [v9 view];
  objc_msgSend(v20, "setBounds:", 0.0, 0.0, 32.0, 32.0);

  return v20;
}

- (id)suggestionTitle
{
  v3 = [(CKCollaborationNoticeSuggestion *)self senderEntity];
  char v4 = [v3 abbreviatedDisplayName];

  unint64_t v5 = [(CKCollaborationNoticeSuggestion *)self notice];
  unint64_t v6 = [v5 metadata];
  id v7 = [v6 contentTitle];

  id v8 = [(CKCollaborationNoticeSuggestion *)self notice];
  id v9 = [v8 metadata];
  uint64_t v10 = [v9 type];

  id v11 = [(CKCollaborationNoticeSuggestion *)self suggestionCategoryTitleWithSenderName:v4 documentTitle:v7 noticeType:v10];

  return v11;
}

- (id)suggestionCategoryId
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)suggestionCategoryImage
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42A80]);

  return v2;
}

- (id)suggestionCategoryLocalizedCountOfItems:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  unint64_t v5 = CKFrameworkBundle();
  unint64_t v6 = [v5 localizedStringForKey:@"N_COLLABORATIONS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v7 = [v4 count];

  id v8 = objc_msgSend(v3, "localizedStringWithFormat:", v6, v7);

  id v9 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v10 = [v9 userInterfaceLayoutDirection];

  if (v10 == 1) {
    id v11 = @"\u200F";
  }
  else {
    id v11 = @"\u200E";
  }
  v12 = [(__CFString *)v11 stringByAppendingString:v8];

  return v12;
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  return 0;
}

- (id)suggestionCategoryTitle
{
  id v2 = CKFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"COLLABORATIONS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v4 = -[CKCollaborationNoticeSuggestion collaborationNoticeSuggestionsForItems:](self, "collaborationNoticeSuggestionsForItems:");
  unint64_t v5 = [(CKCollaborationNoticeSuggestion *)self suggestionHandlesForItems:v4];
  unint64_t v6 = [(CKCollaborationNoticeSuggestion *)self suggestionURLsForItems:v4];
  int64_t v7 = [(CKCollaborationNoticeSuggestion *)self aggregateCollaborationNoticeTypeForItems:v4];
  id v8 = [(CKCollaborationNoticeSuggestion *)self aggregateUTTypeForItems:v4 withAggregateNoticeType:v7];
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [NSNumber numberWithInteger:v7];
      *(_DWORD *)buf = 138412290;
      v28 = v10;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "aggregateNoticeType: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v8;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "aggregateContentType: %@", buf, 0xCu);
    }
  }
  uint64_t v12 = [v5 count];
  uint64_t v13 = [v6 count];
  uint64_t v14 = v13;
  if (v12 == 1)
  {
    if (v13 == 1)
    {
      v15 = [v4 firstObject];
      v16 = [v15 notice];

      v17 = [v16 metadata];
      uint64_t v18 = [v17 contentTitle];

      v19 = [(CKCollaborationNoticeSuggestion *)self senderEntity];
      v20 = [v19 abbreviatedDisplayName];
      v21 = [(CKCollaborationNoticeSuggestion *)self suggestionCategoryTitleWithSenderName:v20 documentTitle:v18 noticeType:v7];

      goto LABEL_15;
    }
    v16 = [(CKCollaborationNoticeSuggestion *)self senderEntity];
    uint64_t v18 = [v16 abbreviatedDisplayName];
    uint64_t v24 = -[CKCollaborationNoticeSuggestion suggestionCategoryTitleWithSenderName:numberOfFiles:numberOfItems:aggregateContentType:aggregateNoticeType:](self, "suggestionCategoryTitleWithSenderName:numberOfFiles:numberOfItems:aggregateContentType:aggregateNoticeType:", v18, v14, [v4 count], v8, v7);
  }
  else
  {
    v22 = [v4 firstObject];
    v16 = [v22 notice];

    v23 = [v16 metadata];
    uint64_t v18 = [v23 contentTitle];

    uint64_t v24 = objc_msgSend(NSString, "ck_suggestionCategoryTitleWithNumberOfSenders:documentTitle:numberOfFiles:numberOfItems:aggregateContentType:aggregateNoticeType:", v12, v18, v14, objc_msgSend(v4, "count"), v8, v7);
  }
  v21 = (void *)v24;
LABEL_15:

  return v21;
}

- (id)collaborationNoticeSuggestionsForItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v4, "addObject:", v10, (void)v12);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)suggestionHandlesForItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
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
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "notice", (void)v13);
        id v11 = [v10 senderHandle];
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)suggestionURLsForItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "notice", (void)v14);
        id v11 = [v10 metadata];
        long long v12 = [v11 contentURL];
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)aggregateUTTypeForItems:(id)a3 withAggregateNoticeType:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v18;
    id v10 = (id)*MEMORY[0x1E4F44370];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "notice", (void)v17);
        long long v13 = [v12 metadata];
        id v14 = [v13 contentType];

        if (v8)
        {
          if (v14 != v8)
          {
            id v15 = v10;

            id v8 = v15;
          }
        }
        else
        {
          id v8 = v14;
        }

        if (!a4 && v8 == v10)
        {
          id v8 = v10;
          goto LABEL_17;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v8 = 0;
  }
LABEL_17:

  return v8;
}

- (int64_t)aggregateCollaborationNoticeTypeForItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    int64_t v7 = -1;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "notice", (void)v13);
        id v10 = [v9 metadata];
        uint64_t v11 = [v10 type];

        if (v7 == -1)
        {
          int64_t v7 = v11;
          if (!v11) {
            goto LABEL_16;
          }
        }
        else
        {
          if (v11 != v7)
          {
            int64_t v7 = 0;
            goto LABEL_16;
          }
          if (!v7) {
            goto LABEL_16;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v7 = -1;
  }
LABEL_16:

  return v7;
}

- (id)suggestionCategoryTitleWithSenderName:(id)a3 documentTitle:(id)a4 noticeType:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  switch(a5)
  {
    case 1:
      uint64_t v10 = [v8 length];
      uint64_t v11 = NSString;
      long long v12 = CKFrameworkBundle();
      if (v10)
      {
        long long v13 = @"%@_MADE_EDITS_TO_%@";
        goto LABEL_17;
      }
      long long v16 = @"%@_MADE_EDITS_TO_FILE";
      goto LABEL_27;
    case 2:
      uint64_t v11 = NSString;
      long long v15 = CKFrameworkBundle();
      long long v12 = v15;
      long long v16 = @"%@_LEFT_COMMENTS";
      goto LABEL_28;
    case 3:
      uint64_t v11 = NSString;
      long long v15 = CKFrameworkBundle();
      long long v12 = v15;
      long long v16 = @"%@_MENTIONED_YOU";
      goto LABEL_28;
    case 4:
      uint64_t v17 = [v8 length];
      uint64_t v11 = NSString;
      long long v12 = CKFrameworkBundle();
      if (v17)
      {
        long long v13 = @"%@_CREATED_%@";
        goto LABEL_17;
      }
      long long v16 = @"%@_CREATED_A_FILE";
      goto LABEL_27;
    case 5:
      uint64_t v18 = [v8 length];
      uint64_t v11 = NSString;
      long long v12 = CKFrameworkBundle();
      if (v18)
      {
        long long v13 = @"%@_DELETED_%@";
        goto LABEL_17;
      }
      long long v16 = @"%@_DELETED_A_FILE";
      goto LABEL_27;
    case 6:
      uint64_t v19 = [v8 length];
      uint64_t v11 = NSString;
      long long v12 = CKFrameworkBundle();
      if (v19)
      {
        long long v13 = @"%@_RENAMED_%@";
        goto LABEL_17;
      }
      long long v16 = @"%@_RENAMED_A_FILE";
      goto LABEL_27;
    case 7:
      uint64_t v20 = [v8 length];
      uint64_t v11 = NSString;
      long long v12 = CKFrameworkBundle();
      if (v20)
      {
        long long v13 = @"%@_MOVED_%@";
        goto LABEL_17;
      }
      long long v16 = @"%@_MOVED_A_FILE";
      goto LABEL_27;
    case 8:
      uint64_t v11 = NSString;
      v21 = CKFrameworkBundle();
      long long v12 = v21;
      long long v13 = @"ADD_USER_TO_DOCUMENT_BANNER_TITLE";
      goto LABEL_20;
    case 9:
      uint64_t v11 = NSString;
      v21 = CKFrameworkBundle();
      long long v12 = v21;
      long long v13 = @"REMOVE_USER_FROM_DOCUMENT_BANNER_TITLE";
      goto LABEL_20;
    default:
      uint64_t v14 = [v8 length];
      uint64_t v11 = NSString;
      long long v12 = CKFrameworkBundle();
      if (v14)
      {
        long long v13 = @"%@_COLLABORATION_UPDATES_TO_%@";
LABEL_17:
        v21 = v12;
LABEL_20:
        uint64_t v22 = [v21 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:@"ChatKit"];
        objc_msgSend(v11, "stringWithFormat:", v22, v7, v9);
      }
      else
      {
        long long v16 = @"%@_COLLABORATION_UPDATES_TO_FILE";
LABEL_27:
        long long v15 = v12;
LABEL_28:
        uint64_t v22 = [v15 localizedStringForKey:v16 value:&stru_1EDE4CA38 table:@"ChatKit"];
        objc_msgSend(v11, "stringWithFormat:", v22, v7, v29);
      v23 = };

      uint64_t v24 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v25 = [v24 userInterfaceLayoutDirection];

      if (v25 == 1) {
        id v26 = @"\u200F";
      }
      else {
        id v26 = @"\u200E";
      }
      v27 = [(__CFString *)v26 stringByAppendingString:v23];

      return v27;
  }
}

- (id)suggestionCategoryTitleWithSenderName:(id)a3 numberOfFiles:(int64_t)a4 numberOfItems:(int64_t)a5 aggregateContentType:(id)a6 aggregateNoticeType:(int64_t)a7
{
  id v12 = a3;
  long long v13 = [(CKCollaborationNoticeSuggestion *)self collaborationTitleForUTType:a6 numberOfFiles:a4];
  switch(a7)
  {
    case 1:
      uint64_t v14 = NSString;
      long long v15 = CKFrameworkBundle();
      long long v16 = v15;
      uint64_t v17 = @"MADE_EDITS_TO_N_COLLABORATION";
      goto LABEL_13;
    case 2:
      uint64_t v14 = NSString;
      uint64_t v22 = CKFrameworkBundle();
      long long v16 = v22;
      v23 = @"%@_LEFT_COMMENTS";
      goto LABEL_6;
    case 3:
      uint64_t v14 = NSString;
      uint64_t v22 = CKFrameworkBundle();
      long long v16 = v22;
      v23 = @"%@_MENTIONED_YOU";
LABEL_6:
      uint64_t v24 = [v22 localizedStringForKey:v23 value:&stru_1EDE4CA38 table:@"ChatKit"];
      goto LABEL_14;
    case 4:
      uint64_t v14 = NSString;
      long long v15 = CKFrameworkBundle();
      long long v16 = v15;
      uint64_t v17 = @"CREATED_N_COLLABORATION";
      goto LABEL_13;
    case 5:
      uint64_t v14 = NSString;
      long long v15 = CKFrameworkBundle();
      long long v16 = v15;
      uint64_t v17 = @"DELETED_N_COLLABORATION";
      goto LABEL_13;
    case 6:
      uint64_t v14 = NSString;
      long long v15 = CKFrameworkBundle();
      long long v16 = v15;
      uint64_t v17 = @"RENAMED_N_COLLABORATION";
      goto LABEL_13;
    case 7:
      uint64_t v14 = NSString;
      long long v15 = CKFrameworkBundle();
      long long v16 = v15;
      uint64_t v17 = @"MOVED_N_COLLABORATION";
      goto LABEL_13;
    case 8:
      uint64_t v14 = NSString;
      long long v15 = CKFrameworkBundle();
      long long v16 = v15;
      uint64_t v17 = @"ADD_USER_TO_N_DOCUMENT_BANNER_TITLE";
      goto LABEL_13;
    case 9:
      uint64_t v14 = NSString;
      long long v15 = CKFrameworkBundle();
      long long v16 = v15;
      uint64_t v17 = @"REMOVE_USER_FROM_N_DOCUMENT_BANNER_TITLE";
LABEL_13:
      uint64_t v24 = [v15 localizedStringForKey:v17 value:&stru_1EDE4CA38 table:@"ChatKit"];
      v30 = v13;
LABEL_14:
      v21 = objc_msgSend(v14, "stringWithFormat:", v24, v12, v30);

      break;
    default:
      uint64_t v18 = NSString;
      uint64_t v19 = CKFrameworkBundle();
      uint64_t v20 = [v19 localizedStringForKey:@"N_COLLABORATION_UPDATES" value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
      v21 = objc_msgSend(v18, "localizedStringWithFormat:", v20, a5);

      break;
  }
  uint64_t v25 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v26 = [v25 userInterfaceLayoutDirection];

  if (v26 == 1) {
    v27 = @"\u200F";
  }
  else {
    v27 = @"\u200E";
  }
  v28 = [(__CFString *)v27 stringByAppendingString:v21];

  return v28;
}

- (id)collaborationTitleForUTType:(id)a3 numberOfFiles:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if ((id)*MEMORY[0x1E4F444D0] == v5)
  {
    id v12 = NSString;
    long long v13 = CKFrameworkBundle();
    uint64_t v14 = v13;
    long long v15 = @"SPREADSHEETS";
LABEL_11:
    long long v16 = [v13 localizedStringForKey:v15 value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v17 = objc_msgSend(v12, "localizedStringWithFormat:", v16, a4);

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E4F44480] == v5)
  {
    id v12 = NSString;
    long long v13 = CKFrameworkBundle();
    uint64_t v14 = v13;
    long long v15 = @"PRESENTATIONS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F0] == v5)
  {
    id v12 = NSString;
    long long v13 = CKFrameworkBundle();
    uint64_t v14 = v13;
    long long v15 = @"DOCUMENTS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F8] == v5)
  {
    id v12 = NSString;
    long long v13 = CKFrameworkBundle();
    uint64_t v14 = v13;
    long long v15 = @"COLLABORATIONS";
    goto LABEL_11;
  }
  id v7 = (void *)*MEMORY[0x1E4F443C8];
  id v8 = NSString;
  uint64_t v9 = CKFrameworkBundle();
  uint64_t v10 = v9;
  if (v7 == v6) {
    uint64_t v11 = @"FOLDERS";
  }
  else {
    uint64_t v11 = @"COLLABORATIONS";
  }
  v23 = [v9 localizedStringForKey:v11 value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v17 = objc_msgSend(v8, "localizedStringWithFormat:", v23, a4);

LABEL_12:
  uint64_t v18 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v19 = [v18 userInterfaceLayoutDirection];

  if (v19 == 1) {
    uint64_t v20 = @"\u200F";
  }
  else {
    uint64_t v20 = @"\u200E";
  }
  v21 = [(__CFString *)v20 stringByAppendingString:v17];

  return v21;
}

- (int64_t)suggestionActionButtonType
{
  return 0;
}

- (int64_t)suggestionCategoryActionButtonType
{
  return 0;
}

- (SGSuggestionDelegate)suggestionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->suggestionDelegate);

  return (SGSuggestionDelegate *)WeakRetained;
}

- (void)setSuggestionDelegate:(id)a3
{
}

- (IMCollaborationNotice)notice
{
  return self->_notice;
}

- (CKEntity)senderEntity
{
  return self->_senderEntity;
}

- (CKCollaborationNoticeSuggestionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKCollaborationNoticeSuggestionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)wantsInlineReplyStyle
{
  return self->_wantsInlineReplyStyle;
}

- (void)setWantsInlineReplyStyle:(BOOL)a3
{
  self->_wantsInlineReplyStyle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_senderEntity, 0);
  objc_storeStrong((id *)&self->_notice, 0);

  objc_destroyWeak((id *)&self->suggestionDelegate);
}

- (void)suggestionImageSGView
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 notice];
  uint64_t v4 = [v3 senderHandle];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch CNContact for senderHandle: %@", (uint8_t *)&v5, 0xCu);
}

@end