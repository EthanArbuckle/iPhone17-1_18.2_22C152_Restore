@interface CKContextContentProviderComponent
+ (BOOL)_isSensitiveTextContentType:(id)a3;
+ (double)_fontSizeOfView:(id)a3 usingExecutor:(id)a4;
+ (id)_UIElementsForWebViewContentString:(id)a3 withSceneIdentifier:(id)a4;
+ (id)_bestVisibleStringForView:(id)a3 usingExecutor:(id)a4;
+ (id)_decendantsRelevantForExtractionFromParentView:(id)a3;
+ (id)_getNotableSuperviewClassNamesForView:(id)a3;
+ (id)_handleWKWebView:(id)a3 withExecutor:(id)a4;
+ (void)_donateContentsOfParentView:(id)a3 usingExecutor:(id)a4 withOptions:(unint64_t)a5;
+ (void)_donateText:(id)a3 withTitle:(id)a4 debugText:(id)a5 debugUrlString:(id)a6 leadImage:(id)a7 snapshot:(id)a8 uiElements:(id)a9 usingContextFromExecutor:(id)a10;
+ (void)_extractContentFromWebView:(id)a3 includingUIBoundingBox:(BOOL)a4 withCompletionHandler:(id)a5;
+ (void)initialize;
- (CKContextContentProviderComponent)init;
- (UIView)view;
- (void)extractUsingExecutor:(id)a3 withOptions:(unint64_t)a4;
- (void)init;
- (void)setView:(id)a3;
@end

@implementation CKContextContentProviderComponent

+ (void)initialize
{
  v11[6] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v3 = *MEMORY[0x1E4F43D60];
    v11[0] = *MEMORY[0x1E4F43D50];
    v11[1] = v3;
    uint64_t v4 = *MEMORY[0x1E4F43DD8];
    v11[2] = *MEMORY[0x1E4F43E18];
    v11[3] = v4;
    uint64_t v5 = *MEMORY[0x1E4F43DC8];
    v11[4] = *MEMORY[0x1E4F43DB0];
    v11[5] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];
    uint64_t v7 = [v2 setWithArray:v6];
    v8 = (void *)kSensitiveContentTypes_0;
    kSensitiveContentTypes_0 = v7;

    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0E60670];
    v10 = (void *)kNotNotableSuperviewClassNames_0;
    kNotNotableSuperviewClassNames_0 = v9;
  }
}

- (CKContextContentProviderComponent)init
{
  v14.receiver = self;
  v14.super_class = (Class)CKContextContentProviderComponent;
  v2 = [(CKContextContentProviderComponent *)&v14 init];
  if (v2)
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (v3) {
      [(CKContextContentProviderComponent *)v3 init];
    }
    v11 = +[CKContextContentProviderManager sharedManager];
    [v11 addProvider:v2];

    v12 = v2;
  }

  return v2;
}

- (void)extractUsingExecutor:(id)a3 withOptions:(unint64_t)a4
{
  id v6 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    p_view = &self->_view;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

    if (WeakRetained)
    {
      uint64_t v9 = objc_opt_class();
      id v10 = objc_loadWeakRetained((id *)p_view);
      [v9 _donateContentsOfParentView:v10 usingExecutor:v6 withOptions:a4];
    }
    else
    {
      BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v11) {
        -[CKContextContentProviderComponent extractUsingExecutor:withOptions:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[CKContextContentProviderComponent extractUsingExecutor:withOptions:]();
  }
}

+ (void)_donateContentsOfParentView:(id)a3 usingExecutor:(id)a4 withOptions:(unint64_t)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v59 = [v7 window];
  uint64_t v9 = [a1 _decendantsRelevantForExtractionFromParentView:v7];
  if ([v9 count])
  {
    v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    unint64_t v58 = (unint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v56 = v7;
    id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = [v7 window];
    BOOL v11 = [v10 windowScene];
    v55 = [v11 _sceneIdentifier];

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v54 = v9;
    id obj = v9;
    uint64_t v65 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
    uint64_t v12 = 0;
    if (!v65) {
      goto LABEL_30;
    }
    uint64_t v64 = *(void *)v69;
    id v62 = a1;
    while (1)
    {
      for (uint64_t i = 0; i != v65; ++i)
      {
        if (*(void *)v69 != v64) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        uint64_t v15 = [a1 _bestVisibleStringForView:v14 usingExecutor:v8];
        if ([v15 length])
        {
          v66 = v12;
          if (([v63 containsObject:v15] & 1) == 0) {
            [v63 addObject:v15];
          }
          uint64_t v16 = (objc_class *)objc_opt_class();
          uint64_t v17 = NSStringFromClass(v16);
          uint64_t v18 = [a1 _getNotableSuperviewClassNamesForView:v14];
          [a1 _fontSizeOfView:v14 usingExecutor:v8];
          double v20 = v19;
          unint64_t v21 = [v15 length];
          if (v21 >= 0xFA) {
            uint64_t v22 = 250;
          }
          else {
            uint64_t v22 = v21;
          }
          v23 = objc_msgSend(v15, "substringWithRange:", 0, v22);
          v24 = [[CKContextUIElement alloc] initWithText:v23 className:v17];
          [(CKContextUIElement *)v24 setSuperviewClassNames:v18];
          *(float *)&double v25 = v20;
          [(CKContextUIElement *)v24 setFontSize:v25];
          v26 = [(CKContextUIElement *)v24 sceneIdentifier];
          uint64_t v27 = [v26 length];

          if (!v27)
          {
            v28 = (void *)[v55 copy];
            [(CKContextUIElement *)v24 setSceneIdentifier:v28];
          }
          if ((a5 & 4) != 0)
          {
            BOOL v61 = +[CKContextSharedExtractionHelper elementIsOnScreenWithView:v14 window:v59];
            [v14 bounds];
            objc_msgSend(v14, "convertRect:toView:", v59);
            double v30 = v29;
            double v32 = v31;
            -[CKContextUIElement setFrameInWindow:](v24, "setFrameInWindow:");
            v33 = [v59 screen];
            [v33 coordinateSpace];
            v35 = id v34 = v8;
            objc_msgSend(v56, "convertPoint:toCoordinateSpace:", v35, v30, v32);
            -[CKContextUIElement setAbsoluteOriginOnScreen:](v24, "setAbsoluteOriginOnScreen:");

            id v8 = v34;
            [(CKContextUIElement *)v24 setOnScreen:v61];
          }
          if ([(CKContextUIElement *)v24 isOnScreen])
          {
            v36 = (void *)v58;
            if ((unint64_t)[(id)v58 count] >= 0xFA) {
              goto LABEL_22;
            }
LABEL_21:
            [v36 addObject:v24];
          }
          else
          {
            v36 = v57;
            if ((unint64_t)[v57 count] <= 0xF9) {
              goto LABEL_21;
            }
          }
LABEL_22:

          a1 = v62;
          uint64_t v12 = v66;
        }
        if ((a5 & 1) != 0 && !v12)
        {
          v37 = +[CKContextSharedExtractionHelper bestImageForView:v14];
          uint64_t v12 = v37;
          if (v37) {
            id v38 = v37;
          }
        }
      }
      uint64_t v65 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
      if (!v65)
      {
LABEL_30:

        unint64_t v39 = 250 - [(id)v58 count];
        unint64_t v40 = [v57 count];
        if (v39 >= v40) {
          unint64_t v41 = v40;
        }
        else {
          unint64_t v41 = v39;
        }
        v42 = objc_msgSend(v57, "subarrayWithRange:", 0, v41);
        [(id)v58 addObjectsFromArray:v42];

        v43 = 0;
        if ((a5 & 2) != 0)
        {
          id v7 = v56;
          uint64_t v9 = v54;
          if (!v12)
          {
            [v59 bounds];
            double v45 = v44;
            double v47 = v46;
            double v49 = v48;
            double v51 = v50;
            char v52 = [v59 isOpaque];
            v75.width = v49;
            v75.height = v51;
            UIGraphicsBeginImageContextWithOptions(v75, v52, 0.0);
            objc_msgSend(v59, "drawViewHierarchyInRect:afterScreenUpdates:", 1, v45, v47, v49, v51);
            v43 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
          }
        }
        else
        {
          id v7 = v56;
          uint64_t v9 = v54;
        }
        v53 = [v63 componentsJoinedByString:@"\n\n"];
        [a1 _donateText:v53 withTitle:0 debugText:0 debugUrlString:0 leadImage:v12 snapshot:v43 uiElements:v58 & ((uint64_t)(a5 << 60) >> 63) usingContextFromExecutor:v8];

        goto LABEL_40;
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "There are no descendants on the view provided for extraction.", buf, 2u);
  }
LABEL_40:
}

+ (id)_decendantsRelevantForExtractionFromParentView:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v5 = [v3 subviews];
  id v6 = [v5 reverseObjectEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v7)
  {
    uint64_t v9 = 0;
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v40;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v40 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      if (([v12 isHidden] & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_12;
        }
        uint64_t v13 = [MEMORY[0x1E4F42D90] mainScreen];
        [v13 bounds];
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;

        [v12 frame];
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        v46.origin.x = v15;
        v46.origin.y = v17;
        v46.size.width = v19;
        v46.size.height = v21;
        double Width = CGRectGetWidth(v46);
        [v12 frame];
        double v31 = CGRectGetWidth(v47);
        if (!v9) {
          goto LABEL_11;
        }
        double v32 = v31;
        [v9 frame];
        v49.origin.x = v33;
        v49.origin.y = v34;
        v49.size.width = v35;
        v49.size.height = v36;
        v48.origin.x = v23;
        v48.origin.y = v25;
        v48.size.width = v27;
        v48.size.height = v29;
        if (!CGRectEqualToRect(v48, v49) || vabdd_f64(Width, v32) <= 20.0)
        {
LABEL_11:
          id v37 = v12;

          uint64_t v9 = v37;
LABEL_12:
          +[CKContextSharedExtractionHelper descendantsRelevantForContentExtractionFromView:v12 intoArray:v4];
          continue;
        }
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v43 count:16];
  }
  while (v8);
LABEL_17:

  return v4;
}

+ (id)_getNotableSuperviewClassNamesForView:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [v3 superview];
  int v6 = 20;
  while (1)
  {
    if (!v5)
    {
      uint64_t v9 = 0;
      goto LABEL_10;
    }
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = [v5 superview];

    if (([(id)kNotNotableSuperviewClassNames_0 containsObject:v8] & 1) == 0) {
      break;
    }
LABEL_6:

    uint64_t v5 = v9;
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

+ (void)_donateText:(id)a3 withTitle:(id)a4 debugText:(id)a5 debugUrlString:(id)a6 leadImage:(id)a7 snapshot:(id)a8 uiElements:(id)a9 usingContextFromExecutor:(id)a10
{
  double v16 = (objc_class *)MEMORY[0x1E4F5AC48];
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v26 = objc_alloc_init(v16);
  [v26 setText:v24];

  [v26 setTitle:v23];
  [v26 setDebugText:v22];

  [v26 setDebugUrlString:v21];
  [v26 setUiElements:v18];

  +[CKContextExtractionUtil renderSnapshot:v19 toDonationItem:v26];
  +[CKContextExtractionUtil renderLeadImage:v20 toDonationItem:v26];

  CGFloat v25 = [v17 context];

  [v25 addItem:v26];
}

+ (BOOL)_isSensitiveTextContentType:(id)a3
{
  return [(id)kSensitiveContentTypes_0 containsObject:a3];
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
  id v6 = a3;
  id v7 = a4;
  if (+[CKContextUIClasses isSFSafariView:v6])
  {
    uint64_t v8 = [v7 context];
    objc_msgSend(v8, "setRemoteProcesses:", objc_msgSend(v8, "remoteProcesses") + 1);
  }
  if (+[CKContextUIClasses isWKWebView:v6])
  {
    uint64_t v9 = [a1 _handleWKWebView:v6 withExecutor:v7];
LABEL_7:
    id v10 = (id)v9;
    goto LABEL_8;
  }
  if (+[CKContextUIClasses isPDFView:v6])
  {
    uint64_t v9 = [a1 handlePDFView:v6 withExecutor:v7];
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [v6 textContentType];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([a1 _isSensitiveTextContentType:v12])
    {

LABEL_18:
      id v10 = 0;
      goto LABEL_8;
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && ([v6 isSecureTextEntry]) {
    goto LABEL_18;
  }
  uint64_t v13 = 0;
  if (![0 length])
  {
    if (objc_opt_respondsToSelector())
    {
      double v14 = [v6 attributedText];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v14 string];
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  if (![v13 length] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CGFloat v15 = [v6 performSelector:sel_text];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v15;

      uint64_t v13 = v16;
    }
  }
  if (![v13 length] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v17 = [v6 performSelector:sel_accessibilityLabel];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v17 length] >= 0x14)
    {
      id v18 = v17;

      uint64_t v13 = v18;
    }
  }
  if (![v13 length] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v19 = [v6 performSelector:sel_component];
    if (objc_opt_respondsToSelector())
    {
      id v20 = [v19 performSelector:sel_text];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v20;

        uint64_t v13 = v21;
      }
    }
  }
  if (![v13 length] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v22 = [v6 performSelector:sel_dataDetectorElement];
    if (objc_opt_respondsToSelector())
    {
      id v23 = [v22 performSelector:sel_scannerResult];
      if (objc_opt_respondsToSelector())
      {
        id v24 = [v23 performSelector:sel_value];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v25 = v24;

          uint64_t v13 = v25;
        }
      }
    }
  }
  if ([v13 length]) {
    id v26 = v13;
  }
  else {
    id v26 = 0;
  }
  id v10 = v26;

LABEL_8:

  return v10;
}

+ (id)_UIElementsForWebViewContentString:(id)a3 withSceneIdentifier:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v29 = a4;
  if ([v5 length])
  {
    id v6 = +[CKContextSharedExtractionHelper blocksFromText:v5];
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v6 count])
    {
      id v26 = v6;
      id v27 = v5;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v31 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (!+[CKContextSharedExtractionHelper textBlockLooksLikeAListWithText:v12])
            {
              uint64_t v13 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
              double v14 = [v12 componentsSeparatedByCharactersInSet:v13];
              CGFloat v15 = [NSString stringWithFormat:@"@distinctUnionOfObjects.%@", @"self"];
              id v16 = [v14 valueForKeyPath:v15];

              id v17 = [v16 componentsJoinedByString:@"\n"];
              unint64_t v18 = [v16 count];
              unint64_t v19 = [v17 length];
              if (v19) {
                BOOL v20 = v18 == 0;
              }
              else {
                BOOL v20 = 1;
              }
              if (!v20)
              {
                float v21 = (float)v19 / (float)v18;
                id v22 = [[CKContextUIElement alloc] initWithText:v17 className:@"WKWebView"];
                *(float *)&double v23 = v21;
                [(CKContextUIElement *)v22 setDensity:v23];
                id v24 = (void *)[v29 copy];
                [(CKContextUIElement *)v22 setSceneIdentifier:v24];

                [v28 addObject:v22];
              }
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v9);
      }

      id v6 = v26;
      id v5 = v27;
    }
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

+ (id)_handleWKWebView:(id)a3 withExecutor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Extracting from a WKWebView", buf, 2u);
  }
  uint64_t v8 = [a1 controlCodeForExecutor:v7];
  +[CKContextContentProviderManager optionsForControlCode:v8];
  if (v8 != 2 && v8 != 4 && [v6 isLoading])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = MEMORY[0x1E4F14500];
      uint64_t v10 = "The web view is still loading. There should be no attempt to extract content from it without user gesture.";
LABEL_14:
      _os_log_impl(&dword_1B56AD000, v9, OS_LOG_TYPE_INFO, v10, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  BOOL v11 = [v6 configuration];
  uint64_t v12 = [v11 websiteDataStore];
  char v13 = [v12 isPersistent];

  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = MEMORY[0x1E4F14500];
      uint64_t v10 = "The webview data store is not persistent. We cannot extract from it for privacy reasons without user gesture.";
      goto LABEL_14;
    }
LABEL_15:
    id v22 = &stru_1F0E5E050;
    goto LABEL_16;
  }
  BOOL v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v14) {
    +[CKContextContentProviderComponent _handleWKWebView:withExecutor:](v14, v15, v16, v17, v18, v19, v20, v21);
  }
  [v7 markIncomplete];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __67__CKContextContentProviderComponent__handleWKWebView_withExecutor___block_invoke;
  v24[3] = &unk_1E6111068;
  id v26 = a1;
  id v25 = v6;
  [v7 addWorkItem:v24];

  id v22 = 0;
LABEL_16:

  return v22;
}

void __67__CKContextContentProviderComponent__handleWKWebView_withExecutor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 40) controlCodeForExecutor:v3];
  char v5 = v4;
  unint64_t v6 = +[CKContextContentProviderManager optionsForControlCode:v4];
  uint64_t v7 = (v6 >> 2) & 1;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__CKContextContentProviderComponent__handleWKWebView_withExecutor___block_invoke_2;
  v17[3] = &unk_1E6111288;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 40);
  char v21 = v5;
  BOOL v22 = (v6 & 4) != 0;
  BOOL v23 = (v6 & 8) != 0;
  id v18 = v8;
  id v19 = v3;
  id v9 = v3;
  uint64_t v10 = (void *)MEMORY[0x1BA99DED0](v17);
  uint64_t v13 = a1 + 32;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v13 + 8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__CKContextContentProviderComponent__handleWKWebView_withExecutor___block_invoke_3;
  v15[3] = &unk_1E61112B0;
  id v16 = v10;
  id v14 = v10;
  [v12 _extractContentFromWebView:v11 includingUIBoundingBox:v7 withCompletionHandler:v15];
}

void __67__CKContextContentProviderComponent__handleWKWebView_withExecutor___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v32 = a2;
  id v30 = a3;
  uint64_t v8 = *(void **)(a1 + 48);
  id v9 = *(void **)(a1 + 32);
  id v10 = a4;
  uint64_t v11 = [v9 window];
  uint64_t v12 = [v11 windowScene];
  uint64_t v13 = [v12 _sceneIdentifier];
  id v14 = [v8 _UIElementsForWebViewContentString:v32 withSceneIdentifier:v13];

  uint64_t v15 = [*(id *)(a1 + 32) title];
  long long v31 = +[CKContextSharedExtractionHelper bestContentStringForWebViewUIElements:v14 andTitle:v15];

  unint64_t v16 = [v14 count];
  if (v16 >= 0xFA) {
    uint64_t v17 = 250;
  }
  else {
    uint64_t v17 = v16;
  }
  id v18 = objc_msgSend(v14, "subarrayWithRange:", 0, v17);
  unint64_t v19 = [v10 count];
  if (v19 >= 0xFA) {
    uint64_t v20 = 250;
  }
  else {
    uint64_t v20 = v19;
  }
  char v21 = objc_msgSend(v10, "subarrayWithRange:", 0, v20);

  unsigned int v22 = (*(unsigned __int8 *)(a1 + 56) < 6u) & (0x2Cu >> *(unsigned char *)(a1 + 56));
  if (*(unsigned char *)(a1 + 57)) {
    BOOL v23 = v21;
  }
  else {
    BOOL v23 = v18;
  }
  id v24 = v23;
  id v25 = *(void **)(a1 + 48);
  id v26 = [*(id *)(a1 + 32) title];
  if (v22 == 1)
  {
    uint64_t v4 = [*(id *)(a1 + 32) URL];
    id v27 = [v4 absoluteString];
    id v28 = v32;
  }
  else
  {
    id v28 = 0;
    id v27 = 0;
  }
  if (*(unsigned char *)(a1 + 58)) {
    id v29 = v24;
  }
  else {
    id v29 = 0;
  }
  [v25 _donateText:v31 withTitle:v26 debugText:v28 debugUrlString:v27 leadImage:0 snapshot:v30 uiElements:v29 usingContextFromExecutor:*(void *)(a1 + 40)];
  if (v22)
  {
  }
  [*(id *)(a1 + 40) markReady];
}

uint64_t __67__CKContextContentProviderComponent__handleWKWebView_withExecutor___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_extractContentFromWebView:(id)a3 includingUIBoundingBox:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = [v8 window];
    if ([v8 _isDisplayingPDF])
    {
      uint64_t v11 = [v8 _dataForDisplayedPDF];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke;
      v52[3] = &unk_1E6111108;
      id v53 = v9;
      [a1 extractContentFromWebViewPDFData:v11 withCompletionHandler:v52];
      uint64_t v12 = v53;
    }
    else
    {
      uint64_t v13 = dispatch_group_create();
      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x3032000000;
      v50[3] = __Block_byref_object_copy__0;
      v50[4] = __Block_byref_object_dispose__0;
      double v51 = 0;
      v48[0] = 0;
      v48[1] = v48;
      v48[2] = 0x3032000000;
      v48[3] = __Block_byref_object_copy__0;
      v48[4] = __Block_byref_object_dispose__0;
      id v49 = 0;
      v46[0] = 0;
      v46[1] = v46;
      v46[2] = 0x3032000000;
      v46[3] = __Block_byref_object_copy__0;
      v46[4] = __Block_byref_object_dispose__0;
      id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      dispatch_group_enter(v13);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_113;
      v41[3] = &unk_1E61112D8;
      uint64_t v44 = v50;
      uint64_t v45 = 3000;
      uint64_t v11 = v13;
      long long v42 = v11;
      id v14 = v8;
      id v43 = v14;
      [v14 _getContentsAsStringWithCompletionHandler:v41];
      uint64_t v55 = 0;
      v56 = &v55;
      uint64_t v57 = 0x2050000000;
      uint64_t v15 = (void *)getWKContentWorldClass_softClass_0;
      uint64_t v58 = getWKContentWorldClass_softClass_0;
      if (!getWKContentWorldClass_softClass_0)
      {
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __getWKContentWorldClass_block_invoke_0;
        v54[3] = &unk_1E6110F98;
        v54[4] = &v55;
        __getWKContentWorldClass_block_invoke_0((uint64_t)v54);
        uint64_t v15 = (void *)v56[3];
      }
      id v16 = v15;
      _Block_object_dispose(&v55, 8);
      uint64_t v17 = [v16 worldWithName:@"CKContextExtractionContentWorld"];
      id v18 = (void *)v17;
      if (v6 && v17)
      {
        unint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
        BOOL v20 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
        if (v20) {
          +[CKContextContentProviderComponent _extractContentFromWebView:includingUIBoundingBox:withCompletionHandler:](v20, v21, v22, v23, v24, v25, v26, v27);
        }
        dispatch_group_enter(v11);
        id v28 = +[CKContextSharedExtractionHelper webPageNodeExtractionJavaScript];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_117;
        v35[3] = &unk_1E6111300;
        id v29 = v19;
        id v36 = v29;
        id v37 = v11;
        id v38 = v14;
        id v39 = v10;
        long long v40 = v46;
        [v38 evaluateJavaScript:v28 inFrame:0 inContentWorld:v18 completionHandler:v35];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_122;
      block[3] = &unk_1E6111328;
      id v31 = v9;
      id v32 = v50;
      long long v33 = v48;
      CGFloat v34 = v46;
      dispatch_group_notify(v11, MEMORY[0x1E4F14428], block);

      _Block_object_dispose(v46, 8);
      _Block_object_dispose(v48, 8);

      _Block_object_dispose(v50, 8);
      uint64_t v12 = v51;
    }
  }
}

uint64_t __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_113(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 length] < 0x96)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Failed to extract enough text from main webpage frame. Trying to get content from all frames", buf, 2u);
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_114;
    v12[3] = &unk_1E6111130;
    id v10 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = v11;
    id v13 = *(id *)(a1 + 32);
    [v10 _getContentsOfAllFramesAsStringWithCompletionHandler:v12];
  }
  else
  {
    unint64_t v4 = *(void *)(a1 + 56);
    unint64_t v5 = [v3 length];
    if (v4 >= v5) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = v4;
    }
    uint64_t v7 = objc_msgSend(v3, "substringWithRange:", 0, v6);
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_114(void *a1, void *a2)
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
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = a1[4];

  dispatch_group_leave(v10);
}

void __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_117_cold_3(a1);
    if (v6) {
      goto LABEL_3;
    }
  }
  else if (v6)
  {
LABEL_3:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_cold_2((uint64_t)v6);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    goto LABEL_62;
  }
  uint64_t v7 = [v5 description];
  if ([v7 length])
  {
    uint64_t v8 = [v7 dataUsingEncoding:4];
    id v81 = 0;
    id v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v81];
    id v10 = v81;
    if (v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_cold_1();
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
    else
    {
      uint64_t v11 = [v9 objectForKeyedSubscript:@"nodes"];
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v64 = v9;
          uint64_t v65 = v8;
          v66 = v7;
          id v67 = v6;
          id v68 = v5;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          id obj = v11;
          uint64_t v12 = [obj countByEnumeratingWithState:&v77 objects:v82 count:16];
          v63 = v11;
          if (v12)
          {
            uint64_t v13 = v12;
            unint64_t v14 = 0x1E4F1C000uLL;
            uint64_t v15 = *(void *)v78;
            uint64_t v69 = *(void *)v78;
            do
            {
              uint64_t v16 = 0;
              uint64_t v70 = v13;
              do
              {
                if (*(void *)v78 != v15) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v17 = *(void **)(*((void *)&v77 + 1) + 8 * v16);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v18 = [v17 objectForKeyedSubscript:@"text"];
                  unint64_t v19 = [*(id *)(v14 + 2712) null];
                  if ([v18 isEqual:v19])
                  {
                    BOOL v20 = 0;
                  }
                  else
                  {
                    BOOL v20 = [v17 objectForKeyedSubscript:@"text"];
                  }

                  uint64_t v21 = [v17 objectForKeyedSubscript:@"className"];
                  uint64_t v22 = [*(id *)(v14 + 2712) null];
                  if ([v21 isEqual:v22])
                  {
                    v72 = 0;
                  }
                  else
                  {
                    v72 = [v17 objectForKeyedSubscript:@"className"];
                  }

                  uint64_t v23 = [v17 objectForKeyedSubscript:@"left"];
                  uint64_t v24 = [*(id *)(v14 + 2712) null];
                  if ([v23 isEqual:v24])
                  {
                    v76 = 0;
                  }
                  else
                  {
                    v76 = [v17 objectForKeyedSubscript:@"left"];
                  }

                  uint64_t v25 = [v17 objectForKeyedSubscript:@"right"];
                  uint64_t v26 = [*(id *)(v14 + 2712) null];
                  if ([v25 isEqual:v26])
                  {
                    CGSize v75 = 0;
                  }
                  else
                  {
                    CGSize v75 = [v17 objectForKeyedSubscript:@"right"];
                  }

                  uint64_t v27 = [v17 objectForKeyedSubscript:@"top"];
                  unint64_t v28 = v14;
                  id v29 = [*(id *)(v14 + 2712) null];
                  if ([v27 isEqual:v29])
                  {
                    uint64_t v74 = 0;
                  }
                  else
                  {
                    uint64_t v74 = [v17 objectForKeyedSubscript:@"top"];
                  }

                  id v30 = [v17 objectForKeyedSubscript:@"bottom"];
                  id v31 = [*(id *)(v28 + 2712) null];
                  v73 = v20;
                  if ([v30 isEqual:v31])
                  {
                    id v32 = 0;
                  }
                  else
                  {
                    id v32 = [v17 objectForKeyedSubscript:@"bottom"];
                  }

                  long long v33 = [v17 objectForKeyedSubscript:@"onScreen"];
                  CGFloat v34 = [*(id *)(v28 + 2712) null];
                  if ([v33 isEqual:v34])
                  {
                    uint64_t v35 = 0;
                  }
                  else
                  {
                    uint64_t v35 = [v17 objectForKeyedSubscript:@"onScreen"];
                  }

                  if ([v20 length])
                  {
                    id v36 = [CKContextUIElement alloc];
                    unint64_t v37 = [v20 length];
                    if (v37 >= 0xFA) {
                      uint64_t v38 = 250;
                    }
                    else {
                      uint64_t v38 = v37;
                    }
                    id v39 = objc_msgSend(v20, "substringWithRange:", 0, v38);
                    long long v40 = [(CKContextUIElement *)v36 initWithText:v39 className:v72];

                    -[CKContextUIElement setOnScreen:](v40, "setOnScreen:", [v35 BOOLValue]);
                    long long v41 = [*(id *)(a1 + 48) window];
                    long long v42 = [v41 windowScene];
                    id v43 = [v42 _sceneIdentifier];
                    uint64_t v44 = a1;
                    uint64_t v45 = (void *)[v43 copy];
                    [(CKContextUIElement *)v40 setSceneIdentifier:v45];

                    a1 = v44;
                    if (v76 && v75 && v74 && v32)
                    {
                      CGRect v46 = *(void **)(v44 + 48);
                      [v76 doubleValue];
                      double v48 = v47;
                      [v74 doubleValue];
                      objc_msgSend(v46, "_convertPointFromContentsToView:", v48, v49);
                      double v51 = v50;
                      double v53 = v52;
                      v54 = *(void **)(v44 + 48);
                      [v75 doubleValue];
                      double v56 = v55;
                      [v32 doubleValue];
                      objc_msgSend(v54, "_convertPointFromContentsToView:", v56, v57);
                      objc_msgSend(*(id *)(v44 + 48), "convertRect:toView:", 0, v51, v53, v58 - v51, v59 - v53);
                      objc_msgSend(*(id *)(v44 + 56), "convertRect:toView:", 0);
                      -[CKContextUIElement setFrameInWindow:](v40, "setFrameInWindow:");
                      v60 = [*(id *)(v44 + 56) screen];
                      BOOL v61 = [v60 coordinateSpace];

                      if (v61)
                      {
                        id v62 = *(void **)(v44 + 56);
                        [(CKContextUIElement *)v40 frameInWindow];
                        objc_msgSend(v62, "convertPoint:toCoordinateSpace:", v61);
                        -[CKContextUIElement setAbsoluteOriginOnScreen:](v40, "setAbsoluteOriginOnScreen:");
                      }
                    }
                    [*(id *)(*(void *)(*(void *)(v44 + 64) + 8) + 40) addObject:v40];

                    BOOL v20 = v73;
                  }

                  unint64_t v14 = v28;
                  uint64_t v15 = v69;
                  uint64_t v13 = v70;
                }
                ++v16;
              }
              while (v13 != v16);
              uint64_t v13 = [obj countByEnumeratingWithState:&v77 objects:v82 count:16];
            }
            while (v13);
          }

          id v6 = v67;
          id v5 = v68;
          uint64_t v11 = v63;
          id v10 = 0;
          uint64_t v8 = v65;
          uint64_t v7 = v66;
          id v9 = v64;
        }
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

LABEL_62:
}

uint64_t __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_122(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40));
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
}

- (void)extractUsingExecutor:(uint64_t)a3 withOptions:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)extractUsingExecutor:withOptions:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "CKContextContentProviderComponent is unexpectedly trying to capture from off of the main thread.", v0, 2u);
}

+ (void)_handleWKWebView:(uint64_t)a3 withExecutor:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_extractContentFromWebView:(uint64_t)a3 includingUIBoundingBox:(uint64_t)a4 withCompletionHandler:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_117_cold_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Evaluated after %f seconds", (uint8_t *)&v4, 0xCu);
}

@end