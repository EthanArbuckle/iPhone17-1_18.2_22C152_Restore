@interface AXUIAlertStyleProvider
+ (id)styleProvider;
- (BOOL)alertShouldGrowInAxis:(int64_t)a3 forType:(unint64_t)a4;
- (CGSize)alertBackgroundSizeForType:(unint64_t)a3;
- (NSBundle)bundle;
- (UIEdgeInsets)alertContentEdgeInsetsForType:(unint64_t)a3;
- (UIEdgeInsets)alertEdgeInsetsForType:(unint64_t)a3;
- (UIEdgeInsets)alertIconImageEdgeInsetsForType:(unint64_t)a3;
- (double)alertBackgroundCornerRadiusForType:(unint64_t)a3;
- (double)alertFadeAnimationDurationForType:(unint64_t)a3;
- (double)alertSubtitleTextVerticalSpacingHeightWithTextForType:(unint64_t)a3;
- (double)alertTextLineHeightOffsetForType:(unint64_t)a3;
- (id)alertSubtitleTextColorForType:(unint64_t)a3;
- (id)alertSubtitleTextFontForType:(unint64_t)a3;
- (id)alertTextColorForType:(unint64_t)a3;
- (id)alertTextFontForType:(unint64_t)a3;
- (int)alertBackgroundStyleForType:(unint64_t)a3;
- (int)alertPositionForType:(unint64_t)a3;
- (void)setBundle:(id)a3;
@end

@implementation AXUIAlertStyleProvider

+ (id)styleProvider
{
  v2 = objc_opt_new();

  return v2;
}

- (NSBundle)bundle
{
  bundle = self->_bundle;
  if (!bundle)
  {
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = self->_bundle;
    self->_bundle = v4;

    bundle = self->_bundle;
  }

  return bundle;
}

- (int)alertBackgroundStyleForType:(unint64_t)a3
{
  if (a3 > 8) {
    return 0;
  }
  else {
    return dword_22176C178[a3];
  }
}

- (double)alertBackgroundCornerRadiusForType:(unint64_t)a3
{
  double result = 0.0;
  if (a3 == 1) {
    double result = 10.0;
  }
  if (!a3) {
    return 6.0;
  }
  return result;
}

- (CGSize)alertBackgroundSizeForType:(unint64_t)a3
{
  double Width = *(double *)&AXUIAlertSizeMetricFitting;
  double v4 = *(double *)&AXUIAlertSizeMetricFitting;
  switch(a3)
  {
    case 0uLL:
      v14 = [MEMORY[0x263F1C408] sharedApplication];
      v15 = [v14 preferredContentSizeCategory];
      NSComparisonResult v16 = UIContentSizeCategoryCompareToCategory(v15, (UIContentSizeCategory)*MEMORY[0x263F1D180]);

      if (v16 == NSOrderedDescending)
      {
        v17 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2A0]];
        [v17 _scaledValueForValue:155.0];
        double v19 = v18;

        v20 = [MEMORY[0x263F1C920] mainScreen];
        [v20 bounds];
        double v22 = v21;

        v23 = [MEMORY[0x263F1C920] mainScreen];
        [v23 bounds];
        double v25 = v24;

        double Width = fmin(v19, fmin(v22, v25));
      }
      else
      {
        double Width = 155.0;
      }
      goto LABEL_12;
    case 1uLL:
    case 5uLL:
      break;
    case 2uLL:
    case 4uLL:
      double Width = *(double *)&AXUIAlertSizeMetricFillingContainer;
      double v4 = 44.0;
      break;
    case 3uLL:
      v26 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D288]];
      [v26 _scaledValueForValue:100.0];
      double v28 = v27;

      v29 = [MEMORY[0x263F1C920] mainScreen];
      [v29 bounds];
      double v31 = v30 * 0.5;

      double v4 = fmin(v31, v28);
      v8 = [MEMORY[0x263F1C920] mainScreen];
      [v8 bounds];
      double Width = CGRectGetWidth(v41);
      goto LABEL_10;
    case 6uLL:
      v32 = [MEMORY[0x263F1C920] mainScreen];
      [v32 bounds];
      double v34 = v33 * 0.5;

      double v4 = fmin(v34, 150.0);
      v8 = [MEMORY[0x263F1C920] mainScreen];
      [v8 bounds];
      CGFloat v35 = CGRectGetWidth(v42);
      double Width = v35 / 3.0 + v35 / 3.0;
      goto LABEL_10;
    case 7uLL:
      v5 = [MEMORY[0x263F1C920] mainScreen];
      [v5 bounds];
      double v7 = v6 * 0.5;

      double v4 = fmin(v7, 100.0);
      v8 = [MEMORY[0x263F1C920] mainScreen];
      [v8 bounds];
      double v9 = CGRectGetWidth(v39) * 0.5;
      double v10 = 1.8;
      goto LABEL_5;
    case 8uLL:
      v11 = [MEMORY[0x263F1C920] mainScreen];
      [v11 bounds];
      double v13 = v12 * 0.5;

      double v4 = fmin(v13, 100.0);
      v8 = [MEMORY[0x263F1C920] mainScreen];
      [v8 bounds];
      double v9 = CGRectGetWidth(v40) * 0.25;
      double v10 = 3.0;
LABEL_5:
      double Width = v9 * v10;
LABEL_10:

      break;
    default:
LABEL_12:
      double v4 = Width;
      break;
  }
  double v36 = Width;
  double v37 = v4;
  result.height = v37;
  result.width = v36;
  return result;
}

- (BOOL)alertShouldGrowInAxis:(int64_t)a3 forType:(unint64_t)a4
{
  if (((1 << a4) & 0x1D5) != 0) {
    BOOL v4 = a3 == 1;
  }
  else {
    BOOL v4 = a4 == 1;
  }
  return a4 <= 8 && v4;
}

- (UIEdgeInsets)alertContentEdgeInsetsForType:(unint64_t)a3
{
  double v3 = 0.0;
  if (a3 <= 8) {
    double v3 = dbl_22176C1A0[a3];
  }
  double v4 = v3;
  double v5 = v3;
  double v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)alertTextFontForType:(unint64_t)a3
{
  double v3 = 0;
  double v4 = 0.0;
  switch(a3)
  {
    case 0uLL:
      double v5 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2A0]];
      double v3 = v5;
      double v6 = 18.0;
      goto LABEL_9;
    case 1uLL:
    case 2uLL:
    case 4uLL:
      double v5 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
      double v3 = v5;
      double v6 = 14.0;
LABEL_9:
      [v5 _scaledValueForValue:v6];
      double v4 = v12;
      break;
    case 3uLL:
      double v7 = (void *)MEMORY[0x263F1C660];
      v8 = (void *)MEMORY[0x263F1D288];
      goto LABEL_7;
    case 6uLL:
      double v7 = (void *)MEMORY[0x263F1C660];
      v8 = (void *)MEMORY[0x263F1D2A0];
      goto LABEL_7;
    case 7uLL:
      double v7 = (void *)MEMORY[0x263F1C660];
      v8 = (void *)MEMORY[0x263F1D2A8];
      goto LABEL_7;
    case 8uLL:
      double v7 = (void *)MEMORY[0x263F1C660];
      v8 = (void *)MEMORY[0x263F1D278];
LABEL_7:
      double v9 = [v7 preferredFontDescriptorWithTextStyle:*v8 addingSymbolicTraits:0x8000 options:0];
      double v10 = (void *)MEMORY[0x263F1C658];
      [v9 pointSize];
      double v3 = objc_msgSend(v10, "fontWithDescriptor:size:", v9);
      [v9 pointSize];
      double v4 = v11;

      break;
    default:
      break;
  }
  double v13 = [v3 fontWithSize:v4];

  return v13;
}

- (id)alertTextColorForType:(unint64_t)a3
{
  if (a3 <= 8 && ((1 << a3) & 0x141) != 0)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = objc_msgSend(MEMORY[0x263F1C550], "whiteColor", v3);
  }
  return v5;
}

- (double)alertTextLineHeightOffsetForType:(unint64_t)a3
{
  double result = 0.0;
  if (((a3 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0) {
    return -1.0;
  }
  return result;
}

- (id)alertSubtitleTextFontForType:(unint64_t)a3
{
  uint64_t v4 = -[AXUIAlertStyleProvider alertTextFontForType:](self, "alertTextFontForType:");
  unint64_t v5 = a3 - 3;
  if (a3 - 3 <= 5 && ((0x39u >> v5) & 1) != 0)
  {
    double v6 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:**((void **)&unk_2645C5988 + v5) addingSymbolicTraits:0x8000 options:0];
    double v7 = (void *)MEMORY[0x263F1C658];
    [v6 pointSize];
    uint64_t v8 = objc_msgSend(v7, "fontWithDescriptor:size:", v6);

    uint64_t v4 = (void *)v8;
  }

  return v4;
}

- (id)alertSubtitleTextColorForType:(unint64_t)a3
{
  uint64_t v4 = -[AXUIAlertStyleProvider alertTextColorForType:](self, "alertTextColorForType:");
  if (a3 - 6 >= 3)
  {
    if (a3 != 3) {
      goto LABEL_6;
    }
    double v6 = [MEMORY[0x263F1C550] blackColor];
    uint64_t v5 = [v6 colorWithAlphaComponent:0.8];

    uint64_t v4 = v6;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F1C550] secondaryLabelColor];
  }

  uint64_t v4 = (void *)v5;
LABEL_6:

  return v4;
}

- (double)alertSubtitleTextVerticalSpacingHeightWithTextForType:(unint64_t)a3
{
  return 3.0;
}

- (UIEdgeInsets)alertIconImageEdgeInsetsForType:(unint64_t)a3
{
  double v3 = 4.0;
  double v4 = 4.0;
  double v5 = 4.0;
  double v6 = 9.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)alertEdgeInsetsForType:(unint64_t)a3
{
  if (a3 == 4)
  {
    double v3 = 9.0;
    double v4 = 0.0;
    double v5 = 0.0;
    double v6 = 0.0;
  }
  else
  {
    double v4 = *MEMORY[0x263F1D1C0];
    double v5 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v3 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v6 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }
  result.right = v6;
  result.bottom = v3;
  result.left = v5;
  result.top = v4;
  return result;
}

- (int)alertPositionForType:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    return 0;
  }
  else {
    return dword_22176C1E8[a3 - 1];
  }
}

- (double)alertFadeAnimationDurationForType:(unint64_t)a3
{
  return 0.3;
}

- (void)setBundle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end