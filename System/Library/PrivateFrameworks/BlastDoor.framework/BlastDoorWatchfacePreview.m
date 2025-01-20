@interface BlastDoorWatchfacePreview
- (BlastDoorImage)image;
- (BlastDoorWatchfacePreview)init;
- (NSString)description;
@end

@implementation BlastDoorWatchfacePreview

- (NSString)description
{
  return (NSString *)sub_1B17AABF0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorWatchfacePreview_watchfacePreview, (void (*)(uint64_t, unsigned char *))sub_1B16DD738);
}

- (BlastDoorImage)image
{
  v2 = self;
  v3 = (void *)sub_1B17A5B34();

  return (BlastDoorImage *)v3;
}

- (BlastDoorWatchfacePreview)init
{
  result = (BlastDoorWatchfacePreview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end