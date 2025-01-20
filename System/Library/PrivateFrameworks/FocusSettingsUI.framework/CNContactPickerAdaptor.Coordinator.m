@interface CNContactPickerAdaptor.Coordinator
- (_TtCV15FocusSettingsUI22CNContactPickerAdaptor11Coordinator)init;
- (void)contactPicker:(id)a3 didSelectContacts:(id)a4;
@end

@implementation CNContactPickerAdaptor.Coordinator

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  sub_220D25F48(0, (unint64_t *)&unk_267F33BC0);
  sub_220F32858();
  v6 = (char *)self + OBJC_IVAR____TtCV15FocusSettingsUI22CNContactPickerAdaptor11Coordinator_adaptor;
  id v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F33B70);
  sub_220F322B8();
  v9 = (void (*)(uint64_t))*((void *)v6 + 5);
  swift_retain();
  v9(1);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtCV15FocusSettingsUI22CNContactPickerAdaptor11Coordinator)init
{
  result = (_TtCV15FocusSettingsUI22CNContactPickerAdaptor11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV15FocusSettingsUI22CNContactPickerAdaptor11Coordinator_viewController);
}

@end