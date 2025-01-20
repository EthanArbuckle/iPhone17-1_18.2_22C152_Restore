@interface CSCoverSheetAppearanceResolver
- (BOOL)contentTransitionIsAtCoverSheetLevel;
- (BOOL)hasContentAboveCoverSheet;
- (BOOL)isTransitioning;
- (CGRect)bounds;
- (CSAppearance)desiredAppearance;
- (CSAppearance)modalAppearance;
- (CSAppearance)oldAppearance;
- (CSAppearance)targetAppearance;
- (CSBehavior)activeBehavior;
- (CSCoverSheetAppearanceResolver)init;
- (CSCoverSheetViewTransitionSource)currentTransitionSource;
- (CSLegibilityProviding)legibilityProvider;
- (NSArray)whitePointValues;
- (_UILegibilitySettings)discreteLegibilitySettings;
- (double)_alphaForTransitionFromHidden:(int)a3 toHidden:(void *)a4 timingFunction:;
- (double)_alphaForTransitionFromHidden:(uint64_t)a3 toHidden:(int)a4 unhiddenAlpha:(void *)a5 timingFunction:;
- (double)_dateViewAlphaForCurrentWakeState;
- (double)_finalizeOffset:(double)a3 referenceFrame:(CGFloat)a4;
- (double)_offsetForTransitionFromOffset:(double)a3 toOffset:(double)a4 timingFunction:(double)a5;
- (double)_scaleForTransitionFromScale:(double)a3 toScale:(double)a4 timingFunction:;
- (double)_valueForTransitionInterval:(void *)a3 timingFunction:;
- (double)appearanceFraction;
- (double)fraction;
- (id)_resolveBackgroundComponent;
- (id)_resolveBackgroundContentComponent;
- (id)_resolveComplicationContainerComponent;
- (id)_resolveComplicationSidebarComponent;
- (id)_resolveComponentWithType:(int64_t)a3;
- (id)_resolveContentComponent;
- (id)_resolveControlCenterGrabberComponent;
- (id)_resolveDateViewComponent;
- (id)_resolveDimmingLayerComponent;
- (id)_resolveFooterCallToActionLabelComponentWithHomeAffordance:(id)a3;
- (id)_resolveFullBleedContentComponent;
- (id)_resolveHomeAffordanceComponent;
- (id)_resolveLegibilitySettings;
- (id)_resolveModalContentComponent;
- (id)_resolvePageContentComponent;
- (id)_resolvePoseidonComponent;
- (id)_resolveProudLockComponent;
- (id)_resolveQuickActionsComponent;
- (id)_resolveRemoteInlineContentComponent;
- (id)_resolveSlideableContentComponent;
- (id)_resolveStatusBarBackgroundComponent;
- (id)_resolveStatusBarComponent;
- (id)_resolveStatusBarGradientComponent;
- (id)_resolveTintingComponent;
- (id)_resolveWallpaperComponent;
- (id)_resolveWallpaperFloatingLayerComponent;
- (id)_resolveWhitePointComponent;
- (id)newActiveAppearanceGivenDesiredAppearance:(id)a3 oldAppearance:(id)a4 activeAppearance:(id)a5 activeBehavior:(id)a6 startIndex:(unint64_t)a7 targetIndex:(unint64_t)a8 indexOfMainPage:(unint64_t)a9 targetAppearance:(id)a10 modalAppearance:(id)a11 currentTransitionSource:(id)a12 contentTransitionIsAtCoverSheetLevel:(BOOL)a13 legibilityProvider:(id)a14 bounds:(CGRect)a15 whitePointValues:(id)a16 hasContentAboveCoverSheet:(BOOL)a17;
- (uint64_t)_levelForTransitionFromLevel:(uint64_t)a3 toLevel:;
- (unint64_t)indexOfMainPage;
- (unint64_t)startIndex;
- (unint64_t)targetIndex;
- (void)setActiveBehavior:(id)a3;
- (void)setAppearanceFraction:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentTransitionIsAtCoverSheetLevel:(BOOL)a3;
- (void)setCurrentTransitionSource:(id)a3;
- (void)setDesiredAppearance:(id)a3;
- (void)setDiscreteLegibilitySettings:(id)a3;
- (void)setFraction:(double)a3;
- (void)setHasContentAboveCoverSheet:(BOOL)a3;
- (void)setIndexOfMainPage:(unint64_t)a3;
- (void)setInteractiveAnimationCalculatorPercentComplete:(double)a3;
- (void)setIsTransitioning:(BOOL)a3;
- (void)setLegibilityProvider:(id)a3;
- (void)setModalAppearance:(id)a3;
- (void)setOldAppearance:(id)a3;
- (void)setStartIndex:(unint64_t)a3;
- (void)setTargetAppearance:(id)a3;
- (void)setTargetIndex:(unint64_t)a3;
- (void)setWhitePointValues:(id)a3;
@end

@implementation CSCoverSheetAppearanceResolver

- (CSCoverSheetAppearanceResolver)init
{
  v27.receiver = self;
  v27.super_class = (Class)CSCoverSheetAppearanceResolver;
  v2 = [(CSCoverSheetAppearanceResolver *)&v27 init];
  if (v2)
  {
    v3 = (SBFSteppedAnimationTimingFunctionCalculator *)objc_alloc_init(MEMORY[0x1E4FA6000]);
    interactiveAnimationCalculator = v2->_interactiveAnimationCalculator;
    v2->_interactiveAnimationCalculator = v3;

    v5 = v2->_interactiveAnimationCalculator;
    v6 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
    [(SBFSteppedAnimationTimingFunctionCalculator *)v5 addTimingFunction:v6 withName:@"backgroundStyle"];

    v7 = v2->_interactiveAnimationCalculator;
    uint64_t v8 = *MEMORY[0x1E4F3A480];
    v9 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    [(SBFSteppedAnimationTimingFunctionCalculator *)v7 addTimingFunction:v9 withName:@"dateViewAlpha"];

    v10 = v2->_interactiveAnimationCalculator;
    v11 = [MEMORY[0x1E4F39C10] functionWithName:v8];
    [(SBFSteppedAnimationTimingFunctionCalculator *)v10 addTimingFunction:v11 withName:@"statusBarAlpha"];

    v12 = v2->_interactiveAnimationCalculator;
    v13 = [MEMORY[0x1E4F39C10] functionWithName:v8];
    [(SBFSteppedAnimationTimingFunctionCalculator *)v12 addTimingFunction:v13 withName:@"fixedFooterAlpha"];

    v14 = v2->_interactiveAnimationCalculator;
    v15 = [MEMORY[0x1E4F39C10] functionWithName:v8];
    [(SBFSteppedAnimationTimingFunctionCalculator *)v14 addTimingFunction:v15 withName:@"pageContentAlpha"];

    v16 = v2->_interactiveAnimationCalculator;
    v17 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    [(SBFSteppedAnimationTimingFunctionCalculator *)v16 addTimingFunction:v17 withName:@"proudLockAlpha"];

    v18 = v2->_interactiveAnimationCalculator;
    v19 = [MEMORY[0x1E4F39C10] functionWithName:v8];
    [(SBFSteppedAnimationTimingFunctionCalculator *)v18 addTimingFunction:v19 withName:@"legibilitySettings"];

    v20 = v2->_interactiveAnimationCalculator;
    v21 = [MEMORY[0x1E4F39C10] functionWithName:v8];
    [(SBFSteppedAnimationTimingFunctionCalculator *)v20 addTimingFunction:v21 withName:@"homeAffordance"];

    v22 = v2->_interactiveAnimationCalculator;
    v23 = [MEMORY[0x1E4F39C10] functionWithName:v8];
    [(SBFSteppedAnimationTimingFunctionCalculator *)v22 addTimingFunction:v23 withName:@"controlCenterGrabber"];

    v24 = v2->_interactiveAnimationCalculator;
    v25 = [MEMORY[0x1E4F39C10] functionWithName:v8];
    [(SBFSteppedAnimationTimingFunctionCalculator *)v24 addTimingFunction:v25 withName:@"complicationContainer"];
  }
  return v2;
}

- (id)newActiveAppearanceGivenDesiredAppearance:(id)a3 oldAppearance:(id)a4 activeAppearance:(id)a5 activeBehavior:(id)a6 startIndex:(unint64_t)a7 targetIndex:(unint64_t)a8 indexOfMainPage:(unint64_t)a9 targetAppearance:(id)a10 modalAppearance:(id)a11 currentTransitionSource:(id)a12 contentTransitionIsAtCoverSheetLevel:(BOOL)a13 legibilityProvider:(id)a14 bounds:(CGRect)a15 whitePointValues:(id)a16 hasContentAboveCoverSheet:(BOOL)a17
{
  CGFloat height = a15.size.height;
  CGFloat width = a15.size.width;
  CGFloat y = a15.origin.y;
  CGFloat x = a15.origin.x;
  id v73 = a3;
  id v72 = a4;
  id v26 = a5;
  objc_super v27 = (CSBehavior *)a6;
  id v71 = a10;
  id v70 = a11;
  id v69 = a12;
  id v68 = a14;
  objc_storeStrong((id *)&self->_desiredAppearance, a3);
  v28 = v27;
  id v29 = a16;
  objc_storeStrong((id *)&self->_oldAppearance, a4);
  self->_activeBehavior = v27;
  self->_startIndeCGFloat x = a7;
  self->_targetIndeCGFloat x = a8;
  self->_indexOfMainPage = a9;
  objc_storeStrong((id *)&self->_targetAppearance, a10);
  objc_storeStrong((id *)&self->_modalAppearance, a11);
  p_currentTransitionSource = &self->_currentTransitionSource;
  objc_storeStrong((id *)&self->_currentTransitionSource, a12);
  self->_contentTransitionIsAtCoverSheetLevel = a13;
  objc_storeStrong((id *)&self->_legibilityProvider, a14);
  self->_bounds.origin.CGFloat x = x;
  self->_bounds.origin.CGFloat y = y;
  self->_bounds.size.CGFloat width = width;
  self->_bounds.size.CGFloat height = height;
  v31 = (NSArray *)[v29 copy];

  whitePointValues = self->_whitePointValues;
  self->_whitePointValues = v31;

  self->_hasContentAboveCoverSheet = a17;
  self->_fraction = 1.0;
  char v33 = [(CSCoverSheetViewTransitionSource *)self->_currentTransitionSource isTransitioning];
  self->_isTransitioning = v33;
  if (v33)
  {
    if (*p_currentTransitionSource) {
      [(CSCoverSheetViewTransitionSource *)*p_currentTransitionSource transitionContext];
    }
    BSIntervalFractionForValue();
    self->_fraction = v34;
  }
  BSIntervalClip();
  self->_appearanceFraction = v35;
  -[SBFSteppedAnimationTimingFunctionCalculator setPercentComplete:](self->_interactiveAnimationCalculator, "setPercentComplete:");
  v36 = [(CSCoverSheetAppearanceResolver *)self _resolveLegibilitySettings];
  [v26 setLegibilitySettings:v36];

  v37 = [(CSCoverSheetAppearanceResolver *)self _resolveBackgroundComponent];
  [v26 addComponent:v37];

  v38 = [(CSCoverSheetAppearanceResolver *)self _resolveDateViewComponent];
  [v26 addComponent:v38];

  v39 = -[CSCoverSheetAppearanceResolver _resolveComplicationContainerComponent]((uint64_t)self);
  [v26 addComponent:v39];

  v40 = -[CSCoverSheetAppearanceResolver _resolveRemoteInlineContentComponent]((uint64_t)self);
  [v26 addComponent:v40];

  v41 = [(CSCoverSheetAppearanceResolver *)self _resolveStatusBarBackgroundComponent];
  [v26 addComponent:v41];

  v42 = [(CSCoverSheetAppearanceResolver *)self _resolveStatusBarComponent];
  [v26 addComponent:v42];

  v43 = [(CSCoverSheetAppearanceResolver *)self _resolvePageContentComponent];
  [v26 addComponent:v43];

  v44 = [(CSCoverSheetAppearanceResolver *)self _resolveProudLockComponent];
  [v26 addComponent:v44];

  v45 = [(CSCoverSheetAppearanceResolver *)self _resolveHomeAffordanceComponent];
  [v26 addComponent:v45];

  v46 = [(CSCoverSheetAppearanceResolver *)self _resolveComponentWithType:3];
  [v26 addComponent:v46];

  v47 = [(CSCoverSheetAppearanceResolver *)self _resolveComponentWithType:10];
  [v26 addComponent:v47];

  v48 = [v26 componentForType:12 identifier:@"(active)"];
  v49 = [(CSCoverSheetAppearanceResolver *)self _resolveFooterCallToActionLabelComponentWithHomeAffordance:v48];
  [v26 addComponent:v49];

  v50 = [(CSCoverSheetAppearanceResolver *)self _resolveControlCenterGrabberComponent];
  [v26 addComponent:v50];

  v51 = [(CSCoverSheetAppearanceResolver *)self _resolveQuickActionsComponent];
  [v26 addComponent:v51];

  v52 = [(CSCoverSheetAppearanceResolver *)self _resolveSlideableContentComponent];
  [v26 addComponent:v52];

  v53 = -[CSCoverSheetAppearanceResolver _resolveWallpaperComponent]((uint64_t)self);
  [v26 addComponent:v53];

  v54 = [(CSCoverSheetAppearanceResolver *)self _resolveTintingComponent];
  [v26 addComponent:v54];

  v55 = [(CSCoverSheetAppearanceResolver *)self _resolveContentComponent];
  [v26 addComponent:v55];

  v56 = -[CSCoverSheetAppearanceResolver _resolveModalContentComponent]((uint64_t)self);
  [v26 addComponent:v56];

  v57 = [(CSCoverSheetAppearanceResolver *)self _resolveStatusBarGradientComponent];
  [v26 addComponent:v57];

  v58 = [(CSCoverSheetAppearanceResolver *)self _resolvePoseidonComponent];
  [v26 addComponent:v58];

  v59 = [(CSCoverSheetAppearanceResolver *)self _resolveWhitePointComponent];
  [v26 addComponent:v59];

  v60 = -[CSCoverSheetAppearanceResolver _resolveWallpaperFloatingLayerComponent]((uint64_t)self);
  [v26 addComponent:v60];

  v61 = -[CSCoverSheetAppearanceResolver _resolveBackgroundContentComponent]((uint64_t)self);
  [v26 addComponent:v61];

  v62 = -[CSCoverSheetAppearanceResolver _resolveComplicationSidebarComponent]((uint64_t)self);
  [v26 addComponent:v62];

  v63 = -[CSCoverSheetAppearanceResolver _resolveFullBleedContentComponent]((uint64_t)self);
  [v26 addComponent:v63];

  v64 = -[CSCoverSheetAppearanceResolver _resolveDimmingLayerComponent]((uint64_t)self);
  [v26 addComponent:v64];

  return v26;
}

- (id)_resolveComplicationContainerComponent
{
  if (a1)
  {
    v2 = objc_opt_new();
    v3 = [v2 priority:100];

    v4 = [*(id *)(a1 + 56) componentForType:20 identifier:@"(active)"];
    v5 = [*(id *)(a1 + 48) componentForType:20 property:128];
    char v6 = [v5 transitionModifiers];

    long long v20 = 0u;
    long long v19 = 0u;
    v7 = [*(id *)(a1 + 48) componentForType:20 property:256];
    uint64_t v8 = v7;
    if (v7)
    {
      [v7 transitionInputs];
    }
    else
    {
      long long v20 = 0u;
      long long v19 = 0u;
    }

    if ((v6 & 8) != 0)
    {
      SBFMainScreenScale();
      BSPointRoundForScale();
      double v9 = v11;
      double v10 = v12;
      [v3 setAnimationDuration:*(double *)&v19];
      if ((v6 & 0x10) == 0)
      {
LABEL_10:
        objc_msgSend(v4, "offset", (void)v19);
        objc_msgSend(v3, "setOffset:", -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:](a1, v14, v15, v9, v10));
        v16 = [*(id *)(a1 + 48) componentForType:20 property:1];
        uint64_t v17 = [v16 isHidden];

        [v3 setHidden:v17];
        objc_msgSend(v3, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:](a1, 1.0, objc_msgSend(v4, "isHidden"), objc_msgSend(v3, "isHidden"), @"complicationContainer"));

        goto LABEL_11;
      }
    }
    else
    {
      double v9 = *MEMORY[0x1E4F1DAD8];
      double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if ((v6 & 0x10) == 0) {
        goto LABEL_10;
      }
    }
    objc_msgSend(v4, "scale", v19, (void)v20);
    uint64_t v21 = v13;
    char v22 = 1;
    memset(v23, 0, sizeof(v23));
    uint64_t v24 = *((void *)&v20 + 1);
    char v25 = 1;
    memset(v26, 0, sizeof(v26));
    objc_msgSend(v3, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:](a1, (uint64_t)&v21, 0));
    [v3 setAnimationDuration:*(double *)&v19];
    goto LABEL_10;
  }
  v3 = 0;
LABEL_11:

  return v3;
}

- (id)_resolveRemoteInlineContentComponent
{
  if (a1)
  {
    v2 = objc_opt_new();
    v3 = [v2 priority:100];

    v4 = [*(id *)(a1 + 56) componentForType:21 identifier:@"(active)"];
    uint64_t v5 = [v4 isHidden];
    char v6 = [*(id *)(a1 + 48) componentForType:21 property:1];
    uint64_t v7 = [v6 isHidden];

    [v3 setHidden:v7];
    objc_msgSend(v3, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:](a1, 1.0, v5, v7, @"proudLockAlpha"));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_resolveWallpaperComponent
{
  if (a1)
  {
    v2 = objc_opt_new();
    v3 = [v2 priority:100];

    v4 = [*(id *)(a1 + 56) componentForType:6 identifier:@"(active)"];
    uint64_t v5 = [*(id *)(a1 + 48) componentForType:6 property:1];
    int v6 = [v4 isHidden];
    uint64_t v7 = [v5 isHidden];
    uint64_t v8 = v7;
    if (*(unsigned char *)(a1 + 16) && v7)
    {
      int v9 = *(void *)(a1 + 56) ? v6 : 1;
      if (v9 != 1) {
        uint64_t v8 = 0;
      }
    }
    [v3 setHidden:v8];
    [*(id *)(a1 + 48) flagForComponentType:6];
    [*(id *)(a1 + 56) flagForComponentType:6];
    if (*(unsigned char *)(a1 + 16)
      && ((BSSettingFlagIsExplicitNo() & 1) != 0 || *(void *)(a1 + 56) && (BSSettingFlagIsExplicitNo() & 1) != 0))
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = BSSettingFlagIsExplicitNo() ^ 1;
    }
    [v3 setShouldMatchBackgroundStyle:v10];
    objc_msgSend(v3, "setLevel:", objc_msgSend(v5, "level"));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_resolveModalContentComponent
{
  if (a1)
  {
    v2 = objc_opt_new();
    v3 = [v2 priority:100];

    v4 = [*(id *)(a1 + 56) componentForType:22 identifier:@"(active)"];
    uint64_t v5 = [*(id *)(a1 + 48) componentForType:22 property:128];
    char v6 = [v5 transitionModifiers];

    long long v15 = 0u;
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 22, 256, 0, 0, 0, 0, 0);
    uint64_t v8 = v7;
    if (v7)
    {
      [v7 transitionInputs];
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v13 = 0u;
    }

    if ((v6 & 0x40) != 0)
    {
      uint64_t v9 = [v4 level];
      uint64_t v10 = *((void *)&v15 + 1);
      if (*(unsigned char *)(a1 + 16))
      {
        uint64_t v11 = v9;
        if (BSFloatIsZero()) {
          uint64_t v10 = v11;
        }
      }
      objc_msgSend(v3, "setLevel:", v10, v13, v14, (void)v15);
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_resolveWallpaperFloatingLayerComponent
{
  if (a1)
  {
    v2 = objc_opt_new();
    v3 = [v2 priority:100];

    v4 = [*(id *)(a1 + 48) componentForType:23 property:4];
    objc_msgSend(v3, "setShouldRenderInline:", objc_msgSend(v4, "shouldRenderInline"));

    uint64_t v5 = [*(id *)(a1 + 48) componentForType:23 property:1];
    objc_msgSend(v3, "setShouldRenderForPosterSwitcher:", objc_msgSend(v5, "shouldRenderForPosterSwitcher"));

    [*(id *)(a1 + 48) flagForComponentType:23];
    [*(id *)(a1 + 56) flagForComponentType:23];
    if (*(unsigned char *)(a1 + 16)
      && ((BSSettingFlagIsExplicitNo() & 1) != 0 || *(void *)(a1 + 56) && (BSSettingFlagIsExplicitNo() & 1) != 0))
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = BSSettingFlagIsExplicitNo() ^ 1;
    }
    [v3 setShouldMatchMove:v6];
    uint64_t v7 = [*(id *)(a1 + 48) componentForType:23 property:4096];
    objc_msgSend(v3, "setLevel:", objc_msgSend(v7, "level"));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_resolveBackgroundContentComponent
{
  if (!a1)
  {
    v3 = 0;
    goto LABEL_18;
  }
  v2 = objc_opt_new();
  v3 = [v2 priority:100];

  v4 = [*(id *)(a1 + 56) componentForType:24 identifier:@"(active)"];
  uint64_t v5 = [*(id *)(a1 + 48) componentForType:24 property:128];
  char v6 = [v5 transitionModifiers];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [*(id *)(a1 + 48) componentForType:24 property:256];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 transitionInputs];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
  }

  if ((v6 & 8) != 0)
  {
    [v4 offset];
    objc_msgSend(v3, "setOffset:", -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:](a1, v9, v10, *((double *)&v19 + 1), *(double *)&v20));
    if ((v6 & 0x10) == 0)
    {
LABEL_7:
      if ((v6 & 0x40) == 0) {
        goto LABEL_15;
      }
LABEL_11:
      uint64_t v12 = objc_msgSend(v4, "level", (void)v19);
      uint64_t v13 = *((void *)&v21 + 1);
      if (*(unsigned char *)(a1 + 16))
      {
        uint64_t v14 = v12;
        if (BSFloatIsZero()) {
          uint64_t v13 = v14;
        }
      }
      [v3 setLevel:v13];
      goto LABEL_15;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v4, "scale", (void)v19);
  uint64_t v22 = v11;
  char v23 = 1;
  memset(v24, 0, sizeof(v24));
  uint64_t v25 = *((void *)&v20 + 1);
  char v26 = 1;
  memset(v27, 0, sizeof(v27));
  objc_msgSend(v3, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:](a1, (uint64_t)&v22, 0));
  [v3 setAnimationDuration:*(double *)&v19];
  if ((v6 & 0x40) != 0) {
    goto LABEL_11;
  }
LABEL_15:
  long long v15 = objc_msgSend(*(id *)(a1 + 48), "componentForType:property:", 24, 1, (void)v19);
  uint64_t v16 = [v15 isHidden];

  [v3 setHidden:v16];
  double v17 = 1.0;
  if (v16) {
    double v17 = 0.0;
  }
  [v3 setAlpha:v17];

LABEL_18:

  return v3;
}

- (id)_resolveComplicationSidebarComponent
{
  if (a1)
  {
    v2 = objc_opt_new();
    v3 = [v2 priority:100];

    v4 = [*(id *)(a1 + 56) componentForType:25 identifier:@"(active)"];
    uint64_t v5 = [*(id *)(a1 + 48) componentForType:25 property:1];
    uint64_t v6 = [v5 isHidden];

    [v3 setHidden:v6];
    objc_msgSend(v3, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:](a1, 1.0, objc_msgSend(v4, "isHidden"), objc_msgSend(v3, "isHidden"), @"complicationContainer"));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_resolveFullBleedContentComponent
{
  if (a1)
  {
    v2 = objc_opt_new();
    v3 = [v2 priority:100];

    objc_msgSend(v3, "setFlag:", objc_msgSend(*(id *)(a1 + 48), "flagForComponentType:", 26));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_resolveDimmingLayerComponent
{
  if (a1)
  {
    v2 = objc_opt_new();
    v3 = [v2 priority:100];

    v4 = [*(id *)(a1 + 56) componentForType:27 identifier:@"(active)"];
    uint64_t v5 = [*(id *)(a1 + 48) componentForType:27 property:1];
    uint64_t v6 = [v5 isHidden];

    [v3 setHidden:v6];
    objc_msgSend(v3, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:](a1, 1.0, objc_msgSend(v4, "isHidden"), objc_msgSend(v3, "isHidden"), @"dateViewAlpha"));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_resolveLegibilitySettings
{
  v3 = [(CSAppearance *)self->_modalAppearance legibilitySettings];
  v4 = objc_msgSend(v3, "sb_copy");

  uint64_t v5 = [(CSAppearance *)self->_oldAppearance legibilitySettings];
  uint64_t v6 = objc_msgSend(v5, "sb_copy");

  uint64_t v7 = [(CSAppearance *)self->_targetAppearance legibilitySettings];
  uint64_t v8 = objc_msgSend(v7, "sb_copy");

  double v9 = [(CSAppearance *)self->_desiredAppearance legibilitySettings];
  double v10 = objc_msgSend(v9, "sb_copy");

  if (v4)
  {
    uint64_t v11 = v4;
LABEL_7:
    discreteLegibilitySettings = self->_discreteLegibilitySettings;
    self->_discreteLegibilitySettings = v11;
    goto LABEL_8;
  }
  if (v8)
  {
    uint64_t v11 = v8;
    goto LABEL_7;
  }
  if (v10)
  {
    uint64_t v11 = v10;
    goto LABEL_7;
  }
  discreteLegibilitySettings = [(CSLegibilityProviding *)self->_legibilityProvider currentLegibilitySettings];
  objc_msgSend(discreteLegibilitySettings, "sb_copy");
  uint64_t v16 = (_UILegibilitySettings *)objc_claimAutoreleasedReturnValue();
  double v17 = self->_discreteLegibilitySettings;
  self->_discreteLegibilitySettings = v16;

LABEL_8:
  if (self->_isTransitioning)
  {
    [(SBFSteppedAnimationTimingFunctionCalculator *)self->_interactiveAnimationCalculator valueForFunctionWithName:@"legibilitySettings"];
    _SBUIInterpolatedLegibilitySettings();
    uint64_t v13 = (_UILegibilitySettings *)objc_claimAutoreleasedReturnValue();
    if (self->_fraction < 0.5) {
      objc_storeStrong((id *)&self->_discreteLegibilitySettings, v6);
    }
  }
  else
  {
    uint64_t v13 = self->_discreteLegibilitySettings;
  }
  [(_UILegibilitySettings *)v13 setMinFillHeight:0.0];
  [(_UILegibilitySettings *)self->_discreteLegibilitySettings setMinFillHeight:0.0];
  uint64_t v14 = v13;

  return v14;
}

- (id)_resolveBackgroundComponent
{
  v3 = objc_opt_new();
  v4 = [v3 priority:100];

  uint64_t v5 = [(CSAppearance *)self->_desiredAppearance componentForType:19 property:4];
  uint64_t v6 = [v5 value];
  [v4 setStyle:v6];

  uint64_t v7 = [(CSAppearance *)self->_desiredAppearance componentForType:19 property:64];
  uint64_t v8 = [v7 color];
  [v4 setColor:v8];

  [(SBFSteppedAnimationTimingFunctionCalculator *)self->_interactiveAnimationCalculator valueForFunctionWithName:@"backgroundStyle"];
  objc_msgSend(v4, "setTransitionProgress:");

  return v4;
}

- (id)_resolveDateViewComponent
{
  v3 = objc_opt_new();
  v4 = [v3 priority:100];

  uint64_t v5 = [(CSAppearance *)self->_oldAppearance componentForType:1 identifier:@"(active)"];
  uint64_t v6 = [(CSAppearance *)self->_desiredAppearance componentForType:1 property:1];
  uint64_t v7 = [v6 isHidden];

  int v8 = [v5 isHidden];
  double v9 = [(CSAppearance *)self->_desiredAppearance componentForType:1 property:4];
  double v10 = [v9 value];
  [v4 setValue:v10];

  [v4 setPageIndex:0];
  uint64_t v11 = [(CSAppearance *)self->_desiredAppearance componentForType:1 property:128];
  char v12 = [v11 transitionModifiers];

  long long v35 = 0u;
  long long v34 = 0u;
  uint64_t v13 = [(CSAppearance *)self->_desiredAppearance componentForType:1 property:256];
  uint64_t v14 = v13;
  if (v13)
  {
    [v13 transitionInputs];
  }
  else
  {
    long long v35 = 0u;
    long long v34 = 0u;
  }

  if ((v12 & 8) != 0)
  {
    SBFMainScreenScale();
    BSPointRoundForScale();
    double v15 = v17;
    double v16 = v18;
    [v4 setAnimationDuration:*(double *)&v34];
    if ((v12 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  double v15 = *MEMORY[0x1E4F1DAD8];
  double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if ((v12 & 0x10) != 0)
  {
LABEL_8:
    objc_msgSend(v5, "scale", v34, (void)v35);
    uint64_t v36 = v19;
    char v37 = 1;
    memset(v38, 0, sizeof(v38));
    uint64_t v39 = *((void *)&v35 + 1);
    char v40 = 1;
    memset(v41, 0, sizeof(v41));
    objc_msgSend(v4, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v36, 0));
    [v4 setAnimationDuration:*(double *)&v34];
  }
LABEL_9:
  if ((v12 & 4) != 0) {
    [v4 setStretch:1];
  }
  objc_msgSend(v5, "offset", (void)v34);
  objc_msgSend(v4, "setOffset:", -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:]((uint64_t)self, v20, v21, v15, v16));
  uint64_t v22 = [(CSAppearance *)self->_desiredAppearance componentForType:1 property:16];
  char v23 = [v22 view];
  [v4 setView:v23];

  uint64_t v24 = [(CSAppearance *)self->_desiredAppearance componentForType:1 property:8];
  objc_msgSend(v4, "setVibrantAndCentered:", objc_msgSend(v24, "flag"));

  if (self->_startIndex != self->_targetIndex && (BSFloatIsOne() & 1) == 0)
  {
    if (v7 != v8)
    {
      uint64_t v25 = 72;
      if (v8) {
        uint64_t v25 = 80;
      }
      char v26 = *(char **)((char *)&self->super.isa + v25) - self->_indexOfMainPage;
      if (v7)
      {
        [v5 offset];
        double v15 = v27;
        double v16 = v28;
      }
      objc_msgSend(v4, "setOffset:", v15, v16);
      id v29 = [NSNumber numberWithInteger:v26];
      [v4 setPageIndex:v29];
    }
    uint64_t v7 = v8 & v7;
  }
  [v4 setHidden:v7];
  if ([v4 isHidden]) {
    [v4 setHidesTime:1];
  }
  v30 = [MEMORY[0x1E4FA6060] rootSettings];
  [v30 awakeDateAlpha];
  double v32 = v31;

  objc_msgSend(v4, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, v32, objc_msgSend(v5, "isHidden"), objc_msgSend(v4, "isHidden"), @"dateViewAlpha"));

  return v4;
}

- (double)_scaleForTransitionFromScale:(double)a3 toScale:(double)a4 timingFunction:
{
  if (!a1) {
    return 0.0;
  }
  double v5 = a3;
  char v6 = 1;
  memset(v7, 0, sizeof(v7));
  double v8 = a4;
  char v9 = 1;
  memset(v10, 0, sizeof(v10));
  return -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:](a1, (uint64_t)&v5, a2);
}

- (double)_offsetForTransitionFromOffset:(double)a3 toOffset:(double)a4 timingFunction:(double)a5
{
  if (!a1) {
    return 0.0;
  }
  double v10 = a2;
  char v11 = 1;
  memset(v12, 0, sizeof(v12));
  double v13 = a4;
  char v14 = 1;
  memset(v15, 0, sizeof(v15));
  double v8 = -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:](a1, (uint64_t)&v10, 0);
  double v10 = a3;
  char v11 = 1;
  memset(v12, 0, sizeof(v12));
  double v13 = a5;
  char v14 = 1;
  memset(v15, 0, sizeof(v15));
  -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:](a1, (uint64_t)&v10, 0);
  return v8;
}

- (double)_dateViewAlphaForCurrentWakeState
{
  if (!a1) {
    return 0.0;
  }
  v1 = [MEMORY[0x1E4FA6060] rootSettings];
  [v1 awakeDateAlpha];
  double v3 = v2;

  return v3;
}

- (double)_alphaForTransitionFromHidden:(uint64_t)a3 toHidden:(int)a4 unhiddenAlpha:(void *)a5 timingFunction:
{
  if (!a1) {
    return 0.0;
  }
  id v8 = a5;
  int v9 = BSEqualBools();
  v21[0] = 0;
  *(_DWORD *)((char *)v21 + 3) = 0;
  v20[0] = 0;
  *(_DWORD *)((char *)v20 + 3) = 0;
  double v10 = 0.0;
  if (a4) {
    double v11 = 0.0;
  }
  else {
    double v11 = a2;
  }
  if (a4) {
    double v10 = a2;
  }
  if (v9) {
    double v10 = v11;
  }
  double v14 = v10;
  char v15 = 1;
  *(_DWORD *)double v16 = v21[0];
  *(_DWORD *)&v16[3] = 0;
  double v17 = v11;
  char v18 = 1;
  *(_DWORD *)uint64_t v19 = v20[0];
  *(_DWORD *)&v19[3] = 0;
  double v12 = -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:](a1, (uint64_t)&v14, v8);

  return v12;
}

- (double)_alphaForTransitionFromHidden:(int)a3 toHidden:(void *)a4 timingFunction:
{
  if (a1) {
    return -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:](a1, 1.0, a2, a3, a4);
  }
  else {
    return 0.0;
  }
}

- (id)_resolveStatusBarBackgroundComponent
{
  double v3 = objc_opt_new();
  v4 = [v3 priority:100];

  double v5 = [(CSAppearance *)self->_oldAppearance componentForType:8 identifier:@"(active)"];
  [(CSAppearance *)self->_desiredAppearance flagForComponentType:8];
  int IsExplicitNo = BSSettingFlagIsExplicitNo();
  [(CSAppearance *)self->_oldAppearance flagForComponentType:8];
  int v7 = BSSettingFlagIsExplicitNo();
  id v8 = [(CSAppearance *)self->_desiredAppearance componentForType:8 property:1];
  uint64_t v9 = [v8 isHidden];

  unsigned int v10 = [v5 isHidden];
  uint64_t v11 = v9;
  if (self->_startIndex != self->_targetIndex)
  {
    unsigned int v12 = v10;
    char IsOne = BSFloatIsOne();
    uint64_t v11 = v9;
    if ((IsOne & 1) == 0)
    {
      if (IsExplicitNo == v7)
      {
        uint64_t v11 = v12 & v9;
      }
      else
      {
        int IsYes = BSSettingFlagIsYes();
        uint64_t v15 = 72;
        if (IsYes) {
          uint64_t v15 = 80;
        }
        double v16 = [NSNumber numberWithInteger:*(char **)((char *)&self->super.isa + v15) - self->_indexOfMainPage];
        [v4 setValue:v16];

        if (BSSettingFlagIsYes()) {
          uint64_t v11 = v12;
        }
        else {
          uint64_t v11 = v9;
        }
      }
    }
  }
  [v4 setHidden:v11];
  [v4 setShowBackgroundWhileTransitioning:IsExplicitNo ^ 1u];
  objc_msgSend(v4, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, objc_msgSend(v5, "isHidden"), v9, @"dateViewAlpha"));

  return v4;
}

- (id)_resolveStatusBarComponent
{
  double v3 = objc_opt_new();
  v4 = [v3 priority:100];

  double v5 = [(CSAppearance *)self->_oldAppearance componentForType:2 identifier:@"(active)"];
  char v6 = [(CSAppearance *)self->_desiredAppearance componentForType:2 property:4];
  int v7 = [v6 value];
  [v4 setFakeStatusBarLevel:v7];

  id v8 = [(CSAppearance *)self->_desiredAppearance componentForType:2 property:1];
  objc_msgSend(v4, "setHidden:", objc_msgSend(v8, "isHidden"));

  uint64_t v9 = [(NSArray *)self->_whitePointValues lastObject];
  unsigned int v10 = v9;
  if (!v9) {
    uint64_t v9 = &unk_1F306AA58;
  }
  [v9 doubleValue];
  double v12 = v11;

  objc_msgSend(v4, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, v12, objc_msgSend(v5, "isHidden"), objc_msgSend(v4, "isHidden"), @"statusBarAlpha"));
  double v13 = [(CSAppearance *)self->_desiredAppearance componentForType:2 property:128];
  char v14 = [v13 transitionModifiers];

  long long v23 = 0u;
  long long v22 = 0u;
  uint64_t v15 = [(CSAppearance *)self->_desiredAppearance componentForType:2 property:256];
  double v16 = v15;
  if (v15)
  {
    [v15 transitionInputs];
  }
  else
  {
    long long v23 = 0u;
    long long v22 = 0u;
  }

  if ((v14 & 0x20) != 0)
  {
    [v5 blurRadius];
    uint64_t v24 = v17;
    char v25 = 1;
    memset(v26, 0, sizeof(v26));
    uint64_t v27 = 0;
    char v28 = 1;
    memset(v29, 0, sizeof(v29));
    objc_msgSend(v4, "setBlurRadius:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v24, 0));
    [v4 setAnimationDuration:*(double *)&v22];
  }
  if ((v14 & 0x10) != 0)
  {
    [v5 scale];
    uint64_t v24 = v18;
    char v25 = 1;
    memset(v26, 0, sizeof(v26));
    uint64_t v27 = *((void *)&v23 + 1);
    char v28 = 1;
    memset(v29, 0, sizeof(v29));
    objc_msgSend(v4, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v24, 0));
    [v4 setAnimationDuration:*(double *)&v22];
  }
  int64_t v19 = -[CSAppearance flagForComponentType:](self->_desiredAppearance, "flagForComponentType:", 2, v22, (void)v23);
  [(CSAppearance *)self->_oldAppearance flagForComponentType:2];
  if (self->_isTransitioning && ((BSSettingFlagIsYes() & 1) != 0 || (BSSettingFlagIsYes() & 1) != 0))
  {
    uint64_t v20 = 1;
  }
  else if (self->_hasContentAboveCoverSheet)
  {
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = v19;
  }
  [v4 setFakeStatusBar:v20];
  [v4 setLegibilitySettings:self->_discreteLegibilitySettings];

  return v4;
}

- (id)_resolvePageContentComponent
{
  double v3 = objc_opt_new();
  v4 = [v3 priority:100];

  double v5 = [(CSAppearance *)self->_oldAppearance componentForType:4 identifier:@"(active)"];
  char v6 = [(CSAppearance *)self->_desiredAppearance componentForType:4 property:1];
  objc_msgSend(v4, "setHidden:", objc_msgSend(v6, "isHidden"));

  objc_msgSend(v4, "setSuppressHorizontalBounce:", -[CSAppearance flagForComponentType:](self->_desiredAppearance, "flagForComponentType:", 4));
  objc_msgSend(v4, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, objc_msgSend(v5, "isHidden"), objc_msgSend(v4, "isHidden"), @"pageContentAlpha"));

  return v4;
}

- (id)_resolveProudLockComponent
{
  double v3 = objc_opt_new();
  v4 = [v3 priority:100];

  double v5 = [(CSAppearance *)self->_oldAppearance componentForType:11 identifier:@"(active)"];
  [v5 offset];
  double v7 = v6;
  double v9 = v8;
  unsigned int v10 = (double *)MEMORY[0x1E4F1DAD8];
  double v11 = [(CSAppearance *)self->_desiredAppearance componentForType:11 property:128];
  char v12 = [v11 transitionModifiers];

  long long v35 = 0u;
  long long v34 = 0u;
  double v13 = [(CSAppearance *)self->_desiredAppearance componentForType:11 property:256];
  char v14 = v13;
  if (v13)
  {
    [v13 transitionInputs];
  }
  else
  {
    long long v35 = 0u;
    long long v34 = 0u;
  }
  double v15 = *v10;
  double v16 = v10[1];

  double v17 = v16;
  double v18 = v15;
  if ((v12 & 8) == 0)
  {
    if ((v12 & 0x10) == 0) {
      goto LABEL_6;
    }
LABEL_21:
    objc_msgSend(v5, "scale", v34, (void)v35);
    uint64_t v36 = v33;
    char v37 = 1;
    memset(v38, 0, sizeof(v38));
    uint64_t v39 = *((void *)&v35 + 1);
    char v40 = 1;
    memset(v41, 0, sizeof(v41));
    objc_msgSend(v4, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v36, 0));
    [v4 setAnimationDuration:*(double *)&v34];
    if ((v12 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  SBFMainScreenScale();
  BSPointRoundForScale();
  double v18 = v31;
  double v17 = v32;
  [v4 setAnimationDuration:*(double *)&v34];
  if ((v12 & 0x10) != 0) {
    goto LABEL_21;
  }
LABEL_6:
  if ((v12 & 0x20) != 0)
  {
LABEL_7:
    objc_msgSend(v5, "blurRadius", (void)v34);
    uint64_t v36 = v19;
    char v37 = 1;
    memset(v38, 0, sizeof(v38));
    uint64_t v39 = 0;
    char v40 = 1;
    memset(v41, 0, sizeof(v41));
    objc_msgSend(v4, "setBlurRadius:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v36, 0));
    [v4 setAnimationDuration:*(double *)&v34];
  }
LABEL_8:
  double v20 = [(CSCoverSheetAppearanceResolver *)(uint64_t)self _offsetForTransitionFromOffset:v9 toOffset:v18 timingFunction:v17];
  double v22 = v21;
  long long v23 = [(CSAppearance *)self->_desiredAppearance componentForType:11 property:1];
  objc_msgSend(v4, "setHidden:", objc_msgSend(v23, "isHidden"));

  uint64_t v24 = [(CSAppearance *)self->_desiredAppearance componentForType:11 property:4];
  char v25 = [v24 value];
  [v4 setValue:v25];

  uint64_t v26 = [v5 isHidden];
  int v27 = [v4 isHidden];
  [(CSAppearance *)self->_desiredAppearance flagForComponentType:11];
  [(CSAppearance *)self->_oldAppearance flagForComponentType:11];
  [v5 alpha];
  if (self->_isTransitioning && ((double v29 = v28, (BSSettingFlagIsYes() & 1) != 0) || BSSettingFlagIsYes()))
  {
    objc_msgSend(v4, "setAlpha:", v29, (void)v34);
  }
  else
  {
    double v29 = -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, v26, v27, @"proudLockAlpha");
    objc_msgSend(v4, "setAlpha:", fmin(fmax(v29 * 2.0 + -1.0, 0.0), 1.0));
    objc_msgSend(v4, "setOffset:", v20, v22);
  }
  if (BSPointEqualToPoint() && !BSFloatIsZero() && v26 != v27)
  {
    [v4 setAlpha:v29];
    objc_msgSend(v4, "setOffset:", v18, v17);
  }

  return v4;
}

- (id)_resolveHomeAffordanceComponent
{
  double v3 = objc_opt_new();
  v4 = [v3 priority:100];

  double v5 = [(CSAppearance *)self->_oldAppearance componentForType:12 identifier:@"(active)"];
  if ([(CSBehavior *)self->_activeBehavior areRestrictedCapabilities:4096]) {
    int v6 = 0;
  }
  else {
    int v6 = ![(CSBehavior *)self->_activeBehavior areRestrictedCapabilities:56];
  }
  double v7 = [(CSAppearance *)self->_desiredAppearance componentForType:12 property:1];
  unsigned int v8 = [v7 isHidden];

  int v9 = v6 ^ 1;
  if (self->_isTransitioning) {
    int v10 = 0;
  }
  else {
    int v10 = v6 ^ 1;
  }
  [v4 setHidden:v10 | v8];
  double v11 = [(CSAppearance *)self->_desiredAppearance componentForType:12 property:4];
  char v12 = [v11 value];
  [v4 setValue:v12];

  if (self->_contentTransitionIsAtCoverSheetLevel) {
    int v13 = 0;
  }
  else {
    int v13 = v9;
  }
  objc_msgSend(v4, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, objc_msgSend(v5, "isHidden"), v13 | v8, @"homeAffordance"));
  int64_t v14 = [(CSAppearance *)self->_desiredAppearance flagForComponentType:12];
  if (self->_hasContentAboveCoverSheet) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = v14;
  }
  [v4 setSuppressTeachableMomentsAnimation:v15];
  double v16 = [(CSAppearance *)self->_desiredAppearance componentForType:12 property:128];
  char v17 = [v16 transitionModifiers];

  long long v34 = 0u;
  long long v33 = 0u;
  double v18 = [(CSAppearance *)self->_desiredAppearance componentForType:12 property:256];
  uint64_t v19 = v18;
  if (v18)
  {
    [v18 transitionInputs];
  }
  else
  {
    long long v34 = 0u;
    long long v33 = 0u;
  }

  if ((v17 & 8) != 0)
  {
    double v21 = *((double *)&v33 + 1);
    double v20 = *(double *)&v34;
    [v4 setAnimationDuration:*(double *)&v33];
  }
  else
  {
    double v21 = *MEMORY[0x1E4F1DAD8];
    double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v22 = -[CSCoverSheetAppearanceResolver _finalizeOffset:referenceFrame:]((uint64_t)self, v21, v20, self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  double v24 = v23;
  double v25 = 1.0;
  if ((v17 & 0x10) != 0)
  {
    double v25 = *((double *)&v34 + 1);
    [v4 setAnimationDuration:*(double *)&v33];
  }
  int v26 = objc_msgSend(v5, "isHidden", (void)v33);
  int v27 = [v4 isHidden];
  if (!v26 || v27)
  {
    [v5 offset];
    double v22 = [(CSCoverSheetAppearanceResolver *)(uint64_t)self _offsetForTransitionFromOffset:v29 toOffset:v22 timingFunction:v24];
    double v24 = v30;
    [v5 scale];
    uint64_t v35 = v31;
    char v36 = 1;
    memset(v37, 0, sizeof(v37));
    double v38 = v25;
    char v39 = 1;
    memset(v40, 0, sizeof(v40));
    double v25 = -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v35, 0);
  }
  objc_msgSend(v4, "setOffset:", v22, v24);
  [v4 setScale:v25];

  return v4;
}

- (double)_finalizeOffset:(double)a3 referenceFrame:(CGFloat)a4
{
  if (!a1) {
    return 0.0;
  }
  if (BSFloatEqualToFloat())
  {
    v14.origin.CGFloat x = a4;
    v14.origin.CGFloat y = a5;
    v14.size.CGFloat width = a6;
    v14.size.CGFloat height = a7;
    CGRectGetHeight(v14);
  }
  if (BSFloatEqualToFloat())
  {
    v15.origin.CGFloat x = a4;
    v15.origin.CGFloat y = a5;
    v15.size.CGFloat width = a6;
    v15.size.CGFloat height = a7;
    double Width = CGRectGetWidth(v15);
    if (a2 >= 0.0) {
      return Width;
    }
    else {
      return -Width;
    }
  }
  return a2;
}

- (id)_resolveComponentWithType:(int64_t)a3
{
  double v5 = +[CSComponent componentWithType:](CSComponent, "componentWithType:");
  int v6 = [v5 priority:100];

  double v7 = [(CSAppearance *)self->_oldAppearance componentForType:a3 identifier:@"(active)"];
  unsigned int v8 = [(CSAppearance *)self->_desiredAppearance componentForType:a3 property:1];
  objc_msgSend(v6, "setHidden:", objc_msgSend(v8, "isHidden"));

  objc_msgSend(v6, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, objc_msgSend(v7, "isHidden"), objc_msgSend(v6, "isHidden"), @"fixedFooterAlpha"));
  int v9 = [(CSAppearance *)self->_desiredAppearance componentForType:a3 property:128];
  char v10 = [v9 transitionModifiers];

  long long v18 = 0u;
  long long v17 = 0u;
  double v11 = [(CSAppearance *)self->_desiredAppearance componentForType:a3 property:256];
  char v12 = v11;
  if (v11)
  {
    [v11 transitionInputs];
  }
  else
  {
    long long v18 = 0u;
    long long v17 = 0u;
  }

  if ((v10 & 8) != 0)
  {
    [v7 offset];
    objc_msgSend(v6, "setOffset:", -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:]((uint64_t)self, v13, v14, *((double *)&v17 + 1), *(double *)&v18));
    [v6 setAnimationDuration:*(double *)&v17];
  }
  if ((v10 & 0x10) != 0)
  {
    [v7 scale];
    uint64_t v19 = v15;
    char v20 = 1;
    memset(v21, 0, sizeof(v21));
    uint64_t v22 = *((void *)&v18 + 1);
    char v23 = 1;
    memset(v24, 0, sizeof(v24));
    objc_msgSend(v6, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v19, 0));
    [v6 setAnimationDuration:*(double *)&v17];
  }

  return v6;
}

- (id)_resolveFooterCallToActionLabelComponentWithHomeAffordance:(id)a3
{
  id v4 = a3;
  double v5 = objc_opt_new();
  int v6 = [v5 priority:100];

  double v7 = [(CSAppearance *)self->_oldAppearance componentForType:9 identifier:@"(active)"];
  unsigned int v8 = [(CSAppearance *)self->_desiredAppearance componentForType:9 property:1];
  int v9 = [v8 isHidden];

  if (SBFEffectiveHomeButtonType() == 2) {
    unsigned int v10 = [v4 isHidden];
  }
  else {
    unsigned int v10 = 0;
  }
  [v6 setHidden:v9 | v10];
  objc_msgSend(v6, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, objc_msgSend(v7, "isHidden"), objc_msgSend(v6, "isHidden"), @"fixedFooterAlpha"));

  return v6;
}

- (id)_resolveControlCenterGrabberComponent
{
  double v3 = objc_opt_new();
  id v4 = [v3 priority:100];

  double v5 = [(CSAppearance *)self->_oldAppearance componentForType:13 identifier:@"(active)"];
  if ([(CSBehavior *)self->_activeBehavior areRestrictedCapabilities:128])
  {
    [v4 setHidden:1];
  }
  else
  {
    int v6 = [(CSAppearance *)self->_desiredAppearance componentForType:13 property:1];
    objc_msgSend(v4, "setHidden:", objc_msgSend(v6, "isHidden"));
  }
  objc_msgSend(v4, "setAlpha:", -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, objc_msgSend(v5, "isHidden"), objc_msgSend(v4, "isHidden"), @"controlCenterGrabber"));
  double v7 = [(CSAppearance *)self->_desiredAppearance componentForType:2 property:128];
  char v8 = [v7 transitionModifiers];

  long long v14 = 0u;
  int v9 = [(CSAppearance *)self->_desiredAppearance componentForType:2 property:256];
  unsigned int v10 = v9;
  if (v9) {
    [v9 transitionInputs];
  }
  else {
    long long v14 = 0u;
  }

  if ((v8 & 0x20) != 0)
  {
    [v5 blurRadius];
    uint64_t v15 = v11;
    char v16 = 1;
    memset(v17, 0, sizeof(v17));
    uint64_t v18 = 0;
    char v19 = 1;
    memset(v20, 0, sizeof(v20));
    objc_msgSend(v4, "setBlurRadius:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v15, 0));
    [v4 setAnimationDuration:0.0];
  }
  if ((v8 & 0x10) != 0)
  {
    [v5 scale];
    uint64_t v15 = v12;
    char v16 = 1;
    memset(v17, 0, sizeof(v17));
    uint64_t v18 = *((void *)&v14 + 1);
    char v19 = 1;
    memset(v20, 0, sizeof(v20));
    objc_msgSend(v4, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v15, 0));
    [v4 setAnimationDuration:0.0];
  }

  return v4;
}

- (id)_resolveQuickActionsComponent
{
  double v3 = objc_opt_new();
  id v4 = [v3 priority:100];

  double v5 = [(CSAppearance *)self->_oldAppearance componentForType:14 identifier:@"(active)"];
  int v6 = [(CSAppearance *)self->_oldAppearance componentForType:14 property:1];
  uint64_t v7 = [v6 isHidden];

  char v8 = [(CSAppearance *)self->_desiredAppearance componentForType:14 property:1];
  uint64_t v9 = [v8 isHidden];

  unsigned int v10 = [(CSAppearance *)self->_desiredAppearance componentForType:14 property:8];
  [v10 flag];

  [v4 setSuppressVisibleChanges:BSSettingFlagIsYes()];
  double v11 = -[CSCoverSheetAppearanceResolver _alphaForTransitionFromHidden:toHidden:unhiddenAlpha:timingFunction:]((uint64_t)self, 1.0, v7, v9, @"proudLockAlpha");
  [v4 setHidden:v9];
  [v4 setAlpha:v11];
  uint64_t v12 = [(CSAppearance *)self->_desiredAppearance componentForType:14 property:128];
  char v13 = [v12 transitionModifiers];

  long long v23 = 0u;
  long long v21 = 0u;
  long long v14 = [(CSAppearance *)self->_desiredAppearance componentForType:14 property:256];
  uint64_t v15 = v14;
  if (v14)
  {
    [v14 transitionInputs];
  }
  else
  {
    long long v23 = 0u;
    long long v21 = 0u;
  }

  if ((v13 & 8) != 0)
  {
    [v5 offset];
    objc_msgSend(v4, "setOffset:", -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:]((uint64_t)self, v18, v19, *((double *)&v21 + 1), *(double *)&v23));
    [v4 setAnimationDuration:*(double *)&v21];
    if ((v13 & 0x10) == 0)
    {
LABEL_6:
      if ((v13 & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((v13 & 0x10) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(v5, "scale", (void)v21);
  uint64_t v24 = v20;
  char v25 = 1;
  memset(v26, 0, sizeof(v26));
  uint64_t v27 = *((void *)&v23 + 1);
  char v28 = 1;
  memset(v29, 0, sizeof(v29));
  objc_msgSend(v4, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v24, 0));
  [v4 setAnimationDuration:*(double *)&v21];
  if ((v13 & 0x20) != 0)
  {
LABEL_7:
    objc_msgSend(v5, "blurRadius", (void)v21);
    uint64_t v24 = v16;
    char v25 = 1;
    memset(v26, 0, sizeof(v26));
    uint64_t v27 = 0;
    char v28 = 1;
    memset(v29, 0, sizeof(v29));
    objc_msgSend(v4, "setBlurRadius:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v24, 0));
    [v4 setAnimationDuration:v22];
  }
LABEL_8:

  return v4;
}

- (id)_resolveSlideableContentComponent
{
  double v3 = objc_opt_new();
  id v4 = [v3 priority:100];

  double v5 = [(CSAppearance *)self->_oldAppearance componentForType:5 identifier:@"(active)"];
  int v6 = [(CSAppearance *)self->_desiredAppearance componentForType:5 property:128];
  char v7 = [v6 transitionModifiers];

  long long v18 = 0u;
  char v8 = [(CSAppearance *)self->_desiredAppearance componentForType:5 property:256];
  uint64_t v9 = v8;
  if (v8) {
    [v8 transitionInputs];
  }
  else {
    long long v18 = 0u;
  }

  if ((v7 & 8) != 0)
  {
    double v11 = *((double *)&v18 + 1);
    double v10 = 0.0;
    [v4 setAnimationDuration:*(double *)&v18];
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DAD8];
    double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v12 = -[CSCoverSheetAppearanceResolver _finalizeOffset:referenceFrame:]((uint64_t)self, v11, v10, self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  double v14 = v13;
  [v5 offset];
  objc_msgSend(v4, "setOffset:", -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:]((uint64_t)self, v15, v16, v12, v14));

  return v4;
}

- (id)_resolveTintingComponent
{
  double v3 = objc_opt_new();
  id v4 = [v3 priority:100];

  double v5 = [(CSAppearance *)self->_oldAppearance componentForType:7 identifier:@"(active)"];
  int v6 = [(CSAppearance *)self->_desiredAppearance componentForType:7 property:1];
  int v7 = [v5 isHidden];
  uint64_t v8 = [v6 isHidden];
  if (self->_isTransitioning
    && (BSIntervalSubIntervalValueForValue(),
        objc_msgSend(v4, "setAlpha:", 0, 1, 0x3FE0000000000000, 1, 0x3FD999999999999ALL, 1, 0x3FF0000000000000, 1, 0, 1, 0x3FF0000000000000, 1), self->_isTransitioning)&& (v8 & v7 & 1) == 0)
  {
    [v4 setHidden:0];
  }
  else
  {
    [v4 setHidden:v8];
    if (v8) {
      [v4 setAlpha:0.0];
    }
  }

  return v4;
}

- (id)_resolveContentComponent
{
  double v3 = objc_opt_new();
  id v4 = [v3 priority:100];

  double v5 = [(CSAppearance *)self->_oldAppearance componentForType:15 identifier:@"(active)"];
  int v6 = [(CSAppearance *)self->_desiredAppearance componentForType:15 property:128];
  char v7 = [v6 transitionModifiers];

  long long v15 = 0u;
  long long v14 = 0u;
  uint64_t v8 = [(CSAppearance *)self->_desiredAppearance componentForType:15 property:256];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 transitionInputs];
  }
  else
  {
    long long v15 = 0u;
    long long v14 = 0u;
  }

  if ((v7 & 8) != 0)
  {
    [v5 offset];
    objc_msgSend(v4, "setOffset:", -[CSCoverSheetAppearanceResolver _offsetForTransitionFromOffset:toOffset:timingFunction:]((uint64_t)self, v10, v11, *((double *)&v14 + 1), *(double *)&v15));
    [v4 setAnimationDuration:*(double *)&v14];
  }
  if ((v7 & 0x10) != 0)
  {
    [v5 scale];
    uint64_t v16 = v12;
    char v17 = 1;
    memset(v18, 0, sizeof(v18));
    uint64_t v19 = *((void *)&v15 + 1);
    char v20 = 1;
    memset(v21, 0, sizeof(v21));
    objc_msgSend(v4, "setScale:", -[CSCoverSheetAppearanceResolver _valueForTransitionInterval:timingFunction:]((uint64_t)self, (uint64_t)&v16, 0));
    [v4 setAnimationDuration:*(double *)&v14];
  }

  return v4;
}

- (uint64_t)_levelForTransitionFromLevel:(uint64_t)a3 toLevel:
{
  if (!a1) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 16) && BSFloatIsZero()) {
    return a2;
  }
  return a3;
}

- (id)_resolveStatusBarGradientComponent
{
  double v3 = objc_opt_new();
  id v4 = [v3 priority:100];

  double v5 = [(CSAppearance *)self->_desiredAppearance componentForType:16 property:1];
  uint64_t v6 = [v5 isHidden];

  [v4 setHidden:v6];

  return v4;
}

- (id)_resolvePoseidonComponent
{
  double v3 = objc_opt_new();
  id v4 = [v3 priority:100];

  double v5 = [(CSAppearance *)self->_desiredAppearance componentForType:17 property:1];
  uint64_t v6 = [v5 isHidden];

  [v4 setHidden:v6];
  [v4 setAlpha:(double)(v6 ^ 1)];

  return v4;
}

- (id)_resolveWhitePointComponent
{
  double v3 = objc_opt_new();
  id v4 = [v3 priority:100];

  double v5 = [(CSAppearance *)self->_desiredAppearance componentForType:18 property:1];
  uint64_t v6 = [v5 isHidden];

  char v7 = [(CSAppearance *)self->_desiredAppearance componentForType:18 property:8];
  uint64_t v8 = [v7 flag];

  uint64_t v9 = [(CSAppearance *)self->_desiredAppearance componentForType:18 property:1024];
  [v9 animationDuration];
  double v11 = v10;

  if (v11 == 0.0)
  {
    uint64_t v12 = +[CSLockScreenDomain rootSettings];
    double v13 = [v12 dashBoardRemoteContentSettings];
    long long v14 = v13;
    if (v6)
    {
      if ([v13 animatesUndimming])
      {
        [v14 undimDuration];
LABEL_7:
        double v11 = v15;
      }
    }
    else if ([v13 animatesDimming])
    {
      [v14 dimDuration];
      goto LABEL_7;
    }
  }
  [v4 setHidden:v6];
  [v4 setLighterReduction:v8];
  [v4 setAnimationDuration:v11];

  return v4;
}

- (double)_valueForTransitionInterval:(void *)a3 timingFunction:
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 16))
    {
      if (v5) {
        [*(id *)(a1 + 8) valueForFunctionWithName:v5];
      }
      BSIntervalValueForFraction();
      double v7 = v8;
    }
    else
    {
      double v7 = *(double *)(a2 + 16);
    }
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (void)setInteractiveAnimationCalculatorPercentComplete:(double)a3
{
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
}

- (double)appearanceFraction
{
  return self->_appearanceFraction;
}

- (void)setAppearanceFraction:(double)a3
{
  self->_appearanceFraction = a3;
}

- (double)fraction
{
  return self->_fraction;
}

- (void)setFraction:(double)a3
{
  self->_fraction = a3;
}

- (_UILegibilitySettings)discreteLegibilitySettings
{
  return self->_discreteLegibilitySettings;
}

- (void)setDiscreteLegibilitySettings:(id)a3
{
}

- (CSAppearance)desiredAppearance
{
  return self->_desiredAppearance;
}

- (void)setDesiredAppearance:(id)a3
{
}

- (CSAppearance)oldAppearance
{
  return self->_oldAppearance;
}

- (void)setOldAppearance:(id)a3
{
}

- (CSBehavior)activeBehavior
{
  return self->_activeBehavior;
}

- (void)setActiveBehavior:(id)a3
{
  self->_activeBehavior = (CSBehavior *)a3;
}

- (unint64_t)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(unint64_t)a3
{
  self->_startIndeCGFloat x = a3;
}

- (unint64_t)targetIndex
{
  return self->_targetIndex;
}

- (void)setTargetIndex:(unint64_t)a3
{
  self->_targetIndeCGFloat x = a3;
}

- (unint64_t)indexOfMainPage
{
  return self->_indexOfMainPage;
}

- (void)setIndexOfMainPage:(unint64_t)a3
{
  self->_indexOfMainPage = a3;
}

- (CSAppearance)targetAppearance
{
  return self->_targetAppearance;
}

- (void)setTargetAppearance:(id)a3
{
}

- (CSAppearance)modalAppearance
{
  return self->_modalAppearance;
}

- (void)setModalAppearance:(id)a3
{
}

- (CSCoverSheetViewTransitionSource)currentTransitionSource
{
  return self->_currentTransitionSource;
}

- (void)setCurrentTransitionSource:(id)a3
{
}

- (BOOL)contentTransitionIsAtCoverSheetLevel
{
  return self->_contentTransitionIsAtCoverSheetLevel;
}

- (void)setContentTransitionIsAtCoverSheetLevel:(BOOL)a3
{
  self->_contentTransitionIsAtCoverSheetLevel = a3;
}

- (CSLegibilityProviding)legibilityProvider
{
  return self->_legibilityProvider;
}

- (void)setLegibilityProvider:(id)a3
{
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (NSArray)whitePointValues
{
  return self->_whitePointValues;
}

- (void)setWhitePointValues:(id)a3
{
}

- (BOOL)hasContentAboveCoverSheet
{
  return self->_hasContentAboveCoverSheet;
}

- (void)setHasContentAboveCoverSheet:(BOOL)a3
{
  self->_hasContentAboveCoverSheet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitePointValues, 0);
  objc_storeStrong((id *)&self->_legibilityProvider, 0);
  objc_storeStrong((id *)&self->_currentTransitionSource, 0);
  objc_storeStrong((id *)&self->_modalAppearance, 0);
  objc_storeStrong((id *)&self->_targetAppearance, 0);
  objc_storeStrong((id *)&self->_oldAppearance, 0);
  objc_storeStrong((id *)&self->_desiredAppearance, 0);
  objc_storeStrong((id *)&self->_discreteLegibilitySettings, 0);

  objc_storeStrong((id *)&self->_interactiveAnimationCalculator, 0);
}

@end