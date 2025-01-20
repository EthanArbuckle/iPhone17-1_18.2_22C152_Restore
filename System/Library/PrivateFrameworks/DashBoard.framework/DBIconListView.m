@interface DBIconListView
+ (unint64_t)iconColumnsForScreenWidth:(double)a3 iconImageSize:(CGSize)a4 statusBarEdge:(unint64_t)a5;
+ (unint64_t)iconRowsForScreenHeight:(double)a3 iconImageSize:(CGSize)a4 statusBarEdge:(unint64_t)a5 interactionAffordances:(unint64_t)a6;
- (BOOL)adaptsOrientationToTraitCollection;
- (BOOL)automaticallyAdjustsLayoutMetricsToFit;
- (BOOL)usesAlternateLayout;
- (CGSize)alignmentIconSize;
- (Class)baseIconViewClass;
- (UIEdgeInsets)insets;
- (void)layoutSubviews;
- (void)setInsets:(UIEdgeInsets)a3;
@end

@implementation DBIconListView

+ (unint64_t)iconRowsForScreenHeight:(double)a3 iconImageSize:(CGSize)a4 statusBarEdge:(unint64_t)a5 interactionAffordances:(unint64_t)a6
{
  double height = a4.height;
  double width = a4.width;
  +[DBFolderView maximumPageControlHeightForInteractionAffordances:a6];
  double v11 = a3 - v10;
  if ((a5 | 2) == 3) {
    double v11 = v11 - 45.0;
  }
  +[DBIconView maximumIconViewHeightForIconImageSize:](DBIconView, "maximumIconViewHeightForIconImageSize:", width, height);
  if (v11 <= v12) {
    return 2;
  }
  unint64_t v13 = vcvtmd_s64_f64((v11 + -20.0) / v12);
  do
  {
    unint64_t v14 = v13 - 1;
    if (v13 <= 2) {
      break;
    }
    double v15 = (v11 + -20.0 - v12 * (double)v13) / (double)(v13 + 1);
    --v13;
  }
  while (v15 < 20.0);
  unint64_t v16 = v14 + 1;
  if (v14 + 1 <= 4) {
    unint64_t v17 = v14 + 1;
  }
  else {
    unint64_t v17 = 4;
  }
  if (v16 >= 2) {
    return v17;
  }
  else {
    return 2;
  }
}

+ (unint64_t)iconColumnsForScreenWidth:(double)a3 iconImageSize:(CGSize)a4 statusBarEdge:(unint64_t)a5
{
  double v5 = a3;
  if ((a5 | 2) != 3) {
    double v5 = a3 - 45.0;
  }
  +[DBIconView maxLabelSizeForIconImageSize:](DBIconView, "maxLabelSizeForIconImageSize:", a4.width, a4.height);
  double v7 = v6;
  +[DBIconView minimumInterIconSpacing];
  if (v5 <= 480.0) {
    return 4;
  }
  unint64_t v10 = vcvtmd_s64_f64(v5 / (v9 + v7 + v8));
  unint64_t v11 = 5;
  if (v10 <= 5) {
    unint64_t v11 = v10;
  }
  if (v10 >= 4) {
    return v11;
  }
  else {
    return 4;
  }
}

- (BOOL)automaticallyAdjustsLayoutMetricsToFit
{
  return 0;
}

- (BOOL)adaptsOrientationToTraitCollection
{
  return 0;
}

- (CGSize)alignmentIconSize
{
  v8.receiver = self;
  v8.super_class = (Class)DBIconListView;
  [(SBIconListView *)&v8 alignmentIconSize];
  double v4 = v3;
  [(SBIconListView *)self iconContentScale];
  +[DBIconView maximumIconViewHeightForIconImageSize:DBIconImageInfoForScale()];
  double v6 = v5;
  double v7 = v4;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (BOOL)usesAlternateLayout
{
  return 0;
}

- (Class)baseIconViewClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v19[4] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)DBIconListView;
  [(SBIconListView *)&v18 layoutSubviews];
  [(DBIconListView *)self _setSpeedBumpEdges:10];
  id v3 = objc_alloc_init(MEMORY[0x263F82740]);
  [(DBIconListView *)self addLayoutGuide:v3];
  unint64_t v13 = (void *)MEMORY[0x263F08938];
  unint64_t v17 = [v3 topAnchor];
  unint64_t v16 = [(DBIconListView *)self topAnchor];
  double v15 = [v17 constraintEqualToAnchor:v16];
  v19[0] = v15;
  unint64_t v14 = [v3 bottomAnchor];
  double v4 = [(DBIconListView *)self bottomAnchor];
  double v5 = [v14 constraintEqualToAnchor:v4];
  v19[1] = v5;
  double v6 = [v3 leftAnchor];
  double v7 = [(DBIconListView *)self leftAnchor];
  objc_super v8 = [v6 constraintEqualToAnchor:v7];
  v19[2] = v8;
  double v9 = [v3 rightAnchor];
  unint64_t v10 = [(DBIconListView *)self rightAnchor];
  unint64_t v11 = [v9 constraintEqualToAnchor:v10];
  v19[3] = v11;
  double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];
  [v13 activateConstraints:v12];
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

@end