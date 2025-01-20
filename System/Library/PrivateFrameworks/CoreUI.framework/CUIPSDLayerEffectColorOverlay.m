@interface CUIPSDLayerEffectColorOverlay
- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4;
- (CUIColor)color;
- (CUIPSDLayerEffectColorOverlay)init;
- (CUIPSDLayerEffectColorOverlay)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4;
- (double)opacity;
- (id)description;
- (int)blendMode;
- (unsigned)effectType;
- (void)dealloc;
- (void)setBlendMode:(int)a3;
- (void)setColor:(id)a3;
- (void)setOpacity:(double)a3;
@end

@implementation CUIPSDLayerEffectColorOverlay

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  v7 = [(CUIPSDLayerEffectColorOverlay *)self color];
  if (v7)
  {
    Components = CGColorGetComponents([(CUIColor *)[(CUIPSDLayerEffectColorOverlay *)self color] CGColor]);
    uint64_t v9 = rint(*Components * 255.0);
    uint64_t v10 = rint(Components[1] * 255.0);
    uint64_t v11 = rint(Components[2] * 255.0);
    [(CUIPSDLayerEffectColorOverlay *)self opacity];
    objc_msgSend(a3, "addColorFillWithRed:green:blue:opacity:blendMode:tintable:", v9, v10, v11, 1852797549, 0);
  }
  else
  {
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    v15 = @"Color Overlay is missing color information";
    v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, -1, +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1]);
    if (a4) {
      *a4 = v12;
    }
  }
  return v7 != 0;
}

- (CUIPSDLayerEffectColorOverlay)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CUIPSDLayerEffectColorOverlay;
  v6 = [(CUIPSDLayerEffectColorOverlay *)&v8 init];
  -[CUIPSDLayerEffectColorOverlay setColor:](v6, "setColor:", -[CUIPSDLayerEffectComponent _colorFromShapeEffectValue:](v6, "_colorFromShapeEffectValue:", [a3 valueForParameter:0 inEffectAtIndex:a4]));
  -[CUIPSDLayerEffectColorOverlay setOpacity:](v6, "setOpacity:", COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:a4]));
  [(CUIPSDLayerEffectColorOverlay *)v6 setBlendMode:0];
  [(CUIPSDLayerEffectComponent *)v6 setVisible:1];
  return v6;
}

- (CUIPSDLayerEffectColorOverlay)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUIPSDLayerEffectColorOverlay;
  v2 = [(CUIPSDLayerEffectColorOverlay *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CUIPSDLayerEffectComponent *)v2 setName:@"Color Overlay"];
  }
  return v3;
}

- (unsigned)effectType
{
  return 1399801449;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CUIPSDLayerEffectColorOverlay;
  id v3 = [(CUIPSDLayerEffectColorOverlay *)&v7 description];
  uint64_t v4 = [(CUIPSDLayerEffectColorOverlay *)self blendMode];
  [(CUIPSDLayerEffectColorOverlay *)self opacity];
  return [v3 stringByAppendingString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"blendMode: %d opacity: %f color: %@", v4, v5, -[CUIColor description](-[CUIPSDLayerEffectColorOverlay color](self, "color"), "description"))];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectColorOverlay;
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

@end