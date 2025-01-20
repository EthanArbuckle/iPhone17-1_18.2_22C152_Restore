@interface UITextInputUIResponderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHandlesTabKey;
- (BOOL)_accessibilityInsertTextWithAlternatives:(id)a3;
- (BOOL)_accessibilityIsFKARunningForFocusItem;
- (BOOL)_axShouldDrawFocusAroundFirstResponder;
- (BOOL)becomeFirstResponder;
- (BOOL)isAccessibilityElement;
- (BOOL)resignFirstResponder;
- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3;
- (_NSRange)_accessibilityCharacterRangeForPosition:(unint64_t)a3;
- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3;
- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3;
- (_NSRange)_accessibilityRawRangeForUITextRange:(id)a3;
- (_NSRange)_accessibilitySelectedTextRange;
- (_NSRange)_accessibilityVisibleTextRange;
- (id)_accessibilityAlternativesForTextAtPosition:(unint64_t)a3;
- (id)_accessibilityBeginningOfDocument;
- (id)_accessibilityEndOfDocument;
- (id)_accessibilityFocusItemForResponder;
- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3;
- (id)_accessibilityPositionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)_accessibilitySpeakThisString;
- (id)_accessibilityTextRangeFromNSRange:(_NSRange)a3;
- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3;
- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3 string:(id)a4 wantsSentences:(BOOL)a5;
- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3 wantsSentences:(BOOL)a4;
- (id)_accessibilityTextResponder;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)_axTextInputView;
- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4;
- (id)_moveRight:(BOOL)a3 withHistory:(id)a4;
- (id)accessibilityValue;
- (int64_t)_accessibilityLineEndPosition;
- (int64_t)_accessibilityLineStartPosition;
- (int64_t)_accessibilityOffsetFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)_accessibilityTextInputLinePosition:(BOOL)a3;
- (unint64_t)_accessibilityPositionInDirection:(int64_t)a3 offset:(unint64_t)a4 forPosition:(unint64_t)a5;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityCheckBorderHit:(char)a3 left:;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)_axDrawFocusRingAroundFirstResponderAndMoveFocus:(void *)a1;
- (void)_axResetFKAFocusToFirstResponder;
- (void)_updateSelectionWithTextRange:(id)a3 withAffinityDownstream:(BOOL)a4;
@end

@implementation UITextInputUIResponderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NSObject";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  id v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = "@";
  [location[0] validateClass:@"UIKeyboardCandidateController" hasInstanceMethod:@"firstNonEmptyActiveCandidateView" withFullSignature:0];
  v3 = @"UIKeyboardImpl";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_keyboardBehaviorState", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"keyboardStateManager", v6, 0);
  [location[0] validateClass:@"_UIKeyboardStateManager" hasInstanceVariable:@"m_candidateList" withType:"<UIKeyboardCandidateList>"];
  v4 = "B";
  v5 = @"_visibleRangeWithLayout:";
  v7 = "{_NSRange=QQ}";
  [location[0] validateClass:@"UITextView" hasInstanceMethod:"B" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITextField", v5, v7, v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIResponder", @"_nsrangeForTextRange:", v7, v6, 0);
  objc_storeStrong(v9, v8);
}

- (void)_updateSelectionWithTextRange:(id)a3 withAffinityDownstream:(BOOL)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v8 = a4;
  v6 = (UIAccessibilityNotifications *)MEMORY[0x263F81340];
  _UIAccessibilityBlockPostingOfNotification();
  v7.receiver = v10;
  v7.super_class = (Class)UITextInputUIResponderAccessibility;
  [(UITextInputUIResponderAccessibility *)&v7 _updateSelectionWithTextRange:location[0] withAffinityDownstream:a4];
  _UIAccessibilityUnblockPostingOfNotification();
  id v5 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityResponderElementForFocus];
  _UIAccessibilitySetAssociatedElementContextForNextNotification();

  UIAccessibilityPostNotification(*v6, 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityTextResponder
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextInputUIResponderAccessibility *)self accessibilityTextInputResponder];
  if (location[0]) {
    v2 = (UITextInputUIResponderAccessibility *)location[0];
  }
  else {
    v2 = v6;
  }
  v4 = v2;
  objc_storeStrong(location, 0);

  return v4;
}

- (void)_accessibilityCheckBorderHit:(char)a3 left:
{
  id v14 = a1;
  char v13 = a2 & 1;
  char v12 = a3 & 1;
  if (a1)
  {
    id v11 = (id)[v14 safeValueForKey:@"_selectableText"];
    id v3 = (id)[v11 selectedTextRange];
    BOOL v7 = v3 != 0;

    if (v7)
    {
      id v9 = (id)[v11 selectedTextRange];
      id location = (id)[v9 start];
      if ([v9 isEmpty] & 1) != 0 || (v13)
      {
        if (v12) {
          uint64_t v4 = 3;
        }
        else {
          uint64_t v4 = 2;
        }
        id v5 = (id)[v11 positionFromPosition:location inDirection:v4 offset:1];
        id v6 = location;
        id location = v5;
      }
      if (!location) {
        UIAccessibilityPostNotification(*MEMORY[0x263F81340], 0);
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v9, 0);
      int v10 = 0;
    }
    else
    {
      int v10 = 1;
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4
{
  int v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  -[UITextInputUIResponderAccessibility _accessibilityCheckBorderHit:left:](v10, v8, 1);
  v6.receiver = v10;
  v6.super_class = (Class)UITextInputUIResponderAccessibility;
  id v5 = [(UITextInputUIResponderAccessibility *)&v6 _moveLeft:v8 withHistory:location];
  objc_storeStrong(&location, 0);

  return v5;
}

- (id)_moveRight:(BOOL)a3 withHistory:(id)a4
{
  int v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  -[UITextInputUIResponderAccessibility _accessibilityCheckBorderHit:left:](v10, v8, 0);
  v6.receiver = v10;
  v6.super_class = (Class)UITextInputUIResponderAccessibility;
  id v5 = [(UITextInputUIResponderAccessibility *)&v6 _moveRight:v8 withHistory:location];
  objc_storeStrong(&location, 0);

  return v5;
}

- (BOOL)isAccessibilityElement
{
  int v10 = self;
  SEL v9 = a2;
  id v5 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  char v6 = objc_msgSend(v5, "__accessibilityRespondsToTextInput");

  if (v6)
  {
    id v3 = [(UITextInputUIResponderAccessibility *)v10 _accessibilityTextResponder];
    char v4 = objc_msgSend(v3, "__accessibilityRespondsToTextInput");

    if (v4)
    {
      return 1;
    }
    else
    {
      v7.receiver = v10;
      v7.super_class = (Class)UITextInputUIResponderAccessibility;
      return [(UITextInputUIResponderAccessibility *)&v7 isAccessibilityElement];
    }
  }
  else
  {
    v8.receiver = v10;
    v8.super_class = (Class)UITextInputUIResponderAccessibility;
    return [(UITextInputUIResponderAccessibility *)&v8 isAccessibilityElement];
  }
}

- (int64_t)_accessibilityTextInputLinePosition:(BOOL)a3
{
  v22 = self;
  SEL v21 = a2;
  BOOL v20 = a3;
  id v19 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  id v18 = (id)[v19 safeValueForKey:@"selectedTextRange"];
  id v17 = (id)[v19 tokenizer];
  id v16 = 0;
  id v15 = (id)[v18 start];
  id v14 = (id)[v18 end];
  id v12 = [(UITextInputUIResponderAccessibility *)v22 _accessibilityTextResponder];
  id location = (id)[v12 _accessibilityBeginningOfDocument];

  if (v20 && ([v15 isEqual:location] & 1) != 0)
  {
    int64_t v23 = 0;
  }
  else
  {
    if (v20)
    {
      id v3 = (id)[v17 positionFromPosition:v14 toBoundary:4 inDirection:1];
      id v4 = v14;
      id v14 = v3;

      if (!v14)
      {
        int64_t v23 = 0x7FFFFFFFLL;
        goto LABEL_16;
      }
      id v5 = (id)[v19 textRangeFromPosition:v15 toPosition:v14];
      id v6 = v16;
      id v16 = v5;
    }
    else
    {
      if ([v17 isPosition:v14 atBoundary:4 inDirection:0])
      {
        id v11 = [(UITextInputUIResponderAccessibility *)v22 _accessibilityTextResponder];
        int64_t v23 = [v11 _accessibilityOffsetFromPosition:location toPosition:v14];

        goto LABEL_16;
      }
      if (!v14)
      {
        int64_t v23 = 0x7FFFFFFFLL;
        goto LABEL_16;
      }
      id v7 = (id)[v17 rangeEnclosingPosition:v14 withGranularity:4 inDirection:0];
      id v8 = v16;
      id v16 = v7;
    }
    if (v16)
    {
      id v10 = [(UITextInputUIResponderAccessibility *)v22 _accessibilityTextResponder];
      int64_t v23 = [v10 _accessibilityOffsetFromPosition:location toPosition:v14];
    }
    else
    {
      int64_t v23 = 0x7FFFFFFFLL;
    }
  }
LABEL_16:
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  return v23;
}

- (int64_t)_accessibilityLineEndPosition
{
  id v8 = self;
  SEL v7 = a2;
  id v4 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  char v5 = objc_msgSend(v4, "__accessibilityRespondsToTextInput");

  if (v5)
  {
    id v3 = [(UITextInputUIResponderAccessibility *)v8 _accessibilityTextResponder];
    int64_t v9 = [v3 _accessibilityTextInputLinePosition:0];
  }
  else
  {
    v6.receiver = v8;
    v6.super_class = (Class)UITextInputUIResponderAccessibility;
    return [(UITextInputUIResponderAccessibility *)&v6 _accessibilityLineEndPosition];
  }
  return v9;
}

- (int64_t)_accessibilityLineStartPosition
{
  id v8 = self;
  SEL v7 = a2;
  id v4 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  char v5 = objc_msgSend(v4, "__accessibilityRespondsToTextInput");

  if (v5)
  {
    id v3 = [(UITextInputUIResponderAccessibility *)v8 _accessibilityTextResponder];
    int64_t v9 = [v3 _accessibilityTextInputLinePosition:1];
  }
  else
  {
    v6.receiver = v8;
    v6.super_class = (Class)UITextInputUIResponderAccessibility;
    return [(UITextInputUIResponderAccessibility *)&v6 _accessibilityLineStartPosition];
  }
  return v9;
}

- (_NSRange)_accessibilityCharacterRangeForPosition:(unint64_t)a3
{
  int64_t v23 = self;
  SEL v22 = a2;
  unint64_t v21 = a3;
  id v12 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  char v13 = objc_msgSend(v12, "__accessibilityRespondsToTextInput");

  if (v13)
  {
    if (v21 == 0x7FFFFFFF || v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v24 = 0x7FFFFFFFLL;
      NSUInteger v25 = 0;
    }
    else
    {
      id v19 = [(UITextInputUIResponderAccessibility *)v23 _accessibilityTextResponder];
      id v11 = [(UITextInputUIResponderAccessibility *)v23 _accessibilityTextResponder];
      id v18 = (id)[v11 _accessibilityBeginningOfDocument];

      if (v18)
      {
        id v10 = [(UITextInputUIResponderAccessibility *)v23 _accessibilityTextResponder];
        id v16 = (id)[v10 _accessibilityPositionFromPosition:v18 offset:v21];

        if (v16)
        {
          id v15 = (id)[v19 tokenizer];
          id location = (id)objc_msgSend(v15, "positionFromPosition:toBoundary:inDirection:", v16, 0);
          if (location)
          {
            id v6 = [(UITextInputUIResponderAccessibility *)v23 _accessibilityTextResponder];
            uint64_t v7 = [v6 _accessibilityOffsetFromPosition:v18 toPosition:v16];

            id v8 = [(UITextInputUIResponderAccessibility *)v23 _accessibilityTextResponder];
            uint64_t v9 = [v8 _accessibilityOffsetFromPosition:v18 toPosition:location];

            uint64_t v27 = v7;
            uint64_t v26 = v9 - v7;
            uint64_t v28 = v7;
            uint64_t v29 = v9 - v7;
            uint64_t v24 = v7;
            NSUInteger v25 = v9 - v7;
          }
          else
          {
            uint64_t v31 = 0x7FFFFFFFLL;
            uint64_t v30 = 0;
            uint64_t v32 = 0x7FFFFFFFLL;
            uint64_t v33 = 0;
            uint64_t v24 = 0x7FFFFFFFLL;
            NSUInteger v25 = 0;
          }
          int v17 = 1;
          objc_storeStrong(&location, 0);
          objc_storeStrong(&v15, 0);
        }
        else
        {
          uint64_t v35 = 0x7FFFFFFFLL;
          uint64_t v34 = 0;
          uint64_t v36 = 0x7FFFFFFFLL;
          uint64_t v37 = 0;
          uint64_t v24 = 0x7FFFFFFFLL;
          NSUInteger v25 = 0;
          int v17 = 1;
        }
        objc_storeStrong(&v16, 0);
      }
      else
      {
        uint64_t v39 = 0x7FFFFFFFLL;
        uint64_t v38 = 0;
        uint64_t v40 = 0x7FFFFFFFLL;
        uint64_t v41 = 0;
        uint64_t v24 = 0x7FFFFFFFLL;
        NSUInteger v25 = 0;
        int v17 = 1;
      }
      objc_storeStrong(&v18, 0);
      objc_storeStrong(&v19, 0);
    }
  }
  else
  {
    v20.receiver = v23;
    v20.super_class = (Class)UITextInputUIResponderAccessibility;
    uint64_t v24 = (uint64_t)[(UITextInputUIResponderAccessibility *)&v20 _accessibilityLineRangeForPosition:v21];
    NSUInteger v25 = v3;
  }
  NSUInteger v4 = v24;
  NSUInteger v5 = v25;
  result.length = v5;
  result.id location = v4;
  return result;
}

- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3
{
  NSUInteger v25 = self;
  SEL v24 = a2;
  unint64_t v23 = a3;
  id v14 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  char v15 = objc_msgSend(v14, "__accessibilityRespondsToTextInput");

  if (v15)
  {
    if (v23 == 0x7FFFFFFF || v23 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v26 = 0x7FFFFFFFLL;
      NSUInteger v27 = 0;
    }
    else
    {
      id v21 = [(UITextInputUIResponderAccessibility *)v25 _accessibilityTextResponder];
      id v13 = [(UITextInputUIResponderAccessibility *)v25 _accessibilityTextResponder];
      id v20 = (id)[v13 _accessibilityBeginningOfDocument];

      if (v20)
      {
        id v12 = [(UITextInputUIResponderAccessibility *)v25 _accessibilityTextResponder];
        id v18 = (id)[v12 _accessibilityPositionFromPosition:v20 offset:v23];

        if (v18)
        {
          id v17 = (id)[v21 tokenizer];
          id location = (id)[v17 rangeEnclosingPosition:v18 withGranularity:4 inDirection:0];
          if (location
            || (id location = (id)[v17 rangeEnclosingPosition:v18 withGranularity:4 inDirection:1], 0, location))
          {
            id v7 = [(UITextInputUIResponderAccessibility *)v25 _accessibilityTextResponder];
            id v6 = (id)[location start];
            uint64_t v8 = objc_msgSend(v7, "_accessibilityOffsetFromPosition:toPosition:", v20);

            id v10 = [(UITextInputUIResponderAccessibility *)v25 _accessibilityTextResponder];
            id v9 = (id)[location end];
            uint64_t v11 = objc_msgSend(v10, "_accessibilityOffsetFromPosition:toPosition:", v20);

            uint64_t v29 = v8;
            uint64_t v28 = v11 - v8;
            uint64_t v30 = v8;
            uint64_t v31 = v11 - v8;
            uint64_t v26 = v8;
            NSUInteger v27 = v11 - v8;
            int v19 = 1;
          }
          else
          {
            uint64_t v33 = 0x7FFFFFFFLL;
            uint64_t v32 = 0;
            uint64_t v34 = 0x7FFFFFFFLL;
            uint64_t v35 = 0;
            uint64_t v26 = 0x7FFFFFFFLL;
            NSUInteger v27 = 0;
            int v19 = 1;
          }
          objc_storeStrong(&location, 0);
          objc_storeStrong(&v17, 0);
        }
        else
        {
          uint64_t v37 = 0x7FFFFFFFLL;
          uint64_t v36 = 0;
          uint64_t v38 = 0x7FFFFFFFLL;
          uint64_t v39 = 0;
          uint64_t v26 = 0x7FFFFFFFLL;
          NSUInteger v27 = 0;
          int v19 = 1;
        }
        objc_storeStrong(&v18, 0);
      }
      else
      {
        uint64_t v41 = 0x7FFFFFFFLL;
        uint64_t v40 = 0;
        uint64_t v42 = 0x7FFFFFFFLL;
        uint64_t v43 = 0;
        uint64_t v26 = 0x7FFFFFFFLL;
        NSUInteger v27 = 0;
        int v19 = 1;
      }
      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v21, 0);
    }
  }
  else
  {
    v22.receiver = v25;
    v22.super_class = (Class)UITextInputUIResponderAccessibility;
    uint64_t v26 = (uint64_t)[(UITextInputUIResponderAccessibility *)&v22 _accessibilityLineRangeForPosition:v23];
    NSUInteger v27 = v3;
  }
  NSUInteger v4 = v26;
  NSUInteger v5 = v27;
  result.length = v5;
  result.id location = v4;
  return result;
}

- (_NSRange)_accessibilityVisibleTextRange
{
  id v18 = self;
  SEL v17 = a2;
  id v4 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  objc_opt_class();
  char v15 = 0;
  char isKindOfClass = 1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = [(UITextInputUIResponderAccessibility *)v18 _accessibilityTextResponder];
    char v15 = 1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  if (v15) {

  }
  if (isKindOfClass)
  {
    long long v14 = 0uLL;
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    int v9 = 0x10000000;
    int v10 = 48;
    uint64_t v11 = &unk_24046C852;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    v6[1] = &v7;
    v6[0] = v18;
    AXPerformSafeBlock();
    long long v14 = *((_OWORD *)v8 + 2);
    objc_storeStrong(v6, 0);
    _Block_object_dispose(&v7, 8);
    if ((void)v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v25 = 0x7FFFFFFFLL;
      uint64_t v24 = 0;
      uint64_t v26 = 0x7FFFFFFFLL;
      uint64_t v27 = 0;
      long long v19 = 0x7FFFFFFFuLL;
    }
    else
    {
      long long v19 = v14;
    }
  }
  else
  {
    uint64_t v21 = 0x7FFFFFFFLL;
    uint64_t v20 = 0;
    uint64_t v22 = 0x7FFFFFFFLL;
    uint64_t v23 = 0;
    long long v19 = 0x7FFFFFFFuLL;
  }
  NSUInteger v3 = *((void *)&v19 + 1);
  NSUInteger v2 = v19;
  result.length = v3;
  result.id location = v2;
  return result;
}

void __69__UITextInputUIResponderAccessibility__accessibilityVisibleTextRange__block_invoke(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) _accessibilityTextResponder];
  *(void *)&long long v4 = [v3 _visibleRangeWithLayout:0];
  *((void *)&v4 + 1) = v1;
  *(_OWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v4;
}

- (unint64_t)_accessibilityPositionInDirection:(int64_t)a3 offset:(unint64_t)a4 forPosition:(unint64_t)a5
{
  uint64_t v21 = self;
  SEL v20 = a2;
  int64_t v19 = a3;
  unint64_t v18 = a4;
  unint64_t v17 = a5;
  id v9 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  char v10 = objc_msgSend(v9, "__accessibilityRespondsToTextInput");

  if (v10)
  {
    if (v17 == 0x7FFFFFFF || v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0x7FFFFFFFLL;
    }
    else
    {
      id v15 = [(UITextInputUIResponderAccessibility *)v21 _accessibilityTextResponder];
      id v8 = [(UITextInputUIResponderAccessibility *)v21 _accessibilityTextResponder];
      id v14 = (id)[v8 _accessibilityBeginningOfDocument];

      if (v14)
      {
        id v7 = [(UITextInputUIResponderAccessibility *)v21 _accessibilityTextResponder];
        id v12 = (id)[v7 _accessibilityPositionFromPosition:v14 offset:v17];

        if (v12)
        {
          id location = (id)[v15 positionFromPosition:v12 inDirection:v19 offset:v18];
          if (location)
          {
            id v6 = [(UITextInputUIResponderAccessibility *)v21 _accessibilityTextResponder];
            unint64_t v22 = [v6 _accessibilityOffsetFromPosition:v14 toPosition:location];
          }
          else
          {
            unint64_t v22 = 0x7FFFFFFFLL;
          }
          int v13 = 1;
          objc_storeStrong(&location, 0);
        }
        else
        {
          unint64_t v22 = 0x7FFFFFFFLL;
          int v13 = 1;
        }
        objc_storeStrong(&v12, 0);
      }
      else
      {
        unint64_t v22 = 0x7FFFFFFFLL;
        int v13 = 1;
      }
      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v15, 0);
    }
  }
  else
  {
    v16.receiver = v21;
    v16.super_class = (Class)UITextInputUIResponderAccessibility;
    return [(UITextInputUIResponderAccessibility *)&v16 _accessibilityPositionInDirection:v19 offset:v18 forPosition:v17];
  }
  return v22;
}

- (id)accessibilityValue
{
  id v14 = self;
  SEL v13 = a2;
  id v6 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  char v7 = objc_msgSend(v6, "__accessibilityRespondsToTextInput");

  if (v7)
  {
    id v11 = [(UITextInputUIResponderAccessibility *)v14 _accessibilityTextResponder];
    id v4 = [(UITextInputUIResponderAccessibility *)v14 _accessibilityTextResponder];
    id v10 = (id)[v4 _accessibilityBeginningOfDocument];

    id v5 = [(UITextInputUIResponderAccessibility *)v14 _accessibilityTextResponder];
    id v9 = (id)[v5 _accessibilityEndOfDocument];

    id v8 = (id)[v11 textRangeFromPosition:v10 toPosition:v9];
    id v15 = (id)[v11 textInRange:v8];
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  else
  {
    v12.receiver = v14;
    v12.super_class = (Class)UITextInputUIResponderAccessibility;
    id v15 = [(UITextInputUIResponderAccessibility *)&v12 accessibilityValue];
  }
  NSUInteger v2 = v15;

  return v2;
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  CGPoint v67 = a3;
  v66 = self;
  v65[1] = (id)a2;
  v65[0] = 0;
  id v64 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  id v38 = [(UITextInputUIResponderAccessibility *)v66 _accessibilityTextResponder];
  char v39 = objc_msgSend(v38, "__accessibilityRespondsToTextInput");

  if (v39)
  {
    id v37 = [(UITextInputUIResponderAccessibility *)v66 _accessibilityTextResponder];
    id v61 = (id)[v37 _axTextInputView];

    if (!v61)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v3 = (id)[v64 inputView];
        id v4 = v61;
        id v61 = v3;
      }
    }
    id v36 = (id)[v61 window];
    [v36 convertPoint:v61 toView:v67];
    v60.x = v5;
    v60.y = v6;
    CGPoint v67 = v60;

    id v59 = (id)objc_msgSend(v64, "characterRangeAtPoint:", v60.x, v60.y);
    id v58 = (id)[v64 textInRange:v59];
    if ([v58 isEqualToString:@"\n"])
    {
      id v32 = v64;
      id v33 = (id)[v59 start];
      id v57 = (id)objc_msgSend(v32, "positionFromPosition:inDirection:offset:");

      id v34 = v64;
      id v35 = (id)[v59 end];
      id v56 = (id)objc_msgSend(v34, "positionFromPosition:inDirection:offset:");

      id v7 = (id)[v64 textRangeFromPosition:v57 toPosition:v56];
      id v8 = v59;
      id v59 = v7;

      objc_storeStrong(&v56, 0);
      objc_storeStrong(&v57, 0);
    }
    id v55 = (id)[v64 tokenizer];
    id v29 = (id)[v59 start];
    id v54 = (id)objc_msgSend(v55, "positionFromPosition:toBoundary:inDirection:");

    id v30 = (id)[v59 end];
    id v53 = (id)objc_msgSend(v55, "positionFromPosition:toBoundary:inDirection:");

    char v51 = 0;
    BOOL v31 = 1;
    if (v53)
    {
      id v28 = v64;
      id v52 = (id)[v59 end];
      char v51 = 1;
      BOOL v31 = objc_msgSend(v28, "comparePosition:toPosition:") == 1;
    }
    if (v51) {

    }
    if (v31)
    {
      id v9 = (id)[v59 end];
      id v10 = v53;
      id v53 = v9;
    }
    char v49 = 0;
    BOOL v27 = 1;
    if (v54)
    {
      id v26 = v64;
      id v50 = (id)[v59 start];
      char v49 = 1;
      BOOL v27 = objc_msgSend(v26, "comparePosition:toPosition:") == -1;
    }
    if (v49) {

    }
    if (v27)
    {
      id v11 = (id)[v59 start];
      id v12 = v54;
      id v54 = v11;
    }
    id v48 = (id)[v64 textRangeFromPosition:v54 toPosition:v53];
    if (!v48)
    {
      id v25 = (id)[v59 start];
      id v48 = (id)objc_msgSend(v55, "rangeEnclosingPosition:withGranularity:inDirection:");
    }
    id v23 = [(UITextInputUIResponderAccessibility *)v66 _accessibilityTextResponder];
    id v47 = (id)[v23 _accessibilityBeginningOfDocument];

    id v24 = (id)[v48 start];
    char v44 = 0;
    char v42 = 0;
    char v40 = 0;
    if (v24)
    {
      id v45 = (id)[v48 start];
      char v44 = 1;
      id v22 = v45;
    }
    else
    {
      id v43 = [(UITextInputUIResponderAccessibility *)v66 _accessibilityTextResponder];
      char v42 = 1;
      id v41 = (id)[v43 _accessibilityEndOfDocument];
      char v40 = 1;
      id v22 = v41;
    }
    id v46 = v22;
    if (v40) {

    }
    if (v42) {
    if (v44)
    }

    id v17 = [(UITextInputUIResponderAccessibility *)v66 _accessibilityTextResponder];
    uint64_t v18 = [v17 _accessibilityOffsetFromPosition:v47 toPosition:v46];

    int64_t v19 = NSDictionary;
    id v21 = (id)[NSNumber numberWithInteger:v18];
    id v20 = (id)[NSNumber numberWithInteger:0];
    id v13 = (id)objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v21, @"lineNumber", v20, @"lineColumn", 0);
    id v14 = v65[0];
    v65[0] = v13;

    id v68 = v65[0];
    int v62 = 1;
    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v47, 0);
    objc_storeStrong(&v48, 0);
    objc_storeStrong(&v53, 0);
    objc_storeStrong(&v54, 0);
    objc_storeStrong(&v55, 0);
    objc_storeStrong(&v58, 0);
    objc_storeStrong(&v59, 0);
    objc_storeStrong(&v61, 0);
  }
  else
  {
    v63.receiver = v66;
    v63.super_class = (Class)UITextInputUIResponderAccessibility;
    id v68 = -[UITextInputUIResponderAccessibility _accessibilityLineNumberAndColumnForPoint:](&v63, sel__accessibilityLineNumberAndColumnForPoint_, v67.x, v67.y);
    int v62 = 1;
  }
  objc_storeStrong(&v64, 0);
  objc_storeStrong(v65, 0);
  id v15 = v68;

  return v15;
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  id v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v39 = 0x7FFFFFFFLL;
  uint64_t v38 = 0;
  uint64_t v40 = 0x7FFFFFFFLL;
  uint64_t v41 = 0;
  uint64_t v36 = 0x7FFFFFFFLL;
  NSUInteger v37 = 0;
  id v22 = (id)[location[0] objectForKey:@"lineColumn"];
  BOOL v23 = [v22 integerValue] != 0;

  if (v23) {
    goto LABEL_26;
  }
  id v20 = [(UITextInputUIResponderAccessibility *)v35 _accessibilityTextResponder];
  char v21 = [v20 conformsToProtocol:&unk_26F4BCAA8];

  if ((v21 & 1) == 0)
  {
    int v33 = 1;
    goto LABEL_27;
  }
  id v32 = [(UITextInputUIResponderAccessibility *)v35 _accessibilityTextResponder];
  id v17 = (id)[location[0] objectForKey:@"lineNumber"];
  uint64_t v18 = (void *)[v17 integerValue];

  v31[1] = v18;
  id v19 = [(UITextInputUIResponderAccessibility *)v35 _accessibilityTextResponder];
  v31[0] = (id)[v19 _accessibilityBeginningOfDocument];

  id v30 = (id)[v32 positionFromPosition:v31[0] inDirection:2 offset:v18];
  if (!v30) {
    objc_storeStrong(&v30, v31[0]);
  }
  if (v30)
  {
    id v29 = (id)[v32 tokenizer];
    id v28 = (id)[v29 positionFromPosition:v30 toBoundary:4 inDirection:0];
    if (!v28) {
      objc_storeStrong(&v28, v31[0]);
    }
    if (([v29 isPosition:v28 withinTextUnit:0 inDirection:1] & 1) == 0)
    {
      id v27 = (id)objc_msgSend(v29, "positionFromPosition:toBoundary:inDirection:", v28, 0);
      if (v27) {
        objc_storeStrong(&v28, v27);
      }
      objc_storeStrong(&v27, 0);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _AXAssert();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _AXAssert();
    }
    id v26 = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v3 = (id)[v32 textRangeFromPosition:v30 toPosition:v28];
        id v4 = v26;
        id v26 = v3;
      }
    }
    if (v26)
    {
      id v13 = [(UITextInputUIResponderAccessibility *)v35 _accessibilityTextResponder];
      id v11 = v31[0];
      id v12 = (id)[v26 start];
      uint64_t v25 = objc_msgSend(v13, "_accessibilityOffsetFromPosition:toPosition:", v11);

      id v16 = [(UITextInputUIResponderAccessibility *)v35 _accessibilityTextResponder];
      id v14 = v31[0];
      id v15 = (id)[v26 end];
      uint64_t v24 = objc_msgSend(v16, "_accessibilityOffsetFromPosition:toPosition:", v14);
    }
    else
    {
      id v7 = [(UITextInputUIResponderAccessibility *)v35 _accessibilityTextResponder];
      uint64_t v25 = [v7 _accessibilityOffsetFromPosition:v31[0] toPosition:v31[0]];

      id v10 = [(UITextInputUIResponderAccessibility *)v35 _accessibilityTextResponder];
      id v8 = v31[0];
      id v9 = [(UITextInputUIResponderAccessibility *)v35 _accessibilityEndOfDocument];
      uint64_t v24 = objc_msgSend(v10, "_accessibilityOffsetFromPosition:toPosition:", v8);
    }
    uint64_t v36 = v25;
    NSUInteger v37 = v24 - v25;
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    int v33 = 0;
  }
  else
  {
    int v33 = 1;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(v31, 0);
  objc_storeStrong(&v32, 0);
  if (!v33) {
LABEL_26:
  }
    int v33 = 1;
LABEL_27:
  objc_storeStrong(location, 0);
  NSUInteger v5 = v36;
  NSUInteger v6 = v37;
  result.length = v6;
  result.id location = v5;
  return result;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  _NSRange v53 = a3;
  id v52 = self;
  SEL v51 = a2;
  id v35 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  char v36 = objc_msgSend(v35, "__accessibilityRespondsToTextInput");

  if (v36)
  {
    if (v53.location == 0x7FFFFFFF || v53.location == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v54 = *MEMORY[0x263F001A8];
      long long v55 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    }
    else
    {
      id v49 = [(UITextInputUIResponderAccessibility *)v52 _accessibilityTextResponder];
      id v32 = [(UITextInputUIResponderAccessibility *)v52 _accessibilityTextResponder];
      id v48 = (id)[v32 _accessibilityBeginningOfDocument];

      id v33 = [(UITextInputUIResponderAccessibility *)v52 _accessibilityTextResponder];
      id v47 = (id)[v33 _accessibilityPositionFromPosition:v48 offset:v53.location];

      id v34 = [(UITextInputUIResponderAccessibility *)v52 _accessibilityTextResponder];
      id v46 = (id)[v34 _accessibilityPositionFromPosition:v47 offset:v53.length];

      id v45 = (id)[v49 textRangeFromPosition:v47 toPosition:v46];
      memset(&rect2, 0, sizeof(rect2));
      CGRect rect2 = *(CGRect *)*(void *)&MEMORY[0x263F001A8];
      if (objc_opt_respondsToSelector())
      {
        id location = (id)[v49 selectionRectsForRange:v45];
        memset(__b, 0, sizeof(__b));
        id obj = location;
        uint64_t v31 = [obj countByEnumeratingWithState:__b objects:v56 count:16];
        if (v31)
        {
          uint64_t v27 = *(void *)__b[2];
          uint64_t v28 = 0;
          unint64_t v29 = v31;
          while (1)
          {
            uint64_t v26 = v28;
            if (*(void *)__b[2] != v27) {
              objc_enumerationMutation(obj);
            }
            id v42 = *(id *)(__b[1] + 8 * v28);
            if (CGRectEqualToRect(*MEMORY[0x263F001A8], rect2))
            {
              [v42 rect];
              v40.origin.x = v7;
              v40.origin.y = v8;
              v40.size.width = v9;
              v40.size.height = v10;
              CGRect rect2 = v40;
            }
            else
            {
              [v42 rect];
              r2.origin.x = v11;
              r2.origin.y = v12;
              r2.size.width = v13;
              r2.size.height = v14;
              CGRect v39 = CGRectUnion(rect2, r2);
              CGRect rect2 = v39;
            }
            ++v28;
            if (v26 + 1 >= v29)
            {
              uint64_t v28 = 0;
              unint64_t v29 = [obj countByEnumeratingWithState:__b objects:v56 count:16];
              if (!v29) {
                break;
              }
            }
          }
        }

        objc_storeStrong(&location, 0);
      }
      id v25 = [(UITextInputUIResponderAccessibility *)v52 _accessibilityTextResponder];
      id v37 = (id)[v25 _axTextInputView];

      if (!v37)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = (id)[v49 inputView];
          id v16 = v37;
          id v37 = v15;
        }
      }
      UIAccessibilityFrameForBounds();
      *(void *)&long long v54 = v17;
      *((void *)&v54 + 1) = v18;
      *(void *)&long long v55 = v19;
      *((void *)&v55 + 1) = v20;
      objc_storeStrong(&v37, 0);
      objc_storeStrong(&v45, 0);
      objc_storeStrong(&v46, 0);
      objc_storeStrong(&v47, 0);
      objc_storeStrong(&v48, 0);
      objc_storeStrong(&v49, 0);
    }
  }
  else
  {
    v50.receiver = v52;
    v50.super_class = (Class)UITextInputUIResponderAccessibility;
    -[UITextInputUIResponderAccessibility _accessibilityBoundsForRange:](&v50, sel__accessibilityBoundsForRange_, v53.location, v53.length);
    *(void *)&long long v54 = v3;
    *((void *)&v54 + 1) = v4;
    *(void *)&long long v55 = v5;
    *((void *)&v55 + 1) = v6;
  }
  double v21 = *((double *)&v55 + 1);
  double v22 = *(double *)&v55;
  double v23 = *((double *)&v54 + 1);
  double v24 = *(double *)&v54;
  result.size.height = v21;
  result.size.width = v22;
  result.origin.y = v23;
  result.origin.x = v24;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  _NSRange v19 = a3;
  uint64_t v18 = self;
  SEL v17 = a2;
  id v8 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  char v9 = objc_msgSend(v8, "__accessibilityRespondsToTextInput");

  if (v9)
  {
    if (v19.location != 0x7FFFFFFF)
    {
      char v15 = 0;
      if (AXIsDictationListening())
      {
        AXHandleUserInteractionForDictation(1);
        char v15 = 1;
      }
      id v14 = [(UITextInputUIResponderAccessibility *)v18 _accessibilityTextResponder];
      id v3 = [(UITextInputUIResponderAccessibility *)v18 _accessibilityTextResponder];
      id v13 = (id)[v3 _accessibilityBeginningOfDocument];

      id v4 = [(UITextInputUIResponderAccessibility *)v18 _accessibilityTextResponder];
      id v12 = (id)[v4 _accessibilityPositionFromPosition:v13 offset:v19.location];

      id v5 = [(UITextInputUIResponderAccessibility *)v18 _accessibilityTextResponder];
      id v11 = (id)[v5 _accessibilityPositionFromPosition:v12 offset:v19.length];

      id location = (id)[v14 textRangeFromPosition:v12 toPosition:v11];
      CGFloat v7 = (UIAccessibilityNotifications *)MEMORY[0x263F81340];
      MEMORY[0x2455E6B10](*MEMORY[0x263F81340]);
      [v14 setSelectedTextRange:location];
      MEMORY[0x2455E6B10](0);
      id v6 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityResponderElementForFocus];
      _UIAccessibilitySetAssociatedElementContextForNextNotification();

      UIAccessibilityPostNotification(*v7, 0);
      if (v15) {
        AXHandleUserInteractionForDictation(0);
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v12, 0);
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v14, 0);
    }
  }
  else
  {
    v16.receiver = v18;
    v16.super_class = (Class)UITextInputUIResponderAccessibility;
    -[UITextInputUIResponderAccessibility _accessibilitySetSelectedTextRange:](&v16, sel__accessibilitySetSelectedTextRange_, v19.location, v19.length);
  }
}

- (id)_accessibilityTextViewTextOperationResponder
{
  id v8 = self;
  SEL v7 = a2;
  id v4 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  char v5 = objc_msgSend(v4, "__accessibilityRespondsToTextInput");

  if (v5)
  {
    char v9 = (UITextInputUIResponderAccessibility *)[(UITextInputUIResponderAccessibility *)v8 _accessibilityTextResponder];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v9 = v8;
    }
    else
    {
      v6.receiver = v8;
      v6.super_class = (Class)UITextInputUIResponderAccessibility;
      char v9 = (UITextInputUIResponderAccessibility *)[(UITextInputUIResponderAccessibility *)&v6 _accessibilityTextViewTextOperationResponder];
    }
  }
  NSUInteger v2 = v9;

  return v2;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  id v13 = self;
  SEL v12 = a2;
  id v7 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  char v8 = objc_msgSend(v7, "__accessibilityRespondsToTextInput");

  if (v8)
  {
    id v10 = [(UITextInputUIResponderAccessibility *)v13 _accessibilityTextResponder];
    id location = (id)[v10 safeValueForKey:@"selectedTextRange"];
    if (location)
    {
      id v6 = [(UITextInputUIResponderAccessibility *)v13 _accessibilityTextResponder];
      uint64_t v14 = [v6 _accessibilityRawRangeForUITextRange:location];
      NSUInteger v15 = v3;
    }
    else
    {
      uint64_t v17 = 0x7FFFFFFFLL;
      uint64_t v16 = 0;
      uint64_t v18 = 0x7FFFFFFFLL;
      uint64_t v19 = 0;
      uint64_t v14 = 0x7FFFFFFFLL;
      NSUInteger v15 = 0;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v10, 0);
  }
  else
  {
    v11.receiver = v13;
    v11.super_class = (Class)UITextInputUIResponderAccessibility;
    uint64_t v14 = (uint64_t)[(UITextInputUIResponderAccessibility *)&v11 _accessibilitySelectedTextRange];
    NSUInteger v15 = v2;
  }
  NSUInteger v4 = v14;
  NSUInteger v5 = v15;
  result.length = v5;
  result.id location = v4;
  return result;
}

- (id)_accessibilityTextRangeFromNSRange:(_NSRange)a3
{
  _NSRange v14 = a3;
  id v13 = self;
  SEL v12 = a2;
  id v5 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  char v6 = objc_msgSend(v5, "__accessibilityRespondsToTextInput");

  if (v6)
  {
    id v10 = [(UITextInputUIResponderAccessibility *)v13 _accessibilityTextResponder];
    id v9 = (id)[v10 beginningOfDocument];
    id v8 = (id)[v10 positionFromPosition:v9 offset:v14.location];
    id v7 = (id)[v10 positionFromPosition:v8 offset:v14.length];
    id v15 = (id)[v10 textRangeFromPosition:v8 toPosition:v7];
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
  }
  else
  {
    v11.receiver = v13;
    v11.super_class = (Class)UITextInputUIResponderAccessibility;
    id v15 = -[UITextInputUIResponderAccessibility _accessibilityTextRangeFromNSRange:](&v11, sel__accessibilityTextRangeFromNSRange_, v14.location, v14.length);
  }
  NSUInteger v3 = v15;

  return v3;
}

- (_NSRange)_accessibilityRawRangeForUITextRange:(id)a3
{
  double v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = [(UITextInputUIResponderAccessibility *)v21 _accessibilityTextResponder];
  char v16 = objc_msgSend(v15, "__accessibilityRespondsToTextInput");

  if (v16)
  {
    id v6 = [(UITextInputUIResponderAccessibility *)v21 _accessibilityTextResponder];
    id v17 = (id)[v6 _accessibilityBeginningOfDocument];

    id v9 = [(UITextInputUIResponderAccessibility *)v21 _accessibilityTextResponder];
    id v7 = v17;
    id v8 = (id)[location[0] start];
    uint64_t v10 = objc_msgSend(v9, "_accessibilityOffsetFromPosition:toPosition:", v7);

    id v13 = [(UITextInputUIResponderAccessibility *)v21 _accessibilityTextResponder];
    id v11 = v17;
    id v12 = (id)[location[0] end];
    uint64_t v14 = objc_msgSend(v13, "_accessibilityOffsetFromPosition:toPosition:", v11);

    uint64_t v25 = v10;
    uint64_t v24 = v14 - v10;
    uint64_t v26 = v10;
    uint64_t v27 = v14 - v10;
    NSUInteger v22 = v10;
    NSUInteger v23 = v14 - v10;
    int v18 = 1;
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v19.receiver = v21;
    v19.super_class = (Class)UITextInputUIResponderAccessibility;
    NSUInteger v22 = (NSUInteger)[(UITextInputUIResponderAccessibility *)&v19 _accessibilityRawRangeForUITextRange:location[0]];
    NSUInteger v23 = v3;
    int v18 = 1;
  }
  objc_storeStrong(location, 0);
  NSUInteger v4 = v22;
  NSUInteger v5 = v23;
  result.length = v5;
  result.id location = v4;
  return result;
}

- (unint64_t)accessibilityTraits
{
  id v11 = self;
  SEL v10 = a2;
  unint64_t v9 = 0;
  v8.receiver = self;
  v8.super_class = (Class)UITextInputUIResponderAccessibility;
  unint64_t v9 = [(UITextInputUIResponderAccessibility *)&v8 accessibilityTraits];
  id v6 = [(UITextInputUIResponderAccessibility *)v11 _accessibilityTextResponder];
  char v7 = objc_msgSend(v6, "__accessibilityRespondsToTextInput");

  if ((v7 & 1) == 0) {
    return v9;
  }
  v9 |= *MEMORY[0x263F81408] | *MEMORY[0x263F81410] | *MEMORY[0x263F21B60];
  id v4 = [(UITextInputUIResponderAccessibility *)v11 _accessibilityTextResponder];
  id v3 = (id)[v4 safeValueForKey:@"isFirstResponder"];
  char v5 = [v3 BOOLValue];

  if (v5) {
    v9 |= *MEMORY[0x263F81398];
  }
  return v9;
}

- (id)_accessibilitySpeakThisString
{
  id v13 = self;
  v12[1] = (id)a2;
  v12[0] = 0;
  id v9 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  char v10 = objc_msgSend(v9, "__accessibilityRespondsToTextInput");

  if (v10)
  {
    id v8 = [(UITextInputUIResponderAccessibility *)v13 _accessibilityTextResponder];
    id v2 = (id)[v8 _accessibilityAXAttributedValue];
    id v3 = v12[0];
    v12[0] = v2;
  }
  else
  {
    v11.receiver = v13;
    v11.super_class = (Class)UITextInputUIResponderAccessibility;
    id v4 = [(UITextInputUIResponderAccessibility *)&v11 _accessibilitySpeakThisString];
    id v5 = v12[0];
    v12[0] = v4;
  }
  id v7 = v12[0];
  objc_storeStrong(v12, 0);

  return v7;
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3 string:(id)a4 wantsSentences:(BOOL)a5
{
  _NSRange v11 = a3;
  char v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  id v7 = [(UITextInputUIResponderAccessibility *)v10 _accessibilityTextResponder];
  id v8 = (id)objc_msgSend(v7, "_accessibilityTextRectsForSpeakThisStringRange:wantsSentences:", v11.location, v11.length, a5);

  objc_storeStrong(location, 0);

  return v8;
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3
{
  id v4 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  id v5 = (id)objc_msgSend(v4, "_accessibilityTextRectsForSpeakThisStringRange:wantsSentences:", a3.location, a3.length, 0);

  return v5;
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3 wantsSentences:(BOOL)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  _NSRange v77 = a3;
  v76 = self;
  SEL v75 = a2;
  BOOL v74 = a4;
  id v73 = 0;
  id v51 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  char v52 = objc_msgSend(v51, "__accessibilityRespondsToTextInput");

  if (v52)
  {
    id location = 0;
    char v71 = 0;
    id v49 = [(UITextInputUIResponderAccessibility *)v76 _accessibilityTextResponder];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_storeStrong(&location, v76);
      if (([location isSelectable] & 1) == 0)
      {
        [location setSelectable:1];
        char v71 = 1;
      }
    }
    id v70 = [(UITextInputUIResponderAccessibility *)v76 _accessibilityTextResponder];
    id v44 = [(UITextInputUIResponderAccessibility *)v76 _accessibilityTextResponder];
    id v43 = [(UITextInputUIResponderAccessibility *)v76 _accessibilityTextResponder];
    id v42 = (id)[v43 _accessibilityBeginningOfDocument];
    id v69 = (id)objc_msgSend(v44, "_accessibilityPositionFromPosition:offset:");

    id v47 = [(UITextInputUIResponderAccessibility *)v76 _accessibilityTextResponder];
    id v46 = [(UITextInputUIResponderAccessibility *)v76 _accessibilityTextResponder];
    id v45 = (id)[v46 _accessibilityBeginningOfDocument];
    _NSRange v78 = v77;
    id v68 = (id)objc_msgSend(v47, "_accessibilityPositionFromPosition:offset:");

    id v67 = (id)[v70 textRangeFromPosition:v69 toPosition:v68];
    id v48 = [(UITextInputUIResponderAccessibility *)v76 _accessibilityTextResponder];
    id v66 = (id)[v48 _axTextInputView];

    if (!v66)
    {
      id v40 = [(UITextInputUIResponderAccessibility *)v76 _accessibilityTextResponder];
      objc_opt_class();
      char v41 = objc_opt_isKindOfClass();

      if (v41)
      {
        id v39 = [(UITextInputUIResponderAccessibility *)v76 _accessibilityTextResponder];
        id v4 = (id)[v39 inputView];
        id v5 = v66;
        id v66 = v4;
      }
    }
    id v65 = 0;
    if (v74)
    {
      id v38 = [(UITextInputUIResponderAccessibility *)v76 _accessibilityTextResponder];
      id v6 = (id)[v38 _accessibilitySentenceRectsForRange:v67];
      id v7 = v65;
      id v65 = v6;
    }
    else
    {
      id v37 = [(UITextInputUIResponderAccessibility *)v76 _accessibilityTextResponder];
      id v8 = (id)[v37 _accessibilityTextRectsForRange:v67 singleTextRect:0];
      id v9 = v65;
      id v65 = v8;
    }
    os_log_t oslog = (os_log_t)(id)AXLogSpeakScreen();
    os_log_type_t type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_3_8_66_8_66_8_66((uint64_t)v80, (uint64_t)v67, (uint64_t)v66, (uint64_t)v65);
      _os_log_impl(&dword_2402B7000, oslog, type, "Was text input, got range %{public}@ and view %{public}@, rects in view space %{public}@", v80, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v62 = (id)objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v65, "count"));
    memset(__b, 0, sizeof(__b));
    id obj = v65;
    uint64_t v36 = [obj countByEnumeratingWithState:__b objects:v79 count:16];
    if (v36)
    {
      uint64_t v32 = *(void *)__b[2];
      uint64_t v33 = 0;
      unint64_t v34 = v36;
      while (1)
      {
        uint64_t v31 = v33;
        if (*(void *)__b[2] != v32) {
          objc_enumerationMutation(obj);
        }
        id v61 = *(id *)(__b[1] + 8 * v33);
        [v61 CGRectValue];
        *(void *)&long long v58 = v10;
        *((void *)&v58 + 1) = v11;
        *(void *)&long long v59 = v12;
        *((void *)&v59 + 1) = v13;
        long long v56 = v58;
        long long v57 = v59;
        if (v66)
        {
          objc_msgSend(v66, "convertRect:toView:", 0, v58, v59);
          *(void *)&long long v54 = v14;
          *((void *)&v54 + 1) = v15;
          *(void *)&long long v55 = v16;
          *((void *)&v55 + 1) = v17;
          long long v56 = v54;
          long long v57 = v55;
        }
        id v29 = v62;
        id v30 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v56, v57);
        objc_msgSend(v29, "addObject:");

        ++v33;
        if (v31 + 1 >= v34)
        {
          uint64_t v33 = 0;
          unint64_t v34 = [obj countByEnumeratingWithState:__b objects:v79 count:16];
          if (!v34) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v73, v62);
    if (location && (v71 & 1) == 1) {
      [location setSelectable:0];
    }
    objc_storeStrong(&v62, 0);
    objc_storeStrong(&v65, 0);
    objc_storeStrong(&v66, 0);
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&v68, 0);
    objc_storeStrong(&v69, 0);
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&location, 0);
  }
  else
  {
    id v27 = [(UITextInputUIResponderAccessibility *)v76 _accessibilityTextResponder];
    char v28 = [v27 _accessibilityBoolValueForKey:@"AXInSpeakThisTextRectsOverride"];

    if (v28)
    {
      v53.receiver = v76;
      v53.super_class = (Class)UITextInputUIResponderAccessibility;
      id v18 = -[UITextInputUIResponderAccessibility _accessibilityTextRectsForSpeakThisStringRange:](&v53, sel__accessibilityTextRectsForSpeakThisStringRange_, v77.location, v77.length);
      id v19 = v73;
      id v73 = v18;
    }
    else
    {
      id v24 = [(UITextInputUIResponderAccessibility *)v76 _accessibilityTextResponder];
      objc_msgSend(v24, "_accessibilitySetBoolValue:forKey:", 1);

      id v25 = [(UITextInputUIResponderAccessibility *)v76 _accessibilityTextResponder];
      id v20 = (id)objc_msgSend(v25, "_accessibilityTextRectsForSpeakThisStringRange:", v77.location, v77.length);
      id v21 = v73;
      id v73 = v20;

      id v26 = [(UITextInputUIResponderAccessibility *)v76 _accessibilityTextResponder];
      [v26 _accessibilitySetBoolValue:0 forKey:@"AXInSpeakThisTextRectsOverride"];
    }
  }
  id v23 = v73;
  objc_storeStrong(&v73, 0);

  return v23;
}

- (BOOL)_accessibilityInsertTextWithAlternatives:(id)a3
{
  id v62 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v60 = 0;
  id v21 = [(UITextInputUIResponderAccessibility *)v62 _accessibilityTextResponder];
  char v22 = objc_msgSend(v21, "__accessibilityRespondsToTextInput");

  if (v22)
  {
    id v19 = [(UITextInputUIResponderAccessibility *)v62 _accessibilityTextResponder];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      id v59 = (id)[MEMORY[0x263EFF980] array];
      uint64_t v54 = 0;
      long long v55 = &v54;
      int v56 = 0x20000000;
      int v57 = 32;
      uint64_t v58 = 0;
      id v18 = location[0];
      uint64_t v47 = MEMORY[0x263EF8330];
      int v48 = -1073741824;
      int v49 = 0;
      objc_super v50 = __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke;
      id v51 = &unk_2650AF560;
      v53[1] = &v54;
      id v52 = v59;
      v53[0] = location[0];
      [v18 enumerateAttributesUsingBlock:&v47];
      unint64_t v17 = v55[3];
      if (v17 < [location[0] length])
      {
        id v16 = v59;
        uint64_t v40 = 0;
        char v41 = &v40;
        int v42 = 838860800;
        int v43 = 48;
        id v44 = __Block_byref_object_copy__23;
        id v45 = __Block_byref_object_dispose__23;
        id v46 = 0;
        uint64_t v34 = MEMORY[0x263EF8330];
        int v35 = -1073741824;
        int v36 = 0;
        id v37 = __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke_3;
        id v38 = &unk_2650AEDA0;
        v39[1] = &v40;
        v39[0] = location[0];
        v39[2] = &v54;
        AXPerformSafeBlock();
        id v33 = (id)v41[5];
        objc_storeStrong(v39, 0);
        _Block_object_dispose(&v40, 8);
        objc_storeStrong(&v46, 0);
        objc_msgSend(v16, "axSafelyAddObject:");
      }
      id v15 = [(UITextInputUIResponderAccessibility *)v62 _accessibilityTextResponder];
      [v15 insertDictationResult:v59];

      char v60 = 1;
      objc_storeStrong(v53, 0);
      objc_storeStrong(&v52, 0);
      _Block_object_dispose(&v54, 8);
      objc_storeStrong(&v59, 0);
    }
    else
    {
      id v13 = [(UITextInputUIResponderAccessibility *)v62 _accessibilityTextResponder];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        id v32 = (id)[location[0] string];
        BOOL v31 = 1;
        id v11 = [(UITextInputUIResponderAccessibility *)v62 _accessibilityTextResponder];
        char v12 = objc_opt_respondsToSelector();

        if (v12)
        {
          id v9 = [(UITextInputUIResponderAccessibility *)v62 _accessibilityTextResponder];
          id v8 = (id)[MEMORY[0x263F1C738] sharedInstance];
          id v7 = (id)[v8 delegate];
          char v10 = objc_msgSend(v9, "keyboardInput:shouldInsertText:isMarkedText:");

          BOOL v31 = (v10 & 1) != 0;
        }
        if (v31)
        {
          id v30 = (id)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v32];
          id v5 = location[0];
          uint64_t v23 = MEMORY[0x263EF8330];
          int v24 = -1073741824;
          int v25 = 0;
          id v26 = __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke_4;
          id v27 = &unk_2650AF588;
          id v28 = location[0];
          id v29 = v30;
          [v5 enumerateAttributesUsingBlock:&v23];
          id v6 = [(UITextInputUIResponderAccessibility *)v62 _accessibilityTextResponder];
          [v6 _insertAttributedTextWithoutClosingTyping:v30];

          objc_storeStrong(&v29, 0);
          objc_storeStrong(&v28, 0);
          objc_storeStrong(&v30, 0);
        }
        char v60 = 1;
        objc_storeStrong(&v32, 0);
      }
    }
  }
  char v4 = v60;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

void __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  *(void *)&long long v37 = a3;
  *((void *)&v37 + 1) = a4;
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v35[2] = a5;
  v35[1] = (id)a1;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) < (unint64_t)v37)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v29 = 0;
    id v30 = &v29;
    int v31 = 838860800;
    int v32 = 48;
    id v33 = __Block_byref_object_copy__23;
    uint64_t v34 = __Block_byref_object_dispose__23;
    v35[0] = 0;
    uint64_t v22 = MEMORY[0x263EF8330];
    int v23 = -1073741824;
    int v24 = 0;
    int v25 = __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke_657;
    id v26 = &unk_2650AF538;
    v27[1] = &v29;
    v27[0] = *(id *)(a1 + 40);
    v27[2] = *(id *)(a1 + 48);
    long long v28 = v37;
    AXPerformSafeBlock();
    id v21 = (id)v30[5];
    objc_storeStrong(v27, 0);
    _Block_object_dispose(&v29, 8);
    objc_storeStrong(v35, 0);
    objc_msgSend(v6, "axSafelyAddObject:");
  }
  id v20 = (id)[location[0] objectForKeyedSubscript:@"AXTextAlternatives"];
  if (![v20 count]) {
    objc_storeStrong(&v20, MEMORY[0x263EFFA68]);
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v13 = 0;
  char v14 = &v13;
  int v15 = 838860800;
  int v16 = 48;
  unint64_t v17 = __Block_byref_object_copy__23;
  id v18 = __Block_byref_object_dispose__23;
  id v19 = 0;
  v11[1] = &v13;
  id v10 = *(id *)(a1 + 40);
  long long v12 = v37;
  v11[0] = v20;
  AXPerformSafeBlock();
  id v9 = (id)v14[5];
  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(&v19, 0);
  objc_msgSend(v5, "axSafelyAddObject:");

  long long v38 = v37;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v37 + *((void *)&v37 + 1);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke_657(uint64_t a1)
{
  char v4 = (void *)MEMORY[0x263F1C5C8];
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v7, *(void *)(a1 + 56) - v7);
  id v1 = (id)objc_msgSend(v4, "phraseWithText:alternativeInterpretations:");
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

void __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke_2(uint64_t a1)
{
  char v4 = (void *)MEMORY[0x263F1C5C8];
  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(void *)(a1 + 56), *(void *)(a1 + 64));
  id v1 = (id)objc_msgSend(v4, "phraseWithText:alternativeInterpretations:");
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

void __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke_3(uint64_t a1)
{
  char v4 = (void *)MEMORY[0x263F1C5C8];
  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), objc_msgSend(*(id *)(a1 + 32), "length")- *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  id v1 = (id)objc_msgSend(v4, "phraseWithText:alternativeInterpretations:");
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

void __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v12[2] = a5;
  v12[1] = (id)a1;
  v12[0] = (id)[location[0] objectForKeyedSubscript:@"AXTextAlternatives"];
  if ([v12[0] count])
  {
    id v5 = objc_alloc(MEMORY[0x263F81670]);
    id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v14, v15);
    uint64_t v11 = objc_msgSend(v5, "initWithPrimaryString:alternativeStrings:");

    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v16 = *MEMORY[0x263F81588];
    v17[0] = v11;
    id v8 = (id)[NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_msgSend(v7, "setAttributes:range:");

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityAlternativesForTextAtPosition:(unint64_t)a3
{
  int v23 = self;
  SEL v22 = a2;
  unint64_t v21 = a3;
  id v20 = 0;
  id v13 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  char v14 = objc_msgSend(v13, "__accessibilityRespondsToTextInput");

  if (v14)
  {
    id v19 = 0;
    id v12 = [(UITextInputUIResponderAccessibility *)v23 _accessibilityTextResponder];
    id v18 = (id)[v12 _accessibilityBeginningOfDocument];

    if (v18)
    {
      id v11 = [(UITextInputUIResponderAccessibility *)v23 _accessibilityTextResponder];
      id v17 = (id)[v11 _accessibilityPositionFromPosition:v18 offset:v21];

      if (v17)
      {
        id v9 = [(UITextInputUIResponderAccessibility *)v23 _accessibilityTextResponder];
        char v10 = objc_opt_respondsToSelector();

        if (v10)
        {
          id v8 = [(UITextInputUIResponderAccessibility *)v23 _accessibilityTextResponder];
          id v15 = v19;
          id v7 = (id)[v8 rangeWithTextAlternatives:&v15 atPosition:v17];
          objc_storeStrong(&v19, v15);
          id v16 = v7;

          if (v16)
          {
            id v3 = (id)[v19 alternativeStrings];
            id v4 = v20;
            id v20 = v3;
          }
          objc_storeStrong(&v16, 0);
        }
      }
      objc_storeStrong(&v17, 0);
    }
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  id v6 = v20;
  objc_storeStrong(&v20, 0);

  return v6;
}

- (BOOL)_accessibilityHandlesTabKey
{
  int v36 = self;
  SEL v35 = a2;
  char v34 = 0;
  v33.receiver = self;
  v33.super_class = (Class)UITextInputUIResponderAccessibility;
  char v34 = [(UITextInputUIResponderAccessibility *)&v33 _accessibilityHandlesTabKey];
  if (v34)
  {
    id v32 = (id)[MEMORY[0x263F1C738] sharedInstance];
    id v8 = (id)[v32 textInputTraits];
    char v9 = [v8 isSingleLineDocument];

    if (v9)
    {
      id v7 = (id)[v32 safeValueForKey:@"keyboardStateManager"];
      id v31 = (id)[v7 safeValueForKey:@"m_candidateList"];

      id v30 = (id)[v31 safeValueForKey:@"firstNonEmptyActiveCandidateView"];
      uint64_t v25 = 0;
      id v26 = &v25;
      int v27 = 0x20000000;
      int v28 = 32;
      char v29 = 0;
      uint64_t v19 = MEMORY[0x263EF8330];
      int v20 = -1073741824;
      int v21 = 0;
      SEL v22 = __66__UITextInputUIResponderAccessibility__accessibilityHandlesTabKey__block_invoke;
      int v23 = &unk_2650AE390;
      v24[1] = &v25;
      v24[0] = v30;
      AXPerformSafeBlock();
      char v18 = v26[3] & 1;
      objc_storeStrong(v24, 0);
      _Block_object_dispose(&v25, 8);
      if ((v18 & 1) == 0)
      {
        char v16 = 0;
        objc_opt_class();
        id v6 = (id)[v32 safeValueForKey:@"inputManagerState"];
        id v15 = (id)__UIAccessibilityCastAsClass();

        id v14 = v15;
        objc_storeStrong(&v15, 0);
        id v3 = v14;
        id v4 = (id)[v14 keyboardBehaviors];
        char v13 = 0;
        objc_opt_class();
        id v5 = (id)[v32 safeValueForKey:@"_keyboardBehaviorState"];
        id v12 = (id)__UIAccessibilityCastAsClass();

        id v11 = v12;
        objc_storeStrong(&v12, 0);
        id v17 = (id)objc_msgSend(v4, "keyBehaviorsForState:");

        uint64_t v10 = [v17 tabKeyBehavior];
        if (v10 != 4 && v10 != 3) {
          char v34 = 0;
        }
        objc_storeStrong(&v17, 0);
      }
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
    }
    objc_storeStrong(&v32, 0);
  }
  return v34 & 1;
}

uint64_t __66__UITextInputUIResponderAccessibility__accessibilityHandlesTabKey__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) hasCandidateInForwardDirection:1 granularity:3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result & 1;
  return result;
}

- (int64_t)_accessibilityOffsetFromPosition:(id)a3 toPosition:(id)a4
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v6 = [(UITextInputUIResponderAccessibility *)v10 _accessibilityTextResponder];
  int64_t v7 = [v6 offsetFromPosition:location[0] toPosition:v8];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)_accessibilityPositionFromPosition:(id)a3 offset:(int64_t)a4
{
  char v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4 < 0) {
    _AXAssert();
  }
  id v5 = [(UITextInputUIResponderAccessibility *)v9 _accessibilityTextResponder];
  id v6 = (id)[v5 positionFromPosition:location[0] offset:a4];

  objc_storeStrong(location, 0);

  return v6;
}

- (id)_accessibilityBeginningOfDocument
{
  id v3 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  id v4 = (id)[v3 beginningOfDocument];

  return v4;
}

- (id)_accessibilityEndOfDocument
{
  id v3 = [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
  id v4 = (id)[v3 endOfDocument];

  return v4;
}

- (BOOL)becomeFirstResponder
{
  int64_t v7 = self;
  SEL v6 = a2;
  if ([(UITextInputUIResponderAccessibility *)self _accessibilityBoolValueForKey:@"_AX_becomeFirstResponder"] & 1)return 0; {
  -[UITextInputUIResponderAccessibility _accessibilitySetBoolValue:forKey:](v7, "_accessibilitySetBoolValue:forKey:", 1);
  }
  char v4 = 0;
  v3.receiver = v7;
  v3.super_class = (Class)UITextInputUIResponderAccessibility;
  char v4 = [(UITextInputUIResponderAccessibility *)&v3 becomeFirstResponder];
  [(UITextInputUIResponderAccessibility *)v7 _accessibilitySetBoolValue:0 forKey:@"_AX_becomeFirstResponder"];
  if ((v4 & 1) != 0 && [v7 __accessibilityRespondsToTextInput]) {
    -[UITextInputUIResponderAccessibility _axResetFKAFocusToFirstResponder](v7);
  }
  return v4 & 1;
}

- (void)_axResetFKAFocusToFirstResponder
{
  if (a1) {
    -[UITextInputUIResponderAccessibility _axDrawFocusRingAroundFirstResponderAndMoveFocus:](a1, 1);
  }
}

- (BOOL)resignFirstResponder
{
  int64_t v7 = self;
  SEL v6 = a2;
  if ([(UITextInputUIResponderAccessibility *)self _accessibilityBoolValueForKey:@"_AX_resignFirstResponder"] & 1)return 0; {
  -[UITextInputUIResponderAccessibility _accessibilitySetBoolValue:forKey:](v7, "_accessibilitySetBoolValue:forKey:", 1);
  }
  char v4 = 0;
  v3.receiver = v7;
  v3.super_class = (Class)UITextInputUIResponderAccessibility;
  char v4 = [(UITextInputUIResponderAccessibility *)&v3 resignFirstResponder];
  [(UITextInputUIResponderAccessibility *)v7 _accessibilitySetBoolValue:0 forKey:@"_AX_resignFirstResponder"];
  if ((v4 & 1) != 0
    && [v7 __accessibilityRespondsToTextInput]
    && [(UITextInputUIResponderAccessibility *)v7 _accessibilityIsFKARunningForFocusItem])
  {
    AXPerformBlockAsynchronouslyOnMainThread();
  }
  return v4 & 1;
}

uint64_t __59__UITextInputUIResponderAccessibility_resignFirstResponder__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x263F1C648], "moveRingToFocusItem:forClient:", 0, @"AXFKATextFieldClient", a1, a1);
}

- (BOOL)_axShouldDrawFocusAroundFirstResponder
{
  return 1;
}

- (void)_axDrawFocusRingAroundFirstResponderAndMoveFocus:(void *)a1
{
  id v11 = a1;
  char v10 = a2 & 1;
  if (a1)
  {
    char v8 = 0;
    LOBYTE(v3) = 1;
    if ((AXProcessIsFullKeyboardAccess() & 1) == 0)
    {
      id v9 = (id)[v11 _accessibilityTextResponder];
      char v8 = 1;
      int v3 = objc_msgSend(v9, "__accessibilityRespondsToTextInput") ^ 1;
    }
    if (v8) {

    }
    if ((v3 & 1) == 0)
    {
      id v2 = (id)[v11 _accessibilityTextResponder];
      id v7 = (id)[v2 _accessibilityFocusItemForResponder];

      if (([v11 _accessibilityIsFKARunningForFocusItem] & 1) != 0
        && ([v7 conformsToProtocol:&unk_26F4908D0] & 1) != 0)
      {
        char v6 = v10 & 1;
        id v4 = v7;
        id v5 = v11;
        AXPerformBlockAsynchronouslyOnMainThread();
        objc_storeStrong(&v5, 0);
        objc_storeStrong(&v4, 0);
      }
      objc_storeStrong(&v7, 0);
    }
  }
}

uint64_t __88__UITextInputUIResponderAccessibility__axDrawFocusRingAroundFirstResponderAndMoveFocus___block_invoke(uint64_t a1)
{
  char v6 = 0;
  char v4 = 0;
  BOOL v3 = 0;
  if (*(unsigned char *)(a1 + 48))
  {
    id v7 = (id)[MEMORY[0x263F1C650] focusSystemForEnvironment:*(void *)(a1 + 32)];
    char v6 = 1;
    id v5 = (id)[v7 focusedItem];
    char v4 = 1;
    BOOL v3 = v5 != *(id *)(a1 + 32);
  }
  if (v4) {

  }
  if (v6) {
  if (v3)
  }
    _UIAXAssignFocusToItem();
  uint64_t result = [*(id *)(a1 + 40) _axShouldDrawFocusAroundFirstResponder];
  if (result) {
    return [MEMORY[0x263F1C648] moveRingToFocusItem:*(void *)(a1 + 32) forClient:@"AXFKATextFieldClient"];
  }
  return result;
}

- (id)_accessibilityFocusItemForResponder
{
  return [(UITextInputUIResponderAccessibility *)self _accessibilityTextResponder];
}

- (id)_axTextInputView
{
  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = (id)__UIAccessibilityCastAsProtocol();
  id v6 = 0;
  if (objc_opt_respondsToSelector())
  {
    id v2 = (id)[v7[0] textInputView];
    id v3 = v6;
    id v6 = v2;
  }
  id v5 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);

  return v5;
}

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  id v12 = self;
  SEL v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)UITextInputUIResponderAccessibility;
  if ([(UITextInputUIResponderAccessibility *)&v10 _accessibilityIsFKARunningForFocusItem])
  {
    char v13 = 1;
  }
  else
  {
    id v6 = [(UITextInputUIResponderAccessibility *)v12 _accessibilityTextResponder];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_8;
    }
    id v4 = [(UITextInputUIResponderAccessibility *)v12 _accessibilityTextResponder];
    id location = (id)[v4 nextResponder];

    id v2 = [(UITextInputUIResponderAccessibility *)v12 _accessibilityTextResponder];
    BOOL v5 = location == v2;

    if (v5)
    {
      int v8 = 0;
    }
    else
    {
      char v13 = [location _accessibilityIsFKARunningForFocusItem] & 1;
      int v8 = 1;
    }
    objc_storeStrong(&location, 0);
    if (!v8) {
LABEL_8:
    }
      char v13 = 0;
  }
  return v13 & 1;
}

@end