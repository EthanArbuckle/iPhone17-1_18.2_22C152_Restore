@interface MFMailComposeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)presentSearchResults:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (MFMailComposeViewAccessibility)initWithFrame:(CGRect)a3 options:(unint64_t)a4 isQuickReply:(BOOL)a5;
- (id)_accessibilityComposeElementsForSorting;
- (id)_searchResultsTable;
- (id)dragSource:(id)a3 draggableItemsAtPoint:(CGPoint)a4;
- (int64_t)_accessibilityCompareElement:(id)a3 toElement:(id)a4;
- (unint64_t)_axIndexOfRecipient:(id)a3 inArray:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)dropTarget:(id)a3 dragDidMoveToPoint:(CGPoint)a4;
- (void)dropTarget:(id)a3 dragEnteredAtPoint:(CGPoint)a4;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation MFMailComposeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFMailComposeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailComposeView", @"_searchResultsTable", "@", 0);
  [v3 validateClass:@"MFMailComposeView" hasInstanceVariable:@"_toField" withType:"MFMailComposeToField"];
  [v3 validateClass:@"MFMailComposeView" hasInstanceVariable:@"_ccField" withType:"MFMailComposeRecipientTextView"];
  [v3 validateClass:@"MFMailComposeView" hasInstanceVariable:@"_bccField" withType:"MFMailComposeRecipientTextView"];
  [v3 validateClass:@"MFMailComposeView" hasInstanceVariable:@"_fromField" withType:"MFComposeFromView"];
  [v3 validateClass:@"MFMailComposeView" hasInstanceVariable:@"_subjectField" withType:"MFComposeSubjectView"];
  [v3 validateClass:@"MFMailComposeView" hasInstanceVariable:@"_headerView" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailComposeView", @"composeWebView", "@", 0);
  [v3 validateClass:@"MFMailComposeRecipientTextView" hasInstanceVariable:@"_textView" withType:"_CNAtomTextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailComposeView", @"presentSearchResults:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailComposeView", @"scrollViewDidScroll:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailComposeView", @"composeViewDelegate", "@", 0);
  [v3 validateClass:@"MFMailComposeView" hasInstanceVariable:@"_imageSizeField" withType:"MFComposeImageSizeView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailComposeView", @"dropTarget:dragEnteredAtPoint:", "v", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailComposeView", @"dropTarget:dragDidMoveToPoint:", "v", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailComposeView", @"dragSource:draggableItemsAtPoint:", "@", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipientTextView", @"_placeholderAttachmentRange", "{_NSRange=QQ}", 0);
  [v3 validateClass:@"MFMailComposeToField" isKindOfClass:@"MFMailComposeRecipientTextView"];
  [v3 validateClass:@"MFMailComposeRecipientTextView" isKindOfClass:@"CNComposeRecipientTextView"];
  [v3 validateClass:@"MFMailComposeRecipientTextView" hasInstanceVariable:@"_labelView" withType:"CNComposeHeaderLabelView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipientTextView", @"placeholderAttachment", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipientTextView", @"recipients", "@", 0);
  [v3 validateClass:@"MFDropTarget"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipientTextView", @"addButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFDropTarget", @"targetView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipient", @"uncommentedAddress", "@", 0);
  [v3 validateClass:@"WKContentView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)MFMailComposeViewAccessibility;
  [(MFMailComposeViewAccessibility *)&v20 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MFMailComposeViewAccessibility *)self safeValueForKey:@"_toField"];
  v4 = [v3 safeValueForKey:@"_textView"];
  [v4 setAccessibilityIdentifier:@"toField"];
  v5 = [(MFMailComposeViewAccessibility *)self safeValueForKey:@"_ccField"];
  v6 = [v5 safeValueForKey:@"_textView"];

  [v6 setAccessibilityIdentifier:@"ccField"];
  v7 = [(MFMailComposeViewAccessibility *)self safeValueForKey:@"_bccField"];
  v8 = [v7 safeValueForKey:@"_textView"];

  [v8 setAccessibilityIdentifier:@"bccField"];
  v9 = [(MFMailComposeViewAccessibility *)self safeValueForKey:@"_searchResultsTable"];
  [v9 setAccessibilityIdentifier:@"MessageRecipientSearchTable"];

  v10 = [(MFMailComposeViewAccessibility *)self _accessibilityComposeElementsForSorting];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v15 _accessibilitySetUsesScrollParentForOrdering:0];
        [v15 _enumerateDescendentViews:&__block_literal_global_2];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v12);
  }
}

uint64_t __76__MFMailComposeViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilitySetUsesScrollParentForOrdering:0];
}

- (int64_t)_accessibilityCompareElement:(id)a3 toElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MFMailComposeViewAccessibility *)self _accessibilityComposeElementsForSorting];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v31 = [v8 indexOfObject:v6];
  if (v29[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __73__MFMailComposeViewAccessibility__accessibilityCompareElement_toElement___block_invoke;
    v25[3] = &unk_2650A3FB8;
    v27 = &v28;
    id v26 = v8;
    id v9 = (id)[v6 _accessibilityFindAncestor:v25 startWithSelf:0];
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v24 = [v8 indexOfObject:v7];
  if (v22[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    long long v17 = __73__MFMailComposeViewAccessibility__accessibilityCompareElement_toElement___block_invoke_2;
    long long v18 = &unk_2650A3FB8;
    objc_super v20 = &v21;
    id v19 = v8;
    id v10 = (id)[v7 _accessibilityFindAncestor:&v15 startWithSelf:0];
  }
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", v29[3], v15, v16, v17, v18);
  uint64_t v12 = [NSNumber numberWithInteger:v22[3]];
  int64_t v13 = [v11 compare:v12];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

BOOL __73__MFMailComposeViewAccessibility__accessibilityCompareElement_toElement___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) indexOfObject:a2];
  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL;
}

BOOL __73__MFMailComposeViewAccessibility__accessibilityCompareElement_toElement___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) indexOfObject:a2];
  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_accessibilityComposeElementsForSorting
{
  id v3 = [(MFMailComposeViewAccessibility *)self safeUIViewForKey:@"_toField"];
  id v15 = (id)MEMORY[0x263EFF8C0];
  long long v17 = v3;
  long long v18 = [v3 safeUIViewForKey:@"_textView"];
  v4 = [v3 safeUIViewForKey:@"addButton"];
  v5 = [(MFMailComposeViewAccessibility *)self safeUIViewForKey:@"_headerView"];
  id v6 = [(MFMailComposeViewAccessibility *)self safeUIViewForKey:@"_ccField"];
  id v7 = [(MFMailComposeViewAccessibility *)self safeUIViewForKey:@"_bccField"];
  v8 = [(MFMailComposeViewAccessibility *)self safeUIViewForKey:@"_fromField"];
  id v9 = [(MFMailComposeViewAccessibility *)self safeUIViewForKey:@"_imageSizeField"];
  id v10 = [(MFMailComposeViewAccessibility *)self safeUIViewForKey:@"_subjectField"];
  uint64_t v11 = [(MFMailComposeViewAccessibility *)self safeUIViewForKey:@"composeWebView"];
  uint64_t v12 = [v11 _accessibilityFindSubviewDescendant:&__block_literal_global_389];
  int64_t v13 = [(MFMailComposeViewAccessibility *)self safeUIViewForKey:@"_searchResultsTable"];
  objc_msgSend(v15, "axArrayByIgnoringNilElementsWithCount:", 10, v18, v4, v5, v6, v7, v8, v9, v10, v12, v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __73__MFMailComposeViewAccessibility__accessibilityComposeElementsForSorting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Wkcontentview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (MFMailComposeViewAccessibility)initWithFrame:(CGRect)a3 options:(unint64_t)a4 isQuickReply:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)MFMailComposeViewAccessibility;
  v5 = -[MFMailComposeViewAccessibility initWithFrame:options:isQuickReply:](&v7, sel_initWithFrame_options_isQuickReply_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MFMailComposeViewAccessibility *)v5 _accessibilityLoadAccessibilityInformation];

  return v5;
}

- (id)_searchResultsTable
{
  v4.receiver = self;
  v4.super_class = (Class)MFMailComposeViewAccessibility;
  id v2 = [(MFMailComposeViewAccessibility *)&v4 _searchResultsTable];
  [v2 setAccessibilityIdentifier:@"MessageRecipientSearchTable"];

  return v2;
}

- (BOOL)presentSearchResults:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFMailComposeViewAccessibility;
  BOOL v3 = [(MFMailComposeViewAccessibility *)&v5 presentSearchResults:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  return v3;
}

- (void)scrollViewDidScroll:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeViewAccessibility;
  [(MFMailComposeViewAccessibility *)&v3 scrollViewDidScroll:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (id)dragSource:(id)a3 draggableItemsAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  char v12 = 0;
  objc_opt_class();
  v11.receiver = self;
  v11.super_class = (Class)MFMailComposeViewAccessibility;
  v8 = -[MFMailComposeViewAccessibility dragSource:draggableItemsAtPoint:](&v11, sel_dragSource_draggableItemsAtPoint_, v7, x, y);
  id v9 = __UIAccessibilityCastAsClass();

  if (v12) {
    abort();
  }
  if (v9) {
    [(MFMailComposeViewAccessibility *)self _accessibilitySetRetainedValue:v9 forKey:@"_axDragItems"];
  }

  return v9;
}

- (void)dropTarget:(id)a3 dragEnteredAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MFMailComposeViewAccessibility;
  -[MFMailComposeViewAccessibility dropTarget:dragEnteredAtPoint:](&v21, sel_dropTarget_dragEnteredAtPoint_, v7, x, y);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v8 = [v7 safeValueForKey:@"targetView"];
    NSClassFromString(&cfstr_Mfmailcomposer.isa);
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 safeValueForKey:@"_labelView"];
      id v10 = v9;
      if (v9)
      {
        objc_super v11 = [v9 accessibilityLabel];
        char v12 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        int64_t v13 = [v11 stringByTrimmingCharactersInSet:v12];

        v14 = [MEMORY[0x263F08708] punctuationCharacterSet];
        id v15 = [v13 stringByTrimmingCharactersInSet:v14];

        id v16 = NSString;
        long long v17 = accessibilityLocalizedString(@"dragged.address.to");
        long long v18 = objc_msgSend(v16, "stringWithFormat:", v17, v15);

        UIAccessibilityNotifications v19 = *MEMORY[0x263F1CDC8];
        UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v18);
        objc_super v20 = [MEMORY[0x263EFF910] date];
        [(MFMailComposeViewAccessibility *)self _accessibilitySetRetainedValue:v20 forKey:@"_axDragEnteredDate"];
      }
      else
      {
        UIAccessibilityNotifications v19 = *MEMORY[0x263F1CDC8];
      }
      UIAccessibilityPostNotification(v19, (id)*MEMORY[0x263F21980]);
    }
  }
}

- (void)dropTarget:(id)a3 dragDidMoveToPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MFMailComposeViewAccessibility;
  -[MFMailComposeViewAccessibility dropTarget:dragDidMoveToPoint:](&v39, sel_dropTarget_dragDidMoveToPoint_, v7, x, y);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v8 = [v7 safeValueForKey:@"targetView"];
    NSClassFromString(&cfstr_Mfmailcomposer.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_31:

      goto LABEL_32;
    }
    id v9 = [v8 safeValueForKey:@"placeholderAttachment"];
    if (!v9)
    {
LABEL_30:

      goto LABEL_31;
    }
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3010000000;
    v36 = &unk_2401FD50B;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    id v32 = v8;
    AXPerformSafeBlock();
    unint64_t v10 = v34[4];

    _Block_object_dispose(&v33, 8);
    objc_super v11 = [(MFMailComposeViewAccessibility *)self _accessibilityValueForKey:@"_axDragItems"];
    char v12 = [v32 safeValueForKey:@"recipients"];
    uint64_t v13 = [(MFMailComposeViewAccessibility *)self _accessibilityIntegerValueForKey:@"_axDragPlaceholderIndex"];
    if ([v11 count] && v10 != 0x7FFFFFFFFFFFFFFFLL && v10 != v13)
    {
      [(MFMailComposeViewAccessibility *)self _accessibilitySetIntegerValue:v10 forKey:@"_axDragPlaceholderIndex"];
      v14 = [v11 firstObject];
      unint64_t v15 = [(MFMailComposeViewAccessibility *)self _axIndexOfRecipient:v14 inArray:v12];

      uint64_t v16 = [v11 count];
      unint64_t v17 = v15 == 0x7FFFFFFFFFFFFFFFLL ? 0 : v15;
      uint64_t v18 = v15 == 0x7FFFFFFFFFFFFFFFLL ? 0 : v16;
      if ([v12 count])
      {
        if (v10 <= v17 + v18)
        {
          if (v10) {
            BOOL v22 = 0;
          }
          else {
            BOOL v22 = v15 == 0x7FFFFFFFFFFFFFFFLL;
          }
          if (v22 || v10 < v17)
          {
            UIAccessibilityNotifications v19 = [v12 objectAtIndex:v10];
            objc_super v20 = NSString;
            objc_super v21 = @"moved.address.before";
LABEL_23:
            uint64_t v23 = accessibilityLocalizedString(v21);
            uint64_t v24 = [v19 safeValueForKey:@"displayString"];
            v25 = objc_msgSend(v20, "stringWithFormat:", v23, v24);

            if (v25)
            {
              id v26 = [(MFMailComposeViewAccessibility *)self _accessibilityValueForKey:@"_axDragEnteredDate"];
              if (v26
                && ([MEMORY[0x263EFF910] date],
                    v27 = objc_claimAutoreleasedReturnValue(),
                    [v27 timeIntervalSinceDate:v26],
                    double v29 = v28,
                    v27,
                    v29 <= 1.0))
              {
                UIAccessibilityNotifications v30 = *MEMORY[0x263F1CDC8];
              }
              else
              {
                UIAccessibilityNotifications v30 = *MEMORY[0x263F1CDC8];
                UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v25);
                uint64_t v31 = [MEMORY[0x263EFF910] date];
                [(MFMailComposeViewAccessibility *)self _accessibilitySetRetainedValue:v31 forKey:@"_axDragEnteredDate"];
              }
              UIAccessibilityPostNotification(v30, (id)*MEMORY[0x263F21980]);
            }
          }
        }
        else if (v10 <= [v12 count])
        {
          UIAccessibilityNotifications v19 = [v12 objectAtIndex:v10 - 1];
          objc_super v20 = NSString;
          objc_super v21 = @"moved.address.after";
          goto LABEL_23;
        }
      }
    }

    goto LABEL_30;
  }
LABEL_32:
}

uint64_t __64__MFMailComposeViewAccessibility_dropTarget_dragDidMoveToPoint___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _placeholderAttachmentRange];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = result;
  *(void *)(v3 + 40) = v4;
  return result;
}

- (unint64_t)_axIndexOfRecipient:(id)a3 inArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  Class v7 = NSClassFromString(&cfstr_Mfcomposerecip.isa);
  uint64_t v8 = [v6 count];
  unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 && v8 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__MFMailComposeViewAccessibility__axIndexOfRecipient_inArray___block_invoke;
    v11[3] = &unk_2650A3FE0;
    Class v14 = v7;
    id v12 = v5;
    uint64_t v13 = &v15;
    [v6 enumerateObjectsUsingBlock:v11];
    unint64_t v9 = v16[3];

    _Block_object_dispose(&v15, 8);
  }

  return v9;
}

void __62__MFMailComposeViewAccessibility__axIndexOfRecipient_inArray___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if (objc_opt_isKindOfClass())
  {
    Class v7 = [v10 safeStringForKey:@"uncommentedAddress"];
    uint64_t v8 = [*(id *)(a1 + 32) safeStringForKey:@"uncommentedAddress"];
    int v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }
}

@end