@interface UIAccessibilityElementMockView
- (BOOL)_accessibilityCanPerformEscapeAction;
- (BOOL)_accessibilityHasNativeFocus;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilityIsScannerGroup;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_accessibilityUpdatesSwitchMenu;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isAccessibilityElement;
- (CGPoint)_accessibilityMaxScrubberPosition;
- (CGPoint)_accessibilityMinScrubberPosition;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3;
- (CGRect)accessibilityFrame;
- (_NSRange)_accessibilityCharacterRangeForPosition:(unint64_t)a3;
- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3;
- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3;
- (_NSRange)_accessibilitySelectedTextRange;
- (_NSRange)_accessibilityVisibleTextRange;
- (_NSRange)accessibilityRowRange;
- (double)_accessibilityMaxValue;
- (double)_accessibilityMinValue;
- (id)_accessibilityAbsoluteValue;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3;
- (id)_accessibilityScannerGroupElements;
- (id)_accessibilityScrollAncestor;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)_accessibilityUserTestingElementType;
- (id)_accessibilityUserTestingParent;
- (id)_accessibilityUserTestingProxyView;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomRotors;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (id)accessibilityIdentification;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityLanguage;
- (id)accessibilityValue;
- (id)automationElements;
- (id)description;
- (id)setDelegate:(id *)result;
- (int64_t)_accessibilityPageCount;
- (int64_t)_accessibilityPageIndex;
- (int64_t)accessibilityCompareGeometry:(id)a3;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
- (uint64_t)setSubviewIndex:(uint64_t)result;
- (uint64_t)subviewIndex;
- (uint64_t)view;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)_accessibilityPositionInDirection:(int64_t)a3 offset:(unint64_t)a4 forPosition:(unint64_t)a5;
- (unint64_t)_accessibilityScannerGroupTraits;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)_accessibilitySetValue:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityElementDidLoseFocus;
- (void)accessibilityIncrement;
- (void)dealloc;
- (void)revalidate;
- (void)setAccessibilityContainer:(id)a3;
- (void)setView:(id *)a1;
@end

@implementation UIAccessibilityElementMockView

- (void)setView:(id *)a1
{
  v5 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    objc_msgSend(v5[9], "setAccessibilityContainer:");
    [location setAccessibilityContainer:0];
    objc_storeStrong(v5 + 9, location);
    id v2 = v5[9];
    id v3 = (id)[v5 accessibilityContainer];
    objc_msgSend(v2, "setAccessibilityContainer:");
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v9 = self;
  SEL v8 = a2;
  SEL v7 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  char v5 = [(UIView *)v9->_view canPerformAction:v7 withSender:location];
  objc_storeStrong(&location, 0);
  return v5 & 1;
}

- (id)_accessibilityScrollAncestor
{
  return (id)[(UIView *)self->_view _accessibilityScrollAncestor];
}

- (id)accessibilityCustomRotors
{
  return (id)[(UIView *)self->_view accessibilityCustomRotors];
}

- (id)accessibilityCustomActions
{
  return (id)[(UIView *)self->_view accessibilityCustomActions];
}

- (void)_accessibilitySetValue:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UIView *)v4->_view _accessibilitySetValue:location[0]];
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return [(UIView *)self->_view _accessibilitySupportsActivateAction] & 1;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  v15 = self;
  SEL v14 = a2;
  unint64_t v13 = a3;
  char v12 = 0;
  id location = self->_view;
  while (1)
  {
    BOOL v9 = 0;
    if ((v12 & 1) == 0)
    {
      objc_opt_class();
      BOOL v9 = 0;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        BOOL v9 = location != 0;
      }
    }
    if (!v9) {
      break;
    }
    char v12 = [location accessibilityScroll:v13] & 1;
    if (!v12 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (v13 <= 1)
      {
        unint64_t v4 = v13 - 1;
        char v3 = 0;
      }
      else
      {
        unint64_t v4 = v13 - 1;
        char v3 = 1;
      }
      if ((v3 & 1) == 0)
      {
        switch(v4)
        {
          case 0uLL:
            unsigned int v10 = 3;
            goto LABEL_17;
          case 1uLL:
            unsigned int v10 = 2;
            goto LABEL_17;
          case 2uLL:
            break;
          case 3uLL:
            unsigned int v10 = 1;
            goto LABEL_17;
          default:
            JUMPOUT(0);
        }
      }
      unsigned int v10 = 0;
LABEL_17:
      char v12 = [location _accessibilityScrollPageInDirection:v10] & 1;
    }
    id v5 = (id)[location superview];
    id v6 = location;
    id location = v5;
  }
  if (v12) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  char v8 = v12;
  objc_storeStrong(&location, 0);
  return v8 & 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v8 = a3;
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  id v5 = (id)-[UIView _accessibilityHitTest:withEvent:](v7->_view, "_accessibilityHitTest:withEvent:", location[0], v8.x, v8.y);
  objc_storeStrong(location, 0);

  return v5;
}

- (id)_accessibilityUserTestingProxyView
{
  return self->_view;
}

- (void)revalidate
{
  uint64_t v8 = a1;
  if (a1)
  {
    id v1 = (id)AXRetainAutorelease();
    id WeakRetained = objc_loadWeakRetained((id *)(v8 + 56));
    BOOL v6 = WeakRetained == 0;

    if (!v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id location = (id)[*(id *)(v8 + 72) superview];
        if (!location || ([*(id *)(v8 + 72) isHiddenOrHasHiddenAncestor] & 1) != 0)
        {
          objc_msgSend(*(id *)(v8 + 72), "setAccessibilityContainer:", 0x268C86000uLL, 0);
          objc_storeStrong((id *)(v8 + *(int *)(v3 + 360)), obj);
          id v5 = objc_loadWeakRetained((id *)(v8 + 56));
          [v5 updateMockView:v8];
        }
        objc_storeStrong(&location, 0);
      }
      else
      {
        objc_storeStrong((id *)(v8 + 72), 0);
      }
    }
  }
}

- (BOOL)isAccessibilityElement
{
  return [(UIView *)self->_view isAccessibilityElement] & 1;
}

- (id)accessibilityLabel
{
  return (id)[(UIView *)self->_view _accessibilityAXAttributedLabel];
}

- (id)accessibilityLanguage
{
  return (id)[(UIView *)self->_view accessibilityLanguage];
}

- (_NSRange)accessibilityRowRange
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  NSUInteger v2 = [(UIView *)self->_view accessibilityRowRange];
  result.length = v3;
  result.id location = v2;
  return result;
}

- (unint64_t)_accessibilityAutomationType
{
  return [(UIView *)self->_view _accessibilityAutomationType];
}

- (id)accessibilityIdentification
{
  return (id)[(UIView *)self->_view accessibilityIdentification];
}

- (id)accessibilityIdentifier
{
  return (id)[(UIView *)self->_view accessibilityIdentifier];
}

- (id)accessibilityValue
{
  return (id)[(UIView *)self->_view _accessibilityAXAttributedValue];
}

- (id)_accessibilityAbsoluteValue
{
  return (id)[(UIView *)self->_view _accessibilityAbsoluteValue];
}

- (double)_accessibilityMaxValue
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  [(UIView *)self->_view _accessibilityMaxValue];
  return result;
}

- (double)_accessibilityMinValue
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  [(UIView *)self->_view _accessibilityMinValue];
  return result;
}

- (id)_accessibilityUserTestingElementType
{
  NSUInteger v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (CGPoint)accessibilityActivationPoint
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  [(UIView *)self->_view accessibilityActivationPoint];
  *(void *)&long long v11 = v2;
  *((void *)&v11 + 1) = v3;
  unint64_t v4 = [(UIView *)self->_view superview];
  BOOL v10 = v4 != 0;

  if (v10)
  {
    long long v13 = v11;
  }
  else
  {
    id v9 = (id)[(UIAccessibilityElementMockView *)self accessibilityContainer];
    [v9 accessibilityActivationPoint];
    *(void *)&long long v13 = v5;
    *((void *)&v13 + 1) = v6;
  }
  double v8 = *((double *)&v13 + 1);
  double v7 = *(double *)&v13;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGRect)accessibilityFrame
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  [(UIView *)self->_view accessibilityFrame];
  *(CGFloat *)&long long v14 = v16.origin.x;
  *((void *)&v14 + 1) = *(void *)&v16.origin.y;
  *(CGFloat *)&long long v15 = v16.size.width;
  *((void *)&v15 + 1) = *(void *)&v16.size.height;
  if (CGRectIsEmpty(v16))
  {
    id v10 = (id)[(UIAccessibilityElementMockView *)self accessibilityContainer];
    [v10 accessibilityFrame];
    *(void *)&long long v11 = v2;
    *((void *)&v11 + 1) = v3;
    *(void *)&long long v12 = v4;
    *((void *)&v12 + 1) = v5;
    long long v14 = v11;
    long long v15 = v12;
  }
  double v7 = *((double *)&v14 + 1);
  double v6 = *(double *)&v14;
  double v9 = *((double *)&v15 + 1);
  double v8 = *(double *)&v15;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (unint64_t)accessibilityTraits
{
  double v7 = self;
  SEL v6 = a2;
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  id v5 = 0;
  v4.receiver = v7;
  v4.super_class = (Class)UIAccessibilityElementMockView;
  id v5 = [(UIAccessibilityElementMockView *)&v4 accessibilityTraits];
  unint64_t v3 = (unint64_t)v5;
  return v3 | [(UIView *)v7->_view accessibilityTraits];
}

- (id)accessibilityHint
{
  return (id)[(UIView *)self->_view _accessibilityAXAttributedHint];
}

- (BOOL)_accessibilityHasNativeFocus
{
  return [(UIView *)self->_view _accessibilityHasNativeFocus] & 1;
}

- (void)accessibilityElementDidLoseFocus
{
}

- (void)accessibilityElementDidBecomeFocused
{
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return [(UIView *)self->_view _accessibilityHitTestShouldFallbackToNearestChild] & 1;
}

- (id)accessibilityElements
{
  return (id)[(UIView *)self->_view accessibilityElements];
}

- (BOOL)_accessibilityScrollToVisible
{
  SEL v6 = self;
  SEL v5 = a2;
  id v3 = (id)[(UIAccessibilityElementMockView *)self _accessibilityAncestorIsKindOf:objc_opt_class()];

  if (v3)
  {
    v4.receiver = v6;
    v4.super_class = (Class)UIAccessibilityElementMockView;
    char v7 = [(UIAccessibilityElementMockView *)&v4 _accessibilityScrollToVisible];
  }
  else
  {
    char v7 = [(UIView *)v6->_view _accessibilityScrollToVisible] & 1;
  }
  return v7 & 1;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)[(UIView *)self->_view _accessibilityTextViewTextOperationResponder];
}

- (CGPoint)_accessibilityMinScrubberPosition
{
  [(UIView *)self->_view _accessibilityMinScrubberPosition];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)_accessibilityMaxScrubberPosition
{
  [(UIView *)self->_view _accessibilityMaxScrubberPosition];
  result.y = v3;
  result.x = v2;
  return result;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  NSUInteger v2 = [(UIView *)self->_view _accessibilitySelectedTextRange];
  result.length = v3;
  result.id location = v2;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
}

- (_NSRange)_accessibilityVisibleTextRange
{
  NSUInteger v2 = [(UIView *)self->_view _accessibilityVisibleTextRange];
  result.length = v3;
  result.id location = v2;
  return result;
}

- (BOOL)accessibilityPerformMagicTap
{
  return [(UIView *)self->_view accessibilityPerformMagicTap] & 1;
}

- (BOOL)_accessibilityCanPerformEscapeAction
{
  if ([(UIView *)self->_view safeBoolForKey:@"_accessibilityUIViewCanPerformEscapeAction"]) {
    return 1;
  }
  if (!_accessibilityCanPerformEscapeAction_BaseNSObjectMethod)
  {
    NSUInteger v2 = (objc_class *)objc_opt_class();
    _accessibilityCanPerformEscapeAction_BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityPerformEscape);
  }
  NSUInteger v3 = (objc_class *)objc_opt_class();
  return class_getInstanceMethod(v3, sel_accessibilityPerformEscape) != (Method)_accessibilityCanPerformEscapeAction_BaseNSObjectMethod;
}

- (BOOL)accessibilityPerformEscape
{
  return [(UIView *)self->_view accessibilityPerformEscape] & 1;
}

- (BOOL)accessibilityActivate
{
  return [(UIView *)self->_view accessibilityActivate] & 1;
}

- (BOOL)becomeFirstResponder
{
  if (objc_opt_respondsToSelector()) {
    return [(UIView *)self->_view becomeFirstResponder] & 1;
  }
  else {
    return 0;
  }
}

- (int64_t)_accessibilityPageCount
{
  return [(UIView *)self->_view _accessibilityPageCount];
}

- (int64_t)_accessibilityPageIndex
{
  return [(UIView *)self->_view _accessibilityPageIndex];
}

- (void)setAccessibilityContainer:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIAccessibilityElementMockView;
  [(UIAccessibilityElementMockView *)&v3 setAccessibilityContainer:location[0]];
  [(UIView *)v5->_view setAccessibilityContainer:location[0]];
  objc_storeStrong(location, 0);
}

- (id)_accessibilityUserTestingParent
{
  return (id)[(UIView *)self->_view _accessibilityUserTestingParent];
}

- (id)automationElements
{
  return (id)[(UIView *)self->_view automationElements];
}

- (void)dealloc
{
  objc_super v4 = self;
  SEL v3 = a2;
  [(UIView *)self->_view setAccessibilityContainer:0];
  v2.receiver = v4;
  v2.super_class = (Class)UIAccessibilityElementMockView;
  [(UIAccessibilityElementMockView *)&v2 dealloc];
}

- (int64_t)accessibilityCompareGeometry:(id)a3
{
  SEL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v4 = [(UIView *)v6->_view accessibilityCompareGeometry:location[0]];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)description
{
  long long v11 = self;
  v10[1] = (id)a2;
  v10[0] = self->_view;
  id v9 = (id)[NSString stringWithFormat:@"$%@$", v10[0]];
  v7.receiver = v11;
  v7.super_class = (Class)UIAccessibilityElementMockView;
  id location = [(UIAccessibilityElementMockView *)&v7 description];
  SEL v5 = NSString;
  id v6 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = 0;
  }
  else {
    id v4 = location;
  }
  id v3 = (id)[v5 stringWithFormat:@"%@ %@", v6, v4];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);

  return v3;
}

- (int64_t)accessibilityElementCount
{
  return [(UIView *)self->_view accessibilityElementCount];
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  return (id)[(UIView *)self->_view accessibilityElementAtIndex:a3];
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UIAccessibilityElementMockView revalidate]((uint64_t)v6);
  int64_t v4 = [(UIView *)v6->_view indexOfAccessibilityElement:location[0]];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_accessibilityScannerGroupElements
{
  return (id)[(UIView *)self->_view _accessibilityScannerGroupElements];
}

- (BOOL)_accessibilityIsScannerGroup
{
  return [(UIView *)self->_view _accessibilityIsScannerGroup] & 1;
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  return [(UIView *)self->_view _accessibilityScannerGroupTraits];
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  BOOL v4 = 0;
  unint64_t v2 = [(UIAccessibilityElementMockView *)self accessibilityTraits];
  if ((v2 & *MEMORY[0x263F813E8]) == 0) {
    return [(UIView *)self->_view accessibilityRespondsToUserInteraction] & 1;
  }
  return v4;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return [(UIView *)self->_view _accessibilityIsSpeakThisElement] & 1;
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  return (id)-[UIView _accessibilityLineNumberAndColumnForPoint:](self->_view, "_accessibilityLineNumberAndColumnForPoint:", a3.x, a3.y, a2, self, *(void *)&a3.x, *(void *)&a3.y);
}

- (BOOL)_accessibilityUpdatesSwitchMenu
{
  return [(UIView *)self->_view _accessibilityUpdatesSwitchMenu] & 1;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  -[UIView _accessibilityBoundsForRange:](self->_view, "_accessibilityBoundsForRange:", a3.location, a3.length, a2, self, a3.location, a3.length);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (_NSRange)_accessibilityCharacterRangeForPosition:(unint64_t)a3
{
  NSUInteger v3 = [(UIView *)self->_view _accessibilityCharacterRangeForPosition:a3];
  result.length = v4;
  result.id location = v3;
  return result;
}

- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3
{
  NSUInteger v3 = [(UIView *)self->_view _accessibilityLineRangeForPosition:a3];
  result.length = v4;
  result.id location = v3;
  return result;
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  objc_super v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v8 = [(UIView *)v7->_view _accessibilityRangeForLineNumberAndColumn:location[0]];
  NSUInteger v9 = v3;
  objc_storeStrong(location, 0);
  NSUInteger v4 = v8;
  NSUInteger v5 = v9;
  result.length = v5;
  result.id location = v4;
  return result;
}

- (unint64_t)_accessibilityPositionInDirection:(int64_t)a3 offset:(unint64_t)a4 forPosition:(unint64_t)a5
{
  return [(UIView *)self->_view _accessibilityPositionInDirection:a3 offset:a4 forPosition:a5];
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)setDelegate:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 7, a2);
  }
  return result;
}

- (uint64_t)subviewIndex
{
  if (a1) {
    return *(void *)(a1 + 64);
  }
  else {
    return 0;
  }
}

- (uint64_t)setSubviewIndex:(uint64_t)result
{
  if (result) {
    *(void *)(result + 64) = a2;
  }
  return result;
}

- (uint64_t)view
{
  if (a1) {
    return *(void *)(a1 + 72);
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end