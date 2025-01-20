@interface PaddedView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC15HealthRecordsUI10PaddedView)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI10PaddedView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PaddedView

- (_TtC15HealthRecordsUI10PaddedView)initWithCoder:(id)a3
{
  result = (_TtC15HealthRecordsUI10PaddedView *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI10PaddedView_contentView);
  v6 = self;
  objc_msgSend(v5, sel_sizeThatFits_, width, height);
  double v8 = v7;
  double v10 = v9;
  double v11 = *(double *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI10PaddedView_bottomPadding);

  double v12 = v10 + v11;
  double v13 = v8;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaddedView();
  v2 = (char *)v3.receiver;
  [(PaddedView *)&v3 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC15HealthRecordsUI10PaddedView_contentView], sel_setFrame_);
}

- (_TtC15HealthRecordsUI10PaddedView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC15HealthRecordsUI10PaddedView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end