@interface NTKCFaceDetailViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetHeaderInteractableElements;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation NTKCFaceDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCFaceDetailViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKCFaceDetailViewController" hasInstanceVariable:@"_currentSections" withType:"NSMutableArray"];
  [v3 validateClass:@"NTKCFaceDetailComplicationSectionController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailViewController", @"tableView: didSelectRowAtIndexPath:", "v", "@", "@", 0);
  [v3 validateClass:@"NTKCFaceDetailViewController" hasInstanceVariable:@"_addButton" withType:"UIButton"];
  [v3 validateClass:@"NTKCFaceDetailViewController" hasInstanceVariable:@"_faceName" withType:"UILabel"];
  [v3 validateClass:@"NTKCFaceDetailViewController" hasInstanceVariable:@"_headerView" withType:"_NTKCDetailHeaderView"];
  [v3 validateClass:@"_NTKCDetailHeaderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NTKCDetailHeaderView", @"interactableSubviews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NTKCDetailHeaderView", @"setInteractableSubviews:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailViewControllerAccessibility;
  [(NTKCFaceDetailViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(NTKCFaceDetailViewControllerAccessibility *)self _axSetHeaderInteractableElements];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailViewControllerAccessibility;
  [(NTKCFaceDetailViewControllerAccessibility *)&v3 viewDidLoad];
  [(NTKCFaceDetailViewControllerAccessibility *)self _axSetHeaderInteractableElements];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NTKCFaceDetailViewControllerAccessibility;
  [(NTKCFaceDetailViewControllerAccessibility *)&v19 tableView:v6 didSelectRowAtIndexPath:v7];
  id v8 = [v7 section];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  AXPerformSafeBlock();
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  v10 = (char *)[(NTKCFaceDetailViewControllerAccessibility *)self safeIntegerForKey:@"_selectedComplicationIndex"];
  AXSafeClassFromString();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    AXSafeClassFromString();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = +[NSIndexPath indexPathForRow:v10 + 1 inSection:v8];
      v12 = [v6 cellForRowAtIndexPath:v11];

      UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v12);
    }
  }
}

void __79__NTKCFaceDetailViewControllerAccessibility_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeArrayForKey:@"_currentSections"];
  uint64_t v2 = [v5 objectAtIndex:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_axSetHeaderInteractableElements
{
  id v9 = [(NTKCFaceDetailViewControllerAccessibility *)self safeValueForKey:@"_headerView"];
  uint64_t v3 = [v9 safeArrayForKey:@"interactableSubviews"];
  if (v3)
  {
    v4 = [(NTKCFaceDetailViewControllerAccessibility *)self safeValueForKey:@"_addButton"];
    if ([v3 containsObject:v4])
    {
      id v5 = [(NTKCFaceDetailViewControllerAccessibility *)self safeValueForKey:@"_faceName"];
      unsigned __int8 v6 = [v3 containsObject:v5];

      if (v6) {
        goto LABEL_6;
      }
      v4 = [(NTKCFaceDetailViewControllerAccessibility *)self safeValueForKey:@"_faceName"];
      id v7 = [(NTKCFaceDetailViewControllerAccessibility *)self safeValueForKey:@"_addButton"];
      id v8 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v7);
      [v9 setInteractableSubviews:v8];
    }
  }
LABEL_6:
}

@end