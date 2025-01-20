@interface CompassBaseRichCircularDialView
- (id)_gossamer_newNeedleView;
- (id)_needleNorthImageName;
- (id)_needleShadowImageName;
- (id)_needleSouthImageName;
- (id)_newNeedleAODView;
- (id)_newNeedleView;
- (id)_newTicksView;
- (id)_pregossamer_newNeedleView;
- (id)_ticksImageName;
- (id)directionRedactionLabel;
- (id)headingRedactionLabel;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (id)monochromeAccentViews;
- (id)monochromeOtherViews;
- (int64_t)_supportedFamily;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
@end

@implementation CompassBaseRichCircularDialView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v5 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CompassBaseRichCircularDialView;
  v6 = [(CompassRichDialView *)&v46 initFullColorImageViewWithDevice:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(v6 + 57, a3);
    uint64_t v45 = 0;
    long long v43 = 0u;
    long long v44 = 0u;
    id v8 = v7[57];
    uint64_t v12 = objc_msgSend__supportedFamily(v7, v9, v10, v11);
    sub_2375A0158(v8, v12, (uint64_t)&v43);
    v13 = (void *)v44;
    v16 = objc_msgSend_systemFontOfSize_weight_design_(MEMORY[0x263EFD198], v14, v44, v15, v43);
    uint64_t v17 = objc_opt_new();
    id v18 = v7[58];
    v7[58] = (id)v17;

    v19 = NanoCompassAppTintColor();
    objc_msgSend_setTextColor_(v7[58], v20, (uint64_t)v19, v21);

    objc_msgSend_setFont_(v7[58], v22, (uint64_t)v16, v23);
    objc_msgSend_setTextAlignment_(v7[58], v24, 1, v25);
    objc_msgSend_addSubview_(v7, v26, (uint64_t)v7[58], v27);
    uint64_t v28 = objc_opt_new();
    id v29 = v7[59];
    v7[59] = (id)v28;

    v33 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v30, v31, v32);
    objc_msgSend_setTextColor_(v7[59], v34, (uint64_t)v33, v35);

    objc_msgSend_setFont_(v7[59], v36, (uint64_t)v16, v37);
    objc_msgSend_setTextAlignment_(v7[59], v38, 1, v39);
    objc_msgSend_addSubview_(v7, v40, (uint64_t)v7[59], v41);
  }
  return v7;
}

- (id)_newTicksView
{
  id v5 = objc_msgSend__ticksImageName(self, a2, v2, v3);
  v6 = NanoCompassComplicationImageNamed(v5);

  id v7 = objc_alloc(MEMORY[0x263F1C6D0]);
  uint64_t v10 = (UIImageView *)objc_msgSend_initWithImage_(v7, v8, (uint64_t)v6, v9);
  ticks = self->_ticks;
  self->_ticks = v10;

  uint64_t v12 = self->_ticks;
  return v12;
}

- (id)_newNeedleView
{
  if (objc_msgSend_supportsGossamer(self, a2, v2, v3)) {
    objc_msgSend__gossamer_newNeedleView(self, v5, v6, v7);
  }
  else {
    objc_msgSend__pregossamer_newNeedleView(self, v5, v6, v7);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_newNeedleAODView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  objc_msgSend_bounds(self, v4, v5, v6);

  return (id)objc_msgSend_initWithFrame_(v3, v7, v8, v9);
}

- (id)_gossamer_newNeedleView
{
  uint64_t v5 = objc_msgSend__needleNorthImageName(self, a2, v2, v3);
  uint64_t v6 = NanoCompassComplicationImageNamed(v5);

  uint64_t v7 = NanoCompassAppTintColor();
  uint64_t v10 = objc_msgSend_imageWithTintColor_(v6, v8, (uint64_t)v7, v9);

  id v11 = objc_alloc(MEMORY[0x263F1C6D0]);
  v14 = (UIImageView *)objc_msgSend_initWithImage_(v11, v12, (uint64_t)v10, v13);
  north = self->_north;
  self->_north = v14;

  v19 = objc_msgSend__ticksImageName(self, v16, v17, v18);
  v20 = NanoCompassComplicationImageNamed(v19);

  objc_msgSend_size(v20, v21, v22, v23);
  double v25 = v24;
  double v27 = v26;
  double v28 = *MEMORY[0x263F00148];
  double v29 = *(double *)(MEMORY[0x263F00148] + 8);
  id v30 = objc_alloc(MEMORY[0x263F1CB60]);
  v34 = objc_msgSend_initWithFrame_(v30, v31, v32, v33, v28, v29, v25, v27);
  objc_msgSend_addSubview_(v34, v35, (uint64_t)self->_north, v36);

  return v34;
}

- (id)_pregossamer_newNeedleView
{
  uint64_t v5 = objc_msgSend__needleNorthImageName(self, a2, v2, v3);
  uint64_t v6 = NanoCompassComplicationImageNamed(v5);

  id v7 = objc_alloc(MEMORY[0x263F1C6D0]);
  uint64_t v10 = (UIImageView *)objc_msgSend_initWithImage_(v7, v8, (uint64_t)v6, v9);
  north = self->_north;
  self->_north = v10;

  uint64_t v15 = objc_msgSend__needleSouthImageName(self, v12, v13, v14);
  v16 = NanoCompassComplicationImageNamed(v15);

  id v17 = objc_alloc(MEMORY[0x263F1C6D0]);
  v20 = (UIImageView *)objc_msgSend_initWithImage_(v17, v18, (uint64_t)v16, v19);
  south = self->_south;
  self->_south = v20;

  double v25 = objc_msgSend__needleShadowImageName(self, v22, v23, v24);
  double v26 = NanoCompassComplicationImageNamed(v25);

  id v27 = objc_alloc(MEMORY[0x263F1C6D0]);
  id v30 = objc_msgSend_initWithImage_(v27, v28, (uint64_t)v26, v29);
  objc_msgSend_bounds(v30, v31, v32, v33);
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  id v42 = objc_alloc(MEMORY[0x263F1CB60]);
  objc_super v46 = objc_msgSend_initWithFrame_(v42, v43, v44, v45, v35, v37, v39, v41);
  objc_msgSend_addSubview_(v46, v47, (uint64_t)v30, v48);
  objc_msgSend_addSubview_(v46, v49, (uint64_t)self->_south, v50);
  objc_msgSend_addSubview_(v46, v51, (uint64_t)self->_north, v52);

  return v46;
}

- (id)monochromeAccentViews
{
  v5[2] = *MEMORY[0x263EF8340];
  headingLabel = self->_headingLabel;
  v5[0] = self->_north;
  v5[1] = headingLabel;
  uint64_t v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v5, 2);

  return v3;
}

- (id)monochromeOtherViews
{
  v9[2] = *MEMORY[0x263EF8340];
  if (objc_msgSend_supportsGossamer(self, a2, v2, v3)) {
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, (uint64_t)v9, 2, v8, self->_ticks, self->_directionLabel);
  }
  else {
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, (uint64_t)&v8, 1, self->_south, v9[0], v9[1]);
  }

  return v6;
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)CompassBaseRichCircularDialView;
  [(CompassRichDialView *)&v57 configureWithImageProvider:v6 reason:a4];
  uint64_t v10 = objc_msgSend_metadata(v6, v7, v8, v9);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"heading", v12);

  id v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v15, v16);
  int isEqual = objc_msgSend_isEqual_(v13, v18, (uint64_t)v17, v19);

  if (isEqual)
  {

    uint64_t v13 = 0;
  }
  uint64_t v24 = objc_msgSend_metadata(v6, v21, v22, v23);
  id v27 = objc_msgSend_objectForKeyedSubscript_(v24, v25, @"nodata", v26);
  int v31 = objc_msgSend_BOOLValue(v27, v28, v29, v30);

  if (v13) {
    BOOL v35 = v31 == 0;
  }
  else {
    BOOL v35 = 0;
  }
  if (v35)
  {
    id v42 = NanoCompassFormattedHeading(v13, 0, 0);
    objc_msgSend_setText_(self->_headingLabel, v43, (uint64_t)v42, v44);

    NanoCompassFormattedHeadingDirection(v13);
  }
  else
  {
    double v36 = objc_msgSend_headingRedactionLabel(self, v32, v33, v34);
    objc_msgSend_setText_(self->_headingLabel, v37, (uint64_t)v36, v38);

    objc_msgSend_directionRedactionLabel(self, v39, v40, v41);
  uint64_t v45 = };
  objc_msgSend_setText_(self->_directionLabel, v46, (uint64_t)v45, v47);

  objc_msgSend_sizeToFit(self->_headingLabel, v48, v49, v50);
  objc_msgSend_sizeToFit(self->_directionLabel, v51, v52, v53);
  objc_msgSend_setNeedsLayout(self, v54, v55, v56);
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)CompassBaseRichCircularDialView;
  [(CompassRichDialView *)&v32 layoutSubviews];
  objc_msgSend_bounds(self, v3, v4, v5);
  uint64_t v31 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  device = self->_device;
  uint64_t v10 = objc_msgSend__supportedFamily(self, v7, v8, v9, 0, 0);
  sub_2375A0158(device, v10, (uint64_t)&v29);
  objc_msgSend_frame(self->_headingLabel, v11, v12, v13);
  objc_msgSend__lastLineBaseline(self->_headingLabel, v14, v15, v16);
  CLKRectCenteredXInRectForDevice();
  objc_msgSend_setFrame_(self->_headingLabel, v17, v18, v19);
  objc_msgSend_frame(self->_directionLabel, v20, v21, v22);
  objc_msgSend__lastLineBaseline(self->_directionLabel, v23, v24, v25);
  CLKRectCenteredXInRectForDevice();
  objc_msgSend_setFrame_(self->_directionLabel, v26, v27, v28);
}

- (id)headingRedactionLabel
{
  if (qword_2689211D8 != -1) {
    dispatch_once(&qword_2689211D8, &unk_26EA48CA0);
  }
  uint64_t v2 = (void *)qword_2689211D0;

  return v2;
}

- (id)directionRedactionLabel
{
  if (qword_2689211E8 != -1) {
    dispatch_once(&qword_2689211E8, &unk_26EA48CC0);
  }
  uint64_t v2 = (void *)qword_2689211E0;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_south, 0);
  objc_storeStrong((id *)&self->_north, 0);
  objc_storeStrong((id *)&self->_ticks, 0);
  objc_storeStrong((id *)&self->_directionLabel, 0);
  objc_storeStrong((id *)&self->_headingLabel, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (int64_t)_supportedFamily
{
  return 10;
}

- (id)_ticksImageName
{
  return 0;
}

- (id)_needleNorthImageName
{
  return 0;
}

- (id)_needleSouthImageName
{
  return 0;
}

- (id)_needleShadowImageName
{
  return 0;
}

@end