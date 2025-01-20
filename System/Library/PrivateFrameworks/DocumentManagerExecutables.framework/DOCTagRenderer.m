@interface DOCTagRenderer
+ (BOOL)allowUnsizedSymbolImages;
+ (DOCTagRenderer)shared;
- (BOOL)differentiateWithShapes;
- (CGSize)sizeOfTagContentForRenderingRequest:(id)a3;
- (double)_customRenderingBaselineOffsetFromBottomForRequest:(id)a3;
- (double)_defaultBorderWidth;
- (double)_tagChainSpacingForSpacingType:(unint64_t)a3 tagDimension:(double)a4;
- (id)_spacerImageWithWidth:(double)a3;
- (id)_symbolImageIfPosssibleForRequest:(id)a3;
- (id)renderAttributedStringWithRequest:(id)a3;
- (id)renderImageWithRequest:(id)a3;
- (id)tintedSystemImageForTag:(id)a3;
- (void)__drawInContext:(CGContext *)a3 tag:(id)a4 contextSize:(CGSize)a5 tagRect:(CGRect)a6 blendMode:(int)a7 fillColor:(id)a8 strokeColor:(id)a9 traitCollection:(id)a10;
- (void)_insertPrefixTextAttachment:(id)a3 spacerAttributedString:(id)a4 ensuringLayoutDirection:(int64_t)a5 into:(id)a6;
- (void)_renderInContext:(CGContext *)a3 request:(id)a4;
- (void)renderInUncacheableContext:(CGContext *)a3 request:(id)a4;
@end

@implementation DOCTagRenderer

+ (DOCTagRenderer)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global);
  }
  v2 = (void *)shared_shared;

  return (DOCTagRenderer *)v2;
}

- (void)_renderInContext:(CGContext *)a3 request:(id)a4
{
  id v5 = a4;
  v6 = [v5 tags];
  uint64_t v7 = [v6 count];
  v8 = [v5 fillColors];
  uint64_t v9 = [v8 count];

  if (v7 == v9)
  {
    [(DOCTagRenderer *)self sizeOfTagContentForRenderingRequest:v5];
    double v11 = v10;
    v12 = [v5 traitCollection];
    uint64_t v13 = [v5 spacingType];
    v51 = [v5 tags];
    v14 = [v5 fillColors];
    v49 = [v5 ringColor];
    v15 = [v5 selectionOutlineColor];
    id v46 = v5;
    [v5 knockOutBorderWidth];
    double v48 = v16;
    v50 = v14;
    uint64_t v17 = [v14 count];
    if (v17)
    {
      uint64_t v18 = v17;
      [v5 tagDimension];
      -[DOCTagRenderer _tagChainSpacingForSpacingType:tagDimension:](self, "_tagChainSpacingForSpacingType:tagDimension:", v13);
      double v20 = v19;
      if ([v5 layoutDirection] == 1)
      {
        [(DOCTagRenderer *)self sizeOfTagContentForRenderingRequest:v5];
        double v22 = v21;
        memset(&v55, 0, sizeof(v55));
        CGAffineTransformMakeScale(&v55, -1.0, 1.0);
        CGAffineTransform transform = v55;
        memset(&v54, 0, sizeof(v54));
        CGAffineTransformTranslate(&v54, &transform, -v22, 0.0);
        CGAffineTransform transform = v54;
        CGContextConcatCTM(a3, &transform);
      }
      unint64_t v23 = v18 - 1;
      if (v18 - 1 >= 0)
      {
        double v47 = v20;
        double v24 = 0.0;
        double v25 = v11;
        do
        {
          v26 = [v51 objectAtIndexedSubscript:--v18];
          v27 = [v50 objectAtIndexedSubscript:v18];
          double x = v20 * (double)v18;
          if (v18 < v23)
          {
            v56.origin.double x = v20 * (double)v18;
            v56.origin.double y = v24;
            v56.size.double width = v11;
            v56.size.CGFloat height = v25;
            CGRect v57 = CGRectInset(v56, -v48, -v48);
            double y = v57.origin.y;
            double width = v57.size.width;
            CGFloat height = v57.size.height;
            v32 = [MEMORY[0x263F825C8] whiteColor];
            double v33 = height;
            double v20 = v47;
            -[DOCTagRenderer __drawInContext:tag:contextSize:tagRect:blendMode:fillColor:strokeColor:traitCollection:](self, "__drawInContext:tag:contextSize:tagRect:blendMode:fillColor:strokeColor:traitCollection:", a3, v26, 16, v32, 0, v12, v11, v25, x - v48, y, width, v33);
          }
          id v34 = v27;
          double Alpha = CGColorGetAlpha((CGColorRef)[v34 CGColor]);
          double v36 = Alpha;
          if (Alpha == 0.0) {
            v37 = 0;
          }
          else {
            v37 = v34;
          }
          if (Alpha == 0.0) {
            v38 = v49;
          }
          else {
            v38 = v15;
          }
          id v39 = v37;
          id v40 = v38;
          if (v36 == 0.0 && v15 != 0)
          {
            [(DOCTagRenderer *)self _defaultBorderWidth];
            double v43 = v42;
            if ([(DOCTagRenderer *)self differentiateWithShapes])
            {
              v44 = [MEMORY[0x263F82770] defaultMetrics];
              [v44 scaledValueForValue:v12 compatibleWithTraitCollection:1.0];
              double v43 = v43 + v45;
            }
            v58.origin.double x = x;
            v58.origin.double y = v24;
            v58.size.double width = v11;
            v58.size.CGFloat height = v25;
            CGRect v59 = CGRectInset(v58, v43, v43);
            double x = v59.origin.x;
            double v24 = v59.origin.y;
            double v11 = v59.size.width;
            double v25 = v59.size.height;
          }
          -[DOCTagRenderer __drawInContext:tag:contextSize:tagRect:blendMode:fillColor:strokeColor:traitCollection:](self, "__drawInContext:tag:contextSize:tagRect:blendMode:fillColor:strokeColor:traitCollection:", a3, v26, 17, v39, v40, v12, v11, v25, x, v24, v11, v25);
        }
        while (v18 > 0);
      }
    }

    id v5 = v46;
  }
  else
  {
    v12 = [NSString stringWithFormat:@"Unexpected input: tag/color count mismatch"];
    v51 = DOCLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
      -[DOCTagRenderer renderImageWithRequest:](v12);
    }
  }
}

- (CGSize)sizeOfTagContentForRenderingRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 tags];
  unint64_t v6 = [v5 count];

  if (v6)
  {
    double v7 = (double)v6;
    [v4 tagDimension];
    [(DOCTagRenderer *)self differentiateWithShapes];
    v8 = [v4 traitCollection];
    [v8 displayScale];
    UIRoundToScale();
    double v10 = v9;

    uint64_t v11 = [v4 spacingType];
    [v4 tagDimension];
    -[DOCTagRenderer _tagChainSpacingForSpacingType:tagDimension:](self, "_tagChainSpacingForSpacingType:tagDimension:", v11);
    double v13 = v10 + (v7 + -1.0) * v12;
    v14 = [v4 selectionOutlineColor];

    if (v14)
    {
      [(DOCTagRenderer *)self _defaultBorderWidth];
      double v13 = v13 + v15;
      double v10 = v10 + v15;
    }
  }
  else
  {
    double v13 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v16 = v13;
  double v17 = v10;
  result.CGFloat height = v17;
  result.double width = v16;
  return result;
}

- (BOOL)differentiateWithShapes
{
  if (differentiateWithShapes_onceToken != -1) {
    dispatch_once(&differentiateWithShapes_onceToken, &__block_literal_global_2);
  }
  if (differentiateWithShapes_alwaysUseShapes) {
    return 1;
  }

  return UIAccessibilityShouldDifferentiateWithoutColor();
}

- (double)_tagChainSpacingForSpacingType:(unint64_t)a3 tagDimension:(double)a4
{
  double v4 = 0.4;
  if (a3 != 1) {
    double v4 = 0.5625;
  }
  float v5 = v4 * a4;
  return ceilf(v5);
}

- (void)__drawInContext:(CGContext *)a3 tag:(id)a4 contextSize:(CGSize)a5 tagRect:(CGRect)a6 blendMode:(int)a7 fillColor:(id)a8 strokeColor:(id)a9 traitCollection:(id)a10
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v18 = a5.height;
  double v19 = a5.width;
  id v29 = a4;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  CGContextSetBlendMode(a3, (CGBlendMode)a7);
  if ([(DOCTagRenderer *)self differentiateWithShapes])
  {
    id v25 = +[DOCTagShapeRenderer shared];
    objc_msgSend(v25, "renderInContext:contextSize:tagRect:tag:outlineColor:fillColor:traitCollection:", a3, v29, v23, v22, v24, v19, v18, x, y, width, height);
  }
  else
  {
    [(DOCTagRenderer *)self _defaultBorderWidth];
    double v27 = v26;
    if (v23)
    {
      CGFloat v28 = v26 * 0.5;
      v31.origin.double x = x;
      v31.origin.double y = y;
      v31.size.double width = width;
      v31.size.double height = height;
      CGRect v32 = CGRectInset(v31, v28, v27 * 0.5);
      double x = v32.origin.x;
      double y = v32.origin.y;
      double width = v32.size.width;
      double height = v32.size.height;
    }
    objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", x, y, width, height);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      CGContextSetFillColorWithColor(a3, (CGColorRef)[v22 CGColor]);
      CGContextAddPath(a3, (CGPathRef)[v25 CGPath]);
      CGContextFillPath(a3);
    }
    if (v23)
    {
      CGContextSetLineWidth(a3, v27);
      CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v23 CGColor]);
      id v25 = v25;
      CGContextAddPath(a3, (CGPathRef)[v25 CGPath]);
      CGContextStrokePath(a3);
    }
  }
}

- (double)_defaultBorderWidth
{
  v2 = +[DOCTagAppearance renderingAppearance];
  [v2 defaultBorderWidth];
  double v4 = v3;

  return v4;
}

- (id)renderImageWithRequest:(id)a3
{
  v24[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 traitCollection];
    [v6 displayScale];
    double v8 = v7;
    double v9 = [NSNumber numberWithBool:UIAccessibilityIsInvertColorsEnabled()];
    v24[0] = v9;
    double v10 = objc_msgSend(NSNumber, "numberWithBool:", -[DOCTagRenderer differentiateWithShapes](self, "differentiateWithShapes"));
    v24[1] = v10;
    uint64_t v11 = [NSNumber numberWithDouble:v8];
    v24[2] = v11;
    double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];

    double v13 = [(DOCTagRenderer *)self _symbolImageIfPosssibleForRequest:v5];
    v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      double v16 = (void *)MEMORY[0x263F827E8];
      double v17 = [v5 _UIImageCacheKeyWithAdditionalComponents:v12];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __41__DOCTagRenderer_renderImageWithRequest___block_invoke;
      v21[3] = &unk_2648FB438;
      v21[4] = self;
      id v22 = v5;
      double v23 = v8;
      id v15 = [v16 _cachedImageForKey:v17 fromBlock:v21];
    }
  }
  else
  {
    double v19 = [NSString stringWithFormat:@"Invalid parameter"];
    double v20 = DOCLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[DOCTagRenderer renderImageWithRequest:](v19);
    }

    id v15 = objc_alloc_init(MEMORY[0x263F827E8]);
  }

  return v15;
}

- (id)_symbolImageIfPosssibleForRequest:(id)a3
{
  id v4 = a3;
  if (!+[DOCTagRenderer allowUnsizedSymbolImages]) {
    goto LABEL_9;
  }
  if (![v4 allowUnsizedSymbolImages]) {
    goto LABEL_9;
  }
  uint64_t v5 = [v4 selectionOutlineColor];
  if (v5)
  {
    unint64_t v6 = (void *)v5;
    id v7 = [v4 selectionOutlineColor];
    double Alpha = CGColorGetAlpha((CGColorRef)[v7 CGColor]);

    if (Alpha != 0.0) {
      goto LABEL_9;
    }
  }
  double v9 = [v4 tags];
  uint64_t v10 = [v9 count];

  if (v10 != 1) {
    goto LABEL_9;
  }
  uint64_t v11 = [v4 tags];
  uint64_t v12 = [v11 count];
  double v13 = [v4 fillColors];
  uint64_t v14 = [v13 count];

  if (v12 == v14)
  {
    id v15 = [v4 tags];
    double v16 = [v15 objectAtIndexedSubscript:0];

    double v17 = [v4 fillColors];
    double v18 = [v17 objectAtIndexedSubscript:0];

    double v19 = [v4 ringColor];
    BOOL v20 = [(DOCTagRenderer *)self differentiateWithShapes];
    id v21 = v18;
    if (CGColorGetAlpha((CGColorRef)[v21 CGColor]) == 0.0)
    {
      uint64_t v22 = 1;
      double v23 = v19;
    }
    else
    {
      uint64_t v22 = [v4 variant];
      double v23 = v21;
    }
    id v26 = v23;
    double v27 = [[DOCTagSymbolImageConfiguration alloc] initWithTag:v16 color:v26 variant:v22 differentiateWithShapes:v20];

    id v24 = [(DOCTagSymbolImageConfiguration *)v27 loadedImageForSettings];
  }
  else
  {
LABEL_9:
    id v24 = 0;
  }

  return v24;
}

+ (BOOL)allowUnsizedSymbolImages
{
  return 0;
}

void __41__DOCTagRenderer_differentiateWithShapes__block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  differentiateWithShapes_alwaysUseShapes = [v0 BOOLForKey:@"DOCTagsRenderWithShapes"];
}

id __41__DOCTagRenderer_renderImageWithRequest___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) sizeOfTagContentForRenderingRequest:*(void *)(a1 + 40)];
  UIGraphicsBeginImageContextWithOptions(v9, 0, *(CGFloat *)(a1 + 48));
  [*(id *)(a1 + 32) _renderInContext:UIGraphicsGetCurrentContext() request:*(void *)(a1 + 40)];
  v2 = UIGraphicsGetImageFromCurrentImageContext();
  [*(id *)(a1 + 32) _customRenderingBaselineOffsetFromBottomForRequest:*(void *)(a1 + 40)];
  if (v3 != -1.79769313e308)
  {
    uint64_t v4 = objc_msgSend(v2, "imageWithBaselineOffsetFromBottom:");

    v2 = (void *)v4;
  }
  UIGraphicsEndImageContext();
  if (v2) {
    id v5 = v2;
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x263F827E8]);
  }
  unint64_t v6 = v5;

  return v6;
}

- (double)_customRenderingBaselineOffsetFromBottomForRequest:(id)a3
{
  id v4 = a3;
  if ([(DOCTagRenderer *)self differentiateWithShapes])
  {
    [(DOCTagRenderer *)self sizeOfTagContentForRenderingRequest:v4];
    double v6 = v5;
    double v8 = v7;
    CGSize v9 = +[DOCTagShapeRenderer shared];
    objc_msgSend(v9, "baselineOffsetForRequest:tagRectSize:", v4, v6, v8);
    double v11 = v10;
  }
  else
  {
    double v11 = -1.79769313e308;
  }

  return v11;
}

uint64_t __24__DOCTagRenderer_shared__block_invoke()
{
  shared_shared = objc_alloc_init(DOCTagRenderer);

  return MEMORY[0x270F9A758]();
}

- (id)tintedSystemImageForTag:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DOCTagRenderer *)self differentiateWithShapes];
  uint64_t v6 = [v4 labelIndex];

  double v7 = (void *)MEMORY[0x263F827E8];

  return (id)objc_msgSend(v7, "_doc_tagImageForRenderingVariant:differentiateWithShapes:tagColorType:", 0, v5, v6);
}

- (void)renderInUncacheableContext:(CGContext *)a3 request:(id)a4
{
  id v7 = a4;
  if (UIGraphicsGetCurrentContext())
  {
    [(DOCTagRenderer *)self _renderInContext:a3 request:v7];
  }
  else
  {
    UIGraphicsPushContext(a3);
    [v7 tagDimension];
    CGContextTranslateCTM(a3, 0.0, v6);
    CGContextScaleCTM(a3, 1.0, -1.0);
    [(DOCTagRenderer *)self _renderInContext:a3 request:v7];
    UIGraphicsPopContext();
  }
}

- (id)renderAttributedStringWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    CGFloat v6 = [v4 text];
    id v7 = [v5 textAttributes];
    double v8 = +[DOCTagRenderer shared];
    CGSize v9 = [v8 renderImageWithRequest:v5];

    [v5 tagBaselineAdjustment];
    double v11 = v10;
    if ([(DOCTagRenderer *)self differentiateWithShapes])
    {
      [v9 baselineOffsetFromBottom];
      double v11 = v11 - v12;
    }
    int v13 = [v9 isSymbolImage];
    [v9 size];
    double v16 = v15;
    if (v13)
    {
      [v9 size];
      double v18 = v16 / v17;
      BOOL v19 = v16 / v17 <= 0.0;
      if (v16 / v17 <= 0.0) {
        double v20 = v16 / v17;
      }
      else {
        double v20 = 1.0;
      }
      double v21 = 1.0 / v18;
      if (v19) {
        double v22 = 1.0;
      }
      else {
        double v22 = v21;
      }
      [v5 tagDimension];
      double v16 = v23 * v20;
      [v5 tagDimension];
      double v25 = v24 * v22;
    }
    else
    {
      double v25 = v14;
    }
    id v26 = objc_opt_new();
    [v26 setImage:v9];
    objc_msgSend(v26, "setBounds:", 0.0, v11, v16, v25);
    double v27 = objc_opt_new();
    [v5 tagToTitleSpacing];
    CGFloat v28 = -[DOCTagRenderer _spacerImageWithWidth:](self, "_spacerImageWithWidth:");
    [v27 setImage:v28];

    id v29 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v6 attributes:v7];
    v30 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v27];
    -[DOCTagRenderer _insertPrefixTextAttachment:spacerAttributedString:ensuringLayoutDirection:into:](self, "_insertPrefixTextAttachment:spacerAttributedString:ensuringLayoutDirection:into:", v26, v30, [v5 layoutDirection], v29);
  }
  else
  {
    CGRect v32 = [NSString stringWithFormat:@"Invalid parameter"];
    double v33 = DOCLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      -[DOCTagRenderer renderImageWithRequest:](v32);
    }

    id v29 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:&stru_26DF49380];
  }

  return v29;
}

- (id)_spacerImageWithWidth:(double)a3
{
  if (a3 <= 0.0)
  {
    double v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"DOCTagRenderer.m" lineNumber:345 description:@"Requesting spacer image with zero size."];
  }
  if (_spacerImageWithWidth__onceToken != -1) {
    dispatch_once(&_spacerImageWithWidth__onceToken, &__block_literal_global_35);
  }
  id v4 = (void *)_spacerImageWithWidth___spacerImageCache;
  BOOL v5 = [NSNumber numberWithDouble:a3];
  CGFloat v6 = [v4 objectForKey:v5];

  if (!v6)
  {
    v14.double height = 1.0;
    v14.double width = a3;
    UIGraphicsBeginImageContextWithOptions(v14, 0, 1.0);
    CGFloat v6 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    id v7 = (void *)_spacerImageWithWidth___spacerImageCache;
    double v8 = [NSNumber numberWithDouble:a3];
    [v7 setObject:v6 forKey:v8];
  }

  return v6;
}

uint64_t __40__DOCTagRenderer__spacerImageWithWidth___block_invoke()
{
  _spacerImageWithWidth___spacerImageCache = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (void)_insertPrefixTextAttachment:(id)a3 spacerAttributedString:(id)a4 ensuringLayoutDirection:(int64_t)a5 into:(id)a6
{
  CGSize v9 = (void *)MEMORY[0x263F086A0];
  id v10 = a6;
  id v11 = a4;
  id v16 = [v9 attributedStringWithAttachment:a3];
  id v12 = objc_alloc_init(MEMORY[0x263F089B8]);
  int v13 = +[DOCUnicode nonBreakingSpace_zeroWidth];
  [v12 appendUnicode:v13];

  [v12 appendAttributedString:v16];
  CGSize v14 = +[DOCUnicode nonBreakingSpace_zeroWidth];
  [v12 appendUnicode:v14];

  [v12 appendAttributedString:v11];
  double v15 = +[DOCUnicode nonBreakingSpace_zeroWidth];
  [v12 appendUnicode:v15];

  [v10 wrapInDirectionalIsolation:0];
  [v10 insertAttributedString:v12 atIndex:0];
  objc_msgSend(v10, "wrapInDirectionalIsolation:", +[DOCUnicode layoutDirectionForUIDirection:](_TtC26DocumentManagerExecutables10DOCUnicode, "layoutDirectionForUIDirection:", a5));
}

- (void)renderImageWithRequest:(void *)a1 .cold.1(void *a1)
{
  [a1 UTF8String];
  OUTLINED_FUNCTION_0(&dword_22BDC5000, v1, v2, "%s", v3, v4, v5, v6, 2u);
}

@end