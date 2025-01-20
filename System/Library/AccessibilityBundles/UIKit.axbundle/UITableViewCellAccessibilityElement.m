@interface UITableViewCellAccessibilityElement
- (BOOL)_accessibilityBackingElementIsValid;
- (BOOL)_accessibilityCanBecomeNativeFocused;
- (BOOL)_accessibilityCanPerformEscapeAction;
- (BOOL)_accessibilityElementServesAsHeadingLandmark;
- (BOOL)_accessibilityHasNativeFocus;
- (BOOL)_accessibilityHasTextOperations;
- (BOOL)_accessibilityImplementsDefaultRowRange;
- (BOOL)_accessibilityIsAwayAlertElement;
- (BOOL)_accessibilityIsInTableCell;
- (BOOL)_accessibilityIsOutsideParentBounds;
- (BOOL)_accessibilityIsScannerGroup;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_accessibilityIsTableCell;
- (BOOL)_accessibilityRetainsCustomRotorActionSetting;
- (BOOL)_accessibilitySetNativeFocus;
- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_accessibilityUserTestingIsCancelButton;
- (BOOL)_accessibilityUserTestingIsDefaultButton;
- (BOOL)_accessibilityUserTestingIsDestructiveButton;
- (BOOL)_accessibilityUserTestingIsPreferredButton;
- (BOOL)_accessibilityViewHierarchyHasNativeFocus;
- (BOOL)_allowCustomActionHintSpeakOverride;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldGroupAccessibilityChildren;
- (CGPoint)_accessibilityMaxScrubberPosition;
- (CGPoint)_accessibilityMinScrubberPosition;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3;
- (CGRect)_accessibilityChargedLineBoundsForRange:(_NSRange)a3;
- (CGRect)accessibilityFrame;
- (UITableViewCell)realTableViewCell;
- (UITableViewCell)tableViewCell;
- (_NSRange)_accessibilityIndexPathAsRange;
- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3;
- (_NSRange)_accessibilitySelectedTextRange;
- (_NSRange)accessibilityRowRange;
- (double)_accessibilityAllowedGeometryOverlap;
- (id)_accessibilityAbsoluteValue;
- (id)_accessibilityCapturedImages;
- (id)_accessibilityCustomActionGroupIdentifier;
- (id)_accessibilityDataDetectorScheme:(CGPoint)a3;
- (id)_accessibilityEquivalenceTag;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3;
- (id)_accessibilityProxyView;
- (id)_accessibilitySemanticContextForElement:(id)a3;
- (id)_accessibilitySpeakThisString;
- (id)_accessibilityTableViewCellContentSubviews;
- (id)_accessibilityTextOperations;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)_accessibilityUserTestingProxyView;
- (id)_accessibilityUserTestingVisibleAncestor;
- (id)_privateAccessibilityCustomActions;
- (id)accessibilityCustomActions;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)accessibilityHeaderElements;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityLanguage;
- (id)accessibilityLocalizationBundleID;
- (id)accessibilityLocalizationBundlePath;
- (id)accessibilityLocalizedStringKey;
- (id)accessibilityLocalizedStringTableName;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (id)automationCustomProperties;
- (id)automationElements;
- (id)description;
- (id)existingTableViewCell;
- (int64_t)_accessibilityCompareElement:(id)a3 toElement:(id)a4;
- (int64_t)_accessibilityScannerActivateBehavior;
- (int64_t)_accessibilityUserTestingChildrenCount;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
- (uint64_t)indexPath;
- (uint64_t)usingRealTableViewCell;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)_accessibilityScanningBehaviorTraits;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityCopy;
- (void)_accessibilityCut;
- (void)_accessibilityMarkElementForVisiblePointHitTest:(BOOL)a3;
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
- (void)registerMockChild:(id)a3;
- (void)setIndexPath:(uint64_t)a1;
- (void)setTableViewCell:(id)a3;
- (void)unregisterAllChildren;
- (void)unregisterMockChild:(id)a3;
@end

@implementation UITableViewCellAccessibilityElement

- (unint64_t)_accessibilityAutomationType
{
  return 75;
}

- (UITableViewCell)realTableViewCell
{
  v45 = self;
  v44[1] = (id)a2;
  char v43 = 0;
  objc_opt_class();
  id v9 = (id)[(UITableViewCellAccessibilityElement *)v45 accessibilityContainer];
  id v42 = (id)__UIAccessibilityCastAsClass();

  id v41 = v42;
  objc_storeStrong(&v42, 0);
  v44[0] = v41;
  objc_opt_class();
  char v39 = 0;
  char v37 = 0;
  BOOL v8 = 1;
  if (objc_opt_isKindOfClass())
  {
    id v40 = (id)[v44[0] dataSource];
    char v39 = 1;
    BOOL v8 = 1;
    if (v40)
    {
      id v38 = (id)[v44[0] superview];
      char v37 = 1;
      BOOL v8 = v38 == 0;
    }
  }
  if (v37) {

  }
  if (v39) {
  if (v8)
  }
  {
    id v46 = 0;
    int v36 = 1;
  }
  else
  {
    uint64_t v29 = 0;
    v30 = &v29;
    int v31 = 838860800;
    int v32 = 48;
    v33 = __Block_byref_object_copy__22;
    v34 = __Block_byref_object_dispose__22;
    id v35 = (id)[v44[0] _existingCellForRowAtIndexPath:v45->_indexPath];
    if (!v30[5])
    {
      uint64_t v22 = 0;
      v23 = &v22;
      int v24 = 838860800;
      int v25 = 48;
      v26 = __Block_byref_object_copy__22;
      v27 = __Block_byref_object_dispose__22;
      id v28 = 0;
      uint64_t v15 = MEMORY[0x263EF8330];
      int v16 = -1073741824;
      int v17 = 0;
      v18 = __56__UITableViewCellAccessibilityElement_realTableViewCell__block_invoke;
      v19 = &unk_2650ADF88;
      v21[1] = &v22;
      id v20 = v44[0];
      v21[0] = v45;
      AXPerformSafeBlock();
      id v14 = (id)v23[5];
      objc_storeStrong(v21, 0);
      objc_storeStrong(&v20, 0);
      _Block_object_dispose(&v22, 8);
      objc_storeStrong(&v28, 0);
      v2 = (void *)v30[5];
      v30[5] = (uint64_t)v14;
    }
    BOOL v3 = v30[5] == 0;
    char v12 = 0;
    BOOL v7 = 0;
    if (!v3)
    {
      id v13 = (id)[(id)v30[5] superview];
      char v12 = 1;
      BOOL v7 = v13 == 0;
    }
    if (v12) {

    }
    if (v7)
    {
      v11[1] = &v29;
      id v10 = v44[0];
      v11[0] = v45;
      AXPerformSafeBlock();
      id v4 = (id)[v44[0] safeValueForKey:@"_updateVisibleCellsImmediatelyIfNecessary"];
      objc_storeStrong(v11, 0);
      objc_storeStrong(&v10, 0);
    }
    id v46 = (id)v30[5];
    int v36 = 1;
    _Block_object_dispose(&v29, 8);
    objc_storeStrong(&v35, 0);
  }
  objc_storeStrong(v44, 0);
  v5 = v46;

  return (UITableViewCell *)v5;
}

void __56__UITableViewCellAccessibilityElement_realTableViewCell__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) cellForRowAtIndexPath:*(void *)(*(void *)(a1 + 40) + 56)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

void __56__UITableViewCellAccessibilityElement_realTableViewCell__block_invoke_2(uint64_t a1)
{
  location[2] = (id)a1;
  location[1] = (id)a1;
  uint64_t v1 = [*(id *)(a1 + 32) _createPreparedCellForRowAtIndexPath:*(void *)(*(void *)(a1 + 40) + 56) willDisplay:1];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;

  location[0] = (id)[*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [location[0] tableView:*(void *)(a1 + 32) didEndDisplayingCell:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forRowAtIndexPath:*(void *)(*(void *)(a1 + 40) + 56)];
  }
  objc_storeStrong(location, 0);
}

- (id)_accessibilityProxyView
{
  return [(UITableViewCellAccessibilityElement *)self realTableViewCell];
}

- (BOOL)_accessibilityBackingElementIsValid
{
  uint64_t v2 = [(UITableViewCellAccessibilityElement *)self realTableViewCell];
  BOOL v4 = v2 != 0;

  return v4;
}

- (id)existingTableViewCell
{
  if (a1) {
    id v2 = *(id *)(a1 + 64);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (int64_t)_accessibilityUserTestingChildrenCount
{
  BOOL v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  int64_t v4 = [(UITableViewCell *)v3 _accessibilityUserTestingChildrenCount];

  return v4;
}

- (UITableViewCell)tableViewCell
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v25 = self;
  v24[1] = (id)a2;
  v24[0] = (id)[(UITableViewCellAccessibilityElement *)self _accessibilityParentView];
  id v2 = (id)[v24[0] superview];
  BOOL v14 = v2 != 0;

  if (v14)
  {
    context = (void *)MEMORY[0x2455E6F00]();
    id v20 = [(UITableViewCellAccessibilityElement *)v25 realTableViewCell];
    if (v20)
    {
      BOOL v5 = v20 != v25->_tableViewCell;
      char v16 = 0;
      LOBYTE(v8) = 1;
      if (!v5)
      {
        id v17 = (id)[v20 _accessibilityIndexPath];
        char v16 = 1;
        int v8 = [v17 isEqual:v25->_indexPath] ^ 1;
      }
      if (v16) {

      }
      if (v8)
      {
        id v15 = v25->_tableViewCell;
        [(UITableViewCellAccessibilityElement *)v25 setTableViewCell:v20];
        if (v15)
        {
          [v20 layoutSubviews];
          -[UITableViewCellAccessibility _accessibilityReuseChildren:forMockParent:](v20, v15, v25);
          if (v15 != v25->_tableViewCell) {
            [v15 _accessibilityRemoveValueForKey:@"AXInternalData"];
          }
        }
        else
        {
          [v20 _accessibilityRemoveValueForKey:@"AXInternalData"];
          -[UITableViewCellAccessibility _setAccessibilityMockParent:](v20, v25);
          [v20 layoutSubviews];
        }
        v25->_usingRealTableViewCell = 1;
        objc_storeStrong(&v15, 0);
      }
    }
    else
    {
      if (v25->_tableViewCell)
      {
        id v10 = (id)[(UITableViewCell *)v25->_tableViewCell _accessibilityIndexPath];
        char v11 = [v10 isEqual:v25->_indexPath];

        if ((v11 & 1) == 0)
        {
          id v9 = (id)[(UITableViewCellAccessibilityElement *)v25 accessibilityContainer];
          id v19 = (id)[v9 accessibilityCellForRowAtIndexPath:v25->_indexPath];

          -[UITableViewCellAccessibility _setAccessibilityMockParent:](v19, v25);
          [v19 layoutSubviews];
          [v19 removeFromSuperview];
          id v18 = v25->_tableViewCell;
          [(UITableViewCellAccessibilityElement *)v25 setTableViewCell:v19];
          -[UITableViewCellAccessibility _accessibilityReuseChildren:forMockParent:](v19, v18, v25);
          if (v18 != v19) {
            [v18 _accessibilityRemoveValueForKey:@"AXInternalData"];
          }
          objc_storeStrong(&v18, 0);
          objc_storeStrong(&v19, 0);
        }
      }
      else
      {
        id v12 = (id)[(UITableViewCellAccessibilityElement *)v25 accessibilityContainer];
        BOOL v3 = (UITableViewCell *)(id)[v12 accessibilityCellForRowAtIndexPath:v25->_indexPath];
        tableViewCell = v25->_tableViewCell;
        v25->_tableViewCell = v3;

        -[UITableViewCellAccessibility _setAccessibilityMockParent:](v25->_tableViewCell, v25);
        [(UITableViewCell *)v25->_tableViewCell removeFromSuperview];
      }
      v25->_usingRealTableViewCell = 0;
    }
    objc_storeStrong(&v20, 0);
    v26 = v25->_tableViewCell;
    int v21 = 1;
  }
  else
  {
    id location = (id)AXLogUIA();
    os_log_type_t v22 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v27, (uint64_t)v24[0]);
      _os_log_impl(&dword_2402B7000, (os_log_t)location, v22, "No parent view for table cell: %@", v27, 0xCu);
    }
    objc_storeStrong(&location, 0);
    v26 = 0;
    int v21 = 1;
  }
  objc_storeStrong(v24, 0);
  v6 = v26;

  return v6;
}

- (BOOL)_accessibilityElementServesAsHeadingLandmark
{
  return [(UITableViewCell *)self->_tableViewCell _accessibilityElementServesAsHeadingLandmark] & 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return [(UITableViewCell *)self->_tableViewCell shouldGroupAccessibilityChildren] & 1;
}

- (int64_t)_accessibilityCompareElement:(id)a3 toElement:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  int64_t v6 = [(UITableViewCell *)v9->_tableViewCell _accessibilityCompareElement:location[0] toElement:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (double)_accessibilityAllowedGeometryOverlap
{
  [(UITableViewCell *)self->_tableViewCell _accessibilityAllowedGeometryOverlap];
  return result;
}

- (void)dealloc
{
  int64_t v4 = self;
  SEL v3 = a2;
  [(UITableViewCell *)self->_tableViewCell _accessibilityRemoveValueForKey:@"AXInternalData"];
  v2.receiver = v4;
  v2.super_class = (Class)UITableViewCellAccessibilityElement;
  [(UITableViewCellAccessibilityElement *)&v2 dealloc];
}

- (void)unregisterAllChildren
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v13 = self;
  SEL v12 = a2;
  memset(__b, 0, sizeof(__b));
  obj = v13->_mockChildren;
  uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v14 count:16];
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
      char v11 = *(id **)(__b[1] + 8 * v6);
      objc_super v2 = (UITableViewCellAccessibilityElement *)(id)[v11 accessibilityContainer];
      BOOL v3 = v2 != v13;

      if (!v3) {
        [v11 setAccessibilityContainer:0];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[UITableTextAccessibilityElement setTextDelegate:](v11, 0);
        -[UITableTextAccessibilityElement setAttributeDelegate:](v11, 0);
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v14 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  objc_storeStrong((id *)&v13->_mockChildren, 0);
}

- (void)registerMockChild:(id)a3
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v5 = (id)[location[0] accessibilityContainer];
    if (v5 != v8 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v5 unregisterMockChild:location[0]];
    }
    if (!v8->_mockChildren)
    {
      uint64_t v3 = [objc_allocWithZone(MEMORY[0x263EFF980]) init];
      mockChildren = v8->_mockChildren;
      v8->_mockChildren = (NSMutableArray *)v3;
    }
    if (([(NSMutableArray *)v8->_mockChildren containsObject:location[0]] & 1) == 0) {
      [(NSMutableArray *)v8->_mockChildren addObject:location[0]];
    }
    objc_storeStrong(&v5, 0);
    int v6 = 0;
  }
  else
  {
    int v6 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)unregisterMockChild:(id)a3
{
  int v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    uint64_t v3 = (UITableViewCellAccessibilityElement *)(id)[location[0] accessibilityContainer];
    BOOL v4 = v3 != v6;

    if (!v4) {
      [location[0] setAccessibilityContainer:0];
    }
    [(NSMutableArray *)v6->_mockChildren removeObjectIdenticalTo:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityIsTableCell
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 _accessibilityAXAttributedLabel];

  return v4;
}

- (id)accessibilityLocalizedStringKey
{
  v7[2] = self;
  v7[1] = (id)a2;
  uint64_t v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  v7[0] = (id)[(UITableViewCell *)v3 accessibilityLabel];

  id v6 = (id)[v7[0] _accessibilityAttributedLocalizedString];
  id v5 = (id)[v6 attributeValueForKey:@"UIAccessibilityTokenLocalizedStringKey"];
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);

  return v4;
}

- (id)accessibilityLocalizationBundleID
{
  v7[2] = self;
  v7[1] = (id)a2;
  uint64_t v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  v7[0] = (id)[(UITableViewCell *)v3 accessibilityLabel];

  id v6 = (id)[v7[0] _accessibilityAttributedLocalizedString];
  id v5 = (id)[v6 attributeValueForKey:@"UIAccessibilityTokenLocalizedStringBundleID"];
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);

  return v4;
}

- (id)accessibilityLocalizationBundlePath
{
  v7[2] = self;
  v7[1] = (id)a2;
  uint64_t v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  v7[0] = (id)[(UITableViewCell *)v3 accessibilityLabel];

  id v6 = (id)[v7[0] _accessibilityAttributedLocalizedString];
  id v5 = (id)[v6 attributeValueForKey:@"UIAccessibilityTokenLocalizationBundlePath"];
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);

  return v4;
}

- (id)accessibilityLocalizedStringTableName
{
  v7[2] = self;
  v7[1] = (id)a2;
  uint64_t v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  v7[0] = (id)[(UITableViewCell *)v3 accessibilityLabel];

  id v6 = (id)[v7[0] _accessibilityAttributedLocalizedString];
  id v5 = (id)[v6 attributeValueForKey:@"UIAccessibilityTokenLocalizedStringTableName"];
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);

  return v4;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  uint64_t v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 _accessibilityCustomActionGroupIdentifier];

  return v4;
}

- (id)accessibilityValue
{
  uint64_t v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 _accessibilityAXAttributedValue];

  return v4;
}

- (id)accessibilityIdentifier
{
  uint64_t v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 accessibilityIdentifier];

  return v4;
}

- (unint64_t)accessibilityTraits
{
  objc_super v2 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  BOOL v5 = v2 != 0;

  if (!v5) {
    return *MEMORY[0x263F813E8];
  }
  id v4 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  unint64_t v7 = [(UITableViewCell *)v4 accessibilityTraits];

  return v7;
}

- (void)_accessibilityMarkElementForVisiblePointHitTest:(BOOL)a3
{
  unint64_t v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  uint64_t v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  [(UITableViewCell *)v3 _accessibilityMarkElementForVisiblePointHitTest:v5];

  v4.receiver = v7;
  v4.super_class = (Class)UITableViewCellAccessibilityElement;
  [(UITableViewCellAccessibilityElement *)&v4 _accessibilityMarkElementForVisiblePointHitTest:v5];
}

- (CGPoint)accessibilityActivationPoint
{
  SEL v6 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  [(UITableViewCell *)v6 accessibilityActivationPoint];
  double v7 = v2;
  double v8 = v3;

  double v4 = v7;
  double v5 = v8;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)accessibilityHeaderElements
{
  double v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 accessibilityHeaderElements];

  return v4;
}

- (BOOL)_accessibilityIsAwayAlertElement
{
  double v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  char v4 = [(UITableViewCell *)v3 _accessibilityIsAwayAlertElement];

  return v4 & 1;
}

- (id)accessibilityHint
{
  double v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 _accessibilityAXAttributedHint];

  return v4;
}

- (_NSRange)accessibilityRowRange
{
  double v5 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  uint64_t v6 = [(UITableViewCell *)v5 accessibilityRowRange];
  NSUInteger v7 = v2;

  NSUInteger v3 = v6;
  NSUInteger v4 = v7;
  result.length = v4;
  result.id location = v3;
  return result;
}

- (BOOL)_accessibilityImplementsDefaultRowRange
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  char v4 = [(UITableViewCell *)v3 _accessibilityImplementsDefaultRowRange];

  return v4 & 1;
}

- (BOOL)_accessibilityIsInTableCell
{
  return 1;
}

- (_NSRange)_accessibilityIndexPathAsRange
{
  double v5 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  uint64_t v6 = [(UITableViewCell *)v5 _accessibilityIndexPathAsRange];
  NSUInteger v7 = v2;

  NSUInteger v3 = v6;
  NSUInteger v4 = v7;
  result.length = v4;
  result.id location = v3;
  return result;
}

- (CGRect)accessibilityFrame
{
  os_log_type_t v22 = self;
  v21[1] = (id)a2;
  if (self->_indexPath)
  {
    v21[0] = (id)[(UITableViewCellAccessibilityElement *)v22 accessibilityContainer];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v18 = 0;
      objc_opt_class();
      id v17 = (id)__UIAccessibilityCastAsClass();
      id v16 = v17;
      objc_storeStrong(&v17, 0);
      id v19 = v16;
      uint64_t v15 = [v16 numberOfSections];
      if ([(NSIndexPath *)v22->_indexPath section] < v15 && v15)
      {
        uint64_t v14 = objc_msgSend(v19, "numberOfRowsInSection:", -[NSIndexPath section](v22->_indexPath, "section"));
        if ([(NSIndexPath *)v22->_indexPath row] < v14 && v14)
        {
          [v19 rectForRowAtIndexPath:v22->_indexPath];
          UIAccessibilityFrameForBounds();
          *(void *)&long long v23 = v6;
          *((void *)&v23 + 1) = v7;
          *(void *)&long long v24 = v8;
          *((void *)&v24 + 1) = v9;
          int v20 = 1;
        }
        else
        {
          long long v23 = *MEMORY[0x263F001A8];
          long long v24 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
          int v20 = 1;
        }
      }
      else
      {
        long long v23 = *MEMORY[0x263F001A8];
        long long v24 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
        int v20 = 1;
      }
      objc_storeStrong(&v19, 0);
    }
    else
    {
      [v21[0] accessibilityFrame];
      *(void *)&long long v23 = v2;
      *((void *)&v23 + 1) = v3;
      *(void *)&long long v24 = v4;
      *((void *)&v24 + 1) = v5;
      int v20 = 1;
    }
    objc_storeStrong(v21, 0);
  }
  else
  {
    long long v23 = *MEMORY[0x263F001A8];
    long long v24 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  }
  double v11 = *((double *)&v23 + 1);
  double v10 = *(double *)&v23;
  double v13 = *((double *)&v24 + 1);
  double v12 = *(double *)&v24;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)accessibilityLanguage
{
  uint64_t v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 accessibilityLanguage];

  return v4;
}

- (BOOL)isAccessibilityElement
{
  uint64_t v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  char v4 = [(UITableViewCell *)v3 isAccessibilityElement];

  return v4 & 1;
}

- (void)accessibilityIncrement
{
  uint64_t v2 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  [(UITableViewCell *)v2 accessibilityIncrement];
}

- (void)accessibilityDecrement
{
  uint64_t v2 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  [(UITableViewCell *)v2 accessibilityDecrement];
}

- (CGPoint)_accessibilityMinScrubberPosition
{
  uint64_t v6 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  [(UITableViewCell *)v6 _accessibilityMinScrubberPosition];
  double v7 = v2;
  double v8 = v3;

  double v4 = v7;
  double v5 = v8;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)_accessibilityMaxScrubberPosition
{
  uint64_t v6 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  [(UITableViewCell *)v6 _accessibilityMaxScrubberPosition];
  double v7 = v2;
  double v8 = v3;

  double v4 = v7;
  double v5 = v8;
  result.y = v5;
  result.x = v4;
  return result;
}

- (BOOL)accessibilityActivate
{
  double v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  char v4 = [(UITableViewCell *)v3 accessibilityActivate];

  return v4 & 1;
}

- (id)automationCustomProperties
{
  double v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 automationCustomProperties];

  return v4;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  double v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  char v4 = [(UITableViewCell *)v3 _accessibilitySupportsActivateAction];

  return v4 & 1;
}

- (id)_accessibilityDataDetectorScheme:(CGPoint)a3
{
  char v4 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v5 = (id)-[UITableViewCell _accessibilityDataDetectorScheme:](v4, "_accessibilityDataDetectorScheme:", a3.x, a3.y);

  return v5;
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  char v4 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v5 = (id)-[UITableViewCell _accessibilityLineNumberAndColumnForPoint:](v4, "_accessibilityLineNumberAndColumnForPoint:", a3.x, a3.y);

  return v5;
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  double v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v6 = [(UITableViewCellAccessibilityElement *)v8 tableViewCell];
  uint64_t v9 = [(UITableViewCell *)v6 _accessibilityRangeForLineNumberAndColumn:location[0]];
  NSUInteger v10 = v3;

  objc_storeStrong(location, 0);
  NSUInteger v4 = v9;
  NSUInteger v5 = v10;
  result.length = v5;
  result.id location = v4;
  return result;
}

- (CGRect)_accessibilityChargedLineBoundsForRange:(_NSRange)a3
{
  double v11 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  -[UITableViewCell _accessibilityChargedLineBoundsForRange:](v11, "_accessibilityChargedLineBoundsForRange:", a3.location, a3.length);
  double v13 = v3;
  double v14 = v4;
  double v15 = v5;
  double v16 = v6;

  double v7 = v13;
  double v8 = v14;
  double v9 = v15;
  double v10 = v16;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  double v11 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  -[UITableViewCell _accessibilityBoundsForRange:](v11, "_accessibilityBoundsForRange:", a3.location, a3.length);
  double v13 = v3;
  double v14 = v4;
  double v15 = v5;
  double v16 = v6;

  double v7 = v13;
  double v8 = v14;
  double v9 = v15;
  double v10 = v16;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (id)_accessibilityEquivalenceTag
{
  double v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 _accessibilityEquivalenceTag];

  return v4;
}

- (int64_t)accessibilityElementCount
{
  double v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  int64_t v4 = [(UITableViewCell *)v3 accessibilityElementCount];

  return v4;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  char v39 = self;
  SEL v38 = a2;
  int64_t v37 = a3;
  v27 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v36 = (id)[(UITableViewCell *)v27 accessibilityElementAtIndex:v37];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v36;
  }
  else {
    id v3 = 0;
  }
  id v35 = v3;
  if (([v36 isAccessibilityElement] & 1) != 0 && v35 && -[UIAccessibilityElement representsSubview](v35))
  {
    id v34 = [(UITableViewCellAccessibilityElement *)v39 realTableViewCell];
    if (v34)
    {
      id v33 = (id)[v34 safeValueForKey:@"subviews"];
      id v22 = v33;
      id v24 = (id)[v34 safeValueForKey:@"contentView"];
      id v23 = (id)[v24 subviews];
      id v4 = (id)objc_msgSend(v22, "arrayByAddingObjectsFromArray:");
      id v5 = v33;
      id v33 = v4;

      id location = 0;
      memset(__b, 0, sizeof(__b));
      id obj = v33;
      uint64_t v26 = [obj countByEnumeratingWithState:__b objects:v40 count:16];
      if (v26)
      {
        uint64_t v19 = *(void *)__b[2];
        uint64_t v20 = 0;
        unint64_t v21 = v26;
        while (1)
        {
          uint64_t v18 = v20;
          if (*(void *)__b[2] != v19) {
            objc_enumerationMutation(obj);
          }
          int v31 = *(void **)(__b[1] + 8 * v20);
          if (-[UIAccessibilityElement elementMatchesSubview:](v35, v31)) {
            break;
          }
          ++v20;
          if (v18 + 1 >= v21)
          {
            uint64_t v20 = 0;
            unint64_t v21 = [obj countByEnumeratingWithState:__b objects:v40 count:16];
            if (!v21) {
              goto LABEL_16;
            }
          }
        }
        objc_storeStrong(&location, v31);
      }
LABEL_16:

      if (location)
      {
        id v13 = v36;
        id v14 = (id)[location accessibilityLabel];
        objc_msgSend(v13, "setAccessibilityLabel:");

        id v15 = v36;
        id v16 = (id)[location accessibilityValue];
        objc_msgSend(v15, "setAccessibilityValue:");

        id v17 = v36;
        [location accessibilityFrame];
        objc_msgSend(v17, "setAccessibilityFrame:", v6, v7, v8, v9);
        objc_msgSend(v36, "setAccessibilityTraits:", objc_msgSend(location, "accessibilityTraits"));
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v33, 0);
    }
    objc_storeStrong(&v34, 0);
  }
  char v28 = 0;
  BOOL v12 = 0;
  if (v35)
  {
    uint64_t v29 = (UITableViewCellAccessibilityElement *)(id)[v36 accessibilityContainer];
    char v28 = 1;
    BOOL v12 = v29 != v39;
  }
  if (v28) {

  }
  if (v12)
  {
    [(UITableViewCellAccessibilityElement *)v39 registerMockChild:v36];
    [v36 setAccessibilityContainer:v39];
  }
  id v11 = v36;
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);

  return v11;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  double v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(UITableViewCellAccessibilityElement *)v6 tableViewCell];
  if (v4) {
    int64_t v7 = [v4 indexOfAccessibilityElement:location[0]];
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v21 = a3;
  uint64_t v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  id v18 = 0;
  id v17 = [(UITableViewCellAccessibilityElement *)v20 tableViewCell];
  id v16 = (id)[(UITableViewCellAccessibilityElement *)v20 accessibilityContainer];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v17, "convertPoint:fromView:", v16, v21.x, v21.y);
    id v6 = (id)objc_msgSend(v17, "_accessibilityHitTest:withEvent:", location[0], v4, v5);
    id v7 = v18;
    id v18 = v6;
  }
  objc_opt_class();
  char v14 = 0;
  BOOL v11 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v15 = (UITableViewCellAccessibilityElement *)(id)[v18 accessibilityContainer];
    char v14 = 1;
    BOOL v11 = v15 != v20;
  }
  if (v14) {

  }
  if (v11)
  {
    char v12 = 0;
    LOBYTE(v10) = 0;
    if (([v18 _accessibilityIsDescendantOfElement:v20] & 1) == 0)
    {
      id v13 = (id)[v18 _accessibilityOrderedChildrenContainer];
      char v12 = 1;
      int v10 = [v13 _accessibilityIsDescendantOfElement:v16] ^ 1;
    }
    if (v12) {

    }
    if (v10)
    {
      [(UITableViewCellAccessibilityElement *)v20 registerMockChild:v18];
      [v18 setAccessibilityContainer:v20];
    }
  }
  if (!v18 && ([location[0] _accessibilityAutomationHitTest] & 1) != 0) {
    objc_storeStrong(&v18, v20);
  }
  id v9 = v18;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);

  return v9;
}

- (id)description
{
  double v4 = NSString;
  uint64_t v3 = objc_opt_class();
  id v7 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v6 = (id)-[UITableViewCellAccessibilityElement indexPath]((uint64_t)self);
  id v5 = [(UITableViewCellAccessibilityElement *)self accessibilityLabel];
  id v8 = (id)[v4 stringWithFormat:@"[%@ - %p] %@ %@ - %@"], v3, self, v7, v6, v5);

  return v8;
}

- (uint64_t)indexPath
{
  if (a1) {
    return *(void *)(a1 + 56);
  }
  else {
    return 0;
  }
}

- (id)automationElements
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v16 = self;
  location[1] = (id)a2;
  int v10 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  location[0] = (id)[(UITableViewCell *)v10 automationElements];

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
    v11.super_class = (Class)UITableViewCellAccessibilityElement;
    id v17 = [(UITableViewCellAccessibilityElement *)&v11 automationElements];
    int v12 = 1;
  }
  objc_storeStrong(location, 0);
  double v2 = v17;

  return v2;
}

- (BOOL)_accessibilityUserTestingIsCancelButton
{
  uint64_t v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  char v4 = [(UITableViewCell *)v3 _accessibilityUserTestingIsCancelButton];

  return v4 & 1;
}

- (BOOL)_accessibilityUserTestingIsDefaultButton
{
  uint64_t v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  char v4 = [(UITableViewCell *)v3 _accessibilityUserTestingIsDefaultButton];

  return v4 & 1;
}

- (BOOL)_accessibilityUserTestingIsDestructiveButton
{
  uint64_t v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  char v4 = [(UITableViewCell *)v3 _accessibilityUserTestingIsDestructiveButton];

  return v4 & 1;
}

- (BOOL)_accessibilityUserTestingIsPreferredButton
{
  uint64_t v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  char v4 = [(UITableViewCell *)v3 _accessibilityUserTestingIsPreferredButton];

  return v4 & 1;
}

- (id)_accessibilityUserTestingVisibleAncestor
{
  return [(UITableViewCellAccessibilityElement *)self tableViewCell];
}

- (id)_accessibilityUserTestingProxyView
{
  return [(UITableViewCellAccessibilityElement *)self tableViewCell];
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
    BOOL v11 = !CGRectIntersectsRect(v8, rect2);

    objc_storeStrong(&v9, 0);
  }
  else
  {
    return 0;
  }
  return v11;
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  uint64_t v178 = *MEMORY[0x263EF8340];
  id v163 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v161 = (id)[v163 accessibilityContainer];
  if (([v161 _accessibilityRespectsTableScrollEnabledFlag] & 1) == 0
    || ([v161 safeBoolForKey:@"isScrollEnabled"] & 1) != 0)
  {
    id v3 = (id)AXRetainAutorelease();
    id v157 = (id)[v163 tableViewCell];
    id v85 = (id)[v157 _accessibilityIndexPath];
    id v84 = (id)[v163 _accessibilityIndexPath];
    char v86 = objc_msgSend(v85, "isEqual:");

    char v156 = v86 & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (v156 & 1) != 0
      && ([v157 _accessibilityShouldBypassScrollToVisibleWithChild] & 1) != 0)
    {
      char v164 = 0;
      int v158 = 1;
LABEL_83:
      objc_storeStrong(&v157, 0);
      goto LABEL_84;
    }
    char v155 = 0;
    if (objc_opt_respondsToSelector() & 1) != 0 && (v156)
    {
      id v83 = (id)[v157 safeValueForKey:@"accessibilityScrollToVisible"];
      [v83 BOOLValue];

      char v155 = 1;
      os_log_t v154 = (os_log_t)(id)AXLogAppAccessibility();
      os_log_type_t v153 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v176, (uint64_t)v157);
        _os_log_impl(&dword_2402B7000, v154, v153, "Asked table view cell to handle scrolling: %@", v176, 0xCu);
      }
      objc_storeStrong((id *)&v154, 0);
    }
    os_log_t v152 = (os_log_t)(id)AXLogAppAccessibility();
    os_log_type_t v151 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = objc_opt_class();
      __os_log_helper_16_2_3_8_64_8_64_4_0((uint64_t)v175, v4, (uint64_t)v157, v156 & 1);
      _os_log_impl(&dword_2402B7000, v152, v151, "%@ tableViewCell: %@ had same index path as self: %d", v175, 0x1Cu);
    }
    objc_storeStrong((id *)&v152, 0);
    if ((v156 & 1) == 0)
    {
      os_log_t v150 = (os_log_t)(id)AXLogAppAccessibility();
      os_log_type_t v149 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v150, OS_LOG_TYPE_INFO))
      {
        v79 = v150;
        os_log_type_t v80 = v149;
        id v82 = (id)[v157 _accessibilityIndexPath];
        id v78 = v82;
        id v148 = v78;
        id v81 = (id)[v163 _accessibilityIndexPath];
        id v147 = v81;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v174, (uint64_t)v78, (uint64_t)v147);
        _os_log_impl(&dword_2402B7000, v79, v80, "Real tv cell path: %@, our path: %@", v174, 0x16u);

        objc_storeStrong(&v147, 0);
        objc_storeStrong(&v148, 0);
      }
      objc_storeStrong((id *)&v150, 0);
    }
    if ((v155 & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v164 = 0;
        int v158 = 1;
        goto LABEL_83;
      }
      id v146 = (id)[v161 indexPathsForVisibleRows];
      id v145 = *((id *)v163 + 7);
      unint64_t v144 = [v146 indexOfObject:v145];
      uint64_t v143 = -[UITableViewAccessibility _accessibilityDefaultTableViewCellScrollPosition]((uint64_t)v161);
      char v142 = 0;
      if (_UIAXObjectIsBehindKeyboard())
      {
        uint64_t v143 = 1;
        char v142 = 1;
      }
      [v161 accessibilityFrame];
      rect1.origin.x = v5;
      rect1.origin.y = v6;
      rect1.size.width = v7;
      rect1.size.height = v8;
      [v163 accessibilityFrame];
      rect2.origin.x = v9;
      rect2.origin.y = v10;
      rect2.size.width = v11;
      rect2.size.height = v12;
      if (!CGRectContainsRect(rect1, rect2)) {
        char v142 = 1;
      }
      id v77 = (id)[v161 safeValueForKey:@"visibleBounds"];
      [v77 rectValue];
      *(void *)&long long v138 = v13;
      *((void *)&v138 + 1) = v14;
      *(void *)&long long v139 = v15;
      *((void *)&v139 + 1) = v16;

      [v161 adjustedContentInset];
      double v134 = v17;
      double v135 = v18;
      double v136 = v19;
      double v137 = v20;
      *(void *)&long long v132 = UIEdgeInsetsInsetRect_3(*(double *)&v138, *((double *)&v138 + 1), *(double *)&v139, *((double *)&v139 + 1), v17, v18);
      *((void *)&v132 + 1) = v21;
      *(void *)&long long v133 = v22;
      *((void *)&v133 + 1) = v23;
      long long v138 = v132;
      long long v139 = v133;
      UIAccessibilityFrameForBounds();
      v131.origin.x = v24;
      v131.origin.y = v25;
      v131.size.width = v26;
      v131.size.height = v27;
      [v163 accessibilityFrame];
      v130.origin.x = v28;
      v130.origin.y = v29;
      v130.size.width = v30;
      v130.size.height = v31;
      if (!CGRectContainsRect(v131, v130))
      {
        uint64_t v143 = 1;
        if (!UIEdgeInsetsEqualToEdgeInsets_0(v134, v135, v136, v137, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24)))char v142 = 1; {
      }
        }
      if ((v142 & 1) == 0 && -[UITableViewCellAccessibilityElement _accessibilityIsOutsideParentBounds](v163)) {
        char v142 = 1;
      }
      os_log_t v129 = (os_log_t)(id)AXLogAppAccessibility();
      os_log_type_t v128 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
      {
        id v76 = (id)[NSNumber numberWithUnsignedInteger:v144];
        __os_log_helper_16_2_4_4_0_4_0_8_64_8_64((uint64_t)v173, v142 & 1, v143, (uint64_t)v145, (uint64_t)v76);
        _os_log_impl(&dword_2402B7000, v129, v128, "UITableViewCEllAXElement must scroll: %d, position: %d - indexPath: %@ indexOfPath: %@", v173, 0x22u);
      }
      objc_storeStrong((id *)&v129, 0);
      uint64_t v127 = [v146 count];
      if ((v142 & 1) == 0 && v127 && (v144 > 1 && v144 < v127 - 2 || v127 == 1))
      {
        char v164 = 0;
        int v158 = 1;
      }
      else
      {
        uint64_t v126 = 0;
        uint64_t v125 = [v161 numberOfSections];
        for (uint64_t i = 0; i < v125; ++i)
          v126 += [v161 numberOfRowsInSection:i];
        if ([v146 count] != v126 || (v142 & 1) != 0)
        {
          if ([v145 section] < v125
            && v125
            && (uint64_t v75 = [v145 row],
                v75 < objc_msgSend(v161, "numberOfRowsInSection:", objc_msgSend(v145, "section"))))
          {
            uint64_t v143 = [v161 _accessibilityScrollPositionForCellOverride:v143];
            os_log_t v123 = (os_log_t)(id)AXLogAppAccessibility();
            os_log_type_t v122 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
            {
              __os_log_helper_16_2_2_4_0_8_64((uint64_t)v172, v143, (uint64_t)v161);
              _os_log_impl(&dword_2402B7000, v123, v122, "UITableViewCEllAXElement override scrollPosition-> %d on parent: %@", v172, 0x12u);
            }
            objc_storeStrong((id *)&v123, 0);
            [v161 scrollToRowAtIndexPath:v145 atScrollPosition:v143 animated:0];
            [v161 _accessibilityOpaqueElementScrollCleanup];
            id v73 = (id)[v161 indexPathsForVisibleRows];
            char v120 = 0;
            BOOL IsOutsideParent = 1;
            if ([v73 containsObject:v145])
            {
              id v121 = (id)[v161 cellForRowAtIndexPath:v145];
              char v120 = 1;
              BOOL IsOutsideParent = -[UITableViewCellAccessibility _accessibilityIsOutsideParentBounds](v121);
            }
            if (v120) {

            }
            if (IsOutsideParent)
            {
              os_log_t v119 = (os_log_t)(id)AXLogAppAccessibility();
              os_log_type_t v118 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v171, (uint64_t)v145);
                _os_log_impl(&dword_2402B7000, v119, v118, "UITableViewCEllAXElement index path still not visible -> %@", v171, 0xCu);
              }
              objc_storeStrong((id *)&v119, 0);
              [v161 scrollToRowAtIndexPath:v145 atScrollPosition:2 animated:0];
              [v161 _accessibilityOpaqueElementScrollCleanup];
              os_log_t v117 = (os_log_t)(id)AXLogAppAccessibility();
              os_log_type_t v116 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v170, (uint64_t)v145);
                _os_log_impl(&dword_2402B7000, v117, v116, "UITableViewCEllAXElement scroll to middle position for %@", v170, 0xCu);
              }
              objc_storeStrong((id *)&v117, 0);
            }
            id v71 = (id)[v161 cellForRowAtIndexPath:v145];
            BOOL v72 = -[UITableViewCellAccessibility _accessibilityIsOutsideParentBounds](v71);

            if (v72)
            {
              os_log_t v115 = (os_log_t)(id)AXLogAppAccessibility();
              os_log_type_t v114 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
              {
                v68 = v115;
                os_log_type_t v69 = v114;
                id v70 = (id)[v161 cellForRowAtIndexPath:v145];
                id v113 = v70;
                __os_log_helper_16_2_1_8_64((uint64_t)v169, (uint64_t)v113);
                _os_log_impl(&dword_2402B7000, v68, v69, "UITableViewCEllAXElement after scrolling still outside parent bounds %@", v169, 0xCu);

                objc_storeStrong(&v113, 0);
              }
              objc_storeStrong((id *)&v115, 0);
              os_log_t v112 = (os_log_t)(id)AXLogAppAccessibility();
              os_log_type_t v111 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
              {
                v63 = v112;
                os_log_type_t v64 = v111;
                v61 = (void *)MEMORY[0x263F08D40];
                id v67 = (id)[v161 window];
                [v67 accessibilityFrame];
                CGRect rect = v179;
                CGRect v110 = CGRectInset(v179, 0.0, 40.0);
                id v66 = (id)objc_msgSend(v61, "valueWithBytes:objCType:", &v110);
                v62 = (void *)MEMORY[0x263F08D40];
                [v163 accessibilityFrame];
                v108[0] = v32;
                v108[1] = v33;
                v108[2] = v34;
                v108[3] = v35;
                id v65 = (id)[v62 valueWithBytes:v108 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
                __os_log_helper_16_2_2_8_64_8_64((uint64_t)v168, (uint64_t)v66, (uint64_t)v65);
                _os_log_impl(&dword_2402B7000, v63, v64, "Outside bounds: window frame %@, self frame %@", v168, 0x16u);
              }
              objc_storeStrong((id *)&v112, 0);
              id v60 = (id)[v161 cellForRowAtIndexPath:v145];
              [v60 frame];
              *(void *)&long long v106 = v36;
              *((void *)&v106 + 1) = v37;
              *(void *)&long long v107 = v38;
              *((void *)&v107 + 1) = v39;

              objc_msgSend(v161, "scrollRectToVisible:animated:", 0, v106, v107);
              os_log_t v105 = (os_log_t)(id)AXLogAppAccessibility();
              os_log_type_t v104 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
              {
                v57 = v105;
                os_log_type_t v58 = v104;
                v103[0] = v106;
                v103[1] = v107;
                id v59 = (id)[MEMORY[0x263F08D40] valueWithBytes:v103 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
                __os_log_helper_16_2_1_8_64((uint64_t)v167, (uint64_t)v59);
                _os_log_impl(&dword_2402B7000, v57, v58, "Scroll rect to visible with frame %@", v167, 0xCu);
              }
              objc_storeStrong((id *)&v105, 0);
              [v161 _accessibilityOpaqueElementScrollCleanup];
            }
            id v55 = (id)[v161 cellForRowAtIndexPath:v145];
            BOOL v56 = -[UITableViewCellAccessibility _accessibilityIsOutsideParentBounds](v55);

            if (v56)
            {
              os_log_t v102 = (os_log_t)(id)AXLogAppAccessibility();
              os_log_type_t v101 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
              {
                v52 = v102;
                os_log_type_t v53 = v101;
                id v54 = (id)[v161 cellForRowAtIndexPath:v145];
                id v100 = v54;
                __os_log_helper_16_2_1_8_64((uint64_t)v166, (uint64_t)v100);
                _os_log_impl(&dword_2402B7000, v52, v53, "After scrollRectToVisible! UITableViewCEllAXElement after scrolling still outside parent bounds %@", v166, 0xCu);

                objc_storeStrong(&v100, 0);
              }
              objc_storeStrong((id *)&v102, 0);
              os_log_t v99 = (os_log_t)(id)AXLogAppAccessibility();
              os_log_type_t v98 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
              {
                v47 = v99;
                os_log_type_t v48 = v98;
                v45 = (void *)MEMORY[0x263F08D40];
                id v51 = (id)[v161 window];
                [v51 accessibilityFrame];
                CGRect v96 = v180;
                CGRect v97 = CGRectInset(v180, 0.0, 40.0);
                id v50 = (id)objc_msgSend(v45, "valueWithBytes:objCType:", &v97);
                id v46 = (void *)MEMORY[0x263F08D40];
                [v163 accessibilityFrame];
                v95[0] = v40;
                v95[1] = v41;
                v95[2] = v42;
                v95[3] = v43;
                id v49 = (id)[v46 valueWithBytes:v95 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
                __os_log_helper_16_2_2_8_64_8_64((uint64_t)v165, (uint64_t)v50, (uint64_t)v49);
                _os_log_impl(&dword_2402B7000, v47, v48, "Still! Outside bounds: window frame %@, self frame %@", v165, 0x16u);
              }
              objc_storeStrong((id *)&v99, 0);
              char v164 = 0;
              int v158 = 1;
            }
            else
            {
              v89[1] = (id)MEMORY[0x263EF8330];
              int v90 = -1073741824;
              int v91 = 0;
              v92 = __77__UITableViewCellAccessibilityElement_accessibilityScrollToVisibleWithChild___block_invoke;
              v93 = &unk_2650ADF18;
              id v94 = v163;
              AXPerformBlockOnMainThreadAfterDelay();
              if (!location[0]) {
                objc_storeStrong(location, v157);
              }
              id v87 = v163;
              id v88 = location[0];
              v89[0] = v161;
              AXPerformBlockOnMainThreadAfterDelay();
              char v155 = 1;
              objc_storeStrong(v89, 0);
              objc_storeStrong(&v88, 0);
              objc_storeStrong(&v87, 0);
              objc_storeStrong(&v94, 0);
              int v158 = 0;
            }
          }
          else
          {
            char v164 = 0;
            int v158 = 1;
          }
        }
        else
        {
          char v164 = 0;
          int v158 = 1;
        }
      }
      objc_storeStrong(&v145, 0);
      objc_storeStrong(&v146, 0);
      if (v158) {
        goto LABEL_83;
      }
    }
    char v164 = v155 & 1;
    int v158 = 1;
    goto LABEL_83;
  }
  os_log_t oslog = (os_log_t)(id)AXLogAppAccessibility();
  os_log_type_t type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v177, (uint64_t)v161);
    _os_log_impl(&dword_2402B7000, oslog, type, "Scrolling disabled for parent: %@", v177, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  char v164 = 0;
  int v158 = 1;
LABEL_84:
  objc_storeStrong(&v161, 0);
  objc_storeStrong(location, 0);
  return v164 & 1;
}

id __77__UITableViewCellAccessibilityElement_accessibilityScrollToVisibleWithChild___block_invoke(uint64_t a1)
{
  CGFloat v1 = objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", @"tableViewCell", a1, a1);

  return v1;
}

id __77__UITableViewCellAccessibilityElement_accessibilityScrollToVisibleWithChild___block_invoke_2(uint64_t a1)
{
  id v6 = (id)[*(id *)(a1 + 32) _accessibilityWindow];
  id v5 = (id)[v6 firstResponder];
  char v7 = [v5 _accessibilityIsDescendantOfElement:*(void *)(a1 + 32)];

  if ((v7 & 1) == 0) {
    _UIAXDismissKeyboardIfNecessary();
  }
  id v1 = self;
  CGFloat v2 = self;

  return v2;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  _NSRange v6 = a3;
  id v5 = self;
  location[1] = (id)a2;
  location[0] = [(UITableViewCellAccessibilityElement *)self _accessibilityTextViewTextOperationResponder];
  if (location[0])
  {
    objc_msgSend(location[0], "_accessibilitySetSelectedTextRange:", v6.location, v6.length);
  }
  else
  {
    id v3 = [(UITableViewCellAccessibilityElement *)v5 tableViewCell];
    -[UITableViewCell _accessibilitySetSelectedTextRange:](v3, "_accessibilitySetSelectedTextRange:", v6.location, v6.length);
  }
  objc_storeStrong(location, 0);
}

- (_NSRange)_accessibilitySelectedTextRange
{
  CGFloat v8 = self;
  location[1] = (id)a2;
  location[0] = [(UITableViewCellAccessibilityElement *)self _accessibilityTextViewTextOperationResponder];
  if (location[0])
  {
    uint64_t v9 = [location[0] _accessibilitySelectedTextRange];
    NSUInteger v10 = v2;
  }
  else
  {
    _NSRange v6 = [(UITableViewCellAccessibilityElement *)v8 tableViewCell];
    uint64_t v9 = [(UITableViewCell *)v6 _accessibilitySelectedTextRange];
    NSUInteger v10 = v3;
  }
  objc_storeStrong(location, 0);
  NSUInteger v4 = v9;
  NSUInteger v5 = v10;
  result.length = v5;
  result.id location = v4;
  return result;
}

- (BOOL)_accessibilityCanBecomeNativeFocused
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  char v4 = [(UITableViewCell *)v3 _accessibilityCanBecomeNativeFocused];

  return v4 & 1;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 _accessibilityTextViewTextOperationResponder];

  return v4;
}

- (id)_accessibilityTextOperations
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 _accessibilityTextOperations];

  return v4;
}

- (void)_accessibilityCopy
{
  NSUInteger v2 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  [(UITableViewCell *)v2 _accessibilityCopy];
}

- (void)_accessibilityCut
{
  NSUInteger v2 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  [(UITableViewCell *)v2 _accessibilityCut];
}

- (void)accessibilityElementDidBecomeFocused
{
  NSUInteger v2 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  [(UITableViewCell *)v2 accessibilityElementDidBecomeFocused];
}

- (void)accessibilityElementDidLoseFocus
{
  NSUInteger v2 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  [(UITableViewCell *)v2 accessibilityElementDidLoseFocus];
}

- (void)_accessibilitySelect
{
  NSUInteger v2 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  [(UITableViewCell *)v2 _accessibilitySelect];
}

- (BOOL)_accessibilityCanPerformEscapeAction
{
  if (!_accessibilityCanPerformEscapeAction_BaseNSObjectMethod_0)
  {
    NSUInteger v2 = (objc_class *)objc_opt_class();
    _accessibilityCanPerformEscapeAction_BaseNSObjectMethod_0 = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityPerformEscape);
  }
  NSUInteger v5 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  NSUInteger v3 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v3, sel_accessibilityPerformEscape);

  BOOL v7 = 0;
  if (InstanceMethod) {
    return InstanceMethod != (Method)_accessibilityCanPerformEscapeAction_BaseNSObjectMethod_0;
  }
  return v7;
}

- (BOOL)accessibilityPerformEscape
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  char v4 = [(UITableViewCell *)v3 accessibilityPerformEscape];

  return v4 & 1;
}

- (BOOL)accessibilityPerformMagicTap
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  char v4 = [(UITableViewCell *)v3 accessibilityPerformMagicTap];

  return v4 & 1;
}

- (void)_accessibilityPaste
{
  NSUInteger v2 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  [(UITableViewCell *)v2 _accessibilityPaste];
}

- (void)_accessibilitySelectAll
{
  NSUInteger v2 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  [(UITableViewCell *)v2 _accessibilitySelectAll];
}

- (void)_accessibilityUndo
{
  NSUInteger v2 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  [(UITableViewCell *)v2 _accessibilityUndo];
}

- (void)_accessibilityRedo
{
  NSUInteger v2 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  [(UITableViewCell *)v2 _accessibilityRedo];
}

- (BOOL)_accessibilityHasTextOperations
{
  NSUInteger v5 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v2 = (id)[(UITableViewCell *)v5 _accessibilityIndexPath];
  BOOL v6 = v2 == 0;

  if (v6) {
    return 0;
  }
  char v4 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  BOOL v8 = [(UITableViewCell *)v4 _accessibilityHasTextOperations] & 1;

  return v8;
}

- (id)_accessibilityAbsoluteValue
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 _accessibilityAbsoluteValue];

  return v4;
}

- (BOOL)_allowCustomActionHintSpeakOverride
{
  return 0;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  id v4 = [(UITableViewCellAccessibilityElement *)self realTableViewCell];
  uint64_t v5 = [(UITableViewCell *)v4 accessibilityTraits];

  if ((v5 & (*MEMORY[0x263F1CF20] | *MEMORY[0x263F21B20])) != 0) {
    return 0;
  }
  if ([(UITableViewCellAccessibilityElement *)self isAccessibilityElement]) {
    return 1;
  }
  char v6 = 0;
  char isKindOfClass = 0;
  if ([(NSMutableArray *)self->_mockChildren count] == 1)
  {
    id v7 = (id)[(NSMutableArray *)self->_mockChildren lastObject];
    char v6 = 1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  if (v6) {

  }
  return (isKindOfClass & 1) != 0;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (int64_t)_accessibilityScannerActivateBehavior
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  int64_t v4 = [(UITableViewCell *)v3 _accessibilityScannerActivateBehavior];

  return v4;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  char v4 = [(UITableViewCell *)v3 _accessibilityIsSpeakThisElement];

  return v4 & 1;
}

- (id)_accessibilityTableViewCellContentSubviews
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 _accessibilityTableViewCellContentSubviews];

  return v4;
}

- (id)_accessibilitySpeakThisString
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 _accessibilitySpeakThisString];

  return v4;
}

- (id)_accessibilitySemanticContextForElement:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(UITableViewCellAccessibilityElement *)v7 tableViewCell];
  id v5 = (id)[(UITableViewCell *)v4 _accessibilitySemanticContextForElement:location[0]];

  objc_storeStrong(location, 0);

  return v5;
}

- (BOOL)_accessibilitySetNativeFocus
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self realTableViewCell];
  char v4 = [(UITableViewCell *)v3 _accessibilitySetNativeFocus];

  return v4 & 1;
}

- (BOOL)_accessibilityViewHierarchyHasNativeFocus
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self realTableViewCell];
  char v4 = [(UITableViewCell *)v3 _accessibilityViewHierarchyHasNativeFocus];

  return v4 & 1;
}

- (BOOL)_accessibilityHasNativeFocus
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self realTableViewCell];
  char v4 = [(UITableViewCell *)v3 _accessibilityHasNativeFocus];

  return v4 & 1;
}

- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self realTableViewCell];
  char v4 = [(UITableViewCell *)v3 _accessibilityShouldIncludeRowRangeInElementDescription];

  return v4 & 1;
}

- (unint64_t)_accessibilityScanningBehaviorTraits
{
  return 8;
}

- (id)accessibilityUserInputLabels
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self realTableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 accessibilityUserInputLabels];

  return v4;
}

- (id)accessibilityCustomActions
{
  NSUInteger v3 = [(UITableViewCellAccessibilityElement *)self realTableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 accessibilityCustomActions];

  return v4;
}

- (id)_privateAccessibilityCustomActions
{
  NSUInteger v10 = self;
  SEL v9 = a2;
  *(_DWORD *)&v8[8] = 0;
  id v2 = [(UITableViewCellAccessibilityElement *)self realTableViewCell];
  *(void *)BOOL v8 = v2 == 0;

  if ((v8[0] & 1) == 0)
  {
    id v7 = [(UITableViewCellAccessibilityElement *)v10 realTableViewCell];
    id v3 = (id)[(UITableViewCell *)v7 _privateAccessibilityCustomActions];
    id v4 = *(void **)&v8[4];
    *(void *)&v8[4] = v3;
  }
  id v6 = *(id *)&v8[4];
  objc_storeStrong((id *)&v8[4], 0);

  return v6;
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  id v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  char v4 = [(UITableViewCell *)v3 _accessibilityRetainsCustomRotorActionSetting];

  return v4 & 1;
}

- (id)accessibilityDragSourceDescriptors
{
  id v3 = [(UITableViewCellAccessibilityElement *)self realTableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 accessibilityDragSourceDescriptors];

  return v4;
}

- (id)accessibilityDropPointDescriptors
{
  id v3 = [(UITableViewCellAccessibilityElement *)self realTableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 accessibilityDropPointDescriptors];

  return v4;
}

- (id)_accessibilityCapturedImages
{
  id v3 = [(UITableViewCellAccessibilityElement *)self tableViewCell];
  id v4 = (id)[(UITableViewCell *)v3 _accessibilityCapturedImages];

  return v4;
}

- (void)setIndexPath:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setTableViewCell:(id)a3
{
}

- (uint64_t)usingRealTableViewCell
{
  if (a1) {
    char v2 = *(unsigned char *)(a1 + 80) & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (void).cxx_destruct
{
}

@end