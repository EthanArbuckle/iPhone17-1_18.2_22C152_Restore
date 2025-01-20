@interface NTKCParmesanPreviewViewController
+ (id)_KVOScrollViewKeys;
- (BOOL)didInteractWithCropView;
- (BOOL)displayDepthEffect;
- (CGSize)cutoutSize;
- (NTKCParmesanPreviewViewController)initWithPreviewProvider:(id)a3;
- (NTKCParmesanPreviewViewControllerDelegate)delegate;
- (NTKParmesanCropPreviewModel)currentPreview;
- (NTKParmesanPreviewProviding)previewProvider;
- (double)_heightForTimeSelectionItem;
- (double)_heightForTimeSelectionView;
- (id)_symbolForUsingDepthEffect:(BOOL)a3;
- (void)_cancelPressed;
- (void)_changePhotoPressed;
- (void)_didSelectPhotoForChangePhoto:(id)a3;
- (void)_donePressed;
- (void)_hideLoadingLabel;
- (void)_hideLoadingSpinner;
- (void)_loadInitialCropPreview;
- (void)_revertPressed;
- (void)_setCropValidationState:(unint64_t)a3 animated:(BOOL)a4;
- (void)_setPreview:(id)a3 animated:(BOOL)a4;
- (void)_setupCenteredViewWithPhoto:(id)a3 maskedPhoto:(id)a4;
- (void)_showLoadingLabel;
- (void)_showLoadingSpinner;
- (void)_toggleDepthEffectPressed;
- (void)_updateDoneButtonEnabledState;
- (void)_updateNavigationBarItems;
- (void)_updatePreviewForDepthEffect:(BOOL)a3;
- (void)_updateToolbarItems;
- (void)_validatePreview:(id)a3 withCrop:(CGRect)a4 animated:(BOOL)a5;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidSettleFromInteracting:(id)a3;
- (void)scrollViewWillBeginInteraction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidInteractWithCropView:(BOOL)a3;
- (void)setDisplayDepthEffect:(BOOL)a3;
- (void)setInitialPreviewState:(unint64_t)a3;
- (void)timeLayoutSelectionController:(id)a3 didChangeSelection:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NTKCParmesanPreviewViewController

+ (id)_KVOScrollViewKeys
{
  return &unk_26FB34F08;
}

- (NTKCParmesanPreviewViewController)initWithPreviewProvider:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NTKCParmesanPreviewViewController;
  v6 = [(NTKCParmesanPreviewViewController *)&v15 initWithNibName:0 bundle:0];
  v10 = v6;
  if (v6)
  {
    v11 = objc_msgSend_navigationItem(v6, v7, v8, v9);
    objc_msgSend_setHidesBackButton_(v11, v12, 1, v13);

    v10->_initialPreviewState = 0;
    objc_storeStrong((id *)&v10->_previewProvider, a3);
    v10->_cropValidationState = 0;
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend__KVOScrollViewKeys(NTKCParmesanPreviewViewController, a2, v2, v3);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_removeObserver_forKeyPath_context_(self->_scrollView, v8, (uint64_t)self, *(void *)(*((void *)&v13 + 1) + 8 * v11++), qword_2691D5D60);
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v9);
  }

  v12.receiver = self;
  v12.super_class = (Class)NTKCParmesanPreviewViewController;
  [(NTKCParmesanPreviewViewController *)&v12 dealloc];
}

- (void)viewDidLoad
{
  uint64_t v277 = *MEMORY[0x263EF8340];
  v275.receiver = self;
  v275.super_class = (Class)NTKCParmesanPreviewViewController;
  [(NTKCParmesanPreviewViewController *)&v275 viewDidLoad];
  v6 = objc_msgSend_navigationController(self, v3, v4, v5);
  objc_msgSend_setNavigationBarHidden_(v6, v7, 1, v8);

  objc_super v12 = objc_msgSend_navigationController(self, v9, v10, v11);
  objc_msgSend_setToolbarHidden_(v12, v13, 0, v14);

  uint64_t v18 = objc_msgSend_systemBlackColor(MEMORY[0x263F825C8], v15, v16, v17);
  v22 = objc_msgSend_view(self, v19, v20, v21);
  objc_msgSend_setBackgroundColor_(v22, v23, (uint64_t)v18, v24);

  v25 = (UIView *)objc_opt_new();
  infoContainer = self->_infoContainer;
  self->_infoContainer = v25;

  v27 = (UIView *)objc_opt_new();
  contentContainer = self->_contentContainer;
  self->_contentContainer = v27;

  v32 = objc_msgSend_view(self, v29, v30, v31);
  objc_msgSend_addSubview_(v32, v33, (uint64_t)self->_contentContainer, v34);

  v38 = objc_msgSend_view(self, v35, v36, v37);
  objc_msgSend_addSubview_(v38, v39, (uint64_t)self->_infoContainer, v40);

  objc_msgSend_setUserInteractionEnabled_(self->_infoContainer, v41, 0, v42);
  v46 = objc_msgSend_view(self, v43, v44, v45);
  objc_msgSend_bounds(v46, v47, v48, v49);
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;

  id v58 = objc_alloc(MEMORY[0x263F57950]);
  v62 = (NTKCCenteringScrollView *)objc_msgSend_initWithFrame_(v58, v59, v60, v61, v51, v53, v55, v57);
  scrollView = self->_scrollView;
  self->_scrollView = v62;

  objc_msgSend_setNtk_delegate_(self->_scrollView, v64, (uint64_t)self, v65);
  objc_msgSend_setMinimumZoomScale_(self->_scrollView, v66, v67, v68, 0.1);
  objc_msgSend_setClipsToBounds_(self->_scrollView, v69, 0, v70);
  objc_msgSend_setIsAccessibilityElement_(self->_scrollView, v71, 1, v72);
  objc_msgSend_setAccessibilityTraits_(self->_scrollView, v73, *MEMORY[0x263F832C8], v74);
  v76 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v75, @"PARMESAN_AX_CROP_AREA_LABEL", @"Accessibility label for crop area when editing layout.");
  objc_msgSend_setAccessibilityLabel_(self->_scrollView, v77, (uint64_t)v76, v78);

  v80 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v79, @"PARMESAN_AX_CROP_AREA_HINT", @"Accessibility hint for crop area when editing layout.");
  objc_msgSend_setAccessibilityHint_(self->_scrollView, v81, (uint64_t)v80, v82);

  long long v273 = 0u;
  long long v274 = 0u;
  long long v271 = 0u;
  long long v272 = 0u;
  v86 = objc_msgSend__KVOScrollViewKeys(NTKCParmesanPreviewViewController, v83, v84, v85, 0);
  uint64_t v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(v86, v87, (uint64_t)&v271, (uint64_t)v276, 16);
  if (v88)
  {
    uint64_t v90 = v88;
    uint64_t v91 = *(void *)v272;
    do
    {
      for (uint64_t i = 0; i != v90; ++i)
      {
        if (*(void *)v272 != v91) {
          objc_enumerationMutation(v86);
        }
        objc_msgSend_addObserver_forKeyPath_options_context_(self->_scrollView, v89, (uint64_t)self, *(void *)(*((void *)&v271 + 1) + 8 * i), 0, qword_2691D5D60);
      }
      uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v86, v89, (uint64_t)&v271, (uint64_t)v276, 16);
    }
    while (v90);
  }

  v93 = [_NTKCParmesanOverlayScrollView alloc];
  v97 = (NTKCCenteringScrollView *)objc_msgSend_initWithFrame_(v93, v94, v95, v96, v51, v53, v55, v57);
  overlayScrollView = self->_overlayScrollView;
  self->_overlayScrollView = v97;

  v102 = objc_msgSend_clearColor(MEMORY[0x263F825C8], v99, v100, v101);
  objc_msgSend_setBackgroundColor_(self->_overlayScrollView, v103, (uint64_t)v102, v104);

  objc_msgSend_setUserInteractionEnabled_(self->_overlayScrollView, v105, 0, v106);
  if (objc_msgSend_Parmesan_canCrop(self->_previewProvider, v107, v108, v109))
  {
    objc_msgSend_Parmesan_minimumNormalizedCropSize(self->_previewProvider, v110, v111, v112);
    double v117 = 1.0 / v116;
    double v119 = 1.0 / v118;
    if (v117 >= v119) {
      double v117 = v119;
    }
    objc_msgSend_setMaximumZoomRatio_(self->_scrollView, v113, v114, v115, v117);
    objc_msgSend_maximumZoomRatio(self->_scrollView, v120, v121, v122);
    objc_msgSend_setMaximumZoomRatio_(self->_overlayScrollView, v123, v124, v125);
  }
  else
  {
    objc_msgSend_setMaximumZoomRatio_(self->_scrollView, v110, v111, v112, 1.0);
    objc_msgSend_maximumZoomRatio(self->_scrollView, v128, v129, v130);
    objc_msgSend_setMaximumZoomRatio_(self->_overlayScrollView, v131, v132, v133);
    objc_msgSend_setScrollEnabled_(self->_scrollView, v134, 0, v135);
    v139 = objc_msgSend_leadingButton(self->_navigationBar, v136, v137, v138);
    objc_msgSend_setEnabled_(v139, v140, 0, v141);
  }
  objc_msgSend_addSubview_(self->_contentContainer, v126, (uint64_t)self->_scrollView, v127);
  objc_msgSend__loadInitialCropPreview(self, v142, v143, v144);
  v145 = (UIView *)objc_opt_new();
  timeContainer = self->_timeContainer;
  self->_timeContainer = v145;

  objc_msgSend_setUserInteractionEnabled_(self->_timeContainer, v147, 0, v148);
  objc_msgSend_setAccessibilityElementsHidden_(self->_timeContainer, v149, 1, v150);
  objc_msgSend_addSubview_(self->_contentContainer, v151, (uint64_t)self->_timeContainer, v152);
  v153 = [NTKParmesanTimeLayout alloc];
  v155 = objc_msgSend_initWithAlignment_scale_(v153, v154, 1, 3);
  v156 = [NTKParmesanTimeView alloc];
  double v157 = *MEMORY[0x263F001A8];
  double v158 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v159 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v160 = *(double *)(MEMORY[0x263F001A8] + 24);
  v163 = (NTKParmesanTimeView *)objc_msgSend_initWithFrame_layout_(v156, v161, (uint64_t)v155, v162, *MEMORY[0x263F001A8], v158, v159, v160);
  time = self->_time;
  self->_time = v163;

  v165 = self->_time;
  v169 = objc_msgSend_faceDate(MEMORY[0x263F579B0], v166, v167, v168);
  objc_msgSend_setOverrideDate_duration_(v165, v170, (uint64_t)v169, v171, 0.0);

  objc_msgSend_setHidden_(self->_time, v172, 1, v173);
  objc_msgSend_addSubview_(self->_timeContainer, v174, (uint64_t)self->_time, v175);
  objc_msgSend_insertSubview_aboveSubview_(self->_contentContainer, v176, (uint64_t)self->_overlayScrollView, (uint64_t)self->_timeContainer);
  objc_msgSend_layer(MEMORY[0x263F15880], v177, v178, v179);
  v180 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  mask = self->_mask;
  self->_mask = v180;

  objc_msgSend_setFillRule_(self->_mask, v182, *MEMORY[0x263F15AC0], v183);
  objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F825C8], v184, v185, v186, 0.0, 0.6);
  id v187 = objc_claimAutoreleasedReturnValue();
  uint64_t v191 = objc_msgSend_CGColor(v187, v188, v189, v190);
  objc_msgSend_setFillColor_(self->_mask, v192, v191, v193);

  v197 = objc_msgSend_layer(self->_contentContainer, v194, v195, v196);
  objc_msgSend_addSublayer_(v197, v198, (uint64_t)self->_mask, v199);

  v200 = (UIView *)objc_opt_new();
  placementGuideContainer = self->_placementGuideContainer;
  self->_placementGuideContainer = v200;

  objc_msgSend_setAlpha_(self->_placementGuideContainer, v202, v203, v204, 0.0);
  objc_msgSend_setUserInteractionEnabled_(self->_placementGuideContainer, v205, 0, v206);
  objc_msgSend_addSubview_(self->_infoContainer, v207, (uint64_t)self->_placementGuideContainer, v208);
  v209 = (UILabel *)objc_opt_new();
  placementGuideLabel = self->_placementGuideLabel;
  self->_placementGuideLabel = v209;

  v214 = objc_msgSend_systemFontOfSize_weight_(MEMORY[0x263F81708], v211, v212, v213, 16.0, *MEMORY[0x263F81838]);
  objc_msgSend_setFont_(self->_placementGuideLabel, v215, (uint64_t)v214, v216);

  objc_msgSend_setTextAlignment_(self->_placementGuideLabel, v217, 1, v218);
  v220 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v219, @"MANUAL_LAYOUT_PLACEMENT_GUIDE_INVALID", (uint64_t)&stru_26FB23210);
  objc_msgSend_setText_(self->_placementGuideLabel, v221, (uint64_t)v220, v222);

  v226 = objc_msgSend_systemRedColor(MEMORY[0x263F825C8], v223, v224, v225);
  objc_msgSend_setTextColor_(self->_placementGuideLabel, v227, (uint64_t)v226, v228);

  objc_msgSend_addSubview_(self->_placementGuideContainer, v229, (uint64_t)self->_placementGuideLabel, v230);
  v231 = [NTKParmesanEditorNavigationBar alloc];
  v235 = (NTKParmesanEditorNavigationBar *)objc_msgSend_initWithFrame_(v231, v232, v233, v234, v157, v158, v159, v160);
  navigationBar = self->_navigationBar;
  self->_navigationBar = v235;

  v240 = objc_msgSend_view(self, v237, v238, v239);
  objc_msgSend_addSubview_(v240, v241, (uint64_t)self->_navigationBar, v242);

  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->_navigationBar, v243, 0, v244);
  objc_msgSend_constrainToSuperviewWithEdges_insets_useLayoutMargins_(self->_navigationBar, v245, 11, 0, *MEMORY[0x263F82250], *(double *)(MEMORY[0x263F82250] + 8), *(double *)(MEMORY[0x263F82250] + 16), *(double *)(MEMORY[0x263F82250] + 24));
  v247 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v246, @"MANUAL_LAYOUT_TITLE", @"Title for manual layout page.");
  v251 = objc_msgSend_titleLabel(self->_navigationBar, v248, v249, v250);
  objc_msgSend_setText_(v251, v252, (uint64_t)v247, v253);

  v255 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v254, @"MANUAL_LAYOUT_INSTRUCTIONS", @"Instructive text shown under the title during manual layout.");
  v259 = objc_msgSend_descriptionLabel(self->_navigationBar, v256, v257, v258);
  objc_msgSend_setText_(v259, v260, (uint64_t)v255, v261);

  objc_msgSend__updateNavigationBarItems(self, v262, v263, v264);
  objc_msgSend__updateDoneButtonEnabledState(self, v265, v266, v267);
  objc_msgSend__updateToolbarItems(self, v268, v269, v270);
}

- (void)_updateNavigationBarItems
{
  int isRevertable = objc_msgSend_isRevertable(self->_currentPreview, a2, v2, v3);
  char v9 = objc_msgSend_didInteractWithCropView(self, v6, v7, v8);
  long long v13 = objc_msgSend_trailingButton(self->_navigationBar, v10, v11, v12);
  objc_msgSend_removeTarget_action_forControlEvents_(v13, v14, 0, 0, 64);

  v19 = objc_msgSend_trailingButton(self->_navigationBar, v15, v16, v17);
  if ((v9 & 1) != 0 || !isRevertable)
  {
    v33 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v18, @"MANUAL_LAYOUT_SAVE_BUTTON", @"Title for saving the photo layout.");
    objc_msgSend_setTitle_forState_(v19, v34, (uint64_t)v33, 0);

    v25 = objc_msgSend_trailingButton(self->_navigationBar, v35, v36, v37);
    v29 = objc_msgSend_tintColor(MEMORY[0x263F825C8], v38, v39, v40);
    objc_msgSend_setTintColor_(v25, v41, (uint64_t)v29, v42);
    v32 = &selRef__donePressed;
  }
  else
  {
    uint64_t v20 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v18, @"MANUAL_LAYOUT_REVERT_BUTTON", @"Title for reverting back to original layout.");
    objc_msgSend_setTitle_forState_(v19, v21, (uint64_t)v20, 0);

    v25 = objc_msgSend_trailingButton(self->_navigationBar, v22, v23, v24);
    v29 = objc_msgSend_systemRedColor(MEMORY[0x263F825C8], v26, v27, v28);
    objc_msgSend_setTintColor_(v25, v30, (uint64_t)v29, v31);
    v32 = &selRef__revertPressed;
  }

  v46 = objc_msgSend_trailingButton(self->_navigationBar, v43, v44, v45);
  objc_msgSend_addTarget_action_forControlEvents_(v46, v47, (uint64_t)self, (uint64_t)*v32, 64);

  double v51 = objc_msgSend_leadingButton(self->_navigationBar, v48, v49, v50);
  double v53 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v52, @"MANUAL_LAYOUT_CANCEL_BUTTON", @"Button for discarding layout changes.");
  objc_msgSend_setTitle_forState_(v51, v54, (uint64_t)v53, 0);

  id v58 = objc_msgSend_leadingButton(self->_navigationBar, v55, v56, v57);
  v62 = objc_msgSend_allTargets(v58, v59, v60, v61);
  char v65 = objc_msgSend_containsObject_(v62, v63, (uint64_t)self, v64);

  if ((v65 & 1) == 0)
  {
    v69 = objc_msgSend_leadingButton(self->_navigationBar, v66, v67, v68);
    objc_msgSend_addTarget_action_forControlEvents_(v69, v70, (uint64_t)self, (uint64_t)sel__cancelPressed, 64);
  }
  objc_msgSend_leadingButton(self->_navigationBar, v66, v67, v68);
  id v77 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t canCrop = objc_msgSend_Parmesan_canCrop(self->_previewProvider, v71, v72, v73);
  objc_msgSend_setEnabled_(v77, v75, canCrop, v76);
}

- (void)_updateToolbarItems
{
  v34[3] = *MEMORY[0x263EF8340];
  if (objc_msgSend_Parmesan_canAddPhotoAssets(self->_previewProvider, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_maskedPhoto(self->_currentPreview, v5, v6, v7);

    if (v8)
    {
      uint64_t v11 = objc_msgSend__symbolForUsingDepthEffect_(self, v9, self->_displayDepthEffect, v10);
      uint64_t v14 = objc_msgSend_systemImageNamed_(MEMORY[0x263F827E8], v12, (uint64_t)v11, v13);
      id v15 = objc_alloc(MEMORY[0x263F824A8]);
      uint64_t v18 = objc_msgSend_initWithImage_style_target_action_(v15, v16, (uint64_t)v14, 0, self, sel__toggleDepthEffectPressed);
      if (self->_displayDepthEffect) {
        objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v17, @"PARMESAN_AX_DEPTH_EFFECT_ON", @"Accessibility label for depth effect on icon.");
      }
      else {
      uint64_t v21 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v17, @"PARMESAN_AX_DEPTH_EFFECT_OFF", @"Accessibility label for depth effect off icon.");
      }
      objc_msgSend_setAccessibilityLabel_(v14, v22, (uint64_t)v21, v23);

      uint64_t v27 = objc_msgSend_flexibleSpaceItem(MEMORY[0x263F824A8], v24, v25, v26);
      uint64_t v31 = objc_msgSend_flexibleSpaceItem(MEMORY[0x263F824A8], v28, v29, v30, v27, v18);
      v34[2] = v31;
      uint64_t v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v32, (uint64_t)v34, 3);

      objc_msgSend_setToolbarItems_animated_(self, v33, (uint64_t)v20, 0);
    }
    else
    {
      uint64_t v20 = 0;
      objc_msgSend_setToolbarItems_animated_(self, v9, 0, 0);
    }
  }
  else
  {
    uint64_t v19 = MEMORY[0x263EFFA68];
    objc_msgSend_setToolbarItems_animated_(self, v5, v19, 0);
  }
}

- (void)viewDidLayoutSubviews
{
  v200.receiver = self;
  v200.super_class = (Class)NTKCParmesanPreviewViewController;
  [(NTKCParmesanPreviewViewController *)&v200 viewDidLayoutSubviews];
  uint64_t v6 = objc_msgSend_view(self, v3, v4, v5);
  objc_msgSend_bounds(v6, v7, v8, v9);
  objc_msgSend_setFrame_(self->_infoContainer, v10, v11, v12);

  uint64_t v16 = objc_msgSend_view(self, v13, v14, v15);
  objc_msgSend_bounds(v16, v17, v18, v19);
  objc_msgSend_setFrame_(self->_contentContainer, v20, v21, v22);

  objc_msgSend_frame(self->_navigationBar, v23, v24, v25);
  double MaxY = CGRectGetMaxY(v201);
  objc_msgSend__heightForTimeSelectionView(self, v26, v27, v28);
  double v30 = v29;
  uint64_t v34 = objc_msgSend_previewProvider(self, v31, v32, v33);
  objc_msgSend_Parmesan_screenBounds(v34, v35, v36, v37);
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;

  uint64_t v49 = objc_msgSend_previewProvider(self, v46, v47, v48);
  objc_msgSend_Parmesan_screenCornerRadius(v49, v50, v51, v52);
  double v196 = v53;

  objc_msgSend_cutoutSize(self, v54, v55, v56);
  double v58 = v57;
  double v60 = v59;
  v202.origin.x = v39;
  v202.origin.y = v41;
  v202.size.width = v43;
  v202.size.height = v45;
  double v61 = v58 / CGRectGetWidth(v202);
  v203.origin.x = v39;
  v203.origin.y = v41;
  v203.size.width = v43;
  v203.size.height = v45;
  double v65 = v60 / CGRectGetHeight(v203);
  if (v61 >= v65) {
    double v65 = v61;
  }
  self->_timeContainerScale = v65;
  v66 = objc_msgSend_view(self, v62, v63, v64);
  objc_msgSend_bounds(v66, v67, v68, v69);
  double v71 = v70;
  v75 = objc_msgSend_view(self, v72, v73, v74);
  objc_msgSend_safeAreaInsets(v75, v76, v77, v78);
  double v80 = v71 - v79 - v30;
  objc_msgSend_frame(self->_navigationBar, v81, v82, v83);
  double v84 = v80 - CGRectGetMaxY(v204);

  uint64_t v88 = objc_msgSend_view(self, v85, v86, v87);
  objc_msgSend_bounds(v88, v89, v90, v91);
  double v93 = v92;

  objc_msgSend_setFrame_(self->_scrollView, v94, v95, v96, 0.0, MaxY, v93, v84);
  double v97 = *MEMORY[0x263F834E8];
  double v98 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v100 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v99 = *(double *)(MEMORY[0x263F834E8] + 24);
  objc_msgSend_setContentInset_(self->_scrollView, v101, v102, v103, *MEMORY[0x263F834E8], v98, v100, v99);
  objc_msgSend_setFrame_(self->_overlayScrollView, v104, v105, v106, 0.0, MaxY, v93, v84);
  objc_msgSend_setContentInset_(self->_overlayScrollView, v107, v108, v109, v97, v98, v100, v99);
  double v110 = v84;
  UIRectCenteredIntegralRectScale();
  double v112 = v111;
  double v114 = v113;
  double v116 = v115;
  double v118 = v117;
  uint64_t v122 = objc_msgSend_view(self, v119, v120, v121, 0);
  objc_msgSend_bounds(v122, v123, v124, v125);
  double v127 = v126;
  v131 = objc_msgSend_view(self, v128, v129, v130);
  objc_msgSend_bounds(v131, v132, v133, v134);
  objc_msgSend_setFrame_(self->_mask, v135, v136, v137, 0.0, 0.0, v127);

  uint64_t v138 = (void *)MEMORY[0x263F824C0];
  objc_msgSend_frame(self->_mask, v139, v140, v141);
  v145 = objc_msgSend_bezierPathWithRect_(v138, v142, v143, v144);
  v149 = objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(MEMORY[0x263F824C0], v146, v147, v148, v112, v114, v116, v118, v196);
  objc_msgSend_appendPath_(v145, v150, (uint64_t)v149, v151);

  id v152 = v145;
  uint64_t v156 = objc_msgSend_CGPath(v152, v153, v154, v155);
  objc_msgSend_setPath_(self->_mask, v157, v156, v158);
  objc_msgSend_view(self, v159, v160, v161);
  uint64_t v162 = (UIView *)objc_claimAutoreleasedReturnValue();
  v205.origin.x = v112;
  v205.origin.y = v114;
  v205.size.width = v116;
  v205.size.height = v118;
  CGRect v206 = UIAccessibilityConvertFrameToScreenCoordinates(v205, v162);
  objc_msgSend_setAccessibilityFrame_(self->_scrollView, v163, v164, v165, v206.origin.x, v206.origin.y, v206.size.width, v206.size.height);

  timeContainer = self->_timeContainer;
  long long v167 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v199[0] = *MEMORY[0x263F000D0];
  v199[1] = v167;
  v199[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  objc_msgSend_setTransform_(timeContainer, v168, (uint64_t)v199, v169);
  UIRectCenteredIntegralRectScale();
  objc_msgSend_setFrame_(self->_timeContainer, v170, v171, v172, 0);
  CGAffineTransformMakeScale(&v198, self->_timeContainerScale, self->_timeContainerScale);
  uint64_t v173 = self->_timeContainer;
  CGAffineTransform v197 = v198;
  objc_msgSend_setTransform_(v173, v174, (uint64_t)&v197, v175);
  objc_msgSend_bounds(self->_timeContainer, v176, v177, v178);
  objc_msgSend_setFrame_(self->_time, v179, v180, v181);
  objc_msgSend_setMinimumDisplaySize_withCropRectCushion_(self->_scrollView, v182, v183, v184, v116, v118, *MEMORY[0x263F5DE98]);
  objc_msgSend_setFrame_(self->_placementGuideContainer, v185, v186, v187, 0.0, MaxY, v93, v110);
  objc_msgSend_frame(self->_navigationBar, v188, v189, v190);
  CGFloat v191 = CGRectGetMaxY(v207);
  objc_msgSend_setFrame_(self->_placementGuideLabel, v192, v193, v194, 0.0, 0.0, v93, v114 - v191);
}

- (CGSize)cutoutSize
{
  uint64_t v5 = objc_msgSend_previewProvider(self, a2, v2, v3);
  objc_msgSend_Parmesan_screenBounds(v5, v6, v7, v8);
  double v10 = v9;
  double v12 = v11;

  uint64_t v16 = objc_msgSend_view(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_window(v16, v17, v18, v19);
  objc_msgSend_bounds(v20, v21, v22, v23);
  double v25 = v24;

  double v26 = v25 * 0.26;
  double v27 = v10 / v12 * (v25 * 0.26);
  result.height = v26;
  result.width = v27;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCParmesanPreviewViewController;
  [(NTKCParmesanPreviewViewController *)&v3 viewWillAppear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NTKCParmesanPreviewViewController;
  [(NTKCParmesanPreviewViewController *)&v10 viewDidDisappear:a3];
  uint64_t v7 = objc_msgSend_delegate(self, v4, v5, v6);
  objc_msgSend_ParmesanPreviewViewControllerDidDismiss_(v7, v8, (uint64_t)self, v9);
}

- (void)_loadInitialCropPreview
{
  objc_msgSend_setInitialPreviewState_(self, a2, 1, v2);
  objc_initWeak(&location, self);
  previewProvider = self->_previewProvider;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_246B5893C;
  v7[3] = &unk_2651FB958;
  objc_copyWeak(&v8, &location);
  objc_msgSend_Parmesan_getPreviewWithCompletion_(previewProvider, v5, (uint64_t)v7, v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)setInitialPreviewState:(unint64_t)a3
{
  self->_initialPreviewState = a3;
  if (a3 == 3)
  {
    objc_msgSend__hideLoadingSpinner(self, a2, 3, v3);
    objc_msgSend__hideLoadingLabel(self, v17, v18, v19);
LABEL_6:
    objc_msgSend__updateNavigationBarItems(self, v14, v15, v16);
    return;
  }
  if (a3 != 2)
  {
    if (a3 != 1) {
      return;
    }
    uint64_t v5 = objc_msgSend_trailingButton(self->_navigationBar, a2, 1, v3);
    objc_msgSend_setEnabled_(v5, v6, 0, v7);

    objc_msgSend__showLoadingLabel(self, v8, v9, v10);
    objc_msgSend__showLoadingSpinner(self, v11, v12, v13);
    goto LABEL_6;
  }
  objc_msgSend__hideLoadingSpinner(self, a2, 2, v3);
  objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v20, @"MANUAL_LAYOUT_LOADING_IMAGE_ERROR_MESSAGE", @"Something went wrong.");
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setText_(self->_loadingLabel, v21, (uint64_t)v23, v22);
}

- (void)_showLoadingSpinner
{
  if (!self->_loadingSpinner)
  {
    id v3 = objc_alloc(MEMORY[0x263F823E8]);
    uint64_t v6 = (UIActivityIndicatorView *)objc_msgSend_initWithActivityIndicatorStyle_(v3, v4, 100, v5);
    loadingSpinner = self->_loadingSpinner;
    self->_loadingSpinner = v6;

    objc_msgSend_startAnimating(self->_loadingSpinner, v8, v9, v10);
  }
  id v11 = objc_alloc(MEMORY[0x263F824A8]);
  id v20 = (id)objc_msgSend_initWithCustomView_(v11, v12, (uint64_t)self->_loadingSpinner, v13);
  uint64_t v17 = objc_msgSend_navigationItem(self, v14, v15, v16);
  objc_msgSend_setRightBarButtonItem_(v17, v18, (uint64_t)v20, v19);
}

- (void)_hideLoadingSpinner
{
  uint64_t v5 = objc_msgSend_navigationItem(self, a2, v2, v3);
  objc_msgSend_setRightBarButtonItem_(v5, v6, 0, v7);

  objc_msgSend_stopAnimating(self->_loadingSpinner, v8, v9, v10);
  loadingSpinner = self->_loadingSpinner;
  self->_loadingSpinner = 0;
}

- (void)_showLoadingLabel
{
  v157[2] = *MEMORY[0x263EF8340];
  if (!self->_loadingView)
  {
    objc_msgSend_cutoutSize(self, a2, v2, v3);
    id v8 = objc_msgSend_view(self, v5, v6, v7);
    objc_msgSend_bounds(v8, v9, v10, v11);
    UIRectCenteredIntegralRectScale();
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    id v23 = objc_msgSend_navigationController(self, v20, v21, v22, 0);
    double v27 = objc_msgSend_view(v23, v24, v25, v26);
    objc_msgSend_safeAreaInsets(v27, v28, v29, v30);
    double v32 = v31;
    uint64_t v36 = objc_msgSend_navigationController(self, v33, v34, v35);
    double v40 = objc_msgSend_view(v36, v37, v38, v39);
    objc_msgSend_safeAreaInsets(v40, v41, v42, v43);
    CGFloat v45 = v32 - v44;

    v158.origin.double x = v13;
    v158.origin.double y = v15;
    v158.size.double width = v17;
    v158.size.double height = v19;
    CGRect v159 = CGRectOffset(v158, 0.0, v45);
    double x = v159.origin.x;
    double y = v159.origin.y;
    double width = v159.size.width;
    double height = v159.size.height;
    id v50 = objc_alloc(MEMORY[0x263F828E0]);
    double v54 = (UILabel *)objc_msgSend_initWithFrame_(v50, v51, v52, v53, x, y, width, height);
    loadingLabel = self->_loadingLabel;
    self->_loadingLabel = v54;

    double v58 = objc_msgSend_preferredFontForTextStyle_(MEMORY[0x263F81708], v56, *MEMORY[0x263F83570], v57);
    objc_msgSend_setFont_(self->_loadingLabel, v59, (uint64_t)v58, v60);

    v62 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v61, @"MANUAL_LAYOUT_LOADING_IMAGE_MESSAGE", @"Loading Image...");
    objc_msgSend_setText_(self->_loadingLabel, v63, (uint64_t)v62, v64);

    objc_msgSend_setTextAlignment_(self->_loadingLabel, v65, 1, v66);
    double v70 = objc_msgSend_secondaryLabelColor(MEMORY[0x263F825C8], v67, v68, v69);
    objc_msgSend_setTextColor_(self->_loadingLabel, v71, (uint64_t)v70, v72);

    id v73 = objc_alloc(MEMORY[0x263F823E8]);
    uint64_t v155 = objc_msgSend_initWithActivityIndicatorStyle_(v73, v74, 100, v75);
    id v76 = objc_alloc(MEMORY[0x263F82BF8]);
    v157[0] = self->_loadingLabel;
    v157[1] = v155;
    uint64_t v78 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v77, (uint64_t)v157, 2);
    v81 = (UIView *)objc_msgSend_initWithArrangedSubviews_(v76, v79, (uint64_t)v78, v80);

    loadingView = self->_loadingView;
    self->_loadingView = v81;
    uint64_t v83 = v81;

    objc_msgSend_setAxis_(v83, v84, 1, v85);
    objc_msgSend_setAlignment_(v83, v86, 3, v87);
    objc_msgSend_setSpacing_(v83, v88, v89, v90, 8.0);
    objc_msgSend_addSubview_(self->_infoContainer, v91, (uint64_t)self->_loadingView, v92);
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->_loadingView, v93, 0, v94);
    uint64_t v148 = (void *)MEMORY[0x263F08938];
    uint64_t v154 = objc_msgSend_centerYAnchor(self->_loadingView, v95, v96, v97);
    v153 = objc_msgSend_centerYAnchor(self->_infoContainer, v98, v99, v100);
    id v152 = objc_msgSend_constraintEqualToAnchor_(v154, v101, (uint64_t)v153, v102);
    v156[0] = v152;
    uint64_t v151 = objc_msgSend_centerXAnchor(self->_loadingView, v103, v104, v105);
    uint64_t v150 = objc_msgSend_centerXAnchor(self->_infoContainer, v106, v107, v108);
    v149 = objc_msgSend_constraintEqualToAnchor_(v151, v109, (uint64_t)v150, v110);
    v156[1] = v149;
    double v114 = objc_msgSend_widthAnchor(self->_loadingView, v111, v112, v113);
    double v118 = objc_msgSend_safeAreaLayoutGuide(self->_infoContainer, v115, v116, v117);
    uint64_t v122 = objc_msgSend_widthAnchor(v118, v119, v120, v121);
    uint64_t v125 = objc_msgSend_constraintLessThanOrEqualToAnchor_(v114, v123, (uint64_t)v122, v124);
    v156[2] = v125;
    uint64_t v129 = objc_msgSend_heightAnchor(self->_loadingView, v126, v127, v128);
    uint64_t v133 = objc_msgSend_safeAreaLayoutGuide(self->_infoContainer, v130, v131, v132);
    uint64_t v137 = objc_msgSend_heightAnchor(v133, v134, v135, v136);
    uint64_t v140 = objc_msgSend_constraintLessThanOrEqualToAnchor_(v129, v138, (uint64_t)v137, v139);
    v156[3] = v140;
    v142 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v141, (uint64_t)v156, 4);
    objc_msgSend_activateConstraints_(v148, v143, (uint64_t)v142, v144);

    objc_msgSend_startAnimating(v155, v145, v146, v147);
  }
}

- (void)_hideLoadingLabel
{
  objc_msgSend_removeFromSuperview(self->_loadingView, a2, v2, v3);
  loadingView = self->_loadingView;
  self->_loadingView = 0;
}

- (void)_setupCenteredViewWithPhoto:(id)a3 maskedPhoto:(id)a4
{
  v167[3] = *MEMORY[0x263EF8340];
  uint64_t v7 = (UIImage *)a3;
  id v8 = (UIImage *)a4;
  double v12 = v8;
  BOOL v13 = self->_currentBackgroundImage != v7 || self->_currentForegroundImage != v8;
  double v14 = objc_msgSend_centeredView(self->_scrollView, v9, v10, v11);

  if (v13)
  {
    objc_storeStrong((id *)&self->_currentBackgroundImage, a3);
    objc_storeStrong((id *)&self->_currentForegroundImage, a4);
    id v18 = objc_alloc(MEMORY[0x263F82828]);
    uint64_t v21 = objc_msgSend_initWithImage_(v18, v19, (uint64_t)v7, v20);
    objc_msgSend_setCenteredView_(self->_scrollView, v22, (uint64_t)v21, v23);

    objc_msgSend_setHidden_(self->_overlayScrollView, v24, v12 == 0, v25);
    if (v12)
    {
      id v26 = objc_alloc(MEMORY[0x263F82828]);
      uint64_t v29 = objc_msgSend_initWithImage_(v26, v27, (uint64_t)v12, v28);
      objc_msgSend_setCenteredView_(self->_overlayScrollView, v30, (uint64_t)v29, v31);
    }
  }
  if (!v14)
  {
    objc_msgSend_Parmesan_screenBounds(self->_previewProvider, v15, v16, v17);
    double v33 = v32;
    double v35 = v34;
    objc_msgSend_Parmesan_screenCornerRadius(self->_previewProvider, v36, v37, v38);
    double v40 = v39;
    objc_msgSend__heightForTimeSelectionItem(self, v41, v42, v43);
    double v45 = v44;
    v46 = [NTKParmesanTimeLayoutSelectionViewController alloc];
    id v50 = objc_msgSend_allLayouts(NTKParmesanTimeLayout, v47, v48, v49);
    uint64_t v53 = (NTKParmesanTimeLayoutSelectionViewController *)objc_msgSend_initWithLayoutOptions_itemHeight_deviceSize_deviceScreenRadius_(v46, v51, (uint64_t)v50, v52, v45, v33, v35, v40);

    double v54 = BPSBridgeTintColor();
    double v58 = objc_msgSend_view(v53, v55, v56, v57);
    objc_msgSend_setTintColor_(v58, v59, (uint64_t)v54, v60);

    objc_msgSend_addChildViewController_(self, v61, (uint64_t)v53, v62);
    uint64_t v66 = objc_msgSend_view(self, v63, v64, v65);
    double v70 = objc_msgSend_view(v53, v67, v68, v69);
    objc_msgSend_addSubview_(v66, v71, (uint64_t)v70, v72);

    objc_msgSend_didMoveToParentViewController_(v53, v73, (uint64_t)self, v74);
    timeLayoutSelectionViewController = self->_timeLayoutSelectionViewController;
    self->_timeLayoutSelectionViewController = v53;
    v163 = v53;

    objc_msgSend_setDelegate_(self->_timeLayoutSelectionViewController, v76, (uint64_t)self, v77);
    objc_msgSend_bottomPadding(NTKParmesanTimeLayoutSelectionViewController, v78, v79, v80);
    double v82 = v81;
    uint64_t v86 = objc_msgSend_view(self->_timeLayoutSelectionViewController, v83, v84, v85);
    uint64_t v90 = objc_msgSend_clearColor(MEMORY[0x263F825C8], v87, v88, v89);
    objc_msgSend_setBackgroundColor_(v86, v91, (uint64_t)v90, v92);

    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v86, v93, 0, v94);
    uint64_t v156 = (void *)MEMORY[0x263F08938];
    uint64_t v162 = objc_msgSend_leadingAnchor(v86, v95, v96, v97);
    uint64_t v164 = objc_msgSend_view(self, v98, v99, v100);
    uint64_t v161 = objc_msgSend_safeAreaLayoutGuide(v164, v101, v102, v103);
    uint64_t v160 = objc_msgSend_leadingAnchor(v161, v104, v105, v106);
    CGRect v159 = objc_msgSend_constraintEqualToAnchor_(v162, v107, (uint64_t)v160, v108);
    v167[0] = v159;
    double v157 = objc_msgSend_trailingAnchor(v86, v109, v110, v111);
    CGRect v158 = objc_msgSend_view(self, v112, v113, v114);
    uint64_t v155 = objc_msgSend_safeAreaLayoutGuide(v158, v115, v116, v117);
    objc_msgSend_trailingAnchor(v155, v118, v119, v120);
    uint64_t v121 = v166 = v7;
    uint64_t v124 = objc_msgSend_constraintEqualToAnchor_(v157, v122, (uint64_t)v121, v123);
    v167[1] = v124;
    objc_msgSend_bottomAnchor(v86, v125, v126, v127);
    v128 = uint64_t v165 = v12;
    uint64_t v132 = objc_msgSend_view(self, v129, v130, v131);
    uint64_t v136 = objc_msgSend_safeAreaLayoutGuide(v132, v133, v134, v135);
    uint64_t v140 = objc_msgSend_bottomAnchor(v136, v137, v138, v139);
    uint64_t v143 = objc_msgSend_constraintEqualToAnchor_constant_(v128, v141, (uint64_t)v140, v142, -v82);
    v167[2] = v143;
    v145 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v144, (uint64_t)v167, 3);
    objc_msgSend_activateConstraints_(v156, v146, (uint64_t)v145, v147);

    double v12 = v165;
    uint64_t v7 = v166;

    uint64_t v151 = objc_msgSend_view(self, v148, v149, v150);
    objc_msgSend_setNeedsLayout(v151, v152, v153, v154);
  }
}

- (double)_heightForTimeSelectionItem
{
  uint64_t v4 = objc_msgSend_navigationController(self, a2, v2, v3);
  id v8 = objc_msgSend_presentingViewController(v4, v5, v6, v7);
  double v12 = objc_msgSend_view(v8, v9, v10, v11);

  objc_msgSend_bounds(v12, v13, v14, v15);
  double v17 = v16 * 0.09;

  return v17;
}

- (double)_heightForTimeSelectionView
{
  objc_msgSend__heightForTimeSelectionItem(self, a2, v2, v3);

  MEMORY[0x270F9A6D0](NTKParmesanTimeLayoutSelectionViewController, sel_totalHeightForPreviewHeight_, v4, v5);
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)qword_2691D5D60 == a6)
  {
    if (objc_msgSend_isEqualToString_(a3, a2, @"bounds", (uint64_t)a4, a5))
    {
      objc_msgSend_zoomScale(self->_scrollView, v7, v8, v9);
      objc_msgSend_setZoomScale_animated_(self->_overlayScrollView, v10, 0, v11);
      objc_msgSend_contentInset(self->_scrollView, v12, v13, v14);
      objc_msgSend_setContentInset_(self->_overlayScrollView, v15, v16, v17);
      objc_msgSend_bounds(self->_scrollView, v18, v19, v20);
      overlayScrollView = self->_overlayScrollView;
      MEMORY[0x270F9A6D0](overlayScrollView, sel_setBounds_, v21, v22);
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)NTKCParmesanPreviewViewController;
    -[NTKCParmesanPreviewViewController observeValueForKeyPath:ofObject:change:context:](&v24, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)scrollViewWillBeginInteraction:(id)a3
{
  objc_msgSend_setDidInteractWithCropView_(self, a2, 1, v3);
  uint64_t v8 = objc_msgSend_currentPreview(self, v5, v6, v7);
  objc_msgSend_cropRect(self->_scrollView, v9, v10, v11);
  objc_msgSend__validatePreview_withCrop_animated_(self, v12, (uint64_t)v8, 0);

  objc_msgSend__updateNavigationBarItems(self, v13, v14, v15);
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_msgSend_currentPreview(self, a2, (uint64_t)a3, v3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cropRect(self->_scrollView, v5, v6, v7);
  objc_msgSend__validatePreview_withCrop_animated_(self, v8, (uint64_t)v9, 0);
}

- (void)scrollViewDidSettleFromInteracting:(id)a3
{
  uint64_t v5 = objc_msgSend_currentPreview(self, a2, (uint64_t)a3, v3);
  objc_msgSend_cropRect(self->_scrollView, v6, v7, v8);
  double x = v9;
  double y = v11;
  double width = v13;
  double height = v15;
  double photoScale = self->_photoScale;
  if (photoScale != 0.0)
  {
    CGAffineTransformMakeScale(&v44, photoScale, self->_photoScale);
    v45.origin.double x = x;
    v45.origin.double y = y;
    v45.size.double width = width;
    v45.size.double height = height;
    CGRect v46 = CGRectApplyAffineTransform(v45, &v44);
    double x = v46.origin.x;
    double y = v46.origin.y;
    double width = v46.size.width;
    double height = v46.size.height;
  }
  id v18 = [NTKParmesanCrop alloc];
  uint64_t v22 = objc_msgSend_initWithRect_(v18, v19, v20, v21, x, y, width, height);
  uint64_t v23 = [NTKParmesanCropPreviewModel alloc];
  double v27 = objc_msgSend_photo(v5, v24, v25, v26);
  uint64_t v31 = objc_msgSend_maskedPhoto(v5, v28, v29, v30);
  double v35 = objc_msgSend_previewValidator(v5, v32, v33, v34);
  double v39 = objc_msgSend_timeLayout(v5, v36, v37, v38);
  char v43 = 1;
  CGFloat v41 = objc_msgSend_initWithPhoto_maskedPhoto_previewValidator_crop_timeLayout_useDepthEffect_revertable_(v23, v40, (uint64_t)v27, (uint64_t)v31, v35, v22, v39, self->_displayDepthEffect, v43);

  objc_msgSend__setPreview_animated_(self, v42, (uint64_t)v41, 1);
}

- (void)_setPreview:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_currentPreview, a3);
  self->_displayDepthEffect = objc_msgSend_useDepthEffect(v6, v7, v8, v9);
  if (objc_msgSend_isHidden(self->_time, v10, v11, v12)) {
    objc_msgSend_setHidden_(self->_time, v13, 0, v15);
  }
  uint64_t v16 = objc_msgSend_crop(v6, v13, v14, v15);
  objc_msgSend_cgRect(v16, v17, v18, v19);
  double x = v20;
  double y = v22;
  double width = v24;
  double height = v26;

  uint64_t v31 = objc_msgSend_photo(v6, v28, v29, v30);
  double v35 = objc_msgSend_maskedPhoto(v6, v32, v33, v34);
  objc_msgSend_scale(v31, v36, v37, v38);
  self->_double photoScale = v39;
  objc_msgSend__setupCenteredViewWithPhoto_maskedPhoto_(self, v40, (uint64_t)v31, (uint64_t)v35);
  CGRect v46 = objc_msgSend_timeLayout(v6, v41, v42, v43);
  if (v46)
  {
    objc_msgSend_updateTimeLayout_(self->_time, v44, (uint64_t)v46, v45);
    objc_msgSend_setSelectedLayout_(self->_timeLayoutSelectionViewController, v47, (uint64_t)v46, v48);
  }
  v69.origin.double x = x;
  v69.origin.double y = y;
  v69.size.double width = width;
  v69.size.double height = height;
  if (!CGRectIsEmpty(v69))
  {
    double photoScale = self->_photoScale;
    if (photoScale != 0.0)
    {
      CGAffineTransformMakeScale(&v68, 1.0 / photoScale, 1.0 / photoScale);
      v70.origin.double x = x;
      v70.origin.double y = y;
      v70.size.double width = width;
      v70.size.double height = height;
      CGRect v71 = CGRectApplyAffineTransform(v70, &v68);
      double x = v71.origin.x;
      double y = v71.origin.y;
      double width = v71.size.width;
      double height = v71.size.height;
    }
  }
  objc_msgSend_setCropRect_(self->_scrollView, v49, v50, v51, x, y, width, height);
  objc_msgSend_setCropRect_(self->_overlayScrollView, v53, v54, v55, x, y, width, height);
  objc_msgSend__updatePreviewForDepthEffect_(self, v56, self->_displayDepthEffect, v57);
  objc_msgSend__updateNavigationBarItems(self, v58, v59, v60);
  objc_msgSend__updateToolbarItems(self, v61, v62, v63);
  objc_msgSend__validatePreview_withCrop_animated_(self, v64, (uint64_t)v6, 0, x, y, width, height);
  objc_msgSend__updateAllButtonStates(self, v65, v66, v67);
}

- (void)_setCropValidationState:(unint64_t)a3 animated:(BOOL)a4
{
  self->_cropValidationState = a3;
  double v5 = 0.0;
  block[1] = 3221225472;
  block[0] = MEMORY[0x263EF8330];
  block[2] = sub_246B59C74;
  block[3] = &unk_2651FB9A8;
  BOOL v10 = a4;
  if (a3 == 1) {
    double v5 = 1.0;
  }
  block[4] = self;
  *(double *)&block[5] = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_msgSend__updateDoneButtonEnabledState(self, v6, v7, v8);
}

- (void)_validatePreview:(id)a3 withCrop:(CGRect)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  double v13 = v9;
  if (self->_displayDepthEffect)
  {
    uint64_t v14 = objc_msgSend_photo(v9, v10, v11, v12);
    objc_msgSend_size(v14, v15, v16, v17);
    double v19 = v18;
    double v21 = v20;

    objc_msgSend_zoomScale(self->_scrollView, v22, v23, v24);
    double v26 = v25;
    objc_msgSend_normalizedTimeRect(self->_time, v27, v28, v29);
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    dCGFloat y = y;
    CGFloat v36 = x;
    double v38 = v37;
    objc_msgSend_bounds(self->_time, v39, v40, v41);
    CGFloat v43 = v31 * v42;
    objc_msgSend_bounds(self->_time, v44, v45, v46);
    CGFloat v48 = v33 * v47;
    objc_msgSend_bounds(self->_time, v49, v50, v51);
    CGFloat v53 = v35 * v52;
    objc_msgSend_bounds(self->_time, v54, v55, v56);
    CGFloat v58 = v38 * v57;
    CGAffineTransformMakeScale(&v77, self->_timeContainerScale, self->_timeContainerScale);
    v78.origin.CGFloat x = v43;
    v78.origin.CGFloat y = v48;
    v78.size.CGFloat width = v53;
    v78.size.CGFloat height = v58;
    CGRect v79 = CGRectApplyAffineTransform(v78, &v77);
    CGFloat v59 = v79.origin.x;
    CGFloat v60 = v79.origin.y;
    CGFloat width = v79.size.width;
    CGFloat height = v79.size.height;
    CGAffineTransformMakeScale(&v76, 1.0 / v26, 1.0 / v26);
    v80.origin.CGFloat x = v59;
    v80.origin.CGFloat y = v60;
    v80.size.CGFloat width = width;
    v80.size.CGFloat height = height;
    CGRect v81 = CGRectApplyAffineTransform(v80, &v76);
    CGRect v82 = CGRectOffset(v81, v36, dy);
    CGFloat v63 = v82.origin.x / v19;
    CGFloat v64 = v82.origin.y / v21;
    CGFloat v65 = v82.size.width / v19;
    CGFloat v66 = v82.size.height / v21;
    CGRect v70 = objc_msgSend_previewValidator(v13, v67, v68, v69);
    v74[0] = MEMORY[0x263EF8330];
    v74[1] = 3221225472;
    v74[2] = sub_246B59F48;
    v74[3] = &unk_2651FB9D0;
    v74[4] = self;
    BOOL v75 = v5;
    objc_msgSend_validateTimeLabel_completion_(v70, v71, (uint64_t)v74, v72, v63, v64, v65, v66);
  }
  else
  {
    objc_msgSend__setCropValidationState_animated_(self, v10, 0, v5);
  }
}

- (void)_updateDoneButtonEnabledState
{
  char isDragging = objc_msgSend_isDragging(self->_scrollView, a2, v2, v3);
  char isDecelerating = objc_msgSend_isDecelerating(self->_scrollView, v6, v7, v8);
  unint64_t cropValidationState = self->_cropValidationState;
  unint64_t initialPreviewState = self->_initialPreviewState;
  uint64_t v15 = objc_msgSend_trailingButton(self->_navigationBar, v12, v13, v14);
  id v20 = v15;
  BOOL v19 = cropValidationState != 1 && initialPreviewState == 3;
  if (isDecelerating) {
    BOOL v19 = 0;
  }
  if (isDragging) {
    objc_msgSend_setEnabled_(v15, v16, 0, v17);
  }
  else {
    objc_msgSend_setEnabled_(v15, v16, v19, v17);
  }
}

- (void)_cancelPressed
{
  if (objc_msgSend_didInteractWithCropView(self, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_alertControllerWithTitle_message_preferredStyle_(MEMORY[0x263F82418], v5, 0, 0, 0);
    BOOL v10 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v9, @"MANUAL_LAYOUT_CANCEL_ALERT_TITLE", @"Discard Changes");
    uint64_t v12 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v11, @"MANUAL_LAYOUT_CANCEL_ALERT_BUTTON", @"Cancel");
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = sub_246B5A1E0;
    v29[3] = &unk_2651FB9F8;
    v29[4] = self;
    uint64_t v14 = objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x263F82400], v13, (uint64_t)v10, 0, v29);
    objc_msgSend_addAction_(v8, v15, (uint64_t)v14, v16);

    double v18 = objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x263F82400], v17, (uint64_t)v12, 1, 0);
    objc_msgSend_addAction_(v8, v19, (uint64_t)v18, v20);

    uint64_t v24 = objc_msgSend_parentViewController(self, v21, v22, v23);
    objc_msgSend_presentViewController_animated_completion_(v24, v25, (uint64_t)v8, 1, 0);
  }
  else
  {
    objc_msgSend_delegate(self, v5, v6, v7);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ParmesanPreviewViewControllerWantsToCancel_(v28, v26, (uint64_t)self, v27);
  }
}

- (void)_donePressed
{
  objc_msgSend_delegate(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ParmesanPreviewViewControllerWantsToSave_(v7, v5, (uint64_t)self, v6);
}

- (void)_revertPressed
{
  uint64_t v3 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, a2, @"MANUAL_LAYOUT_REVERT_ALERT_TITLE", @"Revert to original will…");
  BOOL v5 = objc_msgSend_alertControllerWithTitle_message_preferredStyle_(MEMORY[0x263F82418], v4, 0, (uint64_t)v3, 0);
  id v7 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v6, @"MANUAL_LAYOUT_REVERT_ALERT_BUTTON", @"Revert to Original");
  objc_initWeak(&location, self);
  uint64_t v8 = (void *)MEMORY[0x263F82400];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = sub_246B5A45C;
  uint64_t v23 = &unk_2651FBA20;
  objc_copyWeak(&v24, &location);
  BOOL v10 = objc_msgSend_actionWithTitle_style_handler_(v8, v9, (uint64_t)v7, 2, &v20);
  objc_msgSend_addAction_(v5, v11, (uint64_t)v10, v12, v20, v21, v22, v23);

  uint64_t v14 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v13, @"MANUAL_LAYOUT_CANCEL_ALERT_BUTTON", @"Cancel");
  uint64_t v16 = objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x263F82400], v15, (uint64_t)v14, 1, 0);
  objc_msgSend_addAction_(v5, v17, (uint64_t)v16, v18);

  objc_msgSend_presentViewController_animated_completion_(self, v19, (uint64_t)v5, 1, 0);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)_changePhotoPressed
{
  uint64_t v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_246B51000, v3, OS_LOG_TYPE_INFO, "User tapped Change Photo", buf, 2u);
  }

  uint64_t v6 = objc_msgSend_parmesanConfigurationWithLimit_(MEMORY[0x263F57978], v4, 1, v5);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_246B5A710;
  v8[3] = &unk_2651FB908;
  v8[4] = self;
  objc_msgSend_presentPhotosAddControllerFromViewController_configuration_withCompletion_(MEMORY[0x263F57978], v7, (uint64_t)self, (uint64_t)v6, v8);
}

- (void)_didSelectPhotoForChangePhoto:(id)a3
{
  id v4 = a3;
  previewProvider = self->_previewProvider;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_246B5A904;
  v8[3] = &unk_2651FBA48;
  id v9 = v4;
  BOOL v10 = self;
  id v6 = v4;
  objc_msgSend_Parmesan_changePhotoWithAsset_completion_(previewProvider, v7, (uint64_t)v6, (uint64_t)v8);
}

- (void)_toggleDepthEffectPressed
{
  uint64_t v5 = objc_msgSend_displayDepthEffect(self, a2, v2, v3) ^ 1;

  MEMORY[0x270F9A6D0](self, sel_setDisplayDepthEffect_, v5, v6);
}

- (id)_symbolForUsingDepthEffect:(BOOL)a3
{
  if (a3) {
    return @"square.3.layers.3d";
  }
  else {
    return @"square.3.layers.3d.slash";
  }
}

- (void)setDisplayDepthEffect:(BOOL)a3
{
  if (self->_displayDepthEffect != a3)
  {
    BOOL v3 = a3;
    self->_displayDepthEffect = a3;
    uint64_t v5 = [NTKParmesanCropPreviewModel alloc];
    id v9 = objc_msgSend_photo(self->_currentPreview, v6, v7, v8);
    uint64_t v13 = objc_msgSend_maskedPhoto(self->_currentPreview, v10, v11, v12);
    uint64_t v17 = objc_msgSend_previewValidator(self->_currentPreview, v14, v15, v16);
    uint64_t v21 = objc_msgSend_crop(self->_currentPreview, v18, v19, v20);
    double v25 = objc_msgSend_timeLayout(self->_currentPreview, v22, v23, v24);
    char isRevertable = objc_msgSend_isRevertable(self->_currentPreview, v26, v27, v28);
    id v32 = (id)objc_msgSend_initWithPhoto_maskedPhoto_previewValidator_crop_timeLayout_useDepthEffect_revertable_(v5, v29, (uint64_t)v9, (uint64_t)v13, v17, v21, v25, v3, isRevertable);

    objc_msgSend__setPreview_animated_(self, v30, (uint64_t)v32, 0);
  }
}

- (void)_updatePreviewForDepthEffect:(BOOL)a3
{
  if (a3) {
    objc_msgSend_setAlpha_(self->_overlayScrollView, a2, a3, v3, 1.0);
  }
  else {
    objc_msgSend_setAlpha_(self->_overlayScrollView, a2, a3, v3, 0.0);
  }
}

- (void)timeLayoutSelectionController:(id)a3 didChangeSelection:(id)a4
{
  id v32 = a4;
  BOOL v10 = objc_msgSend_currentPreview(self, v5, v6, v7);
  if (v10)
  {
    objc_msgSend_setDidInteractWithCropView_(self, v8, 1, v9);
    uint64_t v11 = [NTKParmesanCropPreviewModel alloc];
    uint64_t v15 = objc_msgSend_photo(v10, v12, v13, v14);
    uint64_t v19 = objc_msgSend_maskedPhoto(v10, v16, v17, v18);
    uint64_t v23 = objc_msgSend_previewValidator(v10, v20, v21, v22);
    uint64_t v27 = objc_msgSend_crop(v10, v24, v25, v26);
    char v31 = 1;
    uint64_t v29 = objc_msgSend_initWithPhoto_maskedPhoto_previewValidator_crop_timeLayout_useDepthEffect_revertable_(v11, v28, (uint64_t)v15, (uint64_t)v19, v23, v27, v32, self->_displayDepthEffect, v31);

    objc_msgSend__setPreview_animated_(self, v30, (uint64_t)v29, 1);
  }
}

- (NTKParmesanCropPreviewModel)currentPreview
{
  return self->_currentPreview;
}

- (NTKParmesanPreviewProviding)previewProvider
{
  return self->_previewProvider;
}

- (NTKCParmesanPreviewViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKCParmesanPreviewViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)didInteractWithCropView
{
  return self->_didInteractWithCropView;
}

- (void)setDidInteractWithCropView:(BOOL)a3
{
  self->_didInteractWithCropView = a3;
}

- (BOOL)displayDepthEffect
{
  return self->_displayDepthEffect;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previewProvider, 0);
  objc_storeStrong((id *)&self->_currentPreview, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleContainer, 0);
  objc_storeStrong((id *)&self->_placementGuideLabel, 0);
  objc_storeStrong((id *)&self->_placementGuideContainer, 0);
  objc_storeStrong((id *)&self->_timeLayoutSelectionViewController, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_loadingSpinner, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_timeContainer, 0);
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_currentBackgroundImage, 0);
  objc_storeStrong((id *)&self->_currentForegroundImage, 0);
  objc_storeStrong((id *)&self->_overlayScrollView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_contentContainer, 0);

  objc_storeStrong((id *)&self->_infoContainer, 0);
}

@end