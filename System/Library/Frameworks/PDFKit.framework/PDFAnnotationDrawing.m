@interface PDFAnnotationDrawing
+ (BOOL)renderString:(id)a3 forRect:(CGRect)a4 font:(id)a5 color:(id)a6 alignment:(int64_t)a7 rotation:(int)a8 breaks:(BOOL)a9 context:(CGContext *)c withAnnotation:(id)a11;
+ (CGPath)createCGPathArrayWithBezierPaths:(id)a3;
+ (CGRect)adjustedRectForBox:(int64_t)a3 withAnnotation:(id)a4;
+ (double)textInset;
+ (id)createLigtherColor:(CGColor *)a3 withIntensity:(double)a4;
+ (id)stringByTrimmingTrailingCharactersInSet:(id)a3 forString:(id)a4;
+ (void)createPillBezier:(CGRect)a3 inContext:(CGContext *)a4;
+ (void)drawAppearance:(int)a3 ofAnnotation:(id)a4 withBox:(int64_t)a5 inContext:(CGContext *)a6;
+ (void)drawAppearance:(int)a3 ofAnnotation:(id)a4 withBox:(int64_t)a5 inContext:(CGContext *)a6 scaleProportional:(BOOL)a7;
+ (void)drawAppearance:(int)a3 ofAnnotation:(id)a4 withBox:(int64_t)a5 inContext:(CGContext *)a6 scaleProportional:(BOOL)a7 suppressTextRendering:(BOOL)a8;
+ (void)drawArrowFrom:(CGPoint)a3 to:(CGPoint)a4 open:(BOOL)a5 inContext:(CGContext *)a6 withBorder:(id)a7;
+ (void)drawBulletAtPoint:(CGPoint)a3 shape:(int)a4 inContext:(CGContext *)a5 withBorder:(id)a6;
+ (void)drawCheckBox:(id)a3 inContext:(CGContext *)a4 withState:(int64_t)a5 withBackgroundColor:(id)a6 withBorderColor:(id)a7 withFontColor:(id)a8 isHighlighted:(BOOL)a9;
+ (void)drawComboBox:(CGRect)a3 inContext:(CGContext *)a4 withAnnotation:(id)a5 withStringValue:(id)a6 withFont:(id)a7 withFontColor:(id)a8;
+ (void)drawCommentIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5;
+ (void)drawCommonCommentNoteIconToContext:(CGContext *)a3 colorComponents:(double *)a4 rect:(CGRect)a5;
+ (void)drawDisclosureBox:(CGRect)a3 inContext:(CGContext *)a4;
+ (void)drawHelpIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5;
+ (void)drawInsertIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5;
+ (void)drawKeyIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5;
+ (void)drawListBox:(CGRect)a3 inContext:(CGContext *)a4 withAnnotation:(id)a5 withOptions:(id)a6 withStringValue:(id)a7 withFont:(id)a8 withFontColor:(id)a9;
+ (void)drawNewParagraphIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5;
+ (void)drawNoteAsSelected:(CGContext *)a3 rect:(CGRect)a4;
+ (void)drawNoteIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5;
+ (void)drawNoteInContext:(CGContext *)a3 withParentAnnotation:(id)a4;
+ (void)drawParagraphIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5;
+ (void)drawPushButton:(id)a3 inContext:(CGContext *)a4 withBackgroundColor:(id)a5 withCaption:(id)a6 withFont:(id)a7 withFontColor:(id)a8 isHighlighted:(BOOL)a9;
+ (void)drawRadioButton:(id)a3 inContext:(CGContext *)a4 withState:(int64_t)a5 withBackgroundColor:(id)a6 withBorderColor:(id)a7 withFontColor:(id)a8 isHighlighted:(BOOL)a9;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withButtonWidgetAnnotation:(id)a5;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withChoiceWidgetAnnotation:(id)a5;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withCircleAnnotation:(id)a5;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withFreeTextAnnotation:(id)a5;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withInkAnnotation:(id)a5;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withLineAnnotation:(id)a5;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withLinkAnnotation:(id)a5;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withMarkupAnnotation:(id)a5;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withRedactAnnotation:(id)a5;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withSquareAnnotation:(id)a5;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withStampAnnotation:(id)a5;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withTextAnnotation:(id)a5;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withTextWidgetAnnotation:(id)a5;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withAKAnnotation:(id)a5 forAnnotation:(id)a6;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withAnnotation:(id)a5;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withPopupAnnotation:(id)a5;
+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withUnknownAnnotation:(id)a5;
+ (void)fillOval:(CGRect)a3 color:(id)a4 context:(CGContext *)a5;
+ (void)fillRect:(CGRect)a3 color:(id)a4 context:(CGContext *)a5;
+ (void)setupDrawColor:(id)a3 withComponents:(double *)a4 forContext:(CGContext *)a5;
+ (void)strokeOval:(CGRect)a3 color:(id)a4 context:(CGContext *)a5;
+ (void)strokeRect:(CGRect)a3 color:(id)a4 context:(CGContext *)a5;
@end

@implementation PDFAnnotationDrawing

+ (double)textInset
{
  return 3.0;
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withAnnotation:(id)a5
{
  id v8 = a5;
  v9 = [v8 valueForAnnotationKey:@"/Subtype"];
  v10 = [v8 akAnnotationAdaptor];
  v11 = [v10 akAnnotation];

  if (v11)
  {
    [a1 drawWithBox:a3 inContext:a4 withAKAnnotation:v11 forAnnotation:v8];
  }
  else if ([v9 isEqualToString:@"/Circle"])
  {
    [a1 drawWithBox:a3 inContext:a4 withCircleAnnotation:v8];
  }
  else if ([v9 isEqualToString:@"/FreeText"])
  {
    [a1 drawWithBox:a3 inContext:a4 withFreeTextAnnotation:v8];
  }
  else if ([v9 isEqualToString:@"/Ink"])
  {
    [a1 drawWithBox:a3 inContext:a4 withInkAnnotation:v8];
  }
  else if ([v9 isEqualToString:@"/Line"])
  {
    [a1 drawWithBox:a3 inContext:a4 withLineAnnotation:v8];
  }
  else if ([v9 isEqualToString:@"/Link"])
  {
    [a1 drawWithBox:a3 inContext:a4 withLinkAnnotation:v8];
  }
  else if (([v9 isEqualToString:@"/Highlight"] & 1) != 0 {
         || ([v9 isEqualToString:@"/StrikeOut"] & 1) != 0
  }
         || [v9 isEqualToString:@"/Underline"])
  {
    [a1 drawWithBox:a3 inContext:a4 withMarkupAnnotation:v8];
  }
  else if ([v9 isEqualToString:@"/Popup"])
  {
    [a1 drawWithBox:a3 inContext:a4 withPopupAnnotation:v8];
  }
  else if ([v9 isEqualToString:@"/Square"])
  {
    [a1 drawWithBox:a3 inContext:a4 withSquareAnnotation:v8];
  }
  else if ([v9 isEqualToString:@"/Stamp"])
  {
    [a1 drawWithBox:a3 inContext:a4 withStampAnnotation:v8];
  }
  else if ([v9 isEqualToString:@"/Text"])
  {
    [a1 drawWithBox:a3 inContext:a4 withTextAnnotation:v8];
  }
  else if ([v9 isEqualToString:@"/Redact"])
  {
    [a1 drawWithBox:a3 inContext:a4 withRedactAnnotation:v8];
  }
  else if ([v9 isEqualToString:@"/Widget"])
  {
    v15 = [v8 valueForAnnotationKey:@"/FT"];
    if ([v15 isEqualToString:@"/Btn"])
    {
      [a1 drawWithBox:a3 inContext:a4 withButtonWidgetAnnotation:v8];
    }
    else if ([v15 isEqualToString:@"/Tx"])
    {
      [a1 drawWithBox:a3 inContext:a4 withTextWidgetAnnotation:v8];
    }
    else if ([v15 isEqualToString:@"/Ch"])
    {
      [a1 drawWithBox:a3 inContext:a4 withChoiceWidgetAnnotation:v8];
    }
    else if ([v15 isEqualToString:@"/Sig"])
    {
      [a1 drawWithBox:a3 inContext:a4 withStampAnnotation:v8];
    }
  }
  else
  {
    [a1 drawWithBox:a3 inContext:a4 withUnknownAnnotation:v8];
  }
  if (GetDefaultsWriteHighlightAnnotations())
  {
    CGContextSaveGState(a4);
    [v8 bounds];
    v12 = [v8 page];
    v13 = v12;
    memset(&v16[1], 0, sizeof(CGAffineTransform));
    if (v12) {
      [v12 getDrawingTransformForBox:a3];
    }
    v16[0] = v16[1];
    CGContextConcatCTM(a4, v16);
    CGContextSetRGBStrokeColor(a4, 0.5, 0.0, 0.5, 1.0);
    CGContextSetLineWidth(a4, 1.0);
    v17.origin.x = PDFRectToCGRect(v14);
    CGContextStrokeRect(a4, v17);
    CGContextRestoreGState(a4);
  }
}

+ (void)drawAppearance:(int)a3 ofAnnotation:(id)a4 withBox:(int64_t)a5 inContext:(CGContext *)a6
{
}

+ (void)drawAppearance:(int)a3 ofAnnotation:(id)a4 withBox:(int64_t)a5 inContext:(CGContext *)a6 scaleProportional:(BOOL)a7
{
}

+ (void)drawAppearance:(int)a3 ofAnnotation:(id)a4 withBox:(int64_t)a5 inContext:(CGContext *)a6 scaleProportional:(BOOL)a7 suppressTextRendering:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v11 = *(void *)&a3;
  id v15 = a4;
  uint64_t v12 = [v15 cachedAppearance:v11];
  if (v12)
  {
    uint64_t v13 = v12;
    [v15 bounds];
    objc_msgSend(v15, "drawCachedAppearance:withBox:inContext:inRect:scaleProportional:", v13, a5, a6, 1);
  }
  else
  {
    uint64_t v14 = [v15 appearance:v11];
    [v15 bounds];
    objc_msgSend(v15, "drawAppearance:withBox:inContext:inRect:scaleProportional:suppressTextRendering:", v14, a5, a6, 1, v8);
  }
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withAKAnnotation:(id)a5 forAnnotation:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  CGContextSaveGState(a4);
  uint64_t v11 = [v10 page];

  if (v11) {
    [v11 getDrawingTransformForBox:a3];
  }
  else {
    memset(&transform, 0, sizeof(transform));
  }
  CGContextConcatCTM(a4, &transform);

  [v9 integralDrawingBounds];
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  if (!CGRectIsInfinite(v21))
  {
    memset(&v19, 0, sizeof(v19));
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGFloat MinX = CGRectGetMinX(v22);
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    CGFloat MinY = CGRectGetMinY(v23);
    CGAffineTransformMakeTranslation(&v19, MinX, MinY);
    CGAffineTransform v18 = v19;
    CGContextConcatCTM(a4, &v18);
  }
  [AKControllerClass() renderAnnotation:v9 inContext:a4];
  CGContextRestoreGState(a4);
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withCircleAnnotation:(id)a5
{
  id v31 = a5;
  BOOL v8 = [v31 page];
  [v31 bounds];
  id v9 = [v31 valueForAnnotationKey:@"/Border"];
  id v10 = [v31 valueForAnnotationKey:@"/C"];
  uint64_t v11 = [v31 valueForAnnotationKey:@"/IC"];
  CGFloat v12 = PDFRectToCGRect(v11);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  if ([v31 appearance:0])
  {
    [a1 drawAppearance:0 ofAnnotation:v31 withBox:a3 inContext:CurrentContext];
  }
  else if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
  {
    CGContextSaveGState(CurrentContext);
    [v8 transformContext:CurrentContext forBox:a3];
    double v19 = 1.0;
    if (v9)
    {
      [v9 lineWidth];
      if (v20 != 0.0) {
        double v19 = v20;
      }
    }
    CGContextSetLineWidth(CurrentContext, v19);
    if ([v9 style] == 1) {
      CGContextSetLineDash(CurrentContext, 0.0, (const CGFloat *)[v9 dashPatternRaw], objc_msgSend(v9, "dashCountRaw"));
    }
    v33.origin.CGFloat x = v12;
    v33.origin.CGFloat y = v14;
    v33.size.CGFloat width = v16;
    v33.size.CGFloat height = v18;
    CGRect v34 = CGRectInset(v33, v19 * 0.5, v19 * 0.5);
    CGFloat x = v34.origin.x;
    CGFloat y = v34.origin.y;
    CGFloat width = v34.size.width;
    CGFloat height = v34.size.height;
    if (v11)
    {
      id v25 = v11;
      ColorSpace = CGColorGetColorSpace((CGColorRef)[v25 CGColor]);
      Components = CGColorGetComponents((CGColorRef)[v25 CGColor]);
      CGContextSetFillColorSpace(CurrentContext, ColorSpace);
      CGContextSetFillColor(CurrentContext, Components);
      v35.origin.CGFloat x = x;
      v35.origin.CGFloat y = y;
      v35.size.CGFloat width = width;
      v35.size.CGFloat height = height;
      CGContextFillEllipseInRect(CurrentContext, v35);
    }
    id v28 = v10;
    v29 = CGColorGetColorSpace((CGColorRef)[v28 CGColor]);
    v30 = CGColorGetComponents((CGColorRef)[v28 CGColor]);
    CGContextSetStrokeColorSpace(CurrentContext, v29);
    CGContextSetStrokeColor(CurrentContext, v30);
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    CGContextStrokeEllipseInRect(CurrentContext, v36);
    CGContextRestoreGState(CurrentContext);
  }
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withFreeTextAnnotation:(id)a5
{
  id v25 = a5;
  BOOL v8 = [v25 page];
  [v25 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v24 = [v25 valueForAnnotationKey:@"/C"];
  double v17 = [v25 valueForAnnotationKey:@"/Contents"];
  CGFloat v18 = [v25 valueForAnnotationKey:@"/Border"];
  double v19 = [v25 font];
  double v20 = [v25 fontColor];
  uint64_t v21 = [v25 alignment];
  uint64_t v22 = [v8 rotation];
  if ([v25 appearance:0])
  {
    [a1 drawAppearance:0 ofAnnotation:v25 withBox:a3 inContext:CurrentContext];
  }
  else if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
  {
    CGContextSaveGState(CurrentContext);
    [v8 transformContext:CurrentContext forBox:a3];
    +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v24, CurrentContext, v10, v12, v14, v16);
    v27.origin.CGFloat x = v10;
    v27.origin.CGFloat y = v12;
    v27.size.CGFloat width = v14;
    v27.size.CGFloat height = v16;
    CGRect v28 = PDFRectInset(v27, 2.0, 2.0);
    +[PDFAnnotationDrawing renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:](PDFAnnotationDrawing, "renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:", v17, v19, v20, v21, v22, 1, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height, CurrentContext, v25);
    if (v18)
    {
      id v23 = [MEMORY[0x263F825C8] blackColor];
      CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v23 CGColor]);

      objc_msgSend(v18, "drawInRect:inContext:", CurrentContext, v10, v12, v14, v16);
    }
    CGContextRestoreGState(CurrentContext);
  }
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withInkAnnotation:(id)a5
{
  id v8 = a5;
  double v9 = [v8 page];
  double v10 = [v8 valueForAnnotationKey:@"/C"];
  double v11 = [v8 valueForAnnotationKey:@"/Border"];
  if ([v8 appearance:0])
  {
    [a1 drawAppearance:0 ofAnnotation:v8 withBox:a3 inContext:CurrentContext];
  }
  else
  {
    double v12 = [v8 valueForAnnotationKey:@"/InkList"];
    if (v12)
    {
      double v13 = (const CGPath **)[v8 cgPathArray];
      if (v13
        || (double v13 = (const CGPath **)[a1 createCGPathArrayWithBezierPaths:v12],
            [v8 setCGPathArray:v13],
            v13))
      {
        int v14 = [v12 count];
        if ((unint64_t)a3 <= 4)
        {
          LODWORD(v15) = v14;
          if (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0)
          {
            CGContextSaveGState(CurrentContext);
            [v9 transformContext:CurrentContext forBox:a3];
            [v8 bounds];
            CGAffineTransformMakeTranslation(&v24, v16, v17);
            CGContextConcatCTM(CurrentContext, &v24);
            if (v10)
            {
              id v18 = v10;
              ColorSpace = CGColorGetColorSpace((CGColorRef)[v18 CGColor]);
              Components = CGColorGetComponents((CGColorRef)[v18 CGColor]);
              CGContextSetStrokeColorSpace(CurrentContext, ColorSpace);
              CGContextSetStrokeColor(CurrentContext, Components);
            }
            if (v11)
            {
              [v11 lineWidth];
              if (v21 == 0.0) {
                double v22 = 1.0;
              }
              else {
                double v22 = v21;
              }
              if ([v11 style] == 1) {
                CGContextSetLineDash(CurrentContext, 0.0, (const CGFloat *)[v11 dashPatternRaw], objc_msgSend(v11, "dashCountRaw"));
              }
              else {
                CGContextSetLineCap(CurrentContext, kCGLineCapRound);
              }
            }
            else
            {
              double v22 = 1.0;
            }
            CGContextSetLineWidth(CurrentContext, v22);
            CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
            uint64_t v15 = v15;
            if (v15)
            {
              do
              {
                CGContextSaveGState(CurrentContext);
                id v23 = *v13++;
                CGContextAddPath(CurrentContext, v23);
                CGContextStrokePath(CurrentContext);
                CGContextRestoreGState(CurrentContext);
                --v15;
              }
              while (v15);
            }
            CGContextRestoreGState(CurrentContext);
          }
        }
      }
    }
  }
}

+ (CGPath)createCGPathArrayWithBezierPaths:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 count];
  if (v4 < 1)
  {
    v6 = 0;
  }
  else
  {
    int64_t v5 = v4;
    v6 = (CGPath **)malloc_type_calloc(v4, 8uLL, 0x2004093837F09uLL);
    if (v6)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v8 = [v3 objectAtIndex:i];
        v6[i] = CGPathCreateMutableCopy((CGPathRef)[v8 CGPath]);
      }
    }
  }

  return v6;
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withLineAnnotation:(id)a5
{
  id v8 = a5;
  v47 = [v8 page];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v13 = [v8 valueForAnnotationKey:@"/C"];
  int v14 = [v8 valueForAnnotationKey:@"/IC"];
  uint64_t v15 = [v8 valueForAnnotationKey:@"/Border"];
  CGFloat v16 = [v8 valueForAnnotationKey:@"/L"];
  if (v16)
  {
    [v8 startPoint];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    [v8 endPoint];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    uint64_t v25 = [v8 startLineStyle];
    uint64_t v26 = [v8 endLineStyle];
    if ([v8 appearance:0])
    {
      [a1 drawAppearance:0 ofAnnotation:v8 withBox:a3 inContext:CurrentContext];
    }
    else if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
    {
      CGContextSaveGState(CurrentContext);
      [v47 transformContext:CurrentContext forBox:a3];
      CGAffineTransformMakeTranslation(&transform, v10, v12);
      CGContextConcatCTM(CurrentContext, &transform);
      CGFloat v27 = 1.0;
      if (v15)
      {
        [v15 lineWidth];
        if (v28 != 0.0) {
          CGFloat v27 = v28;
        }
      }
      uint64_t v46 = v25;
      CGContextSetLineWidth(CurrentContext, v27);
      if ([v15 style] == 1) {
        CGContextSetLineDash(CurrentContext, 0.0, (const CGFloat *)[v15 dashPatternRaw], objc_msgSend(v15, "dashCountRaw"));
      }
      CGContextMoveToPoint(CurrentContext, v18, v20);
      CGContextAddLineToPoint(CurrentContext, v22, v24);
      id v29 = v13;
      ColorSpace = CGColorGetColorSpace((CGColorRef)[v29 CGColor]);
      Components = CGColorGetComponents((CGColorRef)[v29 CGColor]);
      CGContextSetStrokeColorSpace(CurrentContext, ColorSpace);
      CGContextSetStrokeColor(CurrentContext, Components);
      uint64_t v32 = v46;
      if (v46 == 4) {
        objc_msgSend(a1, "drawArrowFrom:to:open:inContext:withBorder:", 1, CurrentContext, v15, v22, v24, v18, v20);
      }
      if (v26 == 4) {
        objc_msgSend(a1, "drawArrowFrom:to:open:inContext:withBorder:", 1, CurrentContext, v15, v18, v20, v22, v24);
      }
      CGContextDrawPath(CurrentContext, kCGPathStroke);
      if (((v46 | v26) & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        switch(v46)
        {
          case 1:
            id v33 = a1;
            double v34 = v18;
            double v35 = v20;
            uint64_t v36 = 0;
            goto LABEL_21;
          case 2:
            id v33 = a1;
            double v34 = v18;
            double v35 = v20;
            uint64_t v36 = 1;
            goto LABEL_21;
          case 3:
            id v33 = a1;
            double v34 = v18;
            double v35 = v20;
            uint64_t v36 = 2;
LABEL_21:
            objc_msgSend(v33, "drawBulletAtPoint:shape:inContext:withBorder:", v36, CurrentContext, v15, v34, v35, v46);
            break;
          case 5:
            objc_msgSend(a1, "drawArrowFrom:to:open:inContext:withBorder:", 0, CurrentContext, v15, v22, v24, v18, v20);
            break;
          default:
            break;
        }
        switch(v26)
        {
          case 1:
            id v37 = a1;
            double v38 = v22;
            double v39 = v24;
            uint64_t v40 = 0;
            goto LABEL_27;
          case 2:
            id v37 = a1;
            double v38 = v22;
            double v39 = v24;
            uint64_t v40 = 1;
            goto LABEL_27;
          case 3:
            id v37 = a1;
            double v38 = v22;
            double v39 = v24;
            uint64_t v40 = 2;
LABEL_27:
            objc_msgSend(v37, "drawBulletAtPoint:shape:inContext:withBorder:", v40, CurrentContext, v15, v38, v39, v46);
            break;
          case 5:
            objc_msgSend(a1, "drawArrowFrom:to:open:inContext:withBorder:", 0, CurrentContext, v15, v18, v20, v22, v24);
            break;
          default:
            break;
        }
        BOOL v41 = v26 <= 0 && v32 <= 0;
        CGPathDrawingMode v42 = kCGPathStroke;
        if (!v41 && v14)
        {
          id v43 = v14;
          v44 = CGColorGetColorSpace((CGColorRef)[v43 CGColor]);
          v45 = CGColorGetComponents((CGColorRef)[v43 CGColor]);
          CGContextSetFillColorSpace(CurrentContext, v44);
          CGContextSetFillColor(CurrentContext, v45);
          CGPathDrawingMode v42 = kCGPathFillStroke;
        }
        CGContextDrawPath(CurrentContext, v42);
      }
      CGContextRestoreGState(CurrentContext);
    }
  }
}

+ (void)drawBulletAtPoint:(CGPoint)a3 shape:(int)a4 inContext:(CGContext *)a5 withBorder:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  id v10 = a6;
  id v15 = v10;
  if (v10)
  {
    [v10 lineWidth];
    float v12 = v11;
    if (v12 == 0.0) {
      float v13 = 1.5;
    }
    else {
      float v13 = v12 * 1.5;
    }
    double v14 = v13;
  }
  else
  {
    double v14 = 1.0;
  }
  switch(a4)
  {
    case 2:
      CGContextMoveToPoint(a5, x - v14 * 0.25, y + v14 + v14 * 0.25);
      CGContextAddLineToPoint(a5, x + v14, y);
      CGContextAddLineToPoint(a5, x, y - v14);
      CGContextAddLineToPoint(a5, x - v14, y);
      CGContextAddLineToPoint(a5, x, y + v14);
      break;
    case 1:
      v18.origin.double x = x - v14;
      v18.origin.double y = y - v14;
      v18.size.CGFloat width = v14 + v14;
      v18.size.CGFloat height = v14 + v14;
      CGContextAddEllipseInRect(a5, v18);
      break;
    case 0:
      v17.origin.double x = x - v14;
      v17.origin.double y = y - v14;
      v17.size.CGFloat width = v14 + v14;
      v17.size.CGFloat height = v14 + v14;
      CGContextAddRect(a5, v17);
      break;
  }
}

+ (void)drawArrowFrom:(CGPoint)a3 to:(CGPoint)a4 open:(BOOL)a5 inContext:(CGContext *)a6 withBorder:(id)a7
{
  double y = a4.y;
  double x = a4.x;
  double v11 = a3.y;
  double v12 = a3.x;
  id v13 = a7;
  float v14 = x - v12;
  float v15 = y - v11;
  float v16 = sqrtf((float)(v15 * v15) + (float)(v14 * v14));
  id v26 = v13;
  if (v13)
  {
    [v13 lineWidth];
    float v18 = v17;
    if (v18 == 0.0) {
      float v18 = 1.0;
    }
  }
  else
  {
    float v18 = 1.0;
  }
  double v19 = (float)(v18 * v14);
  double v20 = v16;
  double v21 = x - v19 * 3.0 / v16;
  double v22 = (float)(v18 * v15);
  double v23 = y - v22 * 3.0 / v20;
  double v24 = v22 * 1.5 / v20;
  double v25 = v19 * 1.5 / v20;
  CGContextMoveToPoint(a6, v21 - v24, v25 + v23);
  CGContextAddLineToPoint(a6, x, y);
  CGContextAddLineToPoint(a6, v24 + v21, v23 - v25);
  if (!a5)
  {
    CGContextAddLineToPoint(a6, v21 - v24, v25 + v23);
    CGContextAddLineToPoint(a6, x, y);
  }
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withLinkAnnotation:(id)a5
{
  id v32 = a5;
  id v8 = [v32 page];
  [v32 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [v32 valueForAnnotationKey:@"/Border"];
  id v18 = [v32 valueForAnnotationKey:@"/C"];
  int v19 = [v32 isHighlighted];
  double v20 = [v32 valueForAnnotationKey:@"/H"];
  if (v19)
  {
    if ([v32 appearance:2])
    {
      id v21 = a1;
      uint64_t v22 = 2;
LABEL_6:
      [v21 drawAppearance:v22 ofAnnotation:v32 withBox:a3 inContext:CurrentContext];
      goto LABEL_26;
    }
  }
  else if ([v32 appearance:0])
  {
    id v21 = a1;
    uint64_t v22 = 0;
    goto LABEL_6;
  }
  if (v17) {
    int v23 = 1;
  }
  else {
    int v23 = v19;
  }
  if ((unint64_t)a3 > 4) {
    goto LABEL_26;
  }
  if (!v23) {
    goto LABEL_26;
  }
  if (!CurrentContext)
  {
    CurrentContext = PDFGraphicsGetCurrentContext();
    if (!CurrentContext) {
      goto LABEL_26;
    }
  }
  CGContextSaveGState(CurrentContext);
  [v8 transformContext:CurrentContext forBox:a3];
  if (!v19) {
    goto LABEL_20;
  }
  if (![v20 isEqualToString:@"/I"])
  {
    if ([v20 isEqualToString:@"/O"])
    {
      id v29 = [MEMORY[0x263F825C8] whiteColor];
      ColorSpace = CGColorGetColorSpace((CGColorRef)[v29 CGColor]);
      id v26 = v29;
      Components = CGColorGetComponents((CGColorRef)[v26 CGColor]);
      CGContextSetStrokeColorSpace(CurrentContext, ColorSpace);
      CGContextSetStrokeColor(CurrentContext, Components);
      CGContextSetCompositeOperation();
      v35.origin.double x = v10;
      v35.origin.double y = v12;
      v35.size.CGFloat width = v14;
      v35.size.CGFloat height = v16;
      CGRect v36 = PDFRectInset(v35, 0.5, 0.5);
      objc_msgSend(a1, "createPillBezier:inContext:", CurrentContext, v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
      CGContextStrokePath(CurrentContext);
      goto LABEL_21;
    }
LABEL_20:
    id v26 = 0;
LABEL_21:
    if (v17) {
      goto LABEL_22;
    }
    goto LABEL_25;
  }
  id v24 = +[PDFSelection defaultActiveColor];
  double v25 = CGColorGetColorSpace((CGColorRef)[v24 CGColor]);
  id v26 = v24;
  CGFloat v27 = CGColorGetComponents((CGColorRef)[v26 CGColor]);
  CGContextSetFillColorSpace(CurrentContext, v25);
  CGContextSetFillColor(CurrentContext, v27);
  uint64_t v28 = CGContextSetCompositeOperation();
  if (v17)
  {
    v34.origin.double x = PDFRectToCGRect(v28);
    CGContextFillRect(CurrentContext, v34);
LABEL_22:
    if (!v18)
    {
      id v18 = [MEMORY[0x263F825C8] blackColor];
    }
    id v18 = v18;
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v18 CGColor]);
    objc_msgSend(v17, "drawInRect:inContext:", CurrentContext, v10, v12, v14, v16);
    goto LABEL_25;
  }
  objc_msgSend(a1, "createPillBezier:inContext:", CurrentContext, v10, v12, v14, v16);
  CGContextFillPath(CurrentContext);
LABEL_25:
  CGContextRestoreGState(CurrentContext);

LABEL_26:
}

+ (void)createPillBezier:(CGRect)a3 inContext:(CGContext *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double v8 = a3.origin.x;
  CGContextSetLineJoin(a4, kCGLineJoinRound);
  double v19 = width;
  if (height >= width) {
    double v9 = width;
  }
  else {
    double v9 = height;
  }
  float v10 = v9 * 0.1;
  double v11 = v10;
  float v12 = 0.55228 * v10;
  double x = v8 + v10;
  CGContextMoveToPoint(a4, x, y);
  double v13 = v12;
  CGFloat v14 = v8 + v12;
  CGContextAddCurveToPoint(a4, v14, y, v8, y + v13, v8, y + v11);
  CGFloat v15 = y + height;
  CGContextAddLineToPoint(a4, v8, v15 - v11);
  CGContextAddCurveToPoint(a4, v8, v15 - v13, v14, v15, x, v15);
  CGFloat v16 = v8 + v19;
  CGFloat v17 = v8 + v19 - v11;
  CGContextAddLineToPoint(a4, v17, v15);
  CGContextAddCurveToPoint(a4, v16 - v13, v15, v16, v15 - v13, v16, v15 - v11);
  CGContextAddLineToPoint(a4, v16, y + v11);
  CGContextAddCurveToPoint(a4, v16, y + v13, v16 - v13, y, v17, y);

  CGContextAddLineToPoint(a4, x, y);
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withMarkupAnnotation:(id)a5
{
  id v40 = a5;
  double v8 = [v40 page];
  double v9 = [v40 valueForAnnotationKey:@"/C"];
  uint64_t v10 = [v40 markupType];
  double v11 = [v40 valueForAnnotationKey:@"/QuadPoints"];
  unsigned int v12 = [v11 count];
  if ([v40 appearance:0])
  {
    [a1 drawAppearance:0 ofAnnotation:v40 withBox:a3 inContext:CurrentContext];
    goto LABEL_25;
  }
  if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
  {
    CGContextSaveGState(CurrentContext);
    [v8 transformContext:CurrentContext forBox:a3];
    id v13 = v9;
    ColorSpace = CGColorGetColorSpace((CGColorRef)[v13 CGColor]);
    Components = CGColorGetComponents((CGColorRef)[v13 CGColor]);
    if (v10)
    {
      CGContextSetStrokeColorSpace(CurrentContext, ColorSpace);
      CGContextSetStrokeColor(CurrentContext, Components);
    }
    else
    {
      CGContextSetCompositeOperation();
      CGContextSetFillColorSpace(CurrentContext, ColorSpace);
      CGContextSetFillColor(CurrentContext, Components);
    }
    CGFloat v16 = v40;
    if (v12 >= 4)
    {
      unsigned int v17 = 0;
      if (v12 >> 2 <= 1) {
        int v18 = 1;
      }
      else {
        int v18 = v12 >> 2;
      }
      while (1)
      {
        float64x2_t v42 = 0uLL;
        float64x2_t v41 = 0uLL;
        double v19 = [v11 objectAtIndex:v17];
        [v19 PDFKitPDFPointValue];
        float64_t v21 = v20;
        float64_t v23 = v22;

        v44.f64[0] = v21;
        v44.f64[1] = v23;
        id v24 = [v11 objectAtIndex:v17 + 1];
        [v24 PDFKitPDFPointValue];
        float64_t v26 = v25;
        float64_t v28 = v27;

        v43.f64[0] = v26;
        v43.f64[1] = v28;
        id v29 = [v11 objectAtIndex:v17 + 2];
        [v29 PDFKitPDFPointValue];
        float64_t v31 = v30;
        float64_t v33 = v32;

        v42.f64[0] = v31;
        v42.f64[1] = v33;
        CGRect v34 = [v11 objectAtIndex:v17 + 3];
        [v34 PDFKitPDFPointValue];
        float64_t v36 = v35;
        float64_t v38 = v37;

        CGFloat v16 = v40;
        v41.f64[0] = v36;
        v41.f64[1] = v38;
        v17 += 4;
        if (!v10) {
          break;
        }
        if (v10 == 2)
        {
          underlinePath(CurrentContext, v44.f64, v42.f64, v41.f64);
LABEL_19:
          CGContextStrokePath(CurrentContext);
LABEL_20:
          CGFloat v16 = v40;
          goto LABEL_21;
        }
        if (v10 == 1)
        {
          strikeOutPath(CurrentContext, v44.f64, v43.f64, v42.f64, v41.f64);
          goto LABEL_19;
        }
LABEL_21:
        if (!--v18) {
          goto LABEL_22;
        }
      }
      highlightPath(CurrentContext, &v44, &v43, &v42, &v41);
      CGContextFillPath(CurrentContext);
      goto LABEL_20;
    }
LABEL_22:
    double v39 = [v16 popup];

    if (v39) {
      +[PDFAnnotationDrawing drawNoteInContext:CurrentContext withParentAnnotation:v40];
    }
    CGContextRestoreGState(CurrentContext);
  }
LABEL_25:
}

+ (void)drawNoteInContext:(CGContext *)a3 withParentAnnotation:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 markupStyle];
  id v7 = +[PDFAnnotation PDFTextColorForMarkupStyle:v6];
  double v8 = (CGColor *)[v7 CGColor];

  id v9 = +[PDFAnnotation PDFTextBorderColorForMarkupStyle:v6];
  uint64_t v10 = (CGColor *)[v9 CGColor];

  [v5 noteBounds];
  PDFKitBezierPathWithRoundedRect();
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  ColorSpace = CGColorGetColorSpace(v8);
  Components = CGColorGetComponents(v8);
  CGContextSetFillColorSpace(a3, ColorSpace);
  CGContextSetFillColor(a3, Components);
  [v15 fill];
  id v13 = CGColorGetColorSpace(v10);
  CGFloat v14 = CGColorGetComponents(v10);
  CGContextSetStrokeColorSpace(a3, v13);
  CGContextSetStrokeColor(a3, v14);
  [v15 stroke];
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withPopupAnnotation:(id)a5
{
  id v9 = a5;
  double v8 = [v9 page];
  if ((unint64_t)a3 <= 4)
  {
    CGContextSaveGState(a4);
    [v8 transformContext:a4 forBox:a3];
    [a1 adjustedRectForBox:a3 withAnnotation:v9];
    objc_msgSend(a1, "drawInContext:withBounds:withPopupAnnotation:", a4, v9);
    CGContextRestoreGState(a4);
  }
}

+ (CGRect)adjustedRectForBox:(int64_t)a3 withAnnotation:(id)a4
{
  id v5 = a4;
  [v5 bounds];
  CGFloat x = v6;
  double y = v8;
  double width = v10;
  double height = v12;
  CGFloat v14 = [v5 page];

  if (v14)
  {
    [v14 boundsForBox:a3];
    double v16 = v15;
    double v17 = x;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v39 = v17;
    double MinX = PDFRectGetMinX(v17, y, width);
    double r2 = v16;
    double v25 = v16;
    double v26 = v19;
    if (MinX >= PDFRectGetMaxX(v25, v19, v21) + -72.0)
    {
      double v27 = PDFRectGetMaxX(r2, v19, v21) + -72.0;
    }
    else
    {
      double v27 = v39;
      double MaxX = PDFRectGetMaxX(v39, y, width);
      if (MaxX > PDFRectGetMinX(r2, v26, v21) + 72.0) {
        goto LABEL_7;
      }
      double v27 = PDFRectGetMinX(r2, v26, v21);
    }
    double width = 72.0;
LABEL_7:
    double MinY = PDFRectGetMinY(v27, y, width, height);
    if (MinY >= PDFRectGetMaxY(r2, v26, v21, v23) + -36.0)
    {
      double y = PDFRectGetMaxY(r2, v26, v21, v23) + -36.0;
    }
    else
    {
      double MaxY = PDFRectGetMaxY(v27, y, width, height);
      if (MaxY > PDFRectGetMinY(r2, v26, v21, v23) + 36.0)
      {
LABEL_12:
        v41.origin.CGFloat x = v27;
        v41.origin.double y = y;
        v41.size.double width = width;
        v41.size.double height = height;
        v46.origin.CGFloat x = r2;
        v46.origin.double y = v26;
        v46.size.double width = v21;
        v46.size.double height = v23;
        CGRect v42 = PDFRectIntersection(v41, v46);
        CGFloat x = v42.origin.x;
        double y = v42.origin.y;
        double width = v42.size.width;
        double height = v42.size.height;
        goto LABEL_13;
      }
      double y = PDFRectGetMinY(r2, v26, v21, v23);
    }
    double height = 36.0;
    goto LABEL_12;
  }
LABEL_13:
  v43.origin.CGFloat x = x;
  v43.origin.double y = y;
  v43.size.double width = width;
  v43.size.double height = height;
  CGRect v44 = PDFRectInset(v43, 1.0, 1.0);
  CGFloat v31 = v44.origin.x;
  CGFloat v32 = v44.origin.y;
  CGFloat v33 = v44.size.width;
  CGFloat v34 = v44.size.height + 1.0;

  double v35 = v31;
  double v36 = v32;
  double v37 = v33;
  double v38 = v34;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.double y = v36;
  result.origin.CGFloat x = v35;
  return result;
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withSquareAnnotation:(id)a5
{
  id v32 = a5;
  double v8 = [v32 page];
  [v32 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v17 = [v32 valueForAnnotationKey:@"/C"];
  double v18 = [v32 valueForAnnotationKey:@"/IC"];
  double v19 = [v32 valueForAnnotationKey:@"/Border"];
  if ([v32 appearance:0])
  {
    [a1 drawAppearance:0 ofAnnotation:v32 withBox:a3 inContext:CurrentContext];
  }
  else if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
  {
    CGContextSaveGState(CurrentContext);
    [v8 transformContext:CurrentContext forBox:a3];
    double v20 = 1.0;
    if (v19)
    {
      [v19 lineWidth];
      if (v21 != 0.0) {
        double v20 = v21;
      }
    }
    CGContextSetLineWidth(CurrentContext, v20);
    if ([v19 style] == 1) {
      CGContextSetLineDash(CurrentContext, 0.0, (const CGFloat *)[v19 dashPatternRaw], objc_msgSend(v19, "dashCountRaw"));
    }
    v34.origin.CGFloat x = v10;
    v34.origin.CGFloat y = v12;
    v34.size.CGFloat width = v14;
    v34.size.CGFloat height = v16;
    CGRect v35 = CGRectInset(v34, v20 * 0.5, v20 * 0.5);
    CGFloat x = v35.origin.x;
    CGFloat y = v35.origin.y;
    CGFloat width = v35.size.width;
    CGFloat height = v35.size.height;
    if (v18)
    {
      id v26 = v18;
      ColorSpace = CGColorGetColorSpace((CGColorRef)[v26 CGColor]);
      Components = CGColorGetComponents((CGColorRef)[v26 CGColor]);
      CGContextSetFillColorSpace(CurrentContext, ColorSpace);
      CGContextSetFillColor(CurrentContext, Components);
      v36.origin.CGFloat x = x;
      v36.origin.CGFloat y = y;
      v36.size.CGFloat width = width;
      v36.size.CGFloat height = height;
      CGContextFillRect(CurrentContext, v36);
    }
    id v29 = v17;
    double v30 = CGColorGetColorSpace((CGColorRef)[v29 CGColor]);
    CGFloat v31 = CGColorGetComponents((CGColorRef)[v29 CGColor]);
    CGContextSetStrokeColorSpace(CurrentContext, v30);
    CGContextSetStrokeColor(CurrentContext, v31);
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    CGContextStrokeRect(CurrentContext, v37);
    CGContextRestoreGState(CurrentContext);
  }
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withStampAnnotation:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a5;
  double v9 = [v8 page];
  [v8 bounds];
  if ((unint64_t)a3 <= 4)
  {
    double v14 = v10;
    double v15 = v11;
    double v16 = v12;
    double v17 = v13;
    if ([v8 appearance:0])
    {
      [a1 drawAppearance:0 ofAnnotation:v8 withBox:a3 inContext:CurrentContext];
    }
    else if (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0)
    {
      CGContextSaveGState(CurrentContext);
      [v9 transformContext:CurrentContext forBox:a3];
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      if (DeviceRGB)
      {
        double v19 = DeviceRGB;
        CGContextSetStrokeColorSpace(CurrentContext, DeviceRGB);
        memset(components, 0, 24);
        components[3] = 1.0;
        CGContextSetStrokeColor(CurrentContext, components);
        double MinX = PDFRectGetMinX(v14, v15, v16);
        double MinY = PDFRectGetMinY(v14, v15, v16, v17);
        points.CGFloat x = MinX;
        points.CGFloat y = MinY;
        double MaxX = PDFRectGetMaxX(v14, v15, v16);
        double MaxY = PDFRectGetMaxY(v14, v15, v16, v17);
        double v31 = MaxX;
        double v32 = MaxY;
        double v24 = PDFRectGetMinX(v14, v15, v16);
        double v25 = PDFRectGetMaxY(v14, v15, v16, v17);
        double v33 = v24;
        double v34 = v25;
        double v26 = PDFRectGetMaxX(v14, v15, v16);
        double v27 = PDFRectGetMinY(v14, v15, v16, v17);
        double v35 = v26;
        double v36 = v27;
        v38.origin.CGFloat x = PDFRectToCGRect(v28);
        CGContextStrokeRect(CurrentContext, v38);
        CGContextStrokeLineSegments(CurrentContext, &points, 4uLL);
        CGContextRestoreGState(CurrentContext);
        CGColorSpaceRelease(v19);
      }
      else
      {
        CGContextRestoreGState(CurrentContext);
      }
    }
  }
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withTextAnnotation:(id)a5
{
  id v34 = a5;
  id v8 = [v34 page];
  [v34 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [v34 color];
  double v18 = [v34 popup];
  uint64_t v19 = [v34 iconType];
  if ([v34 appearance:0])
  {
    [a1 drawAppearance:0 ofAnnotation:v34 withBox:a3 inContext:CurrentContext];
    if ([v34 isSelected]) {
      objc_msgSend(a1, "drawNoteAsSelected:rect:", CurrentContext, v10, v12, v14, v16);
    }
  }
  else if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
  {
    CGContextSaveGState(CurrentContext);
    [v8 transformContext:CurrentContext forBox:a3];
    if (!v17)
    {
      double v20 = [v18 color];

      if (v20)
      {
        double v17 = [v18 color];
      }
      else
      {
        double v21 = +[PDFAnnotation PDFTextColors];
        double v17 = [v21 objectAtIndex:0];
      }
    }
    if (GetDefaultsWriteAKEnabled())
    {
      id v22 = v17;
      double v23 = +[PDFAnnotation PDFTextColors];
      uint64_t v24 = [v23 indexOfObject:v22];

      if (v24 == 0x7FFFFFFFFFFFFFFFLL)
      {
        double v25 = +[PDFAnnotationDrawing createLigtherColor:withIntensity:](PDFAnnotationDrawing, "createLigtherColor:withIntensity:", [v22 CGColor], 0.05);
      }
      else
      {
        double v26 = +[PDFAnnotation PDFTextBorderColors];
        double v25 = [v26 objectAtIndex:v24];
      }
      v36.origin.double x = v10;
      v36.origin.double y = v12;
      v36.size.double width = v14;
      v36.size.double height = v16;
      CGRect v37 = PDFRectInset(v36, 1.0, 1.0);
      double x = v37.origin.x;
      double y = v37.origin.y;
      double width = v37.size.width;
      double height = v37.size.height;
      id v31 = v22;
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v31 CGColor]);
      +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v31, CurrentContext, x, y, width, height);
      double v32 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, 1.0);
      id v33 = v25;
      CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v33 CGColor]);
      [v32 stroke];
      if ([v34 isSelected]) {
        objc_msgSend(a1, "drawNoteAsSelected:rect:", CurrentContext, v10, v12, v14, v16);
      }
    }
    else
    {
      switch(v19)
      {
        case 0:
          objc_msgSend(a1, "drawCommentIconInRect:withColor:inContext:", v17, CurrentContext, v10, v12, v14, v16);
          break;
        case 1:
          objc_msgSend(a1, "drawKeyIconInRect:withColor:inContext:", v17, CurrentContext, v10, v12, v14, v16);
          break;
        case 2:
          objc_msgSend(a1, "drawNoteIconInRect:withColor:inContext:", v17, CurrentContext, v10, v12, v14, v16);
          break;
        case 3:
          objc_msgSend(a1, "drawHelpIconInRect:withColor:inContext:", v17, CurrentContext, v10, v12, v14, v16);
          break;
        case 4:
          objc_msgSend(a1, "drawNewParagraphIconInRect:withColor:inContext:", v17, CurrentContext, v10, v12, v14, v16);
          break;
        case 5:
          objc_msgSend(a1, "drawParagraphIconInRect:withColor:inContext:", v17, CurrentContext, v10, v12, v14, v16);
          break;
        case 6:
          objc_msgSend(a1, "drawInsertIconInRect:withColor:inContext:", v17, CurrentContext, v10, v12, v14, v16);
          break;
        default:
          break;
      }
    }
    CGContextRestoreGState(CurrentContext);
  }
}

+ (void)drawNoteAsSelected:(CGContext *)a3 rect:(CGRect)a4
{
  CGRect v11 = PDFRectInset(a4, 1.0, 1.0);
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height, 1.0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [MEMORY[0x263F825C8] lightGrayColor];
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v5 CGColor]);
  id v7 = v5;
  Components = CGColorGetComponents((CGColorRef)[v7 CGColor]);
  CGContextSetStrokeColorSpace(a3, ColorSpace);
  CGContextSetStrokeColor(a3, Components);
  [v9 stroke];
}

+ (void)drawCommonCommentNoteIconToContext:(CGContext *)a3 colorComponents:(double *)a4 rect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGContextSetFillColor(a3, a4);
  CGFloat v10 = x + width * 0.1;
  v16.origin.double y = y + height * 0.78;
  v16.origin.double x = v10;
  v16.size.double width = width * 0.8;
  v16.size.double height = height * 0.11;
  CGContextFillRect(a3, v16);
  v17.origin.double y = y + height * 0.57;
  v17.origin.double x = v10;
  v17.size.double width = width * 0.8;
  v17.size.double height = height * 0.11;
  CGContextFillRect(a3, v17);
  CGFloat v13 = v10;

  double v11 = y + height * 0.36;
  double v12 = width * 0.6;
  double v14 = height * 0.11;
  CGContextFillRect(a3, *(CGRect *)&v13);
}

+ (void)setupDrawColor:(id)a3 withComponents:(double *)a4 forContext:(CGContext *)a5
{
  id v7 = a3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGContextSetFillColorSpace(a5, DeviceRGB);
  id v9 = v7;
  CGFloat v10 = (CGColor *)[v9 CGColor];

  Components = CGColorGetComponents(v10);
  CGContextSetFillColor(a5, Components);
  CGContextSetStrokeColorSpace(a5, DeviceRGB);
  *a4 = 0.0;
  a4[1] = 0.0;
  a4[2] = 0.0;
  a4[3] = 1.0;
  CGContextSetStrokeColor(a5, a4);
  if (DeviceRGB)
  {
    CGColorSpaceRelease(DeviceRGB);
  }
}

+ (void)drawCommentIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v8 = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v11 = a4;
  v29.origin.CGFloat x = x;
  v29.origin.double y = v8;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGRect v30 = PDFRectInset(v29, 0.5, 0.5);
  double v12 = v30.origin.x;
  double v13 = v30.origin.y;
  double v14 = v30.size.width;
  double v15 = v30.size.height;
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetLineCap(a5, kCGLineCapRound);
  CGContextSetLineJoin(a5, kCGLineJoinRound);
  CGFloat v26 = v13 + v15 * 0.0;
  CGContextMoveToPoint(a5, v12 + v14 * 0.25, v26);
  CGFloat v16 = v13 + v15 * 0.25;
  CGContextAddLineToPoint(a5, v12 + v14 * 0.33, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.1, v16);
  CGFloat v17 = v12 + v14 * 0.0;
  cp1double y = v13 + v15 * 0.28;
  double v22 = v13 + v15 * 0.35;
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.03, v16, v17, cp1y, v17, v22);
  double y = v13 + v15 * 0.9;
  CGContextAddLineToPoint(a5, v17, y);
  double v24 = v13;
  double v25 = v15;
  double v18 = v15;
  CGFloat v19 = v13 + v15 * 0.97;
  CGFloat v20 = v18 + v13;
  CGContextAddCurveToPoint(a5, v17, v19, v12 + v14 * 0.03, v20, v12 + v14 * 0.1, v20);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.9, v20);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.97, v20, v14 + v12, v19, v14 + v12, y);
  CGContextAddLineToPoint(a5, v14 + v12, v22);
  CGContextAddCurveToPoint(a5, v14 + v12, cp1y, v12 + v14 * 0.97, v16, v12 + v14 * 0.9, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.5, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.25, v26);
  [a1 setupDrawColor:v11 withComponents:v27 forContext:a5];

  CGContextDrawPath(a5, kCGPathFillStroke);
  objc_msgSend(a1, "drawCommonCommentNoteIconToContext:colorComponents:rect:", a5, v27, v12, v24, v14, v25);
}

+ (void)drawKeyIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v11 = a4;
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGRect v19 = PDFRectInset(v18, 0.5, 0.5);
  double v12 = v19.origin.x;
  double v13 = v19.origin.y;
  double v14 = v19.size.width;
  double v15 = v19.size.height;
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetLineCap(a5, kCGLineCapRound);
  CGContextSetLineJoin(a5, kCGLineJoinRound);
  CGContextMoveToPoint(a5, v12 + v14 * 0.0, v13 + v15 * 0.61);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.0, v13 + v15 * 0.75);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.0, v13 + v15 * 0.9, v12 + v14 * 0.1, v15 + v13, v12 + v14 * 0.25, v15 + v13);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.38, v15 + v13);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.48, v15 + v13, v12 + v14 * 0.55, v13 + v15 * 0.95, v12 + v14 * 0.55, v13 + v15 * 0.85);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.55, v13 + v15 * 0.61);
  CGContextAddLineToPoint(a5, v14 + v12, v13 + v15 * 0.15);
  CGContextAddLineToPoint(a5, v14 + v12, v13 + v15 * 0.0);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.7, v13 + v15 * 0.0);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.7, v13 + v15 * 0.15);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.55, v13 + v15 * 0.15);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.55, v13 + v15 * 0.3);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.4, v13 + v15 * 0.3);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.4, v13 + v15 * 0.45);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.15, v13 + v15 * 0.45);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.05, v13 + v15 * 0.45, v12 + v14 * 0.0, v13 + v15 * 0.51, v12 + v14 * 0.0, v13 + v15 * 0.61);
  v20.origin.CGFloat x = v12 + v14 * 0.12;
  v20.origin.CGFloat y = v13 + v15 * 0.72;
  v20.size.CGFloat width = v14 * 0.16;
  v20.size.CGFloat height = v15 * 0.16;
  CGContextAddEllipseInRect(a5, v20);
  [a1 setupDrawColor:v11 withComponents:v16 forContext:a5];

  CGContextDrawPath(a5, kCGPathEOFillStroke);
}

+ (void)drawNoteIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v11 = a4;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRect v22 = PDFRectInset(v21, 0.5, 0.5);
  CGRect v23 = PDFRectInset(v22, v22.size.width * 0.08, 0.0);
  double v12 = v23.origin.x;
  double v13 = v23.origin.y;
  double v14 = v23.size.width;
  double v15 = v23.size.height;
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetLineCap(a5, kCGLineCapRound);
  CGContextSetLineJoin(a5, kCGLineJoinRound);
  CGFloat v16 = v12 + v14 * 0.0;
  CGFloat v17 = v13 + v15 * 0.0;
  CGContextMoveToPoint(a5, v16, v17);
  CGContextAddLineToPoint(a5, v16, v15 + v13);
  CGContextAddLineToPoint(a5, v14 + v12, v15 + v13);
  CGFloat v18 = v13 + v15 * 0.25;
  CGContextAddLineToPoint(a5, v14 + v12, v18);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.75, v17);
  CGContextAddLineToPoint(a5, v16, v17);
  [a1 setupDrawColor:v11 withComponents:v19 forContext:a5];

  CGContextDrawPath(a5, kCGPathFillStroke);
  CGContextMoveToPoint(a5, v14 + v12, v18);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.75, v18);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.75, v17);
  CGContextStrokePath(a5);
  objc_msgSend(a1, "drawCommonCommentNoteIconToContext:colorComponents:rect:", a5, v19, v12, v13, v14, v15);
}

+ (void)drawHelpIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v11 = a4;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGRect v20 = PDFRectInset(v19, 0.5, 0.5);
  double v12 = v20.origin.x;
  double v13 = v20.origin.y;
  double v14 = v20.size.width;
  double v15 = v20.size.height;
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetLineCap(a5, kCGLineCapRound);
  CGContextSetLineJoin(a5, kCGLineJoinRound);
  CGContextMoveToPoint(a5, v12 + v14 * 0.3, v13 + v15 * 0.65);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.3, v13 + v15 * 0.78, v12 + v14 * 0.37, v13 + v15 * 0.85, v12 + v14 * 0.5, v13 + v15 * 0.85);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.63, v13 + v15 * 0.85, v12 + v14 * 0.7, v13 + v15 * 0.78, v12 + v14 * 0.7, v13 + v15 * 0.65);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.68, v13 + v15 * 0.45, v12 + v14 * 0.55, v13 + v15 * 0.5, v12 + v14 * 0.55, v13 + v15 * 0.35);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.45, v13 + v15 * 0.35);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.44, v13 + v15 * 0.55, v12 + v14 * 0.6, v13 + v15 * 0.52, v12 + v14 * 0.6, v13 + v15 * 0.65);
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.6, v13 + v15 * 0.71, v12 + v14 * 0.56, v13 + v15 * 0.75, v12 + v14 * 0.5, v13 + v15 * 0.75);
  CGFloat v16 = v13 + v15 * 0.65;
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.44, v13 + v15 * 0.75, v12 + v14 * 0.4, v13 + v15 * 0.71, v12 + v14 * 0.4, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.3, v16);
  v21.origin.CGFloat x = v12 + v14 * 0.42;
  v21.origin.CGFloat y = v13 + v15 * 0.11;
  v21.size.CGFloat width = v14 * 0.16;
  v21.size.CGFloat height = v15 * 0.16;
  CGContextAddEllipseInRect(a5, v21);
  v22.origin.CGFloat x = v12 + v14 * 0.0;
  v22.origin.CGFloat y = v13 + v15 * 0.0;
  v22.size.CGFloat width = v14;
  v22.size.CGFloat height = v15;
  CGContextAddEllipseInRect(a5, v22);
  [a1 setupDrawColor:v11 withComponents:v17 forContext:a5];

  CGContextDrawPath(a5, kCGPathEOFillStroke);
}

+ (void)drawNewParagraphIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v11 = a4;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRect v22 = PDFRectInset(v21, 0.5, 0.5);
  CGRect v23 = PDFRectInset(v22, v22.size.width * 0.1, 0.0);
  double v12 = v23.origin.x;
  double v13 = v23.origin.y;
  double v14 = v23.size.width;
  double v15 = v23.size.height;
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetLineCap(a5, kCGLineCapRound);
  CGContextSetLineJoin(a5, kCGLineJoinRound);
  CGContextMoveToPoint(a5, v12 + v14 * 0.0, v13 + v15 * 0.5);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.5, v15 + v13);
  CGContextAddLineToPoint(a5, v14 + v12, v13 + v15 * 0.5);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.0, v13 + v15 * 0.5);
  [a1 setupDrawColor:v11 withComponents:v19 forContext:a5];

  CGContextDrawPath(a5, kCGPathFillStroke);
  CGFloat v16 = v13 + v15 * 0.0;
  CGContextMoveToPoint(a5, v12 + v14 * 0.0, v16);
  CGFloat v17 = v13 + v15 * 0.4;
  CGContextAddLineToPoint(a5, v12 + v14 * 0.0, v17);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.4, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.4, v17);
  CGContextMoveToPoint(a5, v12 + v14 * 0.6, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.6, v17);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.9, v17);
  CGFloat v18 = v13 + v15 * 0.2;
  CGContextAddCurveToPoint(a5, v12 + v14 * 1.1, v17, v12 + v14 * 1.1, v18, v12 + v14 * 0.9, v18);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.6, v18);
  CGContextStrokePath(a5);
}

+ (void)drawParagraphIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v11 = a4;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGRect v24 = PDFRectInset(v23, 0.5, 0.5);
  CGRect v25 = PDFRectInset(v24, v24.size.width * 0.1, 0.0);
  double v12 = v25.origin.x;
  double v13 = v25.origin.y;
  double v14 = v25.size.width;
  double v15 = v25.size.height;
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetLineCap(a5, kCGLineCapRound);
  CGContextSetLineJoin(a5, kCGLineJoinRound);
  CGFloat v16 = v13 + v15 * 0.0;
  CGContextMoveToPoint(a5, v12 + v14 * 0.5, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.5, v13 + v15 * 0.5);
  CGFloat v17 = v12 + v14 * 0.0;
  CGContextAddCurveToPoint(a5, v12 + v14 * 0.15, v13 + v15 * 0.5, v17, v13 + v15 * 0.55, v17, v13 + v15 * 0.7);
  CGFloat v18 = v12 + v14 * 0.5;
  CGContextAddCurveToPoint(a5, v17, v13 + v15 * 0.95, v12 + v14 * 0.15, v15 + v13, v18, v15 + v13);
  CGContextAddLineToPoint(a5, v14 + v12, v15 + v13);
  CGContextAddLineToPoint(a5, v14 + v12, v16);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.8, v16);
  CGFloat v19 = v13 + v15 * 0.8;
  CGContextAddLineToPoint(a5, v12 + v14 * 0.8, v19);
  CGFloat v20 = v12 + v14 * 0.65;
  CGContextAddLineToPoint(a5, v20, v19);
  CGContextAddLineToPoint(a5, v20, v16);
  CGContextAddLineToPoint(a5, v18, v16);
  [a1 setupDrawColor:v11 withComponents:v21 forContext:a5];

  CGContextDrawPath(a5, kCGPathFillStroke);
}

+ (void)drawInsertIconInRect:(CGRect)a3 withColor:(id)a4 inContext:(CGContext *)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v11 = a4;
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGRect v19 = PDFRectInset(v18, 0.5, 0.5);
  double v12 = v19.origin.x;
  double v13 = v19.origin.y;
  double v14 = v19.size.width;
  double v15 = v19.size.height;
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetLineCap(a5, kCGLineCapRound);
  CGContextSetLineJoin(a5, kCGLineJoinRound);
  CGContextMoveToPoint(a5, v12 + v14 * 0.0, v13 + v15 * 0.0);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.5, v15 + v13);
  CGContextAddLineToPoint(a5, v14 + v12, v13 + v15 * 0.0);
  CGContextAddLineToPoint(a5, v12 + v14 * 0.0, v13 + v15 * 0.0);
  [a1 setupDrawColor:v11 withComponents:v16 forContext:a5];

  CGContextDrawPath(a5, kCGPathFillStroke);
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withRedactAnnotation:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v7 = a5;
  if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
  {
    CGContextSaveGState(CurrentContext);
    CGFloat v8 = [v7 page];
    [v8 transformContext:CurrentContext forBox:a3];
    if ([v7 isTransparent]) {
      double v9 = 0.65;
    }
    else {
      double v9 = 1.0;
    }
    CGFloat v10 = [v7 valueForAnnotationKey:@"/QuadPoints"];
    id v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 count];
      if (v12)
      {
        unint64_t v13 = v12;
        for (unint64_t i = 0; i < v13; i += 4)
        {
          double v15 = [v11 objectAtIndex:i];
          [v15 PDFKitPDFPointValue];
          points.CGFloat x = v16;
          points.CGFloat y = v17;

          CGRect v18 = [v11 objectAtIndex:i + 1];
          [v18 PDFKitPDFPointValue];
          v44[0] = v19;
          v44[1] = v20;

          CGRect v21 = [v11 objectAtIndex:i + 2];
          [v21 PDFKitPDFPointValue];
          v43[0] = v22;
          v43[1] = v23;

          CGRect v24 = [v11 objectAtIndex:i + 3];
          [v24 PDFKitPDFPointValue];
          v42[0] = v25;
          v42[1] = v26;

          redactPath(CurrentContext, &points.x, v44, v43, v42, v9);
        }
      }
    }
    else
    {
      [v7 bounds];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      if (GetDefaultsWriteHighlightRedactions())
      {
        CGContextSetLineWidth(CurrentContext, 1.0);
        double v35 = [MEMORY[0x263F825C8] blackColor];
        +[PDFAnnotationDrawing strokeRect:color:context:](PDFAnnotationDrawing, "strokeRect:color:context:", v35, CurrentContext, v28, v30, v32, v34);
      }
      else
      {
        v53.origin.CGFloat x = v28;
        v53.origin.CGFloat y = v30;
        v53.size.CGFloat width = v32;
        v53.size.CGFloat height = v34;
        CGContextClipToRect(CurrentContext, v53);
        CGRect v36 = [MEMORY[0x263F825C8] blackColor];
        CGRect v37 = [v36 colorWithAlphaComponent:0.5];
        +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v37, CurrentContext, v28, v30, v32, v34);

        CGContextSetRGBStrokeColor(CurrentContext, 0.333333, 0.333333, 0.333333, 1.0);
        CGContextSetLineWidth(CurrentContext, 1.0);
        v54.origin.CGFloat x = v28;
        v54.origin.CGFloat y = v30;
        v54.size.CGFloat width = v32;
        v54.size.CGFloat height = v34;
        CGFloat MinX = CGRectGetMinX(v54);
        v55.origin.CGFloat x = v28;
        v55.origin.CGFloat y = v30;
        v55.size.CGFloat width = v32;
        v55.size.CGFloat height = v34;
        points.CGFloat x = MinX;
        points.CGFloat y = CGRectGetMinY(v55);
        v56.origin.CGFloat x = v28;
        v56.origin.CGFloat y = v30;
        v56.size.CGFloat width = v32;
        v56.size.CGFloat height = v34;
        CGFloat MaxX = CGRectGetMaxX(v56);
        v57.origin.CGFloat x = v28;
        v57.origin.CGFloat y = v30;
        v57.size.CGFloat width = v32;
        v57.size.CGFloat height = v34;
        CGFloat v46 = MaxX;
        CGFloat MaxY = CGRectGetMaxY(v57);
        v58.origin.CGFloat x = v28;
        v58.origin.CGFloat y = v30;
        v58.size.CGFloat width = v32;
        v58.size.CGFloat height = v34;
        CGFloat v40 = CGRectGetMinX(v58);
        v59.origin.CGFloat x = v28;
        v59.origin.CGFloat y = v30;
        v59.size.CGFloat width = v32;
        v59.size.CGFloat height = v34;
        CGFloat v48 = v40;
        CGFloat v49 = CGRectGetMaxY(v59);
        v60.origin.CGFloat x = v28;
        v60.origin.CGFloat y = v30;
        v60.size.CGFloat width = v32;
        v60.size.CGFloat height = v34;
        CGFloat v41 = CGRectGetMaxX(v60);
        v61.origin.CGFloat x = v28;
        v61.origin.CGFloat y = v30;
        v61.size.CGFloat width = v32;
        v61.size.CGFloat height = v34;
        CGFloat v50 = v41;
        CGFloat MinY = CGRectGetMinY(v61);
        CGContextSetLineWidth(CurrentContext, 1.0);
        CGContextStrokeLineSegments(CurrentContext, &points, 4uLL);
      }
    }
    CGContextRestoreGState(CurrentContext);
  }
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withButtonWidgetAnnotation:(id)a5
{
  id v46 = a5;
  id v7 = [v46 page];
  [v46 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  CGFloat v16 = [v46 interactiveBackgroundColor];
  CGFloat v17 = [v46 valueForAnnotationKey:@"/MK"];
  uint64_t v18 = [v46 buttonWidgetState];
  uint64_t v19 = [v46 widgetControlType];
  char v20 = [v46 isHighlighted];
  if ((unint64_t)a3 > 4) {
    goto LABEL_35;
  }
  char v21 = v20;
  if (!CurrentContext)
  {
    CurrentContext = PDFGraphicsGetCurrentContext();
    if (!CurrentContext) {
      goto LABEL_35;
    }
  }
  if (v16)
  {
    id v22 = v16;
    ColorSpace = CGColorGetColorSpace((CGColorRef)[v22 CGColor]);
    Components = CGColorGetComponents((CGColorRef)[v22 CGColor]);
    CGContextSetFillColorSpace(CurrentContext, ColorSpace);
    CGContextSetFillColor(CurrentContext, Components);
    v48.origin.CGFloat x = PDFRectToCGRect(v25);
    CGContextFillRect(CurrentContext, v48);
  }
  if ((v21 & 1) == 0)
  {
    if (![v46 appearance:0]) {
      goto LABEL_24;
    }
    uint64_t v33 = [v46 appearance:0];
    uint64_t v34 = [v46 appearance:3];
    uint64_t v29 = 0;
    if (v19)
    {
      if (!v18)
      {
        uint64_t v29 = 3;
        if (v33)
        {
          if (!v34) {
            goto LABEL_35;
          }
        }
      }
    }
    if (![v46 appearance:v29]) {
      goto LABEL_24;
    }
LABEL_23:
    objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:scaleProportional:", v29, v46, a3, CurrentContext, objc_msgSend(v17, "scaleProportional"));
    goto LABEL_35;
  }
  BOOL v26 = v19 != 0;
  BOOL v27 = v18 == 0;
  BOOL v28 = v26 && v27;
  if (v26 && v27) {
    uint64_t v29 = 5;
  }
  else {
    uint64_t v29 = 2;
  }
  if ([v46 appearance:v29]) {
    goto LABEL_23;
  }
  uint64_t v43 = [v46 appearance:0];
  uint64_t v30 = [v46 appearance:3];
  uint64_t v31 = 0;
  if (v28)
  {
    uint64_t v31 = 3;
    if (v43)
    {
      if (!v30) {
        goto LABEL_35;
      }
    }
  }
  if ([v46 appearance:v31])
  {
    objc_msgSend(a1, "drawAppearance:ofAnnotation:withBox:inContext:scaleProportional:", v31, v46, a3, CurrentContext, objc_msgSend(v17, "scaleProportional"));
    CGContextSaveGState(CurrentContext);
    double v32 = PDFColorCreateFromWhiteAlpha([v7 transformContext:CurrentContext forBox:a3], 0.0, 0.25);
    if (v19 == 1) {
      objc_msgSend(a1, "fillOval:color:context:", v32, CurrentContext, v9, v11, v13, v15);
    }
    else {
      objc_msgSend(a1, "fillRect:color:context:", v32, CurrentContext, v9, v11, v13, v15);
    }

    CGContextRestoreGState(CurrentContext);
    goto LABEL_35;
  }
LABEL_24:
  CGContextSaveGState(CurrentContext);
  [v7 transformContext:CurrentContext forBox:a3];
  uint64_t v42 = [v17 backgroundColor];
  double v35 = [v17 borderColor];
  CGRect v36 = [v17 caption];
  CGRect v44 = [v46 font];
  CGRect v37 = [v46 fontColor];
  if (!v36)
  {
    CGRect v36 = [v46 valueForAnnotationKey:@"/Contents"];
  }
  if (v19 == 2)
  {
    LOBYTE(v41) = v21;
    uint64_t v39 = v18;
    CGRect v38 = (void *)v42;
    [a1 drawCheckBox:v46 inContext:CurrentContext withState:v39 withBackgroundColor:v42 withBorderColor:v35 withFontColor:v37 isHighlighted:v41];
  }
  else if (v19 == 1)
  {
    LOBYTE(v41) = v21;
    uint64_t v40 = v18;
    CGRect v38 = (void *)v42;
    [a1 drawRadioButton:v46 inContext:CurrentContext withState:v40 withBackgroundColor:v42 withBorderColor:v35 withFontColor:v37 isHighlighted:v41];
  }
  else
  {
    CGRect v38 = (void *)v42;
    if (!v19)
    {
      LOBYTE(v41) = v21;
      [a1 drawPushButton:v46 inContext:CurrentContext withBackgroundColor:v42 withCaption:v36 withFont:v44 withFontColor:v37 isHighlighted:v41];
    }
  }
  CGContextRestoreGState(CurrentContext);

LABEL_35:
}

+ (void)drawPushButton:(id)a3 inContext:(CGContext *)a4 withBackgroundColor:(id)a5 withCaption:(id)a6 withFont:(id)a7 withFontColor:(id)a8 isHighlighted:(BOOL)a9
{
  id v35 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  [v35 bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  BOOL v26 = [v35 page];
  uint64_t v27 = [v26 rotation];

  if (v14) {
    +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v14, a4, v19, v21, v23, v25);
  }
  if (v15)
  {
    [v16 pointSize];
    double v29 = (v25 - v28) * -0.5;
    if (!v16)
    {
      uint64_t v30 = (void *)MEMORY[0x263F82760];
      [MEMORY[0x263F82760] systemFontSize];
      objc_msgSend(v30, "systemFontOfSize:");
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    double v31 = v25 + v29;
    if (!v17)
    {
      id v17 = [MEMORY[0x263F825C8] blackColor];
    }
    +[PDFAnnotationDrawing renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:](PDFAnnotationDrawing, "renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:", v15, v16, v17, 1, v27, 0, v19, v21, v23, v31, a4, v35);
  }
  uint64_t v32 = [v35 valueForAnnotationKey:@"/C"];
  uint64_t v33 = (void *)v32;
  if (v32) {
    uint64_t v32 = +[PDFAnnotationDrawing strokeRect:color:context:](PDFAnnotationDrawing, "strokeRect:color:context:", v32, a4, v19, v21, v23, v25);
  }
  if (a9)
  {
    uint64_t v34 = PDFColorCreateFromWhiteAlpha(v32, 0.0, 0.25);
    +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v34, a4, v19, v21, v23, v25);
  }
}

+ (void)drawRadioButton:(id)a3 inContext:(CGContext *)a4 withState:(int64_t)a5 withBackgroundColor:(id)a6 withBorderColor:(id)a7 withFontColor:(id)a8 isHighlighted:(BOOL)a9
{
  id v34 = a6;
  id v14 = a7;
  id v15 = a8;
  id v16 = a3;
  [v16 bounds];
  double x = v17;
  double y = v19;
  double width = v21;
  double v24 = v23;
  double v25 = [v16 valueForAnnotationKey:@"/Border"];

  CGContextSaveGState(a4);
  LODWORD(v26) = 1.0;
  if (v25)
  {
    objc_msgSend(v25, "lineWidth", v26);
    *(float *)&double v26 = v26;
    if (*(float *)&v26 == 0.0) {
      LODWORD(v26) = 1.0;
    }
  }
  double v27 = *(float *)&v26;
  CGContextSetLineWidth(a4, *(float *)&v26);
  BOOL v28 = width < v24;
  double v29 = x + (width - v24) * 0.5;
  if (width < v24) {
    double y = y + (v24 - width) * 0.5;
  }
  else {
    double width = v24;
  }
  if (!v28) {
    double x = v29;
  }
  if (v34) {
    +[PDFAnnotationDrawing fillOval:color:context:](PDFAnnotationDrawing, "fillOval:color:context:", v34, a4, x, y, width, width);
  }
  if (!v14)
  {
    id v14 = [MEMORY[0x263F825C8] blackColor];
  }
  v36.origin.double x = x;
  v36.origin.double y = y;
  v36.size.double width = width;
  v36.size.double height = width;
  CGRect v37 = PDFRectInset(v36, v27 * 0.5, v27 * 0.5);
  uint64_t v30 = +[PDFAnnotationDrawing strokeOval:color:context:](PDFAnnotationDrawing, "strokeOval:color:context:", v14, a4, v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
  if (a5 != 1)
  {
    double height = width;
    if (!a9) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v38.origin.double x = x;
  v38.origin.double y = y;
  v38.size.double width = width;
  v38.size.double height = width;
  CGRect v39 = PDFRectInset(v38, width * 0.25, width * 0.25);
  double x = v39.origin.x;
  double y = v39.origin.y;
  double width = v39.size.width;
  double height = v39.size.height;
  id v32 = v15;
  if (!v32)
  {
    id v32 = [MEMORY[0x263F825C8] blackColor];
  }
  +[PDFAnnotationDrawing fillOval:color:context:](PDFAnnotationDrawing, "fillOval:color:context:", v32, a4, x, y, width, height);

  if (a9)
  {
LABEL_19:
    uint64_t v33 = PDFColorCreateFromWhiteAlpha(v30, 0.0, 0.25);
    +[PDFAnnotationDrawing fillOval:color:context:](PDFAnnotationDrawing, "fillOval:color:context:", v33, a4, x, y, width, height);
  }
LABEL_20:
  CGContextRestoreGState(a4);
}

+ (void)drawCheckBox:(id)a3 inContext:(CGContext *)a4 withState:(int64_t)a5 withBackgroundColor:(id)a6 withBorderColor:(id)a7 withFontColor:(id)a8 isHighlighted:(BOOL)a9
{
  id v42 = a6;
  id v14 = a7;
  id v15 = a8;
  [a3 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  CGContextSaveGState(a4);
  uint64_t v24 = (uint64_t)v42;
  if (v42) {
    uint64_t v24 = +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v42, a4, v17, v19, v21, v23);
  }
  if (!v15)
  {
    PDFColorCreateFromWhiteAlpha(v24, 0.0, 1.0);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v25 = v15;
  double v26 = (CGColor *)[v25 CGColor];
  ColorSpace = CGColorGetColorSpace(v26);
  Components = CGColorGetComponents(v26);
  CGContextSetStrokeColorSpace(a4, ColorSpace);
  CGContextSetStrokeColor(a4, Components);
  if (a5 == 1)
  {
    float v29 = (v21 - v23) * 0.5;
    double v30 = v29;
    float v31 = (v23 - v21) * 0.5;
    double v32 = v31;
    if (v21 < v23) {
      double v33 = v21;
    }
    else {
      double v33 = v23;
    }
    if (v21 < v23) {
      double v34 = 0.0;
    }
    else {
      double v34 = v30;
    }
    if (v21 < v23) {
      double v35 = v32;
    }
    else {
      double v35 = 0.0;
    }
    float v36 = v33;
    CGContextBeginPath(a4);
    double v37 = v17 + v34;
    double v38 = v36;
    double v39 = v19 + v35;
    CGContextMoveToPoint(a4, v37 + v38 * 0.15, v39 + v38 * 0.45);
    CGContextAddLineToPoint(a4, v37 + v38 * 0.35, v39 + v38 * 0.25);
    CGContextAddLineToPoint(a4, v37 + v38 * 0.85, v39 + v38 * 0.75);
    CGContextSetLineWidth(a4, 1.5);
    CGContextStrokePath(a4);
  }
  CGContextRestoreGState(a4);
  if (!v14)
  {
    id v14 = [MEMORY[0x263F825C8] blackColor];
  }
  uint64_t v40 = +[PDFAnnotationDrawing strokeRect:color:context:](PDFAnnotationDrawing, "strokeRect:color:context:", v14, a4, v17, v19, v21, v23);
  if (a9)
  {
    uint64_t v41 = PDFColorCreateFromWhiteAlpha(v40, 0.0, 0.25);
    +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v41, a4, v17, v19, v21, v23);
  }
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withChoiceWidgetAnnotation:(id)a5
{
  id v30 = a5;
  double v8 = [v30 page];
  [v30 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [v30 interactiveBackgroundColor];
  double v18 = [v30 widgetStringValue];
  double v19 = [v30 widgetDefaultStringValue];
  if (v17) {
    +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v17, CurrentContext, v10, v12, v14, v16);
  }
  if ([v30 appearance:0] && v19 && objc_msgSend(v19, "isEqualToString:", v18))
  {
    [a1 drawAppearance:0 ofAnnotation:v30 withBox:a3 inContext:CurrentContext];
    goto LABEL_22;
  }
  if ((unint64_t)a3 <= 4 && (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0))
  {
    CGContextSaveGState(CurrentContext);
    [v8 transformContext:CurrentContext forBox:a3];
    double v20 = [v30 valueForAnnotationKey:@"/MK"];
    double v21 = [v20 backgroundColor];
    int v22 = [v30 isListChoice];
    double v27 = [v30 choices];
    float v29 = [v30 font];
    BOOL v28 = [v30 fontColor];
    double v23 = [v30 valueForAnnotationKey:@"/Border"];
    if (v21) {
      +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v21, CurrentContext, v10, v12, v14, v16);
    }
    if (v22)
    {
      objc_msgSend(a1, "drawListBox:inContext:withAnnotation:withOptions:withStringValue:withFont:withFontColor:", CurrentContext, v30, v27, v18, v29, v28, v10, v12, v14, v16);
      if (!v23) {
        goto LABEL_19;
      }
    }
    else
    {
      objc_msgSend(a1, "drawComboBox:inContext:withAnnotation:withStringValue:withFont:withFontColor:", CurrentContext, v30, v18, v29, v28, v10, v12, v14, v16);
      if (!v23)
      {
LABEL_19:
        if ((v22 & 1) == 0) {
          objc_msgSend(a1, "drawDisclosureBox:inContext:", CurrentContext, v10, v12, v14, v16);
        }
        CGContextRestoreGState(CurrentContext);

        goto LABEL_22;
      }
    }
    double v26 = v20;
    uint64_t v24 = [v20 borderColor];
    if (!v24)
    {
      uint64_t v24 = [MEMORY[0x263F825C8] blackColor];
    }
    id v25 = v24;
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v25 CGColor]);
    objc_msgSend(v23, "drawInRect:inContext:", CurrentContext, v10, v12, v14, v16);

    double v20 = v26;
    goto LABEL_19;
  }
LABEL_22:
}

+ (void)drawListBox:(CGRect)a3 inContext:(CGContext *)a4 withAnnotation:(id)a5 withOptions:(id)a6 withStringValue:(id)a7 withFont:(id)a8 withFontColor:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v37 = a5;
  id v18 = a6;
  id v36 = a7;
  id v19 = a8;
  id v20 = a9;
  if (v18)
  {
    uint64_t v21 = [v18 count];
    if (v21 >= 1)
    {
      uint64_t v22 = v21;
      double v23 = x + 1.0;
      double v24 = width + -1.0;
      [v19 pointSize];
      uint64_t v25 = 0;
      double v27 = v26 + 2.0;
      double v28 = y + height - (v26 + 2.0);
      do
      {
        float v29 = [v18 objectAtIndex:v25];
        if ([v36 isEqualToString:v29])
        {
          id v30 = [MEMORY[0x263F825C8] groupTableViewBackgroundColor];
          +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v30, a4, v23, v28, v24, v27 + -0.1);
        }
        +[PDFAnnotationDrawing renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:](PDFAnnotationDrawing, "renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:", v29, v19, v20, 0, 0, 0, v23, v28, v24, v27, a4, v37);
        CGContextSaveGState(a4);
        id v31 = [MEMORY[0x263F825C8] grayColor];
        ColorSpace = CGColorGetColorSpace((CGColorRef)[v31 CGColor]);
        id v33 = v31;
        Components = CGColorGetComponents((CGColorRef)[v33 CGColor]);
        CGContextSetStrokeColorSpace(a4, ColorSpace);
        CGContextSetStrokeColor(a4, Components);
        CGContextSetLineWidth(a4, 0.2);
        CGContextMoveToPoint(a4, v23, v28);
        CGContextAddLineToPoint(a4, v24 + v23, v28);
        CGContextStrokePath(a4);
        CGContextRestoreGState(a4);
        v39.origin.double x = v23;
        v39.origin.double y = v28;
        v39.size.double width = v24;
        v39.size.double height = v27;
        CGRect v40 = PDFRectOffset(v39, 0.0, -v27);
        double v23 = v40.origin.x;
        double v28 = v40.origin.y;
        double v24 = v40.size.width;
        double v27 = v40.size.height;
        CGFloat v35 = v40.origin.y + v40.size.height;

        if (v35 < y) {
          break;
        }
        ++v25;
      }
      while (v22 > v25);
    }
  }
}

+ (void)drawComboBox:(CGRect)a3 inContext:(CGContext *)a4 withAnnotation:(id)a5 withStringValue:(id)a6 withFont:(id)a7 withFontColor:(id)a8
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v21 = a5;
  [v17 pointSize];
  CGFloat v20 = ceil((height - v19) * 0.5);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.double height = height;
  CGRect v24 = PDFRectInset(v23, 2.0, v20);
  +[PDFAnnotationDrawing renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:](PDFAnnotationDrawing, "renderString:forRect:font:color:alignment:rotation:breaks:context:withAnnotation:", v18, v17, v16, 0, 0, 0, v24.origin.x, v24.origin.y - (height - v24.size.height), v24.size.width, v24.size.height + height - v24.size.height, a4, v21);
}

+ (void)drawDisclosureBox:(CGRect)a3 inContext:(CGContext *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v22 = *MEMORY[0x263EF8340];
  CGContextSaveGState(a4);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    double v10 = DeviceRGB;
    CGContextSetFillColorSpace(a4, DeviceRGB);
    CGFloat v11 = PDFRectGetMaxX(x, y, width) + -8.0;
    CGFloat v12 = PDFRectGetMidY(x, y, width, height) + -2.5;
    __asm { FMOV            V1.2D, #0.5 }
    long long v20 = _Q1;
    long long v21 = xmmword_214423040;
    CGContextSetFillColor(a4, (const CGFloat *)&v20);
    v24.origin.double x = v11 + -4.5;
    v24.origin.double y = v12 + -2.0;
    v24.size.double width = 9.0;
    v24.size.double height = 9.0;
    CGContextFillEllipseInRect(a4, v24);
    __asm { FMOV            V0.2D, #1.0 }
    long long v20 = _Q0;
    long long v21 = _Q0;
    CGContextSetFillColor(a4, (const CGFloat *)&v20);
    CGContextBeginPath(a4);
    CGContextMoveToPoint(a4, v11, v12);
    CGFloat v19 = v12 + 4.0;
    CGContextAddLineToPoint(a4, v11 + -3.0, v19);
    CGContextAddLineToPoint(a4, v11 + 3.0, v19);
    CGContextClosePath(a4);
    CGContextFillPath(a4);
    CGContextRestoreGState(a4);
    CGColorSpaceRelease(v10);
  }
  else
  {
    CGContextRestoreGState(a4);
  }
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)CurrentContext withTextWidgetAnnotation:(id)a5
{
  id v44 = a5;
  double v8 = [v44 page];
  [v44 bounds];
  if ((unint64_t)a3 <= 4)
  {
    double v13 = v9;
    double v14 = v10;
    double v15 = v11;
    double v16 = v12;
    if (CurrentContext || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0)
    {
      Propertdouble y = CGContextGetProperty();
      uint64_t v18 = *MEMORY[0x263EFFB40];
      uint64_t v19 = [v44 appearance:0];
      if (v19) {
        [a1 drawAppearance:0 ofAnnotation:v44 withBox:a3 inContext:CurrentContext scaleProportional:1 suppressTextRendering:1];
      }
      CGContextSaveGState(CurrentContext);
      [v8 transformContext:CurrentContext forBox:a3];
      UIGraphicsPushContext(CurrentContext);
      [v8 boundsForBox:a3];
      CGContextTranslateCTM(CurrentContext, 0.0, v20 + v14 - (v20 - v14 - v16));
      CGContextScaleCTM(CurrentContext, 1.0, -1.0);
      if (Property == v18)
      {
        long long v21 = [v44 interactiveBackgroundColor];
      }
      else
      {
        long long v21 = 0;
      }
      v46.origin.double x = v13;
      v46.origin.double y = v14;
      v46.size.double width = v15;
      v46.size.double height = v16;
      CGRect v47 = PDFRectInset(v46, 1.0, 1.0);
      double x = v47.origin.x;
      double y = v47.origin.y;
      double width = v47.size.width;
      double height = v47.size.height;
      if (v19)
      {
        if (v21) {
          +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v21, CurrentContext, v47.origin.x, v47.origin.y, v47.size.width, v47.size.height);
        }
      }
      else
      {
        uint64_t v26 = [v44 backgroundColor];
        double v27 = (void *)v26;
        double v28 = v21;
        if (v21 || (double v28 = (void *)v26) != 0) {
          +[PDFAnnotationDrawing fillRect:color:context:](PDFAnnotationDrawing, "fillRect:color:context:", v28, CurrentContext, x, y, width, height);
        }

        float v29 = [v44 valueForAnnotationKey:@"/MK"];
        id v30 = [v29 borderColor];

        if (v30)
        {
          CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v30 CGColor]);
          id v31 = objc_alloc_init(PDFBorder);
          -[PDFBorder drawInRect:inContext:](v31, "drawInRect:inContext:", CurrentContext, v13, v14, v15, v16);
        }
      }
      double v32 = [v44 control];

      if (!v32)
      {
        id v33 = [v44 createAttributedStringForTextWidget];
        if ([v33 length])
        {
          +[PDFAnnotationDrawing textInset];
          CGFloat v35 = v34;
          +[PDFAnnotationDrawing textInset];
          double v37 = v36;
          if (([v44 isMultiline] & 1) == 0)
          {
            objc_msgSend(v33, "boundingRectWithSize:options:context:", 1, 0, v15, v16);
            double v37 = fmax((v16 - v38) * 0.5, 0.0);
          }
          v48.origin.double x = v13;
          v48.origin.double y = v14;
          v48.size.double width = v15;
          v48.size.double height = v16;
          CGRect v49 = CGRectInset(v48, v35, v37);
          double v39 = v49.origin.x;
          CGFloat v40 = v49.origin.y;
          double v41 = v49.size.width;
          double v42 = v49.size.height;
          double v43 = floor(CGRectGetMaxY(v49));
          v50.origin.double x = v39;
          v50.origin.double y = v40;
          v50.size.double width = v41;
          v50.size.double height = v42;
          objc_msgSend(v33, "drawWithRect:options:context:", 1, 0, v39, v43 - CGRectGetHeight(v50), v41, v42);
        }
      }
      UIGraphicsPopContext();
      CGContextRestoreGState(CurrentContext);
    }
  }
}

+ (id)createLigtherColor:(CGColor *)a3 withIntensity:(double)a4
{
  if (a3
    && CGColorGetNumberOfComponents(a3) == 4
    && (ColorSpace = CGColorGetColorSpace(a3), CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelRGB))
  {
    Components = CGColorGetComponents(a3);
    double v8 = fmax(*Components - a4, 0.0);
    double v9 = fmax(Components[1] - a4, 0.0);
    double v10 = fmax(Components[2] - a4, 0.0);
  }
  else
  {
    double v8 = 0.996;
    double v9 = 0.933;
    double v10 = 0.737;
  }
  double v11 = PDFCGColorCreateGenericRGB(v8, v9, v10, 1.0);

  return v11;
}

+ (id)stringByTrimmingTrailingCharactersInSet:(id)a3 forString:(id)a4
{
  id v5 = a4;
  double v6 = [a3 invertedSet];
  uint64_t v7 = [v5 rangeOfCharacterFromSet:v6 options:4];
  uint64_t v9 = v8;

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v10 = &stru_26C516768;
  }
  else
  {
    double v10 = [v5 substringToIndex:v7 + v9];
  }

  return v10;
}

+ (BOOL)renderString:(id)a3 forRect:(CGRect)a4 font:(id)a5 color:(id)a6 alignment:(int64_t)a7 rotation:(int)a8 breaks:(BOOL)a9 context:(CGContext *)c withAnnotation:(id)a11
{
  BOOL v11 = a9;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v70[1] = *MEMORY[0x263EF8340];
  double v20 = (__CFString *)a3;
  id v21 = a5;
  id v22 = a6;
  id v23 = a11;
  if (!v20)
  {
    BOOL v39 = 1;
    goto LABEL_45;
  }
  CGContextSaveGState(c);
  v72.origin.double x = x;
  v72.origin.double y = y;
  v72.size.double width = width;
  v72.size.double height = height;
  PDFRectIntegral(v72);
  v73.origin.double x = PDFRectToCGRect(v24);
  CGContextClipToRect(c, v73);
  uint64_t v25 = [v23 gcCreateAttributesForFont:v21 color:v22];
  if (!v25)
  {
    BOOL v39 = height >= 0.0;
    CGContextRestoreGState(c);
    goto LABEL_45;
  }
  uint64_t v26 = (__CFDictionary *)v25;
  if (a7 == 2)
  {
    double v27 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v28 = [a1 stringByTrimmingTrailingCharactersInSet:v27 forString:v20];

    double v20 = (__CFString *)v28;
  }
  id v64 = v23;
  if ([v23 shouldComb])
  {
    float v29 = [v23 valueForAnnotationKey:@"/MaxLen"];
    double v30 = (double)[v29 integerValue];

    if (!v21)
    {
      id v31 = (void *)MEMORY[0x263F82760];
      [MEMORY[0x263F82760] systemFontSize];
      objc_msgSend(v31, "systemFontOfSize:");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v69 = *MEMORY[0x263F82270];
    v70[0] = v21;
    double v32 = [NSDictionary dictionaryWithObjects:v70 forKeys:&v69 count:1];
    [(__CFString *)v20 sizeWithAttributes:v32];
    double v34 = v33;

    valuePtr.a = (width + -v34 / (double)(unint64_t)[(__CFString *)v20 length] * v30) / v30;
    CFAllocatorRef v35 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFNumberRef v36 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberCGFloatType, &valuePtr);
    CFDictionarySetValue(v26, (const void *)*MEMORY[0x263F03C88], v36);
    CFRelease(v36);
    LODWORD(descent) = 0;
    CFNumberRef v37 = CFNumberCreate(v35, kCFNumberIntType, &descent);
    CFDictionarySetValue(v26, (const void *)*MEMORY[0x263F03C98], v37);
    CFRelease(v37);
    double v38 = valuePtr.a * 0.5;
  }
  else
  {
    CFAllocatorRef v35 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    double v38 = 0.0;
  }
  cf = v26;
  CFAttributedStringRef v40 = CFAttributedStringCreate(v35, v20, v26);
  CFAttributedStringRef v41 = v40;
  if (v40)
  {
    CTTypesetterRef v42 = CTTypesetterCreateWithAttributedString(v40);
    if (v42)
    {
      double v43 = v42;
      CFIndex Length = CFAttributedStringGetLength(v41);
      double v45 = 0.0;
      id v61 = v21;
      id v62 = v22;
      if (a8 > 179)
      {
        if (a8 != 180)
        {
          if (a8 != 270) {
            goto LABEL_26;
          }
          CGContextTranslateCTM(c, x + width, y + height);
          double v46 = -90.0;
          goto LABEL_22;
        }
        CGContextTranslateCTM(c, x + width, y);
        double v48 = PDFDegToRad(180.0);
        CGContextRotateCTM(c, v48);
      }
      else
      {
        if (a8)
        {
          if (a8 != 90) {
            goto LABEL_26;
          }
          CGContextTranslateCTM(c, x, y);
          double v46 = 90.0;
LABEL_22:
          double v47 = PDFDegToRad(v46);
          CGContextRotateCTM(c, v47);
          double v45 = height;
          goto LABEL_26;
        }
        CGContextTranslateCTM(c, x, y + height);
      }
      double v45 = width;
LABEL_26:
      long long v49 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&valuePtr.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&valuePtr.c = v49;
      *(_OWORD *)&valuePtr.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      CGContextSetTextMatrix(c, &valuePtr);
      CFIndex v50 = 0;
      double v51 = 0.0;
      do
      {
        CFIndex v52 = Length;
        if (v11) {
          CFIndex v52 = CTTypesetterSuggestLineBreak(v43, v50, v45);
        }
        v71.location = v50;
        v71.length = v52;
        Line = CTTypesetterCreateLine(v43, v71);
        if (Line)
        {
          CGRect v54 = Line;
          CGFloat descent = 0.0;
          valuePtr.a = 0.0;
          CGFloat leading = 0.0;
          double TypographicBounds = CTLineGetTypographicBounds(Line, &valuePtr.a, &descent, &leading);
          double v56 = ceil(valuePtr.a);
          if (v51 == 0.0) {
            double v51 = v56 + 1.0;
          }
          else {
            double v51 = v51 + v56 + ceil(descent);
          }
          double v57 = v45 - TypographicBounds;
          double v58 = v57 * 0.5;
          double v59 = v38 + v57;
          if (a7 != 2) {
            double v59 = v58;
          }
          if (!a7) {
            double v59 = v38;
          }
          CGContextSetTextPosition(c, round(v59), round(-v51));
          CTLineDraw(v54, c);
          CFRelease(v54);
        }
        v50 += v52;
      }
      while (v50 < Length);
      BOOL v39 = v51 <= height;
      id v21 = v61;
      id v22 = v62;
      goto LABEL_40;
    }
  }
  double v43 = 0;
  BOOL v39 = height >= 0.0;
LABEL_40:
  CGContextRestoreGState(c);
  CFRelease(cf);
  if (v41) {
    CFRelease(v41);
  }
  if (v43) {
    CFRelease(v43);
  }
  id v23 = v64;
LABEL_45:

  return v39;
}

+ (void)fillRect:(CGRect)a3 color:(id)a4 context:(CGContext *)a5
{
  if (a4)
  {
    id v6 = a4;
    CGContextSaveGState(a5);
    id v7 = v6;
    ColorSpace = CGColorGetColorSpace((CGColorRef)[v7 CGColor]);
    id v9 = v7;
    double v10 = (CGColor *)[v9 CGColor];

    Components = CGColorGetComponents(v10);
    CGContextSetFillColorSpace(a5, ColorSpace);
    CGContextSetFillColor(a5, Components);
    v14.origin.double x = PDFRectToCGRect(v12);
    CGContextFillRect(a5, v14);
    CGContextRestoreGState(a5);
  }
}

+ (void)strokeRect:(CGRect)a3 color:(id)a4 context:(CGContext *)a5
{
  if (a4)
  {
    id v6 = a4;
    CGContextSaveGState(a5);
    id v7 = v6;
    ColorSpace = CGColorGetColorSpace((CGColorRef)[v7 CGColor]);
    id v9 = v7;
    double v10 = (CGColor *)[v9 CGColor];

    Components = CGColorGetComponents(v10);
    CGContextSetStrokeColorSpace(a5, ColorSpace);
    CGContextSetStrokeColor(a5, Components);
    v14.origin.double x = PDFRectToCGRect(v12);
    CGContextStrokeRect(a5, v14);
    CGContextRestoreGState(a5);
  }
}

+ (void)fillOval:(CGRect)a3 color:(id)a4 context:(CGContext *)a5
{
  if (a4)
  {
    id v6 = a4;
    CGContextSaveGState(a5);
    id v7 = v6;
    ColorSpace = CGColorGetColorSpace((CGColorRef)[v7 CGColor]);
    id v9 = v7;
    double v10 = (CGColor *)[v9 CGColor];

    Components = CGColorGetComponents(v10);
    CGContextSetFillColorSpace(a5, ColorSpace);
    CGContextSetFillColor(a5, Components);
    v14.origin.double x = PDFRectToCGRect(v12);
    CGContextFillEllipseInRect(a5, v14);
    CGContextRestoreGState(a5);
  }
}

+ (void)strokeOval:(CGRect)a3 color:(id)a4 context:(CGContext *)a5
{
  if (a4)
  {
    id v6 = a4;
    CGContextSaveGState(a5);
    id v7 = v6;
    ColorSpace = CGColorGetColorSpace((CGColorRef)[v7 CGColor]);
    id v9 = v7;
    double v10 = (CGColor *)[v9 CGColor];

    Components = CGColorGetComponents(v10);
    CGContextSetStrokeColorSpace(a5, ColorSpace);
    CGContextSetStrokeColor(a5, Components);
    v14.origin.double x = PDFRectToCGRect(v12);
    CGContextStrokeEllipseInRect(a5, v14);
    CGContextRestoreGState(a5);
  }
}

+ (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withUnknownAnnotation:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if ((unint64_t)a3 <= 4)
  {
    id v10 = v8;
    id v8 = (id)[v8 appearance:0];
    id v9 = v10;
    if (v8)
    {
      id v8 = (id)[a1 drawAppearance:0 ofAnnotation:v10 withBox:a3 inContext:a4];
      id v9 = v10;
    }
  }

  MEMORY[0x270F9A758](v8, v9);
}

@end