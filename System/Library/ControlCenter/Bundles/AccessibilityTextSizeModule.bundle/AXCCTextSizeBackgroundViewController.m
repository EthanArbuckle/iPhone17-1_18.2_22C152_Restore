@interface AXCCTextSizeBackgroundViewController
- (AXCCExpandableButton)perAppModeSwitcher;
- (AXCCTextSizeHelper)helper;
- (BOOL)_canShowWhileLocked;
- (NSMutableArray)switcherOptions;
- (UILabel)defaultLabel;
- (UILabel)textPercentageLabel;
- (UILabel)textSizeLabel;
- (id)_addLabelSubviewWithText:(id)a3;
- (id)_preferredCategoryWithPerAppSettings;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_contentSizeCategoryDidChangeInternally:(id)a3;
- (void)_layoutPerAppControls;
- (void)_togglePerAppButton:(id)a3;
- (void)_updateDefaultLabelPercentageForContentSizeCategory:(id)a3;
- (void)_updateDefaultLabelVisibilityForContentSizeCategory:(id)a3;
- (void)_updateLabelFonts;
- (void)_updatePerAppControls;
- (void)dealloc;
- (void)moduleDidExpand;
- (void)setDefaultLabel:(id)a3;
- (void)setHelper:(id)a3;
- (void)setPerAppModeSwitcher:(id)a3;
- (void)setSwitcherOptions:(id)a3;
- (void)setTextPercentageLabel:(id)a3;
- (void)setTextSizeLabel:(id)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AXCCTextSizeBackgroundViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v83.receiver = self;
  v83.super_class = (Class)AXCCTextSizeBackgroundViewController;
  [(AXCCTextSizeBackgroundViewController *)&v83 viewDidLoad];
  v3 = AXCCLocalizedString(@"text.size.label");
  objc_msgSend__addLabelSubviewWithText_(self, v4, (uint64_t)v3, v5);
  v6 = (UILabel *)objc_claimAutoreleasedReturnValue();
  textSizeLabel = self->_textSizeLabel;
  self->_textSizeLabel = v6;

  objc_msgSend__addLabelSubviewWithText_(self, v8, (uint64_t)&stru_26F4BC1F8, v9);
  v10 = (UILabel *)objc_claimAutoreleasedReturnValue();
  textPercentageLabel = self->_textPercentageLabel;
  self->_textPercentageLabel = v10;

  v12 = AXCCLocalizedString(@"default.label");
  objc_msgSend__addLabelSubviewWithText_(self, v13, (uint64_t)v12, v14);
  v15 = (UILabel *)objc_claimAutoreleasedReturnValue();
  defaultLabel = self->_defaultLabel;
  self->_defaultLabel = v15;

  objc_msgSend_setAlpha_(self->_defaultLabel, v17, v18, v19, 0.0);
  v20 = [AXCCExpandableButton alloc];
  v24 = (AXCCExpandableButton *)objc_msgSend_initForControlCenter(v20, v21, v22, v23);
  perAppModeSwitcher = self->_perAppModeSwitcher;
  self->_perAppModeSwitcher = v24;

  objc_msgSend_addTarget_action_forControlEvents_(self->_perAppModeSwitcher, v26, (uint64_t)self, (uint64_t)sel__togglePerAppButton_, 4096);
  objc_msgSend_setButtonImageSize_(self->_perAppModeSwitcher, v27, v28, v29, 54.0, 54.0);
  objc_msgSend_setMaximumExpandedSize_(self->_perAppModeSwitcher, v30, v31, v32, 0.0, 228.0);
  objc_msgSend_setExpanded_(self->_perAppModeSwitcher, v33, 1, v34);
  v38 = objc_msgSend_view(self, v35, v36, v37);
  objc_msgSend_addSubview_(v38, v39, (uint64_t)self->_perAppModeSwitcher, v40);

  v41 = (NSMutableArray *)objc_opt_new();
  switcherOptions = self->_switcherOptions;
  self->_switcherOptions = v41;

  unint64_t v46 = 0;
  while (v46 < objc_msgSend_count(&unk_26F4BF268, v43, v44, v45))
  {
    v49 = (void *)MEMORY[0x263F827E8];
    v50 = objc_msgSend_objectAtIndexedSubscript_(&unk_26F4BF268, v47, v46, v48);
    v53 = objc_msgSend_systemImageNamed_(v49, v51, (uint64_t)v50, v52);

    v54 = objc_alloc_init(AXCCExpandableButtonOption);
    v58 = objc_msgSend_systemBlueColor(MEMORY[0x263F825C8], v55, v56, v57);
    objc_msgSend_setSelectedBackgroundColor_(v54, v59, (uint64_t)v58, v60);

    objc_msgSend_setImage_(v54, v61, (uint64_t)v53, v62);
    objc_msgSend_addObject_(self->_switcherOptions, v63, (uint64_t)v54, v64);

    if (++v46 == 4) {
      goto LABEL_8;
    }
  }
  v65 = AXLogCommon();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
    sub_2406150E8(v65);
  }

LABEL_8:
  v66 = objc_msgSend_lastObject(self->_switcherOptions, v43, v44, v45);
  v67 = AXCCLocalizedString(@"global.label");
  objc_msgSend_setTitle_(v66, v68, (uint64_t)v67, v69);

  objc_msgSend__updateLabelFonts(self, v70, v71, v72);
  v76 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v73, v74, v75);
  objc_msgSend_addObserver_selector_name_object_(v76, v77, (uint64_t)self, (uint64_t)sel__contentSizeCategoryDidChange_, *MEMORY[0x263F83428], 0);

  v81 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v78, v79, v80);
  objc_msgSend_addObserver_selector_name_object_(v81, v82, (uint64_t)self, (uint64_t)sel__contentSizeCategoryDidChangeInternally_, @"AXCCInternalTextSizeDidUpdate", 0);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v19.receiver = self;
  v19.super_class = (Class)AXCCTextSizeBackgroundViewController;
  [(AXCCTextSizeBackgroundViewController *)&v19 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3)
  {
    uint64_t v9 = objc_msgSend_view(self, v6, v7, v8);
    v12 = objc_msgSend_visualStylingProviderForCategory_(v9, v10, 1, v11);

    v13 = [AXCCVisualStylingProvider alloc];
    v16 = objc_msgSend_initWithVisualStylingProvider_(v13, v14, (uint64_t)v12, v15);
    objc_msgSend_setStylingProvider_(self->_perAppModeSwitcher, v17, (uint64_t)v16, v18);
  }
}

- (void)dealloc
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  v8.receiver = self;
  v8.super_class = (Class)AXCCTextSizeBackgroundViewController;
  [(AXCCTextSizeBackgroundViewController *)&v8 dealloc];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263F82A90], sel_systemPointerStyle, a3, a4);
}

- (void)moduleDidExpand
{
  objc_msgSend__updatePerAppControls(self, a2, v2, v3);

  objc_msgSend__contentSizeCategoryDidChange_(self, v5, 0, v6);
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AXCCTextSizeBackgroundViewController;
  [(AXCCTextSizeBackgroundViewController *)&v9 viewWillAppear:a3];
  objc_msgSend__updatePerAppControls(self, v4, v5, v6);
  objc_msgSend__contentSizeCategoryDidChange_(self, v7, 0, v8);
}

- (void)_updateDefaultLabelPercentageForContentSizeCategory:(id)a3
{
  AXTextSizePercentage();
  AXFormatFloatWithPercentage();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setText_(self->_textPercentageLabel, v4, (uint64_t)v6, v5);
}

- (void)_updateDefaultLabelVisibilityForContentSizeCategory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F82E00];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2406069A8;
  v9[3] = &unk_2650C76A8;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  objc_msgSend_animateWithDuration_animations_(v5, v7, (uint64_t)v9, v8, 0.1);
}

- (id)_addLabelSubviewWithText:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F828E0];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v10 = objc_msgSend_initWithFrame_(v6, v7, v8, v9, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  uint64_t v14 = objc_msgSend_whiteColor(MEMORY[0x263F825C8], v11, v12, v13);
  objc_msgSend_setTextColor_(v10, v15, (uint64_t)v14, v16);

  objc_msgSend_setText_(v10, v17, (uint64_t)v5, v18);
  objc_msgSend_controlCenterApplyPrimaryContentShadow(v10, v19, v20, v21);
  v25 = objc_msgSend_view(self, v22, v23, v24);
  objc_msgSend_addSubview_(v25, v26, (uint64_t)v10, v27);

  return v10;
}

- (id)_preferredCategoryWithPerAppSettings
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_categoryName(self->_helper, a2, v2, v3);
  id v6 = AXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v10 = NSNumber;
    uint64_t v11 = objc_msgSend_state(self->_helper, v7, v8, v9);
    uint64_t v14 = objc_msgSend_numberWithUnsignedInt_(v10, v12, v11, v13);
    int v16 = 138412546;
    v17 = v5;
    __int16 v18 = 2112;
    objc_super v19 = v14;
    _os_log_impl(&dword_240604000, v6, OS_LOG_TYPE_INFO, "Preferrefed category: %@ = %@", (uint8_t *)&v16, 0x16u);
  }

  return v5;
}

- (void)_updateLabelFonts
{
  objc_msgSend__preferredCategoryWithPerAppSettings(self, a2, v2, v3);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x263F82DA0], v5, (uint64_t)v33, v6);
  uint64_t v9 = objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(MEMORY[0x263F81708], v8, *MEMORY[0x263F83610], (uint64_t)v7);
  objc_msgSend_setFont_(self->_textSizeLabel, v10, (uint64_t)v9, v11);

  uint64_t v13 = objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(MEMORY[0x263F81708], v12, *MEMORY[0x263F835F8], (uint64_t)v7);
  objc_msgSend_setFont_(self->_textPercentageLabel, v14, (uint64_t)v13, v15);

  objc_super v19 = objc_msgSend__preferredCategoryWithPerAppSettings(self, v16, v17, v18);
  objc_msgSend__updateDefaultLabelPercentageForContentSizeCategory_(self, v20, (uint64_t)v19, v21);

  uint64_t v23 = objc_msgSend_defaultFontDescriptorWithTextStyle_addingSymbolicTraits_options_(MEMORY[0x263F81720], v22, *MEMORY[0x263F83570], 2, 0);
  uint64_t v24 = (void *)MEMORY[0x263F81708];
  objc_msgSend_pointSize(v23, v25, v26, v27);
  v30 = objc_msgSend_fontWithDescriptor_size_(v24, v28, (uint64_t)v23, v29);
  objc_msgSend_setFont_(self->_defaultLabel, v31, (uint64_t)v30, v32);
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  objc_msgSend__updateLabelFonts(self, a2, (uint64_t)a3, v3);
  objc_msgSend__preferredCategoryWithPerAppSettings(self, v5, v6, v7);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateDefaultLabelPercentageForContentSizeCategory_(self, v8, (uint64_t)v19, v9);
  objc_msgSend__updateDefaultLabelVisibilityForContentSizeCategory_(self, v10, (uint64_t)v19, v11);
  uint64_t v15 = objc_msgSend_view(self, v12, v13, v14);
  objc_msgSend_setNeedsLayout(v15, v16, v17, v18);
}

- (void)_contentSizeCategoryDidChangeInternally:(id)a3
{
  objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  v43 = (char *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_state(self->_helper, v5, v6, v7) == 3)
  {
    uint64_t v11 = v43;
  }
  else
  {
    uint64_t v12 = objc_msgSend_categoryName(self->_helper, v8, v9, v10);

    uint64_t v11 = (const char *)v12;
  }
  uint64_t v44 = (char *)v11;
  uint64_t v13 = objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x263F82DA0], v11, (uint64_t)v11, v10);
  uint64_t v17 = objc_msgSend_font(self->_textSizeLabel, v14, v15, v16);
  uint64_t v20 = objc_msgSend__fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection_(v17, v18, (uint64_t)v13, v19);
  objc_msgSend_setFont_(self->_textSizeLabel, v21, (uint64_t)v20, v22);

  uint64_t v26 = objc_msgSend_font(self->_textPercentageLabel, v23, v24, v25);
  uint64_t v29 = objc_msgSend__fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection_(v26, v27, (uint64_t)v13, v28);
  objc_msgSend_setFont_(self->_textPercentageLabel, v30, (uint64_t)v29, v31);

  objc_msgSend__updateDefaultLabelPercentageForContentSizeCategory_(self, v32, (uint64_t)v44, v33);
  objc_msgSend__updateDefaultLabelVisibilityForContentSizeCategory_(self, v34, (uint64_t)v44, v35);
  v39 = objc_msgSend_view(self, v36, v37, v38);
  objc_msgSend_setNeedsLayout(v39, v40, v41, v42);
}

- (void)_updatePerAppControls
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  objc_msgSend_refreshAppInfo(self->_helper, a2, v2, v3);
  objc_msgSend_refreshCategoryName(self->_helper, v5, v6, v7);
  if (self->_perAppModeSwitcher)
  {
    int isPerAppAvailable = objc_msgSend_isPerAppAvailable(self->_helper, v8, v9, v10);
    perAppModeSwitcher = self->_perAppModeSwitcher;
    if (isPerAppAvailable)
    {
      objc_msgSend_setHidden_(perAppModeSwitcher, v11, 0, v12);
      uint64_t v15 = objc_opt_new();
      objc_msgSend_appsNames(self->_helper, v16, v17, v18);
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v77, (uint64_t)v81, 16);
      if (v20)
      {
        uint64_t v24 = v20;
        int v25 = 0;
        uint64_t v26 = *(void *)v78;
        while (2)
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v78 != v26) {
              objc_enumerationMutation(obj);
            }
            uint64_t v28 = *(void *)(*((void *)&v77 + 1) + 8 * i);
            if (objc_msgSend_count(self->_switcherOptions, v21, v22, v23) - 1 <= (unint64_t)(v25 + i))
            {
              uint64_t v44 = AXLogCommon();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                sub_24061512C(v44);
              }

              goto LABEL_18;
            }
            uint64_t v31 = objc_msgSend_objectAtIndex_(self->_switcherOptions, v29, (v25 + i), v30);
            uint64_t v32 = NSString;
            uint64_t v33 = AXCCLocalizedString(@"perapp.label");
            uint64_t v36 = objc_msgSend_localizedStringWithFormat_(v32, v34, (uint64_t)v33, v35, v28);
            objc_msgSend_setTitle_(v31, v37, (uint64_t)v36, v38);

            objc_msgSend_addObject_(v15, v39, (uint64_t)v31, v40);
          }
          uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v77, (uint64_t)v81, 16);
          v25 += i;
          if (v24) {
            continue;
          }
          break;
        }
      }
LABEL_18:

      if (objc_msgSend_count(v15, v45, v46, v47))
      {
        v51 = objc_msgSend_lastObject(self->_switcherOptions, v48, v49, v50);
        objc_msgSend_addObject_(v15, v52, (uint64_t)v51, v53);

        objc_msgSend_setOptions_(self->_perAppModeSwitcher, v54, (uint64_t)v15, v55);
        objc_msgSend_setExpanded_(self->_perAppModeSwitcher, v56, 1, v57);
        if (objc_msgSend_state(self->_helper, v58, v59, v60) == 3)
        {
          uint64_t v64 = objc_msgSend_options(self->_perAppModeSwitcher, v61, v62, v63);
          uint64_t v68 = objc_msgSend_count(v64, v65, v66, v67);
          objc_msgSend_setSelectedOptionIndex_(self->_perAppModeSwitcher, v69, v68 - 1, v70);
        }
        else
        {
          unsigned int v73 = objc_msgSend_state(self->_helper, v61, v62, v63);
          objc_msgSend_setSelectedOptionIndex_(self->_perAppModeSwitcher, v74, v73, v75);
        }
      }
      else
      {
        objc_msgSend_setOptions_(self->_perAppModeSwitcher, v48, 0, v50);
        objc_msgSend_setHidden_(self->_perAppModeSwitcher, v71, 1, v72);
      }
    }
    else
    {
      objc_msgSend_setOptions_(perAppModeSwitcher, v11, 0, v12);
      v43 = self->_perAppModeSwitcher;
      objc_msgSend_setHidden_(v43, v41, 1, v42);
    }
  }
}

- (void)_togglePerAppButton:(id)a3
{
  uint64_t v5 = objc_msgSend_selectedOptionIndex(self->_perAppModeSwitcher, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_options(self->_perAppModeSwitcher, v6, v7, v8);
  uint64_t v13 = objc_msgSend_count(v9, v10, v11, v12) - 1;

  if (v5 == v13)
  {
    objc_msgSend_setState_(self->_helper, v14, 3, v16);
  }
  else
  {
    uint64_t v19 = objc_msgSend_selectedOptionIndex(self->_perAppModeSwitcher, v14, v15, v16);
    objc_msgSend_setState_(self->_helper, v20, v19, v21);
  }

  objc_msgSend__contentSizeCategoryDidChange_(self, v17, 0, v18);
}

- (void)_layoutPerAppControls
{
  uint64_t v5 = objc_msgSend_view(self, a2, v2, v3);
  objc_msgSend_bounds(v5, v6, v7, v8);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  if ((CCUIIsPortrait() & 1) != 0
    || (objc_msgSend_currentDevice(MEMORY[0x263F82670], v17, v18, v19),
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        uint64_t v24 = objc_msgSend_userInterfaceIdiom(v20, v21, v22, v23),
        v20,
        v24 == 1))
  {
    objc_msgSend_setAxis_(self->_perAppModeSwitcher, v17, 0, v19);
    v38.origin.x = v10;
    v38.origin.y = v12;
    v38.size.width = v14;
    v38.size.height = v16;
    double Width = CGRectGetWidth(v38);
    v39.origin.x = v10;
    v39.origin.y = v12;
    v39.size.width = v14;
    v39.size.height = v16;
    double Height = CGRectGetHeight(v39);
    CCUISliderExpandedContentModuleHeight();
    double v28 = (Height - v27) * 0.5;
    v40.origin.x = v10;
    v40.origin.y = v12;
    v40.size.width = v14;
    v40.size.height = v16;
    double v29 = (CGRectGetWidth(v40) - Width) * 0.5;
    v41.origin.x = v10;
    v41.origin.y = v12;
    v41.size.width = v14;
    v41.size.height = v16;
    double v33 = CGRectGetHeight(v41) - (v28 + v28) * 0.5;
  }
  else
  {
    objc_msgSend_setAxis_(self->_perAppModeSwitcher, v17, 1, v19);
    v42.origin.x = v10;
    v42.origin.y = v12;
    v42.size.width = v14;
    v42.size.height = v16;
    double v34 = CGRectGetWidth(v42);
    CCUISliderExpandedContentModuleWidth();
    double Width = (v34 - v35) * 0.5;
    v43.origin.x = v10;
    v43.origin.y = v12;
    v43.size.width = v14;
    v43.size.height = v16;
    double v28 = CGRectGetHeight(v43);
    v44.origin.x = v10;
    v44.origin.y = v12;
    v44.size.width = v14;
    v44.size.height = v16;
    double v29 = CGRectGetWidth(v44) - (Width + Width) * 0.5;
    v45.origin.x = v10;
    v45.origin.y = v12;
    v45.size.width = v14;
    v45.size.height = v16;
    double v33 = (CGRectGetHeight(v45) - v28) * 0.5;
  }
  perAppModeSwitcher = self->_perAppModeSwitcher;

  objc_msgSend_setFrame_(perAppModeSwitcher, v30, v31, v32, v29, v33, Width, v28);
}

- (void)viewWillLayoutSubviews
{
  v131.receiver = self;
  v131.super_class = (Class)AXCCTextSizeBackgroundViewController;
  [(AXCCTextSizeBackgroundViewController *)&v131 viewWillLayoutSubviews];
  objc_msgSend_setNumberOfLines_(self->_textSizeLabel, v3, 1, v4);
  objc_msgSend_sizeToFit(self->_textSizeLabel, v5, v6, v7);
  double v11 = objc_msgSend_view(self, v8, v9, v10);
  objc_msgSend_bounds(v11, v12, v13, v14);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  double v22 = v21;

  v132.origin.x = v16;
  v132.origin.y = v18;
  v132.size.width = v20;
  v132.size.height = v22;
  double Width = CGRectGetWidth(v132);
  CCUISliderExpandedContentModuleWidth();
  double v25 = v24;
  v133.origin.x = v16;
  v133.origin.y = v18;
  v133.size.width = v20;
  v133.size.height = v22;
  double Height = CGRectGetHeight(v133);
  CCUISliderExpandedContentModuleHeight();
  double v28 = v27;
  if ((CCUIIsPortrait() & 1) != 0
    || (objc_msgSend_currentDevice(MEMORY[0x263F82670], v29, v30, v31),
        uint64_t v32 = objc_claimAutoreleasedReturnValue(),
        uint64_t v36 = objc_msgSend_userInterfaceIdiom(v32, v33, v34, v35),
        v32,
        v36 == 1))
  {
    double v37 = (Height - v28) * 0.5;
    objc_msgSend_frame(self->_textSizeLabel, v29, v30, v31);
    if (v41 > v20)
    {
      objc_msgSend_frame(self->_textSizeLabel, v38, v39, v40);
      objc_msgSend_setFrame_(self->_textSizeLabel, v42, v43, v44);
    }
    v134.origin.x = v16;
    v134.origin.y = v18;
    v134.size.width = v20;
    v134.size.height = v22;
    CGRectGetMidX(v134);
  }
  else
  {
    double v45 = (Width - v25) * 0.5;
    v135.origin.x = v16;
    v135.origin.y = v18;
    v135.size.width = v20;
    v135.size.height = v22;
    double v37 = CGRectGetHeight(v135);
    objc_msgSend_frame(self->_textSizeLabel, v46, v47, v48);
    if (v51 > v45)
    {
      objc_msgSend_setNumberOfLines_(self->_textSizeLabel, v49, 0, v50);
      objc_msgSend_frame(self->_textSizeLabel, v52, v53, v54);
      objc_msgSend_setFrame_(self->_textSizeLabel, v55, v56, v57);
      objc_msgSend_sizeToFit(self->_textSizeLabel, v58, v59, v60);
      objc_msgSend_frame(self->_textSizeLabel, v61, v62, v63);
      if (v67 > v22)
      {
        objc_msgSend_frame(self->_textSizeLabel, v64, v65, v66);
        objc_msgSend_setFrame_(self->_textSizeLabel, v68, v69, v70);
      }
    }
    v136.origin.x = v16;
    v136.origin.y = v18;
    v136.size.width = v20;
    v136.size.height = v22;
    CGRectGetMidY(v136);
    objc_msgSend_frame(self->_textSizeLabel, v71, v72, v73);
  }
  UIPointRoundToViewScale();
  objc_msgSend_setCenter_(self->_textSizeLabel, v74, v75, v76);
  textSizeLabel = self->_textSizeLabel;
  objc_msgSend_frame(textSizeLabel, v78, v79, v80);
  UIRectIntegralWithScale();
  objc_msgSend_setFrame_(textSizeLabel, v81, v82, v83);
  objc_msgSend_sizeToFit(self->_textPercentageLabel, v84, v85, v86);
  objc_msgSend_frame(self->_textPercentageLabel, v87, v88, v89);
  objc_msgSend_center(self->_textSizeLabel, v90, v91, v92);
  objc_msgSend_frame(self->_textSizeLabel, v93, v94, v95);
  CGRectGetMaxY(v137);
  textPercentageLabel = self->_textPercentageLabel;
  UIRectIntegralWithScale();
  objc_msgSend_setFrame_(textPercentageLabel, v97, v98, v99);
  objc_msgSend_sizeToFit(self->_defaultLabel, v100, v101, v102);
  objc_msgSend_frame(self->_defaultLabel, v103, v104, v105);
  objc_msgSend_center(self->_textSizeLabel, v106, v107, v108);
  objc_msgSend_frame(self->_textPercentageLabel, v109, v110, v111);
  CGRectGetMaxY(v138);
  defaultLabel = self->_defaultLabel;
  UIRectIntegralWithScale();
  objc_msgSend_setFrame_(defaultLabel, v113, v114, v115);
  objc_msgSend_frame(self->_textPercentageLabel, v116, v117, v118);
  if (CGRectGetMaxY(v139) - v37 + 5.0 > 0.0)
  {
    objc_msgSend_frame(self->_textSizeLabel, v119, v120, v121);
    objc_msgSend_setFrame_(self->_textSizeLabel, v122, v123, v124);
    objc_msgSend_frame(self->_textPercentageLabel, v125, v126, v127);
    objc_msgSend_setFrame_(self->_textPercentageLabel, v128, v129, v130);
  }
  objc_msgSend__layoutPerAppControls(self, v119, v120, v121);
}

- (AXCCTextSizeHelper)helper
{
  return self->_helper;
}

- (void)setHelper:(id)a3
{
}

- (UILabel)textSizeLabel
{
  return self->_textSizeLabel;
}

- (void)setTextSizeLabel:(id)a3
{
}

- (UILabel)textPercentageLabel
{
  return self->_textPercentageLabel;
}

- (void)setTextPercentageLabel:(id)a3
{
}

- (UILabel)defaultLabel
{
  return self->_defaultLabel;
}

- (void)setDefaultLabel:(id)a3
{
}

- (NSMutableArray)switcherOptions
{
  return self->_switcherOptions;
}

- (void)setSwitcherOptions:(id)a3
{
}

- (AXCCExpandableButton)perAppModeSwitcher
{
  return self->_perAppModeSwitcher;
}

- (void)setPerAppModeSwitcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perAppModeSwitcher, 0);
  objc_storeStrong((id *)&self->_switcherOptions, 0);
  objc_storeStrong((id *)&self->_defaultLabel, 0);
  objc_storeStrong((id *)&self->_textPercentageLabel, 0);
  objc_storeStrong((id *)&self->_textSizeLabel, 0);

  objc_storeStrong((id *)&self->_helper, 0);
}

@end