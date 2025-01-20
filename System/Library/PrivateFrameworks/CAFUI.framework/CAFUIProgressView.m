@interface CAFUIProgressView
- (_TtC5CAFUI17CAFUIProgressView)initWithCoder:(id)a3;
- (_TtC5CAFUI17CAFUIProgressView)initWithFrame:(CGRect)a3;
@end

@implementation CAFUIProgressView

- (_TtC5CAFUI17CAFUIProgressView)initWithFrame:(CGRect)a3
{
  return (_TtC5CAFUI17CAFUIProgressView *)CAFUIProgressView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5CAFUI17CAFUIProgressView)initWithCoder:(id)a3
{
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5CAFUI17CAFUIProgressView_progress) = 0;
  id v4 = a3;

  result = (_TtC5CAFUI17CAFUIProgressView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end