@interface MFCollapsedMessageCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)prepareForReuse;
@end

@implementation MFCollapsedMessageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFCollapsedMessageCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFCollapsedMessageCell", @"verticalStatusIndicatorManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFCollapsedMessageCell", @"horizontalStatusIndicatorManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageViewStatusIndicatorManager", @"statusIndicatorImageViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFCollapsedMessageCell", @"senderOrSubjectLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFCollapsedMessageCell", @"timestampLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFCollapsedMessageCell", @"summaryLabel", "@", 0);
  [v3 validateClass:@"MailActionViewHeader"];
  [v3 validateClass:@"MailActionViewHeader" isKindOfClass:@"MFCollapsedMessageCell"];
  [v3 validateClass:@"MFCollapsedMessageCell" isKindOfClass:@"UICollectionViewCell"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)MFCollapsedMessageCellAccessibility;
  unint64_t v2 = [(MFCollapsedMessageCellAccessibility *)&v6 accessibilityTraits];
  NSClassFromString(&cfstr_Mailactionview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v4 = *MEMORY[0x263F1CEF8];
  if ((isKindOfClass & 1) == 0) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (id)accessibilityLabel
{
  NSClassFromString(&cfstr_Mailactionview.isa);
  if (objc_opt_isKindOfClass())
  {
    id v3 = [(MFCollapsedMessageCellAccessibility *)self safeValueForKey:@"senderOrSubjectLabel"];
    uint64_t v4 = [v3 accessibilityLabel];
    objc_opt_class();
    v5 = [(MFCollapsedMessageCellAccessibility *)self safeValueForKey:@"summaryLabel"];
    objc_super v6 = __UIAccessibilityCastAsClass();

    v7 = accessibilityApproximateVisibleSummaryText(self, v6);
    v8 = __UIAXStringForVariables();
  }
  else
  {
    objc_opt_class();
    v9 = [(MFCollapsedMessageCellAccessibility *)self safeValueForKey:@"verticalStatusIndicatorManager"];
    v10 = [v9 safeValueForKey:@"statusIndicatorImageViews"];
    v11 = __UIAccessibilityCastAsClass();

    v12 = MEMORY[0x245654F80](v11);

    objc_opt_class();
    v13 = [(MFCollapsedMessageCellAccessibility *)self safeValueForKey:@"horizontalStatusIndicatorManager"];
    v14 = [v13 safeValueForKey:@"statusIndicatorImageViews"];
    v15 = __UIAccessibilityCastAsClass();

    v19 = MEMORY[0x245654F80](v15);
    id v3 = __UIAXStringForVariables();

    objc_opt_class();
    uint64_t v4 = __UIAccessibilityCastAsSafeCategory();
    objc_super v6 = objc_msgSend(v4, "_accessibilityMessageIndexDescription", v19, @"__AXStringForVariablesSentinel");
    v7 = accessibilityLocalizedString(@"conversation.cell.collapsed");
    v16 = [(MFCollapsedMessageCellAccessibility *)self safeValueForKey:@"senderOrSubjectLabel"];
    v17 = [(MFCollapsedMessageCellAccessibility *)self safeValueForKey:@"timestampLabel"];
    v20 = [(MFCollapsedMessageCellAccessibility *)self safeValueForKey:@"summaryLabel"];
    v8 = __AXStringForVariables();
  }

  return v8;
}

- (id)accessibilityHint
{
  NSClassFromString(&cfstr_Mailactionview.isa);
  if (objc_opt_isKindOfClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)MFCollapsedMessageCellAccessibility;
    id v3 = [(MFCollapsedMessageCellAccessibility *)&v5 accessibilityHint];
  }
  else
  {
    id v3 = accessibilityLocalizedString(@"conversation.cell.collapsed.hint");
  }

  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MFCollapsedMessageCellAccessibility;
  [(MFCollapsedMessageCellAccessibility *)&v3 prepareForReuse];
  [(MFCollapsedMessageCellAccessibility *)self _accessibilitySetRetainedValue:0 forKey:@"ApproximateVisibleSummary"];
}

@end