@interface HorizontalFlipKernel
- (_TtC5Human20HorizontalFlipKernel)initWithCoder:(id)a3;
- (_TtC5Human20HorizontalFlipKernel)initWithCoder:(id)a3 device:(id)a4;
- (_TtC5Human20HorizontalFlipKernel)initWithDevice:(id)a3;
- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5;
@end

@implementation HorizontalFlipKernel

- (_TtC5Human20HorizontalFlipKernel)initWithDevice:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (_TtC5Human20HorizontalFlipKernel *)sub_252903BF4(a3);
  swift_unknownObjectRelease();
  return v4;
}

- (_TtC5Human20HorizontalFlipKernel)initWithCoder:(id)a3
{
  result = (_TtC5Human20HorizontalFlipKernel *)sub_252951F28();
  __break(1u);
  return result;
}

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v9 = self;
  sub_252903904(a3, (uint64_t)a4, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (_TtC5Human20HorizontalFlipKernel)initWithCoder:(id)a3 device:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  result = (_TtC5Human20HorizontalFlipKernel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end