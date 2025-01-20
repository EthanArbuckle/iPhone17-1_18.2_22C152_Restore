@interface NTKActivityDigitalRichFaceView
+ (int64_t)uiSensitivity;
- ($0133E12197E66152D7F90595F26F386E)_layoutConstants;
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (id)_newFaceViewFactoryForDevice:(id)a3;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
@end

@implementation NTKActivityDigitalRichFaceView

+ (int64_t)uiSensitivity
{
  return _NTKBlueRidgeUISensitivity(a1, a2);
}

- ($0133E12197E66152D7F90595F26F386E)_layoutConstants
{
  v4 = [(NTKActivityDigitalRichFaceView *)self device];
  retstr->var16.interspacing = 0.0;
  *(_OWORD *)&retstr->var16.bottomEdgeInset = 0u;
  *(_OWORD *)&retstr->var16.diameter = 0u;
  *(_OWORD *)&retstr->var15.leftEdgeInset = 0u;
  *(_OWORD *)&retstr->var15.thickness = 0u;
  *(_OWORD *)&retstr->var14.diameter = 0u;
  *(_OWORD *)&retstr->var14.interspacing = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14.bottomEdgeInset = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var5.right = 0u;
  *(_OWORD *)&retstr->var6.height = 0u;
  *(_OWORD *)&retstr->var4.right = 0u;
  *(_OWORD *)&retstr->var5.left = 0u;
  *(_OWORD *)&retstr->var3.right = 0u;
  *(_OWORD *)&retstr->var4.left = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var3.left = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  id v5 = v4;
  sub_DFB4(v5, retstr);
  v6 = +[CLKDeviceMetrics metricsWithDevice:v5 identitySizeClass:2];

  v15[0] = &off_217C8;
  v15[1] = &off_217E0;
  v16[0] = &off_220E0;
  v16[1] = &off_220F0;
  v15[2] = &off_217F8;
  v15[3] = &off_21810;
  v16[2] = &off_22100;
  v16[3] = &off_22110;
  v15[4] = &off_21828;
  v15[5] = &off_21840;
  v16[4] = &off_22120;
  v16[5] = &off_22130;
  v7 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];
  [v6 scaledValue:v7 withOverrides:70.5];
  retstr->var0 = v8;

  v13[0] = &off_217C8;
  v13[1] = &off_217E0;
  v14[0] = &off_22140;
  v14[1] = &off_22150;
  v13[2] = &off_217F8;
  v13[3] = &off_21810;
  v14[2] = &off_22160;
  v14[3] = &off_22170;
  v13[4] = &off_21828;
  v13[5] = &off_21840;
  v14[4] = &off_21FE0;
  v14[5] = &off_21FF0;
  v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];
  [v6 scaledValue:v9 withOverrides:29.0];
  double v11 = v10;

  retstr->var14.bottomEdgeInset = v11;
  retstr->var15.bottomEdgeInset = v11;
  retstr->var16.bottomEdgeInset = v11;

  return result;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKActivityDigitalRichFaceView;
  [(NTKActivityDigitalRichFaceView *)&v7 _configureComplicationView:v6 forSlot:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 transitionToMonochromeWithFraction:0.0];
  }
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [(NTKActivityDigitalRichFaceView *)self complicationFactory];
  [v7 faceView:self keylineFrameForComplicationSlot:v6 selected:v4];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_newFaceViewFactoryForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKActivityFaceViewFactory alloc] initForAnalog:0 richComplications:1 forDevice:v3];

  return v4;
}

@end