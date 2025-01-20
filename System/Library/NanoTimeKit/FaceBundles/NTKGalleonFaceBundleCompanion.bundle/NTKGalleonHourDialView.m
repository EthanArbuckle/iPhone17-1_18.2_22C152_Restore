@interface NTKGalleonHourDialView
+ (id)_newLabelView;
- (NTKGalleonHourDialView)init;
- (void)galleon_setPalette:(id)a3;
- (void)galleon_setProgress:(double)a3;
@end

@implementation NTKGalleonHourDialView

- (NTKGalleonHourDialView)init
{
  uint64_t v76 = 0;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  memset(v65, 0, sizeof(v65));
  _NTKGalleonLayoutConstants(v65);
  v64.receiver = self;
  v64.super_class = (Class)NTKGalleonHourDialView;
  v3 = -[NTKGalleonHourDialView initWithFrame:](&v64, sel_initWithFrame_, 0.0, 0.0, *(double *)v65, *(double *)v65);
  v7 = v3;
  if (v3)
  {
    v8 = objc_msgSend_layer(v3, v4, v5, v6);
    v12 = objc_msgSend_currentDevice(MEMORY[0x263EFD180], v9, v10, v11);
    objc_msgSend_screenScale(v12, v13, v14, v15);
    objc_msgSend_setRasterizationScale_(v8, v16, v17, v18);

    v21 = objc_msgSend_galleon_newTickViewWithNumberOfTicks_tickSizes_(NTKGalleonTickView, v19, 120, v20, *((double *)&v70 + 1), v71, *(double *)&v72);
    v22 = [NTKGalleonRasterizableProgressView alloc];
    uint64_t v25 = objc_msgSend_initWithProgressView_(v22, v23, (uint64_t)v21, v24);
    minorTickView = v7->_minorTickView;
    v7->_minorTickView = (NTKGalleonRasterizableProgressView *)v25;

    objc_msgSend_addSubview_(v7, v27, (uint64_t)v7->_minorTickView, v28);
    v31 = objc_msgSend_galleon_newTickViewWithNumberOfTicks_tickSizes_(NTKGalleonTickView, v29, 60, v30, *((double *)&v68 + 1), v69, *(double *)&v70);
    v32 = [NTKGalleonRasterizableProgressView alloc];
    uint64_t v35 = objc_msgSend_initWithProgressView_(v32, v33, (uint64_t)v31, v34);
    majorTickView = v7->_majorTickView;
    v7->_majorTickView = (NTKGalleonRasterizableProgressView *)v35;

    objc_msgSend_addSubview_(v7, v37, (uint64_t)v7->_majorTickView, v38);
    v41 = objc_msgSend_galleon_newTickViewWithNumberOfTicks_tickSizes_(NTKGalleonTickView, v39, 12, v40, *((double *)&v66 + 1), v67, *(double *)&v68);
    v42 = [NTKGalleonRasterizableProgressView alloc];
    uint64_t v45 = objc_msgSend_initWithProgressView_(v42, v43, (uint64_t)v41, v44);
    labelTickView = v7->_labelTickView;
    v7->_labelTickView = (NTKGalleonRasterizableProgressView *)v45;

    objc_msgSend_addSubview_(v7, v47, (uint64_t)v7->_labelTickView, v48);
    v52 = objc_msgSend__newLabelView(NTKGalleonHourDialView, v49, v50, v51);
    v53 = [NTKGalleonRasterizableProgressView alloc];
    uint64_t v56 = objc_msgSend_initWithProgressView_(v53, v54, (uint64_t)v52, v55);
    labelView = v7->_labelView;
    v7->_labelView = (NTKGalleonRasterizableProgressView *)v56;

    objc_msgSend_addSubview_(v7, v58, (uint64_t)v7->_labelView, v59);
    objc_msgSend_galleon_setProgress_(v7, v60, v61, v62, 0.0);
  }
  return v7;
}

- (void)galleon_setPalette:(id)a3
{
  id v4 = a3;
  objc_msgSend_outerTimeLabelColor(v4, v5, v6, v7);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTintColor_(self->_labelView, v8, (uint64_t)v28, v9);
  v13 = objc_msgSend_outerTimeMajorTickColor(v4, v10, v11, v12);
  objc_msgSend_setTintColor_(self->_labelTickView, v14, (uint64_t)v13, v15);
  v19 = objc_msgSend_outerTimeMinorTickColor(v4, v16, v17, v18);
  objc_msgSend_setTintColor_(self->_minorTickView, v20, (uint64_t)v19, v21);
  uint64_t v25 = objc_msgSend_outerTimeMedialTickColor(v4, v22, v23, v24);

  objc_msgSend_setTintColor_(self->_majorTickView, v26, (uint64_t)v25, v27);
}

- (void)galleon_setProgress:(double)a3
{
  double v6 = 1.0 - a3;
  objc_msgSend_galleon_setProgress_(self->_minorTickView, a2, v3, v4, 1.0 - a3);
  objc_msgSend_galleon_setProgress_(self->_majorTickView, v7, v8, v9, v6);
  objc_msgSend_galleon_setProgress_(self->_labelTickView, v10, v11, v12, v6);
  labelView = self->_labelView;

  objc_msgSend_galleon_setProgress_(labelView, v13, v14, v15, v6);
}

+ (id)_newLabelView
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  v49 = objc_msgSend_stringFromNumber_(v2, v3, (uint64_t)&unk_26FB19650, v4);
  uint64_t v48 = objc_msgSend_stringFromNumber_(v2, v5, (uint64_t)&unk_26FB19668, v6);
  v47 = objc_msgSend_stringFromNumber_(v2, v7, (uint64_t)&unk_26FB19680, v8);
  v46 = objc_msgSend_stringFromNumber_(v2, v9, (uint64_t)&unk_26FB19698, v10);
  uint64_t v45 = objc_msgSend_stringFromNumber_(v2, v11, (uint64_t)&unk_26FB196B0, v12);
  uint64_t v15 = objc_msgSend_stringFromNumber_(v2, v13, (uint64_t)&unk_26FB196C8, v14);
  uint64_t v18 = objc_msgSend_stringFromNumber_(v2, v16, (uint64_t)&unk_26FB196E0, v17);
  uint64_t v21 = objc_msgSend_stringFromNumber_(v2, v19, (uint64_t)&unk_26FB196F8, v20);
  uint64_t v24 = objc_msgSend_stringFromNumber_(v2, v22, (uint64_t)&unk_26FB19710, v23);
  uint64_t v27 = objc_msgSend_stringFromNumber_(v2, v25, (uint64_t)&unk_26FB19728, v26);
  uint64_t v30 = objc_msgSend_stringFromNumber_(v2, v28, (uint64_t)&unk_26FB19740, v29);
  objc_msgSend_stringFromNumber_(v2, v31, (uint64_t)&unk_26FB19758, v32);
  v56[0] = v49;
  v56[1] = v48;
  v56[2] = v47;
  v56[3] = v46;
  v56[4] = v45;
  v56[5] = v15;
  v56[6] = v18;
  v56[7] = v21;
  v56[8] = v24;
  v56[9] = v27;
  v33 = (void *)v24;
  uint64_t v57 = v56[10] = v30;
  uint64_t v34 = (void *)v30;
  uint64_t v35 = (void *)v57;
  v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v36, (uint64_t)v56, 12);
  uint64_t v55 = 0;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  memset(v50, 0, sizeof(v50));
  _NTKGalleonLayoutConstants(v50);
  double v38 = *(double *)v50;
  double v39 = *((double *)&v51 + 1);
  double v40 = *(double *)&v52;
  v41 = [NTKGalleonRadialLabelView alloc];
  v43 = objc_msgSend_initWithDialDiameter_rightSideUp_labels_paddingRange_(v41, v42, 1, (uint64_t)v37, v38, v39, v40);

  return v43;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minorTickView, 0);
  objc_storeStrong((id *)&self->_majorTickView, 0);
  objc_storeStrong((id *)&self->_labelTickView, 0);

  objc_storeStrong((id *)&self->_labelView, 0);
}

@end