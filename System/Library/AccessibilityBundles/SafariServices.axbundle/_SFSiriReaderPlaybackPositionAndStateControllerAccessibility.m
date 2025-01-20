@interface _SFSiriReaderPlaybackPositionAndStateControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)prepareStepper:(id)a3;
@end

@implementation _SFSiriReaderPlaybackPositionAndStateControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFSiriReaderPlaybackPositionAndStateController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_SFSiriReaderPlaybackPositionAndStateController" hasInstanceVariable:@"_stepper" withType:"<_SFSettingsAlertStepperConfiguration>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFSiriReaderPlaybackPositionAndStateController", @"prepareStepper:", "v", "@", 0);
  [v3 validateClass:@"_SFSiriReaderPlaybackPositionAndStateController" hasInstanceVariable:@"_isPlaying" withType:"BOOL"];
}

- (void)prepareStepper:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_SFSiriReaderPlaybackPositionAndStateControllerAccessibility;
  [(_SFSiriReaderPlaybackPositionAndStateControllerAccessibility *)&v10 prepareStepper:a3];
  v4 = accessibilitySafariServicesLocalizedString(@"reader.playback");
  v5 = [(_SFSiriReaderPlaybackPositionAndStateControllerAccessibility *)self safeUIViewForKey:@"_stepper"];
  [v5 setAccessibilityLabel:v4];

  v6 = [(_SFSiriReaderPlaybackPositionAndStateControllerAccessibility *)self safeUIViewForKey:@"_stepper"];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke;
  v9[3] = &unk_26514AAB8;
  v9[4] = self;
  [v6 setAccessibilityValueBlock:v9];

  v7 = [(_SFSiriReaderPlaybackPositionAndStateControllerAccessibility *)self safeUIViewForKey:@"_stepper"];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_2;
  v8[3] = &unk_26514AB30;
  v8[4] = self;
  [v7 _setAccessibilityCustomActionsBlock:v8];
}

@end