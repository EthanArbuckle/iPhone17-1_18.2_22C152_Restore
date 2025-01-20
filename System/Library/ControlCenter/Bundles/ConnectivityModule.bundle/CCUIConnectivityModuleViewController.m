@interface CCUIConnectivityModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isCurrentGridSizeClassImplicitlyExpanded;
- (BOOL)_isExpanded;
- (BOOL)contentModuleDetailClickPresentationInteractionControllerInteractionShouldBegin:(id)a3;
- (BOOL)isButtonContentModeExpanded;
- (BOOL)isCollapsedViewInitialized;
- (BOOL)isExpandedFromTransition;
- (BOOL)isExpandedViewInitialized;
- (BOOL)isResizing;
- (BOOL)isWifiOnlySKU;
- (BOOL)performPrimaryActionForControlTemplateView:(id)a3;
- (BOOL)prefersExpandedContentSizeMatchesGridSize;
- (BOOL)presentingMenuViewController;
- (BOOL)providesOwnPlatter;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)shouldExpandModuleOnTouch:(id)a3;
- (BOOL)shouldPerformClickInteraction;
- (BOOL)shouldPerformHoverInteraction;
- (CCUIAirDropModuleViewController)airDropModuleViewController;
- (CCUIBluetoothModuleViewController)bluetoothModuleViewController;
- (CCUIConnectivityButtonViewController)airplaneButtonViewController;
- (CCUIConnectivityButtonViewController)cellularDataButtonViewController;
- (CCUIConnectivityButtonViewController)expandedAirplaneButtonViewController;
- (CCUIConnectivityButtonViewController)expandedBluetoothButtonViewController;
- (CCUIConnectivityButtonViewController)expandedCellularDataButtonViewController;
- (CCUIConnectivityButtonViewController)expandedHotspotButtonViewController;
- (CCUIConnectivityButtonViewController)hotspotButtonViewController;
- (CCUIConnectivityModuleViewController)initWithContentModuleContext:(id)a3;
- (CCUIContentModuleContext)contentModuleContext;
- (CCUIModuleContentMetrics)contentMetrics;
- (CCUISatelliteModuleViewController)satelliteModuleViewController;
- (CCUIVPNModuleViewController)vpnModuleViewController;
- (CCUIWiFiModuleViewController)wifiModuleViewController;
- (CGSize)_sizeForGridSizeClass:(int64_t)a3;
- (CoreTelephonyClient)coreTelephonyClient;
- (NSArray)orderedButtonViewControllers;
- (NSArray)orderedExpandedButtonViewControllers;
- (NSMutableSet)clickPresentationInteractionManagers;
- (OS_dispatch_queue)coreTelephonyQueue;
- (UIView)backgroundPlatterView;
- (double)compactContinuousCornerRadius;
- (double)preferredExpandedContentHeight;
- (id)_makeButtonWithClass:(Class)a3;
- (id)presentedViewControllerForContentModuleDetailClickPresentationInteractionController:(id)a3;
- (int64_t)gridSizeClass;
- (unint64_t)implicitlyExpandedGridSizeClasses;
- (void)_addViewControllers:(id)a3 forwardingAppearanceMethods:(BOOL)a4;
- (void)_initializeButtons;
- (void)_initializeCollapsedView;
- (void)_initializeExpandedView;
- (void)_layoutExpandedView;
- (void)_refreshMenuAffordanceVisibilityForExpandedButtonViewController:(id)a3;
- (void)_removeVisibleContextMenuFromExpandedButtonViewControllers;
- (void)_updateButtonContentMode:(BOOL)a3;
- (void)_updateTelephonyState;
- (void)contentModuleDetailClickPresentationInteractionController:(id)a3 requestsAuthenticationForPresentationWithCompletionHandler:(id)a4;
- (void)contentModuleDetailClickPresentationInteractionControllerInteractionEnded:(id)a3 wasCancelled:(BOOL)a4;
- (void)dataSettingsChanged:(id)a3;
- (void)loadView;
- (void)setAirDropModuleViewController:(id)a3;
- (void)setAirplaneButtonViewController:(id)a3;
- (void)setBackgroundPlatterView:(id)a3;
- (void)setBluetoothModuleViewController:(id)a3;
- (void)setButtonContentModeExpanded:(BOOL)a3;
- (void)setCellularDataButtonViewController:(id)a3;
- (void)setClickPresentationInteractionManagers:(id)a3;
- (void)setCollapsedViewInitialized:(BOOL)a3;
- (void)setCompactContinuousCornerRadius:(double)a3;
- (void)setContentMetrics:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setCoreTelephonyQueue:(id)a3;
- (void)setExpandedAirplaneButtonViewController:(id)a3;
- (void)setExpandedBluetoothButtonViewController:(id)a3;
- (void)setExpandedCellularDataButtonViewController:(id)a3;
- (void)setExpandedFromTransition:(BOOL)a3;
- (void)setExpandedHotspotButtonViewController:(id)a3;
- (void)setExpandedViewInitialized:(BOOL)a3;
- (void)setGridSizeClass:(int64_t)a3;
- (void)setHotspotButtonViewController:(id)a3;
- (void)setOrderedButtonViewControllers:(id)a3;
- (void)setOrderedExpandedButtonViewControllers:(id)a3;
- (void)setPresentingMenuViewController:(BOOL)a3;
- (void)setResizing:(BOOL)a3;
- (void)setSatelliteModuleViewController:(id)a3;
- (void)setVpnModuleViewController:(id)a3;
- (void)setWifiModuleViewController:(id)a3;
- (void)setWifiOnlySKU:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation CCUIConnectivityModuleViewController

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CCUIConnectivityModuleViewController;
  [(CCUIConnectivityModuleViewController *)&v10 viewWillAppear:a3];
  objc_msgSend__initializeCollapsedView(self, v4, v5);
  if (objc_msgSend__isCurrentGridSizeClassImplicitlyExpanded(self, v6, v7)) {
    objc_msgSend__initializeExpandedView(self, v8, v9);
  }
}

- (CCUIConnectivityModuleViewController)initWithContentModuleContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCUIConnectivityModuleViewController;
  v6 = [(CCUIConnectivityModuleViewController *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentModuleContext, a3);
  }

  return v7;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F33CE8]);
  v6 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], v4, v5);
  objc_msgSend_bounds(v6, v7, v8);
  id v17 = (id)objc_msgSend_initWithFrame_(v3, v9, v10);

  objc_msgSend_setAutoresizingMask_(v17, v11, 18);
  objc_msgSend__setContinuousCornerRadius_(v17, v12, v13, self->_compactContinuousCornerRadius);
  objc_msgSend_setView_(self, v14, (uint64_t)v17);
  v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  clickPresentationInteractionManagers = self->_clickPresentationInteractionManagers;
  self->_clickPresentationInteractionManagers = v15;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)CCUIConnectivityModuleViewController;
  [(CCUIConnectivityModuleViewController *)&v29 viewDidLoad];
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.control-center.ConnectivityModule.cellular", 0);
  id v4 = objc_alloc(MEMORY[0x263F02D30]);
  v6 = objc_msgSend_initWithQueue_(v4, v5, (uint64_t)v3);
  objc_msgSend_setDelegate_(v6, v7, (uint64_t)self);
  objc_msgSend_setCoreTelephonyQueue_(self, v8, (uint64_t)v3);
  objc_msgSend_setCoreTelephonyClient_(self, v9, (uint64_t)v6);
  v12 = objc_msgSend_view(self, v10, v11);
  objc_msgSend_compactContinuousCornerRadius(self, v13, v14);
  double v16 = v15;
  v19 = objc_msgSend_controlCenterModuleBackgroundMaterial(MEMORY[0x263F33CA0], v17, v18);
  objc_msgSend_setAutoresizingMask_(v19, v20, 18);
  objc_msgSend__setContinuousCornerRadius_(v19, v21, v22, v16);
  objc_msgSend_setBackgroundPlatterView_(self, v23, (uint64_t)v19);
  objc_msgSend_addSubview_(v12, v24, (uint64_t)v19);
  objc_msgSend__initializeButtons(self, v25, v26);
  objc_msgSend__updateTelephonyState(self, v27, v28);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CCUIConnectivityModuleViewController;
  id v7 = a4;
  -[CCUIConnectivityModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_240630F24;
  v9[3] = &unk_2650C93F8;
  v9[4] = self;
  objc_msgSend_animateAlongsideTransition_completion_(v7, v8, (uint64_t)v9, 0);
}

- (void)viewWillLayoutSubviews
{
  v91.receiver = self;
  v91.super_class = (Class)CCUIConnectivityModuleViewController;
  [(CCUIConnectivityModuleViewController *)&v91 viewWillLayoutSubviews];
  v87 = objc_msgSend_view(self, v3, v4);
  objc_msgSend_bounds(v87, v5, v6);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  unsigned int isExpanded = objc_msgSend__isExpanded(self, v15, v16);
  v20 = objc_msgSend_traitCollection(self, v18, v19);
  objc_msgSend_displayScale(v20, v21, v22);

  v25 = objc_msgSend_backgroundPlatterView(self, v23, v24);
  uint64_t v28 = v25;
  if (isExpanded)
  {
    double v29 = 0.0;
    objc_msgSend_setAlpha_(v25, v26, v27, 0.0);
  }
  else
  {
    double v29 = 1.0;
    objc_msgSend_setAlpha_(v25, v26, v27, 1.0);
  }
  objc_msgSend_setFrame_(v28, v30, v31, v8, v10, v12, v14);
  objc_msgSend__sizeForGridSizeClass_(self, v32, 4);
  double v34 = v33;
  UIRoundToScale();
  double v36 = (v34 - v35 + -28.0) * 0.5;
  UIRoundToScale();
  double v38 = v37;
  UISizeRoundToScale();
  double v40 = v39;
  double v42 = v41;
  UISizeRoundToScale();
  double v44 = v43;
  double v88 = v45;
  UISizeRoundToScale();
  double v90 = v46;
  double v48 = v47;
  v51 = objc_msgSend_orderedButtonViewControllers(self, v49, v50);
  if (objc_msgSend_count(v51, v52, v53))
  {
    unint64_t v56 = 0;
    double v89 = v88 + v48;
    do
    {
      v57 = objc_msgSend_objectAtIndex_(v51, v54, v56);
      if (objc_msgSend_conformsToProtocol_(v57, v58, (uint64_t)&unk_26F4DE620)) {
        objc_msgSend_buttonViewForCollapsedConnectivityModule(v57, v59, v60);
      }
      else {
      v61 = objc_msgSend_view(v57, v59, v60);
      }
      objc_msgSend_setAlpha_(v61, v62, v63, v29);
      double v66 = v38;
      double v67 = v38;
      double v68 = v36;
      double v69 = v36;
      switch(v56)
      {
        case 0uLL:
          goto LABEL_27;
        case 1uLL:
          double v70 = v38 + v38 + v36;
          double v71 = v38;
          goto LABEL_12;
        case 2uLL:
          double v70 = v38;
          double v71 = v38 + v38 + v36;
LABEL_12:
          objc_msgSend_setFrame_(v61, v64, v65, v70, v71, v36, v36);
          break;
        case 3uLL:
          uint64_t v72 = objc_msgSend_count(v51, v64, v65, v38, v38, v36, v36);
          if (v72 == 4) {
            double v75 = v36;
          }
          else {
            double v75 = v40;
          }
          if (v72 == 4) {
            double v76 = v38 + v38 + v36;
          }
          else {
            double v76 = v48;
          }
          if (v72 == 4) {
            objc_msgSend_setFrame_(v61, v73, v74, v38 + v38 + v36, v76, v75, v36);
          }
          else {
            objc_msgSend_setFrame_(v61, v73, v74, v90, v76, v75, v42);
          }
          break;
        case 4uLL:
          double v66 = v44 + v90;
          double v67 = v48;
          goto LABEL_26;
        case 5uLL:
          double v66 = v90;
          goto LABEL_25;
        case 6uLL:
          double v66 = v44 + v90;
LABEL_25:
          double v67 = v89;
LABEL_26:
          double v68 = v40;
          double v69 = v42;
LABEL_27:
          objc_msgSend_setFrame_(v61, v64, v65, v66, v67, v68, v69);
          break;
        default:
          break;
      }
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v92) < 375.0 && v56 >= 3)
      {
        uint64_t v78 = objc_opt_class();
        id v79 = v57;
        if (v78)
        {
          if (objc_opt_isKindOfClass()) {
            v80 = v79;
          }
          else {
            v80 = 0;
          }
        }
        else
        {
          v80 = 0;
        }
        id v81 = v80;

        objc_msgSend_setGlyphScale_(v81, v82, v83, 0.5);
      }

      ++v56;
    }
    while (v56 < objc_msgSend_count(v51, v84, v85));
  }
  objc_msgSend__layoutExpandedView(self, v54, v55);
  objc_msgSend__updateButtonContentMode_(self, v86, isExpanded);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (double)preferredExpandedContentHeight
{
  MEMORY[0x270F18880](self, a2);
  return result;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  if (self->_compactContinuousCornerRadius != a3)
  {
    self->_compactContinuousCornerRadius = a3;
    uint64_t v6 = objc_msgSend_backgroundPlatterView(self, a2, v3);
    objc_msgSend__setContinuousCornerRadius_(v6, v7, v8, a3);

    objc_msgSend_view(self, v9, v10);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setContinuousCornerRadius_(v13, v11, v12, a3);
  }
}

- (void)setContentMetrics:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentMetrics, a3);
    uint64_t v8 = objc_msgSend_orderedButtonViewControllers(self, v6, v7);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v32, v36, 16);
    if (v10)
    {
      uint64_t v13 = v10;
      uint64_t v14 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(v8);
          }
          uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (objc_msgSend_conformsToProtocol_(v16, v11, (uint64_t)&unk_26F4DE620))
          {
            uint64_t v17 = objc_opt_class();
            id v18 = v16;
            if (v17)
            {
              if (objc_opt_isKindOfClass()) {
                uint64_t v19 = v18;
              }
              else {
                uint64_t v19 = 0;
              }
            }
            else
            {
              uint64_t v19 = 0;
            }
            id v23 = v19;

            objc_msgSend_setContentMetrics_(v23, v24, (uint64_t)v5);
          }
          else
          {
            uint64_t v20 = objc_opt_class();
            id v21 = v16;
            if (v20)
            {
              if (objc_opt_isKindOfClass()) {
                uint64_t v22 = v21;
              }
              else {
                uint64_t v22 = 0;
              }
            }
            else
            {
              uint64_t v22 = 0;
            }
            id v25 = v22;

            objc_msgSend_templateView(v25, v26, v27);
            id v23 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setContentMetrics_(v23, v28, (uint64_t)v5);
          }
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v32, v36, 16);
      }
      while (v13);
    }
    double v29 = objc_msgSend_view(self, v11, v12);
    objc_msgSend_setNeedsLayout(v29, v30, v31);
  }
}

- (BOOL)prefersExpandedContentSizeMatchesGridSize
{
  return 1;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return objc_msgSend__isExpanded(self, a2, v2) ^ 1;
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  return objc_msgSend__isExpanded(self, a2, (uint64_t)a3) ^ 1;
}

- (BOOL)shouldPerformClickInteraction
{
  return objc_msgSend__isExpanded(self, a2, v2) ^ 1;
}

- (BOOL)shouldPerformHoverInteraction
{
  return objc_msgSend__isExpanded(self, a2, v2) ^ 1;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3) {
    objc_msgSend__removeVisibleContextMenuFromExpandedButtonViewControllers(self, a2, a3);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24063171C;
  v7[3] = &unk_2650C9380;
  v7[4] = self;
  objc_msgSend_performWithoutAnimation_(MEMORY[0x263F1CB60], a2, (uint64_t)v7);
  objc_msgSend_setExpandedFromTransition_(self, v5, v3);
  objc_msgSend__updateButtonContentMode_(self, v6, v3);
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (unint64_t)implicitlyExpandedGridSizeClasses
{
  return 1536;
}

- (void)setGridSizeClass:(int64_t)a3
{
  if (self->_gridSizeClass != a3)
  {
    self->_gridSizeClass = a3;
    if (objc_msgSend__isExpanded(self, a2, a3))
    {
      if ((objc_msgSend_isExpandedViewInitialized(self, v4, v5) & 1) == 0)
      {
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 3221225472;
        v7[2] = sub_2406317E0;
        v7[3] = &unk_2650C9380;
        v7[4] = self;
        objc_msgSend_performWithoutAnimation_(MEMORY[0x263F1CB60], v6, (uint64_t)v7);
      }
    }
  }
}

- (void)setResizing:(BOOL)a3
{
  if (self->_resizing != a3)
  {
    self->_resizing = a3;
    objc_msgSend_view(self, a2, a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setClipsToBounds_(v5, v4, self->_resizing);
  }
}

- (void)_updateTelephonyState
{
  objc_msgSend_cellularDataButtonViewController(self, a2, v2);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isObservingStateChanges(v23, v4, v5)) {
    objc_msgSend_updateState(v23, v6, v7);
  }
  uint64_t v8 = objc_msgSend_expandedCellularDataButtonViewController(self, v6, v7);
  if (objc_msgSend_isObservingStateChanges(v8, v9, v10)) {
    objc_msgSend_updateState(v8, v11, v12);
  }
  uint64_t v13 = objc_msgSend_hotspotButtonViewController(self, v11, v12);
  if (objc_msgSend_isObservingStateChanges(v13, v14, v15)) {
    objc_msgSend_updateState(v13, v16, v17);
  }
  id v18 = objc_msgSend_expandedHotspotButtonViewController(self, v16, v17);
  if (objc_msgSend_isObservingStateChanges(v18, v19, v20)) {
    objc_msgSend_updateState(v18, v21, v22);
  }
}

- (void)dataSettingsChanged:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2406319F8;
  block[3] = &unk_2650C9380;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)_initializeCollapsedView
{
  if ((objc_msgSend_isCollapsedViewInitialized(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_view(self, v4, v5);
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = objc_msgSend_orderedButtonViewControllers(self, v6, v7);
    objc_msgSend__addViewControllers_forwardingAppearanceMethods_(self, v9, (uint64_t)v8, 0);
    if (objc_msgSend_count(v8, v10, v11))
    {
      unint64_t v13 = 0;
      do
      {
        uint64_t v14 = objc_msgSend_objectAtIndex_(v8, v12, v13);
        if (objc_msgSend_conformsToProtocol_(v14, v15, (uint64_t)&unk_26F4DE620))
        {
          id v16 = v14;
          uint64_t v19 = objc_msgSend_buttonViewForCollapsedConnectivityModule(v16, v17, v18);
          uint64_t v22 = objc_msgSend_accessibilityIdentifier(v16, v20, v21);

          objc_msgSend_setAccessibilityIdentifier_(v19, v23, (uint64_t)v22);
          objc_msgSend_addSubview_(v45, v24, (uint64_t)v19);
        }
        uint64_t v25 = objc_opt_class();
        id v26 = v14;
        if (v25)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v27 = v26;
          }
          else {
            uint64_t v27 = 0;
          }
        }
        else
        {
          uint64_t v27 = 0;
        }
        id v28 = v27;

        objc_msgSend_setDynamicLayoutEnabled_(v28, v29, 1);
        objc_msgSend_setDynamicLayoutUnbounded_(v28, v30, 1);
        if (v13 >= 3 && (unint64_t)objc_msgSend_count(v8, v31, v32) >= 5)
        {
          if (objc_msgSend_conformsToProtocol_(v26, v33, (uint64_t)&unk_26F4DE620))
          {
            double v36 = objc_msgSend_buttonViewForCollapsedConnectivityModule(v26, v34, v35);
            objc_msgSend_setUserInteractionEnabled_(v36, v37, 0);
            objc_msgSend_setGlyphScale_(v36, v38, v39, 0.7);
          }
          else
          {
            objc_msgSend_setGlyphScale_(v28, v34, v35, 0.6);
            double v36 = objc_msgSend_view(v26, v40, v41);
            objc_msgSend_setUserInteractionEnabled_(v36, v42, 0);
          }
        }
        ++v13;
      }
      while (v13 < objc_msgSend_count(v8, v43, v44));
    }
    objc_msgSend_setCollapsedViewInitialized_(self, v12, 1);
  }
}

- (void)_initializeExpandedView
{
  if ((objc_msgSend_isExpandedViewInitialized(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_contentMetrics(self, v4, v5);
    id v89 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = objc_msgSend_contentModuleContext(self, v6, v7);
    uint64_t v11 = objc_msgSend_orderedExpandedButtonViewControllers(self, v9, v10);
    int isCurrentGridSizeClassImplicitlyExpanded = objc_msgSend__isCurrentGridSizeClassImplicitlyExpanded(self, v12, v13);
    objc_msgSend__addViewControllers_forwardingAppearanceMethods_(self, v15, (uint64_t)v11, isCurrentGridSizeClassImplicitlyExpanded ^ 1u);
    if (objc_msgSend_count(v11, v16, v17))
    {
      unint64_t v19 = 0;
      double v20 = *MEMORY[0x263F001A8];
      double v21 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v22 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v23 = *(double *)(MEMORY[0x263F001A8] + 24);
      double v88 = v11;
      do
      {
        uint64_t v24 = objc_msgSend_objectAtIndex_(v11, v18, v19, v88);
        uint64_t v25 = objc_opt_class();
        id v26 = v24;
        if (v25)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v27 = v26;
          }
          else {
            uint64_t v27 = 0;
          }
        }
        else
        {
          uint64_t v27 = 0;
        }
        id v28 = v27;

        objc_msgSend_loadViewIfNeeded(v28, v29, v30);
        objc_msgSend_setContentModuleContext_(v28, v31, (uint64_t)v8);
        objc_msgSend_setDynamicLayoutEnabled_(v28, v32, 1);
        objc_msgSend_setDynamicLayoutUnbounded_(v28, v33, 1);
        if (objc_msgSend_conformsToProtocol_(v26, v34, (uint64_t)&unk_26F4DE620))
        {
          id v35 = v26;
          double v38 = objc_msgSend_templateViewForExpandedConnectivityModule(v35, v36, v37);
          uint64_t v41 = objc_msgSend_accessibilityIdentifier(v35, v39, v40);
          objc_msgSend_setAccessibilityIdentifier_(v38, v42, (uint64_t)v41);

          if ((objc_msgSend_providesTemplateViewDelegateForExpandedConnectivityModule(v35, v43, v44) & 1) == 0) {
            objc_msgSend_setDelegate_(v38, v45, (uint64_t)self);
          }
          uint64_t v46 = objc_opt_class();
          id v47 = v35;
          if (v46)
          {
            if (objc_opt_isKindOfClass()) {
              double v48 = v47;
            }
            else {
              double v48 = 0;
            }
          }
          else
          {
            double v48 = 0;
          }
          id v63 = v48;

          if (v63)
          {
            if (objc_msgSend_prefersContextMenuDisplayStyle(v63, v64, v65))
            {
              objc_msgSend_setContextMenuDelegate_(v38, v66, (uint64_t)v47);
            }
            else
            {
              id v67 = objc_alloc(MEMORY[0x263F33C80]);
              double v69 = v8;
              double v70 = objc_msgSend_initWithPresentingViewController_delegate_(v67, v68, (uint64_t)self, self);
              objc_msgSend_setViewForInteraction_(v70, v71, (uint64_t)v38);
              uint64_t v74 = objc_msgSend_clickPresentationInteractionManagers(self, v72, v73);
              objc_msgSend_addObject_(v74, v75, (uint64_t)v70);

              uint64_t v8 = v69;
              uint64_t v11 = v88;
            }
          }
        }
        else
        {
          id v49 = objc_alloc(MEMORY[0x263F33CB0]);
          double v38 = objc_msgSend_initWithFrame_(v49, v50, v51, v20, v21, v22, v23);
          v54 = objc_msgSend_identifier(v28, v52, v53);
          objc_msgSend_setAccessibilityIdentifier_(v38, v55, (uint64_t)v54);

          objc_msgSend_view(v28, v56, v57);
          id v47 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setCustomGlyphView_(v38, v58, (uint64_t)v47);
          objc_msgSend_setDelegate_(v38, v59, (uint64_t)v28);
          objc_msgSend_setContextMenuDelegate_(v38, v60, (uint64_t)v28);
          objc_msgSend_setMenuModuleDelegate_(v38, v61, (uint64_t)v28);
          objc_msgSend_setTemplateView_(v28, v62, (uint64_t)v38);
        }

        uint64_t v78 = objc_msgSend_controlCenterModuleBackgroundMaterial(MEMORY[0x263F33CA0], v76, v77);
        objc_msgSend_setBackgroundView_(v38, v79, (uint64_t)v78);

        objc_msgSend_setContentMetrics_(v38, v80, (uint64_t)v89);
        uint64_t v83 = objc_msgSend_view(self, v81, v82);
        objc_msgSend_addSubview_(v83, v84, (uint64_t)v38);
        objc_msgSend__refreshMenuAffordanceVisibilityForExpandedButtonViewController_(self, v85, (uint64_t)v26);

        ++v19;
      }
      while (v19 < objc_msgSend_count(v11, v86, v87));
    }
    objc_msgSend_setExpandedViewInitialized_(self, v18, 1);
  }
}

- (void)_layoutExpandedView
{
  if (objc_msgSend_isExpandedViewInitialized(self, a2, v2))
  {
    int isExpanded = objc_msgSend__isExpanded(self, v4, v5);
    double v7 = MEMORY[0x2455F1C00]();
    CCUILayoutGutter();
    double v81 = v8;
    uint64_t v11 = objc_msgSend_currentDevice(MEMORY[0x263F1C5C0], v9, v10);
    if (objc_msgSend_userInterfaceIdiom(v11, v12, v13) == 1)
    {

      BOOL v16 = 0;
      uint64_t v18 = objc_msgSend__sizeForGridSizeClass_(self, v17, 9);
    }
    else
    {
      double v20 = objc_msgSend_traitCollection(self, v14, v15);
      uint64_t v23 = objc_msgSend_verticalSizeClass(v20, v21, v22);

      BOOL v16 = v23 == 1;
      if (v23 == 1) {
        uint64_t v18 = objc_msgSend__sizeForGridSizeClass_(self, v24, 10);
      }
      else {
        uint64_t v18 = objc_msgSend__sizeForGridSizeClass_(self, v24, 9);
      }
    }
    double v80 = v19;
    MEMORY[0x2455F1C00](v18);
    CCUILayoutGutter();
    uint64_t v25 = CCUICompactModuleContinuousCornerRadiusForGridSizeClass();
    double v27 = v26;
    MEMORY[0x2455F1C00](v25);
    CCUILayoutGutter();
    CCUICompactModuleContinuousCornerRadiusForGridSizeClass();
    double v29 = v28;
    objc_msgSend_orderedExpandedButtonViewControllers(self, v30, v31);
    id v82 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v82, v32, v33))
    {
      unint64_t v35 = 0;
      if (isExpanded) {
        double v36 = 1.0;
      }
      else {
        double v36 = 0.0;
      }
      double v78 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v79 = *MEMORY[0x263F001A8];
      double v76 = *(double *)(MEMORY[0x263F001A8] + 24);
      double v77 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v37 = v80 * 0.5 - v81 * 0.5;
      do
      {
        double v38 = objc_msgSend_objectAtIndex_(v82, v34, v35);
        uint64_t v39 = objc_opt_class();
        id v40 = v38;
        if (v39)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v41 = v40;
          }
          else {
            uint64_t v41 = 0;
          }
        }
        else
        {
          uint64_t v41 = 0;
        }
        id v42 = v41;

        id v47 = objc_msgSend_templateView(v42, v43, v44);
        if (!v47)
        {
          id v47 = objc_msgSend_templateViewForExpandedConnectivityModule(v40, v45, v46);
        }
        objc_msgSend_setAlpha_(v47, v45, v46, v36);
        int v49 = v35 - 5 < 0xFFFFFFFFFFFFFFFCLL || v16;
        if (v49) {
          uint64_t v50 = 3;
        }
        else {
          uint64_t v50 = 4;
        }
        if (v49) {
          double v51 = v27;
        }
        else {
          double v51 = v29;
        }
        objc_msgSend_setGridSizeClass_(v47, v48, v50);
        objc_msgSend_setContinuousCornerRadius_(v47, v52, v53, v51);
        if (v16)
        {
          unint64_t v56 = v35 - 4;
          if (v35 < 4) {
            unint64_t v56 = v35;
          }
          double v57 = 0.0;
          if (v35 >= 4) {
            double v57 = v81 * 0.5 + v80 * 0.5;
          }
          double v58 = v81 * (double)v56 + v7 * (double)v56;
          double v59 = v7;
LABEL_35:
          objc_msgSend_setFrame_(v47, v54, v55, v57, v58, v37, v59);
        }
        else if (v35 - 5 > 0xFFFFFFFFFFFFFFFBLL)
        {
          double v63 = v76;
          double v62 = v77;
          double v65 = v78;
          double v64 = v79;
          switch(v35)
          {
            case 1uLL:
              objc_msgSend_setFrame_(v47, v54, v55, 0.0, v7 + v81, v37, v81 + v7 * 2.0);
              goto LABEL_45;
            case 2uLL:
              double v63 = v81 + v7 * 2.0;
              double v62 = v80 * 0.5 - v81 * 0.5;
              double v65 = v7 + v81;
              goto LABEL_43;
            case 3uLL:
              double v57 = 0.0;
              double v58 = v81 * 3.0 + v7 * 3.0;
              double v59 = v81 + v7 * 2.0;
              goto LABEL_35;
            case 4uLL:
              double v65 = v81 * 3.0 + v7 * 3.0;
              double v63 = v81 + v7 * 2.0;
              double v62 = v80 * 0.5 - v81 * 0.5;
LABEL_43:
              double v64 = v81 * 0.5 + v80 * 0.5;
              break;
            default:
              break;
          }
          objc_msgSend_setFrame_(v47, v54, v55, v64, v65, v62, v63);
        }
        else
        {
          objc_msgSend_setFrame_(v47, v54, v55, 0.0, v81 * (double)v35 + v7 * (double)v35, v80, v7);
        }
LABEL_45:
        double v66 = objc_msgSend_contentMetrics(self, v60, v61);
        double v69 = v66;
        if (v66)
        {
          objc_msgSend_symbolScaleFactor(v66, v67, v68);
          double v71 = v70;
          CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v84) >= 375.0) {
            objc_msgSend_setGlyphScale_(v42, v72, v73, v71);
          }
          else {
            objc_msgSend_setGlyphScale_(v42, v72, v73, v71 * 0.8);
          }
        }
        objc_msgSend__refreshMenuAffordanceVisibilityForExpandedButtonViewController_(self, v67, (uint64_t)v40);

        ++v35;
      }
      while (v35 < objc_msgSend_count(v82, v74, v75));
    }
  }
}

- (BOOL)_isExpanded
{
  char isCurrentGridSizeClassImplicitlyExpanded = objc_msgSend__isCurrentGridSizeClassImplicitlyExpanded(self, a2, v2);
  return isCurrentGridSizeClassImplicitlyExpanded | objc_msgSend_isExpandedFromTransition(self, v5, v6);
}

- (void)_updateButtonContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v41[3] = *MEMORY[0x263EF8340];
  if (objc_msgSend_isButtonContentModeExpanded(self, a2, a3) != a3)
  {
    objc_msgSend_setButtonContentModeExpanded_(self, v5, v3);
    char isWifiOnlySKU = objc_msgSend_isWifiOnlySKU(self, v6, v7);
    uint64_t v11 = objc_msgSend_wifiModuleViewController(self, v9, v10);
    uint64_t v14 = (void *)v11;
    if (isWifiOnlySKU)
    {
      v40[0] = v11;
      uint64_t v15 = objc_msgSend_bluetoothModuleViewController(self, v12, v13);
      v40[1] = v15;
      uint64_t v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v16, (uint64_t)v40, 2);
    }
    else
    {
      v41[0] = v11;
      uint64_t v15 = objc_msgSend_bluetoothModuleViewController(self, v12, v13);
      v41[1] = v15;
      double v20 = objc_msgSend_expandedCellularDataButtonViewController(self, v18, v19);
      v41[2] = v20;
      uint64_t v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v21, (uint64_t)v41, 3);
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v22 = v17;
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v35, v39, 16);
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v36;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(v22);
          }
          double v28 = *(void **)(*((void *)&v35 + 1) + 8 * v27);
          uint64_t v29 = objc_opt_class();
          id v30 = v28;
          if (v29)
          {
            if (objc_opt_isKindOfClass()) {
              uint64_t v31 = v30;
            }
            else {
              uint64_t v31 = 0;
            }
          }
          else
          {
            uint64_t v31 = 0;
          }
          id v32 = v31;

          if (v32) {
            objc_msgSend_containerWillTransitionToExpandedContentMode_(v32, v33, v3, (void)v35);
          }

          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v34, (uint64_t)&v35, v39, 16);
      }
      while (v25);
    }
  }
}

- (void)_refreshMenuAffordanceVisibilityForExpandedButtonViewController:(id)a3
{
  id v4 = a3;
  objc_msgSend_wifiModuleViewController(self, v5, v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_expandedCellularDataButtonViewController(self, v8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_bluetoothModuleViewController(self, v11, v12);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_airDropModuleViewController(self, v14, v15);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_satelliteModuleViewController(self, v17, v18);
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v20 = objc_opt_class();
  id v38 = v4;
  if (v20)
  {
    if (objc_opt_isKindOfClass()) {
      double v21 = v38;
    }
    else {
      double v21 = 0;
    }
  }
  else
  {
    double v21 = 0;
  }
  id v22 = v21;

  if (v22) {
    objc_msgSend_templateView(v22, v23, v24);
  }
  else {
  uint64_t v25 = objc_msgSend_templateViewForExpandedConnectivityModule(v38, v23, v24);
  }
  double v28 = v25;
  BOOL v29 = 1;
  if (v7 != v4 && v13 != v4)
  {
    if (v10 == v4)
    {
      uint64_t v33 = objc_msgSend_showsMenuModuleAsPrimaryAction(v22, v26, v27);
      objc_msgSend_setShowsMenuAffordance_(v28, v34, v33);
      goto LABEL_19;
    }
    if (v16 == v4) {
      goto LABEL_19;
    }
    if (v19 == v4)
    {
      id v30 = objc_msgSend_contextMenuDelegate(v25, v26, v27);
      long long v37 = objc_msgSend_contextMenuItems(v30, v35, v36);
      BOOL v29 = v37 != 0;
    }
    else
    {
      id v30 = objc_msgSend_contextMenuItems(v22, v26, v27);
      BOOL v29 = objc_msgSend_count(v30, v31, v32) != 0;
    }
  }
  objc_msgSend_setShowsMenuAffordance_(v28, v26, v29);
LABEL_19:
}

- (id)_makeButtonWithClass:(Class)a3
{
  if (objc_msgSend_isSupported(a3, a2, (uint64_t)a3)) {
    id v4 = objc_alloc_init(a3);
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)_initializeButtons
{
  objc_msgSend_contentModuleContext(self, a2, v2);
  id v59 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = objc_alloc_init(MEMORY[0x263F33C00]);
  objc_msgSend_setAirDropModuleViewController_(self, v5, (uint64_t)v4);
  id v6 = objc_alloc(MEMORY[0x263F33C08]);
  double v57 = objc_msgSend_initWithContentModuleContext_(v6, v7, (uint64_t)v59);
  objc_msgSend_setBluetoothModuleViewController_(self, v8, (uint64_t)v57);
  id v9 = objc_alloc(MEMORY[0x263F33C20]);
  double v58 = objc_msgSend_initWithContentModuleContext_(v9, v10, (uint64_t)v59);
  objc_msgSend_setSatelliteModuleViewController_(self, v11, (uint64_t)v58);
  id v55 = objc_alloc_init(MEMORY[0x263F33C28]);
  objc_msgSend_setVpnModuleViewController_(self, v12, (uint64_t)v55);
  id v13 = objc_alloc(MEMORY[0x263F33C30]);
  uint64_t v15 = objc_msgSend_initWithContentModuleContext_(v13, v14, (uint64_t)v59);
  objc_msgSend_setWifiModuleViewController_(self, v16, (uint64_t)v15);
  uint64_t v17 = objc_opt_class();
  uint64_t v19 = objc_msgSend__makeButtonWithClass_(self, v18, v17);
  uint64_t v20 = objc_opt_class();
  id v22 = objc_msgSend__makeButtonWithClass_(self, v21, v20);
  uint64_t v23 = objc_opt_class();
  uint64_t v25 = objc_msgSend__makeButtonWithClass_(self, v24, v23);
  objc_msgSend_setAirplaneButtonViewController_(self, v26, v19);
  objc_msgSend_setCellularDataButtonViewController_(self, v27, (uint64_t)v22);
  objc_msgSend_setHotspotButtonViewController_(self, v28, (uint64_t)v25);
  uint64_t v29 = objc_opt_class();
  uint64_t v31 = objc_msgSend__makeButtonWithClass_(self, v30, v29);
  uint64_t v32 = objc_opt_class();
  long long v34 = objc_msgSend__makeButtonWithClass_(self, v33, v32);
  uint64_t v35 = objc_opt_class();
  long long v37 = objc_msgSend__makeButtonWithClass_(self, v36, v35);
  objc_msgSend_setExpandedAirplaneButtonViewController_(self, v38, (uint64_t)v31);
  objc_msgSend_setExpandedCellularDataButtonViewController_(self, v39, (uint64_t)v34);
  objc_msgSend_setExpandedHotspotButtonViewController_(self, v40, (uint64_t)v37);
  id v41 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v56 = (void *)v19;
  objc_msgSend_addObject_(v41, v42, v19);
  objc_msgSend_addObject_(v41, v43, (uint64_t)v4);
  objc_msgSend_addObject_(v41, v44, (uint64_t)v15);
  if (v22) {
    objc_msgSend_addObject_(v41, v45, (uint64_t)v22);
  }
  objc_msgSend_addObject_(v41, v45, (uint64_t)v57);
  if (v25) {
    objc_msgSend_addObject_(v41, v46, (uint64_t)v25);
  }
  if (v55) {
    objc_msgSend_addObject_(v41, v46, (uint64_t)v55);
  }
  id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_msgSend_addObject_(v47, v48, (uint64_t)v31);
  objc_msgSend_addObject_(v47, v49, (uint64_t)v15);
  objc_msgSend_addObject_(v47, v50, (uint64_t)v4);
  if (v34) {
    objc_msgSend_addObject_(v47, v51, (uint64_t)v34);
  }
  objc_msgSend_addObject_(v47, v51, (uint64_t)v57);
  if (v37) {
    objc_msgSend_addObject_(v47, v52, (uint64_t)v37);
  }
  if (v55) {
    objc_msgSend_addObject_(v47, v52, (uint64_t)v55);
  }
  if (v58) {
    objc_msgSend_addObject_(v47, v52, (uint64_t)v58);
  }
  objc_msgSend_setOrderedButtonViewControllers_(self, v52, (uint64_t)v41);
  objc_msgSend_setOrderedExpandedButtonViewControllers_(self, v53, (uint64_t)v47);
  if (!v22 || !v34) {
    objc_msgSend_setWifiOnlySKU_(self, v54, 1);
  }
}

- (void)_addViewControllers:(id)a3 forwardingAppearanceMethods:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v21, v25, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend_conformsToProtocol_(v13, v9, (uint64_t)&unk_26F4DE620))
        {
          objc_msgSend_loadViewIfNeeded(v13, v14, v15);
          objc_msgSend_ccui_safelyBeginAppearanceTransition_animated_(v13, v16, 1, 0);
          objc_msgSend_ccui_safelyEndAppearanceTransition(v13, v17, v18);
        }
        else
        {
          objc_msgSend_bs_addChildViewController_(self, v14, (uint64_t)v13);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v21, v25, 16);
    }
    while (v10);
  }
  if (v4)
  {
    objc_msgSend_ccui_safelyBeginAppearanceTransitionForChildViewControllers_animated_(self, v9, 1, 0);
    objc_msgSend_ccui_safelyEndAppearanceTransitionForChildViewControllers(self, v19, v20);
  }
}

- (BOOL)_isCurrentGridSizeClassImplicitlyExpanded
{
  uint64_t v4 = 1 << objc_msgSend_gridSizeClass(self, a2, v2);
  return (objc_msgSend_implicitlyExpandedGridSizeClasses(self, v5, v6) & v4) != 0;
}

- (void)_removeVisibleContextMenuFromExpandedButtonViewControllers
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  BOOL v3 = objc_msgSend_orderedExpandedButtonViewControllers(self, a2, v2);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v24, v28, 16);
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend_conformsToProtocol_(v10, v6, (uint64_t)&unk_26F4DE620))
        {
          id v13 = objc_msgSend_templateViewForExpandedConnectivityModule(v10, v11, v12);
          objc_msgSend_dismissVisibleMenu(v13, v14, v15);
        }
        else
        {
          uint64_t v16 = objc_opt_class();
          id v17 = v10;
          if (v16)
          {
            if (objc_opt_isKindOfClass()) {
              uint64_t v18 = v17;
            }
            else {
              uint64_t v18 = 0;
            }
          }
          else
          {
            uint64_t v18 = 0;
          }
          id v19 = v18;

          id v13 = objc_msgSend_templateView(v19, v20, v21);

          objc_msgSend_dismissVisibleMenu(v13, v22, v23);
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v24, v28, 16);
    }
    while (v7);
  }
}

- (CGSize)_sizeForGridSizeClass:(int64_t)a3
{
  BOOL v3 = objc_msgSend_contentMetrics(self, a2, a3);
  objc_msgSend_gridGeometryInfo(v3, v4, v5);
  double v7 = v6;
  double v9 = v8;
  double v10 = (double)CCUINumberOfRowsForGridSizeClass();
  unsigned int v11 = CCUINumberOfColumnsForGridSizeClass();
  double v12 = v9 * ((double)v11 + -1.0) + (double)v11 * v7;

  double v13 = v12;
  double v14 = v9 * (v10 + -1.0) + v10 * v7;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (id)presentedViewControllerForContentModuleDetailClickPresentationInteractionController:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  self->_presentingMenuViewController = 1;
  uint64_t v4 = objc_msgSend_viewForInteraction(a3, a2, (uint64_t)a3);
  objc_msgSend_orderedExpandedButtonViewControllers(self, v5, v6);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  double v10 = (objc_class *)objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v34, v38, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (objc_class *)((char *)i + 1))
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v7);
        }
        double v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (objc_msgSend_conformsToProtocol_(v13, v9, (uint64_t)&unk_26F4DE620, (void)v34))
        {
          id v14 = v13;
          id v17 = objc_msgSend_templateViewForExpandedConnectivityModule(v14, v15, v16);
          if (v4 == v17)
          {
            double v10 = (objc_class *)objc_opt_class();

            goto LABEL_13;
          }
        }
      }
      double v10 = (objc_class *)objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v34, v38, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  uint64_t v18 = objc_opt_class();
  if (objc_msgSend_isSubclassOfClass_(v10, v19, v18))
  {
    long long v22 = objc_msgSend_contentModuleContext(self, v20, v21);
    id v23 = [v10 alloc];
    long long v25 = objc_msgSend_initWithContentModuleContext_(v23, v24, (uint64_t)v22);
    objc_msgSend_setModalPresentationStyle_(v25, v26, 4);
    objc_msgSend_setAlwaysExpanded_(v25, v27, 1);
    objc_msgSend_setShouldProvideOwnPlatter_(v25, v28, 1);
    uint64_t v31 = objc_msgSend_contentMetrics(self, v29, v30);
    objc_msgSend_setContentMetrics_(v25, v32, (uint64_t)v31);
  }
  else
  {
    long long v25 = 0;
  }

  return v25;
}

- (BOOL)contentModuleDetailClickPresentationInteractionControllerInteractionShouldBegin:(id)a3
{
  return 1;
}

- (void)contentModuleDetailClickPresentationInteractionController:(id)a3 requestsAuthenticationForPresentationWithCompletionHandler:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    double v8 = objc_msgSend_contentModuleContext(self, v5, v6);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_240633294;
    v10[3] = &unk_2650C9420;
    id v11 = v7;
    objc_msgSend_requestAuthenticationWithCompletionHandler_(v8, v9, (uint64_t)v10);
  }
}

- (void)contentModuleDetailClickPresentationInteractionControllerInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  self->_presentingMenuViewController = 0;
}

- (BOOL)performPrimaryActionForControlTemplateView:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_clickPresentationInteractionManagers(self, v5, v6);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v20, v24, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend_viewForInteraction(v15, v10, v11, (void)v20);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        if (v16 == v4)
        {
          objc_msgSend_presentViewController(v15, v17, v18);

          goto LABEL_11;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v20, v24, 16);
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return 1;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (int64_t)gridSizeClass
{
  return self->_gridSizeClass;
}

- (BOOL)isResizing
{
  return self->_resizing;
}

- (BOOL)isWifiOnlySKU
{
  return self->_wifiOnlySKU;
}

- (void)setWifiOnlySKU:(BOOL)a3
{
  self->_wifiOnlySKU = a3;
}

- (BOOL)isCollapsedViewInitialized
{
  return self->_collapsedViewInitialized;
}

- (void)setCollapsedViewInitialized:(BOOL)a3
{
  self->_collapsedViewInitialized = a3;
}

- (BOOL)isExpandedViewInitialized
{
  return self->_expandedViewInitialized;
}

- (void)setExpandedViewInitialized:(BOOL)a3
{
  self->_expandedViewInitialized = a3;
}

- (BOOL)isExpandedFromTransition
{
  return self->_expandedFromTransition;
}

- (void)setExpandedFromTransition:(BOOL)a3
{
  self->_expandedFromTransition = a3;
}

- (BOOL)isButtonContentModeExpanded
{
  return self->_buttonContentModeExpanded;
}

- (void)setButtonContentModeExpanded:(BOOL)a3
{
  self->_buttonContentModeExpanded = a3;
}

- (UIView)backgroundPlatterView
{
  return self->_backgroundPlatterView;
}

- (void)setBackgroundPlatterView:(id)a3
{
}

- (NSArray)orderedButtonViewControllers
{
  return self->_orderedButtonViewControllers;
}

- (void)setOrderedButtonViewControllers:(id)a3
{
}

- (CCUIConnectivityButtonViewController)airplaneButtonViewController
{
  return self->_airplaneButtonViewController;
}

- (void)setAirplaneButtonViewController:(id)a3
{
}

- (CCUIConnectivityButtonViewController)cellularDataButtonViewController
{
  return self->_cellularDataButtonViewController;
}

- (void)setCellularDataButtonViewController:(id)a3
{
}

- (CCUIConnectivityButtonViewController)hotspotButtonViewController
{
  return self->_hotspotButtonViewController;
}

- (void)setHotspotButtonViewController:(id)a3
{
}

- (NSArray)orderedExpandedButtonViewControllers
{
  return self->_orderedExpandedButtonViewControllers;
}

- (void)setOrderedExpandedButtonViewControllers:(id)a3
{
}

- (CCUIConnectivityButtonViewController)expandedAirplaneButtonViewController
{
  return self->_expandedAirplaneButtonViewController;
}

- (void)setExpandedAirplaneButtonViewController:(id)a3
{
}

- (CCUIConnectivityButtonViewController)expandedCellularDataButtonViewController
{
  return self->_expandedCellularDataButtonViewController;
}

- (void)setExpandedCellularDataButtonViewController:(id)a3
{
}

- (CCUIConnectivityButtonViewController)expandedBluetoothButtonViewController
{
  return self->_expandedBluetoothButtonViewController;
}

- (void)setExpandedBluetoothButtonViewController:(id)a3
{
}

- (CCUIConnectivityButtonViewController)expandedHotspotButtonViewController
{
  return self->_expandedHotspotButtonViewController;
}

- (void)setExpandedHotspotButtonViewController:(id)a3
{
}

- (CCUIAirDropModuleViewController)airDropModuleViewController
{
  return self->_airDropModuleViewController;
}

- (void)setAirDropModuleViewController:(id)a3
{
}

- (CCUIBluetoothModuleViewController)bluetoothModuleViewController
{
  return self->_bluetoothModuleViewController;
}

- (void)setBluetoothModuleViewController:(id)a3
{
}

- (CCUIVPNModuleViewController)vpnModuleViewController
{
  return self->_vpnModuleViewController;
}

- (void)setVpnModuleViewController:(id)a3
{
}

- (CCUIWiFiModuleViewController)wifiModuleViewController
{
  return self->_wifiModuleViewController;
}

- (void)setWifiModuleViewController:(id)a3
{
}

- (CCUISatelliteModuleViewController)satelliteModuleViewController
{
  return self->_satelliteModuleViewController;
}

- (void)setSatelliteModuleViewController:(id)a3
{
}

- (NSMutableSet)clickPresentationInteractionManagers
{
  return self->_clickPresentationInteractionManagers;
}

- (void)setClickPresentationInteractionManagers:(id)a3
{
}

- (BOOL)presentingMenuViewController
{
  return self->_presentingMenuViewController;
}

- (void)setPresentingMenuViewController:(BOOL)a3
{
  self->_presentingMenuViewController = a3;
}

- (OS_dispatch_queue)coreTelephonyQueue
{
  return self->_coreTelephonyQueue;
}

- (void)setCoreTelephonyQueue:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_coreTelephonyQueue, 0);
  objc_storeStrong((id *)&self->_clickPresentationInteractionManagers, 0);
  objc_storeStrong((id *)&self->_satelliteModuleViewController, 0);
  objc_storeStrong((id *)&self->_wifiModuleViewController, 0);
  objc_storeStrong((id *)&self->_vpnModuleViewController, 0);
  objc_storeStrong((id *)&self->_bluetoothModuleViewController, 0);
  objc_storeStrong((id *)&self->_airDropModuleViewController, 0);
  objc_storeStrong((id *)&self->_expandedHotspotButtonViewController, 0);
  objc_storeStrong((id *)&self->_expandedBluetoothButtonViewController, 0);
  objc_storeStrong((id *)&self->_expandedCellularDataButtonViewController, 0);
  objc_storeStrong((id *)&self->_expandedAirplaneButtonViewController, 0);
  objc_storeStrong((id *)&self->_orderedExpandedButtonViewControllers, 0);
  objc_storeStrong((id *)&self->_hotspotButtonViewController, 0);
  objc_storeStrong((id *)&self->_cellularDataButtonViewController, 0);
  objc_storeStrong((id *)&self->_airplaneButtonViewController, 0);
  objc_storeStrong((id *)&self->_orderedButtonViewControllers, 0);
  objc_storeStrong((id *)&self->_backgroundPlatterView, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);

  objc_storeStrong((id *)&self->_contentMetrics, 0);
}

@end