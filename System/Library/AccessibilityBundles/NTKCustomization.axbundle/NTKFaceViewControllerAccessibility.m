@interface NTKFaceViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)configureWithDuration:(double)a3 block:(id)a4;
- (void)faceViewWantsCustomKeylineFramesReloadedForEditMode:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation NTKFaceViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKFaceViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceViewController", @"configureWithDuration: block:", "v", "d", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceViewController", @"enumerateComplicationControllersAndDisplaysWithBlock:", "v", "@?", 0);
  [v3 validateClass:@"NTKFaceViewController" hasInstanceVariable:@"_editView" withType:"NTKFaceEditView"];
  [v3 validateClass:@"NTKFaceViewController" hasInstanceVariable:@"_faceView" withType:"NTKFaceView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceViewController", @"faceViewWantsCustomKeylineFramesReloadedForEditMode:", "v", "q", 0);
  [v3 validateClass:@"_NTKKeylineImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKComplication", @"localizedKeylineLabelText", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)NTKFaceViewControllerAccessibility;
  [(NTKFaceViewControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKFaceViewControllerAccessibility;
  [(NTKFaceViewControllerAccessibility *)&v3 viewDidAppear:a3];
}

- (void)configureWithDuration:(double)a3 block:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NTKFaceViewControllerAccessibility;
  [(NTKFaceViewControllerAccessibility *)&v5 configureWithDuration:a4 block:a3];
  [(NTKFaceViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)faceViewWantsCustomKeylineFramesReloadedForEditMode:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKFaceViewControllerAccessibility;
  [(NTKFaceViewControllerAccessibility *)&v3 faceViewWantsCustomKeylineFramesReloadedForEditMode:a3];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

@end