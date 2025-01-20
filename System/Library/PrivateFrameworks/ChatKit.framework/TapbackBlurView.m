@interface TapbackBlurView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC7ChatKit15TapbackBlurView)initWithCoder:(id)a3;
- (_TtC7ChatKit15TapbackBlurView)initWithFrame:(CGRect)a3;
@end

@implementation TapbackBlurView

- (_TtC7ChatKit15TapbackBlurView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit15TapbackBlurView_isBlurEnabled) = 0;
  id v4 = a3;

  result = (_TtC7ChatKit15TapbackBlurView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_18F7B97E0();
    v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
  }
  v7 = self;
  char v8 = sub_18F676184(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (_TtC7ChatKit15TapbackBlurView)initWithFrame:(CGRect)a3
{
  result = (_TtC7ChatKit15TapbackBlurView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end