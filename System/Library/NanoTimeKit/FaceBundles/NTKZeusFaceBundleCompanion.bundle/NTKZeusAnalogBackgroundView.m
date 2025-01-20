@interface NTKZeusAnalogBackgroundView
- (NTKZeusAnalogBackgroundView)initWithDevice:(id)a3;
- (id)_splitLayerForBleed:(unint64_t)a3;
- (void)applyAnimation:(id)a3;
- (void)applyPalette:(id)a3;
- (void)applyRotation:(double)a3;
- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)cancelAnimation;
- (void)layoutSubviews;
@end

@implementation NTKZeusAnalogBackgroundView

- (NTKZeusAnalogBackgroundView)initWithDevice:(id)a3
{
  id v5 = a3;
  [v5 screenBounds];
  v15.receiver = self;
  v15.super_class = (Class)NTKZeusAnalogBackgroundView;
  v6 = -[NTKZeusAnalogBackgroundView initWithFrame:](&v15, "initWithFrame:");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = objc_opt_new();
    splits = v7->_splits;
    v7->_splits = (NSMutableDictionary *)v8;

    uint64_t v10 = +[CALayer layer];
    straightSplit = v7->_straightSplit;
    v7->_straightSplit = (CALayer *)v10;

    v12 = [(NTKZeusAnalogBackgroundView *)v7 layer];
    [v12 addSublayer:v7->_straightSplit];

    v13 = [(NTKZeusAnalogBackgroundView *)v7 layer];
    [v13 setMasksToBounds:1];
  }
  return v7;
}

- (void)layoutSubviews
{
  [(NTKZeusAnalogBackgroundView *)self bounds];
  double v4 = v3 * 0.5;
  [(NTKZeusAnalogBackgroundView *)self bounds];
  double v6 = v5 * 0.5;
  double v7 = sqrt(v6 * v6 + v4 * v4);
  -[CALayer setBounds:](self->_straightSplit, "setBounds:", 0.0, 0.0, v7, v7 + v7);
  -[CALayer setAnchorPoint:](self->_straightSplit, "setAnchorPoint:", 1.0, 0.5);
  straightSplit = self->_straightSplit;

  -[CALayer setPosition:](straightSplit, "setPosition:", v4, v6);
}

- (id)_splitLayerForBleed:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    splits = self->_splits;
    double v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
    double v7 = [(NSMutableDictionary *)splits objectForKeyedSubscript:v6];

    if (v7)
    {
      uint64_t v8 = self->_splits;
      v9 = +[NSNumber numberWithUnsignedInteger:a3];
      uint64_t v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
    }
    else
    {
      v9 = +[CALayer layer];
      [(NTKZeusAnalogBackgroundView *)self bounds];
      double v12 = v11;
      [(NTKZeusAnalogBackgroundView *)self bounds];
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
        double v14 = v13 * 0.5;
        objc_super v15 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
        [(CLKDevice *)self->_device screenBounds];
        CGFloat v17 = v16 + v16;
        [(CLKDevice *)self->_device screenBounds];
        CGFloat v19 = v18 + v18;
        [(CLKDevice *)self->_device screenScale];
        CGFloat v21 = v20;
        v22 = +[UIColor whiteColor];
        v23 = NTKZeusAnalogColorPaletteCreateGradientImage(a3, v22, v15, v17, v19, v21);

        id v24 = v23;
        objc_msgSend(v9, "setContents:", objc_msgSend(v24, "CGImage"));
        double y = CGPointZero.y;
        [v24 size];
        objc_msgSend(v9, "setBounds:", CGPointZero.x, y, v26, v27);
        objc_msgSend(v9, "setAnchorPoint:", 0.5, 0.5);
        objc_msgSend(v9, "setPosition:", v12 * 0.5, v14);
        CGAffineTransformMakeRotation(&v38, self->_rotation);
        CGAffineTransform v37 = v38;
        [v9 setAffineTransform:&v37];
        v28 = self->_splits;
        v29 = +[NSNumber numberWithUnsignedInteger:a3];
        [(NSMutableDictionary *)v28 setObject:v9 forKeyedSubscript:v29];

        v30 = [(NTKZeusAnalogBackgroundView *)self layer];
        [v30 addSublayer:v9];
      }
      else
      {
        straightSplit = self->_straightSplit;
        v32 = self->_splits;
        v33 = +[NSNumber numberWithUnsignedInteger:a3];
        [(NSMutableDictionary *)v32 setObject:straightSplit forKeyedSubscript:v33];
      }
      v34 = self->_splits;
      v35 = +[NSNumber numberWithUnsignedInteger:a3];
      uint64_t v10 = [(NSMutableDictionary *)v34 objectForKeyedSubscript:v35];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)applyPalette:(id)a3
{
  id v4 = a3;
  double v5 = -[NTKZeusAnalogBackgroundView _splitLayerForBleed:](self, "_splitLayerForBleed:", [v4 bleed]);
  objc_storeStrong((id *)&self->_activeSplit, v5);
  +[CATransaction setDisableActions:1];
  [(NSMutableDictionary *)self->_splits enumerateKeysAndObjectsUsingBlock:&stru_3CDB8];
  LODWORD(v6) = 1.0;
  [v5 setOpacity:v6];
  unsigned int v7 = [v4 isGradientStyle];
  id v8 = [v4 splitBackground];
  id v9 = [v8 CGColor];
  if (v7) {
    [v5 setContentsMultiplyColor:v9];
  }
  else {
    [v5 setBackgroundColor:v9];
  }

  uint64_t v10 = [(NTKZeusAnalogBackgroundView *)self layer];
  id v11 = [v4 background];
  objc_msgSend(v10, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

  CGAffineTransformMakeRotation(&v13, self->_rotation);
  CGAffineTransform v12 = v13;
  [v5 setAffineTransform:&v12];
  +[CATransaction setDisableActions:0];
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 splitBackground];
  id v11 = [v9 splitBackground];
  CGAffineTransform v12 = NTKInterpolateBetweenColors();

  CGAffineTransform v13 = [v8 background];
  double v14 = [v9 background];
  objc_super v15 = NTKInterpolateBetweenColors();

  double v16 = -[NTKZeusAnalogBackgroundView _splitLayerForBleed:](self, "_splitLayerForBleed:", [v8 bleed]);
  CGFloat v17 = -[NTKZeusAnalogBackgroundView _splitLayerForBleed:](self, "_splitLayerForBleed:", [v9 bleed]);
  +[CATransaction setDisableActions:1];
  if (v16 == v17)
  {
    LODWORD(v18) = 1.0;
    double v20 = v16;
  }
  else
  {
    double v19 = 1.0 - a3;
    *(float *)&double v19 = 1.0 - a3;
    [v16 setOpacity:v19];
    *(float *)&double v18 = a3;
    double v20 = v17;
  }
  [v20 setOpacity:v18];
  splits = self->_splits;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_E16C;
  v35[3] = &unk_3CDE0;
  id v22 = v17;
  id v36 = v22;
  id v23 = v16;
  id v37 = v23;
  [(NSMutableDictionary *)splits enumerateKeysAndObjectsUsingBlock:v35];
  LODWORD(splits) = [v8 isGradientStyle];
  id v24 = v12;
  id v25 = [v24 CGColor];
  if (splits) {
    [v23 setContentsMultiplyColor:v25];
  }
  else {
    [v23 setBackgroundColor:v25];
  }
  unsigned int v26 = [v9 isGradientStyle];
  id v27 = v24;
  id v28 = [v27 CGColor];
  if (v26) {
    [v22 setContentsMultiplyColor:v28];
  }
  else {
    [v22 setBackgroundColor:v28];
  }
  v29 = [(NTKZeusAnalogBackgroundView *)self layer];
  id v30 = v15;
  objc_msgSend(v29, "setBackgroundColor:", objc_msgSend(v30, "CGColor"));

  if ([v9 isCompositePalette])
  {
    CGAffineTransformMakeRotation(&v34, self->_rotation);
    CGAffineTransform v33 = v34;
    [v22 setAffineTransform:&v33];
  }
  if ([v8 isCompositePalette])
  {
    CGAffineTransformMakeRotation(&v32, self->_rotation);
    CGAffineTransform v31 = v32;
    [v23 setAffineTransform:&v31];
  }
  +[CATransaction setDisableActions:0];
}

- (void)applyRotation:(double)a3
{
  self->_rotation = a3;
  +[CATransaction setDisableActions:1];
  splits = self->_splits;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_E288;
  v6[3] = &unk_3CE00;
  *(double *)&v6[4] = a3;
  [(NSMutableDictionary *)splits enumerateKeysAndObjectsUsingBlock:v6];
  +[CATransaction setDisableActions:0];
}

- (void)applyAnimation:(id)a3
{
}

- (void)cancelAnimation
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splits, 0);
  objc_storeStrong((id *)&self->_straightSplit, 0);
  objc_storeStrong((id *)&self->_activeSplit, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end