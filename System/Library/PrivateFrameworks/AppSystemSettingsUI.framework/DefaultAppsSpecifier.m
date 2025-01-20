@interface DefaultAppsSpecifier
- (_TtC19AppSystemSettingsUI20DefaultAppsSpecifier)init;
- (_TtC19AppSystemSettingsUI20DefaultAppsSpecifier)initWithName:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9;
- (id)getLocalizedDetailText;
@end

@implementation DefaultAppsSpecifier

- (id)getLocalizedDetailText
{
  sub_247E823E0();
  sub_247E823D0();
  sub_247E823C0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_247E7E864();

  v4 = (void *)sub_247E82380();
  swift_release();
  swift_bridgeObjectRelease();
  return v4;
}

- (_TtC19AppSystemSettingsUI20DefaultAppsSpecifier)initWithName:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9
{
  if (a4)
  {
    swift_unknownObjectRetain();
    sub_247E823F0();
    swift_unknownObjectRelease();
  }
  result = (_TtC19AppSystemSettingsUI20DefaultAppsSpecifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19AppSystemSettingsUI20DefaultAppsSpecifier)init
{
  result = (_TtC19AppSystemSettingsUI20DefaultAppsSpecifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppSystemSettingsUI20DefaultAppsSpecifier_provider);
  swift_unknownObjectWeakDestroy();
}

@end