@interface BuddyCameraControlPresentationProvider
- (BOOL)shouldPresentCameraControlPane;
- (BOOL)shouldPresentVisualIntelligencePane;
- (_TtC13BuddyMigrator38BuddyCameraControlPresentationProvider)init;
- (_TtC13BuddyMigrator38BuddyCameraControlPresentationProvider)initWithIsIntelligenceEnabled:(BOOL)a3;
- (_TtC13BuddyMigrator38BuddyCameraControlPresentationProvider)initWithIsIntelligenceEnabled:(BOOL)a3 preferenceController:(id)a4;
- (void)updatePaneVisibilityPreferencesWithNewState:(BOOL)a3;
@end

@implementation BuddyCameraControlPresentationProvider

- (_TtC13BuddyMigrator38BuddyCameraControlPresentationProvider)initWithIsIntelligenceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [self buddyPreferences];
  v6 = [(BuddyCameraControlPresentationProvider *)self initWithIsIntelligenceEnabled:v3 preferenceController:v5];

  return v6;
}

- (_TtC13BuddyMigrator38BuddyCameraControlPresentationProvider)initWithIsIntelligenceEnabled:(BOOL)a3 preferenceController:(id)a4
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_isIntelligenceEnabled) = a3;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_preferenceController) = (Class)a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BuddyCameraControlPresentationProvider();
  id v5 = a4;
  return [(BuddyCameraControlPresentationProvider *)&v7 init];
}

- (BOOL)shouldPresentCameraControlPane
{
  v2 = self;
  Swift::Bool v3 = BuddyCameraControlPresentationProvider.shouldPresentCameraControlPane()();

  return v3;
}

- (BOOL)shouldPresentVisualIntelligencePane
{
  if (*((unsigned char *)&self->super.isa
       + OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_isIntelligenceEnabled) != 1)
    return 0;
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_preferenceController);
  Swift::Bool v3 = self;
  NSString v4 = sub_164D0();
  LOBYTE(v2) = [v2 BOOLForKey:v4];

  return v2 ^ 1;
}

- (void)updatePaneVisibilityPreferencesWithNewState:(BOOL)a3
{
  NSString v4 = self;
  BuddyCameraControlPresentationProvider.updatePaneVisibilityPreferences(newState:)(a3);
}

- (_TtC13BuddyMigrator38BuddyCameraControlPresentationProvider)init
{
  result = (_TtC13BuddyMigrator38BuddyCameraControlPresentationProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13BuddyMigrator38BuddyCameraControlPresentationProvider_preferenceController));
}

@end