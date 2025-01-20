@interface LocationViewModel
+ (_TtC14FamilyCircleUI17LocationViewModel)shared;
+ (id)createModel;
+ (void)setShared:(id)a3;
- (_TtC14FamilyCircleUI17LocationViewModel)init;
- (void)dealloc;
@end

@implementation LocationViewModel

+ (_TtC14FamilyCircleUI17LocationViewModel)shared
{
  return (_TtC14FamilyCircleUI17LocationViewModel *)(id)qword_267BECAC0;
}

+ (void)setShared:(id)a3
{
  swift_beginAccess();
  v4 = (void *)qword_267BECAC0;
  qword_267BECAC0 = (uint64_t)a3;
  id v5 = a3;
}

- (void)dealloc
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = self;
  v8 = self;
  sub_218A41DCC((uint64_t)v5, (uint64_t)&unk_267BECC48, (uint64_t)v7);
  swift_release();
  v9 = (objc_class *)type metadata accessor for LocationViewModel();
  v10.receiver = v8;
  v10.super_class = v9;
  [(LocationViewModel *)&v10 dealloc];
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel__familyMembersSharingLocationWithMe;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BECAD0);
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  uint64_t v6 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel__parentCanToggleChildsLocation;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BEB220);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel__disableLocationToggles, v7);
  v9 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel__sharingLocationWithFamilyMembers;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BECAE8);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v5((char *)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel__childCanModifyLocationStatus, v4);
  v11 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel__membersAutomaticallySharing;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BECC50);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel_servicesStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel_circleStore);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

+ (id)createModel
{
  v2 = _s14FamilyCircleUI17LocationViewModelC06createF0ACyFZ_0();
  return v2;
}

- (_TtC14FamilyCircleUI17LocationViewModel)init
{
  result = (_TtC14FamilyCircleUI17LocationViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end