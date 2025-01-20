@interface AXSBServerSBHUDController
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_presentHUD:(id)a3 animated:(BOOL)a4;
@end

@implementation AXSBServerSBHUDController

+ (id)safeCategoryTargetClassName
{
  return @"SBHUDController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_presentHUD:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  int v8 = [v7 shouldBlockGestureActivation:4];

  if (!v8
    || ([(AXSBServerSBHUDController *)self safeValueForKey:@"hudViewController"],
        v9 = objc_claimAutoreleasedReturnValue(),
        NSClassFromString(&cfstr_Sbelastichudvi.isa),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v9,
        (isKindOfClass & 1) == 0))
  {
    v11.receiver = self;
    v11.super_class = (Class)AXSBServerSBHUDController;
    [(AXSBServerSBHUDController *)&v11 _presentHUD:v6 animated:v4];
  }
}

@end