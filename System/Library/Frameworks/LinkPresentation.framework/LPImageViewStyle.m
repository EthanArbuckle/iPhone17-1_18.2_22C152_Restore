@interface LPImageViewStyle
- (BOOL)allowsPlatterPresentation;
- (BOOL)canAdjustVerticalPaddingForFixedSize;
- (BOOL)preservesEdgeAlignmentWhenScaling;
- (BOOL)requireFixedSize;
- (BOOL)scalesToFitParent;
- (BOOL)shouldApplyBackground;
- (LPImageViewStyle)init;
- (LPPadding)margin;
- (LPPadding)padding;
- (LPPointUnit)backgroundInset;
- (LPPointUnit)borderWidth;
- (LPPointUnit)cornerRadius;
- (LPPointUnit)fixedFallbackImageSize;
- (LPPointUnit)widthForUsingRegularSize;
- (LPShadowStyle)shadow;
- (LPSize)fixedSize;
- (LPSize)maximumSize;
- (LPSize)minimumSize;
- (NSNumber)fixedFallbackImageScale;
- (NSNumber)fixedFallbackImageWeight;
- (NSString)fixedFallbackImageFontTextStyle;
- (UIColor)backgroundColor;
- (UIColor)borderColor;
- (UIColor)maskColor;
- (UIFont)fixedFallbackImageFont;
- (double)darkeningAmount;
- (double)opacity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)emailCompatibleMargin;
- (int64_t)filter;
- (int64_t)scalingMode;
- (int64_t)verticalAlignment;
- (void)setAllowsPlatterPresentation:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundInset:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(id)a3;
- (void)setCanAdjustVerticalPaddingForFixedSize:(BOOL)a3;
- (void)setCornerRadius:(id)a3;
- (void)setDarkeningAmount:(double)a3;
- (void)setFilter:(int64_t)a3;
- (void)setFixedFallbackImageFont:(id)a3;
- (void)setFixedFallbackImageFontTextStyle:(id)a3;
- (void)setFixedFallbackImageScale:(id)a3;
- (void)setFixedFallbackImageSize:(id)a3;
- (void)setFixedFallbackImageWeight:(id)a3;
- (void)setFixedSize:(id)a3;
- (void)setMaskColor:(id)a3;
- (void)setMaximumSize:(id)a3;
- (void)setMinimumSize:(id)a3;
- (void)setOpacity:(double)a3;
- (void)setPreservesEdgeAlignmentWhenScaling:(BOOL)a3;
- (void)setRequireFixedSize:(BOOL)a3;
- (void)setScalesToFitParent:(BOOL)a3;
- (void)setScalingMode:(int64_t)a3;
- (void)setShadow:(id)a3;
- (void)setShouldApplyBackground:(BOOL)a3;
- (void)setVerticalAlignment:(int64_t)a3;
- (void)setWidthForUsingRegularSize:(id)a3;
@end

@implementation LPImageViewStyle

- (LPImageViewStyle)init
{
  v15.receiver = self;
  v15.super_class = (Class)LPImageViewStyle;
  v2 = [(LPImageViewStyle *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_requireFixedSize = 0;
    v4 = objc_alloc_init(LPPadding);
    margin = v3->_margin;
    v3->_margin = v4;

    v6 = objc_alloc_init(LPPadding);
    padding = v3->_padding;
    v3->_padding = v6;

    *(int64x2_t *)&v3->_scalingMode = vdupq_n_s64(1uLL);
    uint64_t v8 = +[LPPointUnit zero];
    backgroundInset = v3->_backgroundInset;
    v3->_backgroundInset = (LPPointUnit *)v8;

    uint64_t v10 = +[LPPointUnit zero];
    cornerRadius = v3->_cornerRadius;
    v3->_cornerRadius = (LPPointUnit *)v10;

    v3->_opacity = 1.0;
    v3->_verticalAlignment = 3;
    *(_DWORD *)&v3->_scalesToFitParent = 0;
    fixedFallbackImageScale = v3->_fixedFallbackImageScale;
    v3->_fixedFallbackImageScale = (NSNumber *)&unk_1EF712750;

    v13 = v3;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(LPSize *)self->_fixedSize copy];
    v6 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v5;

    uint64_t v7 = [(LPSize *)self->_minimumSize copy];
    uint64_t v8 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v7;

    *(unsigned char *)(v4 + 8) = self->_requireFixedSize;
    uint64_t v9 = [(LPPadding *)self->_margin copy];
    uint64_t v10 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = v9;

    uint64_t v11 = [(LPPadding *)self->_padding copy];
    v12 = *(void **)(v4 + 88);
    *(void *)(v4 + 88) = v11;

    *(void *)(v4 + 96) = self->_scalingMode;
    *(void *)(v4 + 104) = self->_filter;
    objc_storeStrong((id *)(v4 + 152), self->_backgroundColor);
    *(unsigned char *)(v4 + 13) = self->_shouldApplyBackground;
    objc_storeStrong((id *)(v4 + 160), self->_backgroundInset);
    objc_storeStrong((id *)(v4 + 168), self->_cornerRadius);
    *(double *)(v4 + 144) = self->_opacity;
    *(double *)(v4 + 176) = self->_darkeningAmount;
    objc_storeStrong((id *)(v4 + 136), self->_maskColor);
    *(void *)(v4 + 112) = self->_verticalAlignment;
    *(_WORD *)(v4 + 9) = self->_scalesToFitParent;
    objc_storeStrong((id *)(v4 + 128), self->_shadow);
    objc_storeStrong((id *)(v4 + 40), self->_fixedFallbackImageSize);
    objc_storeStrong((id *)(v4 + 48), self->_fixedFallbackImageWeight);
    objc_storeStrong((id *)(v4 + 56), self->_fixedFallbackImageFont);
    objc_storeStrong((id *)(v4 + 64), self->_fixedFallbackImageScale);
    objc_storeStrong((id *)(v4 + 72), self->_fixedFallbackImageFontTextStyle);
    *(unsigned char *)(v4 + 11) = self->_allowsPlatterPresentation;
    *(unsigned char *)(v4 + 12) = self->_canAdjustVerticalPaddingForFixedSize;
    objc_storeStrong((id *)(v4 + 120), self->_widthForUsingRegularSize);
    objc_storeStrong((id *)(v4 + 184), self->_borderWidth);
    objc_storeStrong((id *)(v4 + 192), self->_borderColor);
    id v13 = (id)v4;
  }

  return (id)v4;
}

- (id)emailCompatibleMargin
{
  return self->_margin;
}

- (LPSize)fixedSize
{
  return self->_fixedSize;
}

- (void)setFixedSize:(id)a3
{
}

- (BOOL)requireFixedSize
{
  return self->_requireFixedSize;
}

- (void)setRequireFixedSize:(BOOL)a3
{
  self->_requireFixedSize = a3;
}

- (LPSize)minimumSize
{
  return self->_minimumSize;
}

- (void)setMinimumSize:(id)a3
{
}

- (LPSize)maximumSize
{
  return self->_maximumSize;
}

- (void)setMaximumSize:(id)a3
{
}

- (LPPointUnit)fixedFallbackImageSize
{
  return self->_fixedFallbackImageSize;
}

- (void)setFixedFallbackImageSize:(id)a3
{
}

- (NSNumber)fixedFallbackImageWeight
{
  return self->_fixedFallbackImageWeight;
}

- (void)setFixedFallbackImageWeight:(id)a3
{
}

- (UIFont)fixedFallbackImageFont
{
  return self->_fixedFallbackImageFont;
}

- (void)setFixedFallbackImageFont:(id)a3
{
}

- (NSNumber)fixedFallbackImageScale
{
  return self->_fixedFallbackImageScale;
}

- (void)setFixedFallbackImageScale:(id)a3
{
}

- (NSString)fixedFallbackImageFontTextStyle
{
  return self->_fixedFallbackImageFontTextStyle;
}

- (void)setFixedFallbackImageFontTextStyle:(id)a3
{
}

- (LPPadding)margin
{
  return self->_margin;
}

- (LPPadding)padding
{
  return self->_padding;
}

- (int64_t)scalingMode
{
  return self->_scalingMode;
}

- (void)setScalingMode:(int64_t)a3
{
  self->_scalingMode = a3;
}

- (int64_t)filter
{
  return self->_filter;
}

- (void)setFilter:(int64_t)a3
{
  self->_filter = a3;
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (void)setVerticalAlignment:(int64_t)a3
{
  self->_verticalAlignment = a3;
}

- (BOOL)scalesToFitParent
{
  return self->_scalesToFitParent;
}

- (void)setScalesToFitParent:(BOOL)a3
{
  self->_scalesToFitParent = a3;
}

- (BOOL)preservesEdgeAlignmentWhenScaling
{
  return self->_preservesEdgeAlignmentWhenScaling;
}

- (void)setPreservesEdgeAlignmentWhenScaling:(BOOL)a3
{
  self->_preservesEdgeAlignmentWhenScaling = a3;
}

- (LPPointUnit)widthForUsingRegularSize
{
  return self->_widthForUsingRegularSize;
}

- (void)setWidthForUsingRegularSize:(id)a3
{
}

- (LPShadowStyle)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
}

- (UIColor)maskColor
{
  return self->_maskColor;
}

- (void)setMaskColor:(id)a3
{
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (BOOL)allowsPlatterPresentation
{
  return self->_allowsPlatterPresentation;
}

- (void)setAllowsPlatterPresentation:(BOOL)a3
{
  self->_allowsPlatterPresentation = a3;
}

- (BOOL)canAdjustVerticalPaddingForFixedSize
{
  return self->_canAdjustVerticalPaddingForFixedSize;
}

- (void)setCanAdjustVerticalPaddingForFixedSize:(BOOL)a3
{
  self->_canAdjustVerticalPaddingForFixedSize = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (BOOL)shouldApplyBackground
{
  return self->_shouldApplyBackground;
}

- (void)setShouldApplyBackground:(BOOL)a3
{
  self->_shouldApplyBackground = a3;
}

- (LPPointUnit)backgroundInset
{
  return self->_backgroundInset;
}

- (void)setBackgroundInset:(id)a3
{
}

- (LPPointUnit)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(id)a3
{
}

- (double)darkeningAmount
{
  return self->_darkeningAmount;
}

- (void)setDarkeningAmount:(double)a3
{
  self->_darkeningAmount = a3;
}

- (LPPointUnit)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(id)a3
{
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_borderWidth, 0);
  objc_storeStrong((id *)&self->_cornerRadius, 0);
  objc_storeStrong((id *)&self->_backgroundInset, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_maskColor, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_widthForUsingRegularSize, 0);
  objc_storeStrong((id *)&self->_padding, 0);
  objc_storeStrong((id *)&self->_margin, 0);
  objc_storeStrong((id *)&self->_fixedFallbackImageFontTextStyle, 0);
  objc_storeStrong((id *)&self->_fixedFallbackImageScale, 0);
  objc_storeStrong((id *)&self->_fixedFallbackImageFont, 0);
  objc_storeStrong((id *)&self->_fixedFallbackImageWeight, 0);
  objc_storeStrong((id *)&self->_fixedFallbackImageSize, 0);
  objc_storeStrong((id *)&self->_maximumSize, 0);
  objc_storeStrong((id *)&self->_minimumSize, 0);

  objc_storeStrong((id *)&self->_fixedSize, 0);
}

@end