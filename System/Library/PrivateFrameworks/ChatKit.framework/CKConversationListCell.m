@interface CKConversationListCell
+ (double)cellHeightForDisplayScale:(double)a3;
+ (id)identifierForConversation:(id)a3;
+ (int64_t)_titleIconImageTypeForConversation:(id)a3;
- (BOOL)_editingPins;
- (BOOL)_shouldShowSendLaterIcon;
- (BOOL)_shouldShowSlashSatelliteIcon;
- (BOOL)_shouldShowSummaryForSatelliteMessages;
- (BOOL)freezeSummaryText;
- (BOOL)hasUnreadMessagesForConversation:(id)a3;
- (BOOL)isGroupConversation;
- (BOOL)isMuted;
- (BOOL)isPlaceholder;
- (BOOL)isStewie;
- (BOOL)lastMessageIsTypingIndicator;
- (BOOL)shouldAlwaysHideAvatar;
- (BOOL)shouldAlwaysHideUnreadIndicatorForConversation:(id)a3;
- (BOOL)shouldAppearAsRecoverableConversation;
- (BOOL)shouldHideMuteIndicator;
- (BOOL)shouldHidePreviewSummary;
- (BOOL)shouldLabelsBeHighlighted;
- (BOOL)showingEditControl;
- (CAGradientLayer)gradient;
- (CGRect)containerBounds;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKAvatarView)avatarView;
- (CKConversation)conversation;
- (CKConversationListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CKConversationListCellDelegate)delegate;
- (CKConversationListCellLayout)cellLayout;
- (CKConversationListTypingIndicatorView)typingIndicatorView;
- (CKDateLabel)dateLabel;
- (CKDownloadingPendingMessagesView)downloadingPendingMessagesView;
- (CKLabel)fromLabel;
- (UIButton)closeButton;
- (UIImageView)chevronImageView;
- (UILabel)summaryBlockedLabel;
- (UILabel)summaryLabel;
- (id)_makeSummaryAttributedStringWithText:(id)a3 multiwayConversation:(id)a4;
- (id)makeTextAttachmentsForCurrentIndicatorState;
- (id)summaryAttributedTextForBlockedConversationWithIcon:(BOOL)a3;
- (id)summaryLabelTextBaseColor;
- (id)summaryLabelTextColor;
- (id)unreadIndicatorImageForVisibility:(BOOL)a3 withMuteState:(BOOL)a4;
- (unint64_t)unreadMessageCount;
- (void)_handleSatelliteStatusStateChanged;
- (void)_performBlock:(id)a3 animated:(BOOL)a4;
- (void)_prependSummaryLabelWithSIMForConversation:(id)a3;
- (void)_updateAccessoryIndicatorColor;
- (void)_updateSummaryLabelWithGeneratedSummary:(id)a3;
- (void)contentSizeCategoryDidChange;
- (void)dealloc;
- (void)deleteButtonTapped;
- (void)didHoverOverCell:(id)a3;
- (void)prepareForReuse;
- (void)setCellLayout:(id)a3;
- (void)setChevronImageView:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setContainerBounds:(CGRect)a3;
- (void)setConversation:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloadingPendingMessagesView:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditingPins:(BOOL)a3 animated:(BOOL)a4;
- (void)setFreezeSummaryText:(BOOL)a3;
- (void)setFromLabel:(id)a3;
- (void)setGroupConversation:(BOOL)a3;
- (void)setIsStewie:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setShouldHidePreviewSummary:(BOOL)a3;
- (void)setShouldLabelsBeHighlighted:(BOOL)a3;
- (void)setSummaryLabel:(id)a3;
- (void)setTypingIndicatorView:(id)a3;
- (void)set_editingPins:(BOOL)a3;
- (void)simLabelImageDidChange;
- (void)updateBlockedSummaryLabelIfNeeded;
- (void)updateContentsForConversation:(id)a3;
- (void)updateContentsForConversation:(id)a3 fastPreview:(BOOL)a4;
- (void)updateDateLabel:(id)a3 conversation:(id)a4;
- (void)updateForEditing:(BOOL)a3;
- (void)updateFromLabelWithText:(id)a3;
- (void)updateLabelTextColors;
- (void)updateSummaryLabel:(id)a3 conversation:(id)a4 fastPreview:(BOOL)a5;
- (void)updateUnreadIndicatorForCurrentConversation;
- (void)updateUnreadIndicatorWithImage:(id)a3;
- (void)updateVerifiedCheckmarkForBusiness;
- (void)updateWithForwardedConfigurationState:(id)a3;
@end

@implementation CKConversationListCell

- (void)setDelegate:(id)a3
{
}

- (void)updateWithForwardedConfigurationState:(id)a3
{
  id v4 = a3;
  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [(CKConversationListCell *)self traitCollection];
  int v7 = [v5 useSelectedAppearanceForConversationCellState:v4 traitCollection:v6];

  if (self->_shouldLabelsBeHighlighted == v7)
  {
    v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v9 = [v8 stewieEnabled];

    if (v9)
    {
      v10 = [(CKConversation *)self->_conversation chat];
      int v11 = [v10 isStewieChat];

      if (self->_isStewie != v11)
      {
        self->_isStewie = v11;
        [(CKConversationListCell *)self updateLabelTextColors];
      }
    }
  }
  else
  {
    self->_shouldLabelsBeHighlighted = v7;
    [(CKConversationListCell *)self updateLabelTextColors];
    [(CKConversationListCell *)self updateUnreadIndicatorForCurrentConversation];
    [(CKConversationListCell *)self _updateAccessoryIndicatorColor];
  }
}

- (CKConversationListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v64.receiver = self;
  v64.super_class = (Class)CKConversationListCell;
  id v4 = [(CKConversationListCell *)&v64 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CKConversationListCell *)v4 setAutoresizingMask:2];
    [(CKConversationListCell *)v5 setSeparatorStyle:0];
    v5->__editingPins = 0;
    v6 = +[CKUIBehavior sharedBehaviors];
    int v7 = [v6 theme];

    v8 = objc_alloc_init(CKDateLabel);
    dateLabel = v5->_dateLabel;
    v5->_dateLabel = v8;

    [(CKDateLabel *)v5->_dateLabel setOpaque:0];
    [(CKDateLabel *)v5->_dateLabel setBackgroundColor:0];
    v10 = v5->_dateLabel;
    int v11 = +[CKUIBehavior sharedBehaviors];
    v12 = [v11 conversationListDateFont];
    [(CKDateLabel *)v10 setFont:v12];

    v13 = v5->_dateLabel;
    v14 = [v7 conversationListDateColor];
    [(CKDateLabel *)v13 setTextColor:v14];

    v15 = objc_alloc_init(CKLabel);
    fromLabel = v5->_fromLabel;
    v5->_fromLabel = v15;

    [(CKLabel *)v5->_fromLabel setOpaque:0];
    [(CKLabel *)v5->_fromLabel setBackgroundColor:0];
    v17 = v5->_fromLabel;
    v63 = v7;
    v18 = [v7 conversationListSenderColor];
    [(CKLabel *)v17 setTextColor:v18];

    v19 = v5->_fromLabel;
    v20 = +[CKUIBehavior sharedBehaviors];
    v21 = [v20 conversationListSenderFont];
    [(CKLabel *)v19 setFont:v21];

    [(CKLabel *)v5->_fromLabel setTextAlignment:4];
    [(CKLabel *)v5->_fromLabel setLineBreakMode:4];
    v22 = [(CKConversationListCell *)v5 contentView];
    [v22 addSubview:v5->_fromLabel];

    v23 = +[CKUIBehavior sharedBehaviors];
    LODWORD(v20) = [v23 showsHoverToDeleteButton];

    if (v20)
    {
      uint64_t v24 = [MEMORY[0x1E4F39BD0] layer];
      gradient = v5->_gradient;
      v5->_gradient = (CAGradientLayer *)v24;

      v62 = [MEMORY[0x1E4F42A80] imageNamed:@"SidebarCloseImage"];
      v26 = [MEMORY[0x1E4F42A80] imageNamed:@"SidebarCloseAlternate"];
      uint64_t v27 = [MEMORY[0x1E4F427E0] buttonWithType:0];
      closeButton = v5->_closeButton;
      v5->_closeButton = (UIButton *)v27;

      [(UIButton *)v5->_closeButton setImage:v62 forState:0];
      [(UIButton *)v5->_closeButton setImage:v26 forState:1];
      [(UIButton *)v5->_closeButton addTarget:v5 action:sel_deleteButtonTapped forEvents:64];
      v29 = [(UIButton *)v5->_closeButton imageView];
      v30 = +[CKUIBehavior sharedBehaviors];
      v31 = [v30 theme];
      v32 = [v31 conversationListSummaryColor];
      [v29 setTintColor:v32];

      v33 = [(CKConversationListCell *)v5 contentView];
      [v33 addSubview:v5->_closeButton];

      [(UIButton *)v5->_closeButton setHidden:1];
    }
    v34 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    summaryLabel = v5->_summaryLabel;
    v5->_summaryLabel = v34;

    [(UILabel *)v5->_summaryLabel setOpaque:0];
    [(UILabel *)v5->_summaryLabel setBackgroundColor:0];
    v36 = v5->_summaryLabel;
    v37 = [(CKConversationListCell *)v5 summaryLabelTextColor];
    [(UILabel *)v36 setTextColor:v37];

    v38 = v5->_summaryLabel;
    v39 = +[CKUIBehavior sharedBehaviors];
    -[UILabel setNumberOfLines:](v38, "setNumberOfLines:", [v39 conversationListCellSummaryNumberOfLines]);

    v40 = v5->_summaryLabel;
    v41 = +[CKUIBehavior sharedBehaviors];
    v42 = [v41 conversationListSummaryFont];
    [(UILabel *)v40 setFont:v42];

    [(UILabel *)v5->_summaryLabel _setTextAlignmentFollowsWritingDirection:1];
    v43 = +[CKUIBehavior sharedBehaviors];
    LODWORD(v41) = [v43 showsConversationListCellChevronImage];

    if (v41)
    {
      v44 = +[CKUIBehavior sharedBehaviors];
      v45 = [v44 chevronImage];

      [v45 size];
      uint64_t v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", 0.0, 0.0, v46, v47);
      chevronImageView = v5->_chevronImageView;
      v5->_chevronImageView = (UIImageView *)v48;

      [(UIImageView *)v5->_chevronImageView setContentMode:4];
      v50 = v5->_chevronImageView;
      v51 = +[CKUIBehavior sharedBehaviors];
      v52 = [v51 theme];
      v53 = [v52 conversationListChevronColor];
      [(UIImageView *)v50 setTintColor:v53];

      [(UIImageView *)v5->_chevronImageView setImage:v45];
      v54 = [(CKConversationListCell *)v5 contentView];
      [v54 addSubview:v5->_chevronImageView];
    }
    [(CKDateLabel *)v5->_dateLabel setHighlightedTextColor:0];
    [(CKLabel *)v5->_fromLabel setHighlightedTextColor:0];
    [(UILabel *)v5->_summaryLabel setHighlightedTextColor:0];
  }
  v55 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v55 addObserver:v5 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4F43788] object:0];

  v56 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v56 addObserver:v5 selector:sel__increaseContrastDidChange_ name:*MEMORY[0x1E4F43418] object:0];

  v57 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v57 addObserver:v5 selector:sel__simLabelImageDidChange_ name:@"__kCKSIMLabelImagesChanged" object:0];

  v58 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v59 = [v58 isCarrierPigeonEnabled];

  if (v59)
  {
    v60 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v60 addObserver:v5 selector:sel__handleSatelliteStatusStateChanged name:*MEMORY[0x1E4F6BAA8] object:0];
  }
  return v5;
}

- (void)updateSummaryLabel:(id)a3 conversation:(id)a4 fastPreview:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v8 = a4;
  int v9 = [(CKConversationListCell *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    int v11 = [(CKConversationListCell *)self delegate];
    [v11 updateSummaryLabel:v59 conversation:v8 fastPreview:v5];

    goto LABEL_43;
  }
  if (![(CKConversationListCell *)self freezeSummaryText]
    || ([(UILabel *)self->_summaryLabel attributedText],
        (v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (v5) {
      [v8 fastPreviewTextIgnoringPluginContent];
    }
    else {
    v12 = [v8 previewText];
    }
  }
  v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v14 = [v13 isCarrierPigeonEnabled];

  if (v14
    && [(CKConversationListCell *)self _shouldShowSummaryForSatelliteMessages])
  {
    v15 = NSString;
    v16 = CKFrameworkBundle();
    v17 = [v16 localizedStringForKey:@"NEW_SATELLITE_MESSAGE_COUNT" value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];
    v18 = [(CKConversationListCell *)self conversation];
    v19 = [v18 chat];
    v20 = objc_msgSend(v15, "localizedStringWithFormat:", v17, objc_msgSend(v19, "pendingIncomingSatelliteMessageCount"));

    v21 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v22 = [v21 userInterfaceLayoutDirection];

    if (v22 == 1) {
      v23 = @"\u200F";
    }
    else {
      v23 = @"\u200E";
    }
    uint64_t v24 = [(__CFString *)v23 stringByAppendingString:v20];

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v24];
    [(CKConversationListCell *)self updateUnreadIndicatorForCurrentConversation];

    v12 = (void *)v25;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v61 = [v12 length];
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_DEBUG, "  Summary Length: %ld", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    uint64_t v58 = [v12 length];
    _CKLog();
  }
  unint64_t v27 = objc_msgSend(v12, "length", v58);
  v28 = +[CKUIBehavior sharedBehaviors];
  BOOL v29 = v27 > [v28 conversationListCellMaxSummaryLength];

  if (v29)
  {
    v30 = +[CKUIBehavior sharedBehaviors];
    uint64_t v31 = objc_msgSend(v12, "attributedSubstringFromRange:", 0, objc_msgSend(v30, "conversationListCellMaxSummaryLength"));

    v12 = (void *)v31;
  }
  if ([MEMORY[0x1E4F6E790] messageSummarizationEnabled])
  {
    v32 = [v8 chat];
    v33 = [v32 chatSummary];

    if (IMOSLoggingEnabled())
    {
      v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = [(CKConversationListCell *)self conversation];
        v36 = [v35 chat];
        v37 = [v36 guid];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v61 = v33 != 0;
        *(_WORD *)&v61[4] = 2112;
        *(void *)&v61[6] = v37;
        __int16 v62 = 1024;
        BOOL v63 = v33 == 0;
        _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "Showing chat summary: (%d) for conversation with GUID %@, isNilChatSummary=%{BOOL}d", buf, 0x18u);
      }
      if (!v33) {
        goto LABEL_29;
      }
    }
    else if (!v33)
    {
      goto LABEL_29;
    }
    [(CKConversationListCell *)self _updateSummaryLabelWithGeneratedSummary:v33];
    [(UILabel *)self->_summaryLabel setAccessibilityIdentifier:@"previewWithSummary"];
    goto LABEL_40;
  }
LABEL_29:
  [(UILabel *)self->_summaryLabel setAccessibilityIdentifier:0];
  v38 = [v8 chat];
  if ([v38 chatStyle] != 43)
  {

    goto LABEL_33;
  }
  v39 = [v8 chat];
  v40 = [v39 conversation];
  BOOL v41 = v40 == 0;

  if (v41)
  {
LABEL_33:
    double v46 = +[CKUIBehavior sharedBehaviors];
    double v47 = [v46 conversationListSummaryFont];

    uint64_t v48 = [(CKConversationListCell *)self summaryLabelTextColor];
    v49 = objc_alloc_init(CKPreviewTextDisplayContext);
    [(CKPreviewTextDisplayContext *)v49 setBaseTextFont:v47];
    [(CKPreviewTextDisplayContext *)v49 setBaseTextColor:v48];
    v50 = (void *)MEMORY[0x1E4FB08E0];
    v51 = [v47 fontDescriptor];
    v52 = [v51 fontDescriptorWithSymbolicTraits:2];
    v53 = [v50 fontWithDescriptor:v52 size:0.0];
    [(CKPreviewTextDisplayContext *)v49 setMentionsFont:v53];

    if ([(CKConversationListCell *)self shouldLabelsBeHighlighted])
    {
      [(CKPreviewTextDisplayContext *)v49 setMentionsColor:v48];
    }
    else
    {
      v54 = +[CKUIBehavior sharedBehaviors];
      v55 = [v54 theme];
      v56 = [v55 meMentionTextColor];
      [(CKPreviewTextDisplayContext *)v49 setMentionsColor:v56];
    }
    v57 = CKPreviewTextForDisplay(v12, v49);
    [(UILabel *)self->_summaryLabel setAttributedText:v57];

    goto LABEL_37;
  }
  v42 = [v12 string];
  v43 = [v8 chat];
  v44 = [v43 conversation];
  v45 = [(CKConversationListCell *)self _makeSummaryAttributedStringWithText:v42 multiwayConversation:v44];

  [(UILabel *)self->_summaryLabel setAttributedText:v45];
LABEL_37:
  v33 = 0;
LABEL_40:
  [(CKConversationListCell *)self _prependSummaryLabelWithSIMForConversation:v8];
  if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled])
  {
    [(UILabel *)self->_summaryLabel setHidden:[(CKConversationListCell *)self shouldHidePreviewSummary]];
    [(CKConversationListCell *)self updateBlockedSummaryLabelIfNeeded];
  }

LABEL_43:
}

- (BOOL)shouldHidePreviewSummary
{
  return self->_shouldHidePreviewSummary;
}

- (CKLabel)fromLabel
{
  return self->_fromLabel;
}

- (CKDateLabel)dateLabel
{
  return self->_dateLabel;
}

- (UILabel)summaryLabel
{
  return self->_summaryLabel;
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (CKConversationListCellLayout)cellLayout
{
  return self->_cellLayout;
}

- (BOOL)showingEditControl
{
  return [(CKConversationListCell *)self currentStateMask] & 1;
}

- (BOOL)shouldAlwaysHideUnreadIndicatorForConversation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CKConversationListCell *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int v7 = [(CKConversationListCell *)self delegate];
    char v8 = [v7 shouldAlwaysHideUnreadIndicatorForConversation:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (CKConversationListCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKConversationListCellDelegate *)WeakRetained;
}

- (void)setCellLayout:(id)a3
{
}

- (id)summaryLabelTextBaseColor
{
  v2 = +[CKUIBehavior sharedBehaviors];
  v3 = [v2 theme];
  id v4 = [v3 conversationListSummaryColor];

  return v4;
}

- (UILabel)summaryBlockedLabel
{
  return self->_summaryBlockedLabel;
}

- (BOOL)_editingPins
{
  return self->__editingPins;
}

- (id)summaryLabelTextColor
{
  v3 = [(CKConversationListCell *)self summaryLabelTextBaseColor];
  if ([(CKConversationListCell *)self shouldLabelsBeHighlighted])
  {
    id v4 = +[CKUIBehavior sharedBehaviors];
    BOOL v5 = [v4 theme];
    char v6 = [v5 conversationListCellSelectedSummaryColor];

    if (v6)
    {
      int v7 = +[CKUIBehavior sharedBehaviors];
      char v8 = [v7 theme];
      uint64_t v9 = [v8 conversationListCellSelectedSummaryColor];

      v3 = (void *)v9;
    }
  }

  return v3;
}

- (BOOL)shouldLabelsBeHighlighted
{
  return self->_shouldLabelsBeHighlighted;
}

- (void)updateBlockedSummaryLabelIfNeeded
{
  if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled])
  {
    if ([(CKConversationListCell *)self shouldHidePreviewSummary]
      && !self->_summaryBlockedLabel)
    {
      v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
      summaryBlockedLabel = self->_summaryBlockedLabel;
      self->_summaryBlockedLabel = v3;

      [(UILabel *)self->_summaryBlockedLabel setOpaque:0];
      [(UILabel *)self->_summaryBlockedLabel setBackgroundColor:0];
      [(UILabel *)self->_summaryBlockedLabel setHighlightedTextColor:0];
      [(UILabel *)self->_summaryBlockedLabel _setTextAlignmentFollowsWritingDirection:1];
      BOOL v5 = [(CKConversationListCell *)self contentView];
      [v5 addSubview:self->_summaryBlockedLabel];
    }
    if (self->_summaryBlockedLabel)
    {
      [(CKConversationListCell *)self setNeedsLayout];
      [(CKConversationListCell *)self layoutIfNeeded];
    }
  }
}

- (void)setEditingPins:(BOOL)a3 animated:(BOOL)a4
{
  BOOL editingPins = self->__editingPins;
  self->__BOOL editingPins = a3;
  if (editingPins != a3)
  {
    BOOL v5 = a4;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__CKConversationListCell_setEditingPins_animated___block_invoke;
    aBlock[3] = &unk_1E5622A18;
    aBlock[4] = self;
    BOOL v12 = a3;
    int v7 = _Block_copy(aBlock);
    [(CKConversationListCell *)self _performBlock:v7 animated:v5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__CKConversationListCell_setEditingPins_animated___block_invoke_2;
    v10[3] = &unk_1E5620C40;
    v10[4] = self;
    char v8 = _Block_copy(v10);
    uint64_t v9 = v8;
    if (v5) {
      [MEMORY[0x1E4F42FF0] transitionWithView:self->_summaryLabel duration:5242880 options:v8 animations:0 completion:0.300000012];
    }
    else {
      (*((void (**)(void *))v8 + 2))(v8);
    }
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(CKConversationListCell *)self setNeedsLayout];
  v10.receiver = self;
  v10.super_class = (Class)CKConversationListCell;
  [(CKConversationListCell *)&v10 setEditing:v5 animated:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__CKConversationListCell_setEditing_animated___block_invoke;
  v8[3] = &unk_1E5622A18;
  v8[4] = self;
  BOOL v9 = v5;
  int v7 = _Block_copy(v8);
  [(CKConversationListCell *)self _performBlock:v7 animated:v4];
}

uint64_t __46__CKConversationListCell_setEditing_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateForEditing:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)freezeSummaryText
{
  return self->_freezeSummaryText;
}

- (void)_prependSummaryLabelWithSIMForConversation:(id)a3
{
  id v6 = a3;
  if ([v6 wantsLabelForDSDS])
  {
    BOOL v4 = [(UILabel *)self->_summaryLabel attributedText];
    BOOL v5 = +[CKDualSIMUtilities makeSummaryAttributedStringWithSIMImageUsingAttributedString:v4 forConversation:v6];

    [(UILabel *)self->_summaryLabel setAttributedText:v5];
  }
}

- (void)_performBlock:(id)a3 animated:(BOOL)a4
{
  if (a4) {
    [MEMORY[0x1E4F42FF0] animateWithDuration:a3 animations:0.300000012];
  }
  else {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

+ (int64_t)_titleIconImageTypeForConversation:(id)a3
{
  return [a3 shouldShowVerifiedCheckmark];
}

- (BOOL)_shouldShowSendLaterIcon
{
  v2 = [(CKConversationListCell *)self conversation];
  char v3 = [v2 hasCancellableScheduledMessage];

  return v3;
}

- (void)updateContentsForConversation:(id)a3 fastPreview:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEBUG, "Updating contents of CKConversationListCell for conversation: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v17 = v6;
    _CKLog();
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    char v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      BOOL v9 = [v6 name];
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_DEBUG, "  From: '%@'", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v17 = [v6 name];
    _CKLog();
  }
  -[CKConversationListCell setConversation:](self, "setConversation:", v6, v17);
  self->_placeholder = [v6 isPlaceholder];
  -[CKConversationListCell setMuted:](self, "setMuted:", [v6 isMuted]);
  -[CKConversationListCell setGroupConversation:](self, "setGroupConversation:", [v6 isGroupConversation]);
  [(CKConversationListCell *)self updateUnreadIndicatorForCurrentConversation];
  if ([v6 hasDisplayName])
  {
    objc_super v10 = [v6 displayName];
  }
  else
  {
    objc_super v10 = [v6 name];
    [v6 fetchSuggestedNameIfNecessary];
  }
  if (!v10 && IMOSLoggingEnabled())
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      BOOL v12 = [v6 chat];
      v13 = [v12 guid];
      *(_DWORD *)buf = 138412290;
      id v19 = v13;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Setting conversation cell text to nil! Chat guid: %@", buf, 0xCu);
    }
  }
  [(CKConversationListCell *)self updateFromLabelWithText:v10];
  [(CKConversationListCell *)self updateDateLabel:self->_dateLabel conversation:v6];
  int v14 = [v6 chat];
  v15 = v14;
  if (v14) {
    uint64_t v16 = [v14 allowedByScreenTime] ^ 1;
  }
  else {
    uint64_t v16 = 0;
  }
  [(CKConversationListCell *)self setShouldHidePreviewSummary:v16];
  [(CKConversationListCell *)self updateSummaryLabel:self->_summaryLabel conversation:v6 fastPreview:v4];
  [(CKConversationListCell *)self updateVerifiedCheckmarkForBusiness];
  [(CKConversationListCell *)self setNeedsLayout];
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (BOOL)shouldAppearAsRecoverableConversation
{
  char v3 = [(CKConversationListCell *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  BOOL v5 = [(CKConversationListCell *)self delegate];
  char v6 = [v5 shouldAppearAsRecoverableConversation];

  return v6;
}

- (CKConversationListTypingIndicatorView)typingIndicatorView
{
  return self->_typingIndicatorView;
}

- (CKDownloadingPendingMessagesView)downloadingPendingMessagesView
{
  return self->_downloadingPendingMessagesView;
}

- (void)updateVerifiedCheckmarkForBusiness
{
  fromLabel = self->_fromLabel;
  id v3 = [(CKConversationListCell *)self conversation];
  [(CKLabel *)fromLabel setTitleIconImageType:+[CKConversationListCell _titleIconImageTypeForConversation:v3]];
}

- (void)updateUnreadIndicatorForCurrentConversation
{
  id v3 = [(CKConversationListCell *)self conversation];

  if (v3)
  {
    char v4 = [(CKConversationListCell *)self conversation];
    BOOL v5 = [(CKConversationListCell *)self hasUnreadMessagesForConversation:v4];

    char v6 = [(CKConversationListCell *)self conversation];
    int v7 = [v6 isMuted];

    if (v7) {
      uint64_t v8 = [(CKConversationListCell *)self shouldHideMuteIndicator] ^ 1;
    }
    else {
      uint64_t v8 = 0;
    }
    BOOL v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v10 = [v9 isCarrierPigeonEnabled];

    if (v10) {
      BOOL v11 = [(CKConversationListCell *)self _shouldShowSummaryForSatelliteMessages];
    }
    else {
      BOOL v11 = 0;
    }
    id v12 = [(CKConversationListCell *)self unreadIndicatorImageForVisibility:v5 | v11 withMuteState:v8];
    [(CKConversationListCell *)self updateUnreadIndicatorWithImage:v12];
  }
}

- (BOOL)_shouldShowSummaryForSatelliteMessages
{
  id v3 = [(CKConversationListCell *)self conversation];

  if (v3)
  {
    char v4 = [(CKConversationListCell *)self conversation];
    BOOL v5 = [v4 chat];

    if ([v5 pendingIncomingSatelliteMessageCount]
      && ([v5 isDownloadingPendingSatelliteMessages] & 1) == 0)
    {
      char v6 = [MEMORY[0x1E4F6BC48] sharedInstance];
      LOBYTE(v3) = [v6 isSatelliteConnectionActive];
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)updateForEditing:(BOOL)a3
{
  BOOL v4 = [(CKConversationListCell *)self showingEditControl];
  double v5 = 1.0;
  if (v4) {
    double v5 = 0.0;
  }
  chevronImageView = self->_chevronImageView;

  [(UIImageView *)chevronImageView setAlpha:v5];
}

- (void)updateDateLabel:(id)a3 conversation:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CKConversationListCell *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v10 = [(CKConversationListCell *)self delegate];
    [v10 updateDateLabel:v6 conversation:v7];
  }
  else
  {
    BOOL v11 = [v7 date];
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(26);
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        int v14 = v11;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_DEBUG, "  Date: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
    if (v11) {
      [(CKDateLabel *)self->_dateLabel setDate:v11];
    }
  }
}

- (id)unreadIndicatorImageForVisibility:(BOOL)a3 withMuteState:(BOOL)a4
{
  if (a3)
  {
    if ([(CKConversationListCell *)self shouldLabelsBeHighlighted]
      && (+[CKUIBehavior sharedBehaviors],
          BOOL v4 = objc_claimAutoreleasedReturnValue(),
          int v5 = [v4 shouldUnreadIndicatorChangeOnSelection],
          v4,
          v5))
    {
      id v6 = +[CKUIBehavior sharedBehaviors];
      uint64_t v7 = [v6 unreadIndicatorSelectedImage];
    }
    else
    {
      id v6 = +[CKUIBehavior sharedBehaviors];
      uint64_t v7 = [v6 unreadIndicatorTintedImage];
    }
    uint64_t v8 = (void *)v7;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)setShouldHidePreviewSummary:(BOOL)a3
{
  int v3 = a3;
  int shouldHidePreviewSummary = self->_shouldHidePreviewSummary;
  self->_int shouldHidePreviewSummary = a3;
  int v6 = [MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled];
  if (shouldHidePreviewSummary != v3 && v6 != 0)
  {
    summaryLabel = self->_summaryLabel;
    id v9 = [(CKConversationListCell *)self conversation];
    [(CKConversationListCell *)self updateSummaryLabel:summaryLabel conversation:v9 fastPreview:0];
  }
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (void)setGroupConversation:(BOOL)a3
{
  self->_groupConversation = a3;
}

- (void)setDownloadingPendingMessagesView:(id)a3
{
}

- (void)setConversation:(id)a3
{
}

- (BOOL)lastMessageIsTypingIndicator
{
  v2 = [(CKConversationListCell *)self conversation];
  int v3 = [v2 chat];
  BOOL v4 = [v3 lastMessage];

  if ([v4 isTypingMessage]) {
    int v5 = [v4 isFromMe] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)hasUnreadMessagesForConversation:(id)a3
{
  id v4 = a3;
  int v5 = [(CKConversationListCell *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(CKConversationListCell *)self delegate];
    char v8 = [v7 hasUnreadMessagesForConversation:v4];
  }
  else
  {
    char v8 = [v4 hasUnreadMessages];
  }

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  int v5 = objc_opt_class();
  char v6 = [(CKConversationListCell *)self traitCollection];
  [v6 displayScale];
  objc_msgSend(v5, "cellHeightForDisplayScale:");
  double v8 = v7;

  double v9 = width;
  double v10 = v8;
  result.height = v10;
  result.CGFloat width = v9;
  return result;
}

+ (double)cellHeightForDisplayScale:(double)a3
{
  id v4 = +[CKUIBehavior sharedBehaviors];
  int v5 = [v4 conversationListSenderFont];

  char v6 = +[CKUIBehavior sharedBehaviors];
  double v7 = [v6 conversationListSummaryFont];

  if (a3 <= 0.0)
  {
    double v8 = [MEMORY[0x1E4F42D90] mainScreen];
    [v8 scale];
  }
  double v9 = +[CKUIBehavior sharedBehaviors];
  [v9 bottomConversationListSpace];
  double v11 = v10;

  id v12 = +[CKUIBehavior sharedBehaviors];
  v13 = [v12 conversationListSenderFont];
  [v13 _scaledValueForValue:1 useLanguageAwareScaling:v11];

  int v14 = +[CKUIBehavior sharedBehaviors];
  [v14 topConversationListSpace];
  UIRoundToScale();
  double v16 = v15;

  [v5 capHeight];
  UIRoundToScale();
  double v18 = v17;
  [v7 capHeight];
  UIRoundToScale();
  double v20 = v19;
  v21 = +[CKUIBehavior sharedBehaviors];
  [v21 senderSummaryConversationListSpace];
  UIRoundToScale();
  double v23 = v22;

  [v7 _bodyLeading];
  UIRoundToScale();
  double v25 = v24;
  UIRoundToScale();
  double v27 = v20 + v16 + 0.0 + v18 + v23 + v25 + v26;

  return v27;
}

- (BOOL)shouldAlwaysHideAvatar
{
  int v3 = [(CKConversationListCell *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  int v5 = [(CKConversationListCell *)self delegate];
  char v6 = [v5 shouldAlwaysHideAvatar];

  return v6;
}

- (void)updateLabelTextColors
{
  BOOL v3 = [(CKConversationListCell *)self shouldLabelsBeHighlighted];
  char v4 = +[CKUIBehavior sharedBehaviors];
  int v5 = [v4 theme];
  char v6 = v5;
  if (v3) {
    [v5 conversationListCellSelectedDateColor];
  }
  else {
  id v21 = [v5 conversationListDateColor];
  }

  BOOL v7 = [(CKConversationListCell *)self shouldLabelsBeHighlighted];
  double v8 = +[CKUIBehavior sharedBehaviors];
  double v9 = [v8 theme];
  double v10 = v9;
  if (v7) {
    [v9 conversationListCellSelectedTextColor];
  }
  else {
  double v11 = [v9 conversationListSenderColor];
  }

  id v12 = [(CKConversation *)self->_conversation chat];
  int v13 = [v12 isStewieChat];

  if (v13)
  {
    int v14 = +[CKUIBehavior sharedBehaviors];
    double v15 = [v14 theme];
    uint64_t v16 = [v15 conversationListEmergencyColor];

    double v11 = (void *)v16;
  }
  if (v21)
  {
    id v17 = [(CKDateLabel *)self->_dateLabel textColor];

    if (v17 != v21) {
      [(CKDateLabel *)self->_dateLabel setTextColor:v21];
    }
  }
  if (v11)
  {
    double v18 = [(CKLabel *)self->_fromLabel textColor];

    if (v18 != v11) {
      [(CKLabel *)self->_fromLabel setTextColor:v11];
    }
  }
  [(CKConversationListCell *)self updateVerifiedCheckmarkForBusiness];
  summaryLabel = self->_summaryLabel;
  double v20 = [(CKConversationListCell *)self conversation];
  [(CKConversationListCell *)self updateSummaryLabel:summaryLabel conversation:v20 fastPreview:0];
}

- (void)_updateAccessoryIndicatorColor
{
  BOOL v3 = +[CKUIBehavior sharedBehaviors];
  char v4 = [v3 theme];
  id v11 = [v4 accessoryIndicatorTintColor];

  if ([(CKConversationListCell *)self shouldLabelsBeHighlighted])
  {
    int v5 = +[CKUIBehavior sharedBehaviors];
    char v6 = [v5 theme];
    BOOL v7 = [v6 accessoryIndicatorHighlightedTintColor];

    if (v7)
    {
      double v8 = +[CKUIBehavior sharedBehaviors];
      double v9 = [v8 theme];
      uint64_t v10 = [v9 accessoryIndicatorHighlightedTintColor];

      id v11 = (id)v10;
    }
  }
  [(CKConversationListCell *)self updateAccessoryIndicatorsColorForTintColor:v11];
}

- (void)didHoverOverCell:(id)a3
{
  uint64_t v4 = [a3 state];
  if (v4 == 3)
  {
    char v6 = [(UILabel *)self->_summaryLabel layer];
    [v6 setMask:0];
    uint64_t v7 = 1;
  }
  else
  {
    if (v4 != 1) {
      return;
    }
    gradient = self->_gradient;
    char v6 = [(UILabel *)self->_summaryLabel layer];
    [v6 setMask:gradient];
    uint64_t v7 = 0;
  }

  closeButton = self->_closeButton;

  [(UIButton *)closeButton setHidden:v7];
}

- (void)deleteButtonTapped
{
  BOOL v3 = [(CKConversationListCell *)self delegate];
  uint64_t v4 = [(CKConversationListCell *)self conversation];
  [v3 selectedDeleteButtonForConversation:v4 inCell:self];

  id v6 = [(CKConversationListCell *)self conversation];
  int v5 = [v6 unsentComposition];
  [v5 cleanupCKShareFromComposition];
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListCell;
  [(CKConversationListCell *)&v4 dealloc];
}

- (CGRect)containerBounds
{
  p_containerBounds = &self->_containerBounds;
  [(CKConversationListCell *)self bounds];
  v13.origin.double x = v4;
  v13.origin.double y = v5;
  v13.size.double width = v6;
  v13.size.double height = v7;
  if (!CGRectEqualToRect(*p_containerBounds, v13))
  {
    [(CKConversationListCell *)self bounds];
    -[CKConversationListCell setContainerBounds:](self, "setContainerBounds:");
  }
  double x = p_containerBounds->origin.x;
  double y = p_containerBounds->origin.y;
  double width = p_containerBounds->size.width;
  double height = p_containerBounds->size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContainerBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_containerBounds = &self->_containerBounds;
  if (!CGRectEqualToRect(self->_containerBounds, a3))
  {
    p_containerBounds->origin.CGFloat x = x;
    p_containerBounds->origin.CGFloat y = y;
    p_containerBounds->size.CGFloat width = width;
    p_containerBounds->size.CGFloat height = height;
    uint64_t v10 = [(CKConversationListCell *)self cellLayout];

    if (!v10)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      CGRect v13 = (objc_class *)objc_opt_class();
      int v14 = NSStringFromClass(v13);
      [v12 handleFailureInMethod:a2, self, @"CKConversationListCell.m", 327, @"%@ needs a cell layout.", v14 object file lineNumber description];
    }
    id v11 = [(CKConversationListCell *)self cellLayout];
    [v11 invalidate];

    [(CKConversationListCell *)self setNeedsLayout];
  }
}

- (CKAvatarView)avatarView
{
  return 0;
}

- (void)prepareForReuse
{
  [(CKConversationListCell *)self setConversation:0];
  [(CKDateLabel *)self->_dateLabel setTextForOverride:0];
  [(CKConversationListCell *)self setShouldHidePreviewSummary:0];
  [(CKConversationListCell *)self setEditingPins:0 animated:0];
  v3.receiver = self;
  v3.super_class = (Class)CKConversationListCell;
  [(CKConversationListCell *)&v3 prepareForReuse];
}

- (void)contentSizeCategoryDidChange
{
  dateLabel = self->_dateLabel;
  CGFloat v4 = +[CKUIBehavior sharedBehaviors];
  CGFloat v5 = [v4 conversationListDateFont];
  [(CKDateLabel *)dateLabel setFont:v5];

  fromLabel = self->_fromLabel;
  CGFloat v7 = +[CKUIBehavior sharedBehaviors];
  double v8 = [v7 conversationListSenderFont];
  [(CKLabel *)fromLabel setFont:v8];

  summaryLabel = self->_summaryLabel;
  uint64_t v10 = +[CKUIBehavior sharedBehaviors];
  id v11 = [v10 conversationListSummaryFont];
  [(UILabel *)summaryLabel setFont:v11];

  id v12 = self->_summaryLabel;
  id v13 = [(CKConversationListCell *)self conversation];
  [(CKConversationListCell *)self updateSummaryLabel:v12 conversation:v13 fastPreview:0];
}

- (void)simLabelImageDidChange
{
  objc_super v3 = [(CKConversationListCell *)self conversation];
  int v4 = [v3 wantsLabelForDSDS];

  if (v4)
  {
    summaryLabel = self->_summaryLabel;
    id v6 = [(CKConversationListCell *)self conversation];
    [(CKConversationListCell *)self updateSummaryLabel:summaryLabel conversation:v6 fastPreview:0];
  }
}

- (void)updateUnreadIndicatorWithImage:(id)a3
{
  if (!CKIsRunningUnitTests()) {
    -[CKConversationListCell updateUnreadIndicatorWithImage:]();
  }
}

- (void)updateFromLabelWithText:(id)a3
{
  if (!CKIsRunningUnitTests()) {
    -[CKConversationListCell updateUnreadIndicatorWithImage:]();
  }
}

- (void)updateContentsForConversation:(id)a3
{
}

- (void)_updateSummaryLabelWithGeneratedSummary:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  int v4 = [a3 string];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v6 = [(CKConversationListCell *)self summaryLabelTextColor];
  CGFloat v7 = +[CKUIBehavior sharedBehaviors];
  double v8 = [v7 conversationListSummaryFont];

  id v9 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  uint64_t v10 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438C8]];
  id v11 = (void *)MEMORY[0x1E4FB08E0];
  [v10 pointSize];
  id v12 = objc_msgSend(v11, "systemFontOfSize:weight:");
  v32 = [MEMORY[0x1E4F42A98] configurationWithFont:v12 scale:1];
  id v13 = objc_msgSend(MEMORY[0x1E4F42A80], "_systemImageNamed:withConfiguration:", @"text.line.2.summary");
  int v14 = [v13 imageWithRenderingMode:2];
  [v9 setImage:v14];

  v33 = v9;
  if (v9)
  {
    double v15 = (void *)MEMORY[0x1E4F28B18];
    uint64_t v34 = *MEMORY[0x1E4FB0700];
    uint64_t v16 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
    v35[0] = v16;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    id v17 = v5;
    double v18 = v12;
    double v19 = v10;
    double v20 = v8;
    id v21 = self;
    double v22 = v6;
    double v24 = v23 = v4;
    double v25 = [v15 attributedStringWithAttachment:v33 attributes:v24];

    int v4 = v23;
    id v6 = v22;
    self = v21;
    double v8 = v20;
    uint64_t v10 = v19;
    id v12 = v18;
    id v5 = v17;

    if (v25)
    {
      [v17 appendAttributedString:v25];
      double v26 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
      [v5 appendAttributedString:v26];
    }
  }
  double v27 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4];
  [v5 appendAttributedString:v27];

  v28 = [v5 string];
  uint64_t v29 = [v28 rangeOfString:v4 options:1];
  uint64_t v31 = v30;

  if (v29 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v6, v29, v31);
    objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v8, v29, v31);
  }
  [(UILabel *)self->_summaryLabel setAttributedText:v5];
  [(CKConversationListCell *)self setShouldHidePreviewSummary:0];
}

- (unint64_t)unreadMessageCount
{
  v2 = [(CKConversationListCell *)self conversation];
  objc_super v3 = [v2 chat];
  unint64_t v4 = [v3 unreadMessageCount];

  return v4;
}

- (id)summaryAttributedTextForBlockedConversationWithIcon:(BOOL)a3
{
  BOOL v3 = a3;
  v35[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled])
  {
    id v5 = NSString;
    id v6 = CKFrameworkBundle();
    CGFloat v7 = [v6 localizedStringForKey:@"CONVERSATION_LIST_CELL_SUMMARY_TEXT_SCREENTIME" value:&stru_1EDE4CA38 table:@"ChatKit"];
    double v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, -[CKConversationListCell unreadMessageCount](self, "unreadMessageCount"));

    id v9 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v10 = [v9 userInterfaceLayoutDirection];

    if (v10 == 1) {
      id v11 = @"\u200F";
    }
    else {
      id v11 = @"\u200E";
    }
    id v12 = [(__CFString *)v11 stringByAppendingString:v8];

    uint64_t v13 = [v12 length];
    int v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v12];
    double v15 = [(UILabel *)self->_summaryLabel font];
    uint64_t v16 = [v15 fontDescriptor];
    id v17 = [v16 fontDescriptorWithSymbolicTraits:1];

    double v18 = [(UILabel *)self->_summaryLabel font];
    [v18 pointSize];
    double v20 = v19;

    id v21 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v17 size:v20];
    objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v21, 0, v13);
    uint64_t v22 = *MEMORY[0x1E4FB0700];
    double v23 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
    objc_msgSend(v14, "addAttribute:value:range:", v22, v23, 0, v13);

    if (v3)
    {
      double v24 = +[CKUIBehavior sharedBehaviors];
      double v25 = [v24 screenTimeConversationListSummaryIcon];

      double v26 = (void *)MEMORY[0x1E4F42A98];
      double v27 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
      v35[0] = v27;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
      uint64_t v29 = [v26 configurationWithPaletteColors:v28];

      uint64_t v30 = [v25 imageWithSymbolConfiguration:v29];

      uint64_t v31 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v30];
      v32 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v31];
      [v14 insertAttributedString:v32 atIndex:0];
      v33 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
      [v14 insertAttributedString:v33 atIndex:1];
    }
  }
  else
  {
    int v14 = 0;
  }

  return v14;
}

- (id)_makeSummaryAttributedStringWithText:(id)a3 multiwayConversation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    id v5 = [NSString string];
  }
  double v47 = v5;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  int v8 = [MEMORY[0x1E4F6BCC0] conversationIsVideoCall:v6];
  int v9 = [MEMORY[0x1E4F6BCC0] conversationIsAVLessSharePlay:v6];
  uint64_t v10 = [MEMORY[0x1E4F42A98] configurationPreferringMulticolor];
  if (v9)
  {
    id v11 = (void *)MEMORY[0x1E4F42A98];
    id v12 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKSystemGreenColor"];
    uint64_t v13 = [v11 configurationWithHierarchicalColor:v12];

    int v14 = +[CKUIBehavior sharedBehaviors];
    double v15 = [v14 conversationListSharePlayIcon];
    uint64_t v10 = (void *)v13;
  }
  else
  {
    uint64_t v16 = +[CKUIBehavior sharedBehaviors];
    int v14 = v16;
    if (v8) {
      [v16 conversationListFacetimeVideoIcon];
    }
    else {
    double v15 = [v16 conversationListFacetimeAudioIcon];
    }
  }
  double v46 = v10;

  v45 = [v15 imageWithSymbolConfiguration:v10];

  id v17 = (void *)MEMORY[0x1E4F28B18];
  double v18 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v45];
  v44 = [v17 attributedStringWithAttachment:v18];

  double v19 = NSString;
  double v20 = +[CKTUConversationViewUtilities titleForAVMode:](CKTUConversationViewUtilities, "titleForAVMode:", [v6 avMode]);
  v43 = [v19 stringWithFormat:@" %@", v20];

  id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v22 = +[CKUIBehavior sharedBehaviors];
  double v23 = [v22 conversationCellSummaryBoldPreviewTextAttributes];
  double v24 = (void *)[v21 initWithString:v43 attributes:v23];

  [v7 appendAttributedString:v24];
  double v25 = [v6 activeRemoteParticipants];
  uint64_t v26 = [v25 count];

  double v27 = NSString;
  v28 = IMSharedUtilitiesFrameworkBundle();
  uint64_t v29 = [v28 localizedStringForKey:@"%lu People Active" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  uint64_t v30 = objc_msgSend(v27, "localizedStringWithFormat:", v29, v26);

  uint64_t v31 = [NSString stringWithFormat:@" %@\n", v30];
  id v32 = objc_alloc(MEMORY[0x1E4F28B18]);
  v33 = +[CKUIBehavior sharedBehaviors];
  uint64_t v34 = [v33 conversationCellSummaryPreviewTextAttributes];
  v35 = (void *)[v32 initWithString:v31 attributes:v34];

  [v7 appendAttributedString:v35];
  id v36 = objc_alloc(MEMORY[0x1E4F28B18]);
  v37 = +[CKUIBehavior sharedBehaviors];
  v38 = [v37 conversationCellSummaryPreviewTextAttributes];
  v39 = (void *)[v36 initWithString:v47 attributes:v38];

  [v7 appendAttributedString:v39];
  uint64_t v40 = *MEMORY[0x1E4FB0700];
  BOOL v41 = [(CKConversationListCell *)self summaryLabelTextColor];
  objc_msgSend(v7, "addAttribute:value:range:", v40, v41, 0, objc_msgSend(v7, "length"));

  [v7 insertAttributedString:v44 atIndex:0];

  return v7;
}

uint64_t __50__CKConversationListCell_setEditingPins_animated___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 1040) setAlpha:v1];
}

void __50__CKConversationListCell_setEditingPins_animated___block_invoke_2(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  uint64_t v2 = v1[131];
  id v3 = [v1 conversation];
  [v1 updateSummaryLabel:v2 conversation:v3 fastPreview:0];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKConversationListCell;
  [(CKConversationListCell *)&v11 setSelected:a3 animated:a4];
  id v6 = [(UIButton *)self->_closeButton imageView];
  id v7 = +[CKUIBehavior sharedBehaviors];
  int v8 = [v7 theme];
  int v9 = v8;
  if (v4) {
    [v8 conversationListCellSelectedSummaryColor];
  }
  else {
  uint64_t v10 = [v8 conversationListSummaryColor];
  }
  [v6 setTintColor:v10];
}

- (void)_handleSatelliteStatusStateChanged
{
  summaryLabel = self->_summaryLabel;
  id v4 = [(CKConversationListCell *)self conversation];
  [(CKConversationListCell *)self updateSummaryLabel:summaryLabel conversation:v4 fastPreview:0];
}

- (BOOL)shouldHideMuteIndicator
{
  if (![(CKConversationListCell *)self isMuted]) {
    return 1;
  }

  return [(CKConversationListCell *)self shouldAppearAsRecoverableConversation];
}

- (void)setDateLabel:(id)a3
{
}

- (void)setSummaryLabel:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (void)setChevronImageView:(id)a3
{
}

- (void)setFromLabel:(id)a3
{
}

- (CAGradientLayer)gradient
{
  return self->_gradient;
}

- (void)setTypingIndicatorView:(id)a3
{
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (BOOL)isGroupConversation
{
  return self->_groupConversation;
}

- (void)setShouldLabelsBeHighlighted:(BOOL)a3
{
  self->_shouldLabelsBeHighlighted = a3;
}

- (BOOL)isStewie
{
  return self->_isStewie;
}

- (void)setIsStewie:(BOOL)a3
{
  self->_isStewie = a3;
}

- (void)setFreezeSummaryText:(BOOL)a3
{
  self->_freezeSummaryText = a3;
}

- (void)set_editingPins:(BOOL)a3
{
  self->__BOOL editingPins = a3;
}

- (BOOL)_shouldShowSlashSatelliteIcon
{
  return self->__shouldShowSlashSatelliteIcon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_summaryBlockedLabel, 0);
  objc_storeStrong((id *)&self->_downloadingPendingMessagesView, 0);
  objc_storeStrong((id *)&self->_typingIndicatorView, 0);
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_fromLabel, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);

  objc_storeStrong((id *)&self->_cellLayout, 0);
}

- (id)makeTextAttachmentsForCurrentIndicatorState
{
  uint64_t v2 = self;
  CKConversationListCell.makeTextAttachmentsForCurrentIndicatorState()();

  sub_18F5216F8();
  id v3 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return v3;
}

+ (id)identifierForConversation:(id)a3
{
  return 0;
}

- (uint64_t)updateUnreadIndicatorWithImage:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_2();

  return NSRequestConcreteImplementation();
}

@end