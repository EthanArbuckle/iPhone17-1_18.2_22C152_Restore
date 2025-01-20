@interface CNAtomView
+ (BOOL)presentationOptions:(unint64_t *)a3 encodedIntoAddress:(id)a4;
+ (CGPoint)defaultBaselinePoint;
+ (double)defaultHeight;
+ (id)_SMSTintColor;
+ (id)_badgeImagesForPresentationOptions:(unint64_t)a3 iconOrder:(const unint64_t *)a4 orderingLength:(unint64_t)a5 tintColor:(id)a6 large:(BOOL)a7 variant:(int)a8;
+ (id)_badgeImagesForPresentationOptions:(unint64_t)a3 iconOrder:(const unint64_t *)a4 orderingLength:(unint64_t)a5 tintColor:(id)a6 large:(BOOL)a7 variant:(int)a8 selected:(BOOL)a9;
+ (id)_clearBackgroundTextTintColor;
+ (id)_defaultLabelAttributesWithFont:(id)a3 wrappingEnabled:(BOOL)a4;
+ (id)_defaultLabelAttributesWithWrappingEnabled:(BOOL)a3;
+ (id)_defaultTintColor;
+ (id)_downtimeBlockedTintColor;
+ (id)_faceTimeTintColor;
+ (id)_faceTimeUnresolvedColor;
+ (id)_failureTintColor;
+ (id)_hoveredDefaultTintColor;
+ (id)_hoveredDowntimeBlockedTintColor;
+ (id)_hoveredFailureTintColor;
+ (id)_hoveredSMSTintColor;
+ (id)_invalidAddressTintColor;
+ (id)_newTextLabel;
+ (id)defaultFont;
+ (id)primaryAtomFont;
- (BOOL)appearsSelected;
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
- (CNAtomView)initWithFrame:(CGRect)a3 presentationOptions:(unint64_t)a4 separatorStyle:(int)a5 wrappingSupported:(BOOL)a6;
- (CNModernAtomBackgroundView)backgroundView;
- (CNModernAtomIconView)accessoryIconView;
- (CNModernAtomIconView)badgeIconView;
- (NSString)description;
- (NSString)title;
- (UIActivityIndicatorView)activityIndicator;
- (UIColor)effectiveTintColor;
- (UIEdgeInsets)edgeInsets;
- (UIFont)titleFont;
- (UIImageView)downwardChevronImageView;
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
- (id)menuConfigurationForChevronButton;
- (id)viewForLastBaselineLayout;
- (int)_preferredIconVariant;
- (int)separatorStyle;
- (unint64_t)effectivePresentationOptions;
- (unint64_t)presentationOptions;
- (void)_invalidatePresentationOptions;
- (void)_setEffectiveTintColor:(id)a3;
- (void)_setPresentationOption:(unint64_t)a3 enabled:(BOOL)a4;
- (void)_setupOverlayLabelForNonColoredGlyphs;
- (void)_updateActivityIndicator;
- (void)_updateCompositingFilters;
- (void)_updateFontIfNecessary;
- (void)_updateIconViewsSemanticContentAttribute;
- (void)_updateLabelAttributes;
- (void)_updateOverlayLabelText;
- (void)_updateSubviewsForWrapping;
- (void)appendPresentationOption:(unint64_t)a3;
- (void)clearPresentationOption:(unint64_t)a3;
- (void)displaySelectionChangeWithAnimation:(BOOL)a3;
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
- (void)setSeparatorStyle:(int)a3;
- (void)setTitle:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setupOverlayLabelTextForEmojiRanges:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateDisplayForInvalidAddressForSelectedState:(BOOL)a3;
@end

@implementation CNAtomView

+ (double)defaultHeight
{
  return 20.0;
}

+ (CGPoint)defaultBaselinePoint
{
  v2 = +[CNAtomView defaultFont];
  objc_msgSend(v2, "cn_baselinePointFromOriginPoint:", 0.0, 0.0);
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

+ (id)defaultFont
{
  v2 = +[CNAutocompleteFontMetricCache sharedFontMetricCache];
  double v3 = [v2 cachedFont:&__block_literal_global_10 forKey:@"CNAtomViewDefaultFont"];

  return v3;
}

id __25__CNAtomView_defaultFont__block_invoke()
{
  v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438C8] addingSymbolicTraits:0x8000 options:0];
  v1 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v0 size:0.0];

  return v1;
}

+ (id)primaryAtomFont
{
  v2 = +[CNAutocompleteFontMetricCache sharedFontMetricCache];
  double v3 = [v2 cachedFont:&__block_literal_global_38 forKey:@"CNAtomViewPrimaryFont"];

  return v3;
}

id __29__CNAtomView_primaryAtomFont__block_invoke()
{
  v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438A8]];
  v1 = [v0 fontDescriptorWithSymbolicTraits:0x8000];

  v2 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v1 size:0.0];

  return v2;
}

+ (id)_defaultTintColor
{
  return (id)[MEMORY[0x1E4F428B8] colorWithDynamicProvider:&__block_literal_global_45_0];
}

uint64_t __31__CNAtomView__defaultTintColor__block_invoke()
{
  return [MEMORY[0x1E4F428B8] systemBlueColor];
}

+ (id)_hoveredDefaultTintColor
{
  return (id)[MEMORY[0x1E4F428B8] colorWithDynamicProvider:&__block_literal_global_47];
}

id __38__CNAtomView__hoveredDefaultTintColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.086;
    double v3 = 0.42;
    double v4 = 0.25;
  }
  else
  {
    double v2 = 0.731;
    double v4 = 0.847;
    double v3 = 1.0;
  }
  double v5 = [MEMORY[0x1E4F428B8] colorWithRed:v2 green:v4 blue:v3 alpha:1.0];

  return v5;
}

+ (id)_failureTintColor
{
  return (id)[MEMORY[0x1E4F428B8] colorWithDynamicProvider:&__block_literal_global_49_0];
}

uint64_t __31__CNAtomView__failureTintColor__block_invoke()
{
  return [MEMORY[0x1E4F428B8] systemRedColor];
}

+ (id)_hoveredFailureTintColor
{
  return (id)[MEMORY[0x1E4F428B8] colorWithDynamicProvider:&__block_literal_global_51];
}

id __38__CNAtomView__hoveredFailureTintColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.462;
    double v3 = 0.233;
    double v4 = 0.252;
  }
  else
  {
    double v2 = 0.986;
    double v3 = 0.778;
    double v4 = 0.767;
  }
  double v5 = [MEMORY[0x1E4F428B8] colorWithRed:v2 green:v3 blue:v4 alpha:1.0];

  return v5;
}

+ (id)_downtimeBlockedTintColor
{
  return +[CNAtomView _failureTintColor];
}

+ (id)_hoveredDowntimeBlockedTintColor
{
  return +[CNAtomView _hoveredFailureTintColor];
}

+ (id)_SMSTintColor
{
  return (id)[MEMORY[0x1E4F428B8] colorWithDynamicProvider:&__block_literal_global_53_0];
}

uint64_t __27__CNAtomView__SMSTintColor__block_invoke()
{
  return [MEMORY[0x1E4F428B8] colorWithRed:0.16 green:0.772 blue:0.098 alpha:1.0];
}

+ (id)_hoveredSMSTintColor
{
  return (id)[MEMORY[0x1E4F428B8] colorWithDynamicProvider:&__block_literal_global_55];
}

id __34__CNAtomView__hoveredSMSTintColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.22;
    double v3 = 0.405;
    double v4 = 0.243;
  }
  else
  {
    double v2 = 0.73;
    double v3 = 0.897;
    double v4 = 0.755;
  }
  double v5 = [MEMORY[0x1E4F428B8] colorWithRed:v2 green:v3 blue:v4 alpha:1.0];

  return v5;
}

+ (id)_faceTimeTintColor
{
  if (CNComposeIsAppDesignedForVisionOS()) {
    [MEMORY[0x1E4F428B8] systemBlueColor];
  }
  else {
  double v2 = [MEMORY[0x1E4F428B8] systemTealColor];
  }

  return v2;
}

+ (id)_faceTimeUnresolvedColor
{
  return (id)[MEMORY[0x1E4F428B8] systemGrayColor];
}

+ (id)_invalidAddressTintColor
{
  return (id)[MEMORY[0x1E4F428B8] secondaryLabelColor];
}

+ (id)_clearBackgroundTextTintColor
{
  return (id)[MEMORY[0x1E4F428B8] labelColor];
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
  v9 = +[CNAtomView _defaultTintColor];
  v14[1] = v9;
  v13[2] = *MEMORY[0x1E4FB06F8];
  v10 = +[CNAtomView defaultFont];
  v14[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  return v11;
}

- (void)setFirstLineIndent:(double)a3
{
  self->_firstLineIndent = a3;
  if ([(CNAtomView *)self isWrappingEnabled])
  {
    [(CNAtomView *)self _updateLabelAttributes];
  }
}

+ (id)_defaultLabelAttributesWithFont:(id)a3 wrappingEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = +[CNAtomView _defaultLabelAttributesWithWrappingEnabled:v4];
  uint64_t v7 = (void *)[v6 mutableCopy];

  [v7 setObject:v5 forKey:*MEMORY[0x1E4FB06F8]];

  return v7;
}

+ (id)_badgeImagesForPresentationOptions:(unint64_t)a3 iconOrder:(const unint64_t *)a4 orderingLength:(unint64_t)a5 tintColor:(id)a6 large:(BOOL)a7 variant:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  BOOL v9 = a7;
  id v13 = a6;
  LOBYTE(v16) = 0;
  v14 = [(id)objc_opt_class() _badgeImagesForPresentationOptions:a3 iconOrder:a4 orderingLength:a5 tintColor:v13 large:v9 variant:v8 selected:v16];

  return v14;
}

+ (id)_badgeImagesForPresentationOptions:(unint64_t)a3 iconOrder:(const unint64_t *)a4 orderingLength:(unint64_t)a5 tintColor:(id)a6 large:(BOOL)a7 variant:(int)a8 selected:(BOOL)a9
{
  id v12 = a6;
  for (i = [MEMORY[0x1E4F1CA48] array];
  {
    uint64_t v16 = *a4++;
    uint64_t v15 = v16;
    if ((v16 & a3) != 0)
    {
      v17 = CNIconImageForPresentationOption(v15, v12, v13, 0, a9);
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

      id v12 = objc_msgSend(v5, "substringWithRange:", v9, v11);
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

- (CNAtomView)initWithFrame:(CGRect)a3 presentationOptions:(unint64_t)a4 separatorStyle:(int)a5 wrappingSupported:(BOOL)a6
{
  uint64_t v7 = *(void *)&a5;
  v37.receiver = self;
  v37.super_class = (Class)CNAtomView;
  uint64_t v9 = -[CNAtomView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_scalingFactor = 1.0;
    v9->_separatorHidden = 0;
    v9->_presentationOptions = a4;
    v9->_firstLineIndent = 0.0;
    v9->_wrappingSupported = a6;
    v9->_cachedIsWrappingEnabled = [(CNAtomView *)v9 isWrappingEnabled];
    uint64_t v11 = [MEMORY[0x1E4F42738] sharedApplication];
    v10->_separatorIsLeftAligned = [v11 userInterfaceLayoutDirection] == 1;

    id v12 = objc_alloc(MEMORY[0x1E4F42FF0]);
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabelFillView = v10->_titleLabelFillView;
    v10->_titleLabelFillView = (UIView *)v13;

    [(UIView *)v10->_titleLabelFillView setUserInteractionEnabled:0];
    [(CNAtomView *)v10 addSubview:v10->_titleLabelFillView];
    id v15 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(CNAtomView *)v10 bounds];
    uint64_t v16 = objc_msgSend(v15, "initWithFrame:");
    compositingView = v10->_compositingView;
    v10->_compositingView = (UIView *)v16;

    [(UIView *)v10->_compositingView setAutoresizingMask:2];
    [(UIView *)v10->_compositingView setUserInteractionEnabled:0];
    [(CNAtomView *)v10 addSubview:v10->_compositingView];
    v18 = [CNModernAtomBackgroundView alloc];
    [(CNAtomView *)v10 bounds];
    v19 = -[CNModernAtomBackgroundView initWithFrame:](v18, "initWithFrame:");
    [(CNModernAtomBackgroundView *)v19 setOpaque:0];
    v20 = [MEMORY[0x1E4F428B8] clearColor];
    [(CNModernAtomBackgroundView *)v19 setBackgroundColor:v20];

    [(CNModernAtomBackgroundView *)v19 setUserInteractionEnabled:0];
    [(CNModernAtomBackgroundView *)v19 setAutoresizingMask:18];
    [(CNModernAtomBackgroundView *)v19 setHostAtomView:v10];
    [(CNModernAtomBackgroundView *)v19 setSeparatorStyle:v7];
    [(UIView *)v10->_compositingView addSubview:v19];
    objc_storeStrong((id *)&v10->_background, v19);
    v21 = +[CNAtomView _newTextLabel];
    label = v10->_label;
    v10->_label = v21;

    [(UIView *)v10->_compositingView addSubview:v10->_label];
    v23 = [CNModernAtomIconView alloc];
    [(CNAtomView *)v10 bounds];
    uint64_t v24 = -[CNModernAtomIconView initWithFrame:](v23, "initWithFrame:");
    badgeIconView = v10->_badgeIconView;
    v10->_badgeIconView = (CNModernAtomIconView *)v24;

    [(CNModernAtomIconView *)v10->_badgeIconView setIconPadding:1.25];
    [(CNModernAtomIconView *)v10->_badgeIconView setAutoresizingMask:16];
    v26 = [MEMORY[0x1E4F428B8] clearColor];
    [(CNModernAtomIconView *)v10->_badgeIconView setBackgroundColor:v26];

    [(CNModernAtomIconView *)v10->_badgeIconView setContentMode:3];
    v27 = [CNModernAtomIconView alloc];
    [(CNAtomView *)v10 bounds];
    uint64_t v28 = -[CNModernAtomIconView initWithFrame:](v27, "initWithFrame:");
    accessoryIconView = v10->_accessoryIconView;
    v10->_accessoryIconView = (CNModernAtomIconView *)v28;

    [(CNModernAtomIconView *)v10->_accessoryIconView setIconPadding:2.5];
    [(CNModernAtomIconView *)v10->_accessoryIconView setAutoresizingMask:20];
    v30 = [MEMORY[0x1E4F428B8] clearColor];
    [(CNModernAtomIconView *)v10->_accessoryIconView setBackgroundColor:v30];

    [(CNModernAtomIconView *)v10->_accessoryIconView setContentMode:3];
    [(CNAtomView *)v10 _updateIconViewsSemanticContentAttribute];
    [(CNAtomView *)v10 _updateSubviewsForWrapping];
    if ((a4 & 0x204) != 0)
    {
      uint64_t v31 = [objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:4];
      activityIndicator = v10->_activityIndicator;
      v10->_activityIndicator = (UIActivityIndicatorView *)v31;
    }
    v10->_disabledPresentationOptions = 0;
    v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 addObserver:v10 selector:sel__invalidatePresentationOptions name:*MEMORY[0x1E4F43788] object:0];

    v34 = [MEMORY[0x1E4F428B8] quaternarySystemFillColor];
    [(CNAtomView *)v10 setBackgroundColor:v34];

    [(CNAtomView *)v10 _setContinuousCornerRadius:4.5];
    v35 = [(id)objc_opt_class() _defaultTintColor];
    [(CNAtomView *)v10 setTintColor:v35];
  }
  return v10;
}

- (NSString)description
{
  BOOL v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [(CNAtomView *)self frame];
  double v6 = NSStringFromCGRect(v11);
  uint64_t v7 = [(UILabel *)self->_label text];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %x frame = %@; text = '%@'>", v5, self, v6, v7];;

  return (NSString *)v8;
}

- (int)_preferredIconVariant
{
  v26[12] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F437C8];
  v26[0] = *MEMORY[0x1E4F437A8];
  v26[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F437B0];
  v26[2] = *MEMORY[0x1E4F437B8];
  v26[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F43798];
  v26[4] = *MEMORY[0x1E4F437A0];
  v26[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F43780];
  v26[6] = *MEMORY[0x1E4F43790];
  v26[7] = v6;
  uint64_t v7 = *MEMORY[0x1E4F43770];
  v26[8] = *MEMORY[0x1E4F43778];
  v26[9] = v7;
  uint64_t v8 = *MEMORY[0x1E4F43760];
  v26[10] = *MEMORY[0x1E4F43768];
  v26[11] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:12];
  uint64_t v10 = [MEMORY[0x1E4F42738] sharedApplication];
  CGRect v11 = [v10 preferredContentSizeCategory];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v22;
    while (2)
    {
      uint64_t v17 = 0;
      uint64_t v18 = v15 + v14;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v12);
        }
        if (objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v17), "isEqualToString:", v11, (void)v21))
        {
          uint64_t v18 = v15 + v17;
          goto LABEL_12;
        }
        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v15 = v18;
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
LABEL_12:

  [(CNAtomView *)self scale];
  if (v19 > 1.0)
  {
    if (v18 + 3 >= (unint64_t)[v12 count]) {
      LODWORD(v18) = 6;
    }
    else {
      LODWORD(v18) = v18 + 3;
    }
  }

  return v18;
}

- (void)_updateIconViewsSemanticContentAttribute
{
  if (self->_separatorIsLeftAligned) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 3;
  }
  [(CNModernAtomIconView *)self->_accessoryIconView setSemanticContentAttribute:v3];
  badgeIconView = self->_badgeIconView;

  [(CNModernAtomIconView *)badgeIconView setSemanticContentAttribute:v3];
}

- (void)_updateSubviewsForWrapping
{
  BOOL v3 = [(CNAtomView *)self isWrappingEnabled];
  [(UILabel *)self->_label setNumberOfLines:!v3];
  if (v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 2;
  }
  [(UILabel *)self->_label setLineBreakMode:v4];
  uint64_t v5 = [(CNAtomView *)self separatorStyle];
  uint64_t v6 = [(CNAtomView *)self backgroundView];
  [v6 setSeparatorStyle:2];

  uint64_t v7 = [(CNAtomView *)self backgroundView];
  [v7 setSeparatorStyle:v5];

  if (v3)
  {
    [(CNModernAtomIconView *)self->_badgeIconView removeFromSuperview];
    accessoryIconView = self->_accessoryIconView;
    [(CNModernAtomIconView *)accessoryIconView removeFromSuperview];
  }
  else
  {
    [(UIView *)self->_compositingView addSubview:self->_badgeIconView];
    [(UIView *)self->_compositingView addSubview:self->_accessoryIconView];
    [(CNModernAtomIconView *)self->_badgeIconView setNeedsDisplay];
    uint64_t v9 = self->_accessoryIconView;
    [(CNModernAtomIconView *)v9 setNeedsDisplay];
  }
}

- (id)_centeredTextAttachmentWithImage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(CNAtomCenteredTextAttachment);
  [v4 size];
  double v7 = v6;
  [v4 size];
  double v9 = v8;
  [v4 size];
  CGFloat v11 = v10 + 3.0;
  [v4 size];
  CGFloat v13 = v12;
  uint64_t v14 = [MEMORY[0x1E4F42D90] mainScreen];
  [v14 scale];
  CGFloat v16 = v15;
  v20.width = v11;
  v20.height = v13;
  UIGraphicsBeginImageContextWithOptions(v20, 0, v16);

  objc_msgSend(v4, "drawInRect:", 3.0, 0.0, v7, v9);
  uint64_t v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [(UIFont *)self->_titleFont capHeight];
  -[CNAtomCenteredTextAttachment setHeight:](v5, "setHeight:");
  [(CNAtomCenteredTextAttachment *)v5 setImage:v17];

  return v5;
}

- (id)_chevronTextAttachment
{
  BOOL v3 = objc_alloc_init(CNAtomCenteredTextAttachment);
  id v4 = (void *)MEMORY[0x1E4F42A98];
  uint64_t v5 = [(CNAtomView *)self titleFont];
  [v5 pointSize];
  double v6 = objc_msgSend(v4, "configurationWithPointSize:weight:scale:", 6, 1);

  double v7 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.forward" withConfiguration:v6];
  double v8 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
  double v9 = [v7 imageWithTintColor:v8 renderingMode:1];

  [v9 size];
  double v11 = v10;
  [v9 size];
  double v13 = v12;
  [v9 size];
  CGFloat v15 = v14 + 9.0;
  [v9 size];
  CGFloat v17 = v16;
  uint64_t v18 = [MEMORY[0x1E4F42D90] mainScreen];
  [v18 scale];
  CGFloat v20 = v19;
  v24.width = v15;
  v24.height = v17;
  UIGraphicsBeginImageContextWithOptions(v24, 0, v20);

  objc_msgSend(v9, "drawInRect:", 3.0, 0.0, v11, v13);
  long long v21 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [(UIFont *)self->_titleFont capHeight];
  -[CNAtomCenteredTextAttachment setHeight:](v3, "setHeight:");
  [(CNAtomCenteredTextAttachment *)v3 setImage:v21];

  return v3;
}

- (BOOL)isWrappingEnabled
{
  if (!self->_wrappingSupported) {
    return 0;
  }
  double v2 = [MEMORY[0x1E4F42738] sharedApplication];
  BOOL v3 = [v2 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (void)setIsPrimaryAddressAtom:(BOOL)a3
{
  if (self->_isPrimaryAddressAtom != a3)
  {
    self->_isPrimaryAddressAtom = a3;
    if (a3) {
      +[CNAtomView primaryAtomFont];
    }
    else {
    id v4 = +[CNAtomView defaultFont];
    }
    [(CNAtomView *)self setTitleFont:v4];
  }
}

- (CNModernAtomBackgroundView)backgroundView
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
    BOOL v3 = [(CNAtomView *)self tintColor];
  }

  return v3;
}

- (void)_setEffectiveTintColor:(id)a3
{
  double v8 = (UIColor *)a3;
  if (self->_effectiveTintColor != v8)
  {
    objc_storeStrong((id *)&self->_effectiveTintColor, a3);
    label = self->_label;
    double v6 = v8;
    [(UILabel *)label setTextColor:v6];
    double v7 = [(CNAtomView *)self backgroundView];
    [v7 setTintColor:v6];
  }
}

- (void)tintColorDidChange
{
  if (!self->_effectiveTintColor
    || ([(CNAtomView *)self effectiveTintColor],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [(CNAtomView *)self tintColor],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v3 isEqual:v4],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    double v6 = [(CNAtomView *)self tintColor];
    [(CNAtomView *)self _setEffectiveTintColor:v6];

    [(CNAtomView *)self _invalidatePresentationOptions];
  }
}

- (UIFont)titleFont
{
  titleFont = self->_titleFont;
  if (!titleFont)
  {
    id v4 = +[CNAtomView defaultFont];
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
    double v6 = [(UILabel *)self->_label attributedText];
    uint64_t v7 = [v6 length];

    double v8 = [(UILabel *)self->_label attributedText];
    double v9 = (void *)[v8 mutableCopy];

    uint64_t v10 = *MEMORY[0x1E4FB06F8];
    objc_msgSend(v9, "removeAttribute:range:", *MEMORY[0x1E4FB06F8], 0, v7);
    objc_msgSend(v9, "addAttribute:value:range:", v10, *p_titleFont, 0, v7);
    [(UILabel *)self->_label setAttributedText:v9];
    [(CNAtomView *)self _updateOverlayLabelText];
    [(CNAtomView *)self _invalidatePresentationOptions];
  }
}

- (void)setTitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  title = self->_title;
  self->_title = v4;

  [(CNAtomView *)self _updateLabelAttributes];
}

- (void)_updateLabelAttributes
{
  BOOL v3 = [(CNAtomView *)self title];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return;
  }
  char v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"⁠"];
  if ([(CNAtomView *)self isWrappingEnabled])
  {
    double v6 = [(CNAtomView *)self titleFont];
    uint64_t v7 = +[CNAtomView _defaultLabelAttributesWithFont:v6 wrappingEnabled:1];
    double v8 = (void *)[v7 mutableCopy];

    uint64_t v9 = [(CNAtomView *)self effectiveTintColor];
    uint64_t v10 = *MEMORY[0x1E4FB0700];
    [v8 setObject:v9 forKey:*MEMORY[0x1E4FB0700]];
    id v11 = [v8 objectForKey:*MEMORY[0x1E4FB0738]];
    [v11 setFirstLineHeadIndent:self->_firstLineIndent];
    double v12 = [MEMORY[0x1E4F28E78] stringWithString:self->_title];
    [v12 insertString:@"​" atIndex:0];
    id v40 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v12 attributes:v8];
    int v13 = [(CNAtomView *)self separatorStyle];
    v38 = v11;
    v39 = (void *)v9;
    objc_super v37 = v12;
    if (v13 == 1)
    {
      long long v23 = (void *)MEMORY[0x1E4F28E48];
      CGFloat v15 = [(CNAtomView *)self _chevronTextAttachment];
      double v14 = [v23 attributedStringWithAttachment:v15];
    }
    else
    {
      double v14 = 0;
      if (v13)
      {
LABEL_10:
        CGSize v24 = [(CNModernAtomIconView *)self->_accessoryIconView iconImages];
        v25 = [(CNModernAtomIconView *)self->_badgeIconView iconImages];
        if ([v25 count])
        {
          unint64_t v26 = 0;
          do
          {
            v27 = [v25 objectAtIndex:v26];
            uint64_t v28 = (void *)MEMORY[0x1E4F28B18];
            v29 = [(CNAtomView *)self _centeredTextAttachmentWithImage:v27];
            v30 = [v28 attributedStringWithAttachment:v29];

            [v40 insertAttributedString:v5 atIndex:1];
            [v40 insertAttributedString:v30 atIndex:1];

            ++v26;
          }
          while ([v25 count] > v26);
        }
        if ([v24 count])
        {
          unint64_t v31 = 0;
          do
          {
            v32 = [v24 objectAtIndex:v31];
            v33 = (void *)MEMORY[0x1E4F28B18];
            v34 = [(CNAtomView *)self _centeredTextAttachmentWithImage:v32];
            v35 = [v33 attributedStringWithAttachment:v34];

            objc_msgSend(v40, "insertAttributedString:atIndex:", v5, objc_msgSend(v40, "length"));
            objc_msgSend(v40, "insertAttributedString:atIndex:", v35, objc_msgSend(v40, "length"));

            ++v31;
          }
          while ([v24 count] > v31);
        }
        if (v14 && !self->_separatorHidden)
        {
          objc_msgSend(v40, "insertAttributedString:atIndex:", v5, objc_msgSend(v40, "length"));
          objc_msgSend(v40, "insertAttributedString:atIndex:", v14, objc_msgSend(v40, "length"));
        }

        long long v22 = v39;
        goto LABEL_20;
      }
      CGFloat v15 = [MEMORY[0x1E4F1CA60] dictionary];
      double v16 = [(CNAtomView *)self titleFont];
      [v15 setObject:v16 forKey:*MEMORY[0x1E4FB06F8]];

      CGFloat v17 = [MEMORY[0x1E4F428B8] colorWithWhite:0.5 alpha:1.0];
      [v15 setObject:v17 forKey:v10];

      id v18 = objc_alloc(MEMORY[0x1E4F28E48]);
      double v19 = CNAUILocalizedAddressSeparator();
      double v14 = (void *)[v18 initWithString:v19 attributes:v15];
    }
    goto LABEL_10;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F28E48]);
  title = self->_title;
  double v8 = [(CNAtomView *)self titleFont];
  long long v22 = +[CNAtomView _defaultLabelAttributesWithFont:v8 wrappingEnabled:0];
  id v40 = (id)[v20 initWithString:title attributes:v22];
LABEL_20:

  [(UILabel *)self->_label setAttributedText:v40];
  v36 = [(CNAtomView *)self effectiveTintColor];
  [(UILabel *)self->_label setTextColor:v36];
  [(CNAtomView *)self _updateOverlayLabelText];
  [(UILabel *)self->_label sizeToFit];
  [(CNAtomView *)self sizeToFit];
  [(CNAtomView *)self setNeedsLayout];
}

- (void)_invalidatePresentationOptions
{
  [(CNAtomView *)self invalidateIntrinsicContentSize];
  if ([(CNAtomView *)self tintAdjustmentMode] == 2)
  {
    BOOL v3 = 0;
    goto LABEL_18;
  }
  if (([(CNAtomView *)self presentationOptions] & 0x2000) != 0)
  {
    uint64_t v4 = +[CNAtomView _downtimeBlockedTintColor];
  }
  else if ([(CNAtomView *)self presentationOptions])
  {
    uint64_t v4 = +[CNAtomView _failureTintColor];
  }
  else if (([(CNAtomView *)self presentationOptions] & 0x10000) != 0)
  {
    uint64_t v4 = +[CNAtomView _faceTimeUnresolvedColor];
  }
  else if (([(CNAtomView *)self presentationOptions] & 2) != 0)
  {
    uint64_t v4 = +[CNAtomView _SMSTintColor];
  }
  else if (([(CNAtomView *)self presentationOptions] & 0x8000) != 0)
  {
    uint64_t v4 = +[CNAtomView _faceTimeTintColor];
  }
  else
  {
    if (([(CNAtomView *)self presentationOptions] & 0x20000) == 0)
    {
LABEL_16:
      BOOL v3 = [(CNAtomView *)self tintColor];
      goto LABEL_17;
    }
    uint64_t v4 = +[CNAtomView _invalidAddressTintColor];
  }
  BOOL v3 = (void *)v4;
  if (!v4) {
    goto LABEL_16;
  }
LABEL_17:
  [(CNAtomView *)self _setEffectiveTintColor:v3];
LABEL_18:
  unint64_t v5 = [(CNAtomView *)self presentationOptions];
  uint64_t v6 = [(CNAtomView *)self _preferredIconVariant];
  id v11 = v3;
  BOOL v7 = [(CNAtomView *)self isPrimaryAddressAtom];
  double v8 = +[CNAtomView _badgeImagesForPresentationOptions:v5 iconOrder:&_badgeStyleOrder orderingLength:6 tintColor:v11 large:v7 variant:v6];
  [(CNModernAtomIconView *)self->_badgeIconView setIconImages:v8];
  uint64_t v9 = +[CNAtomView _badgeImagesForPresentationOptions:v5 iconOrder:&_accessoryStyleOrder orderingLength:5 tintColor:v11 large:v7 variant:v6];
  [(CNModernAtomIconView *)self->_accessoryIconView setIconImages:v9];
  [(CNAtomView *)self _updateActivityIndicator];
  [(CNAtomView *)self setNeedsLayout];
  BOOL cachedIsWrappingEnabled = self->_cachedIsWrappingEnabled;
  if (cachedIsWrappingEnabled == [(CNAtomView *)self isWrappingEnabled])
  {
    [(CNModernAtomIconView *)self->_badgeIconView setNeedsDisplay];
    [(CNModernAtomIconView *)self->_accessoryIconView setNeedsDisplay];
  }
  else
  {
    self->_BOOL cachedIsWrappingEnabled = [(CNAtomView *)self isWrappingEnabled];
    [(CNAtomView *)self _updateSubviewsForWrapping];
    [(CNAtomView *)self _updateLabelAttributes];
  }
  [(CNModernAtomBackgroundView *)self->_background invalidateIntrinsicContentSize];
  [(CNModernAtomBackgroundView *)self->_background setNeedsLayout];
}

- (void)setPresentationOptions:(unint64_t)a3
{
  if (self->_presentationOptions != a3)
  {
    self->_presentationOptions = a3;
    [(CNAtomView *)self _invalidatePresentationOptions];
  }
}

- (void)appendPresentationOption:(unint64_t)a3
{
  self->_presentationOptions |= a3;
  [(CNAtomView *)self _invalidatePresentationOptions];
}

- (void)clearPresentationOption:(unint64_t)a3
{
  self->_presentationOptions &= ~a3;
  [(CNAtomView *)self _invalidatePresentationOptions];
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
  [(CNAtomView *)self _invalidatePresentationOptions];
}

- (unint64_t)effectivePresentationOptions
{
  return [(CNAtomView *)self presentationOptions] & ~self->_disabledPresentationOptions;
}

- (void)setSeparatorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_separatorHidden = a3;
  if ([(CNAtomView *)self isWrappingEnabled])
  {
    [(CNAtomView *)self _updateLabelAttributes];
  }
  else
  {
    unint64_t v5 = [(CNAtomView *)self backgroundView];
    uint64_t v6 = [v5 separatorView];
    [v6 setHidden:v3];
  }

  [(CNAtomView *)self invalidateIntrinsicContentSize];
}

- (BOOL)separatorHidden
{
  if (self->_separatorHidden) {
    return 1;
  }
  BOOL v3 = [(CNAtomView *)self backgroundView];
  BOOL v2 = [v3 separatorStyle] == 2;

  return v2;
}

- (void)setSeparatorStyle:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_separatorStyle = a3;
  unint64_t v5 = [(CNAtomView *)self backgroundView];
  [v5 setSeparatorStyle:v3];

  if ([(CNAtomView *)self isWrappingEnabled])
  {
    [(CNAtomView *)self _updateLabelAttributes];
  }
  else
  {
    [(CNAtomView *)self sizeToFit];
  }
}

- (int)separatorStyle
{
  BOOL v2 = [(CNAtomView *)self backgroundView];
  int v3 = [v2 separatorStyle];

  return v3;
}

- (void)setSeparatorIsLeftAligned:(BOOL)a3
{
  if (self->_separatorIsLeftAligned != a3)
  {
    self->_separatorIsLeftAligned = a3;
    [(CNAtomView *)self _updateIconViewsSemanticContentAttribute];
    unint64_t v4 = [(CNAtomView *)self backgroundView];
    [v4 layoutSubviews];

    [(CNAtomView *)self layoutSubviews];
  }
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
}

- (BOOL)appearsSelected
{
  if (![(CNAtomView *)self isSelected]) {
    return 0;
  }
  int v3 = [(CNAtomView *)self traitCollection];
  BOOL v4 = [v3 activeAppearance] == 1;

  return v4;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 style:(unint64_t)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v9 = [(CNAtomView *)self traitCollection];
  uint64_t v10 = [v9 activeAppearance];

  id v11 = [(CNAtomView *)self backgroundView];
  [v11 setSelected:v7 animated:v6 style:a5 updateVisualSelection:v10 == 1];

  if (self->_selected != v7)
  {
    self->_selected = v7;
    if (v10 == 1)
    {
      [(CNAtomView *)self displaySelectionChangeWithAnimation:v6];
    }
  }
}

- (void)displaySelectionChangeWithAnimation:(BOOL)a3
{
  [(CNAtomView *)self _updateActivityIndicator];
  BOOL v5 = [(CNAtomView *)self appearsSelected];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__CNAtomView_displaySelectionChangeWithAnimation___block_invoke;
  v9[3] = &unk_1E6128D08;
  v9[4] = self;
  BOOL v10 = v5;
  uint64_t v6 = MEMORY[0x1BA9A6470](v9);
  BOOL v7 = (void *)v6;
  if (!a3)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    goto LABEL_5;
  }
  [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:0.15];
  if (v5)
  {
LABEL_5:
    [(CNAtomView *)self _updateCompositingFilters];
    goto LABEL_6;
  }
  UIAnimationDragCoefficient();
  [(CNAtomView *)self performSelector:sel__updateCompositingFilters withObject:0 afterDelay:v8 * 0.15];
LABEL_6:
}

void __50__CNAtomView_displaySelectionChangeWithAnimation___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) presentationOptions] & 0x20000) != 0)
  {
    BOOL v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
    [v2 updateDisplayForInvalidAddressForSelectedState:v3];
  }
  else
  {
    if (*(unsigned char *)(a1 + 40)) {
      [MEMORY[0x1E4F428B8] whiteColor];
    }
    else {
    id v4 = [MEMORY[0x1E4F428B8] clearColor];
    }
    [*(id *)(*(void *)(a1 + 32) + 472) setBackgroundColor:v4];
  }
}

- (void)updateDisplayForInvalidAddressForSelectedState:(BOOL)a3
{
  if (a3)
  {
    id v8 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    id v4 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(CNAtomView *)self _setEffectiveTintColor:v8];
    BOOL v5 = [(CNAtomView *)self backgroundView];
    [v5 setTintColor:v4];

    LOBYTE(v7) = 1;
    uint64_t v6 = +[CNAtomView _badgeImagesForPresentationOptions:self->_presentationOptions iconOrder:&_badgeStyleOrder orderingLength:6 tintColor:v8 large:[(CNAtomView *)self isPrimaryAddressAtom] variant:[(CNAtomView *)self _preferredIconVariant] selected:v7];
    [(CNModernAtomIconView *)self->_badgeIconView setIconImages:v6];
  }
  else
  {
    [(CNAtomView *)self _invalidatePresentationOptions];
  }
}

- (BOOL)hidesVIPIndicator
{
  return (LOBYTE(self->_disabledPresentationOptions) >> 4) & 1;
}

- (void)setHidesVIPIndicator:(BOOL)a3
{
}

+ (id)_newTextLabel
{
  id v2 = objc_alloc(MEMORY[0x1E4F42B38]);
  uint64_t v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setAutoresizingMask:16];
  [v3 setOpaque:0];
  id v4 = [MEMORY[0x1E4F428B8] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setAdjustsFontForContentSizeCategory:1];
  [v3 setUserInteractionEnabled:0];
  [v3 _setWantsUnderlineForAccessibilityButtonShapesEnabled:1];
  [v3 _setOverallWritingDirectionFollowsLayoutDirection:1];
  return v3;
}

- (void)_updateOverlayLabelText
{
  if (self->_overlayLabelForNonColoredGlyphs)
  {
    uint64_t v3 = [(UILabel *)self->_label text];
    CNSubstringRangesContainingEmojiInString();
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    [(CNAtomView *)self setupOverlayLabelTextForEmojiRanges:v4];
  }
}

- (void)setupOverlayLabelTextForEmojiRanges:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v6 = [(UILabel *)self->_label attributedText];
  uint64_t v7 = (void *)[v5 initWithAttributedString:v6];

  uint64_t v8 = [v7 length];
  objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], self->_titleFont, 0, v8);
  uint64_t v9 = *MEMORY[0x1E4FB0700];
  BOOL v10 = [MEMORY[0x1E4F428B8] clearColor];
  objc_msgSend(v7, "addAttribute:value:range:", v9, v10, 0, v8);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
        CGFloat v17 = objc_msgSend(MEMORY[0x1E4F428B8], "labelColor", (void)v20);
        uint64_t v18 = [v16 rangeValue];
        objc_msgSend(v7, "addAttribute:value:range:", v9, v17, v18, v19);

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  [(UILabel *)self->_overlayLabelForNonColoredGlyphs setAttributedText:v7];
}

- (void)_setupOverlayLabelForNonColoredGlyphs
{
  if (!self->_overlayLabelForNonColoredGlyphs)
  {
    uint64_t v3 = [(UILabel *)self->_label text];
    CNSubstringRangesContainingEmojiInString();
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if ([v6 count])
    {
      id v4 = +[CNAtomView _newTextLabel];
      overlayLabelForNonColoredGlyphs = self->_overlayLabelForNonColoredGlyphs;
      self->_overlayLabelForNonColoredGlyphs = v4;

      [(CNAtomView *)self setupOverlayLabelTextForEmojiRanges:v6];
      [(CNAtomView *)self addSubview:self->_overlayLabelForNonColoredGlyphs];
    }
  }
}

- (void)_updateCompositingFilters
{
  v10[4] = *MEMORY[0x1E4F143B8];
  [(CNAtomView *)self _setupOverlayLabelForNonColoredGlyphs];
  unint64_t v3 = [(CNAtomView *)self presentationOptions] & 0x20000;
  if (self->_selected && v3 == 0)
  {
    id v5 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A370]];
  }
  else
  {
    id v5 = 0;
  }
  v10[0] = self->_badgeIconView;
  v10[1] = self->_accessoryIconView;
  v10[2] = self->_label;
  id v6 = [(CNAtomView *)self backgroundView];
  v10[3] = [v6 separatorView];

  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v8 = [(id)v10[i] layer];
    [v8 setCompositingFilter:v5];
  }
  for (uint64_t j = 3; j != -1; --j)
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNAtomView;
  [(CNAtomView *)&v9 traitCollectionDidChange:v4];
  [(CNAtomView *)self _updateActivityIndicator];
  if ([(CNAtomView *)self isSelected])
  {
    id v5 = [(CNAtomView *)self traitCollection];
    uint64_t v6 = [v5 activeAppearance];
    uint64_t v7 = [v4 activeAppearance];

    if (v6 != v7)
    {
      uint64_t v8 = [(CNAtomView *)self backgroundView];
      [v8 displaySelectionChangeWithAnimation:0];

      [(CNAtomView *)self displaySelectionChangeWithAnimation:0];
    }
  }
}

- (void)_updateActivityIndicator
{
  unint64_t v3 = [(CNAtomView *)self presentationOptions] & 0x204;
  if ([(CNAtomView *)self isSelected])
  {
    uint64_t v4 = 3;
  }
  else
  {
    id v5 = [(CNAtomView *)self traitCollection];
    if ([v5 userInterfaceStyle] == 2) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 4;
    }
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
      uint64_t v7 = self->_activityIndicator;
      self->_activityIndicator = 0;
    }
    uint64_t v8 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:v4];
    objc_super v9 = self->_activityIndicator;
    self->_activityIndicator = v8;

    [(CNAtomView *)self addSubview:self->_activityIndicator];
    [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
    [(CNAtomView *)self setNeedsLayout];
    [(CNAtomView *)self invalidateIntrinsicContentSize];
  }
  else if (activityIndicator)
  {
    [(UIActivityIndicatorView *)activityIndicator removeFromSuperview];
    BOOL v10 = self->_activityIndicator;
    self->_activityIndicator = 0;
  }
}

- (void)_updateFontIfNecessary
{
  if ([(CNAtomView *)self isPrimaryAddressAtom])
  {
    uint64_t v3 = [(id)objc_opt_class() primaryAtomFont];
  }
  else
  {
    titleFont = self->_titleFont;
    if (titleFont)
    {
      id v5 = [(id)objc_opt_class() primaryAtomFont];
      int v6 = [(UIFont *)titleFont isEqual:v5];

      if (!v6) {
        return;
      }
    }
    uint64_t v3 = [(id)objc_opt_class() defaultFont];
  }
  id v7 = (id)v3;
  [(CNAtomView *)self setTitleFont:v3];
}

- (double)preferredWidth
{
  -[CNAtomView preferredWidthWithSizeConstraints:](self, "preferredWidthWithSizeConstraints:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(CNAtomView *)self isWrappingEnabled])
  {
    [(CNAtomView *)self _leftPadding];
    double v7 = v6;
    [(CNAtomView *)self _rightPadding];
    label = self->_label;
    double v10 = fmax(width - (v7 + v8), 0.0);
    -[UILabel sizeThatFits:](label, "sizeThatFits:", v10, 1.79769313e308);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CNAtomView;
    -[CNAtomView sizeThatFits:](&v13, sel_sizeThatFits_, width, height);
  }
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (double)preferredWidthWithSizeConstraints:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CNAtomView *)self _leftPadding];
  double v7 = v6;
  [(CNAtomView *)self _rightPadding];
  double v9 = fmax(width - (v7 + v8), 0.0);
  double v10 = [(UILabel *)self->_label attributedText];
  objc_msgSend(v10, "boundingRectWithSize:options:context:", 1, 0, v9, height);
  double v12 = ceil(v11);

  [(CNAtomView *)self _leftPadding];
  double v14 = v13 + v12;
  [(CNAtomView *)self _rightPadding];
  double result = fmax(v15 + v14, 25.0);
  if (width < result && width > 0.0) {
    return width;
  }
  return result;
}

- (void)layoutSubviews
{
  [(CNAtomView *)self _updateFontIfNecessary];
  [(CNAtomView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_compositingView, "setFrame:");
  double rect = v8;
  -[CNAtomView preferredWidthWithSizeConstraints:](self, "preferredWidthWithSizeConstraints:", v8, v10);
  double v12 = v11;
  [(UILabel *)self->_label bounds];
  double v14 = v13;
  double v15 = [(UILabel *)self->_label font];
  [v15 lineHeight];
  double v17 = round(v14 / v16);

  if ([(CNAtomView *)self isWrappingEnabled])
  {
    uint64_t v18 = [(CNAtomView *)self titleLabel];
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
    if (![(CNAtomView *)self separatorHidden]
      && ![(CNAtomView *)self separatorStyle])
    {
      long long v22 = [(CNAtomView *)self backgroundView];
      [v22 separatorWidth];
      double v12 = v12 - v23;
    }
  }
  -[CNModernAtomBackgroundView setFrame:](self->_background, "setFrame:", v21, 0.0, v12, v10);
  if ([(CNAtomView *)self isWrappingEnabled])
  {
    label = self->_label;
    [(CNAtomView *)self bounds];
    -[UILabel sizeThatFits:](label, "sizeThatFits:", v25, v26);
    double v28 = v27;
    double v30 = v29;
  }
  else
  {
    [(CNAtomView *)self _leftPadding];
    [(CNAtomView *)self _rightPadding];
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v30 = v31;
    UIRoundToViewScale();
    double v28 = v32;
  }
  [(CNAtomView *)self _leftPadding];
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
    [(CNAtomView *)self _leftPadding];
    double v34 = v38 - v39;
  }
  double v40 = round(v10 * 0.5 - v30 * 0.5);
  -[UILabel setFrame:](self->_label, "setFrame:", v34, v40, v28, v30);
  if (self->_overlayLabelForNonColoredGlyphs)
  {
    [(UILabel *)self->_label frame];
    -[UILabel setFrame:](self->_overlayLabelForNonColoredGlyphs, "setFrame:");
  }
  if ([(CNAtomView *)self isWrappingEnabled] && v17 == 1.0)
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
  [(CNModernAtomIconView *)self->_badgeIconView preferredWidth];
  double v47 = v46;
  [(CNModernAtomIconView *)self->_accessoryIconView preferredWidth];
  double v49 = v48;
  [(CNAtomView *)self _leftInset];
  if (separatorIsLeftAligned)
  {
    double v51 = rect - v47 - v50;
    v73.origin.x = v34;
    v73.origin.y = v40;
    v73.size.double width = v28;
    v73.size.double height = v30;
    double v52 = CGRectGetMinX(v73) + -2.5 - v49;
  }
  else
  {
    double v51 = v50 + self->_firstLineIndent;
    v74.origin.x = v34;
    v74.origin.y = v40;
    v74.size.double width = v28;
    v74.size.double height = v30;
    double v52 = CGRectGetMaxX(v74) + 2.5;
  }
  -[CNModernAtomIconView setFrame:](self->_badgeIconView, "setFrame:", v51, 0.0, v47, v10);
  -[CNModernAtomIconView setFrame:](self->_accessoryIconView, "setFrame:", v52, 0.0, v49, v10);
  [(CNAtomView *)self baselinePoint];
  double v54 = v53;
  [(CNModernAtomIconView *)self->_accessoryIconView setDrawingOffset:0.0];
  -[CNModernAtomIconView setDrawingOffset:](self->_badgeIconView, "setDrawingOffset:", 0.0, v54);
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
    BOOL v63 = [(CNAtomView *)self separatorHidden]
       || [(CNAtomView *)self separatorStyle] != 0;
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
        goto LABEL_44;
      }
      v65 = [(CNAtomView *)self backgroundView];
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
        goto LABEL_44;
      }
      v65 = [(CNAtomView *)self backgroundView];
      [v65 separatorWidth];
      double v64 = v64 - v68;
    }

LABEL_44:
    -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v64, v61, v57, v59);
  }
  v70.receiver = self;
  v70.super_class = (Class)CNAtomView;
  [(CNAtomView *)&v70 layoutSubviews];
}

- (CGRect)selectionFrame
{
  double v3 = [(CNModernAtomBackgroundView *)self->_background selectedView];
  [v3 frame];
  -[CNAtomView convertRect:fromView:](self, "convertRect:fromView:", self->_background);
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
  [(CNAtomView *)self _leftInset];
  double v4 = v3;
  [(CNAtomView *)self _rightInset];
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
  if (![(CNAtomView *)self separatorHidden])
  {
    double v4 = [(CNAtomView *)self backgroundView];
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
  BOOL v3 = [(CNAtomView *)self separatorHidden];
  if ([(CNAtomView *)self isWrappingEnabled])
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(CNModernAtomIconView *)self->_accessoryIconView iconImages];
    BOOL v4 = [v5 count] == 0;
  }
  double v6 = 4.0;
  if (!v3 || !v4)
  {
    double v6 = 2.0;
    if (!v3)
    {
      double v7 = [(CNAtomView *)self backgroundView];
      [v7 separatorWidth];
      double v9 = v8 + 2.0;

      double v6 = v9 + 2.0;
    }
    if (!v4)
    {
      [(CNModernAtomIconView *)self->_accessoryIconView preferredWidth];
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
  if (![(CNAtomView *)self isWrappingEnabled])
  {
    [(CNModernAtomIconView *)self->_badgeIconView preferredWidth];
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
    double v5 = [(CNAtomView *)self backgroundView];
    [v5 setScalingFactor:a3];

    double v6 = [(CNAtomView *)self titleFont];
    CGRect v7 = v6;
    if (a3 != 1.0)
    {
      id v9 = v6;
      uint64_t v8 = [v6 _fontScaledByScaleFactor:self->_scalingFactor];

      CGRect v7 = (void *)v8;
    }
    id v10 = v7;
    [(CNAtomView *)self setTitleFont:v7];
    [(CNAtomView *)self setNeedsLayout];
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
  [(CNAtomView *)self preferredWidth];
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
  double v6 = (objc_class *)MEMORY[0x1E4F42B38];
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v10 = [(UILabel *)self->_label attributedText];
  [v9 setAttributedText:v10];

  [(UILabel *)self->_label frame];
  objc_msgSend(v9, "setFrame:");
  [v9 setTextColor:v7];

  [(CNAtomView *)self addSubview:v9];
  [(CNModernAtomBackgroundView *)self->_background setAlpha:0.0];
  [(UILabel *)self->_label setAlpha:0.0];
  double v11 = (void *)MEMORY[0x1E4F42FF0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__CNAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke;
  v15[3] = &unk_1E61283C0;
  v15[4] = self;
  id v16 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__CNAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke_2;
  void v13[3] = &unk_1E6128338;
  id v14 = v16;
  id v12 = v16;
  [v11 animateWithDuration:v15 animations:v13 completion:a4];
}

uint64_t __64__CNAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 480) setAlpha:1.0];
  id v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

uint64_t __64__CNAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) removeFromSuperview];
  }
  return result;
}

- (id)menuConfigurationForChevronButton
{
  return 0;
}

- (NSString)title
{
  return self->_title;
}

- (UILabel)titleLabel
{
  return self->_label;
}

- (CNModernAtomIconView)accessoryIconView
{
  return self->_accessoryIconView;
}

- (CNModernAtomIconView)badgeIconView
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

- (UIImageView)downwardChevronImageView
{
  return self->_downwardChevronImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downwardChevronImageView, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_overlayLabelForNonColoredGlyphs, 0);
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