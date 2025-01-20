@interface BlurredView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC9DropletUI11BlurredView)initWithCoder:(id)a3;
- (_TtC9DropletUI11BlurredView)initWithFrame:(CGRect)a3;
- (void)dealloc;
@end

@implementation BlurredView

- (_TtC9DropletUI11BlurredView)initWithFrame:(CGRect)a3
{
  return (_TtC9DropletUI11BlurredView *)sub_24D114494(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9DropletUI11BlurredView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride) = 0;
  uint64_t v5 = OBJC_IVAR____TtC9DropletUI11BlurredView_blurEnabledAnimatableProperty;
  id v6 = objc_allocWithZone(MEMORY[0x263F82E28]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9DropletUI11BlurredView_gaussianBlurInputRadius) = 0;

  result = (_TtC9DropletUI11BlurredView *)sub_24D149448();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9DropletUI11BlurredView_blurEnabledAnimatableProperty);
  v3 = self;
  objc_msgSend(v2, sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for BlurredView();
  [(BlurredView *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI11BlurredView_blurEnabledAnimatableProperty));
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_24D149268();
    id v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    id v6 = 0;
  }
  id v7 = self;
  char v8 = sub_24D114C54(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

@end