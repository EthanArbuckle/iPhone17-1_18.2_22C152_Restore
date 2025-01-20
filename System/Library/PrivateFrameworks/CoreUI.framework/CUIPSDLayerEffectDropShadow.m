@interface CUIPSDLayerEffectDropShadow
- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4;
- (CUIColor)color;
- (CUIPSDLayerEffectDropShadow)init;
- (CUIPSDLayerEffectDropShadow)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4;
- (double)opacity;
- (int)blendMode;
- (signed)angle;
- (unint64_t)blurSize;
- (unint64_t)distance;
- (unint64_t)spread;
- (unsigned)effectType;
- (void)dealloc;
- (void)setAngle:(signed __int16)a3;
- (void)setBlendMode:(int)a3;
- (void)setBlurSize:(unint64_t)a3;
- (void)setColor:(id)a3;
- (void)setDistance:(unint64_t)a3;
- (void)setOpacity:(double)a3;
- (void)setSpread:(unint64_t)a3;
@end

@implementation CUIPSDLayerEffectDropShadow

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  v7 = [(CUIPSDLayerEffectDropShadow *)self color];
  if (v7)
  {
    Components = CGColorGetComponents([(CUIColor *)[(CUIPSDLayerEffectDropShadow *)self color] CGColor]);
    uint64_t v9 = rint(*Components * 255.0);
    uint64_t v10 = rint(Components[1] * 255.0);
    uint64_t v11 = rint(Components[2] * 255.0);
    unint64_t v12 = [(CUIPSDLayerEffectDropShadow *)self blurSize];
    unint64_t v13 = [(CUIPSDLayerEffectDropShadow *)self distance];
    unint64_t v14 = [(CUIPSDLayerEffectDropShadow *)self spread];
    [(CUIPSDLayerEffectDropShadow *)self opacity];
    double v16 = v15;
    LODWORD(v19) = [(CUIPSDLayerEffectDropShadow *)self angle];
    [a3 addDropShadowWithColorRed:v9 green:v10 blue:v11 opacity:v12 blur:v14 spread:v13 offset:v16 angle:v19];
  }
  else
  {
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    v21 = @"Drop Shadow is missing color information";
    v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, -1, +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1]);
    if (a4) {
      *a4 = v17;
    }
  }
  return v7 != 0;
}

- (CUIPSDLayerEffectDropShadow)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CUIPSDLayerEffectDropShadow;
  v6 = [(CUIPSDLayerEffectDropShadow *)&v8 init];
  -[CUIPSDLayerEffectDropShadow setColor:](v6, "setColor:", -[CUIPSDLayerEffectComponent _colorFromShapeEffectValue:](v6, "_colorFromShapeEffectValue:", [a3 valueForParameter:0 inEffectAtIndex:a4]));
  -[CUIPSDLayerEffectDropShadow setOpacity:](v6, "setOpacity:", COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:a4]));
  -[CUIPSDLayerEffectDropShadow setBlurSize:](v6, "setBlurSize:", [a3 valueForParameter:4 inEffectAtIndex:a4]);
  -[CUIPSDLayerEffectDropShadow setSpread:](v6, "setSpread:", [a3 valueForParameter:9 inEffectAtIndex:a4]);
  -[CUIPSDLayerEffectDropShadow setDistance:](v6, "setDistance:", [a3 valueForParameter:5 inEffectAtIndex:a4]);
  -[CUIPSDLayerEffectDropShadow setAngle:](v6, "setAngle:", (__int16)[a3 valueForParameter:6 inEffectAtIndex:a4]);
  [(CUIPSDLayerEffectDropShadow *)v6 setBlendMode:0];
  [(CUIPSDLayerEffectComponent *)v6 setVisible:1];
  return v6;
}

- (CUIPSDLayerEffectDropShadow)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUIPSDLayerEffectDropShadow;
  v2 = [(CUIPSDLayerEffectDropShadow *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CUIPSDLayerEffectComponent *)v2 setName:@"Drop Shadow"];
  }
  return v3;
}

- (unsigned)effectType
{
  return 1148343144;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectDropShadow;
  [(CUIPSDLayerEffectComponent *)&v3 dealloc];
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (CUIColor)color
{
  return (CUIColor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setColor:(id)a3
{
}

- (signed)angle
{
  return self->_angle;
}

- (void)setAngle:(signed __int16)a3
{
  self->_angle = a3;
}

- (unint64_t)distance
{
  return self->_distance;
}

- (void)setDistance:(unint64_t)a3
{
  self->_distance = a3;
}

- (unint64_t)blurSize
{
  return self->_blurSize;
}

- (void)setBlurSize:(unint64_t)a3
{
  self->_blurSize = a3;
}

- (unint64_t)spread
{
  return self->_spread;
}

- (void)setSpread:(unint64_t)a3
{
  self->_spread = a3;
}

@end