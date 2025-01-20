@interface RetryView
- (_TtC8Business9RetryView)init;
- (_TtC8Business9RetryView)initWithCoder:(id)a3;
- (_TtC8Business9RetryView)initWithFrame:(CGRect)a3;
- (void)retryLoadingBundle;
@end

@implementation RetryView

- (_TtC8Business9RetryView)init
{
  return (_TtC8Business9RetryView *)sub_1000A0124();
}

- (_TtC8Business9RetryView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business9RetryView____lazy_storage___messageLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business9RetryView____lazy_storage___retryButton) = 0;
  *(void *)&self->$__lazy_storage_$_messageLabel[OBJC_IVAR____TtC8Business9RetryView_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC8Business9RetryView *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (void)retryLoadingBundle
{
  v2 = self;
  sub_1000A0774();
}

- (_TtC8Business9RetryView)initWithFrame:(CGRect)a3
{
  result = (_TtC8Business9RetryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business9RetryView____lazy_storage___messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business9RetryView____lazy_storage___retryButton));
  v3 = (char *)self + OBJC_IVAR____TtC8Business9RetryView_delegate;

  sub_100010D28((uint64_t)v3);
}

@end