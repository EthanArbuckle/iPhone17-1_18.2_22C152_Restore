@interface ConversationKit_UIViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsMultiwayContainerView;
- (id)_accessibilityScrollStatus;
- (id)_axParticipantViews;
@end

@implementation ConversationKit_UIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ConversationKit.MultiwayViewController"];
  [v3 validateClass:@"ConversationKit.LocalParticipantView"];
  [v3 validateClass:@"ConversationKit.ParticipantView"];
}

- (BOOL)_accessibilityIsMultiwayContainerView
{
  v2 = [(ConversationKit_UIViewAccessibility *)self _accessibilityViewController];
  MEMORY[0x2456492E0](@"ConversationKit.MultiwayViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityScrollStatus
{
  if ([(ConversationKit_UIViewAccessibility *)self _accessibilityIsMultiwayContainerView])
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    id v3 = [(ConversationKit_UIViewAccessibility *)self _axParticipantViews];
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__0;
    v14 = __Block_byref_object_dispose__0;
    id v15 = [v3 firstObject];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65__ConversationKit_UIViewAccessibility__accessibilityScrollStatus__block_invoke;
    v9[3] = &unk_26511A080;
    v9[4] = &v10;
    v9[5] = &v16;
    [v3 enumerateObjectsUsingBlock:v9];
    if (*((unsigned char *)v17 + 24))
    {
      v4 = 0;
    }
    else
    {
      v5 = NSString;
      v6 = accessibilityLocalizedString(@"participant.focused");
      v7 = [(id)v11[5] accessibilityLabel];
      v4 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
    }
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ConversationKit_UIViewAccessibility;
    v4 = [(ConversationKit_UIViewAccessibility *)&v20 _accessibilityScrollStatus];
  }

  return v4;
}

- (id)_axParticipantViews
{
  return (id)[(ConversationKit_UIViewAccessibility *)self _accessibilityFindUnsortedDescendantsPassingTest:&__block_literal_global_5];
}

@end