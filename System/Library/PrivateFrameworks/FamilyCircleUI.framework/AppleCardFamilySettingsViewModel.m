@interface AppleCardFamilySettingsViewModel
- (_TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel)init;
- (void)dealloc;
- (void)serviceAccountDidChange;
@end

@implementation AppleCardFamilySettingsViewModel

- (void)dealloc
{
  sub_218A50F00(0, (unint64_t *)&qword_26AA85360);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v4 = self;
  id v5 = objc_msgSend(ObjCClassFromMetadata, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AppleCardFamilySettingsViewModel();
  [(AppleCardFamilySettingsViewModel *)&v6 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel_familyCircleStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel_appleCardStore);
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel__showShareAppleCardFlow;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BEB220);
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel__showAppleCardFamilyScreen, v4);
  objc_super v6 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel__subLabel;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BEB228);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel__sharingCardWithFamilyMembers;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BEB920);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v5((char *)self + OBJC_IVAR____TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel__shouldHideShareCardButton, v4);
  sub_218A7AB74();
  swift_bridgeObjectRelease();
}

- (void)serviceAccountDidChange
{
  v2 = self;
  sub_218B0A768();
}

- (_TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel)init
{
  result = (_TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end