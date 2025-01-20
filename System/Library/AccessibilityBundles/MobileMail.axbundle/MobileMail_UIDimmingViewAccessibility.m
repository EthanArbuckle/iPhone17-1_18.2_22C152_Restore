@interface MobileMail_UIDimmingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityObscuredScreenAllowedViews;
@end

@implementation MobileMail_UIDimmingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIDimmingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MailActionsViewController"];
  [v3 validateClass:@"MFModernAddressAtom"];
  [v3 validateClass:@"UIDimmingView" isKindOfClass:@"UIView"];
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)MobileMail_UIDimmingViewAccessibility;
  [(MobileMail_UIDimmingViewAccessibility *)&v16 _accessibilityObscuredScreenAllowedViews];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        NSClassFromString(&cfstr_Mfmodernaddres.isa);
        if (objc_opt_isKindOfClass())
        {

          v9 = [(MobileMail_UIDimmingViewAccessibility *)self safeValueForKey:@"superview", v12];
          v8 = [v9 _accessibilityFindDescendant:&__block_literal_global_14];

          if (v8)
          {
            uint64_t v10 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_287);

            id v3 = (id)v10;
          }
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v8 = v3;
LABEL_12:

  return v3;
}

@end