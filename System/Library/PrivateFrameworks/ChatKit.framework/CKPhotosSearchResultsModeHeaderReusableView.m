@interface CKPhotosSearchResultsModeHeaderReusableView
+ (double)desiredZPosition;
+ (id)reuseIdentifier;
+ (id)supplementaryViewType;
- (CKPhotosSearchResultsModeHeaderReusableView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)marginInsets;
- (UISegmentedControl)control;
- (double)bottomPadding;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setBottomPadding:(double)a3;
- (void)setControl:(id)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
@end

@implementation CKPhotosSearchResultsModeHeaderReusableView

+ (id)supplementaryViewType
{
  return @"PhotoHeaderSupplementryType";
}

+ (id)reuseIdentifier
{
  return @"PhotoResultsToggle";
}

+ (double)desiredZPosition
{
  return 0.0;
}

- (CKPhotosSearchResultsModeHeaderReusableView)initWithFrame:(CGRect)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)CKPhotosSearchResultsModeHeaderReusableView;
  v3 = -[CKPhotosSearchResultsModeHeaderReusableView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42DD0]);
    v5 = CKFrameworkBundle();
    v6 = [v5 localizedStringForKey:@"SEARCH_PHOTOS_ALL_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v16[0] = v6;
    v7 = CKFrameworkBundle();
    v8 = [v7 localizedStringForKey:@"SEARCH_PHOTOS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v16[1] = v8;
    v9 = CKFrameworkBundle();
    v10 = [v9 localizedStringForKey:@"SEARCH_SCREENSHOTS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v16[2] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    v12 = (void *)[v4 initWithItems:v11];

    [v12 setSelectedSegmentIndex:0];
    [v12 addTarget:v3 action:sel__controlIndexDidChange_ forControlEvents:4096];
    [v12 setApportionsSegmentWidthsByContent:1];
    [(CKPhotosSearchResultsModeHeaderReusableView *)v3 addSubview:v12];
    [(CKPhotosSearchResultsModeHeaderReusableView *)v3 setControl:v12];
    v13 = +[CKUIBehavior sharedBehaviors];
    [v13 searchPhotosSegmentedControlBottomPadding];
    -[CKPhotosSearchResultsModeHeaderReusableView setBottomPadding:](v3, "setBottomPadding:");
  }
  return v3;
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)CKPhotosSearchResultsModeHeaderReusableView;
  [(CKPhotosSearchResultsModeHeaderReusableView *)&v34 layoutSubviews];
  v3 = +[CKUIBehavior sharedBehaviors];
  id v4 = [v3 theme];
  v5 = [v4 spotlightSearchSegmentedControlBackgroundColor];
  [(CKPhotosSearchResultsModeHeaderReusableView *)self setBackgroundColor:v5];

  [(CKPhotosSearchResultsModeHeaderReusableView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(CKPhotosSearchResultsModeHeaderReusableView *)self bottomPadding];
  double v13 = v12 + 44.0;
  -[CKPhotosSearchResultsModeHeaderReusableView setBounds:](self, "setBounds:", v7, v9, v11, v12 + 44.0);
  [(CKPhotosSearchResultsModeHeaderReusableView *)self marginInsets];
  double v15 = v14;
  double v17 = v16;
  v18 = [(CKPhotosSearchResultsModeHeaderReusableView *)self control];
  [v18 frame];
  double v20 = v19;

  if (CKMainScreenScale_once_5 != -1) {
    dispatch_once(&CKMainScreenScale_once_5, &__block_literal_global_9);
  }
  double v21 = *(double *)&CKMainScreenScale_sMainScreenScale_5;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_5 == 0.0) {
    double v21 = 1.0;
  }
  double v22 = (v11 - (v15 + v17)) * v21;
  double v23 = v20 * v21;
  double v24 = v7 * v21 + floor((v11 * v21 - v22) * 0.5);
  double v25 = v9 * v21 + floor((v13 * v21 - v20 * v21) * 0.5);
  double v26 = 1.0 / v21;
  CGFloat v27 = v26 * v24;
  CGFloat v28 = v26 * v25;
  CGFloat v29 = v22 * v26;
  CGFloat v30 = v23 * v26;
  v35.origin.x = v7;
  v35.origin.y = v9;
  v35.size.width = v11;
  v35.size.height = v13;
  double MidY = CGRectGetMidY(v35);
  v36.origin.x = v27;
  v36.origin.y = v28;
  v36.size.width = v29;
  v36.size.height = v30;
  double v32 = MidY + CGRectGetHeight(v36) * -0.5;
  v33 = [(CKPhotosSearchResultsModeHeaderReusableView *)self control];
  objc_msgSend(v33, "setFrame:", v27, v32, v29, v30);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  [(CKPhotosSearchResultsModeHeaderReusableView *)self bottomPadding];
  objc_msgSend(v4, "setSize:", v6, v7 + 44.0);

  return v4;
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

- (UISegmentedControl)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void)setBottomPadding:(double)a3
{
  self->_bottomPadding = a3;
}

- (void).cxx_destruct
{
}

@end