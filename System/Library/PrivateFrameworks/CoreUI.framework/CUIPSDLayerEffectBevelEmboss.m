@interface CUIPSDLayerEffectBevelEmboss
- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4;
- (CUIColor)highlightColor;
- (CUIColor)shadowColor;
- (CUIPSDLayerEffectBevelEmboss)init;
- (CUIPSDLayerEffectBevelEmboss)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4;
- (double)highlightOpacity;
- (double)shadowOpacity;
- (id)description;
- (int)highlightBlendMode;
- (int)shadowBlendMode;
- (signed)angle;
- (unint64_t)altitude;
- (unint64_t)blurSize;
- (unint64_t)softenSize;
- (unsigned)direction;
- (unsigned)effectType;
- (void)dealloc;
- (void)setAltitude:(unint64_t)a3;
- (void)setAngle:(signed __int16)a3;
- (void)setBlurSize:(unint64_t)a3;
- (void)setDirection:(unsigned int)a3;
- (void)setHighlightBlendMode:(int)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightOpacity:(double)a3;
- (void)setShadowBlendMode:(int)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setSoftenSize:(unint64_t)a3;
@end

@implementation CUIPSDLayerEffectBevelEmboss

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  if (![(CUIPSDLayerEffectBevelEmboss *)self highlightColor]
    || ![(CUIPSDLayerEffectBevelEmboss *)self shadowColor])
  {
    NSErrorDomain v22 = NSCocoaErrorDomain;
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    v34 = @"Bevel is missing color information";
    v23 = &v34;
    v24 = &v33;
    goto LABEL_12;
  }
  if ([(CUIPSDLayerEffectBevelEmboss *)self highlightBlendMode]
    && [(CUIPSDLayerEffectBevelEmboss *)self highlightBlendMode] != 1
    || [(CUIPSDLayerEffectBevelEmboss *)self shadowBlendMode]
    && [(CUIPSDLayerEffectBevelEmboss *)self shadowBlendMode] != 1)
  {
    NSErrorDomain v22 = NSCocoaErrorDomain;
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    v32 = @"Bevel contains unsupported blend mode information";
    v23 = &v32;
    v24 = &v31;
LABEL_12:
    v25 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v22, -1, +[NSDictionary dictionaryWithObjects:v23 forKeys:v24 count:1]);
    BOOL v17 = 0;
    if (a4) {
      *a4 = v25;
    }
    return v17;
  }
  Components = CGColorGetComponents([(CUIColor *)[(CUIPSDLayerEffectBevelEmboss *)self highlightColor] CGColor]);
  uint64_t v8 = rint(*Components * 255.0);
  unsigned int v30 = rint(Components[1] * 255.0);
  uint64_t v9 = rint(Components[2] * 255.0);
  v10 = CGColorGetComponents([(CUIColor *)[(CUIPSDLayerEffectBevelEmboss *)self shadowColor] CGColor]);
  uint64_t v11 = rint(*v10 * 255.0);
  uint64_t v12 = rint(v10[1] * 255.0);
  uint64_t v13 = rint(v10[2] * 255.0);
  unsigned int v14 = [(CUIPSDLayerEffectBevelEmboss *)self blurSize];
  unsigned int v15 = [(CUIPSDLayerEffectBevelEmboss *)self softenSize];
  unsigned int v16 = [(CUIPSDLayerEffectBevelEmboss *)self direction];
  BOOL v17 = 1;
  if (v16 == 1231953952)
  {
    [(CUIPSDLayerEffectBevelEmboss *)self highlightOpacity];
    double v19 = v27;
    [(CUIPSDLayerEffectBevelEmboss *)self shadowOpacity];
    double v21 = v28;
    LODWORD(v29) = 1;
    goto LABEL_16;
  }
  if (v16 == 1333097504)
  {
    [(CUIPSDLayerEffectBevelEmboss *)self highlightOpacity];
    double v19 = v18;
    [(CUIPSDLayerEffectBevelEmboss *)self shadowOpacity];
    double v21 = v20;
    LODWORD(v29) = 0;
LABEL_16:
    [a3 addBevelEmbossWithHighlightColorRed:v8 green:v30 blue:v9 opacity:v11 shadowColorRed:v12 green:v13 blue:v19 opacity:v21 blur:__PAIR64__(v15 soften:v14) bevelStyle:v29];
  }
  return v17;
}

- (CUIPSDLayerEffectBevelEmboss)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CUIPSDLayerEffectBevelEmboss;
  v6 = [(CUIPSDLayerEffectBevelEmboss *)&v8 init];
  -[CUIPSDLayerEffectBevelEmboss setBlurSize:](v6, "setBlurSize:", [a3 valueForParameter:4 inEffectAtIndex:a4]);
  -[CUIPSDLayerEffectBevelEmboss setSoftenSize:](v6, "setSoftenSize:", [a3 valueForParameter:8 inEffectAtIndex:a4]);
  -[CUIPSDLayerEffectBevelEmboss setHighlightColor:](v6, "setHighlightColor:", -[CUIPSDLayerEffectComponent _colorFromShapeEffectValue:](v6, "_colorFromShapeEffectValue:", [a3 valueForParameter:0 inEffectAtIndex:a4]));
  -[CUIPSDLayerEffectBevelEmboss setHighlightOpacity:](v6, "setHighlightOpacity:", COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:a4]));
  -[CUIPSDLayerEffectBevelEmboss setShadowColor:](v6, "setShadowColor:", -[CUIPSDLayerEffectComponent _colorFromShapeEffectValue:](v6, "_colorFromShapeEffectValue:", [a3 valueForParameter:1 inEffectAtIndex:a4]));
  -[CUIPSDLayerEffectBevelEmboss setShadowOpacity:](v6, "setShadowOpacity:", COERCE_DOUBLE([a3 valueForParameter:3 inEffectAtIndex:a4]));
  [(CUIPSDLayerEffectBevelEmboss *)v6 setHighlightBlendMode:0];
  [(CUIPSDLayerEffectBevelEmboss *)v6 setShadowBlendMode:0];
  [(CUIPSDLayerEffectBevelEmboss *)v6 setAngle:90];
  [(CUIPSDLayerEffectBevelEmboss *)v6 setAltitude:30];
  [(CUIPSDLayerEffectBevelEmboss *)v6 setDirection:1231953952];
  [(CUIPSDLayerEffectComponent *)v6 setVisible:1];
  return v6;
}

- (CUIPSDLayerEffectBevelEmboss)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUIPSDLayerEffectBevelEmboss;
  v2 = [(CUIPSDLayerEffectBevelEmboss *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CUIPSDLayerEffectComponent *)v2 setName:@"Bevel Emboss"];
  }
  return v3;
}

- (unsigned)effectType
{
  return 1700946540;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectBevelEmboss;
  return objc_msgSend(-[CUIPSDLayerEffectBevelEmboss description](&v3, sel_description), "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"blurSize: %d softenSize: %d angle: %d altitude: %d highlightColor: %@ shadowColor: %@ (there are more properties...)", -[CUIPSDLayerEffectBevelEmboss blurSize](self, "blurSize"), -[CUIPSDLayerEffectBevelEmboss softenSize](self, "softenSize"), -[CUIPSDLayerEffectBevelEmboss angle](self, "angle"), -[CUIPSDLayerEffectBevelEmboss altitude](self, "altitude"), -[CUIColor description](-[CUIPSDLayerEffectBevelEmboss highlightColor](self, "highlightColor"), "description"), -[CUIColor description](-[CUIPSDLayerEffectBevelEmboss shadowColor](self, "shadowColor"), "description")));
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectBevelEmboss;
  [(CUIPSDLayerEffectComponent *)&v3 dealloc];
}

- (unint64_t)blurSize
{
  return self->_blurSize;
}

- (void)setBlurSize:(unint64_t)a3
{
  self->_blurSize = a3;
}

- (unint64_t)softenSize
{
  return self->_softenSize;
}

- (void)setSoftenSize:(unint64_t)a3
{
  self->_softenSize = a3;
}

- (signed)angle
{
  return self->_angle;
}

- (void)setAngle:(signed __int16)a3
{
  self->_angle = a3;
}

- (unint64_t)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(unint64_t)a3
{
  self->_altitude = a3;
}

- (unsigned)direction
{
  return self->_direction;
}

- (void)setDirection:(unsigned int)a3
{
  self->_direction = a3;
}

- (int)highlightBlendMode
{
  return self->_highlightBlendMode;
}

- (void)setHighlightBlendMode:(int)a3
{
  self->_highlightBlendMode = a3;
}

- (CUIColor)highlightColor
{
  return (CUIColor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHighlightColor:(id)a3
{
}

- (double)highlightOpacity
{
  return self->_highlightOpacity;
}

- (void)setHighlightOpacity:(double)a3
{
  self->_highlightOpacity = a3;
}

- (int)shadowBlendMode
{
  return self->_shadowBlendMode;
}

- (void)setShadowBlendMode:(int)a3
{
  self->_shadowBlendMode = a3;
}

- (CUIColor)shadowColor
{
  return (CUIColor *)objc_getProperty(self, a2, 88, 1);
}

- (void)setShadowColor:(id)a3
{
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacity = a3;
}

@end