@interface FAImageMarqueeViewWrapperImpl
- (UIViewController)viewController;
- (_TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl)init;
- (_TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl)initWithFamilyCircle:(id)a3;
- (_TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl)initWithMembersToRender:(id)a3 familyCircle:(id)a4;
- (void)setViewController:(id)a3;
@end

@implementation FAImageMarqueeViewWrapperImpl

- (_TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl)initWithFamilyCircle:(id)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl____lazy_storage___viewController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl_familyCircle) = (Class)a3;
  id v4 = a3;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_members);
  sub_218A50F00(0, (unint64_t *)&qword_26AA854B0);
  uint64_t v7 = sub_218CAF018();

  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl_membersToRender) = (Class)v7;
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for FAImageMarqueeViewWrapperImpl();
  v8 = [(FAImageMarqueeViewWrapperImpl *)&v10 init];

  return v8;
}

- (_TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl)initWithMembersToRender:(id)a3 familyCircle:(id)a4
{
  sub_218A50F00(0, (unint64_t *)&qword_26AA854B0);
  id v6 = (objc_class *)sub_218CAF018();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl____lazy_storage___viewController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl_membersToRender) = v6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl_familyCircle) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FAImageMarqueeViewWrapperImpl();
  id v7 = a4;
  return [(FAImageMarqueeViewWrapperImpl *)&v9 init];
}

- (UIViewController)viewController
{
  v2 = self;
  id v3 = sub_218BEB14C();

  return (UIViewController *)v3;
}

- (void)setViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl____lazy_storage___viewController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl____lazy_storage___viewController) = (Class)a3;
  id v3 = a3;
}

- (_TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl)init
{
  result = (_TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl_familyCircle));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl____lazy_storage___viewController);
}

@end