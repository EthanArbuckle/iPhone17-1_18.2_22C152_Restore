@interface EKUIAutocompleteSearchResultBaseCell
+ (double)cellHeightForResult:(id)a3 forWidth:(double)a4;
+ (double)verticalSpacingBottomToBaselineForBottomLabelWithPrimaryFont:(id)a3;
+ (double)verticalSpacingTopToBaselineForBottomLabelWithSecondaryFont:(id)a3;
+ (double)verticalSpacingTopToBaselineForTopLabelWithPrimaryFont:(id)a3;
+ (id)primaryTextColor;
+ (id)secondaryTextColor;
+ (id)secondaryTextLabelFont;
- (EKUIAutocompleteSearchResultBaseCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)_verticalSpacingBottomToBaselineForBottomLabel;
- (double)verticalSpacingTopToBaselineForBottomLabel;
- (double)verticalSpacingTopToBaselineForTopLabel;
- (double)verticalSpacingTopToColorDot;
- (id)_createLabelWithColor:(id)a3;
- (id)createPrimaryLabel;
- (id)createSecondaryLabel;
- (void)_updateContentForSizeCategoryChange:(id)a3;
- (void)setLabelFonts;
- (void)setupConstraints;
- (void)updateWithResult:(id)a3;
@end

@implementation EKUIAutocompleteSearchResultBaseCell

- (EKUIAutocompleteSearchResultBaseCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EKUIAutocompleteSearchResultBaseCell;
  v4 = [(EKUITableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__updateContentForSizeCategoryChange_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v4;
}

- (id)createPrimaryLabel
{
  v3 = [(id)objc_opt_class() primaryTextColor];
  v4 = [(EKUIAutocompleteSearchResultBaseCell *)self _createLabelWithColor:v3];

  return v4;
}

- (id)createSecondaryLabel
{
  v3 = [(id)objc_opt_class() secondaryTextColor];
  v4 = [(EKUIAutocompleteSearchResultBaseCell *)self _createLabelWithColor:v3];

  return v4;
}

+ (id)secondaryTextLabelFont
{
  v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0] addingSymbolicTraits:0x8000 options:0];
  v3 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (id)primaryTextColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

+ (id)secondaryTextColor
{
  return (id)[MEMORY[0x1E4FB1618] systemGrayColor];
}

+ (double)verticalSpacingTopToBaselineForTopLabelWithPrimaryFont:(id)a3
{
  [a3 _scaledValueForValue:1 useLanguageAwareScaling:20.0];

  CalRoundToScreenScale(v3);
  return result;
}

- (double)verticalSpacingTopToBaselineForTopLabel
{
  v2 = [(EKUITableViewCellWithPrimaryAndSecondaryFonts *)self primaryTextLabelFont];
  [(id)objc_opt_class() verticalSpacingTopToBaselineForTopLabelWithPrimaryFont:v2];
  double v4 = v3;

  return v4;
}

+ (double)verticalSpacingTopToBaselineForBottomLabelWithSecondaryFont:(id)a3
{
  [a3 _scaledValueForValue:1 useLanguageAwareScaling:20.0];

  CalRoundToScreenScale(v3);
  return result;
}

- (double)verticalSpacingTopToBaselineForBottomLabel
{
  v2 = [(id)objc_opt_class() secondaryTextLabelFont];
  [(id)objc_opt_class() verticalSpacingTopToBaselineForBottomLabelWithSecondaryFont:v2];
  double v4 = v3;

  return v4;
}

+ (double)verticalSpacingBottomToBaselineForBottomLabelWithPrimaryFont:(id)a3
{
  [a3 _scaledValueForValue:1 useLanguageAwareScaling:8.0];

  CalRoundToScreenScale(v3);
  return result;
}

- (double)_verticalSpacingBottomToBaselineForBottomLabel
{
  v2 = [(EKUITableViewCellWithPrimaryAndSecondaryFonts *)self primaryTextLabelFont];
  [(id)objc_opt_class() verticalSpacingBottomToBaselineForBottomLabelWithPrimaryFont:v2];
  double v4 = v3;

  return v4;
}

- (double)verticalSpacingTopToColorDot
{
  v2 = [(EKUITableViewCellWithPrimaryAndSecondaryFonts *)self primaryTextLabelFont];
  [v2 _scaledValueForValue:1 useLanguageAwareScaling:9.0];
  double v4 = v3;

  return v4;
}

- (id)_createLabelWithColor:(id)a3
{
  id v3 = a3;
  double v4 = objc_opt_new();
  [v4 setTextColor:v3];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v4;
}

- (void)_updateContentForSizeCategoryChange:(id)a3
{
  [(EKUIAutocompleteSearchResultBaseCell *)self setLabelFonts];
  [(EKUIAutocompleteSearchResultBaseCell *)self setupConstraints];

  [(EKUIAutocompleteSearchResultBaseCell *)self setNeedsLayout];
}

- (void)updateWithResult:(id)a3
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1();

  NSRequestConcreteImplementation();
}

+ (double)cellHeightForResult:(id)a3 forWidth:(double)a4
{
  return 0.0;
}

- (void)setLabelFonts
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1();

  NSRequestConcreteImplementation();
}

- (void)setupConstraints
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1();

  NSRequestConcreteImplementation();
}

@end