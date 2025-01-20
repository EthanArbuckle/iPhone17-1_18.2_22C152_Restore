@interface NTKActivityAnalogRichFaceView
+ (int64_t)uiSensitivity;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (NTKActivityAnalogRichFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (id)_newFaceViewFactoryForDevice:(id)a3;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)fadeComplicationSlot:(id)a3 entry:(double)a4 exit:(double)a5 fraction:(double)a6 fromPalette:(id)a7 toPalette:(id)a8;
@end

@implementation NTKActivityAnalogRichFaceView

+ (int64_t)uiSensitivity
{
  return _NTKBlueRidgeUISensitivity(a1, a2);
}

- (NTKActivityAnalogRichFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NTKActivityAnalogRichFaceView;
  v9 = [(NTKActivityAnalogFaceView *)&v22 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    id v10 = objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory);
    +[NTKAnalogUtilities dialSizeForDevice:v8];
    v11 = (NTKWhistlerAnalogFaceViewComplicationFactory *)objc_msgSend(v10, "initWithFaceView:dialDiameter:device:", v9, v8);
    cornerComplicationFactory = v9->_cornerComplicationFactory;
    v9->_cornerComplicationFactory = v11;

    [(NTKWhistlerAnalogFaceViewComplicationFactory *)v9->_cornerComplicationFactory setUsesNarrowTopSlots:1];
    uint64_t v13 = objc_opt_new();
    compositeComplicationFactory = v9->_compositeComplicationFactory;
    v9->_compositeComplicationFactory = (NTKCompositeComplicationFactory *)v13;

    v15 = v9->_compositeComplicationFactory;
    v16 = v9->_cornerComplicationFactory;
    v24[0] = NTKComplicationSlotTopLeft;
    v24[1] = NTKComplicationSlotTopRight;
    v17 = +[NSArray arrayWithObjects:v24 count:2];
    [(NTKCompositeComplicationFactory *)v15 registerFactory:v16 forSlots:v17];

    v18 = v9->_compositeComplicationFactory;
    v19 = [(NTKActivityAnalogFaceView *)v9 faceViewFactory];
    v23[0] = NTKComplicationSlotBottomCenter;
    v23[1] = NTKComplicationSlotDate;
    v20 = +[NSArray arrayWithObjects:v23 count:2];
    [(NTKCompositeComplicationFactory *)v18 registerFactory:v19 forSlots:v20];

    [(NTKActivityAnalogRichFaceView *)v9 setComplicationFactory:v9->_compositeComplicationFactory];
  }

  return v9;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKActivityAnalogRichFaceView;
  [(NTKActivityAnalogRichFaceView *)&v15 _configureComplicationView:v6 forSlot:v7];
  id v8 = [(NTKActivityAnalogRichFaceView *)self faceColorPalette];
  v9 = [v8 primaryColor];

  [(NTKActivityAnalogRichFaceView *)self setComplicationColor:v9];
  [(NTKActivityAnalogRichFaceView *)self setInterpolatedComplicationColor:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v6;
    v11 = [(NTKActivityAnalogRichFaceView *)self faceColorPalette];
    if ([v11 isMulticolor]) {
      double v12 = 0.0;
    }
    else {
      double v12 = 1.0;
    }

    [v10 transitionToMonochromeWithFraction:v12];
  }
  if ([v7 isEqualToString:NTKComplicationSlotBottomCenter]
    && [v6 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    id v13 = v6;
    v14 = [(NTKActivityAnalogRichFaceView *)self faceColorPalette];
    [v13 applyFaceColorPalette:v14 units:1];
  }
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([v6 isEqualToString:NTKComplicationSlotTopLeft] & 1) != 0
    || [v6 isEqualToString:NTKComplicationSlotTopRight])
  {
    [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_cornerComplicationFactory keylineFrameForCornerComplicationSlot:v6 selected:v4];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)NTKActivityAnalogRichFaceView;
    [(NTKActivityAnalogRichFaceView *)&v19 _keylineFrameForComplicationSlot:v6 selected:v4];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKActivityAnalogRichFaceView;
  [(NTKActivityAnalogFaceView *)&v8 _applyOption:a3 forCustomEditMode:a4 slot:a5];
  if (a4 == 10)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_8DB0;
    v7[3] = &unk_20970;
    v7[4] = self;
    [(NTKActivityAnalogRichFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v7];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NTKActivityAnalogRichFaceView;
  [(NTKActivityAnalogFaceView *)&v20 _applyTransitionFraction:v12 fromOption:v13 toOption:a6 forCustomEditMode:a7 slot:a3];
  if (a6 == 10)
  {
    double v14 = [(NTKActivityAnalogRichFaceView *)self faceColorPalette];
    id v15 = [v14 copy];

    double v16 = [v12 pigmentEditOption];
    [v15 setPigmentEditOption:v16];

    double v17 = [(NTKActivityAnalogRichFaceView *)self faceColorPalette];
    id v18 = [v17 copy];

    objc_super v19 = [v13 pigmentEditOption];
    [v18 setPigmentEditOption:v19];

    [(NTKActivityAnalogRichFaceView *)self fadeComplicationSlot:NTKComplicationSlotTopRight entry:v15 exit:v18 fraction:0.05 fromPalette:0.15 toPalette:a3];
    [(NTKActivityAnalogRichFaceView *)self fadeComplicationSlot:NTKComplicationSlotBottomCenter entry:v15 exit:v18 fraction:0.45 fromPalette:0.55 toPalette:a3];
    [(NTKActivityAnalogRichFaceView *)self fadeComplicationSlot:NTKComplicationSlotTopLeft entry:v15 exit:v18 fraction:0.85 fromPalette:0.95 toPalette:a3];
  }
}

- (void)fadeComplicationSlot:(id)a3 entry:(double)a4 exit:(double)a5 fraction:(double)a6 fromPalette:(id)a7 toPalette:(id)a8
{
  id v25 = a7;
  id v11 = a8;
  id v12 = a3;
  [v25 isMulticolor];
  [v11 isMulticolor];
  CLKCompressFraction();
  double v14 = v13;
  CLKInterpolateBetweenFloatsClipped();
  double v16 = v15;
  double v17 = [v25 primaryColor];
  id v18 = [v11 primaryColor];
  objc_super v19 = NTKInterpolateBetweenColors();

  [(NTKActivityAnalogRichFaceView *)self setComplicationColor:v19];
  [(NTKActivityAnalogRichFaceView *)self setInterpolatedComplicationColor:v19];
  objc_super v20 = [(NTKActivityAnalogRichFaceView *)self normalComplicationDisplayWrapperForSlot:v12];

  v21 = [v20 display];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v21 transitionToMonochromeWithFraction:v16];
  }
  if ([v21 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    id v22 = v21;
    v23 = v22;
    if (v14 == 0.0)
    {
      id v24 = v25;
    }
    else
    {
      if (v14 != 1.0)
      {
        [v22 applyTransitionFraction:v25 fromFaceColorPalette:v11 toFaceColorPalette:1 units:0 brightenedUnits:v14];
        goto LABEL_9;
      }
      id v24 = v11;
    }
    [v22 applyFaceColorPalette:v24 units:1];
LABEL_9:
  }
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return a4 == 11;
}

- (id)_newFaceViewFactoryForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKActivityFaceViewFactory alloc] initForAnalog:1 richComplications:1 forDevice:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositeComplicationFactory, 0);

  objc_storeStrong((id *)&self->_cornerComplicationFactory, 0);
}

@end