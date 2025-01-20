@interface CKConversationSearchResultEmbeddedCell
+ (id)annotatedResultStringWithSearchText:(id)a3 resultText:(id)a4 primaryTextColor:(id)a5 primaryFont:(id)a6 annotatedTextColor:(id)a7 annotatedFont:(id)a8;
- (BOOL)lastMessageIsTypingIndicator;
- (UIEdgeInsets)marginInsets;
- (double)leadingLayoutMargin;
- (void)configureWithQueryResult:(id)a3 searchText:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setMarginInsets:(UIEdgeInsets)a3;
@end

@implementation CKConversationSearchResultEmbeddedCell

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4
{
  id v32 = a4;
  id v6 = a3;
  id v34 = [v6 conversation];
  [(CKConversationListCell *)self setFreezeSummaryText:0];
  [(CKConversationListStandardCell *)self updateContentsForConversation:v34 fastPreview:0];
  [(CKConversationListCell *)self setFreezeSummaryText:1];
  v7 = [v6 item];

  v33 = v7;
  v8 = [v7 attributeSet];
  v9 = objc_msgSend(v8, "__ck_spotlightItemSnippet");

  unint64_t v10 = [v9 length];
  v11 = +[CKUIBehavior sharedBehaviors];
  unint64_t v12 = [v11 conversationListCellMaxSummaryLength];

  if (v10 > v12)
  {
    v13 = +[CKUIBehavior sharedBehaviors];
    uint64_t v14 = objc_msgSend(v9, "substringWithRange:", 0, objc_msgSend(v13, "conversationListCellMaxSummaryLength"));

    v9 = (void *)v14;
  }
  int v15 = CKIsRunningInMacCatalyst();
  v16 = +[CKUIBehavior sharedBehaviors];
  v17 = v16;
  if (v15) {
    [v16 searchMessageBodyTextFont];
  }
  else {
  v18 = [v16 conversationListSummaryFont];
  }

  v19 = objc_opt_class();
  v20 = +[CKUIBehavior sharedBehaviors];
  v21 = [v20 theme];
  v22 = [v21 conversationListSummaryColor];
  v23 = +[CKUIBehavior sharedBehaviors];
  v24 = [v23 theme];
  v25 = [v24 conversationListSenderColor];
  v26 = [v19 annotatedResultStringWithSearchText:v32 resultText:v9 primaryTextColor:v22 primaryFont:v18 annotatedTextColor:v25 annotatedFont:v18];

  if (![v26 length])
  {
    uint64_t v27 = [v34 previewText];

    v26 = (void *)v27;
  }
  v28 = [(CKConversationListCell *)self summaryLabel];
  [v28 setAttributedText:v26];

  v29 = [v33 attributeSet];
  v30 = [v29 contentCreationDate];

  if (!v30)
  {
    v30 = [v34 date];
  }
  v31 = [(CKConversationListCell *)self dateLabel];
  [v31 setDate:v30];
}

+ (id)annotatedResultStringWithSearchText:(id)a3 resultText:(id)a4 primaryTextColor:(id)a5 primaryFont:(id)a6 annotatedTextColor:(id)a7 annotatedFont:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if ([v14 length])
  {
    id v29 = v15;
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v14];
    uint64_t v20 = [v19 length];
    id v27 = v13;
    if ([v13 length])
    {
      uint64_t v21 = [v14 rangeOfString:v13 options:129];
      uint64_t v23 = v22;
    }
    else
    {
      uint64_t v21 = 0;
      uint64_t v23 = 0;
    }
    uint64_t v24 = *MEMORY[0x1E4FB06F8];
    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v16, 0, v20, v27);
    uint64_t v25 = *MEMORY[0x1E4FB0700];
    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v29, 0, v20);
    if (v23)
    {
      objc_msgSend(v19, "addAttribute:value:range:", v25, v17, v21, v23);
      objc_msgSend(v19, "addAttribute:value:range:", v24, v18, v21, v23);
    }
    id v13 = v28;
    id v15 = v29;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CKConversationSearchResultEmbeddedCell;
  [(CKConversationListStandardCell *)&v9 layoutSubviews];
  [(CKConversationSearchResultEmbeddedCell *)self setUserInteractionEnabled:0];
  v3 = [(CKConversationListStandardCell *)self unreadIndicatorImageView];
  [v3 setHidden:1];

  v4 = [(CKConversationListStandardCell *)self indicatorContainerView];
  [v4 setHidden:1];

  v5 = [(CKConversationListStandardCell *)self avatarView];
  [v5 setAsynchronousRendering:1];

  id v6 = [(CKConversationListStandardCell *)self avatarView];
  [v6 setUserInteractionEnabled:0];

  v7 = [(CKConversationListStandardCell *)self avatarView];
  [v7 setShowsContactOnTap:0];

  v8 = [(CKConversationListStandardCell *)self avatarView];
  [v8 setBypassActionValidation:1];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKConversationSearchResultEmbeddedCell;
  [(CKConversationListStandardCell *)&v4 prepareForReuse];
  v3 = [(CKConversationListCell *)self summaryLabel];
  [v3 setAttributedText:0];
}

- (double)leadingLayoutMargin
{
  [(CKConversationSearchResultEmbeddedCell *)self marginInsets];
  double v4 = v3;
  [(CKConversationSearchResultEmbeddedCell *)self bounds];
  double v6 = v5;
  v7 = +[CKUIBehavior sharedBehaviors];
  [v7 conversationListMinimumWidthForHiddenContactImage];
  double v9 = v8;

  unint64_t v10 = +[CKUIBehavior sharedBehaviors];
  if ([v10 canShowContactPhotosInConversationList]) {
    BOOL v11 = v6 <= v9;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
  }
  else
  {
    unint64_t v12 = +[CKUIBehavior sharedBehaviors];
    int v13 = [v12 contactPhotosEnabled];

    if (v13)
    {
      int v14 = [(CKConversationSearchResultEmbeddedCell *)self _shouldReverseLayoutDirection];
      double v15 = 2.0;
      if (v14) {
        double v15 = -2.0;
      }
      return v4 + v15;
    }
  }
  return v4;
}

- (BOOL)lastMessageIsTypingIndicator
{
  return 0;
}

- (UIEdgeInsets)marginInsets
{
  double top = self->_marginInsets.top;
  double left = self->_marginInsets.left;
  double bottom = self->_marginInsets.bottom;
  double right = self->_marginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->_marginInsets = a3;
}

@end