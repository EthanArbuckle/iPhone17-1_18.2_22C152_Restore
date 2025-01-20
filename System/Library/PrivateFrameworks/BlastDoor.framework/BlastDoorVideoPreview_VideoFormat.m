@interface BlastDoorVideoPreview_VideoFormat
- (BlastDoorVideoPreview_VideoFormat)init;
- (NSString)codec;
- (NSString)description;
- (NSString)formatName;
@end

@implementation BlastDoorVideoPreview_VideoFormat

- (NSString)description
{
  return (NSString *)sub_1B17AD030();
}

- (NSString)formatName
{
  return (NSString *)sub_1B17AD0C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorVideoPreview_VideoFormat_videoPreview_VideoFormat);
}

- (NSString)codec
{
  return (NSString *)sub_1B17AD14C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorVideoPreview_VideoFormat_videoPreview_VideoFormat);
}

- (BlastDoorVideoPreview_VideoFormat)init
{
  result = (BlastDoorVideoPreview_VideoFormat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end