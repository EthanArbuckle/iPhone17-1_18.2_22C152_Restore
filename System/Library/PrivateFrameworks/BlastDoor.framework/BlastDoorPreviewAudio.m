@interface BlastDoorPreviewAudio
- (BlastDoorPreviewAudio)init;
- (NSArray)powerLevels;
- (NSString)description;
- (double)duration;
@end

@implementation BlastDoorPreviewAudio

- (NSString)description
{
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)duration
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorPreviewAudio_previewAudio);
}

- (NSArray)powerLevels
{
  return (NSArray *)sub_1B1794734();
}

- (BlastDoorPreviewAudio)init
{
  result = (BlastDoorPreviewAudio *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end