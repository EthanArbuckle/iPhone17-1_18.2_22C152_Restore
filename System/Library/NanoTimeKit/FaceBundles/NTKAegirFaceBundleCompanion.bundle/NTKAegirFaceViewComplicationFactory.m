@interface NTKAegirFaceViewComplicationFactory
- (BOOL)fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4 faceView:(id)a5;
- (CGRect)topComplicationFrame;
- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5;
- (void)loadLayoutRulesForFaceView:(id)a3;
- (void)setTopComplicationFrame:(CGRect)a3;
@end

@implementation NTKAegirFaceViewComplicationFactory

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NTKAegirFaceViewComplicationFactory;
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)&v15 configureComplicationView:v8 forSlot:v9 faceView:v10];
  if ([v9 isEqualToString:*MEMORY[0x1E4F79F68]]
    && [v8 conformsToProtocol:&unk_1FCD90920])
  {
    id v11 = v10;
    id v12 = v8;
    [v11 topComplicationFontWeight];
    objc_msgSend(v12, "setFontWeight:");
    [v11 topComplicationFontSize];
    double v14 = v13;

    [v12 setFontSize:v14];
    [v12 setPlacement:0];
  }
  else if ([v9 isEqualToString:*MEMORY[0x1E4F79F60]])
  {
    [v8 setPlacement:4];
  }
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NTKAegirFaceViewComplicationFactory;
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)&v25 loadLayoutRulesForFaceView:v4];
  v5 = [(NTKFaceViewComplicationFactory *)self device];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self supportedComplicationSlots];
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    uint64_t v9 = *MEMORY[0x1E4F79F68];
    uint64_t v10 = *MEMORY[0x1E4F79F60];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        double v13 = [v4 complicationLayoutforSlot:v12];
        if ([v12 isEqualToString:v9])
        {
          double v14 = objc_msgSend(MEMORY[0x1E4F79FB8], "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:clip:", v5, 3, 3, 1, self->_topComplicationFrame.origin.x, self->_topComplicationFrame.origin.y, self->_topComplicationFrame.size.width, self->_topComplicationFrame.size.height);
          id v19 = v13;
          v20 = v14;
          id v15 = v14;
          NTKEnumerateComplicationStates();
        }
        else
        {
          if (![v12 isEqualToString:v10]) {
            goto LABEL_11;
          }
          [v5 screenBounds];
          id v17 = v13;
          id v18 = v5;
          NTKEnumerateComplicationStates();

          id v15 = v17;
        }

LABEL_11:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }
}

- (BOOL)fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4 faceView:(id)a5
{
  return (unint64_t)a4 > 1;
}

- (CGRect)topComplicationFrame
{
  double x = self->_topComplicationFrame.origin.x;
  double y = self->_topComplicationFrame.origin.y;
  double width = self->_topComplicationFrame.size.width;
  double height = self->_topComplicationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTopComplicationFrame:(CGRect)a3
{
  self->_topComplicationFrame = a3;
}

@end