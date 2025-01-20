@interface CKScheduledSectionDateCell
+ (id)createStampLabelView;
+ (id)createStampTextView;
- (BOOL)shouldShowEditButton;
- (CGSize)layoutSizeForWidth:(double)a3 applyLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKScheduledSectionDateCell)initWithFrame:(CGRect)a3;
- (CKScheduledSectionDateCellDelegate)delegate;
- (CKScheduledSectionDateChatItem)chatItem;
- (UIButton)editScheduleButton;
- (id)attributedText;
- (id)conversationFetcher;
- (id)deferredMenuForEditScheduleButton;
- (id)scheduledSectionDateStringWithShowsEdit:(BOOL)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)addFilter:(id)a3;
- (void)clearFilters;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)handleDeleteAllAction:(id)a3;
- (void)handleEditDateAction:(id)a3;
- (void)handleSendNowAction:(id)a3;
- (void)layoutSubviewsForAlignmentContents;
- (void)setChatItem:(id)a3;
- (void)setConversationFetcher:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditScheduleButton:(id)a3;
@end

@implementation CKScheduledSectionDateCell

- (CKScheduledSectionDateCell)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CKScheduledSectionDateCell;
  v3 = -[CKTranscriptStampCell initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    v5 = +[CKUIBehavior sharedBehaviors];
    v6 = [v5 transcriptLabelAccessoryButtonConfiguration];
    [(UIButton *)v4 setConfiguration:v6];

    v7 = +[CKUIBehavior sharedBehaviors];
    v8 = [v7 transcriptEmphasizedFontAttributes];
    v9 = (void *)[v8 mutableCopy];

    [v9 removeObjectForKey:*MEMORY[0x1E4FB0700]];
    id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
    v11 = CKFrameworkBundle();
    v12 = [v11 localizedStringForKey:@"EDIT" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v13 = (void *)[v10 initWithString:v12 attributes:v9];
    [(UIButton *)v4 setAttributedTitle:v13 forState:0];

    v14 = [(CKEditableCollectionViewCell *)v3 contentView];
    [v14 addSubview:v4];

    editScheduleButton = v3->_editScheduleButton;
    v3->_editScheduleButton = v4;
    v16 = v4;

    v17 = [(CKScheduledSectionDateCell *)v3 deferredMenuForEditScheduleButton];
    [(UIButton *)v3->_editScheduleButton setMenu:v17];

    [(UIButton *)v3->_editScheduleButton setShowsMenuAsPrimaryAction:1];
  }
  return v3;
}

- (id)deferredMenuForEditScheduleButton
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4F42930];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke;
  v11 = &unk_1E5628838;
  objc_copyWeak(&v12, &location);
  v3 = [v2 elementWithUncachedProvider:&v8];
  v4 = (void *)MEMORY[0x1E4F42B80];
  v14[0] = v3;
  v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 1, v8, v9, v10, v11);
  v6 = [v4 menuWithChildren:v5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    v7 = [WeakRetained conversationFetcher];
    uint64_t v8 = ((void (**)(void, id))v7)[2](v7, WeakRetained);
    uint64_t v9 = [v8 chat];

    if (v9)
    {
      v51 = v3;
      id v10 = [WeakRetained chatItem];
      v11 = [v10 IMChatItem];
      v49 = v9;
      id v12 = [v9 messagesForScheduledMessageSectionWithTranscriptItem:v11];

      v13 = NSString;
      v14 = CKFrameworkBundle();
      v15 = [v14 localizedStringForKey:@"SEND_LATER_SEND_MESSAGE_NOW" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v16 = objc_msgSend(v13, "localizedStringWithFormat:", v15, objc_msgSend(v12, "count"));

      v17 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v18 = [v17 userInterfaceLayoutDirection];

      if (v18 == 1) {
        objc_super v19 = @"\u200F";
      }
      else {
        objc_super v19 = @"\u200E";
      }
      uint64_t v20 = [(__CFString *)v19 stringByAppendingString:v16];

      v21 = NSString;
      v22 = CKFrameworkBundle();
      v23 = [v22 localizedStringForKey:@"SEND_LATER_DELETE_ALL_MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v48 = v12;
      v24 = objc_msgSend(v21, "localizedStringWithFormat:", v23, objc_msgSend(v12, "count"));

      v25 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v26 = [v25 userInterfaceLayoutDirection];

      if (v26 == 1) {
        v27 = @"\u200F";
      }
      else {
        v27 = @"\u200E";
      }
      uint64_t v28 = [(__CFString *)v27 stringByAppendingString:v24];

      v29 = +[CKUIBehavior sharedBehaviors];
      v30 = [v29 theme];
      uint64_t v31 = [v30 sendButtonColorForColorType:1];

      v32 = [MEMORY[0x1E4F42A80] systemImageNamed:@"arrow.up.circle.fill"];
      v33 = [v32 imageWithTintColor:v31 renderingMode:1];

      v34 = (void *)MEMORY[0x1E4F426E8];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_106;
      v56[3] = &unk_1E5620ED8;
      objc_copyWeak(v57, v4);
      v47 = (void *)v20;
      v50 = [v34 actionWithTitle:v20 image:v33 identifier:0 handler:v56];
      v46 = (void *)v31;
      v35 = (void *)MEMORY[0x1E4F426E8];
      v36 = CKFrameworkBundle();
      v37 = [v36 localizedStringForKey:@"EDIT_TIME" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v38 = [MEMORY[0x1E4F42A80] systemImageNamed:@"clock"];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_114;
      v54[3] = &unk_1E5620ED8;
      objc_copyWeak(&v55, v4);
      v39 = [v35 actionWithTitle:v37 image:v38 identifier:0 handler:v54];

      v40 = (void *)MEMORY[0x1E4F426E8];
      v41 = [MEMORY[0x1E4F42A80] systemImageNamed:@"trash"];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_118;
      v52[3] = &unk_1E5620ED8;
      objc_copyWeak(&v53, v4);
      v42 = (void *)v28;
      v43 = [v40 actionWithTitle:v28 image:v41 identifier:0 handler:v52];

      v3 = v51;
      if (!CKIsRunningInMacCatalyst()) {
        [v43 setAttributes:2];
      }
      [v6 addObject:v50];
      [v6 addObject:v39];
      [v6 addObject:v43];
      v51[2](v51, v6);

      objc_destroyWeak(&v53);
      objc_destroyWeak(&v55);

      objc_destroyWeak(v57);
      uint64_t v9 = v49;
    }
    else
    {
      v45 = IMLogHandleForCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_cold_2(WeakRetained);
      }

      v3[2](v3, v6);
    }
  }
  else
  {
    v44 = IMLogHandleForCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_cold_1();
    }

    v3[2](v3, (void *)MEMORY[0x1E4F1CBF0]);
  }
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_106(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained handleSendNowAction:v3];
  }
  else
  {
    v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_106_cold_1();
    }
  }
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_114(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained handleEditDateAction:v3];
  }
  else
  {
    v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_114_cold_1();
    }
  }
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_118(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Delete all messages", v7, 2u);
      }
    }
    [WeakRetained handleDeleteAllAction:v3];
  }
  else
  {
    v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_118_cold_1();
    }
  }
}

- (void)handleSendNowAction:(id)a3
{
  v4 = [(CKScheduledSectionDateCell *)self conversationFetcher];
  v5 = ((void (**)(void, CKScheduledSectionDateCell *))v4)[2](v4, self);
  v6 = [v5 chat];

  if (v6)
  {
    v7 = [(CKScheduledSectionDateCell *)self chatItem];
    uint64_t v8 = [v7 IMChatItem];
    uint64_t v9 = [v6 messagesForScheduledMessageSectionWithTranscriptItem:v8];

    [v6 editScheduledMessageItems:v9 scheduleType:0 deliveryTime:0];
  }
  else
  {
    id v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CKScheduledSectionDateCell handleSendNowAction:](self);
    }
  }
}

- (void)handleDeleteAllAction:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = [(CKScheduledSectionDateCell *)self conversationFetcher];
  v5 = ((void (**)(void, CKScheduledSectionDateCell *))v4)[2](v4, self);
  v6 = [v5 chat];

  if (v6)
  {
    v7 = [(CKScheduledSectionDateCell *)self chatItem];
    uint64_t v8 = [v7 IMChatItem];
    uint64_t v9 = [v6 messagesForScheduledMessageSectionWithTranscriptItem:v8];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(v6, "cancelScheduledMessageItem:cancelType:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), 1, (void)v15);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CKScheduledSectionDateCell handleSendNowAction:](self);
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[CKScheduledSectionDateCell layoutSizeForWidth:applyLayout:](self, "layoutSizeForWidth:applyLayout:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviewsForAlignmentContents
{
  v4.receiver = self;
  v4.super_class = (Class)CKScheduledSectionDateCell;
  [(CKTranscriptStampCell *)&v4 layoutSubviewsForAlignmentContents];
  [(CKTranscriptStampCell *)self contentAlignmentRect];
  [(CKScheduledSectionDateCell *)self layoutSizeForWidth:1 applyLayout:v3];
}

+ (id)createStampLabelView
{
  id v2 = objc_alloc(MEMORY[0x1E4F42B38]);
  double v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v3;
}

+ (id)createStampTextView
{
  id v2 = objc_opt_class();

  return (id)[v2 createStampLabelView];
}

- (id)attributedText
{
  BOOL v3 = [(CKScheduledSectionDateCell *)self shouldShowEditButton];

  return [(CKScheduledSectionDateCell *)self scheduledSectionDateStringWithShowsEdit:v3];
}

- (CGSize)layoutSizeForWidth:(double)a3 applyLayout:(BOOL)a4
{
  BOOL v4 = a4;
  [(CKTranscriptStampCell *)self contentAlignmentRect];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(CKScheduledSectionDateCell *)self editScheduleButton];
  uint64_t v12 = [(CKScheduledSectionDateCell *)self attributedText];
  [v11 setAttributedTitle:v12 forState:0];

  objc_msgSend(v11, "setEnabled:", -[CKScheduledSectionDateCell shouldShowEditButton](self, "shouldShowEditButton"));
  objc_msgSend(v11, "sizeThatFits:", a3, 1.79769313e308);
  double v15 = v14;
  if (v4)
  {
    double v16 = fmin(a3, v13);
    objc_msgSend(v11, "setFrame:", v8 + floor((v10 - v16) * 0.5), 0.0, v16, v14);
    objc_msgSend(v11, "__ck_ensureMinimumTouchInsets");
  }

  double v17 = a3;
  double v18 = v15;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)addFilter:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKScheduledSectionDateCell;
  id v4 = a3;
  [(CKTranscriptStampCell *)&v8 addFilter:v4];
  v5 = [(CKScheduledSectionDateCell *)self editScheduleButton];
  [v4 contentAlpha];
  double v7 = v6;

  [v5 setAlpha:v7];
}

- (void)clearFilters
{
  v4.receiver = self;
  v4.super_class = (Class)CKScheduledSectionDateCell;
  [(CKTranscriptStampCell *)&v4 clearFilters];
  BOOL v3 = [(CKScheduledSectionDateCell *)self editScheduleButton];
  [v3 setAlpha:1.0];
}

- (CKScheduledSectionDateCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKScheduledSectionDateCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKScheduledSectionDateChatItem)chatItem
{
  return self->_chatItem;
}

- (void)setChatItem:(id)a3
{
}

- (id)conversationFetcher
{
  return self->_conversationFetcher;
}

- (void)setConversationFetcher:(id)a3
{
}

- (UIButton)editScheduleButton
{
  return self->_editScheduleButton;
}

- (void)setEditScheduleButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editScheduleButton, 0);
  objc_storeStrong(&self->_conversationFetcher, 0);
  objc_storeStrong((id *)&self->_chatItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CKScheduledSectionDateCell;
  id v12 = a3;
  [(CKTranscriptStampCell *)&v13 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  -[CKScheduledSectionDateCell setChatItem:](self, "setChatItem:", v12, v13.receiver, v13.super_class);
}

- (void)handleEditDateAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F6C330C();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (id)scheduledSectionDateStringWithShowsEdit:(BOOL)a3
{
  id v4 = self;
  v5.super.isa = CKScheduledSectionDateCell.scheduledSectionDateString(showsEdit:)(a3).super.isa;

  return v5.super.isa;
}

- (BOOL)shouldShowEditButton
{
  id v2 = self;
  unsigned __int8 v3 = CKScheduledSectionDateCell.shouldShowEditButton.getter();

  return v3 & 1;
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Lost reference to self when trying to populate menu!", v2, v3, v4, v5, v6);
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_cold_2(void *a1)
{
  uint64_t v1 = [a1 chatItem];
  OUTLINED_FUNCTION_0_0(&dword_18EF18000, v2, v3, "Failed to find chat for item: %@", v4, v5, v6, v7, 2u);
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_106_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Lost reference to self when acting on sendNow button!", v2, v3, v4, v5, v6);
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_114_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Lost reference to self when acting on edit button!", v2, v3, v4, v5, v6);
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_118_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Lost reference to self when acting on cancel all button!", v2, v3, v4, v5, v6);
}

- (void)handleSendNowAction:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 chatItem];
  OUTLINED_FUNCTION_0_0(&dword_18EF18000, v2, v3, "Failed to find chat for item: %@", v4, v5, v6, v7, 2u);
}

@end