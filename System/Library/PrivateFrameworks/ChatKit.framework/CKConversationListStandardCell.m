@interface CKConversationListStandardCell
+ (double)leadingLayoutMargin;
+ (id)identifierForConversation:(id)a3;
- (BOOL)_boundsShouldCollapseContent:(CGRect)a3;
- (BOOL)_isCollapsed;
- (BOOL)_shouldHideUnreadIndicatorForEditing:(BOOL)a3;
- (BOOL)_shouldShowAvatarForWidth:(double)a3;
- (BOOL)_shouldShowDownloadingPendingMessages;
- (BOOL)_shouldShowSlashSatelliteIcon;
- (BOOL)_shouldShowTypingIndicatorForConversation:(id)a3;
- (BOOL)avatarView:(id)a3 shouldShowContact:(id)a4;
- (BOOL)showDownloadingPendingMessages;
- (BOOL)showTypingIndicator;
- (CGRect)_calculateIndicatorFrameForSize:(CGSize)a3 trailing:(BOOL)a4 displayScale:(double)a5 insets:(UIEdgeInsets)a6;
- (CGRect)_calculateIndicatorViewRectVerticallyCenteredWithFirstTextLineOfLabel:(id)a3 horizontallyAlignedWithColumn:(CGRect)a4 wantsCenteringColumnAlignment:(BOOL)a5 size:(CGSize)a6 offset:(CGPoint)a7;
- (CGRect)_calculateRectVerticallyCenteredWithFirstTextLineOfLabel:(id)a3 horizontallyCenteredInColumn:(CGRect)a4 size:(CGSize)a5 offset:(CGPoint)a6;
- (CGRect)_calculateSummaryLabelFrameForColumn:(CGRect)a3 summaryLabelCapFrameYOrigin:(double)a4 displayScale:(double)a5;
- (CKAvatarView)avatarView;
- (CKConversationListStandardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)unreadIndicatorImageView;
- (_TtC7ChatKit32CKConversationListIndicatorsView)indicatorContainerView;
- (id)avatarView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5;
- (id)contactsForPreviewInteractionForAvatarView:(id)a3 suggestedKeysToFetch:(id)a4;
- (id)overrideImageDataForPreviewInteractionForAvatarView:(id)a3;
- (id)presentingViewControllerForAvatarView:(id)a3;
- (unint64_t)totalSatelliteMessageCount;
- (void)_calculateLayoutFrames;
- (void)_configureDateLabelAppearanceForConversation:(id)a3;
- (void)_configureSummaryLabelAppearanceForConversation:(id)a3;
- (void)_removeDownloadingPendingMessagesView;
- (void)_resetTypingIndicator;
- (void)_setupDownloadingPendingMessagesView;
- (void)_startTypingIndicator;
- (void)_stopTypingIndicator;
- (void)_updateAvatarView;
- (void)_updateLabelVisibility;
- (void)_updateTypingIndicatorFrame:(BOOL)a3 isCollapsed:(BOOL)a4;
- (void)dealloc;
- (void)forceUnreadIndicatorVisibility:(BOOL)a3 forConversation:(id)a4 animated:(BOOL)a5;
- (void)increaseContrastDidChange;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)registerForEvents;
- (void)setAvatarView:(id)a3;
- (void)setIndicatorContainerView:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setShowDownloadingPendingMessages:(BOOL)a3;
- (void)setShowTypingIndicator:(BOOL)a3;
- (void)setTotalSatelliteMessageCount:(unint64_t)a3;
- (void)setUnreadIndicatorImageView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAccessoryIndicatorsColorForTintColor:(id)a3;
- (void)updateAccessoryIndicatorsForCurrentState;
- (void)updateContentsForConversation:(id)a3;
- (void)updateContentsForConversation:(id)a3 fastPreview:(BOOL)a4;
- (void)updateForEditing:(BOOL)a3;
- (void)updateFromLabelWithText:(id)a3;
- (void)updateTypingIndicatorIfNeeded;
- (void)updateUnreadIndicatorWithImage:(id)a3;
- (void)updateUnreadIndicatorWithImage:(id)a3 animated:(BOOL)a4;
- (void)updateWithForwardedConfigurationState:(id)a3;
@end

@implementation CKConversationListStandardCell

- (void)updateWithForwardedConfigurationState:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKConversationListStandardCell;
  [(CKConversationListCell *)&v10 updateWithForwardedConfigurationState:v4];
  v5 = [(CKConversationListCell *)self typingIndicatorView];

  if (v5)
  {
    v6 = +[CKUIBehavior sharedBehaviors];
    v7 = [(CKConversationListStandardCell *)self traitCollection];
    int v8 = [v6 useSelectedAppearanceForConversationCellState:v4 traitCollection:v7];

    v9 = [(CKConversationListCell *)self typingIndicatorView];
    LODWORD(v7) = [v9 isHighlighted];

    if (v8 != v7) {
      [(CKConversationListStandardCell *)self _resetTypingIndicator];
    }
  }
}

- (void)updateContentsForConversation:(id)a3 fastPreview:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)CKConversationListStandardCell;
  id v6 = a3;
  [(CKConversationListCell *)&v7 updateContentsForConversation:v6 fastPreview:v4];
  -[CKConversationListStandardCell _configureSummaryLabelAppearanceForConversation:](self, "_configureSummaryLabelAppearanceForConversation:", v6, v7.receiver, v7.super_class);
  [(CKConversationListStandardCell *)self _configureDateLabelAppearanceForConversation:v6];

  [(CKConversationListStandardCell *)self _updateAvatarView];
  [(CKConversationListStandardCell *)self updateAccessoryIndicatorsForCurrentState];
}

- (void)_configureDateLabelAppearanceForConversation:(id)a3
{
  BOOL v4 = [a3 date];
  if (v4)
  {

LABEL_4:
    id v6 = [(CKConversationListStandardCell *)self contentView];
    v5 = [(CKConversationListCell *)self dateLabel];
    [v6 addSubview:v5];

    goto LABEL_6;
  }
  if ([(CKConversationListCell *)self shouldAppearAsRecoverableConversation]) {
    goto LABEL_4;
  }
  id v6 = [(CKConversationListCell *)self dateLabel];
  [v6 removeFromSuperview];
LABEL_6:
}

- (void)_updateLabelVisibility
{
  BOOL v3 = [(CKConversationListStandardCell *)self _isCollapsed];
  BOOL v4 = [(CKConversationListCell *)self shouldHidePreviewSummary];
  v5 = [(CKConversationListCell *)self summaryBlockedLabel];
  [v5 setHidden:!v4 | v3];

  id v6 = [(CKConversationListCell *)self summaryLabel];
  [v6 setHidden:v4 | v3];

  objc_super v7 = [(CKConversationListCell *)self dateLabel];
  [v7 setHidden:v3];

  id v8 = [(CKConversationListCell *)self fromLabel];
  [v8 setHidden:v3];
}

- (void)layoutSubviews
{
  v199[3] = *MEMORY[0x1E4F143B8];
  v197.receiver = self;
  v197.super_class = (Class)CKConversationListStandardCell;
  [(CKConversationListStandardCell *)&v197 layoutSubviews];
  BOOL v4 = [(CKConversationListCell *)self cellLayout];

  if (v4)
  {
    if ([(CKConversationListStandardCell *)self showDownloadingPendingMessages])
    {
      [(CKConversationListStandardCell *)self setShowDownloadingPendingMessages:0];
      [(CKConversationListStandardCell *)self _setupDownloadingPendingMessagesView];
    }
    if ([(CKConversationListStandardCell *)self showTypingIndicator])
    {
      [(CKConversationListStandardCell *)self setShowTypingIndicator:0];
      [(CKConversationListStandardCell *)self _stopTypingIndicator];
      [(CKConversationListStandardCell *)self _startTypingIndicator];
    }
    BOOL v5 = [(CKConversationListStandardCell *)self _isCollapsed];
    id v6 = [(CKConversationListStandardCell *)self indicatorContainerView];
    [v6 setOrientation:v5];

    int v7 = [(CKConversationListStandardCell *)self _shouldReverseLayoutDirection];
    id v8 = [(CKConversationListStandardCell *)self contentView];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    BOOL v17 = -[CKConversationListStandardCell _boundsShouldCollapseContent:](self, "_boundsShouldCollapseContent:", v10, v12, v14, v16);
    BOOL v18 = [(CKConversationListCell *)self showingEditControl];
    BOOL v19 = [(CKConversationListCell *)self _editingPins];
    v20 = [(CKConversationListStandardCell *)self traitCollection];
    [v20 displayScale];
    double v194 = v21;

    v22 = [(CKConversationListCell *)self cellLayout];
    if (!v22)
    {
      v191 = [MEMORY[0x1E4F28B00] currentHandler];
      v192 = (objc_class *)objc_opt_class();
      v193 = NSStringFromClass(v192);
      [v191 handleFailureInMethod:a2, self, @"CKConversationListStandardCell.m", 417, @"%@ needs a cell layout.", v193 object file lineNumber description];
    }
    v23 = [(CKConversationListCell *)self delegate];
    [v23 widthForDeterminingAvatarVisibility];
    double v25 = v24;

    if (([v22 isValidForContentViewWidth:v18 widthForDeterminingAvatarVisibility:v14 showingEditControl:v25] & 1) == 0)-[CKConversationListStandardCell _calculateLayoutFrames](self, "_calculateLayoutFrames"); {
    [v22 senderFrame];
    }
    CGFloat v195 = v26;
    CGFloat v196 = v27;
    double v29 = v28;
    double v31 = v30;
    [v22 dateFrame];
    uint64_t v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    v40 = [(CKConversationListCell *)self dateLabel];
    [v40 sizeToFit];

    v41 = [(CKConversationListCell *)self dateLabel];
    [v41 frame];
    double v43 = v42;

    double v44 = 0.0;
    if (!v19) {
      double v44 = v43;
    }
    double v45 = v29 + v37 - v44;
    uint64_t v46 = v33;
    double v47 = v35;
    double v48 = v37;
    double v49 = v39;
    if (v7)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v46);
      v200.origin.x = v195;
      double v51 = v196;
      v200.origin.y = v196;
      v200.size.width = v29;
      v200.size.height = v31;
      double v52 = CGRectGetMaxX(v200) - v45;
    }
    else
    {
      double MinX = CGRectGetMaxX(*(CGRect *)&v46) - v43;
      v201.origin.x = v195;
      double v51 = v196;
      v201.origin.y = v196;
      v201.size.width = v29;
      v201.size.height = v31;
      double v52 = CGRectGetMinX(v201);
    }
    v53 = [(CKConversationListCell *)self dateLabel];
    objc_msgSend(v53, "setFrame:", MinX, v35, v43, v39);

    v54 = [(CKConversationListCell *)self fromLabel];
    objc_msgSend(v54, "setFrame:", v52, v51, v45, v31);

    v55 = [(CKConversationListStandardCell *)self avatarView];
    int v56 = [v22 shouldShowAvatarView];
    if (v56)
    {
      [v22 avatarFrame];
      objc_msgSend(v55, "setFrame:");
    }
    [v55 setHidden:v56 ^ 1u];
    v57 = +[CKUIBehavior sharedBehaviors];
    if ([v57 showsConversationListCellChevronImage]) {
      uint64_t v58 = [v22 shouldShowChevron] ^ 1 | v18;
    }
    else {
      uint64_t v58 = 1;
    }

    v59 = [(CKConversationListCell *)self chevronImageView];
    [v59 setHidden:v58];

    [v22 chevronFrame];
    double v61 = v60;
    double v63 = v62;
    double v65 = v64;
    double v67 = v66;
    v68 = [(CKConversationListCell *)self chevronImageView];
    objc_msgSend(v68, "setFrame:", v61, v63, v65, v67);

    [v22 indicatorContainerFrame];
    double v70 = v69;
    double v72 = v71;
    double v74 = v73;
    double v76 = v75;
    v77 = [(CKConversationListStandardCell *)self indicatorContainerView];
    [v77 verticalOffsetForCenteringVisibleIndicators];
    double v79 = v78;

    v80 = [(CKConversationListStandardCell *)self indicatorContainerView];
    objc_msgSend(v80, "setFrame:", v70, v72 - v79, v74, v76);

    double v81 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    if (v17)
    {
      double v83 = *MEMORY[0x1E4F1DB28];
      double v82 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v84 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v85 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      [v22 summaryFrameIfAccessoryIndicatorHidden];
      double v87 = v86;
      double v82 = v88;
      double v90 = v89;
      double v85 = v91;
      v92 = [(CKConversationListStandardCell *)self indicatorContainerView];
      [v92 widthForVisibleIndicators];
      double v94 = v93;

      v95 = [(CKConversationListStandardCell *)self contentView];
      uint64_t v96 = [v95 effectiveUserInterfaceLayoutDirection];

      double v97 = -0.0;
      if (v96 == 1) {
        double v97 = v94;
      }
      double v83 = v87 + v97;
      double v84 = v90 - v94;
    }
    v98 = [(CKConversationListCell *)self summaryLabel];
    objc_msgSend(v98, "setFrame:", v83, v82, v84, v85);

    [v22 summaryLabelCapFrameYOrigin];
    double v100 = v99;
    v101 = [(CKConversationListCell *)self summaryLabel];
    [v101 _setFirstLineCapFrameOriginY:v100];

    [(CKConversationListStandardCell *)self _updateTypingIndicatorFrame:v7 ^ 1u isCollapsed:v17];
    v102 = +[CKUIBehavior sharedBehaviors];
    int v103 = [v102 showsHoverToDeleteButton];

    if (v103)
    {
      v104 = [(CKConversationListStandardCell *)self contentView];
      [v104 frame];
      double v106 = v105;

      v107 = +[CKUIBehavior sharedBehaviors];
      [v107 conversationListCellCloseButtonWidth];
      double v109 = v108 * 0.5;

      if (v7)
      {
        [v22 trailingLayoutMarginSize];
        double v111 = v110;
        if (v17)
        {
          v112 = +[CKUIBehavior sharedBehaviors];
          [v112 conversationListContactImageTrailingSpace];
          double v114 = (v111 + v113) * 0.5;

          double v111 = v114 - v109;
        }
        id v115 = [MEMORY[0x1E4F428B8] clearColor];
        v198[0] = [v115 CGColor];
        id v116 = [MEMORY[0x1E4F428B8] blackColor];
        v198[1] = [v116 CGColor];
        id v117 = [MEMORY[0x1E4F428B8] blackColor];
        v198[2] = [v117 CGColor];
        v118 = [MEMORY[0x1E4F1C978] arrayWithObjects:v198 count:3];
        v119 = [(CKConversationListCell *)self gradient];
        [v119 setColors:v118];

        v120 = [(CKConversationListCell *)self gradient];
        objc_msgSend(v120, "setStartPoint:", 0.0, 0.0);

        v121 = [(CKConversationListCell *)self gradient];
        objc_msgSend(v121, "setEndPoint:", 1.0, 0.0);

        v122 = [(CKConversationListCell *)self gradient];
        v123 = v122;
        v124 = &unk_1EDF15578;
      }
      else
      {
        if (v17)
        {
          [v22 trailingLayoutMarginSize];
          double v126 = v125;
          v127 = +[CKUIBehavior sharedBehaviors];
          [v127 conversationListContactImageTrailingSpace];
          double v129 = (v126 + v128) * -0.5;

          double v111 = v106 + v129 - v109;
        }
        else
        {
          v130 = [(CKConversationListStandardCell *)self contentView];
          [v130 frame];
          double v132 = v131;
          [v22 trailingLayoutMarginSize];
          double v134 = v132 - v133;
          v135 = +[CKUIBehavior sharedBehaviors];
          [v135 conversationListCellCloseButtonWidth];
          double v111 = v134 - v136;
        }
        id v137 = [MEMORY[0x1E4F428B8] blackColor];
        v199[0] = [v137 CGColor];
        id v138 = [MEMORY[0x1E4F428B8] blackColor];
        v199[1] = [v138 CGColor];
        id v139 = [MEMORY[0x1E4F428B8] clearColor];
        v199[2] = [v139 CGColor];
        v140 = [MEMORY[0x1E4F1C978] arrayWithObjects:v199 count:3];
        v141 = [(CKConversationListCell *)self gradient];
        [v141 setColors:v140];

        v142 = [(CKConversationListCell *)self gradient];
        objc_msgSend(v142, "setStartPoint:", 0.0, 0.0);

        v143 = [(CKConversationListCell *)self gradient];
        objc_msgSend(v143, "setEndPoint:", 1.0, 0.0);

        v122 = [(CKConversationListCell *)self gradient];
        v123 = v122;
        v124 = &unk_1EDF15560;
      }
      [v122 setLocations:v124];

      v144 = [(CKConversationListStandardCell *)self contentView];
      [v144 frame];
      double v146 = v145 * 0.5;
      v147 = +[CKUIBehavior sharedBehaviors];
      [v147 conversationListCellCloseButtonHeight];
      double v149 = v146 - v148 * 0.5;
      v150 = +[CKUIBehavior sharedBehaviors];
      [v150 conversationListCellCloseButtonWidth];
      double v152 = v151;
      v153 = +[CKUIBehavior sharedBehaviors];
      [v153 conversationListCellCloseButtonHeight];
      double v155 = v154;

      v156 = [(CKConversationListCell *)self closeButton];
      objc_msgSend(v156, "setFrame:", round(v194 * v111) / v194, round(v194 * v149) / v194, round(v194 * v152) / v194, round(v194 * v155) / v194);

      v157 = [(CKConversationListCell *)self summaryLabel];
      [v157 bounds];
      double v159 = v158;
      v160 = [(CKConversationListCell *)self summaryLabel];
      [v160 bounds];
      double v162 = v161;
      v163 = [(CKConversationListCell *)self summaryLabel];
      [v163 bounds];
      double MaxX = CGRectGetMaxX(v202);
      v165 = [(CKConversationListStandardCell *)self contentView];
      [v165 bounds];
      double MaxY = CGRectGetMaxY(v203);
      v167 = [(CKConversationListCell *)self gradient];
      objc_msgSend(v167, "setFrame:", v159, v162, MaxX, MaxY);

      v168 = [(CKConversationListStandardCell *)self contentView];
      v169 = [(CKConversationListCell *)self closeButton];
      [v168 bringSubviewToFront:v169];
    }
    unreadIndicatorImageView = self->_unreadIndicatorImageView;
    [v22 unreadFrame];
    -[UIImageView setFrame:](unreadIndicatorImageView, "setFrame:");
    if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled]
      && [(CKConversationListCell *)self shouldHidePreviewSummary])
    {
      v171 = [(CKConversationListCell *)self summaryBlockedLabel];

      if (v171)
      {
        v172 = [(CKConversationListCell *)self summaryBlockedLabel];
        v173 = [(CKConversationListCell *)self summaryAttributedTextForBlockedConversationWithIcon:0];
        [v172 setAttributedText:v173];

        v174 = [(CKConversationListCell *)self fromLabel];
        [v174 _firstLineBaselineFrameOriginY];

        v175 = +[CKUIBehavior sharedBehaviors];
        [v175 senderSummaryConversationListSpace];

        UIRoundToViewScale();
        double v177 = v176;
        v178 = [(CKConversationListCell *)self summaryBlockedLabel];
        [v178 _capOffsetFromBoundsTop];
        double v180 = v177 - v179;

        v181 = [(CKConversationListCell *)self summaryBlockedLabel];
        v182 = [(CKConversationListCell *)self summaryAttributedTextForBlockedConversationWithIcon:1];
        [v181 setAttributedText:v182];

        v183 = [(CKConversationListCell *)self summaryBlockedLabel];
        objc_msgSend(v183, "sizeThatFits:", v81, 600.0);
        double v185 = v184;
        double v187 = v186;

        v188 = [(CKConversationListCell *)self fromLabel];
        [v188 frame];
        double v189 = CGRectGetMinX(v204);

        v190 = [(CKConversationListCell *)self summaryBlockedLabel];
        objc_msgSend(v190, "setFrame:", v189, v180, v185, v187);
      }
    }
    [(CKConversationListStandardCell *)self _updateLabelVisibility];
  }
}

- (_TtC7ChatKit32CKConversationListIndicatorsView)indicatorContainerView
{
  return self->_indicatorContainerView;
}

- (BOOL)_isCollapsed
{
  v2 = self;
  BOOL v3 = [(CKConversationListStandardCell *)self contentView];
  [v3 bounds];
  LOBYTE(v2) = -[CKConversationListStandardCell _boundsShouldCollapseContent:](v2, "_boundsShouldCollapseContent:");

  return (char)v2;
}

- (BOOL)_boundsShouldCollapseContent:(CGRect)a3
{
  double width = a3.size.width;
  if (!CKIsRunningInMacCatalyst()) {
    return 0;
  }
  BOOL v4 = +[CKUIBehavior sharedBehaviors];
  [v4 snapToMinConversationListCellWidth];
  BOOL v6 = width < v5;

  return v6;
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (BOOL)showTypingIndicator
{
  return self->_showTypingIndicator;
}

- (BOOL)showDownloadingPendingMessages
{
  return self->_showDownloadingPendingMessages;
}

- (BOOL)_shouldShowSlashSatelliteIcon
{
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isCarrierPigeonEnabled];

  if (v4)
  {
    double v5 = [MEMORY[0x1E4F6BC48] sharedInstance];
    int v6 = [v5 isMessagingActiveOverSatellite];

    if (v6)
    {
      if ([(CKConversationListCell *)self isGroupConversation]) {
        return 1;
      }
      int v7 = [(CKConversationListCell *)self conversation];
      id v8 = [v7 recipient];
      double v9 = [v8 rawAddress];
      if (IMStringIsEmail())
      {
        double v10 = [(CKConversationListCell *)self conversation];
        double v11 = [v10 chat];
        double v12 = [v11 account];
        double v13 = [v12 serviceName];
        int v14 = [v13 isEqualToString:*MEMORY[0x1E4F6E1B8]];

        if (!v14) {
          return 1;
        }
      }
      else
      {
      }
    }
  }
  return 0;
}

- (void)updateAccessoryIndicatorsForCurrentState
{
  v2 = self;
  CKConversationListStandardCell.updateAccessoryIndicatorsForCurrentState()();
}

- (void)_updateAvatarView
{
  v30[5] = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[CKUIBehavior sharedBehaviors];
  if ([v3 canShowContactPhotosInConversationList])
  {
    int v4 = +[CKUIBehavior sharedBehaviors];
    int v5 = [v4 contactPhotosEnabled];

    if (v5)
    {
      if (!self->_avatarView)
      {
        double v6 = *MEMORY[0x1E4F1DB28];
        double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        id v8 = +[CKUIBehavior sharedBehaviors];
        [v8 conversationListContactImageDiameter];
        double v10 = v9;

        double v11 = -[CKAvatarView initWithFrame:]([CKAvatarView alloc], "initWithFrame:", v6, v7, v10, v10);
        avatarView = self->_avatarView;
        self->_avatarView = v11;

        [(CNAvatarView *)self->_avatarView setAsynchronousRendering:1];
        [(CKAvatarView *)self->_avatarView setUserInteractionEnabled:0];
        [(CNAvatarView *)self->_avatarView setShowsContactOnTap:0];
        [(CNAvatarView *)self->_avatarView setDelegate:self];
        [(CNAvatarView *)self->_avatarView setBypassActionValidation:1];
        double v13 = [(CKConversationListStandardCell *)self contentView];
        [v13 addSubview:self->_avatarView];
      }
      int v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      if ([v14 avatarViewAllowsStaleRendering])
      {
        BOOL v15 = [(CNAvatarView *)self->_avatarView isDisplayingContent];

        if (v15) {
          [(CNAvatarView *)self->_avatarView setAllowStaleRendering:1];
        }
      }
      else
      {
      }
      BOOL v17 = [(CKConversationListCell *)self conversation];
      BOOL v18 = [v17 chat];
      BOOL v19 = [v18 chatIdentifier];
      [(CKAvatarView *)self->_avatarView _ck_setContextToken:v19];

      uint64_t v20 = [MEMORY[0x1E4F1BB38] maxContactAvatars];
      double v21 = [v17 conversationVisualIdentityWithKeys:MEMORY[0x1E4F1CBF0] requestedNumberOfContactsToFetch:v20];
      id v22 = [(CNAvatarView *)self->_avatarView updateViewWithGroupIdentity:v21];
      if ([v17 recipientCount] == 1)
      {
        [(CNAvatarView *)self->_avatarView setName:0];
        v23 = self->_avatarView;
        uint64_t v24 = *MEMORY[0x1E4F1BAF8];
        v30[0] = *MEMORY[0x1E4F1BAF0];
        v30[1] = v24;
        uint64_t v25 = *MEMORY[0x1E4F1BB00];
        v30[2] = *MEMORY[0x1E4F1BB08];
        v30[3] = v25;
        v30[4] = *MEMORY[0x1E4F1BAE8];
        double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
        [(CNAvatarView *)v23 setActionCategories:v26];
      }
      else
      {
        if ([v17 hasDisplayName]) {
          [v17 displayName];
        }
        else {
        double v26 = [v17 name];
        }
        [(CNAvatarView *)self->_avatarView setName:v26];
        double v27 = self->_avatarView;
        uint64_t v29 = *MEMORY[0x1E4F1BAF8];
        double v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
        [(CNAvatarView *)v27 setActionCategories:v28];
      }
      -[CNAvatarView setStyle:](self->_avatarView, "setStyle:", [v17 shouldHaveRoundRectAvatar]);
      [(CKConversationListStandardCell *)self setNeedsLayout];

      return;
    }
  }
  else
  {
  }
  [(CKAvatarView *)self->_avatarView removeFromSuperview];
  double v16 = self->_avatarView;
  self->_avatarView = 0;
}

- (void)updateFromLabelWithText:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversationListCell *)self fromLabel];
  [v5 setText:v4];
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CKConversationListCell *)self isMuted];
  v6.receiver = self;
  v6.super_class = (Class)CKConversationListStandardCell;
  [(CKConversationListCell *)&v6 setMuted:v3];
  if (v5 != v3) {
    [(CKConversationListStandardCell *)self setNeedsLayout];
  }
}

- (void)_configureSummaryLabelAppearanceForConversation:(id)a3
{
  id v7 = a3;
  if ([(CKConversationListStandardCell *)self _shouldShowDownloadingPendingMessages])
  {
    [(CKConversationListStandardCell *)self setShowDownloadingPendingMessages:1];
  }
  else
  {
    if (![(CKConversationListStandardCell *)self _shouldShowTypingIndicatorForConversation:v7])
    {
      [(CKConversationListStandardCell *)self _stopTypingIndicator];
      [(CKConversationListStandardCell *)self _removeDownloadingPendingMessagesView];
      if ([v7 isPlaceholder]
        && ![(CKConversationListCell *)self shouldAppearAsRecoverableConversation])
      {
        objc_super v6 = [(CKConversationListCell *)self summaryLabel];
        [v6 removeFromSuperview];
      }
      else
      {
        id v4 = [(CKConversationListStandardCell *)self contentView];
        BOOL v5 = [(CKConversationListCell *)self summaryLabel];
        [v4 addSubview:v5];
      }
      goto LABEL_10;
    }
    [(CKConversationListStandardCell *)self setShowTypingIndicator:1];
  }
  [(CKConversationListStandardCell *)self setNeedsLayout];
LABEL_10:
}

- (BOOL)_shouldShowTypingIndicatorForConversation:(id)a3
{
  id v4 = a3;
  BOOL v5 = ![(CKConversationListCell *)self shouldAppearAsRecoverableConversation]
    && ([v4 isPlaceholder] & 1) == 0
    && [(CKConversationListCell *)self lastMessageIsTypingIndicator];

  return v5;
}

- (BOOL)_shouldShowDownloadingPendingMessages
{
  v2 = [(CKConversationListCell *)self conversation];
  BOOL v3 = [v2 chat];
  char v4 = [v3 isDownloadingPendingSatelliteMessages];

  BOOL v5 = [MEMORY[0x1E4F6BC48] sharedInstance];
  LOBYTE(v3) = [v5 isSatelliteConnectionActive] & v4;

  return (char)v3;
}

- (void)_removeDownloadingPendingMessagesView
{
  [(CKConversationListStandardCell *)self setShowDownloadingPendingMessages:0];
  BOOL v3 = [(CKConversationListCell *)self downloadingPendingMessagesView];
  [v3 removeFromSuperview];

  [(CKConversationListCell *)self setDownloadingPendingMessagesView:0];
}

- (void)setShowDownloadingPendingMessages:(BOOL)a3
{
  self->_showDownloadingPendingMessages = a3;
}

- (void)_stopTypingIndicator
{
  [(CKConversationListStandardCell *)self setShowTypingIndicator:0];
  BOOL v3 = [(CKConversationListCell *)self typingIndicatorView];

  if (v3)
  {
    char v4 = [(CKConversationListCell *)self typingIndicatorView];
    [v4 stopAnimation];

    BOOL v5 = [(CKConversationListCell *)self typingIndicatorView];
    [v5 removeFromSuperview];

    [(CKConversationListCell *)self setTypingIndicatorView:0];
  }
}

- (void)_updateTypingIndicatorFrame:(BOOL)a3 isCollapsed:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(CKConversationListCell *)self typingIndicatorView];

  if (v7)
  {
    id v8 = [(CKConversationListCell *)self typingIndicatorView];
    if (!v8) {
      goto LABEL_13;
    }
  }
  else
  {
    id v8 = [(CKConversationListCell *)self downloadingPendingMessagesView];
    if (!v8) {
      goto LABEL_13;
    }
  }
  id v26 = v8;
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v13 = [(CKConversationListCell *)self fromLabel];
  [v13 frame];
  if (v5)
  {
    double v18 = v14 + -5.0;

    BOOL v19 = [(CKConversationListCell *)self fromLabel];
    [v19 frame];
    double MaxY = CGRectGetMaxY(v28) + 2.0;
  }
  else
  {
    double v18 = CGRectGetMaxX(*(CGRect *)&v14) - v10 + 5.0;

    BOOL v19 = [(CKConversationListCell *)self fromLabel];
    [v19 frame];
    double MaxY = CGRectGetMaxY(v29);
  }

  double v21 = [(CKConversationListCell *)self typingIndicatorView];

  if (v21)
  {
    id v22 = [(CKConversationListCell *)self typingIndicatorView];
    [v22 setFlipForRTLLayout:!v5];

    v23 = [(CKConversationListCell *)self typingIndicatorView];
    [v23 setHidden:v4];
  }
  uint64_t v24 = [(CKConversationListCell *)self downloadingPendingMessagesView];

  if (v24)
  {
    uint64_t v25 = [(CKConversationListCell *)self downloadingPendingMessagesView];
    [v25 updateForLayoutDirectionWithScale:0.8];
  }
  objc_msgSend(v26, "setFrame:", v18, MaxY, v10, v12);
  id v8 = v26;
LABEL_13:
}

- (void)setShowTypingIndicator:(BOOL)a3
{
  self->_showTypingIndicator = a3;
}

- (void)updateUnreadIndicatorWithImage:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = [(CKConversationListStandardCell *)self _shouldHideUnreadIndicatorForEditing:[(CKConversationListStandardCell *)self isEditing]];
  if (v6)
  {
    BOOL v8 = v7;
    double v9 = [(UIImageView *)self->_unreadIndicatorImageView superview];

    if (!v9) {
      [(CKConversationListStandardCell *)self addSubview:self->_unreadIndicatorImageView];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__CKConversationListStandardCell_updateUnreadIndicatorWithImage_animated___block_invoke;
    aBlock[3] = &unk_1E5623DE8;
    aBlock[4] = self;
    BOOL v16 = v8;
    id v15 = v6;
    double v10 = (void (**)(void))_Block_copy(aBlock);

    if (a4)
    {
      double v11 = 0;
LABEL_7:
      [MEMORY[0x1E4F42FF0] animateWithDuration:v10 animations:v11 completion:0.300000012];
LABEL_11:

      goto LABEL_12;
    }
    v10[2](v10);
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__CKConversationListStandardCell_updateUnreadIndicatorWithImage_animated___block_invoke_2;
    v13[3] = &unk_1E5620C40;
    v13[4] = self;
    double v10 = (void (**)(void))_Block_copy(v13);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__CKConversationListStandardCell_updateUnreadIndicatorWithImage_animated___block_invoke_3;
    v12[3] = &unk_1E5620BF0;
    v12[4] = self;
    double v11 = _Block_copy(v12);
    if (a4) {
      goto LABEL_7;
    }
    v10[2](v10);
    if (v11)
    {
      (*((void (**)(void *, uint64_t))v11 + 2))(v11, 1);
      goto LABEL_11;
    }
  }
LABEL_12:
}

uint64_t __74__CKConversationListStandardCell_updateUnreadIndicatorWithImage_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1176) removeFromSuperview];
}

uint64_t __74__CKConversationListStandardCell_updateUnreadIndicatorWithImage_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1176) setAlpha:0.0];
}

- (void)updateUnreadIndicatorWithImage:(id)a3
{
}

- (void)updateForEditing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CKConversationListStandardCell;
  -[CKConversationListCell updateForEditing:](&v5, sel_updateForEditing_);
  [(UIImageView *)self->_unreadIndicatorImageView setAlpha:(double)([(CKConversationListStandardCell *)self _shouldHideUnreadIndicatorForEditing:v3] ^ 1)];
}

- (BOOL)_shouldHideUnreadIndicatorForEditing:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  objc_super v5 = [(CKConversationListCell *)self conversation];
  LOBYTE(v4) = [(CKConversationListCell *)v4 shouldAlwaysHideUnreadIndicatorForConversation:v5];

  if (v4)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    BOOL v7 = +[CKUIBehavior sharedBehaviors];
    BOOL v6 = [v7 hidesUnreadIndicatorWhenEditing] & v3;
  }
  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKConversationListStandardCell;
  [(CKConversationListStandardCell *)&v5 traitCollectionDidChange:a3];
  BOOL v4 = [(CKConversationListCell *)self typingIndicatorView];

  if (v4) {
    [(CKConversationListStandardCell *)self _resetTypingIndicator];
  }
}

- (CGRect)_calculateIndicatorFrameForSize:(CGSize)a3 trailing:(BOOL)a4 displayScale:(double)a5 insets:(UIEdgeInsets)a6
{
  double right = a6.right;
  double left = a6.left;
  BOOL v7 = a4;
  double height = a3.height;
  double width = a3.width;
  [(CKConversationListStandardCell *)self safeAreaInsets];
  double v37 = v11;
  double v38 = v12;
  double v13 = +[CKUIBehavior sharedBehaviors];
  [v13 conversationListCellLeftMargin];
  double v15 = v14;

  [(CKConversationListCell *)self containerBounds];
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = objc_opt_class();
  double v21 = [(CKConversationListStandardCell *)self traitCollection];
  [v21 displayScale];
  objc_msgSend(v20, "cellHeightForDisplayScale:");
  double v23 = v22;

  if (CKMainScreenScale_once_48 != -1) {
    dispatch_once(&CKMainScreenScale_once_48, &__block_literal_global_121);
  }
  if (*(double *)&CKMainScreenScale_sMainScreenScale_48 == 0.0) {
    double v24 = 1.0;
  }
  else {
    double v24 = *(double *)&CKMainScreenScale_sMainScreenScale_48;
  }
  double v25 = width * v24;
  double v26 = v17 * v24 + floor((v15 * v24 - width * v24) * 0.5);
  double v27 = 1.0 / v24;
  double v28 = 1.0 / v24 * v26;
  double v29 = v25 * (1.0 / v24);
  if (v7)
  {
    double v30 = [(CKConversationListStandardCell *)self contentView];
    [v30 bounds];
    double v32 = left + v31 - v28 - v29 - v38;
  }
  else
  {
    double v32 = right + v37 + v28;
  }
  double v33 = round(v32 * a5) / a5;
  double v34 = round(v27 * (v19 * v24 + floor((v23 * v24 - height * v24) * 0.5)) * a5) / a5;
  double v35 = round(v29 * a5) / a5;
  double v36 = round(height * v24 * v27 * a5) / a5;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (CGRect)_calculateIndicatorViewRectVerticallyCenteredWithFirstTextLineOfLabel:(id)a3 horizontallyAlignedWithColumn:(CGRect)a4 wantsCenteringColumnAlignment:(BOOL)a5 size:(CGSize)a6 offset:(CGPoint)a7
{
  double height = a6.height;
  double y = a7.y;
  double x = a7.x;
  double width = a6.width;
  BOOL v9 = a5;
  double v10 = a4.size.width;
  double v11 = a4.origin.x;
  id v13 = a3;
  [v13 frame];
  double v39 = v14;
  double v16 = v15;
  [v13 _capOffsetFromBoundsTop];
  double v18 = v17;
  [v13 _firstLineBaselineOffsetFromBoundsTop];
  double v38 = v19;

  if (CKMainScreenScale_once_48 != -1) {
    dispatch_once(&CKMainScreenScale_once_48, &__block_literal_global_121);
  }
  if (*(double *)&CKMainScreenScale_sMainScreenScale_48 == 0.0) {
    double v20 = 1.0;
  }
  else {
    double v20 = *(double *)&CKMainScreenScale_sMainScreenScale_48;
  }
  double v21 = width * v20;
  double v22 = v11 * v20 + floor((v10 * v20 - width * v20) * 0.5);
  double v23 = 1.0 / v20;
  double v24 = x + 1.0 / v20 * v22;
  if (v9)
  {
    double v25 = [(CKConversationListStandardCell *)self contentView];
    uint64_t v26 = [v25 effectiveUserInterfaceLayoutDirection];

    double v27 = [(CKConversationListStandardCell *)self indicatorContainerView];
    objc_msgSend(v27, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v29 = v28;

    double v30 = [(CKConversationListStandardCell *)self indicatorContainerView];
    [v30 xOriginForCenteringWithTrailingSlot];
    double v32 = v29 - v31;

    double v33 = -v32;
    if (v26 == 1) {
      double v33 = v32;
    }
    double v24 = v24 + v33;
  }
  double v34 = v21 * v23;
  double v35 = height * v20 * v23;
  double v36 = y + v23 * ((v18 + v39) * v20 + floor(((v16 - (v18 + v16 - v38)) * v20 - height * v20) * 0.5));
  double v37 = v24;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.double y = v36;
  result.origin.double x = v37;
  return result;
}

- (void)_calculateLayoutFrames
{
  BOOL v4 = [(CKConversationListCell *)self cellLayout];
  if (!v4)
  {
    v183 = [MEMORY[0x1E4F28B00] currentHandler];
    double v184 = (objc_class *)objc_opt_class();
    double v185 = NSStringFromClass(v184);
    [v183 handleFailureInMethod:a2, self, @"CKConversationListStandardCell.m", 685, @"%@ needs a cell layout.", v185 object file lineNumber description];
  }
  objc_super v5 = [(CKConversationListStandardCell *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;

  BOOL v8 = [(CKConversationListCell *)self fromLabel];
  BOOL v9 = [v8 attributedText];
  v215 = (void *)[v9 copy];

  double v10 = [(CKConversationListCell *)self summaryLabel];
  double v11 = [v10 attributedText];
  v214 = (void *)[v11 copy];

  double v12 = [(CKConversationListCell *)self dateLabel];
  id v13 = [v12 date];
  uint64_t v213 = [v13 copy];

  double v14 = [(CKConversationListCell *)self dateLabel];
  double v15 = [v14 text];
  uint64_t v211 = [v15 copy];

  unsigned int v16 = [(CKConversationListStandardCell *)self _shouldReverseLayoutDirection];
  LODWORD(v8) = [(CKConversationListCell *)self shouldAppearAsRecoverableConversation];
  double v17 = [(CKConversationListCell *)self fromLabel];
  id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v19 = MEMORY[0x1E4F1CC08];
  double v20 = (void *)[v18 initWithString:@"A" attributes:MEMORY[0x1E4F1CC08]];
  [v17 setAttributedText:v20];

  double v21 = [(CKConversationListCell *)self summaryLabel];
  double v22 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"A\nA" attributes:v19];
  [v21 setAttributedText:v22];

  double v23 = [(CKConversationListCell *)self dateLabel];
  double v24 = v23;
  int v210 = (int)v8;
  if (v8)
  {
    [v23 setTextForOverride:@"A"];
  }
  else
  {
    double v25 = [MEMORY[0x1E4F1C9C8] date];
    [v24 setDate:v25];
  }
  BOOL v26 = [(CKConversationListCell *)self showingEditControl];
  double v27 = [(CKConversationListStandardCell *)self contentView];
  [v27 bounds];
  CGFloat v29 = v28;
  double v30 = *MEMORY[0x1E4F1DB30];
  double v31 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  -[CKConversationListCell sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v31);
  CGFloat v33 = v32;

  remainder.origin.double x = 0.0;
  remainder.origin.double y = 0.0;
  remainder.size.double width = v29;
  remainder.size.double height = v33;
  double v34 = (double *)MEMORY[0x1E4F1DB28];
  CGSize v222 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  CGPoint v224 = (CGPoint)*MEMORY[0x1E4F1DB28];
  slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  slice.size = v222;
  if (v16) {
    CGRectEdge v35 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v35 = CGRectMinXEdge;
  }
  if (v16) {
    CGRectEdge v36 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v36 = CGRectMaxXEdge;
  }
  +[CKConversationListStandardCell leadingLayoutMargin];
  CGFloat v38 = v37;
  double v39 = [(CKConversationListCell *)self delegate];
  [v39 widthForDeterminingAvatarVisibility];
  double v41 = v40;

  double v208 = v41;
  BOOL v42 = [(CKConversationListStandardCell *)self _shouldShowAvatarForWidth:v41];
  v234.origin.double x = 0.0;
  v234.origin.double y = 0.0;
  double v209 = v29;
  v234.size.double width = v29;
  v234.size.double height = v33;
  CGRectDivide(v234, &slice, &remainder, v38, v35);
  if (CKIsRunningInMacCatalyst())
  {
    double v43 = +[CKUIBehavior sharedBehaviors];
    [v43 conversationListCellRightMargin];
    double v45 = v44;
  }
  else
  {
    [(CKConversationListStandardCell *)self layoutMargins];
    double v45 = v46;
  }
  [v4 setTrailingLayoutMarginSize:v45];
  CGRectDivide(remainder, &slice, &remainder, v45, v36);
  double v47 = *v34;
  double v48 = v34[1];
  double v49 = v34[2];
  double v221 = v34[3];
  avatarView = self->_avatarView;
  double v220 = *v34;
  if (v42)
  {
    if (avatarView
      || ([(CKConversationListStandardCell *)self _updateAvatarView],
          double v216 = v221,
          double v217 = v48,
          double v51 = v49,
          double v52 = v47,
          self->_avatarView))
    {
      v53 = +[CKUIBehavior sharedBehaviors];
      [v53 conversationListContactImageDiameter];
      CGFloat v55 = v54;

      v231.origin = v224;
      v231.size = v222;
      CGRectDivide(remainder, &v231, &remainder, v55, v35);
      double v52 = round(v7 * CGRectGetMinX(v231)) / v7;
      double v217 = round(v7 * floor(CGRectGetMidY(v231) + v55 * -0.5)) / v7;
      double v56 = v31;
      double v57 = v30;
      double v58 = round(v7 * v55) / v7;
      v59 = +[CKUIBehavior sharedBehaviors];
      [v59 conversationListContactImageTrailingSpace];
      CGFloat v61 = v60;

      CGRectDivide(remainder, &slice, &remainder, v61, v35);
      double v216 = v58;
      double v51 = v58;
      double v30 = v57;
      double v31 = v56;
    }
  }
  else
  {
    [(CKAvatarView *)avatarView frame];
    double v52 = v62;
    double v216 = v64;
    double v217 = v63;
  }
  double x = remainder.origin.x;
  double v206 = v51;
  double width = remainder.size.width;
  double y = remainder.origin.y;
  double height = remainder.size.height;
  CGRect v231 = remainder;
  CGRect v230 = remainder;
  double v65 = +[CKUIBehavior sharedBehaviors];
  double v218 = v49;
  double v219 = v48;
  double v207 = v52;
  if (([v65 showsConversationListCellChevronImage] & 1) == 0)
  {

    uint64_t v67 = 0;
    v229.origin = v224;
    v229.size = v222;
    goto LABEL_24;
  }
  int v66 = [v4 shouldShowChevron];

  v229.origin = v224;
  v229.size = v222;
  if ((v66 ^ 1 | v26))
  {
    uint64_t v67 = 0;
LABEL_24:
    double v186 = v30;
    double v187 = v31;
    goto LABEL_26;
  }
  v68 = [(CKConversationListCell *)self chevronImageView];
  double v69 = [v68 image];
  [v69 size];
  CGFloat v71 = v70;
  double v187 = v72;

  CGRectDivide(v230, &v229, &v230, v71, v36);
  CGRectDivide(v230, &slice, &v230, 10.0, v36);
  double v186 = v71;
  CGRectDivide(v231, &v229, &v231, v71, v36);
  CGRectDivide(v231, &slice, &v231, 10.0, v36);
  uint64_t v67 = 1;
LABEL_26:
  double v73 = [(CKConversationListCell *)self dateLabel];
  [v73 sizeToFit];

  double v74 = [(CKConversationListCell *)self dateLabel];
  [v74 frame];
  CGFloat v76 = v75;
  double v78 = v77;

  v228.origin = v224;
  v228.size = v222;
  CGRectDivide(v230, &v228, &v230, v76, v36);
  v227.origin = v224;
  v227.size = v222;
  double v79 = +[CKUIBehavior sharedBehaviors];
  [v79 conversationListSenderToDateHorizontalPadding];
  CGRectDivide(v230, &slice, &v227, v80, v36);

  double v81 = [(CKConversationListCell *)self fromLabel];
  objc_msgSend(v81, "sizeThatFits:", v227.size.width, 300.0);
  double v83 = v82;

  double MinX = CGRectGetMinX(v227);
  double MinY = CGRectGetMinY(v227);
  double v86 = round(v7 * CGRectGetWidth(v227)) / v7;
  double v87 = [(CKConversationListCell *)self fromLabel];
  objc_msgSend(v87, "setFrame:", round(v7 * MinX) / v7, round(v7 * MinY) / v7, v86, round(v7 * v83) / v7);

  double v88 = +[CKUIBehavior sharedBehaviors];
  [v88 topConversationListSpace];
  double v90 = round(v7 * v89) / v7;

  double v91 = [(CKConversationListCell *)self fromLabel];
  [v91 _setFirstLineCapFrameOriginY:v90];

  v92 = [(CKConversationListCell *)self fromLabel];
  [v92 frame];
  double v200 = v94;
  double v201 = v93;
  double v198 = v96;
  double v199 = v95;

  double v97 = round(v7 * v228.origin.x) / v7;
  double v98 = round(v7 * v228.origin.y) / v7;
  double v99 = round(v7 * v228.size.width) / v7;
  double v100 = [(CKConversationListCell *)self dateLabel];
  objc_msgSend(v100, "setFrame:", v97, v98, v99, round(v7 * v78) / v7);

  v101 = [(CKConversationListCell *)self fromLabel];
  [v101 _firstLineBaselineFrameOriginY];
  double v103 = v102;

  v104 = [(CKConversationListCell *)self dateLabel];
  [v104 _setFirstLineBaselineFrameOriginY:v103];

  double v105 = [(CKConversationListCell *)self dateLabel];
  [v105 frame];
  double v196 = v107;
  double v197 = v106;
  double v194 = v109;
  double v195 = v108;

  double v110 = [(CKConversationListStandardCell *)self indicatorContainerView];
  objc_msgSend(v110, "sizeThatFits:", v30, v31);
  CGFloat v112 = v111;

  v226.origin = v224;
  v226.size = v222;
  if (v67)
  {
    CGRect v226 = v229;
  }
  else
  {
    CGRectDivide(v231, &v226, &v231, v112, v36);
    double v113 = +[CKUIBehavior sharedBehaviors];
    [v113 conversationListAccessoryIndicatorToSummaryLabelPadding];
    CGFloat v115 = v114;

    CGRectDivide(v231, &slice, &v231, v115, v36);
  }
  id v116 = +[CKUIBehavior sharedBehaviors];
  [v116 senderSummaryConversationListSpace];
  double v118 = v117;

  v119 = +[CKUIBehavior sharedBehaviors];
  v120 = [v119 conversationListSenderFont];
  [v120 _scaledValueForValue:1 useLanguageAwareScaling:v118];
  double v122 = v121;

  double v123 = round(v7 * (v103 + v122)) / v7;
  -[CKConversationListStandardCell _calculateSummaryLabelFrameForColumn:summaryLabelCapFrameYOrigin:displayScale:](self, "_calculateSummaryLabelFrameForColumn:summaryLabelCapFrameYOrigin:displayScale:", v231.origin.x, v231.origin.y, v231.size.width, v231.size.height, v123, v7);
  double v225 = v124;
  double v223 = v125;
  double v192 = v127;
  double v193 = v126;
  LODWORD(v119) = [(CKConversationListStandardCell *)self _isCollapsed];
  double v128 = [(CKConversationListStandardCell *)self indicatorContainerView];
  objc_msgSend(v128, "sizeThatFits:", v30, v31);
  double v130 = v129;
  double v132 = v131;

  double v133 = (double *)MEMORY[0x1E4F437F8];
  if (v119)
  {
    if (v16)
    {
      double v134 = *MEMORY[0x1E4F437F8];
      double v135 = *(double *)(MEMORY[0x1E4F437F8] + 8);
      double v136 = *(double *)(MEMORY[0x1E4F437F8] + 16);
      double v137 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    }
    else
    {
      double v135 = 1.0;
      double v137 = 0.0;
      double v136 = 0.0;
      double v134 = 0.0;
    }
    v144 = (void *)v211;
    -[CKConversationListStandardCell _calculateIndicatorFrameForSize:trailing:displayScale:insets:](self, "_calculateIndicatorFrameForSize:trailing:displayScale:insets:", v16 ^ 1, v130, v132, v7, v134, v135, v136, v137);
    double v190 = v146;
    double v191 = v145;
    double v188 = v148;
    double v189 = v147;
  }
  else
  {
    id v138 = [(CKConversationListCell *)self summaryLabel];
    if (CKMainScreenScale_once_48 != -1) {
      dispatch_once(&CKMainScreenScale_once_48, &__block_literal_global_121);
    }
    double v139 = *(double *)&CKMainScreenScale_sMainScreenScale_48;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_48 == 0.0) {
      double v139 = 1.0;
    }
    -[CKConversationListStandardCell _calculateIndicatorViewRectVerticallyCenteredWithFirstTextLineOfLabel:horizontallyAlignedWithColumn:wantsCenteringColumnAlignment:size:offset:](self, "_calculateIndicatorViewRectVerticallyCenteredWithFirstTextLineOfLabel:horizontallyAlignedWithColumn:wantsCenteringColumnAlignment:size:offset:", v138, v67, v226.origin.x, v226.origin.y, v226.size.width, v226.size.height, v130, v132, 0.0, floor(v139) / v139);
    double v190 = v141;
    double v191 = v140;
    double v188 = v143;
    double v189 = v142;

    v144 = (void *)v211;
  }
  double v149 = v123;
  -[CKConversationListStandardCell _calculateSummaryLabelFrameForColumn:summaryLabelCapFrameYOrigin:displayScale:](self, "_calculateSummaryLabelFrameForColumn:summaryLabelCapFrameYOrigin:displayScale:", x, y, width, height, v123, v7);
  double v151 = v150;
  double v153 = v152;
  double v212 = v154;
  double v156 = v155;
  v157 = +[CKUIBehavior sharedBehaviors];
  int v158 = [v157 showsConversationListCellChevronImage];

  if (v158)
  {
    double v159 = [(CKConversationListCell *)self dateLabel];
    if (CKMainScreenScale_once_48 != -1) {
      dispatch_once(&CKMainScreenScale_once_48, &__block_literal_global_121);
    }
    double v160 = *(double *)&CKMainScreenScale_sMainScreenScale_48;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_48 == 0.0) {
      double v160 = 1.0;
    }
    -[CKConversationListStandardCell _calculateRectVerticallyCenteredWithFirstTextLineOfLabel:horizontallyCenteredInColumn:size:offset:](self, "_calculateRectVerticallyCenteredWithFirstTextLineOfLabel:horizontallyCenteredInColumn:size:offset:", v159, v229.origin.x, v229.origin.y, v229.size.width, v229.size.height, v186, v187, 0.0, floor(v160 * 0.5) / v160);
    double v219 = v162;
    double v220 = v161;
    double v218 = v163;
    double v221 = v164;
  }
  v165 = +[CKUIBehavior sharedBehaviors];
  [v165 unreadIndicatorImageViewSize];
  double v167 = v166;
  double v169 = v168;

  -[CKConversationListStandardCell _calculateIndicatorFrameForSize:trailing:displayScale:insets:](self, "_calculateIndicatorFrameForSize:trailing:displayScale:insets:", v16, v167, v169, v7, *v133, v133[1], v133[2], v133[3]);
  double v171 = v170;
  double v173 = v172;
  double v175 = v174;
  double v177 = v176;
  [v4 setShouldShowAvatarView:v42];
  objc_msgSend(v4, "setAvatarFrame:", v207, v217, v206, v216);
  [v4 setSummaryLabelCapFrameYOrigin:v149];
  objc_msgSend(v4, "setSummaryFrameIfAccessoryIndicatorHidden:", v151, v153, v212, v156);
  objc_msgSend(v4, "setSummaryFrameIfAccessoryIndicatorVisible:", v225, v223, v193, v192);
  objc_msgSend(v4, "setSenderFrame:", v201, v200, v199, v198);
  objc_msgSend(v4, "setDateFrame:", v197, v196, v195, v194);
  objc_msgSend(v4, "setIndicatorContainerFrame:", v191, v190, v189, v188);
  objc_msgSend(v4, "setChevronFrame:", v220, v219, v218, v221);
  objc_msgSend(v4, "setUnreadFrame:", v171, v173, v175, v177);
  [v4 markAsValidForContentViewWidth:v26 widthForDeterminingAvatarVisibility:v209 showingEditControl:v208];
  v178 = [(CKConversationListCell *)self fromLabel];
  [v178 setAttributedText:v215];

  double v179 = [(CKConversationListCell *)self summaryLabel];
  [v179 setAttributedText:v214];

  double v180 = [(CKConversationListCell *)self dateLabel];
  v181 = v180;
  if (v210)
  {
    [v180 setTextForOverride:v144];
    v182 = (void *)v213;
  }
  else
  {
    v182 = (void *)v213;
    [v180 setDate:v213];
  }
}

- (CKConversationListStandardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)CKConversationListStandardCell;
  BOOL v4 = [(CKConversationListCell *)&v24 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    objc_super v5 = +[CKUIBehavior sharedBehaviors];
    [v5 unreadIndicatorImageViewSize];
    double v7 = v6;
    double v9 = v8;

    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", 0.0, 0.0, v7, v9);
    unreadIndicatorImageView = v4->_unreadIndicatorImageView;
    v4->_unreadIndicatorImageView = (UIImageView *)v10;

    [(UIImageView *)v4->_unreadIndicatorImageView setAccessibilityIdentifier:@"UnreadIndicatorImageView"];
    double v12 = objc_alloc_init(_TtC7ChatKit32CKConversationListIndicatorsView);
    id v13 = [(CKConversationListStandardCell *)v4 contentView];
    [v13 addSubview:v12];

    indicatorContainerView = v4->_indicatorContainerView;
    v4->_indicatorContainerView = v12;
    double v15 = v12;

    LODWORD(indicatorContainerView) = [(CKConversationListStandardCell *)v4 _shouldReverseLayoutDirection];
    unsigned int v16 = [(CKConversationListCell *)v4 dateLabel];
    double v17 = v16;
    if (indicatorContainerView) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = 2;
    }
    [v16 setTextAlignment:v18];

    uint64_t v19 = [(CKConversationListCell *)v4 dateLabel];
    double v20 = +[CKUIBehavior sharedBehaviors];

    double v21 = [v20 theme];
    double v22 = [v21 conversationListDateColor];
    [v19 setTextColor:v22];

    [(CKConversationListStandardCell *)v4 registerForEvents];
  }
  return v4;
}

- (void)registerForEvents
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_updateTypingIndicatorIfNeeded name:*MEMORY[0x1E4F43708] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_updateAccessoryIndicatorsForCurrentState name:*MEMORY[0x1E4F6BAA8] object:0];
}

- (CGRect)_calculateSummaryLabelFrameForColumn:(CGRect)a3 summaryLabelCapFrameYOrigin:(double)a4 displayScale:(double)a5
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v11 = [(CKConversationListCell *)self summaryLabel];
  objc_msgSend(v11, "sizeThatFits:", width, 600.0);
  double v13 = v12;

  double v14 = [(CKConversationListCell *)self summaryLabel];
  [v14 _setFirstLineCapFrameOriginY:a4];

  double v15 = round(x * a5) / a5;
  double v16 = round(y * a5) / a5;
  double v17 = round(width * a5) / a5;
  double v18 = round((v13 + 5.0) * a5) / a5;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (BOOL)_shouldShowAvatarForWidth:(double)a3
{
  if ([(CKConversationListCell *)self shouldAlwaysHideAvatar]) {
    return 0;
  }
  objc_super v5 = +[CKUIBehavior sharedBehaviors];
  char v6 = [v5 shouldShowAvatarForWidth:a3];

  return v6;
}

- (CGRect)_calculateRectVerticallyCenteredWithFirstTextLineOfLabel:(id)a3 horizontallyCenteredInColumn:(CGRect)a4 size:(CGSize)a5 offset:(CGPoint)a6
{
  double height = a5.height;
  double width = a5.width;
  double v8 = a4.size.width;
  double x = a4.origin.x;
  id v10 = a3;
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  [v10 _capOffsetFromBoundsTop];
  double v16 = v15;
  [v10 _firstLineBaselineOffsetFromBoundsTop];
  double v18 = v17;

  if (CKMainScreenScale_once_48 != -1) {
    dispatch_once(&CKMainScreenScale_once_48, &__block_literal_global_121);
  }
  double v19 = *(double *)&CKMainScreenScale_sMainScreenScale_48;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_48 == 0.0) {
    double v19 = 1.0;
  }
  double v20 = height * v19;
  double v21 = 1.0 / v19;
  double v22 = 1.0 / v19 * (x * v19 + floor((v8 * v19 - width * v19) * 0.5));
  double v23 = 1.0 / v19 * ((v16 + v12) * v19 + floor(((v14 - (v16 + v14 - v18)) * v19 - height * v19) * 0.5));
  double v24 = width * v19 * (1.0 / v19);
  double v25 = v20 * v21;
  double v26 = a6.x + v22;
  double v27 = a6.y + v23;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

+ (double)leadingLayoutMargin
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 conversationListCellLeftMargin];
  double v4 = v3;

  return v4;
}

+ (id)identifierForConversation:(id)a3
{
  if ((unint64_t)[a3 recipientCount] <= 1) {
    return @"CKConversationListStandardCellIdentifier";
  }
  else {
    return @"CKConversationListStandardCellGroupIdentifier";
  }
}

- (void)dealloc
{
  double v3 = [(CKConversationListStandardCell *)self avatarView];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListStandardCell;
  [(CKConversationListCell *)&v4 dealloc];
}

- (void)prepareForReuse
{
  [(CKConversationListStandardCell *)self _stopTypingIndicator];
  [(CKConversationListStandardCell *)self _removeDownloadingPendingMessagesView];
  double v3 = [(CKConversationListStandardCell *)self avatarView];
  [v3 setAllowStaleRendering:0];

  objc_super v4 = [(CKConversationListStandardCell *)self indicatorContainerView];
  [v4 prepareForReuse];

  v5.receiver = self;
  v5.super_class = (Class)CKConversationListStandardCell;
  [(CKConversationListCell *)&v5 prepareForReuse];
}

- (void)updateContentsForConversation:(id)a3
{
}

- (void)updateTypingIndicatorIfNeeded
{
  double v3 = [(CKConversationListCell *)self typingIndicatorView];

  if (v3)
  {
    [(CKConversationListStandardCell *)self _resetTypingIndicator];
  }
}

- (void)_startTypingIndicator
{
  if (![(CKConversationListCell *)self shouldHidePreviewSummary])
  {
    double v3 = [(CKConversationListCell *)self typingIndicatorView];

    if (!v3)
    {
      objc_super v4 = objc_alloc_init(CKConversationListTypingIndicatorView);
      [(CKConversationListCell *)self setTypingIndicatorView:v4];

      objc_super v5 = [(CKConversationListCell *)self typingIndicatorView];
      if ([(CKConversationListStandardCell *)self isHighlighted]) {
        BOOL v6 = +[CKApplicationState isApplicationActive];
      }
      else {
        BOOL v6 = 0;
      }
      [v5 setHighlightedState:v6];

      if (CKIsRunningInMacCatalyst())
      {
        double v7 = [(CKConversationListCell *)self typingIndicatorView];
        [v7 setTypingIndicatorScale:1.0];
      }
      else
      {
        double v7 = +[CKUIBehavior sharedBehaviors];
        [v7 conversationListCellTypingIndicatorScale];
        double v9 = v8;
        id v10 = [(CKConversationListCell *)self typingIndicatorView];
        [v10 setTypingIndicatorScale:v9];
      }
    }
    double v11 = [(CKConversationListStandardCell *)self contentView];
    double v12 = [(CKConversationListCell *)self typingIndicatorView];
    [v11 addSubview:v12];

    double v13 = [(CKConversationListCell *)self typingIndicatorView];
    [v13 stopAnimation];

    double v14 = [(CKConversationListCell *)self typingIndicatorView];
    [v14 startPulseAnimation];

    id v15 = [(CKConversationListCell *)self summaryLabel];
    [v15 removeFromSuperview];
  }
}

- (void)_resetTypingIndicator
{
  [(CKConversationListStandardCell *)self setShowTypingIndicator:1];

  [(CKConversationListStandardCell *)self setNeedsLayout];
}

- (void)_setupDownloadingPendingMessagesView
{
  double v3 = [(CKConversationListCell *)self downloadingPendingMessagesView];

  if (!v3)
  {
    objc_super v4 = objc_alloc_init(CKDownloadingPendingMessagesView);
    [(CKConversationListCell *)self setDownloadingPendingMessagesView:v4];

    objc_super v5 = [(CKConversationListStandardCell *)self contentView];
    BOOL v6 = [(CKConversationListCell *)self downloadingPendingMessagesView];
    [v5 addSubview:v6];

    double v7 = [(CKConversationListCell *)self summaryLabel];
    [v7 removeFromSuperview];
  }
  double v8 = [(CKConversationListCell *)self conversation];
  double v9 = [v8 chat];
  uint64_t v10 = [v9 pendingIncomingSatelliteMessageCount];

  double v11 = [(CKConversationListCell *)self conversation];
  double v12 = [v11 chat];
  -[CKConversationListStandardCell setTotalSatelliteMessageCount:](self, "setTotalSatelliteMessageCount:", [v12 totalSatelliteMessageCount]);

  unint64_t v13 = [(CKConversationListStandardCell *)self totalSatelliteMessageCount] - v10 + 1;
  double v14 = NSString;
  id v15 = CKFrameworkBundle();
  double v16 = [v15 localizedStringForKey:@"NUMBER_OF_REMAINING_PENDING_MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];
  double v17 = objc_msgSend(v14, "localizedStringWithFormat:", v16, v13, -[CKConversationListStandardCell totalSatelliteMessageCount](self, "totalSatelliteMessageCount"));

  double v18 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v19 = [v18 userInterfaceLayoutDirection];

  if (v19 == 1) {
    double v20 = @"\u200F";
  }
  else {
    double v20 = @"\u200E";
  }
  id v23 = [(__CFString *)v20 stringByAppendingString:v17];

  double v21 = [(CKConversationListCell *)self downloadingPendingMessagesView];
  double v22 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v23];
  [v21 updateMessageCountWith:v22];
}

uint64_t __74__CKConversationListStandardCell_updateUnreadIndicatorWithImage_animated___block_invoke(uint64_t a1)
{
  double v2 = 0.0;
  if (!*(unsigned char *)(a1 + 48)) {
    double v2 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 1176) setAlpha:v2];
  uint64_t v3 = *(void *)(a1 + 40);
  objc_super v4 = *(void **)(*(void *)(a1 + 32) + 1176);

  return [v4 setImage:v3];
}

- (void)updateAccessoryIndicatorsColorForTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversationListStandardCell *)self indicatorContainerView];
  [v5 setTintColor:v4];
}

- (void)forceUnreadIndicatorVisibility:(BOOL)a3 forConversation:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  -[CKConversationListCell unreadIndicatorImageForVisibility:withMuteState:](self, "unreadIndicatorImageForVisibility:withMuteState:", a3, [a4 isMuted]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(CKConversationListStandardCell *)self updateUnreadIndicatorWithImage:v7 animated:v5];
}

- (void)increaseContrastDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)CKConversationListStandardCell;
  [(CKConversationListCell *)&v7 increaseContrastDidChange];
  uint64_t v3 = [(CKConversationListCell *)self dateLabel];
  id v4 = +[CKUIBehavior sharedBehaviors];
  BOOL v5 = [v4 theme];
  BOOL v6 = [v5 conversationListDateColor];
  [v3 setTextColor:v6];
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  return (id)[a3 presentingViewController];
}

- (id)avatarView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([a5 isEqualToString:*MEMORY[0x1E4F1BAF8]] && objc_msgSend(v7, "count"))
  {
    double v8 = [v7 firstObject];
    double v9 = [v8 contact];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v10 = [(CKConversationListCell *)self conversation];
    double v11 = [v10 recipients];

    uint64_t v42 = [v11 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v42)
    {
      uint64_t v12 = *(void *)v51;
      uint64_t v45 = *MEMORY[0x1E4F1ADC8];
      uint64_t v44 = *MEMORY[0x1E4F1AEE0];
      double v40 = v9;
      id v41 = v7;
      uint64_t v38 = *(void *)v51;
      double v39 = v11;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v51 != v12) {
            objc_enumerationMutation(v11);
          }
          uint64_t v43 = v13;
          double v14 = *(void **)(*((void *)&v50 + 1) + 8 * v13);
          id v15 = objc_msgSend(v14, "cnContactWithKeys:", MEMORY[0x1E4F1CBF0], v38);
          double v16 = [v15 identifier];
          double v17 = [v9 identifier];
          int v18 = [v16 isEqual:v17];

          if (v18)
          {
            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            id v19 = v7;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v54 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v47;
LABEL_11:
              uint64_t v23 = 0;
              while (1)
              {
                if (*(void *)v47 != v22) {
                  objc_enumerationMutation(v19);
                }
                double v24 = *(void **)(*((void *)&v46 + 1) + 8 * v23);
                double v25 = [v24 key];
                int v26 = [v25 isEqualToString:v45];

                if (v26)
                {
                  double v27 = [v24 value];
                }
                else
                {
                  double v28 = [v24 key];
                  int v29 = [v28 isEqualToString:v44];

                  if (v29)
                  {
                    double v30 = [v24 value];
                    double v27 = [v30 stringValue];
                  }
                  else
                  {
                    double v27 = 0;
                  }
                }
                double v31 = IMStripFormattingFromAddress();

                double v32 = [v14 rawAddress];
                CGFloat v33 = IMStripFormattingFromAddress();
                char v34 = MEMORY[0x192FBAF60](v31, v33);

                if (v34) {
                  break;
                }

                if (v21 == ++v23)
                {
                  uint64_t v21 = [v19 countByEnumeratingWithState:&v46 objects:v54 count:16];
                  if (v21) {
                    goto LABEL_11;
                  }
                  goto LABEL_22;
                }
              }
              id v35 = v24;

              double v9 = v40;
              id v7 = v41;
              uint64_t v12 = v38;
              double v11 = v39;
              if (!v35) {
                goto LABEL_24;
              }

              CGRectEdge v36 = [MEMORY[0x1E4F1CA48] arrayWithArray:v19];
              [v36 removeObject:v35];
              [v36 insertObject:v35 atIndex:0];
              double v11 = v35;
              goto LABEL_29;
            }
LABEL_22:

            double v9 = v40;
            id v7 = v41;
            uint64_t v12 = v38;
            double v11 = v39;
          }
LABEL_24:
          uint64_t v13 = v43 + 1;
        }
        while (v43 + 1 != v42);
        uint64_t v42 = [v11 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (v42) {
          continue;
        }
        break;
      }
    }
    CGRectEdge v36 = 0;
LABEL_29:
  }
  else
  {
    CGRectEdge v36 = 0;
  }

  return v36;
}

- (BOOL)avatarView:(id)a3 shouldShowContact:(id)a4
{
  id v5 = a3;
  BOOL v6 = [(CKConversationListCell *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [v5 presentingViewController];
    double v9 = [v8 presentedViewController];
    [v9 dismissViewControllerAnimated:1 completion:0];

    uint64_t v10 = [(CKConversationListCell *)self delegate];
    double v11 = [(CKConversationListCell *)self conversation];
    [v10 avatarHeaderWasTappedForConversation:v11 inCell:self];
  }
  return (v7 & 1) == 0;
}

- (id)contactsForPreviewInteractionForAvatarView:(id)a3 suggestedKeysToFetch:(id)a4
{
  id v4 = [(CKConversationListCell *)self conversation];
  id v5 = [v4 orderedContactsForAvatar3DTouchUIWithKeysToFetch:MEMORY[0x1E4F1CBF0]];

  return v5;
}

- (id)overrideImageDataForPreviewInteractionForAvatarView:(id)a3
{
  uint64_t v3 = [(CKConversationListCell *)self conversation];
  uint64_t v4 = [MEMORY[0x1E4F1BB38] maxContactAvatars];
  id v5 = [v3 conversationVisualIdentityWithKeys:MEMORY[0x1E4F1CBF0] requestedNumberOfContactsToFetch:v4];
  BOOL v6 = [v5 groupPhoto];

  return v6;
}

- (void)setAvatarView:(id)a3
{
}

- (UIImageView)unreadIndicatorImageView
{
  return self->_unreadIndicatorImageView;
}

- (void)setUnreadIndicatorImageView:(id)a3
{
}

- (void)setIndicatorContainerView:(id)a3
{
}

- (unint64_t)totalSatelliteMessageCount
{
  return self->_totalSatelliteMessageCount;
}

- (void)setTotalSatelliteMessageCount:(unint64_t)a3
{
  self->_totalSatelliteMessageCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorContainerView, 0);
  objc_storeStrong((id *)&self->_unreadIndicatorImageView, 0);

  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end