@interface SBIconAccessibility
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axIconLabel;
- (id)_axIconValue;
- (id)_axIconView;
- (id)accessibilityIdentifier;
- (unint64_t)_accessibilityAutomationType;
- (void)dealloc;
@end

@implementation SBIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBIcon";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBIcon" hasInstanceVariable:@"_observers" withType:"NSHashTable"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"displayNameForLocation:", "@", "@", 0);
  [v3 validateClass:@"SBIconView" hasInstanceVariable:@"_accessoryView" withType:"UIView<SBIconAccessoryView>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"badgeNumberOrString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"behaviorDelegate", "@", 0);
  [v3 validateProtocol:@"SBIconViewBehaviorDelegate" hasOptionalInstanceMethod:@"iconViewDisplaysBadges:"];
  [v3 validateClass:@"SBHLibraryViewController" conformsToProtocol:@"SBIconViewBehaviorDelegate"];
  [v3 validateProtocol:@"SBIconAccessoryView" hasRequiredInstanceMethod:@"displayingAccessory"];
}

- (unint64_t)_accessibilityAutomationType
{
  return 44;
}

- (id)_axIconView
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  buf[0] = 0;
  objc_opt_class();
  id v3 = [(SBIconAccessibility *)self safeValueForKey:@"_observers"];
  v4 = __UIAccessibilityCastAsClass();

  NSClassFromString(&cfstr_Sbiconview.isa);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          v11 = objc_msgSend(v10, "window", (void)v16);

          if (v11)
          {
            v12 = [v10 safeStringForKey:@"location"];
            if (!SBAXIsIconViewIgnoreLocation(v12))
            {
              v14 = AXLogUIA();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v21 = v10;
                __int16 v22 = 2112;
                v23 = self;
                _os_log_impl(&dword_2425C0000, v14, OS_LOG_TYPE_INFO, "return observer: %@ for this icon: %@", buf, 0x16u);
              }

              id v13 = v10;
              goto LABEL_16;
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_16:

  return v13;
}

- (id)_axIconLabel
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__2;
  uint64_t v8 = __Block_byref_object_dispose__2;
  id v9 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __35__SBIconAccessibility__axIconLabel__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  getSBIconLocationNone();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 displayNameForLocation:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)accessibilityIdentifier
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__2;
  uint64_t v8 = __Block_byref_object_dispose__2;
  id v9 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __46__SBIconAccessibility_accessibilityIdentifier__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  getSBIconLocationNone();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 displayNameForLocation:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_axIconValue
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SBIconAccessibility *)self safeValueForKey:@"badgeNumberOrString"];
  uint64_t v4 = [(SBIconAccessibility *)self _axIconView];
  buf[0] = 0;
  objc_opt_class();
  id v5 = [v4 safeValueForKey:@"_accessoryView"];
  id v6 = __UIAccessibilityCastAsClass();

  if (v6)
  {
    int v7 = [v6 safeBoolForKey:@"displayingAccessory"];
  }
  else
  {
    uint64_t v8 = [v4 safeValueForKey:@"behaviorDelegate"];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      *(void *)buf = 0;
      *(void *)v24 = buf;
      *(void *)&v24[8] = 0x2020000000;
      v24[16] = 0;
      id v22 = v4;
      AXPerformSafeBlock();
      int v7 = *(unsigned char *)(*(void *)v24 + 24) != 0;

      _Block_object_dispose(buf, 8);
    }
    else
    {
      int v7 = 0;
    }
  }
  v10 = AXLogAppAccessibility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = v7;
    *(_WORD *)v24 = 2112;
    *(void *)&v24[2] = v3;
    *(_WORD *)&v24[10] = 2112;
    *(void *)&v24[12] = v6;
    _os_log_impl(&dword_2425C0000, v10, OS_LOG_TYPE_INFO, "Showing badge: %d[%@] -> %@", buf, 0x1Cu);
  }

  v11 = [(SBIconAccessibility *)self _accessibilityBundleIdentifier];
  v12 = v11;
  if (v3) {
    int v13 = v7;
  }
  else {
    int v13 = 0;
  }
  if (v13 == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = (int)[v3 intValue];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_22;
      }
      int v16 = [v3 intValue];
      if (v16 < 1) {
        goto LABEL_22;
      }
      uint64_t v14 = v16;
    }
    if (v14 >= 1)
    {
      if ([v12 isEqualToString:*MEMORY[0x263F227B8]])
      {
        long long v17 = @"mail.badge.format";
      }
      else if ([v12 isEqualToString:@"com.apple.MobileSMS"])
      {
        long long v17 = @"messages.badge.format";
      }
      else if ([v12 isEqualToString:@"com.apple.mobilecal"])
      {
        long long v17 = @"calendar.badge.format";
      }
      else if ([v12 isEqualToString:@"com.apple.mobileslideshow"])
      {
        long long v17 = @"photos.badge.format";
      }
      else if ([v12 isEqualToString:@"com.apple.reminders"])
      {
        long long v17 = @"reminders.badge.format";
      }
      else if ([v12 isEqualToString:@"com.apple.AppStore"])
      {
        long long v17 = @"appstore.badge.format";
      }
      else if ([v12 isEqualToString:@"com.apple.facetime"])
      {
        long long v17 = @"facetime.badge.format";
      }
      else
      {
        long long v17 = @"badge.format";
      }
      long long v19 = NSString;
      v20 = accessibilityLocalizedString(v17);
      long long v18 = objc_msgSend(v19, "localizedStringWithFormat:", v20, v14);

      goto LABEL_41;
    }
LABEL_22:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 isEqualToString:@"!"])
    {
      uint64_t v15 = accessibilityLocalizedString(@"badge.exclamation");
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if ([v11 isEqualToString:*MEMORY[0x263F227B8]])
  {
    uint64_t v15 = accessibilityLocalizedString(@"mail.badge.none");
LABEL_25:
    long long v18 = (void *)v15;
    goto LABEL_41;
  }
LABEL_26:
  long long v18 = 0;
LABEL_41:

  return v18;
}

void __35__SBIconAccessibility__axIconValue__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"behaviorDelegate"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 iconViewDisplaysBadges:*(void *)(a1 + 32)];
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  [(SBIconAccessibility *)self _accessibilityUnregister];
  v3.receiver = self;
  v3.super_class = (Class)SBIconAccessibility;
  [(SBIconAccessibility *)&v3 dealloc];
}

@end