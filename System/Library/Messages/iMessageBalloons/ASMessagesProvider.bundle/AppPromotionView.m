@interface AppPromotionView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider16AppPromotionView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider16AppPromotionView)initWithFrame:(CGRect)a3;
- (_TtC18ASMessagesProvider20AppPromotionCardView)accessibilityAppPromotionCardView;
- (_TtC18ASMessagesProvider29AppPromotionFormattedDateView)accessibilityFormattedDateView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)stateChangedFor:(id)a3;
@end

@implementation AppPromotionView

- (_TtC18ASMessagesProvider16AppPromotionView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider16AppPromotionView *)sub_637530();
}

- (_TtC18ASMessagesProvider16AppPromotionView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider16AppPromotionView_clickAction;
  uint64_t v6 = sub_FD50((uint64_t *)&unk_9639A0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider16AppPromotionView_initialLongPressLocation;
  *(void *)v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  id v8 = a3;

  result = (_TtC18ASMessagesProvider16AppPromotionView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider16AppPromotionView_longPressGestureRecognizer);
  v5 = self;
  [v4 removeTarget:v5 action:0];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(AppPromotionView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider16AppPromotionView_availabilityLabelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider16AppPromotionView_appPromotionCardView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider16AppPromotionView_longPressGestureRecognizer));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider16AppPromotionView_clickAction, &qword_9616A0);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_635774();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = qword_94DD08;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  sub_6370A8((uint64_t)&unk_9AFB28, (uint64_t)v4);
  double v6 = v5;
  double v7 = sub_21C4EC();
  double v9 = v8;

  double v10 = v6 + v9;
  double v11 = v7;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)stateChangedFor:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_635ABC(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  char v9 = sub_6368B0((uint64_t)v6, v7);

  return v9 & 1;
}

- (_TtC18ASMessagesProvider29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC18ASMessagesProvider29AppPromotionFormattedDateView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider16AppPromotionView_availabilityLabelView);
}

- (_TtC18ASMessagesProvider20AppPromotionCardView)accessibilityAppPromotionCardView
{
  return (_TtC18ASMessagesProvider20AppPromotionCardView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider16AppPromotionView_appPromotionCardView);
}

@end