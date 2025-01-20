@interface NTKPrideAnalogRichFaceView
+ (int64_t)uiSensitivity;
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_setupComplicationFactoryForDevice:(id)a3;
- (void)_updateComplicationColors;
- (void)_updateComplicationColorsForView:(id)a3 foregroundColor:(id)a4 platterColor:(id)a5;
@end

@implementation NTKPrideAnalogRichFaceView

+ (int64_t)uiSensitivity
{
  return _NTKBlueRidgeUISensitivity(a1, a2);
}

- (void)_setupComplicationFactoryForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory);
  +[NTKAnalogUtilities dialSizeForDevice:v4];
  v6 = (NTKWhistlerAnalogFaceViewComplicationFactory *)objc_msgSend(v5, "initWithFaceView:dialDiameter:device:", self, v4);

  cornerComplicationFactory = self->_cornerComplicationFactory;
  self->_cornerComplicationFactory = v6;

  v8 = self->_cornerComplicationFactory;

  [(NTKPrideAnalogRichFaceView *)self setComplicationFactory:v8];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKPrideAnalogRichFaceView;
  [(NTKPrideAnalogRichFaceView *)&v12 _configureComplicationView:v6 forSlot:a4];
  v7 = [(NTKPrideAnalogFaceView *)self activeQuad];
  v8 = [v7 splineColorAtIndex:0];

  [(NTKPrideAnalogFaceView *)self complicationBrightness];
  v10 = [(NTKPrideAnalogFaceView *)self adjustBrightnessOfColor:v8 brightnessAmount:v9];
  v11 = [(NTKPrideAnalogFaceView *)self adjustBrightnessOfColor:v10 brightnessAmount:-0.8];
  [(NTKPrideAnalogRichFaceView *)self _updateComplicationColorsForView:v6 foregroundColor:v10 platterColor:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 transitionToMonochromeWithFraction:1.0];
  }
}

- (void)_updateComplicationColors
{
  v3 = [(NTKPrideAnalogFaceView *)self activeQuad];
  id v4 = [v3 splineColorAtIndex:0];

  [(NTKPrideAnalogFaceView *)self complicationBrightness];
  id v6 = [(NTKPrideAnalogFaceView *)self adjustBrightnessOfColor:v4 brightnessAmount:v5];
  [(NTKPrideAnalogFaceView *)self adjustBrightnessOfColor:v6 brightnessAmount:-0.8];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_170B0;
  v9[3] = &unk_24B58;
  v9[4] = self;
  id v10 = v6;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v11;
  id v8 = v6;
  [(NTKPrideAnalogRichFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v9];
}

- (void)_updateComplicationColorsForView:(id)a3 foregroundColor:(id)a4 platterColor:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v12;
    [v10 setForegroundColor:v8];
    [v10 setPlatterColor:v9];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    id v11 = v12;
    [(NTKPrideAnalogRichFaceView *)self setComplicationColor:v8];
    [(NTKPrideAnalogRichFaceView *)self setInterpolatedComplicationColor:v8];
    [v11 updateMonochromeColor];
  }

LABEL_6:
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  return (int64_t)[(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_cornerComplicationFactory keylineStyleForComplicationSlot:a3];
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([v6 isEqualToString:NTKComplicationSlotMonogram] & 1) != 0
    || ([(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_cornerComplicationFactory keylineFrameForCornerComplicationSlot:v6 selected:v4], CGFloat x = v20.origin.x, y = v20.origin.y, width = v20.size.width, height = v20.size.height, CGRectIsEmpty(v20)))
  {
    v19.receiver = self;
    v19.super_class = (Class)NTKPrideAnalogRichFaceView;
    [(NTKPrideAnalogRichFaceView *)&v19 _keylineFrameForComplicationSlot:v6 selected:v4];
    CGFloat x = v11;
    CGFloat y = v12;
    CGFloat width = v13;
    CGFloat height = v14;
  }

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void).cxx_destruct
{
}

@end