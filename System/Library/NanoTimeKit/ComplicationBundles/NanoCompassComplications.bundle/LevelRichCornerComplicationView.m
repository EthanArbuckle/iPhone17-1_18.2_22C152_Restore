@interface LevelRichCornerComplicationView
- (double)_maxBubbleDeflection;
- (id)_fixedBubbleImageName;
- (id)_floatingBubbleImageName;
- (id)_newFixedBubbleView;
- (id)_newFixedOverlayView;
- (id)_newFloatingBubbleView;
- (id)_overlayImageName;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (id)monochromeAccentViews;
- (id)monochromeOtherViews;
- (int64_t)_supportedFamily;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
@end

@implementation LevelRichCornerComplicationView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)LevelRichCornerComplicationView;
  v6 = [(LevelRichComplicationView *)&v25 initFullColorImageViewWithDevice:v5];
  v7 = (uint64_t *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 59, a3);
    v8 = NanoCompassComplicationImageNamed(@"levelCorner-RingBorderBright");
    id v9 = objc_alloc(MEMORY[0x263F1C6D0]);
    uint64_t v12 = objc_msgSend_initWithImage_(v9, v10, (uint64_t)v8, v11);
    v13 = (void *)v7[61];
    v7[61] = v12;

    objc_msgSend_addSubview_(v7, v14, v7[61], v15);
    v16 = NanoCompassComplicationImageNamed(@"levelCorner-RingBorderMuted");
    id v17 = objc_alloc(MEMORY[0x263F1C6D0]);
    uint64_t v20 = objc_msgSend_initWithImage_(v17, v18, (uint64_t)v16, v19);
    v21 = (void *)v7[62];
    v7[62] = v20;

    objc_msgSend_addSubview_(v7, v22, v7[62], v23);
  }

  return v7;
}

- (id)_newFixedOverlayView
{
  id v5 = objc_msgSend__overlayImageName(self, a2, v2, v3);
  v6 = NanoCompassComplicationImageNamed(v5);

  id v7 = objc_alloc(MEMORY[0x263F1C6D0]);
  v10 = (UIImageView *)objc_msgSend_initWithImage_(v7, v8, (uint64_t)v6, v9);
  overlayCross = self->_overlayCross;
  self->_overlayCross = v10;

  uint64_t v12 = self->_overlayCross;
  return v12;
}

- (id)_newFixedBubbleView
{
  id v5 = objc_msgSend__fixedBubbleImageName(self, a2, v2, v3);
  v6 = NanoCompassComplicationImageNamed(v5);

  id v7 = objc_alloc(MEMORY[0x263F1C6D0]);
  v10 = (UIImageView *)objc_msgSend_initWithImage_(v7, v8, (uint64_t)v6, v9);
  centeredBubbleView = self->_centeredBubbleView;
  self->_centeredBubbleView = v10;

  uint64_t v12 = self->_centeredBubbleView;
  return v12;
}

- (id)_newFloatingBubbleView
{
  id v5 = objc_msgSend__floatingBubbleImageName(self, a2, v2, v3);
  v6 = NanoCompassComplicationImageNamed(v5);

  id v7 = objc_alloc(MEMORY[0x263F1C6D0]);
  v10 = (UIImageView *)objc_msgSend_initWithImage_(v7, v8, (uint64_t)v6, v9);
  floatingBubbleView = self->_floatingBubbleView;
  self->_floatingBubbleView = v10;

  uint64_t v12 = self->_floatingBubbleView;
  return v12;
}

- (double)_maxBubbleDeflection
{
  device = self->_device;
  uint64_t v5 = objc_msgSend__supportedFamily(self, a2, v2, v3);
  v6 = device;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268920EF8);
  id WeakRetained = objc_loadWeakRetained(&qword_268920F00);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    uint64_t v9 = (CLKDevice *)objc_loadWeakRetained(&qword_268920F00);
    if (v9 == v6)
    {
      uint64_t v13 = objc_msgSend_version(v6, v10, v11, v12);
      uint64_t v14 = qword_268920F08;

      if (v13 == v14) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v15 = objc_storeWeak(&qword_268920F00, v6);
  qword_268920F08 = objc_msgSend_version(v6, v16, v17, v18);

  sub_2375AC464(v19, (const char *)v6);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268920EF8);
  if (v5 != 8)
  {
    uint64_t v20 = NCLogForCategory(1uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_2375D7FFC(v5, v20);
    }
  }
  double v21 = *(double *)&qword_268920EF0;

  return v21;
}

- (id)monochromeAccentViews
{
  v6[4] = *MEMORY[0x263EF8340];
  floatingBubbleView = self->_floatingBubbleView;
  v6[0] = self->_centeredBubbleView;
  v6[1] = floatingBubbleView;
  mutedRingView = self->_mutedRingView;
  v6[2] = self->_brightRingView;
  v6[3] = mutedRingView;
  v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v6, 4);

  return v4;
}

- (id)monochromeOtherViews
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self->_overlayCross;
  uint64_t v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 1);

  return v2;
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)LevelRichCornerComplicationView;
  [(LevelRichComplicationView *)&v37 configureWithImageProvider:v6 reason:a4];
  v10 = objc_msgSend_metadata(v6, v7, v8, v9);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"incline", v12);

  uint64_t v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v15, v16);
  int isEqual = objc_msgSend_isEqual_(v13, v18, (uint64_t)v17, v19);

  if (isEqual)
  {

    uint64_t v13 = 0;
  }
  v24 = objc_msgSend_metadata(v6, v21, v22, v23);
  v27 = objc_msgSend_objectForKeyedSubscript_(v24, v25, @"nodata", v26);
  char v31 = objc_msgSend_BOOLValue(v27, v28, v29, v30);

  BOOL v32 = NanoCompassLevelComplicationConsideredLevel(v13, v31);
  objc_msgSend_setHidden_(self->_brightRingView, v33, v32, v34);
  objc_msgSend_setHidden_(self->_mutedRingView, v35, v32 ^ 1, v36);
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)LevelRichCornerComplicationView;
  [(LevelRichComplicationView *)&v15 layoutSubviews];
  objc_msgSend_center(self, v3, v4, v5);
  objc_msgSend_setCenter_(self->_brightRingView, v6, v7, v8);
  objc_msgSend_center(self, v9, v10, v11);
  objc_msgSend_setCenter_(self->_mutedRingView, v12, v13, v14);
}

- (int64_t)_supportedFamily
{
  return 8;
}

- (id)_overlayImageName
{
  return @"levelCorner-Cross";
}

- (id)_fixedBubbleImageName
{
  return @"levelCorner-CircleBright";
}

- (id)_floatingBubbleImageName
{
  return @"levelCorner-CircleMuted";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingBubbleView, 0);
  objc_storeStrong((id *)&self->_centeredBubbleView, 0);
  objc_storeStrong((id *)&self->_mutedRingView, 0);
  objc_storeStrong((id *)&self->_brightRingView, 0);
  objc_storeStrong((id *)&self->_overlayCross, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end