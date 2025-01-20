@interface NCDigestSummaryPlatterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation NCDigestSummaryPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCDigestSummaryPlatterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCDigestSummaryPlatterView", @"heading", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCDigestSummaryPlatterView", @"date", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCDigestSummaryPlatterView", @"count", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCDigestSummaryPlatterView", @"featuredNotificationContentProviders", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCDigestFeaturedNotificationContentProvider", @"defaultActionBlock", "@?", 0);
  [v3 validateClass:@"NCDigestFeaturedNotificationContentProvider" isKindOfClass:@"NCNotificationRequestContentProvider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRequestContentProvider", @"notificationRequest", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRequest", @"content", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRequest", @"options", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationContent", @"defaultHeader", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationContent", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationContent", @"message", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationContent", @"attachmentImage", "@", 0);
  [v3 validateClass:@"NCDigestSummaryPlatterView" hasInstanceVariable:@"_summaryView" withType:"NCDigestSummaryView"];
  [v3 validateClass:@"NCDigestSummaryView" hasInstanceVariable:@"_timeStampLabel" withType:"UILabel<BSUIDateLabel>"];
  [v3 validateClass:@"NCDigestSummaryView" hasInstanceVariable:@"_headingLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationOptions", @"suppressesTitleWhenLocked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationOptions", @"suppressesSubtitleWhenLocked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationOptions", @"suppressesBodyWhenLocked", "B", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(NCDigestSummaryPlatterViewAccessibility *)self safeStringForKey:@"heading"];
  v4 = [(NCDigestSummaryPlatterViewAccessibility *)self safeValueForKeyPath:@"_summaryView._timeStampLabel"];
  if ([(NCDigestSummaryPlatterViewAccessibility *)self safeUnsignedIntegerForKey:@"count"])
  {
    v5 = NSString;
    v6 = accessibilityLocalizedString(@"digest.notification.count");
    v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, -[NCDigestSummaryPlatterViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", @"count"));

    v8 = [(NCDigestSummaryPlatterViewAccessibility *)self safeArrayForKey:@"featuredNotificationContentProviders"];
    if ([v8 count])
    {
      v23 = v7;
      v9 = [v8 firstObject];
      v10 = [v9 safeValueForKeyPath:@"notificationRequest.content"];
      uint64_t v11 = [v10 safeStringForKey:@"defaultHeader"];
      uint64_t v12 = [v10 safeStringForKey:@"title"];
      v13 = [v10 safeStringForKey:@"subtitle"];
      v24 = [v10 safeStringForKey:@"message"];
      v14 = [v10 safeValueForKey:@"attachmentImage"];
      if (v14)
      {
        v15 = accessibilityLocalizedString(@"attachment.label");
      }
      else
      {
        v15 = 0;
      }

      v22 = (void *)v11;
      v17 = objc_msgSend(MEMORY[0x263EFF980], "axArrayByIgnoringNilElementsWithCount:", 3, v3, v4, v11);
      v18 = [v9 safeValueForKeyPath:@"notificationRequest.options"];
      if (!_isDevicePasscodeLocked()
        || ([v18 safeBoolForKey:@"suppressesTitleWhenLocked"] & 1) == 0)
      {
        [v17 axSafelyAddObject:v12];
      }
      v21 = v9;
      if (!_isDevicePasscodeLocked()
        || ([v18 safeBoolForKey:@"suppressesSubtitleWhenLocked"] & 1) == 0)
      {
        [v17 axSafelyAddObject:v13];
      }
      v19 = (void *)v12;
      if (!_isDevicePasscodeLocked()
        || ([v18 safeBoolForKey:@"suppressesBodyWhenLocked"] & 1) == 0)
      {
        [v17 axSafelyAddObject:v24];
        [v17 axSafelyAddObject:v15];
      }
      v16 = MEMORY[0x245668110](v17);

      v7 = v23;
    }
    else
    {
      v16 = __UIAXStringForVariables();
    }
  }
  else
  {
    v16 = __UIAXStringForVariables();
  }

  return v16;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"notification.cell.collapsed.hint");
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(NCDigestSummaryPlatterViewAccessibility *)self safeValueForKeyPath:@"_summaryView._headingLabel"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityCustomActions
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = [(NCDigestSummaryPlatterViewAccessibility *)self safeArrayForKey:@"featuredNotificationContentProviders"];
  id v19 = [MEMORY[0x263EFF980] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v2;
  uint64_t v20 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        double v4 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v5 = [v4 safeValueForKeyPath:@"notificationRequest.content"];
        double v6 = [v5 safeStringForKey:@"defaultHeader"];
        double v7 = [v5 safeStringForKey:@"title"];
        double v8 = [v5 safeStringForKey:@"message"];
        v9 = [v5 safeValueForKey:@"attachmentImage"];
        if (v9)
        {
          v10 = accessibilityLocalizedString(@"attachment.label");
        }
        else
        {
          v10 = 0;
        }

        uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "axArrayByIgnoringNilElementsWithCount:", 1, v6);
        uint64_t v12 = [v4 safeValueForKeyPath:@"notificationRequest.options"];
        if (!_isDevicePasscodeLocked()
          || ([v12 safeBoolForKey:@"suppressesTitleWhenLocked"] & 1) == 0)
        {
          [v11 axSafelyAddObject:v7];
        }
        if (!_isDevicePasscodeLocked()
          || ([v12 safeBoolForKey:@"suppressesBodyWhenLocked"] & 1) == 0)
        {
          [v11 axSafelyAddObject:v8];
          [v11 axSafelyAddObject:v10];
        }
        v13 = MEMORY[0x245668110](v11);
        objc_initWeak(&location, v4);
        id v14 = objc_alloc(MEMORY[0x263F1C390]);
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __69__NCDigestSummaryPlatterViewAccessibility_accessibilityCustomActions__block_invoke;
        v21[3] = &unk_2651616F8;
        objc_copyWeak(&v22, &location);
        v15 = (void *)[v14 initWithName:v13 actionHandler:v21];
        [v19 axSafelyAddObject:v15];

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v20);
  }

  return v19;
}

uint64_t __69__NCDigestSummaryPlatterViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"defaultActionBlock"];

  if (v2) {
    v2[2](v2);
  }

  return 1;
}

@end