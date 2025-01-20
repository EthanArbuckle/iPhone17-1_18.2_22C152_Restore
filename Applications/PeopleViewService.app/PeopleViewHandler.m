@interface PeopleViewHandler
- (_TtC17PeopleViewService17PeopleViewHandler)init;
- (void)dismissSearchViewWithReason:(unint64_t)a3;
@end

@implementation PeopleViewHandler

- (void)dismissSearchViewWithReason:(unint64_t)a3
{
  v4 = self;
  sub_100014430((void *)a3);
}

- (_TtC17PeopleViewService17PeopleViewHandler)init
{
  result = (_TtC17PeopleViewService17PeopleViewHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_spotlightContactViewController);
}

@end