@interface IMBActionBubbleView
- (_TtC8Business19IMBActionBubbleView)initWithCoder:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation IMBActionBubbleView

- (_TtC8Business19IMBActionBubbleView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8Business19IMBActionBubbleView_tapIndicator;
  id v6 = objc_allocWithZone((Class)type metadata accessor for IMBAuthenticationTapIndicator());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];

  result = (_TtC8Business19IMBActionBubbleView *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1000074F8(0, &qword_1000FF7F0);
  sub_10008D2B4();
  sub_1000BBCC8();
  id v6 = a4;
  id v7 = self;
  Class isa = sub_1000BBCB8().super.isa;
  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for IMBActionBubbleView();
  [(IMBBubbleView *)&v10 touchesBegan:isa withEvent:v6];

  id v9 = [*(id *)((char *)&v7->super.super.super.super.isa + OBJC_IVAR____TtC8Business19IMBActionBubbleView_tapIndicator) layer];
  if (qword_1000FBBA8 != -1) {
    swift_once();
  }
  [v9 setBackgroundColor:qword_1001088F0];

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business19IMBActionBubbleView_message));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business19IMBActionBubbleView_tapIndicator);
}

@end