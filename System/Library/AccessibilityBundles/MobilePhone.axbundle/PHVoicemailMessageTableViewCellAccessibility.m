@interface PHVoicemailMessageTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axInfoAction;
- (BOOL)_axShareAction;
- (BOOL)isAccessibilityElement;
- (double)_accessibilityAllowedGeometryOverlap;
- (id)accessibilityCustomActions;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)loadExpandedViewsIfNecessary;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation PHVoicemailMessageTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHVoicemailMessageTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PHVoicemailMessageTableViewCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailMessageTableViewCell", @"isExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailMessageTableViewCell", @"metadataView", "@", 0);
  [v3 validateClass:@"PHVoicemailMessageTableViewCell" hasProperty:@"contentScrollView" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailMessageTableViewCell", @"loadExpandedViewsIfNecessary", "v", 0);
  [v3 validateClass:@"VMMessageMetadataView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VMMessageMetadataView", @"didTapInfo:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VMMessageMetadataView", @"didTapAction:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailMessageTableViewCell", @"setExpanded:animated:", "v", "B", "B", 0);
  [v3 validateClass:@"PHAudioDeviceController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"PHAudioDeviceController", @"sharedAudioDeviceController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioDeviceController", @"receiverRouteIsPicked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioDeviceController", @"speakerRouteAvailable", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioDeviceController", @"pickSpeakerRoute", "v", 0);
}

- (id)accessibilityElements
{
  int v3 = [(PHVoicemailMessageTableViewCellAccessibility *)self safeBoolForKey:@"isExpanded"];
  v4 = (void *)MEMORY[0x263EFF8C0];
  if (v3) {
    v5 = @"contentScrollView";
  }
  else {
    v5 = @"metadataView";
  }
  v6 = [(PHVoicemailMessageTableViewCellAccessibility *)self safeValueForKey:v5];
  v7 = objc_msgSend(v4, "axArrayByIgnoringNilElementsWithCount:", 1, v6);

  return v7;
}

- (BOOL)isAccessibilityElement
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  char v3 = [v2 isEditing];

  return v3;
}

- (id)accessibilityLabel
{
  v2 = [(PHVoicemailMessageTableViewCellAccessibility *)self safeValueForKey:@"metadataView"];
  char v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)PHVoicemailMessageTableViewCellAccessibility;
  unint64_t v2 = [(PHVoicemailMessageTableViewCellAccessibility *)&v8 accessibilityTraits];
  objc_opt_class();
  char v3 = __UIAccessibilityCastAsClass();
  int v4 = [v3 isSelected];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 | v2;

  return v6;
}

- (double)_accessibilityAllowedGeometryOverlap
{
  return 15.0;
}

- (id)accessibilityCustomActions
{
  char v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc(MEMORY[0x263F1C390]);
  uint64_t v5 = accessibilityLocalizedString(@"voicemail.info");
  unint64_t v6 = (void *)[v4 initWithName:v5 target:self selector:sel__axInfoAction];

  [v3 addObject:v6];
  id v7 = objc_alloc(MEMORY[0x263F1C390]);
  objc_super v8 = accessibilityLocalizedString(@"voicemail.share");
  v9 = (void *)[v7 initWithName:v8 target:self selector:sel__axShareAction];

  [v3 addObject:v9];

  return v3;
}

- (BOOL)_axInfoAction
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __61__PHVoicemailMessageTableViewCellAccessibility__axInfoAction__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) safeValueForKey:@"metadataView"];
  [v2 didTapInfo:0];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (BOOL)_axShareAction
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __62__PHVoicemailMessageTableViewCellAccessibility__axShareAction__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) safeValueForKey:@"metadataView"];
  [v2 didTapAction:0];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (void)loadExpandedViewsIfNecessary
{
  v2.receiver = self;
  v2.super_class = (Class)PHVoicemailMessageTableViewCellAccessibility;
  [(PHVoicemailMessageTableViewCellAccessibility *)&v2 loadExpandedViewsIfNecessary];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  char v7 = [NSClassFromString(&cfstr_Phaudiodevicec.isa) safeValueForKey:@"sharedAudioDeviceController"];
  if (UIAccessibilityIsVoiceOverRunning()
    && [v7 safeBoolForKey:@"receiverRouteIsPicked"]
    && [v7 safeBoolForKey:@"speakerRouteAvailable"])
  {
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __69__PHVoicemailMessageTableViewCellAccessibility_setExpanded_animated___block_invoke;
    v12 = &unk_265134EA8;
    id v13 = v7;
    AXPerformSafeBlock();
  }
  v8.receiver = self;
  v8.super_class = (Class)PHVoicemailMessageTableViewCellAccessibility;
  [(PHVoicemailMessageTableViewCellAccessibility *)&v8 setExpanded:v5 animated:v4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

uint64_t __69__PHVoicemailMessageTableViewCellAccessibility_setExpanded_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pickSpeakerRoute];
}

@end