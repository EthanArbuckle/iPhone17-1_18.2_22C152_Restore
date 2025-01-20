@interface TodayCardLockupListOverlayView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider30TodayCardLockupListOverlayView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider30TodayCardLockupListOverlayView)initWithFrame:(CGRect)a3;
- (void)handleClickActionFor:(id)a3;
- (void)layoutSubviews;
@end

@implementation TodayCardLockupListOverlayView

- (_TtC18ASMessagesProvider30TodayCardLockupListOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider30TodayCardLockupListOverlayView *)sub_57B65C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider30TodayCardLockupListOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_57E3BC();
}

- (void)handleClickActionFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_57E510((uint64_t)v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v5 = (unint64_t *)((char *)self + OBJC_IVAR____TtC18ASMessagesProvider30TodayCardLockupListOverlayView_itemViews);
  swift_beginAccess();
  unint64_t v6 = *v5;
  if (v6 >> 62)
  {
    v15 = self;
    swift_bridgeObjectRetain();
    if (sub_77EB40()) {
      goto LABEL_3;
    }
LABEL_8:

    swift_bridgeObjectRelease();
    CGFloat width = 0.0;
    double v14 = 0.0;
    goto LABEL_9;
  }
  uint64_t v7 = *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8));
  v8 = self;
  swift_bridgeObjectRetain();
  if (!v7) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v6 & 0xC000000000000001) != 0)
  {
    id v11 = (id)sub_77EA30();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      goto LABEL_12;
    }
    id v11 = *(id *)(v6 + 32);
  }
  v12 = v11;
  swift_bridgeObjectRelease();
  sub_57E060();
  double v14 = v13;

LABEL_9:
  double v9 = width;
  double v10 = v14;
LABEL_12:
  result.height = v10;
  result.CGFloat width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_57BF98();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider30TodayCardLockupListOverlayView_reusePool;
  uint64_t v4 = sub_FD50(&qword_96ED80);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_weakDestroy();
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider30TodayCardLockupListOverlayView_impressionsUpdateBlock));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider30TodayCardLockupListOverlayView_separatorView);
}

@end