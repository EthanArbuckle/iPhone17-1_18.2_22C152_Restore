@interface CUIPattern
- (CGImage)patternImageRef;
- (CGPattern)_newPattern;
- (CGPattern)pattern;
- (CUIPattern)initWithImageRef:(CGImage *)a3;
- (double)alpha;
- (id)description;
- (void)dealloc;
- (void)setAlpha:(double)a3;
- (void)setPatternInContext:(CGContext *)a3;
@end

@implementation CUIPattern

- (CUIPattern)initWithImageRef:(CGImage *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CUIPattern;
  v4 = [(CUIPattern *)&v6 init];
  if (v4)
  {
    v4->_patternImage = CGImageRetain(a3);
    v4->_alpha = 1.0;
  }
  return v4;
}

- (void)dealloc
{
  CGImageRelease(self->_patternImage);
  pattern = self->_pattern;
  if (pattern) {
    CGPatternRelease(pattern);
  }
  self->_pattern = 0;
  v4.receiver = self;
  v4.super_class = (Class)CUIPattern;
  [(CUIPattern *)&v4 dealloc];
}

- (CGPattern)_newPattern
{
  size_t Height = CGImageGetHeight(self->_patternImage);
  size_t Width = CGImageGetWidth(self->_patternImage);
  CGAffineTransformMakeScale(&v8, (double)Width, (double)Height);
  CGImageRetain(self->_patternImage);
  patternImage = self->_patternImage;
  CGAffineTransform v7 = v8;
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = 1.0;
  v9.size.height = 1.0;
  return CGPatternCreate(patternImage, v9, &v7, 1.0, 1.0, kCGPatternTilingConstantSpacing, 1, &patternBitmapCallbacks);
}

- (CGPattern)pattern
{
  result = self->_pattern;
  if (!result)
  {
    result = [(CUIPattern *)self _newPattern];
    self->_pattern = result;
  }
  return result;
}

- (void)setPatternInContext:(CGContext *)a3
{
  _CUISetPattern(a3, [(CUIPattern *)self pattern]);
  double alpha = self->_alpha;
  CGContextSetAlpha(a3, alpha);
}

- (id)description
{
  id v3 = [(id)objc_opt_class() description];
  size_t Width = CGImageGetWidth(self->_patternImage);
  return +[NSString stringWithFormat:@"%@: (%zux%zu)", v3, Width, CGImageGetHeight(self->_patternImage)];
}

- (CGImage)patternImageRef
{
  return self->_patternImage;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_double alpha = a3;
}

@end