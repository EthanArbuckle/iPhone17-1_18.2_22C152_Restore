@interface BlastDoorMediaMetadata_LargeImageContextualInfo
- (BlastDoorMediaMetadata_LargeImageContextualInfo)init;
- (NSString)description;
- (int64_t)bufferByteSize;
- (int64_t)pixelHeight;
- (int64_t)pixelWidth;
@end

@implementation BlastDoorMediaMetadata_LargeImageContextualInfo

- (NSString)description
{
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)pixelWidth
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___BlastDoorMediaMetadata_LargeImageContextualInfo_mediaMetadata_LargeImageContextualInfo);
}

- (int64_t)pixelHeight
{
  return *(void *)&self->mediaMetadata_LargeImageContextualInfo[OBJC_IVAR___BlastDoorMediaMetadata_LargeImageContextualInfo_mediaMetadata_LargeImageContextualInfo];
}

- (int64_t)bufferByteSize
{
  return *(void *)&self->mediaMetadata_LargeImageContextualInfo[OBJC_IVAR___BlastDoorMediaMetadata_LargeImageContextualInfo_mediaMetadata_LargeImageContextualInfo
                                                                + 8];
}

- (BlastDoorMediaMetadata_LargeImageContextualInfo)init
{
  result = (BlastDoorMediaMetadata_LargeImageContextualInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end