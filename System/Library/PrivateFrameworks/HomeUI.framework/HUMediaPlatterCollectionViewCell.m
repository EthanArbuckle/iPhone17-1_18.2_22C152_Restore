@interface HUMediaPlatterCollectionViewCell
- (BOOL)prefixLabelShouldFeather;
- (BOOL)primaryLabelShouldFeather;
- (BOOL)recognizeDoubleClickGesture;
- (BOOL)secondaryLabelShouldFeather;
- (CGRect)iconViewTileFrame;
- (CGRect)prefixLabelTileFrame;
- (CGRect)primaryLabelTileFrame;
- (CGRect)secondaryLabelTileFrame;
- (CGRect)tileFrame;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (id)backgroundColor;
- (id)baseIconViewConfiguration;
- (id)createBackgroundBlurView;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (id)prefixLabelFont;
- (id)prefixLabelTextColor;
- (id)prefixString;
- (id)primaryLabelFont;
- (id)primaryLabelTextColor;
- (id)primaryString;
- (id)secondaryAttributedString;
- (id)secondaryLabelFont;
- (id)secondaryLabelTextColor;
- (id)secondaryString;
- (unint64_t)backgroundDisplayStyle;
- (void)prepareForReuse;
@end

@implementation HUMediaPlatterCollectionViewCell

- (void)prepareForReuse
{
  v2.receiver = self;
  v2.super_class = (Class)HUMediaPlatterCollectionViewCell;
  [(HUViewControllerCollectionViewCell *)&v2 prepareForReuse];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  if (![(HUViewControllerCollectionViewCell *)self allowSelfSizing])
  {
    v43.receiver = self;
    v43.super_class = (Class)HUMediaPlatterCollectionViewCell;
    *(float *)&double v10 = a4;
    *(float *)&double v11 = a5;
    -[HUViewControllerCollectionViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v43, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v10, v11);
    double v28 = v41;
    double v30 = v42;
LABEL_6:
    double v39 = v28;
    double v40 = v30;
    goto LABEL_7;
  }
  [(HUMediaPlatterCollectionViewCell *)self setClipsToBounds:1];
  v12 = [(HUViewControllerCollectionViewCell *)self viewController];
  v13 = [v12 view];
  objc_msgSend(v13, "sizeThatFits:", width, 3.40282347e38);
  double v15 = v14;

  v16 = [(HUViewControllerCollectionViewCell *)self viewController];
  v17 = [v16 view];
  [v17 frame];
  double v19 = v18;
  double v21 = v20;

  v22 = [(HUViewControllerCollectionViewCell *)self viewController];
  v23 = [v22 view];
  objc_msgSend(v23, "setFrame:", v19, v21, width, v15);

  v24 = [(HUViewControllerCollectionViewCell *)self viewController];
  v25 = [v24 view];
  [v25 layoutIfNeeded];

  [(HUMediaPlatterCollectionViewCell *)self _setContinuousCornerRadius:16.0];
  v26 = [(HUViewControllerCollectionViewCell *)self viewController];
  [v26 preferredContentSize];
  double v28 = v27;
  double v30 = v29;

  if (*MEMORY[0x1E4F1DB30] != v28 || *(double *)(MEMORY[0x1E4F1DB30] + 8) != v30) {
    goto LABEL_6;
  }
  v31 = [(HUViewControllerCollectionViewCell *)self viewController];
  v32 = [v31 view];
  *(float *)&double v33 = a4;
  *(float *)&double v34 = a5;
  objc_msgSend(v32, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v33, v34);
  double v36 = v35;
  double v38 = v37;

  double v39 = v36;
  double v40 = v38;
LABEL_7:
  result.double height = v40;
  result.double width = v39;
  return result;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  if ([(HUViewControllerCollectionViewCell *)self allowSelfSizing])
  {
    v8.receiver = self;
    v8.super_class = (Class)HUMediaPlatterCollectionViewCell;
    id v5 = [(HUViewControllerCollectionViewCell *)&v8 preferredLayoutAttributesFittingAttributes:v4];
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)prefixString
{
  return 0;
}

- (id)primaryString
{
  return 0;
}

- (id)secondaryString
{
  return 0;
}

- (id)secondaryAttributedString
{
  return 0;
}

- (CGRect)iconViewTileFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)prefixLabelTileFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)primaryLabelTileFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)secondaryLabelTileFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)prefixLabelShouldFeather
{
  return 0;
}

- (BOOL)primaryLabelShouldFeather
{
  return 0;
}

- (BOOL)secondaryLabelShouldFeather
{
  return 0;
}

- (id)prefixLabelFont
{
  return 0;
}

- (id)primaryLabelFont
{
  return 0;
}

- (id)secondaryLabelFont
{
  return 0;
}

- (id)prefixLabelTextColor
{
  return 0;
}

- (id)primaryLabelTextColor
{
  return 0;
}

- (id)secondaryLabelTextColor
{
  return 0;
}

- (CGRect)tileFrame
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(HUMediaPlatterCollectionViewCell *)self frame];
  double v6 = v2;
  double v7 = v3;
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (unint64_t)backgroundDisplayStyle
{
  return 2;
}

- (id)createBackgroundBlurView
{
  return 0;
}

- (id)backgroundColor
{
  double v2 = [(HUMediaPlatterCollectionViewCell *)self traitCollection];
  if ([v2 userInterfaceStyle] == 1) {
    [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  else {
  double v3 = [MEMORY[0x1E4F428B8] systemBlackColor];
  }

  double v4 = [v3 colorWithAlphaComponent:0.9];

  return v4;
}

- (BOOL)recognizeDoubleClickGesture
{
  return 0;
}

- (id)baseIconViewConfiguration
{
  return 0;
}

@end