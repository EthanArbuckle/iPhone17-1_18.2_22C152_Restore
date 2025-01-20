@interface AXSBServerHelperSBControlCenterController
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)canBePresented;
@end

@implementation AXSBServerHelperSBControlCenterController

+ (id)safeCategoryTargetClassName
{
  return @"SBControlCenterController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canBePresented
{
  v3 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  char v4 = [v3 shouldBlockGestureActivation:2];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)AXSBServerHelperSBControlCenterController;
  return [(AXSBServerHelperSBControlCenterController *)&v6 canBePresented];
}

@end