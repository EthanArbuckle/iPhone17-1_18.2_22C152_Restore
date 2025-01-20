@interface CLKUIWheelsOfTimeButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_getMaxTextBounds;
- (CLKUIWheelsOfTimeButton)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)touchEdgeInsets;
- (__CFAttributedString)_newAttributedString:(id)a3 withFont:(id)a4 usingKerning:(double)a5 textColor:(id)a6;
- (id)_createButtonImage:(__CFAttributedString *)a3;
- (void)setButtonText:(id)a3 selectedFont:(id)a4 selectedTextColor:(id)a5 unselectedFont:(id)a6 unselectedTextColor:(id)a7 kerning:(double)a8;
- (void)setTouchEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation CLKUIWheelsOfTimeButton

- (CLKUIWheelsOfTimeButton)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLKUIWheelsOfTimeButton;
  v3 = -[CLKUIWheelsOfTimeButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CLKUIWheelsOfTimeButton *)v3 layer];
    [v5 setCornerRadius:3.0];

    v6 = [(CLKUIWheelsOfTimeButton *)v4 layer];
    [v6 setBorderWidth:0.0];

    v7 = [(CLKUIWheelsOfTimeButton *)v4 titleLabel];
    [v7 setHidden:1];
  }
  return v4;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CLKUIWheelsOfTimeButton *)self bounds];
  double top = self->_touchEdgeInsets.top;
  double left = self->_touchEdgeInsets.left;
  double v10 = v9 + left;
  double v12 = v11 + top;
  double v14 = v13 - (left + self->_touchEdgeInsets.right);
  double v16 = v15 - (top + self->_touchEdgeInsets.bottom);
  CGFloat v17 = x;
  CGFloat v18 = y;
  return CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v17);
}

- (CGRect)_getMaxTextBounds
{
  [(CLKUIWheelsOfTimeButton *)self bounds];
  return CGRectInset(*(CGRect *)&v2, 0.5, 0.5);
}

- (__CFAttributedString)_newAttributedString:(id)a3 withFont:(id)a4 usingKerning:(double)a5 textColor:(id)a6
{
  double v10 = (__CFString *)a3;
  id v11 = a4;
  double valuePtr = a5;
  id v12 = a6;
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFAttributedStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  v38.location = 0;
  v38.length = 0;
  CFAttributedStringReplaceString(Mutable, v38, v10);
  CFIndex Length = CFAttributedStringGetLength(Mutable);
  CFStringRef v16 = (const __CFString *)*MEMORY[0x1E4F24740];
  id v17 = v12;
  CGFloat v18 = (const void *)[v17 CGColor];
  v39.location = 0;
  v39.length = Length;
  CFAttributedStringSetAttribute(Mutable, v39, v16, v18);
  if (a5 != 0.0)
  {
    CFNumberRef v19 = CFNumberCreate(v13, kCFNumberFloatType, &valuePtr);
    v40.length = CFAttributedStringGetLength(Mutable);
    v40.location = 0;
    CFAttributedStringSetAttribute(Mutable, v40, (CFStringRef)*MEMORY[0x1E4F24778], v19);
    CFRelease(v19);
  }
  [v11 pointSize];
  double v21 = v20;
  double v22 = v20 * 0.5;
  [(CLKUIWheelsOfTimeButton *)self _getMaxTextBounds];
  double v24 = v23;
  double v26 = v25;
  id v27 = v11;
  CFStringRef v28 = (const __CFString *)*MEMORY[0x1E4F243F0];
  for (i = v27; ; i = (void *)v35)
  {
    v41.length = CFAttributedStringGetLength(Mutable);
    v41.location = 0;
    CFAttributedStringSetAttribute(Mutable, v41, v28, i);
    v30 = CTLineCreateWithAttributedString(Mutable);
    CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v30, 8uLL);
    double width = BoundsWithOptions.size.width;
    double height = BoundsWithOptions.size.height;
    CFRelease(v30);
    BOOL v33 = width <= v24 && height <= v26;
    double v21 = v21 + -0.5;
    if (v33 || v21 < v22) {
      break;
    }
    uint64_t v35 = [v27 fontWithSize:v21];
  }
  return Mutable;
}

- (void)setButtonText:(id)a3 selectedFont:(id)a4 selectedTextColor:(id)a5 unselectedFont:(id)a6 unselectedTextColor:(id)a7 kerning:(double)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  [(CLKUIWheelsOfTimeButton *)self setAccessibilityLabel:v18];
  CFNumberRef v19 = [(CLKUIWheelsOfTimeButton *)self _newAttributedString:v18 withFont:v17 usingKerning:v16 textColor:a8];

  id v22 = [(CLKUIWheelsOfTimeButton *)self _createButtonImage:v19];
  [(CLKUIWheelsOfTimeButton *)self setImage:v22 forState:4];
  CFRelease(v19);
  double v20 = [(CLKUIWheelsOfTimeButton *)self _newAttributedString:v18 withFont:v15 usingKerning:v14 textColor:a8];

  double v21 = [(CLKUIWheelsOfTimeButton *)self _createButtonImage:v20];
  [(CLKUIWheelsOfTimeButton *)self setImage:v21 forState:0];
  CFRelease(v20);
}

- (id)_createButtonImage:(__CFAttributedString *)a3
{
  [(CLKUIWheelsOfTimeButton *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v9 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  double v10 = [v9 device];
  [v10 screenScale];
  CGFloat v12 = v11;
  v28.double width = v6;
  v28.double height = v8;
  UIGraphicsBeginImageContextWithOptions(v28, 0, v12);

  CurrentContext = UIGraphicsGetCurrentContext();
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v26.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v26.c = v14;
  *(_OWORD *)&v26.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGContextSetTextMatrix(CurrentContext, &v26);
  [(CLKUIWheelsOfTimeButton *)self bounds];
  CGContextTranslateCTM(CurrentContext, 0.0, v15);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  id v16 = CTLineCreateWithAttributedString(a3);
  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v16, 8uLL);
  double x = BoundsWithOptions.origin.x;
  double y = BoundsWithOptions.origin.y;
  double width = BoundsWithOptions.size.width;
  double height = BoundsWithOptions.size.height;
  [(CLKUIWheelsOfTimeButton *)self bounds];
  double v22 = (v21 - width) * 0.5;
  [(CLKUIWheelsOfTimeButton *)self bounds];
  CGContextSetTextPosition(CurrentContext, v22 - x, (v23 - height) * 0.5 - y);
  CTLineDraw(v16, CurrentContext);
  CFRelease(v16);
  double v24 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v24;
}

- (UIEdgeInsets)touchEdgeInsets
{
  double top = self->_touchEdgeInsets.top;
  double left = self->_touchEdgeInsets.left;
  double bottom = self->_touchEdgeInsets.bottom;
  double right = self->_touchEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchEdgeInsets:(UIEdgeInsets)a3
{
  self->_touchEdgeInsets = a3;
}

@end