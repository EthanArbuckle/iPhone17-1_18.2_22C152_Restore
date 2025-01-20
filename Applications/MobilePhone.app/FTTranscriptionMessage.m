@interface FTTranscriptionMessage
- (NSAttributedString)attributedText;
- (NSString)text;
- (_TtC11MobilePhone22FTTranscriptionMessage)init;
- (double)confidence;
- (unint64_t)confidenceRating;
@end

@implementation FTTranscriptionMessage

- (NSAttributedString)attributedText
{
  v2 = self;
  Transcript.text.getter();
  id v3 = objc_allocWithZone((Class)NSAttributedString);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v5 = [v3 initWithString:v4];

  return (NSAttributedString *)v5;
}

- (NSString)text
{
  v2 = self;
  Transcript.text.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (unint64_t)confidenceRating
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC11MobilePhone22FTTranscriptionMessage_confidenceRating);
}

- (double)confidence
{
  return 1.0;
}

- (_TtC11MobilePhone22FTTranscriptionMessage)init
{
  result = (_TtC11MobilePhone22FTTranscriptionMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC11MobilePhone22FTTranscriptionMessage_transcriptData;
  uint64_t v3 = type metadata accessor for Transcript();
  NSString v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end