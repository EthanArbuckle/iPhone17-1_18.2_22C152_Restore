@interface CKEffectPickerView
+ (BOOL)shouldUseLargeScreenDimension;
- (BOOL)_keyboardIsOnTopOfEffectPickerWindow;
- (BOOL)isAnimating;
- (BOOL)isInDarkMode;
- (BOOL)needsSwitcherAnimation;
- (BOOL)shouldAnimatePreviousLabelForCancel:(id)a3;
- (BOOL)usesDarkVibrancyForLayers;
- (CABackdropLayer)backdrop;
- (CABackdropLayer)segmentedBackdrop;
- (CALayer)blueContrastLayer;
- (CGPoint)balloonViewOrigin;
- (CGRect)_updateBalloonViewOrigin:(CGRect)a3 forButtonFrame:(CGRect)a4;
- (CKBalloonView)balloonView;
- (CKChatControllerDummyAnimator)dummyAnimator;
- (CKEffectPickerView)initWithFrame:(CGRect)a3 sendButtonFrame:(CGRect)a4 balloonViewOrigin:(CGPoint)a5 composition:(id)a6 color:(char)a7;
- (CKEffectPickerViewDelegate)delegate;
- (CKFullScreenEffectManager)fsem;
- (NSArray)momentIdentifiers;
- (NSLayoutConstraint)closeButtonBottomConstraint;
- (NSLayoutConstraint)lastEffectDotTopConstraint;
- (NSLayoutConstraint)mainLabelBottomConstraint;
- (NSLayoutConstraint)roundedContainerViewTopConstraint;
- (NSLayoutConstraint)typeSegmentedControlBottomConstraint;
- (NSMutableArray)effectDescriptiveLabels;
- (NSMutableArray)effectDotButtons;
- (NSMutableArray)effectIdentifiers;
- (NSMutableArray)effectLabels;
- (NSMutableArray)effectSendButtons;
- (NSMutableDictionary)animatedCells;
- (NSMutableDictionary)animationTimers;
- (NSMutableDictionary)effectDotConstraintsThatChange;
- (NSMutableDictionary)pausedAnimatedCells;
- (UIButton)closeButton;
- (UIButton)sendMomentButton;
- (UICollectionView)momentsCollectionView;
- (UIFont)effectLabelFont;
- (UILabel)mainLabel;
- (UILabel)momentTitleLabel;
- (UIPageControl)pageControl;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UISegmentedControl)typeSegmentedControl;
- (UIView)accessibilityBackdropView;
- (UIView)accessibilityCloseBackgroundView;
- (UIView)accessibilitySendBackgroundView;
- (UIView)backgroundView;
- (UIView)hintBlackText;
- (UIView)hintContainer;
- (UIView)hintSendButton;
- (UIView)peekContainer;
- (UIView)roundedContainerView;
- (UIView)roundedView;
- (char)controlColor;
- (double)marginBetweenPickerDotButtons;
- (double)offsetYForLabelAtIndex:(int64_t)a3 withInitialY:(double)a4;
- (id)_blackTextReplica;
- (id)_defaultSendAnimationContextForAnimationPreview;
- (id)_glyphLayerForButtonAnimationWithGlyphName:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)sendImage;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)selectedMomentIndex;
- (unint64_t)selectedIndex;
- (void)_accessibilityContrastStatusDidChange;
- (void)_adjustMainLabelAndTypeSegmentedControlIfNecessary;
- (void)_animateIn;
- (void)_animateInSendButton:(id)a3;
- (void)_animateOut;
- (void)_animateOutSendButton:(id)a3;
- (void)_animateSelectedEffectLabelAtIndex:(unint64_t)a3 fromPreviousIndex:(unint64_t)a4;
- (void)_applicationDidEnterBackground;
- (void)_applicationWillEnterForeground;
- (void)_panGesture:(id)a3;
- (void)_resizeBalloon;
- (void)_setBalloonText:(id)a3 withColor:(id)a4;
- (void)_setNeedsSwitcherAnimationIfNecessary;
- (void)_startSwitcherAnimationIfNecessary;
- (void)_stopBalloonAnimation;
- (void)_touchUpInsideDotButton:(id)a3;
- (void)_touchUpInsideSendButton:(id)a3;
- (void)_touchUpInsideSendMomentButton:(id)a3;
- (void)_updateBalloonViewPositionAnimated:(BOOL)a3;
- (void)_updateMomentsBackgroundColor;
- (void)addAnimationTimerForCell:(id)a3;
- (void)addEffect:(id)a3 withDescriptiveText:(id)a4 withIdentifier:(id)a5;
- (void)cancelImpactSelection;
- (void)checkAndUpdateForSpotlightEffect:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)effectTypeDidChange:(id)a3;
- (void)handleTouchMoved:(CGPoint)a3;
- (void)handleTouchUp:(CGPoint)a3;
- (void)invalidateAllAnimationTimers;
- (void)layoutSubviews;
- (void)pageControlChanged:(id)a3;
- (void)removeAnimationTimerForCell:(id)a3;
- (void)resetDotConstraintsToDefault;
- (void)safeAreaInsetsDidChange;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)setAccessibilityBackdropView:(id)a3;
- (void)setAccessibilityCloseBackgroundView:(id)a3;
- (void)setAccessibilitySendBackgroundView:(id)a3;
- (void)setAnimatedCells:(id)a3;
- (void)setAnimationTimers:(id)a3;
- (void)setBackdrop:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBalloonText:(id)a3;
- (void)setBalloonView:(id)a3;
- (void)setBalloonViewOrigin:(CGPoint)a3;
- (void)setBlueContrastLayer:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setCloseButtonBottomConstraint:(id)a3;
- (void)setControlColor:(char)a3;
- (void)setDelegate:(id)a3;
- (void)setDummyAnimator:(id)a3;
- (void)setEffectDescriptiveLabels:(id)a3;
- (void)setEffectDotButtons:(id)a3;
- (void)setEffectDotConstraintsThatChange:(id)a3;
- (void)setEffectIdentifiers:(id)a3;
- (void)setEffectLabelFont:(id)a3;
- (void)setEffectLabels:(id)a3;
- (void)setEffectSendButtons:(id)a3;
- (void)setFsem:(id)a3;
- (void)setHintBlackText:(id)a3;
- (void)setHintContainer:(id)a3;
- (void)setHintSendButton:(id)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setIsInDarkMode:(BOOL)a3;
- (void)setLastEffectDotTopConstraint:(id)a3;
- (void)setMainLabel:(id)a3;
- (void)setMainLabelBottomConstraint:(id)a3;
- (void)setMomentIdentifiers:(id)a3;
- (void)setMomentTitleLabel:(id)a3;
- (void)setMomentsCollectionView:(id)a3;
- (void)setNeedsSwitcherAnimation:(BOOL)a3;
- (void)setPageControl:(id)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setPausedAnimatedCells:(id)a3;
- (void)setPeekContainer:(id)a3;
- (void)setRoundedContainerView:(id)a3;
- (void)setRoundedContainerViewTopConstraint:(id)a3;
- (void)setRoundedView:(id)a3;
- (void)setSegmentedBackdrop:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setSendMomentButton:(id)a3;
- (void)setTypeSegmentedControl:(id)a3;
- (void)setTypeSegmentedControlBottomConstraint:(id)a3;
- (void)setUsesDarkVibrancyForLayers:(BOOL)a3;
- (void)startAnimationPreviewForIdentifier:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateColor:(char)a3;
- (void)updateHintTransition:(double)a3;
- (void)updateMomentTitle:(BOOL)a3;
- (void)updateViewColors;
- (void)updateViewColors:(BOOL)a3;
@end

@implementation CKEffectPickerView

- (double)marginBetweenPickerDotButtons
{
  return 0.0;
}

+ (BOOL)shouldUseLargeScreenDimension
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  double Height = CGRectGetHeight(v7);

  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  double Width = CGRectGetWidth(v8);

  return Height <= Width || Height > 568.0;
}

- (CKEffectPickerView)initWithFrame:(CGRect)a3 sendButtonFrame:(CGRect)a4 balloonViewOrigin:(CGPoint)a5 composition:(id)a6 color:(char)a7
{
  CGFloat y = a5.y;
  double height = a4.size.height;
  double width = a4.size.width;
  double v10 = a4.origin.y;
  double x = a4.origin.x;
  double v12 = a3.size.height;
  double v13 = a3.size.width;
  double v14 = a3.origin.y;
  double v15 = a3.origin.x;
  v208[1] = *MEMORY[0x1E4F143B8];
  id v17 = *(id *)&a5.x;
  v205.receiver = self;
  v205.super_class = (Class)CKEffectPickerView;
  v18 = -[CKEffectPickerView initWithFrame:](&v205, sel_initWithFrame_, v15, v14, v13, v12);
  if (v18)
  {
    v204 = v17;
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v18 selector:sel_contentSizeCategoryDidChange name:*MEMORY[0x1E4F43788] object:0];

    v18->_selectedIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    -[CKEffectPickerView setBalloonViewOrigin:](v18, "setBalloonViewOrigin:", v209, v210);
    unsigned int v187 = LODWORD(y);
    [(CKEffectPickerView *)v18 setControlColor:*(void *)&y];
    v20 = [(CKEffectPickerView *)v18 traitCollection];
    -[CKEffectPickerView setIsInDarkMode:](v18, "setIsInDarkMode:", [v20 userInterfaceStyle] == 2);

    v21 = objc_alloc_init(CKChatControllerDummyAnimator);
    [(CKEffectPickerView *)v18 setDummyAnimator:v21];

    v22 = [(CKEffectPickerView *)v18 layer];
    [v22 setAllowsGroupBlending:0];

    id v23 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    v24 = +[CKUIBehavior sharedBehaviors];
    v25 = [v24 theme];
    id v26 = [v25 fsmPickerBlueLayerBackgroundColor];
    objc_msgSend(v23, "setBackgroundColor:", objc_msgSend(v26, "CGColor"));

    v27 = [(CKEffectPickerView *)v18 layer];
    [v27 bounds];
    objc_msgSend(v23, "setFrame:");

    [v23 setAllowsGroupBlending:0];
    [v23 setAllowsGroupOpacity:0];
    v201 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A250]];
    objc_msgSend(v23, "setCompositingFilter:");
    [v23 setOpacity:0.0];
    [(CKEffectPickerView *)v18 setBlueContrastLayer:v23];
    v28 = [(CKEffectPickerView *)v18 layer];
    v202 = v23;
    [v28 addSublayer:v23];

    uint64_t v191 = *MEMORY[0x1E4F3A0D0];
    v29 = objc_msgSend(MEMORY[0x1E4F39BC0], "filterWithType:");
    uint64_t v30 = *MEMORY[0x1E4F3A1D8];
    [v29 setValue:&unk_1EDF173F8 forKey:*MEMORY[0x1E4F3A1D8]];
    uint64_t v31 = *MEMORY[0x1E4F3A1B8];
    [v29 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3A1B8]];
    id v32 = objc_alloc_init(MEMORY[0x1E4F39B40]);
    [v32 setAllowsGroupBlending:0];
    v33 = [(CKEffectPickerView *)v18 layer];
    [v33 bounds];
    objc_msgSend(v32, "setFrame:");

    v200 = v29;
    v208[0] = v29;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v208 count:1];
    [v32 setFilters:v34];

    [v32 setScale:0.5];
    [(CKEffectPickerView *)v18 setBackdrop:v32];
    v35 = [(CKEffectPickerView *)v18 layer];
    v199 = v32;
    [v35 addSublayer:v32];

    id v36 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(CKEffectPickerView *)v18 bounds];
    v37 = objc_msgSend(v36, "initWithFrame:");
    v38 = [v37 layer];
    [v38 setAllowsGroupBlending:0];

    [v37 setAutoresizingMask:18];
    [(CKEffectPickerView *)v18 setHintContainer:v37];
    v198 = v37;
    [(CKEffectPickerView *)v18 addSubview:v37];
    id v39 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(CKEffectPickerView *)v18 bounds];
    v40 = objc_msgSend(v39, "initWithFrame:");
    v41 = [v40 layer];
    [v41 setAllowsGroupBlending:0];

    [v40 setAutoresizingMask:18];
    [v40 setSemanticContentAttribute:3];
    [(CKEffectPickerView *)v18 setPeekContainer:v40];
    [(CKEffectPickerView *)v18 addSubview:v40];
    v197 = v40;
    [v40 setHidden:1];
    v42 = [MEMORY[0x1E4F1CA60] dictionary];
    [(CKEffectPickerView *)v18 setAnimationTimers:v42];

    v43 = objc_alloc_init(CKFullScreenEffectManager);
    [(CKEffectPickerView *)v18 setFsem:v43];
    uint64_t v44 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    v196 = v43;
    v45 = [(CKFullScreenEffectManager *)v43 effectIdentifiers];
    v46 = v45;
    if (v44 == 1)
    {
      v47 = [v45 reverseObjectEnumerator];
      uint64_t v48 = [v47 allObjects];

      v46 = (void *)v48;
    }
    v195 = v46;
    [(CKEffectPickerView *)v18 setMomentIdentifiers:v46];
    id v49 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v50 = [(CKEffectPickerView *)v18 peekContainer];
    [v50 bounds];
    v51 = objc_msgSend(v49, "initWithFrame:");

    v52 = [v51 layer];
    [v52 setAllowsGroupOpacity:0];

    v53 = [v51 layer];
    [v53 setAllowsGroupBlending:0];

    [v51 setOpaque:0];
    [v51 setAutoresizingMask:18];
    v54 = [(CKEffectPickerView *)v18 peekContainer];
    [v54 addSubview:v51];

    v194 = v51;
    [(CKEffectPickerView *)v18 setBackgroundView:v51];
    id v55 = objc_alloc_init(MEMORY[0x1E4F42890]);
    [(CKEffectPickerView *)v18 bounds];
    double v57 = v56;
    [(CKEffectPickerView *)v18 bounds];
    objc_msgSend(v55, "setItemSize:", v57, v58);
    [v55 setMinimumInteritemSpacing:0.0];
    [v55 setMinimumLineSpacing:0.0];
    [v55 setScrollDirection:1];
    id v59 = objc_alloc(MEMORY[0x1E4F42858]);
    [(CKEffectPickerView *)v18 bounds];
    v193 = v55;
    v60 = objc_msgSend(v59, "initWithFrame:collectionViewLayout:", v55);
    [v60 setPagingEnabled:1];
    [v60 setAutoresizingMask:18];
    v61 = [MEMORY[0x1E4F428B8] clearColor];
    [v60 setBackgroundColor:v61];

    [v60 setShowsHorizontalScrollIndicator:0];
    [v60 setShowsVerticalScrollIndicator:0];
    uint64_t v62 = objc_opt_class();
    v63 = +[CKMomentCollectionViewCell reuseIdentifier];
    [v60 registerClass:v62 forCellWithReuseIdentifier:v63];

    v64 = [(CKEffectPickerView *)v18 peekContainer];
    [v64 addSubview:v60];

    v203 = v60;
    [(CKEffectPickerView *)v18 setMomentsCollectionView:v60];
    id v65 = objc_alloc(MEMORY[0x1E4F42DD0]);
    v66 = CKFrameworkBundle();
    v67 = [v66 localizedStringForKey:@"IMPACT_PICKER_BUBBLE_EFFECT_STYLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v207[0] = v67;
    v68 = CKFrameworkBundle();
    v69 = [v68 localizedStringForKey:@"IMPACT_PICKER_SCREEN_EFFECT_STYLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v207[1] = v69;
    v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v207 count:2];
    v71 = (void *)[v65 initWithItems:v70];

    [v71 setSelectedSegmentIndex:0];
    [v71 sizeToFit];
    [v71 addTarget:v18 action:sel_effectTypeDidChange_ forControlEvents:4096];
    [v71 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v71 widthForSegmentAtIndex:0];
    if (v72 < 120.0)
    {
      [v71 setWidth:0 forSegmentAtIndex:120.0];
      [v71 setWidth:1 forSegmentAtIndex:120.0];
    }
    v73 = [(CKEffectPickerView *)v18 peekContainer];
    [v73 addSubview:v71];

    [(CKEffectPickerView *)v18 setTypeSegmentedControl:v71];
    v74 = [MEMORY[0x1E4F39BC0] filterWithType:v191];
    [v74 setValue:&unk_1EDF16AD8 forKey:v30];
    [v74 setValue:MEMORY[0x1E4F1CC38] forKey:v31];
    id v75 = objc_alloc_init(MEMORY[0x1E4F39B40]);
    v192 = v71;
    [v71 frame];
    objc_msgSend(v75, "setFrame:");
    v190 = v74;
    v206 = v74;
    v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v206 count:1];
    [v75 setFilters:v76];

    [v75 setCornerRadius:5.0];
    [v75 setMasksToBounds:1];
    [v75 setScale:0.5];
    [(CKEffectPickerView *)v18 setSegmentedBackdrop:v75];
    v77 = [(CKEffectPickerView *)v18 peekContainer];
    v78 = [v77 layer];
    v79 = [v203 layer];
    v189 = v75;
    [v78 insertSublayer:v75 above:v79];

    id v80 = objc_alloc(MEMORY[0x1E4F42C28]);
    double v81 = *MEMORY[0x1E4F1DB28];
    double v82 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v83 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v84 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v85 = objc_msgSend(v80, "initWithFrame:", *MEMORY[0x1E4F1DB28], v82, v83, v84);
    [v85 addTarget:v18 action:sel_pageControlChanged_ forControlEvents:4096];
    [v85 setTranslatesAutoresizingMaskIntoConstraints:0];
    v86 = [(CKEffectPickerView *)v18 momentIdentifiers];
    objc_msgSend(v85, "setNumberOfPages:", objc_msgSend(v86, "count"));

    [v85 setCurrentPage:0];
    [v85 sizeToFit];
    v87 = [(CKEffectPickerView *)v18 peekContainer];
    [v87 addSubview:v85];

    v186 = v85;
    [(CKEffectPickerView *)v18 setPageControl:v85];
    v88 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v81, v82, v83, v84);
    v89 = CKFrameworkBundle();
    v90 = [v89 localizedStringForKey:@"IMPACT_PICKER_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v88 setText:v90];

    [v88 setTextAlignment:1];
    v91 = +[CKUIBehavior fontWithStyle:*MEMORY[0x1E4F438F0] adjustedForMaxSizeCategory:*MEMORY[0x1E4F43780]];
    [v88 setFont:v91];

    [v88 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v88 sizeToFit];
    v92 = [(CKEffectPickerView *)v18 peekContainer];
    [v92 addSubview:v88];

    v185 = v88;
    [(CKEffectPickerView *)v18 setMainLabel:v88];
    v93 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    v94 = +[CKUIBehavior sharedBehaviors];
    v95 = [v94 theme];
    v96 = [v95 sendButtonColorForColorType:v187];
    [v93 setTintColor:v96];

    [v93 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v93 setOpaque:0];
    uint64_t v97 = [(CKEffectPickerView *)v18 sendImage];
    [v93 setImage:v97 forState:0];
    v184 = (void *)v97;
    [v93 setImage:v97 forState:4];
    [v93 setEnabled:1];
    [v93 addTarget:v18 action:sel__touchUpInsideSendMomentButton_ forControlEvents:64];
    [v93 accessibilitySetIdentification:@"sendButton"];
    [v93 setExclusiveTouch:1];
    v98 = [(CKEffectPickerView *)v18 peekContainer];
    [v98 addSubview:v93];

    [(CKEffectPickerView *)v18 setSendMomentButton:v93];
    v99 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v81, v82, v83, v84);
    v100 = +[CKUIBehavior fontWithStyle:*MEMORY[0x1E4F43888] adjustedForMaxSizeCategory:*MEMORY[0x1E4F43770]];
    [v99 setFont:v100];

    v101 = [(CKEffectPickerView *)v18 peekContainer];
    [v101 addSubview:v99];

    v183 = v99;
    [(CKEffectPickerView *)v18 setMomentTitleLabel:v99];
    v102 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    uint64_t v103 = [MEMORY[0x1E4F42A98] configurationWithPointSize:5 weight:3 scale:19.0];
    v104 = [MEMORY[0x1E4F42A80] systemImageNamed:@"xmark.circle.fill"];
    v181 = (void *)v103;
    v105 = [v104 imageWithSymbolConfiguration:v103];
    v106 = [v105 imageWithRenderingMode:2];

    [v102 setImage:v106 forState:0];
    [v102 setImage:v106 forState:1];
    [v106 size];
    double v108 = v107 + -4.0;
    v180 = v106;
    [v106 size];
    objc_msgSend(v102, "setBounds:", 0.0, 0.0, v108, v109 + -4.0);
    [v102 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v102 addTarget:v18 action:sel__touchUpInsideCloseButton_ forControlEvents:64];
    v110 = [(CKEffectPickerView *)v18 peekContainer];
    [v110 addSubview:v102];

    v182 = v102;
    [(CKEffectPickerView *)v18 setCloseButton:v102];
    v111 = CKBalloonViewForClass((objc_class *)[v204 balloonViewClass]);
    [v111 configureForComposition:v204];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v111 setColor:v187];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v112 = +[CKUIBehavior sharedBehaviors];
      int v113 = [v112 isAccessibilityPreferredContentSizeCategory];

      if (v113) {
        [v111 truncateForLargeText];
      }
    }
    [v111 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v111 setCanUseOpaqueMask:0];
    [v111 setUserInteractionEnabled:0];
    v114 = [(CKEffectPickerView *)v18 peekContainer];
    [v114 addSubview:v111];

    [(CKEffectPickerView *)v18 setBalloonView:v111];
    [(CKEffectPickerView *)v18 _resizeBalloon];
    id v115 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    v116 = [v115 layer];
    [v116 setMasksToBounds:1];

    v117 = [v115 layer];
    [v117 setCornerRadius:22.5];

    v118 = [v115 layer];
    [v118 setAllowsGroupOpacity:0];

    v119 = [v115 layer];
    [v119 setAllowsGroupBlending:0];

    [v115 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v115 setUserInteractionEnabled:1];
    v120 = [(CKEffectPickerView *)v18 peekContainer];
    [v120 addSubview:v115];

    [(CKEffectPickerView *)v18 setRoundedContainerView:v115];
    id v121 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    v122 = [v121 layer];
    v123 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    [v122 setCompositingFilter:v123];

    [v115 addSubview:v121];
    [v115 bounds];
    objc_msgSend(v121, "setFrame:");
    [v121 setAutoresizingMask:18];
    v188 = v121;
    [(CKEffectPickerView *)v18 setRoundedView:v121];
    v124 = (void *)MEMORY[0x1E4F28DC8];
    v125 = [(CKEffectPickerView *)v18 closeButton];
    v126 = [v124 constraintWithItem:v125 attribute:5 relatedBy:0 toItem:v18 attribute:5 multiplier:1.0 constant:x];

    [(CKEffectPickerView *)v18 addConstraint:v126];
    v127 = (void *)MEMORY[0x1E4F28DC8];
    v128 = [(CKEffectPickerView *)v18 sendMomentButton];
    v129 = [(CKEffectPickerView *)v18 closeButton];
    v130 = [v127 constraintWithItem:v128 attribute:9 relatedBy:0 toItem:v129 attribute:9 multiplier:1.0 constant:0.0];

    [(CKEffectPickerView *)v18 addConstraint:v130];
    v131 = (void *)MEMORY[0x1E4F28DC8];
    v132 = [(CKEffectPickerView *)v18 roundedContainerView];
    v133 = [(CKEffectPickerView *)v18 closeButton];
    v134 = [v131 constraintWithItem:v132 attribute:9 relatedBy:0 toItem:v133 attribute:9 multiplier:1.0 constant:0.0];

    [(CKEffectPickerView *)v18 addConstraint:v134];
    v135 = (void *)MEMORY[0x1E4F28DC8];
    v136 = [(CKEffectPickerView *)v18 roundedContainerView];
    v137 = [v135 constraintWithItem:v136 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:45.0];

    [(CKEffectPickerView *)v18 addConstraint:v137];
    v138 = (void *)MEMORY[0x1E4F28DC8];
    v139 = [(CKEffectPickerView *)v18 typeSegmentedControl];
    v140 = [v138 constraintWithItem:v139 attribute:3 relatedBy:0 toItem:v18 attribute:3 multiplier:1.0 constant:70.0];

    [v140 setIdentifier:@"typeSegmentedControlBottom"];
    [(CKEffectPickerView *)v18 setTypeSegmentedControlBottomConstraint:v140];
    [(CKEffectPickerView *)v18 addConstraint:v140];
    v141 = (void *)MEMORY[0x1E4F28DC8];
    v142 = [(CKEffectPickerView *)v18 typeSegmentedControl];
    v143 = [v141 constraintWithItem:v142 attribute:9 relatedBy:0 toItem:v18 attribute:9 multiplier:1.0 constant:0.0];

    [(CKEffectPickerView *)v18 addConstraint:v143];
    v144 = (void *)MEMORY[0x1E4F28DC8];
    v145 = [(CKEffectPickerView *)v18 mainLabel];
    v146 = [v144 constraintWithItem:v145 attribute:11 relatedBy:0 toItem:v18 attribute:3 multiplier:1.0 constant:50.0];

    [v146 setIdentifier:@"mainLabelBottom"];
    [(CKEffectPickerView *)v18 setMainLabelBottomConstraint:v146];
    [(CKEffectPickerView *)v18 addConstraint:v146];
    v147 = (void *)MEMORY[0x1E4F28DC8];
    v148 = [(CKEffectPickerView *)v18 mainLabel];
    v149 = [v147 constraintWithItem:v148 attribute:9 relatedBy:0 toItem:v18 attribute:9 multiplier:1.0 constant:0.0];

    [(CKEffectPickerView *)v18 addConstraint:v149];
    v150 = (void *)MEMORY[0x1E4F28DC8];
    v151 = [(CKEffectPickerView *)v18 mainLabel];
    v152 = [v150 constraintWithItem:v151 attribute:5 relatedBy:1 toItem:v18 attribute:5 multiplier:1.0 constant:20.0];

    [(CKEffectPickerView *)v18 addConstraint:v152];
    v153 = (void *)MEMORY[0x1E4F28DC8];
    v154 = [(CKEffectPickerView *)v18 mainLabel];
    v155 = [v153 constraintWithItem:v154 attribute:6 relatedBy:1 toItem:v18 attribute:6 multiplier:1.0 constant:-20.0];

    [(CKEffectPickerView *)v18 addConstraint:v155];
    if ([(CKEffectPickerView *)v18 _keyboardIsOnTopOfEffectPickerWindow]
      && UIKeyboardAutomaticIsOnScreen())
    {
      v156 = (void *)MEMORY[0x1E4F28DC8];
      v157 = [(CKEffectPickerView *)v18 pageControl];
      v158 = [(CKEffectPickerView *)v18 closeButton];
      double v159 = 1.0;
      double v160 = 0.0;
      v161 = v156;
      v162 = v157;
      uint64_t v163 = 10;
      v164 = v158;
      uint64_t v165 = 10;
    }
    else
    {
      v166 = (void *)MEMORY[0x1E4F28DC8];
      v157 = [(CKEffectPickerView *)v18 pageControl];
      v158 = [(CKEffectPickerView *)v18 peekContainer];
      double v159 = 1.0;
      double v160 = -20.0;
      v161 = v166;
      v162 = v157;
      uint64_t v163 = 4;
      v164 = v158;
      uint64_t v165 = 4;
    }
    v167 = [v161 constraintWithItem:v162 attribute:v163 relatedBy:0 toItem:v164 attribute:v165 multiplier:v159 constant:v160];

    [v167 setIdentifier:@"pageControlBottom"];
    [(CKEffectPickerView *)v18 addConstraint:v167];
    v168 = (void *)MEMORY[0x1E4F28DC8];
    v169 = [(CKEffectPickerView *)v18 pageControl];
    v170 = [(CKEffectPickerView *)v18 peekContainer];
    v171 = [v168 constraintWithItem:v169 attribute:7 relatedBy:0 toItem:v170 attribute:7 multiplier:1.0 constant:0.0];

    [(CKEffectPickerView *)v18 addConstraint:v171];
    -[CKEffectPickerView activateTextSizeDependentConstraintsForSendButtonFrame:](v18, "activateTextSizeDependentConstraintsForSendButtonFrame:", x, v10, width, height);
    v172 = (void *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:v18 action:sel__panGesture_];
    [(CKEffectPickerView *)v18 addGestureRecognizer:v172];
    [(CKEffectPickerView *)v18 setPanGestureRecognizer:v172];
    [(CKEffectPickerView *)v18 _updateBalloonViewPositionAnimated:0];
    [(CKEffectPickerView *)v18 updateMomentTitle:0];
    [(CKEffectPickerView *)v18 effectTypeDidChange:v192];
    v173 = [MEMORY[0x1E4F1CA60] dictionary];
    [(CKEffectPickerView *)v18 setAnimatedCells:v173];

    v174 = [MEMORY[0x1E4F1CA60] dictionary];
    [(CKEffectPickerView *)v18 setPausedAnimatedCells:v174];

    v175 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v175 addObserver:v18 selector:sel__applicationDidEnterBackground name:*MEMORY[0x1E4F43660] object:0];

    v176 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v176 addObserver:v18 selector:sel__applicationWillEnterForeground name:*MEMORY[0x1E4F43708] object:0];

    v177 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v177 addObserver:v18 selector:sel__accessibilityContrastStatusDidChange name:*MEMORY[0x1E4F43480] object:0];

    v178 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v178 addObserver:v18 selector:sel__accessibilityContrastStatusDidChange name:*MEMORY[0x1E4F43418] object:0];

    [(CKEffectPickerView *)v18 _accessibilityContrastStatusDidChange];
    [(CKEffectPickerView *)v18 updateViewColors];

    id v17 = v204;
  }

  return v18;
}

- (void)updateViewColors
{
  v3 = [(CKEffectPickerView *)self momentIdentifiers];
  v4 = [(CKEffectPickerView *)self pageControl];
  objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v4, "currentPage"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = [(CKEffectPickerView *)self fsem];
  v6 = [v5 effectForIdentifier:v9];

  CGRect v7 = [(CKEffectPickerView *)self typeSegmentedControl];
  if ([v7 selectedSegmentIndex] == 1) {
    uint64_t v8 = [v6 effectIsDark];
  }
  else {
    uint64_t v8 = 0;
  }

  [(CKEffectPickerView *)self updateViewColors:v8];
}

- (void)updateViewColors:(BOOL)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  v5 = [(CKEffectPickerView *)self typeSegmentedControl];
  v6 = +[CKUIBehavior sharedBehaviors];
  CGRect v7 = [v6 theme];
  uint64_t v8 = v7;
  if (a3) {
    [v7 fsmPickerPrimaryTintColorDarkEffect];
  }
  else {
  id v9 = [v7 fsmPickerPrimaryTintColor];
  }
  [v5 setTintColor:v9];

  double v10 = [(CKEffectPickerView *)self segmentedBackdrop];
  v11 = +[CKUIBehavior sharedBehaviors];
  double v12 = [v11 theme];
  double v13 = v12;
  if (a3)
  {
    id v14 = [v12 fsmPickerSecondaryColorDarkEffect];
    uint64_t v15 = [v14 cgColor];
  }
  else
  {
    id v14 = [v12 fsmPickerSecondaryColor];
    uint64_t v15 = [v14 CGColor];
  }
  [v10 setBackgroundColor:v15];

  v16 = [(CKEffectPickerView *)self pageControl];
  id v17 = +[CKUIBehavior sharedBehaviors];
  v18 = [v17 theme];
  v19 = v18;
  if (a3) {
    [v18 fsmPickerPageIndicatorColorDarkEffect];
  }
  else {
  v20 = [v18 fsmPickerPageIndicatorColor];
  }
  [v16 setPageIndicatorTintColor:v20];

  v21 = [(CKEffectPickerView *)self pageControl];
  v22 = +[CKUIBehavior sharedBehaviors];
  id v23 = [v22 theme];
  v24 = v23;
  if (a3) {
    [v23 fsmPickerCurrentPageIndicatorColorDarkEffect];
  }
  else {
  v25 = [v23 fsmPickerCurrentPageIndicatorColor];
  }
  [v21 setCurrentPageIndicatorTintColor:v25];

  id v26 = [(CKEffectPickerView *)self mainLabel];
  v27 = +[CKUIBehavior sharedBehaviors];
  v28 = [v27 theme];
  v29 = v28;
  if (a3) {
    [v28 fsmPickerPrimaryColorDarkEffect];
  }
  else {
  uint64_t v30 = [v28 fsmPickerPrimaryColor];
  }
  [v26 setTextColor:v30];

  uint64_t v31 = [(CKEffectPickerView *)self momentTitleLabel];
  id v32 = +[CKUIBehavior sharedBehaviors];
  v33 = [v32 theme];
  v34 = v33;
  if (a3) {
    [v33 fsmPickerPrimaryColorDarkEffect];
  }
  else {
  v35 = [v33 fsmPickerPrimaryColor];
  }
  [v31 setTextColor:v35];

  id v36 = [(CKEffectPickerView *)self closeButton];
  v37 = +[CKUIBehavior sharedBehaviors];
  v38 = [v37 theme];
  id v39 = v38;
  if (a3) {
    [v38 fsmPickerCloseButtonColorDarkEffect];
  }
  else {
  v40 = [v38 fsmPickerCloseButtonColor];
  }
  [v36 setTintColor:v40];

  v41 = [(CKEffectPickerView *)self accessibilityCloseBackgroundView];
  v42 = +[CKUIBehavior sharedBehaviors];
  v43 = [v42 theme];
  uint64_t v44 = v43;
  if (a3) {
    [v43 fsmPickerSecondaryColorDarkEffect];
  }
  else {
  v45 = [v43 fsmPickerSecondaryColor];
  }
  [v41 setBackgroundColor:v45];

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v75 = self;
  v46 = [(CKEffectPickerView *)self effectLabels];
  uint64_t v47 = [v46 countByEnumeratingWithState:&v80 objects:v85 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v81 != v49) {
          objc_enumerationMutation(v46);
        }
        v51 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        v52 = +[CKUIBehavior sharedBehaviors];
        v53 = [v52 theme];
        v54 = v53;
        if (a3) {
          [v53 fsmPickerPrimaryColorDarkEffect];
        }
        else {
        id v55 = [v53 fsmPickerPrimaryColor];
        }
        [v51 setTextColor:v55];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v80 objects:v85 count:16];
    }
    while (v48);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  double v56 = [(CKEffectPickerView *)v75 effectDescriptiveLabels];
  uint64_t v57 = [v56 countByEnumeratingWithState:&v76 objects:v84 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v77;
    do
    {
      for (uint64_t j = 0; j != v58; ++j)
      {
        if (*(void *)v77 != v59) {
          objc_enumerationMutation(v56);
        }
        v61 = *(void **)(*((void *)&v76 + 1) + 8 * j);
        uint64_t v62 = +[CKUIBehavior sharedBehaviors];
        v63 = [v62 theme];
        v64 = v63;
        if (a3) {
          [v63 fsmPickerPrimaryColorDarkEffect];
        }
        else {
        id v65 = [v63 fsmPickerPrimaryColor];
        }
        [v61 setTextColor:v65];
      }
      uint64_t v58 = [v56 countByEnumeratingWithState:&v76 objects:v84 count:16];
    }
    while (v58);
  }

  v66 = [(CKEffectPickerView *)v75 roundedView];
  v67 = +[CKUIBehavior sharedBehaviors];
  v68 = [v67 theme];
  v69 = [v68 fsmPickerRoundedViewColor];
  [v66 setBackgroundColor:v69];

  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    v70 = [(CKEffectPickerView *)v75 backgroundView];
  }
  else
  {
    BOOL v71 = UIAccessibilityDarkerSystemColorsEnabled();
    v70 = [(CKEffectPickerView *)v75 backgroundView];
    if (!v71)
    {
      double v72 = +[CKUIBehavior sharedBehaviors];
      v73 = [v72 theme];
      v74 = [v73 fsmPickerBackgroundViewColor];
      [v70 setBackgroundColor:v74];

      goto LABEL_50;
    }
  }
  [v70 setBackgroundColor:0];
LABEL_50:
}

- (void)safeAreaInsetsDidChange
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(CKEffectPickerView *)self safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  CGRect v7 = [(CKEffectPickerView *)self constraints];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    double v11 = v4 + 70.0;
    double v12 = v4 + 50.0;
    double v13 = -20.0 - v6;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v16 = [v15 identifier];
        char v17 = [v16 isEqualToString:@"pageControlBottom"];

        double v18 = v13;
        if (v17) {
          goto LABEL_9;
        }
        v19 = objc_msgSend(v15, "identifier", v13);
        char v20 = [v19 isEqualToString:@"mainLabelBottom"];

        double v18 = v12;
        if ((v20 & 1) == 0)
        {
          v21 = objc_msgSend(v15, "identifier", v12);
          int v22 = [v21 isEqualToString:@"typeSegmentedControlBottom"];

          double v18 = v11;
          if (!v22) {
            continue;
          }
        }
LABEL_9:
        [v15 setConstant:v18];
      }
      uint64_t v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v18);
    }
    while (v9);
  }
}

- (int64_t)selectedMomentIndex
{
  double v3 = [(CKEffectPickerView *)self momentsCollectionView];
  [v3 frame];
  double v5 = v4;

  double v6 = [(CKEffectPickerView *)self momentsCollectionView];
  [v6 contentOffset];
  *(float *)&double v7 = v7 / v5;
  int64_t v8 = llroundf(*(float *)&v7);

  return v8;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  int64_t v4 = [(CKEffectPickerView *)self selectedMomentIndex];
  double v5 = [(CKEffectPickerView *)self pageControl];
  uint64_t v6 = [v5 currentPage];

  if (v6 != v4)
  {
    double v7 = [(CKEffectPickerView *)self pageControl];
    [v7 setCurrentPage:v4];

    [(CKEffectPickerView *)self updateMomentTitle:0];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
}

- (void)dealloc
{
  [(CKEffectPickerView *)self setDelegate:0];
  double v3 = [(CKEffectPickerView *)self balloonView];
  int64_t v4 = [v3 layer];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v19[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v19[5] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v19[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v19[7] = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v19[0] = *MEMORY[0x1E4F39B10];
  v19[1] = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v19[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v19[3] = v8;
  [v4 setTransform:v19];

  uint64_t v9 = [(CKEffectPickerView *)self balloonView];
  [v9 _removeAllAnimations:1];

  uint64_t v10 = [(CKEffectPickerView *)self balloonView];
  [v10 setUserInteractionEnabled:1];

  double v11 = [(CKEffectPickerView *)self balloonView];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  double v12 = +[CKUIBehavior sharedBehaviors];
  int v13 = [v12 isAccessibilityPreferredContentSizeCategory];

  if (v13)
  {
    double v11 = [(CKEffectPickerView *)self balloonView];
    [v11 restoreFromLargeTextTruncation];
LABEL_4:
  }
  id v14 = [(CKEffectPickerView *)self balloonView];
  CKBalloonViewReuse(v14);

  uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 removeObserver:self name:*MEMORY[0x1E4F43660] object:0];

  v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 removeObserver:self name:*MEMORY[0x1E4F43708] object:0];

  char v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 removeObserver:self name:*MEMORY[0x1E4F43480] object:0];

  v18.receiver = self;
  v18.super_class = (Class)CKEffectPickerView;
  [(CKEffectPickerView *)&v18 dealloc];
}

- (void)layoutSubviews
{
  v55.receiver = self;
  v55.super_class = (Class)CKEffectPickerView;
  [(CKEffectPickerView *)&v55 layoutSubviews];
  [(CKEffectPickerView *)self _updateBalloonViewPositionAnimated:0];
  double v3 = [(CKEffectPickerView *)self backdrop];
  int64_t v4 = [(CKEffectPickerView *)self layer];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  if (UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityDarkerSystemColorsEnabled())
  {
    long long v5 = [(CKEffectPickerView *)self accessibilityBackdropView];
    [(CKEffectPickerView *)self bounds];
    objc_msgSend(v5, "setFrame:");

    long long v6 = [(CKEffectPickerView *)self sendMomentButton];
    [v6 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    uint64_t v15 = [(CKEffectPickerView *)self accessibilitySendBackgroundView];
    objc_msgSend(v15, "setFrame:", v8 + 2.0, v10 + 2.0, v12 + -4.0, v14 + -4.0);

    v16 = [(CKEffectPickerView *)self closeButton];
    [v16 frame];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    long long v25 = [(CKEffectPickerView *)self accessibilityCloseBackgroundView];
    objc_msgSend(v25, "setFrame:", v18 + 2.0, v20 + 2.0, v22 + -4.0, v24 + -4.0);

    long long v26 = [(CKEffectPickerView *)self accessibilitySendBackgroundView];
    v27 = [v26 layer];
    uint64_t v28 = [(CKEffectPickerView *)self accessibilitySendBackgroundView];
    [v28 bounds];
    [v27 setCornerRadius:v29 * 0.5];

    uint64_t v30 = [(CKEffectPickerView *)self accessibilityCloseBackgroundView];
    uint64_t v31 = [v30 layer];
    id v32 = [(CKEffectPickerView *)self accessibilityCloseBackgroundView];
    [v32 bounds];
    [v31 setCornerRadius:v33 * 0.5];

    v34 = [(CKEffectPickerView *)self typeSegmentedControl];
    uint64_t v35 = [v34 selectedSegmentIndex];

    if (!v35)
    {
      id v36 = [(CKEffectPickerView *)self accessibilitySendBackgroundView];
      [v36 setHidden:1];
    }
  }
  v37 = [(CKEffectPickerView *)self segmentedBackdrop];
  [(CKEffectPickerView *)self bounds];
  double v39 = v38 * 0.5;
  v40 = [(CKEffectPickerView *)self segmentedBackdrop];
  [v40 bounds];
  double v42 = v39 - v41 * 0.5;
  v43 = [(CKEffectPickerView *)self typeSegmentedControlBottomConstraint];
  [v43 constant];
  double v45 = v44;
  v46 = [(CKEffectPickerView *)self segmentedBackdrop];
  [v46 bounds];
  double v48 = v47;
  uint64_t v49 = [(CKEffectPickerView *)self segmentedBackdrop];
  [v49 bounds];
  objc_msgSend(v37, "setFrame:", v42, v45, v48);

  v50 = [(CKEffectPickerView *)self momentsCollectionView];
  v51 = [v50 collectionViewLayout];
  [v50 bounds];
  double v53 = v52;
  [v50 bounds];
  objc_msgSend(v51, "setItemSize:", v53, v54);
}

- (void)updateHintTransition:(double)a3
{
  if (![(CKEffectPickerView *)self isAnimating])
  {
    long long v5 = [(CKEffectPickerView *)self hintBlackText];

    if (a3 < 1.0 && v5 == 0)
    {
      [(CKEffectPickerView *)self _resizeBalloon];
      [(CKEffectPickerView *)self _updateBalloonViewPositionAnimated:0];
      double v10 = [(CKEffectPickerView *)self balloonView];
      [(CKEffectPickerView *)self balloonViewOrigin];
      double v12 = v11 + 1.0;
      double v13 = [(CKEffectPickerView *)self balloonView];
      [v13 origin];
      objc_msgSend(v10, "setOrigin:", v12, v14 + 3.0);

      uint64_t v15 = [(CKEffectPickerView *)self _blackTextReplica];
      if (!v15)
      {
        uint64_t v15 = [(CKEffectPickerView *)self balloonView];
      }
      [(CKEffectPickerView *)self balloonViewOrigin];
      objc_msgSend(v15, "setOrigin:");
      v16 = [(CKEffectPickerView *)self hintContainer];
      [v16 addSubview:v15];

      [(CKEffectPickerView *)self setHintBlackText:v15];
      double v17 = +[CKUIBehavior sharedBehaviors];
      double v18 = [v17 theme];
      double v19 = objc_msgSend(v18, "sendButtonColorForColorType:", -[CKEffectPickerView controlColor](self, "controlColor"));

      double v20 = [MEMORY[0x1E4F427E0] buttonWithType:1];
      double v21 = [(CKEffectPickerView *)self sendImage];
      [v20 setImage:v21 forState:0];
      [v20 setImage:v21 forState:4];
      [v20 setOpaque:0];
      double v22 = [(CKEffectPickerView *)self closeButton];
      [v22 frame];
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;

      objc_msgSend(v20, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v28, v30);
      [v20 setTintColor:v19];
      [v20 setTranslatesAutoresizingMaskIntoConstraints:1];
      objc_msgSend(v20, "setOrigin:", v24, v26);
      uint64_t v31 = [(CKEffectPickerView *)self hintContainer];
      [v31 addSubview:v20];

      [(CKEffectPickerView *)self setHintSendButton:v20];
    }
    else
    {
      double v7 = [(CKEffectPickerView *)self hintBlackText];

      if (a3 == 1.0 && v7)
      {
        double v8 = [(CKEffectPickerView *)self hintBlackText];
        [v8 removeFromSuperview];

        [(CKEffectPickerView *)self setHintBlackText:0];
        double v9 = [(CKEffectPickerView *)self hintSendButton];
        [v9 removeFromSuperview];

        [(CKEffectPickerView *)self setHintSendButton:0];
      }
    }
    id v32 = [(CKEffectPickerView *)self backdrop];
    double v33 = fmin(a3, 0.6);
    double v34 = v33 * 64.0;
    if (v33 * 64.0 < 3.0) {
      double v34 = 3.0;
    }
    uint64_t v35 = [NSNumber numberWithDouble:v34];
    [v32 setValue:v35 forKeyPath:@"filters.gaussianBlur.inputRadius"];

    id v36 = [(CKEffectPickerView *)self blueContrastLayer];
    v37 = [NSNumber numberWithDouble:v33];
    [v36 setValue:v37 forKey:@"opacity"];

    CGFloat v38 = a3 * 0.15 + 1.0;
    double v39 = [(CKEffectPickerView *)self balloonView];
    v40 = [v39 layer];
    long long v50 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v52.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v49 = *(_OWORD *)&v52.m31;
    *(_OWORD *)&v52.m33 = v50;
    long long v48 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v52.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v47 = *(_OWORD *)&v52.m41;
    *(_OWORD *)&v52.m43 = v48;
    long long v46 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v52.m11 = *MEMORY[0x1E4F39B10];
    long long v45 = *(_OWORD *)&v52.m11;
    *(_OWORD *)&v52.m13 = v46;
    long long v44 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v52.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v43 = *(_OWORD *)&v52.m21;
    *(_OWORD *)&v52.m23 = v44;
    CATransform3DScale(&v53, &v52, v38, v38, 1.0);
    [v40 setTransform:&v53];

    double v41 = [(CKEffectPickerView *)self hintBlackText];
    double v42 = [v41 layer];
    *(_OWORD *)&v52.m31 = v49;
    *(_OWORD *)&v52.m33 = v50;
    *(_OWORD *)&v52.m41 = v47;
    *(_OWORD *)&v52.m43 = v48;
    *(_OWORD *)&v52.m11 = v45;
    *(_OWORD *)&v52.m13 = v46;
    *(_OWORD *)&v52.m21 = v43;
    *(_OWORD *)&v52.m23 = v44;
    CATransform3DScale(&v51, &v52, v38, v38, 1.0);
    [v42 setTransform:&v51];
  }
}

- (void)updateColor:(char)a3
{
  uint64_t v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  -[CKEffectPickerView setControlColor:](self, "setControlColor:");
  long long v5 = +[CKUIBehavior sharedBehaviors];
  long long v6 = [v5 theme];
  double v7 = [v6 sendButtonColorForColorType:v3];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v8 = [(CKEffectPickerView *)self effectSendButtons];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v12++) setTintColor:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  double v13 = [(CKEffectPickerView *)self hintSendButton];
  [v13 setTintColor:v7];

  double v14 = [(CKEffectPickerView *)self sendMomentButton];
  [v14 setTintColor:v7];

  uint64_t v15 = [(CKEffectPickerView *)self balloonView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v17 = [(CKEffectPickerView *)self balloonView];
    [v17 setColor:v3];

    double v18 = [(CKEffectPickerView *)self balloonView];
    [v18 prepareForDisplayIfNeeded];
  }
}

- (void)setBalloonText:(id)a3
{
  id v4 = a3;
  id v7 = +[CKUIBehavior sharedBehaviors];
  long long v5 = [v7 theme];
  long long v6 = [v5 balloonTextColorForColorType:1];
  [(CKEffectPickerView *)self _setBalloonText:v4 withColor:v6];
}

- (UIFont)effectLabelFont
{
  effectLabelFont = self->_effectLabelFont;
  if (effectLabelFont)
  {
    uint64_t v3 = effectLabelFont;
  }
  else
  {
    long long v5 = +[CKUIBehavior fontWithStyle:*MEMORY[0x1E4F43888] adjustedForMaxSizeCategory:*MEMORY[0x1E4F43768]];
    long long v6 = [v5 fontDescriptor];
    id v7 = [v6 fontAttributes];
    double v8 = (void *)[v7 mutableCopy];

    uint64_t v9 = *MEMORY[0x1E4FB0950];
    uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB0950]];
    uint64_t v11 = (void *)[v10 mutableCopy];

    if (!v11)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    uint64_t v12 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09E0]];
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4FB09F0]];

    [v8 setObject:v11 forKeyedSubscript:v9];
    double v13 = [MEMORY[0x1E4FB08E8] fontDescriptorWithFontAttributes:v8];
    double v14 = (void *)MEMORY[0x1E4FB08E0];
    [v5 pointSize];
    objc_msgSend(v14, "fontWithDescriptor:size:", v13);
    uint64_t v15 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v16 = self->_effectLabelFont;
    self->_effectLabelFont = v15;

    uint64_t v3 = self->_effectLabelFont;
  }

  return v3;
}

- (id)sendImage
{
  v2 = +[CKEntryViewButton entryViewButtonImageForType:4 color:[(CKEffectPickerView *)self controlColor]];
  uint64_t v3 = [v2 _imageThatSuppressesAccessibilityHairlineThickening];

  return v3;
}

- (void)addEffect:(id)a3 withDescriptiveText:(id)a4 withIdentifier:(id)a5
{
  v113[1] = *MEMORY[0x1E4F143B8];
  id v111 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(CKEffectPickerView *)self effectLabels];

  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(CKEffectPickerView *)self setEffectLabels:v11];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(CKEffectPickerView *)self setEffectDescriptiveLabels:v12];

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(CKEffectPickerView *)self setEffectDotButtons:v13];

    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(CKEffectPickerView *)self setEffectSendButtons:v14];

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(CKEffectPickerView *)self setEffectIdentifiers:v15];

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(CKEffectPickerView *)self setEffectDotConstraintsThatChange:v16];
  }
  id v17 = objc_alloc(MEMORY[0x1E4F42B38]);
  double v18 = *MEMORY[0x1E4F1DB28];
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v22 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], v19, v20, v21);
  [v22 setText:v9];

  double v23 = [(CKEffectPickerView *)self effectLabelFont];
  [v22 setFont:v23];

  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v22 sizeToFit];
  uint64_t v24 = [(CKEffectPickerView *)self peekContainer];
  [v24 addSubview:v22];

  double v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v18, v19, v20, v21);
  [v25 setText:v8];

  double v26 = [(CKEffectPickerView *)self effectLabelFont];
  [v25 setFont:v26];

  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v25 sizeToFit];
  [v25 setHidden:1];
  uint64_t v27 = [(CKEffectPickerView *)self peekContainer];
  [(id)v27 addSubview:v25];

  LODWORD(v27) = UIAccessibilityIsReduceTransparencyEnabled();
  int v28 = v27 | UIAccessibilityDarkerSystemColorsEnabled();
  double v29 = +[CKUIBehavior sharedBehaviors];
  double v30 = [v29 theme];
  uint64_t v31 = [v30 fsmPickerPrimaryColor];
  v112 = v22;
  [v22 setTextColor:v31];

  id v32 = +[CKUIBehavior sharedBehaviors];
  double v33 = [v32 theme];
  double v34 = [v33 fsmPickerPrimaryColor];
  [v25 setTextColor:v34];

  if ((v28 & 1) == 0)
  {
    uint64_t v35 = [v22 layer];
    setUpVibrancyForLayer(v35, 0, ![(CKEffectPickerView *)self isInDarkMode], [(CKEffectPickerView *)self isInDarkMode]);

    id v36 = [v25 layer];
    setUpVibrancyForLayer(v36, 0, ![(CKEffectPickerView *)self isInDarkMode], [(CKEffectPickerView *)self isInDarkMode]);
  }
  v110 = v25;
  v37 = [(CKEffectPickerView *)self sendImage];
  [v37 size];
  UIGraphicsBeginImageContext(v114);
  [v37 size];
  UIGraphicsBeginImageContextWithOptions(v115, 0, 0.0);
  CGFloat v38 = +[CKUIBehavior sharedBehaviors];
  double v39 = [v38 theme];
  v40 = v39;
  if (v28) {
    [v39 fsmPickerPrimaryColor];
  }
  else {
  double v41 = [v39 fsmPickerDotColor];
  }
  [v41 set];

  double v42 = (void *)MEMORY[0x1E4F427D0];
  [v37 size];
  double v44 = v43 * 0.5 + -4.5;
  [v37 size];
  long long v46 = objc_msgSend(v42, "bezierPathWithOvalInRect:", v44, v45 * 0.5 + -4.5, 9.0, 9.0);
  [v46 fill];

  uint64_t v47 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  long long v48 = +[CKLargeHitButton buttonWithType:0];
  objc_msgSend(v48, "setCk_hitTestInsets:", -15.0, -15.0, -15.0, -15.0);
  [v48 setImage:v47 forState:0];
  double v108 = (void *)v47;
  [v48 setImage:v47 forState:4];
  [v48 sizeToFit];
  long long v49 = [(CKEffectPickerView *)self roundedContainerView];
  [v49 addSubview:v48];

  [v48 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v48 addTarget:self action:sel__touchUpInsideDotButton_ forControlEvents:64];
  if ((v28 & 1) == 0)
  {
    [v48 setOpaque:0];
    BOOL v50 = [(CKEffectPickerView *)self isInDarkMode];
    CATransform3D v51 = (id *)MEMORY[0x1E4F3A2E8];
    if (!v50) {
      CATransform3D v51 = (id *)MEMORY[0x1E4F3A2E0];
    }
    id v52 = *v51;
    CATransform3D v53 = [v48 layer];
    double v54 = [MEMORY[0x1E4F39BC0] filterWithType:v52];

    [v53 setCompositingFilter:v54];
  }
  objc_super v55 = +[CKUIBehavior sharedBehaviors];
  double v56 = [v55 theme];
  uint64_t v57 = objc_msgSend(v56, "sendButtonColorForColorType:", -[CKEffectPickerView controlColor](self, "controlColor"));

  uint64_t v58 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  [v58 setImage:v37 forState:0];
  double v109 = v37;
  [v58 setImage:v37 forState:4];
  [v58 setOpaque:0];
  objc_msgSend(v58, "setBounds:", 0.0, 0.0, 52.0, 52.0);
  uint64_t v59 = [(CKEffectPickerView *)self roundedContainerView];
  [v59 addSubview:v58];

  double v107 = (void *)v57;
  [v58 setTintColor:v57];
  [v58 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v58 addTarget:self action:sel__touchUpInsideSendButton_ forControlEvents:64];
  [v58 setHidden:1];
  id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v61 = [(CKEffectPickerView *)self effectLabels];
  uint64_t v62 = [v61 count];

  if (v62)
  {
    v63 = [(CKEffectPickerView *)self effectDotButtons];
    v64 = [v63 lastObject];

    [(CKEffectPickerView *)self marginBetweenPickerDotButtons];
    v66 = [MEMORY[0x1E4F28DC8] constraintWithItem:v48 attribute:10 relatedBy:0 toItem:v64 attribute:10 multiplier:1.0 constant:-(v65 + 9.0)];
    v67 = [(CKEffectPickerView *)self roundedContainerView];
    [v67 addConstraint:v66];

    [v60 addObject:v66];
    [(CKEffectPickerView *)self effectDotConstraintsThatChange];
    v68 = id v106 = v60;
    v69 = [(CKEffectPickerView *)self effectIdentifiers];
    v70 = [(CKEffectPickerView *)self effectLabels];
    BOOL v71 = objc_msgSend(v69, "objectAtIndex:", objc_msgSend(v70, "count") - 1);
    double v72 = [v68 objectForKey:v71];

    id v60 = v106;
    [v72 addObject:v66];
  }
  else
  {
    v64 = [(CKEffectPickerView *)self roundedContainerView];
    v66 = [MEMORY[0x1E4F28DC8] constraintWithItem:v48 attribute:4 relatedBy:0 toItem:v64 attribute:4 multiplier:1.0 constant:-9.5];
    double v72 = [(CKEffectPickerView *)self roundedContainerView];
    [v72 addConstraint:v66];
  }

  v73 = [(CKEffectPickerView *)self effectDotConstraintsThatChange];
  v74 = v111;
  [v73 setObject:v60 forKey:v111];

  id v75 = (void *)MEMORY[0x1E4F28DC8];
  long long v76 = [(CKEffectPickerView *)self roundedContainerView];
  long long v77 = [v75 constraintWithItem:v48 attribute:9 relatedBy:0 toItem:v76 attribute:9 multiplier:1.0 constant:0.0];

  long long v78 = [(CKEffectPickerView *)self roundedContainerView];
  [v78 addConstraint:v77];

  long long v79 = [(CKEffectPickerView *)self lastEffectDotTopConstraint];

  if (v79)
  {
    long long v80 = (void *)MEMORY[0x1E4F28DC8];
    long long v81 = [(CKEffectPickerView *)self lastEffectDotTopConstraint];
    v113[0] = v81;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:1];
    v83 = id v82 = v60;
    [v80 deactivateConstraints:v83];

    id v60 = v82;
    v74 = v111;

    double v84 = [(CKEffectPickerView *)self lastEffectDotTopConstraint];
    [(CKEffectPickerView *)self removeConstraint:v84];
  }
  v85 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v86 = [(CKEffectPickerView *)self roundedContainerView];
  v87 = [v85 constraintWithItem:v48 attribute:3 relatedBy:0 toItem:v86 attribute:3 multiplier:1.0 constant:9.5];

  v88 = [(CKEffectPickerView *)self roundedContainerView];
  [v88 addConstraint:v87];

  [(CKEffectPickerView *)self setLastEffectDotTopConstraint:v87];
  v89 = [MEMORY[0x1E4F28DC8] constraintWithItem:v58 attribute:9 relatedBy:0 toItem:v48 attribute:9 multiplier:1.0 constant:0.0];
  v90 = [MEMORY[0x1E4F28DC8] constraintWithItem:v58 attribute:10 relatedBy:0 toItem:v48 attribute:10 multiplier:1.0 constant:0.0];
  v91 = [(CKEffectPickerView *)self roundedContainerView];
  [v91 addConstraint:v89];

  v92 = [(CKEffectPickerView *)self roundedContainerView];
  [v92 addConstraint:v90];

  v93 = [MEMORY[0x1E4F28DC8] constraintWithItem:v48 attribute:10 relatedBy:0 toItem:v112 attribute:10 multiplier:1.0 constant:0.0];
  v94 = (void *)MEMORY[0x1E4F28DC8];
  v95 = [(CKEffectPickerView *)self roundedContainerView];
  v96 = [v94 constraintWithItem:v95 attribute:5 relatedBy:0 toItem:v112 attribute:6 multiplier:1.0 constant:22.0];

  [(CKEffectPickerView *)self addConstraint:v93];
  [(CKEffectPickerView *)self addConstraint:v96];

  uint64_t v97 = [MEMORY[0x1E4F28DC8] constraintWithItem:v112 attribute:6 relatedBy:0 toItem:v110 attribute:6 multiplier:1.0 constant:0.0];
  v98 = [MEMORY[0x1E4F28DC8] constraintWithItem:v112 attribute:10 relatedBy:0 toItem:v110 attribute:10 multiplier:1.0 constant:0.0];
  [(CKEffectPickerView *)self addConstraint:v97];
  [(CKEffectPickerView *)self addConstraint:v98];

  v99 = [(CKEffectPickerView *)self effectLabels];
  [v99 addObject:v112];

  v100 = [(CKEffectPickerView *)self effectDescriptiveLabels];
  [v100 addObject:v110];

  v101 = [(CKEffectPickerView *)self effectSendButtons];
  [v101 addObject:v58];

  v102 = [(CKEffectPickerView *)self effectDotButtons];
  [v102 addObject:v48];

  uint64_t v103 = [(CKEffectPickerView *)self effectIdentifiers];
  [v103 addObject:v74];

  [(CKEffectPickerView *)self _updateRoundedContainerView];
  v104 = [(CKEffectPickerView *)self peekContainer];
  v105 = [(CKEffectPickerView *)self balloonView];
  [v104 addSubview:v105];
}

- (void)_resizeBalloon
{
  uint64_t v3 = +[CKUIBehavior sharedBehaviors];
  [(CKEffectPickerView *)self frame];
  double v5 = v4;
  long long v6 = +[CKUIBehavior sharedBehaviors];
  [v6 senderTranscriptInsets];
  objc_msgSend(v3, "balloonMaxWidthForTranscriptWidth:marginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCoverSendButton:isStewieMode:", 1, 0, 0, 0, v5, v7, v8, v9, v10);
  double v12 = v11;

  id v13 = [(CKEffectPickerView *)self balloonView];
  [v13 prepareForDisplay];

  id v14 = [(CKEffectPickerView *)self balloonView];
  [v14 setNeedsLayout];

  id v15 = [(CKEffectPickerView *)self balloonView];
  [v15 setNeedsDisplay];

  id v16 = [(CKEffectPickerView *)self balloonView];
  [v16 layoutIfNeeded];

  id v17 = [(CKEffectPickerView *)self balloonView];
  objc_msgSend(v17, "sizeThatFits:", v12, 1.79769313e308);
  double v19 = v18;
  double v21 = v20;

  id v22 = [(CKEffectPickerView *)self balloonView];
  objc_msgSend(v22, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v19, v21);
}

- (void)_setBalloonText:(id)a3 withColor:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  double v7 = [(CKEffectPickerView *)self balloonView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v12];
    uint64_t v10 = [v9 length];
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v6, 0, v10);
    double v11 = [(CKEffectPickerView *)self balloonView];
    [v11 setAttributedText:v9];

    [(CKEffectPickerView *)self _resizeBalloon];
  }
}

- (void)_adjustMainLabelAndTypeSegmentedControlIfNecessary
{
  [(CKEffectPickerView *)self _setNeedsSwitcherAnimationIfNecessary];
  if ([(CKEffectPickerView *)self needsSwitcherAnimation])
  {
    uint64_t v3 = [(CKEffectPickerView *)self mainLabelBottomConstraint];
    [v3 setConstant:40.0];

    double v4 = [(CKEffectPickerView *)self typeSegmentedControlBottomConstraint];
    double v5 = [(CKEffectPickerView *)self mainLabel];
    [v5 bounds];
    [v4 setConstant:CGRectGetHeight(v9) + 40.0];

    id v6 = [(CKEffectPickerView *)self typeSegmentedControl];
    [v6 setAlpha:0.0];

    double v7 = [(CKEffectPickerView *)self segmentedBackdrop];
    [v7 setHidden:1];

    [(CKEffectPickerView *)self layoutIfNeeded];
  }
}

- (void)_updateBalloonViewPositionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKEffectPickerView *)self isAnimating]) {
    return;
  }
  CGFloat v5 = *MEMORY[0x1E4F1DB28];
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  CGRect v9 = [(CKEffectPickerView *)self typeSegmentedControl];
  uint64_t v10 = [v9 selectedSegmentIndex];

  if (v10 == 1)
  {
    double v11 = [(CKEffectPickerView *)self effectSendButtons];
    id v12 = [v11 objectAtIndex:0];
    [v12 frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    double v21 = [(CKEffectPickerView *)self roundedContainerView];
    objc_msgSend(v21, "convertRect:toView:", self, v14, v16, v18, v20);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
LABEL_6:

    goto LABEL_7;
  }
  double v29 = v8;
  double v27 = v7;
  double v25 = v6;
  double v23 = v5;
  if ([(CKEffectPickerView *)self selectedIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v30 = [(CKEffectPickerView *)self effectSendButtons];
    double v21 = objc_msgSend(v30, "objectAtIndex:", -[CKEffectPickerView selectedIndex](self, "selectedIndex"));

    [v21 frame];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v39 = [(CKEffectPickerView *)self roundedContainerView];
    objc_msgSend(v39, "convertRect:toView:", self, v32, v34, v36, v38);
    double v23 = v40;
    double v25 = v41;
    double v27 = v42;
    double v29 = v43;

    goto LABEL_6;
  }
LABEL_7:
  v69.origin.double x = v5;
  v69.origin.CGFloat y = v6;
  v69.size.double width = v7;
  v69.size.double height = v8;
  v70.origin.double x = v23;
  v70.origin.CGFloat y = v25;
  v70.size.double width = v27;
  v70.size.double height = v29;
  if (CGRectEqualToRect(v69, v70))
  {
    double v44 = [(CKEffectPickerView *)self closeButton];
    [v44 frame];
    double v23 = v45;
    double v25 = v46;
    double v27 = v47;
    double v29 = v48;
  }
  long long v49 = [(CKEffectPickerView *)self balloonView];
  [v49 frame];
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;

  -[CKEffectPickerView _updateBalloonViewOrigin:forButtonFrame:](self, "_updateBalloonViewOrigin:forButtonFrame:", v51, v53, v55, v57, v23, v25, v27, v29);
  double v62 = v58;
  double v63 = v59;
  double v64 = v60;
  double v65 = v61;
  if (v3)
  {
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __57__CKEffectPickerView__updateBalloonViewPositionAnimated___block_invoke;
    v67[3] = &unk_1E5621968;
    v67[4] = self;
    *(double *)&v67[5] = v58;
    *(double *)&v67[6] = v59;
    *(double *)&v67[7] = v60;
    *(double *)&v67[8] = v61;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v67 animations:0.3];
  }
  else
  {
    id v66 = [(CKEffectPickerView *)self balloonView];
    objc_msgSend(v66, "setFrame:", v62, v63, v64, v65);
  }
}

void __57__CKEffectPickerView__updateBalloonViewPositionAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) balloonView];
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGRect)_updateBalloonViewOrigin:(CGRect)a3 forButtonFrame:(CGRect)a4
{
  double v4 = *MEMORY[0x1E4F1DB20];
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.CGFloat y = v5;
  result.origin.double x = v4;
  return result;
}

- (void)_updateMomentsBackgroundColor
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKEffectPickerView *)self momentsCollectionView];
  [v3 frame];
  double v5 = v4;

  double v6 = [(CKEffectPickerView *)self momentsCollectionView];
  [v6 contentOffset];
  double v8 = v7 / v5;

  float v9 = v8;
  uint64_t v10 = vcvtms_s32_f32(v9);
  unint64_t v11 = vcvtps_s32_f32(v9);
  double v12 = (double)v10;
  if (v10 < 0)
  {
    double v16 = 0;
  }
  else
  {
    double v13 = [(CKEffectPickerView *)self momentsCollectionView];
    double v14 = [MEMORY[0x1E4F28D58] indexPathForItem:v10 inSection:0];
    double v15 = [v13 cellForItemAtIndexPath:v14];

    double v16 = [v15 effect];
  }
  double v17 = v8 - v12;
  double v18 = [(CKEffectPickerView *)self momentIdentifiers];
  unint64_t v19 = [v18 count];

  if (v19 <= v11)
  {
    double v23 = 0;
  }
  else
  {
    double v20 = [(CKEffectPickerView *)self momentsCollectionView];
    double v21 = [MEMORY[0x1E4F28D58] indexPathForItem:v11 inSection:0];
    double v22 = [v20 cellForItemAtIndexPath:v21];

    double v23 = [v22 effect];
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  if (v17 > 0.5) {
    double v24 = v23;
  }
  else {
    double v24 = v16;
  }
  double v25 = [v24 messageFilters];
  id v26 = (id)[v25 countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (v26)
  {
    double v64 = v23;
    double v27 = v16;
    uint64_t v28 = *(void *)v69;
    while (2)
    {
      for (uint64_t i = 0; i != v26; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v69 != v28) {
          objc_enumerationMutation(v25);
        }
        double v30 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        if ([v30 type] == 6)
        {
          double v31 = [(CKEffectPickerView *)self balloonView];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v26 = v30;
            goto LABEL_21;
          }
        }
      }
      id v26 = (id)[v25 countByEnumeratingWithState:&v68 objects:v72 count:16];
      if (v26) {
        continue;
      }
      break;
    }
LABEL_21:
    double v16 = v27;
    double v23 = v64;
  }

  double v33 = [(CKEffectPickerView *)self balloonView];
  double v34 = [v33 filters];
  if (![v34 count])
  {

    goto LABEL_26;
  }
  double v35 = [(CKEffectPickerView *)self balloonView];
  double v36 = [v35 filters];
  char v37 = [v36 containsObject:v26];

  if ((v37 & 1) == 0)
  {
    double v33 = [(CKEffectPickerView *)self balloonView];
    [v33 clearFilters];
LABEL_26:
  }
  if (v26)
  {
    double v38 = [(CKEffectPickerView *)self balloonView];
    double v39 = [v38 filters];
    char v40 = [v39 containsObject:v26];

    if ((v40 & 1) == 0)
    {
      double v41 = [(CKEffectPickerView *)self balloonView];
      [v41 addFilter:v26];
    }
  }
  double v42 = [v16 backgroundColor];
  uint64_t v43 = [v23 backgroundColor];
  double v44 = (void *)v43;
  if (v42)
  {
    if (v43) {
      goto LABEL_32;
    }
  }
  else
  {
    double v42 = [MEMORY[0x1E4F428B8] clearColor];
    if (v44) {
      goto LABEL_32;
    }
  }
  double v44 = [MEMORY[0x1E4F428B8] clearColor];
LABEL_32:
  double v45 = [v42 colorByBlendingWithColor:v44 withFraction:v17];
  double v66 = 0.0;
  double v67 = 0.0;
  [v45 getHue:0 saturation:0 brightness:&v67 alpha:&v66];
  BOOL v46 = v66 > 0.5 && v67 < 0.5;
  -[CKEffectPickerView setUsesDarkVibrancyForLayers:](self, "setUsesDarkVibrancyForLayers:", v46, v66);
  if (!UIAccessibilityIsReduceTransparencyEnabled() && !UIAccessibilityDarkerSystemColorsEnabled())
  {
    double v65 = v16;
    double v47 = [(CKEffectPickerView *)self closeButton];
    double v48 = [v47 layer];
    setUpVibrancyForLayer(v48, v46, ![(CKEffectPickerView *)self isInDarkMode], [(CKEffectPickerView *)self isInDarkMode]);

    long long v49 = [(CKEffectPickerView *)self momentTitleLabel];
    double v50 = [v49 layer];
    setUpVibrancyForLayer(v50, v46, ![(CKEffectPickerView *)self isInDarkMode], [(CKEffectPickerView *)self isInDarkMode]);

    double v51 = [(CKEffectPickerView *)self pageControl];
    double v52 = [v51 layer];
    setUpVibrancyForLayer(v52, v46, 0, [(CKEffectPickerView *)self isInDarkMode]);

    double v53 = [(CKEffectPickerView *)self mainLabel];
    double v54 = [v53 layer];
    setUpVibrancyForLayer(v54, v46, ![(CKEffectPickerView *)self isInDarkMode], [(CKEffectPickerView *)self isInDarkMode]);

    double v55 = [(CKEffectPickerView *)self typeSegmentedControl];
    double v56 = [v55 layer];
    setUpVibrancyForLayer(v56, v46, ![(CKEffectPickerView *)self isInDarkMode], [(CKEffectPickerView *)self isInDarkMode]);

    double v57 = [(CKEffectPickerView *)self pageControl];
    if (v46)
    {
      double v58 = [MEMORY[0x1E4F428B8] whiteColor];
      [v57 setCurrentPageIndicatorTintColor:v58];
    }
    else
    {
      double v58 = +[CKUIBehavior sharedBehaviors];
      double v59 = [v58 theme];
      double v60 = [v59 fsmPickerCurrentPageIndicatorColor];
      [v57 setCurrentPageIndicatorTintColor:v60];
    }
    double v16 = v65;
  }
  double v61 = [(CKEffectPickerView *)self momentsCollectionView];
  [v61 setBackgroundColor:v45];

  double v62 = [(CKEffectPickerView *)self backdrop];
  [v62 setEnabled:0];

  double v63 = [(CKEffectPickerView *)self backdrop];
  [v63 setEnabled:1];
}

- (id)_blackTextReplica
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(CKEffectPickerView *)self _resizeBalloon];
  BOOL v3 = [(CKEffectPickerView *)self balloonView];
  id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [v3 frame];
  double v5 = objc_msgSend(v4, "initWithFrame:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v6 = objc_msgSend(v3, "subviews", 0);
    id v7 = (id)[v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = (id)[v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v7 = v10;

      if (!v7) {
        goto LABEL_12;
      }
      unint64_t v11 = +[CKBalloonTextView makeTextView];
      id v13 = objc_alloc(MEMORY[0x1E4F28E48]);
      double v14 = [v7 attributedText];
      double v6 = (void *)[v13 initWithAttributedString:v14];

      uint64_t v15 = [v6 length];
      uint64_t v16 = *MEMORY[0x1E4FB0700];
      double v17 = [MEMORY[0x1E4F428B8] blackColor];
      objc_msgSend(v6, "addAttribute:value:range:", v16, v17, 0, v15);

      [v11 setAttributedText:v6];
      [v7 frame];
      objc_msgSend(v11, "setFrame:");
      [v5 addSubview:v11];
    }
    else
    {
LABEL_10:
      unint64_t v11 = v5;
      double v5 = 0;
    }
    double v12 = v5;

    double v5 = v11;
  }
  else
  {
    id v7 = 0;
LABEL_12:
    double v12 = 0;
  }

  return v12;
}

- (BOOL)_keyboardIsOnTopOfEffectPickerWindow
{
  id v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 userInterfaceIdiom] == 1)
  {
    BOOL v3 = [MEMORY[0x1E4F42B08] activeKeyboard];
    id v4 = [v3 window];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_animateIn
{
  uint64_t v195 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKEffectPickerView *)self balloonView];
  id v4 = [v3 layer];
  long long v171 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  long long v189 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v169 = v189;
  long long v190 = v171;
  long long v167 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v191 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v165 = v191;
  long long v192 = v167;
  long long v163 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  long long v185 = *MEMORY[0x1E4F39B10];
  long long v161 = v185;
  long long v186 = v163;
  long long v159 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  long long v187 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  long long v158 = v187;
  long long v188 = v159;
  [v4 setTransform:&v185];

  BOOL v5 = [(CKEffectPickerView *)self hintBlackText];
  double v6 = [v5 layer];
  long long v189 = v169;
  long long v190 = v171;
  long long v191 = v165;
  long long v192 = v167;
  long long v185 = v161;
  long long v186 = v163;
  long long v187 = v158;
  long long v188 = v159;
  [v6 setTransform:&v185];

  id v7 = [(CKEffectPickerView *)self hintBlackText];
  [v7 removeFromSuperview];

  [(CKEffectPickerView *)self setHintBlackText:0];
  uint64_t v8 = [(CKEffectPickerView *)self hintSendButton];
  [v8 removeFromSuperview];

  [(CKEffectPickerView *)self setHintSendButton:0];
  uint64_t v9 = [CKTransientReplicaButtonContainer alloc];
  uint64_t v10 = [(CKEffectPickerView *)self closeButton];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  BOOL v19 = [(CKEffectPickerView *)self isInDarkMode];
  long long v20 = +[CKUIBehavior sharedBehaviors];
  long long v21 = [v20 theme];
  long long v22 = [v21 fsmPickerCloseButtonColor];
  double v23 = -[CKTransientReplicaButtonContainer initWithFrame:hasDarkVibrancy:isInDarkMode:color:sendColor:](v9, "initWithFrame:hasDarkVibrancy:isInDarkMode:color:sendColor:", 0, v19, v22, [(CKEffectPickerView *)self controlColor], v12, v14, v16, v18);

  uint64_t v24 = [(CKEffectPickerView *)self peekContainer];
  [v24 addSubview:v23];

  double v25 = [(CKEffectPickerView *)self closeButton];
  [v25 setHidden:1];

  id v26 = [(CKTransientReplicaButtonContainer *)v23 cancelButtonCircle];
  double v27 = [v26 layer];
  [v27 setOpacity:0.0];

  uint64_t v28 = [(CKTransientReplicaButtonContainer *)v23 cancelButtonGlyphLayer];
  CATransform3DMakeScale(&v184, 0.0, 0.0, 1.0);
  [v28 setTransform:&v184];

  double v29 = [(CKEffectPickerView *)self peekContainer];
  double v30 = [(CKEffectPickerView *)self balloonView];
  [v29 addSubview:v30];

  [(CKEffectPickerView *)self _resizeBalloon];
  [(CKEffectPickerView *)self _updateBalloonViewPositionAnimated:0];
  double v31 = [(CKEffectPickerView *)self balloonView];
  [v31 frame];
  double v33 = v32;
  [v31 frame];
  double v35 = v34;
  double v36 = [v31 layer];
  [v36 anchorPoint];
  double v38 = v33 + v35 * v37;

  [v31 frame];
  double v40 = v39;
  [v31 frame];
  double v42 = v41;
  uint64_t v43 = [v31 layer];
  [v43 anchorPoint];
  double v45 = v40 + v42 * v44;

  [(CKEffectPickerView *)self balloonViewOrigin];
  objc_msgSend(v31, "setOrigin:");
  BOOL v46 = [(CKEffectPickerView *)self _blackTextReplica];
  [(CKEffectPickerView *)self balloonViewOrigin];
  objc_msgSend(v46, "setOrigin:");
  double v47 = [(CKEffectPickerView *)self peekContainer];
  [v47 addSubview:v46];

  double v48 = [(CKEffectPickerView *)self balloonView];
  long long v49 = [v48 layer];
  [v49 setOpacity:0.0];

  double v50 = [(CKEffectPickerView *)self roundedContainerView];
  double v51 = [v50 layer];
  [v51 setOpacity:0.0];

  long long v182 = 0u;
  long long v183 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  double v52 = [(CKEffectPickerView *)self effectLabels];
  uint64_t v53 = [v52 countByEnumeratingWithState:&v180 objects:v194 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v181;
    do
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v181 != v55) {
          objc_enumerationMutation(v52);
        }
        double v57 = [*(id *)(*((void *)&v180 + 1) + 8 * i) layer];
        [v57 setOpacity:0.0];
      }
      uint64_t v54 = [v52 countByEnumeratingWithState:&v180 objects:v194 count:16];
    }
    while (v54);
  }

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.325];
  [(CKEffectPickerView *)self setIsAnimating:1];
  double v58 = (void *)MEMORY[0x1E4F39CF8];
  v177[0] = MEMORY[0x1E4F143A8];
  v177[1] = 3221225472;
  v177[2] = __32__CKEffectPickerView__animateIn__block_invoke;
  v177[3] = &unk_1E5620AA8;
  v177[4] = self;
  double v59 = v23;
  v178 = v59;
  id v166 = v46;
  id v179 = v166;
  [v58 setCompletionBlock:v177];
  id v60 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v60 setToValue:&unk_1EDF17408];
  uint64_t v61 = *MEMORY[0x1E4F39FA8];
  [v60 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v60 setRemovedOnCompletion:0];
  [v60 setBeginTime:CACurrentMediaTime()];
  uint64_t v62 = *MEMORY[0x1E4F3A498];
  double v63 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  [v60 setTimingFunction:v63];

  double v64 = [(CKEffectPickerView *)self backdrop];
  v157 = v60;
  [v64 addAnimation:v60 forKey:@"filters.gaussianBlur.inputRadius"];

  id v65 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v65 setToValue:&unk_1EDF17418];
  [v65 setFillMode:v61];
  [v65 setRemovedOnCompletion:0];
  [v65 setBeginTime:CACurrentMediaTime()];
  uint64_t v168 = v62;
  double v66 = [MEMORY[0x1E4F39C10] functionWithName:v62];
  [v65 setTimingFunction:v66];

  id v67 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v67 setFromValue:&unk_1EDF17418];
  [v67 setToValue:&unk_1EDF17428];
  uint64_t v172 = v61;
  [v67 setFillMode:v61];
  [v67 setRemovedOnCompletion:0];
  [v67 setBeginTime:CACurrentMediaTime()];
  uint64_t v68 = *MEMORY[0x1E4F3A488];
  long long v69 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
  [v67 setTimingFunction:v69];

  id v70 = v67;
  id v71 = v70;
  if ([(CKEffectPickerView *)self isInDarkMode])
  {
    id v71 = objc_alloc_init(MEMORY[0x1E4F39B48]);

    [v71 setFromValue:&unk_1EDF17438];
    [v71 setToValue:&unk_1EDF17428];
    [v71 setFillMode:v172];
    [v71 setRemovedOnCompletion:0];
    [v71 setBeginTime:CACurrentMediaTime()];
    double v72 = [MEMORY[0x1E4F39C10] functionWithName:v68];
    [v71 setTimingFunction:v72];
  }
  v164 = v70;
  uint64_t v73 = [(CKEffectPickerView *)self blueContrastLayer];
  [v73 addAnimation:v65 forKey:@"opacity"];

  v74 = [(CKTransientReplicaButtonContainer *)v59 sendButtonCircle];
  v156 = v71;
  [v74 addAnimation:v71 forKey:@"opacity"];

  id v75 = [(CKTransientReplicaButtonContainer *)v59 cancelButtonCircle];
  [v75 addAnimation:v65 forKey:@"opacity"];

  if (UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityDarkerSystemColorsEnabled())
  {
    long long v76 = [(CKEffectPickerView *)self accessibilityBackdropView];
    [v76 addAnimation:v65 forKey:@"opacity"];
  }
  id v77 = objc_alloc_init(MEMORY[0x1E4F39BD8]);
  [v77 setValues:&unk_1EDF157D0];
  [v77 setKeyTimes:&unk_1EDF157E8];
  long long v78 = [MEMORY[0x1E4F39C10] functionWithName:v68];
  [v77 setTimingFunction:v78];

  [v77 setFillMode:v172];
  [v77 setRemovedOnCompletion:0];
  [v77 setBeginTime:CACurrentMediaTime()];
  id v79 = objc_alloc_init(MEMORY[0x1E4F39BD8]);
  [v79 setValues:&unk_1EDF15800];
  [v79 setKeyTimes:&unk_1EDF15818];
  long long v80 = [MEMORY[0x1E4F39C10] functionWithName:v168];
  [v79 setTimingFunction:v80];

  [v79 setFillMode:v172];
  [v79 setRemovedOnCompletion:0];
  [v79 setBeginTime:CACurrentMediaTime()];
  long long v81 = [(CKTransientReplicaButtonContainer *)v59 sendButtonGlyphLayer];
  v154 = v79;
  [v81 addAnimation:v79 forKey:@"transform.scale"];

  id v82 = [(CKTransientReplicaButtonContainer *)v59 cancelButtonGlyphLayer];
  v155 = v77;
  [v82 addAnimation:v77 forKey:@"transform.scale"];

  id v83 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  double v84 = [NSNumber numberWithInteger:(uint64_t)v38];
  [v83 setToValue:v84];

  [v83 setFillMode:v172];
  [v83 setRemovedOnCompletion:0];
  [v83 setBeginTime:CACurrentMediaTime()];
  v85 = [MEMORY[0x1E4F39C10] functionWithName:v168];
  [v83 setTimingFunction:v85];

  id v86 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  v87 = [NSNumber numberWithInteger:(uint64_t)v45];
  [v86 setToValue:v87];

  [v86 setFillMode:v172];
  [v86 setRemovedOnCompletion:0];
  [v86 setBeginTime:CACurrentMediaTime()];
  v88 = [MEMORY[0x1E4F39C10] functionWithName:v168];
  [v86 setTimingFunction:v88];

  [v31 addAnimation:v83 forKey:@"position.x"];
  [v31 addAnimation:v86 forKey:@"position.y"];
  double v160 = v31;
  v170 = v65;
  [v31 addAnimation:v65 forKey:@"opacity"];
  id v89 = v70;
  if (v166)
  {
    [v166 addAnimation:v70 forKey:@"opacity"];
    [v166 addAnimation:v83 forKey:@"position.x"];
    [v166 addAnimation:v86 forKey:@"position.y"];
  }
  v153 = v83;
  v90 = [(CKEffectPickerView *)self closeButton];
  [v90 frame];
  CGFloat x = v196.origin.x;
  CGFloat y = v196.origin.y;
  CGFloat width = v196.size.width;
  CGFloat height = v196.size.height;
  CGRectGetMidX(v196);
  v197.origin.CGFloat x = x;
  v197.origin.CGFloat y = y;
  v197.size.CGFloat width = width;
  v197.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v197);
  v96 = [(CKEffectPickerView *)self effectLabels];
  uint64_t v97 = [v96 lastObject];
  [v97 frame];
  CGFloat v98 = v198.origin.x;
  CGFloat v99 = v198.origin.y;
  CGFloat v100 = v198.size.width;
  CGFloat v101 = v198.size.height;
  CGRectGetMidX(v198);
  v199.origin.CGFloat x = v98;
  v199.origin.CGFloat y = v99;
  v199.size.CGFloat width = v100;
  v199.size.CGFloat height = v101;
  double v102 = CGRectGetMidY(v199);

  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  v162 = self;
  uint64_t v103 = [(CKEffectPickerView *)self effectLabels];
  uint64_t v104 = [v103 countByEnumeratingWithState:&v173 objects:v193 count:16];
  if (v104)
  {
    uint64_t v105 = v104;
    double v106 = MidY - v102;
    uint64_t v107 = *(void *)v174;
    do
    {
      for (uint64_t j = 0; j != v105; ++j)
      {
        if (*(void *)v174 != v107) {
          objc_enumerationMutation(v103);
        }
        double v109 = *(void **)(*((void *)&v173 + 1) + 8 * j);
        [v109 frame];
        double v111 = v110;
        double v113 = v112;
        id v114 = objc_alloc_init(MEMORY[0x1E4F39B48]);
        CGSize v115 = NSNumber;
        v116 = [v109 layer];
        [v116 anchorPoint];
        v118 = [v115 numberWithDouble:v106 + v111 + v113 * v117];
        [v114 setFromValue:v118];

        v119 = NSNumber;
        v120 = [v109 layer];
        [v120 anchorPoint];
        v122 = [v119 numberWithDouble:v111 + v113 * v121];
        [v114 setToValue:v122];

        [v114 setRemovedOnCompletion:0];
        [v114 setFillMode:v172];
        v123 = [MEMORY[0x1E4F39C10] functionWithName:v168];
        [v114 setTimingFunction:v123];

        [v114 setBeginTime:CACurrentMediaTime()];
        [v109 addAnimation:v114 forKey:@"position.y"];
        v124 = (void *)[v170 copy];
        double v125 = CACurrentMediaTime();
        [MEMORY[0x1E4F39CF8] animationDuration];
        [v124 setBeginTime:v125 + v126 * 0.6];
        [v109 addAnimation:v124 forKey:@"opacity"];
      }
      uint64_t v105 = [v103 countByEnumeratingWithState:&v173 objects:v193 count:16];
    }
    while (v105);
  }

  v127 = [(CKEffectPickerView *)v162 roundedContainerView];
  [v127 frame];
  double v129 = v128;
  double v131 = v130;

  id v132 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  v133 = NSNumber;
  v134 = [(CKEffectPickerView *)v162 roundedContainerView];
  v135 = [v134 layer];
  [v135 anchorPoint];
  v137 = [v133 numberWithDouble:v129 + v131 * v136 + 150.0];
  [v132 setFromValue:v137];

  v138 = NSNumber;
  v139 = [(CKEffectPickerView *)v162 roundedContainerView];
  v140 = [v139 layer];
  [v140 anchorPoint];
  v142 = [v138 numberWithDouble:v129 + v131 * v141];
  [v132 setToValue:v142];

  [v132 setRemovedOnCompletion:0];
  [v132 setFillMode:v172];
  uint64_t v143 = *MEMORY[0x1E4F3A490];
  v144 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v132 setTimingFunction:v144];

  [v132 setBeginTime:CACurrentMediaTime()];
  v145 = [(CKEffectPickerView *)v162 roundedContainerView];
  [v145 addAnimation:v132 forKey:@"position.y"];

  v146 = [(CKEffectPickerView *)v162 roundedContainerView];
  [v146 addAnimation:v170 forKey:@"opacity"];

  id v147 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v147 setFromValue:&unk_1EDF17468];
  v148 = [NSNumber numberWithDouble:v131];
  [v147 setToValue:v148];

  [v147 setFillMode:v172];
  [v147 setRemovedOnCompletion:0];
  [v147 setFillMode:v172];
  v149 = [MEMORY[0x1E4F39C10] functionWithName:v143];
  [v147 setTimingFunction:v149];

  [v147 setBeginTime:CACurrentMediaTime()];
  v150 = [(CKEffectPickerView *)v162 roundedContainerView];
  [v150 addAnimation:v147 forKey:@"bounds.size.height"];

  [MEMORY[0x1E4F39CF8] commit];
  v151 = [(CKEffectPickerView *)v162 peekContainer];
  [v151 setHidden:0];
}

void __32__CKEffectPickerView__animateIn__block_invoke(id *a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v2 = [a1[4] backdrop];
  [v2 setValue:&unk_1EDF17408 forKeyPath:@"filters.gaussianBlur.inputRadius"];

  BOOL v3 = [a1[4] roundedContainerView];
  id v4 = [v3 layer];
  LODWORD(v5) = 1.0;
  [v4 setOpacity:v5];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  double v6 = [a1[4] effectLabels];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v49;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = [*(id *)(*((void *)&v48 + 1) + 8 * v10) layer];
        LODWORD(v12) = 1.0;
        [v11 setOpacity:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v8);
  }

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [a1[5] removeFromSuperview];
  double v13 = [a1[4] closeButton];
  [v13 setHidden:0];

  [a1[6] removeFromSuperview];
  [a1[4] setIsAnimating:0];
  [a1[4] _updateBalloonViewPositionAnimated:0];
  double v14 = [a1[4] balloonView];
  double v15 = [v14 layer];
  LODWORD(v16) = 1.0;
  [v15 setOpacity:v16];

  double v17 = [a1[4] blueContrastLayer];
  LODWORD(v18) = 1.0;
  [v17 setOpacity:v18];

  BOOL v19 = [a1[4] balloonView];
  [v19 _removeAllAnimations:1];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v20 = [a1[4] effectLabels];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v45;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v44 + 1) + 8 * v24++) _removeAllAnimations:1];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v22);
  }

  double v25 = [a1[4] roundedContainerView];
  [v25 _removeAllAnimations:1];

  id v26 = [a1[4] hintContainer];
  [v26 setHidden:1];

  double v27 = [a1[4] backdrop];
  uint64_t v28 = [MEMORY[0x1E4F42D90] mainScreen];
  [v28 scale];
  objc_msgSend(v27, "setRasterizationScale:");

  double v29 = [a1[4] backdrop];
  [v29 setShouldRasterize:1];

  [MEMORY[0x1E4F39CF8] commit];
  double v30 = [a1[4] delegate];
  [v30 effectPickerViewDidFinishAnimatingIn:a1[4]];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  double v31 = objc_msgSend(a1[4], "fsem", 0);
  double v32 = [v31 effectIdentifiers];

  uint64_t v33 = [v32 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v41;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v41 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v40 + 1) + 8 * v36);
        double v38 = [a1[4] fsem];
        double v39 = [v38 effectForIdentifier:v37];

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [v32 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v34);
  }
}

- (void)_stopBalloonAnimation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKEffectPickerView *)self balloonView];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = objc_msgSend(v3, "subviews", 0);
  id v5 = (id)[v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (v3)
  {
    [v3 setInvisibleInkEffectEnabled:0];
    [v3 prepareForDisplayIfNeeded];
    uint64_t v9 = objc_alloc_init(CKSendAnimationContext);
    BOOL v19 = v3;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    [(CKSendAnimationContext *)v9 setThrowBalloonViews:v10];

    double v11 = v5;
    if (!v5)
    {
      double v11 = [MEMORY[0x1E4F1CA98] null];
    }
    double v18 = v11;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    [(CKSendAnimationContext *)v9 setAnimatableTextViews:v12];

    if (!v5) {
    [(CKSendAnimationContext *)v9 setIsSender:1];
    }
    [(CKSendAnimationContext *)v9 setImpactIdentifier:@"nil"];
    double v13 = [(CKEffectPickerView *)self dummyAnimator];
    [v13 stopAnimationWithSendAnimationContext:v9];
  }
}

- (void)_animateOut
{
  uint64_t v166 = *MEMORY[0x1E4F143B8];
  [(CKEffectPickerView *)self cancelImpactSelection];
  v164[0] = MEMORY[0x1E4F143A8];
  v164[1] = 3221225472;
  v164[2] = __33__CKEffectPickerView__animateOut__block_invoke;
  v164[3] = &unk_1E5620C40;
  v164[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v164 animations:0.325];
  BOOL v3 = [CKTransientReplicaButtonContainer alloc];
  id v4 = [(CKEffectPickerView *)self closeButton];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  BOOL v13 = [(CKEffectPickerView *)self usesDarkVibrancyForLayers];
  BOOL v14 = [(CKEffectPickerView *)self isInDarkMode];
  long long v15 = +[CKUIBehavior sharedBehaviors];
  long long v16 = [v15 theme];
  long long v17 = [v16 fsmPickerCloseButtonColor];
  double v18 = -[CKTransientReplicaButtonContainer initWithFrame:hasDarkVibrancy:isInDarkMode:color:sendColor:](v3, "initWithFrame:hasDarkVibrancy:isInDarkMode:color:sendColor:", v13, v14, v17, [(CKEffectPickerView *)self controlColor], v6, v8, v10, v12);

  BOOL v19 = [(CKEffectPickerView *)self peekContainer];
  [v19 addSubview:v18];

  long long v20 = [(CKEffectPickerView *)self closeButton];
  [v20 setHidden:1];

  uint64_t v21 = [(CKTransientReplicaButtonContainer *)v18 sendButtonCircle];
  uint64_t v22 = [v21 layer];
  [v22 setOpacity:0.0];

  v155 = v18;
  uint64_t v23 = [(CKTransientReplicaButtonContainer *)v18 sendButtonGlyphLayer];
  [v23 setOpacity:0.0];

  [(CKEffectPickerView *)self _resizeBalloon];
  [(CKEffectPickerView *)self _updateBalloonViewPositionAnimated:0];
  uint64_t v24 = [(CKEffectPickerView *)self balloonView];
  [(CKEffectPickerView *)self balloonViewOrigin];
  double v26 = v25;
  [v24 frame];
  double v28 = v27;
  double v29 = [v24 layer];
  [v29 anchorPoint];
  double v31 = v30;

  [(CKEffectPickerView *)self balloonViewOrigin];
  double v33 = v32;
  [v24 frame];
  double v35 = v34;
  v154 = v24;
  uint64_t v36 = [v24 layer];
  [v36 anchorPoint];
  double v38 = v37;

  double v39 = [(CKEffectPickerView *)self _blackTextReplica];
  if (v39)
  {
    long long v40 = [(CKEffectPickerView *)self peekContainer];
    [v40 addSubview:v39];

    long long v41 = [v39 layer];
    [v41 setOpacity:0.0];
  }
  v153 = v39;
  long long v42 = [(CKEffectPickerView *)self backdrop];
  [v42 setShouldRasterize:0];

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.325];
  [(CKEffectPickerView *)self setIsAnimating:1];
  v163[0] = MEMORY[0x1E4F143A8];
  v163[1] = 3221225472;
  v163[2] = __33__CKEffectPickerView__animateOut__block_invoke_2;
  v163[3] = &unk_1E5620C40;
  v163[4] = self;
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v163];
  id v43 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v43 setFromValue:&unk_1EDF17408];
  [v43 setToValue:&unk_1EDF17428];
  uint64_t v44 = *MEMORY[0x1E4F39FA8];
  [v43 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v43 setRemovedOnCompletion:0];
  [v43 setBeginTime:CACurrentMediaTime()];
  uint64_t v45 = *MEMORY[0x1E4F3A498];
  long long v46 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  [v43 setTimingFunction:v46];

  long long v47 = [(CKEffectPickerView *)self backdrop];
  v151 = v43;
  [v47 addAnimation:v43 forKey:@"filters.gaussianBlur.inputRadius"];

  id v48 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v48 setFromValue:&unk_1EDF17428];
  [v48 setToValue:&unk_1EDF17418];
  [v48 setFillMode:v44];
  [v48 setRemovedOnCompletion:0];
  [v48 setBeginTime:CACurrentMediaTime()];
  long long v49 = [MEMORY[0x1E4F39C10] functionWithName:v45];
  [v48 setTimingFunction:v49];

  id v50 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v50 setFromValue:&unk_1EDF17418];
  [v50 setToValue:&unk_1EDF17428];
  [v50 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v50 setRemovedOnCompletion:0];
  [v50 setBeginTime:CACurrentMediaTime()];
  uint64_t v51 = *MEMORY[0x1E4F3A488];
  double v52 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
  long long v158 = v50;
  [v50 setTimingFunction:v52];

  id v53 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v53 setFromValue:&unk_1EDF17418];
  [v53 setToValue:&unk_1EDF17428];
  uint64_t v157 = v44;
  [v53 setFillMode:v44];
  [v53 setRemovedOnCompletion:0];
  [v53 setBeginTime:CACurrentMediaTime()];
  uint64_t v156 = v45;
  uint64_t v54 = [MEMORY[0x1E4F39C10] functionWithName:v45];
  [v53 setTimingFunction:v54];

  id v55 = v48;
  id v56 = v55;
  if ([(CKEffectPickerView *)self isInDarkMode])
  {
    id v56 = objc_alloc_init(MEMORY[0x1E4F39B48]);

    [v56 setFromValue:&unk_1EDF17428];
    [v56 setToValue:&unk_1EDF17478];
    [v56 setFillMode:v44];
    [v56 setRemovedOnCompletion:0];
    [v56 setBeginTime:CACurrentMediaTime()];
    double v57 = [MEMORY[0x1E4F39C10] functionWithName:v51];
    [v56 setTimingFunction:v57];
  }
  double v58 = v26 + v28 * v31;
  double v59 = [(CKTransientReplicaButtonContainer *)v155 sendButtonCircle];
  [v59 addAnimation:v56 forKey:@"opacity"];

  id v60 = [(CKTransientReplicaButtonContainer *)v155 sendButtonGlyphLayer];
  v148 = v56;
  [v60 addAnimation:v56 forKey:@"opacity"];

  uint64_t v61 = [(CKTransientReplicaButtonContainer *)v155 cancelButtonCircle];
  [v61 addAnimation:v158 forKey:@"opacity"];

  uint64_t v62 = [(CKEffectPickerView *)self momentTitleLabel];
  [v62 addAnimation:v53 forKey:@"opacity"];

  double v63 = [(CKEffectPickerView *)self sendMomentButton];
  [v63 addAnimation:v53 forKey:@"opacity"];

  double v64 = [(CKEffectPickerView *)self pageControl];
  [v64 addAnimation:v53 forKey:@"opacity"];

  id v65 = [(CKEffectPickerView *)self backgroundView];
  [v65 addAnimation:v53 forKey:@"opacity"];

  double v66 = [(CKEffectPickerView *)self momentsCollectionView];
  [v66 addAnimation:v53 forKey:@"opacity"];

  id v67 = [(CKEffectPickerView *)self mainLabel];
  [v67 addAnimation:v53 forKey:@"opacity"];

  uint64_t v68 = [(CKEffectPickerView *)self typeSegmentedControl];
  [v68 addAnimation:v53 forKey:@"opacity"];

  long long v69 = [(CKEffectPickerView *)self segmentedBackdrop];
  [v69 addAnimation:v53 forKey:@"opacity"];

  id v70 = [(CKEffectPickerView *)self blueContrastLayer];
  [v70 addAnimation:v53 forKey:@"opacity"];

  if (UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityDarkerSystemColorsEnabled())
  {
    id v71 = [(CKEffectPickerView *)self accessibilityBackdropView];
    [v71 addAnimation:v53 forKey:@"opacity"];
  }
  v150 = v53;
  id v72 = objc_alloc_init(MEMORY[0x1E4F39BD8]);
  [v72 setValues:&unk_1EDF15830];
  [v72 setKeyTimes:&unk_1EDF15848];
  uint64_t v73 = [MEMORY[0x1E4F39C10] functionWithName:v51];
  [v72 setTimingFunction:v73];

  [v72 setFillMode:v44];
  [v72 setRemovedOnCompletion:0];
  [v72 setBeginTime:CACurrentMediaTime()];
  id v74 = objc_alloc_init(MEMORY[0x1E4F39BD8]);
  [v74 setValues:&unk_1EDF15860];
  [v74 setKeyTimes:&unk_1EDF15878];
  id v75 = [MEMORY[0x1E4F39C10] functionWithName:v156];
  [v74 setTimingFunction:v75];

  [v74 setFillMode:v44];
  [v74 setRemovedOnCompletion:0];
  [v74 setBeginTime:CACurrentMediaTime()];
  long long v76 = [(CKTransientReplicaButtonContainer *)v155 sendButtonGlyphLayer];
  id v147 = v72;
  [v76 addAnimation:v72 forKey:@"transform.scale"];

  id v77 = [(CKTransientReplicaButtonContainer *)v155 cancelButtonGlyphLayer];
  v146 = v74;
  [v77 addAnimation:v74 forKey:@"transform.scale"];

  id v78 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  id v79 = [NSNumber numberWithDouble:v58];
  [v78 setToValue:v79];

  [v78 setFillMode:v44];
  [v78 setRemovedOnCompletion:0];
  [v78 setBeginTime:CACurrentMediaTime()];
  long long v80 = [MEMORY[0x1E4F39C10] functionWithName:v156];
  [v78 setTimingFunction:v80];

  id v81 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  id v82 = [NSNumber numberWithDouble:v33 + v35 * v38];
  [v81 setToValue:v82];

  [v81 setFillMode:v157];
  [v81 setRemovedOnCompletion:0];
  [v81 setBeginTime:CACurrentMediaTime()];
  id v83 = [MEMORY[0x1E4F39C10] functionWithName:v156];
  [v81 setTimingFunction:v83];

  [v154 addAnimation:v78 forKey:@"position.x"];
  [v154 addAnimation:v81 forKey:@"position.y"];
  if (v153)
  {
    [v154 addAnimation:v158 forKey:@"opacity"];
    [v153 addAnimation:v55 forKey:@"opacity"];
    [v153 addAnimation:v78 forKey:@"position.x"];
    [v153 addAnimation:v81 forKey:@"position.y"];
  }
  v144 = v81;
  v145 = v78;
  v149 = v55;
  double v84 = [(CKEffectPickerView *)self closeButton];
  [v84 frame];
  CGFloat x = v167.origin.x;
  CGFloat y = v167.origin.y;
  CGFloat width = v167.size.width;
  CGFloat height = v167.size.height;
  CGRectGetMidX(v167);
  v168.origin.CGFloat x = x;
  v168.origin.CGFloat y = y;
  v168.size.CGFloat width = width;
  v168.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v168);
  v90 = [(CKEffectPickerView *)self effectLabels];
  v91 = [v90 lastObject];
  [v91 frame];
  CGFloat v92 = v169.origin.x;
  CGFloat v93 = v169.origin.y;
  CGFloat v94 = v169.size.width;
  CGFloat v95 = v169.size.height;
  CGRectGetMidX(v169);
  v170.origin.CGFloat x = v92;
  v170.origin.CGFloat y = v93;
  v170.size.CGFloat width = v94;
  v170.size.CGFloat height = v95;
  double v96 = CGRectGetMidY(v170);

  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  v152 = self;
  uint64_t v97 = [(CKEffectPickerView *)self effectLabels];
  uint64_t v98 = [v97 countByEnumeratingWithState:&v159 objects:v165 count:16];
  if (v98)
  {
    uint64_t v99 = v98;
    double v100 = MidY - v96;
    uint64_t v101 = *(void *)v160;
    do
    {
      for (uint64_t i = 0; i != v99; ++i)
      {
        if (*(void *)v160 != v101) {
          objc_enumerationMutation(v97);
        }
        uint64_t v103 = *(void **)(*((void *)&v159 + 1) + 8 * i);
        [v103 frame];
        double v105 = v104;
        double v107 = v106;
        id v108 = objc_alloc_init(MEMORY[0x1E4F39B48]);
        double v109 = NSNumber;
        double v110 = [v103 layer];
        [v110 anchorPoint];
        double v112 = [v109 numberWithDouble:v105 + v107 * v111];
        [v108 setFromValue:v112];

        double v113 = NSNumber;
        id v114 = [v103 layer];
        [v114 anchorPoint];
        v116 = [v113 numberWithDouble:v100 + v105 + v107 * v115];
        [v108 setToValue:v116];

        [v108 setRemovedOnCompletion:0];
        [v108 setFillMode:v157];
        double v117 = [MEMORY[0x1E4F39C10] functionWithName:v156];
        [v108 setTimingFunction:v117];

        [v108 setBeginTime:CACurrentMediaTime()];
        [v103 addAnimation:v108 forKey:@"position.y"];
        v118 = (void *)[v158 copy];
        double v119 = CACurrentMediaTime();
        [MEMORY[0x1E4F39CF8] animationDuration];
        [v118 setBeginTime:v119 + v120 * -0.8];
        [v103 addAnimation:v118 forKey:@"opacity"];
      }
      uint64_t v99 = [v97 countByEnumeratingWithState:&v159 objects:v165 count:16];
    }
    while (v99);
  }

  double v121 = [(CKEffectPickerView *)self roundedContainerView];
  [v121 frame];
  double v123 = v122;
  double v125 = v124;

  id v126 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  v127 = NSNumber;
  double v128 = [(CKEffectPickerView *)v152 roundedContainerView];
  double v129 = [v128 layer];
  [v129 anchorPoint];
  double v131 = [v127 numberWithDouble:v123 + v125 * v130];
  [v126 setFromValue:v131];

  id v132 = NSNumber;
  v133 = [(CKEffectPickerView *)v152 roundedContainerView];
  v134 = [v133 layer];
  [v134 anchorPoint];
  double v136 = [v132 numberWithDouble:v123 + v125 * v135 + 150.0];
  [v126 setToValue:v136];

  [v126 setRemovedOnCompletion:0];
  [v126 setFillMode:v157];
  v137 = [MEMORY[0x1E4F39C10] functionWithName:v156];
  [v126 setTimingFunction:v137];

  [v126 setBeginTime:CACurrentMediaTime()];
  v138 = [(CKEffectPickerView *)v152 roundedContainerView];
  [v138 addAnimation:v126 forKey:@"position.y"];

  v139 = [(CKEffectPickerView *)v152 roundedContainerView];
  [v139 addAnimation:v158 forKey:@"opacity"];

  id v140 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  double v141 = [NSNumber numberWithDouble:v125];
  [v140 setFromValue:v141];

  [v140 setToValue:&unk_1EDF17468];
  [v140 setFillMode:v157];
  [v140 setRemovedOnCompletion:0];
  [v140 setFillMode:v157];
  v142 = [MEMORY[0x1E4F39C10] functionWithName:v156];
  [v140 setTimingFunction:v142];

  [v140 setBeginTime:CACurrentMediaTime()];
  uint64_t v143 = [(CKEffectPickerView *)v152 roundedContainerView];
  [v143 addAnimation:v140 forKey:@"bounds.size.height"];

  [MEMORY[0x1E4F39CF8] commit];
}

void __33__CKEffectPickerView__animateOut__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundView];
  [v2 setBackgroundColor:0];

  BOOL v3 = [*(id *)(a1 + 32) accessibilitySendBackgroundView];
  [v3 setBackgroundColor:0];

  id v4 = [*(id *)(a1 + 32) accessibilityCloseBackgroundView];
  [v4 setBackgroundColor:0];
}

void __33__CKEffectPickerView__animateOut__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 touchUpInsideCloseButton];
}

- (id)_glyphLayerForButtonAnimationWithGlyphName:(id)a3
{
  BOOL v3 = [MEMORY[0x1E4F42A80] ckImageNamed:a3];
  [v3 size];
  double v5 = v4;
  double v7 = v6;
  double v8 = [MEMORY[0x1E4F39BE8] layer];
  id v9 = v3;
  objc_msgSend(v8, "setContents:", objc_msgSend(v9, "CGImage"));
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v5, v7);
  double v10 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
  [v8 setCompositingFilter:v10];

  return v8;
}

- (void)_animateSelectedEffectLabelAtIndex:(unint64_t)a3 fromPreviousIndex:(unint64_t)a4
{
  uint64_t v45 = 0;
  long long v46 = &v45;
  uint64_t v47 = 0x3032000000;
  id v48 = __Block_byref_object_copy__54;
  long long v49 = __Block_byref_object_dispose__54;
  id v50 = 0;
  uint64_t v39 = 0;
  long long v40 = &v39;
  uint64_t v41 = 0x3032000000;
  long long v42 = __Block_byref_object_copy__54;
  id v43 = __Block_byref_object_dispose__54;
  id v44 = 0;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = [(CKEffectPickerView *)self effectLabels];
    uint64_t v8 = [v7 objectAtIndex:a3];
    id v9 = (void *)v46[5];
    v46[5] = v8;

    double v10 = [(CKEffectPickerView *)self effectDescriptiveLabels];
    uint64_t v11 = [v10 objectAtIndex:a3];
    double v12 = (void *)v40[5];
    v40[5] = v11;
  }
  BOOL v13 = 0;
  BOOL v14 = 0;
  uint64_t v33 = 0;
  double v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__54;
  double v37 = __Block_byref_object_dispose__54;
  id v38 = 0;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v15 = [(CKEffectPickerView *)self effectLabels];
    uint64_t v16 = [v15 objectAtIndex:a4];
    long long v17 = (void *)v34[5];
    v34[5] = v16;

    double v18 = [(CKEffectPickerView *)self effectDescriptiveLabels];
    BOOL v14 = [v18 objectAtIndex:a4];

    BOOL v13 = (void *)v34[5];
  }
  [v13 setHidden:0];
  [v14 setHidden:1];
  [(id)v46[5] setHidden:1];
  [(id)v40[5] setHidden:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke;
  aBlock[3] = &unk_1E562A5A0;
  aBlock[4] = self;
  aBlock[5] = &v33;
  long long v32 = xmmword_18F81D880;
  BOOL v19 = (void (**)(void))_Block_copy(aBlock);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke_2;
  v29[3] = &unk_1E562A5A0;
  v29[4] = self;
  v29[5] = &v45;
  long long v30 = xmmword_18F81D890;
  long long v20 = (void (**)(void))_Block_copy(v29);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke_3;
  v27[3] = &unk_1E562A5C8;
  v27[4] = self;
  v27[5] = &v45;
  v27[6] = &v39;
  v27[7] = a3;
  long long v28 = xmmword_18F81D890;
  uint64_t v21 = (void (**)(void *, uint64_t))_Block_copy(v27);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke_4;
  v25[3] = &unk_1E562A5F0;
  v25[4] = self;
  v25[5] = &v33;
  v25[6] = a4;
  long long v26 = xmmword_18F81D880;
  uint64_t v22 = (void (**)(void *, uint64_t))_Block_copy(v25);
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.25];
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19[2](v19);
    uint64_t v23 = 0;
    uint64_t v24 = v21;
  }
  else if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v20[2](v20);
    if (![(CKEffectPickerView *)self shouldAnimatePreviousLabelForCancel:v34[5]])
    {
      [(id)v34[5] _removeAllAnimations:1];
      goto LABEL_12;
    }
    uint64_t v23 = 0;
    uint64_t v24 = v22;
  }
  else
  {
    uint64_t v23 = 1;
    v21[2](v21, 1);
    uint64_t v24 = v22;
  }
  v24[2](v24, v23);
LABEL_12:
  objc_msgSend(MEMORY[0x1E4F39CF8], "commit", 0x3FD6666660000000, 0x3FF0000000000000);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
}

void __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) effectLabels];
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    uint64_t v5 = *MEMORY[0x1E4F3A498];
    uint64_t v6 = *MEMORY[0x1E4F39FA8];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        if (v8 != *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
        {
          id v9 = objc_alloc_init(MEMORY[0x1E4F39B48]);
          [v9 setBeginTime:CACurrentMediaTime()];
          double v10 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
          [v9 setFromValue:v10];

          uint64_t v11 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
          [v9 setToValue:v11];

          double v12 = [MEMORY[0x1E4F39C10] functionWithName:v5];
          [v9 setTimingFunction:v12];

          [v9 setRemovedOnCompletion:0];
          [v9 setFillMode:v6];
          [v8 addAnimation:v9 forKey:@"opacity"];
        }
        ++v7;
      }
      while (v3 != v7);
      uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
}

void __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) effectLabels];
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    uint64_t v5 = *MEMORY[0x1E4F3A498];
    uint64_t v6 = *MEMORY[0x1E4F39FA8];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        if (v8 != *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
        {
          id v9 = objc_alloc_init(MEMORY[0x1E4F39B48]);
          [v9 setBeginTime:CACurrentMediaTime()];
          double v10 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
          [v9 setFromValue:v10];

          uint64_t v11 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
          [v9 setToValue:v11];

          double v12 = [MEMORY[0x1E4F39C10] functionWithName:v5];
          [v9 setTimingFunction:v12];

          [v9 setRemovedOnCompletion:0];
          [v9 setFillMode:v6];
          [v8 addAnimation:v9 forKey:@"opacity"];
        }
        ++v7;
      }
      while (v3 != v7);
      uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
}

void __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke_3(uint64_t a1, int a2)
{
  id v22 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v22 setBeginTime:CACurrentMediaTime()];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) frame];
  double v5 = v4;
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) layer];
  [v6 anchorPoint];
  double v8 = v7;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) frame];
  double v10 = v5 + v8 * v9;

  uint64_t v11 = [NSNumber numberWithDouble:v10];
  [v22 setFromValue:v11];

  double v12 = NSNumber;
  [*(id *)(a1 + 32) offsetYForLabelAtIndex:*(void *)(a1 + 56) withInitialY:v10];
  BOOL v13 = objc_msgSend(v12, "numberWithDouble:");
  [v22 setToValue:v13];

  uint64_t v14 = *MEMORY[0x1E4F3A498];
  long long v15 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  [v22 setTimingFunction:v15];

  [v22 setRemovedOnCompletion:0];
  uint64_t v16 = *MEMORY[0x1E4F39FA8];
  [v22 setFillMode:*MEMORY[0x1E4F39FA8]];
  long long v17 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) layer];
  [v17 addAnimation:v22 forKey:@"position.y"];

  if (a2)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F39B48]);
    [v18 setBeginTime:CACurrentMediaTime()];
    uint64_t v19 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    [v18 setFromValue:v19];

    long long v20 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
    [v18 setToValue:v20];

    uint64_t v21 = [MEMORY[0x1E4F39C10] functionWithName:v14];
    [v18 setTimingFunction:v21];

    [v18 setFillMode:v16];
    [v18 setRemovedOnCompletion:0];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addAnimation:v18 forKey:@"opacity"];
  }
}

void __75__CKEffectPickerView__animateSelectedEffectLabelAtIndex_fromPreviousIndex___block_invoke_4(uint64_t a1, int a2)
{
  id v22 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v22 setBeginTime:CACurrentMediaTime()];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) frame];
  double v5 = v4;
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) layer];
  [v6 anchorPoint];
  double v8 = v7;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) frame];
  double v10 = v5 + v8 * v9;

  uint64_t v11 = NSNumber;
  [*(id *)(a1 + 32) offsetYForLabelAtIndex:*(void *)(a1 + 48) withInitialY:v10];
  double v12 = objc_msgSend(v11, "numberWithDouble:");
  [v22 setFromValue:v12];

  BOOL v13 = [NSNumber numberWithDouble:v10];
  [v22 setToValue:v13];

  uint64_t v14 = *MEMORY[0x1E4F3A498];
  long long v15 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  [v22 setTimingFunction:v15];

  [v22 setRemovedOnCompletion:1];
  uint64_t v16 = *MEMORY[0x1E4F39FA8];
  [v22 setFillMode:*MEMORY[0x1E4F39FA8]];
  long long v17 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) layer];
  [v17 addAnimation:v22 forKey:@"position.y"];

  if (a2)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F39B48]);
    [v18 setBeginTime:CACurrentMediaTime()];
    uint64_t v19 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
    [v18 setFromValue:v19];

    long long v20 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    [v18 setToValue:v20];

    uint64_t v21 = [MEMORY[0x1E4F39C10] functionWithName:v14];
    [v18 setTimingFunction:v21];

    [v18 setFillMode:v16];
    [v18 setRemovedOnCompletion:0];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addAnimation:v18 forKey:@"opacity"];
  }
}

- (double)offsetYForLabelAtIndex:(int64_t)a3 withInitialY:(double)a4
{
  return 0.0;
}

- (BOOL)shouldAnimatePreviousLabelForCancel:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  double v4 = [(CKEffectPickerView *)self momentIdentifiers];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(CKEffectPickerView *)self momentsCollectionView];
  double v7 = +[CKMomentCollectionViewCell reuseIdentifier];
  double v8 = [v6 dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v5];

  double v9 = [v8 contentView];
  double v10 = [v9 subviews];
  [v10 makeObjectsPerformSelector:sel_removeFromSuperview];

  uint64_t v11 = [(CKEffectPickerView *)self fsem];
  double v12 = [(CKEffectPickerView *)self momentIdentifiers];
  uint64_t v13 = [v5 row];

  uint64_t v14 = [v12 objectAtIndex:v13];
  long long v15 = [v11 effectForIdentifier:v14];

  [v8 setEffect:v15];

  return v8;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = [v6 effect];
  if (v7)
  {
    id v30 = v7;
    [v6 setupEffectIfNeeded];
    double v34 = [(CKEffectPickerView *)self balloonView];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obuint64_t j = [v6 effectViews];
    uint64_t v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v35)
    {
      uint64_t v32 = *(void *)v44;
      id v33 = v6;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v44 != v32) {
            objc_enumerationMutation(obj);
          }
          double v9 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
          double v10 = [v34 superview];
          [v34 center];
          objc_msgSend(v10, "convertPoint:toView:", self);
          objc_msgSend(v9, "setFocusPoint:");

          uint64_t v11 = [v34 superview];
          [v34 frame];
          objc_msgSend(v11, "convertRect:toView:", self);
          objc_msgSend(v9, "setMessageRect:");

          objc_msgSend(v9, "setMessageOrientation:", objc_msgSend(v34, "orientation"));
          double v12 = [(CKEffectPickerView *)self balloonView];
          [v12 center];
          double v14 = v13;
          double v16 = v15;
          id v17 = objc_alloc(MEMORY[0x1E4F42A58]);
          [v12 bounds];
          long long v20 = objc_msgSend(v17, "initWithSize:", v18, v19);
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __72__CKEffectPickerView_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
          v41[3] = &unk_1E5620DE8;
          id v21 = v12;
          id v42 = v21;
          uint64_t v36 = v20;
          id v22 = [v20 imageWithActions:v41];
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          uint64_t v23 = [v6 effectViews];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v47 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v38;
            do
            {
              uint64_t v27 = 0;
              do
              {
                if (*(void *)v38 != v26) {
                  objc_enumerationMutation(v23);
                }
                long long v28 = *(void **)(*((void *)&v37 + 1) + 8 * v27);
                double v29 = [v21 superview];
                objc_msgSend(v29, "convertPoint:toView:", self, v14, v16);
                objc_msgSend(v28, "setFocusPoint:");

                [v28 setMessageImage:v22];
                ++v27;
              }
              while (v25 != v27);
              uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v47 count:16];
            }
            while (v25);
          }

          ++v8;
          id v6 = v33;
        }
        while (v8 != v35);
        uint64_t v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v35);
    }

    [v6 animate];
    [(CKEffectPickerView *)self checkAndUpdateForSpotlightEffect:v6];
    [(CKEffectPickerView *)self addAnimationTimerForCell:v6];

    double v7 = v30;
  }
}

uint64_t __72__CKEffectPickerView_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [*(id *)(a1 + 32) frame];
  double v4 = *(void **)(a1 + 32);

  return objc_msgSend(v4, "drawViewHierarchyInRect:", v2, v3);
}

- (void)checkAndUpdateForSpotlightEffect:(id)a3
{
  id v8 = a3;
  if (UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityDarkerSystemColorsEnabled())
  {
    double v4 = [v8 effect];
    id v5 = [v4 identifier];
    int v6 = [v5 isEqualToString:@"com.apple.messages.effect.CKSpotlightEffect"];

    if (v6)
    {
      [(CKEffectPickerView *)self updateViewColors:1];
      double v7 = [NSNumber numberWithBool:0];
      [(CKEffectPickerView *)self performSelector:sel_updateViewColors_ withObject:v7 afterDelay:4.0];
    }
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  int v6 = [v7 effect];

  if (v6)
  {
    [(CKEffectPickerView *)self removeAnimationTimerForCell:v7];
    [v7 stopAnimation];
  }
}

- (void)addAnimationTimerForCell:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4F1CB00];
  int v6 = [v4 effect];
  [v6 duration];
  double v8 = v7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __47__CKEffectPickerView_addAnimationTimerForCell___block_invoke;
  v18[3] = &unk_1E562A618;
  id v9 = v4;
  id v19 = v9;
  objc_copyWeak(&v20, &location);
  double v10 = [v5 timerWithTimeInterval:1 repeats:v18 block:v8];

  uint64_t v11 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v11 addTimer:v10 forMode:*MEMORY[0x1E4F1C4B0]];

  double v12 = [(CKEffectPickerView *)self animationTimers];
  double v13 = [v9 effect];
  double v14 = [v13 identifier];
  [v12 setObject:v10 forKey:v14];

  double v15 = [(CKEffectPickerView *)self animatedCells];
  double v16 = [v9 effect];
  id v17 = [v16 identifier];
  [v15 setObject:v9 forKey:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __47__CKEffectPickerView_addAnimationTimerForCell___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) animate];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained checkAndUpdateForSpotlightEffect:*(void *)(a1 + 32)];
}

- (void)removeAnimationTimerForCell:(id)a3
{
  id v4 = a3;
  id v5 = [(CKEffectPickerView *)self animationTimers];
  int v6 = [v4 effect];
  double v7 = [v6 identifier];
  id v14 = [v5 objectForKey:v7];

  [v14 invalidate];
  double v8 = [(CKEffectPickerView *)self animationTimers];
  id v9 = [v4 effect];
  double v10 = [v9 identifier];
  [v8 removeObjectForKey:v10];

  uint64_t v11 = [(CKEffectPickerView *)self animatedCells];
  double v12 = [v4 effect];

  double v13 = [v12 identifier];
  [v11 removeObjectForKey:v13];
}

- (void)invalidateAllAnimationTimers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v3 = [(CKEffectPickerView *)self animationTimers];
  id v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v8++) invalidate];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  id v9 = [(CKEffectPickerView *)self animationTimers];
  [v9 removeAllObjects];

  double v10 = [(CKEffectPickerView *)self animatedCells];
  [v10 removeAllObjects];
}

- (void)_setNeedsSwitcherAnimationIfNecessary
{
  if ([(id)objc_opt_class() shouldUseLargeScreenDimension])
  {
    id v21 = [(CKEffectPickerView *)self typeSegmentedControl];
    [v21 frame];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    long long v11 = [(CKEffectPickerView *)self roundedContainerView];
    [v11 frame];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    v23.origin.CGFloat x = v4;
    v23.origin.CGFloat y = v6;
    v23.size.CGFloat width = v8;
    v23.size.CGFloat height = v10;
    double MaxY = CGRectGetMaxY(v23);
    v24.origin.CGFloat x = v13;
    v24.origin.CGFloat y = v15;
    v24.size.CGFloat width = v17;
    v24.size.CGFloat height = v19;
    [(CKEffectPickerView *)self setNeedsSwitcherAnimation:MaxY >= CGRectGetMinY(v24)];
  }
  else
  {
    [(CKEffectPickerView *)self setNeedsSwitcherAnimation:1];
  }
}

- (void)_startSwitcherAnimationIfNecessary
{
  if ([(CKEffectPickerView *)self needsSwitcherAnimation])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __56__CKEffectPickerView__startSwitcherAnimationIfNecessary__block_invoke;
    v4[3] = &unk_1E5620C40;
    v4[4] = self;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56__CKEffectPickerView__startSwitcherAnimationIfNecessary__block_invoke_2;
    v3[3] = &unk_1E5620BF0;
    v3[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v4 options:v3 animations:0.2 completion:0.5];
  }
}

uint64_t __56__CKEffectPickerView__startSwitcherAnimationIfNecessary__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) typeSegmentedControlBottomConstraint];
  [v2 setConstant:20.0];

  double v3 = [*(id *)(a1 + 32) mainLabelBottomConstraint];
  [v3 setConstant:0.0];

  CGFloat v4 = [*(id *)(a1 + 32) typeSegmentedControl];
  [v4 setAlpha:1.0];

  double v5 = [*(id *)(a1 + 32) mainLabel];
  [v5 setAlpha:0.0];

  [*(id *)(a1 + 32) setNeedsLayout];
  CGFloat v6 = *(void **)(a1 + 32);

  return [v6 layoutIfNeeded];
}

uint64_t __56__CKEffectPickerView__startSwitcherAnimationIfNecessary__block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) segmentedBackdrop];
  [v2 setHidden:0];

  double v3 = *(void **)(a1 + 32);

  return [v3 setNeedsSwitcherAnimation:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKEffectPickerView;
  [(CKEffectPickerView *)&v5 traitCollectionDidChange:a3];
  CGFloat v4 = [(CKEffectPickerView *)self traitCollection];
  -[CKEffectPickerView setIsInDarkMode:](self, "setIsInDarkMode:", [v4 userInterfaceStyle] == 2);

  [(CKEffectPickerView *)self updateViewColors];
}

- (void)handleTouchUp:(CGPoint)a3
{
  -[CKEffectPickerView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  CGFloat v4 = [(CKEffectPickerView *)self effectSendButtons];
  int v5 = [v4 containsObject:v6];

  if (v5) {
    [(CKEffectPickerView *)self _touchUpInsideSendButton:v6];
  }
}

- (void)handleTouchMoved:(CGPoint)a3
{
  -[CKEffectPickerView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  CGFloat v4 = [(CKEffectPickerView *)self effectDotButtons];
  int v5 = [v4 containsObject:v9];

  if (v5)
  {
    [(CKEffectPickerView *)self _touchUpInsideDotButton:v9];
  }
  else
  {
    id v6 = [(CKEffectPickerView *)self closeButton];
    if (v9 == v6)
    {
      selectedIndeCGFloat x = self->_selectedIndex;

      CGFloat v8 = v9;
      if (selectedIndex == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_8;
      }
      [(CKEffectPickerView *)self _touchUpInsideCloseButton:v9];
    }
    else
    {
    }
  }
  CGFloat v8 = v9;
LABEL_8:
}

- (void)pageControlChanged:(id)a3
{
  uint64_t v4 = [a3 currentPage];
  id v6 = [(CKEffectPickerView *)self momentsCollectionView];
  int v5 = [MEMORY[0x1E4F28D58] indexPathForItem:v4 inSection:0];
  [v6 scrollToItemAtIndexPath:v5 atScrollPosition:16 animated:1];
}

- (void)updateMomentTitle:(BOOL)a3
{
  BOOL v3 = a3;
  id v36 = [(CKEffectPickerView *)self momentTitleLabel];
  int v5 = [(CKEffectPickerView *)self momentIdentifiers];
  id v6 = [(CKEffectPickerView *)self pageControl];
  double v7 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v6, "currentPage"));

  CGFloat v8 = [(CKEffectPickerView *)self fsem];
  id v9 = [v8 localizedPickerTitleForEffectWithIdentifier:v7];

  [v36 setText:v9];
  [v36 sizeToFit];
  CGFloat v10 = [(CKEffectPickerView *)self balloonView];
  [v10 frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v38.origin.CGFloat x = v12;
  v38.origin.CGFloat y = v14;
  v38.size.CGFloat width = v16;
  v38.size.CGFloat height = v18;
  double MaxX = CGRectGetMaxX(v38);
  [v36 frame];
  double v20 = MaxX - CGRectGetWidth(v39);
  id v21 = +[CKUIBehavior sharedBehaviors];
  [v21 balloonMaskTailSizeForTailShape:2];
  double v23 = v20 - v22;
  v40.origin.CGFloat x = v12;
  v40.origin.CGFloat y = v14;
  v40.size.CGFloat width = v16;
  v40.size.CGFloat height = v18;
  double MinY = CGRectGetMinY(v40);
  [v36 frame];
  double v25 = MinY - CGRectGetHeight(v41) + -4.0;

  [v36 frame];
  objc_msgSend(v36, "setFrame:", v23, v25);
  if (v3)
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F39B48]);
    [v26 setBeginTime:CACurrentMediaTime()];
    uint64_t v27 = [(CKEffectPickerView *)self momentTitleLabel];
    long long v28 = [v27 layer];
    [v28 position];
    double v30 = v29;

    double v31 = [NSNumber numberWithDouble:v30 + 30.0];
    [v26 setFromValue:v31];

    uint64_t v32 = [NSNumber numberWithDouble:v30];
    [v26 setToValue:v32];

    id v33 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
    [v26 setTimingFunction:v33];

    double v34 = [(CKEffectPickerView *)self momentTitleLabel];
    uint64_t v35 = [v34 layer];
    [v35 addAnimation:v26 forKey:@"position.y"];
  }
  [(CKEffectPickerView *)self updateViewColors];
}

- (void)effectTypeDidChange:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  [(CKEffectPickerView *)self _updateBalloonViewPositionAnimated:1];
  [(CKEffectPickerView *)self updateViewColors];
  uint64_t v4 = [(CKEffectPickerView *)self typeSegmentedControl];
  uint64_t v5 = [v4 selectedSegmentIndex];

  if (v5)
  {
    [(CKEffectPickerView *)self _stopBalloonAnimation];
    id v6 = [(CKEffectPickerView *)self roundedContainerView];
    [v6 setHidden:1];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    double v7 = [(CKEffectPickerView *)self effectLabels];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v55 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v54 + 1) + 8 * i) setHidden:1];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v54 objects:v63 count:16];
      }
      while (v9);
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    CGFloat v12 = [(CKEffectPickerView *)self effectDescriptiveLabels];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v62 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v51 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v50 + 1) + 8 * j) setHidden:1];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v62 count:16];
      }
      while (v14);
    }

    [(CKEffectPickerView *)self invalidateAllAnimationTimers];
    double v17 = [(CKEffectPickerView *)self momentsCollectionView];
    [v17 setDelegate:self];

    CGFloat v18 = [(CKEffectPickerView *)self momentsCollectionView];
    [v18 setDataSource:self];

    CGFloat v19 = [(CKEffectPickerView *)self momentsCollectionView];
    [v19 setHidden:0];

    double v20 = [(CKEffectPickerView *)self pageControl];
    [v20 setHidden:0];

    id v21 = [(CKEffectPickerView *)self sendMomentButton];
    [v21 setHidden:0];

    double v22 = [(CKEffectPickerView *)self momentTitleLabel];
    [v22 setHidden:0];

    double v23 = [(CKEffectPickerView *)self accessibilitySendBackgroundView];
    [v23 setHidden:0];

    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      unint64_t v24 = [(NSArray *)self->_momentIdentifiers count];
      double v25 = [(CKEffectPickerView *)self momentsCollectionView];
      [v25 frame];
      double v27 = v26;

      double v28 = v27 * (double)v24;
      double v29 = [(CKEffectPickerView *)self momentsCollectionView];
      [v29 contentOffset];
      double v31 = v30;

      uint64_t v32 = [(CKEffectPickerView *)self momentsCollectionView];
      objc_msgSend(v32, "setContentOffset:", v28, v31);
    }
    id v33 = [(CKEffectPickerView *)self pageControl];
    objc_msgSend(v33, "setCurrentPage:", -[CKEffectPickerView selectedMomentIndex](self, "selectedMomentIndex"));
    goto LABEL_28;
  }
  double v34 = [(CKEffectPickerView *)self roundedContainerView];
  [v34 setHidden:0];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v35 = [(CKEffectPickerView *)self effectLabels];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v59;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v59 != v38) {
          objc_enumerationMutation(v35);
        }
        [*(id *)(*((void *)&v58 + 1) + 8 * k) setHidden:0];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v37);
  }

  CGRect v40 = [(CKEffectPickerView *)self momentsCollectionView];
  [v40 setDelegate:0];

  CGRect v41 = [(CKEffectPickerView *)self momentsCollectionView];
  [v41 setDataSource:0];

  [(CKEffectPickerView *)self invalidateAllAnimationTimers];
  id v42 = [(CKEffectPickerView *)self momentsCollectionView];
  [v42 setHidden:1];

  long long v43 = [(CKEffectPickerView *)self pageControl];
  [v43 setHidden:1];

  long long v44 = [(CKEffectPickerView *)self sendMomentButton];
  [v44 setHidden:1];

  long long v45 = [(CKEffectPickerView *)self momentTitleLabel];
  [v45 setHidden:1];

  unint64_t v46 = [(CKEffectPickerView *)self selectedIndex];
  if (v46 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v47 = v46;
    id v33 = [(CKEffectPickerView *)self effectDotButtons];
    id v48 = [v33 objectAtIndex:v47];
    [(CKEffectPickerView *)self _touchUpInsideDotButton:v48];

LABEL_28:
  }
  uint64_t v49 = [(CKEffectPickerView *)self momentsCollectionView];
  [v49 reloadData];

  [(CKEffectPickerView *)self _updateMomentsBackgroundColor];
  [(CKEffectPickerView *)self updateMomentTitle:1];
}

- (void)_panGesture:(id)a3
{
  id v4 = a3;
  if ([v4 state] != 3)
  {
    [v4 locationInView:self];
    -[CKEffectPickerView handleTouchMoved:](self, "handleTouchMoved:");
  }
}

- (void)cancelImpactSelection
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CKEffectPickerView *)self selectedIndex];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(CKEffectPickerView *)self effectSendButtons];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v8++) setHidden:1];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = [(CKEffectPickerView *)self effectDotButtons];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) setHidden:0];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }

  [(CKEffectPickerView *)self _animateSelectedEffectLabelAtIndex:0x7FFFFFFFFFFFFFFFLL fromPreviousIndex:v3];
  [(CKEffectPickerView *)self resetDotConstraintsToDefault];
  [(CKEffectPickerView *)self _stopBalloonAnimation];
}

- (void)_touchUpInsideSendButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKEffectPickerView *)self effectSendButtons];
  uint64_t v6 = [v5 indexOfObject:v4];

  id v9 = [(CKEffectPickerView *)self delegate];
  uint64_t v7 = [(CKEffectPickerView *)self effectIdentifiers];
  uint64_t v8 = [v7 objectAtIndex:v6];
  [v9 effectSelectedWithIdentifier:v8];
}

- (void)_touchUpInsideSendMomentButton:(id)a3
{
  id v7 = [(CKEffectPickerView *)self delegate];
  id v4 = [(CKEffectPickerView *)self momentIdentifiers];
  uint64_t v5 = [(CKEffectPickerView *)self pageControl];
  uint64_t v6 = objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v5, "currentPage"));
  [v7 effectSelectedWithIdentifier:v6];
}

- (void)_animateInSendButton:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  CGFloat Width = CGRectGetWidth(v20);
  memset(&v19, 0, sizeof(v19));
  CATransform3DMakeScale(&v19, 9.0 / Width, 9.0 / Width, 1.0);
  uint64_t v5 = [v3 layer];
  CATransform3D v18 = v19;
  [v5 setTransform:&v18];

  [MEMORY[0x1E4F39CF8] begin];
  uint64_t v6 = (void *)MEMORY[0x1E4F39CF8];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __43__CKEffectPickerView__animateInSendButton___block_invoke;
  v16[3] = &unk_1E5620C40;
  id v17 = v3;
  id v7 = v3;
  [v6 setCompletionBlock:v16];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.15];
  id v8 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  CATransform3D v18 = v19;
  id v9 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v18];
  [v8 setFromValue:v9];

  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v18.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v18.m33 = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v18.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v18.m43 = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v18.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v18.m13 = v12;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v18.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v18.m23 = v13;
  long long v14 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v18];
  [v8 setToValue:v14];

  [v8 setRemovedOnCompletion:0];
  [v8 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v8 setBeginTime:CACurrentMediaTime()];
  long long v15 = [v7 layer];
  [v15 addAnimation:v8 forKey:@"transform"];

  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __43__CKEffectPickerView__animateInSendButton___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) layer];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v8[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v8[5] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v8[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v8[7] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v8[0] = *MEMORY[0x1E4F39B10];
  v8[1] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v8[3] = v6;
  [v2 setTransform:v8];

  return [*(id *)(a1 + 32) setHidden:0];
}

- (void)_animateOutSendButton:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  CGFloat Width = CGRectGetWidth(v20);
  memset(&v19, 0, sizeof(v19));
  CATransform3DMakeScale(&v19, 9.0 / Width, 9.0 / Width, 1.0);
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.15];
  long long v5 = (void *)MEMORY[0x1E4F39CF8];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  CATransform3D v18 = v19;
  v16[2] = __44__CKEffectPickerView__animateOutSendButton___block_invoke;
  v16[3] = &unk_1E562A640;
  id v17 = v3;
  id v6 = v3;
  [v5 setCompletionBlock:v16];
  id v7 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v15.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v15.m33 = v8;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v15.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v15.m43 = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v15.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v15.m13 = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v15.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v15.m23 = v11;
  long long v12 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v15];
  [v7 setFromValue:v12];

  CATransform3D v15 = v19;
  long long v13 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v15];
  [v7 setToValue:v13];

  [v7 setRemovedOnCompletion:0];
  [v7 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v7 setBeginTime:CACurrentMediaTime()];
  long long v14 = [v6 layer];
  [v14 addAnimation:v7 forKey:@"transform"];

  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __44__CKEffectPickerView__animateOutSendButton___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) layer];
  long long v3 = *(_OWORD *)(a1 + 120);
  v8[4] = *(_OWORD *)(a1 + 104);
  v8[5] = v3;
  long long v4 = *(_OWORD *)(a1 + 152);
  v8[6] = *(_OWORD *)(a1 + 136);
  v8[7] = v4;
  long long v5 = *(_OWORD *)(a1 + 56);
  v8[0] = *(_OWORD *)(a1 + 40);
  v8[1] = v5;
  long long v6 = *(_OWORD *)(a1 + 88);
  v8[2] = *(_OWORD *)(a1 + 72);
  v8[3] = v6;
  [v2 setTransform:v8];

  return [*(id *)(a1 + 32) setHidden:1];
}

- (void)resetDotConstraintsToDefault
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v3 = [(CKEffectPickerView *)self effectDotConstraintsThatChange];
  long long v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              CATransform3D v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
              [(CKEffectPickerView *)self marginBetweenPickerDotButtons];
              [v15 setConstant:-(v16 + 9.0)];
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }
}

- (void)_touchUpInsideDotButton:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(CKEffectPickerView *)self selectedIndex];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v6 = [(CKEffectPickerView *)self effectSendButtons];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * i) setHidden:1];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v8);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v11 = [(CKEffectPickerView *)self effectDotButtons];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * j) setHidden:0];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v52 count:16];
    }
    while (v13);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  double v16 = [(CKEffectPickerView *)self effectLabels];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * k) setHidden:0];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v51 count:16];
    }
    while (v18);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v21 = [(CKEffectPickerView *)self effectDescriptiveLabels];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v50 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v35;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * m) setHidden:1];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v50 count:16];
    }
    while (v23);
  }

  double v26 = [(CKEffectPickerView *)self effectDotButtons];
  uint64_t v27 = [v26 indexOfObject:v4];

  double v28 = [(CKEffectPickerView *)self effectSendButtons];
  double v29 = [v28 objectAtIndex:v27];

  [(CKEffectPickerView *)self _animateInSendButton:v29];
  [(CKEffectPickerView *)self _animateSelectedEffectLabelAtIndex:v27 fromPreviousIndex:v5];
  [(CKEffectPickerView *)self setSelectedIndex:v27];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && v5 != v27)
  {
    double v30 = [(CKEffectPickerView *)self effectSendButtons];
    double v31 = [v30 objectAtIndex:v5];

    [v31 setHidden:0];
    [(CKEffectPickerView *)self _animateOutSendButton:v31];
  }
  [v4 setHidden:1];
  [(CKEffectPickerView *)self _updateBalloonViewPositionAnimated:1];
  uint64_t v32 = [(CKEffectPickerView *)self effectIdentifiers];
  id v33 = [v32 objectAtIndex:v27];
  [(CKEffectPickerView *)self startAnimationPreviewForIdentifier:v33];
}

- (void)startAnimationPreviewForIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(CKEffectPickerView *)self balloonView];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = objc_msgSend(v5, "subviews", 0);
  id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (v5)
  {
    objc_msgSend(v5, "setInvisibleInkEffectEnabled:", objc_msgSend(v4, "isEqualToString:", @"com.apple.MobileSMS.expressivesend.invisibleink"));
    [v5 prepareForDisplayIfNeeded];
    uint64_t v11 = [(CKEffectPickerView *)self _defaultSendAnimationContextForAnimationPreview];
    long long v21 = v5;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v11 setThrowBalloonViews:v12];

    uint64_t v13 = v7;
    if (!v7)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
    }
    long long v20 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [v11 setAnimatableTextViews:v14];

    if (!v7) {
    [v11 setImpactIdentifier:v4];
    }
    CATransform3D v15 = [(CKEffectPickerView *)self dummyAnimator];
    [v15 beginAnimationWithSendAnimationContext:v11];
  }
}

- (void)_applicationDidEnterBackground
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v3 = [(CKEffectPickerView *)self fsem];
  id v4 = [v3 effectIdentifiers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        id v10 = [(CKEffectPickerView *)self animationTimers];
        uint64_t v11 = [v10 objectForKey:v9];

        if (v11)
        {
          uint64_t v12 = [(CKEffectPickerView *)self animatedCells];
          uint64_t v13 = [v12 objectForKey:v9];

          [(CKEffectPickerView *)self removeAnimationTimerForCell:v13];
          uint64_t v14 = [(CKEffectPickerView *)self pausedAnimatedCells];
          [v14 setObject:v13 forKey:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)_applicationWillEnterForeground
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v3 = [(CKEffectPickerView *)self pausedAnimatedCells];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        id v10 = [(CKEffectPickerView *)self pausedAnimatedCells];
        uint64_t v11 = [v10 objectForKey:v9];

        [v11 animate];
        [(CKEffectPickerView *)self addAnimationTimerForCell:v11];
        uint64_t v12 = [(CKEffectPickerView *)self pausedAnimatedCells];
        [v12 removeObjectForKey:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (id)_defaultSendAnimationContextForAnimationPreview
{
  double v2 = objc_alloc_init(CKSendAnimationContext);
  [(CKSendAnimationContext *)v2 setIsSender:1];
  [(CKSendAnimationContext *)v2 setShouldRepeat:0];

  return v2;
}

- (void)_accessibilityContrastStatusDidChange
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  if (UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityDarkerSystemColorsEnabled())
  {
    long long v3 = [(CKEffectPickerView *)self pageControl];
    id v4 = [v3 layer];
    [v4 setFilters:0];

    uint64_t v5 = [(CKEffectPickerView *)self mainLabel];
    uint64_t v6 = [v5 layer];
    [v6 setFilters:0];

    uint64_t v7 = [(CKEffectPickerView *)self momentTitleLabel];
    uint64_t v8 = [v7 layer];
    [v8 setFilters:0];

    uint64_t v9 = [(CKEffectPickerView *)self closeButton];
    id v10 = [v9 layer];
    [v10 setFilters:0];

    uint64_t v11 = [(CKEffectPickerView *)self typeSegmentedControl];
    uint64_t v12 = [v11 layer];
    [v12 setFilters:0];

    long long v13 = [(CKEffectPickerView *)self roundedView];
    long long v14 = [v13 layer];
    [v14 setCompositingFilter:0];

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v15 = [(CKEffectPickerView *)self effectLabels];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v88 objects:v101 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v89;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v89 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [*(id *)(*((void *)&v88 + 1) + 8 * i) layer];
          [v20 setFilters:0];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v88 objects:v101 count:16];
      }
      while (v17);
    }

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v21 = [(CKEffectPickerView *)self effectDescriptiveLabels];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v84 objects:v100 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v85;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v85 != v24) {
            objc_enumerationMutation(v21);
          }
          double v26 = [*(id *)(*((void *)&v84 + 1) + 8 * j) layer];
          [v26 setFilters:0];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v84 objects:v100 count:16];
      }
      while (v23);
    }

    uint64_t v27 = [(CKEffectPickerView *)self accessibilityBackdropView];

    if (!v27)
    {
      id v28 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      double v29 = +[CKUIBehavior sharedBehaviors];
      double v30 = [v29 theme];
      double v31 = [v30 fsmPickerBackgroundColor];
      [v28 setBackgroundColor:v31];

      [(CKEffectPickerView *)self setAccessibilityBackdropView:v28];
      uint64_t v32 = [(CKEffectPickerView *)self accessibilityBackdropView];
      id v33 = [(CKEffectPickerView *)self peekContainer];
      [(CKEffectPickerView *)self insertSubview:v32 belowSubview:v33];
    }
    long long v34 = [(CKEffectPickerView *)self accessibilityCloseBackgroundView];

    if (!v34)
    {
      id v35 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      long long v36 = +[CKUIBehavior sharedBehaviors];
      long long v37 = [v36 theme];
      long long v38 = [v37 fsmPickerSecondaryColor];
      [v35 setBackgroundColor:v38];

      [(CKEffectPickerView *)self setAccessibilityCloseBackgroundView:v35];
      long long v39 = [(CKEffectPickerView *)self peekContainer];
      long long v40 = [(CKEffectPickerView *)self accessibilityCloseBackgroundView];
      long long v41 = [(CKEffectPickerView *)self closeButton];
      [v39 insertSubview:v40 belowSubview:v41];
    }
    long long v42 = [(CKEffectPickerView *)self accessibilitySendBackgroundView];

    if (!v42)
    {
      id v43 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      long long v44 = +[CKUIBehavior sharedBehaviors];
      long long v45 = [v44 theme];
      long long v46 = [v45 fsmPickerBackgroundColor];
      [v43 setBackgroundColor:v46];

      [(CKEffectPickerView *)self setAccessibilitySendBackgroundView:v43];
      long long v47 = [(CKEffectPickerView *)self peekContainer];
      long long v48 = [(CKEffectPickerView *)self accessibilitySendBackgroundView];
      long long v49 = [(CKEffectPickerView *)self sendMomentButton];
      [v47 insertSubview:v48 belowSubview:v49];
    }
    long long v50 = [(CKEffectPickerView *)self accessibilityBackdropView];
    [v50 setHidden:0];

    long long v51 = [(CKEffectPickerView *)self accessibilitySendBackgroundView];
    [v51 setHidden:0];

    long long v52 = [(CKEffectPickerView *)self accessibilityCloseBackgroundView];
    [v52 setHidden:0];

    long long v53 = [(CKEffectPickerView *)self backdrop];
    [v53 setHidden:1];

    uint64_t v54 = [(CKEffectPickerView *)self blueContrastLayer];
    [v54 setHidden:1];
  }
  else
  {
    long long v55 = [(CKEffectPickerView *)self blueContrastLayer];
    [v55 setHidden:0];

    long long v56 = [(CKEffectPickerView *)self backdrop];
    [v56 setHidden:0];

    long long v57 = [(CKEffectPickerView *)self accessibilityBackdropView];
    [v57 setHidden:1];

    long long v58 = [(CKEffectPickerView *)self accessibilitySendBackgroundView];
    [v58 setHidden:1];

    long long v59 = [(CKEffectPickerView *)self accessibilityCloseBackgroundView];
    [v59 setHidden:1];

    long long v60 = [(CKEffectPickerView *)self pageControl];
    long long v61 = [v60 layer];
    setUpVibrancyForLayer(v61, 0, 0, [(CKEffectPickerView *)self isInDarkMode]);

    uint64_t v62 = [(CKEffectPickerView *)self mainLabel];
    double v63 = [v62 layer];
    setUpVibrancyForLayer(v63, 0, ![(CKEffectPickerView *)self isInDarkMode], [(CKEffectPickerView *)self isInDarkMode]);

    double v64 = [(CKEffectPickerView *)self momentTitleLabel];
    uint64_t v65 = [v64 layer];
    setUpVibrancyForLayer(v65, 0, ![(CKEffectPickerView *)self isInDarkMode], [(CKEffectPickerView *)self isInDarkMode]);

    double v66 = [(CKEffectPickerView *)self closeButton];
    id v67 = [v66 layer];
    setUpVibrancyForLayer(v67, 0, ![(CKEffectPickerView *)self isInDarkMode], [(CKEffectPickerView *)self isInDarkMode]);

    uint64_t v68 = [(CKEffectPickerView *)self typeSegmentedControl];
    long long v69 = [v68 layer];
    setUpVibrancyForLayer(v69, 0, ![(CKEffectPickerView *)self isInDarkMode], [(CKEffectPickerView *)self isInDarkMode]);

    id v70 = [(CKEffectPickerView *)self roundedView];
    id v71 = [v70 layer];
    id v72 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    [v71 setCompositingFilter:v72];

    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    uint64_t v73 = [(CKEffectPickerView *)self effectLabels];
    uint64_t v74 = [v73 countByEnumeratingWithState:&v96 objects:v103 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v97;
      do
      {
        for (uint64_t k = 0; k != v75; ++k)
        {
          if (*(void *)v97 != v76) {
            objc_enumerationMutation(v73);
          }
          id v78 = [*(id *)(*((void *)&v96 + 1) + 8 * k) layer];
          setUpVibrancyForLayer(v78, 0, ![(CKEffectPickerView *)self isInDarkMode], [(CKEffectPickerView *)self isInDarkMode]);
        }
        uint64_t v75 = [v73 countByEnumeratingWithState:&v96 objects:v103 count:16];
      }
      while (v75);
    }

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    uint64_t v54 = [(CKEffectPickerView *)self effectDescriptiveLabels];
    uint64_t v79 = [v54 countByEnumeratingWithState:&v92 objects:v102 count:16];
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v93;
      do
      {
        for (uint64_t m = 0; m != v80; ++m)
        {
          if (*(void *)v93 != v81) {
            objc_enumerationMutation(v54);
          }
          id v83 = [*(id *)(*((void *)&v92 + 1) + 8 * m) layer];
          setUpVibrancyForLayer(v83, 0, ![(CKEffectPickerView *)self isInDarkMode], [(CKEffectPickerView *)self isInDarkMode]);
        }
        uint64_t v80 = [v54 countByEnumeratingWithState:&v92 objects:v102 count:16];
      }
      while (v80);
    }
  }

  [(CKEffectPickerView *)self updateViewColors];
  [(CKEffectPickerView *)self setNeedsLayout];
}

- (CKEffectPickerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKEffectPickerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)hintContainer
{
  return self->_hintContainer;
}

- (void)setHintContainer:(id)a3
{
}

- (UIView)peekContainer
{
  return self->_peekContainer;
}

- (void)setPeekContainer:(id)a3
{
}

- (CABackdropLayer)backdrop
{
  return self->_backdrop;
}

- (void)setBackdrop:(id)a3
{
}

- (CALayer)blueContrastLayer
{
  return self->_blueContrastLayer;
}

- (void)setBlueContrastLayer:(id)a3
{
}

- (CKFullScreenEffectManager)fsem
{
  return self->_fsem;
}

- (void)setFsem:(id)a3
{
}

- (NSArray)momentIdentifiers
{
  return self->_momentIdentifiers;
}

- (void)setMomentIdentifiers:(id)a3
{
}

- (NSMutableDictionary)animationTimers
{
  return self->_animationTimers;
}

- (void)setAnimationTimers:(id)a3
{
}

- (NSMutableDictionary)animatedCells
{
  return self->_animatedCells;
}

- (void)setAnimatedCells:(id)a3
{
}

- (NSMutableDictionary)pausedAnimatedCells
{
  return self->_pausedAnimatedCells;
}

- (void)setPausedAnimatedCells:(id)a3
{
}

- (char)controlColor
{
  return self->_controlColor;
}

- (void)setControlColor:(char)a3
{
  self->_controlColor = a3;
}

- (void)setEffectLabelFont:(id)a3
{
}

- (UICollectionView)momentsCollectionView
{
  return self->_momentsCollectionView;
}

- (void)setMomentsCollectionView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)roundedView
{
  return self->_roundedView;
}

- (void)setRoundedView:(id)a3
{
}

- (NSLayoutConstraint)typeSegmentedControlBottomConstraint
{
  return self->_typeSegmentedControlBottomConstraint;
}

- (void)setTypeSegmentedControlBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)mainLabelBottomConstraint
{
  return self->_mainLabelBottomConstraint;
}

- (void)setMainLabelBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)lastEffectDotTopConstraint
{
  return self->_lastEffectDotTopConstraint;
}

- (void)setLastEffectDotTopConstraint:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (CKChatControllerDummyAnimator)dummyAnimator
{
  return self->_dummyAnimator;
}

- (void)setDummyAnimator:(id)a3
{
}

- (BOOL)needsSwitcherAnimation
{
  return self->_needsSwitcherAnimation;
}

- (void)setNeedsSwitcherAnimation:(BOOL)a3
{
  self->_needsSwitcherAnimation = a3;
}

- (BOOL)isInDarkMode
{
  return self->_isInDarkMode;
}

- (void)setIsInDarkMode:(BOOL)a3
{
  self->_isInDarkMode = a3;
}

- (UIView)hintBlackText
{
  return self->_hintBlackText;
}

- (void)setHintBlackText:(id)a3
{
}

- (UIView)hintSendButton
{
  return self->_hintSendButton;
}

- (void)setHintSendButton:(id)a3
{
}

- (CGPoint)balloonViewOrigin
{
  double x = self->_balloonViewOrigin.x;
  double y = self->_balloonViewOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBalloonViewOrigin:(CGPoint)a3
{
  self->_balloonViewOrigin = a3;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (BOOL)usesDarkVibrancyForLayers
{
  return self->_usesDarkVibrancyForLayers;
}

- (void)setUsesDarkVibrancyForLayers:(BOOL)a3
{
  self->_usesDarkVibrancyForLayers = a3;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (UIView)roundedContainerView
{
  return self->_roundedContainerView;
}

- (void)setRoundedContainerView:(id)a3
{
}

- (CKBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
}

- (NSMutableArray)effectLabels
{
  return self->_effectLabels;
}

- (void)setEffectLabels:(id)a3
{
}

- (NSMutableDictionary)effectDotConstraintsThatChange
{
  return self->_effectDotConstraintsThatChange;
}

- (void)setEffectDotConstraintsThatChange:(id)a3
{
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  self->_selectedIndedouble x = a3;
}

- (NSMutableArray)effectDotButtons
{
  return self->_effectDotButtons;
}

- (void)setEffectDotButtons:(id)a3
{
}

- (NSMutableArray)effectDescriptiveLabels
{
  return self->_effectDescriptiveLabels;
}

- (void)setEffectDescriptiveLabels:(id)a3
{
}

- (NSMutableArray)effectSendButtons
{
  return self->_effectSendButtons;
}

- (void)setEffectSendButtons:(id)a3
{
}

- (UIButton)sendMomentButton
{
  return self->_sendMomentButton;
}

- (void)setSendMomentButton:(id)a3
{
}

- (UISegmentedControl)typeSegmentedControl
{
  return self->_typeSegmentedControl;
}

- (void)setTypeSegmentedControl:(id)a3
{
}

- (NSLayoutConstraint)roundedContainerViewTopConstraint
{
  return self->_roundedContainerViewTopConstraint;
}

- (void)setRoundedContainerViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)closeButtonBottomConstraint
{
  return self->_closeButtonBottomConstraint;
}

- (void)setCloseButtonBottomConstraint:(id)a3
{
}

- (NSMutableArray)effectIdentifiers
{
  return self->_effectIdentifiers;
}

- (void)setEffectIdentifiers:(id)a3
{
}

- (CABackdropLayer)segmentedBackdrop
{
  return self->_segmentedBackdrop;
}

- (void)setSegmentedBackdrop:(id)a3
{
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (void)setMainLabel:(id)a3
{
}

- (UILabel)momentTitleLabel
{
  return self->_momentTitleLabel;
}

- (void)setMomentTitleLabel:(id)a3
{
}

- (UIView)accessibilityBackdropView
{
  return self->_accessibilityBackdropView;
}

- (void)setAccessibilityBackdropView:(id)a3
{
}

- (UIView)accessibilityCloseBackgroundView
{
  return self->_accessibilityCloseBackgroundView;
}

- (void)setAccessibilityCloseBackgroundView:(id)a3
{
}

- (UIView)accessibilitySendBackgroundView
{
  return self->_accessibilitySendBackgroundView;
}

- (void)setAccessibilitySendBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilitySendBackgroundView, 0);
  objc_storeStrong((id *)&self->_accessibilityCloseBackgroundView, 0);
  objc_storeStrong((id *)&self->_accessibilityBackdropView, 0);
  objc_storeStrong((id *)&self->_momentTitleLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_segmentedBackdrop, 0);
  objc_storeStrong((id *)&self->_effectIdentifiers, 0);
  objc_storeStrong((id *)&self->_closeButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_roundedContainerViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_typeSegmentedControl, 0);
  objc_storeStrong((id *)&self->_sendMomentButton, 0);
  objc_storeStrong((id *)&self->_effectSendButtons, 0);
  objc_storeStrong((id *)&self->_effectDescriptiveLabels, 0);
  objc_storeStrong((id *)&self->_effectDotButtons, 0);
  objc_storeStrong((id *)&self->_effectDotConstraintsThatChange, 0);
  objc_storeStrong((id *)&self->_effectLabels, 0);
  objc_storeStrong((id *)&self->_balloonView, 0);
  objc_storeStrong((id *)&self->_roundedContainerView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_hintSendButton, 0);
  objc_storeStrong((id *)&self->_hintBlackText, 0);
  objc_storeStrong((id *)&self->_dummyAnimator, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_lastEffectDotTopConstraint, 0);
  objc_storeStrong((id *)&self->_mainLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_typeSegmentedControlBottomConstraint, 0);
  objc_storeStrong((id *)&self->_roundedView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_momentsCollectionView, 0);
  objc_storeStrong((id *)&self->_effectLabelFont, 0);
  objc_storeStrong((id *)&self->_pausedAnimatedCells, 0);
  objc_storeStrong((id *)&self->_animatedCells, 0);
  objc_storeStrong((id *)&self->_animationTimers, 0);
  objc_storeStrong((id *)&self->_momentIdentifiers, 0);
  objc_storeStrong((id *)&self->_fsem, 0);
  objc_storeStrong((id *)&self->_blueContrastLayer, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
  objc_storeStrong((id *)&self->_peekContainer, 0);
  objc_storeStrong((id *)&self->_hintContainer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end