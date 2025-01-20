@interface FamilySettingsApplication
- (_TtC14FamilyCircleUI25FamilySettingsApplication)init;
- (id)accountsForAccountManager:(id)a3;
- (void)appMovedToBackground;
- (void)appMovedToForeground;
@end

@implementation FamilySettingsApplication

- (_TtC14FamilyCircleUI25FamilySettingsApplication)init
{
  return (_TtC14FamilyCircleUI25FamilySettingsApplication *)sub_218BCC534();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI25FamilySettingsApplication__state;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA852A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI25FamilySettingsApplication_aidaAccountManager));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI25FamilySettingsApplication_accountStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI25FamilySettingsApplication_servicesOwnerManager));
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI25FamilySettingsApplication_launchDate;
  uint64_t v6 = sub_218CAC9E8();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

- (id)accountsForAccountManager:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_218BD0AC8();

  type metadata accessor for AIDAServiceType(0);
  sub_218A50F00(0, (unint64_t *)&qword_26AA85390);
  sub_218BD0E40(&qword_26AA85320, type metadata accessor for AIDAServiceType);
  uint64_t v6 = (void *)sub_218CAED18();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)appMovedToForeground
{
}

- (void)appMovedToBackground
{
}

@end