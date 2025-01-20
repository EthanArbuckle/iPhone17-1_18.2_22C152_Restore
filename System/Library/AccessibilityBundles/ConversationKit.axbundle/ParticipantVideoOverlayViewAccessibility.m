@interface ParticipantVideoOverlayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityImageOverlayView;
- (id)_accessibilityMonogramView;
- (id)accessibilityLabel;
@end

@implementation ParticipantVideoOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.ParticipantVideoOverlayView";
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
  v3 = [(ParticipantVideoOverlayViewAccessibility *)self _accessibilityMonogramView];
  if (([v3 isHidden] & 1) == 0)
  {
    v9 = [v3 accessibilityLabel];
    goto LABEL_10;
  }
  v4 = [(ParticipantVideoOverlayViewAccessibility *)self _accessibilityImageOverlayView];
  v5 = [v4 image];

  v6 = [v5 accessibilityIdentification];
  int v7 = [v6 containsString:@"paused"];

  if (v7)
  {
    v8 = @"roster.paused";
  }
  else
  {
    v10 = [v5 accessibilityIdentification];
    int v11 = [v10 containsString:@"bad-connection"];

    if (!v11)
    {
      _AXAssert();
      v9 = 0;
      goto LABEL_9;
    }
    v8 = @"roster.bad.connection";
  }
  v9 = accessibilityLocalizedString(v8);
LABEL_9:

LABEL_10:

  return v9;
}

- (id)_accessibilityMonogramView
{
  objc_opt_class();
  v3 = [(ParticipantVideoOverlayViewAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x2456492E0](@"ConversationKit.ParticipantMonogramView")];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (id)_accessibilityImageOverlayView
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_opt_class();
  v3 = [(ParticipantVideoOverlayViewAccessibility *)self _accessibilityDescendantOfType:objc_opt_class()];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 contentView];
  v6 = [v5 subviews];

  id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

@end