@interface NTKColorAnalogRichFaceView
+ (int64_t)uiSensitivity;
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (NTKColorAnalogRichFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_fadeComplicationFraction:(double)a3 entry:(double)a4 exit:(double)a5 slot:(id)a6;
- (void)_loadLayoutRules;
@end

@implementation NTKColorAnalogRichFaceView

+ (int64_t)uiSensitivity
{
  return _NTKBlueRidgeUISensitivity(a1, a2);
}

- (NTKColorAnalogRichFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKColorAnalogRichFaceView;
  v9 = [(NTKColorAnalogFaceView *)&v14 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    id v10 = objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory);
    +[NTKAnalogUtilities dialSizeForDevice:v8];
    v11 = (NTKWhistlerAnalogFaceViewComplicationFactory *)objc_msgSend(v10, "initWithFaceView:dialDiameter:device:", v9, v8);
    cornerComplicationFactory = v9->_cornerComplicationFactory;
    v9->_cornerComplicationFactory = v11;

    [(NTKWhistlerAnalogFaceViewComplicationFactory *)v9->_cornerComplicationFactory setUsesNarrowTopSlots:1];
    [(NTKColorAnalogRichFaceView *)v9 setComplicationFactory:v9->_cornerComplicationFactory];
  }

  return v9;
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v9 isEqualToString:NTKComplicationSlotMonogram])
  {
    v13.receiver = self;
    v13.super_class = (Class)NTKColorAnalogRichFaceView;
    id v10 = [(NTKColorAnalogFaceView *)&v13 _newLegacyViewForComplication:v8 family:a4 slot:v9];
  }
  else
  {
    v11 = [(NTKColorAnalogRichFaceView *)self complicationFactory];
    id v10 = [v11 newLegacyViewForComplication:v8 family:a4 slot:v9];
  }
  return v10;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKColorAnalogRichFaceView;
  [(NTKColorAnalogFaceView *)&v12 _configureComplicationView:v6 forSlot:v7];
  if (([v7 isEqualToString:NTKComplicationSlotMonogram] & 1) == 0)
  {
    id v8 = [(NTKColorAnalogRichFaceView *)self complicationFactory];
    [v8 configureComplicationView:v6 forSlot:v7];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
    id v10 = [(NTKColorAnalogFaceView *)self complicationForegroundColor];
    [(NTKColorAnalogRichFaceView *)self setComplicationColor:v10];

    v11 = [(NTKColorAnalogFaceView *)self complicationForegroundColor];
    [(NTKColorAnalogRichFaceView *)self setInterpolatedComplicationColor:v11];

    [v9 transitionToMonochromeWithFraction:1.0];
    [v9 updateMonochromeColor];
  }
}

- (void)_loadLayoutRules
{
  v2 = [(NTKColorAnalogRichFaceView *)self complicationFactory];
  [v2 loadLayoutRules];

  NTKEnumerateComplicationStates();
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([v6 isEqualToString:NTKComplicationSlotMonogram] & 1) != 0
    || ([(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_cornerComplicationFactory keylineFrameForCornerComplicationSlot:v6 selected:v4], CGFloat x = v20.origin.x, y = v20.origin.y, width = v20.size.width, height = v20.size.height, CGRectIsEmpty(v20)))
  {
    v19.receiver = self;
    v19.super_class = (Class)NTKColorAnalogRichFaceView;
    [(NTKColorAnalogRichFaceView *)&v19 _keylineFrameForComplicationSlot:v6 selected:v4];
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

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKColorAnalogRichFaceView;
  [(NTKColorAnalogFaceView *)&v8 _applyOption:a3 forCustomEditMode:a4 slot:a5];
  if (a4 == 10)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_AC40;
    v7[3] = &unk_104D8;
    v7[4] = self;
    [(NTKColorAnalogRichFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v7];
  }
}

- (void)_fadeComplicationFraction:(double)a3 entry:(double)a4 exit:(double)a5 slot:(id)a6
{
  id v7 = a6;
  CLKCompressFraction();
  double v9 = v8;
  id v10 = [(NTKColorAnalogRichFaceView *)self interpolatedColorPalette];
  [v10 setTransitionFraction:v9];

  double v11 = [(NTKColorAnalogRichFaceView *)self normalComplicationDisplayWrapperForSlot:v7];

  id v19 = [v11 display];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v19;
    double v13 = [(NTKColorAnalogRichFaceView *)self complicationColor];
    double v14 = [(NTKColorAnalogRichFaceView *)self interpolatedComplicationColor];
    double v15 = [(NTKColorAnalogRichFaceView *)self interpolatedColorPalette];
    double v16 = [v15 primaryShiftedColor];
    [(NTKColorAnalogRichFaceView *)self setComplicationColor:v16];

    double v17 = [(NTKColorAnalogRichFaceView *)self interpolatedColorPalette];
    double v18 = [v17 primaryShiftedColor];
    [(NTKColorAnalogRichFaceView *)self setInterpolatedComplicationColor:v18];

    [v12 updateMonochromeColor];
    [(NTKColorAnalogRichFaceView *)self setComplicationColor:v13];
    [(NTKColorAnalogRichFaceView *)self setInterpolatedComplicationColor:v14];
  }
}

- (void).cxx_destruct
{
}

@end