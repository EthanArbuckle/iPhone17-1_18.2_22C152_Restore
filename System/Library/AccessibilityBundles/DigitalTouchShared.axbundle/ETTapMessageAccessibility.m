@interface ETTapMessageAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityMessageTypeString;
- (id)accessibilityLabel;
- (void)displayInScene:(id)a3;
@end

@implementation ETTapMessageAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ETTapMessage";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ETTapMessage"];
  [v3 validateClass:@"ETTapMessage" isKindOfClass:@"ETMessage"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTapMessage", @"displayInScene:", "v", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = NSString;
  v4 = accessibilityLocalizedString(@"tap.label");
  v5 = [(ETTapMessageAccessibility *)self _accessibilityColorString];
  v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)_accessibilityMessageTypeString
{
  return accessibilityLocalizedString(@"tap");
}

- (void)displayInScene:(id)a3
{
  id v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    _axSetIsWaitingOnETMessageStart(1);
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    v8 = __44__ETTapMessageAccessibility_displayInScene___block_invoke;
    v9 = &unk_26511CDB8;
    id v10 = v4;
    v11 = self;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ETTapMessageAccessibility;
    [(ETTapMessageAccessibility *)&v5 displayInScene:v4];
  }
}

uint64_t __44__ETTapMessageAccessibility_displayInScene___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)ETTapMessageAccessibility;
  objc_msgSendSuper2(&v3, sel_displayInScene_, v1);
  return _axSetIsWaitingOnETMessageStart(0);
}

@end