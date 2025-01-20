@interface MessageListCellHelper
- (BOOL)canShowReadLaterDate;
- (BOOL)disclosureEnabled;
- (BOOL)isCompact;
- (BOOL)isExpanded;
- (BOOL)isHighlighted;
- (BOOL)isInbox;
- (BOOL)isLocalMailboxSearchScope;
- (BOOL)isOutgoingMailbox;
- (BOOL)isSearchResult;
- (BOOL)isSelected;
- (BOOL)isVisible;
- (BOOL)senderSpecificCell;
- (BOOL)shouldAnnotateReplyOrForward;
- (BOOL)shouldDisplayUnreadAndVIP;
- (BOOL)shouldHideFollowUp;
- (BOOL)shouldShowHighImpact;
- (EFAutoCancelationToken)updateSummaryCancelationToken;
- (EFFuture)predictedMailbox;
- (EMCachingContactStore)contactStore;
- (EMCategory)category;
- (EMMessageListItem)messageListItem;
- (EMNSUserDefaultsBoolObserver)automaticallySummarizeMessages;
- (MUIBrandIndicatorProvider)brandIndicatorProvider;
- (MessageListCellHelper)initWithParentView:(id)a3 contentView:(id)a4 cellView:(id)a5 applicationProxy:(id)a6;
- (MessageListCellHelperApplicationProxy)applicationProxy;
- (MessageListCellViewable)cellView;
- (UIView)contentView;
- (UIView)parentView;
- (id)_cellViewModelForMessageListItem:(id)a3 style:(int64_t)a4 hintsBySnippetZone:(id)a5;
- (id)_generatedSummaryForUpdatingCellView:(id)a3;
- (id)_generatedSummaryString;
- (id)backgroundConfigurationForState:(id)a3;
- (id)configurationStateForCellConfigurationState:(id)a3;
- (id)contentConfigurationForState:(id)a3;
- (int64_t)_cellViewRelationshipTypeForFlags:(id)a3;
- (int64_t)numberOfPreviewLines;
- (int64_t)style;
- (void)_registerUpdateGeneratedSummaryObservation;
- (void)_significantTimeChange;
- (void)_updateGeneratedSummary;
- (void)_updateViewsToMatchMessageListItem:(id)a3 style:(int64_t)a4 hintsBySnippetZone:(id)a5;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setApplicationProxy:(id)a3;
- (void)setAutomaticallySummarizeMessages:(id)a3;
- (void)setBrandIndicatorProvider:(id)a3;
- (void)setCanShowReadLaterDate:(BOOL)a3;
- (void)setCategory:(id)a3;
- (void)setCompact:(BOOL)a3;
- (void)setContactStore:(id)a3;
- (void)setDisclosureEnabled:(BOOL)a3;
- (void)setDisclosureEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setExpanded:(BOOL)a3;
- (void)setHideFollowUp:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setInbox:(BOOL)a3;
- (void)setLocalMailboxSearchScope:(BOOL)a3;
- (void)setMessageListItem:(id)a3 style:(int64_t)a4;
- (void)setMessageListItem:(id)a3 style:(int64_t)a4 hintsBySnippetZone:(id)a5;
- (void)setNumberOfPreviewLines:(int64_t)a3;
- (void)setOutgoingMailbox:(BOOL)a3;
- (void)setPredictedMailbox:(id)a3;
- (void)setSearchResult:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSenderSpecificCell:(BOOL)a3;
- (void)setShouldAnnotateReplyOrForward:(BOOL)a3;
- (void)setShouldDisplayUnreadAndVIP:(BOOL)a3;
- (void)setShouldShowHighImpact:(BOOL)a3;
- (void)setShowsAccessory:(BOOL)a3 showingDetail:(BOOL)a4;
- (void)setUpdateSummaryCancelationToken:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)updateViewBackgroundConfiguration:(id)a3;
- (void)updateViewConfigurationForState:(id)a3;
- (void)updateViewContentConfiguration:(id)a3;
@end

@implementation MessageListCellHelper

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isCompact
{
  return self->_compact;
}

- (EMMessageListItem)messageListItem
{
  return self->_messageListItem;
}

void __83__MessageListCellHelper__cellViewModelForMessageListItem_style_hintsBySnippetZone___block_invoke(uint64_t a1, void *a2)
{
  id v47 = a2;
  v3 = [*(id *)(a1 + 32) flags];
  objc_msgSend(v47, "setRead:", objc_msgSend(v3, "read"));
  objc_msgSend(v47, "setFlagged:", objc_msgSend(v3, "flagged"));
  v4 = [*(id *)(a1 + 32) flagColors];
  [v47 setFlagColors:v4];

  objc_msgSend(v47, "setReplied:", objc_msgSend(v3, "replied"));
  objc_msgSend(v47, "setForwarded:", objc_msgSend(v3, "forwarded"));
  objc_msgSend(v47, "setRedirected:", objc_msgSend(v3, "redirected"));
  objc_msgSend(v47, "setJunk:", objc_msgSend(v3, "isJunk"));
  if ([*(id *)(a1 + 40) canShowReadLaterDate])
  {
    v5 = [*(id *)(a1 + 32) readLater];
    v6 = [v5 date];
    [v47 setReadLaterDate:v6];
  }
  else
  {
    [v47 setReadLaterDate:0];
  }
  v7 = [*(id *)(a1 + 32) sendLaterDate];
  [v47 setSendLaterDate:v7];

  v8 = [*(id *)(a1 + 32) followUp];
  [v47 setFollowUp:v8];

  [v47 setHintsBySnippetZone:*(void *)(a1 + 48)];
  v9 = [*(id *)(a1 + 32) date];
  [v47 setDate:v9];

  v10 = [*(id *)(a1 + 32) displayDate];
  [v47 setDisplayDate:v10];

  objc_msgSend(v47, "setHideFollowUp:", objc_msgSend(*(id *)(a1 + 40), "shouldHideFollowUp"));
  if (_os_feature_enabled_impl())
  {
    if (([*(id *)(a1 + 32) isGroupedSender] & 1) == 0
      && [MEMORY[0x1E4F602E0] preferenceEnabled:42])
    {
      v11 = [*(id *)(a1 + 32) category];
      v12 = EMShortStringForCategory();
      [v47 setCategorizationState:v12];
    }
    objc_msgSend(v47, "setAllowAuthenticationWarning:", objc_msgSend(*(id *)(a1 + 32), "allowAuthenticationWarning"));
    v13 = [MUIAvatarImageContext alloc];
    uint64_t v14 = *(void *)(a1 + 32);
    v15 = [*(id *)(a1 + 40) contactStore];
    v16 = [*(id *)(a1 + 40) brandIndicatorProvider];
    v17 = [(MUIAvatarImageContext *)v13 initWithMessageListItem:v14 contactStore:v15 brandIndicatorProvider:v16];
    [v47 setAvatarContext:v17];
  }
  v18 = (void *)MEMORY[0x1E4F608E8];
  v19 = [*(id *)(a1 + 32) subject];
  v20 = [v18 subjectStringForDisplayForSubject:v19 style:*(void *)(a1 + 56)];

  objc_msgSend(v47, "setSubjectIsPresent:", objc_msgSend(v20, "length") != 0);
  if (([v47 subjectIsPresent] & 1) == 0)
  {
    uint64_t v21 = +[MUILocalizedMessageListStrings noSubjectPlaceholder];

    v20 = (void *)v21;
  }
  [v47 setSubject:v20];
  if ([*(id *)(a1 + 40) isSearchResult]) {
    int v22 = [*(id *)(a1 + 40) isLocalMailboxSearchScope] ^ 1;
  }
  else {
    int v22 = 1;
  }
  if ([*(id *)(a1 + 40) isOutgoingMailbox]
    && ![*(id *)(a1 + 40) isSearchResult]
    || ([*(id *)(a1 + 40) isOutgoingMailbox] ^ 1 | v22) != 1)
  {
    goto LABEL_19;
  }
  v23 = [*(id *)(a1 + 32) followUp];
  if ([v23 isActive])
  {
    char v24 = [*(id *)(a1 + 40) isInbox];

    if (v24)
    {
LABEL_19:
      v25 = [*(id *)(a1 + 32) toList];
      char v26 = 1;
      goto LABEL_22;
    }
  }
  else
  {
  }
  v25 = [*(id *)(a1 + 32) senderList];
  char v26 = 0;
LABEL_22:
  v27 = [*(id *)(a1 + 40) applicationProxy];
  v28 = [v27 addressListFormatter];

  v29 = [v28 stringFromEmailAddressList:v25 preferFullDisplayName:0];
  v30 = objc_msgSend(v25, "ef_mapSelector:", sel_stringValue);
  v31 = [MEMORY[0x1E4F603D0] authorHintsFromHintsBySnippetZone:*(void *)(a1 + 48)];
  if ([v31 count])
  {
    v46 = [v28 attributedStringFromEmailAddressList:v25];
  }
  else
  {
    v46 = 0;
  }
  if ([v29 length])
  {
    [v47 setAddressIsPresent:1];
    [v47 setAddress:v29];
    [v47 setAttributedAddress:v46];
    [v47 setAddressList:v25];
  }
  else
  {
    if (v26) {
      +[MUILocalizedMessageListStrings noRecipientsPlaceholder];
    }
    else {
    v32 = +[MUILocalizedMessageListStrings noSenderPlaceholder];
    }
    [v47 setAddress:v32];
  }
  if ([v30 count]) {
    [v47 setEmailAddresses:v30];
  }
  objc_msgSend(v47, "setVIP:", objc_msgSend(*(id *)(a1 + 32), "isVIP"));
  objc_msgSend(v47, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 32), "hasAttachments"));
  [v47 setRecipientType:0];
  v33 = [*(id *)(a1 + 40) applicationProxy];
  int v34 = [v33 showToCCIndicators];

  if (v34)
  {
    v45 = v29;
    v35 = v31;
    v36 = v20;
    v37 = v3;
    v38 = [v28 userProfileProvider];
    v39 = [*(id *)(a1 + 32) toList];
    char v40 = [v38 isMyEmailAddressContainedInAddressList:v39];

    if (v40)
    {
      uint64_t v41 = 1;
    }
    else
    {
      v42 = [*(id *)(a1 + 32) ccList];
      int v43 = [v38 isMyEmailAddressContainedInAddressList:v42];

      if (!v43)
      {
LABEL_39:

        v3 = v37;
        v20 = v36;
        v31 = v35;
        v29 = v45;
        goto LABEL_40;
      }
      uint64_t v41 = 2;
    }
    [v47 setRecipientType:v41];
    goto LABEL_39;
  }
LABEL_40:
  uint64_t v44 = [*(id *)(a1 + 32) conversationNotificationLevel];
  [v47 setNotify:v44 == 2];
  [v47 setMute:v44 == 1];
  [v47 setStyle:*(void *)(a1 + 64)];
  objc_msgSend(v47, "setBlockedSender:", objc_msgSend(*(id *)(a1 + 32), "isBlocked"));
  objc_msgSend(v47, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 32), "unsubscribeType"));
}

- (BOOL)isOutgoingMailbox
{
  return self->_outgoingMailbox;
}

- (BOOL)shouldHideFollowUp
{
  return self->_hideFollowUp;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void)setShowsAccessory:(BOOL)a3 showingDetail:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [(MessageListCellHelper *)self cellView];
  uint64_t v8 = [v7 chevronType];

  v9 = [(MessageListCellHelper *)self cellView];
  v10 = [v9 viewModel];
  uint64_t v11 = [v10 style];

  uint64_t v12 = 2;
  if (v11 != 1) {
    uint64_t v12 = !v4;
  }
  if (!v5) {
    uint64_t v12 = 0;
  }
  if (v11 == 2) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v12;
  }
  if (v8 != v13)
  {
    id v14 = [(MessageListCellHelper *)self cellView];
    [v14 setChevronType:v13];
  }
}

- (id)configurationStateForCellConfigurationState:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MessageListCellHelper *)self style];
  BOOL v6 = v5 == 1 && [(MessageListCellHelper *)self disclosureEnabled];
  if (v5 == 2) {
    uint64_t v7 = v6 ^ 1;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = (void *)MEMORY[0x1E4FB1790];
  v9 = [(MessageListCellHelper *)self cellView];
  v10 = [v8 focusSystemForEnvironment:v9];

  uint64_t v11 = [(MessageListCellHelper *)self applicationProxy];
  uint64_t v12 = [v10 focusedItem];
  uint64_t v13 = [v11 isMessageListCellObject:v12];

  [v4 setIsParent:v6];
  [v4 setIsChild:v7];
  [v4 setIsFocusSystemActive:v10 != 0];
  [v4 setIsFocusingOnMessageListCell:v13];

  return v4;
}

- (MessageListCellViewable)cellView
{
  return self->_cellView;
}

- (int64_t)style
{
  return self->_style;
}

- (MessageListCellHelperApplicationProxy)applicationProxy
{
  return self->_applicationProxy;
}

- (BOOL)disclosureEnabled
{
  return self->_disclosureEnabled;
}

- (void)setShouldShowHighImpact:(BOOL)a3
{
  self->_shouldShowHighImpact = a3;
}

- (void)setShouldDisplayUnreadAndVIP:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_shouldDisplayUnreadAndVIP != a3) {
    self->_shouldDisplayUnreadAndVIP = a3;
  }
  int64_t v5 = [(MessageListCellHelper *)self cellView];
  [v5 setDisplayUnreadDot:v3];

  id v6 = [(MessageListCellHelper *)self cellView];
  [v6 setDisplayVIP:v3];
}

- (void)setShouldAnnotateReplyOrForward:(BOOL)a3
{
  if (self->_shouldAnnotateReplyOrForward != a3)
  {
    BOOL v3 = a3;
    self->_shouldAnnotateReplyOrForward = a3;
    id v4 = [(MessageListCellHelper *)self cellView];
    [v4 setShouldAnnotateReplyOrForward:v3];
  }
}

- (void)setSenderSpecificCell:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MessageListCellHelper *)self cellView];
  [v4 setSenderSpecificCell:v3];
}

- (void)setSearchResult:(BOOL)a3
{
  self->_searchResult = a3;
}

- (void)setOutgoingMailbox:(BOOL)a3
{
  self->_outgoingMailbox = a3;
}

- (void)setMessageListItem:(id)a3 style:(int64_t)a4 hintsBySnippetZone:(id)a5
{
  objc_storeStrong((id *)&self->_messageListItem, a3);
  id v9 = a3;
  id v10 = a5;
  self->_style = a4;
  [(MessageListCellHelper *)self _updateViewsToMatchMessageListItem:v9 style:a4 hintsBySnippetZone:v10];
}

- (void)setLocalMailboxSearchScope:(BOOL)a3
{
  self->_localMailboxSearchScope = a3;
}

- (void)setInbox:(BOOL)a3
{
  self->_inbox = a3;
}

- (void)setHideFollowUp:(BOOL)a3
{
  self->_hideFollowUp = a3;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (void)setContactStore:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListCellHelper *)self cellView];
  [v5 setContactStore:v4];
}

- (void)setCompact:(BOOL)a3
{
  if (self->_compact != a3)
  {
    BOOL v3 = a3;
    self->_compact = a3;
    id v5 = [(MessageListCellHelper *)self cellView];
    [v5 setCompact:v3];

    id v6 = [(MessageListCellHelper *)self parentView];
    objc_msgSend(v6, "mui_setNeedsLayout");
  }
}

- (void)setCategory:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListCellHelper *)self cellView];
  [v5 setCategory:v4];
}

- (void)setCanShowReadLaterDate:(BOOL)a3
{
  self->_canShowReadLaterDate = a3;
}

- (BOOL)senderSpecificCell
{
  v2 = [(MessageListCellHelper *)self cellView];
  char v3 = [v2 isSenderSpecificCell];

  return v3;
}

- (BOOL)isSearchResult
{
  return self->_searchResult;
}

- (BOOL)canShowReadLaterDate
{
  return self->_canShowReadLaterDate;
}

- (void)_updateViewsToMatchMessageListItem:(id)a3 style:(int64_t)a4 hintsBySnippetZone:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(MessageListCellHelper *)self cellView];
  if (_os_feature_enabled_impl())
  {
    uint64_t v11 = [(MessageListCellHelper *)self contactStore];
    [v10 setContactStore:v11];

    objc_msgSend(v10, "setShouldShowHighImpact:", -[MessageListCellHelper shouldShowHighImpact](self, "shouldShowHighImpact"));
  }
  uint64_t v12 = [(MessageListCellHelper *)self _cellViewModelForMessageListItem:v8 style:a4 hintsBySnippetZone:v9];
  [v10 setViewModel:v12];

  if (_os_feature_enabled_impl()
    && EMIsGreymatterAvailableWithOverride()
    && ([(MessageListCellHelper *)self _generatedSummaryForUpdatingCellView:v10], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v14 = (void *)v13;
    v15 = _ef_log_MessageListCellHelper();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [v8 itemID];
      *(_DWORD *)buf = 134218242;
      v28 = self;
      __int16 v29 = 2114;
      v30 = v16;
      _os_log_impl(&dword_1DDCDB000, v15, OS_LOG_TYPE_DEFAULT, "<%p>: Found generated summary for %{public}@, displaying generated one over classic summary", buf, 0x16u);
    }
    id v17 = v14;
    uint64_t v18 = 1;
    v19 = v17;
  }
  else
  {
    v19 = [v8 summary];
    uint64_t v18 = 0;
    id v17 = 0;
    v20 = 0;
    if (!v19) {
      goto LABEL_13;
    }
  }
  if ([v19 length])
  {
    v20 = v19;
  }
  else
  {
    v20 = +[MUILocalizedMessageListStrings noContentPlaceholder];
  }
LABEL_13:
  if ([MEMORY[0x1E4F602E0] preferenceEnabled:7])
  {
    uint64_t v21 = NSString;
    int v22 = [v8 itemID];
    v23 = [v8 displayMessageItemID];
    uint64_t v24 = [v21 stringWithFormat:@"%@/%@:%@", v22, v23, v20];

    v20 = (void *)v24;
  }
  [v10 setSummary:v20];
  [v10 setHasGeneratedSummary:v18];
  v25 = [v8 flags];
  objc_msgSend(v10, "setAnnotatedRelationshipType:", -[MessageListCellHelper _cellViewRelationshipTypeForFlags:](self, "_cellViewRelationshipTypeForFlags:", v25));

  char v26 = [(MessageListCellHelper *)self parentView];
  objc_msgSend(v26, "mui_setNeedsLayout");
}

- (BOOL)shouldShowHighImpact
{
  return self->_shouldShowHighImpact;
}

- (UIView)parentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  return (UIView *)WeakRetained;
}

- (EMCachingContactStore)contactStore
{
  v2 = [(MessageListCellHelper *)self cellView];
  char v3 = [v2 contactStore];

  return (EMCachingContactStore *)v3;
}

- (int64_t)_cellViewRelationshipTypeForFlags:(id)a3
{
  id v3 = a3;
  if ([v3 draft]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  if ([v3 forwarded]) {
    int64_t v5 = 3;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 replied];

  if (v6) {
    return 1;
  }
  else {
    return v5;
  }
}

- (id)_cellViewModelForMessageListItem:(id)a3 style:(int64_t)a4 hintsBySnippetZone:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = [MessageListCellViewModel alloc];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__MessageListCellHelper__cellViewModelForMessageListItem_style_hintsBySnippetZone___block_invoke;
    v13[3] = &unk_1E6D11730;
    id v14 = v8;
    v15 = self;
    id v16 = v9;
    BOOL v17 = a4 == 1;
    int64_t v18 = a4;
    uint64_t v11 = [(MessageListCellViewModel *)v10 initWithBuilder:v13];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)backgroundConfigurationForState:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MessageListCellHelper *)self cellView];
  int v6 = [v5 layoutValues];

  uint64_t v7 = [v6 defaultBackgroundConfiguration];
  id v8 = [v6 backgroundColorForConfigurationState:v4 backgroundConfiguration:v7];

  if (v8) {
    [v7 setBackgroundColor:v8];
  }
  [v6 backgroundCornerRadius];
  objc_msgSend(v7, "setCornerRadius:");

  return v7;
}

- (id)contentConfigurationForState:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MessageListCellHelper *)self cellView];
  int v6 = [v5 layoutValues];
  if ([v6 useSidebarAppearance]) {
    [MEMORY[0x1E4FB1948] cellConfiguration];
  }
  else {
  uint64_t v7 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  }

  id v8 = [v7 updatedConfigurationForState:v4];

  return v8;
}

- (void)updateViewContentConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListCellHelper *)self cellView];
  [v5 setContentConfiguration:v4];
}

- (void)updateViewConfigurationForState:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListCellHelper *)self cellView];
  [v5 setConfigurationState:v4];
}

- (void)updateViewBackgroundConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListCellHelper *)self cellView];
  [v5 setBackgroundConfiguration:v4];
}

- (MessageListCellHelper)initWithParentView:(id)a3 contentView:(id)a4 cellView:(id)a5 applicationProxy:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (MessageListCellViewable *)a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)MessageListCellHelper;
  id v14 = [(MessageListCellHelper *)&v25 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_parentView, v10);
    objc_storeWeak((id *)&v15->_contentView, v11);
    objc_msgSend(v10, "setMui_clipsToBounds:", 1);
    [v10 setAutoresizesSubviews:1];
    objc_storeStrong((id *)&v15->_cellView, a5);
    if (v15->_cellView != v11) {
      -[MessageListCellViewable addSubview:](v11, "addSubview:");
    }
    id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v15 selector:sel__significantTimeChange name:*MEMORY[0x1E4FB2708] object:0];
    [v10 setAccessibilityIdentifier:*MEMORY[0x1E4F73C18]];
    objc_storeStrong((id *)&v15->_applicationProxy, a6);
    v15->_disclosureEnabled = 0;
    if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v15);
      id v17 = objc_alloc(MEMORY[0x1E4F603F8]);
      uint64_t v18 = *MEMORY[0x1E4F600E8];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __82__MessageListCellHelper_initWithParentView_contentView_cellView_applicationProxy___block_invoke;
      v22[3] = &unk_1E6D116E0;
      objc_copyWeak(&v23, &location);
      uint64_t v19 = [v17 initWithUserDefaultKey:v18 keyRepresentsDisabled:1 handler:v22];
      automaticallySummarizeMessages = v15->_automaticallySummarizeMessages;
      v15->_automaticallySummarizeMessages = (EMNSUserDefaultsBoolObserver *)v19;

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
  return v15;
}

uint64_t ___ef_log_MessageListCellHelper_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "MessageListCellHelper");
  uint64_t v1 = _ef_log_MessageListCellHelper_log;
  _ef_log_MessageListCellHelper_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __82__MessageListCellHelper_initWithParentView_contentView_cellView_applicationProxy___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    v2 = [WeakRetained messageListItem];
    uint64_t v3 = [v7 style];
    id v4 = [v7 cellView];
    id v5 = [v4 viewModel];
    int v6 = [v5 hintsBySnippetZone];
    [v7 _updateViewsToMatchMessageListItem:v2 style:v3 hintsBySnippetZone:v6];

    id WeakRetained = v7;
  }
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(MessageListCellHelper *)self predictedMailbox];
  [v4 cancel];

  v5.receiver = self;
  v5.super_class = (Class)MessageListCellHelper;
  [(MessageListCellHelper *)&v5 dealloc];
}

- (void)_significantTimeChange
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__MessageListCellHelper__significantTimeChange__block_invoke;
  v3[3] = &unk_1E6D11708;
  v3[4] = self;
  v2 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v2 performBlock:v3];
}

void __47__MessageListCellHelper__significantTimeChange__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cellView];
  [v2 refreshForSignificantTimeChange];

  id v3 = [*(id *)(a1 + 32) parentView];
  objc_msgSend(v3, "mui_setNeedsLayout");
}

- (void)setMessageListItem:(id)a3 style:(int64_t)a4
{
}

- (id)_generatedSummaryString
{
  id v3 = [(MessageListCellHelper *)self automaticallySummarizeMessages];
  if ([v3 isEnabled])
  {
    id v4 = [(MessageListCellHelper *)self messageListItem];
    objc_super v5 = [v4 generatedSummary];
    int v6 = [v5 topLine];
    id v7 = [v6 string];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_generatedSummaryForUpdatingCellView:(id)a3
{
  id v4 = a3;
  [(MessageListCellHelper *)self setUpdateSummaryCancelationToken:0];
  uint64_t v5 = [(MessageListCellHelper *)self _generatedSummaryString];
  if (v5)
  {
    int v6 = (void *)v5;
    id v7 = [v4 summary];
    if ([v7 length])
    {
      id v8 = [(MessageListCellHelper *)self messageListItem];
      id v9 = [v8 summary];
      int v10 = [v9 isEqualToString:v7];

      if (v10)
      {
        if (([v4 hasGeneratedSummary] & 1) == 0
          && ([MEMORY[0x1E4F602E0] preferenceEnabled:52] & 1) == 0
          && [(MessageListCellHelper *)self isVisible])
        {

          [(MessageListCellHelper *)self _registerUpdateGeneratedSummaryObservation];
          int v6 = 0;
        }
      }
    }
    id v11 = v6;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)_registerUpdateGeneratedSummaryObservation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = [(MessageListCellHelper *)self messageListItem];
  id v4 = [v3 itemID];

  uint64_t v5 = _ef_log_MessageListCellHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = self;
    __int16 v27 = 2114;
    v28 = v4;
    _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "<%p>: Have generated summary for %{public}@, deferring update until cell is not visible", buf, 0x16u);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4F60D28]);
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v8 = [MEMORY[0x1E4F28F08] mainQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__MessageListCellHelper__registerUpdateGeneratedSummaryObservation__block_invoke;
  v23[3] = &unk_1E6D11758;
  objc_copyWeak(&v25, (id *)buf);
  uint64_t v9 = *MEMORY[0x1E4FB2E90];
  id v10 = v4;
  id v24 = v10;
  id v11 = [v7 addObserverForName:v9 object:0 queue:v8 usingBlock:v23];

  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __67__MessageListCellHelper__registerUpdateGeneratedSummaryObservation__block_invoke_68;
  uint64_t v18 = &unk_1E6D11780;
  uint64_t v19 = self;
  id v12 = v10;
  id v20 = v12;
  id v13 = v7;
  id v21 = v13;
  id v14 = v11;
  id v22 = v14;
  [v6 addCancelationBlock:&v15];
  -[MessageListCellHelper setUpdateSummaryCancelationToken:](self, "setUpdateSummaryCancelationToken:", v6, v15, v16, v17, v18, v19);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

void __67__MessageListCellHelper__registerUpdateGeneratedSummaryObservation__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = _ef_log_MessageListCellHelper();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 134218242;
      id v6 = WeakRetained;
      __int16 v7 = 2114;
      uint64_t v8 = v4;
      _os_log_impl(&dword_1DDCDB000, v3, OS_LOG_TYPE_DEFAULT, "<%p>: Applying generated summary for %{public}@ due to scene backgrounding", (uint8_t *)&v5, 0x16u);
    }

    [WeakRetained _updateGeneratedSummary];
    [WeakRetained setUpdateSummaryCancelationToken:0];
  }
}

uint64_t __67__MessageListCellHelper__registerUpdateGeneratedSummaryObservation__block_invoke_68(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _ef_log_MessageListCellHelper();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1DDCDB000, v2, OS_LOG_TYPE_DEFAULT, "<%p>: Canceling generated summary update observation for %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 48) removeObserver:*(void *)(a1 + 56)];
}

- (void)_updateGeneratedSummary
{
  id v5 = [(MessageListCellHelper *)self cellView];
  uint64_t v3 = [(MessageListCellHelper *)self _generatedSummaryString];
  if (([v5 hasGeneratedSummary] & 1) == 0 && v3)
  {
    [v5 setSummary:v3];
    [v5 setHasGeneratedSummary:1];
    uint64_t v4 = [(MessageListCellHelper *)self parentView];
    objc_msgSend(v4, "mui_setNeedsLayout");
  }
}

- (void)setDisclosureEnabled:(BOOL)a3
{
}

- (void)setDisclosureEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_disclosureEnabled != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_disclosureEnabled = a3;
    uint64_t v7 = [(MessageListCellHelper *)self cellView];
    [v7 setDisclosureEnabled:v5 animated:v4];

    id v8 = [(MessageListCellHelper *)self parentView];
    objc_msgSend(v8, "mui_setNeedsLayout");
  }
}

- (EMCategory)category
{
  v2 = [(MessageListCellHelper *)self cellView];
  uint64_t v3 = [v2 category];

  return (EMCategory *)v3;
}

- (void)setNumberOfPreviewLines:(int64_t)a3
{
  if (self->_numberOfPreviewLines != a3)
  {
    self->_numberOfPreviewLines = a3;
    id v4 = [(MessageListCellHelper *)self cellView];
    [v4 setNumberOfPreviewLines:a3];
  }
}

- (void)prepareForReuse
{
  messageListItem = self->_messageListItem;
  self->_messageListItem = 0;

  self->_style = 0;
  id v4 = [(MessageListCellHelper *)self cellView];
  [v4 prepareForReuse];

  BOOL v5 = [(MessageListCellHelper *)self predictedMailbox];
  [v5 cancel];

  [(MessageListCellHelper *)self setPredictedMailbox:0];
  [(MessageListCellHelper *)self setDisclosureEnabled:0];
  [(MessageListCellHelper *)self setExpanded:0];
  [(MessageListCellHelper *)self setCompact:0];
  [(MessageListCellHelper *)self setSearchResult:0];
  [(MessageListCellHelper *)self setLocalMailboxSearchScope:0];
  [(MessageListCellHelper *)self setVisible:0];
  [(MessageListCellHelper *)self setUpdateSummaryCancelationToken:0];
}

- (void)setApplicationProxy:(id)a3
{
}

- (UIView)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  return (UIView *)WeakRetained;
}

- (BOOL)shouldAnnotateReplyOrForward
{
  return self->_shouldAnnotateReplyOrForward;
}

- (BOOL)shouldDisplayUnreadAndVIP
{
  return self->_shouldDisplayUnreadAndVIP;
}

- (BOOL)isInbox
{
  return self->_inbox;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)isLocalMailboxSearchScope
{
  return self->_localMailboxSearchScope;
}

- (EFFuture)predictedMailbox
{
  return self->_predictedMailbox;
}

- (void)setPredictedMailbox:(id)a3
{
}

- (int64_t)numberOfPreviewLines
{
  return self->_numberOfPreviewLines;
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  return self->_brandIndicatorProvider;
}

- (void)setBrandIndicatorProvider:(id)a3
{
}

- (EMNSUserDefaultsBoolObserver)automaticallySummarizeMessages
{
  return self->_automaticallySummarizeMessages;
}

- (void)setAutomaticallySummarizeMessages:(id)a3
{
}

- (EFAutoCancelationToken)updateSummaryCancelationToken
{
  return self->_updateSummaryCancelationToken;
}

- (void)setUpdateSummaryCancelationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateSummaryCancelationToken, 0);
  objc_storeStrong((id *)&self->_automaticallySummarizeMessages, 0);
  objc_storeStrong((id *)&self->_brandIndicatorProvider, 0);
  objc_storeStrong((id *)&self->_predictedMailbox, 0);
  objc_storeStrong((id *)&self->_messageListItem, 0);
  objc_storeStrong((id *)&self->_cellView, 0);
  objc_destroyWeak((id *)&self->_contentView);
  objc_destroyWeak((id *)&self->_parentView);
  objc_storeStrong((id *)&self->_applicationProxy, 0);
}

@end