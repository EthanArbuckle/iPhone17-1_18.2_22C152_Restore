@interface BuddyButtonConfigurationController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFSettingsManager)settingsManager;
- (BOOL)hasBlackBackground;
- (BOOL)usesWhiteBackButton;
- (BYPreferencesController)buddyPreferences;
- (_TtC5Setup34BuddyButtonConfigurationController)init;
- (id)viewController;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSettingsManager:(id)a3;
@end

@implementation BuddyButtonConfigurationController

- (_TtC5Setup34BuddyButtonConfigurationController)init
{
  return (_TtC5Setup34BuddyButtonConfigurationController *)sub_1000308C4();
}

- (BYPreferencesController)buddyPreferences
{
  return (BYPreferencesController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_buddyPreferences));
}

- (void)setBuddyPreferences:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_buddyPreferences);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_buddyPreferences) = (Class)a3;
  id v3 = a3;
}

- (BFFSettingsManager)settingsManager
{
  return (BFFSettingsManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_settingsManager));
}

- (void)setSettingsManager:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_settingsManager);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_settingsManager) = (Class)a3;
  id v3 = a3;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)hasBlackBackground
{
  return 1;
}

- (BOOL)usesWhiteBackButton
{
  return 1;
}

- (id)viewController
{
  v2 = self;
  id v3 = sub_100030738();

  return v3;
}

- (void)setDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_delegate) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_100030AF4((uint64_t)sub_1000315C8, v5);

  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController____lazy_storage___cachedViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_buddyPreferences));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Setup34BuddyButtonConfigurationController_settingsManager));

  swift_unknownObjectRelease();
}

@end