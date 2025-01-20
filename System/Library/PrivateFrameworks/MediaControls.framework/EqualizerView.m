@interface EqualizerView
- (_TtC13MediaControls13EqualizerView)init;
- (_TtC13MediaControls13EqualizerView)initWithCoder:(id)a3;
- (_TtC13MediaControls13EqualizerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation EqualizerView

- (_TtC13MediaControls13EqualizerView)init
{
  uint64_t ObjectType = swift_getObjectType();
  v3 = (_TtC13MediaControls13EqualizerView *)(*(uint64_t (**)(uint64_t, double, double))(ObjectType + 288))(6, 1.2, 0.5);
  swift_deallocPartialClassInstance();
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for EqualizerView();
  v2 = v4.receiver;
  id v3 = [(EqualizerView *)&v4 layoutSubviews];
  if ((*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xD0))(v3)) {
    sub_1AE8FE81C();
  }
}

- (_TtC13MediaControls13EqualizerView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls13EqualizerView_isAnimating) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls13EqualizerView_hidesWhenStopped) = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls13EqualizerView_barViews) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls13EqualizerView_stylingProvider) = 0;
  id v4 = a3;

  result = (_TtC13MediaControls13EqualizerView *)sub_1AE9477B8();
  __break(1u);
  return result;
}

- (_TtC13MediaControls13EqualizerView)initWithFrame:(CGRect)a3
{
  result = (_TtC13MediaControls13EqualizerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls13EqualizerView_stylingProvider);
}

@end