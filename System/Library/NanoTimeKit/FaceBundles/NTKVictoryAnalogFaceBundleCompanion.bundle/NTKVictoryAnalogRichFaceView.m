@interface NTKVictoryAnalogRichFaceView
+ (int64_t)uiSensitivity;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (CGPoint)_contentCenterOffset;
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (NTKVictoryAnalogRichFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (unint64_t)_layoutStyleForSlot:(id)a3;
- (void)_applyColor:(id)a3 toComplicationView:(id)a4;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_loadSnapshotContentViews;
@end

@implementation NTKVictoryAnalogRichFaceView

+ (int64_t)uiSensitivity
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___NTKVictoryAnalogRichFaceView;
  int64_t result = (int64_t)objc_msgSendSuper2(&v3, "uiSensitivity");
  if (!result) {
    return NTKBlueRidgeUISensitivity();
  }
  return result;
}

- (NTKVictoryAnalogRichFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NTKVictoryAnalogRichFaceView;
  v9 = [(NTKVictoryAnalogFaceView *)&v17 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    v11 = [(NTKVictoryAnalogRichFaceView *)v9 complicationFactory];
    [v11 setGraphicCornerComplications:1];
    sub_3E18(v8, (uint64_t)v13);
    objc_msgSend(v11, "setScreenEdgeInsets:", v14, v15, 0.0, v16);
  }
  return v10;
}

- (void)_loadSnapshotContentViews
{
  v6.receiver = self;
  v6.super_class = (Class)NTKVictoryAnalogRichFaceView;
  [(NTKVictoryAnalogFaceView *)&v6 _loadSnapshotContentViews];
  memset(&v5, 0, sizeof(v5));
  CGAffineTransformMakeScale(&v5, 0.93, 0.93);
  objc_super v3 = [(NTKVictoryAnalogFaceView *)self scaleView];
  CGAffineTransform v4 = v5;
  [v3 setTransform:&v4];
}

- (void)_applyColor:(id)a3 toComplicationView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)NTKVictoryAnalogRichFaceView;
  [(NTKVictoryAnalogFaceView *)&v9 _applyColor:v6 toComplicationView:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    [(NTKVictoryAnalogRichFaceView *)self setComplicationColor:v6];
    [(NTKVictoryAnalogRichFaceView *)self setInterpolatedComplicationColor:v6];
    [v8 updateMonochromeColor];
  }
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  if ((id)NTKComplicationSlotBottomCenter != a4) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NTKVictoryAnalogRichFaceView;
  return -[NTKVictoryAnalogFaceView _legacyLayoutOverrideforComplicationType:slot:](&v5, "_legacyLayoutOverrideforComplicationType:slot:", a3);
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  if ((id)NTKComplicationSlotBottomCenter == a3)
  {
    v25.receiver = self;
    v25.super_class = (Class)NTKVictoryAnalogRichFaceView;
    id v16 = a3;
    [(NTKVictoryAnalogFaceView *)&v25 _keylineFrameForComplicationSlot:v16 selected:v4];
    double v9 = v17;
    double v11 = v18;
    double v13 = v19;
    double v15 = v20;
  }
  else
  {
    id v6 = a3;
    id v7 = [(NTKVictoryAnalogRichFaceView *)self complicationFactory];
    [v7 keylineFrameForCornerComplicationSlot:v6 selected:v4 faceView:self];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  double v21 = v9;
  double v22 = v11;
  double v23 = v13;
  double v24 = v15;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGPoint)_contentCenterOffset
{
  v5.receiver = self;
  v5.super_class = (Class)NTKVictoryAnalogRichFaceView;
  [(NTKVictoryAnalogFaceView *)&v5 _contentCenterOffset];
  double v4 = v3 + 2.0;
  result.y = v4;
  result.x = v2;
  return result;
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  if ((id)NTKComplicationSlotBottomCenter == a5)
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKVictoryAnalogRichFaceView;
    id v12 = a5;
    id v13 = a3;
    id v11 = [(NTKVictoryAnalogFaceView *)&v15 _newLegacyViewForComplication:v13 family:a4 slot:v12];
  }
  else
  {
    id v8 = a5;
    id v9 = a3;
    double v10 = [(NTKVictoryAnalogRichFaceView *)self complicationFactory];
    id v11 = [v10 newLegacyViewForComplication:v9 family:a4 slot:v8];
  }
  return v11;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKVictoryAnalogRichFaceView;
  [(NTKVictoryAnalogFaceView *)&v10 _configureComplicationView:v6 forSlot:a4];
  id v7 = [(NTKVictoryAnalogRichFaceView *)self optionForCustomEditMode:10 slot:0];
  id v8 = [v7 pigmentEditOption];

  if (v8)
  {
    if ([v6 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
    {
      id v9 = v6;
      [v9 setUseRoundedFontDesign:1];
      [v9 setFontWeight:UIFontWeightMedium];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 transitionToMonochromeWithFraction:1.0];
    }
  }
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return a4 == 11;
}

- (unint64_t)_layoutStyleForSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:NTKComplicationSlotBottomCenter])
  {
    id v5 = &dword_0 + 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKVictoryAnalogRichFaceView;
    id v5 = [(NTKVictoryAnalogRichFaceView *)&v7 _layoutStyleForSlot:v4];
  }

  return (unint64_t)v5;
}

@end