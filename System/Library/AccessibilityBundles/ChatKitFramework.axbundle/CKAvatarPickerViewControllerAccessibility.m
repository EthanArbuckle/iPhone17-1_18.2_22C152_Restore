@interface CKAvatarPickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsBusinessConversation;
- (BOOL)_axIsPancakeMode;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)_axConversationRecipientsCount;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axExecuteBlockOnAvatarCells:(id)a3;
- (void)_axExposeTitleViewIfNeeded;
- (void)_handleConversationRecipientsDidChange:(id)a3;
- (void)setTitleView:(id)a3;
@end

@implementation CKAvatarPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAvatarPickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKAvatarCollectionViewCell"];
  [v3 validateClass:@"CKGroupCollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"recipients", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAvatarPickerViewController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAvatarPickerViewController", @"conversation", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAvatarPickerViewController", @"layout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAvatarPickerViewController", @"titleView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAvatarPickerViewController", @"setTitleView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAvatarPickerViewController", @"_handleConversationRecipientsDidChange:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAvatarPickerViewController", @"collectionView:cellForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAvatarPickerViewController", @"groupAvatarViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNGroupAvatarViewController", @"avatarViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"isBusinessConversation", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAvatarPickerLayout", @"layoutMode", "Q", 0);
}

- (BOOL)_axIsPancakeMode
{
  v2 = [(CKAvatarPickerViewControllerAccessibility *)self safeValueForKey:@"layout"];
  BOOL v3 = [v2 safeUnsignedIntegerForKey:@"layoutMode"] == 0;

  return v3;
}

- (void)_axExecuteBlockOnAvatarCells:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *, void))a3;
  char v17 = 0;
  objc_opt_class();
  v5 = [(CKAvatarPickerViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v6 = __UIAccessibilityCastAsClass();

  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = objc_msgSend(v6, "visibleCells", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        NSClassFromString(&cfstr_Ckavatarcollec_0.isa);
        if (objc_opt_isKindOfClass())
        {
          v4[2](v4, v6, v12);
        }
        else
        {
          NSClassFromString(&cfstr_Ckgroupcollect_0.isa);
          if (objc_opt_isKindOfClass())
          {
            v4[2](v4, v6, v12);
            goto LABEL_13;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)CKAvatarPickerViewControllerAccessibility;
  [(CKAvatarPickerViewControllerAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  [(CKAvatarPickerViewControllerAccessibility *)self _axExposeTitleViewIfNeeded];
  LOBYTE(location) = 0;
  objc_opt_class();
  BOOL v3 = [(CKAvatarPickerViewControllerAccessibility *)self safeValueForKeyPath:@"conversation.recipients"];
  v4 = __UIAccessibilityCastAsClass();

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __87__CKAvatarPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9[3] = &unk_265112FF0;
  id v5 = v4;
  id v10 = v5;
  v11 = self;
  [(CKAvatarPickerViewControllerAccessibility *)self _axExecuteBlockOnAvatarCells:v9];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __87__CKAvatarPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v6[3] = &unk_265113018;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  [(CKAvatarPickerViewControllerAccessibility *)self _axExecuteBlockOnAvatarCells:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __87__CKAvatarPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  id v7 = __UIAccessibilityCastAsSafeCategory();
  uint64_t v8 = [v5 indexPathForCell:v6];
  unint64_t v9 = [v8 item];
  if (v9 < [*(id *)(a1 + 32) count])
  {
    id v10 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(v8, "item"));
    [v7 _axSetCKEntity:v10];
    objc_msgSend(v7, "setIsAccessibilityElement:", objc_msgSend(*(id *)(a1 + 40), "_axIsPancakeMode"));
  }
}

void __87__CKAvatarPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) safeValueForKeyPath:@"groupAvatarViewController.avatarViewController"];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __87__CKAvatarPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v10[3] = &unk_265112E38;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  [v6 _setIsAccessibilityElementBlock:v10];
  uint64_t v8 = [v7 accessibilityCustomContent];
  [v6 setAccessibilityCustomContent:v8];

  unint64_t v9 = [v7 accessibilityLabel];
  [v6 setAccessibilityLabel:v9];

  objc_msgSend(v6, "setAccessibilityTraits:", objc_msgSend(v7, "accessibilityTraits"));
  objc_destroyWeak(&v11);
}

uint64_t __87__CKAvatarPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _accessibilityIsBusinessConversation] ^ 1;

  return v2;
}

- (void)setTitleView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKAvatarPickerViewControllerAccessibility;
  [(CKAvatarPickerViewControllerAccessibility *)&v4 setTitleView:a3];
  [(CKAvatarPickerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_handleConversationRecipientsDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKAvatarPickerViewControllerAccessibility;
  [(CKAvatarPickerViewControllerAccessibility *)&v4 _handleConversationRecipientsDidChange:a3];
  [(CKAvatarPickerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKAvatarPickerViewControllerAccessibility;
  id v5 = [(CKAvatarPickerViewControllerAccessibility *)&v7 collectionView:a3 cellForItemAtIndexPath:a4];
  NSClassFromString(&cfstr_Ckavatarcollec_0.isa);
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIsAccessibilityElement:", -[CKAvatarPickerViewControllerAccessibility _axIsPancakeMode](self, "_axIsPancakeMode"));
  }

  return v5;
}

- (void)_axExposeTitleViewIfNeeded
{
  LOBYTE(location) = 0;
  objc_opt_class();
  BOOL v3 = [(CKAvatarPickerViewControllerAccessibility *)self safeValueForKey:@"titleView"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__CKAvatarPickerViewControllerAccessibility__axExposeTitleViewIfNeeded__block_invoke;
  v5[3] = &unk_265112E38;
  objc_copyWeak(&v6, &location);
  [v4 _setIsAccessibilityElementBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __71__CKAvatarPickerViewControllerAccessibility__axExposeTitleViewIfNeeded__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _axConversationRecipientsCount] > 1)
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v3 = objc_loadWeakRetained(v1);
    uint64_t v4 = [v3 _accessibilityIsBusinessConversation];
  }
  return v4;
}

- (int64_t)_axConversationRecipientsCount
{
  uint64_t v2 = [(CKAvatarPickerViewControllerAccessibility *)self safeValueForKeyPath:@"self.conversation.recipients.@count"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)_accessibilityIsBusinessConversation
{
  uint64_t v2 = [(CKAvatarPickerViewControllerAccessibility *)self safeValueForKey:@"conversation"];
  char v3 = [v2 safeBoolForKey:@"isBusinessConversation"];

  return v3;
}

@end