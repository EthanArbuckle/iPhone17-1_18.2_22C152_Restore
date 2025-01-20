@interface DropletEffectView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC9DropletUI17DropletEffectView)initWithCoder:(id)a3;
- (_TtC9DropletUI17DropletEffectView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation DropletEffectView

- (_TtC9DropletUI17DropletEffectView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D12E1C0();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdEnabledAnimatableProperty);
  id v3 = self;
  objc_msgSend(v2, sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DropletEffectView();
  [(BlurredView *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdEnabledAnimatableProperty));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9DropletUI17DropletEffectView_inputColor);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_24D149268();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = qword_26B1890E0;
  v8 = self;
  v9 = v8;
  if (v7 != -1)
  {
    LOBYTE(v8) = swift_once();
    if (v6) {
      goto LABEL_6;
    }
LABEL_11:
    __break(1u);
    return (char)v8;
  }
  if (!v6) {
    goto LABEL_11;
  }
LABEL_6:
  if (sub_24D13A814(v4, v6, (void *)qword_26B189BA8))
  {

    swift_bridgeObjectRelease();
    unsigned __int8 v10 = 1;
  }
  else
  {
    v11 = (void *)sub_24D149258();
    v13.receiver = v9;
    v13.super_class = (Class)type metadata accessor for DropletEffectView();
    unsigned __int8 v10 = [(BlurredView *)&v13 _shouldAnimatePropertyWithKey:v11];

    swift_bridgeObjectRelease();
  }
  LOBYTE(v8) = v10;
  return (char)v8;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_24D12CF64();
}

- (_TtC9DropletUI17DropletEffectView)initWithFrame:(CGRect)a3
{
  result = (_TtC9DropletUI17DropletEffectView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end