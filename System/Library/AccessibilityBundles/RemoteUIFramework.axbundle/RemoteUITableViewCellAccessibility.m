@interface RemoteUITableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_privateAccessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessoriesChanged;
- (void)setRemoteUIAccessoryView:(id)a3;
@end

@implementation RemoteUITableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RemoteUITableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"_imageView:", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"_textLabel:", "@", "B", 0);
  [v3 validateClass:@"RUITableView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RUITableView", @"objectModelRowForIndexPath:", "@", "@", 0);
}

- (void)_accessoriesChanged
{
  v6.receiver = self;
  v6.super_class = (Class)RemoteUITableViewCellAccessibility;
  [(RemoteUITableViewCellAccessibility *)&v6 _accessoriesChanged];
  id v3 = [(RemoteUITableViewCellAccessibility *)self safeValueForKey:@"_remoteUIAccessoryType"];
  int v4 = [v3 intValue];

  if ((v4 & 0xFFFFFFFD) == 1)
  {
    v5 = [(RemoteUITableViewCellAccessibility *)self safeValueForKey:@"_remoteUIAccessoryView"];
    [v5 setIsAccessibilityElement:0];
  }
}

- (void)setRemoteUIAccessoryView:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RemoteUITableViewCellAccessibility;
  [(RemoteUITableViewCellAccessibility *)&v7 setRemoteUIAccessoryView:v4];
  v5 = [(RemoteUITableViewCellAccessibility *)self safeValueForKey:@"_remoteUIAccessoryType"];
  int v6 = [v5 intValue];

  if ((v6 & 0xFFFFFFFD) == 1) {
    [v4 setIsAccessibilityElement:0];
  }
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(RemoteUITableViewCellAccessibility *)self safeValueForKey:@"_remoteUIAccessoryType"];
  int v4 = [v3 intValue];

  if (v4 == 1)
  {
    v5 = (unint64_t *)MEMORY[0x263F1CEE8];
    return *v5;
  }
  if (v4 == 3)
  {
    v5 = (unint64_t *)MEMORY[0x263F1CF38];
    return *v5;
  }
  objc_super v7 = [(RemoteUITableViewCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  LOBYTE(v28) = 0;
  v8 = [v7 dataSource];
  v9 = __UIAccessibilitySafeClass();

  __int16 v34 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __57__RemoteUITableViewCellAccessibility_accessibilityTraits__block_invoke;
  v23 = &unk_2650AACE8;
  v27 = &v28;
  id v10 = v9;
  id v24 = v10;
  id v11 = v7;
  id v25 = v11;
  v26 = self;
  AXPerformSafeBlock();
  id v12 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  v13 = __UIAccessibilitySafeClass();

  if ((_BYTE)v34
    || ([v13 safeValueForKey:@"attributes"],
        v14 = objc_claimAutoreleasedReturnValue(),
        __UIAccessibilitySafeClass(),
        v15 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        HIBYTE(v34)))
  {
    abort();
  }
  v16 = [v15 objectForKey:@"class"];
  int v17 = [v16 isEqualToString:@"link"];

  if (v17)
  {
    id v6 = (id)*MEMORY[0x263F1CEE8];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)RemoteUITableViewCellAccessibility;
    id v6 = [(RemoteUITableViewCellAccessibility *)&v19 accessibilityTraits];
  }

  return (unint64_t)v6;
}

void __57__RemoteUITableViewCellAccessibility_accessibilityTraits__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) indexPathForCell:*(void *)(a1 + 48)];
  uint64_t v3 = [v2 objectModelRowForIndexPath:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_privateAccessibilityCustomActions
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v9[2] = MEMORY[0x263EF8330];
  v9[3] = 3221225472;
  v9[4] = __72__RemoteUITableViewCellAccessibility__privateAccessibilityCustomActions__block_invoke;
  v9[5] = &unk_2650AAD10;
  v9[6] = self;
  v9[7] = &v10;
  AXPerformSafeBlock();
  id v3 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  uint64_t v4 = [v3 accessibilityIdentifier];

  if (v4)
  {
    v9[0] = self;
    v5 = (objc_super *)v9;
  }
  else
  {
    v8 = self;
    v5 = (objc_super *)&v8;
  }
  v5->super_class = (Class)RemoteUITableViewCellAccessibility;
  id v6 = [(objc_super *)v5 _privateAccessibilityCustomActions];

  return v6;
}

uint64_t __72__RemoteUITableViewCellAccessibility__privateAccessibilityCustomActions__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _imageView:0];

  return MEMORY[0x270F9A758]();
}

- (id)accessibilityLabel
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  id v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __56__RemoteUITableViewCellAccessibility_accessibilityLabel__block_invoke;
  int v17 = &unk_2650AAD10;
  v18 = self;
  objc_super v19 = &v20;
  AXPerformSafeBlock();
  id v3 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  uint64_t v4 = [v3 accessibilityLabel];
  LOBYTE(v20) = 0;
  objc_opt_class();
  v5 = [(RemoteUITableViewCellAccessibility *)self safeArrayForKey:@"subviews"];
  id v6 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_1);
  objc_super v7 = [v6 firstObject];
  v8 = __UIAccessibilityCastAsClass();

  if ((_BYTE)v20) {
    abort();
  }
  v13.receiver = self;
  v13.super_class = (Class)RemoteUITableViewCellAccessibility;
  v9 = [(RemoteUITableViewCellAccessibility *)&v13 accessibilityLabel];
  uint64_t v12 = [v8 accessibilityLabel];
  uint64_t v10 = __AXStringForVariables();

  return v10;
}

uint64_t __56__RemoteUITableViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _imageView:0];

  return MEMORY[0x270F9A758]();
}

uint64_t __56__RemoteUITableViewCellAccessibility_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end