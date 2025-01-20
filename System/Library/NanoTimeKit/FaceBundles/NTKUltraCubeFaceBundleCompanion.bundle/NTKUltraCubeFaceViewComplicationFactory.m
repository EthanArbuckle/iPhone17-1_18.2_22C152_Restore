@interface NTKUltraCubeFaceViewComplicationFactory
- (BOOL)fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4 faceView:(id)a5;
- (CGRect)dateComplicationFrame;
- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6;
- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5;
- (void)loadLayoutRulesForFaceView:(id)a3;
- (void)setDateComplicationFrame:(CGRect)a3;
@end

@implementation NTKUltraCubeFaceViewComplicationFactory

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)NTKUltraCubeFaceViewComplicationFactory;
  id v11 = a5;
  id v12 = [(NTKUltraCubeFaceViewComplicationFactory *)&v15 newLegacyViewForComplication:a3 family:a4 slot:v11 faceView:v10];
  LODWORD(a4) = objc_msgSend(v11, "isEqualToString:", NTKComplicationSlotDate, v15.receiver, v15.super_class);

  if (a4)
  {
    v13 = [v10 dateComplicationFont];
    [v12 setFont:v13];
  }
  return v12;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
  id v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKUltraCubeFaceViewComplicationFactory;
  id v9 = a4;
  [(NTKUltraCubeFaceViewComplicationFactory *)&v10 configureComplicationView:v8 forSlot:v9 faceView:a5];
  LODWORD(a5) = objc_msgSend(v9, "isEqualToString:", NTKComplicationSlotBottom, v10.receiver, v10.super_class);

  if (a5) {
    [v8 setPlacement:4];
  }
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NTKUltraCubeFaceViewComplicationFactory;
  [(NTKUltraCubeFaceViewComplicationFactory *)&v25 loadLayoutRulesForFaceView:v4];
  v5 = [(NTKUltraCubeFaceViewComplicationFactory *)self device];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(NTKUltraCubeFaceViewComplicationFactory *)self supportedComplicationSlots];
  id v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    uint64_t v9 = NTKComplicationSlotDate;
    uint64_t v10 = NTKComplicationSlotBottom;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v13 = [v4 complicationLayoutforSlot:v12];
        if ([v12 isEqualToString:v9])
        {
          [(NTKUltraCubeFaceViewComplicationFactory *)self dateComplicationFrame];
          v14 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:", v5, 3, 3);
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
      id v7 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }
}

- (BOOL)fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4 faceView:(id)a5
{
  return (unint64_t)a4 > 1;
}

- (CGRect)dateComplicationFrame
{
  double x = self->_dateComplicationFrame.origin.x;
  double y = self->_dateComplicationFrame.origin.y;
  double width = self->_dateComplicationFrame.size.width;
  double height = self->_dateComplicationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDateComplicationFrame:(CGRect)a3
{
  self->_dateComplicationFrame = a3;
}

@end