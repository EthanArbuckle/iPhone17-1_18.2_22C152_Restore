@interface CKMessageSearchResultCell
+ (id)reuseIdentifier;
- (BOOL)isFromGroupConversation;
- (BOOL)isFromMe;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKAvatarView)avatarView;
- (CKDateLabel)dateLabel;
- (CKLabel)conversationNameLabel;
- (CKLabel)senderLabel;
- (CKMessageSearchResultCell)initWithFrame:(CGRect)a3;
- (CKMessageSearchResultVisibilityContext)visibilityContext;
- (CKTextBalloonView)balloonView;
- (NSString)resultIdentifier;
- (UIEdgeInsets)marginInsets;
- (UIImageView)chevronImageView;
- (UIView)groupingSeparatorView;
- (id)_annotatedResultStringForResult:(id)a3 searchText:(id)a4;
- (id)_balloonFilterForUserInterfaceStyle:(int64_t)a3;
- (void)_configureAvatarForResult:(id)a3;
- (void)_configureBalloonViewForResult:(id)a3 searchText:(id)a4;
- (void)_configureDateLabelForResult:(id)a3;
- (void)_configureLabelFonts;
- (void)_configureSenderLabelForResult:(id)a3 searchText:(id)a4;
- (void)_internalInit;
- (void)_layoutInternalSubviews;
- (void)_proposedBalloonY:(double *)a3 afterLayoutForView:(id)a4;
- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5;
- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5 visibilityContext:(CKMessageSearchResultVisibilityContext *)a6;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAvatarView:(id)a3;
- (void)setBalloonView:(id)a3;
- (void)setChevronImageView:(id)a3;
- (void)setConversationNameLabel:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setGroupingSeparatorView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsFromGroupConversation:(BOOL)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setResultIdentifier:(id)a3;
- (void)setSenderLabel:(id)a3;
- (void)setVisibilityContext:(CKMessageSearchResultVisibilityContext *)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKMessageSearchResultCell

- (CKMessageSearchResultCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKMessageSearchResultCell;
  v3 = -[CKMessageSearchResultCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CKMessageSearchResultCell *)v3 _internalInit];
  }
  return v4;
}

- (void)_internalInit
{
  v3 = objc_alloc_init(CKLabel);
  [(CKLabel *)v3 setAdjustsFontForContentSizeCategory:1];
  v4 = +[CKUIBehavior sharedBehaviors];
  v5 = [v4 searchMessagesDMConversationFont];
  [(CKLabel *)v3 setFont:v5];

  [(CKLabel *)v3 setLineBreakMode:4];
  [(CKLabel *)v3 setNumberOfLines:0];
  [(CKLabel *)v3 setOpaque:0];
  [(CKLabel *)v3 setTextAlignment:4];
  objc_super v6 = +[CKUIBehavior sharedBehaviors];
  v7 = [v6 searchMessagesConversationLabelColor];
  [(CKLabel *)v3 setTextColor:v7];

  v8 = [(CKMessageSearchResultCell *)self contentView];
  [v8 addSubview:v3];

  conversationNameLabel = self->_conversationNameLabel;
  self->_conversationNameLabel = v3;
  v10 = v3;

  v11 = objc_alloc_init(CKLabel);
  [(CKLabel *)v11 setAdjustsFontForContentSizeCategory:1];
  v12 = +[CKUIBehavior sharedBehaviors];
  v13 = [v12 searchMessagesSenderFont];
  [(CKLabel *)v11 setFont:v13];

  [(CKLabel *)v11 setLineBreakMode:4];
  [(CKLabel *)v11 setNumberOfLines:0];
  [(CKLabel *)v11 setOpaque:0];
  [(CKLabel *)v11 setTextAlignment:4];
  v14 = +[CKUIBehavior sharedBehaviors];
  v15 = [v14 searchMessagesSenderLabelColor];
  [(CKLabel *)v11 setTextColor:v15];

  v16 = [(CKMessageSearchResultCell *)self contentView];
  [v16 addSubview:v11];

  senderLabel = self->_senderLabel;
  self->_senderLabel = v11;
  v18 = v11;

  v19 = objc_alloc_init(CKDateLabel);
  [(CKDateLabel *)v19 setAdjustsFontForContentSizeCategory:1];
  v20 = +[CKUIBehavior sharedBehaviors];
  v21 = [v20 searchMessagesDateFont];
  [(CKDateLabel *)v19 setFont:v21];

  v22 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [(CKDateLabel *)v19 setTextColor:v22];

  [(CKDateLabel *)v19 setNumberOfLines:0];
  [(CKDateLabel *)v19 setOpaque:0];
  v23 = [(CKMessageSearchResultCell *)self contentView];
  [v23 addSubview:v19];

  dateLabel = self->_dateLabel;
  self->_dateLabel = v19;
  v25 = v19;

  v26 = [CKTextBalloonView alloc];
  v27 = -[CKTextBalloonView initWithFrame:](v26, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CKTextBalloonView *)v27 setUserInteractionEnabled:0];
  [(CKColoredBalloonView *)v27 setWantsGradient:0];
  v28 = [(CKMessageSearchResultCell *)self contentView];
  [v28 addSubview:v27];

  balloonView = self->_balloonView;
  self->_balloonView = v27;
  v30 = v27;

  v31 = +[CKUIBehavior sharedBehaviors];
  id v45 = [v31 chevronImage];

  [v45 size];
  v34 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", 0.0, 0.0, v32, v33);
  [(UIImageView *)v34 setContentMode:4];
  v35 = +[CKUIBehavior sharedBehaviors];
  v36 = [v35 theme];
  v37 = [v36 conversationListChevronColor];
  [(UIImageView *)v34 setTintColor:v37];

  [(UIImageView *)v34 setImage:v45];
  v38 = [(CKMessageSearchResultCell *)self contentView];
  [v38 addSubview:v34];

  chevronImageView = self->_chevronImageView;
  self->_chevronImageView = v34;
  v40 = v34;

  v41 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  v42 = [MEMORY[0x1E4F428B8] separatorColor];
  [(UIView *)v41 setBackgroundColor:v42];

  v43 = [(CKMessageSearchResultCell *)self contentView];
  [v43 addSubview:v41];

  groupingSeparatorView = self->_groupingSeparatorView;
  self->_groupingSeparatorView = v41;
}

- (void)traitCollectionDidChange:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CKMessageSearchResultCell;
  id v4 = a3;
  [(CKMessageSearchResultCell *)&v23 traitCollectionDidChange:v4];
  v5 = [(CKMessageSearchResultCell *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  v7 = [(CKMessageSearchResultCell *)self balloonView];
  v8 = v7;
  if (v7)
  {
    [v7 balloonDescriptor];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
  }

  *((void *)&v21 + 1) = v6;
  v9 = [(CKMessageSearchResultCell *)self balloonView];
  v17[2] = v20;
  v17[3] = v21;
  v17[4] = v22;
  v17[0] = v18;
  v17[1] = v19;
  [v9 setBalloonDescriptor:v17];

  v10 = [(CKMessageSearchResultCell *)self balloonView];
  [v10 setNeedsPrepareForDisplay];

  v11 = [(CKMessageSearchResultCell *)self balloonView];
  [v11 prepareForDisplay];

  uint64_t v12 = [v4 userInterfaceStyle];
  if (v12 != v6)
  {
    v13 = [(CKMessageSearchResultCell *)self _balloonFilterForUserInterfaceStyle:v6];
    v14 = [MEMORY[0x1E4F39BC0] filterWithType:v13];
    v15 = [(CKMessageSearchResultCell *)self balloonView];
    v16 = [v15 layer];
    [v16 setCompositingFilter:v14];
  }
  [(CKMessageSearchResultCell *)self setNeedsLayout];
}

+ (id)reuseIdentifier
{
  return @"CKMessagesSearchResultCell";
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5 visibilityContext:(CKMessageSearchResultVisibilityContext *)a6
{
  id v10 = a4;
  id v11 = a3;
  -[CKMessageSearchResultCell setIsFromMe:](self, "setIsFromMe:", [v11 isFromMe]);
  uint64_t v12 = [v11 conversation];
  -[CKMessageSearchResultCell setIsFromGroupConversation:](self, "setIsFromGroupConversation:", [v12 isGroupConversation]);

  CKMessageSearchResultVisibilityContext v13 = *a6;
  [(CKMessageSearchResultCell *)self setVisibilityContext:&v13];
  [(CKMessageSearchResultCell *)self configureWithQueryResult:v11 searchText:v10 mode:a5];
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  [(CKMessageSearchResultCell *)self _configureBalloonViewForResult:v8 searchText:v7];
  [(CKMessageSearchResultCell *)self _configureAvatarForResult:v8];
  [(CKMessageSearchResultCell *)self _configureSenderLabelForResult:v8 searchText:v7];

  [(CKMessageSearchResultCell *)self _configureDateLabelForResult:v8];

  [(CKMessageSearchResultCell *)self _configureLabelFonts];
}

- (void)_configureLabelFonts
{
  BOOL v3 = [(CKMessageSearchResultCell *)self isFromGroupConversation];
  id v4 = +[CKUIBehavior sharedBehaviors];
  v5 = v4;
  if (v3) {
    [v4 searchMessagesGroupConversationFont];
  }
  else {
  id v10 = [v4 searchMessagesDMConversationFont];
  }

  uint64_t v6 = [(CKMessageSearchResultCell *)self conversationNameLabel];
  [v6 setFont:v10];

  id v7 = +[CKUIBehavior sharedBehaviors];
  id v8 = [v7 searchMessagesSenderFont];
  v9 = [(CKMessageSearchResultCell *)self senderLabel];
  [v9 setFont:v8];
}

- (void)_configureSenderLabelForResult:(id)a3 searchText:(id)a4
{
  id v16 = a3;
  if ([(CKMessageSearchResultCell *)self isFromMe])
  {
    v5 = 0;
  }
  else
  {
    uint64_t v6 = [v16 item];
    id v7 = [v6 attributeSet];
    id v8 = [v7 attributeDictionary];
    v9 = [v8 valueForKey:*MEMORY[0x1E4F22B30]];

    v5 = [v9 firstObject];
  }
  id v10 = [v16 conversation];
  if ([v10 hasDisplayName]) {
    [v10 displayName];
  }
  else {
  id v11 = [v10 name];
  }
  uint64_t v12 = [(CKMessageSearchResultCell *)self conversationNameLabel];
  [v12 setText:v11];

  LODWORD(v12) = [(CKMessageSearchResultCell *)self isFromGroupConversation];
  CKMessageSearchResultVisibilityContext v13 = [(CKMessageSearchResultCell *)self senderLabel];
  v14 = v13;
  if (v12) {
    v15 = v5;
  }
  else {
    v15 = 0;
  }
  [v13 setText:v15];
}

- (void)_configureDateLabelForResult:(id)a3
{
  id v7 = [a3 item];
  id v4 = [v7 attributeSet];
  v5 = [v4 contentCreationDate];

  uint64_t v6 = [(CKMessageSearchResultCell *)self dateLabel];
  [v6 setDate:v5];
}

- (void)_configureBalloonViewForResult:(id)a3 searchText:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(CKMessageSearchResultCell *)self _annotatedResultStringForResult:v6 searchText:a4];
  id v8 = [v6 item];

  v9 = [v8 domainIdentifier];

  uint64_t v42 = 0;
  IMComponentsFromChatGUID();
  id v10 = 0;
  id v11 = [MEMORY[0x1E4F6BDB8] serviceWithName:v10];
  if ([(CKMessageSearchResultCell *)self isFromMe])
  {
    char v12 = objc_msgSend(v11, "__ck_displayColor");
    char v13 = 1;
  }
  else
  {
    char v13 = 0;
    char v12 = -1;
  }
  memset(v43, 0, sizeof(v43));
  v14 = [(CKMessageSearchResultCell *)self traitCollection];
  uint64_t v15 = [v14 userInterfaceStyle];

  id v16 = [(CKMessageSearchResultCell *)self balloonView];
  long long v36 = *(_OWORD *)v43;
  __int16 v30 = 256;
  char v31 = 0;
  char v32 = v13;
  int v33 = 0;
  uint64_t v34 = -1;
  char v35 = v12;
  *(_OWORD *)v37 = *(_OWORD *)&v43[16];
  *(void *)&v37[15] = unk_18F81CF00;
  uint64_t v38 = v15;
  uint64_t v39 = 0;
  int v40 = 256;
  int v41 = 0;
  [v16 setBalloonDescriptor:&v30];

  v17 = [(CKMessageSearchResultCell *)self balloonView];
  [v17 setAttributedText:v7];

  long long v18 = [(CKMessageSearchResultCell *)self balloonView];
  [v18 setNeedsPrepareForDisplay];

  long long v19 = [(CKMessageSearchResultCell *)self balloonView];
  [v19 prepareForDisplay];

  if ([(CKMessageSearchResultCell *)self isFromMe])
  {
    long long v20 = [(CKMessageSearchResultCell *)self balloonView];
    long long v21 = [v20 layer];
    [v21 setCompositingFilter:0];

    long long v22 = [(CKMessageSearchResultCell *)self contentView];
    objc_super v23 = [v22 layer];
    [v23 setAllowsGroupBlending:1];
  }
  else
  {
    v24 = [(CKMessageSearchResultCell *)self traitCollection];
    uint64_t v25 = [v24 userInterfaceStyle];

    long long v22 = [(CKMessageSearchResultCell *)self _balloonFilterForUserInterfaceStyle:v25];
    objc_super v23 = [MEMORY[0x1E4F39BC0] filterWithType:v22];
    v26 = [(CKMessageSearchResultCell *)self balloonView];
    v27 = [v26 layer];
    [v27 setCompositingFilter:v23];

    v28 = [(CKMessageSearchResultCell *)self contentView];
    v29 = [v28 layer];
    [v29 setAllowsGroupBlending:0];
  }
}

- (void)_configureAvatarForResult:(id)a3
{
  id v20 = a3;
  BOOL v4 = [(CKMessageSearchResultCell *)self isFromMe];
  avatarView = self->_avatarView;
  if (v4)
  {
    [(CKAvatarView *)avatarView removeFromSuperview];
    id v6 = self->_avatarView;
    self->_avatarView = 0;
  }
  else
  {
    if (!avatarView)
    {
      double v7 = *MEMORY[0x1E4F1DAD8];
      double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      v9 = +[CKUIBehavior sharedBehaviors];
      [v9 searchMessagesAvatarSize];
      double v11 = v10;
      double v13 = v12;

      v14 = -[CKAvatarView initWithFrame:]([CKAvatarView alloc], "initWithFrame:", v7, v8, v11, v13);
      uint64_t v15 = self->_avatarView;
      self->_avatarView = v14;

      [(CNAvatarView *)self->_avatarView setAsynchronousRendering:1];
      [(CKAvatarView *)self->_avatarView setUserInteractionEnabled:0];
      [(CNAvatarView *)self->_avatarView setShowsContactOnTap:0];
      [(CNAvatarView *)self->_avatarView setDelegate:0];
      [(CNAvatarView *)self->_avatarView setBypassActionValidation:1];
      id v16 = [(CKMessageSearchResultCell *)self contentView];
      [v16 addSubview:self->_avatarView];

      avatarView = self->_avatarView;
    }
    if ([(CNAvatarView *)avatarView isDisplayingContent]) {
      [(CNAvatarView *)self->_avatarView setAllowStaleRendering:1];
    }
    id v6 = [v20 conversation];
    if ([v6 isBusinessConversation])
    {
      uint64_t v17 = [MEMORY[0x1E4F1BB38] maxContactAvatars];
      long long v18 = [v6 conversationVisualIdentityWithKeys:MEMORY[0x1E4F1CBF0] requestedNumberOfContactsToFetch:v17];
      id v19 = [(CNAvatarView *)self->_avatarView updateViewWithGroupIdentity:v18];
    }
    else
    {
      long long v18 = +[CKSpotlightQueryResultUtilities contactForResult:v20];
      [(CNAvatarView *)self->_avatarView setContact:v18];
    }

    -[CNAvatarView setStyle:](self->_avatarView, "setStyle:", [v6 shouldHaveRoundRectAvatar]);
    [(CKMessageSearchResultCell *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(CKMessageSearchResultCell *)self layoutIfNeeded];
  BOOL v4 = [(CKMessageSearchResultCell *)self contentView];
  [v4 bounds];
  double v6 = v5;

  double v7 = [(CKMessageSearchResultCell *)self balloonView];
  [v7 frame];
  double MaxY = CGRectGetMaxY(v13);
  [(CKMessageSearchResultCell *)self visibilityContext];

  double v9 = v6;
  double v10 = MaxY + v11;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKMessageSearchResultCell;
  [(CKEditableSearchResultCell *)&v3 layoutSubviews];
  [(CKMessageSearchResultCell *)self _layoutInternalSubviews];
}

- (void)_layoutInternalSubviews
{
  objc_super v3 = [(CKMessageSearchResultCell *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  [(CKMessageSearchResultCell *)self marginInsets];
  double v7 = v6;
  [(CKMessageSearchResultCell *)self marginInsets];
  double v9 = v8;
  double v10 = [(CKMessageSearchResultCell *)self contentView];
  [v10 bounds];
  double v12 = v11;

  int v13 = [(CKMessageSearchResultCell *)self _shouldReverseLayoutDirection];
  v14 = +[CKUIBehavior sharedBehaviors];
  char v15 = [v14 isAccessibilityPreferredContentSizeCategory];

  double v149 = v12;
  double v147 = v12 - v7;
  double v16 = v12 - v7 - v9;
  uint64_t v17 = [(CKMessageSearchResultCell *)self dateLabel];
  objc_msgSend(v17, "sizeThatFits:", v16, 1.79769313e308);
  double v19 = v18;
  double v21 = v20;

  long long v22 = [(CKMessageSearchResultCell *)self dateLabel];
  double v23 = 0.0;
  objc_msgSend(v22, "setFrame:", 0.0, 0.0, v19, v21);

  if ((v15 & 1) != 0 || v19 > v16 / 3.0)
  {
    int v24 = 1;
  }
  else
  {
    int v24 = 0;
    double v23 = v19;
  }
  double v25 = v16 - v23;
  v26 = [(CKMessageSearchResultCell *)self conversationNameLabel];
  objc_msgSend(v26, "sizeThatFits:", v16 - v23, 1.79769313e308);
  double v28 = v27;
  double v30 = v29;

  char v31 = [(CKMessageSearchResultCell *)self conversationNameLabel];
  objc_msgSend(v31, "setFrame:", 0.0, 0.0, v28, v30);

  char v32 = [(CKMessageSearchResultCell *)self senderLabel];
  objc_msgSend(v32, "sizeThatFits:", v25, 1.79769313e308);
  double v34 = v33;
  double v36 = v35;

  v37 = [(CKMessageSearchResultCell *)self senderLabel];
  objc_msgSend(v37, "setFrame:", 0.0, 0.0, v34, v36);

  [(CKMessageSearchResultCell *)self visibilityContext];
  double v38 = *(double *)&v158[2];
  [(CKMessageSearchResultCell *)self visibilityContext];
  v158[0] = v157;
  [(CKMessageSearchResultCell *)self visibilityContext];
  uint64_t v39 = [(CKMessageSearchResultCell *)self conversationNameLabel];
  int v40 = v39;
  if (v156)
  {
    [v39 setHidden:0];

    int v41 = [(CKMessageSearchResultCell *)self conversationNameLabel];
    [v41 frame];
    double v43 = v42;
    uint64_t v44 = [(CKMessageSearchResultCell *)self conversationNameLabel];
    [v44 frame];
    double v46 = v45;
    v47 = [(CKMessageSearchResultCell *)self conversationNameLabel];
    objc_msgSend(v47, "setFrame:", v7, v38, v43, v46);

    v48 = [(CKMessageSearchResultCell *)self conversationNameLabel];
    int v40 = [(CKMessageSearchResultCell *)self conversationNameLabel];
    [(CKMessageSearchResultCell *)self _proposedBalloonY:v158 afterLayoutForView:v40];
  }
  else
  {
    [v39 setHidden:1];
    v48 = 0;
  }

  [(CKMessageSearchResultCell *)self visibilityContext];
  if (v155)
  {
    [(CKMessageSearchResultCell *)self visibilityContext];
    if (v154)
    {
      [v48 frame];
      double MaxY = CGRectGetMaxY(v159);
      v50 = +[CKUIBehavior sharedBehaviors];
      [v50 searchMessagesConversationToSenderSpacing];
      double v38 = MaxY + v51;
    }
    v52 = [(CKMessageSearchResultCell *)self senderLabel];
    [v52 setHidden:0];

    v53 = [(CKMessageSearchResultCell *)self senderLabel];
    [v53 frame];
    double v55 = v54;
    v56 = [(CKMessageSearchResultCell *)self senderLabel];
    [v56 frame];
    double v58 = v57;
    v59 = [(CKMessageSearchResultCell *)self senderLabel];
    objc_msgSend(v59, "setFrame:", v7, v38, v55, v58);

    uint64_t v60 = [(CKMessageSearchResultCell *)self senderLabel];

    v61 = [(CKMessageSearchResultCell *)self senderLabel];
    [(CKMessageSearchResultCell *)self _proposedBalloonY:v158 afterLayoutForView:v61];
    v48 = (void *)v60;
  }
  else
  {
    v61 = [(CKMessageSearchResultCell *)self senderLabel];
    [v61 setHidden:0];
  }

  [(CKMessageSearchResultCell *)self visibilityContext];
  double v151 = v7;
  double v148 = v9;
  if (v153)
  {
    if (v24)
    {
      [v48 frame];
      double v62 = CGRectGetMaxY(v160);
      v63 = +[CKUIBehavior sharedBehaviors];
      [v63 searchMessagesConversationToSenderSpacing];
      double v38 = v62 + v64;
    }
    else
    {
      v63 = [(CKMessageSearchResultCell *)self dateLabel];
      [v63 frame];
      double v7 = v149 - v9 - v66;
    }

    uint64_t v67 = [(CKMessageSearchResultCell *)self dateLabel];

    v68 = [(CKMessageSearchResultCell *)self dateLabel];
    [v68 setHidden:0];

    v69 = [(CKMessageSearchResultCell *)self dateLabel];
    [v69 frame];
    double v71 = v70;
    v72 = [(CKMessageSearchResultCell *)self dateLabel];
    [v72 frame];
    double v74 = v73;
    v75 = [(CKMessageSearchResultCell *)self dateLabel];
    objc_msgSend(v75, "setFrame:", v7, v38, v71, v74);

    v65 = [(CKMessageSearchResultCell *)self dateLabel];
    [(CKMessageSearchResultCell *)self _proposedBalloonY:v158 afterLayoutForView:v65];
    v48 = (void *)v67;
  }
  else
  {
    v65 = [(CKMessageSearchResultCell *)self dateLabel];
    [v65 setHidden:1];
  }

  double v76 = *(double *)v158;
  if (v48)
  {
    v77 = +[CKUIBehavior sharedBehaviors];
    [v77 searchMessagesSenderToBalloonSpacing];
    double v76 = v76 + v78;
  }
  v79 = [(CKMessageSearchResultCell *)self chevronImageView];
  [v79 frame];
  double v81 = v80;
  double v83 = v82;

  v84 = +[CKUIBehavior sharedBehaviors];
  [v84 searchMessagesHorizontalBalloonMargin];
  double v86 = v16 - v81 - v85;

  v87 = [(CKMessageSearchResultCell *)self balloonView];
  objc_msgSend(v87, "sizeThatFits:", v86, 1.79769313e308);
  double v89 = v88;
  double v91 = v90;

  double v92 = round(v5 * v151) / v5;
  double v93 = round(v5 * v76) / v5;
  double v94 = round(v5 * v89) / v5;
  double v95 = round(v5 * v91);
  double v96 = v149 - v148;
  if (v13) {
    double v97 = v151;
  }
  else {
    double v97 = v149 - v148 - v81;
  }
  double v98 = v95 / v5;
  double v99 = v93;
  double v100 = v94;
  double v101 = v98;
  double v146 = v83 * 0.5;
  CGFloat v102 = CGRectGetMidY(*(CGRect *)&v92) - v83 * 0.5;
  v103 = [(CKMessageSearchResultCell *)self chevronImageView];
  double v150 = v97;
  double v104 = v97;
  double v105 = v83;
  objc_msgSend(v103, "setFrame:", v104, v102, v81, v83);

  BOOL v106 = [(CKMessageSearchResultCell *)self isFromMe];
  if (v13)
  {
    if (v106)
    {
      double v107 = v96 - v94;
LABEL_31:
      double v117 = v151;
      goto LABEL_33;
    }
    v108 = [(CKMessageSearchResultCell *)self chevronImageView];
    [v108 frame];
    double MaxX = CGRectGetMaxX(v162);
    v110 = +[CKUIBehavior sharedBehaviors];
    [v110 searchMessagesBalloonToChevronSpacing];
    double v114 = MaxX + v113;
    v115 = +[CKUIBehavior sharedBehaviors];
    [v115 searchMessagesAvatarSize];
    double v107 = v114 + v116;

LABEL_30:
    goto LABEL_31;
  }
  if (v106)
  {
    v108 = [(CKMessageSearchResultCell *)self chevronImageView];
    [v108 frame];
    double MinX = CGRectGetMinX(v161);
    v110 = +[CKUIBehavior sharedBehaviors];
    [v110 searchMessagesBalloonToChevronSpacing];
    double v107 = MinX - v111 - v94;
    goto LABEL_30;
  }
  v118 = +[CKUIBehavior sharedBehaviors];
  [v118 searchMessagesAvatarSize];
  double v117 = v151;
  double v107 = v151 + v119;

LABEL_33:
  v120 = [(CKMessageSearchResultCell *)self balloonView];
  objc_msgSend(v120, "setFrame:", v107, v93, v94, v98);

  v121 = [(CKMessageSearchResultCell *)self avatarView];
  [v121 frame];
  double v123 = v122;
  double v125 = v124;

  double v126 = v117;
  if (v13)
  {
    v127 = [(CKMessageSearchResultCell *)self chevronImageView];
    [v127 frame];
    double v128 = CGRectGetMaxX(v163);
    v129 = +[CKUIBehavior sharedBehaviors];
    [v129 searchMessagesBalloonToChevronSpacing];
    double v126 = v128 + v130;
  }
  v131 = [(CKMessageSearchResultCell *)self balloonView];
  [v131 frame];
  double v132 = CGRectGetMaxY(v164);
  v133 = +[CKUIBehavior sharedBehaviors];
  [v133 searchMessagesAvatarSize];
  double v135 = v132 - v134;

  v136 = [(CKMessageSearchResultCell *)self avatarView];
  objc_msgSend(v136, "setFrame:", v126, v135, v123, v125);

  if (v13 && ![(CKMessageSearchResultCell *)self isFromMe])
  {
    v165.origin.x = v126;
    v165.origin.y = v135;
    v165.size.width = v123;
    v165.size.height = v125;
    CGFloat v137 = CGRectGetMidY(v165) - v146;
    v138 = [(CKMessageSearchResultCell *)self chevronImageView];
    objc_msgSend(v138, "setFrame:", v150, v137, v81, v105);
  }
  [(CKMessageSearchResultCell *)self visibilityContext];
  if (v152)
  {
    v139 = [(CKMessageSearchResultCell *)self traitCollection];
    [v139 displayScale];
    double v141 = 1.0 / v140;
    v142 = [(CKMessageSearchResultCell *)self groupingSeparatorView];
    objc_msgSend(v142, "setFrame:", v117, 0.0, v147, v141);

    v143 = [(CKMessageSearchResultCell *)self groupingSeparatorView];
    v144 = v143;
    uint64_t v145 = 0;
  }
  else
  {
    v143 = [(CKMessageSearchResultCell *)self groupingSeparatorView];
    v144 = v143;
    uint64_t v145 = 1;
  }
  [v143 setHidden:v145];
}

- (void)_proposedBalloonY:(double *)a3 afterLayoutForView:(id)a4
{
  [a4 frame];
  CGFloat MaxY = CGRectGetMaxY(v6);
  if (*a3 >= MaxY) {
    CGFloat MaxY = *a3;
  }
  *a3 = MaxY;
}

- (id)_annotatedResultStringForResult:(id)a3 searchText:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 item];
  double v9 = [v8 attributeSet];
  double v10 = objc_msgSend(v9, "__ck_spotlightItemSnippet");

  unint64_t v11 = [v10 length];
  double v12 = +[CKUIBehavior sharedBehaviors];
  unint64_t v13 = [v12 searchMessagesMaxSummaryLength];

  if (v11 > v13)
  {
    v14 = +[CKUIBehavior sharedBehaviors];
    uint64_t v15 = objc_msgSend(v10, "ck_trimmedStringWithPreferredLength:anchoredAroundSubstring:", objc_msgSend(v14, "searchMessagesMaxSummaryLength"), v7);

    double v10 = (void *)v15;
  }
  if ([v10 length])
  {
    double v16 = +[CKUIBehavior sharedBehaviors];
    uint64_t v17 = [v16 searchMessagesBalloonFont];

    if ([(CKMessageSearchResultCell *)self isFromMe])
    {
      double v18 = +[CKUIBehavior sharedBehaviors];
      double v19 = [v18 searchMessagesFromMeUnannotatedLabelColor];
    }
    else
    {
      double v19 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    }
    if ([(CKMessageSearchResultCell *)self isFromMe]) {
      [MEMORY[0x1E4F428B8] whiteColor];
    }
    else {
    long long v22 = [MEMORY[0x1E4F428B8] labelColor];
    }
    double v21 = +[CKSpotlightQueryUtilities annotatedResultStringWithSearchText:v7 resultText:v10 primaryTextColor:v19 primaryFont:v17 annotatedTextColor:v22 annotatedFont:v17];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      double v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        id v25 = v6;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Could not identify snippet for result: %@", (uint8_t *)&v24, 0xCu);
      }
    }
    double v21 = 0;
  }

  return v21;
}

- (id)_balloonFilterForUserInterfaceStyle:(int64_t)a3
{
  if (UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityIsReduceMotionEnabled()) {
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    double v4 = (id *)MEMORY[0x1E4F3A2E0];
    goto LABEL_11;
  }
  if (a3 != 2)
  {
LABEL_6:
    id v5 = 0;
    goto LABEL_7;
  }
  double v4 = (id *)MEMORY[0x1E4F3A2E8];
LABEL_11:
  id v5 = *v4;
LABEL_7:

  return v5;
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)CKMessageSearchResultCell;
  [(CKEditableSearchResultCell *)&v8 prepareForReuse];
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v7 = [(CKMessageSearchResultCell *)self balloonView];
  objc_msgSend(v7, "setFrame:", v3, v4, v5, v6);
}

- (void)setHighlighted:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKMessageSearchResultCell;
  -[CKMessageSearchResultCell setHighlighted:](&v11, sel_setHighlighted_);
  double v5 = +[CKBalloonSelectionState balloonSelectionState:0];
  double v6 = (void *)MEMORY[0x1E4F42FF0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__CKMessageSearchResultCell_setHighlighted___block_invoke;
  v8[3] = &unk_1E5623DE8;
  BOOL v10 = a3;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 performWithoutAnimation:v8];
}

void __44__CKMessageSearchResultCell_setHighlighted___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) balloonView];
  [v2 setSelected:*(unsigned __int8 *)(a1 + 48) withSelectionState:*(void *)(a1 + 40)];
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

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (void)setResultIdentifier:(id)a3
{
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (BOOL)isFromGroupConversation
{
  return self->_isFromGroupConversation;
}

- (void)setIsFromGroupConversation:(BOOL)a3
{
  self->_isFromGroupConversation = a3;
}

- (CKMessageSearchResultVisibilityContext)visibilityContext
{
  *retstr = self[31];
  return self;
}

- (void)setVisibilityContext:(CKMessageSearchResultVisibilityContext *)a3
{
  double bottomSpacing = a3->bottomSpacing;
  *(_OWORD *)&self->_visibilityContext.isGroupedResult = *(_OWORD *)&a3->isGroupedResult;
  self->_visibilityContext.double bottomSpacing = bottomSpacing;
}

- (CKLabel)conversationNameLabel
{
  return self->_conversationNameLabel;
}

- (void)setConversationNameLabel:(id)a3
{
}

- (CKLabel)senderLabel
{
  return self->_senderLabel;
}

- (void)setSenderLabel:(id)a3
{
}

- (CKDateLabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
}

- (CKTextBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (UIView)groupingSeparatorView
{
  return self->_groupingSeparatorView;
}

- (void)setGroupingSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingSeparatorView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_balloonView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_senderLabel, 0);
  objc_storeStrong((id *)&self->_conversationNameLabel, 0);

  objc_storeStrong((id *)&self->_resultIdentifier, 0);
}

@end