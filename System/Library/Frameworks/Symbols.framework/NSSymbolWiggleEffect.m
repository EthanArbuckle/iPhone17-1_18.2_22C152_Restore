@interface NSSymbolWiggleEffect
+ (double)_normalizeAngle:(double)result;
+ (id)effect;
+ (id)wiggleBackwardEffect;
+ (id)wiggleClockwiseEffect;
+ (id)wiggleCounterClockwiseEffect;
+ (id)wiggleCustomAngleEffect:(double)a3;
+ (id)wiggleDownEffect;
+ (id)wiggleForwardEffect;
+ (id)wiggleLeftEffect;
+ (id)wiggleRightEffect;
+ (id)wiggleUpEffect;
- (NSSymbolWiggleEffect)effectWithByLayer;
- (NSSymbolWiggleEffect)effectWithWholeSymbol;
- (double)_angle;
- (id)_rbOptionsMutable;
- (id)_withStyle:(int64_t)a3 angle:(double)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_layerBehavior;
- (int64_t)_style;
- (void)set_angle:(double)a3;
- (void)set_layerBehavior:(int64_t)a3;
- (void)set_style:(int64_t)a3;
@end

@implementation NSSymbolWiggleEffect

- (id)_withStyle:(int64_t)a3 angle:(double)a4
{
  *((void *)self + 3) = a3;
  *((double *)self + 4) = a4;
  return self;
}

+ (id)effect
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolWiggleEffect;
  v2 = objc_msgSendSuper2(&v4, sel__effectWithType_, 9);
  v2[2] = 0;
  v2[3] = 0;
  v2[4] = 0;

  return v2;
}

+ (id)wiggleClockwiseEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withStyle:1 angle:0.0];

  return v3;
}

+ (id)wiggleCounterClockwiseEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withStyle:2 angle:0.0];

  return v3;
}

+ (id)wiggleLeftEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withStyle:3 angle:180.0];

  return v3;
}

+ (id)wiggleRightEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withStyle:3 angle:0.0];

  return v3;
}

+ (id)wiggleUpEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withStyle:3 angle:-90.0];

  return v3;
}

+ (id)wiggleDownEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withStyle:3 angle:90.0];

  return v3;
}

+ (id)wiggleForwardEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withStyle:4 angle:0.0];

  return v3;
}

+ (id)wiggleBackwardEffect
{
  v2 = [a1 effect];
  v3 = [v2 _withStyle:5 angle:0.0];

  return v3;
}

+ (id)wiggleCustomAngleEffect:(double)a3
{
  objc_super v4 = [a1 effect];
  v5 = [v4 _withStyle:3 angle:a3];

  return v5;
}

- (NSSymbolWiggleEffect)effectWithByLayer
{
  v2 = [(NSSymbolWiggleEffect *)self copyWithZone:0];
  v2[2] = 1;

  return (NSSymbolWiggleEffect *)v2;
}

- (NSSymbolWiggleEffect)effectWithWholeSymbol
{
  v2 = [(NSSymbolWiggleEffect *)self copyWithZone:0];
  v2[2] = 2;

  return (NSSymbolWiggleEffect *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSymbolWiggleEffect;
  id result = [(NSSymbolEffect *)&v5 copyWithZone:a3];
  *((void *)result + 2) = self->_layerBehavior;
  *((void *)result + 3) = self->_style;
  *((void *)result + 4) = *(void *)&self->_angle;
  return result;
}

+ (double)_normalizeAngle:(double)result
{
  if (result <= -180.0 || result > 180.0)
  {
    long double v3 = fmod(result, 360.0);
    id result = fmod(v3 + 360.0, 360.0);
    if (result > 180.0) {
      return result + -360.0;
    }
  }
  return result;
}

- (id)_rbOptionsMutable
{
  long double v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(id)objc_opt_class() _addLayerBehavior:self->_layerBehavior ToOptions:v3];
  int64_t style = self->_style;
  switch(style)
  {
    case 1:
      uint64_t v6 = 19;
      goto LABEL_16;
    case 2:
      uint64_t v6 = 35;
      goto LABEL_16;
    case 3:
      [(id)objc_opt_class() _normalizeAngle:self->_angle];
      if (v5 == 0.0)
      {
        uint64_t v6 = 17;
        goto LABEL_16;
      }
      if (v5 == 90.0)
      {
        uint64_t v6 = 18;
        goto LABEL_16;
      }
      if (v5 == -90.0)
      {
        uint64_t v6 = 34;
        goto LABEL_16;
      }
      if (v5 == 180.0)
      {
        uint64_t v6 = 33;
        goto LABEL_16;
      }
      double v7 = v5 * 0.0174532925;
      *(float *)&double v7 = v7;
      v8 = [NSNumber numberWithFloat:v7];
      [v3 setObject:v8 forKeyedSubscript:@"wiggleAngle"];

      break;
  }
  uint64_t v6 = 0;
LABEL_16:
  v9 = [NSNumber numberWithUnsignedInt:v6];
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x263F639E0]];

  return v3;
}

- (int64_t)_layerBehavior
{
  return self->_layerBehavior;
}

- (void)set_layerBehavior:(int64_t)a3
{
  self->_layerBehavior = a3;
}

- (int64_t)_style
{
  return self->_style;
}

- (void)set_style:(int64_t)a3
{
  self->_int64_t style = a3;
}

- (double)_angle
{
  return self->_angle;
}

- (void)set_angle:(double)a3
{
  self->_angle = a3;
}

@end