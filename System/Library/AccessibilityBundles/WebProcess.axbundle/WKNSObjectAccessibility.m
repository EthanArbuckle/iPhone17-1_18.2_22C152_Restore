@interface WKNSObjectAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsVisibleByCompleteHitTest;
- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4;
- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 toElementMatchingQuery:(id)a4;
- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5;
- (id)_accessibilityFirstElementForFocusForRemoteElement;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4;
- (id)accessibilityHitTest:(CGPoint)a3;
@end

@implementation WKNSObjectAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NSObject";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(WKNSObjectAccessibility *)self isAccessibilityElement]
    && ([(WKNSObjectAccessibility *)self accessibilityFrame],
        v21.double x = x,
        v21.double y = y,
        CGRectContainsPoint(v22, v21)))
  {
    v6 = self;
  }
  else
  {
    [(WKNSObjectAccessibility *)self accessibilityElements];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
LABEL_6:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "accessibilityHitTest:", x, y, (void)v14);
        v12 = (WKNSObjectAccessibility *)objc_claimAutoreleasedReturnValue();
        v6 = v12;
        if (v12)
        {
          if ([(WKNSObjectAccessibility *)v12 isAccessibilityElement]) {
            break;
          }
        }

        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v9) {
            goto LABEL_6;
          }
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      v6 = 0;
    }
  }

  return v6;
}

- (id)_accessibilityFirstElementForFocusForRemoteElement
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(WKNSObjectAccessibility *)self _accessibilityResponderElement];
    v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [(WKNSObjectAccessibility *)self _accessibilityFirstDescendant];
    }
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a3 == 95250 && (isKindOfClass & 1) != 0)
  {
    uint64_t v8 = [(WKNSObjectAccessibility *)self _accessibilityFirstElementForFocusForRemoteElement];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WKNSObjectAccessibility;
    uint64_t v8 = [(WKNSObjectAccessibility *)&v11 _iosAccessibilityAttributeValue:a3 forParameter:v6];
  }
  uint64_t v9 = (void *)v8;

  return v9;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[WKNSObjectAccessibility _iosAccessibilityAttributeValue:](&v10, sel__iosAccessibilityAttributeValue_, a3, self, WKNSObjectAccessibility, v11.receiver, v11.super_class);
    goto LABEL_8;
  }
  if (a3 > 3022)
  {
    if ((unint64_t)(a3 - 3023) >= 2)
    {
      if (a3 != 3050) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
    id v6 = [(WKNSObjectAccessibility *)self accessibilityElementAtIndex:0];
    uint64_t v7 = [v6 _accessibilityResponderElementForFocus];
  }
  else
  {
    if (a3 == 3000)
    {
      uint64_t v5 = [(WKNSObjectAccessibility *)self _accessibilityUnignoredDescendant];
      goto LABEL_14;
    }
    if (a3 != 3002)
    {
      if (a3 != 3009)
      {
LABEL_6:
        -[WKNSObjectAccessibility _iosAccessibilityAttributeValue:](&v11, sel__iosAccessibilityAttributeValue_, a3, v10.receiver, v10.super_class, self, WKNSObjectAccessibility);
        uint64_t v5 = LABEL_8:;
LABEL_14:
        uint64_t v8 = (void *)v5;
        goto LABEL_17;
      }
LABEL_12:
      uint64_t v5 = [(WKNSObjectAccessibility *)self _accessibilityFirstElementForFocusForRemoteElement];
      goto LABEL_14;
    }
    id v6 = [(WKNSObjectAccessibility *)self accessibilityElementAtIndex:0];
    uint64_t v7 = [v6 _accessibilityResponderElement];
  }
  uint64_t v8 = (void *)v7;

LABEL_17:

  return v8;
}

- (BOOL)_accessibilityIsVisibleByCompleteHitTest
{
  return [(WKNSObjectAccessibility *)self _accessibilityIsVisibleByCompleteHitTest:0];
}

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  if (v6 == 5300)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 count] == 2)
    {
      v12 = [(WKNSObjectAccessibility *)self accessibilityElements];
      v13 = [v12 firstObject];
      long long v14 = [v8 firstObject];
      unsigned __int8 v17 = objc_msgSend(v13, "_accessibilityMoveFocusWithHeading:toElementMatchingQuery:", objc_msgSend(v14, "unsignedIntegerValue"), 0);
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  if (v6 != 5304)
  {
    v19.receiver = self;
    v19.super_class = (Class)WKNSObjectAccessibility;
    unsigned __int8 v17 = [(WKNSObjectAccessibility *)&v19 _iosAccessibilityPerformAction:v6 withValue:v8 fencePort:v5];
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v8 count] != 2) {
    goto LABEL_14;
  }
  uint64_t v9 = [v8 objectAtIndex:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_14;
  }
  objc_super v10 = [v8 objectAtIndex:1];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_14:
    unsigned __int8 v17 = 0;
    goto LABEL_15;
  }
  v12 = [(WKNSObjectAccessibility *)self accessibilityElements];
  v13 = [v12 firstObject];
  long long v14 = [v8 firstObject];
  uint64_t v15 = [v14 unsignedIntegerValue];
  long long v16 = [v8 lastObject];
  unsigned __int8 v17 = [v13 _accessibilityMoveFocusWithHeading:v15 toElementMatchingQuery:v16];

LABEL_11:
LABEL_15:

  return v17;
}

- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 toElementMatchingQuery:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(WKNSObjectAccessibility *)self accessibilityElementAtIndex:0];
  LOBYTE(a3) = [v7 _accessibilityMoveFocusWithHeading:a3 toElementMatchingQuery:v6];

  return a3;
}

- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4
{
  uint64_t v5 = -[WKNSObjectAccessibility accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", 0, a4);
  LOBYTE(a3) = [v5 _accessibilityMoveFocusWithHeading:a3 toElementMatchingQuery:0];

  return a3;
}

@end