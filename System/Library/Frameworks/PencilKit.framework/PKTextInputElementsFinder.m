@interface PKTextInputElementsFinder
+ (BOOL)isResponderNonEditableTextInput:(uint64_t)a1;
+ (BOOL)shouldConsiderTextInputSearchForView:(uint64_t)a3 referenceHitPoint:(void *)a4 referenceCoordSpace:(void *)a5;
+ (uint64_t)_anyOtherWindowAboveWindow:(uint64_t)a3 position:(void *)a4;
+ (uint64_t)_isReachableHitTestView:(uint64_t)a3 nearPoint:(void *)a4 coordSpace:(void *)a5;
+ (uint64_t)_shouldConsiderTextInputSearchForView:(uint64_t)a3 referenceHitPoint:(void *)a4 referenceCoordSpace:(void *)a5 nearPointOnly:(int)a6;
+ (uint64_t)isResponderEditableTextInput:(uint64_t)a1;
+ (uint64_t)responderSupportsPencilTextInput:(uint64_t)a1;
+ (uint64_t)shouldAvoidElementWithHitView:(uint64_t)a1;
+ (uint64_t)shouldDisableInputAssistantForTextInput:(uint64_t)a1;
- (id)initWithWindowsToSearch:(id)a1;
- (void)_collectTextInputs:(void *)a3 asyncElementContainers:(void *)a4 underView:(void *)a5 referenceHitPoint:(uint64_t)a6 referenceSearchArea:(void *)a7 referenceCoordSpace:(void *)a8 nearPointOnly:(CGFloat)a9 firstResponderTextInputView:(CGFloat)a10 elementContainerCompletion:(double)a11;
- (void)_findAvailableTextInputElementsWithReusableElements:(void *)a3 referenceHitPoint:(unsigned int)a4 referenceSearchArea:(void *)a5 referenceCoordSpace:(CGFloat)a6 nearPointOnly:(CGFloat)a7 completion:(CGFloat)a8;
- (void)_finishFindIfReadyTimedOut:(uint64_t)a1;
@end

@implementation PKTextInputElementsFinder

- (id)initWithWindowsToSearch:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)PKTextInputElementsFinder;
    a1 = objc_msgSendSuper2(&v8, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v4;

      *((void *)a1 + 3) = 0;
      v6 = +[PKTextInputSettings sharedSettings];
      *((unsigned char *)a1 + 9) = [v6 enableOnNonEditableViews];
    }
  }

  return a1;
}

- (void)_findAvailableTextInputElementsWithReusableElements:(void *)a3 referenceHitPoint:(unsigned int)a4 referenceSearchArea:(void *)a5 referenceCoordSpace:(CGFloat)a6 nearPointOnly:(CGFloat)a7 completion:(CGFloat)a8
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v57 = a2;
  id v62 = a3;
  id newValue = a5;
  if (!a1) {
    goto LABEL_31;
  }
  v58 = +[PKTextInputSettings sharedSettings];
  [v58 firstResponderAttractionHorizontal];
  CGFloat v22 = v21 + v21;
  [v58 firstResponderAttractionVertical];
  v81.size.double height = v23 + v23;
  v81.origin.double x = a6 - v22 * 0.5;
  v81.origin.double y = a7 - (v23 + v23) * 0.5;
  v79.origin.double x = a8;
  v79.origin.double y = a9;
  v79.size.double width = a10;
  v79.size.double height = a11;
  v81.size.double width = v22;
  CGRect v80 = CGRectUnion(v79, v81);
  double x = v80.origin.x;
  double y = v80.origin.y;
  double width = v80.size.width;
  double height = v80.size.height;
  objc_setProperty_nonatomic_copy((id)a1, v28, newValue, 40);
  objc_storeStrong((id *)(a1 + 48), a2);
  v29 = [MEMORY[0x1E4F28D30] hashTableWithOptions:0];
  *(void *)(a1 + 24) = 1;
  uint64_t v30 = [MEMORY[0x1E4F1CA80] set];
  v31 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v30;

  uint64_t v32 = [MEMORY[0x1E4F1CA80] set];
  v33 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v32;

  *(unsigned char *)(a1 + 10) = 1;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = *(id *)(a1 + 16);
  uint64_t v34 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (!v34) {
    goto LABEL_20;
  }
  uint64_t v35 = *(void *)v73;
  do
  {
    uint64_t v36 = 0;
    do
    {
      if (*(void *)v73 != v35) {
        objc_enumerationMutation(obj);
      }
      v37 = *(void **)(*((void *)&v72 + 1) + 8 * v36);
      v38 = [v37 firstResponder];
      v39 = +[PKTextInputSettings sharedSettings];
      if ([v39 enableViewControllerSupport])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v42 = +[PKTextInputElementsFinder responderSupportsPencilTextInput:]((uint64_t)PKTextInputElementsFinder, v38);

          if (!v42) {
            goto LABEL_10;
          }
          v40 = [v38 textInputView];
          v39 = v38;
          if (v40 != v38) {
            goto LABEL_11;
          }
        }
      }

LABEL_10:
      v40 = 0;
LABEL_11:
      v41 = *(void **)(a1 + 32);
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __164__PKTextInputElementsFinder__findAvailableTextInputElementsWithReusableElements_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_completion___block_invoke;
      v71[3] = &unk_1E64C6B90;
      v71[4] = a1;
      -[PKTextInputElementsFinder _collectTextInputs:asyncElementContainers:underView:referenceHitPoint:referenceSearchArea:referenceCoordSpace:nearPointOnly:firstResponderTextInputView:elementContainerCompletion:](a1, v29, v41, v37, v62, a4, v40, v71, a6, a7, x, y, width, height);
      if (v40 && [v29 containsObject:v40])
      {
        [v29 removeObject:v40];
        [v29 addObject:v38];
      }

      ++v36;
    }
    while (v34 != v36);
    uint64_t v43 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
    uint64_t v34 = v43;
  }
  while (v43);
LABEL_20:

  long long v70 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v67 = 0u;
  id v44 = v29;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v68 != v46) {
          objc_enumerationMutation(v44);
        }
        v48 = -[PKTextInputElement initWithTextInput:]((id *)[PKTextInputElement alloc], *(void **)(*((void *)&v67 + 1) + 8 * i));
        [*(id *)(a1 + 56) addObject:v48];
      }
      uint64_t v45 = [v44 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v45);
  }

  *(unsigned char *)(a1 + 10) = 0;
  if ([*(id *)(a1 + 32) count])
  {
    *(void *)(a1 + 24) = 2;
    objc_initWeak(&location, (id)a1);
    v49 = +[PKTextInputSettings sharedSettings];
    [v49 asyncElementRequestTimeout];
    double v51 = v50;

    dispatch_time_t v52 = dispatch_time(0, (uint64_t)(v51 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __164__PKTextInputElementsFinder__findAvailableTextInputElementsWithReusableElements_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_completion___block_invoke_8;
    block[3] = &unk_1E64C5998;
    objc_copyWeak(&v65, &location);
    dispatch_after(v52, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v65);
    objc_destroyWeak(&location);
  }
  else
  {
    v53 = +[PKTextInputSettings sharedSettings];
    [v53 debugElementFinderArtificialDelay];
    double v55 = v54;

    dispatch_time_t v56 = dispatch_time(0, (uint64_t)(v55 * 1000000000.0));
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __164__PKTextInputElementsFinder__findAvailableTextInputElementsWithReusableElements_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_completion___block_invoke_2;
    v63[3] = &unk_1E64C61C0;
    v63[4] = a1;
    dispatch_after(v56, MEMORY[0x1E4F14428], v63);
  }

LABEL_31:
}

+ (uint64_t)responderSupportsPencilTextInput:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  uint64_t v4 = PKScribbleInteractionInTextInput(v2);
  int v5 = [v4 isElementContainer];
  if (objc_opt_respondsToSelector())
  {
    int v6 = [v4 isEnabled] ^ 1;
    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
    int v6 = 0;
    if (!v5)
    {
LABEL_7:
      uint64_t v7 = +[PKTextInputElementsFinder isResponderEditableTextInput:](v3, v2);
      goto LABEL_8;
    }
  }
  if (v6) {
    goto LABEL_7;
  }
  uint64_t v7 = 1;
LABEL_8:

  return v7;
}

void __164__PKTextInputElementsFinder__findAvailableTextInputElementsWithReusableElements_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_completion___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9 && *(void *)(v9 + 24) == 4)
  {
    v10 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218498;
      uint64_t v17 = [v8 count];
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2048;
      double v21 = a4;
      _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring text input elements: %ld because of timeout. Interaction: %@. Duration: %0.3fs.", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    v11 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218498;
      uint64_t v17 = [v8 count];
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2048;
      double v21 = a4;
      _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "Received text input elements: %ld. Interaction: %@. Duration: %0.3fs.", (uint8_t *)&v16, 0x20u);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      v13 = *(void **)(v12 + 32);
    }
    else {
      v13 = 0;
    }
    [v13 removeObject:v7];
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      v15 = *(void **)(v14 + 56);
    }
    else {
      v15 = 0;
    }
    [v15 addObjectsFromArray:v8];
    -[PKTextInputElementsFinder _finishFindIfReadyTimedOut:](*(void *)(a1 + 32), 0);
  }
}

- (void)_finishFindIfReadyTimedOut:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1
    && (unint64_t)(*(void *)(a1 + 24) - 3) >= 2
    && ![*(id *)(a1 + 32) count]
    && !*(unsigned char *)(a1 + 10))
  {
    uint64_t v2 = 3;
    if (a2) {
      uint64_t v2 = 4;
    }
    *(void *)(a1 + 24) = v2;
    uint64_t v3 = *(void **)(a1 + 48);
    id v4 = *(id *)(a1 + 56);
    id v5 = v3;
    self;
    int v16 = v4;
    if ([v5 count])
    {
      id v20 = [MEMORY[0x1E4F1CA80] set];
      int v6 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obj = v4;
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v31 != v8) {
              objc_enumerationMutation(obj);
            }
            v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            uint64_t v24 = 0;
            v25 = &v24;
            uint64_t v26 = 0x3032000000;
            v27 = __Block_byref_object_copy__4;
            SEL v28 = __Block_byref_object_dispose__4;
            id v29 = v10;
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __61__PKTextInputElementsFinder__uniqueElements_reusingElements___block_invoke;
            v21[3] = &unk_1E64C6BB8;
            v21[4] = v29;
            double v23 = &v24;
            id v22 = v6;
            [v5 enumerateObjectsAtIndexes:v22 options:0 usingBlock:v21];
            [v20 addObject:v25[5]];

            _Block_object_dispose(&v24, 8);
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v7);
      }
    }
    else
    {
      id v20 = v4;
    }

    uint64_t v12 = (void *)a1;
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13)
    {
      (*(void (**)(uint64_t, id, void))(v13 + 16))(v13, v20, a2);
      uint64_t v12 = (void *)a1;
    }
    uint64_t v14 = v12;
    objc_setProperty_nonatomic_copy(v12, v11, 0, 40);
    v15 = (void *)v14[6];
    v14[6] = 0;
  }
}

- (void)_collectTextInputs:(void *)a3 asyncElementContainers:(void *)a4 underView:(void *)a5 referenceHitPoint:(uint64_t)a6 referenceSearchArea:(void *)a7 referenceCoordSpace:(void *)a8 nearPointOnly:(CGFloat)a9 firstResponderTextInputView:(CGFloat)a10 elementContainerCompletion:(double)a11
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v92 = a2;
  id v27 = a3;
  id v28 = a4;
  id v29 = a5;
  id v30 = a7;
  id v31 = a8;
  long long v32 = off_1E64C4000;
  uint64_t v33 = +[PKTextInputElementsFinder _shouldConsiderTextInputSearchForView:(uint64_t)PKTextInputElementsFinder referenceHitPoint:v28 referenceCoordSpace:v29 nearPointOnly:a6];
  if (v33)
  {
    uint64_t v34 = v33;
    if (v33 == 1)
    {
      id v35 = v28;
      self;
      uint64_t v36 = PKScribbleInteractionInView(v35);

      if ([v36 isElementContainer]) {
        v37 = v36;
      }
      else {
        v37 = 0;
      }
      id v38 = v37;

      long long v32 = off_1E64C4000;
    }
    else
    {
      id v38 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      int v39 = [v38 isEnabled] ^ 1;
      if (!v38) {
        goto LABEL_21;
      }
    }
    else
    {
      int v39 = 0;
      if (!v38) {
        goto LABEL_21;
      }
    }
    if (!v39)
    {
      int v40 = +[PKTextInputElementsFinder _isReachableHitTestView:(uint64_t)v32[146] nearPoint:v28 coordSpace:v29];
      BOOL v41 = +[PKTextInputUtilities isValidReachableInteraction:v28];
      if (v40)
      {
        BOOL v42 = v27 && v41;
        if (v31 && v42)
        {
          uint64_t v43 = v38;
          id v44 = [v28 window];
          [v44 bounds];
          double v46 = v45;
          double v48 = v47;
          double v50 = v49;
          double v52 = v51;
          v53 = [v28 window];
          objc_msgSend(v28, "PK_convertRect:fromView:", v53, v46, v48, v50, v52);
          CGFloat v55 = v54;
          CGFloat v57 = v56;
          CGFloat v59 = v58;
          CGFloat v61 = v60;

          id v62 = +[PKTextInputSettings sharedSettings];
          if ([v62 useLargeHitTestArea]) {
            [v28 bounds];
          }
          else {
            objc_msgSend(v28, "PK_convertRect:fromCoordinateSpace:", v29, a11, a12, a13, a14);
          }
          id v38 = v43;
          v109.origin.double x = v55;
          v109.origin.double y = v57;
          v109.size.double width = v59;
          v109.size.double height = v61;
          CGRect v108 = CGRectIntersection(*(CGRect *)&v63, v109);
          double x = v108.origin.x;
          double y = v108.origin.y;
          double width = v108.size.width;
          double height = v108.size.height;
          if (!CGRectIsNull(v108))
          {
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            uint64_t v84 = v83;
            [v27 addObject:v43];
            v97[0] = MEMORY[0x1E4F143A8];
            v97[1] = 3221225472;
            v97[2] = __208__PKTextInputElementsFinder__collectTextInputs_asyncElementContainers_underView_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_firstResponderTextInputView_elementContainerCompletion___block_invoke;
            v97[3] = &unk_1E64C6BE0;
            uint64_t v100 = v84;
            id v98 = v43;
            id v99 = v31;
            objc_msgSend(v98, "requestElementsInRect:completion:", v97, x, y, width, height);
          }
          goto LABEL_57;
        }
      }
      long long v32 = off_1E64C4000;
      if (v34 != 1)
      {
LABEL_49:
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id v62 = objc_msgSend(v28, "subviews", v85);
        uint64_t v75 = [v62 countByEnumeratingWithState:&v93 objects:v105 count:16];
        if (v75)
        {
          uint64_t v76 = v75;
          id v87 = v38;
          id v89 = v28;
          uint64_t v77 = *(void *)v94;
          do
          {
            for (uint64_t i = 0; i != v76; ++i)
            {
              if (*(void *)v94 != v77) {
                objc_enumerationMutation(v62);
              }
              -[PKTextInputElementsFinder _collectTextInputs:asyncElementContainers:underView:referenceHitPoint:referenceSearchArea:referenceCoordSpace:nearPointOnly:firstResponderTextInputView:elementContainerCompletion:](a1, v92, v27, *(void *)(*((void *)&v93 + 1) + 8 * i), v29, a6, v30, v31, a9, a10, a11, a12, a13, a14);
            }
            uint64_t v76 = [v62 countByEnumeratingWithState:&v93 objects:v105 count:16];
          }
          while (v76);
          id v38 = v87;
          id v28 = v89;
        }
LABEL_57:

        goto LABEL_58;
      }
LABEL_24:
      if (+[PKTextInputElementsFinder isResponderEditableTextInput:]((uint64_t)v32[146], v28))
      {
        if (*(unsigned char *)(a1 + 8)) {
          long long v67 = 0;
        }
        else {
          long long v67 = v28;
        }
        id v68 = v67;
      }
      else
      {
        if (!*(unsigned char *)(a1 + 9))
        {
          long long v69 = 0;
LABEL_32:
          if (v28 == v30 || v69)
          {
            if (+[PKTextInputElementsFinder _isReachableHitTestView:(uint64_t)v32[146] nearPoint:v28 coordSpace:v29])
            {
LABEL_47:
              objc_msgSend(v92, "addObject:", v69, v85);
            }
            else
            {
              v85 = v69;
              id v86 = v38;
              id v88 = v28;
              id v90 = v28;
              long long v101 = 0u;
              long long v102 = 0u;
              long long v103 = 0u;
              long long v104 = 0u;
              id v70 = *(id *)(a1 + 48);
              uint64_t v71 = [v70 countByEnumeratingWithState:&v101 objects:v106 count:16];
              if (v71)
              {
                uint64_t v72 = v71;
                uint64_t v91 = *(void *)v102;
                while (2)
                {
                  for (uint64_t j = 0; j != v72; ++j)
                  {
                    if (*(void *)v102 != v91) {
                      objc_enumerationMutation(v70);
                    }
                    uint64_t v74 = *(void *)(*((void *)&v101 + 1) + 8 * j);
                    if (-[PKTextInputElement isFocused](v74)
                      && -[PKTextInputElement isElementView:](v74, v90))
                    {

                      long long v69 = v85;
                      id v38 = v86;
                      id v28 = v88;
                      goto LABEL_47;
                    }
                  }
                  uint64_t v72 = [v70 countByEnumeratingWithState:&v101 objects:v106 count:16];
                  if (v72) {
                    continue;
                  }
                  break;
                }
              }

              long long v69 = v85;
              id v38 = v86;
              id v28 = v88;
            }
          }

          goto LABEL_49;
        }
        id v68 = +[PKTextInputUtilities nonEditableTextInputForView:v28];
      }
      long long v69 = v68;
      goto LABEL_32;
    }
LABEL_21:
    +[PKTextInputUtilities isValidReachableInteraction:v28];
    if (v34 != 1) {
      goto LABEL_49;
    }
    goto LABEL_24;
  }
LABEL_58:
}

void __164__PKTextInputElementsFinder__findAvailableTextInputElementsWithReusableElements_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_completion___block_invoke_8(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[3] == 2)
  {
    id v4 = WeakRetained;
    uint64_t v2 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *((void *)v4 + 4);
      *(_DWORD *)buf = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Text input elements request timed out for containers: %@.", buf, 0xCu);
    }

    [*((id *)v4 + 4) removeAllObjects];
    -[PKTextInputElementsFinder _finishFindIfReadyTimedOut:]((uint64_t)v4, 1u);
    WeakRetained = v4;
  }
}

void __164__PKTextInputElementsFinder__findAvailableTextInputElementsWithReusableElements_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_completion___block_invoke_2(uint64_t a1)
{
}

void __61__PKTextInputElementsFinder__uniqueElements_reusingElements___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v8 = a2;
  if (-[PKTextInputElement isEquivalentToElement:](v8, *(void **)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    -[PKTextInputElement updateFromEquivalentElement:]((uint64_t)v8, *(void **)(a1 + 32));
    [*(id *)(a1 + 40) removeIndex:a3];
    *a4 = 1;
  }
}

+ (uint64_t)_shouldConsiderTextInputSearchForView:(uint64_t)a3 referenceHitPoint:(void *)a4 referenceCoordSpace:(void *)a5 nearPointOnly:(int)a6
{
  id v10 = a4;
  id v11 = a5;
  self;
  if (([v10 isHidden] & 1) != 0 || (objc_msgSend(v10, "alpha"), v12 == 0.0))
  {
    uint64_t v13 = 0;
    goto LABEL_4;
  }
  v15 = [v10 window];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  uint64_t v24 = [v10 window];
  objc_msgSend(v10, "PK_convertRect:fromView:", v24, v17, v19, v21, v23);
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;

  [v10 bounds];
  v59.origin.CGFloat x = v26;
  v59.origin.CGFloat y = v28;
  v59.size.CGFloat width = v30;
  v59.size.CGFloat height = v32;
  CGRect v55 = CGRectIntersection(v54, v59);
  CGFloat x = v55.origin.x;
  CGFloat y = v55.origin.y;
  CGFloat width = v55.size.width;
  CGFloat height = v55.size.height;
  [v10 frame];
  if (CGRectIsEmpty(v56)
    || (v57.origin.CGFloat x = x, v57.origin.y = y, v57.size.width = width, v57.size.height = height, CGRectIsNull(v57)))
  {
    if ([v10 clipsToBounds]) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 2;
    }
    goto LABEL_4;
  }
  if (!a6)
  {
LABEL_18:
    +[PKTextInputFakeInteractions attachFakeInteractionToViewIfNecessary:v10];
    uint64_t v13 = 1;
    goto LABEL_4;
  }
  v37 = +[PKTextInputSettings sharedSettings];
  [v37 textInputViewHitTestSlackHorizontal];
  double v39 = v38;
  [v37 firstResponderAttractionHorizontal];
  if (v39 >= v40) {
    double v41 = v39;
  }
  else {
    double v41 = v40;
  }
  [v37 textInputViewHitTestSlackVertical];
  double v43 = v42;
  [v37 firstResponderAttractionVertical];
  if (v43 < v44) {
    double v43 = v44;
  }
  self;
  [v10 bounds];
  double v49 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v10, v11, v45, v46, v47, v48);
  v58.origin.CGFloat x = +[PKTextInputElement hitToleranceFrameFromElementFrame:insets:](v49, v50, v51, v52, -v43, -v41);
  v53.CGFloat x = a1;
  v53.CGFloat y = a2;
  if (CGRectContainsPoint(v58, v53))
  {

    goto LABEL_18;
  }
  if ([v10 clipsToBounds]) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = 2;
  }

LABEL_4:
  return v13;
}

+ (uint64_t)_isReachableHitTestView:(uint64_t)a3 nearPoint:(void *)a4 coordSpace:(void *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = self;
  id v11 = [v8 window];
  if (v11)
  {
    [v8 bounds];
    objc_msgSend(v8, "PK_convertRect:toView:", v11);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    [v11 bounds];
    v54.origin.double x = v20;
    v54.origin.double y = v21;
    v54.size.double width = v22;
    v54.size.double height = v23;
    v47.origin.double x = v13;
    v47.origin.double y = v15;
    v47.size.double width = v17;
    v47.size.double height = v19;
    NSRect v48 = NSIntersectionRect(v47, v54);
    CGRect v49 = CGRectInset(v48, 2.0, 2.0);
    double x = v49.origin.x;
    double y = v49.origin.y;
    double width = v49.size.width;
    double height = v49.size.height;
    if (!CGRectIsNull(v49))
    {
      v50.origin.double x = x;
      v50.origin.double y = y;
      v50.size.double width = width;
      v50.size.double height = height;
      CGFloat MidX = CGRectGetMidX(v50);
      v51.origin.double x = x;
      v51.origin.double y = y;
      v51.size.double width = width;
      v51.size.double height = height;
      double MidY = CGRectGetMidY(v51);
      if (v9)
      {
        objc_msgSend(v11, "PK_convertPoint:fromCoordinateSpace:", v9, a1, a2);
        double v32 = v31;
        double v34 = v33;
        v52.origin.double x = x;
        v52.origin.double y = y;
        v52.size.double width = width;
        v52.size.double height = height;
        v46.double x = v32;
        v46.double y = v34;
        if (CGRectContainsPoint(v52, v46))
        {
          double x = v32;
LABEL_7:
          double y = v34;
          goto LABEL_14;
        }
        if (v32 >= x)
        {
          double v35 = x + width;
          BOOL v36 = v32 <= x + width;
          double x = v32;
          if (!v36) {
            double x = v35;
          }
        }
        if (v34 >= y)
        {
          double y = y + height;
          if (v34 <= y) {
            goto LABEL_7;
          }
        }
      }
      else
      {
        double x = MidX;
        double y = MidY;
      }
LABEL_14:
      v37 = objc_msgSend(v11, "hitTest:withEvent:", 0, x, y);
      if (([v37 isDescendantOfView:v8] & 1) == 0)
      {
        [v37 frame];
        if (!CGRectIsEmpty(v53)
          || ([v37 subviews],
              double v39 = objc_claimAutoreleasedReturnValue(),
              uint64_t v40 = [v39 count],
              v39,
              v40))
        {
          char v38 = 0;
LABEL_19:
          if (qword_1EA3C6B70 == -1)
          {
            if (v38) {
              goto LABEL_24;
            }
          }
          else
          {
            dispatch_once(&qword_1EA3C6B70, &__block_literal_global_19);
            if (v38) {
              goto LABEL_24;
            }
          }
          if (_MergedGlobals_39 && qword_1EA3C6B60) {
            v38 |= objc_opt_isKindOfClass();
          }
LABEL_24:
          if (v38 & 1) == 0 && qword_1EA3C6B68 && (objc_opt_isKindOfClass())
          {
            if ((objc_opt_respondsToSelector() & 1) == 0 || ([v37 suppressesBackdrops] & 1) == 0) {
              goto LABEL_29;
            }
          }
          else if (v38)
          {
LABEL_29:
            uint64_t v28 = +[PKTextInputElementsFinder _anyOtherWindowAboveWindow:v10 position:v11] ^ 1;
LABEL_32:

            goto LABEL_33;
          }
          uint64_t v28 = 0;
          goto LABEL_32;
        }
        double v42 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          int v43 = 138412290;
          double v44 = v37;
          _os_log_debug_impl(&dword_1C44F8000, v42, OS_LOG_TYPE_DEBUG, "ignoring empty hitView during elementFinder reachability check: %@", (uint8_t *)&v43, 0xCu);
        }
      }
      char v38 = 1;
      goto LABEL_19;
    }
  }
  uint64_t v28 = 0;
LABEL_33:

  return v28;
}

void __208__PKTextInputElementsFinder__collectTextInputs_asyncElementContainers_underView_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_firstResponderTextInputView_elementContainerCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v7 = v6;
  double v8 = *(double *)(a1 + 48);
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v21;
    uint64_t v18 = -a3;
    do
    {
      uint64_t v14 = 0;
      uint64_t v15 = v18 + v12;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(obj);
        }
        double v16 = -[PKTextInputElement initWithElementInteraction:elementIdentifier:orderInContainer:]((id *)[PKTextInputElement alloc], *(void **)(a1 + 32), *(void **)(*((void *)&v20 + 1) + 8 * v14), (void *)(v12 + v14));
        CGFloat v17 = v16;
        if (v16) {
          *((unsigned char *)v16 + 50) = v15 + v14 == 0;
        }
        objc_msgSend(v9, "addObject:", v16, v18);

        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      v12 += v14;
    }
    while (v11);
  }

  (*(void (**)(double))(*(void *)(a1 + 40) + 16))(v7 - v8);
}

+ (uint64_t)isResponderEditableTextInput:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (+[PKTextInputUtilities isResponderSupportedTextInput:v2])
  {
    uint64_t v3 = PKScribbleInteractionInTextInput(v2);
    if (([v3 supportsShouldBegin] & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = [v2 isEditable];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (BOOL)isResponderNonEditableTextInput:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  uint64_t v4 = objc_opt_class();
  id v5 = PKDynamicCast(v4, v2);
  if (v5 && (+[PKTextInputElementsFinder isResponderEditableTextInput:](v3, v2) & 1) == 0)
  {
    double v7 = +[PKTextInputUtilities nonEditableTextInputForView:v5];
    BOOL v6 = v7 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (uint64_t)shouldDisableInputAssistantForTextInput:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (+[PKTextInputUtilities isResponderSupportedTextInput:](PKTextInputUtilities, "isResponderSupportedTextInput:", v2)&& +[PKTextInputUtilities responderTextInputSource:v2] == 3)
  {
    uint64_t v3 = PKScribbleInteractionInTextInput(v2);
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = [v3 shouldDisableInputAssistant];
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (BOOL)shouldConsiderTextInputSearchForView:(uint64_t)a3 referenceHitPoint:(void *)a4 referenceCoordSpace:(void *)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = self;
  uint64_t v11 = +[PKTextInputElementsFinder _shouldConsiderTextInputSearchForView:v10 referenceHitPoint:v9 referenceCoordSpace:v8 nearPointOnly:0];

  return v11 == 1;
}

Class __74__PKTextInputElementsFinder__isReachableHitTestView_nearPoint_coordSpace___block_invoke()
{
  _MergedGlobals_39 = (uint64_t)NSClassFromString(&cfstr_Uitextrangevie.isa);
  qword_1EA3C6B60 = (uint64_t)NSClassFromString(&cfstr_Wkcontentview.isa);
  Class result = NSClassFromString(&cfstr_Uidimmingview.isa);
  qword_1EA3C6B68 = (uint64_t)result;
  return result;
}

+ (uint64_t)_anyOtherWindowAboveWindow:(uint64_t)a3 position:(void *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  self;
  double v7 = [v6 windowScene];
  id v8 = [v7 _visibleWindows];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(id *)(*((void *)&v21 + 1) + 8 * i);
        if (v13 != v6)
        {
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "windowLevel", (void)v21);
          double v15 = v14;
          [v6 windowLevel];
          if (v15 > v16)
          {
            objc_msgSend(v6, "PK_convertPoint:toView:", v13, a1, a2);
            CGFloat v17 = objc_msgSend(v13, "hitTest:withEvent:", 0);
            if (v17)
            {
              uint64_t v18 = v17;
              id v19 = [v17 window];

              if (v19 == v13)
              {
                uint64_t v10 = 1;
                goto LABEL_14;
              }
            }
          }
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v10;
}

+ (uint64_t)shouldAvoidElementWithHitView:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (qword_1EA3C6B80 != -1) {
    dispatch_once(&qword_1EA3C6B80, &__block_literal_global_33);
  }
  if (qword_1EA3C6B78 && (id v3 = v2) != 0)
  {
    uint64_t v4 = v3;
    do
    {
      uint64_t v5 = [(id)qword_1EA3C6B78 containsObject:objc_opt_class()];
      if (v5) {
        break;
      }
      uint64_t v6 = [v4 superview];

      uint64_t v4 = (void *)v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __59__PKTextInputElementsFinder_shouldAvoidElementWithHitView___block_invoke()
{
  uint64_t v0 = (uint64_t)NSClassFromString(&cfstr_Uicontextmenuv.isa);
  if (v0)
  {
    uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithObject:v0];
  }
  v1 = (void *)qword_1EA3C6B78;
  qword_1EA3C6B78 = v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__foundElements, 0);
  objc_storeStrong((id *)&self->__reusableElements, 0);
  objc_storeStrong(&self->__finderCompletionHandler, 0);
  objc_storeStrong((id *)&self->__pendingElementContainerReplies, 0);

  objc_storeStrong((id *)&self->_windowsToSearch, 0);
}

@end