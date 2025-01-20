@interface APSystemAppOutlet
- (APSystemAppOutlet)init;
- (APSystemAppOutlet)initWithSystemAppInterface:(id)a3;
- (BOOL)shouldShieldLaunchOfApplication:(id)a3;
- (void)addShield:(id)a3;
- (void)invalidate;
- (void)noteAllScenesDismissedForApplication:(id)a3;
- (void)noteSceneWillBecomeForegroundVisibleForApplication:(id)a3;
- (void)removeShield:(id)a3;
- (void)resume;
@end

@implementation APSystemAppOutlet

- (void)noteSceneWillBecomeForegroundVisibleForApplication:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_247D39A00(v4);
}

- (APSystemAppOutlet)initWithSystemAppInterface:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = (APSystemAppOutlet *)sub_247D52B94((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (BOOL)shouldShieldLaunchOfApplication:(id)a3
{
  return objc_msgSend(a3, sel_isEffectivelyLocked);
}

- (void)noteAllScenesDismissedForApplication:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_247D4F970(v4);
}

- (void)resume
{
  v3 = self;
  sub_247D50B6C((uint64_t)v3, v2);
}

- (void)invalidate
{
  uint64_t v2 = self;
  sub_247D50F20();
}

- (APSystemAppOutlet)init
{
  result = (APSystemAppOutlet *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
}

- (void)addShield:(id)a3
{
}

- (void)removeShield:(id)a3
{
}

@end