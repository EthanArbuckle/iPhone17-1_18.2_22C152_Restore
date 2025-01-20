@interface AltitudeRichCircularDialView
- (CircularLayoutConstants)_layoutConstantsForDevice:(id)a3;
- (id)_threeLineConstraints;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (id)monochromeAccentViews;
- (id)monochromeOtherViews;
- (id)unitFont;
- (id)valueFont;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
@end

@implementation AltitudeRichCircularDialView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)AltitudeRichCircularDialView;
  id v5 = [(NanoCompassBaseRichView *)&v91 initFullColorImageViewWithDevice:v4];
  id v8 = v5;
  if (v5)
  {
    objc_msgSend_setClipsToBounds_(v5, v6, 1, v7);
    objc_msgSend__layoutConstantsForDevice_(v8, v9, (uint64_t)v4, v10);
    *((void *)v8 + 58) = v11;
    *((void *)v8 + 59) = v12;
    *((void *)v8 + 60) = v13;
    *((void *)v8 + 61) = v14;
    id v15 = objc_alloc_init(MEMORY[0x263F1C778]);
    v16 = (void *)*((void *)v8 + 54);
    *((void *)v8 + 54) = v15;

    objc_msgSend_addLayoutGuide_(v8, v17, *((void *)v8 + 54), v18);
    v22 = objc_msgSend_configurationWithPointSize_(MEMORY[0x263F1C6C8], v19, v20, v21, *((double *)v8 + 59));
    v24 = objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x263F1C6B0], v23, @"mountain.2.fill", (uint64_t)v22);
    v25 = NanoCompassAppTintColor();
    v27 = objc_msgSend_imageWithTintColor_renderingMode_(v24, v26, (uint64_t)v25, 1);

    id v28 = objc_alloc(MEMORY[0x263F1C6D0]);
    uint64_t v31 = objc_msgSend_initWithImage_(v28, v29, (uint64_t)v27, v30);
    v32 = (void *)*((void *)v8 + 55);
    *((void *)v8 + 55) = v31;

    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(*((void **)v8 + 55), v33, 0, v34);
    objc_msgSend_setContentMode_(*((void **)v8 + 55), v35, 1, v36);
    objc_msgSend_addSubview_(v8, v37, *((void *)v8 + 55), v38);
    uint64_t v39 = objc_opt_new();
    v40 = (void *)*((void *)v8 + 56);
    *((void *)v8 + 56) = v39;

    v44 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v41, v42, v43);
    objc_msgSend_setTextColor_(*((void **)v8 + 56), v45, (uint64_t)v44, v46);

    v50 = objc_msgSend_valueFont(v8, v47, v48, v49);
    objc_msgSend_setFont_(*((void **)v8 + 56), v51, (uint64_t)v50, v52);

    objc_msgSend_setTextAlignment_(*((void **)v8 + 56), v53, 1, v54);
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(*((void **)v8 + 56), v55, 0, v56);
    objc_msgSend_addSubview_(v8, v57, *((void *)v8 + 56), v58);
    uint64_t v59 = objc_opt_new();
    v60 = (void *)*((void *)v8 + 57);
    *((void *)v8 + 57) = v59;

    v64 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v61, v62, v63);
    v68 = objc_msgSend_colorWithAlphaComponent_(v64, v65, v66, v67, 0.6);
    objc_msgSend_setTextColor_(*((void **)v8 + 57), v69, (uint64_t)v68, v70);

    v74 = objc_msgSend_unitFont(v8, v71, v72, v73);
    objc_msgSend_setFont_(*((void **)v8 + 57), v75, (uint64_t)v74, v76);

    objc_msgSend_setTextAlignment_(*((void **)v8 + 57), v77, 1, v78);
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(*((void **)v8 + 57), v79, 0, v80);
    objc_msgSend_addSubview_(v8, v81, *((void *)v8 + 57), v82);
    v83 = (void *)MEMORY[0x263F08938];
    v87 = objc_msgSend__threeLineConstraints(v8, v84, v85, v86);
    objc_msgSend_activateConstraints_(v83, v88, (uint64_t)v87, v89);
  }
  return v8;
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v63.receiver = self;
  v63.super_class = (Class)AltitudeRichCircularDialView;
  [(NanoCompassBaseRichView *)&v63 configureWithImageProvider:v6 reason:a4];
  uint64_t v10 = objc_msgSend_metadata(v6, v7, v8, v9);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"altitude", v12);

  v17 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v15, v16);
  int isEqual = objc_msgSend_isEqual_(v13, v18, (uint64_t)v17, v19);

  if (isEqual)
  {

    uint64_t v13 = 0;
  }
  v24 = objc_msgSend_metadata(v6, v21, v22, v23);
  v27 = objc_msgSend_objectForKeyedSubscript_(v24, v25, @"nodata", v26);
  int v31 = objc_msgSend_BOOLValue(v27, v28, v29, v30);

  if (v31)
  {
    v35 = NanoCompassFormattedUncalibrated();
    objc_msgSend_setText_(self->_altitudeLabel, v36, (uint64_t)v35, v37);

    uint64_t v42 = NanoCompassFormattedAltitudeUnits(v38, v39, v40, v41);
    objc_msgSend_setText_(self->_unitLabel, v43, (uint64_t)v42, v44);
  }
  else
  {
    if (v13)
    {
      v45 = NSNumber;
      objc_msgSend_altitude(v13, v32, v33, v34);
      uint64_t v42 = objc_msgSend_numberWithDouble_(v45, v46, v47, v48);
      char v52 = objc_msgSend_displayTilde(v13, v49, v50, v51);
    }
    else
    {
      uint64_t v42 = 0;
      char v52 = 0;
    }
    v53 = NanoCompassValueWithFormat(v42, 0, v52);
    uint64_t v56 = objc_msgSend_setText_(self->_altitudeLabel, v54, (uint64_t)v53, v55);
    v60 = NanoCompassFormattedAltitudeUnits(v56, v57, v58, v59);
    objc_msgSend_setText_(self->_unitLabel, v61, (uint64_t)v60, v62);
  }
}

- (id)monochromeAccentViews
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self->_symbolView;
  v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 1);

  return v2;
}

- (id)monochromeOtherViews
{
  v5[2] = *MEMORY[0x263EF8340];
  unitLabel = self->_unitLabel;
  v5[0] = self->_altitudeLabel;
  v5[1] = unitLabel;
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v5, 2);

  return v3;
}

- (CircularLayoutConstants)_layoutConstantsForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268920C58);
  id WeakRetained = objc_loadWeakRetained(&qword_268920C60);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_268920C60);
  if (v6 != v3)
  {

LABEL_5:
    id v12 = objc_storeWeak(&qword_268920C60, v3);
    qword_268920C68 = objc_msgSend_version(v3, v13, v14, v15);

    sub_2375A54EC(v16, v3);
    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend_version(v3, v7, v8, v9);
  uint64_t v11 = qword_268920C68;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268920C58);
  uint64_t v17 = qword_268920C38;
  uint64_t v18 = qword_268920C40;
  uint64_t v19 = qword_268920C48;
  uint64_t v20 = qword_268920C50;

  double v21 = *(double *)&v17;
  double v22 = *(double *)&v18;
  double v23 = *(double *)&v19;
  double v24 = *(double *)&v20;
  result.valueFontSize = v24;
  result.unitFontSize = v23;
  result.symbolSize = v22;
  result.lineSpacing = v21;
  return result;
}

- (id)_threeLineConstraints
{
  v132[12] = *MEMORY[0x263EF8340];
  v131 = objc_msgSend_leadingAnchor(self->_layoutGuide, a2, v2, v3);
  v130 = objc_msgSend_leadingAnchor(self, v5, v6, v7);
  v129 = objc_msgSend_constraintEqualToAnchor_(v131, v8, (uint64_t)v130, v9);
  v132[0] = v129;
  v128 = objc_msgSend_trailingAnchor(self->_layoutGuide, v10, v11, v12);
  v127 = objc_msgSend_trailingAnchor(self, v13, v14, v15);
  v126 = objc_msgSend_constraintEqualToAnchor_(v128, v16, (uint64_t)v127, v17);
  v132[1] = v126;
  v125 = objc_msgSend_topAnchor(self->_layoutGuide, v18, v19, v20);
  v124 = objc_msgSend_topAnchor(self, v21, v22, v23);
  p_layoutConstants = &self->_layoutConstants;
  v123 = objc_msgSend_constraintEqualToAnchor_constant_(v125, v25, (uint64_t)v124, v26, self->_layoutConstants.lineSpacing);
  v132[2] = v123;
  v122 = objc_msgSend_bottomAnchor(self->_layoutGuide, v27, v28, v29);
  v121 = objc_msgSend_bottomAnchor(self, v30, v31, v32);
  v120 = objc_msgSend_constraintEqualToAnchor_constant_(v122, v33, (uint64_t)v121, v34, -self->_layoutConstants.lineSpacing);
  v132[3] = v120;
  v119 = objc_msgSend_topAnchor(self->_symbolView, v35, v36, v37);
  v118 = objc_msgSend_topAnchor(self->_layoutGuide, v38, v39, v40);
  v117 = objc_msgSend_constraintEqualToAnchor_(v119, v41, (uint64_t)v118, v42);
  v132[4] = v117;
  v116 = objc_msgSend_centerXAnchor(self->_symbolView, v43, v44, v45);
  v115 = objc_msgSend_centerXAnchor(self->_layoutGuide, v46, v47, v48);
  v114 = objc_msgSend_constraintEqualToAnchor_(v116, v49, (uint64_t)v115, v50);
  v132[5] = v114;
  v113 = objc_msgSend_heightAnchor(self->_symbolView, v51, v52, v53);
  v112 = objc_msgSend_constraintEqualToConstant_(v113, v54, v55, v56, self->_layoutConstants.symbolSize);
  v132[6] = v112;
  v111 = objc_msgSend_centerXAnchor(self->_altitudeLabel, v57, v58, v59);
  v110 = objc_msgSend_centerXAnchor(self->_layoutGuide, v60, v61, v62);
  v109 = objc_msgSend_constraintEqualToAnchor_(v111, v63, (uint64_t)v110, v64);
  v132[7] = v109;
  v108 = objc_msgSend_centerYAnchor(self->_altitudeLabel, v65, v66, v67);
  v107 = objc_msgSend_centerYAnchor(self->_layoutGuide, v68, v69, v70);
  uint64_t v73 = objc_msgSend_constraintEqualToAnchor_(v108, v71, (uint64_t)v107, v72);
  v132[8] = v73;
  v77 = objc_msgSend_bottomAnchor(self->_unitLabel, v74, v75, v76);
  v81 = objc_msgSend_bottomAnchor(self->_layoutGuide, v78, v79, v80);
  v84 = objc_msgSend_constraintEqualToAnchor_(v77, v82, (uint64_t)v81, v83);
  v132[9] = v84;
  v88 = objc_msgSend_centerXAnchor(self->_unitLabel, v85, v86, v87);
  v92 = objc_msgSend_centerXAnchor(self->_layoutGuide, v89, v90, v91);
  v95 = objc_msgSend_constraintEqualToAnchor_(v88, v93, (uint64_t)v92, v94);
  v132[10] = v95;
  v99 = objc_msgSend_heightAnchor(self->_unitLabel, v96, v97, v98);
  v103 = objc_msgSend_constraintEqualToConstant_(v99, v100, v101, v102, p_layoutConstants->unitFontSize);
  v132[11] = v103;
  v105 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v104, (uint64_t)v132, 12);

  return v105;
}

- (id)valueFont
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375A52D8;
  block[3] = &unk_264CD5570;
  block[4] = self;
  if (qword_268920C18 != -1) {
    dispatch_once(&qword_268920C18, block);
  }
  return (id)qword_268920C10;
}

- (id)unitFont
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375A53DC;
  block[3] = &unk_264CD5570;
  block[4] = self;
  if (qword_268920C30 != -1) {
    dispatch_once(&qword_268920C30, block);
  }
  return (id)qword_268920C20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitLabel, 0);
  objc_storeStrong((id *)&self->_altitudeLabel, 0);
  objc_storeStrong((id *)&self->_symbolView, 0);

  objc_storeStrong((id *)&self->_layoutGuide, 0);
}

@end