@interface APUISystemApertureAccessoryView
- (CGRect)frame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ActivityProgressUI31APUISystemApertureAccessoryView)initWithCoder:(id)a3;
- (_TtC18ActivityProgressUI31APUISystemApertureAccessoryView)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation APUISystemApertureAccessoryView

- (_TtC18ActivityProgressUI31APUISystemApertureAccessoryView)initWithCoder:(id)a3
{
  result = (_TtC18ActivityProgressUI31APUISystemApertureAccessoryView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for APUISystemApertureAccessoryView();
  [(APUISystemApertureAccessoryView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for APUISystemApertureAccessoryView();
  v7 = (char *)v10.receiver;
  -[APUISystemApertureAccessoryView setFrame:](&v10, "setFrame:", x, y, width, height);
  id v8 = [v7[OBJC_IVAR____TtC18ActivityProgressUI31APUISystemApertureAccessoryView_hostingController] view];
  if (v8)
  {
    v9 = v8;
    [v7 bounds];
    [v9 setFrame:];
  }
  else
  {
    __break(1u);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18ActivityProgressUI31APUISystemApertureAccessoryView_hostingController) preferredContentSize:a3.width, a3.height];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (_TtC18ActivityProgressUI31APUISystemApertureAccessoryView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC18ActivityProgressUI31APUISystemApertureAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI31APUISystemApertureAccessoryView_hostingController));
}

@end