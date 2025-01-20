@interface ConfigureButton
- (_TtC27ActionButtonConfigurationUI15ConfigureButton)initWithCoder:(id)a3;
- (_TtC27ActionButtonConfigurationUI15ConfigureButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ConfigureButton

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConfigureButton();
  id v2 = v3.receiver;
  [(ConfigureButton *)&v3 layoutSubviews];
  sub_2473E76FC();
  sub_2473E7EC0();
}

- (_TtC27ActionButtonConfigurationUI15ConfigureButton)initWithFrame:(CGRect)a3
{
  return (_TtC27ActionButtonConfigurationUI15ConfigureButton *)sub_2473E8740(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC27ActionButtonConfigurationUI15ConfigureButton)initWithCoder:(id)a3
{
  return (_TtC27ActionButtonConfigurationUI15ConfigureButton *)sub_2473E88F0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_chevronView));
  swift_bridgeObjectRelease();
}

@end