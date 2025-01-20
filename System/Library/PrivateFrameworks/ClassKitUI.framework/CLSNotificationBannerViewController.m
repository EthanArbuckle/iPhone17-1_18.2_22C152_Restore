@interface CLSNotificationBannerViewController
- (BOOL)bannerAnimating;
- (BOOL)bannerVisible;
- (BOOL)windowPointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGPoint)_hiddenBannerPosition:(CGSize)a3;
- (CGPoint)_visibleBannerCenterPosition:(CGSize)a3;
- (CLSNotificationBannerView)bannerView;
- (NSLayoutConstraint)bannerWidthConstraint;
- (NSLayoutConstraint)bannerYPositionConstraint;
- (double)bannerWidthForViewSize:(CGSize)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)addBannerView:(id)a3;
- (void)addConstraintsForBannerView;
- (void)handleWindowPan:(id)a3;
- (void)hideBannerQuickly:(BOOL)a3;
- (void)setBannerAnimating:(BOOL)a3;
- (void)setBannerView:(id)a3;
- (void)setBannerVisible:(BOOL)a3;
- (void)setBannerWidthConstraint:(id)a3;
- (void)setBannerYPositionConstraint:(id)a3;
- (void)showCurrentBanner;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CLSNotificationBannerViewController

- (BOOL)windowPointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v6 = objc_msgSend_view(self, a2, (uint64_t)a4, 0);
  v9 = objc_msgSend_subviews(v6, v7, v8);

  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v25, v29, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v17 = objc_msgSend_layer(v14, v15, v16);
          v20 = objc_msgSend_presentationLayer(v17, v18, v19);
          v23 = objc_msgSend_hitTest_(v20, v21, v22, x, y);

          if (v23)
          {
            LOBYTE(v11) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v15, (uint64_t)&v25, v29, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v11;
}

- (void)handleWindowPan:(id)a3
{
  id v13 = a3;
  if (objc_msgSend_bannerVisible(self, v4, v5))
  {
    uint64_t v8 = objc_msgSend_view(self, v6, v7);
    objc_msgSend_translationInView_(v13, v9, (uint64_t)v8);
    double v11 = v10;

    if (v11 < 0.0) {
      objc_msgSend_hideBannerQuickly_(self, v12, 1);
    }
  }
}

- (void)addBannerView:(id)a3
{
  id v24 = a3;
  v6 = objc_msgSend_bannerView(self, v4, v5);

  if (v6)
  {
    objc_msgSend_setBannerYPositionConstraint_(self, v7, 0);
    objc_msgSend_setBannerWidthConstraint_(self, v8, 0);
    double v11 = objc_msgSend_bannerView(self, v9, v10);
    objc_msgSend_removeFromSuperview(v11, v12, v13);

    objc_msgSend_setBannerView_(self, v14, 0);
  }
  objc_msgSend_setBannerView_(self, v7, (uint64_t)v24);
  v17 = objc_msgSend_view(self, v15, v16);
  v20 = objc_msgSend_bannerView(self, v18, v19);
  objc_msgSend_addSubview_(v17, v21, (uint64_t)v20);

  objc_msgSend_addConstraintsForBannerView(self, v22, v23);
}

- (void)showCurrentBanner
{
  v4 = objc_msgSend_bannerView(self, a2, v2);
  uint64_t v7 = objc_msgSend_view(self, v5, v6);
  uint64_t v10 = objc_msgSend_subviews(v7, v8, v9);
  char v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v4);

  if ((v12 & 1) == 0)
  {
    v15 = objc_msgSend_view(self, v13, v14);
    objc_msgSend_addSubview_(v15, v16, (uint64_t)v4);
  }
  objc_msgSend_setBannerAnimating_(self, v13, 1);
  objc_msgSend_setBannerVisible_(self, v17, 1);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = sub_22BFA40D0;
  v31[3] = &unk_264904E68;
  v31[4] = self;
  id v32 = v4;
  id v18 = v4;
  uint64_t v19 = (void *)MEMORY[0x230F5A980](v31);
  uint64_t v22 = objc_msgSend_view(self, v20, v21);
  objc_msgSend_layoutIfNeeded(v22, v23, v24);

  long long v25 = (void *)MEMORY[0x263F1CB60];
  id v29 = v19;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = sub_22BFA41D0;
  v30[3] = &unk_264904E40;
  v30[4] = self;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = sub_22BFA4218;
  v28[3] = &unk_264904E90;
  id v26 = v19;
  objc_msgSend_animateWithDuration_delay_options_animations_completion_(v25, v27, 38, v30, v28, 0.6, 0.0);
}

- (void)hideBannerQuickly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_msgSend_bannerView(self, a2, a3);
  objc_msgSend_setBannerAnimating_(self, v6, 1);
  objc_msgSend_setBannerVisible_(self, v7, 0);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_22BFA43E8;
  v24[3] = &unk_264904E68;
  v24[4] = self;
  id v8 = v5;
  id v25 = v8;
  uint64_t v9 = (void *)MEMORY[0x230F5A980](v24);
  char v12 = objc_msgSend_view(self, v10, v11);
  objc_msgSend_layoutIfNeeded(v12, v13, v14);

  v15 = (void *)MEMORY[0x263F1CB60];
  if (v3) {
    double v16 = 0.1;
  }
  else {
    double v16 = 0.3;
  }
  id v21 = v9;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_22BFA44EC;
  v22[3] = &unk_264904E68;
  v22[4] = self;
  id v23 = v8;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_22BFA457C;
  v20[3] = &unk_264904E90;
  id v17 = v9;
  id v18 = v8;
  objc_msgSend_animateWithDuration_delay_options_animations_completion_(v15, v19, 38, v22, v20, v16, 0.0);
}

- (unint64_t)supportedInterfaceOrientations
{
  v4 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], a2, v2);
  uint64_t v7 = sub_22BFA2228(v4, v5, v6);
  uint64_t v10 = objc_msgSend_view(self, v8, v9);
  uint64_t v13 = objc_msgSend_window(v10, v11, v12);
  if (v7 == (void *)v13)
  {
  }
  else
  {
    double v16 = (void *)v13;
    id v17 = objc_msgSend_rootViewController(v7, v14, v15);

    if (v17)
    {
      v20 = objc_msgSend_rootViewController(v7, v18, v19);
      unint64_t v23 = objc_msgSend_supportedInterfaceOrientations(v20, v21, v22);

      if (v23) {
        goto LABEL_11;
      }
    }
  }
  unint64_t v23 = objc_msgSend_supportedInterfaceOrientationsForWindow_(v4, v18, (uint64_t)v7);
  if (!v23)
  {
    id v26 = objc_msgSend_traitCollection(self, v24, v25);
    if (objc_msgSend_userInterfaceIdiom(v26, v27, v28)) {
      unint64_t v23 = 30;
    }
    else {
      unint64_t v23 = 26;
    }
  }
LABEL_11:

  return v23;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CLSNotificationBannerViewController;
  -[CLSNotificationBannerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  uint64_t v10 = objc_msgSend_bannerView(self, v8, v9);
  uint64_t v13 = objc_msgSend_superview(v10, v11, v12);

  if (v13)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_22BFA478C;
    v15[3] = &unk_264904EB8;
    v15[4] = self;
    *(double *)&v15[5] = width;
    *(double *)&v15[6] = height;
    objc_msgSend_animateAlongsideTransition_completion_(v7, v14, (uint64_t)v15, 0);
  }
}

- (double)bannerWidthForViewSize:(CGSize)a3
{
  double width = a3.width;
  if (qword_268496238 != -1) {
    dispatch_once(&qword_268496238, &unk_26DF66890);
  }
  if (byte_2684961E8)
  {
    uint64_t v6 = objc_msgSend_bannerView(self, a2, v3);
    objc_msgSend_preferredWidthPad(v6, v7, v8);
    double v10 = v9;

    if (width >= v10) {
      return v10;
    }
  }
  return width;
}

- (void)addConstraintsForBannerView
{
  v79[1] = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_view(self, a2, v2);
  objc_msgSend_bounds(v4, v5, v6);
  double v8 = v7;
  double v10 = v9;

  uint64_t v13 = objc_msgSend_bannerView(self, v11, v12);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v13, v14, 0);

  if (qword_268496238 != -1) {
    dispatch_once(&qword_268496238, &unk_26DF66890);
  }
  if (byte_2684961E8)
  {
    objc_msgSend_bannerWidthForViewSize_(self, v15, v16, v8, v10);
    double v18 = v17;
    uint64_t v19 = (void *)MEMORY[0x263F08938];
    uint64_t v22 = objc_msgSend_bannerView(self, v20, v21);
    uint64_t v24 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v19, v23, (uint64_t)v22, 7, 0, 0, 0, 1.0, v18);
    objc_msgSend_setBannerWidthConstraint_(self, v25, (uint64_t)v24);

    uint64_t v28 = objc_msgSend_bannerView(self, v26, v27);
    v31 = objc_msgSend_bannerWidthConstraint(self, v29, v30);
    objc_msgSend_addConstraint_(v28, v32, (uint64_t)v31);
  }
  else
  {
    uint64_t v28 = objc_msgSend_view(self, v15, v16);
    v33 = (void *)MEMORY[0x263F08938];
    v31 = objc_msgSend_bannerView(self, v34, v35);
    v38 = objc_msgSend_view(self, v36, v37);
    v40 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v33, v39, (uint64_t)v31, 7, 0, v38, 7, 1.0, 0.0);
    objc_msgSend_addConstraint_(v28, v41, (uint64_t)v40);
  }
  v44 = objc_msgSend_view(self, v42, v43);
  v45 = (void *)MEMORY[0x263F08938];
  v48 = objc_msgSend_bannerView(self, v46, v47);
  v51 = objc_msgSend_view(self, v49, v50);
  v53 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v45, v52, (uint64_t)v48, 9, 0, v51, 9, 1.0, 0.0);
  objc_msgSend_addConstraint_(v44, v54, (uint64_t)v53);

  v57 = objc_msgSend_bannerView(self, v55, v56);
  objc_msgSend_setAlpha_(v57, v58, v59, 0.0);

  v60 = (void *)MEMORY[0x263F08938];
  v63 = objc_msgSend_bannerView(self, v61, v62);
  v66 = objc_msgSend_topAnchor(v63, v64, v65);
  v69 = objc_msgSend_view(self, v67, v68);
  v73 = objc_msgSend_topAnchor(v69, v70, v71);
  if (qword_268496238 != -1) {
    dispatch_once(&qword_268496238, &unk_26DF66890);
  }
  double v74 = 12.0;
  if (!byte_2684961E8) {
    double v74 = 15.0;
  }
  v75 = objc_msgSend_constraintEqualToAnchor_constant_(v66, v72, (uint64_t)v73, v74);
  v79[0] = v75;
  v77 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v76, (uint64_t)v79, 1);
  objc_msgSend_activateConstraints_(v60, v78, (uint64_t)v77);
}

- (CGPoint)_hiddenBannerPosition:(CGSize)a3
{
  v4 = objc_msgSend_view(self, a2, v3, a3.width, a3.height);
  objc_msgSend_bounds(v4, v5, v6);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v21.origin.double x = v8;
  v21.origin.double y = v10;
  v21.size.double width = v12;
  v21.size.double height = v14;
  CGFloat MidX = CGRectGetMidX(v21);
  v22.origin.double x = v8;
  v22.origin.double y = v10;
  v22.size.double width = v12;
  v22.size.double height = v14;
  double MinY = CGRectGetMinY(v22);
  if (qword_268496238 != -1) {
    dispatch_once(&qword_268496238, &unk_26DF66890);
  }
  float v17 = 33.0;
  if (!byte_2684961E8) {
    float v17 = 32.0;
  }
  double v18 = MinY - floorf(v17);
  double v19 = MidX;
  result.double y = v18;
  result.double x = v19;
  return result;
}

- (CGPoint)_visibleBannerCenterPosition:(CGSize)a3
{
  v4 = objc_msgSend_view(self, a2, v3, a3.width, a3.height);
  objc_msgSend_bounds(v4, v5, v6);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  float v17 = objc_msgSend_windowScene((void *)qword_2684961F0, v15, v16);
  v20 = objc_msgSend_statusBarManager(v17, v18, v19);
  objc_msgSend_statusBarFrame(v20, v21, v22);
  double v24 = v23;
  double v26 = v25;

  v35.origin.double x = v8;
  v35.origin.double y = v10;
  v35.size.double width = v12;
  v35.size.double height = v14;
  CGFloat MidX = CGRectGetMidX(v35);
  v36.origin.double x = v8;
  v36.origin.double y = v10;
  v36.size.double width = v12;
  v36.size.double height = v14;
  double MinY = CGRectGetMinY(v36);
  if (qword_268496238 != -1) {
    dispatch_once(&qword_268496238, &unk_26DF66890);
  }
  float v29 = 33.0;
  if (!byte_2684961E8) {
    float v29 = 32.0;
  }
  double v30 = floorf(v29);
  if (byte_2684961E8) {
    double v30 = v30 + 16.0;
  }
  if (v24 >= v26) {
    double v31 = v26;
  }
  else {
    double v31 = v24;
  }
  double v32 = v31 + MinY + v30;
  double v33 = MidX;
  result.double y = v32;
  result.double x = v33;
  return result;
}

- (CLSNotificationBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
}

- (BOOL)bannerVisible
{
  return self->_bannerVisible;
}

- (void)setBannerVisible:(BOOL)a3
{
  self->_bannerVisible = a3;
}

- (BOOL)bannerAnimating
{
  return self->_bannerAnimating;
}

- (void)setBannerAnimating:(BOOL)a3
{
  self->_bannerAnimating = a3;
}

- (NSLayoutConstraint)bannerYPositionConstraint
{
  return self->_bannerYPositionConstraint;
}

- (void)setBannerYPositionConstraint:(id)a3
{
}

- (NSLayoutConstraint)bannerWidthConstraint
{
  return self->_bannerWidthConstraint;
}

- (void)setBannerWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_bannerYPositionConstraint, 0);

  objc_storeStrong((id *)&self->_bannerView, 0);
}

@end