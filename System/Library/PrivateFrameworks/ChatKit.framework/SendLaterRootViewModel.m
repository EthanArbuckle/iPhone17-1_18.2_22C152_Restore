@interface SendLaterRootViewModel
- (_TtC7ChatKit22SendLaterRootViewModel)init;
- (void)pluginInfoSelectedDateDidChange:(id)a3;
- (void)pluginInfoShowingDatePickerDidChange:(id)a3;
@end

@implementation SendLaterRootViewModel

- (void)pluginInfoSelectedDateDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F787FAC(v4);
}

- (void)pluginInfoShowingDatePickerDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F788600((uint64_t)v4);
}

- (_TtC7ChatKit22SendLaterRootViewModel)init
{
  result = (_TtC7ChatKit22SendLaterRootViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18EF6E880(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel_onRequestPresentation));

  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel__scheduledDate;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E923F5E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel__state;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9241DA0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel__isForcedPressed;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E922B2B0);
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  v9(v7, v8);
}

@end