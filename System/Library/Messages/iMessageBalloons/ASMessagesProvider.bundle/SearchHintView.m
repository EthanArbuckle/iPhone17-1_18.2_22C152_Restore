@interface SearchHintView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC18ASMessagesProvider14SearchHintView)init;
- (_TtC18ASMessagesProvider14SearchHintView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider14SearchHintView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SearchHintView

- (_TtC18ASMessagesProvider14SearchHintView)init
{
  return (_TtC18ASMessagesProvider14SearchHintView *)sub_684768();
}

- (_TtC18ASMessagesProvider14SearchHintView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider14SearchHintView_isHighlighted) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider14SearchHintView_showSeparator) = 0;
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider14SearchHintView_separatorView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SeparatorView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider14SearchHintView_iconImage) = 0;

  result = (_TtC18ASMessagesProvider14SearchHintView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_684D38();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = self;
  double v7 = sub_685E18(a4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (_TtC18ASMessagesProvider14SearchHintView)initWithFrame:(CGRect)a3
{
  JUMeasurements result = (_TtC18ASMessagesProvider14SearchHintView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider14SearchHintView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider14SearchHintView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider14SearchHintView_separatorView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider14SearchHintView_iconImage);
}

@end