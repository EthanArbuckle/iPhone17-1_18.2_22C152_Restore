@interface CUIPSDLayerEffectOuterGlow
- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4;
- (CUIColor)color;
- (CUIPSDLayerEffectOuterGlow)init;
- (CUIPSDLayerEffectOuterGlow)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4;
- (double)opacity;
- (id)description;
- (int)blendMode;
- (unint64_t)blurSize;
- (unint64_t)spread;
- (unsigned)effectType;
- (void)dealloc;
- (void)setBlendMode:(int)a3;
- (void)setBlurSize:(unint64_t)a3;
- (void)setColor:(id)a3;
- (void)setOpacity:(double)a3;
- (void)setSpread:(unint64_t)a3;
@end

@implementation CUIPSDLayerEffectOuterGlow

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  v7 = [(CUIPSDLayerEffectOuterGlow *)self color];
  if (v7)
  {
    Components = CGColorGetComponents([(CUIColor *)[(CUIPSDLayerEffectOuterGlow *)self color] CGColor]);
    uint64_t v9 = rint(*Components * 255.0);
    uint64_t v10 = rint(Components[1] * 255.0);
    uint64_t v11 = rint(Components[2] * 255.0);
    unint64_t v12 = [(CUIPSDLayerEffectOuterGlow *)self blurSize];
    unint64_t v13 = [(CUIPSDLayerEffectOuterGlow *)self spread];
    [(CUIPSDLayerEffectOuterGlow *)self opacity];
    objc_msgSend(a3, "addOuterGlowWithColorRed:green:blue:opacity:blur:spread:", v9, v10, v11, v12, v13);
  }
  else
  {
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    v17 = @"Outer Glow is missing color information";
    v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, -1, +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1]);
    if (a4) {
      *a4 = v14;
    }
  }
  return v7 != 0;
}

- (CUIPSDLayerEffectOuterGlow)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CUIPSDLayerEffectOuterGlow;
  v6 = [(CUIPSDLayerEffectOuterGlow *)&v8 init];
  -[CUIPSDLayerEffectOuterGlow setColor:](v6, "setColor:", -[CUIPSDLayerEffectComponent _colorFromShapeEffectValue:](v6, "_colorFromShapeEffectValue:", [a3 valueForParameter:0 inEffectAtIndex:a4]));
  -[CUIPSDLayerEffectOuterGlow setOpacity:](v6, "setOpacity:", COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:a4]));
  -[CUIPSDLayerEffectOuterGlow setBlurSize:](v6, "setBlurSize:", [a3 valueForParameter:4 inEffectAtIndex:a4]);
  -[CUIPSDLayerEffectOuterGlow setSpread:](v6, "setSpread:", [a3 valueForParameter:9 inEffectAtIndex:a4]);
  [(CUIPSDLayerEffectOuterGlow *)v6 setBlendMode:0];
  [(CUIPSDLayerEffectComponent *)v6 setVisible:1];
  return v6;
}

- (CUIPSDLayerEffectOuterGlow)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUIPSDLayerEffectOuterGlow;
  v2 = [(CUIPSDLayerEffectOuterGlow *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CUIPSDLayerEffectComponent *)v2 setName:@"Outer Glow"];
  }
  return v3;
}

- (unsigned)effectType
{
  return 1332889452;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CUIPSDLayerEffectOuterGlow;
  id v3 = [(CUIPSDLayerEffectOuterGlow *)&v7 description];
  uint64_t v4 = [(CUIPSDLayerEffectOuterGlow *)self blendMode];
  [(CUIPSDLayerEffectOuterGlow *)self opacity];
  return [v3 stringByAppendingString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"blendMode: %d opacity: %f color: %@ blurSize: %d spread: %d", v4, v5, -[CUIColor description](-[CUIPSDLayerEffectOuterGlow color](self, "color"), "description"), -[CUIPSDLayerEffectOuterGlow blurSize](self, "blurSize"), -[CUIPSDLayerEffectOuterGlow spread](self, "spread"))];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectOuterGlow;
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