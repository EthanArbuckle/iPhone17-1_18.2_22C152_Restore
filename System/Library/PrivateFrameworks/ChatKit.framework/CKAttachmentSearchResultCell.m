@interface CKAttachmentSearchResultCell
+ (id)reuseIdentifier;
- (BOOL)suppressAvatars;
- (CGPoint)avatarOffsetLTR;
- (CGPoint)avatarOffsetRTL;
- (CKAttachmentSearchResultCell)initWithFrame:(CGRect)a3;
- (CKSearchAvatarSupplementryView)avatarView;
- (NSString)resultIdentifier;
- (UIDateLabel)dateLabel;
- (UIEdgeInsets)marginInsets;
- (UILabel)titleLabel;
- (double)editModeHorizontalOffset;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_thumbnailGenerated:(id)a3;
- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAvatarView:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setResultIdentifier:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSuppressAvatars:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation CKAttachmentSearchResultCell

- (CKAttachmentSearchResultCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v30.receiver = self;
  v30.super_class = (Class)CKAttachmentSearchResultCell;
  v7 = -[CKAttachmentSearchResultCell initWithFrame:](&v30, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", x, y, width, height);
    [v8 setContentMode:1];
    [(CKEditableSearchResultCell *)v7 setImageView:v8];
    v9 = [(CKAttachmentSearchResultCell *)v7 contentView];
    [v9 addSubview:v8];

    id v10 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
    v16 = +[CKUIBehavior sharedBehaviors];
    v17 = [v16 searchAttachmentResultLabelFont];
    [v15 setFont:v17];

    [v15 setNumberOfLines:2];
    [v15 setTextAlignment:1];
    [(CKAttachmentSearchResultCell *)v7 setTitleLabel:v15];
    v18 = [(CKAttachmentSearchResultCell *)v7 contentView];
    [v18 addSubview:v15];

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42920]), "initWithFrame:", v11, v12, v13, v14);
    v20 = +[CKUIBehavior sharedBehaviors];
    v21 = [v20 searchAttachmentResultDateLabelFont];
    [v19 setFont:v21];

    v22 = +[CKUIBehavior sharedBehaviors];
    v23 = [v22 theme];
    v24 = [v23 spotlightAttachmentSecondaryColor];
    [v19 setTextColor:v24];

    [v19 setNumberOfLines:1];
    [v19 setTextAlignment:1];
    [(CKAttachmentSearchResultCell *)v7 setDateLabel:v19];
    v25 = [(CKAttachmentSearchResultCell *)v7 contentView];
    [v25 addSubview:v19];

    v26 = -[CKSearchAvatarSupplementryView initWithFrame:]([CKSearchAvatarSupplementryView alloc], "initWithFrame:", v11, v12, v13, v14);
    [(CKSearchAvatarSupplementryView *)v26 setParentContentType:3];
    [(CKAttachmentSearchResultCell *)v7 setAvatarView:v26];
    v27 = [(CKAttachmentSearchResultCell *)v7 contentView];
    [v27 addSubview:v26];

    v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 addObserver:v7 selector:sel__thumbnailGenerated_ name:@"CKSearchThumbnailDidChange" object:0];
  }
  return v7;
}

- (CGPoint)avatarOffsetLTR
{
  double v2 = -6.0;
  double v3 = 6.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)avatarOffsetRTL
{
  double v2 = 6.0;
  double v3 = 6.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (double)editModeHorizontalOffset
{
  return 4.0;
}

- (void)layoutSubviews
{
  v151.receiver = self;
  v151.super_class = (Class)CKAttachmentSearchResultCell;
  [(CKEditableSearchResultCell *)&v151 layoutSubviews];
  double v3 = [(CKAttachmentSearchResultCell *)self contentView];
  [v3 bounds];
  double v150 = v4;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  char v11 = [(CKAttachmentSearchResultCell *)self _shouldReverseLayoutDirection];
  double v12 = +[CKUIBehavior sharedBehaviors];
  [v12 searchAttachmentsImageTopPadding];
  CGFloat v14 = v13;

  v15 = [(CKEditableSearchResultCell *)self imageView];
  v16 = [v15 image];

  double v149 = v8;
  if (!v16)
  {
    v55 = [(CKEditableSearchResultCell *)self checkmarkView];
    [v55 setHidden:1];

    v56 = [(CKAttachmentSearchResultCell *)self avatarView];
    [v56 setHidden:1];
LABEL_19:

    goto LABEL_20;
  }
  CGFloat v17 = *MEMORY[0x1E4F1DB28];
  v18 = [(CKEditableSearchResultCell *)self imageView];
  [v18 sizeToFit];

  v19 = [(CKEditableSearchResultCell *)self imageView];
  [v19 frame];
  double v21 = v20;
  double v23 = v22;

  double v24 = v8 / v21;
  double v25 = 0.0;
  if (v21 == 0.0) {
    double v24 = 0.0;
  }
  if (v23 != 0.0) {
    double v25 = v8 / v23;
  }
  double v26 = fmin(v24, v25);
  double v27 = v21 * v26;
  double v28 = v23 * v26;
  if (CKMainScreenScale_once_46 != -1) {
    dispatch_once(&CKMainScreenScale_once_46, &__block_literal_global_115);
  }
  double v29 = *(double *)&CKMainScreenScale_sMainScreenScale_46;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_46 == 0.0) {
    double v29 = 1.0;
  }
  double v30 = v27 * v29;
  double v31 = v28 * v29;
  double v32 = v150 * v29 + floor((v8 * v29 - v27 * v29) * 0.5);
  double v33 = v6 * v29 + floor((v10 * v29 - v28 * v29) * 0.5);
  double v34 = 1.0 / v29;
  double v35 = v34 * v32;
  CGFloat v36 = v34 * v33;
  double v37 = v30 * v34;
  double v38 = v31 * v34;
  v39 = +[CKUIBehavior sharedBehaviors];
  [v39 searchAttachmentsImageTopPadding];
  double v41 = v40;
  v152.origin.double x = v17;
  v152.origin.double y = v14;
  v152.size.double width = v8;
  v152.size.double height = v8;
  double v42 = v41 + CGRectGetHeight(v152);
  v153.origin.double x = v35;
  v153.origin.double y = v36;
  v153.size.double width = v37;
  v153.size.double height = v38;
  double v43 = v42 - CGRectGetHeight(v153);

  v44 = [(CKEditableSearchResultCell *)self imageView];
  objc_msgSend(v44, "setFrame:", v35, v43, v37, v38);

  v45 = [(CKAttachmentSearchResultCell *)self avatarView];
  objc_msgSend(v45, "setHidden:", -[CKAttachmentSearchResultCell suppressAvatars](self, "suppressAvatars"));

  v46 = +[CKUIBehavior sharedBehaviors];
  [v46 searchResultAvatarSize];
  double v48 = v47;
  v49 = +[CKUIBehavior sharedBehaviors];
  [v49 searchResultAvatarSize];
  double v51 = v50;

  if (v11)
  {
    [(CKAttachmentSearchResultCell *)self avatarOffsetRTL];
    double v53 = v35 + v52;
    [(CKAttachmentSearchResultCell *)self avatarOffsetRTL];
  }
  else
  {
    v154.origin.double x = v35;
    v154.origin.double y = v43;
    v154.size.double width = v37;
    v154.size.double height = v38;
    double MaxX = CGRectGetMaxX(v154);
    v155.origin.double x = v35;
    v155.origin.double y = v43;
    v155.size.double width = v48;
    v155.size.double height = v51;
    double v58 = MaxX - CGRectGetWidth(v155);
    [(CKAttachmentSearchResultCell *)self avatarOffsetLTR];
    double v53 = v58 + v59;
    [(CKAttachmentSearchResultCell *)self avatarOffsetLTR];
  }
  double v60 = v43 + v54;
  v61 = [(CKAttachmentSearchResultCell *)self avatarView];
  objc_msgSend(v61, "setFrame:", v53, v60, v48, v51);

  v62 = [(CKEditableSearchResultCell *)self checkmarkView];

  double v8 = v149;
  if (v62)
  {
    [(CKAttachmentSearchResultCell *)self editModeHorizontalOffset];
    double v148 = v63;
    v64 = [(CKEditableSearchResultCell *)self checkmarkView];
    [v64 setHidden:0];

    LODWORD(v64) = [(CKAttachmentSearchResultCell *)self _shouldReverseLayoutDirection];
    v65 = [(CKAttachmentSearchResultCell *)self contentView];
    v66 = [(CKEditableSearchResultCell *)self checkmarkView];
    [v65 bringSubviewToFront:v66];

    v67 = [(CKEditableSearchResultCell *)self checkmarkView];
    [v67 sizeToFit];

    v68 = [(CKEditableSearchResultCell *)self checkmarkView];
    [v68 frame];
    CGFloat v70 = v69;
    CGFloat v72 = v71;
    double v74 = v73;
    double v76 = v75;

    double v77 = v35;
    double v78 = v43;
    double v79 = v37;
    double v80 = v38;
    if (v64)
    {
      double v81 = v148 + CGRectGetMinX(*(CGRect *)&v77);
    }
    else
    {
      double v147 = v43;
      double v82 = v35;
      double v83 = v38;
      double v84 = v37;
      double v85 = CGRectGetMaxX(*(CGRect *)&v77);
      v156.origin.double x = v70;
      v156.origin.double y = v72;
      v156.size.double width = v74;
      v156.size.double height = v76;
      double v86 = v85 - CGRectGetWidth(v156);
      double v37 = v84;
      double v38 = v83;
      double v35 = v82;
      double v43 = v147;
      double v81 = v86 - v148;
    }
    v157.origin.double x = v35;
    v157.origin.double y = v43;
    v157.size.double width = v37;
    v157.size.double height = v38;
    double MaxY = CGRectGetMaxY(v157);
    v158.origin.double x = v81;
    v158.origin.double y = v72;
    v158.size.double width = v74;
    v158.size.double height = v76;
    double v88 = MaxY - CGRectGetHeight(v158) + -4.0;
    v56 = [(CKEditableSearchResultCell *)self checkmarkView];
    objc_msgSend(v56, "setFrame:", v81, v88, v74, v76);
    double v8 = v149;
    goto LABEL_19;
  }
LABEL_20:
  v89 = +[CKUIBehavior sharedBehaviors];
  v90 = [v89 theme];
  v91 = [v90 attachmentBalloonRichIconOutlineColor];

  v92 = [(CKEditableSearchResultCell *)self imageView];
  v93 = [v92 layer];

  id v94 = v91;
  objc_msgSend(v93, "setBorderColor:", objc_msgSend(v94, "CGColor"));
  if (CKPixelWidth_once_8 != -1) {
    dispatch_once(&CKPixelWidth_once_8, &__block_literal_global_159_0);
  }
  [v93 setBorderWidth:*(double *)&CKPixelWidth_sPixel_8];
  [(CKAttachmentSearchResultCell *)self bounds];
  double v96 = v95;
  v97 = +[CKUIBehavior sharedBehaviors];
  [v97 searchAttachmentsCellPadding];
  double v99 = v96 + v98 * -2.0;

  v100 = [(CKAttachmentSearchResultCell *)self titleLabel];
  objc_msgSend(v100, "sizeThatFits:", v99, 1.79769313e308);
  double v102 = v101;
  double v104 = v103;

  v105 = [(CKAttachmentSearchResultCell *)self titleLabel];
  v106 = +[CKUIBehavior sharedBehaviors];
  [v106 searchAttachmentsTitleTopPadding];
  objc_msgSend(v105, "drawTextInRect:", 0.0, 0.0, v102 + v107, v104);

  v108 = +[CKUIBehavior sharedBehaviors];
  [v108 searchAttachmentsTitleTopPadding];
  double v110 = v102 + v109;

  if (CKMainScreenScale_once_46 != -1) {
    dispatch_once(&CKMainScreenScale_once_46, &__block_literal_global_115);
  }
  double v111 = *(double *)&CKMainScreenScale_sMainScreenScale_46;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_46 == 0.0) {
    double v111 = 1.0;
  }
  double v112 = v110 * v111;
  double v113 = v104 * v111;
  double v114 = v150 * v111 + floor((v8 * v111 - v110 * v111) * 0.5);
  double v115 = 1.0 / v111;
  double v116 = v115 * v114;
  double v117 = v112 * v115;
  double v118 = v113 * v115;
  v119 = [(CKEditableSearchResultCell *)self imageView];
  [v119 frame];
  double v120 = CGRectGetMaxY(v159);
  v121 = +[CKUIBehavior sharedBehaviors];
  [v121 searchAttachmentsTitleTopPadding];
  double v123 = v120 + v122;

  v124 = [(CKAttachmentSearchResultCell *)self titleLabel];
  objc_msgSend(v124, "setFrame:", v116, v123, v117, v118);

  v125 = [(CKAttachmentSearchResultCell *)self dateLabel];
  objc_msgSend(v125, "sizeThatFits:", v99, 1.79769313e308);
  double v127 = v126;
  double v129 = v128;

  if (CKMainScreenScale_once_46 != -1) {
    dispatch_once(&CKMainScreenScale_once_46, &__block_literal_global_115);
  }
  double v130 = *(double *)&CKMainScreenScale_sMainScreenScale_46;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_46 == 0.0) {
    double v130 = 1.0;
  }
  double v131 = v127 * v130;
  double v132 = v129 * v130;
  double v133 = v150 * v130 + floor((v149 * v130 - v127 * v130) * 0.5);
  double v134 = 1.0 / v130;
  double v135 = v134 * v133;
  double v136 = v131 * v134;
  double v137 = v132 * v134;
  v160.origin.double x = v116;
  v160.origin.double y = v123;
  v160.size.double width = v117;
  v160.size.double height = v118;
  double v138 = CGRectGetMaxY(v160);
  v139 = +[CKUIBehavior sharedBehaviors];
  [v139 searchAttachmentsCellDatePadding];
  double v141 = v138 + v140;

  v142 = [(CKAttachmentSearchResultCell *)self dateLabel];
  objc_msgSend(v142, "setFrame:", v135, v141, v136, v137);

  v143 = [(CKAttachmentSearchResultCell *)self dateLabel];
  v161.origin.double x = v116;
  v161.origin.double y = v123;
  v161.size.double width = v117;
  v161.size.double height = v118;
  double v144 = CGRectGetMaxY(v161);
  v145 = +[CKUIBehavior sharedBehaviors];
  [v145 searchAttachmentsCellDatePadding];
  [v143 _setFirstLineCapFrameOriginY:v144 + v146];
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)CKAttachmentSearchResultCell;
  [(CKEditableSearchResultCell *)&v7 prepareForReuse];
  double v3 = [(CKAttachmentSearchResultCell *)self avatarView];
  [v3 prepareForReuse];

  [(CKAttachmentSearchResultCell *)self setResultIdentifier:0];
  double v4 = [(CKEditableSearchResultCell *)self imageView];
  [v4 setImage:0];

  double v5 = [(CKAttachmentSearchResultCell *)self titleLabel];
  [v5 setText:0];

  double v6 = [(CKAttachmentSearchResultCell *)self dateLabel];
  [v6 setDate:0];
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  [v4 frame];
  double x = v23.origin.x;
  double y = v23.origin.y;
  double width = v23.size.width;
  double v8 = CGRectGetWidth(v23);
  double v9 = [(CKAttachmentSearchResultCell *)self titleLabel];
  objc_msgSend(v9, "sizeThatFits:", v8, 1.79769313e308);
  double v11 = v10;

  double v12 = [(CKAttachmentSearchResultCell *)self dateLabel];
  objc_msgSend(v12, "sizeThatFits:", v8, 1.79769313e308);
  double v14 = v13;

  v15 = +[CKUIBehavior sharedBehaviors];
  [v15 searchAttachmentsImageTopPadding];
  double v17 = v14 + v11 + width + v16;
  v18 = +[CKUIBehavior sharedBehaviors];
  [v18 searchAttachmentsTitleTopPadding];
  double v20 = v17 + v19 * 3.0;

  objc_msgSend(v4, "setFrame:", x, y, width, v20);

  return v4;
}

+ (id)reuseIdentifier
{
  return @"AttachmentSearchCell";
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  id v44 = a3;
  id v7 = a4;
  double v8 = [v44 identifier];
  [(CKAttachmentSearchResultCell *)self setResultIdentifier:v8];

  double v9 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
  char v10 = [v9 hasCachedPreviewForQueryResult:v44];

  double v11 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
  double v12 = v11;
  if ((v10 & 1) == 0)
  {
    [v11 generatePreviewForQueryResult:v44];
    double v13 = 0;
    goto LABEL_6;
  }
  double v13 = [v11 cachedPreviewForQueryResult:v44];

  if (v13)
  {
    double v14 = [(CKEditableSearchResultCell *)self imageView];
    [v14 setImage:v13];

    if (CKIsRunningInMacCatalyst())
    {
      v15 = [(CKEditableSearchResultCell *)self imageView];
      [v15 setContentMode:2];

      double v12 = [(CKEditableSearchResultCell *)self imageView];
      [v12 setClipsToBounds:1];
LABEL_6:
    }
  }
  double v16 = [v44 item];
  double v17 = [v16 attributeSet];

  v18 = objc_msgSend(v17, "__ck_spotlightItemSnippet");
  double v19 = [v18 stringByDeletingPathExtension];

  if ([v19 length])
  {
    double v41 = +[CKUIBehavior sharedBehaviors];
    double v40 = [v41 theme];
    double v38 = [v40 searchAttachmentsTitleTextColor];
    v39 = +[CKUIBehavior sharedBehaviors];
    double v20 = [v39 searchResultLabelFont];
    double v21 = +[CKUIBehavior sharedBehaviors];
    [v21 theme];
    double v43 = v17;
    v23 = id v22 = v7;
    [v23 conversationListSenderColor];
    double v42 = self;
    v25 = double v24 = v13;
    double v26 = +[CKUIBehavior sharedBehaviors];
    double v27 = [v26 searchResultLabelFont];
    double v28 = +[CKSpotlightQueryUtilities annotatedResultStringWithSearchText:v22 resultText:v19 primaryTextColor:v38 primaryFont:v20 annotatedTextColor:v25 annotatedFont:v27];

    double v13 = v24;
    self = v42;

    id v7 = v22;
    double v17 = v43;

    double v29 = [(CKAttachmentSearchResultCell *)v42 titleLabel];
    [v29 setAttributedText:v28];
  }
  double v30 = [v17 contentCreationDate];
  double v31 = [(CKAttachmentSearchResultCell *)self dateLabel];
  [v31 setDate:v30];

  double v32 = +[CKSpotlightQueryResultUtilities contactForResult:v44];
  double v33 = [(CKAttachmentSearchResultCell *)self avatarView];
  [v33 setContact:v32];

  double v34 = [(CKEditableSearchResultCell *)self imageView];
  double v35 = [v34 layer];

  CGFloat v36 = +[CKUIBehavior sharedBehaviors];
  [v36 searchAttachmentsCellCornerRadius];
  objc_msgSend(v35, "setCornerRadius:");

  double v37 = [(CKEditableSearchResultCell *)self imageView];
  [v37 setClipsToBounds:1];

  [(CKAttachmentSearchResultCell *)self setNeedsLayout];
}

- (void)_thumbnailGenerated:(id)a3
{
  id v12 = [a3 object];
  id v4 = [v12 identifier];
  double v5 = [(CKAttachmentSearchResultCell *)self resultIdentifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
    double v8 = [v7 cachedPreviewForQueryResult:v12];

    if (v8)
    {
      double v9 = [(CKEditableSearchResultCell *)self imageView];
      [v9 setImage:v8];

      if (CKIsRunningInMacCatalyst())
      {
        char v10 = [(CKEditableSearchResultCell *)self imageView];
        [v10 setContentMode:2];

        double v11 = [(CKEditableSearchResultCell *)self imageView];
        [v11 setClipsToBounds:1];
      }
    }
    [(CKAttachmentSearchResultCell *)self setNeedsLayout];
    [(CKAttachmentSearchResultCell *)self layoutIfNeeded];
  }
}

- (void)setSelected:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKAttachmentSearchResultCell;
  [(CKEditableSearchResultCell *)&v3 setSelected:a3];
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

- (BOOL)suppressAvatars
{
  return self->_suppressAvatars;
}

- (void)setSuppressAvatars:(BOOL)a3
{
  self->_suppressAvatars = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIDateLabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (void)setResultIdentifier:(id)a3
{
}

- (CKSearchAvatarSupplementryView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end