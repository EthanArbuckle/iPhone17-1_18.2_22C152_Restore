@interface FamilyMemberAccountDetailsViewModel
- (_TtC14FamilyCircleUI35FamilyMemberAccountDetailsViewModel)init;
@end

@implementation FamilyMemberAccountDetailsViewModel

- (_TtC14FamilyCircleUI35FamilyMemberAccountDetailsViewModel)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC14FamilyCircleUI35FamilyMemberAccountDetailsViewModel_hearbeatTokenKey);
  void *v3 = 0xD000000000000014;
  v3[1] = 0x8000000218CCF950;
  uint64_t v4 = OBJC_IVAR____TtC14FamilyCircleUI35FamilyMemberAccountDetailsViewModel_familyDependentPasswordResetApi;
  type metadata accessor for FamilyDependentPasswordResetApi();
  v5 = (objc_class *)swift_allocObject();
  *((void *)v5 + 2) = 0;
  *(Class *)((char *)&self->super.isa + v4) = v5;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FamilyMemberAccountDetailsViewModel();
  return [(FamilyMemberAccountDetailsViewModel *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end