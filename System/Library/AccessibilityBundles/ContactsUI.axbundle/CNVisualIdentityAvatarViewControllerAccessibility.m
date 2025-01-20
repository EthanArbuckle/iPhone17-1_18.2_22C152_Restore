@interface CNVisualIdentityAvatarViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityCustomContent;
- (id)axAvatarContacts;
- (id)axContactNameForCNContact:(id)a3;
- (id)axContacts;
- (unint64_t)accessibilityTraits;
@end

@implementation CNVisualIdentityAvatarViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNVisualIdentityAvatarViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNVisualIdentityAvatarViewController", @"visualIdentity", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNVisualIdentity", @"contacts", "@", 0);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityCustomContent
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  v21.receiver = self;
  v21.super_class = (Class)CNVisualIdentityAvatarViewControllerAccessibility;
  v4 = [(CNVisualIdentityAvatarViewControllerAccessibility *)&v21 accessibilityCustomContent];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(CNVisualIdentityAvatarViewControllerAccessibility *)self axContacts];
  unint64_t v6 = [v5 count];

  if (v6 >= 3)
  {
    v7 = [(CNVisualIdentityAvatarViewControllerAccessibility *)self axContacts];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [(CNVisualIdentityAvatarViewControllerAccessibility *)self axContactNameForCNContact:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          if (v12)
          {
            v13 = (void *)MEMORY[0x263EFABD0];
            v14 = accessibilityLocalizedString(@"contact");
            v15 = [v13 customContentWithLabel:v14 value:v12];

            [v3 axSafelyAddObject:v15];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v9);
    }
  }

  return v3;
}

- (id)axContactNameForCNContact:(id)a3
{
  id v3 = a3;
  if (!v3
    || ([MEMORY[0x263EFEA20] stringFromContact:v3 style:0],
        (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = [v3 phoneNumbers];
    unint64_t v6 = [v3 emailAddresses];
    if ([v5 count])
    {
      v7 = [v5 firstObject];
      uint64_t v8 = [v7 value];
      v4 = [v8 stringValue];
    }
    else
    {
      if (![v6 count])
      {
        v4 = 0;
        goto LABEL_8;
      }
      v7 = [v6 firstObject];
      v4 = [v7 value];
    }

LABEL_8:
  }

  return v4;
}

- (id)axAvatarContacts
{
  id v3 = [(CNVisualIdentityAvatarViewControllerAccessibility *)self axContacts];
  if ([v3 count])
  {
    v4 = [v3 objectAtIndexedSubscript:0];
    v5 = [(CNVisualIdentityAvatarViewControllerAccessibility *)self axContactNameForCNContact:v4];

    uint64_t v6 = [v3 count];
    if (v6 != 1)
    {
      if (v6 == 2)
      {
        v7 = [v3 objectAtIndexedSubscript:1];
        uint64_t v8 = [(CNVisualIdentityAvatarViewControllerAccessibility *)self axContactNameForCNContact:v7];

        uint64_t v9 = NSString;
        uint64_t v10 = accessibilityLocalizedString(@"avatar.contacts");
        uint64_t v11 = objc_msgSend(v9, "stringWithFormat:", v10, v5, v8);
      }
      else
      {
        v12 = [v3 objectAtIndexedSubscript:1];
        uint64_t v8 = [(CNVisualIdentityAvatarViewControllerAccessibility *)self axContactNameForCNContact:v12];

        v13 = NSString;
        uint64_t v10 = accessibilityLocalizedString(@"avatar.contacts.overflow");
        uint64_t v15 = objc_msgSend(v13, "localizedStringWithFormat:", v10, v8, objc_msgSend(v3, "count") - 2);
        uint64_t v11 = __UIAXStringForVariables();

        v5 = (void *)v15;
      }

      v5 = (void *)v11;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)axContacts
{
  v2 = [(CNVisualIdentityAvatarViewControllerAccessibility *)self safeValueForKey:@"visualIdentity"];
  id v3 = [v2 safeArrayForKey:@"contacts"];

  return v3;
}

@end