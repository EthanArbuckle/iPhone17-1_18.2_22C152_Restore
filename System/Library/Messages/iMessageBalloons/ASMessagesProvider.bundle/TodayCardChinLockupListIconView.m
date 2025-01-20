@interface TodayCardChinLockupListIconView
- (_TtC18ASMessagesProvider31TodayCardChinLockupListIconView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider31TodayCardChinLockupListIconView)initWithFrame:(CGRect)a3;
- (void)handleTap;
- (void)layoutSubviews;
@end

@implementation TodayCardChinLockupListIconView

- (_TtC18ASMessagesProvider31TodayCardChinLockupListIconView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider31TodayCardChinLockupListIconView *)sub_5991C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider31TodayCardChinLockupListIconView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider31TodayCardChinLockupListIconView_artworkView;
  sub_76E300();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_76E100();
  v7 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider31TodayCardChinLockupListIconView_clickAction;
  uint64_t v8 = sub_FD50((uint64_t *)&unk_9639A0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);

  result = (_TtC18ASMessagesProvider31TodayCardChinLockupListIconView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TodayCardChinLockupListIconView *)&v3 layoutSubviews];
  objc_msgSend(v2, "bounds", v3.receiver, v3.super_class);
  sub_76E260();
}

- (void)handleTap
{
  id v2 = self;
  sub_5994E0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31TodayCardChinLockupListIconView_artworkView));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider31TodayCardChinLockupListIconView_clickAction, &qword_9616A0);
}

@end