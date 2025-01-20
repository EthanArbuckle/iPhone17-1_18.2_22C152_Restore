@interface CATextLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)needsDisplayForKey:(id)a3;
+ (id)defaultValueForKey:(id)a3;
- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4;
- (BOOL)allowsFontSubpixelQuantization;
- (BOOL)isTruncated;
- (BOOL)isWrapped;
- (CATextLayer)init;
- (CATextLayerAlignmentMode)alignmentMode;
- (CATextLayerTruncationMode)truncationMode;
- (CFTypeRef)font;
- (CGColorRef)foregroundColor;
- (CGFloat)fontSize;
- (CGSize)_preferredSize;
- (__CTLine)_createTruncationToken;
- (__CTTypesetter)_retainTypesetter;
- (id)_createStringDict;
- (id)implicitAnimationForKeyPath:(id)a3;
- (id)string;
- (id)truncationString;
- (void)_applyLinesToFunction:(void *)a3 info:(void *)a4;
- (void)_applyLinesToFunction:(void *)a3 info:(void *)a4 truncated:(BOOL *)a5;
- (void)_drawLine:(__CTLine *)a3 inContext:(CGContext *)a4 atPoint:(CGPoint)a5;
- (void)_prepareContext:(CGContext *)a3;
- (void)dealloc;
- (void)didChangeValueForKey:(id)a3;
- (void)drawInContext:(CGContext *)a3;
- (void)setAlignmentMode:(CATextLayerAlignmentMode)alignmentMode;
- (void)setAllowsFontSubpixelQuantization:(BOOL)allowsFontSubpixelQuantization;
- (void)setFont:(CFTypeRef)font;
- (void)setFontSize:(CGFloat)fontSize;
- (void)setForegroundColor:(CGColorRef)foregroundColor;
- (void)setString:(id)string;
- (void)setTruncationMode:(CATextLayerTruncationMode)truncationMode;
- (void)setTruncationString:(id)a3;
- (void)setWrapped:(BOOL)wrapped;
@end

@implementation CATextLayer

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CAInternAtom((const __CFString *)a3, 0);
  if ((int)v5 <= 373)
  {
    if ((int)v5 <= 229)
    {
      if (v5 != 8)
      {
        if (v5 != 14) {
          goto LABEL_23;
        }
        goto LABEL_16;
      }
    }
    else if ((v5 - 230) >= 2)
    {
      if (v5 != 234) {
        goto LABEL_23;
      }
      goto LABEL_16;
    }
  }
  else if (((v5 - 545) > 0x3D || ((1 << (v5 - 33)) & 0x20000000C0000001) == 0) {
         && v5 != 541
  }
         && v5 != 374)
  {
    goto LABEL_23;
  }
  uint64_t v5 = [(CATextLayer *)self isWrapped];
  if ((v5 & 1) == 0)
  {
    -[CALayer setSizeRequisition:](self, "setSizeRequisition:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    uint64_t v5 = [[(CALayer *)self superlayer] setNeedsLayout];
  }
LABEL_16:
  v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v6) {
    v6 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)v5);
  }
  int v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  state = self->_state;
  if (state)
  {
    self->_state = 0;
    CA::Transaction::unlock(v6);
    CA::Transaction::release_object(v6, state);
  }
  else
  {
    CA::Transaction::unlock(v6);
  }
LABEL_23:
  v9.receiver = self;
  v9.super_class = (Class)CATextLayer;
  [(CATextLayer *)&v9 didChangeValueForKey:a3];
}

- (BOOL)isWrapped
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x25Eu, (const CGAffineTransform *)7, (id *)&v3);
  return v3 != 0;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  state = self->_state;
  if (state) {
    CFRelease(state);
  }
  v4.receiver = self;
  v4.super_class = (Class)CATextLayer;
  [(CALayer *)&v4 dealloc];
}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 > 233)
  {
    if (v5 > 574)
    {
      if (v5 == 575) {
        return @"none";
      }
      if (v5 != 576) {
        goto LABEL_24;
      }
      id result = (id)+[CATextLayer defaultValueForKey:]::defTrunc;
      if (!+[CATextLayer defaultValueForKey:]::defTrunc)
      {
        id result = (id)[[NSString alloc] initWithCharacters:&+[CATextLayer defaultValueForKey:]::mark length:1];
        +[CATextLayer defaultValueForKey:]::defTrunc = (uint64_t)result;
      }
    }
    else
    {
      if (v5 != 234)
      {
        if (v5 == 399) {
          return (id)*MEMORY[0x1E4F1CFD0];
        }
        goto LABEL_24;
      }
      id result = (id)+[CATextLayer defaultValueForKey:]::white;
      if (!+[CATextLayer defaultValueForKey:]::white)
      {
        objc_super v9 = (CGColorSpace *)CAGetColorSpace(0x1Du);
        id result = CGColorCreate(v9, +[CATextLayer defaultValueForKey:]::comp);
        +[CATextLayer defaultValueForKey:]::white = (uint64_t)result;
      }
    }
  }
  else
  {
    if (v5 <= 229)
    {
      if (v5 == 8) {
        return @"natural";
      }
      if (v5 == 131) {
        return @"topLeft";
      }
      goto LABEL_24;
    }
    if (v5 != 230)
    {
      if (v5 == 231)
      {
        id result = (id)+[CATextLayer defaultValueForKey:]::defFontSize;
        if (!+[CATextLayer defaultValueForKey:]::defFontSize)
        {
          id v7 = objc_alloc(NSNumber);
          LODWORD(v8) = 1108344832;
          id result = (id)[v7 initWithFloat:v8];
          +[CATextLayer defaultValueForKey:]::defFontSize = (uint64_t)result;
        }
        return result;
      }
LABEL_24:
      v10.receiver = a1;
      v10.super_class = (Class)&OBJC_METACLASS___CATextLayer;
      return objc_msgSendSuper2(&v10, sel_defaultValueForKey_, a3);
    }
    id result = (id)+[CATextLayer defaultValueForKey:]::defFont;
    if (!+[CATextLayer defaultValueForKey:]::defFont)
    {
      id result = CTFontCreateWithName(@"Helvetica", 36.0, 0);
      +[CATextLayer defaultValueForKey:]::defFont = (uint64_t)result;
    }
  }
  return result;
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  int v3 = CAInternAtom((const __CFString *)a3, 0);
  return CAAtomIndexInArray(12, (uint64_t)&+[CATextLayer needsDisplayForKey:]::atoms, v3) != -1;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CATextLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)setWrapped:(BOOL)wrapped
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = wrapped;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x25E, (const CGAffineTransform *)7, (double *)&v3);
}

- (void)setAlignmentMode:(CATextLayerAlignmentMode)alignmentMode
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = alignmentMode;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)8, (const CGAffineTransform *)3, v3);
}

- (CATextLayer)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)CATextLayer;
  return [(CALayer *)&v3 init];
}

- (void)setTruncationMode:(CATextLayerTruncationMode)truncationMode
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = truncationMode;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x23F, (const CGAffineTransform *)3, v3);
}

- (void)setFont:(CFTypeRef)font
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = font;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xE6, (const CGAffineTransform *)2, v3);
}

- (void)setForegroundColor:(CGColorRef)foregroundColor
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = foregroundColor;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xEA, (const CGAffineTransform *)2, v3);
}

- (void)setFontSize:(CGFloat)fontSize
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = fontSize;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xE7, (const CGAffineTransform *)0x12, v3);
}

- (void)setAllowsFontSubpixelQuantization:(BOOL)allowsFontSubpixelQuantization
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = allowsFontSubpixelQuantization;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xE, (const CGAffineTransform *)7, (double *)&v3);
}

- (BOOL)allowsFontSubpixelQuantization
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xEu, (const CGAffineTransform *)7, (id *)&v3);
  return v3 != 0;
}

- (CATextLayerAlignmentMode)alignmentMode
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 8u, (const CGAffineTransform *)3, v3);
  return (CATextLayerAlignmentMode)v3[0];
}

- (CATextLayerTruncationMode)truncationMode
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x23Fu, (const CGAffineTransform *)3, v3);
  return (CATextLayerTruncationMode)v3[0];
}

- (CGColorRef)foregroundColor
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xEAu, (const CGAffineTransform *)2, v3);
  return (CGColorRef)v3[0];
}

- (CFTypeRef)font
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xE6u, (const CGAffineTransform *)2, v3);
  return v3[0];
}

- (CGFloat)fontSize
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xE7u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setString:(id)string
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = string;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x21D, (const CGAffineTransform *)3, v3);
}

- (id)string
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x21Du, (const CGAffineTransform *)3, v3);
  return v3[0];
}

- (void)_prepareContext:(CGContext *)a3
{
  CGContextSetShouldSmoothFonts(a3, 0);
  BOOL v5 = [(CATextLayer *)self allowsFontSubpixelQuantization];

  CGContextSetAllowsFontSubpixelQuantization(a3, v5);
}

- (void)drawInContext:(CGContext *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((-[CATextLayer drawInContext:]::initialized & 1) == 0)
  {
    Class v5 = NSClassFromString(&cfstr_Nsgraphicscont.isa);
    -[CATextLayer drawInContext:]::gfxCtx = (uint64_t)v5;
    -[CATextLayer drawInContext:]::initialized = 1;
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  Class v5 = (Class)-[CATextLayer drawInContext:]::gfxCtx;
  if (-[CATextLayer drawInContext:]::gfxCtx)
  {
LABEL_5:
    [(objc_class *)v5 saveGraphicsState];
    objc_msgSend((id)-[CATextLayer drawInContext:]::gfxCtx, "setCurrentContext:", objc_msgSend((id)-[CATextLayer drawInContext:]::gfxCtx, "graphicsContextWithGraphicsPort:flipped:", a3, 0));
  }
LABEL_6:
  if ([(CALayer *)self contentsAreFlipped])
  {
    [(CALayer *)self size];
    transform.b = 0.0;
    transform.c = 0.0;
    transform.a = 1.0;
    *(_OWORD *)&transform.d = xmmword_184997E00;
    transform.ty = v6;
    CGContextConcatCTM(a3, &transform);
  }
  [(CATextLayer *)self _applyLinesToFunction:drawLine info:a3];
  if (-[CATextLayer drawInContext:]::gfxCtx) {
    [(id)-[CATextLayer drawInContext:]::gfxCtx restoreGraphicsState];
  }
}

- (void)_drawLine:(__CTLine *)a3 inContext:(CGContext *)a4 atPoint:(CGPoint)a5
{
  CGContextSetTextPosition(a4, a5.x, a5.y);

  CTLineDraw(a3, a4);
}

- (void)_applyLinesToFunction:(void *)a3 info:(void *)a4 truncated:(BOOL *)a5
{
  v55[1] = *(double *)MEMORY[0x1E4F143B8];
  if (a5) {
    *a5 = 0;
  }
  uint64_t v8 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v8) {
    uint64_t v8 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  int v9 = *((_DWORD *)v8 + 25);
  *((_DWORD *)v8 + 25) = v9 + 1;
  if (!v9) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  objc_super v10 = [(CATextLayer *)self _retainTypesetter];
  if (!v10)
  {
    CA::Transaction::unlock(v8);
    return;
  }
  [(CALayer *)self bounds];
  double v12 = v11;
  double v14 = v13;
  double v48 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v49 = *MEMORY[0x1E4F1DAD8];
  BOOL v52 = [(CATextLayer *)self isWrapped];
  uint64_t v15 = objc_msgSend(-[CATextLayer string](self, "string"), "length");
  v16 = [(CATextLayer *)self alignmentMode];
  if ([(__CFString *)v16 isEqual:@"natural"])
  {
    if (get_natural_alignment(void)::once_alignment != -1) {
      dispatch_once_f(&get_natural_alignment(void)::once_alignment, 0, (dispatch_function_t)init_alignment);
    }
    if ((natural_alignment & 1) == 0)
    {
      int v51 = 0;
      double v17 = 0.0;
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  int v18 = CAInternAtom(v16, 0);
  if (v18 == 83)
  {
    int v51 = 0;
    double v17 = 0.5;
  }
  else
  {
    double v17 = 0.0;
    if (v18 == 337)
    {
      int v51 = 1;
    }
    else
    {
      if (v18 == 476)
      {
LABEL_19:
        int v51 = 0;
        double v17 = 1.0;
        goto LABEL_23;
      }
      int v51 = 0;
    }
  }
LABEL_23:
  int v19 = CAInternAtom((const __CFString *)[(CATextLayer *)self truncationMode], 0);
  v46 = a5;
  switch(v19)
  {
    case 213:
      int v20 = 1;
      goto LABEL_28;
    case 534:
      CTLineTruncationType truncationType = kCTLineTruncationStart;
      goto LABEL_30;
    case 388:
      int v20 = 2;
LABEL_28:
      CTLineTruncationType truncationType = v20;
LABEL_30:
      v21 = [(CATextLayer *)self _createTruncationToken];
      goto LABEL_32;
  }
  v21 = 0;
  CTLineTruncationType truncationType = -1;
LABEL_32:
  CA::Transaction::unlock(v8);
  int v47 = dyld_program_sdk_at_least();
  if (v14 > 0.0 && v15 >= 1)
  {
    CFIndex v22 = 0;
    if (v52) {
      double v23 = v12;
    }
    else {
      double v23 = 1.0e10;
    }
    double v24 = 0.0;
    while (1)
    {
      double v54 = 0.0;
      v55[0] = 0.0;
      double v53 = 0.0;
      CFIndex v25 = CTTypesetterSuggestLineBreak(v10, v22, v23);
      v57.location = v22;
      v57.length = v25;
      Line = CTTypesetterCreateLine(v10, v57);
      v27 = Line;
      if (!Line) {
        goto LABEL_71;
      }
      if (v52)
      {
        get_line_bounds(Line, v55, &v54, &v53);
        if (v25 + v22 < v15)
        {
          double v29 = v54;
          double v28 = v55[0];
          double v30 = v53;
          v58.length = CTTypesetterSuggestLineBreak(v10, v25 + v22, v12);
          v58.location = v25 + v22;
          v31 = CTTypesetterCreateLine(v10, v58);
          v32 = v31;
          if (!v31) {
            goto LABEL_71;
          }
          get_line_bounds(v31, v55, &v54, &v53);
          if (v28 + v24 + v29 + v30 + v55[0] + v54 + v53 > v14)
          {
            CFIndex v25 = CTTypesetterSuggestLineBreak(v10, v22, 1.0e10);
            v59.location = v22;
            v59.length = v25;
            CTLineRef v33 = CTTypesetterCreateLine(v10, v59);
            CFRelease(v27);
            v27 = v33;
            if (!v33) {
              goto LABEL_71;
            }
          }
          CFRelease(v32);
        }
      }
      if (!v21) {
        goto LABEL_52;
      }
      CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v27, 0x10uLL);
      double width = BoundsWithOptions.size.width;
      CGRect v61 = CTLineGetBoundsWithOptions(v21, 0x10uLL);
      if (v61.size.width >= width) {
        break;
      }
      TruncatedLine = CTLineCreateTruncatedLine(v27, v12, truncationType, v21);
      CGRect v62 = CTLineGetBoundsWithOptions(TruncatedLine, 0x10uLL);
      if (v46) {
        BOOL *v46 = width > v62.size.width;
      }
      CFRelease(v27);
      if (!TruncatedLine) {
        goto LABEL_71;
      }
LABEL_53:
      v22 += v25;
      int v36 = v51;
      if (v22 >= v15) {
        int v36 = 0;
      }
      if (v36 != 1
        || (CTLineRef JustifiedLine = CTLineCreateJustifiedLine(TruncatedLine, 1.0, v12),
            CFRelease(TruncatedLine),
            (TruncatedLine = JustifiedLine) != 0))
      {
        get_line_bounds(TruncatedLine, v55, &v54, &v53);
        double PenOffsetForFlush = 0.0;
        if (v17 != 0.0) {
          double PenOffsetForFlush = CTLineGetPenOffsetForFlush(TruncatedLine, v17, v12);
        }
        double v40 = v55[0] + v24;
        if (a3)
        {
          v38.n128_f64[0] = v14 - v40 + v48;
          double v41 = floor(v38.n128_f64[0] + 0.5);
          if (!v47) {
            v38.n128_f64[0] = v41;
          }
          ((void (*)(CATextLayer *, void *, const __CTLine *, double, __n128))a3)(self, a4, TruncatedLine, PenOffsetForFlush + v49, v38);
        }
        double v43 = v53;
        double v42 = v54;
        CFRelease(TruncatedLine);
        double v24 = v42 + v43 + v40;
        if (v24 < v14 && v22 < v15) {
          continue;
        }
      }
      goto LABEL_71;
    }
    if (v12 < width)
    {
      if (v46) {
        BOOL *v46 = 1;
      }
      CFRelease(v27);
      goto LABEL_71;
    }
LABEL_52:
    TruncatedLine = v27;
    goto LABEL_53;
  }
LABEL_71:
  CFRelease(v10);
  if (v21) {
    CFRelease(v21);
  }
}

- (void)_applyLinesToFunction:(void *)a3 info:(void *)a4
{
}

- (BOOL)isTruncated
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  [(CATextLayer *)self _applyLinesToFunction:0 info:0 truncated:&v3];
  return v3;
}

- (CGSize)_preferredSize
{
  v23[1] = *(double *)MEMORY[0x1E4F143B8];
  BOOL v3 = [(CATextLayer *)self isWrapped];
  if (v3)
  {
    [(CATextLayer *)self fontSize];
    double v5 = v4;
    double v6 = 1.0;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    uint64_t v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v7) {
      uint64_t v7 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)v3);
    }
    int v8 = *((_DWORD *)v7 + 25);
    *((_DWORD *)v7 + 25) = v8 + 1;
    if (!v8) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    int v9 = [(CATextLayer *)self _retainTypesetter];
    uint64_t v10 = objc_msgSend(-[CATextLayer string](self, "string"), "length");
    CA::Transaction::unlock(v7);
    if (v9)
    {
      CFIndex v11 = 0;
      double v22 = 0.0;
      v23[0] = 0.0;
      double v21 = 0.0;
      do
      {
        CFIndex v12 = CTTypesetterSuggestLineBreak(v9, v11, 1.0e10);
        v24.location = v11;
        v24.length = v12;
        Line = CTTypesetterCreateLine(v9, v24);
        double v14 = Line;
        if (Line)
        {
          double v15 = get_line_bounds(Line, v23, &v22, &v21) + 1.0;
          if (v6 <= v15) {
            double v6 = v15;
          }
          double v16 = v21;
          double v17 = v22;
          double v18 = v23[0];
          CFRelease(v14);
          double v5 = v16 + v5 + v17 + v18;
        }
        v11 += v12;
      }
      while (v11 < v10);
      CFRelease(v9);
    }
  }
  double v19 = v6;
  double v20 = v5;
  result.height = v20;
  result.double width = v19;
  return result;
}

- (__CTLine)_createTruncationToken
{
  CFAttributedStringRef v3 = [(CATextLayer *)self truncationString];
  if (!v3) {
    return 0;
  }
  CFAttributedStringRef v4 = v3;
  CFTypeID v5 = CFGetTypeID(v3);
  if (v5 != CFStringGetTypeID())
  {
    if (v5 != CFAttributedStringGetTypeID()) {
      return 0;
    }
    int v8 = CTTypesetterCreateWithAttributedString(v4);
    if (!v8) {
      return 0;
    }
LABEL_7:
    v11.location = 0;
    v11.length = 0;
    Line = CTTypesetterCreateLine(v8, v11);
    CFRelease(v8);
    return Line;
  }
  CFDictionaryRef v6 = [(CATextLayer *)self _createStringDict];
  CFAttributedStringRef v7 = CFAttributedStringCreate(0, (CFStringRef)v4, v6);

  int v8 = CTTypesetterCreateWithAttributedString(v7);
  CFRelease(v7);
  if (v8) {
    goto LABEL_7;
  }
  return 0;
}

- (__CTTypesetter)_retainTypesetter
{
  state = self->_state;
  if (!state)
  {
    CFTypeID v5 = [(CATextLayer *)self string];
    state = v5;
    if (!v5) {
      return state;
    }
    CFTypeID v6 = CFGetTypeID(v5);
    if (v6 == CFStringGetTypeID())
    {
      CFDictionaryRef v7 = [(CATextLayer *)self _createStringDict];
      CFAttributedStringRef v8 = CFAttributedStringCreate(0, (CFStringRef)state, v7);

      self->_state = CTTypesetterCreateWithAttributedString(v8);
      CFRelease(v8);
    }
    else if (v6 == CFAttributedStringGetTypeID())
    {
      state = CTTypesetterCreateWithAttributedString(state);
      self->_state = state;
      if (!state) {
        return state;
      }
      goto LABEL_2;
    }
    state = self->_state;
    if (!state) {
      return state;
    }
  }
LABEL_2:
  CFRetain(state);
  return state;
}

- (id)_createStringDict
{
  if ((-[CATextLayer _createStringDict]::initialized & 1) == 0)
  {
    -[CATextLayer _createStringDict]::NSFont_class = (uint64_t)NSClassFromString(&cfstr_Nsfont.isa);
    -[CATextLayer _createStringDict]::initialized = 1;
  }
  CFAttributedStringRef v3 = [(CATextLayer *)self font];
  [(CATextLayer *)self fontSize];
  if (!v3) {
    return 0;
  }
  float v5 = v4;
  CFTypeID v6 = CFGetTypeID(v3);
  if (v6 == CGFontGetTypeID())
  {
    CopyWithAttributes = CTFontCreateWithGraphicsFont((CGFontRef)v3, v5, 0, 0);
  }
  else if (v6 == CFStringGetTypeID())
  {
    CopyWithAttributes = CTFontCreateWithName(v3, v5, 0);
  }
  else
  {
    if (v6 != CTFontGetTypeID()
      && (!-[CATextLayer _createStringDict]::NSFont_class || (objc_opt_isKindOfClass() & 1) == 0))
    {
      return 0;
    }
    if (CTFontGetSize((CTFontRef)v3) == v5) {
      CopyWithAttributes = (void *)CFRetain(v3);
    }
    else {
      CopyWithAttributes = CTFontCreateCopyWithAttributes((CTFontRef)v3, v5, 0, 0);
    }
  }
  CFAttributedStringRef v8 = CopyWithAttributes;
  if (CopyWithAttributes)
  {
    int v9 = [(CATextLayer *)self foregroundColor];
    id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    CFRange v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", v8, *MEMORY[0x1E4F243F0], v9, *MEMORY[0x1E4F24740], 0);
    CFRelease(v8);
    return v11;
  }
  return 0;
}

- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3 && [a4 isEqualToString:@"font"])
  {
    CFTypeID v7 = CFGetTypeID(a3);
    return v7 == CGFontGetTypeID() || v7 == CFStringGetTypeID() || v7 == CTFontGetTypeID();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CATextLayer;
    return [(CALayer *)&v9 CA_validateValue:a3 forKey:a4];
  }
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CATextLayer;
  id result = -[CALayer implicitAnimationForKeyPath:](&v7, sel_implicitAnimationForKeyPath_);
  if (!result)
  {
    unsigned int v6 = CAInternAtom((const __CFString *)a3, 0);
    if (v6 == 234 || v6 == 231) {
      return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v6);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)setTruncationString:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x240, (const CGAffineTransform *)3, v3);
}

- (id)truncationString
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x240u, (const CGAffineTransform *)3, v3);
  return v3[0];
}

@end