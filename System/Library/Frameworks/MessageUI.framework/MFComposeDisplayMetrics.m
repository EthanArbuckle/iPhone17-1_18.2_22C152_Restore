@interface MFComposeDisplayMetrics
+ (id)displayMetricsWithTraitCollection:(id)a3 layoutMargins:(NSDirectionalEdgeInsets)a4 safeAreaInsets:(UIEdgeInsets)a5;
- (BOOL)isCompactHeight;
- (NSDirectionalEdgeInsets)headerViewSeparatorInset;
- (NSDirectionalEdgeInsets)layoutMargins;
- (UIEdgeInsets)safeAreaInsets;
- (UIEdgeInsets)sendBarButtonItemImageInsets;
- (UITraitCollection)traitCollection;
- (double)trailingButtonMidlineOffset;
- (void)setLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation MFComposeDisplayMetrics

+ (id)displayMetricsWithTraitCollection:(id)a3 layoutMargins:(NSDirectionalEdgeInsets)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double trailing = a4.trailing;
  double v10 = a4.bottom;
  double leading = a4.leading;
  double v12 = a4.top;
  id v13 = a3;
  if ([v13 userInterfaceIdiom] == -1)
  {
    v14 = 0;
  }
  else
  {
    v14 = objc_alloc_init(MFComposeDisplayMetrics);
    [(MFComposeDisplayMetrics *)v14 setTraitCollection:v13];
    -[MFComposeDisplayMetrics setLayoutMargins:](v14, "setLayoutMargins:", v12, leading, v10, trailing);
    -[MFComposeDisplayMetrics setSafeAreaInsets:](v14, "setSafeAreaInsets:", top, left, bottom, right);
  }

  return v14;
}

- (double)trailingButtonMidlineOffset
{
  BOOL v2 = [(MFComposeDisplayMetrics *)self isCompactHeight];
  double result = 21.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

- (UIEdgeInsets)sendBarButtonItemImageInsets
{
  v3 = [(MFComposeDisplayMetrics *)self traitCollection];
  uint64_t v4 = [v3 layoutDirection];

  BOOL v5 = [(MFComposeDisplayMetrics *)self isCompactHeight];
  double v6 = 8.5;
  double v7 = 0.0;
  if (v5) {
    double v6 = 0.0;
  }
  if (v4 == 1) {
    double v8 = v6;
  }
  else {
    double v8 = 0.0;
  }
  if (v4 == 1) {
    double v9 = 0.0;
  }
  else {
    double v9 = v6;
  }
  BOOL v10 = v6 <= 0.0;
  if (v6 > 0.0) {
    double v11 = 0.0;
  }
  else {
    double v11 = *MEMORY[0x1E4FB2848];
  }
  if (v10) {
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  }
  else {
    double v12 = v8;
  }
  if (v10)
  {
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    double v13 = v9;
  }
  result.double right = v13;
  result.double bottom = v7;
  result.double left = v12;
  result.double top = v11;
  return result;
}

- (NSDirectionalEdgeInsets)headerViewSeparatorInset
{
  uint64_t v3 = MEMORY[0x1E4FB12A8];
  double v4 = *MEMORY[0x1E4FB12A8];
  double v5 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
  [(MFComposeDisplayMetrics *)self layoutMargins];
  double v7 = v6;
  [(MFComposeDisplayMetrics *)self layoutMargins];
  if (v8 > 30.0) {
    [(MFComposeDisplayMetrics *)self layoutMargins];
  }
  else {
    double v9 = *(double *)(v3 + 24);
  }
  double v10 = v4;
  double v11 = v7;
  double v12 = v5;
  result.double trailing = v9;
  result.double bottom = v12;
  result.double leading = v11;
  result.double top = v10;
  return result;
}

- (BOOL)isCompactHeight
{
  BOOL v2 = [(MFComposeDisplayMetrics *)self traitCollection];
  BOOL v3 = [v2 verticalSizeClass] == 1;

  return v3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (NSDirectionalEdgeInsets)layoutMargins
{
  double top = self->_layoutMargins.top;
  double leading = self->_layoutMargins.leading;
  double bottom = self->_layoutMargins.bottom;
  double trailing = self->_layoutMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  self->_layoutMargins = a3;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_safeAreaInsets = a3;
}

- (void).cxx_destruct
{
}

@end