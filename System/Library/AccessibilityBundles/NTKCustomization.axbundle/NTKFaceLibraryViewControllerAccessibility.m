@interface NTKFaceLibraryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldSwipeBetweenPagesForPageScrollViewController:(id)a3;
- (BOOL)_axAddPageViewControllerIsActive;
- (BOOL)_axCanUseOverlayButton:(id)a3;
- (BOOL)_axDeactivateAddFace;
- (BOOL)_axShareFace;
- (BOOL)_axStartEditing;
- (id)_accessibilityCustomActionsForPageAtIndex:(unint64_t)a3 forPageScrollViewController:(id)a4;
- (id)_accessibilityHintForPageAtIndex:(unint64_t)a3 forPageScrollViewController:(id)a4;
- (id)_accessibilityLabelForPageAtIndex:(unint64_t)a3 forPageScrollViewController:(id)a4;
- (id)_accessibilityValueForPageAtIndex:(unint64_t)a3 forPageScrollViewController:(id)a4;
- (void)_deactivateAddFaceAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_dismissSwitcherAnimated:(BOOL)a3 withIndex:(unint64_t)a4 remainFrozen:(BOOL)a5 completion:(id)a6;
- (void)_scrollToAndSetupFaceAtIndex:(unint64_t)a3 updateLibraryFaceCollection:(BOOL)a4;
- (void)endInteractiveLibraryPresentationLatched:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NTKFaceLibraryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKFaceLibraryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceLibraryViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceCollection", @"faceAtIndex:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceLibraryViewController", @"_indexOfAddPage", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceLibraryOverlayView", @"cancelButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceLibraryOverlayView", @"editButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceLibraryOverlayView", @"shareButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceLibraryViewController", @"_didTapShareButton", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceLibraryViewController", @"_deactivateAddFaceAnimated: withCompletion:", "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceLibraryViewController", @"_startFaceEditing", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceViewController", @"face", "@", 0);
  [v3 validateClass:@"NTKFaceLibraryViewController" hasInstanceVariable:@"_libraryFaceCollection" withType:"NTKFaceCollection"];
  [v3 validateClass:@"NTKFaceLibraryViewController" hasInstanceVariable:@"_addableFaceCollection" withType:"NTKFaceCollection"];
  [v3 validateClass:@"NTKFaceLibraryViewController" hasInstanceVariable:@"_switcherController" withType:"NTKSwitcherViewController"];
  [v3 validateClass:@"NTKFaceLibraryViewController" hasInstanceVariable:@"_libraryOverlayView" withType:"NTKFaceLibraryOverlayView"];
  [v3 validateClass:@"NTKFaceLibraryViewController" hasInstanceVariable:@"_selectedFaceViewController" withType:"NTKFaceViewController"];
  [v3 validateClass:@"NTKFaceLibraryViewController" hasInstanceVariable:@"_presented" withType:"B"];
  [v3 validateClass:@"NTKFaceLibraryViewController" hasInstanceVariable:@"_isFaceEditing" withType:"B"];
  [v3 validateClass:@"NTKFaceLibraryViewController" hasInstanceVariable:@"_addFaceViewController" withType:"NTKAddPageViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKAddPageViewController", @"currentPageIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKAddPageViewController", @"isActive", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceLibraryViewController", @"_titleForAddFacePageAtIndex:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceLibraryViewController", @"endInteractiveLibraryPresentationLatched:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceLibraryViewController", @"_scrollToAndSetupFaceAtIndex: updateLibraryFaceCollection:", "v", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceLibraryViewController", @"_dismissSwitcherAnimated:withIndex:remainFrozen:completion:", "v", "B", "Q", "B", "@?", 0);
  [v3 validateClass:@"NTKFace"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFace", @"faceStyle", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFace", @"name", "@", 0);
  [v3 validateClass:@"NTKPageScrollViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPageScrollViewController", @"scrollEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPageScrollViewController", @"currentPageIndex", "Q", 0);
  [v3 validateClass:@"NTKFaceLibraryOverlayView" hasInstanceVariable:@"_showingUpgradeAction" withType:"B"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKFaceLibraryViewControllerAccessibility;
  [(NTKFaceLibraryViewControllerAccessibility *)&v3 viewWillAppear:a3];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(NTKFaceLibraryViewControllerAccessibility *)self safeBoolForKey:@"_presented"];
  v6.receiver = self;
  v6.super_class = (Class)NTKFaceLibraryViewControllerAccessibility;
  [(NTKFaceLibraryViewControllerAccessibility *)&v6 viewDidDisappear:v3];
  if (v5) {
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
  }
}

- (BOOL)_accessibilityShouldSwipeBetweenPagesForPageScrollViewController:(id)a3
{
  id v4 = a3;
  if (([(NTKFaceLibraryViewControllerAccessibility *)self safeBoolForKey:@"_isFaceEditing"] & 1) != 0|| ![(NTKFaceLibraryViewControllerAccessibility *)self safeBoolForKey:@"_presented"])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    unsigned __int8 v5 = [v4 safeBoolForKey:@"scrollEnabled"];
  }

  return v5;
}

- (id)_accessibilityValueForPageAtIndex:(unint64_t)a3 forPageScrollViewController:(id)a4
{
  id v6 = a4;
  v7 = [(NTKFaceLibraryViewControllerAccessibility *)self safeValueForKey:@"_libraryFaceCollection"];
  id v8 = [(NTKFaceLibraryViewControllerAccessibility *)self safeValueForKey:@"_switcherController"];

  if (v8 == v6
    && [(NTKFaceLibraryViewControllerAccessibility *)self safeUnsignedIntegerForKey:@"_indexOfAddPage"] != (id)a3)
  {
    char v20 = 0;
    objc_opt_class();
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__1;
    v18 = __Block_byref_object_dispose__1;
    id v19 = 0;
    id v13 = v7;
    AXPerformSafeBlock();
    id v12 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    v9 = __UIAccessibilityCastAsSafeCategory();

    if (v20) {
      abort();
    }
  }
  else
  {
    v9 = 0;
  }
  v10 = AXNTKFaceComplicationOverviewDescription(v9);

  return v10;
}

uint64_t __107__NTKFaceLibraryViewControllerAccessibility__accessibilityValueForPageAtIndex_forPageScrollViewController___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) faceAtIndex:*(void *)(a1 + 48)];

  return _objc_release_x1();
}

- (id)_accessibilityLabelForPageAtIndex:(unint64_t)a3 forPageScrollViewController:(id)a4
{
  id v6 = a4;
  v7 = [(NTKFaceLibraryViewControllerAccessibility *)self safeValueForKey:@"_libraryFaceCollection"];
  id v8 = [(NTKFaceLibraryViewControllerAccessibility *)self safeValueForKey:@"_switcherController"];

  if (v8 != v6)
  {
    [(NTKFaceLibraryViewControllerAccessibility *)self safeValueForKey:@"_addableFaceCollection"];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__1;
    v28 = __Block_byref_object_dispose__1;
    id v29 = 0;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    AXPerformSafeBlock();
    id v10 = (id)v25[5];

    _Block_object_dispose(&v24, 8);
    if (v10)
    {
      v11 = [v10 safeStringForKey:@"name"];
      id v12 = [v11 localizedLowercaseString];
    }
    else
    {
      id v12 = 0;
    }

    goto LABEL_8;
  }
  if ([(NTKFaceLibraryViewControllerAccessibility *)self safeUnsignedIntegerForKey:@"_indexOfAddPage"] == (id)a3)
  {
    accessibilityLocalizedString(@"add.new.face", v13);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    uint64_t v14 = 0;
    goto LABEL_9;
  }
  char v30 = 0;
  objc_opt_class();
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  id v23 = v7;
  AXPerformSafeBlock();
  id v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  uint64_t v14 = __UIAccessibilityCastAsSafeCategory();

  if (v30) {
    abort();
  }
  if (v14)
  {
    v17 = [(NTKFaceLibraryViewControllerAccessibility *)self safeValueForKey:@"_libraryOverlayView"];
    v18 = [v17 safeValueForKey:@"editButton"];
    id v19 = [v14 safeStringForKey:@"name"];
    char v20 = [v19 localizedLowercaseString];

    if ([(NTKFaceLibraryViewControllerAccessibility *)self _axCanUseOverlayButton:v18])
    {
      v22 = accessibilityLocalizedString(@"face.customizable.hint", v21);
      __UIAXStringForVariables();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = v20;
    }
  }
  else
  {
    id v12 = 0;
  }
LABEL_9:

  return v12;
}

uint64_t __107__NTKFaceLibraryViewControllerAccessibility__accessibilityLabelForPageAtIndex_forPageScrollViewController___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) faceAtIndex:*(void *)(a1 + 48)];

  return _objc_release_x1();
}

uint64_t __107__NTKFaceLibraryViewControllerAccessibility__accessibilityLabelForPageAtIndex_forPageScrollViewController___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) faceAtIndex:*(void *)(a1 + 48)];

  return _objc_release_x1();
}

- (id)_accessibilityHintForPageAtIndex:(unint64_t)a3 forPageScrollViewController:(id)a4
{
  id v6 = a4;
  id v7 = [(NTKFaceLibraryViewControllerAccessibility *)self safeValueForKey:@"_switcherController"];

  if (v7 == v6)
  {
    if ([(NTKFaceLibraryViewControllerAccessibility *)self safeUnsignedIntegerForKey:@"_indexOfAddPage"] == (id)a3)
    {
      id v8 = accessibilityLocalizedString(@"add.face.hint", v9);
    }
    else
    {
      id v10 = [(NTKFaceLibraryViewControllerAccessibility *)self safeValueForKey:@"_libraryFaceCollection"];
      char v24 = 0;
      objc_opt_class();
      uint64_t v18 = 0;
      id v19 = &v18;
      uint64_t v20 = 0x3032000000;
      uint64_t v21 = __Block_byref_object_copy__1;
      v22 = __Block_byref_object_dispose__1;
      id v23 = 0;
      id v11 = v10;
      AXPerformSafeBlock();
      id v12 = (id)v19[5];

      _Block_object_dispose(&v18, 8);
      uint64_t v13 = __UIAccessibilityCastAsSafeCategory();

      if (v24) {
        abort();
      }
      uint64_t v14 = [v13 _accessibilityFaceStyleDescription];
      v17 = accessibilityLocalizedString(@"face.hint", v15);
      id v8 = __UIAXStringForVariables();
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __106__NTKFaceLibraryViewControllerAccessibility__accessibilityHintForPageAtIndex_forPageScrollViewController___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) faceAtIndex:*(void *)(a1 + 48)];

  return _objc_release_x1();
}

- (BOOL)_axCanUseOverlayButton:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = __UIAccessibilityCastAsClass();
  if ([v4 _accessibilityViewIsVisible]) {
    unsigned __int8 v5 = [v4 isEnabled];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)_axDeactivateAddFace
{
  return 1;
}

id __65__NTKFaceLibraryViewControllerAccessibility__axDeactivateAddFace__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivateAddFaceAnimated:1 withCompletion:&__block_literal_global_1];
}

- (BOOL)_axStartEditing
{
  uint64_t v4 = 0;
  unsigned __int8 v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __60__NTKFaceLibraryViewControllerAccessibility__axStartEditing__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _startFaceEditing];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (BOOL)_axShareFace
{
  uint64_t v4 = 0;
  unsigned __int8 v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __57__NTKFaceLibraryViewControllerAccessibility__axShareFace__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _didTapShareButton];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (BOOL)_axAddPageViewControllerIsActive
{
  id v3 = [(NTKFaceLibraryViewControllerAccessibility *)self safeValueForKey:@"_switcherController"];
  uint64_t v4 = [(NTKFaceLibraryViewControllerAccessibility *)self safeValueForKey:@"_addFaceViewController"];
  id v5 = [v3 safeUnsignedIntegerForKey:@"currentPageIndex"];
  if (v5 == -[NTKFaceLibraryViewControllerAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", @"_indexOfAddPage"))unsigned __int8 v6 = [v4 safeBoolForKey:@"isActive"]; {
  else
  }
    unsigned __int8 v6 = 0;

  return v6;
}

- (id)_accessibilityCustomActionsForPageAtIndex:(unint64_t)a3 forPageScrollViewController:(id)a4
{
  id v6 = a4;
  char v7 = [(NTKFaceLibraryViewControllerAccessibility *)self safeValueForKey:@"_libraryOverlayView"];
  id v8 = [(NTKFaceLibraryViewControllerAccessibility *)self safeValueForKey:@"_switcherController"];
  unsigned __int8 v9 = [(NTKFaceLibraryViewControllerAccessibility *)self _accessibilityShouldSwipeBetweenPagesForPageScrollViewController:v8];

  if (v9)
  {
    id v10 = +[NSMutableArray array];
    if ([v6 safeBoolForKey:@"scrollEnabled"]
      && [v6 safeUnsignedIntegerForKey:@"currentPageIndex"] == (id)a3)
    {
      id v11 = [v7 safeValueForKey:@"editButton"];
      if ([(NTKFaceLibraryViewControllerAccessibility *)self _axCanUseOverlayButton:v11])
      {
        id v12 = objc_alloc((Class)UIAccessibilityCustomAction);
        uint64_t v13 = [v11 titleForState:0];
        id v14 = [v12 initWithName:v13 target:self selector:"_axStartEditing"];

        uint64_t v15 = +[UIImage systemImageNamed:@"pencil.circle.fill"];
        [v14 setImage:v15];

        [v10 addObject:v14];
      }
      id v16 = [v7 safeValueForKey:@"shareButton"];
      if ([(NTKFaceLibraryViewControllerAccessibility *)self _axCanUseOverlayButton:v16]
        && ([v7 safeBoolForKey:@"_showingUpgradeAction"] & 1) == 0)
      {
        id v17 = objc_alloc((Class)UIAccessibilityCustomAction);
        uint64_t v18 = accessibilityGreenfieldLocalizedString(@"share.action");
        id v19 = [v17 initWithName:v18 target:self selector:"_axShareFace"];

        uint64_t v20 = +[UIImage systemImageNamed:@"square.and.arrow.up.fill"];
        [v19 setImage:v20];

        [v10 addObject:v19];
      }

      goto LABEL_13;
    }
  }
  else
  {
    if ([(NTKFaceLibraryViewControllerAccessibility *)self _axAddPageViewControllerIsActive])
    {
      id v11 = [v7 safeValueForKey:@"cancelButton"];
      if ([(NTKFaceLibraryViewControllerAccessibility *)self _axCanUseOverlayButton:v11])
      {
        id v21 = objc_alloc((Class)UIAccessibilityCustomAction);
        v22 = [v11 titleForState:0];
        id v23 = [v21 initWithName:v22 target:self selector:"_axDeactivateAddFace"];

        id v25 = v23;
        id v10 = +[NSArray arrayWithObjects:&v25 count:1];

LABEL_13:
        goto LABEL_16;
      }
    }
    id v10 = 0;
  }
LABEL_16:

  return v10;
}

- (void)endInteractiveLibraryPresentationLatched:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKFaceLibraryViewControllerAccessibility;
  [(NTKFaceLibraryViewControllerAccessibility *)&v3 endInteractiveLibraryPresentationLatched:a3];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)_scrollToAndSetupFaceAtIndex:(unint64_t)a3 updateLibraryFaceCollection:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)NTKFaceLibraryViewControllerAccessibility;
  [(NTKFaceLibraryViewControllerAccessibility *)&v4 _scrollToAndSetupFaceAtIndex:a3 updateLibraryFaceCollection:a4];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)_deactivateAddFaceAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __87__NTKFaceLibraryViewControllerAccessibility__deactivateAddFaceAnimated_withCompletion___block_invoke;
  v9[3] = &unk_20700;
  id v10 = a4;
  unsigned __int8 v11 = [(NTKFaceLibraryViewControllerAccessibility *)self safeBoolForKey:@"_presented"];
  id v6 = v10;
  char v7 = objc_retainBlock(v9);
  v8.receiver = self;
  v8.super_class = (Class)NTKFaceLibraryViewControllerAccessibility;
  [(NTKFaceLibraryViewControllerAccessibility *)&v8 _deactivateAddFaceAnimated:v4 withCompletion:v7];
}

void __87__NTKFaceLibraryViewControllerAccessibility__deactivateAddFaceAnimated_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (*(unsigned char *)(a1 + 40))
  {
    UIAccessibilityNotifications v3 = UIAccessibilityScreenChangedNotification;
    UIAccessibilityPostNotification(v3, 0);
  }
}

- (void)_dismissSwitcherAnimated:(BOOL)a3 withIndex:(unint64_t)a4 remainFrozen:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __104__NTKFaceLibraryViewControllerAccessibility__dismissSwitcherAnimated_withIndex_remainFrozen_completion___block_invoke;
  v13[3] = &unk_20748;
  id v14 = a6;
  id v10 = v14;
  unsigned __int8 v11 = objc_retainBlock(v13);
  v12.receiver = self;
  v12.super_class = (Class)NTKFaceLibraryViewControllerAccessibility;
  [(NTKFaceLibraryViewControllerAccessibility *)&v12 _dismissSwitcherAnimated:v8 withIndex:a4 remainFrozen:v6 completion:v11];
}

uint64_t __104__NTKFaceLibraryViewControllerAccessibility__dismissSwitcherAnimated_withIndex_remainFrozen_completion___block_invoke(uint64_t a1, __n128 a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  a2.n128_u64[0] = 0.5;

  return _AXPerformBlockOnMainThreadAfterDelay(&__block_literal_global_443, a2);
}

void __104__NTKFaceLibraryViewControllerAccessibility__dismissSwitcherAnimated_withIndex_remainFrozen_completion___block_invoke_2(id a1)
{
}

@end