@interface BacklightSettingsSwiftModel
- (_TtC27CompanionAutoLaunchSettingsP33_C19C8A1FA0FCF6B3EDADF7E23A9A836927BacklightSettingsSwiftModel)init;
- (void)dataSourceDidUpdate:(id)a3;
@end

@implementation BacklightSettingsSwiftModel

- (void)dataSourceDidUpdate:(id)a3
{
  type metadata accessor for BacklightSettingsSwiftModel();
  sub_602C();
  id v5 = a3;
  v6 = self;
  sub_279C0();
  sub_279D0();

  swift_release();
}

- (_TtC27CompanionAutoLaunchSettingsP33_C19C8A1FA0FCF6B3EDADF7E23A9A836927BacklightSettingsSwiftModel)init
{
  return (_TtC27CompanionAutoLaunchSettingsP33_C19C8A1FA0FCF6B3EDADF7E23A9A836927BacklightSettingsSwiftModel *)sub_5E50();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27CompanionAutoLaunchSettingsP33_C19C8A1FA0FCF6B3EDADF7E23A9A836927BacklightSettingsSwiftModel_backlightSettingsModel));
}

@end