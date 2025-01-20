@interface NTKCollieFaceViewComplicationFactory
- (BOOL)fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4 faceView:(id)a5;
- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6;
- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5;
- (void)loadLayoutRulesForFaceView:(id)a3;
@end

@implementation NTKCollieFaceViewComplicationFactory

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)NTKCollieFaceViewComplicationFactory;
  id v11 = a5;
  id v12 = [(NTKCollieFaceViewComplicationFactory *)&v15 newLegacyViewForComplication:a3 family:a4 slot:v11 faceView:v10];
  LODWORD(a4) = objc_msgSend(v11, "isEqualToString:", NTKComplicationSlotDate, v15.receiver, v15.super_class);

  if (a4)
  {
    v13 = [v10 _dateComplicationFont];
    [v12 setFont:v13];
  }
  return v12;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
  id v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKCollieFaceViewComplicationFactory;
  id v9 = a4;
  [(NTKCollieFaceViewComplicationFactory *)&v10 configureComplicationView:v8 forSlot:v9 faceView:a5];
  LODWORD(a5) = objc_msgSend(v9, "isEqualToString:", NTKComplicationSlotBottom, v10.receiver, v10.super_class);

  if (a5) {
    [v8 setPlacement:4];
  }
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)NTKCollieFaceViewComplicationFactory;
  [(NTKCollieFaceViewComplicationFactory *)&v43 loadLayoutRulesForFaceView:v4];
  v5 = [(NTKCollieFaceViewComplicationFactory *)self device];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [(NTKCollieFaceViewComplicationFactory *)self supportedComplicationSlots];
  id v6 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v40;
    uint64_t v9 = NTKComplicationSlotDate;
    uint64_t v10 = NTKComplicationSlotBottom;
    v24 = v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v13 = objc_msgSend(v4, "complicationLayoutforSlot:", v12, v24);
        if ([v12 isEqualToString:v9])
        {
          [v4 _dateComplicationFrame];
          v14 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:", v5, 3, 3);
          v33 = _NSConcreteStackBlock;
          uint64_t v34 = 3221225472;
          v35 = sub_126C8;
          v36 = &unk_29008;
          id v37 = v13;
          id v38 = v14;
          id v15 = v14;
          NTKEnumerateComplicationStates();
        }
        else
        {
          if (![v12 isEqualToString:v10]) {
            goto LABEL_11;
          }
          [v5 screenBounds];
          uint64_t v17 = v16;
          uint64_t v19 = v18;
          uint64_t v21 = v20;
          uint64_t v23 = v22;
          v26[0] = sub_126D8;
          v26[1] = &unk_29030;
          id v27 = v13;
          uint64_t v29 = v17;
          uint64_t v30 = v19;
          uint64_t v31 = v21;
          uint64_t v32 = v23;
          id v28 = v5;
          NTKEnumerateComplicationStates();

          id v15 = v27;
        }

LABEL_11:
      }
      id v7 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v7);
  }
}

- (BOOL)fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4 faceView:(id)a5
{
  return ((unint64_t)a4 > 0xF) | (0x7BFCu >> a4) & 1;
}

@end