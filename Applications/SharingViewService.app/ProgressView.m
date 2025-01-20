@interface ProgressView
- (_TtC18SharingViewService12ProgressView)initWithCoder:(id)a3;
- (_TtC18SharingViewService12ProgressView)initWithFrame:(CGRect)a3;
@end

@implementation ProgressView

- (_TtC18SharingViewService12ProgressView)initWithFrame:(CGRect)a3
{
  return (_TtC18SharingViewService12ProgressView *)sub_100012DB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18SharingViewService12ProgressView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18SharingViewService12ProgressView_statusLabelText);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC18SharingViewService12ProgressView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService12ProgressView_progressView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18SharingViewService12ProgressView_statusLabel);
}

@end