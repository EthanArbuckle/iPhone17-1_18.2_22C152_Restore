@interface NTKExplorerRichFaceView
+ (int64_t)uiSensitivity;
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (id)_newComplicationFactoryForDevice:(id)a3;
@end

@implementation NTKExplorerRichFaceView

+ (int64_t)uiSensitivity
{
  return _NTKBlueRidgeUISensitivity(a1, a2);
}

- (id)_newComplicationFactoryForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NTKColorCircularUtilitarianFaceViewComplicationFactory) initWithFaceView:self device:v4 graphicCornerComplications:1];

  return v5;
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([v6 isEqualToString:NTKComplicationSlotTopLeft] & 1) != 0
    || [v6 isEqualToString:NTKComplicationSlotTopRight])
  {
    v7 = [(NTKExplorerFaceView *)self faceViewComplicationFactory];
    [v7 keylineFrameForCornerComplicationSlot:v6 selected:v4];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)NTKExplorerRichFaceView;
    [(NTKExplorerRichFaceView *)&v24 _keylineFrameForComplicationSlot:v6 selected:v4];
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
    double v15 = v19;
  }

  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  double v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

@end