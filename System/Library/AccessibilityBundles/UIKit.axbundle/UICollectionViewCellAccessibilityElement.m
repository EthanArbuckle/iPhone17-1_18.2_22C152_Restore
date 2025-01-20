@interface UICollectionViewCellAccessibilityElement
- (BOOL)_accessibilityBackingElementIsValid;
- (BOOL)_accessibilityCanBecomeNativeFocused;
- (BOOL)_accessibilityHasNativeFocus;
- (BOOL)_accessibilityHasTextOperations;
- (BOOL)_accessibilityImplementsDefaultRowRange;
- (BOOL)_accessibilityIsAwayAlertElement;
- (BOOL)_accessibilityIsOutsideParentBounds;
- (BOOL)_accessibilityIsScannerGroup;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_accessibilitySetNativeFocus;
- (BOOL)_accessibilityShouldAttemptScrollToFrameOnParentView;
- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_accessibilityUserTestingIsCancelButton;
- (BOOL)_accessibilityUserTestingIsDefaultButton;
- (BOOL)_accessibilityUserTestingIsDestructiveButton;
- (BOOL)_accessibilityUserTestingIsPreferredButton;
- (BOOL)_accessibilityViewHierarchyHasNativeFocus;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldGroupAccessibilityChildren;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (NSIndexPath)indexPath;
- (UICollectionViewCell)cell;
- (_NSRange)_accessibilitySelectedTextRange;
- (_NSRange)accessibilityRowRange;
- (id)_accessibilityCollectionViewCellContentSubviews;
- (id)_accessibilityDataDetectorScheme:(CGPoint)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilitySemanticContextForElement:(id)a3;
- (id)_accessibilityTextOperations;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)_accessibilityUserTestingProxyView;
- (id)_accessibilityUserTestingVisibleAncestor;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityLanguage;
- (id)accessibilityValue;
- (id)automationCustomProperties;
- (id)automationElements;
- (id)realCell;
- (int64_t)_accessibilityScannerActivateBehavior;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityCopy;
- (void)_accessibilityCut;
- (void)_accessibilityPaste;
- (void)_accessibilityRedo;
- (void)_accessibilitySelect;
- (void)_accessibilitySelectAll;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)_accessibilityUndo;
- (void)accessibilityDecrement;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityElementDidLoseFocus;
- (void)accessibilityIncrement;
- (void)dealloc;
- (void)setCell:(id)a3;
- (void)setIndexPath:(id)a3;
@end

@implementation UICollectionViewCellAccessibilityElement

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(UICollectionViewCell *)self->_cell setAccessibilityContainer:0];
  v2.receiver = v4;
  v2.super_class = (Class)UICollectionViewCellAccessibilityElement;
  [(UICollectionViewCellAccessibilityElement *)&v2 dealloc];
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)realCell
{
  id v16 = a1;
  if (a1)
  {
    id v15 = (id)[v16 accessibilityContainer];
    objc_opt_class();
    char v13 = 0;
    BOOL v8 = 1;
    if (objc_opt_isKindOfClass())
    {
      id v14 = (id)[v15 superview];
      char v13 = 1;
      BOOL v8 = v14 == 0;
    }
    if (v13) {

    }
    if (v8)
    {
      id v17 = 0;
      int v12 = 1;
    }
    else
    {
      id v1 = (id)[v15 dataSource];
      BOOL v7 = v1 != 0;

      if (v7)
      {
        id v11 = (id)[v15 cellForItemAtIndexPath:*((void *)v16 + 9)];
        char v9 = 0;
        BOOL v6 = 0;
        if (v11)
        {
          id v10 = (id)[v11 superview];
          char v9 = 1;
          BOOL v6 = v10 == 0;
        }
        if (v9) {

        }
        if (v6)
        {
          objc_super v2 = (void *)[v15 accessibilityCreatePrepareCellForIndexPath:*((void *)v16 + 9)];
          id v3 = v11;
          id v11 = v2;
        }
        id v17 = v11;
        int v12 = 1;
        objc_storeStrong(&v11, 0);
      }
      else
      {
        id v17 = 0;
        int v12 = 1;
      }
    }
    objc_storeStrong(&v15, 0);
  }
  else
  {
    id v17 = 0;
  }
  v4 = v17;

  return v4;
}

- (BOOL)_accessibilityBackingElementIsValid
{
  id v2 = -[UICollectionViewCellAccessibilityElement realCell](self);
  BOOL v4 = v2 != 0;

  return v4;
}

- (UICollectionViewCell)cell
{
  v23 = self;
  v22[1] = (id)a2;
  v22[0] = (id)[(UICollectionViewCellAccessibilityElement *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  id v2 = (id)[v22[0] superview];
  BOOL v14 = v2 != 0;

  if (v14)
  {
    id v20 = -[UICollectionViewCellAccessibilityElement realCell](v23);
    if (v20)
    {
      BOOL v5 = v20 != v23->_cell;
      char v16 = 0;
      LOBYTE(v11) = 1;
      if (!v5)
      {
        id v17 = (id)[v20 _accessibilityIndexPath];
        char v16 = 1;
        int v11 = [v17 isEqual:v23->_indexPath] ^ 1;
      }
      if (v16) {

      }
      if (v11)
      {
        id v15 = v23->_cell;
        [(UICollectionViewCellAccessibilityElement *)v23 setCell:v20];
        [v20 setAccessibilityContainer:v23];
        if (([(id)*MEMORY[0x263F1D020] _accessibilityWantsOpaqueElementProviders] & 1) != 0
          && ([v22[0] isAccessibilityOpaqueElementProvider] & 1) != 0)
        {
          LOBYTE(v8) = 1;
          char v9 = @"set cell - this call should not happen with VO on. %@";
          id v10 = (id)[MEMORY[0x263F08B88] callStackSymbols];
          _AXLogWithFacility();
        }
        objc_msgSend(v20, "layoutSubviews", v8, v9, v10);
        if (v15)
        {
          [v20 accessibilityReuseChildren:v15 forMockParent:v23];
          if (v15 != v23->_cell)
          {
            [v15 accessibilityClearInternalData];
            [v15 setAccessibilityContainer:0];
          }
        }
        else
        {
          [v20 accessibilityClearInternalData];
          [v20 setAccessibilityContainer:v23];
        }
        v23->_usingRealCell = 1;
        objc_storeStrong(&v15, 0);
      }
    }
    else
    {
      if (v23->_cell)
      {
        id v12 = (id)[(UICollectionViewCell *)v23->_cell _accessibilityIndexPath];
        char v13 = [v12 isEqual:v23->_indexPath];

        if ((v13 & 1) == 0)
        {
          id v19 = (id)[v22[0] accessibilityCellForRowAtIndexPath:v23->_indexPath];
          [v19 setAccessibilityContainer:v23];
          if (([(id)*MEMORY[0x263F1D020] _accessibilityWantsOpaqueElementProviders] & 1) != 0
            && ([v22[0] isAccessibilityOpaqueElementProvider] & 1) != 0)
          {
            LOBYTE(v8) = 1;
            char v9 = @"set cell - this call should not happen with VO on. %@";
            id v10 = (id)[MEMORY[0x263F08B88] callStackSymbols];
            _AXLogWithFacility();
          }
          objc_msgSend(v19, "layoutSubviews", v8, v9, v10);
          [v19 removeFromSuperview];
          id location = v23->_cell;
          [(UICollectionViewCellAccessibilityElement *)v23 setCell:v19];
          [v19 accessibilityReuseChildren:location forMockParent:v23];
          if (location != v19)
          {
            [location accessibilityClearInternalData];
            [location setAccessibilityContainer:0];
          }
          objc_storeStrong(&location, 0);
          objc_storeStrong(&v19, 0);
        }
      }
      else
      {
        id v3 = (UICollectionViewCell *)(id)[v22[0] accessibilityCellForRowAtIndexPath:v23->_indexPath];
        cell = v23->_cell;
        v23->_cell = v3;

        [(UICollectionViewCell *)v23->_cell setAccessibilityContainer:v23];
        [(UICollectionViewCell *)v23->_cell removeFromSuperview];
      }
      v23->_usingRealCell = 0;
    }
    v24 = v23->_cell;
    int v21 = 1;
    objc_storeStrong(&v20, 0);
  }
  else
  {
    v24 = 0;
    int v21 = 1;
  }
  objc_storeStrong(v22, 0);
  BOOL v6 = v24;

  return v6;
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 isAccessibilityElement];

  return v4 & 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v13 = a3;
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v9 = [(UICollectionViewCellAccessibilityElement *)v12 cell];
  id v8 = (id)[(UICollectionViewCellAccessibilityElement *)v12 accessibilityContainer];
  BOOL v7 = [(UICollectionViewCellAccessibilityElement *)v12 cell];
  [v8 convertPoint:v13.x toView:v13.y];
  id v10 = (id)-[UICollectionViewCell _accessibilityHitTest:withEvent:](v9, "_accessibilityHitTest:withEvent:", location[0], v4, v5);

  objc_storeStrong(location, 0);

  return v10;
}

- (int64_t)accessibilityElementCount
{
  id v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  int64_t v4 = [(UICollectionViewCell *)v3 accessibilityElementCount];

  return v4;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  int64_t v4 = [(UICollectionViewCellAccessibilityElement *)self cell];
  id v5 = (id)[(UICollectionViewCell *)v4 accessibilityElementAtIndex:a3];

  return v5;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  BOOL v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v4 = [(UICollectionViewCellAccessibilityElement *)v7 cell];
  int64_t v5 = [(UICollectionViewCell *)v4 indexOfAccessibilityElement:location[0]];

  objc_storeStrong(location, 0);
  return v5;
}

- (CGRect)accessibilityFrame
{
  v40 = self;
  v39[1] = (id)a2;
  v24 = [(UICollectionViewCellAccessibilityElement *)self cell];
  v39[0] = (id)[(UICollectionViewCell *)v24 _accessibilityIndexPath];

  char v37 = 0;
  objc_opt_class();
  id v25 = (id)[(UICollectionViewCellAccessibilityElement *)v40 accessibilityContainer];
  id v36 = (id)__UIAccessibilityCastAsClass();

  id v35 = v36;
  objc_storeStrong(&v36, 0);
  id v38 = v35;
  char v33 = 0;
  char v31 = 0;
  BOOL v23 = 0;
  if (v39[0])
  {
    v34 = [(UICollectionViewCellAccessibilityElement *)v40 cell];
    char v33 = 1;
    id v32 = (id)[(UICollectionViewCell *)v34 window];
    char v31 = 1;
    BOOL v23 = 0;
    if (!v32) {
      BOOL v23 = v38 != 0;
    }
  }
  if (v31) {

  }
  if (v33) {
  if (!v23)
  }
    goto LABEL_18;
  id v30 = (id)[v38 layoutAttributesForItemAtIndexPath:v39[0]];
  if (v30)
  {
    [v30 frame];
    *(void *)&long long v28 = v2;
    *((void *)&v28 + 1) = v3;
    *(void *)&long long v29 = v4;
    *((void *)&v29 + 1) = v5;
    id v6 = (id)[v38 window];
    BOOL v22 = v6 != 0;

    if (v22) {
      goto LABEL_15;
    }
    id v27 = (id)[(UICollectionViewCellAccessibilityElement *)v40 _accessibilityAncestorIsKindOf:objc_opt_class()];
    if (v27)
    {
      [v27 accessibilityFrame];
      *(double *)&long long v28 = *(double *)&v28 + v7;
      *((double *)&v28 + 1) = *((double *)&v28 + 1) + v8;
      long long v41 = v28;
      long long v42 = v29;
      int v26 = 1;
    }
    else
    {
      int v26 = 0;
    }
    objc_storeStrong(&v27, 0);
    if (!v26)
    {
LABEL_15:
      UIAccessibilityFrameForBounds();
      *(void *)&long long v41 = v9;
      *((void *)&v41 + 1) = v10;
      *(void *)&long long v42 = v11;
      *((void *)&v42 + 1) = v12;
      int v26 = 1;
    }
  }
  else
  {
    int v26 = 0;
  }
  objc_storeStrong(&v30, 0);
  if (!v26)
  {
LABEL_18:
    int v21 = [(UICollectionViewCellAccessibilityElement *)v40 cell];
    [(UICollectionViewCell *)v21 accessibilityFrame];
    *(void *)&long long v41 = v13;
    *((void *)&v41 + 1) = v14;
    *(void *)&long long v42 = v15;
    *((void *)&v42 + 1) = v16;
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(v39, 0);
  double v18 = *((double *)&v41 + 1);
  double v17 = *(double *)&v41;
  double v20 = *((double *)&v42 + 1);
  double v19 = *(double *)&v42;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)_accessibilityIsOutsideParentBounds
{
  id v10 = a1;
  if (a1)
  {
    id v9 = (id)[v10 accessibilityContainer];
    id v6 = (id)[v9 window];
    [v6 accessibilityFrame];
    CGRect v8 = CGRectInset(v12, 0.0, 40.0);
    [v10 accessibilityFrame];
    rect2.origin.x = v1;
    rect2.origin.y = v2;
    rect2.size.width = v3;
    rect2.size.height = v4;
    BOOL v11 = !CGRectContainsRect(v8, rect2);

    objc_storeStrong(&v9, 0);
  }
  else
  {
    return 0;
  }
  return v11;
}

- (BOOL)_accessibilityShouldAttemptScrollToFrameOnParentView
{
  uint64_t v13 = self;
  location[1] = (id)a2;
  id v2 = -[UICollectionViewCellAccessibilityElement realCell](self);
  BOOL v8 = v2 == 0;

  if (v8)
  {
    if (AXDoesRequestingClientDeserveAutomation())
    {
      location[0] = (id)[(UICollectionViewCellAccessibilityElement *)v13 accessibilityContainer];
      objc_opt_class();
      char v10 = 0;
      BOOL v7 = 1;
      if (objc_opt_isKindOfClass())
      {
        id v11 = (id)[location[0] superview];
        char v10 = 1;
        BOOL v7 = v11 == 0;
      }
      if (v10) {

      }
      if (v7)
      {
        BOOL v14 = 0;
      }
      else
      {
        id v3 = (id)[location[0] dataSource];
        BOOL v6 = v3 != 0;

        if (v6)
        {
          uint64_t v9 = [location[0] numberOfSections];
          BOOL v14 = [(NSIndexPath *)v13->_indexPath section] < v9
             && v9
             && (uint64_t v5 = [(NSIndexPath *)v13->_indexPath item],
                 v5 < objc_msgSend(location[0], "numberOfItemsInSection:", -[NSIndexPath section](v13->_indexPath, "section")));
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      objc_storeStrong(location, 0);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return 1;
  }
  return v14;
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  v60 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)AXRetainAutorelease();
  id v58 = -[UICollectionViewCellAccessibilityElement realCell](v60);
  char v56 = 0;
  objc_opt_class();
  id v28 = (id)[(UICollectionViewCellAccessibilityElement *)v60 accessibilityContainer];
  id v55 = (id)__UIAccessibilityCastAsClass();

  id v54 = v55;
  objc_storeStrong(&v55, 0);
  id v57 = v54;
  uint64_t v53 = 0;
  uint64_t v52 = 0;
  if (!v54
    || v58
    || (uint64_t v27 = -[NSIndexPath section](v60->_indexPath, "section"), v27 >= [v57 numberOfSections])
    || (uint64_t v26 = [(NSIndexPath *)v60->_indexPath item],
        v26 >= objc_msgSend(v57, "numberOfItemsInSection:", -[NSIndexPath section](v60->_indexPath, "section"))))
  {
    if (objc_opt_respondsToSelector() & 1) != 0 && (char v50 = [v58 accessibilityScrollToVisible])
    {
      char v61 = v50;
      int v51 = 1;
    }
    else
    {
      id v49 = (id)[location[0] _accessibilityParentView];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = (id)[(UICollectionViewCellAccessibilityElement *)v60 _accessibilityParentView];
        id v5 = v49;
        id v49 = v4;
      }
      id v48 = (id)[v49 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v47 = (id)[v48 indexPathsForVisibleItems];
        id v46 = v60->_indexPath;
        unint64_t v45 = [v47 indexOfObject:v46];
        char v44 = 0;
        if (_UIAXObjectIsBehindKeyboard())
        {
          uint64_t v53 = 1;
          char v44 = 1;
        }
        if ((v44 & 1) == 0)
        {
          id v25 = (id)[v48 safeValueForKey:@"visibleBounds"];
          [v25 rectValue];
          v43.origin.x = v6;
          v43.origin.y = v7;
          v43.size.width = v8;
          v43.size.height = v9;

          double v42 = -10.0;
          [v49 frame];
          rect2.origin.x = v10;
          rect2.origin.y = v11;
          rect2.size.width = v12;
          rect2.size.height = v13;
          if (!CGRectContainsRect(v43, rect2) || !v58)
          {
            double MaxY = CGRectGetMaxY(rect2);
            double v65 = MaxY - CGRectGetMinY(v43);
            if (fabs(v65) > -10.0
              || (double MinY = CGRectGetMinY(rect2), v64 = MinY - CGRectGetMaxY(v43), fabs(v64) > -10.0)
              || !v58)
            {
              if (v58) {
                uint64_t v53 = 2;
              }
              else {
                uint64_t v53 = 1;
              }
            }
            double MaxX = CGRectGetMaxX(rect2);
            double v63 = MaxX - CGRectGetMinX(v43);
            if (fabs(v63) > -10.0
              || (double MinX = CGRectGetMinX(rect2), v62 = MinX - CGRectGetMaxX(v43), fabs(v62) > -10.0)
              || !v58)
            {
              uint64_t v52 = 16;
            }
          }
          char v44 = 1;
        }
        uint64_t v40 = [v47 count];
        if ((v44 & 1) == 0 && v40 && (v45 > 1 && v45 < v40 - 2 || v40 == 1))
        {
          char v61 = 0;
          int v51 = 1;
        }
        else
        {
          uint64_t v20 = [v48 accessibilityElementCount];
          if (v20 != [v47 count] || (v44 & 1) != 0)
          {
            uint64_t v39 = [v48 numberOfSections];
            if ([v46 section] < v39
              && v39
              && (uint64_t v19 = [v46 item],
                  v19 < objc_msgSend(v48, "numberOfItemsInSection:", objc_msgSend(v46, "section"))))
            {
              [v48 contentOffset];
              double v37 = v14;
              double v38 = v15;
              [v48 scrollToItemAtIndexPath:v46 atScrollPosition:v52 | v53 animated:0];
              [v48 contentOffset];
              v36[1] = v16;
              v36[2] = v17;
              if (!__CGPointEqualToPoint(v37, v38, *(double *)&v16, *(double *)&v17)) {
                [v48 _accessibilityCollectionViewUpdateVisibleCells];
              }
              if (v58 && -[UICollectionViewCellAccessibilityElement _accessibilityIsOutsideParentBounds](v60))
              {
                char v61 = 0;
                int v51 = 1;
              }
              else
              {
                v31[1] = (id)MEMORY[0x263EF8330];
                int v32 = -1073741824;
                int v33 = 0;
                v34 = __82__UICollectionViewCellAccessibilityElement_accessibilityScrollToVisibleWithChild___block_invoke;
                id v35 = &unk_2650ADF18;
                v36[0] = v60;
                AXPerformBlockOnMainThreadAfterDelay();
                if (!location[0]) {
                  objc_storeStrong(location, v58);
                }
                long long v29 = v60;
                id v30 = location[0];
                v31[0] = v48;
                AXPerformBlockOnMainThreadAfterDelay();
                char v61 = 1;
                int v51 = 1;
                objc_storeStrong(v31, 0);
                objc_storeStrong(&v30, 0);
                objc_storeStrong((id *)&v29, 0);
                objc_storeStrong(v36, 0);
              }
            }
            else
            {
              char v61 = 0;
              int v51 = 1;
            }
          }
          else
          {
            char v61 = 0;
            int v51 = 1;
          }
        }
        objc_storeStrong(&v46, 0);
        objc_storeStrong(&v47, 0);
      }
      else
      {
        char v61 = 0;
        int v51 = 1;
      }
      objc_storeStrong(&v48, 0);
      objc_storeStrong(&v49, 0);
    }
  }
  else
  {
    [v57 scrollToItemAtIndexPath:v60->_indexPath atScrollPosition:v52 | v53 animated:0];
    char v61 = 1;
    int v51 = 1;
  }
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(location, 0);
  return v61 & 1;
}

id __82__UICollectionViewCellAccessibilityElement_accessibilityScrollToVisibleWithChild___block_invoke(uint64_t a1)
{
  CGFloat v1 = objc_msgSend(*(id *)(a1 + 32), "cell", a1, a1);

  return v1;
}

id __82__UICollectionViewCellAccessibilityElement_accessibilityScrollToVisibleWithChild___block_invoke_2(uint64_t a1)
{
  id v4 = (id)[*(id *)(a1 + 32) _accessibilityWindow];
  id v6 = (id)[v4 firstResponder];
  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  BOOL v7 = 0;
  if (([v6 _accessibilityIsDescendantOfElement:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v13 = (id)[*(id *)(a1 + 32) _accessibilityParentView];
    char v12 = 1;
    id v11 = (id)[v13 safeValueForKey:@"window"];
    char v10 = 1;
    id v9 = (id)AXUIKeyboardWindow();
    char v8 = 1;
    BOOL v7 = v11 != v9;
  }
  if (v8) {

  }
  if (v10) {
  if (v12)
  }

  if (v7) {
    _UIAXDismissKeyboardIfNecessary();
  }
  id v1 = self;
  id v2 = self;

  return v2;
}

- (id)automationCustomProperties
{
  id v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  id v4 = (id)[(UICollectionViewCell *)v3 automationCustomProperties];

  return v4;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  id v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  -[UICollectionViewCell _accessibilitySetSelectedTextRange:](v3, "_accessibilitySetSelectedTextRange:", a3.location, a3.length);
}

- (_NSRange)_accessibilitySelectedTextRange
{
  id v5 = [(UICollectionViewCellAccessibilityElement *)self cell];
  uint64_t v6 = [(UICollectionViewCell *)v5 _accessibilitySelectedTextRange];
  NSUInteger v7 = v2;

  NSUInteger v3 = v6;
  NSUInteger v4 = v7;
  result.length = v4;
  result.id location = v3;
  return result;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  id v4 = (id)[(UICollectionViewCell *)v3 _accessibilityTextViewTextOperationResponder];

  return v4;
}

- (id)_accessibilityTextOperations
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  id v4 = (id)[(UICollectionViewCell *)v3 _accessibilityTextOperations];

  return v4;
}

- (void)_accessibilityCopy
{
  NSUInteger v2 = [(UICollectionViewCellAccessibilityElement *)self cell];
  [(UICollectionViewCell *)v2 _accessibilityCopy];
}

- (void)_accessibilityCut
{
  NSUInteger v2 = [(UICollectionViewCellAccessibilityElement *)self cell];
  [(UICollectionViewCell *)v2 _accessibilityCut];
}

- (void)accessibilityElementDidBecomeFocused
{
  NSUInteger v2 = [(UICollectionViewCellAccessibilityElement *)self cell];
  [(UICollectionViewCell *)v2 accessibilityElementDidBecomeFocused];
}

- (void)accessibilityElementDidLoseFocus
{
  NSUInteger v2 = [(UICollectionViewCellAccessibilityElement *)self cell];
  [(UICollectionViewCell *)v2 accessibilityElementDidLoseFocus];
}

- (void)_accessibilitySelect
{
  NSUInteger v2 = [(UICollectionViewCellAccessibilityElement *)self cell];
  [(UICollectionViewCell *)v2 _accessibilitySelect];
}

- (void)_accessibilityPaste
{
  NSUInteger v2 = [(UICollectionViewCellAccessibilityElement *)self cell];
  [(UICollectionViewCell *)v2 _accessibilityPaste];
}

- (void)_accessibilitySelectAll
{
  NSUInteger v2 = [(UICollectionViewCellAccessibilityElement *)self cell];
  [(UICollectionViewCell *)v2 _accessibilitySelectAll];
}

- (void)_accessibilityUndo
{
  NSUInteger v2 = [(UICollectionViewCellAccessibilityElement *)self cell];
  [(UICollectionViewCell *)v2 _accessibilityUndo];
}

- (void)_accessibilityRedo
{
  NSUInteger v2 = [(UICollectionViewCellAccessibilityElement *)self cell];
  [(UICollectionViewCell *)v2 _accessibilityRedo];
}

- (BOOL)_accessibilityHasTextOperations
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 _accessibilityHasTextOperations];

  return v4 & 1;
}

- (id)accessibilityLabel
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  id v4 = (id)[(UICollectionViewCell *)v3 _accessibilityAXAttributedLabel];

  return v4;
}

- (id)accessibilityValue
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  id v4 = (id)[(UICollectionViewCell *)v3 _accessibilityAXAttributedValue];

  return v4;
}

- (id)accessibilityIdentifier
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  id v4 = (id)[(UICollectionViewCell *)v3 accessibilityIdentifier];

  return v4;
}

- (unint64_t)accessibilityTraits
{
  NSUInteger v2 = [(UICollectionViewCellAccessibilityElement *)self cell];
  BOOL v5 = v2 != 0;

  if (!v5) {
    return *MEMORY[0x263F813E8];
  }
  id v4 = [(UICollectionViewCellAccessibilityElement *)self cell];
  unint64_t v7 = [(UICollectionViewCell *)v4 accessibilityTraits];

  return v7;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v6 = [(UICollectionViewCellAccessibilityElement *)self cell];
  [(UICollectionViewCell *)v6 accessibilityActivationPoint];
  double v7 = v2;
  double v8 = v3;

  double v4 = v7;
  double v5 = v8;
  result.y = v5;
  result.x = v4;
  return result;
}

- (BOOL)_accessibilityIsAwayAlertElement
{
  double v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 _accessibilityIsAwayAlertElement];

  return v4 & 1;
}

- (id)accessibilityHint
{
  double v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  id v4 = (id)[(UICollectionViewCell *)v3 _accessibilityAXAttributedHint];

  return v4;
}

- (_NSRange)accessibilityRowRange
{
  double v5 = [(UICollectionViewCellAccessibilityElement *)self cell];
  uint64_t v6 = [(UICollectionViewCell *)v5 accessibilityRowRange];
  NSUInteger v7 = v2;

  NSUInteger v3 = v6;
  NSUInteger v4 = v7;
  result.length = v4;
  result.id location = v3;
  return result;
}

- (BOOL)_accessibilityImplementsDefaultRowRange
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 _accessibilityImplementsDefaultRowRange];

  return v4 & 1;
}

- (id)accessibilityLanguage
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  id v4 = (id)[(UICollectionViewCell *)v3 accessibilityLanguage];

  return v4;
}

- (void)accessibilityIncrement
{
  NSUInteger v2 = [(UICollectionViewCellAccessibilityElement *)self cell];
  [(UICollectionViewCell *)v2 accessibilityIncrement];
}

- (void)accessibilityDecrement
{
  NSUInteger v2 = [(UICollectionViewCellAccessibilityElement *)self cell];
  [(UICollectionViewCell *)v2 accessibilityDecrement];
}

- (BOOL)accessibilityActivate
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 accessibilityActivate];

  return v4 & 1;
}

- (id)_accessibilityCollectionViewCellContentSubviews
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  id v4 = (id)[(UICollectionViewCell *)v3 _accessibilityCollectionViewCellContentSubviews];

  return v4;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 _accessibilitySupportsActivateAction];

  return v4 & 1;
}

- (id)_accessibilityDataDetectorScheme:(CGPoint)a3
{
  char v4 = [(UICollectionViewCellAccessibilityElement *)self cell];
  id v5 = (id)-[UICollectionViewCell _accessibilityDataDetectorScheme:](v4, "_accessibilityDataDetectorScheme:", a3.x, a3.y);

  return v5;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  if ([(UICollectionViewCellAccessibilityElement *)self isAccessibilityElement]) {
    return 1;
  }
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  BOOL v4 = [(UICollectionViewCell *)v3 accessibilityElementCount] != 1;

  return !v4;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (int64_t)_accessibilityScannerActivateBehavior
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  int64_t v4 = [(UICollectionViewCell *)v3 _accessibilityScannerActivateBehavior];

  return v4;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 _accessibilityIsSpeakThisElement];

  return v4 & 1;
}

- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 _accessibilityShouldIncludeRowRangeInElementDescription];

  return v4 & 1;
}

- (id)automationElements
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v16 = self;
  location[1] = (id)a2;
  char v10 = [(UICollectionViewCellAccessibilityElement *)self cell];
  location[0] = (id)[(UICollectionViewCell *)v10 automationElements];

  if ([location[0] count])
  {
    memset(__b, 0, sizeof(__b));
    id obj = location[0];
    uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
    if (v9)
    {
      uint64_t v5 = *(void *)__b[2];
      uint64_t v6 = 0;
      unint64_t v7 = v9;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(__b[1] + 8 * v6);
        [v14 setAccessibilityContainer:v16];
        ++v6;
        if (v4 + 1 >= v7)
        {
          uint64_t v6 = 0;
          unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
          if (!v7) {
            break;
          }
        }
      }
    }

    id v17 = location[0];
    int v12 = 1;
  }
  else
  {
    v11.receiver = v16;
    v11.super_class = (Class)UICollectionViewCellAccessibilityElement;
    id v17 = [(UICollectionViewCellAccessibilityElement *)&v11 automationElements];
    int v12 = 1;
  }
  objc_storeStrong(location, 0);
  NSUInteger v2 = v17;

  return v2;
}

- (BOOL)_accessibilityUserTestingIsCancelButton
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 _accessibilityUserTestingIsCancelButton];

  return v4 & 1;
}

- (BOOL)_accessibilityUserTestingIsDefaultButton
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 _accessibilityUserTestingIsDefaultButton];

  return v4 & 1;
}

- (BOOL)_accessibilityUserTestingIsDestructiveButton
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 _accessibilityUserTestingIsDestructiveButton];

  return v4 & 1;
}

- (BOOL)_accessibilityUserTestingIsPreferredButton
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 _accessibilityUserTestingIsPreferredButton];

  return v4 & 1;
}

- (id)_accessibilityUserTestingVisibleAncestor
{
  return [(UICollectionViewCellAccessibilityElement *)self cell];
}

- (id)_accessibilityUserTestingProxyView
{
  return [(UICollectionViewCellAccessibilityElement *)self cell];
}

- (id)_accessibilitySemanticContextForElement:(id)a3
{
  unint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v4 = [(UICollectionViewCellAccessibilityElement *)v7 cell];
  id v5 = (id)[(UICollectionViewCell *)v4 _accessibilitySemanticContextForElement:location[0]];

  objc_storeStrong(location, 0);

  return v5;
}

- (BOOL)_accessibilityCanBecomeNativeFocused
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 _accessibilityCanBecomeNativeFocused];

  return v4 & 1;
}

- (BOOL)_accessibilityHasNativeFocus
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 _accessibilityHasNativeFocus];

  return v4 & 1;
}

- (BOOL)_accessibilitySetNativeFocus
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 _accessibilitySetNativeFocus];

  return v4 & 1;
}

- (BOOL)_accessibilityViewHierarchyHasNativeFocus
{
  NSUInteger v3 = [(UICollectionViewCellAccessibilityElement *)self cell];
  char v4 = [(UICollectionViewCell *)v3 _accessibilityViewHierarchyHasNativeFocus];

  return v4 & 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 75;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (void)setCell:(id)a3
{
}

- (void).cxx_destruct
{
}

@end