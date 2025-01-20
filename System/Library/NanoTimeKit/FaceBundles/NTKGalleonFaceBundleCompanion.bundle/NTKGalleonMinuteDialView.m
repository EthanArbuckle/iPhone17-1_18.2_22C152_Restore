@interface NTKGalleonMinuteDialView
+ (id)_newLabelView;
- (NTKGalleonMinuteDialView)init;
- (void)galleon_setPalette:(id)a3;
- (void)galleon_setProgress:(double)a3;
@end

@implementation NTKGalleonMinuteDialView

- (NTKGalleonMinuteDialView)init
{
  uint64_t v82 = 0;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
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
  long long v65 = 0u;
  _NTKGalleonLayoutConstants(&v65);
  v64.receiver = self;
  v64.super_class = (Class)NTKGalleonMinuteDialView;
  v3 = -[NTKGalleonMinuteDialView initWithFrame:](&v64, sel_initWithFrame_, 0.0, 0.0, *(double *)&v65, *(double *)&v65);
  v7 = v3;
  if (v3)
  {
    v8 = objc_msgSend_layer(v3, v4, v5, v6);
    v12 = objc_msgSend_currentDevice(MEMORY[0x263EFD180], v9, v10, v11);
    objc_msgSend_screenScale(v12, v13, v14, v15);
    objc_msgSend_setRasterizationScale_(v8, v16, v17, v18);

    v21 = objc_msgSend_galleon_newTickViewWithNumberOfTicks_tickSizes_(NTKGalleonTickView, v19, 240, v20, *((double *)&v70 + 1), v71, *(double *)&v72);
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
    v52 = objc_msgSend__newLabelView(NTKGalleonMinuteDialView, v49, v50, v51);
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
  uint64_t v60 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  objc_msgSend_setMinimumIntegerDigits_(v2, v3, 2, v4);
  uint64_t v51 = objc_msgSend_stringFromNumber_(v2, v5, (uint64_t)&unk_26FB19200, v6);
  uint64_t v50 = objc_msgSend_stringFromNumber_(v2, v7, (uint64_t)&unk_26FB19218, v8);
  v49 = objc_msgSend_stringFromNumber_(v2, v9, (uint64_t)&unk_26FB19230, v10);
  uint64_t v48 = objc_msgSend_stringFromNumber_(v2, v11, (uint64_t)&unk_26FB19248, v12);
  v47 = objc_msgSend_stringFromNumber_(v2, v13, (uint64_t)&unk_26FB19260, v14);
  uint64_t v17 = objc_msgSend_stringFromNumber_(v2, v15, (uint64_t)&unk_26FB19278, v16);
  uint64_t v20 = objc_msgSend_stringFromNumber_(v2, v18, (uint64_t)&unk_26FB19290, v19);
  uint64_t v23 = objc_msgSend_stringFromNumber_(v2, v21, (uint64_t)&unk_26FB192A8, v22);
  uint64_t v26 = objc_msgSend_stringFromNumber_(v2, v24, (uint64_t)&unk_26FB192C0, v25);
  v29 = objc_msgSend_stringFromNumber_(v2, v27, (uint64_t)&unk_26FB192D8, v28);
  uint64_t v32 = objc_msgSend_stringFromNumber_(v2, v30, (uint64_t)&unk_26FB192F0, v31);
  objc_msgSend_stringFromNumber_(v2, v33, (uint64_t)&unk_26FB19308, v34);
  v58[0] = v51;
  v58[1] = v50;
  v58[2] = v49;
  v58[3] = v48;
  v58[4] = v47;
  v58[5] = v17;
  v58[6] = v20;
  v58[7] = v23;
  v58[8] = v26;
  v58[9] = v29;
  uint64_t v35 = (void *)v26;
  uint64_t v59 = v58[10] = v32;
  v36 = (void *)v32;
  v37 = (void *)v59;
  v39 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v38, (uint64_t)v58, 12);
  uint64_t v57 = 0;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  memset(v52, 0, sizeof(v52));
  _NTKGalleonLayoutConstants(v52);
  double v40 = *(double *)v52;
  double v41 = *((double *)&v53 + 1);
  double v42 = *(double *)&v54;
  v43 = [NTKGalleonRadialLabelView alloc];
  uint64_t v45 = objc_msgSend_initWithDialDiameter_rightSideUp_labels_paddingRange_(v43, v44, 1, (uint64_t)v39, v40, v41, v42);

  return v45;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minorTickView, 0);
  objc_storeStrong((id *)&self->_majorTickView, 0);
  objc_storeStrong((id *)&self->_labelTickView, 0);

  objc_storeStrong((id *)&self->_labelView, 0);
}

@end