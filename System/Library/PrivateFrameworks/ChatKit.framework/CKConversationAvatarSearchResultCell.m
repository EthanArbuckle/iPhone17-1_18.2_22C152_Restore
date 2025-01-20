@interface CKConversationAvatarSearchResultCell
+ (id)reuseIdentifier;
+ (int64_t)_titleIconImageTypeForConversation:(id)a3;
- (BOOL)_ck_isEditing;
- (CKAvatarView)avatarView;
- (CKConversation)conversation;
- (CKConversationAvatarSearchResultCell)initWithFrame:(CGRect)a3;
- (CKLabel)nameLabel;
- (NSString)resultIdentifier;
- (UIEdgeInsets)marginInsets;
- (double)_adjustedContentWidth;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (id)presentingViewControllerForAvatarView:(id)a3;
- (void)_ck_setEditing:(BOOL)a3;
- (void)_configureAvatarViewForConversation:(id)a3;
- (void)_configureNameLabelForConversation:(id)a3 searchText:(id)a4;
- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)refreshForSearchTextIfNeeded:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setConversation:(id)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setNameLabel:(id)a3;
- (void)setResultIdentifier:(id)a3;
@end

@implementation CKConversationAvatarSearchResultCell

+ (id)reuseIdentifier
{
  return @"ConversationSearchCell";
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 identifier];
  [(CKConversationAvatarSearchResultCell *)self setResultIdentifier:v9];

  id v10 = [v8 conversation];

  [(CKConversationAvatarSearchResultCell *)self setConversation:v10];
  [(CKConversationAvatarSearchResultCell *)self _configureAvatarViewForConversation:v10];
  [(CKConversationAvatarSearchResultCell *)self _configureNameLabelForConversation:v10 searchText:v7];
}

- (void)refreshForSearchTextIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversationAvatarSearchResultCell *)self conversation];
  [(CKConversationAvatarSearchResultCell *)self _configureNameLabelForConversation:v5 searchText:v4];
}

- (CKConversationAvatarSearchResultCell)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CKConversationAvatarSearchResultCell;
  v3 = -[CKConversationAvatarSearchResultCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [CKAvatarView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v9 = -[CKAvatarView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    [(CNAvatarView *)v9 setAsynchronousRendering:1];
    [(CNAvatarView *)v9 setShowsContactOnTap:0];
    [(CNAvatarView *)v9 setDelegate:v3];
    [(CNAvatarView *)v9 setBypassActionValidation:1];
    [(CKConversationAvatarSearchResultCell *)v3 setAvatarView:v9];
    id v10 = [(CKConversationAvatarSearchResultCell *)v3 contentView];
    [v10 addSubview:v9];

    v11 = -[CKLabel initWithFrame:]([CKLabel alloc], "initWithFrame:", v5, v6, v7, v8);
    [(CKLabel *)v11 setNumberOfLines:2];
    [(CKLabel *)v11 setTextAlignment:1];
    [(CKLabel *)v11 setLineBreakMode:4];
    v12 = [(CKConversationAvatarSearchResultCell *)v3 contentView];
    [v12 addSubview:v11];

    [(CKConversationAvatarSearchResultCell *)v3 setNameLabel:v11];
  }
  return v3;
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)CKConversationAvatarSearchResultCell;
  [(CKConversationAvatarSearchResultCell *)&v41 layoutSubviews];
  v3 = [(CKConversationAvatarSearchResultCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = fmin(v7, 64.0);
  if (CKMainScreenScale_once_89 != -1) {
    dispatch_once(&CKMainScreenScale_once_89, &__block_literal_global_221);
  }
  double v9 = *(double *)&CKMainScreenScale_sMainScreenScale_89;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_89 == 0.0) {
    double v9 = 1.0;
  }
  double v10 = v8 * v9;
  double v11 = v5 * v9 + floor((v7 * v9 - v8 * v9) * 0.5);
  double v12 = 1.0 / v9;
  CGFloat v13 = v12 * v11;
  CGFloat v14 = v10 * v12;
  v15 = +[CKUIBehavior sharedBehaviors];
  [v15 searchConversationCellPadding];
  double v17 = v16;

  v18 = [(CKConversationAvatarSearchResultCell *)self avatarView];
  objc_msgSend(v18, "setFrame:", v13, v17, v14, v14);

  [(CKConversationAvatarSearchResultCell *)self _adjustedContentWidth];
  double v20 = v19;
  v21 = [(CKConversationAvatarSearchResultCell *)self nameLabel];
  objc_msgSend(v21, "sizeThatFits:", v20, 1.79769313e308);
  double v23 = v22;
  double v25 = v24;

  v42.origin.x = v13;
  v42.origin.y = v17;
  v42.size.width = v14;
  v42.size.height = v14;
  double MaxY = CGRectGetMaxY(v42);
  v27 = +[CKUIBehavior sharedBehaviors];
  [v27 searchConversationMinAvatarLabelSpacing];
  double v29 = v28;

  if (CKMainScreenScale_once_89 != -1) {
    dispatch_once(&CKMainScreenScale_once_89, &__block_literal_global_221);
  }
  double v30 = *(double *)&CKMainScreenScale_sMainScreenScale_89;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_89 == 0.0) {
    double v30 = 1.0;
  }
  double v31 = (MaxY + v29) * v30;
  double v32 = v23 * v30;
  double v33 = v25 * v30;
  double v34 = v5 * v30 + floor((v7 * v30 - v23 * v30) * 0.5);
  double v35 = 1.0 / v30;
  double v36 = v35 * v34;
  double v37 = v31 * v35;
  double v38 = v32 * v35;
  double v39 = v33 * v35;
  v40 = [(CKConversationAvatarSearchResultCell *)self nameLabel];
  objc_msgSend(v40, "setFrame:", v36, v37, v38, v39);
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)CKConversationAvatarSearchResultCell;
  [(CKConversationAvatarSearchResultCell *)&v6 prepareForReuse];
  [(CKConversationAvatarSearchResultCell *)self setResultIdentifier:0];
  [(CKConversationAvatarSearchResultCell *)self setConversation:0];
  v3 = [(CKConversationAvatarSearchResultCell *)self avatarView];
  [v3 setContacts:MEMORY[0x1E4F1CBF0]];

  double v4 = [(CKConversationAvatarSearchResultCell *)self avatarView];
  [v4 setName:0];

  double v5 = [(CKConversationAvatarSearchResultCell *)self nameLabel];
  [v5 setAttributedText:0];
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  double v7 = fmin(v5, 64.0);
  double v8 = [(CKConversationAvatarSearchResultCell *)self nameLabel];
  [(CKConversationAvatarSearchResultCell *)self _adjustedContentWidth];
  objc_msgSend(v8, "sizeThatFits:");
  double v10 = v9;

  double v11 = +[CKUIBehavior sharedBehaviors];
  [v11 searchConversationMinAvatarLabelSpacing];
  double v13 = v10 + v7 + v12;
  CGFloat v14 = +[CKUIBehavior sharedBehaviors];
  [v14 searchConversationCellPadding];
  double v16 = v13 + v15 * 2.0;

  objc_msgSend(v4, "setSize:", v6, v16);

  return v4;
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  return 0;
}

- (void)_configureAvatarViewForConversation:(id)a3
{
  v20[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1BB38] maxContactAvatars];
  double v6 = [v4 conversationVisualIdentityWithKeys:MEMORY[0x1E4F1CBF0] requestedNumberOfContactsToFetch:v5];
  id v7 = [(CNAvatarView *)self->_avatarView updateViewWithGroupIdentity:v6];
  if ([v4 hasDisplayName]) {
    [v4 displayName];
  }
  else {
  double v8 = [v4 name];
  }
  double v9 = [(CKConversationAvatarSearchResultCell *)self avatarView];
  [v9 setName:v8];

  uint64_t v10 = [v4 recipientCount];
  double v11 = [(CKConversationAvatarSearchResultCell *)self avatarView];
  if (v10 == 1)
  {
    uint64_t v12 = *MEMORY[0x1E4F1BAF8];
    v20[0] = *MEMORY[0x1E4F1BAF0];
    v20[1] = v12;
    uint64_t v13 = *MEMORY[0x1E4F1BB00];
    v20[2] = *MEMORY[0x1E4F1BB08];
    v20[3] = v13;
    v20[4] = *MEMORY[0x1E4F1BAE8];
    CGFloat v14 = (void *)MEMORY[0x1E4F1C978];
    double v15 = v20;
    uint64_t v16 = 5;
  }
  else
  {
    uint64_t v19 = *MEMORY[0x1E4F1BAF8];
    CGFloat v14 = (void *)MEMORY[0x1E4F1C978];
    double v15 = &v19;
    uint64_t v16 = 1;
  }
  double v17 = [v14 arrayWithObjects:v15 count:v16];
  [v11 setActionCategories:v17];

  v18 = [(CKConversationAvatarSearchResultCell *)self avatarView];
  objc_msgSend(v18, "setStyle:", objc_msgSend(v4, "shouldHaveRoundRectAvatar"));

  [(CKConversationAvatarSearchResultCell *)self setNeedsLayout];
}

+ (int64_t)_titleIconImageTypeForConversation:(id)a3
{
  return [a3 shouldShowVerifiedCheckmark];
}

- (void)_configureNameLabelForConversation:(id)a3 searchText:(id)a4
{
  id v21 = a3;
  id v17 = a4;
  if ([v21 hasDisplayName]) {
    [v21 displayName];
  }
  else {
  double v20 = [v21 name];
  }
  v18 = +[CKUIBehavior sharedBehaviors];
  uint64_t v16 = [v18 theme];
  uint64_t v5 = [v16 conversationListSummaryColor];
  double v6 = +[CKUIBehavior sharedBehaviors];
  id v7 = [v6 searchResultLabelFont];
  double v8 = +[CKUIBehavior sharedBehaviors];
  double v9 = [v8 theme];
  uint64_t v10 = [v9 conversationListSenderColor];
  double v11 = +[CKUIBehavior sharedBehaviors];
  uint64_t v12 = [v11 searchResultLabelFont];
  uint64_t v13 = +[CKSpotlightQueryUtilities annotatedResultStringWithSearchText:v17 resultText:v20 primaryTextColor:v5 primaryFont:v7 annotatedTextColor:v10 annotatedFont:v12];

  CGFloat v14 = [(CKConversationAvatarSearchResultCell *)self nameLabel];
  [v14 setAttributedText:v13];

  double v15 = [(CKConversationAvatarSearchResultCell *)self nameLabel];
  objc_msgSend(v15, "setTitleIconImageType:", +[CKConversationAvatarSearchResultCell _titleIconImageTypeForConversation:](CKConversationAvatarSearchResultCell, "_titleIconImageTypeForConversation:", v21));

  [(CKConversationAvatarSearchResultCell *)self setNeedsLayout];
}

- (double)_adjustedContentWidth
{
  v2 = [(CKConversationAvatarSearchResultCell *)self contentView];
  [v2 bounds];
  double v4 = v3;
  uint64_t v5 = +[CKUIBehavior sharedBehaviors];
  [v5 searchConversationCellPadding];
  double v7 = v4 - v6;

  return v7;
}

- (UIEdgeInsets)marginInsets
{
  double top = self->marginInsets.top;
  double left = self->marginInsets.left;
  double bottom = self->marginInsets.bottom;
  double right = self->marginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->marginInsets = a3;
}

- (BOOL)_ck_isEditing
{
  return self->_ck_editing;
}

- (void)_ck_setEditing:(BOOL)a3
{
  self->_ck_editing = a3;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (void)setResultIdentifier:(id)a3
{
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (CKLabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);

  objc_storeStrong((id *)&self->_resultIdentifier, 0);
}

@end