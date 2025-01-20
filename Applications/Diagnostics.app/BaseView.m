@interface BaseView
- (_TtC11Diagnostics8BaseView)initWithCoder:(id)a3;
- (_TtC11Diagnostics8BaseView)initWithFrame:(CGRect)a3;
@end

@implementation BaseView

- (_TtC11Diagnostics8BaseView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for BaseView();
  v7 = -[BaseView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  v8 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)v7->super.super.super.isa) + 0x50);
  v9 = v7;
  uint64_t v10 = v8();
  uint64_t v11 = (*(uint64_t (**)(uint64_t))((swift_isaMask & (uint64_t)v9->super.super.super.isa) + 0x58))(v10);
  (*(void (**)(uint64_t))((swift_isaMask & (uint64_t)v9->super.super.super.isa) + 0x60))(v11);

  return v9;
}

- (_TtC11Diagnostics8BaseView)initWithCoder:(id)a3
{
  result = (_TtC11Diagnostics8BaseView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end