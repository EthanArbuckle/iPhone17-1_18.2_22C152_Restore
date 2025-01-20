@interface NTKGalleonDegreeDialView
+ (id)_newChevronImageView;
+ (id)_newLabelView;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NTKGalleonDegreeDialView)init;
- (void)galleon_setHeading:(double)a3;
- (void)galleon_setPalette:(id)a3;
- (void)galleon_setProgress:(double)a3;
- (void)setChevronAndLabelOpacity:(double)a3;
@end

@implementation NTKGalleonDegreeDialView

- (NTKGalleonDegreeDialView)init
{
  uint64_t v77 = 0;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v60 = 0u;
  _NTKGalleonLayoutConstants(&v60);
  v59.receiver = self;
  v59.super_class = (Class)NTKGalleonDegreeDialView;
  id v5 = -[NTKGalleonDegreeDialView initWithFrame:](&v59, sel_initWithFrame_, 0.0, 0.0, *(double *)&v60, *(double *)&v60);
  if (v5)
  {
    v6 = objc_msgSend_galleon_newTickViewWithNumberOfTicks_tickSizes_(NTKGalleonTickView, v3, 360, v4, *((double *)&v65 + 1), v66, *(double *)&v67);
    v7 = [NTKGalleonRasterizableProgressView alloc];
    uint64_t v10 = objc_msgSend_initWithProgressView_(v7, v8, (uint64_t)v6, v9);
    v11 = (void *)*((void *)v5 + 54);
    *((void *)v5 + 54) = v10;

    objc_msgSend_addSubview_(v5, v12, *((void *)v5 + 54), v13);
    v16 = objc_msgSend_galleon_newTickViewWithNumberOfTicks_tickSizes_(NTKGalleonTickView, v14, 72, v15, *((double *)&v63 + 1), v64, *(double *)&v65);
    v17 = [NTKGalleonRasterizableProgressView alloc];
    uint64_t v20 = objc_msgSend_initWithProgressView_(v17, v18, (uint64_t)v16, v19);
    v21 = (void *)*((void *)v5 + 53);
    *((void *)v5 + 53) = v20;

    objc_msgSend_addSubview_(v5, v22, *((void *)v5 + 53), v23);
    v26 = objc_msgSend_galleon_newTickViewWithNumberOfTicks_tickSizes_(NTKGalleonTickView, v24, 12, v25, *((double *)&v61 + 1), v62, *(double *)&v63);
    v27 = [NTKGalleonRasterizableProgressView alloc];
    uint64_t v30 = objc_msgSend_initWithProgressView_(v27, v28, (uint64_t)v26, v29);
    v31 = (void *)*((void *)v5 + 52);
    *((void *)v5 + 52) = v30;

    objc_msgSend_addSubview_(v5, v32, *((void *)v5 + 52), v33);
    v37 = objc_msgSend__newLabelView(NTKGalleonDegreeDialView, v34, v35, v36);
    v38 = [NTKGalleonRasterizableProgressView alloc];
    uint64_t v41 = objc_msgSend_initWithProgressView_(v38, v39, (uint64_t)v37, v40);
    v42 = (void *)*((void *)v5 + 51);
    *((void *)v5 + 51) = v41;

    objc_msgSend_addSubview_(v5, v43, *((void *)v5 + 51), v44);
    uint64_t v48 = objc_msgSend__newChevronImageView(NTKGalleonDegreeDialView, v45, v46, v47);
    v49 = (void *)*((void *)v5 + 55);
    *((void *)v5 + 55) = v48;

    objc_msgSend_addSubview_(v5, v50, *((void *)v5 + 55), v51);
    objc_msgSend_galleon_setProgress_(v5, v52, v53, v54, 1.0);
    objc_msgSend_galleon_setHeading_(v5, v55, v56, v57, 0.0);
  }
  return (NTKGalleonDegreeDialView *)v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _NTKGalleonLayoutConstants(v5);
  double v3 = v5[0];
  double v4 = v5[0];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setChevronAndLabelOpacity:(double)a3
{
  objc_msgSend_setAlpha_(self->_chevronView, a2, v3, v4);
  labelView = self->_labelView;

  objc_msgSend_setAlpha_(labelView, v7, v8, v9, a3);
}

- (void)galleon_setHeading:(double)a3
{
  CGFloat v5 = a3 / -180.0 * 3.14159265;
  v6 = objc_msgSend_layer(self, a2, v3, v4);
  CATransform3DMakeRotation(&v9, v5, 0.0, 0.0, 1.0);
  objc_msgSend_setTransform_(v6, v7, (uint64_t)&v9, v8);
}

- (void)galleon_setPalette:(id)a3
{
  id v4 = a3;
  objc_msgSend_outerDegreeLabelColor(v4, v5, v6, v7);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTintColor_(self->_labelTickView, v8, (uint64_t)v34, v9);
  uint64_t v13 = objc_msgSend_outerCompassMajorTickColor(v4, v10, v11, v12);
  objc_msgSend_setTintColor_(self->_labelView, v14, (uint64_t)v13, v15);
  uint64_t v19 = objc_msgSend_outerCompassMinorTickColor(v4, v16, v17, v18);
  objc_msgSend_setTintColor_(self->_minorTickView, v20, (uint64_t)v19, v21);
  uint64_t v25 = objc_msgSend_outerCompassMedialTickColor(v4, v22, v23, v24);
  objc_msgSend_setTintColor_(self->_majorTickView, v26, (uint64_t)v25, v27);
  v31 = objc_msgSend_compassChevronColor(v4, v28, v29, v30);

  objc_msgSend_setTintColor_(self->_chevronView, v32, (uint64_t)v31, v33);
}

- (void)galleon_setProgress:(double)a3
{
  double v6 = 1.0 - a3;
  objc_msgSend_galleon_setProgress_(self->_minorTickView, a2, v3, v4, 1.0 - a3);
  objc_msgSend_galleon_setProgress_(self->_majorTickView, v7, v8, v9, v6);
  objc_msgSend_galleon_setProgress_(self->_labelTickView, v10, v11, v12, v6);
  objc_msgSend_galleon_setProgress_(self->_labelView, v13, v14, v15, v6);
  uint64_t v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  memset(v25, 0, sizeof(v25));
  _NTKGalleonLayoutConstants(v25);
  double v16 = NTKGalleonFloatRangePercentageValue(*((double *)&v26 + 1), *(double *)&v27, v6);
  double v17 = *(double *)v25 * 0.5;
  objc_msgSend_bounds(self->_chevronView, v18, v19, v20);
  CGFloat Height = CGRectGetHeight(v30);
  objc_msgSend_setCenter_(self->_chevronView, v22, v23, v24, v17, v16 + Height * 0.5);
}

+ (id)_newLabelView
{
  v49[12] = *MEMORY[0x263EF8340];
  v42 = objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, a2, @"GALLEON_LABEL_EAST", @"E");
  uint64_t v41 = objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v2, @"GALLEON_LABEL_SOUTH", @"S");
  uint64_t v4 = objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v3, @"GALLEON_LABEL_WEST", @"W");
  id v5 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v40 = objc_msgSend_stringFromNumber_(v5, v6, (uint64_t)&unk_26FB19590, v7);
  v39 = objc_msgSend_stringFromNumber_(v5, v8, (uint64_t)&unk_26FB195A8, v9);
  uint64_t v12 = objc_msgSend_stringFromNumber_(v5, v10, (uint64_t)&unk_26FB195C0, v11);
  uint64_t v15 = objc_msgSend_stringFromNumber_(v5, v13, (uint64_t)&unk_26FB195D8, v14);
  uint64_t v18 = objc_msgSend_stringFromNumber_(v5, v16, (uint64_t)&unk_26FB195F0, v17);
  uint64_t v21 = objc_msgSend_stringFromNumber_(v5, v19, (uint64_t)&unk_26FB19608, v20);
  uint64_t v24 = objc_msgSend_stringFromNumber_(v5, v22, (uint64_t)&unk_26FB19620, v23);
  long long v27 = objc_msgSend_stringFromNumber_(v5, v25, (uint64_t)&unk_26FB19638, v26);
  v49[0] = &stru_26FB12890;
  v49[1] = v40;
  v49[2] = v39;
  v49[3] = v42;
  v49[4] = v12;
  v49[5] = v15;
  v49[6] = v41;
  v49[7] = v18;
  v49[8] = v21;
  v49[9] = v4;
  long long v28 = (void *)v21;
  v49[10] = v24;
  v49[11] = v27;
  uint64_t v29 = (void *)v24;
  v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v30, (uint64_t)v49, 12);
  uint64_t v48 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  memset(v43, 0, sizeof(v43));
  _NTKGalleonLayoutConstants(v43);
  double v32 = *(double *)v43;
  double v33 = *((double *)&v44 + 1);
  double v34 = *(double *)&v45;
  uint64_t v35 = [NTKGalleonRadialLabelView alloc];
  v37 = objc_msgSend_initWithDialDiameter_rightSideUp_labels_paddingRange_(v35, v36, 0, (uint64_t)v31, v32, v33, v34);

  return v37;
}

+ (id)_newChevronImageView
{
  objc_msgSend_galleon_newChevronImageView(MEMORY[0x263F1C6D0], a2, v2, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_minorTickView, 0);
  objc_storeStrong((id *)&self->_majorTickView, 0);
  objc_storeStrong((id *)&self->_labelTickView, 0);

  objc_storeStrong((id *)&self->_labelView, 0);
}

@end