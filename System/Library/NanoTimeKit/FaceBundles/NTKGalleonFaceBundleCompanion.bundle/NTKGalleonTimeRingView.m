@interface NTKGalleonTimeRingView
+ (id)_imageWithRenderer:(id)a3 diameter:(double)a4 tickCount:(unint64_t)a5 tickSize:(CGSize)a6;
- (NTKGalleonColorPalette)palette;
- (NTKGalleonTimeRingView)initWithDiameter:(double)a3;
- (double)ringThickness;
- (void)setPalette:(id)a3;
@end

@implementation NTKGalleonTimeRingView

+ (id)_imageWithRenderer:(id)a3 diameter:(double)a4 tickCount:(unint64_t)a5 tickSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v10 = a3;
  v11 = [NTKGalleonTickView alloc];
  v14 = objc_msgSend_initWithDialDiameter_numberOfTicks_tickSizes_(v11, v12, a5, v13, a4, width, width, height, height);
  v18 = objc_msgSend_blackColor(MEMORY[0x263F1C550], v15, v16, v17);
  objc_msgSend_setTintColor_(v14, v19, (uint64_t)v18, v20);

  objc_msgSend_setNeedsLayout(v14, v21, v22, v23);
  objc_msgSend_layoutIfNeeded(v14, v24, v25, v26);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = sub_246B37D7C;
  v35[3] = &unk_2651F8D98;
  id v36 = v14;
  id v27 = v14;
  v30 = objc_msgSend_imageWithActions_(v10, v28, (uint64_t)v35, v29);

  v33 = objc_msgSend_imageWithRenderingMode_(v30, v31, 2, v32);

  return v33;
}

- (NTKGalleonTimeRingView)initWithDiameter:(double)a3
{
  v123.receiver = self;
  v123.super_class = (Class)NTKGalleonTimeRingView;
  id v7 = -[NTKGalleonTimeRingView initWithFrame:](&v123, sel_initWithFrame_, 0.0, 0.0, a3, a3);
  if (v7)
  {
    if (qword_2691D5948 != -1) {
      dispatch_once(&qword_2691D5948, &unk_26FB12670);
    }
    double v8 = *(double *)&qword_2691D5920;
    double v9 = *(double *)&qword_2691D5928;
    double v10 = *(double *)&qword_2691D5930;
    double v11 = *(double *)&qword_2691D5938;
    double v12 = a3 + *(double *)&qword_2691D5940 * -2.0;
    uint64_t v13 = objc_msgSend_layer(MEMORY[0x263F15880], v4, v5, v6);
    objc_msgSend_bezierPathWithOvalInRect_(MEMORY[0x263F1C478], v14, v15, v16, 0.0, 0.0, a3, a3);
    id v17 = objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_msgSend_CGPath(v17, v18, v19, v20);
    objc_msgSend_setPath_(v13, v22, v21, v23);

    objc_msgSend_blackColor(MEMORY[0x263F1C550], v24, v25, v26);
    id v27 = objc_claimAutoreleasedReturnValue();
    uint64_t v31 = objc_msgSend_CGColor(v27, v28, v29, v30);
    objc_msgSend_setFillColor_(v13, v32, v31, v33);

    objc_msgSend_setContentsFormat_(v13, v34, *MEMORY[0x263F159C0], v35);
    objc_msgSend_blackColor(MEMORY[0x263F1C550], v36, v37, v38);
    id v39 = objc_claimAutoreleasedReturnValue();
    uint64_t v43 = objc_msgSend_CGColor(v39, v40, v41, v42);
    objc_msgSend_setContentsMultiplyColor_(v13, v44, v43, v45);

    objc_msgSend_setBounds_(v13, v46, v47, v48, 0.0, 0.0, a3, a3);
    id v49 = objc_alloc(MEMORY[0x263F1C680]);
    v53 = objc_msgSend_initWithSize_(v49, v50, v51, v52, a3, a3);
    v121[0] = MEMORY[0x263EF8330];
    v121[1] = 3221225472;
    v121[2] = sub_246B38200;
    v121[3] = &unk_2651F8D98;
    id v122 = v13;
    id v54 = v13;
    v57 = objc_msgSend_imageWithActions_(v53, v55, (uint64_t)v121, v56);
    v60 = objc_msgSend_imageWithRenderingMode_(v57, v58, 2, v59);
    id v61 = objc_alloc(MEMORY[0x263F1C6D0]);
    v64 = objc_msgSend_initWithImage_(v61, v62, (uint64_t)v60, v63);
    objc_msgSend_setCenter_(v64, v65, v66, v67, a3 * 0.5, a3 * 0.5);
    v68 = (void *)*((void *)v7 + 51);
    *((void *)v7 + 51) = v64;
    id v69 = v64;

    objc_msgSend_addSubview_(v7, v70, (uint64_t)v69, v71);
    v75 = objc_msgSend_preferredFormat(MEMORY[0x263F1C688], v72, v73, v74);
    objc_msgSend_scale(v75, v76, v77, v78);
    objc_msgSend_setScale_(v75, v80, v81, v82, v79 * 4.0);
    id v83 = objc_alloc(MEMORY[0x263F1C680]);
    v86 = objc_msgSend_initWithSize_format_(v83, v84, (uint64_t)v75, v85, v12, v12);
    v88 = objc_msgSend__imageWithRenderer_diameter_tickCount_tickSize_(NTKGalleonTimeRingView, v87, (uint64_t)v86, 120, v12, v11, v10);
    id v89 = objc_alloc(MEMORY[0x263F1C6D0]);
    uint64_t v92 = objc_msgSend_initWithImage_(v89, v90, (uint64_t)v88, v91);
    v93 = (void *)*((void *)v7 + 52);
    *((void *)v7 + 52) = v92;

    objc_msgSend_setFrame_(*((void **)v7 + 52), v94, v95, v96, 0.0, 0.0, v12, v12);
    objc_msgSend_addSubview_(v7, v97, *((void *)v7 + 52), v98);
    objc_msgSend_setCenter_(*((void **)v7 + 52), v99, v100, v101, a3 * 0.5, a3 * 0.5);

    id v102 = objc_alloc(MEMORY[0x263F1C680]);
    v106 = objc_msgSend_initWithSize_(v102, v103, v104, v105, v12, v12);
    v108 = objc_msgSend__imageWithRenderer_diameter_tickCount_tickSize_(NTKGalleonTimeRingView, v107, (uint64_t)v106, 12, v12, v9, v8);
    id v109 = objc_alloc(MEMORY[0x263F1C6D0]);
    uint64_t v112 = objc_msgSend_initWithImage_(v109, v110, (uint64_t)v108, v111);
    v113 = (void *)*((void *)v7 + 53);
    *((void *)v7 + 53) = v112;

    objc_msgSend_addSubview_(v7, v114, *((void *)v7 + 53), v115);
    objc_msgSend_setCenter_(*((void **)v7 + 53), v116, v117, v118, a3 * 0.5, a3 * 0.5);

    id v119 = v7;
  }

  return (NTKGalleonTimeRingView *)v7;
}

- (double)ringThickness
{
  if (qword_2691D5948 != -1) {
    dispatch_once(&qword_2691D5948, &unk_26FB12670);
  }
  return *(double *)&qword_2691D5918;
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
  id v5 = a3;
  objc_msgSend_innerRingBackgroundColor(v5, v6, v7, v8);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTintColor_(self->_ringImageView, v9, (uint64_t)v23, v10);
  v14 = objc_msgSend_innerMajorTickColor(v5, v11, v12, v13);
  objc_msgSend_setTintColor_(self->_majorTicksImageView, v15, (uint64_t)v14, v16);
  uint64_t v20 = objc_msgSend_innerMinorTickColor(v5, v17, v18, v19);
  objc_msgSend_setTintColor_(self->_minorTicksImageView, v21, (uint64_t)v20, v22);
}

- (NTKGalleonColorPalette)palette
{
  return self->_palette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_majorTicksImageView, 0);
  objc_storeStrong((id *)&self->_minorTicksImageView, 0);

  objc_storeStrong((id *)&self->_ringImageView, 0);
}

@end