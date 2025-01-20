@interface CUIColor
+ (id)colorWithCGColor:(CGColor *)a3;
- (CGColor)CGColor;
- (CUIColor)initWithCGColor:(CGColor *)a3;
- (id)colorUsingCGColorSpace:(CGColorSpace *)a3;
- (id)description;
- (void)dealloc;
@end

@implementation CUIColor

+ (id)colorWithCGColor:(CGColor *)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCGColor:a3];
  return v3;
}

- (CUIColor)initWithCGColor:(CGColor *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CUIColor;
  v4 = [(CUIColor *)&v6 init];
  if (v4) {
    v4->_cgColor = CGColorRetain(a3);
  }
  return v4;
}

- (void)dealloc
{
  CGColorRelease(self->_cgColor);
  v3.receiver = self;
  v3.super_class = (Class)CUIColor;
  [(CUIColor *)&v3 dealloc];
}

- (id)description
{
  CFStringRef v3 = CFCopyDescription(self->_cgColor);
  if (v3)
  {
    CFStringRef v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    objc_super v6 = +[NSString stringWithFormat:@"<%@: %@>", NSStringFromClass(v5), v4];
    CFRelease(v4);
    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CUIColor;
    return [(CUIColor *)&v8 description];
  }
}

- (id)colorUsingCGColorSpace:(CGColorSpace *)a3
{
  CFStringRef v3 = (CUIColor *)MEMORY[0x1A622FCE0](a3, 0);
  if (v3)
  {
    CFStringRef v4 = (CGColor *)CGColorTransformConvertColor();
    CGColorTransformRelease();
    if (v4) {
      CFStringRef v3 = +[CUIColor colorWithCGColor:v4];
    }
    else {
      CFStringRef v3 = 0;
    }
  }
  else
  {
    CFStringRef v4 = 0;
  }
  CGColorRelease(v4);
  return v3;
}

- (CGColor)CGColor
{
  return self->_cgColor;
}

@end