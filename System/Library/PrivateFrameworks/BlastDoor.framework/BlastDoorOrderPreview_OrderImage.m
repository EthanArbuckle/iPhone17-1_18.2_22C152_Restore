@interface BlastDoorOrderPreview_OrderImage
- (BlastDoorImage)image;
- (BlastDoorOrderPreview_OrderImage)init;
- (NSString)description;
- (unsigned)type;
@end

@implementation BlastDoorOrderPreview_OrderImage

- (NSString)description
{
  sub_1B155F660((uint64_t)self + OBJC_IVAR___BlastDoorOrderPreview_OrderImage_orderPreview_OrderImage, (uint64_t)&v4);
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorImage)image
{
  v2 = self;
  v3 = (void *)sub_1B17AA3CC();

  return (BlastDoorImage *)v3;
}

- (unsigned)type
{
  return self->orderPreview_OrderImage[OBJC_IVAR___BlastDoorOrderPreview_OrderImage_orderPreview_OrderImage + 432];
}

- (BlastDoorOrderPreview_OrderImage)init
{
  result = (BlastDoorOrderPreview_OrderImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end