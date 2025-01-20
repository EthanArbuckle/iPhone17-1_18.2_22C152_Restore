@interface CompanionAutoLaunchSettingsConfiguration
- (BOOL)isTinker;
- (BOOL)supportsDepth;
- (_TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration)init;
- (int64_t)depthAutoLaunchVersion;
- (void)setDepthAutoLaunchVersion:(int64_t)a3;
- (void)setIsTinker:(BOOL)a3;
- (void)setSupportsDepth:(BOOL)a3;
@end

@implementation CompanionAutoLaunchSettingsConfiguration

- (BOOL)isTinker
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_isTinker;
  swift_beginAccess();
  return *v2;
}

- (void)setIsTinker:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_isTinker;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)supportsDepth
{
  v2 = (BOOL *)self
     + OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_supportsDepth;
  swift_beginAccess();
  return *v2;
}

- (void)setSupportsDepth:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_supportsDepth;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (int64_t)depthAutoLaunchVersion
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_depthAutoLaunchVersion);
  swift_beginAccess();
  return *v2;
}

- (void)setDepthAutoLaunchVersion:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_depthAutoLaunchVersion);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (_TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_isTinker) = 0;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_supportsDepth) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_depthAutoLaunchVersion) = (Class)(&dword_0 + 1);
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CompanionAutoLaunchSettingsConfiguration();
  return [(CompanionAutoLaunchSettingsConfiguration *)&v3 init];
}

@end