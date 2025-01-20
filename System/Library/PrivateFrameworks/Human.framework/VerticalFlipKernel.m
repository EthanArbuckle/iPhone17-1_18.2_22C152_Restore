@interface VerticalFlipKernel
- (_TtC5Human18VerticalFlipKernel)initWithCoder:(id)a3;
- (_TtC5Human18VerticalFlipKernel)initWithCoder:(id)a3 device:(id)a4;
- (_TtC5Human18VerticalFlipKernel)initWithDevice:(id)a3;
- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5;
@end

@implementation VerticalFlipKernel

- (_TtC5Human18VerticalFlipKernel)initWithDevice:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (_TtC5Human18VerticalFlipKernel *)sub_252903324(a3);
  swift_unknownObjectRelease();
  return v4;
}

- (_TtC5Human18VerticalFlipKernel)initWithCoder:(id)a3
{
  result = (_TtC5Human18VerticalFlipKernel *)sub_252951F28();
  __break(1u);
  return result;
}

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v9 = self;
  sub_252903038(a3, (uint64_t)a4, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (_TtC5Human18VerticalFlipKernel)initWithCoder:(id)a3 device:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  result = (_TtC5Human18VerticalFlipKernel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end