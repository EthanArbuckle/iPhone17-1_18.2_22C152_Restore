@interface MFRecipientTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation MFRecipientTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFRecipientTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v3 = [(MFRecipientTableViewCellAccessibility *)self safeValueForKey:@"titleLabel"];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  int v4 = [v3 _accessibilityViewIsVisible];
  v5 = 0;
  if (v4)
  {
    v5 = [v3 accessibilityLabel];
  }
  id v22 = v5;
  char v16 = 0;
  v6 = [(MFRecipientTableViewCellAccessibility *)self safeValueForKey:@"detailLabel"];
  v7 = __UIAccessibilitySafeClass();

  if ([v7 _accessibilityViewIsVisible])
  {
    v8 = [v7 attributedText];
    uint64_t v9 = [v8 length];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__MFRecipientTableViewCellAccessibility_accessibilityLabel__block_invoke;
    v13[3] = &unk_2650A4008;
    id v10 = v8;
    id v14 = v10;
    v15 = &v17;
    objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", @"mf_tintType", 0, v9, 0, v13);
  }
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __59__MFRecipientTableViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v7 = [*(id *)(a1 + 32) string];
  objc_msgSend(v7, "substringWithRange:", a3, a4);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if ([v11 length])
  {
    uint64_t v8 = __UIAXStringForVariables();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

@end