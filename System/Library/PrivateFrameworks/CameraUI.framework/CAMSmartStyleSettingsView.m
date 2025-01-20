@interface CAMSmartStyleSettingsView
+ (double)dpadWidthRatio;
+ (id)_descriptionForStylePreset:(int64_t)a3;
+ (id)continueButtonConfiguration;
+ (id)showAssetsButtonConfiguration;
- (BOOL)_didCompleteChooseInstructions;
- (BOOL)_didCompleteTuneInstructions;
- (BOOL)_hasEnoughPhotos;
- (BOOL)_isBlockingStageButtons;
- (BOOL)_readBooleanPreferenceForKey:(id)a3;
- (BOOL)_usingMostCompatibleFormat;
- (BOOL)scrollEnabled;
- (CAMFeedbackController)_feedbackController;
- (CAMScrollViewWithLayoutDelegate)_scrollView;
- (CAMSemanticStylePicker)_stylePicker;
- (CAMSmartStyleSettingsView)initWithDelegate:(id)a3 stylePresets:(id)a4 selectedIndex:(int64_t)a5 hasEnoughPhotos:(BOOL)a6 usingMostCompatibleFormat:(BOOL)a7;
- (CAMSmartStyleSettingsViewDelegate)delegate;
- (CEKAnimationSequence)_animationSequence;
- (CEKSmartStyle)_selectedStyle;
- (NSArray)_styleClippingContainerViews;
- (NSArray)_styleNames;
- (NSArray)_styleTypes;
- (NSLayoutConstraint)_continueButtonBottomConstraint;
- (NSLayoutConstraint)_continueButtonIntroDescriptionLabelConstraint;
- (NSLayoutConstraint)_continueButtonLaunchCameraButtonConstraint;
- (NSLayoutConstraint)_continueButtonResetButtonConstraint;
- (NSLayoutConstraint)_continueButtonStartOverButtonConstraint;
- (NSLayoutConstraint)_finishedStackTopConstraint;
- (NSLayoutConstraint)_pickerFinishedStackConstraint;
- (NSLayoutConstraint)_pickerTopConstraint;
- (NSLayoutConstraint)_tuneInstructionLabelBottomConstraint;
- (NSMutableArray)_continueButtonBelowIntensitySliderConstraints;
- (NSMutableArray)_intensitySliderBelowDescriptionConstraints;
- (NSMutableArray)_intensitySliderBelowDpadConstraints;
- (NSMutableArray)_intensitySliders;
- (NSMutableArray)_styleBadgeBelowDotsConstraints;
- (NSMutableArray)_styleBadgeBelowImageConstraints;
- (NSMutableArray)_styleBadgeCenterXConstraints;
- (NSMutableArray)_styleDescriptionLabels;
- (NSMutableArray)_styleNameBadges;
- (NSMutableDictionary)_previewViewControllersByStyleIndex;
- (NSMutableSet)_stageButtonSuppressionReasons;
- (PEPhotoStyleDPad)_dpadControl;
- (UIButton)_continueButton;
- (UIButton)_launchCameraButton;
- (UIButton)_resetButton;
- (UIButton)_selectAssetsButton;
- (UIButton)_showGridButton;
- (UIButton)_startOverButton;
- (UIImage)_thumbnailPreviewImage;
- (UIImageView)_chooseInstructionArrow;
- (UIImageView)_introImageView;
- (UILabel)_chooseInstructionLabel;
- (UILabel)_introDescriptionLabel;
- (UILabel)_introInstructionLabel;
- (UILabel)_introTitleLabel;
- (UILabel)_tuneInstructionLabel;
- (UIPageControl)_previewPageDots;
- (UIStackView)_finishedStack;
- (double)_desiredCarouselRatio;
- (id)_assetButtonConfiguration;
- (id)_centerSquareOfImage:(id)a3 appliesScale:(BOOL)a4;
- (id)_continueButtonTitle;
- (id)_debugStringForStage:(unint64_t)a3;
- (id)_fontWithTextStyle:(id)a3;
- (id)_fontWithTextStyle:(id)a3 traits:(unsigned int)a4;
- (id)_newInstructionLabel;
- (id)_newSecondaryButton;
- (id)_secondaryButtonConfiguration;
- (id)_selectedStyleDescription;
- (id)_showGridButtonConfiguration;
- (id)_titleCheckmarkView;
- (id)_titleLabelWithText:(id)a3;
- (int64_t)_previewIndexFromPageDots;
- (int64_t)_selectedStylePreset;
- (int64_t)_userFacingContentPageNumberForStage:(unint64_t)a3;
- (int64_t)visiblePreviewIndex;
- (unint64_t)_stage;
- (void)_addConstraints;
- (void)_advanceToTuneStageIfPossible;
- (void)_beginAssetSelection:(id)a3;
- (void)_createNeededStylePages;
- (void)_dpadControlUpdated:(id)a3;
- (void)_handleContinueButton:(id)a3;
- (void)_handlePageControlValueChanged:(id)a3;
- (void)_handleShowGridButton:(id)a3;
- (void)_handleStylePickerTap:(id)a3;
- (void)_intensitySliderUpdated;
- (void)_launchCamera:(id)a3;
- (void)_layoutMaskedViews;
- (void)_moveToNextStageIfAllowedAnimated:(BOOL)a3;
- (void)_moveToPreviousStageIfAllowed;
- (void)_performHaptics;
- (void)_playTuneInstructionAnimations;
- (void)_prepareHaptics;
- (void)_removeChildViewController:(id)a3;
- (void)_removeStylePageForIndex:(int64_t)a3;
- (void)_resetStyleAndDismiss:(id)a3;
- (void)_setAnimationSequence:(id)a3;
- (void)_setBooleanPreference:(BOOL)a3 forKey:(id)a4;
- (void)_setDidCompleteChooseInstructions:(BOOL)a3;
- (void)_setDidCompleteTuneInstructions:(BOOL)a3;
- (void)_setPreviewViewControllersExpandedItemIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)_setStage:(unint64_t)a3;
- (void)_setStage:(unint64_t)a3 animated:(BOOL)a4;
- (void)_setStageButtonsEnabled:(BOOL)a3 forReason:(id)a4;
- (void)_setVisiblePreviewIndex:(int64_t)a3 updatePageControl:(BOOL)a4 updateStylePicker:(BOOL)a5 animated:(BOOL)a6 notifyDelegate:(BOOL)a7;
- (void)_stageUpdates;
- (void)_startOver:(id)a3;
- (void)_updateAlphaForChooseInstructions;
- (void)_updateDpadBackground;
- (void)_updateForStageAnimated:(BOOL)a3 scrollToTop:(BOOL)a4;
- (void)_updatePreviewAdjustmentsUpdateModelValues:(BOOL)a3;
- (void)_updatePreviewPageDots;
- (void)_updateShowGridButtonAnimated:(BOOL)a3;
- (void)didFinishPickingAssets;
- (void)semanticStylePickerDidChangeSelectedStyle:(id)a3;
- (void)semanticStylePickerDidScroll:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)stopAllAnimations;
- (void)updateImageViews;
- (void)zoomOutToGridAnimated:(BOOL)a3;
@end

@implementation CAMSmartStyleSettingsView

- (CAMSmartStyleSettingsView)initWithDelegate:(id)a3 stylePresets:(id)a4 selectedIndex:(int64_t)a5 hasEnoughPhotos:(BOOL)a6 usingMostCompatibleFormat:(BOOL)a7
{
  BOOL v142 = a7;
  v151[2] = *MEMORY[0x263EF8340];
  id obj = a3;
  id v144 = a4;
  v150.receiver = self;
  v150.super_class = (Class)CAMSmartStyleSettingsView;
  v11 = -[CAMSmartStyleSettingsView initWithFrame:](&v150, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v11)
  {
    BOOL v134 = +[CAMCaptureCapabilities isCameraAppInstalled];
    location = (id *)&v11->_delegate;
    objc_storeWeak((id *)&v11->_delegate, obj);
    v11->__hasEnoughPhotos = a6;
    v11->__usingMostCompatibleFormat = v142;
    v12 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(CAMSmartStyleSettingsView *)v11 setBackgroundColor:v12];

    v13 = objc_alloc_init(CAMScrollViewWithLayoutDelegate);
    scrollView = v11->__scrollView;
    v11->__scrollView = v13;

    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView setShowsVerticalScrollIndicator:1];
    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView setShowsHorizontalScrollIndicator:0];
    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView setLayoutDelegate:v11];
    [(CAMSmartStyleSettingsView *)v11 addSubview:v11->__scrollView];
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    styleNameBadges = v11->__styleNameBadges;
    v11->__styleNameBadges = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    intensitySliders = v11->__intensitySliders;
    v11->__intensitySliders = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    styleDescriptionLabels = v11->__styleDescriptionLabels;
    v11->__styleDescriptionLabels = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    styleBadgeBelowDotsConstraints = v11->__styleBadgeBelowDotsConstraints;
    v11->__styleBadgeBelowDotsConstraints = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    styleBadgeBelowImageConstraints = v11->__styleBadgeBelowImageConstraints;
    v11->__styleBadgeBelowImageConstraints = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    styleBadgeCenterXConstraints = v11->__styleBadgeCenterXConstraints;
    v11->__styleBadgeCenterXConstraints = v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    intensitySliderBelowDescriptionConstraints = v11->__intensitySliderBelowDescriptionConstraints;
    v11->__intensitySliderBelowDescriptionConstraints = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    intensitySliderBelowDpadConstraints = v11->__intensitySliderBelowDpadConstraints;
    v11->__intensitySliderBelowDpadConstraints = v29;

    v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    continueButtonBelowIntensitySliderConstraints = v11->__continueButtonBelowIntensitySliderConstraints;
    v11->__continueButtonBelowIntensitySliderConstraints = v31;

    if ([v144 count] < (unint64_t)a5) {
      a5 = 0;
    }
    v33 = [v144 objectAtIndexedSubscript:a5];
    uint64_t v34 = [v33 integerValue];

    id WeakRetained = objc_loadWeakRetained(location);
    v135 = [WeakRetained settingsView:v11 requestsStyleForPresetType:v34];

    uint64_t v36 = [&unk_26BDDFFB0 arrayByAddingObjectsFromArray:v144];
    styleTypes = v11->__styleTypes;
    v11->__styleTypes = (NSArray *)v36;

    if (a5 > 0 || ([v135 isNeutral] & 1) == 0) {
      [(CAMSmartStyleSettingsView *)v11 _setDidCompleteChooseInstructions:1];
    }
    if ([(CAMSmartStyleSettingsView *)v11 _didCompleteChooseInstructions]) {
      unint64_t v38 = a5 + 1;
    }
    else {
      unint64_t v38 = 0;
    }
    v11->_visiblePreviewIndex = v38;
    v11->__stage = 0;
    v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    previewViewControllersByStyleIndex = v11->__previewViewControllersByStyleIndex;
    v11->__previewViewControllersByStyleIndex = v39;

    uint64_t v41 = [MEMORY[0x263EFF9C0] set];
    stageButtonSuppressionReasons = v11->__stageButtonSuppressionReasons;
    v11->__stageButtonSuppressionReasons = (NSMutableSet *)v41;

    v43 = (void *)MEMORY[0x263F827E8];
    v44 = CAMCameraUIFrameworkBundle();
    v139 = [v43 imageNamed:@"CAMSmartStyleSettingsGraphic" inBundle:v44];

    uint64_t v45 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v139];
    introImageView = v11->__introImageView;
    v11->__introImageView = (UIImageView *)v45;

    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v11->__introImageView];
    v138 = CAMLocalizedFrameworkString(@"SMART_STYLES_SETTINGS_TITLE_INTRO", 0);
    uint64_t v47 = [(CAMSmartStyleSettingsView *)v11 _titleLabelWithText:v138];
    introTitleLabel = v11->__introTitleLabel;
    v11->__introTitleLabel = (UILabel *)v47;

    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v11->__introTitleLabel];
    v137 = CAMLocalizedFrameworkString(@"SMART_STYLES_SETTINGS_TITLE_FINISHED", 0);
    id v49 = objc_alloc(MEMORY[0x263F82BF8]);
    v50 = [(CAMSmartStyleSettingsView *)v11 _titleCheckmarkView];
    v151[0] = v50;
    v51 = [(CAMSmartStyleSettingsView *)v11 _titleLabelWithText:v137];
    v151[1] = v51;
    v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v151 count:2];
    uint64_t v53 = [v49 initWithArrangedSubviews:v52];
    finishedStack = v11->__finishedStack;
    v11->__finishedStack = (UIStackView *)v53;

    [(UIStackView *)v11->__finishedStack setAxis:0];
    [(UIStackView *)v11->__finishedStack setSpacing:8.0];
    [(UIStackView *)v11->__finishedStack setAlignment:3];
    [(UIStackView *)v11->__finishedStack setDistribution:0];
    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v11->__finishedStack];
    id v55 = objc_alloc_init(MEMORY[0x263EFF980]);
    if ([(NSArray *)v11->__styleTypes count])
    {
      unint64_t v56 = 0;
      do
      {
        id v57 = objc_alloc_init(MEMORY[0x263F82E00]);
        [v57 setClipsToBounds:1];
        [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v57];
        [v55 addObject:v57];

        ++v56;
      }
      while (v56 < [(NSArray *)v11->__styleTypes count]);
    }
    objc_storeStrong((id *)&v11->__styleClippingContainerViews, v55);
    [(CAMSmartStyleSettingsView *)v11 _createNeededStylePages];
    v58 = objc_alloc_init(CAMSemanticStylePicker);
    stylePicker = v11->__stylePicker;
    v11->__stylePicker = v58;

    [(CAMSemanticStylePicker *)v11->__stylePicker setDelegate:v11];
    [(CAMSemanticStylePicker *)v11->__stylePicker setNumberOfStyles:[(NSArray *)v11->__styleTypes count]];
    [(CAMSemanticStylePicker *)v11->__stylePicker setSelectedStyleIndex:v38];
    [(CAMSemanticStylePicker *)v11->__stylePicker setHidesSelfWhenNotExpanded:0];
    [(CAMSemanticStylePicker *)v11->__stylePicker setExpanded:1];
    [(CAMSemanticStylePicker *)v11->__stylePicker setSpacerWidth:3.0];
    [(CAMSemanticStylePicker *)v11->__stylePicker setMaterial:4];
    v60 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(CAMSemanticStylePicker *)v11->__stylePicker setMaterialColor:v60];

    v61 = [(CAMSemanticStylePicker *)v11->__stylePicker pageControl];
    [v61 setHidden:1];

    v62 = v11->__stylePicker;
    v63 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v11 action:sel__handleStylePickerTap_];
    [(CAMSemanticStylePicker *)v62 addGestureRecognizer:v63];

    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v11->__stylePicker];
    v64 = v11->__styleTypes;
    v148[0] = MEMORY[0x263EF8330];
    v148[1] = 3221225472;
    v148[2] = __115__CAMSmartStyleSettingsView_initWithDelegate_stylePresets_selectedIndex_hasEnoughPhotos_usingMostCompatibleFormat___block_invoke;
    v148[3] = &unk_263FA33C8;
    v65 = v11;
    v149 = v65;
    [(NSArray *)v64 enumerateObjectsUsingBlock:v148];
    if (v38 >= [(NSArray *)v11->__styleTypes count])
    {
      v66 = &unk_26BDDE5E0;
    }
    else
    {
      v66 = [(NSArray *)v11->__styleTypes objectAtIndexedSubscript:v38];
    }
    uint64_t v67 = objc_msgSend(v66, "integerValue", v66);
    id v68 = objc_loadWeakRetained(location);
    locationa = [v68 settingsView:v65 requestsStyleForPresetType:v67];

    v136 = (void *)[objc_alloc(MEMORY[0x263F306F8]) initWithPresetType:v67];
    uint64_t v69 = objc_msgSend(objc_alloc(MEMORY[0x263F5E228]), "initWithSize:", 125.0, 125.0);
    dpadControl = v65->__dpadControl;
    v65->__dpadControl = (PEPhotoStyleDPad *)v69;

    [obj addChildViewController:v65->__dpadControl toView:v65];
    v71 = [(PEPhotoStyleDPad *)v65->__dpadControl view];
    [v71 layoutIfNeeded];

    [(CAMSmartStyleSettingsView *)v65 _updateDpadBackground];
    objc_initWeak(&from, v65);
    v145[0] = MEMORY[0x263EF8330];
    v145[1] = 3221225472;
    v145[2] = __115__CAMSmartStyleSettingsView_initWithDelegate_stylePresets_selectedIndex_hasEnoughPhotos_usingMostCompatibleFormat___block_invoke_3;
    v145[3] = &unk_263FA1F08;
    objc_copyWeak(&v146, &from);
    [(PEPhotoStyleDPad *)v65->__dpadControl setOnValueChanged:v145];
    +[CAMSmartStyleUtilities slider2DValueForStyle:locationa limitRangeForSystemStyles:1];
    double v73 = v72;
    double v75 = v74;
    +[CAMSmartStyleUtilities slider2DValueForStyle:v136 limitRangeForSystemStyles:1];
    double v77 = v76;
    double v79 = v78;
    -[PEPhotoStyleDPad setValue:notifyObserver:](v65->__dpadControl, "setValue:notifyObserver:", 0, v73, v75);
    -[PEPhotoStyleDPad setDefaultValue:](v65->__dpadControl, "setDefaultValue:", v77, v79);
    v80 = (UIPageControl *)objc_alloc_init(MEMORY[0x263F829F0]);
    previewPageDots = v65->__previewPageDots;
    v65->__previewPageDots = v80;

    [(UIPageControl *)v65->__previewPageDots setUserInteractionEnabled:1];
    [(UIPageControl *)v65->__previewPageDots setAllowsContinuousInteraction:1];
    [(CAMSmartStyleSettingsView *)v65 _updatePreviewPageDots];
    v82 = [MEMORY[0x263F825C8] systemGrayColor];
    [(UIPageControl *)v65->__previewPageDots setPageIndicatorTintColor:v82];

    v83 = [MEMORY[0x263F825C8] labelColor];
    [(UIPageControl *)v65->__previewPageDots setCurrentPageIndicatorTintColor:v83];

    [(UIPageControl *)v65->__previewPageDots addTarget:v65 action:sel__handlePageControlValueChanged_ forControlEvents:4096];
    [(UIPageControl *)v65->__previewPageDots addTarget:v65 action:sel__handlePageControlTouchDown_ forControlEvents:1];
    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v65->__previewPageDots];
    v84 = (void *)MEMORY[0x263F824E8];
    v85 = [(CAMSmartStyleSettingsView *)v65 _assetButtonConfiguration];
    uint64_t v86 = [v84 buttonWithConfiguration:v85 primaryAction:0];
    selectAssetsButton = v65->__selectAssetsButton;
    v65->__selectAssetsButton = (UIButton *)v86;

    [(UIButton *)v65->__selectAssetsButton addTarget:v65 action:sel__beginAssetSelection_ forControlEvents:64];
    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v65->__selectAssetsButton];
    v88 = (void *)MEMORY[0x263F824E8];
    v89 = [(CAMSmartStyleSettingsView *)v65 _showGridButtonConfiguration];
    uint64_t v90 = [v88 buttonWithConfiguration:v89 primaryAction:0];
    showGridButton = v65->__showGridButton;
    v65->__showGridButton = (UIButton *)v90;

    [(UIButton *)v65->__showGridButton addTarget:v65 action:sel__handleShowGridButton_ forControlEvents:64];
    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v65->__showGridButton];
    v92 = @"SMART_STYLES_SETTINGS_INTRO_INSTRUCTION_NOT_ENOUGH_PHOTOS_NO_CAMERA_APP";
    if (v134) {
      v92 = @"SMART_STYLES_SETTINGS_INTRO_INSTRUCTION_NOT_ENOUGH_PHOTOS";
    }
    if (v142) {
      v92 = @"SMART_STYLES_SETTINGS_INTRO_INSTRUCTION_MOST_COMPATIBLE_FORMAT";
    }
    if (v11->__hasEnoughPhotos) {
      v93 = @"SMART_STYLES_SETTINGS_INTRO_INSTRUCTION";
    }
    else {
      v93 = v92;
    }
    v94 = CAMLocalizedFrameworkString(v93, 0);
    uint64_t v95 = [(CAMSmartStyleSettingsView *)v65 _newInstructionLabel];
    introInstructionLabel = v65->__introInstructionLabel;
    v65->__introInstructionLabel = (UILabel *)v95;

    [(UILabel *)v65->__introInstructionLabel setText:v94];
    v97 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v65->__introInstructionLabel setTextColor:v97];

    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v65->__introInstructionLabel];
    uint64_t v98 = [(CAMSmartStyleSettingsView *)v65 _newInstructionLabel];
    introDescriptionLabel = v65->__introDescriptionLabel;
    v65->__introDescriptionLabel = (UILabel *)v98;

    v100 = CAMLocalizedFrameworkString(@"SMART_STYLES_SETTINGS_INTRO_DESCRIPTION", 0);
    [(UILabel *)v65->__introDescriptionLabel setText:v100];

    v101 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v65->__introDescriptionLabel setTextColor:v101];

    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v65->__introDescriptionLabel];
    uint64_t v102 = [(CAMSmartStyleSettingsView *)v65 _newInstructionLabel];
    chooseInstructionLabel = v65->__chooseInstructionLabel;
    v65->__chooseInstructionLabel = (UILabel *)v102;

    v104 = CAMLocalizedFrameworkString(@"SMART_STYLES_SETTINGS_CHOOSE_INSTRUCTION", 0);
    [(UILabel *)v65->__chooseInstructionLabel setText:v104];

    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v65->__chooseInstructionLabel];
    v105 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F83570]];
    v106 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.forward" withConfiguration:v105];
    uint64_t v107 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v106];
    chooseInstructionArrow = v65->__chooseInstructionArrow;
    v65->__chooseInstructionArrow = (UIImageView *)v107;

    v109 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UIImageView *)v65->__chooseInstructionArrow setTintColor:v109];

    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v65->__chooseInstructionArrow];
    uint64_t v110 = [(CAMSmartStyleSettingsView *)v65 _newInstructionLabel];
    tuneInstructionLabel = v65->__tuneInstructionLabel;
    v65->__tuneInstructionLabel = (UILabel *)v110;

    v112 = CAMLocalizedFrameworkString(@"SMART_STYLES_SETTINGS_TUNE_INSTRUCTION", 0);
    [(UILabel *)v65->__tuneInstructionLabel setText:v112];

    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v65->__tuneInstructionLabel];
    v113 = (void *)MEMORY[0x263F824E8];
    v114 = [(id)objc_opt_class() continueButtonConfiguration];
    uint64_t v115 = [v113 buttonWithConfiguration:v114 primaryAction:0];
    continueButton = v65->__continueButton;
    v65->__continueButton = (UIButton *)v115;

    [(UIButton *)v65->__continueButton addTarget:v65 action:sel__handleContinueButton_ forControlEvents:64];
    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v65->__continueButton];
    uint64_t v117 = [(CAMSmartStyleSettingsView *)v65 _newSecondaryButton];
    resetButton = v65->__resetButton;
    v65->__resetButton = (UIButton *)v117;

    v119 = v65->__resetButton;
    v120 = CAMLocalizedFrameworkString(@"SMART_STYLES_SETTINGS_RESET", 0);
    [(UIButton *)v119 setTitle:v120 forState:0];

    [(UIButton *)v65->__resetButton addTarget:v65 action:sel__resetStyleAndDismiss_ forControlEvents:64];
    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v65->__resetButton];
    uint64_t v121 = [(CAMSmartStyleSettingsView *)v65 _newSecondaryButton];
    startOverButton = v65->__startOverButton;
    v65->__startOverButton = (UIButton *)v121;

    v123 = v65->__startOverButton;
    v124 = CAMLocalizedFrameworkString(@"SMART_STYLES_SETTINGS_START_OVER", 0);
    [(UIButton *)v123 setTitle:v124 forState:0];

    [(UIButton *)v65->__startOverButton addTarget:v65 action:sel__startOver_ forControlEvents:64];
    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v65->__startOverButton];
    uint64_t v125 = [(CAMSmartStyleSettingsView *)v65 _newSecondaryButton];
    launchCameraButton = v65->__launchCameraButton;
    v65->__launchCameraButton = (UIButton *)v125;

    v127 = v65->__launchCameraButton;
    v128 = CAMLocalizedFrameworkString(@"SMART_STYLES_SETTINGS_LAUNCH_CAMERA", 0);
    [(UIButton *)v127 setTitle:v128 forState:0];

    [(UIButton *)v65->__launchCameraButton addTarget:v65 action:sel__launchCamera_ forControlEvents:64];
    [(CAMScrollViewWithLayoutDelegate *)v11->__scrollView addSubview:v65->__launchCameraButton];
    [(CAMSmartStyleSettingsView *)v65 _addConstraints];
    [(CAMSmartStyleSettingsView *)v65 _updatePreviewAdjustmentsUpdateModelValues:1];
    [(CAMSmartStyleSettingsView *)v65 _stageUpdates];
    v129 = +[CAMCaptureCapabilities capabilities];
    LODWORD(v127) = [v129 allowHaptics];

    if (v127)
    {
      v130 = objc_alloc_init(CAMFeedbackController);
      feedbackController = v65->__feedbackController;
      v65->__feedbackController = v130;
    }
    objc_destroyWeak(&v146);
    objc_destroyWeak(&from);
  }
  return v11;
}

void __115__CAMSmartStyleSettingsView_initWithDelegate_stylePresets_selectedIndex_hasEnoughPhotos_usingMostCompatibleFormat___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 integerValue];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 416));
  v6 = [WeakRetained settingsView:*(void *)(a1 + 32) requestsStyleForPresetType:v4];

  id v7 = objc_alloc_init(MEMORY[0x263F30690]);
  [v7 setFontStyle:1];
  v8 = [MEMORY[0x263F825C8] systemGray5Color];
  v9 = [v8 colorWithAlphaComponent:0.5];
  [v7 _setFillColor:v9];

  v10 = [MEMORY[0x263F825C8] labelColor];
  [v7 _setContentColor:v10];

  v11 = [v6 displayName];
  v12 = CAMPreferredLocale();
  v13 = [v11 uppercaseStringWithLocale:v12];
  [v7 _setText:v13];

  id v14 = objc_alloc(MEMORY[0x263F5E230]);
  [v6 castIntensity];
  v15 = objc_msgSend(v14, "initWithValue:");
  if (objc_opt_respondsToSelector())
  {
    v16 = +[CAMCaptureConversions PISemanticStyleCastForCEKCastType:](CAMCaptureConversions, "PISemanticStyleCastForCEKCastType:", [v6 castType]);
    [v15 setGradientCast:v16];
  }
  else
  {
    [v6 castType];
    v16 = CEKSmartStyleIntensitySliderGradientColorsForCastType();
    [v15 setColors:v16];
  }

  objc_msgSend(v15, "setHidden:", objc_msgSend(MEMORY[0x263F306F8], "canCustomizeCastIntensityForCastType:", objc_msgSend(v6, "castType")) ^ 1);
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __115__CAMSmartStyleSettingsView_initWithDelegate_stylePresets_selectedIndex_hasEnoughPhotos_usingMostCompatibleFormat___block_invoke_2;
  v23 = &unk_263FA0938;
  objc_copyWeak(&v24, &location);
  [v15 setOnValueChanged:&v20];
  id v17 = objc_alloc_init(MEMORY[0x263F828E0]);
  objc_msgSend(v17, "setTextAlignment:", 1, v20, v21, v22, v23);
  [v17 setNumberOfLines:0];
  [v17 setLineBreakMode:0];
  v18 = [*(id *)(a1 + 32) _fontWithTextStyle:*MEMORY[0x263F83580]];
  [v17 setFont:v18];

  v19 = [(id)objc_opt_class() _descriptionForStylePreset:v4];
  [v17 setText:v19];

  [*(id *)(*(void *)(a1 + 32) + 424) addSubview:v7];
  [*(id *)(*(void *)(a1 + 32) + 424) addSubview:v15];
  [*(id *)(*(void *)(a1 + 32) + 424) addSubview:v17];
  [*(id *)(*(void *)(a1 + 32) + 504) addObject:v7];
  [*(id *)(*(void *)(a1 + 32) + 520) addObject:v15];
  [*(id *)(*(void *)(a1 + 32) + 528) addObject:v17];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __115__CAMSmartStyleSettingsView_initWithDelegate_stylePresets_selectedIndex_hasEnoughPhotos_usingMostCompatibleFormat___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _intensitySliderUpdated];
}

void __115__CAMSmartStyleSettingsView_initWithDelegate_stylePresets_selectedIndex_hasEnoughPhotos_usingMostCompatibleFormat___block_invoke_3(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 _dpadControl];
  [v2 _dpadControlUpdated:v1];
}

- (id)_newInstructionLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v3 setTextAlignment:1];
  [v3 setNumberOfLines:0];
  [v3 setLineBreakMode:0];
  uint64_t v4 = [(CAMSmartStyleSettingsView *)self _fontWithTextStyle:*MEMORY[0x263F83570]];
  [v3 setFont:v4];

  return v3;
}

- (id)_newSecondaryButton
{
  id v2 = (void *)MEMORY[0x263F824E8];
  id v3 = [(CAMSmartStyleSettingsView *)self _secondaryButtonConfiguration];
  uint64_t v4 = [v2 buttonWithConfiguration:v3 primaryAction:0];

  v5 = [MEMORY[0x263F825C8] systemBlueColor];
  [v4 setTitleColor:v5 forState:0];

  return v4;
}

- (void)_createNeededStylePages
{
  id v3 = [(CAMSmartStyleSettingsView *)self _previewViewControllersByStyleIndex];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMSmartStyleSettingsView visiblePreviewIndex](self, "visiblePreviewIndex"));
  v5 = [v3 objectForKeyedSubscript:v4];

  v6 = [(CAMSmartStyleSettingsView *)self _styleClippingContainerViews];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__CAMSmartStyleSettingsView__createNeededStylePages__block_invoke;
  v8[3] = &unk_263FA4288;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __52__CAMSmartStyleSettingsView__createNeededStylePages__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) visiblePreviewIndex];
  int v8 = v6 - 1 <= a3 && v6 + 1 >= a3;
  if (!a3) {
    v8 &= ~[*(id *)(a1 + 32) _didCompleteChooseInstructions];
  }
  uint64_t v9 = [v5 viewWithTag:47];
  v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    v12 = [*(id *)(a1 + 32) _styleTypes];
    v13 = [v12 objectAtIndexedSubscript:a3];
    uint64_t v14 = [v13 integerValue];

    v15 = [*(id *)(a1 + 32) delegate];
    uint64_t v16 = *(void *)(a1 + 32);
    id v22 = 0;
    id v17 = [v15 settingsView:v16 requestsViewControllerForPresetType:v14 pageIndex:a3 parentViewController:&v22];
    id v18 = v22;

    [v18 addChildViewController:v17];
    v19 = *(void **)(a1 + 40);
    if (v19) {
      objc_msgSend(v17, "setExpandedItemIndex:", objc_msgSend(v19, "expandedItemIndex"));
    }
    uint64_t v20 = *(void **)(*(void *)(a1 + 32) + 488);
    uint64_t v21 = [NSNumber numberWithUnsignedInteger:a3];
    [v20 setObject:v17 forKeyedSubscript:v21];

    v10 = [v17 view];
    [v10 setTag:47];
    [v5 addSubview:v10];
    [v17 didMoveToParentViewController:v18];
  }
}

- (void)_removeStylePageForIndex:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  previewViewControllersByStyleIndex = self->__previewViewControllersByStyleIndex;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v7 = [(NSMutableDictionary *)previewViewControllersByStyleIndex objectForKeyedSubscript:v6];

  if (v7)
  {
    int v8 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      int64_t v12 = a3;
      _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "Removing page=%lu", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v9 = self->__previewViewControllersByStyleIndex;
    v10 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v9 setObject:0 forKeyedSubscript:v10];

    [(CAMSmartStyleSettingsView *)self _removeChildViewController:v7];
  }
}

- (void)_removeChildViewController:(id)a3
{
  id v4 = a3;
  [v4 willMoveToParentViewController:0];
  id v3 = [v4 view];
  [v3 removeFromSuperview];

  [v4 removeFromParentViewController];
}

- (BOOL)scrollEnabled
{
  id v2 = [(CAMSmartStyleSettingsView *)self _stylePicker];
  char v3 = [v2 scrollEnabled];

  return v3;
}

- (void)setScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMSmartStyleSettingsView *)self _stylePicker];
  [v4 setScrollEnabled:v3];
}

+ (double)dpadWidthRatio
{
  return 0.333333333;
}

- (void)updateImageViews
{
  BOOL v3 = [(CAMSmartStyleSettingsView *)self _previewViewControllersByStyleIndex];
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMSmartStyleSettingsView visiblePreviewIndex](self, "visiblePreviewIndex"));
  id v5 = [v3 objectForKeyedSubscript:v4];

  [v5 updateViewsWithLoadResults];
  uint64_t v6 = [(CAMSmartStyleSettingsView *)self _previewViewControllersByStyleIndex];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__CAMSmartStyleSettingsView_updateImageViews__block_invoke;
  v8[3] = &unk_263FA42B0;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

uint64_t __45__CAMSmartStyleSettingsView_updateImageViews__block_invoke(uint64_t result, uint64_t a2, void *a3)
{
  if (*(void **)(result + 32) != a3) {
    return [a3 updateViewsWithLoadResults];
  }
  return result;
}

- (void)zoomOutToGridAnimated:(BOOL)a3
{
}

- (void)didFinishPickingAssets
{
  if (!self->__stage) {
    [(CAMSmartStyleSettingsView *)self _moveToNextStageIfAllowedAnimated:0];
  }
}

- (void)stopAllAnimations
{
  [(CAMSmartStyleSettingsView *)self _setAnimationSequence:0];
  id v3 = [(CAMSmartStyleSettingsView *)self _dpadControl];
  [v3 setPulsingValueIndicator:0];
}

- (void)_setVisiblePreviewIndex:(int64_t)a3 updatePageControl:(BOOL)a4 updateStylePicker:(BOOL)a5 animated:(BOOL)a6 notifyDelegate:(BOOL)a7
{
  if (self->_visiblePreviewIndex != a3)
  {
    BOOL v7 = a7;
    BOOL v8 = a6;
    BOOL v9 = a5;
    self->_visiblePreviewIndex = a3;
    if (a4) {
      [(CAMSmartStyleSettingsView *)self _updatePreviewPageDots];
    }
    if (v9)
    {
      int64_t v12 = [(CAMSmartStyleSettingsView *)self _stylePicker];
      [v12 setSelectedStyleIndex:a3 animated:v8];
    }
    [(CAMSmartStyleSettingsView *)self _createNeededStylePages];
    [(CAMSmartStyleSettingsView *)self _updateDpadBackground];
    [(CAMSmartStyleSettingsView *)self _updatePreviewAdjustmentsUpdateModelValues:0];
    if (v7)
    {
      uint64_t v13 = [(CAMSmartStyleSettingsView *)self _styleTypes];
      uint64_t v14 = [v13 objectAtIndexedSubscript:a3];
      uint64_t v15 = [v14 integerValue];

      id v16 = [(CAMSmartStyleSettingsView *)self delegate];
      [v16 settingsView:self didChangeToStylePreset:v15];
    }
  }
}

- (void)_updatePreviewPageDots
{
  BOOL v3 = [(CAMSmartStyleSettingsView *)self _didCompleteChooseInstructions];
  NSUInteger v4 = [(NSArray *)self->__styleTypes count];
  if (v3)
  {
    p_previewPageDots = &self->__previewPageDots;
    [(UIPageControl *)self->__previewPageDots setNumberOfPages:v4 - 1];
    int64_t v6 = [(CAMSmartStyleSettingsView *)self visiblePreviewIndex] - 1;
  }
  else
  {
    p_previewPageDots = &self->__previewPageDots;
    [(UIPageControl *)self->__previewPageDots setNumberOfPages:v4];
    int64_t v6 = 0;
  }
  BOOL v7 = *p_previewPageDots;
  [(UIPageControl *)v7 setCurrentPage:v6];
}

- (int64_t)_previewIndexFromPageDots
{
  BOOL v3 = [(CAMSmartStyleSettingsView *)self _didCompleteChooseInstructions];
  return [(UIPageControl *)self->__previewPageDots currentPage] + v3;
}

- (id)_centerSquareOfImage:(id)a3 appliesScale:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = 1.0;
  if (v4)
  {
    BOOL v8 = [(CAMSmartStyleSettingsView *)self window];
    BOOL v9 = [v8 windowScene];
    v10 = [v9 screen];
    [v10 scale];
    double v7 = v11;
  }
  [v6 size];
  double v13 = v7 * v12;
  [v6 size];
  CGFloat v15 = fmin(v13, v7 * v14);
  id v16 = v6;
  double Width = (double)CGImageGetWidth((CGImageRef)[v16 CGImage]);
  id v18 = v16;
  CGFloat v19 = ((double)CGImageGetHeight((CGImageRef)[v18 CGImage]) - v15) * 0.5;
  id v20 = v18;
  uint64_t v21 = (CGImage *)[v20 CGImage];
  v26.origin.x = (Width - v15) * 0.5;
  v26.origin.y = v19;
  v26.size.width = v15;
  v26.size.height = v15;
  id v22 = CGImageCreateWithImageInRect(v21, v26);
  v23 = [MEMORY[0x263F827E8] imageWithCGImage:v22];
  CGImageRelease(v22);

  return v23;
}

- (void)_updateForStageAnimated:(BOOL)a3 scrollToTop:(BOOL)a4
{
  BOOL v5 = a3;
  [(CAMSmartStyleSettingsView *)self _setStageButtonsEnabled:0 forReason:@"StageUpdate"];
  double v7 = 0.35;
  if (!v5) {
    double v7 = 0.0;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__CAMSmartStyleSettingsView__updateForStageAnimated_scrollToTop___block_invoke;
  v9[3] = &unk_263FA02A8;
  v9[4] = self;
  BOOL v10 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__CAMSmartStyleSettingsView__updateForStageAnimated_scrollToTop___block_invoke_2;
  v8[3] = &unk_263FA0430;
  void v8[4] = self;
  +[CAMView animateIfNeededWithDuration:v9 animations:v8 completion:v7];
}

void __65__CAMSmartStyleSettingsView__updateForStageAnimated_scrollToTop___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stageUpdates];
  [*(id *)(a1 + 32) layoutIfNeeded];
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) _scrollView];
    [v2 adjustedContentInset];
    double v4 = -v3;

    id v5 = [*(id *)(a1 + 32) _scrollView];
    objc_msgSend(v5, "setContentOffset:", 0.0, v4);
  }
}

uint64_t __65__CAMSmartStyleSettingsView__updateForStageAnimated_scrollToTop___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setStageButtonsEnabled:1 forReason:@"StageUpdate"];
  uint64_t result = [*(id *)(a1 + 32) _didCompleteChooseInstructions];
  if (result)
  {
    double v3 = *(void **)(a1 + 32);
    return [v3 _removeStylePageForIndex:0];
  }
  return result;
}

- (void)_setStageButtonsEnabled:(BOOL)a3 forReason:(id)a4
{
  stageButtonSuppressionReasons = self->__stageButtonSuppressionReasons;
  if (a3) {
    [(NSMutableSet *)stageButtonSuppressionReasons removeObject:a4];
  }
  else {
    [(NSMutableSet *)stageButtonSuppressionReasons addObject:a4];
  }
}

- (BOOL)_isBlockingStageButtons
{
  return [(NSMutableSet *)self->__stageButtonSuppressionReasons count] != 0;
}

- (void)_stageUpdates
{
  unint64_t stage = self->__stage;
  BOOL v47 = +[CAMCaptureCapabilities isCameraAppInstalled];
  BOOL v4 = [(CAMSmartStyleSettingsView *)self _didCompleteChooseInstructions];
  unint64_t v5 = self->__stage - 1;
  if (v5 > 3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = CAMLocalizedFrameworkString(off_263FA4438[v5], 0);
  }
  BOOL v7 = stage == 1;
  unint64_t v8 = stage - 3;
  double v9 = 0.0;
  if (stage == 3) {
    double v10 = 1.0;
  }
  else {
    double v10 = 0.0;
  }
  if (stage == 3) {
    BOOL v7 = 1;
  }
  BOOL v48 = v7;
  BOOL v11 = v8 > 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v13 = WeakRetained;
  BOOL v14 = v8 < 2;
  if (v8 >= 2) {
    double v15 = 50.0;
  }
  else {
    double v15 = 0.0;
  }
  if (v8 >= 2) {
    double v16 = 0.0;
  }
  else {
    double v16 = 1.0;
  }
  if (stage) {
    double v17 = 1.0;
  }
  else {
    double v17 = 0.0;
  }
  if (stage) {
    double v18 = 0.0;
  }
  else {
    double v18 = 1.0;
  }
  BOOL v19 = stage != 5;
  if (stage == 5) {
    double v20 = 1.0;
  }
  else {
    double v20 = 0.0;
  }
  BOOL v21 = stage == 5 || stage == 0;
  objc_msgSend(WeakRetained, "settingsView:requestsTitle:showBackButton:showCancelButton:cancelButtonOnLeft:", self, v6, v14, v19);

  [(UIStackView *)self->__finishedStack setAlpha:v20];
  [(NSLayoutConstraint *)self->__finishedStackTopConstraint setActive:stage == 5];
  [(NSLayoutConstraint *)self->__pickerFinishedStackConstraint setActive:stage == 5];
  [(NSLayoutConstraint *)self->__pickerTopConstraint setActive:v19];
  [(NSLayoutConstraint *)self->__pickerTopConstraint setConstant:v15];
  [(CAMSemanticStylePicker *)self->__stylePicker setMinimumScrollablePageIndex:v4];
  [(CAMSemanticStylePicker *)self->__stylePicker setExpanded:v11];
  [(CAMSemanticStylePicker *)self->__stylePicker setUserInteractionEnabled:!v21];
  if (v17 == 0.0) {
    double v22 = 0.0;
  }
  else {
    double v22 = 1.0;
  }
  [(CAMSemanticStylePicker *)self->__stylePicker setAlpha:v22];
  styleClippingContainerViews = self->__styleClippingContainerViews;
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke;
  v63[3] = &unk_263FA42D8;
  BOOL v64 = !v4;
  BOOL v65 = stage == 5;
  v63[4] = self;
  BOOL v66 = v17 != 0.0;
  [(NSArray *)styleClippingContainerViews enumerateObjectsUsingBlock:v63];
  [(UIImageView *)self->__introImageView setAlpha:v18];
  [(UILabel *)self->__introTitleLabel setAlpha:v18];
  [(UILabel *)self->__introInstructionLabel setAlpha:v18];
  [(UILabel *)self->__introDescriptionLabel setAlpha:v18];
  [(CAMSmartStyleSettingsView *)self _updateAlphaForChooseInstructions];
  [(UILabel *)self->__tuneInstructionLabel setAlpha:v10];
  [(NSLayoutConstraint *)self->__tuneInstructionLabelBottomConstraint setActive:stage == 3];
  [(CAMSmartStyleSettingsView *)self _updateShowGridButtonAnimated:0];
  if (v21) {
    double v24 = 0.0;
  }
  else {
    double v24 = 1.0;
  }
  [(UIButton *)self->__selectAssetsButton setAlpha:v24];
  v25 = [(CAMSmartStyleSettingsView *)self _styleDescriptionLabels];
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_2;
  v60[3] = &__block_descriptor_34_e24_v32__0__UILabel_8Q16_B24l;
  BOOL v61 = stage == 1;
  BOOL v62 = stage == 2;
  [v25 enumerateObjectsUsingBlock:v60];

  [(UIPageControl *)self->__previewPageDots setAlpha:v24];
  [(CAMSmartStyleSettingsView *)self _updatePreviewPageDots];
  CGRect v26 = [(CAMSmartStyleSettingsView *)self _styleBadgeBelowDotsConstraints];
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_3;
  v58[3] = &__block_descriptor_33_e35_v32__0__NSLayoutConstraint_8Q16_B24l;
  BOOL v59 = v21;
  [v26 enumerateObjectsUsingBlock:v58];

  v27 = [(CAMSmartStyleSettingsView *)self _styleBadgeBelowImageConstraints];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_4;
  v56[3] = &__block_descriptor_33_e35_v32__0__NSLayoutConstraint_8Q16_B24l;
  BOOL v57 = v21;
  [v27 enumerateObjectsUsingBlock:v56];

  v28 = [(CAMSmartStyleSettingsView *)self _styleNameBadges];
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_5;
  v54[3] = &__block_descriptor_33_e33_v32__0__CEKBadgeTextView_8Q16_B24l;
  BOOL v55 = stage == 0;
  [v28 enumerateObjectsUsingBlock:v54];

  v29 = [(PEPhotoStyleDPad *)self->__dpadControl view];
  [v29 setAlpha:v16];

  v30 = [(CAMSmartStyleSettingsView *)self _intensitySliders];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_6;
  v49[3] = &unk_263FA4360;
  v49[4] = self;
  BOOL v50 = stage == 2;
  BOOL v51 = stage == 3;
  BOOL v52 = stage == 4;
  BOOL v53 = stage == 1;
  [v30 enumerateObjectsUsingBlock:v49];

  continueButton = self->__continueButton;
  v32 = [(CAMSmartStyleSettingsView *)self _continueButtonTitle];
  [(UIButton *)continueButton setTitle:v32 forState:0];

  if (v48) {
    double v33 = 0.0;
  }
  else {
    double v33 = 1.0;
  }
  [(UIButton *)self->__continueButton setAlpha:v33];
  id v34 = objc_loadWeakRetained((id *)&self->_delegate);
  v35 = [v34 settingsViewRequestsPersistedSystemStyle:self];

  char v36 = [v35 isNeutral];
  double v37 = 0.0;
  if (!stage)
  {
    BOOL v38 = [(CAMSmartStyleSettingsView *)self _hasEnoughPhotos];
    double v37 = 0.0;
    if (!v38)
    {
      BOOL v39 = [(CAMSmartStyleSettingsView *)self _usingMostCompatibleFormat];
      double v37 = 0.0;
      double v40 = 1.0;
      if (!v47) {
        double v40 = 0.0;
      }
      if (!v39) {
        double v37 = v40;
      }
    }
  }
  [(UIButton *)self->__launchCameraButton setAlpha:v37];
  if (stage) {
    char v41 = 1;
  }
  else {
    char v41 = v36;
  }
  if ((v41 & 1) == 0)
  {
    if ([(CAMSmartStyleSettingsView *)self _hasEnoughPhotos]) {
      double v9 = 1.0;
    }
    else {
      double v9 = 0.0;
    }
  }
  [(UIButton *)self->__resetButton setAlpha:v9];
  [(UIButton *)self->__startOverButton setAlpha:v20];

  [(UILabel *)self->__introDescriptionLabel alpha];
  [(NSLayoutConstraint *)self->__continueButtonIntroDescriptionLabelConstraint setActive:v42 > 0.0];
  [(UIButton *)self->__resetButton alpha];
  [(NSLayoutConstraint *)self->__continueButtonResetButtonConstraint setActive:v43 > 0.0];
  [(UIButton *)self->__launchCameraButton alpha];
  [(NSLayoutConstraint *)self->__continueButtonLaunchCameraButtonConstraint setActive:v44 > 0.0];
  [(UIButton *)self->__startOverButton alpha];
  [(NSLayoutConstraint *)self->__continueButtonStartOverButtonConstraint setActive:v45 > 0.0];
  if ([(NSLayoutConstraint *)self->__continueButtonResetButtonConstraint isActive]
    || [(NSLayoutConstraint *)self->__continueButtonLaunchCameraButtonConstraint isActive])
  {
    uint64_t v46 = 0;
  }
  else
  {
    uint64_t v46 = [(NSLayoutConstraint *)self->__continueButtonStartOverButtonConstraint isActive] ^ 1;
  }
  [(NSLayoutConstraint *)self->__continueButtonBottomConstraint setActive:v46];
}

void __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = *(unsigned char *)(a1 + 40) == 0;
  }
  int v6 = *(unsigned __int8 *)(a1 + 41);
  if (*(unsigned char *)(a1 + 41)) {
    int v6 = [*(id *)(a1 + 32) visiblePreviewIndex] != a3;
  }
  double v7 = 0.0;
  if (((v5 | v6) & 1) == 0)
  {
    LOBYTE(v7) = *(unsigned char *)(a1 + 42);
    double v7 = (double)*(unint64_t *)&v7;
  }
  [v8 setAlpha:v7];
}

uint64_t __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 32) || *(unsigned char *)(a1 + 33))
  {
    double v3 = 1.0;
    if (!a3) {
      double v3 = 0.0;
    }
  }
  else
  {
    double v3 = 0.0;
  }
  return [a2 setAlpha:v3];
}

uint64_t __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setActive:*(unsigned char *)(a1 + 32) == 0];
}

uint64_t __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setActive:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 32)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = a3 == 0;
  }
  double v4 = 1.0;
  if (v3) {
    double v4 = 0.0;
  }
  return [a2 setAlpha:v4];
}

void __42__CAMSmartStyleSettingsView__stageUpdates__block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = [v5 _intensitySliderBelowDescriptionConstraints];
  id v15 = [v7 objectAtIndexedSubscript:a3];

  id v8 = [*(id *)(a1 + 32) _intensitySliderBelowDpadConstraints];
  double v9 = [v8 objectAtIndexedSubscript:a3];

  double v10 = [*(id *)(a1 + 32) _continueButtonBelowIntensitySliderConstraints];
  BOOL v11 = [v10 objectAtIndexedSubscript:a3];

  double v12 = 1.0;
  if (!*(unsigned char *)(a1 + 40) && !*(unsigned char *)(a1 + 41) && !*(unsigned char *)(a1 + 42)) {
    double v12 = 0.0;
  }
  [v6 setAlpha:v12];

  if (*(unsigned char *)(a1 + 42)) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = *(unsigned char *)(a1 + 41) != 0;
  }
  [v9 setActive:v13];
  objc_msgSend(v15, "setActive:", objc_msgSend(v9, "isActive") ^ 1);
  BOOL v14 = *(unsigned char *)(a1 + 43) || *(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41) || *(unsigned char *)(a1 + 42) != 0;
  [v11 setActive:v14];
}

- (void)_updateAlphaForChooseInstructions
{
  double v3 = 0.0;
  if (self->__stage == 1)
  {
    [(CAMSemanticStylePicker *)self->__stylePicker fractionalPageIndex];
    CEKProgressClamped();
    CEKInterpolate();
    double v3 = v4;
  }
  [(UILabel *)self->__chooseInstructionLabel setAlpha:v3];
  chooseInstructionArrow = self->__chooseInstructionArrow;
  [(UIImageView *)chooseInstructionArrow setAlpha:v3];
}

- (void)_updateShowGridButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = 0.0;
  if (self->__stage - 1 <= 4)
  {
    id v6 = [(CAMSmartStyleSettingsView *)self _previewViewControllersByStyleIndex];
    double v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMSmartStyleSettingsView visiblePreviewIndex](self, "visiblePreviewIndex"));
    id v8 = [v6 objectForKeyedSubscript:v7];

    if ([v8 expandedItemIndex] == 0x7FFFFFFFFFFFFFFFLL) {
      double v5 = 0.0;
    }
    else {
      double v5 = 1.0;
    }
  }
  v10[1] = 3221225472;
  double v9 = 0.25;
  v10[0] = MEMORY[0x263EF8330];
  v10[2] = __59__CAMSmartStyleSettingsView__updateShowGridButtonAnimated___block_invoke;
  v10[3] = &unk_263FA04E0;
  if (!v3) {
    double v9 = 0.0;
  }
  v10[4] = self;
  *(double *)&v10[5] = v5;
  +[CAMView animateIfNeededWithDuration:v10 animations:v9];
}

uint64_t __59__CAMSmartStyleSettingsView__updateShowGridButtonAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 464) setAlpha:*(double *)(a1 + 40)];
}

- (int64_t)_selectedStylePreset
{
  id v2 = [(NSArray *)self->__styleTypes objectAtIndexedSubscript:[(CAMSmartStyleSettingsView *)self visiblePreviewIndex]];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (CEKSmartStyle)_selectedStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v4 = objc_msgSend(WeakRetained, "settingsView:requestsStyleForPresetType:", self, -[CAMSmartStyleSettingsView _selectedStylePreset](self, "_selectedStylePreset"));

  return (CEKSmartStyle *)v4;
}

- (id)_selectedStyleDescription
{
  int64_t v3 = objc_opt_class();
  int64_t v4 = [(CAMSmartStyleSettingsView *)self _selectedStylePreset];
  return (id)[v3 _descriptionForStylePreset:v4];
}

+ (id)_descriptionForStylePreset:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
      int64_t v4 = os_log_create("com.apple.camera", "SmartStyleSettings");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        +[CAMSmartStyleSettingsView _descriptionForStylePreset:](a3, v4);
      }

      goto LABEL_5;
    case 1:
      double v5 = @"SMART_STYLES_SETTINGS_DESCRIPTION_STANDARD";
      break;
    case 2:
      double v5 = @"SMART_STYLES_SETTINGS_DESCRIPTION_TAN_WARM";
      break;
    case 3:
      double v5 = @"SMART_STYLES_SETTINGS_DESCRIPTION_BLUSH_WARM";
      break;
    case 4:
      double v5 = @"SMART_STYLES_SETTINGS_DESCRIPTION_GOLD_WARM";
      break;
    case 5:
      double v5 = @"SMART_STYLES_SETTINGS_DESCRIPTION_COOL";
      break;
    case 6:
      double v5 = @"SMART_STYLES_SETTINGS_DESCRIPTION_NEUTRAL";
      break;
    default:
LABEL_5:
      double v5 = 0;
      break;
  }
  id v6 = CAMLocalizedFrameworkString(v5, 0);
  return v6;
}

- (id)_continueButtonTitle
{
  switch(self->__stage)
  {
    case 0uLL:
      if ([(CAMSmartStyleSettingsView *)self _hasEnoughPhotos])
      {
        id v2 = @"SMART_STYLES_SETTINGS_CUSTOMIZE_NOW";
      }
      else if ([(CAMSmartStyleSettingsView *)self _usingMostCompatibleFormat])
      {
        id v2 = @"SMART_STYLES_SETTINGS_NAVIGATE_TO_FORMATS";
      }
      else
      {
        id v2 = @"SMART_STYLES_SETTINGS_NOT_ENOUGH_PHOTOS_DISMISS";
      }
      break;
    case 1uLL:
    case 2uLL:
      id v2 = @"SMART_STYLES_SETTINGS_CONTINUE";
      break;
    case 3uLL:
    case 4uLL:
      id v2 = @"SMART_STYLES_SETTINGS_CONFIRM_TUNE";
      break;
    case 5uLL:
      id v2 = @"SMART_STYLES_SETTINGS_DONE";
      break;
    default:
      id v2 = 0;
      break;
  }
  return CAMLocalizedFrameworkString(v2, 0);
}

- (void)_beginAssetSelection:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained settingsViewRequestsUserAssetSelection:self];
}

- (void)_handleShowGridButton:(id)a3
{
}

- (void)_dpadControlUpdated:(id)a3
{
  [(CAMSmartStyleSettingsView *)self _updatePreviewAdjustmentsUpdateModelValues:1];
  [(CAMSmartStyleSettingsView *)self _advanceToTuneStageIfPossible];
}

- (void)_intensitySliderUpdated
{
  [(CAMSmartStyleSettingsView *)self _updatePreviewAdjustmentsUpdateModelValues:1];
  [(CAMSmartStyleSettingsView *)self _advanceToTuneStageIfPossible];
}

- (void)_advanceToTuneStageIfPossible
{
  if (self->__stage == 3)
  {
    [(CAMSmartStyleSettingsView *)self _moveToNextStageIfAllowedAnimated:1];
    [(CAMSmartStyleSettingsView *)self _updatePreviewAdjustmentsUpdateModelValues:1];
  }
}

- (void)_updatePreviewAdjustmentsUpdateModelValues:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(CAMSmartStyleSettingsView *)self visiblePreviewIndex];
  id v16 = [(NSArray *)self->__styleTypes objectAtIndexedSubscript:v5];
  uint64_t v6 = [v16 integerValue];
  double v7 = [(CAMSmartStyleSettingsView *)self _dpadControl];
  id v8 = [(CAMSmartStyleSettingsView *)self _intensitySliders];
  double v9 = [v8 objectAtIndexedSubscript:v5];

  [v7 value];
  +[CAMSmartStyleUtilities colorAndToneBiasForSlider2DValue:limitRangeForSystemStyles:](CAMSmartStyleUtilities, "colorAndToneBiasForSlider2DValue:limitRangeForSystemStyles:", 1);
  id v10 = objc_alloc(MEMORY[0x263F306F8]);
  [v9 value];
  BOOL v11 = objc_msgSend(v10, "initWithPresetType:castIntensity:toneBias:colorBias:", v6);
  double v12 = [(CAMSmartStyleSettingsView *)self _previewViewControllersByStyleIndex];
  BOOL v13 = [NSNumber numberWithUnsignedInteger:v5];
  BOOL v14 = [v12 objectForKeyedSubscript:v13];

  [v14 updateWithStyle:v11];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained settingsView:self didUpdateStyle:v11 forPresetType:v6];
  }
}

- (void)_updateDpadBackground
{
  id v9 = [(NSArray *)self->__styleTypes objectAtIndexedSubscript:[(CAMSmartStyleSettingsView *)self visiblePreviewIndex]];
  uint64_t v3 = [v9 integerValue];
  uint64_t v4 = [MEMORY[0x263F306F8] castTypeForPresetType:v3];
  int64_t v5 = [(CAMSmartStyleSettingsView *)self _dpadControl];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = +[CAMCaptureConversions PISemanticStyleCastForCEKCastType:v4];
    id v8 = [(CAMSmartStyleSettingsView *)self _dpadControl];
    [v8 setGradientCast:v7];
  }
}

- (void)_handleContinueButton:(id)a3
{
  unint64_t v4 = [(CAMSmartStyleSettingsView *)self _stage];
  if (v4 - 1 >= 5)
  {
    if (!v4)
    {
      if ([(CAMSmartStyleSettingsView *)self _hasEnoughPhotos])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained settingsViewRequestsUserAssetSelection:self];
      }
      else
      {
        BOOL v5 = [(CAMSmartStyleSettingsView *)self _usingMostCompatibleFormat];
        id v6 = objc_loadWeakRetained((id *)&self->_delegate);
        id WeakRetained = v6;
        if (v5)
        {
          double v7 = &__block_literal_global_34;
          id v8 = self;
        }
        else
        {
          id v8 = self;
          double v7 = 0;
        }
        [v6 settingsViewRequestsDismiss:v8 completion:v7];
      }
    }
  }
  else
  {
    [(CAMSmartStyleSettingsView *)self _moveToNextStageIfAllowedAnimated:1];
  }
}

void __51__CAMSmartStyleSettingsView__handleContinueButton___block_invoke()
{
  id v0 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Camera/CameraFormatsSettingsList"];
  CAMOpenSensitiveURLWithUnlockRequest(v0, 0);
}

- (id)_debugStringForStage:(unint64_t)a3
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return off_263FA4458[a3];
  }
}

- (void)_setStage:(unint64_t)a3
{
}

- (void)_setStage:(unint64_t)a3 animated:(BOOL)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->__stage != a3)
  {
    BOOL v4 = a4;
    double v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(CAMSmartStyleSettingsView *)self _debugStringForStage:a3];
      int v11 = 138543362;
      double v12 = v8;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Settings: changing stage to %{public}@", (uint8_t *)&v11, 0xCu);
    }
    [(CAMSmartStyleSettingsView *)self _setAnimationSequence:0];
    [(PEPhotoStyleDPad *)self->__dpadControl setPulsingValueIndicator:0];
    [(CAMSmartStyleSettingsView *)self layoutIfNeeded];
    unint64_t stage = self->__stage;
    self->__unint64_t stage = a3;
    switch(a3)
    {
      case 2uLL:
        [(CAMSmartStyleSettingsView *)self _setDidCompleteChooseInstructions:1];
        break;
      case 3uLL:
        [(CAMSmartStyleSettingsView *)self _playTuneInstructionAnimations];
        break;
      case 4uLL:
        [(CAMSmartStyleSettingsView *)self _setDidCompleteTuneInstructions:1];
        break;
      case 5uLL:
        [(CAMSmartStyleSettingsView *)self _setPreviewViewControllersExpandedItemIndex:0x7FFFFFFFFFFFFFFFLL animated:1];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained settingsViewDidConfirmStyle:self];

        break;
      default:
        break;
    }
    [(CAMSmartStyleSettingsView *)self _updateForStageAnimated:v4 scrollToTop:[(CAMSmartStyleSettingsView *)self _userFacingContentPageNumberForStage:stage] != [(CAMSmartStyleSettingsView *)self _userFacingContentPageNumberForStage:a3]];
  }
}

- (int64_t)_userFacingContentPageNumberForStage:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 0;
  }
  else {
    return qword_209C7B238[a3 - 1];
  }
}

- (void)_moveToPreviousStageIfAllowed
{
  if (![(CAMSmartStyleSettingsView *)self _isBlockingStageButtons])
  {
    unint64_t stage = self->__stage;
    switch(stage)
    {
      case 0uLL:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained settingsViewRequestsDismiss:self completion:0];

        goto LABEL_5;
      case 1uLL:
      case 2uLL:
LABEL_5:
        unint64_t stage = 0;
        break;
      case 3uLL:
      case 4uLL:
        unint64_t stage = 2;
        break;
      case 5uLL:
        unint64_t stage = 4;
        break;
      default:
        break;
    }
    [(CAMSmartStyleSettingsView *)self _setStage:stage];
  }
}

- (void)_moveToNextStageIfAllowedAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CAMSmartStyleSettingsView *)self _isBlockingStageButtons])
  {
    unint64_t stage = self->__stage;
    switch(stage)
    {
      case 0uLL:
        if ([(CAMSmartStyleSettingsView *)self _didCompleteChooseInstructions]) {
          unint64_t stage = 2;
        }
        else {
          unint64_t stage = 1;
        }
        break;
      case 1uLL:
        unint64_t stage = 2;
        break;
      case 2uLL:
        if ([(CAMSmartStyleSettingsView *)self _didCompleteTuneInstructions]) {
          goto LABEL_7;
        }
        double v7 = [(CAMSmartStyleSettingsView *)self _selectedStyle];
        if ([v7 isCustomized]) {
          unint64_t stage = 4;
        }
        else {
          unint64_t stage = 3;
        }

        break;
      case 3uLL:
LABEL_7:
        unint64_t stage = 4;
        break;
      case 4uLL:
        goto LABEL_10;
      case 5uLL:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained settingsViewRequestsDismiss:self completion:0];

LABEL_10:
        unint64_t stage = 5;
        break;
      default:
        break;
    }
    [(CAMSmartStyleSettingsView *)self _setStage:stage animated:v3];
  }
}

- (void)_resetStyleAndDismiss:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained settingsViewRequestsResetToStandardStyleAndDismiss:self];
}

- (void)_startOver:(id)a3
{
  if (![(CAMSmartStyleSettingsView *)self _isBlockingStageButtons])
  {
    [(CAMSmartStyleSettingsView *)self _setStage:0];
  }
}

- (void)_launchCamera:(id)a3
{
  [NSURL URLWithString:@"camera://configuration?capturemode=photo&capturedevice=back"];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  CAMOpenSensitiveURLWithUnlockRequest(v5, 0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained settingsViewRequestsDismiss:self completion:0];
}

- (void)_setAnimationSequence:(id)a3
{
  id v5 = a3;
  p_animationSequence = (id *)&self->__animationSequence;
  id v7 = *p_animationSequence;
  if (*p_animationSequence != v5)
  {
    id v8 = v5;
    [v7 stopAllAnimations];
    objc_storeStrong(p_animationSequence, a3);
    id v5 = v8;
  }
  MEMORY[0x270F9A758](v7, v5);
}

- (void)_playTuneInstructionAnimations
{
  v18[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F306E8]);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke;
  v17[3] = &unk_263FA4388;
  v17[4] = self;
  BOOL v4 = (void *)[v3 initWithWithIdentifier:@"InitialDelay" duration:v17 updateHandler:0.5];
  v18[0] = v4;
  id v5 = objc_alloc(MEMORY[0x263F306E8]);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke_2;
  v16[3] = &unk_263FA4388;
  v16[4] = self;
  id v6 = (void *)[v5 initWithWithIdentifier:@"TuneTone" duration:v16 updateHandler:2.5];
  v18[1] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F306E8]) initWithWithIdentifier:@"MiddleDelay" duration:&__block_literal_global_388 updateHandler:0.5];
  v18[2] = v7;
  id v8 = objc_alloc(MEMORY[0x263F306E8]);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke_4;
  v15[3] = &unk_263FA4388;
  v15[4] = self;
  id v9 = (void *)[v8 initWithWithIdentifier:@"TuneColor" duration:v15 updateHandler:2.5];
  v18[3] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  id v11 = objc_alloc(MEMORY[0x263F30670]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke_5;
  v14[3] = &unk_263FA0430;
  v14[4] = self;
  double v12 = (void *)[v11 initWithAnimations:v10 completionHandler:v14];
  [(CAMSmartStyleSettingsView *)self _setAnimationSequence:v12];

  uint64_t v13 = [(CAMSmartStyleSettingsView *)self _animationSequence];
  [v13 start];
}

uint64_t __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 512);
    return [v3 setSnapIndicatorToGrid:0];
  }
  return result;
}

uint64_t __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke_2(uint64_t a1, double a2)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 512), "setValue:notifyObserver:", 0, 0.0, (double)sin((a2 + a2) * 3.14159265));
  id v3 = *(void **)(a1 + 32);
  return [v3 _updatePreviewAdjustmentsUpdateModelValues:0];
}

uint64_t __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke_4(uint64_t a1, double a2)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 512), "setValue:notifyObserver:", 0, (double)sin((a2 + a2) * -3.14159265), 0.0);
  id v3 = *(void **)(a1 + 32);
  return [v3 _updatePreviewAdjustmentsUpdateModelValues:0];
}

uint64_t __59__CAMSmartStyleSettingsView__playTuneInstructionAnimations__block_invoke_5(uint64_t a1, int a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 512) setSnapIndicatorToGrid:1];
  }
  if (a2)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 512);
    return [v5 setPulsingValueIndicator:1];
  }
  return result;
}

- (void)_layoutMaskedViews
{
  id v3 = [(CAMSmartStyleSettingsView *)self _stylePicker];
  [v3 frame];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  double v12 = [(CAMSmartStyleSettingsView *)self _styleClippingContainerViews];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__CAMSmartStyleSettingsView__layoutMaskedViews__block_invoke;
  v14[3] = &unk_263FA43D0;
  uint64_t v17 = v5;
  uint64_t v18 = v7;
  uint64_t v19 = v9;
  uint64_t v20 = v11;
  id v15 = v3;
  id v16 = self;
  id v13 = v3;
  [v12 enumerateObjectsUsingBlock:v14];
}

void __47__CAMSmartStyleSettingsView__layoutMaskedViews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v19 = a2;
  [*(id *)(a1 + 32) modelStyleRectAtIndex:a3];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = *(void **)(a1 + 32);
  BOOL v14 = [v19 superview];
  objc_msgSend(v13, "convertRect:toView:", v14, v6, v8, v10, v12);
  objc_msgSend(v19, "setFrame:");

  id v15 = [v19 subviews];
  id v16 = [v15 firstObject];

  uint64_t v17 = [*(id *)(a1 + 32) superview];
  objc_msgSend(v17, "convertRect:toView:", v19, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(v16, "setFrame:");

  if ([*(id *)(*(void *)(a1 + 40) + 696) count] <= a3)
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = [*(id *)(*(void *)(a1 + 40) + 696) objectAtIndexedSubscript:a3];
  }
  [v19 frame];
  [v18 setConstant:CGRectGetMidX(v21)];
}

- (void)_addConstraints
{
  uint64_t v234 = *MEMORY[0x263EF8340];
  long long v227 = 0u;
  long long v228 = 0u;
  long long v229 = 0u;
  long long v230 = 0u;
  id v3 = [(CAMSmartStyleSettingsView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v227 objects:v233 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v228;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v228 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v227 + 1) + 8 * i) setTranslatesAutoresizingMaskIntoConstraints:0];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v227 objects:v233 count:16];
    }
    while (v5);
  }

  long long v226 = 0u;
  long long v225 = 0u;
  long long v224 = 0u;
  long long v223 = 0u;
  double v8 = [(CAMSmartStyleSettingsView *)self _scrollView];
  double v9 = [v8 subviews];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v223 objects:v232 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v224;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v224 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v223 + 1) + 8 * j) setTranslatesAutoresizingMaskIntoConstraints:0];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v223 objects:v232 count:16];
    }
    while (v11);
  }

  BOOL v14 = [(CAMSemanticStylePicker *)self->__stylePicker topAnchor];
  id v15 = [(CAMScrollViewWithLayoutDelegate *)self->__scrollView topAnchor];
  id v16 = [v14 constraintLessThanOrEqualToAnchor:v15];
  pickerTopConstraint = self->__pickerTopConstraint;
  self->__pickerTopConstraint = v16;

  uint64_t v18 = [(CAMSemanticStylePicker *)self->__stylePicker topAnchor];
  id v19 = [(UIStackView *)self->__finishedStack lastBaselineAnchor];
  uint64_t v20 = [v18 constraintGreaterThanOrEqualToAnchor:v19 constant:30.0];
  pickerFinishedStackConstraint = self->__pickerFinishedStackConstraint;
  self->__pickerFinishedStackConstraint = v20;

  double v22 = [(UIButton *)self->__continueButton topAnchor];
  v23 = [(UILabel *)self->__introDescriptionLabel bottomAnchor];
  double v24 = [v22 constraintGreaterThanOrEqualToAnchor:v23 constant:30.0];
  continueButtonIntroDescriptionLabelConstraint = self->__continueButtonIntroDescriptionLabelConstraint;
  self->__continueButtonIntroDescriptionLabelConstraint = v24;

  CGRect v26 = [(UIButton *)self->__continueButton bottomAnchor];
  v27 = [(UIButton *)self->__resetButton topAnchor];
  v28 = [v26 constraintLessThanOrEqualToAnchor:v27 constant:-10.0];
  continueButtonResetButtonConstraint = self->__continueButtonResetButtonConstraint;
  self->__continueButtonResetButtonConstraint = v28;

  v30 = [(UIButton *)self->__continueButton bottomAnchor];
  v31 = [(UIButton *)self->__launchCameraButton topAnchor];
  v32 = [v30 constraintLessThanOrEqualToAnchor:v31 constant:-10.0];
  continueButtonLaunchCameraButtonConstraint = self->__continueButtonLaunchCameraButtonConstraint;
  self->__continueButtonLaunchCameraButtonConstraint = v32;

  id v34 = [(UIButton *)self->__continueButton bottomAnchor];
  v35 = [(UIButton *)self->__startOverButton topAnchor];
  char v36 = [v34 constraintLessThanOrEqualToAnchor:v35 constant:-10.0];
  continueButtonStartOverButtonConstraint = self->__continueButtonStartOverButtonConstraint;
  self->__continueButtonStartOverButtonConstraint = v36;

  BOOL v38 = [(UIButton *)self->__continueButton bottomAnchor];
  BOOL v39 = [(CAMScrollViewWithLayoutDelegate *)self->__scrollView bottomAnchor];
  double v40 = [v38 constraintEqualToAnchor:v39 constant:-14.0];
  continueButtonBottomConstraint = self->__continueButtonBottomConstraint;
  self->__continueButtonBottomConstraint = v40;

  double v42 = self->__continueButtonBottomConstraint;
  [(NSLayoutConstraint *)v42 priority];
  *(float *)&double v44 = v43 + -1.0;
  [(NSLayoutConstraint *)v42 setPriority:v44];
  double v45 = [(UILabel *)self->__tuneInstructionLabel lastBaselineAnchor];
  uint64_t v46 = [(CAMScrollViewWithLayoutDelegate *)self->__scrollView bottomAnchor];
  BOOL v47 = [v45 constraintLessThanOrEqualToAnchor:v46];
  tuneInstructionLabelBottomConstraint = self->__tuneInstructionLabelBottomConstraint;
  self->__tuneInstructionLabelBottomConstraint = v47;

  id v49 = [(UIStackView *)self->__finishedStack topAnchor];
  BOOL v50 = [(CAMScrollViewWithLayoutDelegate *)self->__scrollView topAnchor];
  BOOL v51 = [v49 constraintGreaterThanOrEqualToAnchor:v50];
  finishedStackTopConstraint = self->__finishedStackTopConstraint;
  self->__finishedStackTopConstraint = v51;

  BOOL v53 = [(CAMSmartStyleSettingsView *)self _dpadControl];
  v54 = [(CAMSmartStyleSettingsView *)self _styleTypes];
  v220[0] = MEMORY[0x263EF8330];
  v220[1] = 3221225472;
  v220[2] = __44__CAMSmartStyleSettingsView__addConstraints__block_invoke;
  v220[3] = &unk_263FA43F8;
  v220[4] = self;
  id v221 = v53;
  long long v222 = xmmword_209C7B210;
  id v218 = v53;
  [v54 enumerateObjectsUsingBlock:v220];

  BOOL v55 = [(CAMSmartStyleSettingsView *)self _intensitySliders];
  v219 = [v55 firstObject];

  unint64_t v56 = [(CAMScrollViewWithLayoutDelegate *)self->__scrollView contentLayoutGuide];
  BOOL v57 = [v56 heightAnchor];
  v58 = [(CAMSmartStyleSettingsView *)self safeAreaLayoutGuide];
  BOOL v59 = [v58 heightAnchor];
  v60 = [v57 constraintEqualToAnchor:v59];

  LODWORD(v61) = 1132003328;
  v208 = v60;
  [v60 setPriority:v61];
  v156 = (void *)MEMORY[0x263F08938];
  v217 = [(CAMScrollViewWithLayoutDelegate *)self->__scrollView leadingAnchor];
  v216 = [(CAMSmartStyleSettingsView *)self leadingAnchor];
  v215 = [v217 constraintEqualToAnchor:v216];
  v231[0] = v215;
  v214 = [(CAMScrollViewWithLayoutDelegate *)self->__scrollView trailingAnchor];
  v213 = [(CAMSmartStyleSettingsView *)self trailingAnchor];
  v212 = [v214 constraintEqualToAnchor:v213];
  v231[1] = v212;
  v211 = [(CAMScrollViewWithLayoutDelegate *)self->__scrollView topAnchor];
  v210 = [(CAMSmartStyleSettingsView *)self topAnchor];
  v209 = [v211 constraintEqualToAnchor:v210];
  v231[2] = v209;
  v207 = [(CAMScrollViewWithLayoutDelegate *)self->__scrollView bottomAnchor];
  v206 = [(CAMSmartStyleSettingsView *)self bottomAnchor];
  v205 = [v207 constraintEqualToAnchor:v206];
  v231[3] = v205;
  v204 = [(CAMScrollViewWithLayoutDelegate *)self->__scrollView contentLayoutGuide];
  v202 = [v204 heightAnchor];
  v203 = [(CAMSmartStyleSettingsView *)self safeAreaLayoutGuide];
  v201 = [v203 heightAnchor];
  v200 = [v202 constraintGreaterThanOrEqualToAnchor:v201];
  v231[4] = v200;
  v231[5] = v60;
  v199 = [(UIStackView *)self->__finishedStack centerXAnchor];
  v198 = [(CAMSmartStyleSettingsView *)self centerXAnchor];
  v197 = [v199 constraintEqualToAnchor:v198];
  v231[6] = v197;
  v196 = [(UIStackView *)self->__finishedStack leadingAnchor];
  v195 = [(CAMSmartStyleSettingsView *)self leadingAnchor];
  v194 = [v196 constraintGreaterThanOrEqualToAnchor:v195 constant:28.0];
  v231[7] = v194;
  v193 = [(UIStackView *)self->__finishedStack trailingAnchor];
  v192 = [(CAMSmartStyleSettingsView *)self trailingAnchor];
  v191 = [v193 constraintLessThanOrEqualToAnchor:v192 constant:-28.0];
  v231[8] = v191;
  v190 = [(UIImageView *)self->__introImageView topAnchor];
  v189 = [(CAMScrollViewWithLayoutDelegate *)self->__scrollView topAnchor];
  v188 = [v190 constraintEqualToAnchor:v189 constant:0.0];
  v231[9] = v188;
  v187 = [(UIImageView *)self->__introImageView centerXAnchor];
  v186 = [(CAMSmartStyleSettingsView *)self centerXAnchor];
  v185 = [v187 constraintEqualToAnchor:v186];
  v231[10] = v185;
  v184 = [(UILabel *)self->__introTitleLabel topAnchor];
  v183 = [(UIImageView *)self->__introImageView bottomAnchor];
  v182 = [v184 constraintEqualToAnchor:v183 constant:25.0];
  v231[11] = v182;
  v181 = [(UILabel *)self->__introTitleLabel centerXAnchor];
  v180 = [(CAMSmartStyleSettingsView *)self centerXAnchor];
  v179 = [v181 constraintEqualToAnchor:v180];
  v231[12] = v179;
  v178 = [(UILabel *)self->__introTitleLabel leadingAnchor];
  v177 = [(CAMSmartStyleSettingsView *)self leadingAnchor];
  v176 = [v178 constraintEqualToAnchor:v177 constant:28.0];
  v231[13] = v176;
  v175 = [(UILabel *)self->__introTitleLabel trailingAnchor];
  v174 = [(CAMSmartStyleSettingsView *)self trailingAnchor];
  v173 = [v175 constraintEqualToAnchor:v174 constant:-28.0];
  BOOL v62 = self->__pickerTopConstraint;
  v231[14] = v173;
  v231[15] = v62;
  v172 = [(CAMSemanticStylePicker *)self->__stylePicker topAnchor];
  v171 = [(CAMScrollViewWithLayoutDelegate *)self->__scrollView topAnchor];
  v170 = [v172 constraintGreaterThanOrEqualToAnchor:v171];
  v231[16] = v170;
  v167 = [(CAMSemanticStylePicker *)self->__stylePicker leadingAnchor];
  v166 = [(CAMSmartStyleSettingsView *)self leadingAnchor];
  v165 = [v167 constraintEqualToAnchor:v166];
  v231[17] = v165;
  v164 = [(CAMSemanticStylePicker *)self->__stylePicker trailingAnchor];
  v163 = [(CAMSmartStyleSettingsView *)self trailingAnchor];
  v162 = [v164 constraintEqualToAnchor:v163];
  v231[18] = v162;
  v161 = [(CAMSemanticStylePicker *)self->__stylePicker heightAnchor];
  v160 = [(CAMSemanticStylePicker *)self->__stylePicker widthAnchor];
  [(CAMSmartStyleSettingsView *)self _desiredCarouselRatio];
  v159 = objc_msgSend(v161, "constraintEqualToAnchor:multiplier:", v160);
  v231[19] = v159;
  v158 = [(UIPageControl *)self->__previewPageDots topAnchor];
  v157 = [(CAMSemanticStylePicker *)self->__stylePicker bottomAnchor];
  v155 = [v158 constraintEqualToAnchor:v157 constant:12.0];
  v231[20] = v155;
  v154 = [(UIPageControl *)self->__previewPageDots centerXAnchor];
  v153 = [(CAMSmartStyleSettingsView *)self centerXAnchor];
  v152 = [v154 constraintEqualToAnchor:v153];
  v231[21] = v152;
  v151 = [(UIButton *)self->__selectAssetsButton bottomAnchor];
  objc_super v150 = [(CAMSemanticStylePicker *)self->__stylePicker bottomAnchor];
  v149 = [v151 constraintEqualToAnchor:v150 constant:-12.0];
  v231[22] = v149;
  v148 = [(UIButton *)self->__selectAssetsButton leadingAnchor];
  id v146 = [(CAMSemanticStylePicker *)self->__stylePicker leadingAnchor];
  v145 = [v148 constraintEqualToAnchor:v146 constant:24.0];
  v231[23] = v145;
  id v144 = [(UIButton *)self->__showGridButton topAnchor];
  BOOL v142 = [(CAMSemanticStylePicker *)self->__stylePicker topAnchor];
  v141 = [v144 constraintEqualToAnchor:v142 constant:8.0];
  v231[24] = v141;
  v140 = [(UIButton *)self->__showGridButton leadingAnchor];
  v139 = [(CAMSemanticStylePicker *)self->__stylePicker leadingAnchor];
  v138 = [v140 constraintEqualToAnchor:v139 constant:20.0];
  v231[25] = v138;
  v137 = [(UILabel *)self->__introInstructionLabel topAnchor];
  v136 = [(UILabel *)self->__introTitleLabel lastBaselineAnchor];
  v135 = [v137 constraintEqualToAnchor:v136 constant:60.0];
  v231[26] = v135;
  BOOL v134 = [(UILabel *)self->__introInstructionLabel leadingAnchor];
  v133 = [(CAMSmartStyleSettingsView *)self leadingAnchor];
  v132 = [v134 constraintEqualToAnchor:v133 constant:28.0];
  v231[27] = v132;
  v131 = [(UILabel *)self->__introInstructionLabel trailingAnchor];
  v130 = [(CAMSmartStyleSettingsView *)self trailingAnchor];
  v129 = [v131 constraintEqualToAnchor:v130 constant:-28.0];
  v231[28] = v129;
  v128 = [(UILabel *)self->__introDescriptionLabel topAnchor];
  v127 = [(UILabel *)self->__introInstructionLabel lastBaselineAnchor];
  v126 = [v128 constraintEqualToAnchor:v127 constant:60.0];
  v231[29] = v126;
  uint64_t v125 = [(UILabel *)self->__introDescriptionLabel leadingAnchor];
  v124 = [(CAMSmartStyleSettingsView *)self leadingAnchor];
  v123 = [v125 constraintEqualToAnchor:v124 constant:28.0];
  v231[30] = v123;
  v147 = [(UILabel *)self->__introDescriptionLabel trailingAnchor];
  v122 = [(CAMSmartStyleSettingsView *)self trailingAnchor];
  uint64_t v121 = [v147 constraintEqualToAnchor:v122 constant:-28.0];
  v231[31] = v121;
  v120 = [(UILabel *)self->__chooseInstructionLabel topAnchor];
  v119 = [(UIPageControl *)self->__previewPageDots bottomAnchor];
  v118 = [v120 constraintEqualToAnchor:v119 constant:40.0];
  v231[32] = v118;
  uint64_t v117 = [(UILabel *)self->__chooseInstructionLabel leadingAnchor];
  v116 = [(CAMSmartStyleSettingsView *)self leadingAnchor];
  uint64_t v115 = [v117 constraintEqualToAnchor:v116 constant:28.0];
  v231[33] = v115;
  v114 = [(UILabel *)self->__chooseInstructionLabel trailingAnchor];
  v113 = [(CAMSmartStyleSettingsView *)self trailingAnchor];
  v112 = [v114 constraintEqualToAnchor:v113 constant:-28.0];
  v231[34] = v112;
  v111 = [(UIImageView *)self->__chooseInstructionArrow centerYAnchor];
  uint64_t v110 = [(UIPageControl *)self->__previewPageDots bottomAnchor];
  v109 = [v111 constraintEqualToAnchor:v110 constant:20.0];
  v231[35] = v109;
  v108 = [(UIImageView *)self->__chooseInstructionArrow centerXAnchor];
  uint64_t v107 = [(UIPageControl *)self->__previewPageDots centerXAnchor];
  v106 = [v108 constraintEqualToAnchor:v107];
  v231[36] = v106;
  v105 = [(UILabel *)self->__tuneInstructionLabel topAnchor];
  v104 = [v219 bottomAnchor];
  v103 = [v105 constraintEqualToAnchor:v104 constant:40.0];
  v231[37] = v103;
  uint64_t v102 = [(UILabel *)self->__tuneInstructionLabel leadingAnchor];
  v101 = [(CAMSmartStyleSettingsView *)self leadingAnchor];
  v100 = [v102 constraintEqualToAnchor:v101 constant:28.0];
  v231[38] = v100;
  v143 = [(UILabel *)self->__tuneInstructionLabel trailingAnchor];
  v99 = [(CAMSmartStyleSettingsView *)self trailingAnchor];
  uint64_t v98 = [v143 constraintEqualToAnchor:v99 constant:-28.0];
  v231[39] = v98;
  v97 = [(UIButton *)self->__continueButton leadingAnchor];
  v96 = [(CAMSmartStyleSettingsView *)self leadingAnchor];
  uint64_t v95 = [v97 constraintEqualToAnchor:v96 constant:28.0];
  v231[40] = v95;
  v94 = [(UIButton *)self->__continueButton trailingAnchor];
  v93 = [(CAMSmartStyleSettingsView *)self trailingAnchor];
  v92 = [v94 constraintEqualToAnchor:v93 constant:-28.0];
  v231[41] = v92;
  v91 = [(UIButton *)self->__resetButton leadingAnchor];
  uint64_t v90 = [(CAMSmartStyleSettingsView *)self leadingAnchor];
  v89 = [v91 constraintEqualToAnchor:v90 constant:28.0];
  v231[42] = v89;
  v88 = [(UIButton *)self->__resetButton trailingAnchor];
  v87 = [(CAMSmartStyleSettingsView *)self trailingAnchor];
  uint64_t v86 = [v88 constraintEqualToAnchor:v87 constant:-28.0];
  v231[43] = v86;
  v169 = [(UIButton *)self->__resetButton titleLabel];
  v85 = [v169 lastBaselineAnchor];
  v84 = [(CAMScrollViewWithLayoutDelegate *)self->__scrollView bottomAnchor];
  v83 = [v85 constraintEqualToAnchor:v84 constant:-26.0];
  v231[44] = v83;
  v82 = [(UIButton *)self->__startOverButton leadingAnchor];
  v81 = [(CAMSmartStyleSettingsView *)self leadingAnchor];
  v80 = [v82 constraintEqualToAnchor:v81 constant:28.0];
  v231[45] = v80;
  double v79 = [(UIButton *)self->__startOverButton trailingAnchor];
  double v78 = [(CAMSmartStyleSettingsView *)self trailingAnchor];
  double v77 = [v79 constraintEqualToAnchor:v78 constant:-28.0];
  v231[46] = v77;
  v168 = [(UIButton *)self->__startOverButton titleLabel];
  double v76 = [v168 lastBaselineAnchor];
  double v75 = [(CAMScrollViewWithLayoutDelegate *)self->__scrollView bottomAnchor];
  double v74 = [v76 constraintEqualToAnchor:v75 constant:-26.0];
  v231[47] = v74;
  double v73 = [(UIButton *)self->__launchCameraButton leadingAnchor];
  v63 = [(CAMSmartStyleSettingsView *)self leadingAnchor];
  BOOL v64 = [v73 constraintEqualToAnchor:v63 constant:28.0];
  v231[48] = v64;
  BOOL v65 = [(UIButton *)self->__launchCameraButton trailingAnchor];
  BOOL v66 = [(CAMSmartStyleSettingsView *)self trailingAnchor];
  uint64_t v67 = [v65 constraintEqualToAnchor:v66 constant:-28.0];
  v231[49] = v67;
  id v68 = [(UIButton *)self->__launchCameraButton titleLabel];
  uint64_t v69 = [v68 lastBaselineAnchor];
  v70 = [(CAMScrollViewWithLayoutDelegate *)self->__scrollView bottomAnchor];
  v71 = [v69 constraintEqualToAnchor:v70 constant:-26.0];
  v231[50] = v71;
  double v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:v231 count:51];
  [v156 activateConstraints:v72];
}

void __44__CAMSmartStyleSettingsView__addConstraints__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) _styleNameBadges];
  id v68 = [v5 objectAtIndexedSubscript:a3];

  uint64_t v6 = [*(id *)(a1 + 32) _intensitySliders];
  double v7 = [v6 objectAtIndexedSubscript:a3];

  double v8 = [*(id *)(a1 + 32) _styleDescriptionLabels];
  double v9 = [v8 objectAtIndexedSubscript:a3];

  uint64_t v10 = [v68 topAnchor];
  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 496) bottomAnchor];
  uint64_t v12 = [v10 constraintEqualToAnchor:v11 constant:7.0];

  id v13 = [v68 topAnchor];
  BOOL v14 = [*(id *)(*(void *)(a1 + 32) + 480) bottomAnchor];
  uint64_t v15 = [v13 constraintEqualToAnchor:v14 constant:*(double *)(a1 + 48)];

  id v16 = [v68 centerXAnchor];
  uint64_t v17 = [*(id *)(a1 + 32) leftAnchor];
  uint64_t v18 = [v16 constraintEqualToAnchor:v17];

  [v18 setActive:1];
  uint64_t v67 = (void *)v12;
  [*(id *)(*(void *)(a1 + 32) + 680) addObject:v12];
  BOOL v66 = (void *)v15;
  [*(id *)(*(void *)(a1 + 32) + 688) addObject:v15];
  [*(id *)(*(void *)(a1 + 32) + 696) addObject:v18];
  if (!a3)
  {
    id v19 = [*(id *)(a1 + 40) view];
    uint64_t v20 = [v19 topAnchor];
    CGRect v21 = [v68 bottomAnchor];
    double v22 = [v20 constraintEqualToAnchor:v21 constant:*(double *)(a1 + 48)];
    [v22 setActive:1];

    v23 = [*(id *)(a1 + 40) view];
    double v24 = [v23 widthAnchor];
    v25 = [*(id *)(a1 + 32) widthAnchor];
    +[CAMSmartStyleSettingsView dpadWidthRatio];
    CGRect v26 = objc_msgSend(v24, "constraintEqualToAnchor:multiplier:", v25);
    [v26 setActive:1];

    v27 = [*(id *)(a1 + 40) view];
    v28 = [v27 heightAnchor];
    v29 = [*(id *)(a1 + 40) view];
    v30 = [v29 widthAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    [v31 setActive:1];

    v32 = [*(id *)(a1 + 40) view];
    double v33 = [v32 centerXAnchor];
    id v34 = [*(id *)(*(void *)(a1 + 32) + 480) centerXAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    [v35 setActive:1];
  }
  char v36 = [v7 topAnchor];
  double v37 = [v9 bottomAnchor];
  BOOL v38 = [v36 constraintEqualToAnchor:v37 constant:*(double *)(a1 + 48)];

  BOOL v39 = [v7 topAnchor];
  double v40 = [*(id *)(a1 + 40) view];
  char v41 = [v40 bottomAnchor];
  double v42 = [v39 constraintEqualToAnchor:v41 constant:*(double *)(a1 + 48)];

  float v43 = [*(id *)(*(void *)(a1 + 32) + 576) topAnchor];
  double v44 = [v7 bottomAnchor];
  double v45 = [v43 constraintGreaterThanOrEqualToAnchor:v44 constant:*(double *)(a1 + 48)];

  [*(id *)(*(void *)(a1 + 32) + 704) addObject:v38];
  [*(id *)(*(void *)(a1 + 32) + 712) addObject:v42];
  [*(id *)(*(void *)(a1 + 32) + 720) addObject:v45];
  uint64_t v46 = [v7 widthAnchor];
  BOOL v47 = [v46 constraintEqualToConstant:108.0];
  [v47 setActive:1];

  BOOL v48 = [v7 heightAnchor];
  id v49 = [v48 constraintEqualToConstant:20.0];
  [v49 setActive:1];

  BOOL v50 = [v7 centerXAnchor];
  BOOL v51 = [v68 centerXAnchor];
  BOOL v52 = [v50 constraintEqualToAnchor:v51];
  [v52 setActive:1];

  BOOL v53 = [v9 topAnchor];
  v54 = [v68 bottomAnchor];
  BOOL v55 = [v53 constraintEqualToAnchor:v54 constant:*(double *)(a1 + 48)];
  [v55 setActive:1];

  unint64_t v56 = [v9 centerXAnchor];
  BOOL v57 = [v68 centerXAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  [v58 setActive:1];

  BOOL v59 = [v9 widthAnchor];
  v60 = [*(id *)(a1 + 32) widthAnchor];
  double v61 = [v59 constraintEqualToAnchor:v60 constant:*(double *)(a1 + 56) * -2.0];
  [v61 setActive:1];

  [v67 priority];
  *(float *)&double v63 = v62 + -1.0;
  [v66 setPriority:v63];
  [v42 priority];
  *(float *)&double v65 = v64 + -1.0;
  [v38 setPriority:v65];
}

- (double)_desiredCarouselRatio
{
  [(CAMSmartStyleSettingsView *)self bounds];
  double v4 = fabs(v3 / v2 + -1.77777778);
  +[CAMSmartStylePreviewViewController desiredCarouselRatio];
  if (v4 < 0.01) {
    return 0.875;
  }
  return result;
}

- (id)_titleCheckmarkView
{
  double v2 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F83608]];
  double v3 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark.circle" withConfiguration:v2];
  double v4 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v3];
  uint64_t v5 = [MEMORY[0x263F825C8] systemGreenColor];
  [v4 setTintColor:v5];

  return v4;
}

- (id)_titleLabelWithText:(id)a3
{
  double v3 = (void *)MEMORY[0x263F81720];
  uint64_t v4 = *MEMORY[0x263F83608];
  id v5 = a3;
  uint64_t v6 = [v3 preferredFontDescriptorWithTextStyle:v4 addingSymbolicTraits:32770 options:0];
  double v7 = [MEMORY[0x263F81708] fontWithDescriptor:v6 size:0.0];
  id v8 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v8 setText:v5];

  [v8 setFont:v7];
  [v8 setNumberOfLines:0];
  [v8 setTextAlignment:1];

  return v8;
}

- (id)_assetButtonConfiguration
{
  double v2 = [MEMORY[0x263F824F0] filledButtonConfiguration];
  [v2 setCornerStyle:4];
  [v2 setButtonSize:3];
  double v3 = [MEMORY[0x263F825C8] blackColor];
  uint64_t v4 = [v3 colorWithAlphaComponent:0.3];
  [v2 setBaseBackgroundColor:v4];

  id v5 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setBaseForegroundColor:v5];

  uint64_t v6 = [MEMORY[0x263F82818] configurationWithPointSize:14.0];
  double v7 = [MEMORY[0x263F827E8] systemImageNamed:@"photo.on.rectangle" withConfiguration:v6];
  [v2 setImage:v7];

  objc_msgSend(v2, "setContentInsets:", 12.0, 12.0, 12.0, 12.0);
  return v2;
}

- (id)_showGridButtonConfiguration
{
  double v2 = [MEMORY[0x263F824F0] borderlessButtonConfiguration];
  [v2 setButtonSize:3];
  double v3 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setBaseForegroundColor:v3];

  uint64_t v4 = [MEMORY[0x263F82818] configurationWithPointSize:16.0];
  id v5 = [MEMORY[0x263F827E8] systemImageNamed:@"square.grid.2x2.fill" withConfiguration:v4];
  [v2 setImage:v5];

  objc_msgSend(v2, "setContentInsets:", 12.0, 12.0, 12.0, 12.0);
  return v2;
}

+ (id)continueButtonConfiguration
{
  double v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835D0] addingSymbolicTraits:0 options:0];
  double v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];
  uint64_t v4 = [MEMORY[0x263F824F0] filledButtonConfiguration];
  objc_msgSend(v4, "setContentInsets:", 16.0, 16.0, 16.0, 16.0);
  id v5 = [MEMORY[0x263F825C8] systemBlueColor];
  [v4 setBaseBackgroundColor:v5];

  [v4 setCornerStyle:3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__CAMSmartStyleSettingsView_continueButtonConfiguration__block_invoke;
  v8[3] = &unk_263FA4168;
  id v9 = v3;
  id v6 = v3;
  [v4 setTitleTextAttributesTransformer:v8];

  return v4;
}

id __56__CAMSmartStyleSettingsView_continueButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  double v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x263F814F0]];
  return v3;
}

+ (id)showAssetsButtonConfiguration
{
  double v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835D0] addingSymbolicTraits:0 options:0];
  double v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];
  uint64_t v4 = [MEMORY[0x263F824F0] plainButtonConfiguration];
  objc_msgSend(v4, "setContentInsets:", 16.0, 16.0, 16.0, 16.0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CAMSmartStyleSettingsView_showAssetsButtonConfiguration__block_invoke;
  v7[3] = &unk_263FA4168;
  id v8 = v3;
  id v5 = v3;
  [v4 setTitleTextAttributesTransformer:v7];

  return v4;
}

id __58__CAMSmartStyleSettingsView_showAssetsButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  double v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x263F814F0]];
  return v3;
}

- (id)_secondaryButtonConfiguration
{
  double v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835D0] addingSymbolicTraits:0 options:0];
  double v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];
  uint64_t v4 = [MEMORY[0x263F824F0] plainButtonConfiguration];
  objc_msgSend(v4, "setContentInsets:", 16.0, 16.0, 16.0, 16.0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CAMSmartStyleSettingsView__secondaryButtonConfiguration__block_invoke;
  v7[3] = &unk_263FA4168;
  id v8 = v3;
  id v5 = v3;
  [v4 setTitleTextAttributesTransformer:v7];

  return v4;
}

id __58__CAMSmartStyleSettingsView__secondaryButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  double v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x263F814F0]];
  return v3;
}

- (id)_fontWithTextStyle:(id)a3
{
  return [(CAMSmartStyleSettingsView *)self _fontWithTextStyle:a3 traits:0];
}

- (id)_fontWithTextStyle:(id)a3 traits:(unsigned int)a4
{
  uint64_t v4 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:*(void *)&a4 options:0];
  id v5 = [MEMORY[0x263F81708] fontWithDescriptor:v4 size:0.0];

  return v5;
}

- (void)_handleStylePickerTap:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(CAMSmartStyleSettingsView *)self _previewViewControllersByStyleIndex];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMSmartStyleSettingsView visiblePreviewIndex](self, "visiblePreviewIndex"));
  id v6 = [v4 objectForKeyedSubscript:v5];

  double v7 = [v6 view];
  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if (v5)
  {
    id v8 = [v6 view];
    [v8 handleTap:v9];
    -[CAMSmartStyleSettingsView _setPreviewViewControllersExpandedItemIndex:animated:](self, "_setPreviewViewControllersExpandedItemIndex:animated:", [v8 expandedItemIndex], 1);
    [(CAMSmartStyleSettingsView *)self _updateShowGridButtonAnimated:1];
  }
}

- (void)_setPreviewViewControllersExpandedItemIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(CAMSmartStyleSettingsView *)self _previewViewControllersByStyleIndex];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__CAMSmartStyleSettingsView__setPreviewViewControllersExpandedItemIndex_animated___block_invoke;
  v8[3] = &__block_descriptor_41_e61_v32__0__NSNumber_8__CAMSmartStylePreviewViewController_16_B24l;
  void v8[4] = a3;
  BOOL v9 = v4;
  [v7 enumerateKeysAndObjectsUsingBlock:v8];

  [(CAMSmartStyleSettingsView *)self _updateShowGridButtonAnimated:v4];
}

uint64_t __82__CAMSmartStyleSettingsView__setPreviewViewControllersExpandedItemIndex_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setExpandedItemIndex:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)semanticStylePickerDidChangeSelectedStyle:(id)a3
{
  uint64_t v4 = [a3 selectedStyleIndex];
  [(CAMSmartStyleSettingsView *)self _setVisiblePreviewIndex:v4 updatePageControl:1 updateStylePicker:0 animated:1 notifyDelegate:1];
}

- (void)semanticStylePickerDidScroll:(id)a3
{
  id v5 = a3;
  [(CAMSmartStyleSettingsView *)self _layoutMaskedViews];
  [(CAMSmartStyleSettingsView *)self _updateAlphaForChooseInstructions];
  if (self->__stage == 1)
  {
    [v5 fractionalPageIndex];
    if (v4 >= 1.0) {
      [(CAMSmartStyleSettingsView *)self _moveToNextStageIfAllowedAnimated:1];
    }
  }
}

- (void)_prepareHaptics
{
  id v2 = [(CAMSmartStyleSettingsView *)self _feedbackController];
  [v2 prepareDiscreteFeedback:0];
}

- (void)_performHaptics
{
  id v2 = [(CAMSmartStyleSettingsView *)self _feedbackController];
  [v2 performDiscreteFeedback:0];
}

- (void)_handlePageControlValueChanged:(id)a3
{
  id v4 = a3;
  [(CAMSmartStyleSettingsView *)self _performHaptics];
  [(CAMSmartStyleSettingsView *)self _prepareHaptics];
  uint64_t v5 = [v4 interactionState];

  int64_t v6 = [(CAMSmartStyleSettingsView *)self _previewIndexFromPageDots];
  [(CAMSmartStyleSettingsView *)self _setVisiblePreviewIndex:v6 updatePageControl:0 updateStylePicker:1 animated:v5 == 1 notifyDelegate:1];
}

- (BOOL)_didCompleteChooseInstructions
{
  return [(CAMSmartStyleSettingsView *)self _readBooleanPreferenceForKey:@"CAMUserPreferenceSmartStyleSettingsDidCompleteChooseInstructions"];
}

- (void)_setDidCompleteChooseInstructions:(BOOL)a3
{
}

- (BOOL)_didCompleteTuneInstructions
{
  return [(CAMSmartStyleSettingsView *)self _readBooleanPreferenceForKey:@"CAMUserPreferenceSmartStyleSettingsDidCompleteTuneInstructions"];
}

- (void)_setDidCompleteTuneInstructions:(BOOL)a3
{
}

- (BOOL)_readBooleanPreferenceForKey:(id)a3
{
  return CFPreferencesGetAppBooleanValue((CFStringRef)a3, @"com.apple.camera", 0) != 0;
}

- (void)_setBooleanPreference:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  uint64_t v5 = NSNumber;
  int64_t v6 = (__CFString *)a4;
  CFPreferencesSetAppValue(v6, (CFPropertyListRef)[v5 numberWithBool:v4], @"com.apple.camera");

  CFPreferencesAppSynchronize(@"com.apple.camera");
}

- (CAMSmartStyleSettingsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMSmartStyleSettingsViewDelegate *)WeakRetained;
}

- (CAMScrollViewWithLayoutDelegate)_scrollView
{
  return self->__scrollView;
}

- (UIImageView)_introImageView
{
  return self->__introImageView;
}

- (UIStackView)_finishedStack
{
  return self->__finishedStack;
}

- (UILabel)_introTitleLabel
{
  return self->__introTitleLabel;
}

- (UIButton)_selectAssetsButton
{
  return self->__selectAssetsButton;
}

- (UIButton)_showGridButton
{
  return self->__showGridButton;
}

- (NSArray)_styleClippingContainerViews
{
  return self->__styleClippingContainerViews;
}

- (CAMSemanticStylePicker)_stylePicker
{
  return self->__stylePicker;
}

- (NSMutableDictionary)_previewViewControllersByStyleIndex
{
  return self->__previewViewControllersByStyleIndex;
}

- (UIPageControl)_previewPageDots
{
  return self->__previewPageDots;
}

- (NSMutableArray)_styleNameBadges
{
  return self->__styleNameBadges;
}

- (PEPhotoStyleDPad)_dpadControl
{
  return self->__dpadControl;
}

- (NSMutableArray)_intensitySliders
{
  return self->__intensitySliders;
}

- (NSMutableArray)_styleDescriptionLabels
{
  return self->__styleDescriptionLabels;
}

- (UILabel)_introInstructionLabel
{
  return self->__introInstructionLabel;
}

- (UILabel)_introDescriptionLabel
{
  return self->__introDescriptionLabel;
}

- (UILabel)_chooseInstructionLabel
{
  return self->__chooseInstructionLabel;
}

- (UIImageView)_chooseInstructionArrow
{
  return self->__chooseInstructionArrow;
}

- (UILabel)_tuneInstructionLabel
{
  return self->__tuneInstructionLabel;
}

- (UIButton)_continueButton
{
  return self->__continueButton;
}

- (UIButton)_startOverButton
{
  return self->__startOverButton;
}

- (UIButton)_resetButton
{
  return self->__resetButton;
}

- (UIButton)_launchCameraButton
{
  return self->__launchCameraButton;
}

- (unint64_t)_stage
{
  return self->__stage;
}

- (BOOL)_hasEnoughPhotos
{
  return self->__hasEnoughPhotos;
}

- (BOOL)_usingMostCompatibleFormat
{
  return self->__usingMostCompatibleFormat;
}

- (NSArray)_styleTypes
{
  return self->__styleTypes;
}

- (int64_t)visiblePreviewIndex
{
  return self->_visiblePreviewIndex;
}

- (NSArray)_styleNames
{
  return self->__styleNames;
}

- (UIImage)_thumbnailPreviewImage
{
  return self->__thumbnailPreviewImage;
}

- (NSMutableSet)_stageButtonSuppressionReasons
{
  return self->__stageButtonSuppressionReasons;
}

- (CEKAnimationSequence)_animationSequence
{
  return self->__animationSequence;
}

- (NSLayoutConstraint)_pickerTopConstraint
{
  return self->__pickerTopConstraint;
}

- (NSLayoutConstraint)_pickerFinishedStackConstraint
{
  return self->__pickerFinishedStackConstraint;
}

- (NSMutableArray)_styleBadgeBelowDotsConstraints
{
  return self->__styleBadgeBelowDotsConstraints;
}

- (NSMutableArray)_styleBadgeBelowImageConstraints
{
  return self->__styleBadgeBelowImageConstraints;
}

- (NSMutableArray)_styleBadgeCenterXConstraints
{
  return self->__styleBadgeCenterXConstraints;
}

- (NSMutableArray)_intensitySliderBelowDescriptionConstraints
{
  return self->__intensitySliderBelowDescriptionConstraints;
}

- (NSMutableArray)_intensitySliderBelowDpadConstraints
{
  return self->__intensitySliderBelowDpadConstraints;
}

- (NSMutableArray)_continueButtonBelowIntensitySliderConstraints
{
  return self->__continueButtonBelowIntensitySliderConstraints;
}

- (NSLayoutConstraint)_continueButtonIntroDescriptionLabelConstraint
{
  return self->__continueButtonIntroDescriptionLabelConstraint;
}

- (NSLayoutConstraint)_continueButtonResetButtonConstraint
{
  return self->__continueButtonResetButtonConstraint;
}

- (NSLayoutConstraint)_continueButtonLaunchCameraButtonConstraint
{
  return self->__continueButtonLaunchCameraButtonConstraint;
}

- (NSLayoutConstraint)_continueButtonStartOverButtonConstraint
{
  return self->__continueButtonStartOverButtonConstraint;
}

- (NSLayoutConstraint)_continueButtonBottomConstraint
{
  return self->__continueButtonBottomConstraint;
}

- (NSLayoutConstraint)_tuneInstructionLabelBottomConstraint
{
  return self->__tuneInstructionLabelBottomConstraint;
}

- (NSLayoutConstraint)_finishedStackTopConstraint
{
  return self->__finishedStackTopConstraint;
}

- (CAMFeedbackController)_feedbackController
{
  return self->__feedbackController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__feedbackController, 0);
  objc_storeStrong((id *)&self->__finishedStackTopConstraint, 0);
  objc_storeStrong((id *)&self->__tuneInstructionLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->__continueButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->__continueButtonStartOverButtonConstraint, 0);
  objc_storeStrong((id *)&self->__continueButtonLaunchCameraButtonConstraint, 0);
  objc_storeStrong((id *)&self->__continueButtonResetButtonConstraint, 0);
  objc_storeStrong((id *)&self->__continueButtonIntroDescriptionLabelConstraint, 0);
  objc_storeStrong((id *)&self->__continueButtonBelowIntensitySliderConstraints, 0);
  objc_storeStrong((id *)&self->__intensitySliderBelowDpadConstraints, 0);
  objc_storeStrong((id *)&self->__intensitySliderBelowDescriptionConstraints, 0);
  objc_storeStrong((id *)&self->__styleBadgeCenterXConstraints, 0);
  objc_storeStrong((id *)&self->__styleBadgeBelowImageConstraints, 0);
  objc_storeStrong((id *)&self->__styleBadgeBelowDotsConstraints, 0);
  objc_storeStrong((id *)&self->__pickerFinishedStackConstraint, 0);
  objc_storeStrong((id *)&self->__pickerTopConstraint, 0);
  objc_storeStrong((id *)&self->__animationSequence, 0);
  objc_storeStrong((id *)&self->__stageButtonSuppressionReasons, 0);
  objc_storeStrong((id *)&self->__thumbnailPreviewImage, 0);
  objc_storeStrong((id *)&self->__styleNames, 0);
  objc_storeStrong((id *)&self->__styleTypes, 0);
  objc_storeStrong((id *)&self->__launchCameraButton, 0);
  objc_storeStrong((id *)&self->__resetButton, 0);
  objc_storeStrong((id *)&self->__startOverButton, 0);
  objc_storeStrong((id *)&self->__continueButton, 0);
  objc_storeStrong((id *)&self->__tuneInstructionLabel, 0);
  objc_storeStrong((id *)&self->__chooseInstructionArrow, 0);
  objc_storeStrong((id *)&self->__chooseInstructionLabel, 0);
  objc_storeStrong((id *)&self->__introDescriptionLabel, 0);
  objc_storeStrong((id *)&self->__introInstructionLabel, 0);
  objc_storeStrong((id *)&self->__styleDescriptionLabels, 0);
  objc_storeStrong((id *)&self->__intensitySliders, 0);
  objc_storeStrong((id *)&self->__dpadControl, 0);
  objc_storeStrong((id *)&self->__styleNameBadges, 0);
  objc_storeStrong((id *)&self->__previewPageDots, 0);
  objc_storeStrong((id *)&self->__previewViewControllersByStyleIndex, 0);
  objc_storeStrong((id *)&self->__stylePicker, 0);
  objc_storeStrong((id *)&self->__styleClippingContainerViews, 0);
  objc_storeStrong((id *)&self->__showGridButton, 0);
  objc_storeStrong((id *)&self->__selectAssetsButton, 0);
  objc_storeStrong((id *)&self->__introTitleLabel, 0);
  objc_storeStrong((id *)&self->__finishedStack, 0);
  objc_storeStrong((id *)&self->__introImageView, 0);
  objc_storeStrong((id *)&self->__scrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)_descriptionForStylePreset:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  double v3 = CEKDebugStringForSmartStylePresetType();
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Unexpected style preset %{public}@", (uint8_t *)&v4, 0xCu);
}

@end