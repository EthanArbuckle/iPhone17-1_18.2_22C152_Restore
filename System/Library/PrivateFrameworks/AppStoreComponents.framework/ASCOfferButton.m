@interface ASCOfferButton
+ (BOOL)adjustsTitleFontSizeToFitWidthForSize:(id)a3;
+ (id)indeterminateProgressImageFittingSize:(void *)a3 forTheme:;
+ (id)mediumTitleFontForText:(id)a3 compatibleWithTraitCollection:(id)a4;
+ (id)progressImageWithPercent:(double)a1 fittingSize:(uint64_t)a2 forTheme:(void *)a3 cancellable:(void *)a4;
+ (id)progressStateImageFittingSize:(id)a3 forTheme:(id)a4 startPercent:(double)a5 endPercent:(double)a6 useFullImageSize:(BOOL)a7;
+ (id)progressTransitionImageFittingSize:(void *)a3 forTheme:;
+ (id)smallTitleFontForText:(id)a3 compatibleWithTraitCollection:(id)a4;
+ (id)subtitleFontFittingSize:forTheme:compatibleWithTraitCollection:;
+ (id)textBackgroundImageFittingSize:(void *)a3 forTheme:;
+ (id)titleFontForText:(void *)a3 fittingSize:(void *)a4 representingMetadata:(void *)a5 compatibleWithTraitCollection:;
+ (id)viewInAppStoreTitleFontForText:(id)a3 compatibleWithTraitCollection:(id)a4;
- (ASCModalViewInteraction)modalInteraction;
- (ASCOfferButton)initWithCoder:(id)a3;
- (ASCOfferButton)initWithFrame:(CGRect)a3;
- (ASCOfferButtonBackgroundImageView)imageView;
- (ASCOfferButtonDelegate)delegate;
- (ASCOfferMetadata)metadata;
- (ASCOfferTheme)theme;
- (BOOL)accessibilityActivate;
- (BOOL)canBecomeFocused;
- (BOOL)canTransitionToMetadata:(id)a3;
- (BOOL)chainTransitionToMetadata:(id)a3 scalingDurationBy:(double)a4 withCompletion:(id)a5;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)isFixedHeight;
- (BOOL)shouldExpandBackground;
- (BOOL)shouldTopAlign;
- (BOOL)shouldTransitionImageViewFromMetadata:(id)a3 toMetadata:(id)a4;
- (CAAnimation)imageAnimation;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)size;
- (UIEdgeInsets)alignmentRectInsets;
- (UILabel)subtitleLabel;
- (UILabel)subtitleLabelIfLoaded;
- (UILabel)titleLabel;
- (UILabel)titleLabelIfLoaded;
- (UIViewPropertyAnimator)currentTransition;
- (double)topPadding;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)description;
- (id)focusEffect;
- (id)makeLayout;
- (id)transitionColorForMetadata:(id)a3;
- (id)transitionImageForMetadata:(id)a3;
- (int64_t)subtitlePosition;
- (unint64_t)accessibilityTraits;
- (void)beginModalStateWithCancelBlock:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)endModalState;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)onTraitCollectionChange;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setCurrentTransition:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFixedHeight:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageAnimation:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setModalInteraction:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setShouldExpandBackground:(BOOL)a3;
- (void)setShouldTopAlign:(BOOL)a3;
- (void)setSize:(id)a3;
- (void)setSubtitleLabelIfLoaded:(id)a3;
- (void)setSubtitlePosition:(int64_t)a3;
- (void)setTheme:(id)a3;
- (void)setTitleLabelIfLoaded:(id)a3;
- (void)setTopPadding:(double)a3;
- (void)transitionToMetadata:(id)a3 scalingDurationBy:(double)a4 withCompletion:(id)a5;
- (void)transitionToMetadata:(id)a3 withCompletion:(id)a4;
- (void)updateImageStyleProperties;
- (void)updateLabelStyleProperties;
- (void)updateVisualEffects;
@end

@implementation ASCOfferButton

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)ASCOfferButton;
  unint64_t v3 = *MEMORY[0x1E4FB2540] | [(ASCOfferButton *)&v7 accessibilityTraits] | *MEMORY[0x1E4FB25C0];
  int v4 = [(ASCOfferButton *)self isEnabled];
  uint64_t v5 = *MEMORY[0x1E4FB2578];
  if (v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

- (id)accessibilityLabel
{
  unint64_t v3 = [(ASCOfferButton *)self metadata];
  if ([v3 isEmpty]) {
    goto LABEL_2;
  }
  if (![v3 isIcon])
  {
    if ([v3 isProgress])
    {
      v11 = @"AX_OFFER_BUTTON_LABEL_LOADING";
    }
    else
    {
      if ([v3 isText])
      {
        id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
        v12 = [(ASCOfferButton *)self titleLabelIfLoaded];

        if (v12)
        {
          v13 = [(ASCOfferButton *)self titleLabelIfLoaded];
          [v5 addObject:v13];
        }
        v14 = [(ASCOfferButton *)self subtitleLabelIfLoaded];

        if (v14)
        {
          v15 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
          [v5 addObject:v15];
        }
        uint64_t v9 = ASCAXLabelForElements(v5);
        goto LABEL_16;
      }
      if ([v3 isPlaceholder])
      {
LABEL_2:
        int v4 = 0;
        goto LABEL_18;
      }
      if ([v3 isDeeplink])
      {
        v11 = @"AX_OFFER_BUTTON_LABEL_DEEPLINK";
      }
      else
      {
        if (![v3 isViewInAppStore]) {
          ASCUnknownEnumCase(@"ASCOfferMetadata", v3);
        }
        v11 = @"AX_OFFER_BUTTON_LABEL_VIEW_IN_APP_STORE";
      }
    }
    int v4 = ASCLocalizedString(v11, v10);
    goto LABEL_18;
  }
  id v5 = v3;
  v6 = +[ASCOfferMetadata redownloadMetadata];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    uint64_t v9 = ASCLocalizedString(@"AX_OFFER_BUTTON_LABEL_REDOWNLOAD", v8);
LABEL_16:
    int v4 = (void *)v9;
    goto LABEL_17;
  }
  int v4 = 0;
LABEL_17:

LABEL_18:

  return v4;
}

- (id)accessibilityHint
{
  v2 = [(ASCOfferButton *)self metadata];
  if ([v2 isProgress])
  {
    unint64_t v3 = ASCLocalizedPlatformString(@"AX_OFFER_BUTTON_HINT_CANCEL");
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(ASCOfferButton *)self metadata];
  if ([v2 isProgress])
  {
    id v3 = v2;
    if ([v3 isIndeterminate])
    {
      int v4 = 0;
    }
    else
    {
      [v3 percent];
      *(float *)&double v5 = v5;
      int v4 = ASCAXFormatFloatWithPercentage(0, *(float *)&v5);
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)accessibilityActivate
{
  int v3 = [(ASCOfferButton *)self isEnabled];
  if (v3) {
    [(ASCOfferButton *)self sendActionsForControlEvents:64];
  }
  return v3;
}

- (id)accessibilityIdentifier
{
  return (id)ASCAXIdentifierWithSuffix(@"offerButton");
}

- (void)setSize:(id)a3
{
  int v7 = (NSString *)a3;
  double v5 = self->_size;
  if (!v7 || !v5)
  {

    if (v5 == v7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  char v6 = [(NSString *)v5 isEqual:v7];

  if ((v6 & 1) == 0)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_size, a3);
    [(ASCOfferButton *)self updateImageStyleProperties];
    [(ASCOfferButton *)self updateLabelStyleProperties];
    [(ASCOfferButton *)self invalidateIntrinsicContentSize];
    [(ASCOfferButton *)self setNeedsLayout];
  }
LABEL_7:
}

+ (id)smallTitleFontForText:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [a3 length];
  double v7 = 0.0;
  if (v6 > 7) {
    double v7 = -4.0;
  }
  if (v6 <= 0xC) {
    double v8 = v7;
  }
  else {
    double v8 = -6.0;
  }
  double v9 = ASCFontPointSizesResolve(v5, v8 + 13.0, v8 + 15.0, v8 + 18.0, v8 + 18.0);

  if (!smallTitleFontForText_compatibleWithTraitCollection__titleFont
    || ([(id)smallTitleFontForText_compatibleWithTraitCollection__titleFont pointSize], v10 != v9))
  {
    uint64_t v11 = [MEMORY[0x1E4FB1798] systemFontOfSize:v9 weight:*MEMORY[0x1E4FB29A8]];
    v12 = (void *)smallTitleFontForText_compatibleWithTraitCollection__titleFont;
    smallTitleFontForText_compatibleWithTraitCollection__titleFont = v11;
  }
  v13 = (void *)smallTitleFontForText_compatibleWithTraitCollection__titleFont;

  return v13;
}

+ (id)mediumTitleFontForText:(id)a3 compatibleWithTraitCollection:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1798], "asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:", *MEMORY[0x1E4FB2908], *MEMORY[0x1E4FB29D0], a4);
}

+ (id)viewInAppStoreTitleFontForText:(id)a3 compatibleWithTraitCollection:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1798], "asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:", *MEMORY[0x1E4FB28F0], 0x8000, a4);
}

+ (id)titleFontForText:(void *)a3 fittingSize:(void *)a4 representingMetadata:(void *)a5 compatibleWithTraitCollection:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  if ([v10 isViewInAppStore])
  {
    uint64_t v13 = [v12 viewInAppStoreTitleFontForText:v8 compatibleWithTraitCollection:v11];
  }
  else if ([v9 isEqualToString:0x1F1E04438])
  {
    uint64_t v13 = [v12 mediumTitleFontForText:v8 compatibleWithTraitCollection:v11];
  }
  else
  {
    if (![v9 isEqualToString:0x1F1E04498]) {
      ASCUnknownEnumCase(@"ASCOfferButtonSize", v9);
    }
    uint64_t v13 = [v12 smallTitleFontForText:v8 compatibleWithTraitCollection:v11];
  }
  v14 = (void *)v13;

  return v14;
}

+ (id)subtitleFontFittingSize:forTheme:compatibleWithTraitCollection:
{
  self;
  if (subtitleFontFittingSize_forTheme_compatibleWithTraitCollection__onceToken != -1) {
    dispatch_once(&subtitleFontFittingSize_forTheme_compatibleWithTraitCollection__onceToken, &__block_literal_global_19);
  }
  v0 = (void *)subtitleFontFittingSize_forTheme_compatibleWithTraitCollection__subtitleFont;

  return v0;
}

uint64_t __81__ASCOfferButton_subtitleFontFittingSize_forTheme_compatibleWithTraitCollection___block_invoke()
{
  subtitleFontFittingSize_forTheme_compatibleWithTraitCollection__subtitleFont = [MEMORY[0x1E4FB1798] systemFontOfSize:8.0 weight:*MEMORY[0x1E4FB29C8]];

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)adjustsTitleFontSizeToFitWidthForSize:(id)a3
{
  return [a3 isEqualToString:0x1F1E04438];
}

+ (id)textBackgroundImageFittingSize:(void *)a3 forTheme:
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  if (textBackgroundImageFittingSize_forTheme__onceToken != -1) {
    dispatch_once(&textBackgroundImageFittingSize_forTheme__onceToken, &__block_literal_global_6);
  }
  v19[0] = v4;
  unint64_t v6 = [v5 backgroundStyle];
  v19[1] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];

  id v8 = [(id)textBackgroundImageFittingSize_forTheme__cache objectForKey:v7];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    +[__ASCLayoutProxy offerButtonHeightForSize:v4];
    double v12 = v11 + 1.0;
    uint64_t v13 = [v5 backgroundStyle];
    objc_msgSend(v13, "cornerRadiusForImageSize:stretchableArea:", v12, v12, 1.0);
    double v15 = v14;

    v16 = -[ASCImageRenderer initWithSize:capInsets:renderingMode:]([ASCImageRenderer alloc], "initWithSize:capInsets:renderingMode:", 1, v12, v12, v15, v15, v15, v15);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__ASCOfferButton_textBackgroundImageFittingSize_forTheme___block_invoke_2;
    v18[3] = &__block_descriptor_40_e54_v48__0_CGRect__CGPoint_dd__CGSize_dd__8__CGContext__40l;
    *(double *)&v18[4] = v15;
    id v10 = [(ASCImageRenderer *)v16 imageWithActions:v18];
    [(id)textBackgroundImageFittingSize_forTheme__cache setObject:v10 forKey:v7];
  }

  return v10;
}

uint64_t __58__ASCOfferButton_textBackgroundImageFittingSize_forTheme___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)textBackgroundImageFittingSize_forTheme__cache;
  textBackgroundImageFittingSize_forTheme__cache = (uint64_t)v0;

  [(id)textBackgroundImageFittingSize_forTheme__cache setName:@"Text background image cache"];
  v2 = (void *)textBackgroundImageFittingSize_forTheme__cache;

  return [v2 setCountLimit:10];
}

void __58__ASCOfferButton_textBackgroundImageFittingSize_forTheme___block_invoke_2(uint64_t a1, CGContext *a2, double a3, double a4, double a5, double a6)
{
  double v7 = CGPathCreateWithRoundedRect(*(CGRect *)&a3, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 32), 0);
  CGContextSetRGBFillColor(a2, 0.0, 0.0, 0.0, 1.0);
  CGContextAddPath(a2, v7);
  CGContextFillPath(a2);

  CGPathRelease(v7);
}

+ (id)progressStateImageFittingSize:(id)a3 forTheme:(id)a4 startPercent:(double)a5 endPercent:(double)a6 useFullImageSize:(BOOL)a7
{
  BOOL v7 = a7;
  v36[7] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__onceToken != -1) {
    dispatch_once(&progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__onceToken, &__block_literal_global_16);
  }
  v36[0] = v11;
  uint64_t v13 = NSNumber;
  [v12 progressLineWidth];
  double v14 = objc_msgSend(v13, "numberWithDouble:");
  v36[1] = v14;
  double v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "progressLineCap"));
  v36[2] = v15;
  v16 = [v12 progressColor];
  v36[3] = v16;
  v17 = [NSNumber numberWithDouble:a5];
  v36[4] = v17;
  v18 = [NSNumber numberWithDouble:a6];
  v36[5] = v18;
  v19 = [NSNumber numberWithBool:v7];
  v36[6] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:7];

  v21 = [(id)progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__cache objectForKey:v20];
  v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    +[__ASCLayoutProxy offerProgressDiameterForSize:v11];
    double v25 = floor((v24 + 1.0 + -1.0) * 0.5);
    if (v7) {
      double v26 = v24 + 1.0;
    }
    else {
      double v26 = v24;
    }
    v27 = -[ASCImageRenderer initWithSize:capInsets:renderingMode:]([ASCImageRenderer alloc], "initWithSize:capInsets:renderingMode:", 0, v26, v26, v25, v25, v25, v25);
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __98__ASCOfferButton_progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize___block_invoke_2;
    v32 = &unk_1E645E7F8;
    id v33 = v12;
    double v34 = a5;
    double v35 = a6;
    id v23 = [(ASCImageRenderer *)v27 imageWithActions:&v29];
    objc_msgSend((id)progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__cache, "setObject:forKey:", v23, v20, v29, v30, v31, v32);
  }

  return v23;
}

uint64_t __98__ASCOfferButton_progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__cache;
  progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__cache = (uint64_t)v0;

  [(id)progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__cache setName:@"Progress state image cache"];
  v2 = (void *)progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__cache;

  return [v2 setCountLimit:20];
}

void __98__ASCOfferButton_progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize___block_invoke_2(uint64_t a1, CGContext *a2, double a3, double a4, double a5, double a6)
{
  [*(id *)(a1 + 32) progressLineWidth];
  CGContextSetLineWidth(a2, v12);
  CGContextSetLineCap(a2, (CGLineCap)[*(id *)(a1 + 32) progressLineCap]);
  [*(id *)(a1 + 32) progressLineWidth];
  ProgressRing = ASCPathCreateProgressRing(a3, a4, a5, a6, v13, *(double *)(a1 + 40), *(double *)(a1 + 48));
  CGContextAddPath(a2, ProgressRing);
  id v15 = [*(id *)(a1 + 32) progressColor];
  CGContextSetStrokeColorWithColor(a2, (CGColorRef)[v15 CGColor]);

  CGContextStrokePath(a2);

  CGPathRelease(ProgressRing);
}

+ (id)progressTransitionImageFittingSize:(void *)a3 forTheme:
{
  id v4 = a3;
  id v5 = a2;
  unint64_t v6 = [self progressStateImageFittingSize:v5 forTheme:v4 startPercent:0 endPercent:0.0 useFullImageSize:1.0];

  return v6;
}

+ (id)indeterminateProgressImageFittingSize:(void *)a3 forTheme:
{
  id v4 = a3;
  id v5 = a2;
  unint64_t v6 = [self progressStateImageFittingSize:v5 forTheme:v4 startPercent:1 endPercent:0.1 useFullImageSize:0.9];

  return v6;
}

+ (id)progressImageWithPercent:(double)a1 fittingSize:(uint64_t)a2 forTheme:(void *)a3 cancellable:(void *)a4
{
  id v6 = a4;
  id v7 = a3;
  self;
  +[__ASCLayoutProxy offerProgressDiameterForSize:v7];
  double v9 = v8;

  id v10 = -[ASCImageRenderer initWithSize:]([ASCImageRenderer alloc], "initWithSize:", v9, v9);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__ASCOfferButton_progressImageWithPercent_fittingSize_forTheme_cancellable___block_invoke;
  v14[3] = &unk_1E645E820;
  id v15 = v6;
  double v16 = a1;
  id v11 = v6;
  CGFloat v12 = [(ASCImageRenderer *)v10 imageWithActions:v14];

  return v12;
}

void __76__ASCOfferButton_progressImageWithPercent_fittingSize_forTheme_cancellable___block_invoke(uint64_t a1, CGContext *a2, double a3, double a4, double a5, double a6)
{
  [*(id *)(a1 + 32) progressLineWidth];
  CGContextSetLineWidth(a2, v12);
  CGContextSetLineCap(a2, (CGLineCap)[*(id *)(a1 + 32) progressLineCap]);
  CGContextSaveGState(a2);
  [*(id *)(a1 + 32) progressLineWidth];
  ProgressRing = ASCPathCreateProgressRing(a3, a4, a5, a6, v13, 0.0, 1.0);
  CGContextAddPath(a2, ProgressRing);
  id v15 = [*(id *)(a1 + 32) progressColor];
  CGContextSetStrokeColorWithColor(a2, (CGColorRef)[v15 CGColor]);

  CGContextStrokePath(a2);
  CGPathRelease(ProgressRing);
  CGContextRestoreGState(a2);
  CGContextSaveGState(a2);
  [*(id *)(a1 + 32) progressLineWidth];
  v17 = ASCPathCreateProgressRing(a3, a4, a5, a6, v16, 0.0, *(double *)(a1 + 40));
  CGContextAddPath(a2, v17);
  id v18 = [*(id *)(a1 + 32) iconTintColor];
  CGContextSetStrokeColorWithColor(a2, (CGColorRef)[v18 CGColor]);

  CGContextStrokePath(a2);
  CGPathRelease(v17);
  CGContextRestoreGState(a2);
  CGContextSaveGState(a2);
  v32.origin.x = a3;
  v32.origin.y = a4;
  v32.size.width = a5;
  v32.size.height = a6;
  double Width = CGRectGetWidth(v32);
  v33.origin.x = a3;
  v33.origin.y = a4;
  v33.size.width = a5;
  v33.size.height = a6;
  double Height = CGRectGetHeight(v33);
  if (Width >= Height) {
    double Width = Height;
  }
  [*(id *)(a1 + 32) stopIndicatorRatio];
  CGFloat v22 = floor(Width * v21);
  v34.origin.x = a3;
  v34.origin.y = a4;
  v34.size.width = a5;
  v34.size.height = a6;
  CGFloat v23 = CGRectGetMidX(v34) - v22 * 0.5;
  v35.origin.x = a3;
  v35.origin.y = a4;
  v35.size.width = a5;
  v35.size.height = a6;
  CGFloat v24 = CGRectGetMidY(v35) - v22 * 0.5;
  [*(id *)(a1 + 32) stopIndicatorCornerSize];
  CGFloat v26 = v25;
  [*(id *)(a1 + 32) stopIndicatorCornerSize];
  CGFloat v28 = v27;
  v36.origin.x = v23;
  v36.origin.y = v24;
  v36.size.width = v22;
  v36.size.height = v22;
  uint64_t v29 = CGPathCreateWithRoundedRect(v36, v26, v28, 0);
  CGContextAddPath(a2, v29);
  id v30 = [*(id *)(a1 + 32) iconTintColor];
  CGContextSetFillColorWithColor(a2, (CGColorRef)[v30 CGColor]);

  CGContextFillPath(a2);
  CGPathRelease(v29);

  CGContextRestoreGState(a2);
}

- (ASCOfferButton)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)ASCOfferButton;
  int v3 = -[ASCOfferButton initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_size, @"small");
    v4->_subtitlePosition = 0;
    uint64_t v5 = +[ASCOfferTheme grayTheme];
    theme = v4->_theme;
    v4->_theme = (ASCOfferTheme *)v5;

    uint64_t v7 = +[ASCOfferMetadata emptyMetadata];
    metadata = v4->_metadata;
    v4->_metadata = (ASCOfferMetadata *)v7;

    double v9 = [ASCOfferButtonBackgroundImageView alloc];
    uint64_t v10 = -[ASCOfferButtonBackgroundImageView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    imageView = v4->_imageView;
    v4->_imageView = (ASCOfferButtonBackgroundImageView *)v10;

    v4->_fixeddouble Height = 0;
    v4->_shouldTopAlign = 0;
    v4->_topPadding = 0.0;
    v4->_shouldExpandBackground = 0;
    -[ASCOfferButton setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(ASCOfferButton *)v4 setInsetsLayoutMarginsFromSafeArea:0];
    [(ASCOfferButton *)v4 setPreservesSuperviewLayoutMargins:0];
    [(ASCOfferButtonBackgroundImageView *)v4->_imageView setInsetsLayoutMarginsFromSafeArea:0];
    [(ASCOfferButtonBackgroundImageView *)v4->_imageView setPreservesSuperviewLayoutMargins:0];
    CGFloat v12 = [(ASCOfferButton *)v4 imageView];
    [(ASCOfferButton *)v4 addSubview:v12];

    CGFloat v13 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    double v14 = self;
    id v15 = [v13 arrayByAddingObject:v14];

    id v16 = (id)[(ASCOfferButton *)v4 registerForTraitChanges:v15 withAction:sel_onTraitCollectionChange];
  }
  return v4;
}

- (ASCOfferButton)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)setTitleLabelIfLoaded:(id)a3
{
  id v5 = a3;
  [(UILabel *)self->_titleLabelIfLoaded removeFromSuperview];
  objc_storeStrong((id *)&self->_titleLabelIfLoaded, a3);
  if (self->_titleLabelIfLoaded) {
    -[ASCOfferButton addSubview:](self, "addSubview:");
  }
  [(ASCOfferButton *)self setNeedsLayout];
  [(ASCOfferButton *)self invalidateIntrinsicContentSize];
}

- (UILabel)titleLabel
{
  int v3 = [(ASCOfferButton *)self titleLabelIfLoaded];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    id v5 = (id)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v5 setNumberOfLines:1];
    [v5 setLineBreakMode:4];
    [v5 setMinimumScaleFactor:0.0];
    objc_msgSend(v5, "setSemanticContentAttribute:", -[ASCOfferButton semanticContentAttribute](self, "semanticContentAttribute"));
    [(ASCOfferButton *)self setTitleLabelIfLoaded:v5];
    [(ASCOfferButton *)self updateLabelStyleProperties];
  }

  return (UILabel *)v5;
}

- (void)setSubtitleLabelIfLoaded:(id)a3
{
  id v5 = a3;
  [(UILabel *)self->_subtitleLabelIfLoaded removeFromSuperview];
  objc_storeStrong((id *)&self->_subtitleLabelIfLoaded, a3);
  if (self->_subtitleLabelIfLoaded) {
    -[ASCOfferButton addSubview:](self, "addSubview:");
  }
  [(ASCOfferButton *)self setNeedsLayout];
  [(ASCOfferButton *)self invalidateIntrinsicContentSize];
}

- (UILabel)subtitleLabel
{
  int v3 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    id v5 = (id)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v7 = [(ASCOfferButton *)self size];
    double v8 = [(ASCOfferButton *)self theme];
    double v9 = [(ASCOfferButton *)self traitCollection];
    uint64_t v10 = +[ASCOfferButton subtitleFontFittingSize:forTheme:compatibleWithTraitCollection:]();
    [v5 setFont:v10];

    id v11 = [v5 font];
    objc_msgSend(v5, "set_fontForShortcutBaselineCalculation:", v11);

    [v5 setNumberOfLines:3];
    [v5 setLineBreakMode:4];
    objc_msgSend(v5, "setSemanticContentAttribute:", -[ASCOfferButton semanticContentAttribute](self, "semanticContentAttribute"));
    [(ASCOfferButton *)self setSubtitleLabelIfLoaded:v5];
    [(ASCOfferButton *)self updateLabelStyleProperties];
  }

  return (UILabel *)v5;
}

- (void)updateImageStyleProperties
{
  if ([(ASCOfferButton *)self isEnabled])
  {
    int v3 = [(ASCOfferButton *)self imageView];
    id v4 = v3;
    double v5 = 1.0;
  }
  else
  {
    self;
    int v3 = [(ASCOfferButton *)self imageView];
    id v4 = v3;
    double v5 = 0.6;
  }
  [v3 setAlpha:v5];

  id v6 = [(ASCOfferButton *)self metadata];
  int v7 = [v6 isEmpty];

  if (v7)
  {
LABEL_5:
    v47 = [(ASCOfferButton *)self imageView];
    [(ASCOfferMetadata *)v47 setTintColor:0];
    goto LABEL_22;
  }
  double v8 = [(ASCOfferButton *)self metadata];
  int v9 = [v8 isIcon];

  if (v9)
  {
    uint64_t v10 = [(ASCOfferButton *)self theme];
    id v11 = [v10 iconTintColor];
    CGFloat v12 = [(ASCOfferButton *)self imageView];
    [v12 setTintColor:v11];

    CGFloat v13 = self->_metadata;
    v47 = [(ASCOfferButton *)self size];
    double v14 = [(ASCOfferMetadata *)v13 imageNameForSize:v47];

    id v15 = [(ASCOfferButton *)self traitCollection];
    id v16 = +[ASCImageRenderer bundleImageNamed:v14 compatibleWithTraitCollection:v15];
    v17 = [(ASCOfferButton *)self imageView];
    [v17 setImage:v16];

    goto LABEL_22;
  }
  objc_super v18 = [(ASCOfferButton *)self metadata];
  int v19 = [v18 isProgress];

  if (v19)
  {
    v47 = self->_metadata;
    v20 = [(ASCOfferButton *)self theme];
    double v21 = [v20 iconTintColor];
    CGFloat v22 = [(ASCOfferButton *)self imageView];
    [v22 setTintColor:v21];

    if ([(ASCOfferMetadata *)v47 isIndeterminate])
    {
      CGFloat v23 = [(ASCOfferButton *)self size];
      CGFloat v24 = [(ASCOfferButton *)self theme];
      +[ASCOfferButton indeterminateProgressImageFittingSize:forTheme:]((uint64_t)ASCOfferButton, v23, v24);
    }
    else
    {
      [(ASCOfferMetadata *)v47 percent];
      double v27 = v26;
      CGFloat v23 = [(ASCOfferButton *)self size];
      CGFloat v24 = [(ASCOfferButton *)self theme];
      [(ASCOfferMetadata *)v47 cancellable];
      +[ASCOfferButton progressImageWithPercent:fittingSize:forTheme:cancellable:](v27, (uint64_t)ASCOfferButton, v23, v24);
    CGFloat v28 = };
    uint64_t v29 = [(ASCOfferButton *)self imageView];
    [v29 setImage:v28];
LABEL_15:

    goto LABEL_22;
  }
  double v25 = [(ASCOfferButton *)self metadata];
  if ([v25 isText])
  {
  }
  else
  {
    id v30 = [(ASCOfferButton *)self metadata];
    int v31 = [v30 isPlaceholder];

    if (!v31)
    {
      v41 = [(ASCOfferButton *)self metadata];
      int v42 = [v41 isDeeplink];

      if (!v42)
      {
        v44 = [(ASCOfferButton *)self metadata];
        int v45 = [v44 isViewInAppStore];

        if (!v45)
        {
          v46 = [(ASCOfferButton *)self metadata];
          ASCUnknownEnumCase(@"ASCOfferMetadata", v46);
        }
        goto LABEL_5;
      }
      v47 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.forward.app.fill"];
      CGFloat v23 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8]];
      CGFloat v24 = [(ASCOfferMetadata *)v47 imageWithSymbolConfiguration:v23];
      v43 = [(ASCOfferButton *)self imageView];
      [v43 setImage:v24];

      CGFloat v28 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      uint64_t v29 = [(ASCOfferButton *)self imageView];
      [v29 setTintColor:v28];
      goto LABEL_15;
    }
  }
  int v32 = [(ASCOfferButton *)self isHighlighted];
  CGRect v33 = [(ASCOfferButton *)self theme];
  CGRect v34 = [v33 titleBackgroundColor];
  CGRect v35 = v34;
  CGRect v36 = v34;
  if (v32)
  {
    CGRect v36 = objc_msgSend(v34, "asc_highlightedColor");
  }
  v37 = [(ASCOfferButton *)self imageView];
  [v37 setTintColor:v36];

  if (v32) {
  v47 = [(ASCOfferButton *)self size];
  }
  v38 = [(ASCOfferButton *)self theme];
  v39 = +[ASCOfferButton textBackgroundImageFittingSize:forTheme:]((uint64_t)ASCOfferButton, v47, v38);
  v40 = [(ASCOfferButton *)self imageView];
  [v40 setImage:v39];

LABEL_22:
}

- (void)updateLabelStyleProperties
{
  int v3 = [(ASCOfferButton *)self titleLabelIfLoaded];
  id v4 = [v3 text];
  double v5 = [(ASCOfferButton *)self size];
  id v6 = [(ASCOfferButton *)self metadata];
  int v7 = [(ASCOfferButton *)self traitCollection];
  double v8 = +[ASCOfferButton titleFontForText:fittingSize:representingMetadata:compatibleWithTraitCollection:]((uint64_t)ASCOfferButton, v4, v5, v6, v7);
  int v9 = [(ASCOfferButton *)self titleLabelIfLoaded];
  [v9 setFont:v8];

  uint64_t v10 = [(ASCOfferButton *)self size];
  BOOL v11 = +[ASCOfferButton adjustsTitleFontSizeToFitWidthForSize:v10];
  CGFloat v12 = [(ASCOfferButton *)self titleLabelIfLoaded];
  [v12 setAdjustsFontSizeToFitWidth:v11];

  CGFloat v13 = [(ASCOfferButton *)self titleLabelIfLoaded];
  double v14 = [v13 font];
  id v15 = [(ASCOfferButton *)self titleLabelIfLoaded];
  objc_msgSend(v15, "set_fontForShortcutBaselineCalculation:", v14);

  if (![(ASCOfferButton *)self isEnabled])
  {
    self;
    CGFloat v23 = [(ASCOfferButton *)self titleLabelIfLoaded];
    [v23 setAlpha:0.56];

    objc_super v18 = [(ASCOfferButton *)self theme];
    v20 = [v18 titleTextDisabledColor];
    double v21 = [(ASCOfferButton *)self titleLabelIfLoaded];
    [v21 setTextColor:v20];
LABEL_7:

    goto LABEL_8;
  }
  id v16 = [(ASCOfferButton *)self titleLabelIfLoaded];
  [v16 setAlpha:1.0];

  int v17 = [(ASCOfferButton *)self isHighlighted];
  objc_super v18 = [(ASCOfferButton *)self theme];
  int v19 = [v18 titleTextColor];
  v20 = v19;
  double v21 = v19;
  if (v17)
  {
    double v21 = objc_msgSend(v19, "asc_highlightedColor");
  }
  CGFloat v22 = [(ASCOfferButton *)self titleLabelIfLoaded];
  [v22 setTextColor:v21];

  if (v17) {
    goto LABEL_7;
  }
LABEL_8:

  CGFloat v24 = [(ASCOfferButton *)self theme];
  double v25 = [v24 subtitleTextColor];
  double v26 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
  [v26 setTextColor:v25];

  int64_t v27 = [(ASCOfferButton *)self subtitlePosition];
  if (v27 != 2)
  {
    if (v27 != 1)
    {
      if (v27) {
        return;
      }
      goto LABEL_18;
    }
    if (self) {
      uint64_t v28 = 2
    }
          * ([(ASCOfferButton *)self effectiveUserInterfaceLayoutDirection] != 0);
    else {
      uint64_t v28 = 0;
    }
    uint64_t v29 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
    [v29 setTextAlignment:v28];
  }
  id v30 = [(ASCOfferButton *)self metadata];
  if ([v30 isIcon])
  {
  }
  else
  {
    int v31 = [(ASCOfferButton *)self metadata];
    int v32 = [v31 isProgress];

    if (!v32)
    {
      if (self) {
        uint64_t v35 = 2
      }
            * ([(ASCOfferButton *)self effectiveUserInterfaceLayoutDirection] != 0);
      else {
        uint64_t v35 = 0;
      }
      CGRect v33 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
      id v36 = v33;
      uint64_t v34 = v35;
      goto LABEL_19;
    }
  }
LABEL_18:
  CGRect v33 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
  id v36 = v33;
  uint64_t v34 = 1;
LABEL_19:
  [v33 setTextAlignment:v34];
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASCOfferButton;
  [(ASCOfferButton *)&v4 setEnabled:a3];
  [(ASCOfferButton *)self updateImageStyleProperties];
  [(ASCOfferButton *)self updateLabelStyleProperties];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASCOfferButton;
  [(ASCOfferButton *)&v4 setHighlighted:a3];
  [(ASCOfferButton *)self updateImageStyleProperties];
  [(ASCOfferButton *)self updateLabelStyleProperties];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASCOfferButton;
  -[ASCOfferButton setSemanticContentAttribute:](&v8, sel_setSemanticContentAttribute_);
  double v5 = [(ASCOfferButton *)self imageView];
  [v5 setSemanticContentAttribute:a3];

  id v6 = [(ASCOfferButton *)self titleLabelIfLoaded];
  [v6 setSemanticContentAttribute:a3];

  int v7 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
  [v7 setSemanticContentAttribute:a3];
}

- (void)updateVisualEffects
{
  int v3 = [(ASCOfferButton *)self focusEffect];
  [(ASCOfferButton *)self setFocusEffect:v3];

  [(ASCOfferButton *)self updateFocusIfNeeded];
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)focusEffect
{
  v2 = [(ASCOfferButton *)self imageView];
  [v2 frame];
  double v4 = v3 + -1.0;
  double v6 = v5 + -1.0;
  double v8 = v7 + 2.0;
  double v10 = v9 + 2.0;

  double v11 = floor(v10 * 0.5);
  CGFloat v12 = (void *)MEMORY[0x1E4FB1788];
  uint64_t v13 = *MEMORY[0x1E4F39EA8];

  return (id)objc_msgSend(v12, "effectWithRoundedRect:cornerRadius:curve:", v13, v4, v6, v8, v10, v11);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ASCOfferButton;
  id v6 = a3;
  [(ASCOfferButton *)&v8 pressesBegan:v6 withEvent:a4];
  double v7 = objc_msgSend(v6, "objectsPassingTest:", &__block_literal_global_50, v8.receiver, v8.super_class);

  if ([v7 count]) {
    [(ASCOfferButton *)self setHighlighted:1];
  }
}

BOOL __41__ASCOfferButton_pressesBegan_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 4;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ASCOfferButton;
  id v6 = a3;
  [(ASCOfferButton *)&v8 pressesEnded:v6 withEvent:a4];
  double v7 = objc_msgSend(v6, "objectsPassingTest:", &__block_literal_global_54, v8.receiver, v8.super_class);

  if ([v7 count])
  {
    [(ASCOfferButton *)self setHighlighted:0];
    if ([(ASCOfferButton *)self isUserInteractionEnabled]) {
      [(ASCOfferButton *)self sendActionsForControlEvents:64];
    }
  }
}

BOOL __41__ASCOfferButton_pressesEnded_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 4;
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ASCOfferButton;
  id v6 = a3;
  [(ASCOfferButton *)&v8 pressesCancelled:v6 withEvent:a4];
  double v7 = objc_msgSend(v6, "objectsPassingTest:", &__block_literal_global_58, v8.receiver, v8.super_class);

  if ([v7 count]) {
    [(ASCOfferButton *)self setHighlighted:0];
  }
}

BOOL __45__ASCOfferButton_pressesCancelled_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 4;
}

- (void)setSubtitlePosition:(int64_t)a3
{
  if (self->_subtitlePosition != a3)
  {
    self->_subtitlePosition = a3;
    [(ASCOfferButton *)self updateLabelStyleProperties];
    [(ASCOfferButton *)self invalidateIntrinsicContentSize];
    [(ASCOfferButton *)self setNeedsLayout];
  }
}

- (void)setTheme:(id)a3
{
  id v5 = a3;
  if (!-[ASCOfferTheme isEqual:](self->_theme, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_theme, a3);
    [(ASCOfferButton *)self updateImageStyleProperties];
    [(ASCOfferButton *)self updateLabelStyleProperties];
  }
}

- (void)setMetadata:(id)a3
{
  p_metadata = &self->_metadata;
  id v56 = a3;
  if ((-[ASCOfferMetadata isEqual:](*p_metadata, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_metadata, a3);
    if ([(ASCOfferMetadata *)*p_metadata isEmpty])
    {
      id v6 = [(ASCOfferButton *)self titleLabelIfLoaded];
      [v6 setText:0];

      double v7 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
      [v7 setText:0];

      [(ASCOfferButton *)self setImageAnimation:0];
      objc_super v8 = [(ASCOfferButton *)self imageView];
      [v8 setImage:0];
LABEL_9:

      int64_t v27 = [(ASCOfferButton *)self imageView];
      double v11 = v27;
      uint64_t v28 = 0;
LABEL_10:
      [(ASCOfferMetadata *)v27 setIsBackgroundForText:v28];
LABEL_21:

      [(ASCOfferButton *)self updateImageStyleProperties];
      [(ASCOfferButton *)self updateLabelStyleProperties];
      [(ASCOfferButton *)self setNeedsLayout];
      [(ASCOfferButton *)self invalidateIntrinsicContentSize];
      UIAccessibilityPostNotification(*MEMORY[0x1E4FB2470], 0);
      goto LABEL_22;
    }
    BOOL v9 = [(ASCOfferMetadata *)*p_metadata isText];
    double v10 = *p_metadata;
    if (v9)
    {
      double v11 = v10;
      CGFloat v12 = (void *)MEMORY[0x1E4F28B18];
      uint64_t v13 = [(ASCOfferMetadata *)v11 title];
      double v14 = [(ASCOfferButton *)self traitCollection];
      id v15 = objc_msgSend(v12, "asc_attributedStringWithLockupTextContainingSymbols:compatibleWithTraitCollection:", v13, v14);
      id v16 = [(ASCOfferButton *)self titleLabel];
      [v16 setAttributedText:v15];

      int v17 = [(ASCOfferMetadata *)v11 subtitle];

      if (v17)
      {
        objc_super v18 = [(ASCOfferMetadata *)v11 subtitle];
        int v19 = [(ASCOfferButton *)self subtitleLabel];
        [v19 setText:v18];
      }
      else
      {
        objc_super v18 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
        [v18 setText:0];
      }

      [(ASCOfferButton *)self setImageAnimation:0];
      v41 = [(ASCOfferButton *)self imageView];
      [v41 setContentMode:0];

      v38 = [(ASCOfferButton *)self imageView];
      v39 = v38;
      uint64_t v40 = 1;
LABEL_20:
      [v38 setIsBackgroundForText:v40];

      goto LABEL_21;
    }
    BOOL v20 = [(ASCOfferMetadata *)v10 isIcon];
    double v21 = *p_metadata;
    if (v20)
    {
      CGFloat v22 = v21;
      CGFloat v23 = [(ASCOfferButton *)self titleLabelIfLoaded];
      [v23 setText:0];

      CGFloat v24 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
      [v24 setText:0];

      double v25 = [(ASCOfferMetadata *)v22 animationName];

      double v26 = ASCOfferMetadataAnimationForName(v25);
      [(ASCOfferButton *)self setImageAnimation:v26];

      objc_super v8 = [(ASCOfferButton *)self imageView];
      [v8 setContentMode:4];
      goto LABEL_9;
    }
    BOOL v29 = [(ASCOfferMetadata *)v21 isProgress];
    id v30 = *p_metadata;
    if (v29)
    {
      double v11 = v30;
      int v31 = [(ASCOfferButton *)self titleLabelIfLoaded];
      [v31 setText:0];

      int v32 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
      [v32 setText:0];

      int v33 = [(ASCOfferMetadata *)v11 isIndeterminate];
      uint64_t v34 = &ASCOfferMetadataAnimationNameRotate;
      if (!v33) {
        uint64_t v34 = ASCOfferMetadataAnimationNameNone;
      }
      uint64_t v35 = ASCOfferMetadataAnimationForName(*v34);
      [(ASCOfferButton *)self setImageAnimation:v35];

      if ([(ASCOfferMetadata *)v11 isIndeterminate]) {
        uint64_t v36 = 0;
      }
      else {
        uint64_t v36 = 4;
      }
      v37 = [(ASCOfferButton *)self imageView];
      [v37 setContentMode:v36];

      v38 = [(ASCOfferButton *)self imageView];
      v39 = v38;
      uint64_t v40 = 0;
      goto LABEL_20;
    }
    if ([(ASCOfferMetadata *)v30 isPlaceholder])
    {
      int v42 = [(ASCOfferButton *)self titleLabel];
      [v42 setText:0];

      v43 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
      [v43 setText:0];

      [(ASCOfferButton *)self setImageAnimation:0];
      v44 = [(ASCOfferButton *)self imageView];
      int v45 = v44;
      uint64_t v46 = 0;
    }
    else
    {
      if (![(ASCOfferMetadata *)*p_metadata isDeeplink])
      {
        if (![(ASCOfferMetadata *)*p_metadata isViewInAppStore]) {
          ASCUnknownEnumCase(@"ASCOfferMetadata", v56);
        }
        v49 = *p_metadata;
        v50 = (void *)MEMORY[0x1E4F28B18];
        v51 = [(ASCOfferMetadata *)v49 title];
        v52 = [(ASCOfferButton *)self traitCollection];
        v53 = objc_msgSend(v50, "asc_attributedStringWithLockupTextContainingSymbols:compatibleWithTraitCollection:", v51, v52);
        v54 = [(ASCOfferButton *)self titleLabel];
        [v54 setAttributedText:v53];

        v55 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
        [v55 setText:0];

        [(ASCOfferButton *)self setImageAnimation:0];
        int v45 = [(ASCOfferButton *)self imageView];
        [v45 setImage:0];
        goto LABEL_32;
      }
      v47 = [(ASCOfferButton *)self titleLabel];
      [v47 setText:0];

      v48 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
      [v48 setText:0];

      [(ASCOfferButton *)self setImageAnimation:0];
      v44 = [(ASCOfferButton *)self imageView];
      int v45 = v44;
      uint64_t v46 = 4;
    }
    [v44 setContentMode:v46];
LABEL_32:

    int64_t v27 = [(ASCOfferButton *)self imageView];
    double v11 = v27;
    uint64_t v28 = 1;
    goto LABEL_10;
  }
LABEL_22:
}

- (void)beginModalStateWithCancelBlock:(id)a3
{
  id v4 = a3;
  id v5 = [[ASCModalViewInteraction alloc] initWithView:self];
  [(ASCOfferButton *)self setModalInteraction:v5];

  id v6 = [(ASCOfferButton *)self modalInteraction];
  [v6 installWithCancelBlock:v4];
}

- (void)endModalState
{
  double v3 = [(ASCOfferButton *)self modalInteraction];
  [v3 invalidate];

  [(ASCOfferButton *)self setModalInteraction:0];
}

- (CAAnimation)imageAnimation
{
  v2 = [(ASCOfferButton *)self imageView];
  double v3 = [v2 layer];
  self;
  id v4 = [v3 animationForKey:@"ASCOfferButton.imageAnimation"];

  return (CAAnimation *)v4;
}

- (void)setImageAnimation:(id)a3
{
  id v8 = a3;
  id v4 = [(ASCOfferButton *)self imageView];
  id v5 = [v4 layer];
  self;
  [v5 removeAnimationForKey:@"ASCOfferButton.imageAnimation"];

  if (v8)
  {
    id v6 = [(ASCOfferButton *)self imageView];
    double v7 = [v6 layer];
    self;
    [v7 addAnimation:v8 forKey:@"ASCOfferButton.imageAnimation"];
  }
}

- (void)setCurrentTransition:(id)a3
{
  id v6 = a3;
  p_currentTransition = &self->_currentTransition;
  if (*p_currentTransition && [(UIViewPropertyAnimator *)*p_currentTransition state] == 1)
  {
    [(UIViewPropertyAnimator *)*p_currentTransition stopAnimation:0];
    [(UIViewPropertyAnimator *)*p_currentTransition finishAnimationAtPosition:0];
  }
  objc_storeStrong((id *)p_currentTransition, a3);
  if (*p_currentTransition) {
    [(UIViewPropertyAnimator *)*p_currentTransition startAnimation];
  }
}

- (BOOL)canTransitionToMetadata:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4FB1EB0] areAnimationsEnabled]
    && ([(ASCOfferButton *)self isHidden] & 1) == 0)
  {
    id v6 = [(ASCOfferButton *)self metadata];
    if ([v6 isEqual:v4])
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      double v7 = [(ASCOfferButton *)self metadata];
      if ([v7 isEmpty] & 1) != 0 || (objc_msgSend(v4, "isEmpty"))
      {
        LOBYTE(v5) = 0;
      }
      else
      {
        id v8 = [(ASCOfferButton *)self metadata];
        if [v8 isProgress] && (objc_msgSend(v4, "isProgress"))
        {
          LOBYTE(v5) = 0;
        }
        else
        {
          BOOL v9 = [(ASCOfferButton *)self metadata];
          if ([v9 isPlaceholder]) {
            LOBYTE(v5) = 0;
          }
          else {
            int v5 = [v4 isPlaceholder] ^ 1;
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)shouldTransitionImageViewFromMetadata:(id)a3 toMetadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEmpty] && (objc_msgSend(v6, "isEmpty") & 1) != 0
    || [v5 isText] && (objc_msgSend(v6, "isText") & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else if ([v5 isIcon] && objc_msgSend(v6, "isIcon"))
  {
    id v8 = v6;
    BOOL v9 = [v5 animationName];
    uint64_t v10 = [v8 animationName];
    double v11 = (void *)v10;
    if (v9 && v10) {
      char v12 = [v9 isEqual:v10];
    }
    else {
      char v12 = v9 == (void *)v10;
    }
    LOBYTE(v7) = v12 ^ 1;
  }
  else
  {
    int v7 = [v6 isViewInAppStore] ^ 1;
  }

  return v7;
}

- (BOOL)chainTransitionToMetadata:(id)a3 scalingDurationBy:(double)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(ASCOfferButton *)self currentTransition];
  if (v10
    && (double v11 = (void *)v10,
        [(ASCOfferButton *)self currentTransition],
        char v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 state],
        v12,
        v11,
        v13 == 1))
  {
    double v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:1];
    id v15 = [(ASCOfferButton *)self currentTransition];
    [v15 pauseAnimation];

    objc_initWeak(&location, self);
    id v16 = [(ASCOfferButton *)self currentTransition];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __77__ASCOfferButton_chainTransitionToMetadata_scalingDurationBy_withCompletion___block_invoke;
    v20[3] = &unk_1E645E868;
    objc_copyWeak(v23, &location);
    id v21 = v8;
    *(double *)&v23[1] = a4 * 0.7;
    id v22 = v9;
    [v16 addCompletion:v20];

    int v17 = [(ASCOfferButton *)self currentTransition];
    [v17 continueAnimationWithTimingParameters:v14 durationFactor:a4 * 0.3];

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);

    BOOL v18 = 1;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

void __77__ASCOfferButton_chainTransitionToMetadata_scalingDurationBy_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained transitionToMetadata:*(void *)(a1 + 32) scalingDurationBy:*(void *)(a1 + 40) withCompletion:*(double *)(a1 + 56)];
  }
}

- (id)transitionImageForMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCOfferButton *)self metadata];
  if ([v5 isProgress] && objc_msgSend(v4, "isText")
    || [v5 isText]
    && [v4 isProgress]
    && ([v4 isIndeterminate] & 1) == 0)
  {
    id v6 = [(ASCOfferButton *)self size];
    id v8 = [(ASCOfferButton *)self theme];
    int v7 = +[ASCOfferButton progressTransitionImageFittingSize:forTheme:]((uint64_t)ASCOfferButton, v6, v8);
  }
  else
  {
    id v6 = [(ASCOfferButton *)self imageView];
    int v7 = [v6 image];
  }

  return v7;
}

- (id)transitionColorForMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCOfferButton *)self metadata];
  if (([v5 isText] & 1) != 0 || objc_msgSend(v4, "isText"))
  {
    id v6 = [(ASCOfferButton *)self theme];
    uint64_t v7 = [v6 titleBackgroundColor];
LABEL_9:
    id v8 = (void *)v7;

    goto LABEL_10;
  }
  if (([v5 isIcon] & 1) != 0
    || ([v4 isIcon] & 1) != 0
    || ([v5 isProgress] & 1) != 0
    || [v4 isProgress])
  {
    id v6 = [(ASCOfferButton *)self theme];
    uint64_t v7 = [v6 iconTintColor];
    goto LABEL_9;
  }
  id v8 = 0;
LABEL_10:

  return v8;
}

- (void)transitionToMetadata:(id)a3 scalingDurationBy:(double)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  if ([(ASCOfferButton *)self canTransitionToMetadata:v8])
  {
    if (![(ASCOfferButton *)self chainTransitionToMetadata:v8 scalingDurationBy:v9 withCompletion:a4])
    {
      uint64_t v10 = [(ASCOfferButton *)self imageView];
      double v11 = [(ASCOfferButton *)self transitionImageForMetadata:v8];
      char v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v11];
      [v10 alpha];
      objc_msgSend(v12, "setAlpha:");
      [v12 setContentMode:0];
      [v10 frame];
      objc_msgSend(v12, "setFrame:");
      uint64_t v13 = [(ASCOfferButton *)self transitionColorForMetadata:v8];
      [v12 setTintColor:v13];

      objc_msgSend(v12, "setSemanticContentAttribute:", -[ASCOfferButton semanticContentAttribute](self, "semanticContentAttribute"));
      [(ASCOfferButton *)self addSubview:v12];
      id v14 = objc_alloc(MEMORY[0x1E4FB1ED8]);
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:0];
      id v16 = (void *)[v14 initWithDuration:v15 timingParameters:a4 * 0.3];

      int v17 = [(ASCOfferButton *)self metadata];
      [(ASCOfferButton *)self setMetadata:v8];
      [(ASCOfferButton *)self layoutIfNeeded];
      BOOL v18 = [(ASCOfferButton *)self imageAnimation];
      [(ASCOfferButton *)self setImageAnimation:0];
      if ([(ASCOfferButton *)self shouldTransitionImageViewFromMetadata:v17 toMetadata:v8])
      {
        [v10 alpha];
        uint64_t v20 = v19;
        [v10 setAlpha:0.0];
        [v10 frame];
        uint64_t v22 = v21;
        uint64_t v24 = v23;
        uint64_t v26 = v25;
        uint64_t v28 = v27;
        [v12 frame];
        objc_msgSend(v10, "setFrame:");
        [(ASCOfferButton *)self updateVisualEffects];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __72__ASCOfferButton_transitionToMetadata_scalingDurationBy_withCompletion___block_invoke;
        v42[3] = &unk_1E645E890;
        uint64_t v45 = v20;
        uint64_t v46 = v22;
        uint64_t v47 = v24;
        uint64_t v48 = v26;
        uint64_t v49 = v28;
        id v43 = v10;
        v44 = self;
        [v16 addAnimations:v42];
      }
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __72__ASCOfferButton_transitionToMetadata_scalingDurationBy_withCompletion___block_invoke_2;
      v38[3] = &unk_1E645D8F8;
      id v29 = v12;
      id v39 = v29;
      id v40 = v10;
      v41 = self;
      id v30 = v10;
      [v16 addAnimations:v38];
      int v31 = [(ASCOfferButton *)self delegate];
      [v31 offerButton:self willTransitionToMetadata:v8 usingAnimator:v16];

      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __72__ASCOfferButton_transitionToMetadata_scalingDurationBy_withCompletion___block_invoke_3;
      v34[3] = &unk_1E645E8B8;
      v34[4] = self;
      id v35 = v18;
      id v36 = v29;
      v37 = v9;
      id v32 = v29;
      id v33 = v18;
      [v16 addCompletion:v34];
      [(ASCOfferButton *)self setCurrentTransition:v16];
    }
  }
  else
  {
    [(ASCOfferButton *)self setMetadata:v8];
    if (v9) {
      v9[2](v9);
    }
  }
}

uint64_t __72__ASCOfferButton_transitionToMetadata_scalingDurationBy_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 updateVisualEffects];
}

uint64_t __72__ASCOfferButton_transitionToMetadata_scalingDurationBy_withCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 40) frame];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  [*(id *)(a1 + 32) setAlpha:0.0];
  uint64_t v2 = *(void **)(a1 + 48);

  return [v2 updateVisualEffects];
}

uint64_t __72__ASCOfferButton_transitionToMetadata_scalingDurationBy_withCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentTransition:0];
  [*(id *)(a1 + 32) setImageAnimation:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)transitionToMetadata:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  char v12 = __54__ASCOfferButton_transitionToMetadata_withCompletion___block_invoke;
  uint64_t v13 = &unk_1E645E8E0;
  id v14 = self;
  id v15 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1C8768F90](&v10);
  -[ASCOfferButton transitionToMetadata:scalingDurationBy:withCompletion:](self, "transitionToMetadata:scalingDurationBy:withCompletion:", v8, v9, 1.0, v10, v11, v12, v13, v14);
}

uint64_t __54__ASCOfferButton_transitionToMetadata_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateVisualEffects];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)onTraitCollectionChange
{
  double v3 = [(ASCOfferButton *)self metadata];
  int v4 = [v3 isProgress];

  id v5 = [(ASCOfferButton *)self metadata];
  id v17 = v5;
  if (v4)
  {
    [v5 cancellable];
    if ([v17 isIndeterminate])
    {
      id v6 = [(ASCOfferButton *)self size];
      id v7 = [(ASCOfferButton *)self theme];
      +[ASCOfferButton indeterminateProgressImageFittingSize:forTheme:]((uint64_t)ASCOfferButton, v6, v7);
    }
    else
    {
      [v17 percent];
      double v9 = v8;
      id v6 = [(ASCOfferButton *)self size];
      id v7 = [(ASCOfferButton *)self theme];
      +[ASCOfferButton progressImageWithPercent:fittingSize:forTheme:cancellable:](v9, (uint64_t)ASCOfferButton, v6, v7);
    uint64_t v10 = };
    uint64_t v11 = [(ASCOfferButton *)self imageView];
    [v11 setImage:v10];

    char v12 = [(ASCOfferButton *)self imageView];
    [v12 setIsBackgroundForText:0];
  }
  else
  {
    if ([v5 isText])
    {
    }
    else
    {
      uint64_t v13 = [(ASCOfferButton *)self metadata];
      int v14 = [v13 isPlaceholder];

      if (!v14)
      {
        id v15 = [(ASCOfferButton *)self metadata];
        int v16 = [v15 isViewInAppStore];

        if (!v16) {
          return;
        }
      }
    }
    [(ASCOfferButton *)self updateLabelStyleProperties];
    [(ASCOfferButton *)self setNeedsLayout];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    double v8 = [v7 view];
    BOOL v9 = v8 != self && [v7 numberOfTouchesRequired] == 1 && objc_msgSend(v7, "numberOfTapsRequired") == 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return !v9;
}

- (id)makeLayout
{
  double v3 = [(ASCOfferButton *)self metadata];
  int v4 = [v3 isEmpty];

  if (v4)
  {
    id v5 = [(ASCOfferButton *)self imageView];
    id v6 = [(ASCOfferButton *)self titleLabelIfLoaded];
    id v7 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
    double v8 = +[__ASCLayoutProxy offerEmptyLayoutWithImageView:v5 titleView:v6 subtitleView:v7];

    goto LABEL_16;
  }
  BOOL v9 = [(ASCOfferButton *)self metadata];
  if ([v9 isText])
  {

LABEL_6:
    BOOL v12 = [(ASCOfferButton *)self subtitlePosition] == 1;
    id v5 = [(ASCOfferButton *)self size];
    uint64_t v13 = [(ASCOfferButton *)self imageView];
    int v14 = [(ASCOfferButton *)self titleLabel];
    id v15 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
    BOOL v16 = [(ASCOfferButton *)self shouldTopAlign];
    [(ASCOfferButton *)self topPadding];
    double v18 = v17;
    LOBYTE(v31) = [(ASCOfferButton *)self shouldExpandBackground];
    uint64_t v19 = +[__ASCLayoutProxy offerTextLayoutForSize:v5 titleBackgroundView:v13 titleView:v14 subtitleView:v15 hasTrailingSubtitle:v12 shouldTopAlign:v16 topPadding:v18 shouldExpandBackground:v31];
LABEL_15:
    double v8 = (void *)v19;

    goto LABEL_16;
  }
  uint64_t v10 = [(ASCOfferButton *)self metadata];
  int v11 = [v10 isPlaceholder];

  if (v11) {
    goto LABEL_6;
  }
  uint64_t v20 = [(ASCOfferButton *)self metadata];
  if ([v20 isIcon])
  {

LABEL_10:
    BOOL v23 = [(ASCOfferButton *)self subtitlePosition] == 1
       || [(ASCOfferButton *)self subtitlePosition] == 2;
    id v5 = [(ASCOfferButton *)self size];
    uint64_t v13 = [(ASCOfferButton *)self imageView];
    int v14 = [(ASCOfferButton *)self titleLabelIfLoaded];
    id v15 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
    BOOL v24 = [(ASCOfferButton *)self shouldTopAlign];
    [(ASCOfferButton *)self topPadding];
    LOBYTE(v31) = 0;
LABEL_14:
    uint64_t v19 = +[__ASCLayoutProxy offerIconLayoutForSize:imageView:titleView:subtitleView:hasTrailingSubtitle:shouldTopAlign:topPadding:shouldTrailingAlign:](__ASCLayoutProxy, "offerIconLayoutForSize:imageView:titleView:subtitleView:hasTrailingSubtitle:shouldTopAlign:topPadding:shouldTrailingAlign:", v5, v13, v14, v15, v23, v24, v31);
    goto LABEL_15;
  }
  uint64_t v21 = [(ASCOfferButton *)self metadata];
  int v22 = [v21 isProgress];

  if (v22) {
    goto LABEL_10;
  }
  uint64_t v26 = [(ASCOfferButton *)self metadata];
  int v27 = [v26 isDeeplink];

  if (v27)
  {
    BOOL v23 = 1;
    if ([(ASCOfferButton *)self subtitlePosition] != 1) {
      BOOL v23 = [(ASCOfferButton *)self subtitlePosition] == 2;
    }
    id v5 = [(ASCOfferButton *)self size];
    uint64_t v13 = [(ASCOfferButton *)self imageView];
    int v14 = [(ASCOfferButton *)self titleLabelIfLoaded];
    id v15 = [(ASCOfferButton *)self subtitleLabelIfLoaded];
    BOOL v24 = [(ASCOfferButton *)self shouldTopAlign];
    [(ASCOfferButton *)self topPadding];
    LOBYTE(v31) = 1;
    goto LABEL_14;
  }
  uint64_t v28 = [(ASCOfferButton *)self metadata];
  int v29 = [v28 isViewInAppStore];

  if (!v29)
  {
    id v30 = [(ASCOfferButton *)self metadata];
    ASCUnknownEnumCase(@"ASCOfferMetadata", v30);
  }
  id v5 = [(ASCOfferButton *)self titleLabel];
  double v8 = +[__ASCLayoutProxy offerDisclosureLayoutWithDisclosureIndicator:v5];
LABEL_16:

  return v8;
}

- (void)invalidateIntrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)ASCOfferButton;
  [(ASCOfferButton *)&v4 invalidateIntrinsicContentSize];
  if ([(ASCOfferButton *)self translatesAutoresizingMaskIntoConstraints])
  {
    double v3 = [(ASCOfferButton *)self superview];
    [v3 invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  -[ASCOfferButton sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(ASCOfferButton *)self makeLayout];
  id v7 = [(UIView *)self asc_layoutTraitEnvironment];
  objc_msgSend(v6, "measuredSizeFittingSize:inTraitEnvironment:", v7, width, height);
  double v9 = v8;
  double v11 = v10;

  if ([(ASCOfferButton *)self isFixedHeight])
  {
    BOOL v12 = [(ASCOfferButton *)self size];
    +[__ASCLayoutProxy offerButtonFixedHeightForSize:v12];
    double v11 = v13;
  }
  double v14 = v9;
  double v15 = v11;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v3 = [(ASCOfferButton *)self makeLayout];
  objc_super v4 = [(UIView *)self asc_layoutTraitEnvironment];
  [v3 alignmentInsetsInTraitEnvironment:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)ASCOfferButton;
  [(ASCOfferButton *)&v21 layoutSubviews];
  double v3 = [(ASCOfferButton *)self makeLayout];
  [(ASCOfferButton *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(ASCOfferButton *)self layoutMargins];
  double v13 = v5 + v12;
  double v15 = v7 + v14;
  double v17 = v9 - (v12 + v16);
  double v19 = v11 - (v14 + v18);
  uint64_t v20 = [(UIView *)self asc_layoutTraitEnvironment];
  objc_msgSend(v3, "placeChildrenRelativeToRect:inTraitEnvironment:", v20, v13, v15, v17, v19);
}

- (id)description
{
  double v3 = [[ASCDescriber alloc] initWithObject:self];
  double v4 = [(ASCOfferButton *)self theme];
  [(ASCDescriber *)v3 addObject:v4 withName:@"theme"];

  double v5 = [(ASCOfferButton *)self metadata];
  [(ASCDescriber *)v3 addObject:v5 withName:@"metadata"];

  double v6 = [(ASCDescriber *)v3 finalizeDescription];

  return v6;
}

- (ASCOfferTheme)theme
{
  return self->_theme;
}

- (ASCOfferMetadata)metadata
{
  return self->_metadata;
}

- (ASCOfferButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASCOfferButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)subtitlePosition
{
  return self->_subtitlePosition;
}

- (BOOL)isFixedHeight
{
  return self->_fixedHeight;
}

- (void)setFixedHeight:(BOOL)a3
{
  self->_fixeddouble Height = a3;
}

- (BOOL)shouldTopAlign
{
  return self->_shouldTopAlign;
}

- (void)setShouldTopAlign:(BOOL)a3
{
  self->_shouldTopAlign = a3;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (void)setTopPadding:(double)a3
{
  self->_topPadding = a3;
}

- (BOOL)shouldExpandBackground
{
  return self->_shouldExpandBackground;
}

- (void)setShouldExpandBackground:(BOOL)a3
{
  self->_shouldExpandBackground = a3;
}

- (NSString)size
{
  return self->_size;
}

- (ASCOfferButtonBackgroundImageView)imageView
{
  return self->_imageView;
}

- (UILabel)titleLabelIfLoaded
{
  return self->_titleLabelIfLoaded;
}

- (UILabel)subtitleLabelIfLoaded
{
  return self->_subtitleLabelIfLoaded;
}

- (ASCModalViewInteraction)modalInteraction
{
  return self->_modalInteraction;
}

- (void)setModalInteraction:(id)a3
{
}

- (UIViewPropertyAnimator)currentTransition
{
  return self->_currentTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_modalInteraction, 0);
  objc_storeStrong((id *)&self->_subtitleLabelIfLoaded, 0);
  objc_storeStrong((id *)&self->_titleLabelIfLoaded, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_theme, 0);
}

@end