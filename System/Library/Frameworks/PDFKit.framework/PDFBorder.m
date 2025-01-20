@interface PDFBorder
- (BOOL)_isRectangular;
- (BOOL)setBorderCharacteristicsFromArray:(CGPDFArray *)a3;
- (CGFloat)lineWidth;
- (NSArray)dashPattern;
- (NSDictionary)borderKeyValues;
- (PDFBorder)init;
- (PDFBorder)initWithAnnotationDictionary:(CGPDFDictionary *)a3 forPage:(id)a4;
- (PDFBorderStyle)style;
- (__CFDictionary)createDictionaryRef;
- (const)dashPatternRaw;
- (double)horizontalCornerRadius;
- (double)verticalCornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)dashCountRaw;
- (void)_setDashFromArray:(CGPDFArray *)a3;
- (void)_setStyleFromDictionary:(CGPDFDictionary *)a3;
- (void)_updateDashPatternRaw;
- (void)dealloc;
- (void)drawInRect:(CGRect)a3 inContext:(CGContext *)CurrentContext;
- (void)drawInRect:(CGRect)rect;
- (void)encodeWithCoder:(id)a3;
- (void)setAnnotation:(id)a3;
- (void)setDashPattern:(NSArray *)dashPattern;
- (void)setHorizontalCornerRadius:(double)a3;
- (void)setLineWidth:(CGFloat)lineWidth;
- (void)setStyle:(PDFBorderStyle)style;
- (void)setVerticalCornerRadius:(double)a3;
- (void)updateCornerBorderStyle;
@end

@implementation PDFBorder

- (PDFBorder)init
{
  v8.receiver = self;
  v8.super_class = (Class)PDFBorder;
  v2 = [(PDFBorder *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(PDFBorderPrivateVars);
    v4 = v2->_private;
    v2->_private = v3;

    objc_storeWeak((id *)&v2->_private->annotation, 0);
    v2->_private->style = 0;
    v2->_private->hCornerRadius = 0.0;
    v2->_private->vCornerRadius = 0.0;
    v2->_private->lineWidth = 1.0;
    v2->_private->dashCount = 0;
    v5 = v2->_private;
    dashPattern = v5->dashPattern;
    v5->dashPattern = 0;

    v2->_private->dashPatternRaw = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStyle:", -[PDFBorder style](self, "style"));
  [(PDFBorder *)self lineWidth];
  objc_msgSend(v4, "setLineWidth:");
  v5 = [(PDFBorder *)self dashPattern];
  [v4 setDashPattern:v5];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PDFBorder style](self, "style"), @"PDFBorderStyle");
  [(PDFBorder *)self lineWidth];
  objc_msgSend(v4, "encodeDouble:forKey:", @"PDFBorderLineWidth");
  id v5 = [(PDFBorder *)self dashPattern];
  [v4 encodeObject:v5 forKey:@"PDFBorderDashPattern"];
}

- (void)dealloc
{
  v3 = self->_private;
  dashPatternRaw = v3->dashPatternRaw;
  if (dashPatternRaw)
  {
    free(dashPatternRaw);
    v3 = self->_private;
  }
  v3->dashPatternRaw = 0;
  v5.receiver = self;
  v5.super_class = (Class)PDFBorder;
  [(PDFBorder *)&v5 dealloc];
}

- (id)description
{
  unint64_t style = self->_private->style;
  if (style > 4) {
    v3 = @"<unknown>";
  }
  else {
    v3 = off_264204BC8[style];
  }
  return (id)[NSString stringWithFormat:@"PDFBorder: {%@ lineWidth:%.1f hCorner:%.1f vCorner:%.1f dashCount:%lu dashPattern:%@}", v3, *(void *)&self->_private->lineWidth, *(void *)&self->_private->hCornerRadius, *(void *)&self->_private->vCornerRadius, self->_private->dashCount, self->_private->dashPattern];
}

- (PDFBorderStyle)style
{
  return self->_private->style;
}

- (void)setStyle:(PDFBorderStyle)style
{
  self->_private->unint64_t style = style;
  PDFBorderStyle v4 = [(PDFBorder *)self style];
  objc_super v5 = self->_private;
  if (v4 == kPDFBorderStyleDashed && !v5->dashPattern)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = [NSNumber numberWithInteger:3];
    [v6 addObject:v7];

    objc_super v8 = [NSNumber numberWithInteger:2];
    [v6 addObject:v8];

    uint64_t v9 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v6];
    v10 = self->_private;
    dashPattern = v10->dashPattern;
    v10->dashPattern = (NSArray *)v9;

    self->_private->dashCount = 2;
    [(PDFBorder *)self _updateDashPatternRaw];

    objc_super v5 = self->_private;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v5->annotation);
  if (WeakRetained)
  {
    id v13 = WeakRetained;
    [WeakRetained updateAnnotationEffect];
    id WeakRetained = v13;
  }
}

- (CGFloat)lineWidth
{
  return self->_private->lineWidth;
}

- (void)setLineWidth:(CGFloat)lineWidth
{
  v3 = self->_private;
  double v4 = v3->lineWidth;
  v3->lineWidth = lineWidth;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->annotation);
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    [WeakRetained updateAnnotationEffect];
    id v6 = objc_alloc_init(PDFBorder);
    [(PDFBorder *)v6 setLineWidth:v4];
    [v7 presentRedactionDiscoverabilityAlertWithOldValue:v6 forAnnotationKey:@"/Border"];

    id WeakRetained = v7;
  }
}

- (NSArray)dashPattern
{
  return self->_private->dashPattern;
}

- (void)setDashPattern:(NSArray *)dashPattern
{
  id v10 = (id)[(NSArray *)dashPattern copy];
  self->_private->dashCount = [v10 count];
  double v4 = self->_private;
  if (v4->dashCount >= 11) {
    v4->dashCount = 10;
  }
  uint64_t v5 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v10];
  id v6 = self->_private;
  id v7 = v6->dashPattern;
  v6->dashPattern = (NSArray *)v5;

  [(PDFBorder *)self _updateDashPatternRaw];
  [(PDFBorder *)self setStyle:self->_private->dashCount != 0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->annotation);
  uint64_t v9 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained updateAnnotationEffect];
  }
}

- (void)drawInRect:(CGRect)rect
{
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  CGContextRef CurrentContext = PDFGraphicsGetCurrentContext();

  -[PDFBorder drawInRect:inContext:](self, "drawInRect:inContext:", CurrentContext, x, y, width, height);
}

- (NSDictionary)borderKeyValues
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  double v4 = [NSNumber numberWithDouble:self->_private->lineWidth];
  [v3 setValue:v4 forKey:@"W"];

  uint64_t v5 = [NSNumber numberWithInteger:self->_private->style];
  [v3 setValue:v5 forKey:@"S"];

  dashPattern = self->_private->dashPattern;
  if (dashPattern)
  {
    id v7 = (void *)[(NSArray *)dashPattern copyWithZone:0];
    [v3 setValue:v7 forKey:@"D"];
  }

  return (NSDictionary *)v3;
}

- (PDFBorder)initWithAnnotationDictionary:(CGPDFDictionary *)a3 forPage:(id)a4
{
  id v6 = a4;
  CGPDFDictionaryRef v8 = 0;
  CGPDFArrayRef value = 0;
  if (a3)
  {
    self = [(PDFBorder *)self init];
    if (self)
    {
      if (CGPDFDictionaryGetDictionary(a3, "BS", &v8))
      {
        [(PDFBorder *)self _setStyleFromDictionary:v8];
LABEL_7:
        self = self;
        a3 = (CGPDFDictionary *)self;
        goto LABEL_9;
      }
      if (!CGPDFDictionaryGetArray(a3, "Border", &value)
        || [(PDFBorder *)self setBorderCharacteristicsFromArray:value])
      {
        goto LABEL_7;
      }
    }
    a3 = 0;
  }
LABEL_9:

  return (PDFBorder *)a3;
}

- (__CFDictionary)createDictionaryRef
{
  [(PDFBorder *)self lineWidth];
  double v4 = v3;
  double valuePtr = v3;
  PDFBorderStyle v5 = [(PDFBorder *)self style];
  if (v4 == 1.0 && v5 == kPDFBorderStyleSolid) {
    return 0;
  }
  PDFBorderStyle v7 = v5;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v4 != 1.0)
  {
    CFNumberRef v10 = CFNumberCreate(v8, kCFNumberDoubleType, &valuePtr);
    CFDictionarySetValue(Mutable, @"/W", v10);
    CFRelease(v10);
  }
  switch(v7)
  {
    case kPDFBorderStyleDashed:
      CFDictionarySetValue(Mutable, @"/S", @"/D");
      v11 = self->_private;
      if (v11->dashCount >= 1)
      {
        dashPattern = (__CFString *)v11->dashPattern;
        if (dashPattern)
        {
          id v13 = @"/D";
          goto LABEL_15;
        }
      }
      return Mutable;
    case kPDFBorderStyleBeveled:
      id v13 = @"/S";
      dashPattern = @"/B";
      goto LABEL_15;
    case kPDFBorderStyleInset:
      id v13 = @"/S";
      dashPattern = @"/I";
      goto LABEL_15;
    case kPDFBorderStyleUnderline:
      id v13 = @"/S";
      dashPattern = @"/U";
LABEL_15:
      CFDictionarySetValue(Mutable, v13, dashPattern);
      break;
    default:
      return Mutable;
  }
  return Mutable;
}

- (void)setAnnotation:(id)a3
{
}

- (BOOL)_isRectangular
{
  [(PDFBorder *)self horizontalCornerRadius];
  if (v3 != 0.0) {
    return 0;
  }
  [(PDFBorder *)self verticalCornerRadius];
  return v4 == 0.0;
}

- (const)dashPatternRaw
{
  return self->_private->dashPatternRaw;
}

- (void)_updateDashPatternRaw
{
  double v3 = self->_private;
  dashPatternRaw = v3->dashPatternRaw;
  if (dashPatternRaw)
  {
    free(dashPatternRaw);
    double v3 = self->_private;
  }
  self->_private->dashPatternRaw = (double *)malloc_type_malloc(8 * v3->dashCount, 0x100004000313F17uLL);
  PDFBorderStyle v5 = self->_private;
  if (v5->dashCount >= 1)
  {
    int64_t v6 = 0;
    do
    {
      PDFBorderStyle v7 = [(NSArray *)v5->dashPattern objectAtIndex:v6];
      [v7 floatValue];
      self->_private->dashPatternRaw[v6] = v8;

      ++v6;
      PDFBorderStyle v5 = self->_private;
    }
    while (v5->dashCount > v6);
  }
}

- (unsigned)dashCountRaw
{
  return self->_private->dashCount;
}

- (void)drawInRect:(CGRect)a3 inContext:(CGContext *)CurrentContext
{
  long long v86 = 0uLL;
  [(PDFBorder *)self lineWidth];
  if (v6 != 0.0)
  {
    double v7 = v6;
    if (CurrentContext || (CGContextRef CurrentContext = PDFGraphicsGetCurrentContext()) != 0)
    {
      double v83 = v7;
      CGContextSaveGState(CurrentContext);
      PDFBorderStyle v8 = [(PDFBorder *)self style];
      CTM = CGContextGetCTM(&v85, CurrentContext);
      double a = v85.a;
      CGFloat b = v85.b;
      double c = v85.c;
      CGFloat d = v85.d;
      long long v86 = *(_OWORD *)&v85.tx;
      v87.origin.double x = PDFRectToCGRect(CTM);
      v85.double a = a;
      v85.CGFloat b = b;
      v85.double c = c;
      v85.CGFloat d = d;
      *(_OWORD *)&v85.tdouble x = v86;
      CGRect v88 = CGRectApplyAffineTransform(v87, &v85);
      CGRect v89 = CGRectIntegral(v88);
      CGFloat v14 = PDFRectFromCGRect(v89.origin.x, v89.origin.y, v89.size.width, v89.size.height);
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      v85.double a = a;
      v85.CGFloat b = b;
      v85.double c = c;
      v85.CGFloat d = d;
      *(_OWORD *)&v85.tdouble x = v86;
      CGAffineTransformInvert(&transform, &v85);
      CGContextConcatCTM(CurrentContext, &transform);
      if ([(PDFBorder *)self _isRectangular])
      {
        v21 = (void *)MEMORY[0x263F824C0];
        v90.origin.double x = v14;
        CGFloat v22 = v83;
        v90.origin.double y = v16;
        v90.size.double width = v18;
        v90.size.double height = v20;
        CGRect v91 = PDFRectInset(v90, v83 * 0.5, v83 * 0.5);
        v23 = objc_msgSend(v21, "bezierPathWithRect:", v91.origin.x, v91.origin.y, v91.size.width, v91.size.height);
      }
      else
      {
        [(PDFBorder *)self horizontalCornerRadius];
        double v24 = v14;
        double v26 = v25;
        [(PDFBorder *)self verticalCornerRadius];
        double v78 = fabs(c * v26 + a * v26);
        double v28 = fabs(c * v27 + a * v27);
        v23 = [MEMORY[0x263F824C0] bezierPath];
        double v82 = v16;
        double v29 = v83 * 0.5 + PDFRectGetMinX(v24, v16, v18);
        double MaxY = PDFRectGetMaxY(v24, v16, v18, v20);
        objc_msgSend(v23, "moveToPoint:", PDFPointMake(v29, MaxY - (v83 * 0.5 + v28)));
        double v31 = PDFPointMake(v78, v28);
        double v33 = v32;
        double v81 = v20;
        double v34 = PDFPointMake(0.0, v28 * 0.55228);
        double v35 = v18;
        double v37 = v36;
        double v38 = PDFPointMake(v78 - 0.55228 * v78, v28);
        PDFKitAddRelativeCurveToPoint(v23, v31, v33, v34, v37, v38, v39);
        double v80 = v35;
        double v40 = PDFRectGetMaxX(v24, v82, v35) - (v83 * 0.5 + v78);
        double v41 = PDFRectGetMaxY(v24, v82, v35, v81);
        double v42 = PDFPointMake(v40, v41 - v83 * 0.5);
        PDFKitAddLineToPoint(v23, v42);
        double v43 = v28;
        double v79 = -v28;
        double v44 = PDFPointMake(v78, -v28);
        double v46 = v45;
        double v47 = PDFPointMake(v78 * 0.55228, 0.0);
        double v49 = v48;
        double v50 = PDFPointMake(v78, -(v43 - 0.55228 * v43));
        PDFKitAddRelativeCurveToPoint(v23, v44, v46, v47, v49, v50, v51);
        double v52 = PDFRectGetMaxX(v24, v82, v80) - v83 * 0.5;
        double MinY = PDFRectGetMinY(v24, v82, v80, v81);
        double v54 = v43;
        double v55 = PDFPointMake(v52, v83 * 0.5 + v43 + MinY);
        PDFKitAddLineToPoint(v23, v55);
        double v56 = PDFPointMake(-v78, v79);
        double v58 = v57;
        double v59 = PDFPointMake(0.0, -(v54 * 0.55228));
        double v61 = v60;
        double v62 = PDFPointMake(-(v78 - 0.55228 * v78), v79);
        PDFKitAddRelativeCurveToPoint(v23, v56, v58, v59, v61, v62, v63);
        double v64 = v83 * 0.5 + v78 + PDFRectGetMinX(v24, v82, v80);
        double v65 = PDFRectGetMinY(v24, v82, v80, v81);
        double v66 = PDFPointMake(v64, v83 * 0.5 + v65);
        PDFKitAddLineToPoint(v23, v66);
        double v67 = v54;
        double v68 = PDFPointMake(-v78, v54);
        double v70 = v69;
        double v71 = PDFPointMake(-(v78 * 0.55228), 0.0);
        double v73 = v72;
        double v74 = PDFPointMake(-v78, v67 - 0.55228 * v67);
        CGFloat v22 = v83;
        PDFKitAddRelativeCurveToPoint(v23, v68, v70, v71, v73, v74, v75);
        [v23 closePath];
      }
      CGContextSetLineWidth(CurrentContext, v22);
      if (v8 == kPDFBorderStyleDashed) {
        [v23 setLineDash:self->_private->dashPatternRaw count:self->_private->dashCount phase:0.0];
      }
      v76 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v23, 0);
      v77 = +[PDFAnnotationDrawing createCGPathArrayWithBezierPaths:v76];
      if ([v76 count] && v77)
      {
        if (*v77)
        {
          CGContextAddPath(CurrentContext, *v77);
          CGContextStrokePath(CurrentContext);
          CGPathRelease(*v77);
          free(v77);
        }
      }
      CGContextRestoreGState(CurrentContext);
    }
  }
}

- (void)_setStyleFromDictionary:(CGPDFDictionary *)a3
{
  CGPDFArrayRef v14 = 0;
  CGPDFReal value = 0.0;
  __s1 = 0;
  if (CGPDFDictionaryGetNumber(a3, "W", &value)) {
    self->_private->lineWidth = value;
  }
  if (CGPDFDictionaryGetName(a3, "S", (const char **)&__s1))
  {
    PDFBorderStyle v5 = __s1;
    if (!strcmp(__s1, "S"))
    {
      int64_t v6 = 0;
    }
    else if (!strcmp(v5, "D"))
    {
      int64_t v6 = 1;
    }
    else if (!strcmp(v5, "B"))
    {
      int64_t v6 = 2;
    }
    else if (!strcmp(v5, "I"))
    {
      int64_t v6 = 3;
    }
    else
    {
      if (strcmp(v5, "U")) {
        goto LABEL_15;
      }
      int64_t v6 = 4;
    }
    self->_private->unint64_t style = v6;
  }
LABEL_15:
  if ([(PDFBorder *)self style] == kPDFBorderStyleDashed)
  {
    if (CGPDFDictionaryGetArray(a3, "D", &v14))
    {
      [(PDFBorder *)self _setDashFromArray:v14];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      PDFBorderStyle v8 = [NSNumber numberWithInteger:3];
      [v7 addObject:v8];

      uint64_t v9 = [NSNumber numberWithInteger:2];
      [v7 addObject:v9];

      uint64_t v10 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v7];
      v11 = self->_private;
      dashPattern = v11->dashPattern;
      v11->dashPattern = (NSArray *)v10;

      self->_private->dashCount = 2;
      [(PDFBorder *)self _updateDashPatternRaw];
    }
  }
}

- (void)_setDashFromArray:(CGPDFArray *)a3
{
  CGPDFReal value = 0.0;
  size_t Count = CGPDFArrayGetCount(a3);
  if (Count)
  {
    if (Count >= 0xA) {
      int64_t v6 = 10;
    }
    else {
      int64_t v6 = Count;
    }
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    size_t v8 = 0;
    double v9 = 0.0;
    while (CGPDFArrayGetNumber(a3, v8, &value))
    {
      double v10 = value;
      if (value < 0.0)
      {
        CGPDFReal value = 0.0;
        double v10 = 0.0;
      }
      double v9 = v9 + v10;
      v11 = [NSNumber numberWithInteger:(uint64_t)v10];
      [v7 addObject:v11];

      if (v6 == ++v8)
      {
        if (v9 < 0.0001) {
          self->_private->lineWidth = 0.0;
        }
        uint64_t v12 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v7];
        id v13 = self->_private;
        dashPattern = v13->dashPattern;
        v13->dashPattern = (NSArray *)v12;

        self->_private->dashsize_t Count = v6;
        [(PDFBorder *)self _updateDashPatternRaw];
        break;
      }
    }
  }
}

- (BOOL)setBorderCharacteristicsFromArray:(CGPDFArray *)a3
{
  size_t Count = CGPDFArrayGetCount(a3);
  unint64_t v6 = Count - 3;
  if (Count - 3 <= 1)
  {
    size_t v7 = Count;
    CGPDFReal value = 0.0;
    if (CGPDFArrayGetNumber(a3, 0, &value)) {
      self->_private->hCornerRadius = value;
    }
    if (CGPDFArrayGetNumber(a3, 1uLL, &value)) {
      self->_private->vCornerRadius = value;
    }
    BOOL Number = CGPDFArrayGetNumber(a3, 2uLL, &value);
    CGPDFReal v9 = value;
    if (!Number) {
      CGPDFReal v9 = 0.0;
    }
    self->_private->lineWidth = v9;
    if (v7 == 4)
    {
      CGPDFArrayRef v11 = 0;
      if (CGPDFArrayGetArray(a3, 3uLL, &v11)) {
        [(PDFBorder *)self _setDashFromArray:v11];
      }
    }
    else
    {
      self->_private->unint64_t style = 0;
    }
  }
  return v6 < 2;
}

- (double)horizontalCornerRadius
{
  return self->_private->hCornerRadius;
}

- (void)updateCornerBorderStyle
{
  if ((unint64_t)[(PDFBorder *)self style] >= kPDFBorderStyleBeveled)
  {
    BOOL v3 = [(PDFBorder *)self dashCountRaw] != 0;
    [(PDFBorder *)self setStyle:v3];
  }
}

- (void)setHorizontalCornerRadius:(double)a3
{
  self->_private->hCornerRadius = a3;
  [(PDFBorder *)self updateCornerBorderStyle];
}

- (double)verticalCornerRadius
{
  return self->_private->vCornerRadius;
}

- (void)setVerticalCornerRadius:(double)a3
{
  self->_private->vCornerRadius = a3;
  [(PDFBorder *)self updateCornerBorderStyle];
}

- (void).cxx_destruct
{
}

@end