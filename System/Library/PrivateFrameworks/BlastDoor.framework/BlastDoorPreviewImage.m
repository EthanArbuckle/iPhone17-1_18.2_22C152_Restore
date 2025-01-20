@interface BlastDoorPreviewImage
- (BOOL)has_frameDuration;
- (BOOL)isMonoskiAsset;
- (BOOL)isScreenshot;
- (BlastDoorImage)image;
- (BlastDoorPreviewImage)init;
- (CGSize)alignmentInset;
- (NSString)description;
- (NSString)stickerEffect;
- (NSString)utTypeString;
- (double)frameDuration;
- (int64_t)frameCount;
- (unint64_t)stickerEffectType;
@end

@implementation BlastDoorPreviewImage

- (NSString)description
{
  sub_1B17B3520((uint64_t)self + OBJC_IVAR___BlastDoorPreviewImage_previewImage, (uint64_t)v4);
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorImage)image
{
  v2 = self;
  v3 = (void *)sub_1B1794ABC();

  return (BlastDoorImage *)v3;
}

- (int64_t)frameCount
{
  return *(void *)&self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 432];
}

- (BOOL)has_frameDuration
{
  return (self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 448] & 1) == 0;
}

- (double)frameDuration
{
  double result = *(double *)&self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 440];
  if (self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 448]) {
    return 0.0;
  }
  return result;
}

- (BOOL)isScreenshot
{
  return self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 449];
}

- (NSString)stickerEffect
{
  v2 = self;
  v3 = (void *)sub_1B196A7E0();

  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (unint64_t)stickerEffectType
{
  return self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 450];
}

- (NSString)utTypeString
{
  if (*(void *)&self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 464])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)isMonoskiAsset
{
  return self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 472];
}

- (CGSize)alignmentInset
{
  double v2 = *(double *)&self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 480];
  double v3 = *(double *)&self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 488];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BlastDoorPreviewImage)init
{
  CGSize result = (BlastDoorPreviewImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end