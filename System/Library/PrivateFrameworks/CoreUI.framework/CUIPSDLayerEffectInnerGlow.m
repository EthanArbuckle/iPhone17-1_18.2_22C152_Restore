@interface CUIPSDLayerEffectInnerGlow
- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4;
- (CUIColor)color;
- (CUIPSDLayerEffectInnerGlow)init;
- (CUIPSDLayerEffectInnerGlow)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4;
- (double)opacity;
- (id)description;
- (int)blendMode;
- (unint64_t)blurSize;
- (unsigned)effectType;
- (void)dealloc;
- (void)setBlendMode:(int)a3;
- (void)setBlurSize:(unint64_t)a3;
- (void)setColor:(id)a3;
- (void)setOpacity:(double)a3;
@end

@implementation CUIPSDLayerEffectInnerGlow

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  v7 = [(CUIPSDLayerEffectInnerGlow *)self color];
  if (v7)
  {
    Components = CGColorGetComponents([(CUIColor *)[(CUIPSDLayerEffectInnerGlow *)self color] CGColor]);
    uint64_t v9 = rint(*Components * 255.0);
    uint64_t v10 = rint(Components[1] * 255.0);
    uint64_t v11 = rint(Components[2] * 255.0);
    unint64_t v12 = [(CUIPSDLayerEffectInnerGlow *)self blurSize];
    [(CUIPSDLayerEffectInnerGlow *)self opacity];
    objc_msgSend(a3, "addInnerGlowWithColorRed:green:blue:opacity:blur:blendMode:", v9, v10, v11, v12, 1852797549);
  }
  else
  {
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    v16 = @"Inner Glow is missing color information";
    v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, -1, +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1]);
    if (a4) {
      *a4 = v13;
    }
  }
  return v7 != 0;
}

- (CUIPSDLayerEffectInnerGlow)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CUIPSDLayerEffectInnerGlow;
  v6 = [(CUIPSDLayerEffectInnerGlow *)&v8 init];
  -[CUIPSDLayerEffectInnerGlow setColor:](v6, "setColor:", -[CUIPSDLayerEffectComponent _colorFromShapeEffectValue:](v6, "_colorFromShapeEffectValue:", [a3 valueForParameter:0 inEffectAtIndex:a4]));
  -[CUIPSDLayerEffectInnerGlow setOpacity:](v6, "setOpacity:", COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:a4]));
  -[CUIPSDLayerEffectInnerGlow setBlurSize:](v6, "setBlurSize:", [a3 valueForParameter:4 inEffectAtIndex:a4]);
  [(CUIPSDLayerEffectInnerGlow *)v6 setBlendMode:0];
  [(CUIPSDLayerEffectInnerGlow *)v6 setBlendMode:0];
  [(CUIPSDLayerEffectComponent *)v6 setVisible:1];
  return v6;
}

- (CUIPSDLayerEffectInnerGlow)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUIPSDLayerEffectInnerGlow;
  v2 = [(CUIPSDLayerEffectInnerGlow *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CUIPSDLayerEffectComponent *)v2 setName:@"Inner Glow"];
  }
  return v3;
}

- (unsigned)effectType
{
  return 1232226156;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CUIPSDLayerEffectInnerGlow;
  id v3 = [(CUIPSDLayerEffectInnerGlow *)&v7 description];
  uint64_t v4 = [(CUIPSDLayerEffectInnerGlow *)self blendMode];
  [(CUIPSDLayerEffectInnerGlow *)self opacity];
  return [v3 stringByAppendingString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"blendMode: %d opacity: %f color: %@ blurSize: %d", v4, v5, -[CUIColor description](-[CUIPSDLayerEffectInnerGlow color](self, "color"), "description"), -[CUIPSDLayerEffectInnerGlow blurSize](self, "blurSize"))];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectInnerGlow;
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

@end