@interface AKLoupeAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGRect)innerClipRect:(id)a3;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
@end

@implementation AKLoupeAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v3 = a3;
  [v3 rectangle];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v3 strokeWidth];
  CGFloat v13 = v12 * -0.5;
  v30.origin.double x = v5;
  v30.origin.double y = v7;
  v30.size.double width = v9;
  v30.size.double height = v11;
  CGRect v31 = CGRectInset(v30, v13, v13);
  double x = v31.origin.x;
  double y = v31.origin.y;
  double width = v31.size.width;
  double height = v31.size.height;
  if ([v3 hasShadow])
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v3, x, y, width, height);
    double x = v18;
    double y = v19;
    double width = v20;
    double height = v21;
  }
  v32.origin.double x = x;
  v32.origin.double y = y;
  v32.size.double width = width;
  v32.size.double height = height;
  CGRect v33 = CGRectInset(v32, -1.0, -1.0);
  CGFloat v22 = v33.origin.x;
  CGFloat v23 = v33.origin.y;
  CGFloat v24 = v33.size.width;
  CGFloat v25 = v33.size.height;

  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  double v29 = v25;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.double height = v4;
  result.double width = v3;
  return result;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  BOOL v7 = a5;
  v66[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  CGContextSaveGState(a4);
  [a1 _transformContextToModelCoordinates:a4 forAnnotation:v10 forDisplay:v7 pageControllerOrNil:v11];

  int v12 = [v10 hasShadow];
  if (v12) {
    +[AKAnnotationRendererUtilities beginShadowInContext:a4 forAnnotation:v10];
  }
  [v10 rectangle];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v21 = objc_getAssociatedObject(v10, off_268922A80);
  if (v21)
  {
    objc_setAssociatedObject(v10, @"AKLoupeAnnotationRendererPDFDocumentWrapperDict", 0, (void *)0x301);
    Page = 0;
LABEL_5:
    CGContextSaveGState(a4);
    [(id)objc_opt_class() innerClipRect:v10];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    id v31 = [MEMORY[0x263F1C550] clearColor];
    CGContextSetFillColorWithColor(a4, (CGColorRef)[v31 CGColor]);

    v67.origin.CGFloat x = v14;
    v67.origin.CGFloat y = v16;
    v67.size.CGFloat width = v18;
    v67.size.CGFloat height = v20;
    CGContextFillRect(a4, v67);
    v68.origin.CGFloat x = v24;
    v68.origin.CGFloat y = v26;
    v68.size.CGFloat width = v28;
    v68.size.CGFloat height = v30;
    CGContextAddEllipseInRect(a4, v68);
    CGContextClip(a4);
    id v32 = [v10 strokeColor];
    CGRect v33 = (CGColor *)[v32 CGColor];

    if (!v33 || vabdd_f64(0.0, CGColorGetAlpha(v33)) < 0.0005)
    {
      id v34 = [MEMORY[0x263F1C550] grayColor];
      CGRect v33 = (CGColor *)[v34 CGColor];
    }
    CGContextSetStrokeColorWithColor(a4, v33);
    v69.origin.CGFloat x = v14;
    v69.origin.CGFloat y = v16;
    v69.size.CGFloat width = v18;
    v69.size.CGFloat height = v20;
    CGContextStrokeEllipseInRect(a4, v69);
    if (v21)
    {
      CGContextSetInterpolationQuality(a4, kCGInterpolationNone);
      v35 = (CGImage *)[v21 akCGImage];
      v70.origin.CGFloat x = v14;
      v70.origin.CGFloat y = v16;
      v70.size.CGFloat width = v18;
      v70.size.CGFloat height = v20;
      CGContextDrawImage(a4, v70, v35);
    }
    else
    {
      CGContextSaveGState(a4);
      v71.origin.CGFloat x = v24;
      v71.origin.CGFloat y = v26;
      v71.size.CGFloat width = v28;
      v71.size.CGFloat height = v30;
      CGRect v72 = CGRectInset(v71, 0.1, 0.1);
      CGContextAddEllipseInRect(a4, v72);
      CGContextClip(a4);
      id v47 = [MEMORY[0x263F1C550] whiteColor];
      CGContextSetFillColorWithColor(a4, (CGColorRef)[v47 CGColor]);

      v73.origin.CGFloat x = v14;
      v73.origin.CGFloat y = v16;
      v73.size.CGFloat width = v18;
      v73.size.CGFloat height = v20;
      CGContextFillRect(a4, v73);
      CGContextRestoreGState(a4);
      v74.origin.CGFloat x = v14;
      v74.origin.CGFloat y = v16;
      v74.size.CGFloat width = v18;
      v74.size.CGFloat height = v20;
      CGFloat MinX = CGRectGetMinX(v74);
      v75.origin.CGFloat x = v14;
      v75.origin.CGFloat y = v16;
      v75.size.CGFloat width = v18;
      v75.size.CGFloat height = v20;
      CGFloat MinY = CGRectGetMinY(v75);
      CGContextTranslateCTM(a4, MinX, MinY);
      CGInterpolationQuality v50 = kCGInterpolationNone;
      CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
      CGFloat x = BoxRect.origin.x;
      CGFloat y = BoxRect.origin.y;
      CGFloat width = BoxRect.size.width;
      CGFloat height = BoxRect.size.height;
      CGContextScaleCTM(a4, v18 / BoxRect.size.width, v20 / BoxRect.size.height);
      v77.origin.CGFloat x = x;
      v77.origin.CGFloat y = y;
      v77.size.CGFloat width = width;
      v77.size.CGFloat height = height;
      CGContextClipToRect(a4, v77);
      [v10 magnification];
      if (v55 < 3.0)
      {
        [v10 magnification];
        if (v56 == 2.0) {
          CGInterpolationQuality v50 = kCGInterpolationNone;
        }
        else {
          CGInterpolationQuality v50 = kCGInterpolationHigh;
        }
      }
      CGContextSetInterpolationQuality(a4, v50);
      CGContextSetShouldSmoothFonts(a4, 0);
      CGContextSetShouldSubpixelPositionFonts(a4, 1);
      CGContextSetShouldSubpixelQuantizeFonts(a4, 1);
      CGContextDrawPDFPage(a4, Page);
    }
    CGContextRestoreGState(a4);
    goto LABEL_28;
  }
  CFDataRef v36 = [v10 imageData];
  v37 = objc_getAssociatedObject(v10, @"AKLoupeAnnotationRendererPDFDocumentWrapperDict");
  v38 = v37;
  if (!v37
    || ([v37 objectForKey:@"imageData"],
        CFDataRef v39 = (const __CFData *)objc_claimAutoreleasedReturnValue(),
        v39,
        v39 != v36))
  {
    if (v36)
    {
      v40 = CGDataProviderCreateWithCFData(v36);
      if (v40)
      {
        v41 = v40;
        v42 = CGPDFDocumentCreateWithProvider(v40);
        CGDataProviderRelease(v41);
        if (v42)
        {
          v43 = [[AKPDFDocumentWrapper alloc] initWithPDF:v42];
          CGPDFDocumentRelease(v42);
          v65[0] = @"imageData";
          v65[1] = @"pdfDocumentWrapper";
          v66[0] = v36;
          v66[1] = v43;
          v44 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];

          objc_setAssociatedObject(v10, @"AKLoupeAnnotationRendererPDFDocumentWrapperDict", v44, (void *)0x301);
          v38 = v44;
        }
      }
    }
    if (!v38) {
      goto LABEL_21;
    }
  }
  v45 = [v38 objectForKey:@"pdfDocumentWrapper"];
  v46 = (CGPDFDocument *)[v45 pdfDocument];

  if (!v46 || !CGPDFDocumentGetNumberOfPages(v46))
  {
LABEL_21:

    goto LABEL_28;
  }
  Page = CGPDFDocumentGetPage(v46, 1uLL);

  if (Page) {
    goto LABEL_5;
  }
LABEL_28:
  v57 = [v10 strokeColor];

  if (v57)
  {
    if (![v10 brushStyle])
    {
      id v64 = [v10 strokeColor];
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v64 CGColor]);

      [v10 strokeWidth];
      +[AKAnnotationRendererUtilities setStandardLineStateInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineStateInContext:forLineWidth:", a4);
      if ([v10 isDashed])
      {
        [v10 strokeWidth];
        +[AKAnnotationRendererUtilities setStandardLineDashInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineDashInContext:forLineWidth:", a4);
      }
      v79.origin.CGFloat x = v14;
      v79.origin.CGFloat y = v16;
      v79.size.CGFloat width = v18;
      v79.size.CGFloat height = v20;
      CGContextStrokeEllipseInRect(a4, v79);
      if (v12) {
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    v78.origin.CGFloat x = v14;
    v78.origin.CGFloat y = v16;
    v78.size.CGFloat width = v18;
    v78.size.CGFloat height = v20;
    v58 = CGPathCreateWithEllipseInRect(v78, 0);
    uint64_t v59 = [v10 brushStyle];
    v60 = [v10 strokeColor];
    [v10 strokeWidth];
    v61 = +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v59, v60);

    v62 = +[AKTSDBezierPath bezierPathWithCGPath:v58];
    v63 = objc_alloc_init(AKTSDShape);
    [(AKTSDShape *)v63 setStroke:v61];
    [(AKTSDShape *)v63 setPath:v62];
    [(AKTSDShape *)v63 drawInContext:a4];
    CGPathRelease(v58);
  }
  if (v12) {
LABEL_32:
  }
    +[AKAnnotationRendererUtilities endShadowInContext:a4];
LABEL_33:
  CGContextRestoreGState(a4);
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  [v7 strokeWidth];
  CGFloat v9 = v8 * -0.5;
  [v7 rectangle];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v22.origin.CGFloat x = v11;
  v22.origin.CGFloat y = v13;
  v22.size.CGFloat width = v15;
  v22.size.CGFloat height = v17;
  CGRect v23 = CGRectInset(v22, v9, v9);
  double v18 = CGPathCreateWithEllipseInRect(v23, 0);
  v21.CGFloat x = x;
  v21.CGFloat y = y;
  BOOL v19 = CGPathContainsPoint(v18, 0, v21, 0);
  CGPathRelease(v18);
  return v19;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  return 0;
}

+ (CGRect)innerClipRect:(id)a3
{
  id v3 = a3;
  [v3 rectangle];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  [v3 strokeWidth];
  double v13 = v12;

  uint64_t v14 = v5;
  uint64_t v15 = v7;
  uint64_t v16 = v9;
  uint64_t v17 = v11;

  return CGRectInset(*(CGRect *)&v14, v13 * 0.5, v13 * 0.5);
}

@end