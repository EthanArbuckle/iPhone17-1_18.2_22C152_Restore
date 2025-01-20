@interface AFUIAdapter
+ (BOOL)responderAcceptsText:(id)a3;
+ (CGRect)areaForASPFromTextField:(id)a3;
+ (id)firstResponderForInput;
+ (id)gatherRespondersFromResponder:(id)a3;
+ (id)placeholderTextForResponder:(id)a3;
+ (id)presentedRootViewControllerForResponder:(id)a3;
+ (id)textFromResponder:(id)a3;
+ (id)textInputRespondersFromResponders:(id)a3 currentResponder:(id)a4 indexOfCurrent:(unint64_t *)a5;
+ (id)textSignalsForResponder:(id)a3;
+ (int64_t)alignmentFromTextField:(id)a3;
+ (void)addTemporaryTextColorToTextField:(id)a3;
+ (void)configureField:(id)a3 withASPForegroundView:(id)a4 withASPBackgroundView:(id)a5;
+ (void)enumerateSignUpSignalsFromButton:(id)a3 block:(id)a4;
+ (void)enumerateSignUpSignalsFromNavBarItem:(id)a3 block:(id)a4;
+ (void)enumerateSignUpSignalsFromViewController:(id)a3 block:(id)a4;
+ (void)enumerateSignUpSignalsFromViewControllerForResponder:(id)a3 block:(id)a4 viewControllerOut:(id *)a5;
+ (void)enumerateSignupSignalsFromAccessibility:(id)a3 block:(id)a4;
+ (void)removeTemporaryTextColorFromTextField:(id)a3;
+ (void)setText:(id)a3 forResponder:(id)a4;
@end

@implementation AFUIAdapter

+ (id)firstResponderForInput
{
  v2 = [MEMORY[0x263F828B0] activeInstance];
  v3 = [v2 delegateAsResponder];

  return v3;
}

+ (BOOL)responderAcceptsText:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = 1;
  }
  else {
    char v4 = objc_opt_respondsToSelector();
  }

  return v4 & 1;
}

+ (id)presentedRootViewControllerForResponder:(id)a3
{
  id v3 = [a3 _responderWindow];
  char v4 = [v3 rootViewController];
  v5 = [v4 presentedViewController];

  return v5;
}

+ (id)gatherRespondersFromResponder:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v4 = [MEMORY[0x263EFF980] array];
  [v3 _gatherKeyResponders:v4 indexOfSelf:0 visibilityTest:&__block_literal_global_8 passingTest:&__block_literal_global_11 subviewsTest:&__block_literal_global_272];
  if ((unint64_t)[v4 count] >= 3)
  {
    id v45 = v3;
    [MEMORY[0x263EFF980] array];
    v47 = v46 = v4;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v49 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = v10;
            [v11 frame];
            if (!CGRectIsEmpty(v55))
            {
              [v11 bounds];
              objc_msgSend(v11, "convertRect:toView:", 0);
              double v13 = v12;
              double v15 = v14;
              double v17 = v16;
              double v19 = v18;
              v20 = [v11 window];
              v21 = [v11 window];
              v22 = [v21 windowScene];
              v23 = [v22 coordinateSpace];
              objc_msgSend(v20, "convertRect:toCoordinateSpace:", v23, v13, v15, v17, v19);
              CGFloat v25 = v24;
              CGFloat v27 = v26;
              CGFloat v29 = v28;
              CGFloat v31 = v30;

              v32 = [v11 window];
              v33 = [v32 windowScene];
              v34 = [v33 coordinateSpace];
              [v34 bounds];
              v59.origin.CGFloat x = v35;
              v59.origin.CGFloat y = v36;
              v59.size.CGFloat width = v37;
              v59.size.CGFloat height = v38;
              v56.origin.CGFloat x = v25;
              v56.origin.CGFloat y = v27;
              v56.size.CGFloat width = v29;
              v56.size.CGFloat height = v31;
              CGRect v57 = CGRectIntersection(v56, v59);
              CGFloat x = v57.origin.x;
              CGFloat y = v57.origin.y;
              CGFloat width = v57.size.width;
              CGFloat height = v57.size.height;

              v58.origin.CGFloat x = x;
              v58.origin.CGFloat y = y;
              v58.size.CGFloat width = width;
              v58.size.CGFloat height = height;
              if (CGRectIsEmpty(v58)) {
                [v47 addObject:v11];
              }
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v7);
    }

    uint64_t v43 = [v5 count];
    if ((unint64_t)(v43 - [v47 count]) >= 4) {
      [v5 removeObjectsInArray:v47];
    }

    id v3 = v45;
    char v4 = v46;
  }

  return v4;
}

BOOL __45__AFUIAdapter_gatherRespondersFromResponder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    BOOL v5 = 0;
    if (([v3 isHidden] & 1) == 0)
    {
      [v3 alpha];
      if (v4 != 0.0) {
        BOOL v5 = 1;
      }
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

BOOL __45__AFUIAdapter_gatherRespondersFromResponder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_15:
    BOOL v4 = 0;
    goto LABEL_20;
  }
  if (![v2 _requiresKeyboardWhenFirstResponder]
    || ([v2 conformsToProtocol:&unk_26FCE2C10] & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v2;
      uint64_t v6 = [v5 allTargets];
      if ([v6 count])
      {
        [v5 frame];
        BOOL v4 = !CGRectIsEmpty(v9);
      }
      else
      {
        BOOL v4 = 0;
      }

LABEL_19:
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    [v3 frame];
    if (CGRectIsEmpty(v8)) {
      goto LABEL_11;
    }
    if ([v3 isUserInteractionEnabled]) {
      goto LABEL_21;
    }
    if (_AFUIShouldDisableDetectingNonInteractiveFields_onceToken != -1) {
      dispatch_once(&_AFUIShouldDisableDetectingNonInteractiveFields_onceToken, &__block_literal_global_3);
    }
    if (_AFUIShouldDisableDetectingNonInteractiveFields_disableDetectingNonInteractiveFields == 1) {
LABEL_11:
    }
      BOOL v4 = 0;
    else {
LABEL_21:
    }
      BOOL v4 = 1;
    goto LABEL_19;
  }
  BOOL v4 = 1;
LABEL_20:

  return v4;
}

BOOL __45__AFUIAdapter_gatherRespondersFromResponder___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v2 _requiresKeyboardWhenFirstResponder] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v2 allTargets];
      BOOL v3 = [v5 count] == 0;
    }
    else
    {
      BOOL v3 = 1;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

+ (id)textInputRespondersFromResponders:(id)a3 currentResponder:(id)a4 indexOfCurrent:(unint64_t *)a5
{
  id v7 = a4;
  CGRect v8 = (void *)MEMORY[0x263EFF980];
  id v9 = a3;
  v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __81__AFUIAdapter_textInputRespondersFromResponders_currentResponder_indexOfCurrent___block_invoke;
  v16[3] = &unk_2652491F0;
  id v17 = v7;
  double v19 = a5;
  id v11 = v10;
  id v18 = v11;
  id v12 = v7;
  [v9 enumerateObjectsUsingBlock:v16];

  double v13 = v18;
  id v14 = v11;

  return v14;
}

void __81__AFUIAdapter_textInputRespondersFromResponders_currentResponder_indexOfCurrent___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v3 = v5;
    if (*(id *)(a1 + 32) == v5 && *(void *)(a1 + 48))
    {
      uint64_t v4 = [*(id *)(a1 + 40) count];
      id v3 = v5;
      **(void **)(a1 + 48) = v4;
    }
    [*(id *)(a1 + 40) addObject:v3];
  }
}

+ (id)textSignalsForResponder:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  if (AFUIResponderIsExemptFromDetectionHints(v5))
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF9C0] set];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      CGRect v8 = [v4 _viewControllerForAncestor];
      if (objc_opt_respondsToSelector())
      {
        id v9 = [v8 performSelector:sel_textField];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = [v9 placeholder];
          id v11 = [MEMORY[0x263F086E0] _processLocalizedString:v10];
          [v7 addObjectsFromArray:v11];
        }
      }
    }
    id v12 = (void *)MEMORY[0x263F086E0];
    double v13 = [v4 accessibilityHint];
    id v14 = [v12 _processLocalizedString:v13];
    [v7 addObjectsFromArray:v14];

    double v15 = (void *)MEMORY[0x263F086E0];
    double v16 = [v4 accessibilityLabel];
    id v17 = [v15 _processLocalizedString:v16];
    [v7 addObjectsFromArray:v17];

    id v18 = [a1 placeholderTextForResponder:v4];
    if (v18)
    {
      double v19 = [MEMORY[0x263F086E0] _processLocalizedString:v18];
      [v7 addObjectsFromArray:v19];
    }
    uint64_t v6 = (void *)[v7 copy];
  }

  return v6;
}

+ (id)placeholderTextForResponder:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 performSelector:sel_placeholder];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  id v4 = 0;
LABEL_5:

  return v4;
}

+ (void)addTemporaryTextColorToTextField:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 textLayoutController];
  id v5 = [v4 documentRange];
  v9[0] = *MEMORY[0x263F82278];
  uint64_t v6 = [MEMORY[0x263F825C8] blackColor];
  v10[0] = v6;
  v9[1] = *MEMORY[0x263F82240];
  id v7 = [MEMORY[0x263F825C8] clearColor];
  v10[1] = v7;
  CGRect v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v4 addRenderingAttributes:v8 forRange:v5];

  [v3 setNeedsDisplay];
}

+ (void)removeTemporaryTextColorFromTextField:(id)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 textLayoutController];
  id v5 = [v4 documentRange];
  uint64_t v6 = *MEMORY[0x263F82240];
  v8[0] = *MEMORY[0x263F82278];
  v8[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [v4 removeRenderingAttributes:v7 forRange:v5];

  [v3 setNeedsDisplay];
}

+ (id)textFromResponder:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 text];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (void)setText:(id)a3 forResponder:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (objc_opt_respondsToSelector()) {
    [v5 setText:v6];
  }
}

+ (int64_t)alignmentFromTextField:(id)a3
{
  return [a3 textAlignment];
}

+ (CGRect)areaForASPFromTextField:(id)a3
{
  id v3 = a3;
  [v3 frame];
  id v4 = [v3 rightView];
  [v4 bounds];
  id v5 = [v3 leftView];

  [v5 bounds];
  UIRectInset();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

+ (void)configureField:(id)a3 withASPForegroundView:(id)a4 withASPBackgroundView:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v12 = a3;
  if (dyld_program_sdk_at_least()) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 1;
  }
  if (v8) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  [v12 _setContentCoverViewMode:v10];
  [v12 _setContentCoverView:v8];

  if (v7) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  [v12 _setBackgroundCoverViewMode:v11];
  [v12 _setBackgroundCoverView:v7];
}

+ (void)enumerateSignUpSignalsFromButton:(id)a3 block:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = (void (**)(id, void *, unsigned char *))a4;
  unsigned __int8 v33 = 0;
  id v7 = objc_msgSend(v5, "titleForState:", objc_msgSend(v5, "state"));
  if (!v7)
  {
    id v8 = [v5 titleLabel];
    id v7 = [v8 text];
  }
  v6[2](v6, v7, &v33);
  if (!v33)
  {
    v22 = v7;
    [v5 allTargets];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
LABEL_6:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        double v13 = [v5 actionsForTarget:*(void *)(*((void *)&v29 + 1) + 8 * v12) forControlEvent:64];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v34 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v26;
LABEL_11:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            v6[2](v6, *(void **)(*((void *)&v25 + 1) + 8 * v18), &v33);
            if (v33) {
              break;
            }
            if (v16 == ++v18)
            {
              uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v34 count:16];
              if (v16) {
                goto LABEL_11;
              }
              break;
            }
          }
        }

        int v19 = v33;
        if (v19) {
          break;
        }
        if (++v12 == v10)
        {
          uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
          if (v10) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    id v7 = v22;
    if (!v33 && [v22 length])
    {
      v20 = [MEMORY[0x263F086E0] mainBundle];
      id v24 = 0;
      [v20 _searchForLocalizedString:v22 foundKey:&v24 foundTable:0];
      id v21 = v24;

      if (v21) {
        v6[2](v6, v21, &v33);
      }
    }
  }
}

+ (void)enumerateSignUpSignalsFromViewControllerForResponder:(id)a3 block:(id)a4 viewControllerOut:(id *)a5
{
  id v11 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v11 isFirstResponder]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v9 = [v11 _viewControllerForAncestor];
    [a1 enumerateSignUpSignalsFromViewController:v9 block:v8];
    id v10 = v9;
    *a5 = v10;
  }
}

+ (void)enumerateSignUpSignalsFromViewController:(id)a3 block:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, unsigned char *))a4;
  char v23 = 0;
  id v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  v7[2](v7, v9, &v23);

  if (!v23)
  {
    [v6 childViewControllers];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
          if ((objc_msgSend(v15, "isBeingPresented", (void)v19) & 1) != 0
            || ([v15 isMovingToParentViewController] & 1) != 0
            || [v15 _appearState] == 1
            || [v15 _appearState] == 2)
          {
            uint64_t v16 = (objc_class *)objc_opt_class();
            uint64_t v17 = NSStringFromClass(v16);
            v7[2](v7, v17, &v23);

            if (v23) {
              goto LABEL_16;
            }
          }
          else
          {
            [a1 enumerateSignUpSignalsFromViewController:v15 block:v7];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v18 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
        uint64_t v12 = v18;
      }
      while (v18);
    }
LABEL_16:
  }
}

+ (void)enumerateSignUpSignalsFromNavBarItem:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id, unsigned char *))a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v19 = 0;
    id v7 = [v5 navigationBar];
    id v8 = [v7 topItem];
    uint64_t v9 = [v8 rightBarButtonItem];

    uint64_t v10 = [v9 customView];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = [v9 customView];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v14 = [v9 customView];
        uint64_t v15 = [v14 titleForState:0];

        if (v15) {
          goto LABEL_18;
        }
      }
    }
    uint64_t v15 = [v9 title];

    if (v15)
    {
      uint64_t v15 = [v9 title];
      if (v15)
      {
LABEL_18:
        if (([v5 isNavigationBarHidden] & 1) != 0
          || ![v15 length]
          || (v6[2](v6, v15, &v19), !v19))
        {
          if ([v15 length])
          {
            uint64_t v16 = [MEMORY[0x263F086E0] mainBundle];
            id v18 = 0;
            [v16 _searchForLocalizedString:v15 foundKey:&v18 foundTable:0];
            id v17 = v18;

            if (v17) {
              v6[2](v6, v17, &v19);
            }
          }
        }
      }
    }
  }
}

+ (void)enumerateSignupSignalsFromAccessibility:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, unsigned char *))a4;
  char v11 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = [v7 accessibilityHint];
  v6[2](v6, v8, &v11);

  if (!v11)
  {
    uint64_t v9 = [v7 accessibilityLabel];
    v6[2](v6, v9, &v11);

    if (!v11)
    {
      uint64_t v10 = [v7 accessibilityIdentifier];
      v6[2](v6, v10, &v11);
    }
  }
}

@end