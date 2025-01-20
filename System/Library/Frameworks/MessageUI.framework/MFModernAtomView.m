@interface MFModernAtomView
+ (BOOL)presentationOptions:(unint64_t *)a3 encodedIntoAddress:(id)a4;
+ (CGPoint)defaultBaselinePoint;
+ (double)defaultHeight;
+ (double)horizontalPadding;
+ (id)_SMSTintColor;
+ (id)_badgeImagesForPresentationOptions:(unint64_t)a3 iconOrder:(const unint64_t *)a4 orderingLength:(unint64_t)a5 tintColor:(id)a6 large:(BOOL)a7 variant:(int64_t)a8;
+ (id)_defaultLabelAttributesWithFont:(id)a3 wrappingEnabled:(BOOL)a4;
+ (id)_defaultLabelAttributesWithWrappingEnabled:(BOOL)a3;
+ (id)_defaultTintColor;
+ (id)_failureTintColor;
+ (id)defaultFont;
+ (id)primaryAtomFont;
- (BOOL)hidesVIPIndicator;
- (BOOL)isPrimaryAddressAtom;
- (BOOL)isSelected;
- (BOOL)isWrappingEnabled;
- (BOOL)separatorHidden;
- (BOOL)separatorIsLeftAligned;
- (CGPoint)baselinePoint;
- (CGRect)selectionFrame;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MFModernAtomBackgroundView)backgroundView;
- (MFModernAtomIconView)accessoryIconView;
- (MFModernAtomIconView)badgeIconView;
- (MFModernAtomView)initWithFrame:(CGRect)a3 presentationOptions:(unint64_t)a4 separatorStyle:(int64_t)a5 wrappingSupported:(BOOL)a6;
- (NSString)description;
- (NSString)title;
- (UIActivityIndicatorView)activityIndicator;
- (UIColor)effectiveTintColor;
- (UIEdgeInsets)edgeInsets;
- (UIFont)titleFont;
- (UILabel)titleLabel;
- (double)_leftInset;
- (double)_leftPadding;
- (double)_rightInset;
- (double)_rightPadding;
- (double)firstLineIndent;
- (double)preferredWidth;
- (double)preferredWidthWithSizeConstraints:(CGSize)a3;
- (double)scale;
- (id)_centeredTextAttachmentWithImage:(id)a3;
- (id)_chevronTextAttachment;
- (id)viewForLastBaselineLayout;
- (int64_t)_preferredIconVariant;
- (int64_t)separatorStyle;
- (unint64_t)effectivePresentationOptions;
- (unint64_t)presentationOptions;
- (void)_invalidatePresentationOptions;
- (void)_setEffectiveTintColor:(id)a3;
- (void)_setPresentationOption:(unint64_t)a3 enabled:(BOOL)a4;
- (void)_updateActivityIndicator;
- (void)_updateCompositingFilters;
- (void)_updateFontIfNecessary;
- (void)_updateIconViewsSemanticContentAttribute;
- (void)_updateLabelAttributes;
- (void)_updateSubviewsForWrapping;
- (void)appendPresentationOption:(unint64_t)a3;
- (void)clearPresentationOption:(unint64_t)a3;
- (void)layoutSubviews;
- (void)performBuildInAnimationFromTextColor:(id)a3 withDuration:(double)a4;
- (void)setFirstLineIndent:(double)a3;
- (void)setHidesVIPIndicator:(BOOL)a3;
- (void)setIsPrimaryAddressAtom:(BOOL)a3;
- (void)setPresentationOptions:(unint64_t)a3;
- (void)setScale:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 style:(unint64_t)a5;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)setSeparatorIsLeftAligned:(BOOL)a3;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)tintColorDidChange;
@end

@implementation MFModernAtomView

+ (double)defaultHeight
{
  return 20.0;
}

+ (CGPoint)defaultBaselinePoint
{
  v2 = +[MFModernAtomView defaultFont];
  objc_msgSend(v2, "mf_baselinePointFromOriginPoint:", 0.0, 0.0);
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

+ (double)horizontalPadding
{
  return 6.0;
}

+ (id)defaultFont
{
  v2 = +[MFFontMetricCache sharedFontMetricCache];
  double v3 = [v2 cachedFont:&__block_literal_global_28 forKey:@"MFModernAtomViewDefaultFont"];

  return v3;
}

id __31__MFModernAtomView_defaultFont__block_invoke()
{
  v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:0x8000 options:0];
  v1 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v0 size:0.0];

  return v1;
}

+ (id)primaryAtomFont
{
  v2 = +[MFFontMetricCache sharedFontMetricCache];
  double v3 = [v2 cachedFont:&__block_literal_global_35 forKey:@"MFModernAtomViewPrimaryFont"];

  return v3;
}

id __35__MFModernAtomView_primaryAtomFont__block_invoke()
{
  v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2918]];
  v1 = [v0 fontDescriptorWithSymbolicTraits:0x8000];

  v2 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v1 size:0.0];

  return v2;
}

+ (id)_defaultTintColor
{
  return (id)[MEMORY[0x1E4FB1618] systemBlueColor];
}

+ (id)_failureTintColor
{
  return (id)[MEMORY[0x1E4FB1618] systemRedColor];
}

+ (id)_SMSTintColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.16 green:0.772 blue:0.098 alpha:1.0];
}

+ (id)_defaultLabelAttributesWithWrappingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v14[3] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  double v5 = v4;
  if (v3)
  {
    [v4 setLineBreakMode:0];
    LODWORD(v6) = 1.0;
    [v5 setHyphenationFactor:v6];
  }
  else
  {
    [v4 setLineBreakMode:4];
  }
  uint64_t v7 = *MEMORY[0x1E4FB0738];
  v14[0] = v5;
  uint64_t v8 = *MEMORY[0x1E4FB0700];
  v13[0] = v7;
  v13[1] = v8;
  v9 = +[MFModernAtomView _defaultTintColor];
  v14[1] = v9;
  v13[2] = *MEMORY[0x1E4FB06F8];
  v10 = +[MFModernAtomView defaultFont];
  v14[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  return v11;
}

- (void)setFirstLineIndent:(double)a3
{
  self->_firstLineIndent = a3;
  if ([(MFModernAtomView *)self isWrappingEnabled])
  {
    [(MFModernAtomView *)self _updateLabelAttributes];
  }
}

+ (id)_defaultLabelAttributesWithFont:(id)a3 wrappingEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = +[MFModernAtomView _defaultLabelAttributesWithWrappingEnabled:v4];
  uint64_t v7 = (void *)[v6 mutableCopy];

  [v7 setObject:v5 forKey:*MEMORY[0x1E4FB06F8]];

  return v7;
}

+ (id)_badgeImagesForPresentationOptions:(unint64_t)a3 iconOrder:(const unint64_t *)a4 orderingLength:(unint64_t)a5 tintColor:(id)a6 large:(BOOL)a7 variant:(int64_t)a8
{
  BOOL v9 = a7;
  id v13 = a6;
  for (i = [MEMORY[0x1E4F1CA48] array];
  {
    uint64_t v16 = *a4++;
    uint64_t v15 = v16;
    if ((v16 & a3) != 0)
    {
      v17 = MFAtomViewIconImageForPresentationOption(v15, v13, a8, v9);
      if (v17) {
        [i addObject:v17];
      }
    }
  }

  return i;
}

+ (BOOL)presentationOptions:(unint64_t *)a3 encodedIntoAddress:(id)a4
{
  id v5 = a4;
  if ([v5 length])
  {
    double v6 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(?:\\{PO\\:)([0-9]+)(?:\\})" options:0 error:0];
    uint64_t v7 = [v5 length];
    if (objc_msgSend(v6, "numberOfMatchesInString:options:range:", v5, 0, 0, v7))
    {
      uint64_t v8 = objc_msgSend(v6, "firstMatchInString:options:range:", v5, 0, 0, v7);
      uint64_t v9 = [v8 rangeAtIndex:1];
      uint64_t v11 = v10;

      v12 = objc_msgSend(v5, "substringWithRange:", v9, v11);
      uint64_t v13 = [v12 length];
      BOOL v14 = v13 != 0;
      if (v13) {
        *a3 = [v12 integerValue];
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (MFModernAtomView)initWithFrame:(CGRect)a3 presentationOptions:(unint64_t)a4 separatorStyle:(int64_t)a5 wrappingSupported:(BOOL)a6
{
  v43.receiver = self;
  v43.super_class = (Class)MFModernAtomView;
  uint64_t v9 = -[MFModernAtomView initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_scalingFactor = 1.0;
    v9->_separatorHidden = 0;
    v9->_presentationOptions = a4;
    v9->_firstLineIndent = 0.0;
    v9->_wrappingSupported = a6;
    v9->_cachedIsWrappingEnabled = [(MFModernAtomView *)v9 isWrappingEnabled];
    uint64_t v11 = [MEMORY[0x1E4FB1438] sharedApplication];
    v10->_separatorIsLeftAligned = [v11 userInterfaceLayoutDirection] == 1;

    id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v13 = *MEMORY[0x1E4F1DB28];
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v17 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], v14, v15, v16);
    titleLabelFillView = v10->_titleLabelFillView;
    v10->_titleLabelFillView = (UIView *)v17;

    [(UIView *)v10->_titleLabelFillView setUserInteractionEnabled:0];
    [(MFModernAtomView *)v10 addSubview:v10->_titleLabelFillView];
    id v19 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(MFModernAtomView *)v10 bounds];
    uint64_t v20 = objc_msgSend(v19, "initWithFrame:");
    compositingView = v10->_compositingView;
    v10->_compositingView = (UIView *)v20;

    [(UIView *)v10->_compositingView setAutoresizingMask:2];
    [(UIView *)v10->_compositingView setUserInteractionEnabled:0];
    [(MFModernAtomView *)v10 addSubview:v10->_compositingView];
    v22 = [MFModernAtomBackgroundView alloc];
    [(MFModernAtomView *)v10 bounds];
    v23 = -[MFModernAtomBackgroundView initWithFrame:](v22, "initWithFrame:");
    [(MFModernAtomBackgroundView *)v23 setOpaque:0];
    v24 = [MEMORY[0x1E4FB1618] clearColor];
    [(MFModernAtomBackgroundView *)v23 setBackgroundColor:v24];

    [(MFModernAtomBackgroundView *)v23 setUserInteractionEnabled:0];
    [(MFModernAtomBackgroundView *)v23 setAutoresizingMask:18];
    [(MFModernAtomBackgroundView *)v23 setHostAtomView:v10];
    [(MFModernAtomBackgroundView *)v23 setSeparatorStyle:a5];
    [(UIView *)v10->_compositingView addSubview:v23];
    objc_storeStrong((id *)&v10->_background, v23);
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v13, v14, v15, v16);
    label = v10->_label;
    v10->_label = (UILabel *)v25;

    [(UILabel *)v10->_label setAutoresizingMask:16];
    [(UILabel *)v10->_label setOpaque:0];
    v27 = v10->_label;
    v28 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v27 setBackgroundColor:v28];

    [(UILabel *)v10->_label setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v10->_label setUserInteractionEnabled:0];
    [(UILabel *)v10->_label _setWantsUnderlineForAccessibilityButtonShapesEnabled:1];
    [(UILabel *)v10->_label _setOverallWritingDirectionFollowsLayoutDirection:1];
    [(UIView *)v10->_compositingView addSubview:v10->_label];
    v29 = [MFModernAtomIconView alloc];
    [(MFModernAtomView *)v10 bounds];
    uint64_t v30 = -[MFModernAtomIconView initWithFrame:](v29, "initWithFrame:");
    badgeIconView = v10->_badgeIconView;
    v10->_badgeIconView = (MFModernAtomIconView *)v30;

    [(MFModernAtomIconView *)v10->_badgeIconView setIconPadding:2.5];
    [(MFModernAtomIconView *)v10->_badgeIconView setAutoresizingMask:16];
    v32 = [MEMORY[0x1E4FB1618] clearColor];
    [(MFModernAtomIconView *)v10->_badgeIconView setBackgroundColor:v32];

    [(MFModernAtomIconView *)v10->_badgeIconView setContentMode:3];
    v33 = [MFModernAtomIconView alloc];
    [(MFModernAtomView *)v10 bounds];
    uint64_t v34 = -[MFModernAtomIconView initWithFrame:](v33, "initWithFrame:");
    accessoryIconView = v10->_accessoryIconView;
    v10->_accessoryIconView = (MFModernAtomIconView *)v34;

    [(MFModernAtomIconView *)v10->_accessoryIconView setIconPadding:5.0];
    [(MFModernAtomIconView *)v10->_accessoryIconView setAutoresizingMask:20];
    v36 = [MEMORY[0x1E4FB1618] clearColor];
    [(MFModernAtomIconView *)v10->_accessoryIconView setBackgroundColor:v36];

    [(MFModernAtomIconView *)v10->_accessoryIconView setContentMode:3];
    [(MFModernAtomView *)v10 _updateIconViewsSemanticContentAttribute];
    [(MFModernAtomView *)v10 _updateSubviewsForWrapping];
    if ((a4 & 0x204) != 0)
    {
      uint64_t v37 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:4];
      activityIndicator = v10->_activityIndicator;
      v10->_activityIndicator = (UIActivityIndicatorView *)v37;
    }
    v10->_disabledPresentationOptions = 0;
    v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v39 addObserver:v10 selector:sel__invalidatePresentationOptions name:*MEMORY[0x1E4FB27A8] object:0];

    v40 = [MEMORY[0x1E4FB1618] clearColor];
    [(MFModernAtomView *)v10 setBackgroundColor:v40];

    v41 = [(id)objc_opt_class() _defaultTintColor];
    [(MFModernAtomView *)v10 setTintColor:v41];
  }
  return v10;
}

- (NSString)description
{
  BOOL v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [(MFModernAtomView *)self frame];
  double v6 = NSStringFromCGRect(v11);
  uint64_t v7 = [(UILabel *)self->_label text];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %x frame = %@; text = '%@'>", v5, self, v6, v7];;

  return (NSString *)v8;
}

- (int64_t)_preferredIconVariant
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = MFModernUIContentSizeCategoryOrdering();
  BOOL v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v5 = [v4 preferredContentSizeCategory];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      int64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "isEqualToString:", v5, (void)v14))
        {
          int64_t v11 = v8 + v10;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      int64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v11 = 0;
  }
LABEL_12:

  [(MFModernAtomView *)self scale];
  if (v12 > 1.0)
  {
    if (v11 + 3 >= (unint64_t)[v6 count]) {
      int64_t v11 = 6;
    }
    else {
      v11 += 3;
    }
  }

  return v11;
}

- (void)_updateIconViewsSemanticContentAttribute
{
  if (self->_separatorIsLeftAligned) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 3;
  }
  [(MFModernAtomIconView *)self->_accessoryIconView setSemanticContentAttribute:v3];
  badgeIconView = self->_badgeIconView;

  [(MFModernAtomIconView *)badgeIconView setSemanticContentAttribute:v3];
}

- (void)_updateSubviewsForWrapping
{
  BOOL v3 = [(MFModernAtomView *)self isWrappingEnabled];
  [(UILabel *)self->_label setNumberOfLines:!v3];
  if (v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 2;
  }
  [(UILabel *)self->_label setLineBreakMode:v4];
  int64_t v5 = [(MFModernAtomView *)self separatorStyle];
  id v6 = [(MFModernAtomView *)self backgroundView];
  [v6 setSeparatorStyle:2];

  uint64_t v7 = [(MFModernAtomView *)self backgroundView];
  [v7 setSeparatorStyle:v5];

  if (v3)
  {
    [(MFModernAtomIconView *)self->_badgeIconView removeFromSuperview];
    accessoryIconView = self->_accessoryIconView;
    [(MFModernAtomIconView *)accessoryIconView removeFromSuperview];
  }
  else
  {
    [(UIView *)self->_compositingView addSubview:self->_badgeIconView];
    [(UIView *)self->_compositingView addSubview:self->_accessoryIconView];
    [(MFModernAtomIconView *)self->_badgeIconView setNeedsDisplay];
    uint64_t v9 = self->_accessoryIconView;
    [(MFModernAtomIconView *)v9 setNeedsDisplay];
  }
}

- (id)_centeredTextAttachmentWithImage:(id)a3
{
  id v4 = a3;
  int64_t v5 = objc_alloc_init(MFCenteredTextAttachment);
  [v4 size];
  double v7 = v6;
  [v4 size];
  double v9 = v8;
  [v4 size];
  double v11 = v10;
  [v4 size];
  CGFloat v13 = v12;
  long long v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v14 scale];
  CGFloat v16 = v15;
  v20.width = v11 + 3.0;
  v20.height = v13;
  UIGraphicsBeginImageContextWithOptions(v20, 0, v16);

  objc_msgSend(v4, "drawInRect:", 3.0, 0.0, v7, v9);
  long long v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [(UIFont *)self->_titleFont capHeight];
  -[MFCenteredTextAttachment setHeight:](v5, "setHeight:");
  [(MFCenteredTextAttachment *)v5 setImage:v17];

  return v5;
}

- (id)_chevronTextAttachment
{
  BOOL v3 = objc_alloc_init(MFCenteredTextAttachment);
  if (_chevronTextAttachment_onceToken != -1) {
    dispatch_once(&_chevronTextAttachment_onceToken, &__block_literal_global_68);
  }
  uint64_t v4 = [(MFModernAtomView *)self _preferredIconVariant];
  BOOL v5 = [(MFModernAtomView *)self isPrimaryAddressAtom];
  BOOL v6 = v4 < 6 && v5;
  double v7 = _MFAtomViewIconImageVariantNameForGlyphType(@"chevron", v4 + v6);
  double v8 = [(id)_chevronTextAttachment__chevronImageCache objectForKeyedSubscript:v7];
  if (!v8)
  {
    double v9 = (void *)MEMORY[0x1E4FB1818];
    double v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v11 = [v9 imageNamed:v7 inBundle:v10];
    double v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
    CGFloat v13 = [v11 _flatImageWithColor:v12];

    [v13 size];
    double v15 = v14;
    [v13 size];
    double v17 = v16;
    [v13 size];
    double v19 = v18;
    [v13 size];
    CGFloat v21 = v20;
    v22 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v22 scale];
    CGFloat v24 = v23;
    v31.width = v19 + 9.0;
    v31.height = v21;
    UIGraphicsBeginImageContextWithOptions(v31, 0, v24);

    objc_msgSend(v13, "drawInRect:", 3.0, 0.0, v15, v17);
    double v8 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [(id)_chevronTextAttachment__chevronImageCache setObject:v8 forKeyedSubscript:v7];
  }
  if ([(MFModernAtomView *)self separatorIsLeftAligned])
  {
    uint64_t v25 = (void *)MEMORY[0x1E4FB1818];
    id v26 = v8;
    uint64_t v27 = [v26 CGImage];
    [v26 scale];
    uint64_t v28 = objc_msgSend(v25, "imageWithCGImage:scale:orientation:", v27, 4);

    double v8 = (void *)v28;
  }
  [(UIFont *)self->_titleFont capHeight];
  -[MFCenteredTextAttachment setHeight:](v3, "setHeight:");
  [(MFCenteredTextAttachment *)v3 setImage:v8];

  return v3;
}

void __42__MFModernAtomView__chevronTextAttachment__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_chevronTextAttachment__chevronImageCache;
  _chevronTextAttachment__chevronImageCache = (uint64_t)v0;
}

- (BOOL)isWrappingEnabled
{
  if (!self->_wrappingSupported) {
    return 0;
  }
  v2 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  return IsAccessibilityCategory;
}

- (void)setIsPrimaryAddressAtom:(BOOL)a3
{
  if (self->_isPrimaryAddressAtom != a3)
  {
    self->_isPrimaryAddressAtom = a3;
    if (a3) {
      +[MFModernAtomView primaryAtomFont];
    }
    else {
    id v4 = +[MFModernAtomView defaultFont];
    }
    [(MFModernAtomView *)self setTitleFont:v4];
  }
}

- (MFModernAtomBackgroundView)backgroundView
{
  return self->_background;
}

- (UIColor)effectiveTintColor
{
  effectiveTintColor = self->_effectiveTintColor;
  if (effectiveTintColor)
  {
    BOOL v3 = effectiveTintColor;
  }
  else
  {
    BOOL v3 = [(MFModernAtomView *)self tintColor];
  }

  return v3;
}

- (void)_setEffectiveTintColor:(id)a3
{
  BOOL v5 = (UIColor *)a3;
  if (self->_effectiveTintColor != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_effectiveTintColor, a3);
    [(UILabel *)self->_label setTextColor:v7];
    BOOL v6 = [(MFModernAtomView *)self backgroundView];
    [v6 setTintColor:v7];
  }

  MEMORY[0x1F4181820]();
}

- (void)tintColorDidChange
{
  if (!self->_effectiveTintColor
    || ([(MFModernAtomView *)self effectiveTintColor],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [(MFModernAtomView *)self tintColor],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v3 isEqual:v4],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    BOOL v6 = [(MFModernAtomView *)self tintColor];
    [(MFModernAtomView *)self _setEffectiveTintColor:v6];

    [(MFModernAtomView *)self _invalidatePresentationOptions];
  }
}

- (UIFont)titleFont
{
  titleFont = self->_titleFont;
  if (!titleFont)
  {
    id v4 = +[MFModernAtomView defaultFont];
    char v5 = self->_titleFont;
    self->_titleFont = v4;

    titleFont = self->_titleFont;
  }

  return titleFont;
}

- (void)setTitleFont:(id)a3
{
  p_titleFont = &self->_titleFont;
  id v11 = a3;
  if ((-[UIFont isEqual:](*p_titleFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, a3);
    BOOL v6 = [(UILabel *)self->_label attributedText];
    uint64_t v7 = [v6 length];

    double v8 = [(UILabel *)self->_label attributedText];
    double v9 = (void *)[v8 mutableCopy];

    uint64_t v10 = *MEMORY[0x1E4FB06F8];
    objc_msgSend(v9, "removeAttribute:range:", *MEMORY[0x1E4FB06F8], 0, v7);
    objc_msgSend(v9, "addAttribute:value:range:", v10, *p_titleFont, 0, v7);
    [(UILabel *)self->_label setAttributedText:v9];
    [(MFModernAtomView *)self _invalidatePresentationOptions];
  }
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  id v4 = (NSString *)[v6 copy];
  title = self->_title;
  self->_title = v4;

  [(MFModernAtomView *)self _updateLabelAttributes];
}

- (void)_updateLabelAttributes
{
  BOOL v3 = [(MFModernAtomView *)self title];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return;
  }
  char v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"⁠"];
  if ([(MFModernAtomView *)self isWrappingEnabled])
  {
    id v6 = [(MFModernAtomView *)self titleFont];
    uint64_t v7 = +[MFModernAtomView _defaultLabelAttributesWithFont:v6 wrappingEnabled:1];
    double v8 = (void *)[v7 mutableCopy];

    double v9 = [(MFModernAtomView *)self effectiveTintColor];
    uint64_t v10 = *MEMORY[0x1E4FB0700];
    [v8 setObject:v9 forKey:*MEMORY[0x1E4FB0700]];

    id v11 = [v8 objectForKey:*MEMORY[0x1E4FB0738]];
    [v11 setFirstLineHeadIndent:self->_firstLineIndent];
    uint64_t v37 = v8;
    v36 = [MEMORY[0x1E4F28E78] stringWithString:self->_title];
    [v36 insertString:@"​" atIndex:0];
    id v39 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v36 attributes:v8];
    int64_t v12 = [(MFModernAtomView *)self separatorStyle];
    if (v12 == 1)
    {
      CGFloat v21 = (void *)MEMORY[0x1E4F28E48];
      CGFloat v13 = [(MFModernAtomView *)self _chevronTextAttachment];
      v38 = [v21 attributedStringWithAttachment:v13];
    }
    else
    {
      if (v12)
      {
        v38 = 0;
LABEL_11:
        v22 = [(MFModernAtomIconView *)self->_accessoryIconView iconImages];
        double v23 = [(MFModernAtomIconView *)self->_badgeIconView iconImages];
        for (unint64_t i = 0; [v23 count] > i; ++i)
        {
          uint64_t v25 = [v23 objectAtIndex:i];
          id v26 = (void *)MEMORY[0x1E4F28B18];
          uint64_t v27 = [(MFModernAtomView *)self _centeredTextAttachmentWithImage:v25];
          uint64_t v28 = [v26 attributedStringWithAttachment:v27];

          [v39 insertAttributedString:v5 atIndex:1];
          [v39 insertAttributedString:v28 atIndex:1];
        }
        for (unint64_t j = 0; [v22 count] > j; ++j)
        {
          uint64_t v30 = [v22 objectAtIndex:j];
          CGSize v31 = (void *)MEMORY[0x1E4F28B18];
          v32 = [(MFModernAtomView *)self _centeredTextAttachmentWithImage:v30];
          v33 = [v31 attributedStringWithAttachment:v32];

          objc_msgSend(v39, "insertAttributedString:atIndex:", v5, objc_msgSend(v39, "length"));
          objc_msgSend(v39, "insertAttributedString:atIndex:", v33, objc_msgSend(v39, "length"));
        }
        if (v38 && !self->_separatorHidden)
        {
          objc_msgSend(v39, "insertAttributedString:atIndex:", v5, objc_msgSend(v39, "length"));
          objc_msgSend(v39, "insertAttributedString:atIndex:", v38, objc_msgSend(v39, "length"));
        }

        double v20 = v37;
        goto LABEL_21;
      }
      CGFloat v13 = [MEMORY[0x1E4F1CA60] dictionary];
      double v14 = [(MFModernAtomView *)self titleFont];
      [v13 setObject:v14 forKey:*MEMORY[0x1E4FB06F8]];

      double v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
      [v13 setObject:v15 forKey:v10];

      id v16 = objc_alloc(MEMORY[0x1E4F28E48]);
      double v17 = MFLocalizedAddressSeparator();
      v38 = (void *)[v16 initWithString:v17 attributes:v13];
    }
    goto LABEL_11;
  }
  id v18 = objc_alloc(MEMORY[0x1E4F28E48]);
  title = self->_title;
  double v20 = [(MFModernAtomView *)self titleFont];
  id v11 = +[MFModernAtomView _defaultLabelAttributesWithFont:v20 wrappingEnabled:0];
  id v39 = (id)[v18 initWithString:title attributes:v11];
LABEL_21:

  [(UILabel *)self->_label setAttributedText:v39];
  label = self->_label;
  v35 = [(MFModernAtomView *)self effectiveTintColor];
  [(UILabel *)label setTextColor:v35];

  [(UILabel *)self->_label sizeToFit];
  [(MFModernAtomView *)self sizeToFit];
  [(MFModernAtomView *)self setNeedsLayout];
}

- (void)_invalidatePresentationOptions
{
  [(MFModernAtomView *)self invalidateIntrinsicContentSize];
  BOOL v3 = [(MFModernAtomView *)self tintColor];
  if ([(MFModernAtomView *)self tintAdjustmentMode] == 2) {
    goto LABEL_10;
  }
  if ([(MFModernAtomView *)self presentationOptions])
  {
    uint64_t v4 = +[MFModernAtomView _failureTintColor];
  }
  else
  {
    if (([(MFModernAtomView *)self presentationOptions] & 2) == 0) {
      goto LABEL_7;
    }
    uint64_t v4 = +[MFModernAtomView _SMSTintColor];
  }
  char v5 = (void *)v4;

  BOOL v3 = v5;
LABEL_7:
  if (v3)
  {
    [(MFModernAtomView *)self _setEffectiveTintColor:v3];
  }
  else
  {
    id v12 = [(MFModernAtomView *)self tintColor];
    -[MFModernAtomView _setEffectiveTintColor:](self, "_setEffectiveTintColor:");

    BOOL v3 = 0;
  }
LABEL_10:
  unint64_t v6 = [(MFModernAtomView *)self presentationOptions];
  int64_t v7 = [(MFModernAtomView *)self _preferredIconVariant];
  id v13 = v3;
  BOOL v8 = [(MFModernAtomView *)self isPrimaryAddressAtom];
  double v9 = +[MFModernAtomView _badgeImagesForPresentationOptions:v6 iconOrder:&_badgeStyleOrder orderingLength:5 tintColor:v13 large:v8 variant:v7];
  [(MFModernAtomIconView *)self->_badgeIconView setIconImages:v9];
  uint64_t v10 = +[MFModernAtomView _badgeImagesForPresentationOptions:v6 iconOrder:&_accessoryStyleOrder orderingLength:4 tintColor:v13 large:v8 variant:v7];
  [(MFModernAtomIconView *)self->_accessoryIconView setIconImages:v10];
  [(MFModernAtomView *)self _updateActivityIndicator];
  [(MFModernAtomView *)self setNeedsLayout];
  BOOL cachedIsWrappingEnabled = self->_cachedIsWrappingEnabled;
  if (cachedIsWrappingEnabled == [(MFModernAtomView *)self isWrappingEnabled])
  {
    [(MFModernAtomIconView *)self->_badgeIconView setNeedsDisplay];
    [(MFModernAtomIconView *)self->_accessoryIconView setNeedsDisplay];
  }
  else
  {
    self->_BOOL cachedIsWrappingEnabled = [(MFModernAtomView *)self isWrappingEnabled];
    [(MFModernAtomView *)self _updateSubviewsForWrapping];
    [(MFModernAtomView *)self _updateLabelAttributes];
  }
  [(MFModernAtomBackgroundView *)self->_background invalidateIntrinsicContentSize];
  [(MFModernAtomBackgroundView *)self->_background setNeedsLayout];
}

- (void)setPresentationOptions:(unint64_t)a3
{
  if (self->_presentationOptions != a3)
  {
    self->_presentationOptions = a3;
    [(MFModernAtomView *)self _invalidatePresentationOptions];
  }
}

- (void)appendPresentationOption:(unint64_t)a3
{
  self->_presentationOptions |= a3;
  [(MFModernAtomView *)self _invalidatePresentationOptions];
}

- (void)clearPresentationOption:(unint64_t)a3
{
  self->_presentationOptions &= ~a3;
  [(MFModernAtomView *)self _invalidatePresentationOptions];
}

- (void)_setPresentationOption:(unint64_t)a3 enabled:(BOOL)a4
{
  if (a4) {
    unint64_t v4 = self->_disabledPresentationOptions & ~a3;
  }
  else {
    unint64_t v4 = self->_disabledPresentationOptions | a3;
  }
  self->_disabledPresentationOptions = v4;
  [(MFModernAtomView *)self _invalidatePresentationOptions];
}

- (unint64_t)effectivePresentationOptions
{
  return [(MFModernAtomView *)self presentationOptions] & ~self->_disabledPresentationOptions;
}

- (void)setSeparatorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_separatorHidden = a3;
  if ([(MFModernAtomView *)self isWrappingEnabled])
  {
    [(MFModernAtomView *)self _updateLabelAttributes];
  }
  else
  {
    char v5 = [(MFModernAtomView *)self backgroundView];
    unint64_t v6 = [v5 separatorView];
    [v6 setHidden:v3];
  }

  [(MFModernAtomView *)self invalidateIntrinsicContentSize];
}

- (BOOL)separatorHidden
{
  if (self->_separatorHidden) {
    return 1;
  }
  BOOL v3 = [(MFModernAtomView *)self backgroundView];
  BOOL v2 = [v3 separatorStyle] == 2;

  return v2;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  char v5 = [(MFModernAtomView *)self backgroundView];
  [v5 setSeparatorStyle:a3];

  if ([(MFModernAtomView *)self isWrappingEnabled])
  {
    [(MFModernAtomView *)self _updateLabelAttributes];
  }
  else
  {
    [(MFModernAtomView *)self sizeToFit];
  }
}

- (int64_t)separatorStyle
{
  BOOL v2 = [(MFModernAtomView *)self backgroundView];
  int64_t v3 = [v2 separatorStyle];

  return v3;
}

- (void)setSeparatorIsLeftAligned:(BOOL)a3
{
  if (self->_separatorIsLeftAligned != a3)
  {
    self->_separatorIsLeftAligned = a3;
    [(MFModernAtomView *)self _updateIconViewsSemanticContentAttribute];
    unint64_t v4 = [(MFModernAtomView *)self backgroundView];
    [v4 layoutSubviews];

    [(MFModernAtomView *)self layoutSubviews];
  }
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 style:(unint64_t)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  double v9 = [(MFModernAtomView *)self backgroundView];
  [v9 setSelected:v7 animated:v6 style:a5];

  if (self->_selected != v7)
  {
    self->_selected = v7;
    [(MFModernAtomView *)self _updateActivityIndicator];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__MFModernAtomView_setSelected_animated_style___block_invoke;
    void v13[3] = &unk_1E5F79898;
    v13[4] = self;
    BOOL v14 = v7;
    uint64_t v10 = _Block_copy(v13);
    id v11 = v10;
    if (v6)
    {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v10 animations:0.15];
      if (!v7)
      {
        UIAnimationDragCoefficient();
        [(MFModernAtomView *)self performSelector:sel__updateCompositingFilters withObject:0 afterDelay:v12 * 0.15];
LABEL_7:

        return;
      }
    }
    else
    {
      (*((void (**)(void *))v10 + 2))(v10);
    }
    [(MFModernAtomView *)self _updateCompositingFilters];
    goto LABEL_7;
  }
}

void __47__MFModernAtomView_setSelected_animated_style___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  id v2 = [MEMORY[0x1E4FB1618] clearColor];
  }
  [*(id *)(*(void *)(a1 + 32) + 472) setBackgroundColor:v2];
}

- (BOOL)hidesVIPIndicator
{
  return (LOBYTE(self->_disabledPresentationOptions) >> 4) & 1;
}

- (void)setHidesVIPIndicator:(BOOL)a3
{
}

- (void)_updateCompositingFilters
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_selected)
  {
    int64_t v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A370]];
  }
  else
  {
    int64_t v3 = 0;
  }
  uint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  v9[0] = self->_badgeIconView;
  v9[1] = self->_accessoryIconView;
  v9[2] = self->_label;
  unint64_t v4 = [(MFModernAtomView *)self backgroundView];
  uint64_t v10 = [v4 separatorView];

  for (uint64_t i = 0; i != 4; ++i)
  {
    id v6 = (id)v9[i];
    BOOL v7 = [v6 layer];
    [v7 setCompositingFilter:v3];
  }
  for (uint64_t j = 3; j != -1; --j)
}

- (void)_updateActivityIndicator
{
  unint64_t v3 = [(MFModernAtomView *)self presentationOptions] & 0x204;
  if ([(MFModernAtomView *)self isSelected]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 4;
  }
  activityIndicator = self->_activityIndicator;
  if (v3)
  {
    if (activityIndicator)
    {
      if ([(UIActivityIndicatorView *)activityIndicator activityIndicatorViewStyle] == v4) {
        return;
      }
      [(UIActivityIndicatorView *)self->_activityIndicator removeFromSuperview];
      id v6 = self->_activityIndicator;
      self->_activityIndicator = 0;
    }
    BOOL v7 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:v4];
    BOOL v8 = self->_activityIndicator;
    self->_activityIndicator = v7;

    [(MFModernAtomView *)self addSubview:self->_activityIndicator];
    [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
    [(MFModernAtomView *)self setNeedsLayout];
    [(MFModernAtomView *)self invalidateIntrinsicContentSize];
  }
  else if (activityIndicator)
  {
    [(UIActivityIndicatorView *)activityIndicator removeFromSuperview];
    double v9 = self->_activityIndicator;
    self->_activityIndicator = 0;
  }
}

- (void)_updateFontIfNecessary
{
  if ([(MFModernAtomView *)self isPrimaryAddressAtom])
  {
    id v5 = [(id)objc_opt_class() primaryAtomFont];
    -[MFModernAtomView setTitleFont:](self, "setTitleFont:");
  }
  else
  {
    titleFont = self->_titleFont;
    if (titleFont)
    {
      id v6 = [(id)objc_opt_class() primaryAtomFont];
      int v4 = -[UIFont isEqual:](titleFont, "isEqual:");

      if (!v4) {
        return;
      }
    }
    id v5 = [(id)objc_opt_class() defaultFont];
    -[MFModernAtomView setTitleFont:](self, "setTitleFont:");
  }
}

- (double)preferredWidth
{
  -[MFModernAtomView preferredWidthWithSizeConstraints:](self, "preferredWidthWithSizeConstraints:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(MFModernAtomView *)self isWrappingEnabled])
  {
    [(MFModernAtomView *)self _leftPadding];
    double v7 = v6;
    [(MFModernAtomView *)self _rightPadding];
    label = self->_label;
    double v10 = fmax(width - (v7 + v8), 0.0);
    -[UILabel sizeThatFits:](label, "sizeThatFits:", v10, 1.79769313e308);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MFModernAtomView;
    -[MFModernAtomView sizeThatFits:](&v13, sel_sizeThatFits_, width, height);
  }
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (double)preferredWidthWithSizeConstraints:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(MFModernAtomView *)self _leftPadding];
  double v7 = v6;
  [(MFModernAtomView *)self _rightPadding];
  double v9 = fmax(width - (v7 + v8), 0.0);
  double v10 = [(UILabel *)self->_label attributedText];
  objc_msgSend(v10, "boundingRectWithSize:options:context:", 1, 0, v9, height);
  double v12 = ceil(v11);

  [(MFModernAtomView *)self _leftPadding];
  double v14 = v12 + v13;
  [(MFModernAtomView *)self _rightPadding];
  double result = fmax(v14 + v15, 25.0);
  if (width < result && width > 0.0) {
    return width;
  }
  return result;
}

- (void)layoutSubviews
{
  [(MFModernAtomView *)self _updateFontIfNecessary];
  [(MFModernAtomView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_compositingView, "setFrame:");
  double rect = v8;
  -[MFModernAtomView preferredWidthWithSizeConstraints:](self, "preferredWidthWithSizeConstraints:", v8, v10);
  double v12 = v11;
  [(UILabel *)self->_label bounds];
  double v14 = v13;
  double v15 = [(UILabel *)self->_label font];
  [v15 lineHeight];
  double v17 = round(v14 / v16);

  if ([(MFModernAtomView *)self isWrappingEnabled])
  {
    id v18 = [(MFModernAtomView *)self titleLabel];
    [v18 frame];
    double v12 = v19 + 4.0;

    if (v17 == 1.0)
    {
      double firstLineIndent = self->_firstLineIndent;
      double v12 = v12 - firstLineIndent;
      double v21 = firstLineIndent + 0.0;
    }
    else
    {
      double v21 = 0.0;
    }
  }
  else
  {
    double v21 = 0.0;
    if (![(MFModernAtomView *)self separatorHidden]
      && ![(MFModernAtomView *)self separatorStyle])
    {
      v22 = [(MFModernAtomView *)self backgroundView];
      [v22 separatorWidth];
      double v12 = v12 - v23;
    }
  }
  -[MFModernAtomBackgroundView setFrame:](self->_background, "setFrame:", v21, 0.0, v12, v10);
  if ([(MFModernAtomView *)self isWrappingEnabled])
  {
    label = self->_label;
    [(MFModernAtomView *)self bounds];
    -[UILabel sizeThatFits:](label, "sizeThatFits:", v25, v26);
    double v28 = v27;
    double v30 = v29;
  }
  else
  {
    [(MFModernAtomView *)self _leftPadding];
    [(MFModernAtomView *)self _rightPadding];
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v30 = v31;
    UIRoundToViewScale();
    double v28 = v32;
  }
  [(MFModernAtomView *)self _leftPadding];
  double v34 = v33;
  BOOL separatorIsLeftAligned = self->_separatorIsLeftAligned;
  if (self->_separatorIsLeftAligned)
  {
    CGFloat v36 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    v71.origin.x = v4;
    v71.origin.y = v6;
    v71.size.double width = rect;
    v71.size.double height = v10;
    double MaxX = CGRectGetMaxX(v71);
    v72.origin.x = v34;
    v72.origin.y = v36;
    v72.size.double width = v28;
    v72.size.double height = v30;
    double v38 = MaxX - CGRectGetWidth(v72);
    [(MFModernAtomView *)self _leftPadding];
    double v34 = v38 - v39;
  }
  double v40 = round(v10 * 0.5 - v30 * 0.5);
  -[UILabel setFrame:](self->_label, "setFrame:", v34, v40, v28, v30);
  if ([(MFModernAtomView *)self isWrappingEnabled] && v17 == 1.0)
  {
    double v41 = self->_firstLineIndent;
    double v42 = v34 + v41;
    double v43 = v28 - v41;
    titleLabelFillView = self->_titleLabelFillView;
    double v45 = v40;
  }
  else
  {
    titleLabelFillView = self->_titleLabelFillView;
    double v42 = v34;
    double v45 = v40;
    double v43 = v28;
  }
  -[UIView setFrame:](titleLabelFillView, "setFrame:", v42, v45, v43, v30);
  [(MFModernAtomIconView *)self->_badgeIconView preferredWidth];
  double v47 = v46;
  [(MFModernAtomIconView *)self->_accessoryIconView preferredWidth];
  double v49 = v48;
  [(MFModernAtomView *)self _leftInset];
  if (separatorIsLeftAligned)
  {
    double v51 = rect - v47 - v50;
    v73.origin.x = v34;
    v73.origin.y = v40;
    v73.size.double width = v28;
    v73.size.double height = v30;
    double v52 = CGRectGetMinX(v73) + -5.0 - v49;
  }
  else
  {
    double v51 = v50 + self->_firstLineIndent;
    v74.origin.x = v34;
    v74.origin.y = v40;
    v74.size.double width = v28;
    v74.size.double height = v30;
    double v52 = CGRectGetMaxX(v74) + 5.0;
  }
  -[MFModernAtomIconView setFrame:](self->_badgeIconView, "setFrame:", v51, 0.0, v47, v10);
  -[MFModernAtomIconView setFrame:](self->_accessoryIconView, "setFrame:", v52, 0.0, v49, v10);
  [(MFModernAtomView *)self baselinePoint];
  double v54 = v53;
  [(MFModernAtomIconView *)self->_accessoryIconView setDrawingOffset:0.0];
  -[MFModernAtomIconView setDrawingOffset:](self->_badgeIconView, "setDrawingOffset:", 0.0, v54);
  activityIndicator = self->_activityIndicator;
  if (activityIndicator)
  {
    [(UIActivityIndicatorView *)activityIndicator frame];
    double v57 = v56;
    double v59 = v58;
    UIRoundToViewScale();
    double v61 = v60;
    if (separatorIsLeftAligned) {
      char v62 = (self->_presentationOptions & 0x200) == 0;
    }
    else {
      char v62 = (self->_presentationOptions & 0x200) >> 9;
    }
    BOOL v63 = [(MFModernAtomView *)self separatorHidden]
       || [(MFModernAtomView *)self separatorStyle] != 0;
    if (v62)
    {
      if (separatorIsLeftAligned) {
        double v64 = 7.0;
      }
      else {
        double v64 = 5.0;
      }
      if (!separatorIsLeftAligned) {
        BOOL v63 = 1;
      }
      if (v63) {
        goto LABEL_42;
      }
      v65 = [(MFModernAtomView *)self backgroundView];
      [v65 separatorWidth];
      double v64 = v64 + v66;
    }
    else
    {
      double v67 = 5.0;
      if (!separatorIsLeftAligned) {
        double v67 = 7.0;
      }
      double v64 = rect - v67 - v57;
      if (separatorIsLeftAligned) {
        BOOL v63 = 1;
      }
      if (v63) {
        goto LABEL_42;
      }
      v65 = [(MFModernAtomView *)self backgroundView];
      [v65 separatorWidth];
      double v64 = v64 - v68;
    }

LABEL_42:
    -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v64, v61, v57, v59);
  }
  v70.receiver = self;
  v70.super_class = (Class)MFModernAtomView;
  [(MFModernAtomView *)&v70 layoutSubviews];
}

- (CGRect)selectionFrame
{
  double v3 = [(MFModernAtomBackgroundView *)self->_background selectedView];
  [v3 frame];
  -[MFModernAtomView convertRect:fromView:](self, "convertRect:fromView:", self->_background);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  [(MFModernAtomView *)self _leftInset];
  double v4 = v3;
  [(MFModernAtomView *)self _rightInset];
  double v6 = v5;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = v4;
  result.right = v6;
  result.bottom = v8;
  result.left = v9;
  result.top = v7;
  return result;
}

- (double)_leftInset
{
  return floor(self->_scalingFactor * 4.0);
}

- (double)_rightInset
{
  double v3 = 3.0;
  if (![(MFModernAtomView *)self separatorHidden])
  {
    double v4 = [(MFModernAtomView *)self backgroundView];
    [v4 separatorWidth];
    double v3 = v5 + 5.0;
  }
  double result = 0.0;
  if (self->_separatorIsLeftAligned) {
    return v3;
  }
  return result;
}

- (double)_rightPadding
{
  BOOL v3 = [(MFModernAtomView *)self separatorHidden];
  if ([(MFModernAtomView *)self isWrappingEnabled])
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(MFModernAtomIconView *)self->_accessoryIconView iconImages];
    BOOL v4 = [v5 count] == 0;
  }
  double v6 = 4.0;
  if (!v3 || !v4)
  {
    double v6 = 2.0;
    if (!v3)
    {
      double v7 = [(MFModernAtomView *)self backgroundView];
      [v7 separatorWidth];
      double v9 = v8 + 2.0;

      double v6 = v9 + 2.0;
    }
    if (!v4)
    {
      [(MFModernAtomIconView *)self->_accessoryIconView preferredWidth];
      double v6 = v6 + -2.0 + v10 + 5.0;
    }
  }
  activityIndicator = self->_activityIndicator;
  if (activityIndicator && (self->_presentationOptions & 4) != 0)
  {
    [(UIActivityIndicatorView *)activityIndicator frame];
    double v6 = v6 + CGRectGetWidth(v13) + 5.0;
  }
  return v6 * self->_scalingFactor;
}

- (double)_leftPadding
{
  double v3 = 4.0;
  if (![(MFModernAtomView *)self isWrappingEnabled])
  {
    [(MFModernAtomIconView *)self->_badgeIconView preferredWidth];
    double v3 = v4 + 4.0;
  }
  activityIndicator = self->_activityIndicator;
  if (activityIndicator && (self->_presentationOptions & 0x200) != 0)
  {
    [(UIActivityIndicatorView *)activityIndicator frame];
    return v3 + CGRectGetWidth(v7) + 5.0;
  }
  return v3;
}

- (double)scale
{
  return self->_scalingFactor;
}

- (void)setScale:(double)a3
{
  if (self->_scalingFactor != a3)
  {
    self->_scalingFactor = a3;
    id v8 = [(MFModernAtomView *)self backgroundView];
    [v8 setScalingFactor:a3];

    double v5 = [(MFModernAtomView *)self titleFont];
    double v6 = v5;
    if (a3 != 1.0)
    {
      id v9 = v5;
      uint64_t v7 = [v5 _fontScaledByScaleFactor:self->_scalingFactor];

      double v6 = (void *)v7;
    }
    id v10 = v6;
    [(MFModernAtomView *)self setTitleFont:v6];
    [(MFModernAtomView *)self setNeedsLayout];
  }
}

- (CGPoint)baselinePoint
{
  [(UILabel *)self->_label frame];
  double v4 = v3;
  [(UILabel *)self->_label _firstLineBaseline];
  double v6 = v4 + v5;
  double v7 = 0.0;
  result.y = v6;
  result.x = v7;
  return result;
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (CGSize)intrinsicContentSize
{
  [(MFModernAtomView *)self preferredWidth];
  double v4 = v3;
  [(UILabel *)self->_label intrinsicContentSize];
  double v6 = v5 + 6.0;
  double v7 = v4;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (void)performBuildInAnimationFromTextColor:(id)a3 withDuration:(double)a4
{
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4FB1930]);
  id v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v9 = [(UILabel *)self->_label attributedText];
  [v8 setAttributedText:v9];

  [(UILabel *)self->_label frame];
  objc_msgSend(v8, "setFrame:");
  [v8 setTextColor:v6];
  [(MFModernAtomView *)self addSubview:v8];
  [(MFModernAtomBackgroundView *)self->_background setAlpha:0.0];
  [(UILabel *)self->_label setAlpha:0.0];
  id v10 = (void *)MEMORY[0x1E4FB1EB0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__MFModernAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke;
  v14[3] = &unk_1E5F79038;
  void v14[4] = self;
  id v15 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__MFModernAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke_2;
  v12[3] = &unk_1E5F7A210;
  id v11 = v15;
  id v13 = v11;
  [v10 animateWithDuration:v14 animations:v12 completion:a4];
}

uint64_t __70__MFModernAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 480) setAlpha:1.0];
  id v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

uint64_t __70__MFModernAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) removeFromSuperview];
  }
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (UILabel)titleLabel
{
  return self->_label;
}

- (MFModernAtomIconView)accessoryIconView
{
  return self->_accessoryIconView;
}

- (MFModernAtomIconView)badgeIconView
{
  return self->_badgeIconView;
}

- (BOOL)isPrimaryAddressAtom
{
  return self->_isPrimaryAddressAtom;
}

- (BOOL)separatorIsLeftAligned
{
  return self->_separatorIsLeftAligned;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (unint64_t)presentationOptions
{
  return self->_presentationOptions;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (double)firstLineIndent
{
  return self->_firstLineIndent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_titleLabelFillView, 0);
  objc_storeStrong((id *)&self->_compositingView, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_baselineView, 0);
  objc_storeStrong((id *)&self->_effectiveTintColor, 0);
  objc_storeStrong((id *)&self->_accessoryIconView, 0);

  objc_storeStrong((id *)&self->_badgeIconView, 0);
}

@end