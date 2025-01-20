@interface NTKVictoryDigitalRichFaceView
+ (int64_t)uiSensitivity;
- (void)_applyColor:(id)a3 platterColor:(id)a4 toComplicationView:(id)a5 slot:(id)a6;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_setupLogoViews;
@end

@implementation NTKVictoryDigitalRichFaceView

+ (int64_t)uiSensitivity
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___NTKVictoryDigitalRichFaceView;
  int64_t result = (int64_t)objc_msgSendSuper2(&v3, "uiSensitivity");
  if (!result) {
    return NTKBlueRidgeUISensitivity();
  }
  return result;
}

- (void)_setupLogoViews
{
  id v3 = [objc_alloc((Class)NTKComplicationDisplayWrapperView) initWithFamily:10];
  [(NTKVictoryDigitalFaceView *)self setLogoWrapperView:v3];

  v4 = [(NTKVictoryDigitalRichFaceView *)self device];
  NTKCircularMediumComplicationDiameter();
  double v6 = v5;

  v7 = [(NTKVictoryDigitalFaceView *)self logoWrapperView];
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, v6, v6);

  v8 = +[NTKVictoryDigitalFaceBundle imageWithName:@"victoryNTK-complication-logo"];
  v9 = +[CLKFullColorImageProvider providerWithFullColorImage:v8];

  v10 = +[CLKComplicationTemplateGraphicCircularImage templateWithImageProvider:v9];
  uint64_t v20 = NTKRichComplicationViewUsePlatterKey;
  v21 = &__kCFBooleanTrue;
  v11 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [v10 setMetadata:v11];

  v12 = [(NTKVictoryDigitalFaceView *)self logoWrapperView];
  [v12 setComplicationTemplate:v10 reason:0 animation:0];

  v13 = [(NTKVictoryDigitalFaceView *)self logoWrapperView];
  v14 = [v13 display];
  [(NTKVictoryDigitalRichFaceView *)self _configureComplicationView:v14 forSlot:0];

  v15 = [(NTKVictoryDigitalFaceView *)self logoWrapperView];
  [v15 setTapEnabled:1];

  v16 = [(NTKVictoryDigitalFaceView *)self logoWrapperView];
  [v16 addTarget:self action:"_logoTapped" forControlEvents:64];

  v17 = [(NTKVictoryDigitalRichFaceView *)self complicationContainerView];
  v18 = [(NTKVictoryDigitalFaceView *)self logoWrapperView];
  [v17 addSubview:v18];

  v19 = [(NTKVictoryDigitalFaceView *)self logoWrapperView];
  [v19 setFilterProvider:self];
}

- (void)_applyColor:(id)a3 platterColor:(id)a4 toComplicationView:(id)a5 slot:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NTKVictoryDigitalRichFaceView;
  [(NTKVictoryDigitalFaceView *)&v15 _applyColor:v10 platterColor:a4 toComplicationView:v11 slot:a6];
  if ([v11 conformsToProtocol:&OBJC_PROTOCOL___NTKRichComplicationCircularView]) {
    [v11 setAccentedAlternateBackground:1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    [(NTKVictoryDigitalRichFaceView *)self setComplicationColor:v10];
    [(NTKVictoryDigitalRichFaceView *)self setInterpolatedComplicationColor:v10];
    v13 = [(NTKVictoryDigitalFaceView *)self palette];
    v14 = [v13 alternateComplicationColor];
    [(NTKVictoryDigitalRichFaceView *)self setAlternateComplicationColor:v14];

    [v12 transitionToMonochromeWithFraction:1.0];
  }
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKVictoryDigitalRichFaceView;
  [(NTKVictoryDigitalFaceView *)&v14 _configureComplicationView:v6 forSlot:a4];
  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___NTKRichComplicationCircularView]) {
    [v6 setAccentedAlternateBackground:1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    v8 = [(NTKVictoryDigitalFaceView *)self palette];
    v9 = [v8 complication];
    [(NTKVictoryDigitalRichFaceView *)self setComplicationColor:v9];

    id v10 = [(NTKVictoryDigitalFaceView *)self palette];
    id v11 = [v10 complication];
    [(NTKVictoryDigitalRichFaceView *)self setInterpolatedComplicationColor:v11];

    id v12 = [(NTKVictoryDigitalFaceView *)self palette];
    v13 = [v12 alternateComplicationColor];
    [(NTKVictoryDigitalRichFaceView *)self setAlternateComplicationColor:v13];

    [v7 transitionToMonochromeWithFraction:1.0];
  }
}

@end