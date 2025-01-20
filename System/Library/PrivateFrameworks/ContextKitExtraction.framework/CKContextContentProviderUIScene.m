@interface CKContextContentProviderUIScene
+ (BOOL)_isRelevantForExtractionWithView:(id)a3;
+ (BOOL)_isSensitiveTextContentType:(id)a3;
+ (double)_fontSizeOfView:(id)a3 usingExecutor:(id)a4;
+ (id)_UIElementsForWebViewContentString:(id)a3;
+ (id)_allViewControllersFromUIViews:(id)a3;
+ (id)_bestContentStringForWebViewUIElements:(id)a3 andTitle:(id)a4;
+ (id)_bestVisibleStringForView:(id)a3 usingExecutor:(id)a4;
+ (id)_descendantsRelevantForContentExtractionFromWindow:(id)a3;
+ (id)_extractItemsFromViewControllers:(id)a3;
+ (id)_firstAvailableUIViewControllerForUIView:(id)a3;
+ (id)_getNotableSuperviewClassNamesForView:(id)a3;
+ (id)_handleWKWebView:(id)a3 withExecutor:(id)a4;
+ (void)_descendantsRelevantForContentExtractionFromView:(id)a3 intoArray:(id)a4;
+ (void)_donateContentsOfWindow:(id)a3 usingExecutor:(id)a4 withOptions:(unint64_t)a5;
+ (void)_donateText:(id)a3 withTitle:(id)a4 debugText:(id)a5 debugUrlString:(id)a6 rawHTML:(id)a7 leadImage:(id)a8 snapshot:(id)a9 uiElements:(id)a10 extractionItems:(id)a11 usingContextFromExecutor:(id)a12;
+ (void)_extractContentFromWebView:(id)a3 includingSnapshot:(BOOL)a4 includingUIBoundingBox:(BOOL)a5 ignoreViewTextLengthRequirements:(BOOL)a6 ignoreViewCountCap:(BOOL)a7 includeRawHTML:(BOOL)a8 withCompletionHandler:(id)a9;
+ (void)extractFromScene:(id)a3 usingExecutor:(id)a4 withOptions:(unint64_t)a5;
+ (void)initialize;
- (BOOL)_determineIfDebuggingControlsShouldBeAllowed;
- (BOOL)_shouldInstallAppSwitcherControls;
- (CKContextContentProviderUIScene)initWithScene:(id)a3;
- (UIScene)_scene;
- (id)_containerViewForDebugButtons;
- (id)_descendantsRelevantForDebugControls:(id)a3;
- (void)_didSelectDebugControl:(id)a3;
- (void)_didSelectRecentsControl:(id)a3;
- (void)_installDebuggingButton;
- (void)_installDebuggingControlsIfApplicable;
- (void)_installRecentsButton;
- (void)_sceneWillInvalidate:(id)a3;
- (void)_setScene:(id)a3;
- (void)_setUpDebuggingControlsIfPossibleAfterDelay:(double)a3;
- (void)extractUsingExecutor:(id)a3 withOptions:(unint64_t)a4;
@end

@implementation CKContextContentProviderUIScene

+ (void)initialize
{
  v13[6] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v3 = *MEMORY[0x1E4F43D60];
    v13[0] = *MEMORY[0x1E4F43D50];
    v13[1] = v3;
    uint64_t v4 = *MEMORY[0x1E4F43DD8];
    v13[2] = *MEMORY[0x1E4F43E18];
    v13[3] = v4;
    uint64_t v5 = *MEMORY[0x1E4F43DC8];
    v13[4] = *MEMORY[0x1E4F43DB0];
    v13[5] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:6];
    uint64_t v7 = [v2 setWithArray:v6];
    v8 = (void *)kSensitiveContentTypes;
    kSensitiveContentTypes = v7;

    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0E60628];
    v10 = (void *)kNotNotableSuperviewClassNames;
    kNotNotableSuperviewClassNames = v9;

    uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0E60640];
    v12 = (void *)kClassesExcludedFromTextExtraction;
    kClassesExcludedFromTextExtraction = v11;
  }
}

- (CKContextContentProviderUIScene)initWithScene:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKContextContentProviderUIScene;
  uint64_t v5 = [(CKContextContentProviderUIScene *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(CKContextContentProviderUIScene *)v5 _setScene:v4];
    uint64_t v7 = +[CKContextContentProviderManager sharedManager];
    [v7 addProvider:v6];

    if (+[CKContextContentProviderManager isSpringBoard])
    {
      [(CKContextContentProviderUIScene *)v6 _setUpDebuggingControlsIfPossibleAfterDelay:2.0];
    }
    v8 = v6;
  }

  return v6;
}

- (void)_setScene:(id)a3
{
}

- (void)_sceneWillInvalidate:(id)a3
{
  p_toolInstallationTimer = &self->_toolInstallationTimer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toolInstallationTimer);
  int v6 = [WeakRetained isValid];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_toolInstallationTimer);
    [v7 invalidate];

    objc_storeWeak((id *)p_toolInstallationTimer, 0);
  }
  v8 = +[CKContextContentProviderManager sharedManager];
  [v8 removeProvider:self];

  [(CKContextContentProviderUIScene *)self _setScene:0];
}

- (void)extractUsingExecutor:(id)a3 withOptions:(unint64_t)a4
{
  id v7 = a3;
  int v6 = [(CKContextContentProviderUIScene *)self _scene];
  if (v6) {
    [(id)objc_opt_class() extractFromScene:v6 usingExecutor:v7 withOptions:a4];
  }
}

+ (void)extractFromScene:(id)a3 usingExecutor:(id)a4 withOptions:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (v7 && (unint64_t)[v7 activationState] <= 1)
    {
      uint64_t v9 = [v7 _visibleWindows];
      if ([v9 count])
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        v16 = v9;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
              v17[0] = MEMORY[0x1E4F143A8];
              v17[1] = 3221225472;
              v17[2] = __78__CKContextContentProviderUIScene_extractFromScene_usingExecutor_withOptions___block_invoke;
              v17[3] = &unk_1E6111068;
              v17[4] = v15;
              v17[5] = a5;
              [v8 addWorkItem:v17];
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v12);
        }

        uint64_t v9 = v16;
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[CKContextContentProviderUIScene extractFromScene:usingExecutor:withOptions:]();
  }
}

void __78__CKContextContentProviderUIScene_extractFromScene_usingExecutor_withOptions___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = (void *)MEMORY[0x1BA99DCE0]();
  +[CKContextContentProviderUIScene _donateContentsOfWindow:*(void *)(a1 + 32) usingExecutor:v4 withOptions:*(void *)(a1 + 40)];
}

+ (BOOL)_isRelevantForExtractionWithView:(id)a3
{
  id v3 = a3;
  if ([v3 isHidden]) {
    goto LABEL_5;
  }
  [v3 alpha];
  if (v4 < 0.05) {
    goto LABEL_5;
  }
  [v3 frame];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  if (CGRectGetWidth(v13) < 30.0
    || (v14.origin.CGFloat x = x, v14.origin.y = y,
                          v14.size.CGFloat width = width,
                          v14.size.CGFloat height = height,
                          CGRectGetHeight(v14) < 17.0))
  {
LABEL_5:
    LOBYTE(v9) = 0;
  }
  else
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    int v9 = [(id)kClassesExcludedFromTextExtraction containsObject:v12] ^ 1;
  }
  return v9;
}

+ (void)_descendantsRelevantForContentExtractionFromView:(id)a3 intoArray:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isRelevantForExtractionWithView:v6])
  {
    [v7 addObject:v6];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = objc_msgSend(v6, "subviews", 0);
    int v9 = [v8 reverseObjectEnumerator];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          CGRect v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
          if (![v6 clipsToBounds]) {
            goto LABEL_9;
          }
          [v6 bounds];
          CGFloat v16 = v15;
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          [v14 frame];
          v34.origin.CGFloat x = v23;
          v34.origin.CGFloat y = v24;
          v34.size.CGFloat width = v25;
          v34.size.CGFloat height = v26;
          v33.origin.CGFloat x = v16;
          v33.origin.CGFloat y = v18;
          v33.size.CGFloat width = v20;
          v33.size.CGFloat height = v22;
          if (CGRectIntersectsRect(v33, v34)) {
LABEL_9:
          }
            [a1 _descendantsRelevantForContentExtractionFromView:v14 intoArray:v7];
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }
  }
}

+ (id)_descendantsRelevantForContentExtractionFromWindow:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v40 = v4;
  id v6 = [v4 subviews];
  id v7 = [v6 reverseObjectEnumerator];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v8)
  {
    uint64_t v10 = 0;
    goto LABEL_17;
  }
  uint64_t v9 = v8;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v42;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v42 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      if (([v13 isHidden] & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_12;
        }
        CGRect v14 = [MEMORY[0x1E4F42D90] mainScreen];
        [v14 bounds];
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;

        [v13 frame];
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        v48.origin.CGFloat x = v16;
        v48.origin.CGFloat y = v18;
        v48.size.CGFloat width = v20;
        v48.size.CGFloat height = v22;
        double Width = CGRectGetWidth(v48);
        [v13 frame];
        double v32 = CGRectGetWidth(v49);
        if (!v10) {
          goto LABEL_11;
        }
        double v33 = v32;
        [v10 frame];
        v51.origin.CGFloat x = v34;
        v51.origin.CGFloat y = v35;
        v51.size.CGFloat width = v36;
        v51.size.CGFloat height = v37;
        v50.origin.CGFloat x = v24;
        v50.origin.CGFloat y = v26;
        v50.size.CGFloat width = v28;
        v50.size.CGFloat height = v30;
        if (!CGRectEqualToRect(v50, v51) || vabdd_f64(Width, v33) <= 20.0)
        {
LABEL_11:
          id v38 = v13;

          uint64_t v10 = v38;
LABEL_12:
          [a1 _descendantsRelevantForContentExtractionFromView:v13 intoArray:v5];
          continue;
        }
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v41 objects:v45 count:16];
  }
  while (v9);
LABEL_17:

  return v5;
}

+ (id)_allViewControllersFromUIViews:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(a1, "_firstAvailableUIViewControllerForUIView:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_firstAvailableUIViewControllerForUIView:(id)a3
{
  id v3 = [a3 nextResponder];
  if (v3)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v4 = [v3 nextResponder];

      id v3 = (void *)v4;
    }
    while (v4);
  }

  return v3;
}

+ (void)_donateContentsOfWindow:(id)a3 usingExecutor:(id)a4 withOptions:(unint64_t)a5
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v77 = v8;
  uint64_t v10 = [a1 _descendantsRelevantForContentExtractionFromWindow:v8];
  if (![v10 count]) {
    goto LABEL_48;
  }
  v70 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  unint64_t v69 = (unint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v11 = a5 & 0x20;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v66 = v10;
  id obj = v10;
  unint64_t v74 = v11;
  id v75 = a1;
  unint64_t v79 = a5;
  uint64_t v80 = [obj countByEnumeratingWithState:&v81 objects:v87 count:16];
  uint64_t v12 = 0;
  if (!v80) {
    goto LABEL_36;
  }
  uint64_t v13 = *(void *)v82;
  uint64_t v14 = 250;
  if ((a5 & 0x20) != 0) {
    uint64_t v14 = -1;
  }
  unint64_t v67 = v14;
  uint64_t v72 = *(void *)v82;
  id v73 = v9;
  do
  {
    for (uint64_t i = 0; i != v80; ++i)
    {
      if (*(void *)v82 != v13) {
        objc_enumerationMutation(obj);
      }
      long long v16 = *(void **)(*((void *)&v81 + 1) + 8 * i);
      double v17 = [a1 _bestVisibleStringForView:v16 usingExecutor:v9];
      uint64_t v18 = [v17 length];
      if (v11 | v18)
      {
        uint64_t v19 = v18;
        v78 = v12;
        if (v18 && ([v70 containsObject:v17] & 1) == 0) {
          [v70 addObject:v17];
        }
        CGFloat v20 = (objc_class *)objc_opt_class();
        double v21 = NSStringFromClass(v20);
        CGFloat v22 = [a1 _getNotableSuperviewClassNamesForView:v16];
        [a1 _fontSizeOfView:v16 usingExecutor:v9];
        double v24 = v23;
        if (v19)
        {
          unint64_t v25 = [v17 length];
          if (v67 >= v25) {
            unint64_t v26 = v25;
          }
          else {
            unint64_t v26 = v67;
          }
          objc_msgSend(v17, "substringWithRange:", 0, v26);
          double v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          double v27 = &stru_1F0E5E050;
        }
        CGFloat v28 = [[CKContextUIElement alloc] initWithText:v27 className:v21];
        [(CKContextUIElement *)v28 setSuperviewClassNames:v22];
        *(float *)&double v29 = v24;
        [(CKContextUIElement *)v28 setFontSize:v29];
        a5 = [v77 windowScene];
        CGFloat v30 = [(id)a5 _sceneIdentifier];
        v31 = (void *)[v30 copy];
        [(CKContextUIElement *)v28 setSceneIdentifier:v31];

        LOBYTE(a5) = v79;
        if ((v79 & 4) != 0)
        {
          BOOL v71 = +[CKContextSharedExtractionHelper elementIsOnScreenWithView:v16 window:v77];
          [v16 bounds];
          objc_msgSend(v16, "convertRect:toView:", v77);
          double v33 = v32;
          double v35 = v34;
          -[CKContextUIElement setFrameInWindow:](v28, "setFrameInWindow:");
          CGFloat v36 = [v77 screen];
          CGFloat v37 = [v36 coordinateSpace];
          LOBYTE(a5) = v79;
          objc_msgSend(v77, "convertPoint:toCoordinateSpace:", v37, v33, v35);
          -[CKContextUIElement setAbsoluteOriginOnScreen:](v28, "setAbsoluteOriginOnScreen:");

          [(CKContextUIElement *)v28 setOnScreen:v71];
        }
        if ([(CKContextUIElement *)v28 isOnScreen])
        {
          id v38 = (void *)v69;
          id v9 = v73;
          a1 = v75;
          if ((a5 & 0x10) == 0)
          {
            unint64_t v39 = [(id)v69 count];
            id v38 = (void *)v69;
            LOBYTE(a5) = v79;
            if (v39 >= 0xFA) {
              goto LABEL_28;
            }
          }
        }
        else
        {
          id v38 = v68;
          id v9 = v73;
          a1 = v75;
          if ((a5 & 0x10) == 0)
          {
            unint64_t v40 = [v68 count];
            id v38 = v68;
            LOBYTE(a5) = v79;
            if (v40 > 0xF9) {
              goto LABEL_28;
            }
          }
        }
        [v38 addObject:v28];
LABEL_28:

        uint64_t v12 = v78;
        unint64_t v11 = v74;
        uint64_t v13 = v72;
      }
      if ((a5 & 1) != 0 && !v12)
      {
        long long v41 = +[CKContextSharedExtractionHelper bestImageForView:v16];
        uint64_t v12 = v41;
        if (v41) {
          id v42 = v41;
        }
      }
    }
    uint64_t v80 = [obj countByEnumeratingWithState:&v81 objects:v87 count:16];
  }
  while (v80);
LABEL_36:

  if ((a5 & 0x10) != 0)
  {
    v45 = v68;
    uint64_t v47 = [v68 count];
    long long v43 = (void *)v69;
  }
  else
  {
    long long v43 = (void *)v69;
    unint64_t v44 = 250 - [(id)v69 count];
    v45 = v68;
    unint64_t v46 = [v68 count];
    if (v44 >= v46) {
      uint64_t v47 = v46;
    }
    else {
      uint64_t v47 = v44;
    }
  }
  CGRect v48 = objc_msgSend(v45, "subarrayWithRange:", 0, v47);
  [v43 addObjectsFromArray:v48];

  CGRect v49 = 0;
  if ((v79 & 2) != 0)
  {
    uint64_t v10 = v66;
    if (!v12)
    {
      [v77 bounds];
      double v51 = v50;
      double v53 = v52;
      double v55 = v54;
      double v57 = v56;
      char v58 = [v77 isOpaque];
      v89.CGFloat width = v55;
      v89.CGFloat height = v57;
      UIGraphicsBeginImageContextWithOptions(v89, v58, 0.0);
      objc_msgSend(v77, "drawViewHierarchyInRect:afterScreenUpdates:", 1, v51, v53, v55, v57);
      CGRect v49 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
    }
  }
  else
  {
    uint64_t v10 = v66;
  }
  v59 = [a1 _allViewControllersFromUIViews:obj];
  v60 = [a1 _extractItemsFromViewControllers:v59];
  v61 = [v70 componentsJoinedByString:@"\n\n"];
  v62 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v63 = [v61 stringByTrimmingCharactersInSet:v62];
  unint64_t v64 = [v63 length];

  if ([v60 count] || objc_msgSend((id)v69, "count") | v74 || v64 > 0x2C)
  {
    v65 = (void *)v69;
    [v75 _donateText:v61 withTitle:0 debugText:0 debugUrlString:0 rawHTML:0 leadImage:v12 snapshot:v49 uiElements:v69 & ((uint64_t)(v79 << 60) >> 63) extractionItems:v60 usingContextFromExecutor:v9];
  }
  else
  {
    v65 = (void *)v69;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v86 = v64;
      _os_log_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "The extracted text (length %lu) is too short. Donation from UIKit hierarchy aborted.", buf, 0xCu);
    }
  }

LABEL_48:
}

+ (id)_getNotableSuperviewClassNamesForView:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [v3 superview];
  int v6 = 20;
  while (1)
  {
    if (!v5)
    {
      id v9 = 0;
      goto LABEL_10;
    }
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = [v5 superview];

    if (([(id)kNotNotableSuperviewClassNames containsObject:v8] & 1) == 0) {
      break;
    }
LABEL_6:

    id v5 = v9;
    if (!--v6) {
      goto LABEL_10;
    }
  }
  if ((unint64_t)[v4 count] <= 5)
  {
    [v4 addObject:v8];
    goto LABEL_6;
  }

LABEL_10:

  return v4;
}

+ (void)_donateText:(id)a3 withTitle:(id)a4 debugText:(id)a5 debugUrlString:(id)a6 rawHTML:(id)a7 leadImage:(id)a8 snapshot:(id)a9 uiElements:(id)a10 extractionItems:(id)a11 usingContextFromExecutor:(id)a12
{
  uint64_t v18 = (objc_class *)MEMORY[0x1E4F5AC48];
  id v29 = a12;
  id v19 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  id v30 = objc_alloc_init(v18);
  [v30 setText:v27];

  [v30 setTitle:v26];
  [v30 setDebugText:v25];

  [v30 setDebugUrlString:v24];
  [v30 setUiElements:v20];

  [v30 setExtractionItems:v19];
  [v30 setRawHTML:v23];

  +[CKContextExtractionUtil renderSnapshot:v21 toDonationItem:v30];
  +[CKContextExtractionUtil renderLeadImage:v22 toDonationItem:v30];

  CGFloat v28 = [v29 context];

  [v28 addItem:v30];
}

+ (BOOL)_isSensitiveTextContentType:(id)a3
{
  return [(id)kSensitiveContentTypes containsObject:a3];
}

+ (double)_fontSizeOfView:(id)a3 usingExecutor:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  double v5 = 0.0;
  if (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector())
  {
    int v6 = [v4 performSelector:sel_font];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 pointSize];
      double v5 = v7;
    }
  }
  return v5;
}

+ (id)_bestVisibleStringForView:(id)a3 usingExecutor:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  if (+[CKContextUIClasses isSFSafariView:v6])
  {
    uint64_t v10 = [v7 context];
    objc_msgSend(v10, "setRemoteProcesses:", objc_msgSend(v10, "remoteProcesses") + 1);
  }
  if (+[CKContextUIClasses isWKWebView:v6])
  {
    uint64_t v11 = [a1 _handleWKWebView:v6 withExecutor:v7];
LABEL_7:
    id v12 = (id)v11;
    goto LABEL_11;
  }
  if (+[CKContextUIClasses isPDFView:v6])
  {
    uint64_t v11 = [a1 handlePDFView:v6 withExecutor:v7];
    goto LABEL_7;
  }
  if ([a1 controlCodeForExecutor:v7] == 1
    || +[CKContextContentProviderManager isSafariContentProvider])
  {
    goto LABEL_10;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = [v6 textContentType];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([a1 _isSensitiveTextContentType:v14])
    {

LABEL_10:
      id v12 = 0;
      goto LABEL_11;
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && ([v6 isSecureTextEntry]) {
    goto LABEL_10;
  }
  long long v15 = 0;
  if (![0 length])
  {
    if (objc_opt_respondsToSelector())
    {
      long long v16 = [v6 attributedText];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v15 = [v16 string];
      }
      else
      {
        long long v15 = 0;
      }
    }
    else
    {
      long long v15 = 0;
    }
  }
  if (![v15 length] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v17 = [v6 performSelector:sel_text];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v17;

      long long v15 = v18;
    }
  }
  if (![v15 length])
  {
    id v19 = [MEMORY[0x1E4F28B50] mainBundle];
    id v20 = [v19 bundleIdentifier];
    if ([v20 isEqualToString:@"com.apple.mobilecal"])
    {
      int v21 = [v9 isEqualToString:@"EKEventDetailAttendeesListView"];

      if (v21)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Performing special handling for Calendar", buf, 2u);
        }
        id v22 = (objc_class *)objc_opt_class();
        Ivar InstanceVariable = class_getInstanceVariable(v22, "_inviteeNames");
        if (InstanceVariable)
        {
          id v24 = InstanceVariable;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
            +[CKContextContentProviderUIScene _bestVisibleStringForView:usingExecutor:]();
          }
          id v25 = object_getIvar(v6, v24);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v26 = v25;
            if ([v26 count])
            {
              double v50 = v9;
              id v51 = v26;
              double v52 = v25;
              double v53 = v15;
              id v27 = [v26 firstObject];
              double v54 = [MEMORY[0x1E4F1CA48] array];
              long long v55 = 0u;
              long long v56 = 0u;
              long long v57 = 0u;
              long long v58 = 0u;
              id v28 = v27;
              uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v60 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v31 = *(void *)v56;
                do
                {
                  for (uint64_t i = 0; i != v30; ++i)
                  {
                    if (*(void *)v56 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    double v33 = *(void **)(*((void *)&v55 + 1) + 8 * i);
                    if (objc_opt_respondsToSelector())
                    {
                      double v34 = [v33 performSelector:sel_displayString];
                      if (objc_opt_respondsToSelector())
                      {
                        double v35 = [v34 performSelector:sel_string];
                        [v54 addObject:v35];
                      }
                    }
                  }
                  uint64_t v30 = [v28 countByEnumeratingWithState:&v55 objects:v60 count:16];
                }
                while (v30);
              }

              id v36 = objc_alloc_init(MEMORY[0x1E4F28DF8]);
              long long v15 = [v36 stringFromItems:v54];

              id v26 = v51;
              id v25 = v52;
              id v9 = v50;
            }
          }
        }
      }
    }
    else
    {
    }
  }
  if (![v15 length] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CGFloat v37 = [v6 performSelector:sel_accessibilityLabel];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v37 length] >= 0x14)
    {
      id v38 = v37;

      long long v15 = v38;
    }
  }
  if (![v15 length] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    unint64_t v39 = [v6 performSelector:sel_component];
    if (objc_opt_respondsToSelector())
    {
      unint64_t v40 = [v39 performSelector:sel_text];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v41 = v40;

        long long v15 = v41;
      }
    }
  }
  if (![v15 length] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v42 = [v6 performSelector:sel_delegate];
    if (objc_opt_respondsToSelector())
    {
      long long v43 = [v42 performSelector:sel_text];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v44 = v43;

        long long v15 = v44;
      }
    }
  }
  if (![v15 length] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v45 = [v6 performSelector:sel_dataDetectorElement];
    if (objc_opt_respondsToSelector())
    {
      unint64_t v46 = [v45 performSelector:sel_scannerResult];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v47 = [v46 performSelector:sel_value];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v48 = v47;

          long long v15 = v48;
        }
      }
    }
  }
  if ([v15 length]) {
    CGRect v49 = v15;
  }
  else {
    CGRect v49 = 0;
  }
  id v12 = v49;

LABEL_11:

  return v12;
}

+ (id)_extractItemsFromViewControllers:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  unint64_t v40 = [v4 bundleIdentifier];

  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v41 = *(void *)v43;
    id v37 = v5;
    do
    {
      uint64_t v8 = 0;
      uint64_t v38 = v7;
      do
      {
        if (*(void *)v43 != v41) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v42 + 1) + 8 * v8);
        uint64_t v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v10);
        if (([v11 hasPrefix:@"HUDashboardViewController"] & 1) != 0
          || [v11 hasPrefix:@"HOHomeViewController"])
        {
          if (objc_opt_respondsToSelector())
          {
            id v12 = [v9 performSelector:sel_context];
            if (objc_opt_respondsToSelector())
            {
              uint64_t v13 = [(CKContextExtractionItem *)v12 performSelector:sel_room];
              if (objc_opt_respondsToSelector())
              {
                uint64_t v14 = [(CKContextExtractionItem *)v13 performSelector:sel_name];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  long long v15 = v14;
                }
                else {
                  long long v15 = 0;
                }
                id v16 = v15;
              }
              else
              {
                id v16 = 0;
              }
              if (objc_opt_respondsToSelector())
              {
                id v20 = [(CKContextExtractionItem *)v13 performSelector:sel_uniqueIdentifier];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  int v21 = v20;
                }
                else {
                  int v21 = 0;
                }
                id v19 = v21;

                if (v19 && v16)
                {
                  uint64_t v13 = [[CKContextExtractionItem alloc] initWithTitle:v16 type:0 bundleIdentifier:v40];
                  id v22 = [v19 UUIDString];
                  [(CKContextExtractionItem *)v13 setIdentifier:v22];

                  [(CKContextExtractionItem *)v13 setExtractionSourceClassName:v11];
                  [(CKContextExtractionItem *)v13 setOnScreen:1];
                  [v39 addObject:v13];
                  id v19 = v20;
                  goto LABEL_26;
                }
              }
              else
              {
                id v19 = 0;
LABEL_26:
              }
            }
            else
            {
              id v19 = 0;
              id v16 = 0;
            }
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              id v17 = 0;
              id v18 = 0;
              goto LABEL_44;
            }
            id v23 = [(CKContextExtractionItem *)v12 performSelector:sel_home];
            if (objc_opt_respondsToSelector())
            {
              id v24 = [v23 performSelector:sel_name];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v25 = v24;
              }
              else {
                id v25 = 0;
              }
              id v18 = v25;
            }
            else
            {
              id v18 = 0;
            }
            if (objc_opt_respondsToSelector())
            {
              id v26 = [v23 performSelector:sel_uniqueIdentifier];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v27 = v26;
              }
              else {
                id v27 = 0;
              }
              id v17 = v27;

              id v5 = v37;
            }
            else
            {
              id v17 = 0;
            }

            if (v17)
            {
              uint64_t v7 = v38;
              if (v18)
              {
                id v12 = [[CKContextExtractionItem alloc] initWithTitle:v18 type:2 bundleIdentifier:v40];
                id v28 = [v17 UUIDString];
                [(CKContextExtractionItem *)v12 setIdentifier:v28];

                id v5 = v37;
                [(CKContextExtractionItem *)v12 setExtractionSourceClassName:v11];
                [(CKContextExtractionItem *)v12 setOnScreen:1];
                [v39 addObject:v12];
LABEL_44:
              }
            }
            else
            {
              uint64_t v7 = v38;
            }
          }
          else
          {
            id v17 = 0;
            id v18 = 0;
            id v19 = 0;
            id v16 = 0;
          }
        }
        if ([v11 hasPrefix:@"HomeUI.DashboardAccessoryControlViewController"])
        {
          if (objc_opt_respondsToSelector())
          {
            uint64_t v29 = [v9 performSelector:sel_description];
            uint64_t v30 = [v29 componentsSeparatedByString:@" uniqueIdentifier: "];
            if ([v30 count] == 2)
            {
              uint64_t v31 = [v30 objectAtIndexedSubscript:0];
              double v32 = 0;
              double v33 = 0;
              if ([v31 hasPrefix:@"accessoryName: "])
              {
                double v33 = [v31 substringFromIndex:objc_msgSend(@"accessoryName: ", "length")];
                double v32 = [v30 objectAtIndexedSubscript:1];
              }
            }
            else
            {
              double v32 = 0;
              double v33 = 0;
            }

            if (v32 && v33)
            {
              double v34 = [[CKContextExtractionItem alloc] initWithTitle:v33 type:1 bundleIdentifier:v40];
              [(CKContextExtractionItem *)v34 setIdentifier:v32];
              [(CKContextExtractionItem *)v34 setExtractionSourceClassName:v11];
              [(CKContextExtractionItem *)v34 setOnScreen:1];
              [v39 addObject:v34];
            }
          }
          else
          {
            double v33 = 0;
            double v32 = 0;
          }
        }
        ++v8;
      }
      while (v7 != v8);
      uint64_t v35 = [v5 countByEnumeratingWithState:&v42 objects:v46 count:16];
      uint64_t v7 = v35;
    }
    while (v35);
  }

  return v39;
}

+ (id)_UIElementsForWebViewContentString:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = +[CKContextSharedExtractionHelper blocksFromText:v3];
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v4 count])
    {
      id v23 = v4;
      id v24 = v3;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v27 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if (!+[CKContextSharedExtractionHelper textBlockLooksLikeAListWithText:v10])
            {
              uint64_t v11 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
              id v12 = [v10 componentsSeparatedByCharactersInSet:v11];
              uint64_t v13 = [NSString stringWithFormat:@"@distinctUnionOfObjects.%@", @"self"];
              uint64_t v14 = [v12 valueForKeyPath:v13];

              long long v15 = [v14 componentsJoinedByString:@"\n"];
              unint64_t v16 = [v14 count];
              unint64_t v17 = [v15 length];
              if (v17) {
                BOOL v18 = v16 == 0;
              }
              else {
                BOOL v18 = 1;
              }
              if (!v18)
              {
                float v19 = (float)v17 / (float)v16;
                id v20 = [[CKContextUIElement alloc] initWithText:v15 className:@"WKWebView"];
                *(float *)&double v21 = v19;
                [(CKContextUIElement *)v20 setDensity:v21];
                [v25 addObject:v20];
              }
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v7);
      }

      id v4 = v23;
      id v3 = v24;
    }
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

+ (id)_bestContentStringForWebViewUIElements:(id)a3 andTitle:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          [v13 density];
          if (v14 > 43.0)
          {
            long long v15 = [v13 text];
            [v7 addObject:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    unint64_t v16 = [v7 componentsJoinedByString:@"\n\n"];
    if ([v6 length])
    {
      unint64_t v17 = &stru_1F0E5E050;
      if (v16) {
        unint64_t v17 = v16;
      }
      uint64_t v18 = [NSString stringWithFormat:@"%@%@%@", v6, @"\n\n", v17];

      unint64_t v16 = (__CFString *)v18;
    }
  }
  else
  {
    unint64_t v16 = 0;
  }

  return v16;
}

+ (id)_handleWKWebView:(id)a3 withExecutor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 controlCodeForExecutor:v7];
  char v9 = +[CKContextContentProviderManager optionsForControlCode:v8];
  if (v8 != 2 && v8 != 4 && [v6 isLoading])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[CKContextContentProviderUIScene _handleWKWebView:withExecutor:]();
    }
LABEL_10:
    uint64_t v13 = &stru_1F0E5E050;
    goto LABEL_11;
  }
  uint64_t v10 = [v6 configuration];
  uint64_t v11 = [v10 websiteDataStore];
  char v12 = [v11 isPersistent];

  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "The webview data store is not persistent. We cannot extract from it for privacy reasons without user gesture.", buf, 2u);
    }
    goto LABEL_10;
  }
  [v7 markIncomplete];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__CKContextContentProviderUIScene__handleWKWebView_withExecutor___block_invoke;
  v15[3] = &unk_1E61110E0;
  id v17 = a1;
  id v16 = v6;
  BOOL v18 = (v9 & 0x10) != 0;
  BOOL v19 = (v9 & 0x20) != 0;
  [v7 addWorkItem:v15];

  uint64_t v13 = 0;
LABEL_11:

  return v13;
}

void __65__CKContextContentProviderUIScene__handleWKWebView_withExecutor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 40) controlCodeForExecutor:v3];
  char v5 = v4;
  unint64_t v6 = +[CKContextContentProviderManager optionsForControlCode:v4];
  uint64_t v7 = (v6 >> 1) & 1;
  uint64_t v8 = (v6 >> 2) & 1;
  unsigned int v9 = (v6 >> 3) & 1;
  uint64_t v10 = (v6 >> 6) & 1;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__CKContextContentProviderUIScene__handleWKWebView_withExecutor___block_invoke_2;
  v21[3] = &unk_1E6111090;
  id v11 = *(id *)(a1 + 32);
  char v24 = *(unsigned char *)(a1 + 48);
  char v25 = v5;
  char v26 = v8;
  char v27 = v9;
  id v22 = v11;
  id v23 = v3;
  id v12 = v3;
  uint64_t v13 = (void *)MEMORY[0x1BA99DED0](v21);
  uint64_t v15 = *(void *)(a1 + 32);
  float v14 = *(void **)(a1 + 40);
  uint64_t v16 = *(unsigned __int8 *)(a1 + 49);
  uint64_t v17 = *(unsigned __int8 *)(a1 + 48);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__CKContextContentProviderUIScene__handleWKWebView_withExecutor___block_invoke_3;
  v19[3] = &unk_1E61110B8;
  id v20 = v13;
  id v18 = v13;
  [v14 _extractContentFromWebView:v15 includingSnapshot:v7 includingUIBoundingBox:v8 ignoreViewTextLengthRequirements:v16 ignoreViewCountCap:v17 includeRawHTML:v10 withCompletionHandler:v19];
}

void __65__CKContextContentProviderUIScene__handleWKWebView_withExecutor___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v31 = a2;
  id v30 = a3;
  id v28 = a4;
  id v9 = a5;
  uint64_t v10 = +[CKContextContentProviderUIScene _UIElementsForWebViewContentString:v31];
  id v11 = [*(id *)(a1 + 32) title];
  char v27 = +[CKContextContentProviderUIScene _bestContentStringForWebViewUIElements:v10 andTitle:v11];

  if (*(unsigned char *)(a1 + 48))
  {
    id v12 = v10;
  }
  else
  {
    unint64_t v13 = [v10 count];
    if (v13 >= 0xFA) {
      uint64_t v14 = 250;
    }
    else {
      uint64_t v14 = v13;
    }
    objc_msgSend(v10, "subarrayWithRange:", 0, v14);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v15 = v12;
  if (*(unsigned char *)(a1 + 48))
  {
    id v16 = v9;
  }
  else
  {
    unint64_t v17 = [v9 count];
    if (v17 >= 0xFA) {
      uint64_t v18 = 250;
    }
    else {
      uint64_t v18 = v17;
    }
    objc_msgSend(v9, "subarrayWithRange:", 0, v18);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v19 = v16;
  unsigned int v20 = (*(unsigned __int8 *)(a1 + 49) < 6u) & (0x2Cu >> *(unsigned char *)(a1 + 49));
  if (*(unsigned char *)(a1 + 50)) {
    long long v21 = v16;
  }
  else {
    long long v21 = v15;
  }
  id v22 = v21;
  id v23 = [*(id *)(a1 + 32) title];
  long long v29 = v15;
  if (v20 == 1)
  {
    uint64_t v15 = [*(id *)(a1 + 32) URL];
    char v24 = [v15 absoluteString];
    id v25 = v31;
  }
  else
  {
    id v25 = 0;
    char v24 = 0;
  }
  if (*(unsigned char *)(a1 + 51)) {
    id v26 = v22;
  }
  else {
    id v26 = 0;
  }
  +[CKContextContentProviderUIScene _donateText:v27 withTitle:v23 debugText:v25 debugUrlString:v24 rawHTML:v30 leadImage:0 snapshot:v28 uiElements:v26 extractionItems:0 usingContextFromExecutor:*(void *)(a1 + 40)];
  if (v20)
  {
  }
  [*(id *)(a1 + 40) markReady];
}

uint64_t __65__CKContextContentProviderUIScene__handleWKWebView_withExecutor___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_extractContentFromWebView:(id)a3 includingSnapshot:(BOOL)a4 includingUIBoundingBox:(BOOL)a5 ignoreViewTextLengthRequirements:(BOOL)a6 ignoreViewCountCap:(BOOL)a7 includeRawHTML:(BOOL)a8 withCompletionHandler:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a9;
  if (v15)
  {
    id v16 = [v14 window];
    if ([v14 _isDisplayingPDF])
    {
      unint64_t v17 = [v14 _dataForDisplayedPDF];
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke;
      v75[3] = &unk_1E6111108;
      id v76 = v15;
      [a1 extractContentFromWebViewPDFData:v17 withCompletionHandler:v75];
      uint64_t v18 = v76;
    }
    else
    {
      BOOL v19 = dispatch_group_create();
      v73[0] = 0;
      v73[1] = v73;
      v73[2] = 0x3032000000;
      v73[3] = __Block_byref_object_copy_;
      v73[4] = __Block_byref_object_dispose_;
      unint64_t v74 = 0;
      v71[0] = 0;
      v71[1] = v71;
      v71[2] = 0x3032000000;
      v71[3] = __Block_byref_object_copy_;
      v71[4] = __Block_byref_object_dispose_;
      id v72 = 0;
      v69[0] = 0;
      v69[1] = v69;
      v69[2] = 0x3032000000;
      v69[3] = __Block_byref_object_copy_;
      v69[4] = __Block_byref_object_dispose_;
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (v10) {
        uint64_t v21 = -1;
      }
      else {
        uint64_t v21 = 10000;
      }
      id v70 = v20;
      dispatch_group_enter(v19);
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_174;
      v63[3] = &unk_1E6111158;
      BOOL v68 = v10;
      v66 = v73;
      uint64_t v67 = v21;
      unint64_t v17 = v19;
      unint64_t v64 = v17;
      id v22 = v14;
      id v65 = v22;
      [v22 _getContentsAsStringWithCompletionHandler:v63];
      uint64_t v77 = 0;
      uint64_t v78 = (uint64_t)&v77;
      uint64_t v79 = 0x2050000000;
      id v23 = (void *)getWKContentWorldClass_softClass;
      uint64_t v80 = (void *)getWKContentWorldClass_softClass;
      if (!getWKContentWorldClass_softClass)
      {
        uint64_t v52 = MEMORY[0x1E4F143A8];
        uint64_t v53 = 3221225472;
        uint64_t v54 = (uint64_t)__getWKContentWorldClass_block_invoke;
        long long v55 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6110F98;
        long long v56 = (void (*)(uint64_t))&v77;
        __getWKContentWorldClass_block_invoke((uint64_t)&v52);
        id v23 = *(void **)(v78 + 24);
      }
      id v24 = v23;
      _Block_object_dispose(&v77, 8);
      uint64_t v25 = [v24 worldWithName:@"CKContextExtractionContentWorld"];
      id v26 = (void *)v25;
      if (v11 && v25)
      {
        dispatch_group_enter(v17);
        char v27 = +[CKContextSharedExtractionHelper webPageNodeExtractionJavaScript];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2;
        v58[3] = &unk_1E6111180;
        v59 = v17;
        id v28 = v22;
        id v60 = v28;
        id v61 = v16;
        v62 = v69;
        [v28 evaluateJavaScript:v27 inFrame:0 inContentWorld:v26 completionHandler:v58];
      }
      uint64_t v52 = 0;
      uint64_t v53 = (uint64_t)&v52;
      uint64_t v54 = 0x3032000000;
      long long v55 = __Block_byref_object_copy_;
      long long v56 = __Block_byref_object_dispose_;
      id v57 = 0;
      if (v12)
      {
        dispatch_group_enter(v17);
        [v16 bounds];
        objc_msgSend(v16, "convertRect:toView:", v22);
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        uint64_t v82 = 0;
        long long v83 = &v82;
        uint64_t v84 = 0x2050000000;
        id v37 = (void *)getWKSnapshotConfigurationClass_softClass;
        uint64_t v85 = getWKSnapshotConfigurationClass_softClass;
        if (!getWKSnapshotConfigurationClass_softClass)
        {
          uint64_t v77 = MEMORY[0x1E4F143A8];
          uint64_t v78 = 3221225472;
          uint64_t v79 = (uint64_t)__getWKSnapshotConfigurationClass_block_invoke;
          uint64_t v80 = &unk_1E6110F98;
          long long v81 = &v82;
          __getWKSnapshotConfigurationClass_block_invoke((uint64_t)&v77);
          id v37 = (void *)v83[3];
        }
        uint64_t v38 = v37;
        _Block_object_dispose(&v82, 8);
        id v39 = objc_alloc_init(v38);
        objc_msgSend(v39, "setRect:", v30, v32, v34, v36);
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_181;
        v49[3] = &unk_1E61111A8;
        double v50 = v17;
        id v51 = v71;
        [v22 takeSnapshotWithConfiguration:v39 completionHandler:v49];
      }
      if (v9)
      {
        dispatch_group_enter(v17);
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_186;
        v46[3] = &unk_1E61111D0;
        uint64_t v47 = v17;
        id v48 = &v52;
        [v22 evaluateJavaScript:@"document.documentElement.outerHTML.toString()" completionHandler:v46];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_3;
      block[3] = &unk_1E61111F8;
      id v41 = v15;
      long long v42 = v73;
      long long v43 = &v52;
      long long v44 = v71;
      long long v45 = v69;
      dispatch_group_notify(v17, MEMORY[0x1E4F14428], block);

      _Block_object_dispose(&v52, 8);
      _Block_object_dispose(v69, 8);

      _Block_object_dispose(v71, 8);
      _Block_object_dispose(v73, 8);
      uint64_t v18 = v74;
    }
  }
}

uint64_t __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_174(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 64) || (unint64_t)[v5 length] < 0x96)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Failed to extract enough text from main webpage frame. Trying to get content from all frames", buf, 2u);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_175;
    v15[3] = &unk_1E6111130;
    unint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v18 = v14;
    id v16 = *(id *)(a1 + 32);
    [v13 _getContentsOfAllFramesAsStringWithCompletionHandler:v15];
  }
  else
  {
    unint64_t v7 = *(void *)(a1 + 56);
    unint64_t v8 = [v5 length];
    if (v7 >= v8) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = v7;
    }
    uint64_t v10 = objc_msgSend(v5, "substringWithRange:", 0, v9);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_175(void *a1, void *a2)
{
  unint64_t v3 = a1[6];
  id v4 = a2;
  unint64_t v5 = [v4 length];
  if (v3 >= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v3;
  }
  uint64_t v7 = objc_msgSend(v4, "substringWithRange:", 0, v6);

  uint64_t v8 = *(void *)(a1[5] + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = a1[4];

  dispatch_group_leave(v10);
}

void __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_cold_2((uint64_t)v6);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    uint64_t v7 = [v5 description];
    if ([v7 length])
    {
      uint64_t v8 = [v7 dataUsingEncoding:4];
      id v80 = 0;
      unint64_t v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v80];
      id v10 = v80;
      if (v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_cold_1();
        }
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      }
      else
      {
        uint64_t v11 = [v9 objectForKeyedSubscript:@"nodes"];
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v64 = v9;
            id v65 = v8;
            v66 = v7;
            id v67 = v5;
            long long v76 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            id obj = v11;
            uint64_t v12 = [obj countByEnumeratingWithState:&v76 objects:v81 count:16];
            v63 = v11;
            if (v12)
            {
              uint64_t v13 = v12;
              unint64_t v14 = 0x1E4F1C000uLL;
              uint64_t v15 = *(void *)v77;
              uint64_t v68 = *(void *)v77;
              do
              {
                uint64_t v16 = 0;
                uint64_t v69 = v13;
                do
                {
                  if (*(void *)v77 != v15) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v17 = *(void **)(*((void *)&v76 + 1) + 8 * v16);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v18 = [v17 objectForKeyedSubscript:@"text"];
                    BOOL v19 = [*(id *)(v14 + 2712) null];
                    if ([v18 isEqual:v19])
                    {
                      id v20 = 0;
                    }
                    else
                    {
                      id v20 = [v17 objectForKeyedSubscript:@"text"];
                    }

                    uint64_t v21 = [v17 objectForKeyedSubscript:@"className"];
                    id v22 = [*(id *)(v14 + 2712) null];
                    if ([v21 isEqual:v22])
                    {
                      BOOL v71 = 0;
                    }
                    else
                    {
                      BOOL v71 = [v17 objectForKeyedSubscript:@"className"];
                    }

                    id v23 = [v17 objectForKeyedSubscript:@"left"];
                    id v24 = [*(id *)(v14 + 2712) null];
                    if ([v23 isEqual:v24])
                    {
                      id v75 = 0;
                    }
                    else
                    {
                      id v75 = [v17 objectForKeyedSubscript:@"left"];
                    }

                    uint64_t v25 = [v17 objectForKeyedSubscript:@"right"];
                    id v26 = [*(id *)(v14 + 2712) null];
                    if ([v25 isEqual:v26])
                    {
                      unint64_t v74 = 0;
                    }
                    else
                    {
                      unint64_t v74 = [v17 objectForKeyedSubscript:@"right"];
                    }

                    char v27 = [v17 objectForKeyedSubscript:@"top"];
                    unint64_t v28 = v14;
                    double v29 = [*(id *)(v14 + 2712) null];
                    if ([v27 isEqual:v29])
                    {
                      id v73 = 0;
                    }
                    else
                    {
                      id v73 = [v17 objectForKeyedSubscript:@"top"];
                    }

                    double v30 = [v17 objectForKeyedSubscript:@"bottom"];
                    double v31 = [*(id *)(v28 + 2712) null];
                    id v72 = v20;
                    if ([v30 isEqual:v31])
                    {
                      double v32 = 0;
                    }
                    else
                    {
                      double v32 = [v17 objectForKeyedSubscript:@"bottom"];
                    }

                    double v33 = [v17 objectForKeyedSubscript:@"onScreen"];
                    double v34 = [*(id *)(v28 + 2712) null];
                    if ([v33 isEqual:v34])
                    {
                      double v35 = 0;
                    }
                    else
                    {
                      double v35 = [v17 objectForKeyedSubscript:@"onScreen"];
                    }

                    if ([v20 length])
                    {
                      double v36 = [CKContextUIElement alloc];
                      unint64_t v37 = [v20 length];
                      if (v37 >= 0xFA) {
                        uint64_t v38 = 250;
                      }
                      else {
                        uint64_t v38 = v37;
                      }
                      id v39 = objc_msgSend(v20, "substringWithRange:", 0, v38);
                      unint64_t v40 = [(CKContextUIElement *)v36 initWithText:v39 className:v71];

                      -[CKContextUIElement setOnScreen:](v40, "setOnScreen:", [v35 BOOLValue]);
                      id v41 = [*(id *)(a1 + 40) window];
                      long long v42 = [v41 windowScene];
                      long long v43 = [v42 _sceneIdentifier];
                      uint64_t v44 = a1;
                      long long v45 = (void *)[v43 copy];
                      [(CKContextUIElement *)v40 setSceneIdentifier:v45];

                      a1 = v44;
                      if (v75 && v74 && v73 && v32)
                      {
                        unint64_t v46 = *(void **)(v44 + 40);
                        [v75 doubleValue];
                        double v48 = v47;
                        [v73 doubleValue];
                        objc_msgSend(v46, "_convertPointFromContentsToView:", v48, v49);
                        double v51 = v50;
                        double v53 = v52;
                        uint64_t v54 = *(void **)(v44 + 40);
                        [v74 doubleValue];
                        double v56 = v55;
                        [v32 doubleValue];
                        objc_msgSend(v54, "_convertPointFromContentsToView:", v56, v57);
                        objc_msgSend(*(id *)(v44 + 40), "convertRect:toView:", 0, v51, v53, v58 - v51, v59 - v53);
                        objc_msgSend(*(id *)(v44 + 48), "convertRect:toView:", 0);
                        -[CKContextUIElement setFrameInWindow:](v40, "setFrameInWindow:");
                        id v60 = [*(id *)(v44 + 48) screen];
                        id v61 = [v60 coordinateSpace];

                        if (v61)
                        {
                          v62 = *(void **)(v44 + 48);
                          [(CKContextUIElement *)v40 frameInWindow];
                          objc_msgSend(v62, "convertPoint:toCoordinateSpace:", v61);
                          -[CKContextUIElement setAbsoluteOriginOnScreen:](v40, "setAbsoluteOriginOnScreen:");
                        }
                      }
                      [*(id *)(*(void *)(*(void *)(v44 + 56) + 8) + 40) addObject:v40];

                      id v20 = v72;
                    }

                    unint64_t v14 = v28;
                    uint64_t v15 = v68;
                    uint64_t v13 = v69;
                  }
                  ++v16;
                }
                while (v13 != v16);
                uint64_t v13 = [obj countByEnumeratingWithState:&v76 objects:v81 count:16];
              }
              while (v13);
            }

            id v6 = 0;
            id v5 = v67;
            uint64_t v11 = v63;
            id v10 = 0;
            uint64_t v8 = v65;
            uint64_t v7 = v66;
            unint64_t v9 = v64;
          }
        }
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      }
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }
}

void __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_181(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6 && !a3) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_186(uint64_t a1, void *a2, uint64_t a3)
{
  id obj = [a2 description];
  uint64_t v5 = [obj length];
  if (!a3 && v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40), *(void *)(*(void *)(a1[8] + 8) + 40));
}

- (BOOL)_determineIfDebuggingControlsShouldBeAllowed
{
  if (!+[CKContextContentProviderManager isSpringBoard]
    || !os_variant_has_internal_content())
  {
    return 0;
  }
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"CKContextAllowAppSwitcherDebuggingControls"];

  return v3;
}

- (BOOL)_shouldInstallAppSwitcherControls
{
  if (!self->_allowAppSwitcherControls) {
    return 0;
  }
  char v3 = [(UIButton *)self->_debugButton superview];

  if (v3) {
    return 0;
  }
  uint64_t v5 = [(UIButton *)self->_recentsButton superview];
  BOOL v4 = v5 == 0;

  return v4;
}

- (void)_installDebuggingControlsIfApplicable
{
  if (self->_allowAppSwitcherControls)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v2 = dispatch_time(0, 2000000000);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __72__CKContextContentProviderUIScene__installDebuggingControlsIfApplicable__block_invoke;
    v3[3] = &unk_1E6111220;
    objc_copyWeak(&v4, &location);
    dispatch_after(v2, MEMORY[0x1E4F14428], v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

uint64_t __72__CKContextContentProviderUIScene__installDebuggingControlsIfApplicable__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v3 = WeakRetained;
    if ([WeakRetained _shouldInstallAppSwitcherControls])
    {
      [v3 _installDebuggingButton];
      [v3 _installRecentsButton];
      [v3 _installDebuggingControlsIfApplicable];
    }
  }

  return MEMORY[0x1F41817F8]();
}

- (void)_setUpDebuggingControlsIfPossibleAfterDelay:(double)a3
{
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB00];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__CKContextContentProviderUIScene__setUpDebuggingControlsIfPossibleAfterDelay___block_invoke;
  v7[3] = &unk_1E6111248;
  objc_copyWeak(&v8, &location);
  id v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v7 block:a3];
  objc_storeWeak((id *)&self->_toolInstallationTimer, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __79__CKContextContentProviderUIScene__setUpDebuggingControlsIfPossibleAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    int v2 = [WeakRetained _determineIfDebuggingControlsShouldBeAllowed];
    v4[24] = v2;
    if (v2) {
      [v4 _installDebuggingControlsIfApplicable];
    }
  }

  return MEMORY[0x1F41817F8]();
}

- (void)_installRecentsButton
{
  v20[4] = *MEMORY[0x1E4F143B8];
  if (self->_allowAppSwitcherControls)
  {
    char v3 = [(CKContextContentProviderUIScene *)self _containerViewForDebugButtons];
    if (v3)
    {
      BOOL v19 = [MEMORY[0x1E4F42A80] systemImageNamed:@"clock.fill"];
      id v4 = [MEMORY[0x1E4F427E0] systemButtonWithImage:v19 target:self action:sel__didSelectRecentsControl_];
      recentsButton = self->_recentsButton;
      self->_recentsButton = v4;

      id v6 = [MEMORY[0x1E4F428B8] whiteColor];
      [(UIButton *)self->_recentsButton setTintColor:v6];

      [(UIButton *)self->_recentsButton setTranslatesAutoresizingMaskIntoConstraints:0];
      [v3 addSubview:self->_recentsButton];
      uint64_t v16 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v18 = [(UIButton *)self->_recentsButton topAnchor];
      uint64_t v17 = [v3 topAnchor];
      uint64_t v7 = [v18 constraintEqualToAnchor:v17];
      v20[0] = v7;
      id v8 = [(UIButton *)self->_recentsButton leadingAnchor];
      unint64_t v9 = [v3 leadingAnchor];
      id v10 = [v8 constraintEqualToAnchor:v9];
      v20[1] = v10;
      uint64_t v11 = [(UIButton *)self->_recentsButton widthAnchor];
      uint64_t v12 = [v11 constraintEqualToConstant:70.0];
      v20[2] = v12;
      uint64_t v13 = [(UIButton *)self->_recentsButton heightAnchor];
      unint64_t v14 = [v13 constraintEqualToConstant:70.0];
      v20[3] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
      [v16 activateConstraints:v15];
    }
  }
}

- (void)_installDebuggingButton
{
  v20[4] = *MEMORY[0x1E4F143B8];
  if (self->_allowAppSwitcherControls)
  {
    char v3 = [(CKContextContentProviderUIScene *)self _containerViewForDebugButtons];
    if (v3)
    {
      BOOL v19 = [MEMORY[0x1E4F42A80] systemImageNamed:@"square.and.arrow.up.fill"];
      id v4 = [MEMORY[0x1E4F427E0] systemButtonWithImage:v19 target:self action:sel__didSelectDebugControl_];
      debugButton = self->_debugButton;
      self->_debugButton = v4;

      id v6 = [MEMORY[0x1E4F428B8] whiteColor];
      [(UIButton *)self->_debugButton setTintColor:v6];

      [(UIButton *)self->_debugButton setTranslatesAutoresizingMaskIntoConstraints:0];
      [v3 addSubview:self->_debugButton];
      uint64_t v16 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v18 = [(UIButton *)self->_debugButton topAnchor];
      uint64_t v17 = [v3 topAnchor];
      uint64_t v7 = [v18 constraintEqualToAnchor:v17];
      v20[0] = v7;
      id v8 = [(UIButton *)self->_debugButton trailingAnchor];
      unint64_t v9 = [v3 trailingAnchor];
      id v10 = [v8 constraintEqualToAnchor:v9];
      v20[1] = v10;
      uint64_t v11 = [(UIButton *)self->_debugButton widthAnchor];
      uint64_t v12 = [v11 constraintEqualToConstant:70.0];
      v20[2] = v12;
      uint64_t v13 = [(UIButton *)self->_debugButton heightAnchor];
      unint64_t v14 = [v13 constraintEqualToConstant:70.0];
      v20[3] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
      [v16 activateConstraints:v15];
    }
  }
}

- (void)_didSelectRecentsControl:(id)a3
{
  if (self->_allowAppSwitcherControls) {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_1);
  }
}

void __60__CKContextContentProviderUIScene__didSelectRecentsControl___block_invoke()
{
  v0 = (void *)*MEMORY[0x1E4F43630];
  id v1 = [MEMORY[0x1E4F1CB10] URLWithString:@"universal-recents://"];
  [v0 performSelector:sel_openURL_ withObject:v1];
}

- (void)_didSelectDebugControl:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_allowAppSwitcherControls)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__CKContextContentProviderUIScene__didSelectDebugControl___block_invoke;
    block[3] = &unk_1E6110DC8;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __58__CKContextContentProviderUIScene__didSelectDebugControl___block_invoke(uint64_t a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F42718];
  id v2 = *(id *)(a1 + 32);
  id v5 = (id)[[v1 alloc] initWithActivityItems:&unk_1F0E60658 applicationActivities:0];
  char v3 = [v2 window];

  id v4 = [v3 rootViewController];
  [v4 presentViewController:v5 animated:1 completion:0];
}

- (id)_containerViewForDebugButtons
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self->_allowAppSwitcherControls)
  {
    char v3 = [(CKContextContentProviderUIScene *)self _scene];
    id v4 = [v3 _visibleWindows];

    if ([v4 count])
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v5 = v4;
      uint64_t v20 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v20)
      {
        uint64_t v6 = *(void *)v27;
        uint64_t v21 = v5;
        uint64_t v19 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v27 != v6) {
              objc_enumerationMutation(v5);
            }
            id v8 = [(CKContextContentProviderUIScene *)self _descendantsRelevantForDebugControls:*(void *)(*((void *)&v26 + 1) + 8 * i)];
            long long v22 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id v9 = v8;
            uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v23;
              while (2)
              {
                for (uint64_t j = 0; j != v11; ++j)
                {
                  if (*(void *)v23 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  unint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * j);
                  uint64_t v15 = (objc_class *)objc_opt_class();
                  uint64_t v16 = NSStringFromClass(v15);
                  if ([v16 containsString:@"SBFluidSwitcherContentView"])
                  {
                    id v17 = v14;

                    id v5 = v21;
                    goto LABEL_23;
                  }
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
                if (v11) {
                  continue;
                }
                break;
              }
            }

            id v5 = v21;
            uint64_t v6 = v19;
          }
          id v17 = 0;
          uint64_t v20 = [v21 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v20);
      }
      else
      {
        id v17 = 0;
      }
LABEL_23:
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)_descendantsRelevantForDebugControls:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!self->_allowAppSwitcherControls) {
    goto LABEL_4;
  }
  [v4 frame];
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  if (CGRectGetWidth(v25) < 150.0) {
    goto LABEL_4;
  }
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  if (CGRectGetHeight(v26) >= 150.0)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v10 addObject:v5];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v12 = objc_msgSend(v5, "subviews", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [(CKContextContentProviderUIScene *)self _descendantsRelevantForDebugControls:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          [v10 addObjectsFromArray:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
  else
  {
LABEL_4:
    id v10 = 0;
  }

  return v10;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__scene);

  return (UIScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__scene);
  objc_destroyWeak((id *)&self->_toolInstallationTimer);
  objc_storeStrong((id *)&self->_recentsButton, 0);

  objc_storeStrong((id *)&self->_debugButton, 0);
}

+ (void)extractFromScene:usingExecutor:withOptions:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "CKContextContentProviderUIScene is unexpectedly trying to capture from off of the main thread.", v0, 2u);
}

+ (void)_bestVisibleStringForView:usingExecutor:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Was able to access the invitees list via introspection, for better or worse.", v0, 2u);
}

+ (void)_handleWKWebView:withExecutor:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "The web view is still loading. There should be no attempt to extract content from it without user gesture.", v0, 2u);
}

void __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 138412290;
  uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error parsing node information to JSON dictionary: %@", (uint8_t *)&v0, 0xCu);
}

void __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_cold_2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error evaluating JavaScript for node extraction: %@", (uint8_t *)&v1, 0xCu);
}

@end