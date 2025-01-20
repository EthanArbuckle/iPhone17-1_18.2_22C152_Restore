@interface CKPhotosSearchResultsTitleHeaderCell
+ (id)reuseIdentifier;
+ (id)supplementaryViewType;
- (CKPhotosSearchResultsTitleHeaderCell)initWithFrame:(CGRect)a3;
- (UISegmentedControl)control;
- (double)controlBottomPadding;
- (double)controlTopPadding;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setControl:(id)a3;
- (void)setControlBottomPadding:(double)a3;
- (void)setControlTopPadding:(double)a3;
- (void)setTitle:(id)a3;
- (void)updateSegmentedControlToFitWidth:(double)a3;
@end

@implementation CKPhotosSearchResultsTitleHeaderCell

+ (id)supplementaryViewType
{
  return @"SearchPhotosHeaderSupplementryType";
}

+ (id)reuseIdentifier
{
  return @"SearchPhotosResultsTitle";
}

- (CKPhotosSearchResultsTitleHeaderCell)initWithFrame:(CGRect)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)CKPhotosSearchResultsTitleHeaderCell;
  v3 = -[CKSearchResultsTitleHeaderCell initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42DD0]);
    v5 = CKFrameworkBundle();
    v6 = [v5 localizedStringForKey:@"SEARCH_PHOTOS_ALL_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v18[0] = v6;
    v7 = CKFrameworkBundle();
    v8 = [v7 localizedStringForKey:@"SEARCH_PHOTOS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v18[1] = v8;
    v9 = CKFrameworkBundle();
    v10 = [v9 localizedStringForKey:@"SEARCH_SCREENSHOTS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v18[2] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
    v12 = (void *)[v4 initWithItems:v11];

    [v12 setSelectedSegmentIndex:0];
    [v12 addTarget:v3 action:sel__controlIndexDidChange_ forControlEvents:4096];
    [(CKPhotosSearchResultsTitleHeaderCell *)v3 addSubview:v12];
    [(CKPhotosSearchResultsTitleHeaderCell *)v3 setControl:v12];
    v13 = +[CKUIBehavior sharedBehaviors];
    LODWORD(v6) = [v13 isAccessibilityPreferredContentSizeCategory];

    double v14 = 2.0;
    if (v6)
    {
      double v14 = 8.0;
      double v15 = 11.0;
    }
    else
    {
      double v15 = 4.0;
    }
    [(CKPhotosSearchResultsTitleHeaderCell *)v3 setControlTopPadding:v14];
    [(CKPhotosSearchResultsTitleHeaderCell *)v3 setControlBottomPadding:v15];
  }
  return v3;
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)CKPhotosSearchResultsTitleHeaderCell;
  [(CKSearchResultsTitleHeaderCell *)&v34 layoutSubviews];
  [(CKPhotosSearchResultsTitleHeaderCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  v9 = [(CKPhotosSearchResultsTitleHeaderCell *)self control];
  [v9 frame];
  double v11 = v10;

  [(CKSearchResultsTitleHeaderCell *)self marginInsets];
  double v14 = v8 - (v12 + v13);
  [(CKPhotosSearchResultsTitleHeaderCell *)self bounds];
  double MaxY = CGRectGetMaxY(v35);
  [(CKPhotosSearchResultsTitleHeaderCell *)self controlBottomPadding];
  double v17 = v16;
  v36.origin.x = v4;
  v36.origin.y = v6;
  v36.size.width = v14;
  v36.size.height = v11;
  double Height = CGRectGetHeight(v36);
  [(CKPhotosSearchResultsTitleHeaderCell *)self bounds];
  double v20 = v19;
  double v22 = v21;
  if (CKMainScreenScale_once_102 != -1) {
    dispatch_once(&CKMainScreenScale_once_102, &__block_literal_global_272);
  }
  double v23 = *(double *)&CKMainScreenScale_sMainScreenScale_102;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_102 == 0.0) {
    double v23 = 1.0;
  }
  double v24 = (MaxY - v17 - Height) * v23;
  double v25 = v14 * v23;
  double v26 = v11 * v23;
  double v27 = v20 * v23 + floor((v22 * v23 - v14 * v23) * 0.5);
  double v28 = 1.0 / v23;
  double v29 = v28 * v27;
  double v30 = v24 * v28;
  double v31 = v25 * v28;
  double v32 = v26 * v28;
  v33 = [(CKPhotosSearchResultsTitleHeaderCell *)self control];
  objc_msgSend(v33, "setFrame:", v29, v30, v31, v32);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CKPhotosSearchResultsTitleHeaderCell;
  CGFloat v4 = [(CKSearchResultsTitleHeaderCell *)&v23 preferredLayoutAttributesFittingAttributes:a3];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(CKPhotosSearchResultsTitleHeaderCell *)self control];
  [v13 alpha];
  double v15 = v14;

  if (v15 > 0.0)
  {
    double v16 = [(CKPhotosSearchResultsTitleHeaderCell *)self control];
    objc_msgSend(v16, "sizeThatFits:", v10, v12);
    double v18 = v17;

    [(CKPhotosSearchResultsTitleHeaderCell *)self controlTopPadding];
    double v20 = v18 + v19;
    [(CKPhotosSearchResultsTitleHeaderCell *)self controlBottomPadding];
    double v12 = v12 + v20 + v21;
  }
  objc_msgSend(v4, "setFrame:", v6, v8, v10, v12);

  return v4;
}

- (void)setTitle:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKPhotosSearchResultsTitleHeaderCell;
  [(CKSearchResultsTitleHeaderCell *)&v3 setTitle:a3];
}

- (void)updateSegmentedControlToFitWidth:(double)a3
{
  double v5 = [(CKPhotosSearchResultsTitleHeaderCell *)self control];
  [v5 intrinsicContentSize];
  BOOL v7 = v6 >= a3;

  id v8 = [(CKPhotosSearchResultsTitleHeaderCell *)self control];
  [v8 setApportionsSegmentWidthsByContent:v7];
}

- (UISegmentedControl)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
}

- (double)controlTopPadding
{
  return self->_controlTopPadding;
}

- (void)setControlTopPadding:(double)a3
{
  self->_controlTopPadding = a3;
}

- (double)controlBottomPadding
{
  return self->_controlBottomPadding;
}

- (void)setControlBottomPadding:(double)a3
{
  self->_controlBottomPadding = a3;
}

- (void).cxx_destruct
{
}

@end