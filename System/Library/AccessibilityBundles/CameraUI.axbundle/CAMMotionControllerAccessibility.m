@interface CAMMotionControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axInternalMotionManager;
- (id)_axInternalMotionManagerQueue;
- (void)_axDoMotionUpdate:(id)a3;
- (void)_axSetInternalMotionManager:(id)a3;
- (void)_axSetInternalMotionManagerQueue:(id)a3;
- (void)_handleLevelMotionUpdate:(id)a3 error:(id)a4;
- (void)axStartInternalMotionManagerIfNecessary;
- (void)axStopInternalMotionManager;
@end

@implementation CAMMotionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMMotionController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMMotionController", @"_attitudeAlignmentMotionManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMMotionController", @"captureOrientation", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMMotionController", @"_handleLevelMotionUpdate:error:", "v", "@", "@", 0);
}

- (void)_handleLevelMotionUpdate:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CAMMotionControllerAccessibility;
  [(CAMMotionControllerAccessibility *)&v10 _handleLevelMotionUpdate:v6 error:v7];
  objc_opt_class();
  v8 = [(CAMMotionControllerAccessibility *)self safeValueForKey:@"_attitudeAlignmentMotionManager"];
  v9 = __UIAccessibilityCastAsClass();

  if (v9) {
    [(CAMMotionControllerAccessibility *)self _axDoMotionUpdate:v9];
  }
}

- (id)_axInternalMotionManagerQueue
{
}

- (void)_axSetInternalMotionManagerQueue:(id)a3
{
}

- (id)_axInternalMotionManager
{
}

- (void)_axSetInternalMotionManager:(id)a3
{
}

- (void)axStartInternalMotionManagerIfNecessary
{
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(CAMMotionControllerAccessibility *)self safeValueForKey:@"_attitudeAlignmentMotionManager"];
  v4 = __UIAccessibilityCastAsClass();

  if (([v4 isDeviceMotionActive] & 1) == 0)
  {
    id v5 = [(CAMMotionControllerAccessibility *)self _axInternalMotionManagerQueue];
    if (!v5)
    {
      id v5 = objc_alloc_init(MEMORY[0x263F08A48]);
      [(CAMMotionControllerAccessibility *)self _axSetInternalMotionManagerQueue:v5];
    }
    id v6 = [(CAMMotionControllerAccessibility *)self _axInternalMotionManager];
    if (!v6)
    {
      id v6 = objc_alloc_init(MEMORY[0x263F01788]);
      [v6 setDeviceMotionUpdateInterval:0.1];
      [(CAMMotionControllerAccessibility *)self _axSetInternalMotionManager:v6];
    }
    if ([v6 isDeviceMotionAvailable]
      && ([v6 isDeviceMotionActive] & 1) == 0)
    {
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __75__CAMMotionControllerAccessibility_axStartInternalMotionManagerIfNecessary__block_invoke;
      v7[3] = &unk_2650A0280;
      objc_copyWeak(&v9, &location);
      id v8 = v6;
      [v8 startDeviceMotionUpdatesToQueue:v5 withHandler:v7];

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __75__CAMMotionControllerAccessibility_axStartInternalMotionManagerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _axDoMotionUpdate:*(void *)(a1 + 32)];
}

- (void)axStopInternalMotionManager
{
  id v2 = [(CAMMotionControllerAccessibility *)self _axInternalMotionManager];
  [v2 stopDeviceMotionUpdates];
}

- (void)_axDoMotionUpdate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    if ([v4 isDeviceMotionAvailable])
    {
      id v5 = [v8 deviceMotion];
      uint64_t v6 = [(CAMMotionControllerAccessibility *)self safeIntegerForKey:@"captureOrientation"];
      id v7 = +[AXCameraVisionEngine sharedEngine];
      [v7 motionManagerDidUpdateDeviceMotion:v5 captureOrientation:v6];
    }
  }

  MEMORY[0x270F9A758]();
}

@end