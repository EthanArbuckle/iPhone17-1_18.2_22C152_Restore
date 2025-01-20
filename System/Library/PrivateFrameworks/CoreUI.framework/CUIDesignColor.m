@interface CUIDesignColor
- (CGColor)cgColor;
- (CUIDesignColor)initWithColor:(CGColor *)a3 blendMode:(int)a4 displayGamut:(int64_t)a5;
- (int)blendMode;
- (int64_t)displayGamut;
- (void)dealloc;
@end

@implementation CUIDesignColor

- (CGColor)cgColor
{
  return self->_cgColor;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (CUIDesignColor)initWithColor:(CGColor *)a3 blendMode:(int)a4 displayGamut:(int64_t)a5
{
  if (!a3) {
    return 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)CUIDesignColor;
  v8 = [(CUIDesignColor *)&v10 init];
  if (v8)
  {
    v8->_cgColor = CGColorRetain(a3);
    v8->_blendMode = a4;
    v8->_displayGamut = a5;
  }
  return v8;
}

- (void)dealloc
{
  cgColor = self->_cgColor;
  if (cgColor) {
    CGColorRelease(cgColor);
  }
  v4.receiver = self;
  v4.super_class = (Class)CUIDesignColor;
  [(CUIDesignColor *)&v4 dealloc];
}

- (int64_t)displayGamut
{
  return self->_displayGamut;
}

@end