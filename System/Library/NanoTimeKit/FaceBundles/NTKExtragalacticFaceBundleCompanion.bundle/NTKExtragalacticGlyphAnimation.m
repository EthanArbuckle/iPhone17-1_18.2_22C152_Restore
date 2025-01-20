@interface NTKExtragalacticGlyphAnimation
+ (CGPoint)_randomTranslationForCorner:(unint64_t)a3;
+ (id)randomAnimationForCorner:(unint64_t)a3 device:(id)a4;
- (CGPoint)translate;
- (NTKExtragalacticGlyphAnimation)initWithRotation:(double)a3 translate:(CGPoint)a4;
- (double)rotation;
- (double)scale;
- (id)debugDescription;
- (void)setRotation:(double)a3;
- (void)setScale:(double)a3;
- (void)setTranslate:(CGPoint)a3;
@end

@implementation NTKExtragalacticGlyphAnimation

- (NTKExtragalacticGlyphAnimation)initWithRotation:(double)a3 translate:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v8.receiver = self;
  v8.super_class = (Class)NTKExtragalacticGlyphAnimation;
  result = [(NTKExtragalacticGlyphAnimation *)&v8 init];
  if (result)
  {
    result->_scale = 0.97;
    result->_rotation = a3;
    result->_translate.CGFloat x = x;
    result->_translate.CGFloat y = y;
  }
  return result;
}

+ (id)randomAnimationForCorner:(unint64_t)a3 device:(id)a4
{
  id v6 = a4;
  arc4random();
  arc4random_uniform(3u);
  CLKRoundForDevice();
  CLKDegreesToRadians();
  double v8 = v7;
  [a1 _randomTranslationForCorner:a3];
  CLKPointRoundForDevice();
  double v10 = v9;
  double v12 = v11;

  v13 = -[NTKExtragalacticGlyphAnimation initWithRotation:translate:]([NTKExtragalacticGlyphAnimation alloc], "initWithRotation:translate:", v8, v10, v12);

  return v13;
}

+ (CGPoint)_randomTranslationForCorner:(unint64_t)a3
{
  if (a3 > 3)
  {
    double v5 = *MEMORY[0x263F00148];
    double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  else
  {
    double v3 = dbl_246AFB118[a3];
    double v4 = dbl_246AFB138[a3];
    double v5 = (double)arc4random() * 8.0 / 4294967300.0 + v3;
    double v6 = (double)arc4random() * 8.0 / 4294967300.0 + v4;
  }
  double v7 = v5;
  result.CGFloat y = v6;
  result.CGFloat x = v7;
  return result;
}

- (id)debugDescription
{
  v2 = NSString;
  double scale = self->_scale;
  double rotation = self->_rotation;
  double v5 = NSStringFromCGPoint(self->_translate);
  objc_msgSend(v2, "stringWithFormat:", @"scale: %f; rotation: %f; translation: %@",
    *(void *)&scale,
    *(void *)&rotation,
  double v6 = v5);

  return v6;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_double scale = a3;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_double rotation = a3;
}

- (CGPoint)translate
{
  double x = self->_translate.x;
  double y = self->_translate.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTranslate:(CGPoint)a3
{
  self->_translate = a3;
}

@end