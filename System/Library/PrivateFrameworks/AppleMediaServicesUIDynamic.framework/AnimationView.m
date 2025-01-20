@interface AnimationView
- (_TtC27AppleMediaServicesUIDynamic13AnimationView)init;
- (_TtC27AppleMediaServicesUIDynamic13AnimationView)initWithCoder:(id)a3;
- (_TtC27AppleMediaServicesUIDynamic13AnimationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AnimationView

- (_TtC27AppleMediaServicesUIDynamic13AnimationView)initWithFrame:(CGRect)a3
{
  return (_TtC27AppleMediaServicesUIDynamic13AnimationView *)AnimationView.init(frame:)();
}

- (_TtC27AppleMediaServicesUIDynamic13AnimationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF3B20D0();
}

- (void)layoutSubviews
{
  v2 = self;
  AnimationView.layoutSubviews()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  AnimationView.traitCollectionDidChange(_:)(v9);
}

- (_TtC27AppleMediaServicesUIDynamic13AnimationView)init
{
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13AnimationView_animationPlayer);
}

@end