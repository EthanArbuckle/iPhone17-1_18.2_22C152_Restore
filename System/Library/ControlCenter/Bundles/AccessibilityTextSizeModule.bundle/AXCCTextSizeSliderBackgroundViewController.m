@interface AXCCTextSizeSliderBackgroundViewController
- (AXCCExpandableButton)perAppModeSwitcher;
- (AXCCTextSizeHelper)helper;
- (BOOL)_canShowWhileLocked;
- (NSMutableArray)switcherOptions;
- (UILabel)defaultLabel;
- (UILabel)textPercentageLabel;
- (UILabel)textSizeLabel;
- (id)_attachmentAttributedString:(id)a3 withSystemImage:(id)a4;
- (id)_labelSubviewWithAttributedText:(id)a3;
- (id)_labelSubviewWithText:(id)a3;
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

@implementation AXCCTextSizeSliderBackgroundViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v103.receiver = self;
  v103.super_class = (Class)AXCCTextSizeSliderBackgroundViewController;
  [(AXCCTextSizeSliderBackgroundViewController *)&v103 viewDidLoad];
  v3 = AXCCLocalizedString(@"text.size.label");
  v5 = objc_msgSend__attachmentAttributedString_withSystemImage_(self, v4, (uint64_t)v3, @"textformat.size");

  objc_msgSend__labelSubviewWithAttributedText_(self, v6, (uint64_t)v5, v7);
  v8 = (UILabel *)objc_claimAutoreleasedReturnValue();
  textSizeLabel = self->_textSizeLabel;
  self->_textSizeLabel = v8;

  v13 = objc_msgSend_view(self, v10, v11, v12);
  objc_msgSend_addSubview_(v13, v14, (uint64_t)self->_textSizeLabel, v15);

  objc_msgSend__labelSubviewWithText_(self, v16, (uint64_t)&stru_26F4BC1F8, v17);
  v18 = (UILabel *)objc_claimAutoreleasedReturnValue();
  textPercentageLabel = self->_textPercentageLabel;
  self->_textPercentageLabel = v18;

  v23 = objc_msgSend_view(self, v20, v21, v22);
  objc_msgSend_addSubview_(v23, v24, (uint64_t)self->_textPercentageLabel, v25);

  v26 = AXCCLocalizedString(@"default.label");
  objc_msgSend__labelSubviewWithText_(self, v27, (uint64_t)v26, v28);
  v29 = (UILabel *)objc_claimAutoreleasedReturnValue();
  defaultLabel = self->_defaultLabel;
  self->_defaultLabel = v29;

  objc_msgSend_setAlpha_(self->_defaultLabel, v31, v32, v33, 0.0);
  v37 = objc_msgSend_view(self, v34, v35, v36);
  objc_msgSend_addSubview_(v37, v38, (uint64_t)self->_defaultLabel, v39);

  v40 = [AXCCExpandableButton alloc];
  v44 = (AXCCExpandableButton *)objc_msgSend_initForControlCenter(v40, v41, v42, v43);
  perAppModeSwitcher = self->_perAppModeSwitcher;
  self->_perAppModeSwitcher = v44;

  objc_msgSend_addTarget_action_forControlEvents_(self->_perAppModeSwitcher, v46, (uint64_t)self, (uint64_t)sel__togglePerAppButton_, 4096);
  objc_msgSend_setButtonImageSize_(self->_perAppModeSwitcher, v47, v48, v49, 54.0, 54.0);
  objc_msgSend_setMaximumExpandedSize_(self->_perAppModeSwitcher, v50, v51, v52, 0.0, 228.0);
  objc_msgSend_setExpanded_(self->_perAppModeSwitcher, v53, 1, v54);
  v58 = objc_msgSend_view(self, v55, v56, v57);
  objc_msgSend_addSubview_(v58, v59, (uint64_t)self->_perAppModeSwitcher, v60);

  v61 = (NSMutableArray *)objc_opt_new();
  switcherOptions = self->_switcherOptions;
  self->_switcherOptions = v61;

  unint64_t v66 = 0;
  while (v66 < objc_msgSend_count(&unk_26F4BF2C8, v63, v64, v65))
  {
    v69 = (void *)MEMORY[0x263F827E8];
    v70 = objc_msgSend_objectAtIndexedSubscript_(&unk_26F4BF2C8, v67, v66, v68);
    v73 = objc_msgSend_systemImageNamed_(v69, v71, (uint64_t)v70, v72);

    v74 = objc_alloc_init(AXCCExpandableButtonOption);
    v78 = objc_msgSend_systemWhiteColor(MEMORY[0x263F825C8], v75, v76, v77);
    objc_msgSend_setSelectedBackgroundColor_(v74, v79, (uint64_t)v78, v80);

    objc_msgSend_setImage_(v74, v81, (uint64_t)v73, v82);
    objc_msgSend_addObject_(self->_switcherOptions, v83, (uint64_t)v74, v84);

    if (++v66 == 4) {
      goto LABEL_8;
    }
  }
  v85 = AXLogCommon();
  if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
    sub_2406150E8(v85);
  }

LABEL_8:
  v86 = objc_msgSend_lastObject(self->_switcherOptions, v63, v64, v65);
  v87 = AXCCLocalizedString(@"global.label");
  objc_msgSend_setTitle_(v86, v88, (uint64_t)v87, v89);

  objc_msgSend__updateLabelFonts(self, v90, v91, v92);
  v96 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v93, v94, v95);
  objc_msgSend_addObserver_selector_name_object_(v96, v97, (uint64_t)self, (uint64_t)sel__contentSizeCategoryDidChange_, *MEMORY[0x263F83428], 0);

  v101 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v98, v99, v100);
  objc_msgSend_addObserver_selector_name_object_(v101, v102, (uint64_t)self, (uint64_t)sel__contentSizeCategoryDidChangeInternally_, @"AXCCInternalTextSizeDidUpdate", 0);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v19.receiver = self;
  v19.super_class = (Class)AXCCTextSizeSliderBackgroundViewController;
  [(AXCCTextSizeSliderBackgroundViewController *)&v19 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3)
  {
    v9 = objc_msgSend_view(self, v6, v7, v8);
    uint64_t v12 = objc_msgSend_visualStylingProviderForCategory_(v9, v10, 1, v11);

    v13 = [AXCCVisualStylingProvider alloc];
    v16 = objc_msgSend_initWithVisualStylingProvider_(v13, v14, (uint64_t)v12, v15);
    objc_msgSend_setStylingProvider_(self->_perAppModeSwitcher, v17, (uint64_t)v16, v18);
  }
}

- (void)dealloc
{
  v5 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  v8.receiver = self;
  v8.super_class = (Class)AXCCTextSizeSliderBackgroundViewController;
  [(AXCCTextSizeSliderBackgroundViewController *)&v8 dealloc];
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
  v9.super_class = (Class)AXCCTextSizeSliderBackgroundViewController;
  [(AXCCTextSizeSliderBackgroundViewController *)&v9 viewWillAppear:a3];
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
  v9[2] = sub_24060B7B8;
  v9[3] = &unk_2650C76A8;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  objc_msgSend_animateWithDuration_animations_(v5, v7, (uint64_t)v9, v8, 0.1);
}

- (id)_labelSubviewWithText:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F828E0];
  id v4 = a3;
  id v5 = [v3 alloc];
  objc_super v9 = objc_msgSend_initWithFrame_(v5, v6, v7, v8, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v13 = objc_msgSend_whiteColor(MEMORY[0x263F825C8], v10, v11, v12);
  objc_msgSend_setTextColor_(v9, v14, (uint64_t)v13, v15);

  objc_msgSend_setText_(v9, v16, (uint64_t)v4, v17);
  objc_msgSend_controlCenterApplyPrimaryContentShadow(v9, v18, v19, v20);

  return v9;
}

- (id)_labelSubviewWithAttributedText:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F828E0];
  id v4 = a3;
  id v5 = [v3 alloc];
  objc_super v9 = objc_msgSend_initWithFrame_(v5, v6, v7, v8, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v13 = objc_msgSend_whiteColor(MEMORY[0x263F825C8], v10, v11, v12);
  objc_msgSend_setTextColor_(v9, v14, (uint64_t)v13, v15);

  objc_msgSend_setAttributedText_(v9, v16, (uint64_t)v4, v17);
  objc_msgSend_controlCenterApplyPrimaryContentShadow(v9, v18, v19, v20);

  return v9;
}

- (id)_attachmentAttributedString:(id)a3 withSystemImage:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F81678];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  uint64_t v11 = objc_msgSend_configurationWithTextStyle_(MEMORY[0x263F82818], v9, *MEMORY[0x263F83610], v10);
  v13 = objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x263F827E8], v12, (uint64_t)v6, (uint64_t)v11);

  uint64_t v17 = objc_msgSend_whiteColor(MEMORY[0x263F825C8], v14, v15, v16);
  uint64_t v20 = objc_msgSend_imageWithTintColor_(v13, v18, (uint64_t)v17, v19);
  objc_msgSend_setImage_(v8, v21, (uint64_t)v20, v22);

  uint64_t v25 = objc_msgSend_attributedStringWithAttachment_(MEMORY[0x263F089B8], v23, (uint64_t)v8, v24);
  id v26 = objc_alloc(MEMORY[0x263F089B8]);
  v29 = objc_msgSend_initWithString_(v26, v27, (uint64_t)v7, v28);

  objc_msgSend_insertAttributedString_atIndex_(v29, v30, (uint64_t)v25, 0);

  return v29;
}

- (id)_preferredCategoryWithPerAppSettings
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_categoryName(self->_helper, a2, v2, v3);
  id v6 = AXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = NSNumber;
    uint64_t v11 = objc_msgSend_state(self->_helper, v7, v8, v9);
    v14 = objc_msgSend_numberWithUnsignedInt_(v10, v12, v11, v13);
    int v16 = 138412546;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v14;
    _os_log_impl(&dword_240604000, v6, OS_LOG_TYPE_INFO, "Preferrefed category: %@ = %@", (uint8_t *)&v16, 0x16u);
  }

  return v5;
}

- (void)_updateLabelFonts
{
  objc_msgSend__preferredCategoryWithPerAppSettings(self, a2, v2, v3);
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x263F82DA0], v5, (uint64_t)v39, v6);
  textSizeLabel = self->_textSizeLabel;
  uint64_t v9 = AXCCLocalizedString(@"text.size.label");
  uint64_t v11 = objc_msgSend__attachmentAttributedString_withSystemImage_(self, v10, (uint64_t)v9, @"textformat.size");
  objc_msgSend_setAttributedText_(textSizeLabel, v12, (uint64_t)v11, v13);

  uint64_t v15 = objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(MEMORY[0x263F81708], v14, *MEMORY[0x263F83610], (uint64_t)v7);
  objc_msgSend_setFont_(self->_textSizeLabel, v16, (uint64_t)v15, v17);

  uint64_t v19 = objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(MEMORY[0x263F81708], v18, *MEMORY[0x263F835F8], (uint64_t)v7);
  objc_msgSend_setFont_(self->_textPercentageLabel, v20, (uint64_t)v19, v21);

  uint64_t v25 = objc_msgSend__preferredCategoryWithPerAppSettings(self, v22, v23, v24);
  objc_msgSend__updateDefaultLabelPercentageForContentSizeCategory_(self, v26, (uint64_t)v25, v27);

  v29 = objc_msgSend_defaultFontDescriptorWithTextStyle_addingSymbolicTraits_options_(MEMORY[0x263F81720], v28, *MEMORY[0x263F83570], 2, 0);
  v30 = (void *)MEMORY[0x263F81708];
  objc_msgSend_pointSize(v29, v31, v32, v33);
  uint64_t v36 = objc_msgSend_fontWithDescriptor_size_(v30, v34, (uint64_t)v29, v35);
  objc_msgSend_setFont_(self->_defaultLabel, v37, (uint64_t)v36, v38);
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
  uint64_t v43 = (char *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_state(self->_helper, v5, v6, v7) == 3)
  {
    uint64_t v11 = v43;
  }
  else
  {
    uint64_t v12 = objc_msgSend_categoryName(self->_helper, v8, v9, v10);

    uint64_t v11 = (const char *)v12;
  }
  v44 = (char *)v11;
  uint64_t v13 = objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x263F82DA0], v11, (uint64_t)v11, v10);
  uint64_t v17 = objc_msgSend_font(self->_textSizeLabel, v14, v15, v16);
  uint64_t v20 = objc_msgSend__fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection_(v17, v18, (uint64_t)v13, v19);
  objc_msgSend_setFont_(self->_textSizeLabel, v21, (uint64_t)v20, v22);

  id v26 = objc_msgSend_font(self->_textPercentageLabel, v23, v24, v25);
  v29 = objc_msgSend__fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection_(v26, v27, (uint64_t)v13, v28);
  objc_msgSend_setFont_(self->_textPercentageLabel, v30, (uint64_t)v29, v31);

  objc_msgSend__updateDefaultLabelPercentageForContentSizeCategory_(self, v32, (uint64_t)v44, v33);
  objc_msgSend__updateDefaultLabelVisibilityForContentSizeCategory_(self, v34, (uint64_t)v44, v35);
  id v39 = objc_msgSend_view(self, v36, v37, v38);
  objc_msgSend_setNeedsLayout(v39, v40, v41, v42);
}

- (void)_updatePerAppControls
{
  uint64_t v105 = *MEMORY[0x263EF8340];
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
      uint64_t v19 = objc_msgSend_appsNames(self->_helper, v16, v17, v18);
      v98 = objc_msgSend_appsIdentifiers(self->_helper, v20, v21, v22);
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id obj = v19;
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v100, (uint64_t)v104, 16);
      if (v24)
      {
        uint64_t v28 = v24;
        int v99 = 0;
        uint64_t v97 = *(void *)v101;
        while (2)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v101 != v97) {
              objc_enumerationMutation(obj);
            }
            uint64_t v30 = *(void *)(*((void *)&v100 + 1) + 8 * i);
            if (objc_msgSend_count(self->_switcherOptions, v25, v26, v27) - 1 <= (unint64_t)(v99 + i))
            {
              uint64_t v64 = AXLogCommon();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
                sub_24061512C(v64);
              }

              goto LABEL_21;
            }
            uint64_t v33 = v15;
            uint64_t v34 = (v99 + i);
            uint64_t v35 = objc_msgSend_objectAtIndex_(self->_switcherOptions, v31, v34, v32);
            uint64_t v36 = NSString;
            uint64_t v37 = AXCCLocalizedString(@"perapp.label");
            v40 = objc_msgSend_localizedStringWithFormat_(v36, v38, (uint64_t)v37, v39, v30);
            objc_msgSend_setTitle_(v35, v41, (uint64_t)v40, v42);

            v45 = objc_msgSend_objectAtIndexedSubscript_(v98, v43, v34, v44);
            char isEqualToString = objc_msgSend_isEqualToString_(v45, v46, @"com.apple.springboard", v47);

            uint64_t v51 = (void *)MEMORY[0x263F827E8];
            if (isEqualToString)
            {
              uint64_t v52 = objc_msgSend_systemImageNamed_(MEMORY[0x263F827E8], v49, @"square.3.stack.3d.top.fill", v50);
              objc_msgSend_setImage_(v35, v53, (uint64_t)v52, v54);
            }
            else
            {
              uint64_t v52 = objc_msgSend_objectAtIndexedSubscript_(v98, v49, v34, v50);
              uint64_t v56 = objc_msgSend__applicationIconImageForBundleIdentifier_format_(v51, v55, (uint64_t)v52, 0);
              objc_msgSend_setImage_(v35, v57, (uint64_t)v56, v58);
            }
            uint64_t v15 = v33;
            objc_msgSend_addObject_(v33, v59, (uint64_t)v35, v60);
          }
          uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v100, (uint64_t)v104, 16);
          v99 += i;
          if (v28) {
            continue;
          }
          break;
        }
      }
LABEL_21:

      if (objc_msgSend_count(v15, v65, v66, v67))
      {
        v71 = objc_msgSend_lastObject(self->_switcherOptions, v68, v69, v70);
        objc_msgSend_addObject_(v15, v72, (uint64_t)v71, v73);

        objc_msgSend_setOptions_(self->_perAppModeSwitcher, v74, (uint64_t)v15, v75);
        objc_msgSend_setExpanded_(self->_perAppModeSwitcher, v76, 1, v77);
        if (objc_msgSend_state(self->_helper, v78, v79, v80) == 3)
        {
          uint64_t v84 = objc_msgSend_options(self->_perAppModeSwitcher, v81, v82, v83);
          uint64_t v88 = objc_msgSend_count(v84, v85, v86, v87);
          objc_msgSend_setSelectedOptionIndex_(self->_perAppModeSwitcher, v89, v88 - 1, v90);
        }
        else
        {
          unsigned int v93 = objc_msgSend_state(self->_helper, v81, v82, v83);
          objc_msgSend_setSelectedOptionIndex_(self->_perAppModeSwitcher, v94, v93, v95);
        }
      }
      else
      {
        objc_msgSend_setOptions_(self->_perAppModeSwitcher, v68, 0, v70);
        objc_msgSend_setHidden_(self->_perAppModeSwitcher, v91, 1, v92);
      }
    }
    else
    {
      objc_msgSend_setOptions_(perAppModeSwitcher, v11, 0, v12);
      v63 = self->_perAppModeSwitcher;
      objc_msgSend_setHidden_(v63, v61, 1, v62);
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
  v131.super_class = (Class)AXCCTextSizeSliderBackgroundViewController;
  [(AXCCTextSizeSliderBackgroundViewController *)&v131 viewWillLayoutSubviews];
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