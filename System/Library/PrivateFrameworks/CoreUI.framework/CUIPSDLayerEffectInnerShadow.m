@interface CUIPSDLayerEffectInnerShadow
- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4;
- (CUIColor)color;
- (CUIPSDLayerEffectInnerShadow)init;
- (CUIPSDLayerEffectInnerShadow)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4;
- (double)opacity;
- (int)blendMode;
- (signed)angle;
- (unint64_t)blurSize;
- (unint64_t)distance;
- (unsigned)effectType;
- (void)dealloc;
- (void)setAngle:(signed __int16)a3;
- (void)setBlendMode:(int)a3;
- (void)setBlurSize:(unint64_t)a3;
- (void)setColor:(id)a3;
- (void)setDistance:(unint64_t)a3;
- (void)setOpacity:(double)a3;
@end

@implementation CUIPSDLayerEffectInnerShadow

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  v7 = [(CUIPSDLayerEffectInnerShadow *)self color];
  if (v7)
  {
    Components = CGColorGetComponents([(CUIColor *)[(CUIPSDLayerEffectInnerShadow *)self color] CGColor]);
    uint64_t v9 = rint(*Components * 255.0);
    uint64_t v10 = rint(Components[1] * 255.0);
    uint64_t v11 = rint(Components[2] * 255.0);
    unint64_t v12 = [(CUIPSDLayerEffectInnerShadow *)self blurSize];
    unint64_t v13 = [(CUIPSDLayerEffectInnerShadow *)self distance];
    [(CUIPSDLayerEffectInnerShadow *)self opacity];
    LODWORD(v17) = 1852797549;
    objc_msgSend(a3, "addInnerShadowWithColorRed:green:blue:opacity:blur:offset:angle:blendMode:", v9, v10, v11, v12, v13, -[CUIPSDLayerEffectInnerShadow angle](self, "angle"), v14, v17);
  }
  else
  {
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    v19 = @"Inner Shadow is missing color information";
    v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, -1, +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1]);
    if (a4) {
      *a4 = v15;
    }
  }
  return v7 != 0;
}

- (CUIPSDLayerEffectInnerShadow)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CUIPSDLayerEffectInnerShadow;
  v6 = [(CUIPSDLayerEffectInnerShadow *)&v8 init];
  -[CUIPSDLayerEffectInnerShadow setColor:](v6, "setColor:", -[CUIPSDLayerEffectComponent _colorFromShapeEffectValue:](v6, "_colorFromShapeEffectValue:", [a3 valueForParameter:0 inEffectAtIndex:a4]));
  -[CUIPSDLayerEffectInnerShadow setOpacity:](v6, "setOpacity:", COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:a4]));
  -[CUIPSDLayerEffectInnerShadow setBlurSize:](v6, "setBlurSize:", [a3 valueForParameter:4 inEffectAtIndex:a4]);
  -[CUIPSDLayerEffectInnerShadow setDistance:](v6, "setDistance:", [a3 valueForParameter:5 inEffectAtIndex:a4]);
  -[CUIPSDLayerEffectInnerShadow setAngle:](v6, "setAngle:", (__int16)[a3 valueForParameter:6 inEffectAtIndex:a4]);
  [(CUIPSDLayerEffectInnerShadow *)v6 setBlendMode:0];
  [(CUIPSDLayerEffectComponent *)v6 setVisible:1];
  return v6;
}

- (CUIPSDLayerEffectInnerShadow)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUIPSDLayerEffectInnerShadow;
  v2 = [(CUIPSDLayerEffectInnerShadow *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CUIPSDLayerEffectComponent *)v2 setName:@"Inner Shadow"];
  }
  return v3;
}

- (unsigned)effectType
{
  return 1232229224;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectInnerShadow;
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

@end