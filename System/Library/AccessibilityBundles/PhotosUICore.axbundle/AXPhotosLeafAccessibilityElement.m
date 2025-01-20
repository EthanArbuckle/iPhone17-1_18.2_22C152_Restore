@interface AXPhotosLeafAccessibilityElement
+ (void)_accessibilityPerformValidations:(id)a3;
- (AXPhotosLeafAccessibilityElement)initWithAccessibilityContainer:(id)a3 forLeaf:(id)a4;
- (BOOL)_accessibilityIsPHAssetLocallyAvailable;
- (BOOL)_accessibilitySkipImageTraitDescription;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (Class)_axCuratedLibraryUIViewControllerClass;
- (id)_accessibilityCuratedLibraryUIViewController;
- (id)_accessibilityDefaultFocusGroupIdentifier;
- (id)_accessibilityPHAssetLocalIdentifier;
- (id)_accessibilityPhotoLibraryURL;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axLeafAsset;
- (id)_axLeafContentView;
- (id)_axLeafView;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomContent;
- (id)accessibilityCustomRotors;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityURL;
- (id)accessibilityValue;
- (id)automationElements;
- (id)leaf;
- (int64_t)_accessibilityContentKind;
- (int64_t)_accessibilityPageCount;
- (int64_t)_accessibilityPageIndex;
- (int64_t)_accessibilityScannerActivateBehavior;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_axExpandLibrary;
- (void)_setAxCuratedLibraryUIViewControllerClass:(Class)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setLeaf:(id)a3;
@end

@implementation AXPhotosLeafAccessibilityElement

- (Class)_axCuratedLibraryUIViewControllerClass
{
}

- (void)_setAxCuratedLibraryUIViewControllerClass:(Class)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axContentKind", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axAsset", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axSubtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axIsSelected", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"mainFileURL", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"px_isUnsavedSyndicatedAsset", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"px_wasSavedThroughSyndication", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"axInfoSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXStoryStyleSwitchingFullsizeLayout", @"_axStyleTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryUIViewController", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryUIViewController", @"viewProvider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryViewDelegate", @"curatedLibraryViewControllerExpand:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryViewProvider", @"viewModel", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryViewModel", @"isFullyExpanded", "B", 0);
  [v3 validateClass:@"PXStoryRelatedOverlayLayout"];
  [v3 validateClass:@"PXStoryStyleSwitchingFullsizeLayout"];
  [v3 validateClass:@"PXGPageControl"];
  [v3 validateClass:@"PXCuratedLibraryUIViewController"];
  [v3 validateClass:@"PXCuratedLibraryUIViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axIdentifier", "@", 0);
}

- (AXPhotosLeafAccessibilityElement)initWithAccessibilityContainer:(id)a3 forLeaf:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AXPhotosLeafAccessibilityElement;
  id v5 = a4;
  v6 = [(AXPhotosLeafAccessibilityElement *)&v8 initWithAccessibilityContainer:a3];
  -[AXPhotosLeafAccessibilityElement setLeaf:](v6, "setLeaf:", v5, v8.receiver, v8.super_class);

  return v6;
}

- (CGRect)accessibilityFrame
{
  v2 = [(AXPhotosLeafAccessibilityElement *)self leaf];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)isAccessibilityElement
{
  if ([(AXPhotosLeafAccessibilityElement *)self _accessibilityContentKind] != 5) {
    return 1;
  }
  double v3 = [(AXPhotosLeafAccessibilityElement *)self _axLeafView];
  char v4 = [v3 _accessibilityViewIsVisible];

  return v4;
}

- (int64_t)_accessibilityContentKind
{
  v2 = [(AXPhotosLeafAccessibilityElement *)self leaf];
  int64_t v3 = [v2 safeIntegerForKey:@"axContentKind"];

  return v3;
}

- (id)accessibilityURL
{
  if ([(AXPhotosLeafAccessibilityElement *)self _accessibilityContentKind] == 6)
  {
    int64_t v3 = [(AXPhotosLeafAccessibilityElement *)self _axLeafAsset];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v4 = [v3 accessibilityURL];
LABEL_6:

      goto LABEL_9;
    }
    if (objc_opt_respondsToSelector())
    {
      double v5 = [v3 safeValueForKey:@"mainFileURL"];
      char v4 = __UIAccessibilitySafeClass();

      goto LABEL_6;
    }
  }
  char v4 = 0;
LABEL_9:

  return v4;
}

- (id)_accessibilityPHAssetLocalIdentifier
{
  v2 = [(AXPhotosLeafAccessibilityElement *)self _axLeafAsset];
  int64_t v3 = [v2 _accessibilityPHAssetLocalIdentifier];

  return v3;
}

- (id)_accessibilityPhotoLibraryURL
{
  v2 = [(AXPhotosLeafAccessibilityElement *)self _axLeafAsset];
  int64_t v3 = [v2 _accessibilityPhotoLibraryURL];

  return v3;
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  v2 = [(AXPhotosLeafAccessibilityElement *)self _axLeafAsset];
  char v3 = [v2 _accessibilityIsPHAssetLocallyAvailable];

  return v3;
}

- (id)accessibilityCustomContent
{
  if ([(AXPhotosLeafAccessibilityElement *)self _accessibilityContentKind] == 6)
  {
    char v3 = [(AXPhotosLeafAccessibilityElement *)self _axLeafAsset];
    char v4 = [v3 accessibilityCustomContent];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)accessibilityLabel
{
  switch([(AXPhotosLeafAccessibilityElement *)self _accessibilityContentKind])
  {
    case 1:
      char v3 = [(AXPhotosLeafAccessibilityElement *)self leaf];
      char v4 = v3;
      double v5 = @"axTitle";
      goto LABEL_4;
    case 2:
    case 3:
      char v3 = [(AXPhotosLeafAccessibilityElement *)self leaf];
      char v4 = v3;
      double v5 = @"axText";
LABEL_4:
      uint64_t v6 = [v3 safeValueForKey:v5];
      goto LABEL_9;
    case 5:
      double v8 = [(AXPhotosLeafAccessibilityElement *)self _axLeafView];
      goto LABEL_8;
    case 6:
      double v8 = [(AXPhotosLeafAccessibilityElement *)self _axLeafAsset];
LABEL_8:
      char v4 = v8;
      uint64_t v6 = [v8 accessibilityLabel];
LABEL_9:
      double v7 = (void *)v6;

      break;
    default:
      v10.receiver = self;
      v10.super_class = (Class)AXPhotosLeafAccessibilityElement;
      double v7 = [(AXPhotosLeafAccessibilityElement *)&v10 accessibilityLabel];
      break;
  }

  return v7;
}

- (id)accessibilityValue
{
  int64_t v3 = [(AXPhotosLeafAccessibilityElement *)self _accessibilityContentKind];
  if (v3 == 6)
  {
    objc_super v10 = [(AXPhotosLeafAccessibilityElement *)self leaf];
    char v4 = [v10 safeValueForKey:@"axAsset"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17.receiver = self;
      v17.super_class = (Class)AXPhotosLeafAccessibilityElement;
      double v5 = [(AXPhotosLeafAccessibilityElement *)&v17 accessibilityValue];
      if ([v4 safeBoolForKey:@"px_isUnsavedSyndicatedAsset"])
      {
        double v11 = @"not.yet.saved";
      }
      else
      {
        if (![v4 safeBoolForKey:@"px_wasSavedThroughSyndication"]) {
          goto LABEL_19;
        }
        double v11 = @"saved";
      }
      v15 = accessibilityPhotosUICoreLocalizedString(v11);
      uint64_t v12 = __UIAXStringForVariables();

      double v5 = (void *)v12;
      goto LABEL_19;
    }

LABEL_15:
    v16.receiver = self;
    v16.super_class = (Class)AXPhotosLeafAccessibilityElement;
    double v5 = [(AXPhotosLeafAccessibilityElement *)&v16 accessibilityValue];
    goto LABEL_20;
  }
  if (v3 == 5)
  {
    char v4 = [(AXPhotosLeafAccessibilityElement *)self _axLeafView];
    double v5 = [v4 accessibilityValue];
    MEMORY[0x2455E3C60](@"PXGPageControl");
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [(AXPhotosLeafAccessibilityElement *)self accessibilityContainer];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v7 = [v6 group];
        double v8 = [v7 safeValueForKey:@"axInfoSource"];

        MEMORY[0x2455E3C60](@"PXStoryStyleSwitchingFullsizeLayout");
        if (objc_opt_isKindOfClass())
        {
          double v14 = [v8 safeStringForKey:@"_axStyleTitle"];
          uint64_t v9 = __UIAXStringForVariables();

          double v5 = (void *)v9;
        }
      }
    }
    goto LABEL_19;
  }
  if (v3 != 1) {
    goto LABEL_15;
  }
  char v4 = [(AXPhotosLeafAccessibilityElement *)self leaf];
  double v5 = [v4 safeValueForKey:@"axSubtitle"];
LABEL_19:

LABEL_20:

  return v5;
}

- (BOOL)_accessibilitySkipImageTraitDescription
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return [(AXPhotosLeafAccessibilityElement *)self _accessibilityContentKind] == 6;
}

- (unint64_t)accessibilityTraits
{
  v13.receiver = self;
  v13.super_class = (Class)AXPhotosLeafAccessibilityElement;
  unint64_t v3 = [(AXPhotosLeafAccessibilityElement *)&v13 accessibilityTraits];
  switch([(AXPhotosLeafAccessibilityElement *)self _accessibilityContentKind])
  {
    case 1:
      char v4 = (void *)MEMORY[0x263F1CEF8];
      goto LABEL_11;
    case 2:
      double v5 = [(AXPhotosLeafAccessibilityElement *)self accessibilityContainer];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [v5 group];
        double v7 = [v6 safeValueForKey:@"axInfoSource"];

        MEMORY[0x2455E3C60](@"PXStoryRelatedOverlayLayout");
        char isKindOfClass = objc_opt_isKindOfClass();
        uint64_t v9 = *MEMORY[0x263F1CEF8];
        if ((isKindOfClass & 1) == 0) {
          uint64_t v9 = 0;
        }
        v3 |= v9;
      }
      goto LABEL_9;
    case 3:
      char v4 = (void *)MEMORY[0x263F1CEE8];
      goto LABEL_11;
    case 5:
      double v5 = [(AXPhotosLeafAccessibilityElement *)self _axLeafView];
      v3 |= [v5 accessibilityTraits];
LABEL_9:

      break;
    case 6:
      char v4 = (void *)MEMORY[0x263F1CF00];
LABEL_11:
      v3 |= *v4;
      break;
    default:
      break;
  }
  objc_super v10 = [(AXPhotosLeafAccessibilityElement *)self leaf];
  int v11 = [v10 safeBoolForKey:@"axIsSelected"];

  if (v11) {
    return *MEMORY[0x263F1CF38] | v3;
  }
  else {
    return v3 & ~*MEMORY[0x263F1CF38];
  }
}

- (unint64_t)_accessibilityAutomationType
{
  if ([(AXPhotosLeafAccessibilityElement *)self _accessibilityContentKind] == 6) {
    return 43;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXPhotosLeafAccessibilityElement;
  return [(AXPhotosLeafAccessibilityElement *)&v4 _accessibilityAutomationType];
}

- (id)_axLeafContentView
{
  if ([(AXPhotosLeafAccessibilityElement *)self _accessibilityContentKind] != 5
    || ([(AXPhotosLeafAccessibilityElement *)self leaf], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_super v4 = (void *)v3,
        [(AXPhotosLeafAccessibilityElement *)self _axLeafView],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    double v5 = 0;
  }

  return v5;
}

- (id)accessibilityIdentifier
{
  uint64_t v3 = [(AXPhotosLeafAccessibilityElement *)self _axLeafContentView];
  if (v3)
  {
    objc_super v4 = NSString;
    double v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    double v7 = [v4 stringWithFormat:@"%@_AX", v6];
LABEL_3:

    goto LABEL_4;
  }
  uint64_t v9 = [(AXPhotosLeafAccessibilityElement *)self leaf];

  if (!v9
    || ([(AXPhotosLeafAccessibilityElement *)self leaf],
        objc_super v10 = objc_claimAutoreleasedReturnValue(),
        [v10 safeStringForKey:@"axIdentifier"],
        double v7 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v7))
  {
    uint64_t v6 = [(AXPhotosLeafAccessibilityElement *)self accessibilityContainer];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [v6 group];
      uint64_t v12 = [v11 safeValueForKey:@"axInfoSource"];

      if (v12)
      {
        objc_super v13 = NSString;
        double v14 = [v12 className];
        double v7 = [v13 stringWithFormat:@"%@-Info", v14];

        goto LABEL_3;
      }
    }

    v15.receiver = self;
    v15.super_class = (Class)AXPhotosLeafAccessibilityElement;
    double v7 = [(AXPhotosLeafAccessibilityElement *)&v15 accessibilityIdentifier];
  }
LABEL_4:

  return v7;
}

- (id)_accessibilitySupplementaryFooterViews
{
  uint64_t v3 = [(AXPhotosLeafAccessibilityElement *)self _axLeafContentView];
  objc_super v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 _accessibilitySupplementaryFooterViews];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AXPhotosLeafAccessibilityElement;
    uint64_t v5 = [(AXPhotosLeafAccessibilityElement *)&v8 _accessibilitySupplementaryFooterViews];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (id)accessibilityCustomRotors
{
  uint64_t v3 = [(AXPhotosLeafAccessibilityElement *)self _axLeafContentView];
  objc_super v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityCustomRotors];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AXPhotosLeafAccessibilityElement;
    uint64_t v5 = [(AXPhotosLeafAccessibilityElement *)&v8 accessibilityCustomRotors];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (id)automationElements
{
  uint64_t v3 = [(AXPhotosLeafAccessibilityElement *)self _axLeafContentView];
  objc_super v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 automationElements];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AXPhotosLeafAccessibilityElement;
    uint64_t v5 = [(AXPhotosLeafAccessibilityElement *)&v8 automationElements];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (int64_t)_accessibilityScannerActivateBehavior
{
  return 1;
}

- (id)_accessibilityDefaultFocusGroupIdentifier
{
  return 0;
}

- (void)accessibilityIncrement
{
  id v2 = [(AXPhotosLeafAccessibilityElement *)self _axLeafView];
  [v2 accessibilityIncrement];
}

- (void)accessibilityDecrement
{
  id v2 = [(AXPhotosLeafAccessibilityElement *)self _axLeafView];
  [v2 accessibilityDecrement];
}

- (int64_t)_accessibilityPageCount
{
  id v2 = [(AXPhotosLeafAccessibilityElement *)self _axLeafView];
  int64_t v3 = [v2 _accessibilityPageCount];

  return v3;
}

- (int64_t)_accessibilityPageIndex
{
  id v2 = [(AXPhotosLeafAccessibilityElement *)self _axLeafView];
  int64_t v3 = [v2 _accessibilityPageIndex];

  return v3;
}

- (id)_axLeafView
{
  id v2 = [(AXPhotosLeafAccessibilityElement *)self leaf];
  int64_t v3 = [v2 safeUIViewForKey:@"axView"];

  return v3;
}

- (id)_axLeafAsset
{
  if ([(AXPhotosLeafAccessibilityElement *)self _accessibilityContentKind] == 6)
  {
    int64_t v3 = [(AXPhotosLeafAccessibilityElement *)self leaf];
    objc_super v4 = [v3 safeValueForKey:@"axAsset"];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (void)_axExpandLibrary
{
  id v2 = [(AXPhotosLeafAccessibilityElement *)self _accessibilityCuratedLibraryUIViewController];
  [v2 safeValueForKey:@"delegate"];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char v6 = 0;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v2;
  AXPerformSafeBlock();

  _Block_object_dispose(v5, 8);
}

uint64_t __52__AXPhotosLeafAccessibilityElement__axExpandLibrary__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) curatedLibraryViewControllerExpand:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)accessibilityCustomActions
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = [(AXPhotosLeafAccessibilityElement *)self _accessibilityCuratedLibraryUIViewController];
  id v4 = [v3 safeValueForKey:@"viewProvider"];
  uint64_t v5 = [v4 safeValueForKey:@"viewModel"];

  if ([v5 safeBoolForKey:@"isFullyExpanded"])
  {
    char v6 = 0;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x263F1C390]);
    objc_super v8 = accessibilityPULocalizedString(@"expand.library");
    uint64_t v9 = (void *)[v7 initWithName:v8 target:self selector:sel__axExpandLibrary];

    v11[0] = v9;
    char v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  }

  return v6;
}

- (id)_accessibilityCuratedLibraryUIViewController
{
  if (![(AXPhotosLeafAccessibilityElement *)self _axCuratedLibraryUIViewControllerClass])[(AXPhotosLeafAccessibilityElement *)self _setAxCuratedLibraryUIViewControllerClass:MEMORY[0x2455E3C60](@"PXCuratedLibraryUIViewController")]; {
  if ([(AXPhotosLeafAccessibilityElement *)self _axCuratedLibraryUIViewControllerClass])
  }
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __80__AXPhotosLeafAccessibilityElement__accessibilityCuratedLibraryUIViewController__block_invoke;
    v6[3] = &unk_2650A5FF8;
    v6[4] = self;
    id v3 = [(AXPhotosLeafAccessibilityElement *)self _accessibilityFindAncestor:v6 startWithSelf:1];
    id v4 = [v3 _accessibilityViewController];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __80__AXPhotosLeafAccessibilityElement__accessibilityCuratedLibraryUIViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _accessibilityViewController];
  [*(id *)(a1 + 32) _axCuratedLibraryUIViewControllerClass];
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return a1 & 1;
}

- (id)leaf
{
  id WeakRetained = objc_loadWeakRetained(&self->_leaf);

  return WeakRetained;
}

- (void)setLeaf:(id)a3
{
}

- (void).cxx_destruct
{
}

@end