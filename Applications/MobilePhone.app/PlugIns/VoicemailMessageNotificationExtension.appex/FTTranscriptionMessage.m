@interface FTTranscriptionMessage
- (NSAttributedString)attributedText;
- (NSString)text;
- (_TtC37VoicemailMessageNotificationExtension22FTTranscriptionMessage)init;
- (double)confidence;
- (unint64_t)confidenceRating;
@end

@implementation FTTranscriptionMessage

- (NSAttributedString)attributedText
{
  v2 = self;
  sub_100041660();
  id v3 = objc_allocWithZone((Class)NSAttributedString);
  NSString v4 = sub_100041740();
  swift_bridgeObjectRelease();
  id v5 = [v3 initWithString:v4];

  return (NSAttributedString *)v5;
}

- (NSString)text
{
  v2 = self;
  sub_100041660();

  NSString v3 = sub_100041740();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (unint64_t)confidenceRating
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22FTTranscriptionMessage_confidenceRating);
}

- (double)confidence
{
  return 1.0;
}

- (_TtC37VoicemailMessageNotificationExtension22FTTranscriptionMessage)init
{
  result = (_TtC37VoicemailMessageNotificationExtension22FTTranscriptionMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22FTTranscriptionMessage_transcriptData;
  uint64_t v3 = sub_100041670();
  NSString v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end