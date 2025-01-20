@interface PKTextInputElementsController
- (id)initWithContainerView:(id *)a1;
- (void)flushDiscoveredElements;
- (void)reportDebugStateDescription:(id)a3;
- (void)updateTextInputElementsWithReferenceHitPoint:(void *)a3 referenceSearchArea:(CGFloat)a4 referenceCoordSpace:(CGFloat)a5 completion:(CGFloat)x;
@end

@implementation PKTextInputElementsController

- (id)initWithContainerView:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)PKTextInputElementsController;
    v4 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v4;
    if (v4)
    {
      id v5 = v4[5];
      v4[5] = (id)MEMORY[0x1E4F1CC08];

      v6 = [MEMORY[0x1E4F1C9C8] distantPast];
      [v6 timeIntervalSinceReferenceDate];
      a1[6] = v7;

      objc_storeWeak(a1 + 7, v3);
    }
  }

  return a1;
}

- (void)updateTextInputElementsWithReferenceHitPoint:(void *)a3 referenceSearchArea:(CGFloat)a4 referenceCoordSpace:(CGFloat)a5 completion:(CGFloat)x
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  id v18 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v20 = [WeakRetained window];
    v21 = [v20 windowScene];
    v22 = [v21 _visibleWindows];

    v23 = (void *)MEMORY[0x1E4F1CBF0];
    if (v22) {
      v23 = v22;
    }
    id v24 = v23;

    id v25 = -[PKTextInputElementsFinder initWithWindowsToSearch:]([PKTextInputElementsFinder alloc], v24);
    uint64_t v26 = *(void *)(a1 + 16) + 1;
    *(void *)(a1 + 16) = v26;
    [*(id *)(a1 + 40) allValues];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [v27 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      id v46 = v24;
      id v47 = v18;
      uint64_t v30 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v53 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          v33 = -[PKTextInputElement coordinateSpace](v32);
          if (-[PKTextInputElement isFocused](v32)) {
            BOOL v34 = v33 == 0;
          }
          else {
            BOOL v34 = 1;
          }
          if (!v34)
          {
            double v35 = -[PKTextInputElement frame](v32);
            v64.origin.x = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v33, v17, v35, v36, v37, v38);
            v64.origin.y = v39;
            v64.size.width = v40;
            v64.size.height = v41;
            v62.origin.x = x;
            v62.origin.y = y;
            v62.size.width = width;
            v62.size.height = height;
            CGRect v63 = CGRectUnion(v62, v64);
            x = v63.origin.x;
            y = v63.origin.y;
            width = v63.size.width;
            height = v63.size.height;

            goto LABEL_16;
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v29);
LABEL_16:
      id v24 = v46;
      id v18 = v47;
    }

    v42 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v57 = a1;
      __int16 v58 = 2048;
      id v59 = v25;
      _os_log_debug_impl(&dword_1C44F8000, v42, OS_LOG_TYPE_DEBUG, "ElementsController %p will begin elementsFinder findAvailableTextInputElements %p", buf, 0x16u);
    }

    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __129__PKTextInputElementsController_updateTextInputElementsWithReferenceHitPoint_referenceSearchArea_referenceCoordSpace_completion___block_invoke;
    v48[3] = &unk_1E64C5898;
    uint64_t v51 = v26;
    v48[4] = a1;
    id v49 = v25;
    id v43 = v18;
    id v50 = v43;
    id v44 = v25;
    v45 = v44;
    if (v44)
    {
      -[PKTextInputElementsFinder _findAvailableTextInputElementsWithReusableElements:referenceHitPoint:referenceSearchArea:referenceCoordSpace:nearPointOnly:completion:]((uint64_t)v44, v27, v17, 0, v48, a4, a5, x, y, width, height);
      id v43 = v50;
    }
  }
}

void __129__PKTextInputElementsController_updateTextInputElementsWithReferenceHitPoint_referenceSearchArea_referenceCoordSpace_completion___block_invoke(void *a1, void *a2, int a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = v5;
  uint64_t v7 = a1[4];
  if (a1[7] > *(void *)(v7 + 24))
  {
    int v38 = a3;
    id v39 = v5;
    id v8 = v5;
    objc_super v9 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:buf count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v41;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v40 + 1) + 8 * v14);
          if (v15) {
            v16 = *(void **)(v15 + 112);
          }
          else {
            v16 = 0;
          }
          id v17 = v16;

          if (!v17)
          {
            id v18 = [NSNumber numberWithInteger:*(void *)(v7 + 8)];
            v19 = v18;
            if (v15)
            {
              uint64_t v20 = [v18 copy];
              v21 = *(void **)(v15 + 112);
              *(void *)(v15 + 112) = v20;
            }
            ++*(void *)(v7 + 8);
          }
          if (v15) {
            v22 = *(void **)(v15 + 112);
          }
          else {
            v22 = 0;
          }
          id v23 = v22;
          [v9 setObject:v15 forKeyedSubscript:v23];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v24 = [v10 countByEnumeratingWithState:&v40 objects:buf count:16];
        uint64_t v12 = v24;
      }
      while (v24);
    }

    id v25 = v9;
    uint64_t v26 = v25;
    if (*(id *)(v7 + 40) != v25)
    {
      uint64_t v27 = [v25 copy];
      uint64_t v28 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v27;

      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      *(void *)(v7 + 48) = v29;
      id WeakRetained = objc_loadWeakRetained((id *)(v7 + 32));
      [WeakRetained elementsControllerLastDiscoveredElementsDidChange:v7];

      +[PKTextInputDebugStateIntrospector debugStateDidChange];
    }

    *(void *)(a1[4] + 24) = a1[7];
    v6 = v39;
    a3 = v38;
  }
  v31 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v34 = a1[4];
    uint64_t v33 = a1[5];
    if (v34) {
      double v35 = *(void **)(v34 + 40);
    }
    else {
      double v35 = 0;
    }
    uint64_t v36 = [v35 count];
    double v37 = @"No";
    *(_DWORD *)buf = 134218754;
    uint64_t v45 = v34;
    __int16 v46 = 2048;
    if (a3) {
      double v37 = @"Yes";
    }
    uint64_t v47 = v33;
    __int16 v48 = 2048;
    uint64_t v49 = v36;
    __int16 v50 = 2112;
    uint64_t v51 = v37;
    _os_log_debug_impl(&dword_1C44F8000, v31, OS_LOG_TYPE_DEBUG, "ElementsController %p finished elementsFinder findAvailableTextInputElements %p, found %ld elements, timed out: %@", buf, 0x2Au);
  }

  uint64_t v32 = a1[6];
  if (v32) {
    (*(void (**)(void))(v32 + 16))();
  }
}

- (void)flushDiscoveredElements
{
  if (a1)
  {
    v2 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = MEMORY[0x1E4F1CC08];

    id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v4 timeIntervalSinceReferenceDate];
    *(void *)(a1 + 48) = v3;
  }
}

- (void)reportDebugStateDescription:(id)a3
{
  id v4 = (void (**)(id, __CFString *, void *))a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if (self) {
    lastDiscoveredElementsByUniqueID = self->_lastDiscoveredElementsByUniqueID;
  }
  else {
    lastDiscoveredElementsByUniqueID = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__PKTextInputElementsController_reportDebugStateDescription___block_invoke;
  v15[3] = &unk_1E64C58C0;
  v15[4] = self;
  id v7 = v5;
  id v16 = v7;
  [(NSDictionary *)lastDiscoveredElementsByUniqueID enumerateKeysAndObjectsUsingBlock:v15];
  [v7 sortUsingSelector:sel_compare_];
  id v8 = NSString;
  objc_super v9 = [v7 componentsJoinedByString:@"\n"];
  id v10 = [v8 stringWithFormat:@"\n%@", v9];

  v4[2](v4, @"lastDiscoveredElements", v10);
  if (self) {
    double lastDiscoveredElementsUpdateTime = self->_lastDiscoveredElementsUpdateTime;
  }
  else {
    double lastDiscoveredElementsUpdateTime = 0.0;
  }
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:lastDiscoveredElementsUpdateTime];
  id v13 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v13 setDateFormat:@"HH:mm:ss.SSS"];
  uint64_t v14 = [v13 stringFromDate:v12];
  v4[2](v4, @"lastDiscoveredElementsTime", v14);
}

void __61__PKTextInputElementsController_reportDebugStateDescription___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v30 = a2;
  id v5 = a3;
  double v6 = -[PKTextInputElement frame]((uint64_t)v5);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = -[PKTextInputElement coordinateSpace]((uint64_t)v5);
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    id WeakRetained = objc_loadWeakRetained((id *)(v14 + 56));
  }
  else {
    id WeakRetained = 0;
  }
  id v16 = [WeakRetained window];
  double v17 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v13, v16, v6, v8, v10, v12);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v32.origin.x = v17;
  v32.origin.y = v19;
  v32.size.width = v21;
  v32.size.height = v23;
  uint64_t v24 = NSStringFromCGRect(v32);
  id v25 = -[PKTextInputElement referenceView](v5);
  if (v25)
  {
    uint64_t v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v27 = &stru_1F1FB2C00;
  }
  uint64_t v28 = *(void **)(a1 + 40);
  uint64_t v29 = [NSString stringWithFormat:@"  %@: %@ %@", v30, v27, v24];
  [v28 addObject:v29];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong((id *)&self->_lastDiscoveredElementsByUniqueID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end