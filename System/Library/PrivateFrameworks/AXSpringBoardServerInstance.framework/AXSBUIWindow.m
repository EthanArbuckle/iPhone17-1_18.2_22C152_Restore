@interface AXSBUIWindow
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_setRotatableViewOrientation:(int64_t)a3 duration:(double)a4 force:(BOOL)a5;
@end

@implementation AXSBUIWindow

+ (id)safeCategoryTargetClassName
{
  return @"UIWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_setRotatableViewOrientation:(int64_t)a3 duration:(double)a4 force:(BOOL)a5
{
  v16[2] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)AXSBUIWindow;
  -[AXSBUIWindow _setRotatableViewOrientation:duration:force:](&v14, sel__setRotatableViewOrientation_duration_force_, a3, a5);
  objc_opt_class();
  v6 = __UIAccessibilityCastAsClass();
  if (([v6 isHidden] & 1) == 0)
  {
    v7 = [MEMORY[0x263F82438] sharedApplication];
    v8 = [v7 safeValueForKey:@"_frontMostAppOrientation"];
    uint64_t v9 = [v8 integerValue];

    v15[0] = *MEMORY[0x263F226E0];
    v10 = [NSNumber numberWithInteger:v9];
    v16[0] = v10;
    v15[1] = *MEMORY[0x263F226E8];
    v11 = [NSNumber numberWithDouble:a4];
    v16[1] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

    v13 = +[_AXSpringBoardServerInstance springBoardServerInstance];
    [v13 springBoardActionOccurred:4 withPayload:v12];
  }
}

@end