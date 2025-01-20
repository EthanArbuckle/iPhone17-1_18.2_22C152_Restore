@interface AppEventView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider12AppEventView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider12AppEventView)initWithFrame:(CGRect)a3;
- (_TtC18ASMessagesProvider16AppEventCardView)accessibilityAppEventCardView;
- (_TtC18ASMessagesProvider29AppPromotionFormattedDateView)accessibilityFormattedDateView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)stateChangedFor:(id)a3;
@end

@implementation AppEventView

- (_TtC18ASMessagesProvider12AppEventView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider12AppEventView *)sub_5A0840();
}

- (_TtC18ASMessagesProvider12AppEventView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider12AppEventView_clickAction;
  uint64_t v6 = sub_FD50((uint64_t *)&unk_9639A0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider12AppEventView_initialLongPressLocation;
  *(void *)v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  id v8 = a3;

  result = (_TtC18ASMessagesProvider12AppEventView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider12AppEventView_longPressGestureRecognizer);
  v5 = self;
  [v4 removeTarget:v5 action:0];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(AppEventView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider12AppEventView_formattedDateView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider12AppEventView_appEventCardView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider12AppEventView_longPressGestureRecognizer));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider12AppEventView_clickAction, &qword_9616A0);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_59ED70();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = type metadata accessor for AppEventCardLayout(0);
  __chkstk_darwin(v6 - 8);
  id v8 = (uint64_t *)((char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = qword_94DD08;
  v10 = self;
  if (v9 != -1) {
    swift_once();
  }
  sub_6370A4(&unk_9AFB28, v10, width, height);
  double v12 = v11;
  v13 = *(Class *)((char *)&v10->super.super.super.isa
                 + OBJC_IVAR____TtC18ASMessagesProvider12AppEventView_appEventCardView);
  sub_17A9DC((uint64_t)v8);
  sub_5D1DFC(v13, v8);
  double v15 = v14;
  double v17 = v16;
  sub_2A718((uint64_t)v8);

  double v18 = v12 + v17;
  double v19 = v15;
  result.double height = v18;
  result.double width = v19;
  return result;
}

- (void)stateChangedFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_59F124(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_59FF18((uint64_t)v6, v7);

  return v9 & 1;
}

- (_TtC18ASMessagesProvider29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC18ASMessagesProvider29AppPromotionFormattedDateView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider12AppEventView_formattedDateView);
}

- (_TtC18ASMessagesProvider16AppEventCardView)accessibilityAppEventCardView
{
  return (_TtC18ASMessagesProvider16AppEventCardView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                               + OBJC_IVAR____TtC18ASMessagesProvider12AppEventView_appEventCardView));
}

@end