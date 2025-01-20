@interface DOCTabBarItem
+ (id)itemWithTab:(unint64_t)a3;
+ (id)tabIdentifierForTab:(unint64_t)a3;
- (NSString)description;
- (NSString)displayTitle;
- (NSString)tabIdentifier;
- (_TtC11SaveToFiles13DOCTabBarItem)init;
- (_TtC11SaveToFiles13DOCTabBarItem)initWithCoder:(id)a3;
- (id)floatingSwitcherActionRepresentationWithHandler:(id)a3;
- (unint64_t)tab;
- (void)setTab:(unint64_t)a3;
@end

@implementation DOCTabBarItem

- (unint64_t)tab
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR____TtC11SaveToFiles13DOCTabBarItem_tab);
  swift_beginAccess();
  return *v2;
}

- (void)setTab:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR____TtC11SaveToFiles13DOCTabBarItem_tab);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (NSString)tabIdentifier
{
  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11SaveToFiles13DOCTabBarItem_tab);
  swift_beginAccess();
  uint64_t v4 = *v3;
  if (!*v3 || v4 == 2 || v4 == 1)
  {
    NSString v5 = sub_1004D1200();
    swift_bridgeObjectRelease();
    return (NSString *)v5;
  }
  else
  {
    type metadata accessor for DOCTab(0);
    v7 = self;
    result = (NSString *)sub_1004D2FF0();
    __break(1u);
  }
  return result;
}

+ (id)tabIdentifierForTab:(unint64_t)a3
{
  if (!a3 || a3 == 2 || a3 == 1)
  {
    NSString v3 = sub_1004D1200();
    swift_bridgeObjectRelease();
    return v3;
  }
  else
  {
    type metadata accessor for DOCTab(0);
    id result = (id)sub_1004D2FF0();
    __break(1u);
  }
  return result;
}

+ (id)itemWithTab:(unint64_t)a3
{
  NSString v3 = (void *)_s11SaveToFiles13DOCTabBarItemC4item3tabACSo0D0V_tFZ_0(a3);
  return v3;
}

- (id)floatingSwitcherActionRepresentationWithHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  id result = [(DOCTabBarItem *)v6 _internalTitle];
  if (result)
  {
    id v8 = result;
    sub_100036804(0, (unint64_t *)&qword_100632E50);
    sub_1004D1240();

    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_100152C70;
    *(void *)(v9 + 24) = v5;
    v10 = (void *)sub_1004D2650();

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSString)description
{
  v2 = self;
  DOCTabBarItem.description.getter();

  NSString v3 = sub_1004D1200();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)displayTitle
{
  v2 = self;
  id v3 = [(DOCTabBarItem *)v2 _internalTitle];
  if (v3)
  {
    uint64_t v4 = v3;
    sub_1004D1240();

    NSString v5 = sub_1004D1200();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }
  return (NSString *)v5;
}

- (_TtC11SaveToFiles13DOCTabBarItem)init
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11SaveToFiles13DOCTabBarItem_tab) = (Class)2;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCTabBarItem();
  return [(DOCTabBarItem *)&v3 init];
}

- (_TtC11SaveToFiles13DOCTabBarItem)initWithCoder:(id)a3
{
  id result = (_TtC11SaveToFiles13DOCTabBarItem *)sub_1004D2DC0();
  __break(1u);
  return result;
}

@end