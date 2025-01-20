@interface CKMessageAcknowledgmentPickerBarItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityLabelForAcknowledgmentType;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
@end

@implementation CKMessageAcknowledgmentPickerBarItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMessageAcknowledgmentPickerBarItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageAcknowledgmentPickerBarItemView", @"messageAcknowledgmentType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageAcknowledgmentPickerBarItemView", @"isSelected", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageAcknowledgmentPickerBarItemView", @"itemButtonTapped:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)CKMessageAcknowledgmentPickerBarItemViewAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(CKMessageAcknowledgmentPickerBarItemViewAccessibility *)&v7 accessibilityTraits];
  int v4 = [(CKMessageAcknowledgmentPickerBarItemViewAccessibility *)self safeBoolForKey:@"isSelected"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"acknowledgment.hint");
}

- (BOOL)accessibilityActivate
{
  return 1;
}

uint64_t __78__CKMessageAcknowledgmentPickerBarItemViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) itemButtonTapped:0];
}

- (id)_accessibilityLabelForAcknowledgmentType
{
  v2 = [(CKMessageAcknowledgmentPickerBarItemViewAccessibility *)self safeValueForKey:@"messageAcknowledgmentType"];
  uint64_t v3 = [v2 integerValue];

  int v4 = @"acknowledgment.type.heart";
  if (!(!v6 & v5))
  {
    switch(v3)
    {
      case 2000:
        goto LABEL_10;
      case 2001:
        goto LABEL_5;
      case 2002:
        goto LABEL_6;
      case 2003:
        goto LABEL_7;
      case 2004:
        goto LABEL_8;
      case 2005:
        goto LABEL_9;
      default:
        JUMPOUT(0);
    }
  }
  switch(v3)
  {
    case 3000:
      goto LABEL_10;
    case 3001:
LABEL_5:
      int v4 = @"acknowledgment.type.thumbs.up";
      goto LABEL_10;
    case 3002:
LABEL_6:
      int v4 = @"acknowledgment.type.thumbs.down";
      goto LABEL_10;
    case 3003:
LABEL_7:
      int v4 = @"acknowledgment.type.ha";
      goto LABEL_10;
    case 3004:
LABEL_8:
      int v4 = @"acknowledgment.type.exclamation";
      goto LABEL_10;
    case 3005:
LABEL_9:
      int v4 = @"acknowledgment.type.question.mark";
LABEL_10:
      objc_super v7 = accessibilityLocalizedString(v4);
      break;
    default:
      objc_super v7 = 0;
      break;
  }

  return v7;
}

@end