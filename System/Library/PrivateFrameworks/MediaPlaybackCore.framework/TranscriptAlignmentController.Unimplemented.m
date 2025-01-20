@interface TranscriptAlignmentController.Unimplemented
+ (NSString)identifier;
+ (void)setIdentifier:(id)a3;
- (_TtCC17MediaPlaybackCore29TranscriptAlignmentController13Unimplemented)init;
@end

@implementation TranscriptAlignmentController.Unimplemented

+ (NSString)identifier
{
  sub_21BD2FBA8();
  v2 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

+ (void)setIdentifier:(id)a3
{
  uint64_t v3 = sub_21BEAA178();
  sub_21BD2FC28(v3, v4);
}

- (_TtCC17MediaPlaybackCore29TranscriptAlignmentController13Unimplemented)init
{
  return (_TtCC17MediaPlaybackCore29TranscriptAlignmentController13Unimplemented *)sub_21BD2FC68();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC17MediaPlaybackCore29TranscriptAlignmentController13Unimplemented_currentItem));
}

@end