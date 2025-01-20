@interface CKAutoloopMovieBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axBalloonViewCustomActions;
- (id)accessibilityValue;
- (void)_axMuteAutoloopMovie;
- (void)_axUnmuteAutoloopMovie;
@end

@implementation CKAutoloopMovieBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAutoloopMovieBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKAutoloopMovieBalloonView" hasInstanceVariable:@"_isMuted" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAutoloopMovieBalloonView", @"setIsMuted:", "v", "B", 0);
}

- (id)accessibilityValue
{
  if ([(CKAutoloopMovieBalloonViewAccessibility *)self safeBoolForKey:@"_isMuted"])id v3 = @"autoloop.movie.muted"; {
  else
  }
    id v3 = @"autoloop.movie.unmuted";
  v4 = accessibilityLocalizedString(v3);
  v8.receiver = self;
  v8.super_class = (Class)CKAutoloopMovieBalloonViewAccessibility;
  v7 = [(CKAutoloopMovieBalloonViewAccessibility *)&v8 accessibilityValue];
  v5 = __UIAXStringForVariables();

  return v5;
}

- (id)_axBalloonViewCustomActions
{
  id v3 = (void *)MEMORY[0x263EFF980];
  v13.receiver = self;
  v13.super_class = (Class)CKAutoloopMovieBalloonViewAccessibility;
  v4 = [(CKAutoloopMovieBalloonViewAccessibility *)&v13 _axBalloonViewCustomActions];
  v5 = objc_msgSend(v3, "axArrayWithPossiblyNilArrays:", 1, v4);

  int v6 = [(CKAutoloopMovieBalloonViewAccessibility *)self safeBoolForKey:@"_isMuted"];
  id v7 = objc_alloc(MEMORY[0x263F1C390]);
  if (v6) {
    objc_super v8 = @"autoloop.movie.action.unmute";
  }
  else {
    objc_super v8 = @"autoloop.movie.action.mute";
  }
  if (v6) {
    v9 = &selRef__axUnmuteAutoloopMovie;
  }
  else {
    v9 = &selRef__axMuteAutoloopMovie;
  }
  v10 = accessibilityLocalizedString(v8);
  v11 = (void *)[v7 initWithName:v10 target:self selector:*v9];

  [v5 axSafelyAddObject:v11];

  return v5;
}

- (void)_axMuteAutoloopMovie
{
}

uint64_t __63__CKAutoloopMovieBalloonViewAccessibility__axMuteAutoloopMovie__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsMuted:1];
}

- (void)_axUnmuteAutoloopMovie
{
}

uint64_t __65__CKAutoloopMovieBalloonViewAccessibility__axUnmuteAutoloopMovie__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsMuted:0];
}

@end