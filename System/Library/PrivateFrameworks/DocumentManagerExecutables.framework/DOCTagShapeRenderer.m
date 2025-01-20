@interface DOCTagShapeRenderer
+ (DOCTagShapeRenderer)shared;
- (CGRect)_imageRectForRenderingImage:(id)a3 tagRect:(CGRect)a4 displayScale:(double)a5;
- (double)baselineOffsetForRequest:(id)a3 tagRectSize:(CGSize)a4;
- (id)_shapeImageForColorType:(int64_t)a3 variant:(unint64_t)a4 renderedColor:(id)a5;
- (void)renderInContext:(CGContext *)a3 contextSize:(CGSize)a4 tagRect:(CGRect)a5 tag:(id)a6 outlineColor:(id)a7 fillColor:(id)a8 traitCollection:(id)a9;
@end

@implementation DOCTagShapeRenderer

+ (DOCTagShapeRenderer)shared
{
  if (shared_onceToken_0 != -1) {
    dispatch_once(&shared_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)shared_instance;

  return (DOCTagShapeRenderer *)v2;
}

uint64_t __29__DOCTagShapeRenderer_shared__block_invoke()
{
  v0 = objc_alloc_init(DOCTagShapeRenderer);
  uint64_t v1 = shared_instance;
  shared_instance = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (void)renderInContext:(CGContext *)a3 contextSize:(CGSize)a4 tagRect:(CGRect)a5 tag:(id)a6 outlineColor:(id)a7 fillColor:(id)a8 traitCollection:(id)a9
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGFloat v16 = a4.height;
  CGFloat v17 = a4.width;
  id v20 = a7;
  id v21 = a9;
  if (a3)
  {
    id v22 = a8;
    id v23 = a6;
    v24 = +[DOCTagAppearance renderingAppearance];
    uint64_t v25 = [v23 labelIndex];

    v26 = [(DOCTagShapeRenderer *)self _shapeImageForColorType:v25 variant:0 renderedColor:v22];

    CGFloat v67 = v17;
    CGFloat v68 = v16;
    if (v26)
    {
      v27 = [(DOCTagShapeRenderer *)self _shapeImageForColorType:v25 variant:1 renderedColor:v20];
      int v28 = 0;
    }
    else
    {
      if (v20)
      {
        id v29 = v20;
      }
      else
      {
        id v29 = [MEMORY[0x263F3ABC0] nonClearNoneTagColor];
      }
      v30 = v29;
      v26 = [(DOCTagShapeRenderer *)self _shapeImageForColorType:v25 variant:1 renderedColor:v29];
      int v28 = [v24 outlineTagsToIndicateMixedState];

      v27 = 0;
    }
    [v21 displayScale];
    -[DOCTagShapeRenderer _imageRectForRenderingImage:tagRect:displayScale:](self, "_imageRectForRenderingImage:tagRect:displayScale:", v26, x, y, width, height);
    double v35 = v31;
    double v36 = v32;
    double v37 = v33;
    double v38 = v34;
    if (v27 || (double v39 = v34, v40 = v33, v41 = v32, v42 = v31, v28))
    {
      CGRect v78 = CGRectInset(*(CGRect *)&v31, 1.0, 1.0);
      double v42 = v78.origin.x;
      double v41 = v78.origin.y;
      double v40 = v78.size.width;
      double v39 = v78.size.height;
    }
    if (CGContextGetBlendMode() == 16)
    {
      id v43 = v26;
      [v43 size];
      double v45 = v40 / v44;
      [v43 size];
      if (v45 >= v39 / v46) {
        double v45 = v39 / v46;
      }
      [v43 contentInsets];
      double v48 = v47 * v45;
      double v50 = v49 * v45;
      double v52 = v51 * v45;
      double v54 = v53 * v45;
      CGFloat v55 = v42 + v50;
      CGFloat v56 = v41 + v48;
      CGFloat v57 = v40 - (v50 + v54);
      CGFloat v58 = v39 - (v48 + v52);
      v59 = [MEMORY[0x263F82770] defaultMetrics];
      [v59 scaledValueForValue:v21 compatibleWithTraitCollection:1.0];
      double v61 = v60;

      v79.origin.double x = v55;
      v79.origin.double y = v56;
      v79.size.double width = v57;
      v79.size.double height = v58;
      CGRectInset(v79, -v61, -v61);
      UIRectIntegralWithScale();
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      v69[2] = __102__DOCTagShapeRenderer_renderInContext_contextSize_tagRect_tag_outlineColor_fillColor_traitCollection___block_invoke;
      v69[3] = &unk_2648FB6D0;
      CGFloat v72 = v67;
      CGFloat v73 = v68;
      uint64_t v74 = v62;
      uint64_t v75 = v63;
      uint64_t v76 = v64;
      uint64_t v77 = v65;
      id v70 = v43;
      v71 = a3;
      id v66 = v43;
      CGContextSaveGState(a3);
      __102__DOCTagShapeRenderer_renderInContext_contextSize_tagRect_tag_outlineColor_fillColor_traitCollection___block_invoke((uint64_t)v69);
      CGContextRestoreGState(a3);
    }
    else
    {
      objc_msgSend(v26, "drawInRect:", v42, v41, v40, v39);
      if (v27) {
        objc_msgSend(v27, "drawInRect:", v35, v36, v37, v38);
      }
    }
  }
}

void __102__DOCTagShapeRenderer_renderInContext_contextSize_tagRect_tag_outlineColor_fillColor_traitCollection___block_invoke(uint64_t a1)
{
  CGContextTranslateCTM(*(CGContextRef *)(a1 + 40), 0.0, *(CGFloat *)(a1 + 56));
  CGContextScaleCTM(*(CGContextRef *)(a1 + 40), 1.0, -1.0);
  CGContextClipToMask(*(CGContextRef *)(a1 + 40), *(CGRect *)(a1 + 64), (CGImageRef)[*(id *)(a1 + 32) CGImage]);
  v2 = *(CGContext **)(a1 + 40);
  id v3 = [MEMORY[0x263F825C8] orangeColor];
  CGContextSetFillColorWithColor(v2, (CGColorRef)[v3 CGColor]);

  v4 = *(CGContext **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 88);

  CGContextFillRect(v4, *(CGRect *)&v5);
}

- (double)baselineOffsetForRequest:(id)a3 tagRectSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v7 = [a3 traitCollection];
  [v7 displayScale];
  double v9 = v8;

  v10 = [MEMORY[0x263F825C8] whiteColor];
  v11 = [(DOCTagShapeRenderer *)self _shapeImageForColorType:4 variant:0 renderedColor:v10];

  -[DOCTagShapeRenderer _imageRectForRenderingImage:tagRect:displayScale:](self, "_imageRectForRenderingImage:tagRect:displayScale:", v11, 0.0, 0.0, width, height, v9);
  [v11 size];
  [v11 baselineOffsetFromBottom];
  [v11 contentInsets];
  UIRoundToScale();
  double v13 = v12;

  return v13;
}

- (CGRect)_imageRectForRenderingImage:(id)a3 tagRect:(CGRect)a4 displayScale:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  [v9 contentInsets];
  if (v11 >= v13) {
    double v11 = v13;
  }
  if (v10 >= v12) {
    double v10 = v12;
  }
  if (v11 < v10) {
    double v10 = v11;
  }
  CGFloat v14 = -fmax(v10, 0.0);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGRect v29 = CGRectInset(v28, v14, v14);
  double v15 = v29.origin.x;
  double v16 = v29.origin.y;
  [v9 size];
  [v9 size];
  [v9 size];
  UIRoundToScale();
  double v18 = v17;
  [v9 size];

  UIRoundToScale();
  double v20 = v19;
  UIRoundToScale();
  double v22 = v15 + v21;
  UIRoundToScale();
  double v24 = v16 + v23;
  double v25 = v22;
  double v26 = v18;
  double v27 = v20;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v25;
  return result;
}

- (id)_shapeImageForColorType:(int64_t)a3 variant:(unint64_t)a4 renderedColor:(id)a5
{
  if (a5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263F827E8], "_doc_tagImageForRenderingVariant:differentiateWithShapes:tagColorType:renderedColor:", a4, 1, a3, a5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

@end