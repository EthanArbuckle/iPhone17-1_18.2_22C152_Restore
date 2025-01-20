@interface KernelSimpleSobel
- (_TtC17MeasureFoundation17KernelSimpleSobel)initWithCoder:(id)a3;
- (_TtC17MeasureFoundation17KernelSimpleSobel)initWithCoder:(id)a3 device:(id)a4;
- (_TtC17MeasureFoundation17KernelSimpleSobel)initWithDevice:(id)a3;
@end

@implementation KernelSimpleSobel

- (_TtC17MeasureFoundation17KernelSimpleSobel)initWithCoder:(id)a3
{
  result = (_TtC17MeasureFoundation17KernelSimpleSobel *)sub_22F224538();
  __break(1u);
  return result;
}

- (_TtC17MeasureFoundation17KernelSimpleSobel)initWithDevice:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (_TtC17MeasureFoundation17KernelSimpleSobel *)sub_22F180DF0(a3);
  swift_unknownObjectRelease();
  return v4;
}

- (_TtC17MeasureFoundation17KernelSimpleSobel)initWithCoder:(id)a3 device:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  result = (_TtC17MeasureFoundation17KernelSimpleSobel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17MeasureFoundation17KernelSimpleSobel_textureCache);
}

@end