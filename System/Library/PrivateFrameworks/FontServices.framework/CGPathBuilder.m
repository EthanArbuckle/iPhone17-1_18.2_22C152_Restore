@interface CGPathBuilder
- (BOOL)overlaps;
- (CGPath)copyPath;
- (CGPathBuilder)init;
- (void)cubicCurveTo:(CGPoint)a3 control1:(CGPoint)a4 control2:(CGPoint)a5;
- (void)dealloc;
- (void)endPath;
- (void)lineTo:(CGPoint)a3;
- (void)moveTo:(CGPoint)a3;
- (void)quadCurveTo:(CGPoint)a3 control:(CGPoint)a4;
- (void)setOverlaps:(BOOL)a3;
@end

@implementation CGPathBuilder

- (CGPathBuilder)init
{
  v4.receiver = self;
  v4.super_class = (Class)CGPathBuilder;
  v2 = [(CGPathBuilder *)&v4 init];
  if (v2) {
    v2->path = CGPathCreateMutable();
  }
  return v2;
}

- (void)dealloc
{
  path = self->path;
  if (path) {
    CFRelease(path);
  }
  v4.receiver = self;
  v4.super_class = (Class)CGPathBuilder;
  [(CGPathBuilder *)&v4 dealloc];
}

- (void)moveTo:(CGPoint)a3
{
}

- (void)lineTo:(CGPoint)a3
{
}

- (void)quadCurveTo:(CGPoint)a3 control:(CGPoint)a4
{
}

- (void)cubicCurveTo:(CGPoint)a3 control1:(CGPoint)a4 control2:(CGPoint)a5
{
}

- (void)endPath
{
}

- (CGPath)copyPath
{
  BOOL overlaps = self->overlaps;
  path = self->path;
  if (!overlaps) {
    JUMPOUT(0x1BA999250);
  }
  return CGPathCreateCopyByNormalizing(path, 0);
}

- (BOOL)overlaps
{
  return self->overlaps;
}

- (void)setOverlaps:(BOOL)a3
{
  self->BOOL overlaps = a3;
}

@end