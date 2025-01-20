@interface ETGLSketchViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)animateOutWithCompletion:(id)a3;
- (void)setPaused:(BOOL)a3;
@end

@implementation ETGLSketchViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ETGLSketchView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ETGLSketchView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETGLSketchView", @"setPaused:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETGLSketchView", @"animateOutWithCompletion:", "v", "@?", 0);
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || !UIAccessibilityIsVoiceOverRunning())
  {
    v5.receiver = self;
    v5.super_class = (Class)ETGLSketchViewAccessibility;
    [(ETGLSketchViewAccessibility *)&v5 setPaused:v3];
  }
  else
  {
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    v8 = __41__ETGLSketchViewAccessibility_setPaused___block_invoke;
    v9 = &unk_26511CCF0;
    BOOL v11 = v3;
    v10 = self;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

id __41__ETGLSketchViewAccessibility_setPaused___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ETGLSketchViewAccessibility;
  return objc_msgSendSuper2(&v3, sel_setPaused_, v1);
}

- (void)animateOutWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ETGLSketchViewAccessibility;
    [(ETGLSketchViewAccessibility *)&v5 animateOutWithCompletion:v4];
  }
}

@end