@interface DebugSliderCell
- (_TtC20ProductPageExtension15DebugSliderCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension15DebugSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation DebugSliderCell

- (_TtC20ProductPageExtension15DebugSliderCell)initWithCoder:(id)a3
{
  result = (_TtC20ProductPageExtension15DebugSliderCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100507FD0();
}

- (_TtC20ProductPageExtension15DebugSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  result = (_TtC20ProductPageExtension15DebugSliderCell *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15DebugSliderCell_slider));
}

@end