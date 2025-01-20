@interface InteractiveTitleHeaderView
- (_TtC22SubscribePageExtension26InteractiveTitleHeaderView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension26InteractiveTitleHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation InteractiveTitleHeaderView

- (_TtC22SubscribePageExtension26InteractiveTitleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension26InteractiveTitleHeaderView *)sub_10012D5E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension26InteractiveTitleHeaderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC22SubscribePageExtension26InteractiveTitleHeaderView_titleView;
  type metadata accessor for TitleHeaderView(0);
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  v8 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension26InteractiveTitleHeaderView_currentState;
  uint64_t v9 = type metadata accessor for InteractiveSectionBackgroundScrollObserver.State(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);

  result = (_TtC22SubscribePageExtension26InteractiveTitleHeaderView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for InteractiveTitleHeaderView();
  v2 = (char *)v4.receiver;
  [(InteractiveTitleHeaderView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension26InteractiveTitleHeaderView_titleView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (void)prepareForReuse
{
  uint64_t v3 = sub_10000FB44((uint64_t *)&unk_100935290);
  __chkstk_darwin(v3 - 8, v4);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = (objc_class *)type metadata accessor for InteractiveTitleHeaderView();
  v12.receiver = self;
  v12.super_class = v7;
  v8 = self;
  [(InteractiveTitleHeaderView *)&v12 prepareForReuse];
  [*(id *)((char *)&v8->super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension26InteractiveTitleHeaderView_titleView) prepareForReuse];
  uint64_t v9 = type metadata accessor for InteractiveSectionBackgroundScrollObserver.State(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  uint64_t v10 = (uint64_t)v8 + OBJC_IVAR____TtC22SubscribePageExtension26InteractiveTitleHeaderView_currentState;
  swift_beginAccess();
  sub_10012DFD4((uint64_t)v6, v10);
  swift_endAccess();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26InteractiveTitleHeaderView_titleView));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension26InteractiveTitleHeaderView_currentState;

  sub_10012DF74((uint64_t)v3);
}

@end