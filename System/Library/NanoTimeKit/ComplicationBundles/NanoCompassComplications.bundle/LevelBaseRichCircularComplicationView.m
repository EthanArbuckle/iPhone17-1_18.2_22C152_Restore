@interface LevelBaseRichCircularComplicationView
- (double)_maxBubbleDeflection;
- (id)_curvedLabelViewForLocStringKey:(id)a3 font:(id)a4 textColor:(id)a5 centerAngle:(double)a6;
- (id)_fixedBubbleImageName;
- (id)_floatingBubbleImageName;
- (id)_newFixedBubbleView;
- (id)_newFixedOverlayView;
- (id)_newFloatingBubbleView;
- (id)_overlayImageName;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (id)monochromeAccentViews;
- (id)monochromeOtherViews;
- (id)ticksView;
- (int64_t)_supportedFamily;
- (void)_createDialLabels;
- (void)_hideDialLabels:(BOOL)a3;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
@end

@implementation LevelBaseRichCircularComplicationView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)LevelBaseRichCircularComplicationView;
  v6 = [(LevelRichComplicationView *)&v36 initFullColorImageViewWithDevice:v5];
  v7 = (uint64_t *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 59, a3);
    v11 = objc_msgSend_ticksView(v7, v8, v9, v10);
    objc_msgSend_addSubview_(v7, v12, (uint64_t)v11, v13);

    v17 = objc_msgSend_ticksView(v7, v14, v15, v16);
    objc_msgSend_sendSubviewToBack_(v7, v18, (uint64_t)v17, v19);

    id v20 = objc_alloc(MEMORY[0x263F1CB60]);
    v24 = objc_msgSend_ticksView(v7, v21, v22, v23);
    objc_msgSend_frame(v24, v25, v26, v27);
    uint64_t v31 = objc_msgSend_initWithFrame_(v20, v28, v29, v30);
    v32 = (void *)v7[61];
    v7[61] = v31;

    objc_msgSend_addSubview_(v7, v33, v7[61], v34);
  }

  return v7;
}

- (id)_curvedLabelViewForLocStringKey:(id)a3 font:(id)a4 textColor:(id)a5 centerAngle:(double)a6
{
  v45[1] = *MEMORY[0x263EF8340];
  device = self->_device;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v17 = objc_msgSend__supportedFamily(self, v14, v15, v16);
  double v18 = sub_2375A02B4(device, v17);
  id v19 = objc_alloc_init(MEMORY[0x263F32130]);
  objc_msgSend_setTextColor_(v19, v20, (uint64_t)v11, v21);

  id v22 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v23 = NanoCompassLocalizedString(v13);

  uint64_t v44 = *MEMORY[0x263F814F0];
  v45[0] = v12;
  v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v24, (uint64_t)v45, (uint64_t)&v44, 1);

  uint64_t v27 = objc_msgSend_initWithString_attributes_(v22, v26, (uint64_t)v23, (uint64_t)v25);
  objc_msgSend_setAttributedText_(v19, v28, (uint64_t)v27, v29);

  objc_msgSend_setAttributedTextProvidesColor_(v19, v30, 1, v31);
  objc_msgSend_setCircleRadius_(v19, v32, v33, v34, v18);
  objc_msgSend_setInterior_(v19, v35, 0, v36);
  objc_msgSend_setCenterAngle_(v19, v37, v38, v39, a6);
  objc_msgSend_sizeToFit(v19, v40, v41, v42);

  return v19;
}

- (void)_hideDialLabels:(BOOL)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  curvedLabelViews = self->_curvedLabelViews;
  if (a3)
  {
    if (!curvedLabelViews) {
      return;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = curvedLabelViews;
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v25, (uint64_t)v30, 16);
    if (v7)
    {
      uint64_t v10 = v7;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend_setHidden_(*(void **)(*((void *)&v25 + 1) + 8 * i), v8, 1, v9);
        }
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v25, (uint64_t)v30, 16);
      }
      while (v10);
    }
  }
  else
  {
    if (!curvedLabelViews)
    {
      objc_msgSend__createDialLabels(self, a2, a3, v3);
      curvedLabelViews = self->_curvedLabelViews;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = curvedLabelViews;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v14, (uint64_t)&v21, (uint64_t)v29, 16);
    if (v15)
    {
      uint64_t v18 = v15;
      uint64_t v19 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend_setHidden_(*(void **)(*((void *)&v21 + 1) + 8 * j), v16, 0, v17, (void)v21);
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v16, (uint64_t)&v21, (uint64_t)v29, 16);
      }
      while (v18);
    }
  }
}

- (void)_createDialLabels
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  device = self->_device;
  uint64_t v6 = objc_msgSend__supportedFamily(self, a2, v2, v3);
  sub_2375A02B4(device, v6);
  double v8 = v7;
  double v10 = v9;
  id v11 = objc_alloc(MEMORY[0x263EFF980]);
  v14 = objc_msgSend_initWithCapacity_(v11, v12, 8, v13);
  uint64_t v15 = NanoCompassLocalizedString(@"NW");
  unint64_t v19 = objc_msgSend_length(v15, v16, v17, v18);
  id v20 = (double *)MEMORY[0x263F81840];
  long long v21 = (uint64_t *)MEMORY[0x263EFCF58];
  unint64_t v22 = 0x263F1C000;
  if (v19 <= 2)
  {
    long long v23 = NanoCompassLocalizedString(@"NE");
    if ((unint64_t)objc_msgSend_length(v23, v24, v25, v26) <= 2)
    {
      long long v27 = NanoCompassLocalizedString(@"SW");
      if ((unint64_t)objc_msgSend_length(v27, v28, v29, v30) <= 2)
      {
        uint64_t v31 = NanoCompassLocalizedString(@"SE");
        unint64_t v35 = objc_msgSend_length(v31, v32, v33, v34);

        unint64_t v22 = 0x263F1C000uLL;
        if (v35 > 2) {
          goto LABEL_9;
        }
        uint64_t v15 = objc_msgSend_systemFontOfSize_weight_design_(MEMORY[0x263EFD198], v36, *v21, v37, v8, *v20);
        long long v23 = objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], v38, v39, v40, 1.0, 0.600000024);
        uint64_t v42 = objc_msgSend__curvedLabelViewForLocStringKey_font_textColor_centerAngle_(self, v41, @"NW", (uint64_t)v15, v23, 0.785398163);
        objc_msgSend_addObject_(v14, v43, (uint64_t)v42, v44);

        v46 = objc_msgSend__curvedLabelViewForLocStringKey_font_textColor_centerAngle_(self, v45, @"NE", (uint64_t)v15, v23, -0.785398163);
        objc_msgSend_addObject_(v14, v47, (uint64_t)v46, v48);

        v50 = objc_msgSend__curvedLabelViewForLocStringKey_font_textColor_centerAngle_(self, v49, @"SW", (uint64_t)v15, v23, 2.35619449);
        objc_msgSend_addObject_(v14, v51, (uint64_t)v50, v52);

        long long v27 = objc_msgSend__curvedLabelViewForLocStringKey_font_textColor_centerAngle_(self, v53, @"SE", (uint64_t)v15, v23, -2.35619449);
        objc_msgSend_addObject_(v14, v54, (uint64_t)v27, v55);
      }
    }
  }

LABEL_9:
  v56 = objc_msgSend_systemFontOfSize_weight_design_(MEMORY[0x263EFD198], v36, *v21, v37, v10, *v20);
  v60 = objc_msgSend_whiteColor(*(void **)(v22 + 1360), v57, v58, v59);
  v62 = objc_msgSend__curvedLabelViewForLocStringKey_font_textColor_centerAngle_(self, v61, @"N", (uint64_t)v56, v60, 0.0);
  objc_msgSend_addObject_(v14, v63, (uint64_t)v62, v64);

  v66 = objc_msgSend__curvedLabelViewForLocStringKey_font_textColor_centerAngle_(self, v65, @"S", (uint64_t)v56, v60, 3.14159265);
  objc_msgSend_addObject_(v14, v67, (uint64_t)v66, v68);

  v70 = objc_msgSend__curvedLabelViewForLocStringKey_font_textColor_centerAngle_(self, v69, @"E", (uint64_t)v56, v60, -1.57079633);
  objc_msgSend_addObject_(v14, v71, (uint64_t)v70, v72);

  v74 = objc_msgSend__curvedLabelViewForLocStringKey_font_textColor_centerAngle_(self, v73, @"W", (uint64_t)v56, v60, 1.57079633);
  objc_msgSend_addObject_(v14, v75, (uint64_t)v74, v76);

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v77 = v14;
  uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v77, v78, (uint64_t)&v86, (uint64_t)v90, 16);
  if (v79)
  {
    uint64_t v82 = v79;
    uint64_t v83 = *(void *)v87;
    do
    {
      uint64_t v84 = 0;
      do
      {
        if (*(void *)v87 != v83) {
          objc_enumerationMutation(v77);
        }
        objc_msgSend_addSubview_(self->_curvedLabelsContainerView, v80, *(void *)(*((void *)&v86 + 1) + 8 * v84++), v81, (void)v86);
      }
      while (v82 != v84);
      uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v77, v80, (uint64_t)&v86, (uint64_t)v90, 16);
    }
    while (v82);
  }

  curvedLabelViews = self->_curvedLabelViews;
  self->_curvedLabelViews = v77;
}

- (id)ticksView
{
  ticksView = self->_ticksView;
  if (!ticksView)
  {
    device = self->_device;
    uint64_t v7 = objc_msgSend__supportedFamily(self, a2, v2, v3);
    objc_msgSend_richCircularLevelSubdialForDevice_andComplicationFamily_(AnalogDialView, v8, (uint64_t)device, v7);
    double v9 = (UIView *)objc_claimAutoreleasedReturnValue();
    double v10 = self->_ticksView;
    self->_ticksView = v9;

    ticksView = self->_ticksView;
  }

  return ticksView;
}

- (id)_newFixedOverlayView
{
  id v5 = objc_msgSend__overlayImageName(self, a2, v2, v3);
  uint64_t v6 = NanoCompassComplicationImageNamed(v5);

  id v7 = objc_alloc(MEMORY[0x263F1C6D0]);
  double v10 = (UIImageView *)objc_msgSend_initWithImage_(v7, v8, (uint64_t)v6, v9);
  overlayCrossView = self->_overlayCrossView;
  self->_overlayCrossView = v10;

  id v12 = self->_overlayCrossView;
  return v12;
}

- (id)_newFixedBubbleView
{
  id v5 = objc_msgSend__fixedBubbleImageName(self, a2, v2, v3);
  uint64_t v6 = NanoCompassComplicationImageNamed(v5);

  id v7 = objc_alloc(MEMORY[0x263F1C6D0]);
  double v10 = (UIImageView *)objc_msgSend_initWithImage_(v7, v8, (uint64_t)v6, v9);
  fixedBubbleView = self->_fixedBubbleView;
  self->_fixedBubbleView = v10;

  id v12 = self->_fixedBubbleView;
  return v12;
}

- (id)_newFloatingBubbleView
{
  id v5 = objc_msgSend__floatingBubbleImageName(self, a2, v2, v3);
  uint64_t v6 = NanoCompassComplicationImageNamed(v5);

  id v7 = objc_alloc(MEMORY[0x263F1C6D0]);
  double v10 = (UIImageView *)objc_msgSend_initWithImage_(v7, v8, (uint64_t)v6, v9);
  floatingBubbleView = self->_floatingBubbleView;
  self->_floatingBubbleView = v10;

  id v12 = self->_floatingBubbleView;
  return v12;
}

- (double)_maxBubbleDeflection
{
  device = self->_device;
  uint64_t v5 = objc_msgSend__supportedFamily(self, a2, v2, v3);
  sub_2375A02B4(device, v5);
  return v6;
}

- (id)monochromeAccentViews
{
  v5[3] = *MEMORY[0x263EF8340];
  fixedBubbleView = self->_fixedBubbleView;
  v5[0] = self->_ticksView;
  v5[1] = fixedBubbleView;
  v5[2] = self->_floatingBubbleView;
  uint64_t v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v5, 3);

  return v3;
}

- (id)monochromeOtherViews
{
  v5[2] = *MEMORY[0x263EF8340];
  overlayCrossView = self->_overlayCrossView;
  v5[0] = self->_curvedLabelsContainerView;
  v5[1] = overlayCrossView;
  uint64_t v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v5, 2);

  return v3;
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v67.receiver = self;
  v67.super_class = (Class)LevelBaseRichCircularComplicationView;
  [(LevelRichComplicationView *)&v67 configureWithImageProvider:v6 reason:a4];
  double v10 = objc_msgSend_metadata(v6, v7, v8, v9);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"heading", v12);

  uint64_t v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v15, v16);
  int isEqual = objc_msgSend_isEqual_(v13, v18, (uint64_t)v17, v19);

  if (isEqual)
  {

    uint64_t v13 = 0;
  }
  long long v24 = objc_msgSend_metadata(v6, v21, v22, v23);
  long long v27 = objc_msgSend_objectForKeyedSubscript_(v24, v25, @"nodata", v26);
  int v31 = objc_msgSend_BOOLValue(v27, v28, v29, v30);

  if (v13)
  {
    int isAccurate = objc_msgSend_isAccurate(v13, v32, v33, v34);
    uint64_t v39 = objc_msgSend_metadata(v6, v36, v37, v38);
    uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(v39, v40, @"alwayson", v41);
    unsigned int v46 = objc_msgSend_BOOLValue(v42, v43, v44, v45);

    int v47 = v31 & isAccurate | isAccurate ^ 1;
    objc_msgSend__hideDialLabels_(self, v48, v47 | v46, v49);
    if ((v47 & 1) == 0)
    {
      objc_msgSend_heading(v13, v50, v51, v52);
      double v57 = -v56;
      if (self->_cachedHeading != v57)
      {
        self->_cachedHeading = v57;
        objc_msgSend_setNeedsLayout(self, v53, v54, v55);
      }
    }
  }
  else
  {
    uint64_t v58 = objc_msgSend_metadata(v6, v32, v33, v34);
    v61 = objc_msgSend_objectForKeyedSubscript_(v58, v59, @"alwayson", v60);
    objc_msgSend_BOOLValue(v61, v62, v63, v64);

    objc_msgSend__hideDialLabels_(self, v65, 1, v66);
  }
}

- (void)layoutSubviews
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v55.receiver = self;
  v55.super_class = (Class)LevelBaseRichCircularComplicationView;
  [(LevelRichComplicationView *)&v55 layoutSubviews];
  objc_msgSend_bounds(self, v3, v4, v5);
  double v7 = v6;
  UIRectGetCenter();
  double v9 = v8;
  double v11 = v10;
  objc_msgSend_setCenter_(self->_ticksView, v12, v13, v14);
  objc_msgSend_setCenter_(self->_curvedLabelsContainerView, v15, v16, v17, v9, v11);
  double v18 = self->_cachedHeading * 3.14159265;
  memset(&v54, 0, sizeof(v54));
  CGAffineTransformMakeRotation(&v54, v18 / 180.0);
  CGAffineTransform v53 = v54;
  objc_msgSend_setTransform_(self->_ticksView, v19, (uint64_t)&v53, v20);
  CGAffineTransform v52 = v54;
  objc_msgSend_setTransform_(self->_curvedLabelsContainerView, v21, (uint64_t)&v52, v22);
  if (self->_curvedLabelViews)
  {
    objc_msgSend_bounds(self->_curvedLabelsContainerView, v23, v24, v25);
    double v27 = v26;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v28 = self->_curvedLabelViews;
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v48, (uint64_t)v56, 16);
    if (v30)
    {
      uint64_t v34 = v30;
      double v35 = (v27 - v7) * 0.5;
      uint64_t v36 = *(void *)v49;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v49 != v36) {
            objc_enumerationMutation(v28);
          }
          uint64_t v38 = *(void **)(*((void *)&v48 + 1) + 8 * v37);
          objc_msgSend_frame(v38, v31, v32, v33, 0, 0, (void)v48);
          double v40 = v39;
          double v42 = v41;
          objc_msgSend_getTextCenter_startAngle_endAngle_(v38, v43, (uint64_t)v47, 0, 0);
          objc_msgSend_setFrame_(v38, v44, v45, v46, v35 + v9 - v47[0], v35 + v11 - v47[1], v40, v42);
          ++v37;
        }
        while (v34 != v37);
        uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v48, (uint64_t)v56, 16);
      }
      while (v34);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingBubbleView, 0);
  objc_storeStrong((id *)&self->_fixedBubbleView, 0);
  objc_storeStrong((id *)&self->_overlayCrossView, 0);
  objc_storeStrong((id *)&self->_curvedLabelViews, 0);
  objc_storeStrong((id *)&self->_curvedLabelsContainerView, 0);
  objc_storeStrong((id *)&self->_ticksView, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (int64_t)_supportedFamily
{
  return 10;
}

- (id)_overlayImageName
{
  return 0;
}

- (id)_fixedBubbleImageName
{
  return 0;
}

- (id)_floatingBubbleImageName
{
  return 0;
}

@end