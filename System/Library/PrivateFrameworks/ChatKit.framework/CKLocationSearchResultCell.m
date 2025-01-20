@interface CKLocationSearchResultCell
+ (id)reuseIdentifier;
- (CKLocationSearchResultCell)initWithFrame:(CGRect)a3;
- (CKSpotlightQueryResult)result;
- (NSString)resultIdentifier;
- (NSString)searchText;
- (UIEdgeInsets)marginInsets;
- (UILabel)placeLabel;
- (UIVisualEffectView)blurEffectView;
- (unint64_t)mode;
- (void)_configurePlaceLabelWithResult:(id)a3 searchText:(id)a4;
- (void)_thumbnailGenerated:(id)a3;
- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)refreshForSearchTextIfNeeded:(id)a3;
- (void)setBlurEffectView:(id)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPlaceLabel:(id)a3;
- (void)setResult:(id)a3;
- (void)setSearchText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKLocationSearchResultCell

- (CKLocationSearchResultCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)CKLocationSearchResultCell;
  v7 = -[CKLocationSearchResultCell initWithFrame:](&v19, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", x, y, width, height);
    [v8 setContentMode:2];
    [(CKEditableSearchResultCell *)v7 setImageView:v8];
    v9 = [(CKLocationSearchResultCell *)v7 contentView];
    [v9 addSubview:v8];

    id v10 = objc_alloc(MEMORY[0x1E4F43028]);
    v11 = [MEMORY[0x1E4F427D8] effectWithStyle:6];
    v12 = (void *)[v10 initWithEffect:v11];

    [(CKLocationSearchResultCell *)v7 setBlurEffectView:v12];
    v13 = [(CKLocationSearchResultCell *)v7 contentView];
    [v13 addSubview:v12];

    id v14 = objc_alloc(MEMORY[0x1E4F42B38]);
    v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v15 setNumberOfLines:1];
    [(CKLocationSearchResultCell *)v7 setPlaceLabel:v15];
    v16 = [(CKLocationSearchResultCell *)v7 contentView];
    [v16 addSubview:v15];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v7 selector:sel__thumbnailGenerated_ name:@"CKSearchThumbnailDidChange" object:0];
  }
  return v7;
}

- (void)layoutSubviews
{
  v58.receiver = self;
  v58.super_class = (Class)CKLocationSearchResultCell;
  [(CKEditableSearchResultCell *)&v58 layoutSubviews];
  v3 = [(CKLocationSearchResultCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(CKEditableSearchResultCell *)self imageView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(CKLocationSearchResultCell *)self layer];
  [v13 setShouldRasterize:1];

  id v14 = [(CKLocationSearchResultCell *)self traitCollection];
  [v14 displayScale];
  double v16 = v15;
  v17 = [(CKLocationSearchResultCell *)self layer];
  [v17 setRasterizationScale:v16];

  v18 = [(CKLocationSearchResultCell *)self placeLabel];
  [v18 layoutIfNeeded];

  double v57 = v9;
  double v19 = v9 + -20.0;
  v20 = [(CKLocationSearchResultCell *)self placeLabel];
  objc_msgSend(v20, "sizeThatFits:", v9 + -20.0, v11 + -20.0);
  double v22 = v21;
  double v24 = v23;

  if (v22 >= v9 + -20.0) {
    double v22 = v9 + -20.0;
  }
  v59.origin.double x = v5;
  v59.origin.double y = v7;
  v59.size.double width = v9;
  v59.size.double height = v11;
  CGFloat v25 = CGRectGetMaxY(v59) + -10.0;
  v26 = [(CKLocationSearchResultCell *)self placeLabel];
  objc_msgSend(v26, "setFrame:", 10.0, v25, v22, v24);

  v27 = [(CKLocationSearchResultCell *)self placeLabel];
  v60.origin.double y = v7 + 10.0;
  v60.origin.double x = v5 + 10.0;
  v60.size.double width = v19;
  v60.size.double height = v11 + -20.0;
  [v27 _setLastLineBaselineFrameOriginY:CGRectGetMaxY(v60)];

  v28 = [(CKLocationSearchResultCell *)self placeLabel];
  [v28 _firstLineCapFrameOriginY];
  double v30 = v29 + -10.0;

  v61.origin.double x = v5;
  v61.origin.double y = v7;
  v61.size.double width = v57;
  CGFloat rect = v11;
  v61.size.double height = v11;
  CGFloat v31 = CGRectGetHeight(v61) - v30;
  v32 = [(CKLocationSearchResultCell *)self blurEffectView];
  CGFloat v33 = v5;
  double v34 = v30;
  CGFloat v35 = v57;
  objc_msgSend(v32, "setFrame:", v5, v34, v57, v31);

  v36 = [(CKEditableSearchResultCell *)self checkmarkView];

  if (v36)
  {
    char v37 = [(CKLocationSearchResultCell *)self _shouldReverseLayoutDirection];
    v38 = [(CKLocationSearchResultCell *)self contentView];
    v39 = [(CKEditableSearchResultCell *)self checkmarkView];
    [v38 bringSubviewToFront:v39];

    v40 = [(CKEditableSearchResultCell *)self checkmarkView];
    [v40 sizeToFit];

    v41 = [(CKEditableSearchResultCell *)self checkmarkView];
    [v41 frame];
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    double v47 = v46;
    double v49 = v48;

    double v50 = 4.0;
    if ((v37 & 1) == 0)
    {
      v62.origin.double x = v33;
      v62.origin.double y = v7;
      v62.size.double width = v57;
      v62.size.double height = rect;
      double Width = CGRectGetWidth(v62);
      v63.origin.double x = v43;
      v63.origin.double y = v45;
      v63.size.double width = v47;
      v63.size.double height = v49;
      double v52 = Width - CGRectGetWidth(v63);
      CGFloat v35 = v57;
      double v50 = v52 + -4.0;
    }
    v64.origin.double x = v33;
    v64.origin.double y = v7;
    v64.size.double width = v35;
    v64.size.double height = rect;
    double Height = CGRectGetHeight(v64);
    v65.origin.double x = v50;
    v65.origin.double y = v45;
    v65.size.double width = v47;
    v65.size.double height = v49;
    double v54 = Height - CGRectGetHeight(v65) + -4.0;
    v55 = [(CKEditableSearchResultCell *)self checkmarkView];
    objc_msgSend(v55, "setFrame:", v50, v54, v47, v49);
  }
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CKLocationSearchResultCell;
  [(CKEditableSearchResultCell *)&v5 prepareForReuse];
  v3 = [(CKEditableSearchResultCell *)self imageView];
  [v3 setImage:0];

  double v4 = [(CKLocationSearchResultCell *)self placeLabel];
  [v4 setAttributedText:0];

  [(CKLocationSearchResultCell *)self setResult:0];
  [(CKLocationSearchResultCell *)self setSearchText:0];
  [(CKLocationSearchResultCell *)self setMode:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKLocationSearchResultCell;
  [(CKLocationSearchResultCell *)&v4 dealloc];
}

+ (id)reuseIdentifier
{
  return @"LocationSearchCell";
}

- (NSString)resultIdentifier
{
  v2 = [(CKLocationSearchResultCell *)self result];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  id v22 = a3;
  id v8 = a4;
  [(CKLocationSearchResultCell *)self setResult:v22];
  [(CKLocationSearchResultCell *)self setSearchText:v8];
  [(CKLocationSearchResultCell *)self setMode:a5];
  double v9 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
  double v10 = [(CKLocationSearchResultCell *)self traitCollection];
  char v11 = [v9 hasCachedMapPreviewForQueryResult:v22 traitCollection:v10];

  v12 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
  v13 = [(CKLocationSearchResultCell *)self traitCollection];
  if (v11)
  {
    id v14 = [v12 cachedMapPreviewForQueryResult:v22 traitCollection:v13];

    if (v14) {
      goto LABEL_6;
    }
  }
  else
  {
    [v12 generateMapPreviewForQueryResult:v22 traitCollection:v13];
  }
  double v15 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
  double v16 = [(CKLocationSearchResultCell *)self traitCollection];
  id v14 = [v15 mapPlaceholderImageForTraitCollection:v16];

LABEL_6:
  v17 = [(CKEditableSearchResultCell *)self imageView];
  [v17 setImage:v14];

  [(CKLocationSearchResultCell *)self _configurePlaceLabelWithResult:v22 searchText:v8];
  v18 = [(CKLocationSearchResultCell *)self contentView];
  [v18 setClipsToBounds:1];

  double v19 = [(CKLocationSearchResultCell *)self contentView];
  v20 = [v19 layer];
  double v21 = +[CKUIBehavior sharedBehaviors];
  [v21 searchLocationCellCornerRadius];
  objc_msgSend(v20, "setCornerRadius:");

  [(CKLocationSearchResultCell *)self setNeedsLayout];
}

- (void)refreshForSearchTextIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [(CKLocationSearchResultCell *)self result];
  [(CKLocationSearchResultCell *)self _configurePlaceLabelWithResult:v5 searchText:v4];
}

- (void)_configurePlaceLabelWithResult:(id)a3 searchText:(id)a4
{
  id v44 = a4;
  double v6 = [a3 item];
  double v7 = [v6 attributeSet];
  id v8 = objc_msgSend(v7, "__ck_spotlightItemSnippet");

  if (([v8 isEqualToString:@"Current Location"] & 1) != 0
    || (CKFrameworkBundle(),
        double v9 = objc_claimAutoreleasedReturnValue(),
        [v9 localizedStringForKey:@"Current Location" value:&stru_1EDE4CA38 table:@"ChatKit"], double v10 = objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v8, "isEqualToString:", v10), v10, v9, v11))
  {
    v12 = [v6 attributeSet];
    v13 = objc_msgSend(v12, "__ck_itemContentCreationDate");

    id v14 = +[CKUIBehavior sharedBehaviors];
    double v15 = [v14 locationRelativeDateFormatter];

    double v16 = [v15 stringFromDate:v13];
    v17 = NSString;
    v18 = CKFrameworkBundle();
    double v19 = [v18 localizedStringForKey:@"LOCATION_FOOTER_DETAILS_VIEW" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v20 = objc_msgSend(v17, "stringWithFormat:", v19, v16);

    double v21 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v22 = [v21 userInterfaceLayoutDirection];

    if (v22 == 1) {
      double v23 = @"\u200F";
    }
    else {
      double v23 = @"\u200E";
    }
    uint64_t v24 = [(__CFString *)v23 stringByAppendingString:v20];

    id v8 = (void *)v24;
  }
  unint64_t v25 = [v8 length];
  v26 = +[CKUIBehavior sharedBehaviors];
  unint64_t v27 = [v26 conversationListCellMaxSummaryLength];

  if (v25 > v27)
  {
    v28 = +[CKUIBehavior sharedBehaviors];
    uint64_t v29 = objc_msgSend(v8, "substringWithRange:", 0, objc_msgSend(v28, "conversationListCellMaxSummaryLength"));

    id v8 = (void *)v29;
  }
  if (v8)
  {
    double v42 = +[CKUIBehavior sharedBehaviors];
    v41 = [v42 theme];
    double v30 = [v41 conversationListSummaryColor];
    CGFloat v31 = +[CKUIBehavior sharedBehaviors];
    v32 = [v31 searchResultLabelFont];
    CGFloat v33 = +[CKUIBehavior sharedBehaviors];
    [v33 theme];
    double v34 = v40 = self;
    [v34 conversationListSenderColor];
    CGFloat v35 = v43 = v6;
    v36 = +[CKUIBehavior sharedBehaviors];
    char v37 = [v36 searchResultLabelFont];
    v38 = +[CKSpotlightQueryUtilities annotatedResultStringWithSearchText:v44 resultText:v8 primaryTextColor:v30 primaryFont:v32 annotatedTextColor:v35 annotatedFont:v37];

    v39 = [(CKLocationSearchResultCell *)v40 placeLabel];
    [v39 setAttributedText:v38];

    double v6 = v43;
  }
}

- (void)_thumbnailGenerated:(id)a3
{
  id v15 = [a3 object];
  id v4 = [v15 identifier];
  id v5 = [(CKLocationSearchResultCell *)self result];
  double v6 = [v5 identifier];
  int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    id v8 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
    double v9 = [(CKLocationSearchResultCell *)self traitCollection];
    double v10 = [v8 cachedMapPreviewForQueryResult:v15 traitCollection:v9];

    if (v10)
    {
      int v11 = [(CKEditableSearchResultCell *)self imageView];
      [v11 setImage:v10];
    }
    else
    {
      v12 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
      v13 = [(CKLocationSearchResultCell *)self traitCollection];
      int v11 = [v12 mapPlaceholderImageForTraitCollection:v13];

      id v14 = [(CKEditableSearchResultCell *)self imageView];
      [v14 setImage:v11];
    }
    [(CKLocationSearchResultCell *)self setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKLocationSearchResultCell;
  [(CKLocationSearchResultCell *)&v6 traitCollectionDidChange:a3];
  id v4 = [(CKLocationSearchResultCell *)self result];
  id v5 = [(CKLocationSearchResultCell *)self searchText];
  [(CKLocationSearchResultCell *)self configureWithQueryResult:v4 searchText:v5 mode:[(CKLocationSearchResultCell *)self mode]];
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

- (UILabel)placeLabel
{
  return self->_placeLabel;
}

- (void)setPlaceLabel:(id)a3
{
}

- (UIVisualEffectView)blurEffectView
{
  return self->_blurEffectView;
}

- (void)setBlurEffectView:(id)a3
{
}

- (CKSpotlightQueryResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);

  objc_storeStrong((id *)&self->_placeLabel, 0);
}

@end