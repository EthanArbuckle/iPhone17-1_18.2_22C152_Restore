@interface FrameworkViewRepresentable.NativeView
- (_TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView)initWithCoder:(id)a3;
- (_TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
@end

@implementation FrameworkViewRepresentable.NativeView

- (_TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView_didCallBack) = 0;
  id v4 = a3;

  result = (_TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView *)sub_2443BB4F0();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  v5 = self;
  id v2 = [(FrameworkViewRepresentable.NativeView *)v5 window];

  v3 = v5;
  if (v2)
  {
    uint64_t v4 = OBJC_IVAR____TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView_didCallBack;
    if ((*((unsigned char *)&v5->super.super.super.isa
          + OBJC_IVAR____TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView_didCallBack) & 1) == 0)
    {
      (*(void (**)(_TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView *))((char *)&v5->super.super.super.isa + OBJC_IVAR____TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView_didMoveToWindowCallback))(v5);
      v3 = v5;
      *((unsigned char *)&v5->super.super.super.isa + v4) = 1;
    }
  }
}

- (_TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView)initWithFrame:(CGRect)a3
{
  result = (_TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end