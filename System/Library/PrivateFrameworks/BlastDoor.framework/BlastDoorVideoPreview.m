@interface BlastDoorVideoPreview
- (BOOL)isAutoloop;
- (BOOL)videoIsMonoskiAsset;
- (BlastDoorImage)image;
- (BlastDoorVideoPreview)init;
- (BlastDoorVideoPreview_AudioFormat)audioFormat;
- (BlastDoorVideoPreview_VideoFormat)videoFormat;
- (NSString)description;
- (double)timestamp;
- (int64_t)frame;
- (int64_t)trackCount;
@end

@implementation BlastDoorVideoPreview

- (NSString)description
{
  sub_1B1376FE0((uint64_t)self + OBJC_IVAR___BlastDoorVideoPreview_videoPreview, (uint64_t)&v4);
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorImage)image
{
  v2 = self;
  v3 = (void *)sub_1B17A534C();

  return (BlastDoorImage *)v3;
}

- (BOOL)isAutoloop
{
  return self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 432];
}

- (int64_t)frame
{
  return *(void *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 440];
}

- (double)timestamp
{
  return *(double *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 448];
}

- (int64_t)trackCount
{
  return *(void *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 456];
}

- (BlastDoorVideoPreview_VideoFormat)videoFormat
{
  uint64_t v3 = *(void *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 464];
  uint64_t v2 = *(void *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 472];
  uint64_t v5 = *(void *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 480];
  uint64_t v4 = *(void *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 488];
  v6 = (objc_class *)type metadata accessor for _ObjCVideoPreview_VideoFormatWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___BlastDoorVideoPreview_VideoFormat_videoPreview_VideoFormat];
  *(void *)v8 = v3;
  *((void *)v8 + 1) = v2;
  *((void *)v8 + 2) = v5;
  *((void *)v8 + 3) = v4;
  v11.receiver = v7;
  v11.super_class = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9 = [(BlastDoorVideoPreview *)&v11 init];
  return (BlastDoorVideoPreview_VideoFormat *)v9;
}

- (BlastDoorVideoPreview_AudioFormat)audioFormat
{
  uint64_t v3 = *(void *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 496];
  uint64_t v2 = *(void *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 504];
  uint64_t v4 = *(void *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 512];
  uint64_t v5 = *(void *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 520];
  v6 = (objc_class *)type metadata accessor for _ObjCVideoPreview_AudioFormatWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___BlastDoorVideoPreview_AudioFormat_videoPreview_AudioFormat];
  *(void *)v8 = v3;
  *((void *)v8 + 1) = v2;
  *((void *)v8 + 2) = v4;
  *((void *)v8 + 3) = v5;
  v11.receiver = v7;
  v11.super_class = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9 = [(BlastDoorVideoPreview *)&v11 init];
  return (BlastDoorVideoPreview_AudioFormat *)v9;
}

- (BOOL)videoIsMonoskiAsset
{
  return self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 528];
}

- (BlastDoorVideoPreview)init
{
  result = (BlastDoorVideoPreview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end