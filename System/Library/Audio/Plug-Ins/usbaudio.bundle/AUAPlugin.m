@interface AUAPlugin
+ (id)sharedNonremotePlugin;
+ (id)sharedRemotePlugin;
- (AUAPlugin)init;
@end

@implementation AUAPlugin

+ (id)sharedRemotePlugin
{
  id v2 = sub_100071ED0();

  return v2;
}

+ (id)sharedNonremotePlugin
{
  id v2 = sub_10007208C();

  return v2;
}

- (AUAPlugin)init
{
  result = (AUAPlugin *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AUAPlugin_plugin);
}

@end