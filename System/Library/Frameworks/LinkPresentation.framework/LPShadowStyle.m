@interface LPShadowStyle
+ (id)cardHeadingIconShadow;
+ (id)collaborationPreviewShadow;
+ (id)wordmarkShadow;
- (LPShadowStyle)init;
- (LPSize)offset;
- (UIColor)color;
- (double)opacity;
- (double)radius;
- (void)setColor:(id)a3;
- (void)setOffset:(id)a3;
- (void)setOpacity:(double)a3;
- (void)setRadius:(double)a3;
@end

@implementation LPShadowStyle

- (LPShadowStyle)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPShadowStyle;
  v2 = [(LPShadowStyle *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (id)cardHeadingIconShadow
{
  v2 = objc_alloc_init(LPShadowStyle);
  [(LPShadowStyle *)v2 setRadius:7.0];
  BOOL v3 = +[LPSettings showDebugIndicators];
  double v4 = 0.07;
  if (v3) {
    double v4 = 1.0;
  }
  [(LPShadowStyle *)v2 setOpacity:v4];
  v5 = [MEMORY[0x1E4FB1618] blackColor];
  [(LPShadowStyle *)v2 setColor:v5];

  return v2;
}

+ (id)collaborationPreviewShadow
{
  v2 = objc_alloc_init(LPShadowStyle);
  [(LPShadowStyle *)v2 setRadius:3.0];
  BOOL v3 = +[LPSettings showDebugIndicators];
  double v4 = 0.15;
  if (v3) {
    double v4 = 1.0;
  }
  [(LPShadowStyle *)v2 setOpacity:v4];
  v5 = [MEMORY[0x1E4FB1618] blackColor];
  [(LPShadowStyle *)v2 setColor:v5];

  objc_super v6 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 0.0, 1.0);
  [(LPShadowStyle *)v2 setOffset:v6];

  return v2;
}

+ (id)wordmarkShadow
{
  v2 = objc_alloc_init(LPShadowStyle);
  [(LPShadowStyle *)v2 setRadius:1.0];
  BOOL v3 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 1.0, 1.0);
  [(LPShadowStyle *)v2 setOffset:v3];

  return v2;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (LPSize)offset
{
  return self->_offset;
}

- (void)setOffset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end