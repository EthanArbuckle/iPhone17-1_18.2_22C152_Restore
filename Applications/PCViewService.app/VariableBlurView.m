@interface VariableBlurView
- (_TtC13PCViewService16VariableBlurView)init;
- (_TtC13PCViewService16VariableBlurView)initWithCoder:(id)a3;
- (_TtC13PCViewService16VariableBlurView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation VariableBlurView

- (_TtC13PCViewService16VariableBlurView)init
{
  return (_TtC13PCViewService16VariableBlurView *)sub_1000399F8();
}

- (_TtC13PCViewService16VariableBlurView)initWithCoder:(id)a3
{
  return (_TtC13PCViewService16VariableBlurView *)sub_100039B24(a3);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VariableBlurView();
  v2 = (char *)v4.receiver;
  [(VariableBlurView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC13PCViewService16VariableBlurView_backdropLayer];
  [v2 bounds];
  [v3 setFrame:];
}

- (_TtC13PCViewService16VariableBlurView)initWithFrame:(CGRect)a3
{
  result = (_TtC13PCViewService16VariableBlurView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13PCViewService16VariableBlurView_backdropLayer));
}

@end