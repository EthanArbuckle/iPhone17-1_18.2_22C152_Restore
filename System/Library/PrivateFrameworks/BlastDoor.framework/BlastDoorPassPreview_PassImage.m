@interface BlastDoorPassPreview_PassImage
- (BlastDoorImage)image;
- (BlastDoorPassPreview_PassImage)init;
- (NSString)description;
@end

@implementation BlastDoorPassPreview_PassImage

- (NSString)description
{
  return (NSString *)sub_1B17AABF0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorPassPreview_PassImage_passPreview_PassImage, (void (*)(uint64_t, unsigned char *))sub_1B16CF164);
}

- (BlastDoorImage)image
{
  v2 = self;
  v3 = (void *)sub_1B17AACAC();

  return (BlastDoorImage *)v3;
}

- (BlastDoorPassPreview_PassImage)init
{
  result = (BlastDoorPassPreview_PassImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end