@interface CLSNotificationBannerView
+ (BOOL)_preventsAppearanceProxyCustomization;
+ (id)bannerMessageAttributes;
+ (id)bannerTitleAttributes;
+ (id)bundle;
- (CLSNotificationBannerView)initWithTitle:(id)a3 image:(id)a4 message:(id)a5;
- (CLSNotificationBannerView)initWithTitle:(id)a3 imageView:(id)a4 message:(id)a5;
- (CLSNotificationBannerView)initWithTitle:(id)a3 message:(id)a4;
- (UIImageView)imageView;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UIStackView)labelsStackView;
- (double)duration;
- (double)preferredWidthPad;
- (id)completionHandler;
- (void)applyConstraints;
- (void)callCompletionHandler;
- (void)hideBanner;
- (void)setCompletionHandler:(id)a3;
- (void)setDuration:(double)a3;
- (void)setImageView:(id)a3;
- (void)setLabelsStackView:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)showWithCompletionHandler:(id)a3;
@end

@implementation CLSNotificationBannerView

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

+ (id)bannerTitleAttributes
{
  if (qword_268496210 != -1) {
    dispatch_once(&qword_268496210, &unk_26DF66810);
  }
  v2 = (void *)qword_268496208;

  return v2;
}

+ (id)bannerMessageAttributes
{
  if (qword_268496220 != -1) {
    dispatch_once(&qword_268496220, &unk_26DF66830);
  }
  v2 = (void *)qword_268496218;

  return v2;
}

+ (id)bundle
{
  if (qword_268496230 != -1) {
    dispatch_once(&qword_268496230, &unk_26DF66850);
  }
  v2 = (void *)qword_268496228;

  return v2;
}

- (CLSNotificationBannerView)initWithTitle:(id)a3 imageView:(id)a4 message:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v113.receiver = self;
  v113.super_class = (Class)CLSNotificationBannerView;
  double v11 = *MEMORY[0x263F001A8];
  double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  v15 = -[CLSNotificationBannerView initWithFrame:](&v113, sel_initWithFrame_, *MEMORY[0x263F001A8], v12, v13, v14);
  v18 = v15;
  if (v15)
  {
    objc_msgSend_setDuration_(v15, v16, v17, 9.0);
    v21 = objc_msgSend_currentTraitCollection(MEMORY[0x263F1CB00], v19, v20);
    unint64_t v24 = objc_msgSend_userInterfaceStyle(v21, v22, v23);

    if (v24 > 2) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = qword_22BFA63D0[v24];
    }
    id v26 = objc_alloc(MEMORY[0x263F1CBE8]);
    v112 = objc_msgSend_initWithPrivateStyle_(v26, v27, v25);
    objc_msgSend_addSubview_(v18, v28, (uint64_t)v112);
    objc_storeStrong((id *)&v18->_imageView, a4);
    objc_msgSend_addSubview_(v18, v29, (uint64_t)v18->_imageView);
    v30 = (UIStackView *)objc_alloc_init(MEMORY[0x263F1C9B8]);
    labelsStackView = v18->_labelsStackView;
    v18->_labelsStackView = v30;

    objc_msgSend_setAxis_(v18->_labelsStackView, v32, 1);
    objc_msgSend_setAlignment_(v18->_labelsStackView, v33, 0);
    objc_msgSend_setDistribution_(v18->_labelsStackView, v34, 2);
    objc_msgSend_addSubview_(v18, v35, (uint64_t)v18->_labelsStackView);
    unint64_t v38 = 0x263F1C000uLL;
    if (v8)
    {
      id v39 = objc_alloc(MEMORY[0x263F1C768]);
      uint64_t v42 = objc_msgSend_initWithFrame_(v39, v40, v41, v11, v12, v13, v14);
      titleLabel = v18->_titleLabel;
      v18->_titleLabel = (UILabel *)v42;

      v46 = objc_msgSend_clearColor(MEMORY[0x263F1C550], v44, v45);
      objc_msgSend_setBackgroundColor_(v18->_titleLabel, v47, (uint64_t)v46);

      objc_msgSend_setNumberOfLines_(v18->_titleLabel, v48, 1);
      objc_msgSend_setAdjustsFontSizeToFitWidth_(v18->_titleLabel, v49, 1);
      objc_msgSend_setMinimumScaleFactor_(v18->_titleLabel, v50, v51, 0.8);
      id v52 = objc_alloc(MEMORY[0x263F086A0]);
      v53 = objc_opt_class();
      v56 = objc_msgSend_bannerTitleAttributes(v53, v54, v55);
      v58 = objc_msgSend_initWithString_attributes_(v52, v57, (uint64_t)v8, v56);
      objc_msgSend_setAttributedText_(v18->_titleLabel, v59, (uint64_t)v58);

      unint64_t v38 = 0x263F1C000uLL;
      objc_msgSend_setTextAlignment_(v18->_titleLabel, v60, 4);
      objc_msgSend_addArrangedSubview_(v18->_labelsStackView, v61, (uint64_t)v18->_titleLabel);
    }
    if (v10)
    {
      id v62 = objc_alloc(MEMORY[0x263F1C768]);
      uint64_t v65 = objc_msgSend_initWithFrame_(v62, v63, v64, v11, v12, v13, v14);
      messageLabel = v18->_messageLabel;
      v18->_messageLabel = (UILabel *)v65;

      v69 = objc_msgSend_clearColor(MEMORY[0x263F1C550], v67, v68);
      objc_msgSend_setBackgroundColor_(v18->_messageLabel, v70, (uint64_t)v69);

      objc_msgSend_setNumberOfLines_(v18->_messageLabel, v71, 0);
      objc_msgSend_setAdjustsFontSizeToFitWidth_(v18->_messageLabel, v72, 1);
      objc_msgSend_setMinimumScaleFactor_(v18->_messageLabel, v73, v74, 0.8);
      id v75 = objc_alloc(MEMORY[0x263F086A0]);
      v76 = objc_opt_class();
      v79 = objc_msgSend_bannerMessageAttributes(v76, v77, v78);
      v81 = objc_msgSend_initWithString_attributes_(v75, v80, (uint64_t)v10, v79);
      objc_msgSend_setAttributedText_(v18->_messageLabel, v82, (uint64_t)v81);

      unint64_t v38 = 0x263F1C000;
      objc_msgSend_setTextAlignment_(v18->_messageLabel, v83, 4);
      objc_msgSend_addArrangedSubview_(v18->_labelsStackView, v84, (uint64_t)v18->_messageLabel);
    }
    if (qword_268496238 != -1) {
      dispatch_once(&qword_268496238, &unk_26DF66890);
    }
    if (byte_2684961E8)
    {
      objc_msgSend_sizeToFit(v18->_titleLabel, v36, v37);
      objc_msgSend_sizeToFit(v18->_messageLabel, v85, v86);
      v89 = v18->_titleLabel;
      if (v89)
      {
        objc_msgSend_frame(v89, v87, v88);
        double v91 = v90;
      }
      else
      {
        double v91 = 0.0;
      }
      v92 = v18->_messageLabel;
      if (v92)
      {
        objc_msgSend_frame(v92, v87, v88);
        if (v91 < v93) {
          double v91 = v93;
        }
      }
      unint64_t v38 = 0x263F1C000uLL;
      double v94 = fmin(v91, 512.0);
      if (qword_268496238 != -1) {
        dispatch_once(&qword_268496238, &unk_26DF66890);
      }
      double v95 = 54.0;
      if (!byte_2684961E8) {
        double v95 = 57.0;
      }
      double v96 = 12.0;
      if (byte_2684961E8) {
        double v97 = 12.0;
      }
      else {
        double v97 = 15.0;
      }
      double v98 = v94 + v95 + v97;
      if (!byte_2684961E8) {
        double v96 = 15.0;
      }
      double v99 = v98 + v96;
      if (v99 < 282.0) {
        double v99 = 282.0;
      }
      v18->_preferredWidthPad = v99;
      float v100 = 16.5;
      if (!byte_2684961E8) {
        float v100 = 16.0;
      }
      double v101 = floorf(v100);
      v102 = objc_msgSend_layer(v18, v87, v88);
      objc_msgSend_setCornerRadius_(v102, v103, v104, v101);

      v107 = objc_msgSend_layer(v18, v105, v106);
      objc_msgSend_setMasksToBounds_(v107, v108, 1);
    }
    v109 = objc_msgSend_systemBackgroundColor(*(void **)(v38 + 1360), v36, v37);
    objc_msgSend_setBackgroundColor_(v18, v110, (uint64_t)v109);
  }
  objc_msgSend_applyConstraints(v18, v16, v17);

  return v18;
}

- (CLSNotificationBannerView)initWithTitle:(id)a3 image:(id)a4 message:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x263F1C6D0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  double v14 = objc_msgSend_initWithImage_(v12, v13, (uint64_t)v10);

  uint64_t v17 = objc_msgSend_clearColor(MEMORY[0x263F1C550], v15, v16);
  objc_msgSend_setBackgroundColor_(v14, v18, (uint64_t)v17);

  objc_msgSend_setContentMode_(v14, v19, 1);
  objc_msgSend_setClipsToBounds_(v14, v20, 1);
  v22 = (CLSNotificationBannerView *)objc_msgSend_initWithTitle_imageView_message_(self, v21, (uint64_t)v11, v14, v9);

  return v22;
}

- (CLSNotificationBannerView)initWithTitle:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = objc_msgSend_bundle(CLSNotificationBannerView, v8, v9);
  id v12 = objc_msgSend_imageNamed_inBundle_(MEMORY[0x263F1C6B0], v11, @"BannerIcon", v10);
  double v14 = (CLSNotificationBannerView *)objc_msgSend_initWithTitle_image_message_(self, v13, (uint64_t)v7, v12, v6);

  return v14;
}

- (void)applyConstraints
{
  v118[3] = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_imageView(self, a2, v2);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v4, v5, 0);

  id v8 = objc_msgSend_labelsStackView(self, v6, v7);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v8, v9, 0);

  id v10 = (void *)MEMORY[0x263F08938];
  double v13 = objc_msgSend_imageView(self, v11, v12);
  uint64_t v16 = objc_msgSend_topAnchor(v13, v14, v15);
  uint64_t v20 = objc_msgSend_topAnchor(self, v17, v18);
  v115 = v13;
  if (qword_268496238 != -1) {
    dispatch_once(&qword_268496238, &unk_26DF66890);
  }
  double v21 = 12.0;
  if (!byte_2684961E8) {
    double v21 = 11.0;
  }
  v118[0] = objc_msgSend_constraintEqualToAnchor_constant_(v16, v19, v20, v21);
  unint64_t v24 = objc_msgSend_imageView(self, v22, v23);
  v27 = objc_msgSend_leadingAnchor(v24, v25, v26);
  v31 = objc_msgSend_leadingAnchor(self, v28, v29);
  v111 = (void *)v20;
  objc_super v113 = v16;
  v107 = v24;
  v109 = (void *)v118[0];
  if (qword_268496238 != -1) {
    dispatch_once(&qword_268496238, &unk_26DF66890);
  }
  double v32 = 12.0;
  if (!byte_2684961E8) {
    double v32 = 11.0;
  }
  v33 = objc_msgSend_constraintEqualToAnchor_constant_(v27, v30, (uint64_t)v31, v32);
  v118[1] = v33;
  v36 = objc_msgSend_imageView(self, v34, v35);
  id v39 = objc_msgSend_centerYAnchor(v36, v37, v38);
  uint64_t v42 = objc_msgSend_centerYAnchor(self, v40, v41);
  v44 = objc_msgSend_constraintEqualToAnchor_(v39, v43, (uint64_t)v42);
  v118[2] = v44;
  v46 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v45, (uint64_t)v118, 3);
  objc_msgSend_activateConstraints_(v10, v47, (uint64_t)v46);

  v48 = (void *)MEMORY[0x263F08938];
  uint64_t v51 = objc_msgSend_labelsStackView(self, v49, v50);
  v54 = objc_msgSend_leadingAnchor(v51, v52, v53);
  v57 = objc_msgSend_imageView(self, v55, v56);
  uint64_t v61 = objc_msgSend_trailingAnchor(v57, v58, v59);
  uint64_t v106 = v48;
  if (qword_268496238 != -1) {
    dispatch_once(&qword_268496238, &unk_26DF66890);
  }
  double v62 = 12.0;
  if (!byte_2684961E8) {
    double v62 = 11.0;
  }
  uint64_t v63 = objc_msgSend_constraintEqualToAnchor_constant_(v54, v60, v61, v62);
  v117[0] = v63;
  v66 = objc_msgSend_labelsStackView(self, v64, v65);
  v69 = objc_msgSend_topAnchor(v66, v67, v68);
  uint64_t v73 = objc_msgSend_topAnchor(self, v70, v71);
  v114 = v54;
  v116 = v51;
  v112 = v57;
  v105 = v66;
  if (qword_268496238 != -1) {
    dispatch_once(&qword_268496238, &unk_26DF66890);
  }
  double v74 = 12.0;
  if (!byte_2684961E8) {
    double v74 = 15.0;
  }
  v103 = objc_msgSend_constraintEqualToAnchor_constant_(v69, v72, v73, v74);
  v117[1] = v103;
  v77 = objc_msgSend_labelsStackView(self, v75, v76);
  v80 = objc_msgSend_bottomAnchor(v77, v78, v79);
  v84 = objc_msgSend_bottomAnchor(self, v81, v82);
  v108 = (void *)v63;
  v110 = (void *)v61;
  uint64_t v104 = v69;
  if (qword_268496238 != -1) {
    dispatch_once(&qword_268496238, &unk_26DF66890);
  }
  double v85 = 12.0;
  if (!byte_2684961E8) {
    double v85 = 15.0;
  }
  uint64_t v86 = objc_msgSend_constraintEqualToAnchor_constant_(v80, v83, (uint64_t)v84, -v85);
  v117[2] = v86;
  v89 = objc_msgSend_labelsStackView(self, v87, v88);
  v92 = objc_msgSend_trailingAnchor(v89, v90, v91);
  double v96 = objc_msgSend_trailingAnchor(self, v93, v94);
  double v97 = (void *)v73;
  if (qword_268496238 != -1) {
    dispatch_once(&qword_268496238, &unk_26DF66890);
  }
  double v98 = 12.0;
  if (!byte_2684961E8) {
    double v98 = 15.0;
  }
  double v99 = objc_msgSend_constraintEqualToAnchor_constant_(v92, v95, (uint64_t)v96, -v98);
  v117[3] = v99;
  double v101 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v100, (uint64_t)v117, 4);
  objc_msgSend_activateConstraints_(v106, v102, (uint64_t)v101);
}

- (void)showWithCompletionHandler:(id)a3
{
  objc_msgSend_setCompletionHandler_(self, a2, (uint64_t)a3);

  MEMORY[0x270F9A6D0](CLSNotificationBannerWindow, sel_enqueBanner_, self);
}

- (void)hideBanner
{
  objc_msgSend_superview(self, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__hideBanner_quickly_(v5, v4, (uint64_t)self, 1);
}

- (void)callCompletionHandler
{
  objc_msgSend_completionHandler(self, a2, v2);
  id v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v5) {
    v5[2]();
  }
  objc_msgSend_setCompletionHandler_(self, v4, 0);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (UIStackView)labelsStackView
{
  return self->_labelsStackView;
}

- (void)setLabelsStackView:(id)a3
{
}

- (double)preferredWidthPad
{
  return self->_preferredWidthPad;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end