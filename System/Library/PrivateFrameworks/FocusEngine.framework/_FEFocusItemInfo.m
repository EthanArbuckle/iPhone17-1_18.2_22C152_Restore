@interface _FEFocusItemInfo
+ (_FEFocusItemInfo)infoWithItem:(id)a3;
+ (_FEFocusItemInfo)infoWithItem:(id)a3 useFallbackAncestorScroller:(BOOL)a4;
- (BOOL)isFocusMovementFlippedHorizontally;
- (BOOL)useFallbackAncestorScroller;
- (CGRect)focusedRectInCoordinateSpace:(id)a3;
- (NSArray)ancestorEnvironmentScrollableContainers;
- (_FEFocusItem)item;
- (_FEFocusRegion)focusedRegion;
- (id)_createFocusedRegion;
- (id)_initWithItem:(id)a3 containingView:(id)a4 useFallbackAncestorScroller:(BOOL)a5;
- (id)description;
- (id)shortDescription;
- (int64_t)focusTouchSensitivityStyle;
- (int64_t)inheritedFocusMovementStyle;
- (int64_t)rotaryFocusMovementAxis;
- (void)invalidateFocusedRegion;
@end

@implementation _FEFocusItemInfo

+ (_FEFocusItemInfo)infoWithItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithItem:v4 containingView:0 useFallbackAncestorScroller:0];

  return (_FEFocusItemInfo *)v5;
}

+ (_FEFocusItemInfo)infoWithItem:(id)a3 useFallbackAncestorScroller:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) _initWithItem:v6 containingView:0 useFallbackAncestorScroller:v4];

  return (_FEFocusItemInfo *)v7;
}

- (id)_initWithItem:(id)a3 containingView:(id)a4 useFallbackAncestorScroller:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_FEFocusItemInfo;
  v8 = [(_FEFocusItemInfo *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_item, v7);
    v9->_inheritedFocusMovementStyle = 0;
    if (v5) {
      char v10 = 16;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)&v9->_flags = *(unsigned char *)&v9->_flags & 0xEF | v10;
  }

  return v9;
}

- (NSArray)ancestorEnvironmentScrollableContainers
{
  ancestorEnvironmentScrollableContainers = self->_ancestorEnvironmentScrollableContainers;
  if (!ancestorEnvironmentScrollableContainers)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
    _FEFocusAncestorEnvironmentScrollableContainers(WeakRetained, (*(unsigned char *)&self->_flags >> 4) & 1);
    BOOL v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_ancestorEnvironmentScrollableContainers;
    self->_ancestorEnvironmentScrollableContainers = v5;

    ancestorEnvironmentScrollableContainers = self->_ancestorEnvironmentScrollableContainers;
  }
  return ancestorEnvironmentScrollableContainers;
}

- (int64_t)inheritedFocusMovementStyle
{
  int64_t result = self->_inheritedFocusMovementStyle;
  if (!result)
  {
    BOOL v4 = [(_FEFocusItemInfo *)self item];

    if (v4)
    {
      BOOL v5 = [(_FEFocusItemInfo *)self item];
      self->_inheritedFocusMovementStyle = _FEFocusEnvironmentInheritedFocusMovementStyle(v5);

      return self->_inheritedFocusMovementStyle;
    }
    else
    {
      int64_t result = 1;
      self->_inheritedFocusMovementStyle = 1;
    }
  }
  return result;
}

- (int64_t)focusTouchSensitivityStyle
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    v3 = [(_FEFocusItemInfo *)self item];
    if (_FEFocusItemIsViewOrRespondsToSelector(v3)) {
      int64_t v4 = [v3 _focusTouchSensitivityStyle];
    }
    else {
      int64_t v4 = 0;
    }
    self->_focusTouchSensitivityStyle = v4;
    *(unsigned char *)&self->_flags |= 1u;
  }
  return self->_focusTouchSensitivityStyle;
}

- (int64_t)rotaryFocusMovementAxis
{
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    v3 = [(_FEFocusItemInfo *)self item];
    self->_rotaryFocusMovementAxis = _FEFocusEnvironmentResolvedRotaryFocusMovementAxis(v3, 0);

    *(unsigned char *)&self->_flags |= 8u;
  }
  return self->_rotaryFocusMovementAxis;
}

- (BOOL)isFocusMovementFlippedHorizontally
{
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x2020000000;
    char v9 = 0;
    v3 = [(_FEFocusItemInfo *)self item];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __54___FEFocusItemInfo_isFocusMovementFlippedHorizontally__block_invoke;
    v5[3] = &unk_265328370;
    v5[4] = &v6;
    _FEFocusEnvironmentEnumerateAncestorEnvironments(v3, v5);

    *((unsigned char *)&self->_flags + 1) = *((unsigned char *)v7 + 24);
    *(unsigned char *)&self->_flags |= 2u;
    _Block_object_dispose(&v6, 8);
  }
  return *((unsigned char *)&self->_flags + 1);
}

- (BOOL)useFallbackAncestorScroller
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (_FEFocusRegion)focusedRegion
{
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    v3 = [(_FEFocusItemInfo *)self _createFocusedRegion];
    focusedRegion = self->_focusedRegion;
    self->_focusedRegion = v3;

    *(unsigned char *)&self->_flags |= 4u;
  }
  BOOL v5 = self->_focusedRegion;
  return v5;
}

- (id)_createFocusedRegion
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained _parentFocusEnvironment];
    if (_FEFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v6)
      && _FEFocusItemIsViewOrRespondsToSelector(v5))
    {
      id v7 = [v6 _focusItemContainer];
      uint64_t v8 = v7;
      if (!v7) {
        goto LABEL_6;
      }
      char v9 = [v7 _focusCoordinateSpace];
      double v10 = _FEFocusItemFrameInCoordinateSpace(v5, v9);
      _FEFocusRectWithMinimumSize(v10, v11, v12, v13);
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;

      v48.origin.x = v15;
      v48.origin.y = v17;
      v48.size.width = v19;
      v48.size.height = v21;
      if (!CGRectIsNull(v48))
      {
        v25 = +[_FEFocusSystem focusSystemForEnvironment:v5];
        if (!v25)
        {
          v34 = [MEMORY[0x263F08690] currentHandler];
          v35 = NSString;
          id v36 = v5;
          v37 = (objc_class *)objc_opt_class();
          v38 = NSStringFromClass(v37);
          v39 = [v35 stringWithFormat:@"<%@: %p>", v38, v36];

          [v34 handleFailureInMethod:a2, self, @"_FEFocusItemInfo.m", 191, @"Unable to find focus system for item %@", v39 object file lineNumber description];
        }
        v26 = [_FEFocusItemRegion alloc];
        v27 = [v8 _focusCoordinateSpace];
        v23 = -[_FEFocusItemRegion initWithFrame:coordinateSpace:item:focusSystem:](v26, "initWithFrame:coordinateSpace:item:focusSystem:", v27, v5, v25, v15, v17, v19, v21);

        if (v23) {
          goto LABEL_10;
        }
      }
      else
      {
LABEL_6:
      }
    }
    v22 = logger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      v28 = [v5 debugDescription];
      v29 = [v5 _parentFocusEnvironment];
      v30 = [v29 debugDescription];
      v31 = [v5 _parentFocusEnvironment];
      v32 = [v31 _focusItemContainer];
      v33 = [v32 debugDescription];
      *(_DWORD *)buf = 138412802;
      v41 = v28;
      __int16 v42 = 2112;
      v43 = v30;
      __int16 v44 = 2112;
      v45 = v33;
      _os_log_fault_impl(&dword_24F3F0000, v22, OS_LOG_TYPE_FAULT, "Failed to create FocusRegion for FocusItem: %@ with parentFocusEnvironment: %@  focusItemContainer: %@", buf, 0x20u);
    }
    v23 = 0;
LABEL_10:

    goto LABEL_12;
  }
  v23 = 0;
LABEL_12:

  return v23;
}

- (CGRect)focusedRectInCoordinateSpace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_FEFocusItemInfo *)self focusedRegion];
  uint64_t v6 = (void *)v5;
  if (v4 && v5)
  {
    +[_FEFocusRegionEvaluator frameForRegion:v5 inCoordinateSpace:v4];
    _FEFocusRectWithMinimumSize(v7, v8, v9, v10);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    double v12 = *MEMORY[0x263F001A0];
    double v14 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v16 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v18 = *(double *)(MEMORY[0x263F001A0] + 24);
  }

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)invalidateFocusedRegion
{
  focusedRegion = self->_focusedRegion;
  self->_focusedRegion = 0;

  *(unsigned char *)&self->_flags &= ~4u;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; item = %@, focusedRegion = %@>",
    v4,
    self,
    WeakRetained,
  uint64_t v6 = self->_focusedRegion);

  return v6;
}

- (id)shortDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = objc_loadWeakRetained((id *)&self->_item);
  if (v5)
  {
    uint64_t v6 = NSString;
    CGFloat v7 = (objc_class *)objc_opt_class();
    CGFloat v8 = NSStringFromClass(v7);
    CGFloat v9 = [v6 stringWithFormat:@"<%@: %p>", v8, v5];
  }
  else
  {
    CGFloat v9 = @"(nil)";
  }

  focusedRegion = self->_focusedRegion;
  if (focusedRegion)
  {
    double v11 = NSString;
    double v12 = focusedRegion;
    double v13 = (objc_class *)objc_opt_class();
    double v14 = NSStringFromClass(v13);
    double v15 = [v11 stringWithFormat:@"<%@: %p>", v14, v12];
  }
  else
  {
    double v15 = @"(nil)";
  }
  double v16 = [v3 stringWithFormat:@"<%@: %p item = %@, focusedRegion = %@>", v4, self, v9, v15];;

  return v16;
}

- (_FEFocusItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (_FEFocusItem *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_focusedRegion, 0);
  objc_storeStrong((id *)&self->_ancestorEnvironmentScrollableContainers, 0);
}

@end