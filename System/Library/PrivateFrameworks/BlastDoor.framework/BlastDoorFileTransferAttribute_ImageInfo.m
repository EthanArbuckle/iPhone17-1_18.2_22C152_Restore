@interface BlastDoorFileTransferAttribute_ImageInfo
- (BlastDoorFileTransferAttribute_ImageInfo)init;
- (CGSize)size;
- (NSString)description;
@end

@implementation BlastDoorFileTransferAttribute_ImageInfo

- (NSString)description
{
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGSize)size
{
  double v2 = *(double *)((char *)&self->super.isa
                 + OBJC_IVAR___BlastDoorFileTransferAttribute_ImageInfo_fileTransferAttribute_ImageInfo);
  double v3 = *(double *)&self->fileTransferAttribute_ImageInfo[OBJC_IVAR___BlastDoorFileTransferAttribute_ImageInfo_fileTransferAttribute_ImageInfo];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BlastDoorFileTransferAttribute_ImageInfo)init
{
  CGSize result = (BlastDoorFileTransferAttribute_ImageInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end