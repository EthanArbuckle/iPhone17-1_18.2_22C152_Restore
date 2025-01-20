@interface MessageStatusIndicatorManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axIdentificationForMask:(unint64_t)a3;
- (id)_axLabelForMask:(unint64_t)a3;
- (id)_axValueForMask:(unint64_t)a3;
- (id)statusIndicatorImageWithOptionsMask:(unint64_t)a3;
- (void)_accessibilitySetImageNameForImage:(id)a3 options:(unint64_t)a4;
@end

@implementation MessageStatusIndicatorManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MessageStatusIndicatorManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageStatusIndicatorManager", @"statusIndicatorImageWithOptionsMask:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageStatusIndicatorManager", @"statusIndicatorColorWithOptionsMask:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageStatusIndicatorManager", @"effectiveIndicatorOptions", "Q", 0);
}

- (id)_axLabelForMask:(unint64_t)a3
{
  __int16 v3 = a3;
  if ((a3 & 0x40) != 0)
  {
    v14 = accessibilityLocalizedString(@"notify.message");
    v4 = __UIAXStringForVariables();

    if ((v3 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v4 = 0;
  if (a3)
  {
LABEL_5:
    v15 = accessibilityLocalizedString(@"unread");
    uint64_t v5 = __UIAXStringForVariables();

    v4 = (void *)v5;
  }
LABEL_6:
  if ((v3 & 4) != 0)
  {
    v17 = accessibilityLocalizedString(@"flagged");
    uint64_t v8 = __UIAXStringForVariables();

    v4 = (void *)v8;
    if ((v3 & 0x10) == 0)
    {
LABEL_8:
      if ((v3 & 0x80) == 0) {
        goto LABEL_9;
      }
      goto LABEL_19;
    }
  }
  else if ((v3 & 0x10) == 0)
  {
    goto LABEL_8;
  }
  v18 = accessibilityLocalizedString(@"forwarded");
  uint64_t v9 = __UIAXStringForVariables();

  v4 = (void *)v9;
  if ((v3 & 0x80) == 0)
  {
LABEL_9:
    if ((v3 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  v19 = accessibilityLocalizedString(@"muted.message");
  uint64_t v10 = __UIAXStringForVariables();

  v4 = (void *)v10;
  if ((v3 & 8) == 0)
  {
LABEL_10:
    if ((v3 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  v20 = accessibilityLocalizedString(@"replied");
  uint64_t v11 = __UIAXStringForVariables();

  v4 = (void *)v11;
  if ((v3 & 2) == 0)
  {
LABEL_11:
    if ((v3 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  v21 = accessibilityLocalizedString(@"vip.message");
  uint64_t v12 = __UIAXStringForVariables();

  v4 = (void *)v12;
  if ((v3 & 0x100) == 0)
  {
LABEL_12:
    if ((v3 & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_22:
  v22 = accessibilityLocalizedString(@"blockedsender.message");
  uint64_t v13 = __UIAXStringForVariables();

  v4 = (void *)v13;
  if ((v3 & 0x20) != 0)
  {
LABEL_13:
    v16 = accessibilityLocalizedString(@"attachment.message");
    uint64_t v6 = __UIAXStringForVariables();

    v4 = (void *)v6;
  }
LABEL_14:

  return v4;
}

- (id)_axValueForMask:(unint64_t)a3
{
  if ((a3 & 4) != 0)
  {
    uint64_t v6 = 0;
    v7 = &v6;
    uint64_t v8 = 0x3032000000;
    uint64_t v9 = __Block_byref_object_copy__4;
    uint64_t v10 = __Block_byref_object_dispose__4;
    id v11 = 0;
    AXPerformSafeBlock();
    id v4 = (id)v7[5];
    _Block_object_dispose(&v6, 8);

    __int16 v3 = accessibilityLabelForFlagColor(v4);
  }
  else
  {
    __int16 v3 = 0;
  }

  return v3;
}

uint64_t __62__MessageStatusIndicatorManagerAccessibility__axValueForMask___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) statusIndicatorColorWithOptionsMask:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

- (id)_axIdentificationForMask:(unint64_t)a3
{
  __int16 v3 = (__CFString *)((unint64_t)@"statusIndicatorNotify" & ((uint64_t)(a3 << 57) >> 63));
  if ((a3 & 5) != 0) {
    __int16 v3 = @"statusIndicatorUnreadFlagged";
  }
  if ((a3 & 0x10) != 0) {
    __int16 v3 = @"statusIndicatorForwarded";
  }
  if ((a3 & 0x80) != 0) {
    return @"statusIndicatorMuted";
  }
  else {
    return v3;
  }
}

- (id)statusIndicatorImageWithOptionsMask:(unint64_t)a3
{
  unint64_t v5 = [(MessageStatusIndicatorManagerAccessibility *)self safeUnsignedIntegerForKey:@"effectiveIndicatorOptions"] & a3;
  v8.receiver = self;
  v8.super_class = (Class)MessageStatusIndicatorManagerAccessibility;
  uint64_t v6 = [(MessageStatusIndicatorManagerAccessibility *)&v8 statusIndicatorImageWithOptionsMask:a3];
  [(MessageStatusIndicatorManagerAccessibility *)self _accessibilitySetImageNameForImage:v6 options:v5];

  return v6;
}

- (void)_accessibilitySetImageNameForImage:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v9 = [(MessageStatusIndicatorManagerAccessibility *)self _axLabelForMask:a4];
  v7 = [(MessageStatusIndicatorManagerAccessibility *)self _axValueForMask:a4];
  objc_super v8 = [(MessageStatusIndicatorManagerAccessibility *)self _axIdentificationForMask:a4];
  [v6 setAccessibilityLabel:v9];
  [v6 setAccessibilityValue:v7];
  [v6 accessibilitySetIdentification:v8];
}

@end