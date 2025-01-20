@interface ActivityConfigurationManager.StateListener
- (_TtCC15FocusSettingsUI28ActivityConfigurationManagerP33_2D32E0A4A8017E0B91C01818CA0AAB7813StateListener)init;
- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4;
@end

@implementation ActivityConfigurationManager.StateListener

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  v5 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCC15FocusSettingsUI28ActivityConfigurationManagerP33_2D32E0A4A8017E0B91C01818CA0AAB7813StateListener_stateDidChange);
  id v6 = a3;
  v7 = self;
  uint64_t v8 = swift_retain();
  v5(v8);

  swift_release();
}

- (_TtCC15FocusSettingsUI28ActivityConfigurationManagerP33_2D32E0A4A8017E0B91C01818CA0AAB7813StateListener)init
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC15FocusSettingsUI28ActivityConfigurationManagerP33_2D32E0A4A8017E0B91C01818CA0AAB7813StateListener_stateDidChange);
  void *v2 = nullsub_1;
  v2[1] = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ActivityConfigurationManager.StateListener();
  return [(ActivityConfigurationManager.StateListener *)&v4 init];
}

- (void).cxx_destruct
{
}

@end