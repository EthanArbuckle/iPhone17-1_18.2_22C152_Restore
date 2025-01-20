@interface AMSUIDebugMenu
+ (void)presentDebugMenuWithPresentingVC:(id)a3 debugInfo:(id)a4;
- (AMSUIDebugMenu)init;
@end

@implementation AMSUIDebugMenu

+ (void)presentDebugMenuWithPresentingVC:(id)a3 debugInfo:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267C78B70);
    uint64_t v4 = sub_21C2BF440();
  }
  swift_getObjCClassMetadata();
  id v6 = a3;
  static DebugMenu.presentDebugMenu(presentingVC:debugInfo:)((uint64_t)v6, v4);

  swift_bridgeObjectRelease();
}

- (AMSUIDebugMenu)init
{
  return (AMSUIDebugMenu *)DebugMenu.init()();
}

@end