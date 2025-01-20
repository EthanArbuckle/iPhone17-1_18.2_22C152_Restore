@interface PUAlbumListCellContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestReverseOrder;
- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3;
- (BOOL)_axRenameAlbumAction;
- (BOOL)_axShowsDeleteButton;
- (BOOL)accessibilityElementsHidden;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (PUAlbumListCellContentViewAccessibility)initWithFrame:(CGRect)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_axCustomContentType;
- (id)_axTypeStringWithCount:(int64_t)a3;
- (id)_deleteButton;
- (id)accessibilityCustomActions;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setAXCustomContentType:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation PUAlbumListCellContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUAlbumListCellContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUAlbumListCellContentView" hasInstanceVariable:@"_enabled" withType:"B"];
  [v3 validateClass:@"PUAlbumListCellContentView" hasInstanceVariable:@"_editing" withType:"B"];
  [v3 validateClass:@"PUAlbumListCellContentView" hasInstanceVariable:@"_editCapabilities" withType:"Q"];
  [v3 validateClass:@"PUAlbumListCellContentView" hasInstanceVariable:@"_showsDeleteButtonWhenEditing" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAlbumListCellContentView", @"setEditing: animated:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAlbumListCellContentView", @"_deleteButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAlbumListCellContentView", @"showsDeleteButtonWhenEditing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAlbumListCellContentView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAlbumListCellContentView", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAlbumListCellContentView", @"setUsesLabelForTitle:", "v", "B", 0);
}

- (id)_axCustomContentType
{
}

- (void)_setAXCustomContentType:(id)a3
{
}

- (BOOL)_axShowsDeleteButton
{
  id v3 = [(PUAlbumListCellContentViewAccessibility *)self safeValueForKey:@"_editCapabilities"];
  char v4 = [v3 integerValue];

  if ((v4 & 1) == 0) {
    return 0;
  }

  return [(PUAlbumListCellContentViewAccessibility *)self safeBoolForKey:@"_editing"];
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(PUAlbumListCellContentViewAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];

  if (v3) {
    return ![(PUAlbumListCellContentViewAccessibility *)self _axShowsDeleteButton];
  }
  else {
    return 1;
  }
}

- (id)_deleteButton
{
  v8.receiver = self;
  v8.super_class = (Class)PUAlbumListCellContentViewAccessibility;
  id v3 = [(PUAlbumListCellContentViewAccessibility *)&v8 _deleteButton];
  char v4 = accessibilityPULocalizedString(@"delete.button");
  v5 = [(PUAlbumListCellContentViewAccessibility *)self accessibilityLabel];
  v6 = __UIAXStringForVariables();
  objc_msgSend(v3, "setAccessibilityLabel:", v6, v5, @"__AXStringForVariablesSentinel");

  return v3;
}

- (BOOL)accessibilityElementsHidden
{
  v2 = [(PUAlbumListCellContentViewAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];

  return v2 == 0;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUAlbumListCellContentViewAccessibility;
  [(PUAlbumListCellContentViewAccessibility *)&v7 setEditing:a3 animated:a4];
  v5 = [(PUAlbumListCellContentViewAccessibility *)self safeValueForKey:@"_titleTextField"];
  v6 = accessibilityPULocalizedString(@"album.name");
  [v5 setAccessibilityLabel:v6];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)PUAlbumListCellContentViewAccessibility;
  [(PUAlbumListCellContentViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PUAlbumListCellContentViewAccessibility *)self safeValueForKey:@"_subtitleLabel"];
  [v3 setIsAccessibilityElement:0];

  char v4 = [(PUAlbumListCellContentViewAccessibility *)self safeValueForKey:@"_titleTextField"];
  [v4 setAccessibilityElementsHidden:1];

  v5 = [(PUAlbumListCellContentViewAccessibility *)self safeValueForKey:@"_titleTextField"];
  v6 = accessibilityPULocalizedString(@"album.name");
  [v5 setAccessibilityLabel:v6];

  objc_super v7 = [(PUAlbumListCellContentViewAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  id v8 = (id)[v7 safeValueForKey:@"_accessibilityClearChildren"];
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return 1;
}

- (id)accessibilityElements
{
  id v3 = [(PUAlbumListCellContentViewAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];

  if (v3 && [(PUAlbumListCellContentViewAccessibility *)self _axShowsDeleteButton])
  {
    char v4 = [(PUAlbumListCellContentViewAccessibility *)self _accessibilityValueForKey:@"DeleteElement"];
    if (!v4)
    {
      char v4 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
      [v4 setAccessibilityDelegate:self];
      [(PUAlbumListCellContentViewAccessibility *)self _accessibilitySetRetainedValue:v4 forKey:@"DeleteElement"];
    }
    v5 = [(PUAlbumListCellContentViewAccessibility *)self safeValueForKey:@"_titleTextField"];
    v6 = [MEMORY[0x263EFF980] array];
    [v6 axSafelyAddObject:v4];
    [v6 axSafelyAddObject:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PUAlbumListCellContentViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUAlbumListCellContentViewAccessibility;
  id v3 = -[PUAlbumListCellContentViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PUAlbumListCellContentViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (id)accessibilityValue
{
  id v3 = [(PUAlbumListCellContentViewAccessibility *)self safeValueForKey:@"subtitle"];
  if ([v3 length])
  {
    char v4 = [MEMORY[0x263EFF960] currentLocale];
    objc_super v5 = [v4 objectForKey:*MEMORY[0x263EFF4F8]];

    v6 = [v3 stringByReplacingOccurrencesOfString:v5 withString:&stru_26F42F3E0];

    objc_super v7 = [MEMORY[0x263F08B08] localizedScannerWithString:v6];
    uint64_t v12 = 0;
    if ([v7 scanInteger:&v12])
    {
      id v8 = [(PUAlbumListCellContentViewAccessibility *)self _axTypeStringWithCount:v12];
    }
    else
    {
      id v8 = v6;
    }
    objc_super v9 = v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PUAlbumListCellContentViewAccessibility;
    objc_super v9 = [(PUAlbumListCellContentViewAccessibility *)&v11 accessibilityValue];
    v6 = v3;
  }

  return v9;
}

- (id)accessibilityCustomActions
{
  v8[1] = *MEMORY[0x263EF8340];
  if ([(PUAlbumListCellContentViewAccessibility *)self _axShowsDeleteButton])
  {
    id v3 = objc_alloc(MEMORY[0x263F1C390]);
    char v4 = accessibilityPULocalizedString(@"rename.action");
    objc_super v5 = (void *)[v3 initWithName:v4 target:self selector:sel__axRenameAlbumAction];

    v8[0] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)accessibilityPerformEscape
{
  BOOL v3 = [(PUAlbumListCellContentViewAccessibility *)self _axShowsDeleteButton];
  if (v3)
  {
    objc_opt_class();
    char v4 = [(PUAlbumListCellContentViewAccessibility *)self safeValueForKey:@"_titleTextField"];
    objc_super v5 = __UIAccessibilityCastAsClass();

    AXPerformSafeBlock();
    [v5 setAccessibilityElementsHidden:1];
    [v5 resignFirstResponder];
  }
  return v3;
}

uint64_t __69__PUAlbumListCellContentViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUsesLabelForTitle:1];
}

- (unint64_t)accessibilityTraits
{
  int v3 = [(PUAlbumListCellContentViewAccessibility *)self safeBoolForKey:@"_enabled"];
  unint64_t v4 = *MEMORY[0x263F1CF20];
  if (v3) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = *MEMORY[0x263F1CF20];
  }
  int v6 = [(PUAlbumListCellContentViewAccessibility *)self safeBoolForKey:@"_editing"];
  unint64_t result = v5;
  if (v6)
  {
    BOOL v8 = [(PUAlbumListCellContentViewAccessibility *)self _axShowsDeleteButton];
    unint64_t result = v4;
    if (v8) {
      return *MEMORY[0x263F81398] | v5;
    }
  }
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(PUAlbumListCellContentViewAccessibility *)self _axShowsDeleteButton])
  {
    int v3 = [(PUAlbumListCellContentViewAccessibility *)self safeValueForKey:@"_deleteButton"];
    [v3 accessibilityActivationPoint];
    double v5 = v4;
    double v7 = v6;

    double v8 = v5;
    double v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PUAlbumListCellContentViewAccessibility;
    [(PUAlbumListCellContentViewAccessibility *)&v10 accessibilityActivationPoint];
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)accessibilityLabel
{
  int v3 = [(PUAlbumListCellContentViewAccessibility *)self safeValueForKey:@"_titleTextField"];
  double v4 = [v3 accessibilityValue];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 string];

    double v4 = (void *)v5;
  }
  if (![v4 length])
  {
    uint64_t v6 = [(PUAlbumListCellContentViewAccessibility *)self safeValueForKey:@"title"];

    double v4 = (void *)v6;
  }
  double v7 = [(PUAlbumListCellContentViewAccessibility *)self _axCustomContentType];
  if ([v7 isEqualToString:@"AXAlbumContentTypeFolder"])
  {
    v13 = accessibilityPULocalizedString(@"folder");
    v14 = @"__AXStringForVariablesSentinel";
    uint64_t v8 = __UIAXStringForVariables();

    double v4 = (void *)v8;
  }
  if ([(PUAlbumListCellContentViewAccessibility *)self _axShowsDeleteButton])
  {
    double v9 = [(PUAlbumListCellContentViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];

    if (!v9)
    {
      objc_super v10 = accessibilityPULocalizedString(@"delete.button");
      uint64_t v11 = __UIAXStringForVariables();

      double v4 = (void *)v11;
    }
  }

  return v4;
}

- (id)automationElements
{
  if ([(PUAlbumListCellContentViewAccessibility *)self _axShowsDeleteButton])
  {
    int v3 = [(PUAlbumListCellContentViewAccessibility *)self safeValueForKey:@"_deleteButton"];
    double v4 = [(PUAlbumListCellContentViewAccessibility *)self safeValueForKey:@"_titleTextField"];
    if (!v3) {
      _AXAssert();
    }
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    [v5 axSafelyAddObject:v3];
    [v5 axSafelyAddObject:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v22.receiver = self;
    v22.super_class = (Class)PUAlbumListCellContentViewAccessibility;
    -[PUAlbumListCellContentViewAccessibility _accessibilityHitTest:withEvent:](&v22, sel__accessibilityHitTest_withEvent_, v7, x, y);
    uint64_t v8 = (PUAlbumListCellContentViewAccessibility *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    double v9 = [(PUAlbumListCellContentViewAccessibility *)self automationElements];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          -[PUAlbumListCellContentViewAccessibility convertPoint:toView:](self, "convertPoint:toView:", v14, x, y);
          uint64_t v15 = objc_msgSend(v14, "_accessibilityHitTest:withEvent:", v7);
          if (v15)
          {
            v16 = (void *)v15;

            goto LABEL_14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    uint64_t v8 = self;
  }
  v16 = v8;
LABEL_14:

  return v16;
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  return *MEMORY[0x263F1D180] <= (unint64_t)a3;
}

- (id)_axTypeStringWithCount:(int64_t)a3
{
  double v4 = [(PUAlbumListCellContentViewAccessibility *)self _axCustomContentType];
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 isEqualToString:@"AXAlbumContentTypePeople"])
    {
      uint64_t v6 = @"album.contenttype.people";
    }
    else if ([v5 isEqualToString:@"AXAlbumContentTypePlaces"])
    {
      uint64_t v6 = @"album.contenttype.places";
    }
    else if (([v5 isEqualToString:@"AXAlbumContentTypeVideos"] & 1) != 0 {
           || ([v5 isEqualToString:@"AXAlbumContentTypeSloMo"] & 1) != 0)
    }
    {
      uint64_t v6 = @"video.count";
    }
    else if ([v5 isEqualToString:@"AXAlbumContentTypeFavorites"])
    {
      uint64_t v6 = @"album.contenttype.favorites";
    }
    else if ([v5 isEqualToString:@"AXAlbumContentTypeScreenshots"])
    {
      uint64_t v6 = @"album.contenttype.screenshots";
    }
    else if ([v5 isEqualToString:@"AXAlbumContentTypeSelfies"])
    {
      uint64_t v6 = @"album.contenttype.selfies";
    }
    else if ([v5 isEqualToString:@"AXAlbumContentTypeFolder"])
    {
      uint64_t v6 = @"album.contenttype.folderitems";
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = @"photo.count";
  }
  id v7 = NSString;
  uint64_t v8 = accessibilityPULocalizedString(v6);
  double v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, a3);

  return v9;
}

- (BOOL)_axRenameAlbumAction
{
  objc_opt_class();
  int v3 = [(PUAlbumListCellContentViewAccessibility *)self safeValueForKey:@"_titleTextField"];
  double v4 = __UIAccessibilityCastAsClass();

  AXPerformSafeBlock();
  [v4 setAccessibilityElementsHidden:0];
  [v4 becomeFirstResponder];

  return 1;
}

uint64_t __63__PUAlbumListCellContentViewAccessibility__axRenameAlbumAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUsesLabelForTitle:0];
}

@end