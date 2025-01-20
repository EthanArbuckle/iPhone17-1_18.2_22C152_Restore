@interface PXCaptionHashtagsEntryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsHandwriting;
- (BOOL)isAccessibilityElement;
- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3;
- (_NSRange)_accessibilitySelectedTextRange;
- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)moreButtonTapped:(id)a3;
@end

@implementation PXCaptionHashtagsEntryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXCaptionHashtagsEntryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCaptionHashtagsEntryView", @"isEditing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCaptionHashtagsEntryView", @"textView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCaptionHashtagsEntryView", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCaptionHashtagsEntryView", @"moreButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCaptionHashtagsEntryView", @"moreButtonTapped:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)[(PXCaptionHashtagsEntryViewAccessibility *)self safeValueForKey:@"textView"];
}

- (id)accessibilityLabel
{
  v2 = [(PXCaptionHashtagsEntryViewAccessibility *)self _accessibilityTextViewTextOperationResponder];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  id v3 = [(PXCaptionHashtagsEntryViewAccessibility *)self safeStringForKey:@"text"];
  if (![v3 length])
  {
    v4 = [(PXCaptionHashtagsEntryViewAccessibility *)self _accessibilityTextViewTextOperationResponder];
    uint64_t v5 = [v4 accessibilityValue];

    id v3 = (void *)v5;
  }

  return v3;
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(PXCaptionHashtagsEntryViewAccessibility *)self _accessibilityTextViewTextOperationResponder];
  v6 = objc_msgSend(v5, "_accessibilityLineNumberAndColumnForPoint:", x, y);

  return v6;
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXCaptionHashtagsEntryViewAccessibility *)self _accessibilityTextViewTextOperationResponder];
  uint64_t v6 = [v5 _accessibilityRangeForLineNumberAndColumn:v4];
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(PXCaptionHashtagsEntryViewAccessibility *)self _accessibilityTextViewTextOperationResponder];
  objc_msgSend(v5, "_accessibilitySetSelectedTextRange:", location, length);
}

- (_NSRange)_accessibilitySelectedTextRange
{
  v2 = [(PXCaptionHashtagsEntryViewAccessibility *)self _accessibilityTextViewTextOperationResponder];
  uint64_t v3 = [v2 _accessibilitySelectedTextRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F21B60] | *MEMORY[0x263F81408];
  int v3 = [(PXCaptionHashtagsEntryViewAccessibility *)self safeBoolForKey:@"isEditing"];
  uint64_t v4 = *MEMORY[0x263F81398];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v2 | v4;
}

- (BOOL)_accessibilitySupportsHandwriting
{
  unint64_t v3 = [(PXCaptionHashtagsEntryViewAccessibility *)self accessibilityTraits];
  if ((*MEMORY[0x263F81398] & ~v3) == 0) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)PXCaptionHashtagsEntryViewAccessibility;
  return [(PXCaptionHashtagsEntryViewAccessibility *)&v5 _accessibilitySupportsHandwriting];
}

- (id)_accessibilitySupplementaryFooterViews
{
  unint64_t v3 = [(PXCaptionHashtagsEntryViewAccessibility *)self safeValueForKey:@"moreButton"];
  uint64_t v4 = (void *)MEMORY[0x263EFF980];
  v11.receiver = self;
  v11.super_class = (Class)PXCaptionHashtagsEntryViewAccessibility;
  objc_super v5 = [(PXCaptionHashtagsEntryViewAccessibility *)&v11 _accessibilitySupplementaryFooterViews];
  NSUInteger v6 = objc_msgSend(v4, "axArrayWithPossiblyNilArrays:", 1, v5);
  NSUInteger v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF980] array];
  }
  NSUInteger v9 = v8;

  if ([v3 _accessibilityViewIsVisible]) {
    [v9 axSafelyAddObject:v3];
  }

  return v9;
}

- (void)moreButtonTapped:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCaptionHashtagsEntryViewAccessibility;
  [(PXCaptionHashtagsEntryViewAccessibility *)&v4 moreButtonTapped:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
}

- (unint64_t)_accessibilityAutomationType
{
  return 52;
}

- (id)accessibilityIdentifier
{
  return @"Caption Entry View";
}

@end