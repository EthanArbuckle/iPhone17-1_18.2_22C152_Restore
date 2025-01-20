@interface NTKParmesanFaceViewComplicationFactory
+ ($F24F406B2B787EFB06265DBA3D28CBD5)transitionFadeInRange;
+ ($F24F406B2B787EFB06265DBA3D28CBD5)transitionFadeOutRange;
+ (int64_t)parmesanSlotForSlot:(id)a3 alignment:(int64_t)a4;
- (CGSize)_edgeGapForState:(int64_t)a3;
- (NSArray)supportedComplicationSlots;
- (NTKFaceView)faceView;
- (NTKParmesanFaceViewComplicationFactory)initWithFaceView:(id)a3 device:(id)a4;
- (double)_keylinePaddingForState:(int64_t)a3;
- (id)_slotForParmesanSlot:(int64_t)a3;
- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)newViewForComplication:(id)a3 family:(int64_t)a4 forSlot:(id)a5;
- (int64_t)_parmesanSlotForSlot:(id)a3;
- (int64_t)alignment;
- (void)_applyAlignmentFromLayout:(id)a3;
- (void)_setPlacementforComplicationView:(id)a3;
- (void)configureComplicationLayout:(id)a3 forParmesanSlot:(int64_t)a4 withBounds:(CGRect)a5 forState:(int64_t)a6;
- (void)configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)loadLayoutRules;
- (void)setAlignment:(int64_t)a3;
- (void)setFaceView:(id)a3;
- (void)setSupportedComplicationSlots:(id)a3;
- (void)transitioningFromLayout:(id)a3 toLayout:(id)a4 progress:(double)a5;
@end

@implementation NTKParmesanFaceViewComplicationFactory

- (NTKParmesanFaceViewComplicationFactory)initWithFaceView:(id)a3 device:(id)a4
{
  v19[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NTKParmesanFaceViewComplicationFactory;
  v8 = [(NTKFaceViewComplicationFactory *)&v18 initForDevice:v7];
  v11 = v8;
  if (v8)
  {
    objc_msgSend_setFaceView_(v8, v9, (uint64_t)v6, v10);
    objc_storeStrong((id *)&v11->_device, a4);
    uint64_t v12 = *MEMORY[0x263F57820];
    v19[0] = *MEMORY[0x263F57850];
    v19[1] = v12;
    v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v13, (uint64_t)v19, 2);
    objc_msgSend_setSupportedComplicationSlots_(v11, v15, (uint64_t)v14, v16);

    v11->_alignment = 0;
  }

  return v11;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v29 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v29;
    objc_msgSend__setPlacementforComplicationView_(self, v6, (uint64_t)v5, v7);
    v11 = objc_msgSend_device(self, v8, v9, v10);
    NTKUtilityComplicationFontSize();
    objc_msgSend_setFontSize_(v5, v12, v13, v14);

    objc_super v18 = objc_msgSend_whiteColor(MEMORY[0x263F825C8], v15, v16, v17);
    objc_msgSend_setForegroundColor_(v5, v19, (uint64_t)v18, v20);

    objc_msgSend_setForegroundAlpha_(v5, v21, v22, v23, 1.0);
    objc_msgSend_setFontWeight_(v5, v24, v25, v26, *MEMORY[0x263F81828]);
    objc_msgSend_setUseRoundedFontDesign_(v5, v27, 0, v28);
  }
}

- (void)loadLayoutRules
{
  v4 = objc_msgSend_faceView(self, a2, v2, v3);
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    NTKEnumerateComplicationStates();
  }
  else
  {
    id v6 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_246C2A114(v6);
    }
  }
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  v8 = (void *)MEMORY[0x263F57AB0];
  id v9 = a5;
  id v10 = a3;
  uint64_t v14 = objc_msgSend_complicationType(v10, v11, v12, v13);
  uint64_t v17 = objc_msgSend_smallComplicationViewForType_(v8, v15, v14, v16);
  v19 = objc_msgSend_newViewForComplication_family_forSlot_(self, v18, (uint64_t)v10, a4, v9);

  return v19;
}

- (id)newViewForComplication:(id)a3 family:(int64_t)a4 forSlot:(id)a5
{
  id v5 = (void *)MEMORY[0x263F57AB0];
  uint64_t v6 = objc_msgSend_complicationType(a3, a2, (uint64_t)a3, a4, a5);
  objc_msgSend_smallComplicationViewForType_(v5, v7, v6, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_parmesanSlotForSlot:(id)a3
{
  return MEMORY[0x270F9A6D0](NTKParmesanFaceViewComplicationFactory, sel_parmesanSlotForSlot_alignment_, a3, self->_alignment);
}

- (id)_slotForParmesanSlot:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = **((id **)&unk_2651FBC78 + a3);
  }
  return v4;
}

- (void)configureComplicationLayout:(id)a3 forParmesanSlot:(int64_t)a4 withBounds:(CGRect)a5 forState:(int64_t)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  uint64_t v13 = objc_msgSend_faceView(self, a2, (uint64_t)a3, a4, a5.origin.x, a5.origin.y);
  if (v13)
  {
    objc_msgSend__keylinePaddingForState_(self, v11, a6, v12);
    double v15 = v14;
    objc_msgSend__edgeGapForState_(self, v16, a6, v17);
    double v19 = v18;
    double v21 = v20;
    sub_246B61630(self->_device, v44);
    double v22 = v45;
    sub_246B61630(self->_device, v44);
    double v23 = v46;
    sub_246B61630(self->_device, v44);
    double v27 = v15 + v19;
    double v28 = v15 + v21;
    double v29 = v47;
    double v30 = height - v23;
    double v31 = width - v22;
    switch(a4)
    {
      case 0:
        double v32 = v28 + v47;
        double v27 = v31 * 0.5;
        goto LABEL_12;
      case 1:
        double v32 = v30 - v28;
        double v27 = v31 * 0.5;
        goto LABEL_14;
      case 2:
        double v32 = v28 + v47;
        double v27 = v31 - v27;
        goto LABEL_12;
      case 3:
        double v32 = v30 - v28;
        double v27 = v31 - v27;
        goto LABEL_14;
      case 4:
        double v32 = v28 + v47;
LABEL_12:
        v35 = (id *)MEMORY[0x263F57850];
        goto LABEL_15;
      case 5:
        double v32 = v30 - v28;
LABEL_14:
        v35 = (id *)MEMORY[0x263F57820];
LABEL_15:
        id v34 = *v35;
        break;
      default:
        id v34 = 0;
        double v27 = 0.0;
        double v32 = 0.0;
        break;
    }
    v36 = (void *)MEMORY[0x263F57998];
    v37 = objc_msgSend_device(self, v24, v25, v26, v31, v28, v29, v30);
    v39 = objc_msgSend_layoutRuleForDevice_withReferenceFrame_horizontalLayout_verticalLayout_keylinePadding_clip_(v36, v38, (uint64_t)v37, 3, 3, 1, v27, v32, v22, v23, v15, v15, v15, v15);

    v42 = objc_msgSend_complicationLayoutforSlot_(v13, v40, (uint64_t)v34, v41);
    objc_msgSend_setDefaultLayoutRule_forState_(v42, v43, (uint64_t)v39, a6);
  }
  else
  {
    v33 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_246C2A158(v33);
    }
  }
}

- (CGSize)_edgeGapForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      id v4 = objc_msgSend_device(self, a2, 1, v3);
      sub_246B61630(v4, &v9);
      double v5 = v11;
      double v6 = v12;
    }
    else
    {
      id v4 = objc_msgSend_device(self, a2, a3, v3);
      sub_246B61630(v4, &v9);
      double v5 = *((double *)&v9 + 1);
      double v6 = v10;
    }
  }
  else
  {
    id v4 = objc_msgSend_device(self, a2, a3, v3);
    sub_246B61630(v4, &v9);
    double v5 = v13;
    double v6 = v14;
  }

  double v7 = v5;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (double)_keylinePaddingForState:(int64_t)a3
{
  double v3 = 0.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    NTKKeylineWidth();
    double v6 = v5;
    double v10 = objc_msgSend_device(self, v7, v8, v9);
    sub_246B61630(v10, v12);
    double v3 = v6 + v12[0];
  }
  return v3;
}

- (void)_setPlacementforComplicationView:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  int64_t alignment = self->_alignment;
  if (alignment == 2) {
    objc_msgSend_setPlacement_(v4, v5, 2, v6);
  }
  else {
    objc_msgSend_setPlacement_(v4, v5, 8 * (alignment == 1), v6);
  }
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)transitionFadeOutRange
{
  double v2 = 0.0;
  double v3 = 0.5;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)transitionFadeInRange
{
  double v2 = 0.5;
  double v3 = 1.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)transitioningFromLayout:(id)a3 toLayout:(id)a4 progress:(double)a5
{
  id v20 = a3;
  id v8 = a4;
  if (a5 >= 0.5) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v20;
  }
  id v10 = v9;
  uint64_t v14 = objc_msgSend__complicationAlignment(v10, v11, v12, v13);
  if (v14 != objc_msgSend_alignment(self, v15, v16, v17)) {
    objc_msgSend__applyAlignmentFromLayout_(self, v18, (uint64_t)v10, v19);
  }
}

- (void)_applyAlignmentFromLayout:(id)a3
{
  uint64_t v5 = objc_msgSend__complicationAlignment(a3, a2, (uint64_t)a3, v3);
  objc_msgSend_setAlignment_(self, v6, v5, v7);
  objc_msgSend_faceView(self, v8, v9, v10);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invalidateComplicationViews(v14, v11, v12, v13);
}

+ (int64_t)parmesanSlotForSlot:(id)a3 alignment:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x263F57850];
  char isEqualToString = objc_msgSend_isEqualToString_(v5, v7, *MEMORY[0x263F57850], v8);
  if (a4 || (isEqualToString & 1) == 0)
  {
    uint64_t v13 = *MEMORY[0x263F57820];
    char v14 = objc_msgSend_isEqualToString_(v5, v10, *MEMORY[0x263F57820], v11);
    if (a4 || (v14 & 1) == 0)
    {
      char v17 = objc_msgSend_isEqualToString_(v5, v15, v6, v16);
      if (a4 == 1 && (v17 & 1) != 0)
      {
        int64_t v12 = 2;
      }
      else
      {
        char v20 = objc_msgSend_isEqualToString_(v5, v18, v13, v19);
        if (a4 == 1 && (v20 & 1) != 0)
        {
          int64_t v12 = 3;
        }
        else
        {
          char v23 = objc_msgSend_isEqualToString_(v5, v21, v6, v22);
          if (a4 == 2 && (v23 & 1) != 0)
          {
            int64_t v12 = 4;
          }
          else if (((a4 == 2) & objc_msgSend_isEqualToString_(v5, v24, v13, v25)) != 0)
          {
            int64_t v12 = 5;
          }
          else
          {
            int64_t v12 = 0;
          }
        }
      }
    }
    else
    {
      int64_t v12 = 1;
    }
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_int64_t alignment = a3;
}

- (NTKFaceView)faceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);

  return (NTKFaceView *)WeakRetained;
}

- (void)setFaceView:(id)a3
{
}

- (NSArray)supportedComplicationSlots
{
  return self->_supportedComplicationSlots;
}

- (void)setSupportedComplicationSlots:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedComplicationSlots, 0);
  objc_destroyWeak((id *)&self->_faceView);

  objc_storeStrong((id *)&self->_device, 0);
}

@end