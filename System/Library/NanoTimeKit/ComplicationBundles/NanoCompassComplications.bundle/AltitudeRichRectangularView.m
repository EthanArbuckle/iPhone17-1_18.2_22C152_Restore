@interface AltitudeRichRectangularView
- (RectLayoutConstants)_layoutConstantsForDevice:(id)a3;
- (id)_altitudeLabel;
- (id)_constraints;
- (id)_createVerticalStackViewWithLabels:(id)a3;
- (id)_headlineLabel;
- (id)contentFont;
- (id)headlineFont;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (id)monochromeAccentViews;
- (id)monochromeOtherViews;
- (id)redactionLabel;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
@end

@implementation AltitudeRichRectangularView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  v52[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)AltitudeRichRectangularView;
  id v5 = [(NanoCompassBaseRichView *)&v51 initFullColorImageViewWithDevice:v4];
  id v8 = v5;
  if (v5)
  {
    objc_msgSend_setClipsToBounds_(v5, v6, 1, v7);
    objc_msgSend__layoutConstantsForDevice_(v8, v9, (uint64_t)v4, v10);
    *((void *)v8 + 58) = v11;
    *((void *)v8 + 59) = v12;
    *((void *)v8 + 60) = v13;
    id v14 = objc_alloc_init(MEMORY[0x263F1C778]);
    v15 = (void *)*((void *)v8 + 61);
    *((void *)v8 + 61) = v14;

    objc_msgSend_addLayoutGuide_(v8, v16, *((void *)v8 + 61), v17);
    objc_msgSend_screenBounds(v4, v18, v19, v20);
    float v22 = v21 * 0.042;
    *((double *)v8 + 57) = ceilf(v22);
    uint64_t v26 = objc_msgSend__headlineLabel(v8, v23, v24, v25);
    v27 = (void *)*((void *)v8 + 55);
    *((void *)v8 + 55) = v26;

    uint64_t v31 = objc_msgSend__altitudeLabel(v8, v28, v29, v30);
    v32 = (void *)*((void *)v8 + 54);
    *((void *)v8 + 54) = v31;

    v52[0] = *((void *)v8 + 55);
    v52[1] = *((void *)v8 + 54);
    v34 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v33, (uint64_t)v52, 2);
    uint64_t v37 = objc_msgSend__createVerticalStackViewWithLabels_(v8, v35, (uint64_t)v34, v36);
    v38 = (void *)*((void *)v8 + 56);
    *((void *)v8 + 56) = v37;

    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(*((void **)v8 + 56), v39, 0, v40);
    objc_msgSend_addSubview_(v8, v41, *((void *)v8 + 56), v42);
    v43 = (void *)MEMORY[0x263F08938];
    v47 = objc_msgSend__constraints(v8, v44, v45, v46);
    objc_msgSend_activateConstraints_(v43, v48, (uint64_t)v47, v49);
  }
  return v8;
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v49.receiver = self;
  v49.super_class = (Class)AltitudeRichRectangularView;
  [(NanoCompassBaseRichView *)&v49 configureWithImageProvider:v6 reason:a4];
  uint64_t v10 = objc_msgSend_metadata(v6, v7, v8, v9);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"altitude", v12);

  uint64_t v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v15, v16);
  int isEqual = objc_msgSend_isEqual_(v13, v18, (uint64_t)v17, v19);

  if (isEqual)
  {

    uint64_t v13 = 0;
  }
  uint64_t v24 = objc_msgSend_metadata(v6, v21, v22, v23);
  v27 = objc_msgSend_objectForKeyedSubscript_(v24, v25, @"nodata", v26);
  int v31 = objc_msgSend_BOOLValue(v27, v28, v29, v30);

  if (v31)
  {
    v35 = objc_msgSend_redactionLabel(self, v32, v33, v34);
    objc_msgSend_setText_(self->_altitudeLabel, v36, (uint64_t)v35, v37);
  }
  else
  {
    if (v13)
    {
      v38 = NSNumber;
      objc_msgSend_altitude(v13, v32, v33, v34);
      v35 = objc_msgSend_numberWithDouble_(v38, v39, v40, v41);
      char v45 = objc_msgSend_displayTilde(v13, v42, v43, v44);
    }
    else
    {
      v35 = 0;
      char v45 = 0;
    }
    uint64_t v46 = NanoCompassValueAndUnit(v35, 0, v45, 0);
    objc_msgSend_setText_(self->_altitudeLabel, v47, (uint64_t)v46, v48);
  }
}

- (id)monochromeAccentViews
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self->_headline;
  v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 1);

  return v2;
}

- (id)monochromeOtherViews
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self->_altitudeLabel;
  v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 1);

  return v2;
}

- (RectLayoutConstants)_layoutConstantsForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268921310);
  id WeakRetained = objc_loadWeakRetained(&qword_268921318);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_268921318);
  if (v6 != v3)
  {

LABEL_5:
    id v12 = objc_storeWeak(&qword_268921318, v3);
    qword_268921320 = objc_msgSend_version(v3, v13, v14, v15);

    sub_2375BCA84(v16, v3);
    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend_version(v3, v7, v8, v9);
  uint64_t v11 = qword_268921320;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268921310);
  uint64_t v17 = qword_2689212F8;
  uint64_t v18 = qword_268921300;
  uint64_t v19 = qword_268921308;

  double v20 = *(double *)&v17;
  double v21 = *(double *)&v18;
  double v22 = *(double *)&v19;
  result.valueFontSize = v22;
  result.symbolSize = v21;
  result.headlineSize = v20;
  return result;
}

- (id)_altitudeLabel
{
  id v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v4, v5, v6);
  objc_msgSend_setTextColor_(v3, v8, (uint64_t)v7, v9);

  uint64_t v13 = objc_msgSend_contentFont(self, v10, v11, v12);
  objc_msgSend_setFont_(v3, v14, (uint64_t)v13, v15);

  return v3;
}

- (id)_headlineLabel
{
  id v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_headlineFont(self, v4, v5, v6);
  objc_msgSend_setFont_(v3, v8, (uint64_t)v7, v9);

  uint64_t v10 = NanoCompassAppTintColor();
  objc_msgSend_setTextColor_(v3, v11, (uint64_t)v10, v12);

  id v13 = objc_alloc_init(MEMORY[0x263F81678]);
  uint64_t v17 = objc_msgSend_configurationWithPointSize_(MEMORY[0x263F1C6C8], v14, v15, v16, self->_layoutConstants.symbolSize);
  uint64_t v19 = objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x263F1C6B0], v18, @"mountain.2.fill", (uint64_t)v17);
  double v20 = NanoCompassAppTintColor();
  double v22 = objc_msgSend_imageWithTintColor_renderingMode_(v19, v21, (uint64_t)v20, 1);
  objc_msgSend_setImage_(v13, v23, (uint64_t)v22, v24);

  v27 = objc_msgSend_attributedStringWithAttachment_(MEMORY[0x263F086A0], v25, (uint64_t)v13, v26);
  id v28 = objc_alloc(MEMORY[0x263F089B8]);
  int v31 = objc_msgSend_initWithAttributedString_(v28, v29, (uint64_t)v27, v30);
  v32 = NanoCompassLocalizedString(@"ALTITUDE_ELEVATION_TEXT");
  id v33 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v36 = objc_msgSend_initWithString_(v33, v34, (uint64_t)v32, v35);
  objc_msgSend_appendAttributedString_(v31, v37, (uint64_t)v36, v38);
  objc_msgSend_setAttributedText_(v3, v39, (uint64_t)v31, v40);

  return v3;
}

- (id)_createVerticalStackViewWithLabels:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F1C9B8];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v8 = objc_msgSend_initWithArrangedSubviews_(v5, v6, (uint64_t)v4, v7);

  objc_msgSend_setAlignment_(v8, v9, 1, v10);
  objc_msgSend_setAxis_(v8, v11, 1, v12);
  objc_msgSend_systemLayoutSizeFittingSize_(v8, v13, v14, v15, *MEMORY[0x263F1D490], *(double *)(MEMORY[0x263F1D490] + 8));
  objc_msgSend_setFrame_(v8, v16, v17, v18, 0.0, 0.0, v19, v20);

  return v8;
}

- (id)_constraints
{
  v71[6] = *MEMORY[0x263EF8340];
  v70 = objc_msgSend_leadingAnchor(self->_layoutGuide, a2, v2, v3);
  v69 = objc_msgSend_leadingAnchor(self, v5, v6, v7);
  v68 = objc_msgSend_constraintEqualToAnchor_constant_(v70, v8, (uint64_t)v69, v9, self->_leadingMargin);
  v71[0] = v68;
  v67 = objc_msgSend_trailingAnchor(self->_layoutGuide, v10, v11, v12);
  v66 = objc_msgSend_trailingAnchor(self, v13, v14, v15);
  v65 = objc_msgSend_constraintEqualToAnchor_(v67, v16, (uint64_t)v66, v17);
  v71[1] = v65;
  v64 = objc_msgSend_topAnchor(self->_layoutGuide, v18, v19, v20);
  v63 = objc_msgSend_topAnchor(self, v21, v22, v23);
  uint64_t v26 = objc_msgSend_constraintEqualToAnchor_(v64, v24, (uint64_t)v63, v25);
  v71[2] = v26;
  uint64_t v30 = objc_msgSend_bottomAnchor(self->_layoutGuide, v27, v28, v29);
  uint64_t v34 = objc_msgSend_bottomAnchor(self, v31, v32, v33);
  uint64_t v37 = objc_msgSend_constraintEqualToAnchor_(v30, v35, (uint64_t)v34, v36);
  v71[3] = v37;
  uint64_t v41 = objc_msgSend_centerYAnchor(self->_content, v38, v39, v40);
  char v45 = objc_msgSend_centerYAnchor(self->_layoutGuide, v42, v43, v44);
  uint64_t v48 = objc_msgSend_constraintEqualToAnchor_(v41, v46, (uint64_t)v45, v47);
  v71[4] = v48;
  v52 = objc_msgSend_leadingAnchor(self->_content, v49, v50, v51);
  v56 = objc_msgSend_leadingAnchor(self->_layoutGuide, v53, v54, v55);
  v59 = objc_msgSend_constraintEqualToAnchor_(v52, v57, (uint64_t)v56, v58);
  v71[5] = v59;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v60, (uint64_t)v71, 6);
  id v62 = (id)objc_claimAutoreleasedReturnValue();

  return v62;
}

- (id)headlineFont
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375BC750;
  block[3] = &unk_264CD5570;
  block[4] = self;
  if (qword_2689212C8 != -1) {
    dispatch_once(&qword_2689212C8, block);
  }
  return (id)qword_2689212B8;
}

- (id)contentFont
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375BC874;
  block[3] = &unk_264CD5570;
  block[4] = self;
  if (qword_2689212E0 != -1) {
    dispatch_once(&qword_2689212E0, block);
  }
  return (id)qword_2689212D0;
}

- (id)redactionLabel
{
  if (qword_2689212F0 != -1) {
    dispatch_once(&qword_2689212F0, &unk_26EA48D60);
  }
  uint64_t v2 = (void *)qword_2689212E8;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_headline, 0);

  objc_storeStrong((id *)&self->_altitudeLabel, 0);
}

@end