@interface CPForegroundApplication
- (BOOL)isGameCenterApplication;
- (CPForegroundApplication)init;
- (NSString)bundleIdentifier;
- (NSString)localizedApplicationName;
- (int64_t)applicationType;
@end

@implementation CPForegroundApplication

- (NSString)bundleIdentifier
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CPForegroundApplication_bundleIdentifier);
  uint64_t v3 = *(void *)&self->bundleIdentifier[OBJC_IVAR___CPForegroundApplication_bundleIdentifier];
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x1B3EA1B00](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (int64_t)applicationType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___CPForegroundApplication_applicationType);
}

- (NSString)localizedApplicationName
{
  uint64_t v2 = self;
  uint64_t v3 = CPForegroundApplication.localizedApplicationName.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x1B3EA1B00](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (BOOL)isGameCenterApplication
{
  uint64_t v3 = (void **)((char *)&self->super.isa + OBJC_IVAR___CPForegroundApplication_featureFlags);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = self;
  if (objc_msgSend(v4, sel_gameCenterSharePlayIntegration))
  {
    id v6 = CPForegroundApplication.applicationRecord.getter();
    v7 = v6;
    if (v6)
    {
      v8 = (CPForegroundApplication *)objc_msgSend(v6, sel_entitlements);

      LOBYTE(v7) = LSPropertyList.containsAnyGameCenterEntitlements()();
      uint64_t v5 = v8;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7 & 1;
}

- (CPForegroundApplication)init
{
  result = (CPForegroundApplication *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CPForegroundApplication_featureFlags);
}

@end