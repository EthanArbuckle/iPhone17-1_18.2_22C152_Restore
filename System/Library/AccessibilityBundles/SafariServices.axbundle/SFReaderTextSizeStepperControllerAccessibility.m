@interface SFReaderTextSizeStepperControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateStepperControls:(id)a3;
- (void)prepareStepper:(id)a3;
@end

@implementation SFReaderTextSizeStepperControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFReaderTextSizeStepperController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFReaderTextSizeStepperController", @"prepareStepper:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFReaderTextSizeStepperController", @"_updateStepperControls:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WBSReaderConfigurationManager", @"effectiveTextZoomIndex", "q", 0);
  [v3 validateClass:@"SFReaderTextSizeStepperController" hasInstanceVariable:@"_readerContext" withType:"<SFReaderContext>"];
  [v3 validateProtocol:@"SFReaderContext" hasMethod:@"configurationManager" isInstanceMethod:1 isRequired:1];
}

- (void)prepareStepper:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFReaderTextSizeStepperControllerAccessibility;
  id v3 = a3;
  [(SFReaderTextSizeStepperControllerAccessibility *)&v5 prepareStepper:v3];
  v4 = accessibilitySafariServicesLocalizedString(@"text.size");
  objc_msgSend(v3, "setAccessibilityLabel:", v4, v5.receiver, v5.super_class);
}

- (void)_updateStepperControls:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFReaderTextSizeStepperControllerAccessibility;
  [(SFReaderTextSizeStepperControllerAccessibility *)&v12 _updateStepperControls:v4];
  objc_super v5 = [(SFReaderTextSizeStepperControllerAccessibility *)self safeValueForKey:@"_readerContext"];
  v6 = [v5 safeValueForKey:@"configurationManager"];
  v7 = __UIAccessibilitySafeClass();

  uint64_t v8 = [v7 safeIntegerForKey:@"effectiveTextZoomIndex"];
  v9 = NSString;
  v10 = accessibilitySafariServicesLocalizedString(@"text.zoom.level");
  v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v8);
  [v4 setAccessibilityValue:v11];
}

@end