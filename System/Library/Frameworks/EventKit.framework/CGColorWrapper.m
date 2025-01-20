@interface CGColorWrapper
- (CGColor)color;
- (CGColorWrapper)initWithCGColor:(CGColor *)a3;
- (void)dealloc;
@end

@implementation CGColorWrapper

- (CGColorWrapper)initWithCGColor:(CGColor *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CGColorWrapper;
  v4 = [(CGColorWrapper *)&v6 init];
  if (v4) {
    v4->_color = CGColorRetain(a3);
  }
  return v4;
}

- (CGColor)color
{
  return self->_color;
}

- (void)dealloc
{
  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)CGColorWrapper;
  [(CGColorWrapper *)&v3 dealloc];
}

@end