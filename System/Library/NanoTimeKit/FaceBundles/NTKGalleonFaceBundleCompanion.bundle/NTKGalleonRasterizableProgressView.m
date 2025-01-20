@interface NTKGalleonRasterizableProgressView
- (NTKGalleonProgressSettable)progressView;
- (NTKGalleonRasterizableProgressView)initWithProgressView:(id)a3;
- (void)galleon_setProgress:(double)a3;
- (void)tintColorDidChange;
@end

@implementation NTKGalleonRasterizableProgressView

- (NTKGalleonRasterizableProgressView)initWithProgressView:(id)a3
{
  id v5 = a3;
  objc_msgSend_frame(v5, v6, v7, v8);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v86.receiver = self;
  v86.super_class = (Class)NTKGalleonRasterizableProgressView;
  id v20 = -[NTKGalleonRasterizableProgressView initWithFrame:](&v86, sel_initWithFrame_);
  if (v20)
  {
    objc_msgSend_galleon_setProgress_(v5, v17, v18, v19, 1.0);
    objc_msgSend_layoutIfNeeded(v5, v21, v22, v23);
    v84[0] = MEMORY[0x263EF8330];
    v84[1] = 3221225472;
    v84[2] = sub_246B35B20;
    v84[3] = &unk_2651F8D98;
    id v24 = v5;
    id v85 = v24;
    v25 = (void *)MEMORY[0x24C5428F0](v84);
    objc_msgSend_bounds(v24, v26, v27, v28);
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    id v37 = objc_alloc(MEMORY[0x263F1C680]);
    v41 = objc_msgSend_initWithBounds_(v37, v38, v39, v40, v30, v32, v34, v36);
    v44 = objc_msgSend_imageWithActions_(v41, v42, (uint64_t)v25, v43);
    uint64_t v47 = objc_msgSend_imageWithRenderingMode_(v44, v45, 2, v46);
    v48 = (void *)*((void *)v20 + 53);
    *((void *)v20 + 53) = v47;

    objc_msgSend_galleon_setProgress_(v24, v49, v50, v51, 0.0);
    objc_msgSend_layoutIfNeeded(v24, v52, v53, v54);
    v57 = objc_msgSend_imageWithActions_(v41, v55, (uint64_t)v25, v56);
    uint64_t v60 = objc_msgSend_imageWithRenderingMode_(v57, v58, 2, v59);
    v61 = (void *)*((void *)v20 + 52);
    *((void *)v20 + 52) = v60;

    id v62 = objc_alloc(MEMORY[0x263F1C6D0]);
    v65 = objc_msgSend_initWithImage_(v62, v63, *((void *)v20 + 52), v64);
    objc_msgSend_setFrame_(v65, v66, v67, v68, v10, v12, v14, v16);
    objc_msgSend_setContentMode_(v65, v69, 4, v70);
    v71 = (void *)*((void *)v20 + 51);
    *((void *)v20 + 51) = v65;
    id v72 = v65;

    objc_msgSend_addSubview_(v20, v73, *((void *)v20 + 51), v74);
    objc_storeStrong((id *)v20 + 54, a3);
    v87.origin.x = v30;
    v87.origin.y = v32;
    v87.size.width = v34;
    v87.size.height = v36;
    double MidX = CGRectGetMidX(v87);
    v88.origin.x = v30;
    v88.origin.y = v32;
    v88.size.width = v34;
    v88.size.height = v36;
    double MidY = CGRectGetMidY(v88);
    objc_msgSend_setCenter_(v72, v77, v78, v79, MidX, MidY);

    objc_msgSend_setCenter_(v24, v80, v81, v82, MidX, MidY);
  }

  return (NTKGalleonRasterizableProgressView *)v20;
}

- (void)tintColorDidChange
{
  objc_msgSend_tintColor(self, a2, v2, v3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTintColor_(self->_progressView, v5, (uint64_t)v9, v6);
  objc_msgSend_setTintColor_(self->_imageView, v7, (uint64_t)v9, v8);
}

- (void)galleon_setProgress:(double)a3
{
  id v5 = self->_imageView;
  uint64_t v6 = self->_progressView;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_246B35D58;
  v20[3] = &unk_2651F8DC0;
  uint64_t v7 = v5;
  v21 = v7;
  uint64_t v22 = self;
  uint64_t v8 = v6;
  uint64_t v23 = v8;
  uint64_t v9 = MEMORY[0x24C5428F0](v20);
  double v13 = (void *)v9;
  if (fabs(a3) >= 0.00000011920929)
  {
    if (fabs(a3 + -1.0) >= 0.00000011920929)
    {
      objc_msgSend_removeFromSuperview(self->_imageView, v10, v11, v12);
      objc_msgSend_addSubview_(self, v15, (uint64_t)self->_progressView, v16);
      objc_msgSend_galleon_setProgress_(self->_progressView, v17, v18, v19, a3);
      goto LABEL_7;
    }
    uint64_t v14 = 424;
  }
  else
  {
    uint64_t v14 = 416;
  }
  (*(void (**)(uint64_t, void))(v9 + 16))(v9, *(Class *)((char *)&self->super.super.super.isa + v14));
LABEL_7:
}

- (NTKGalleonProgressSettable)progressView
{
  return self->_progressView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_maxProgressImage, 0);
  objc_storeStrong((id *)&self->_minProgressImage, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end